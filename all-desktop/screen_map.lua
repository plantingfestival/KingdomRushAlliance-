﻿-- chunkname: @./all-desktop/screen_map.lua

local log = require("klua.log"):new("screen_map")
local class = require("middleclass")
local DI = require("difficulty")
local E = require("entity_db")
local F = require("klove.font_db")
local G = love.graphics
local GS = require("game_settings")
local GU = require("gui_utils")
local I = require("klove.image_db")
local PS = require("platform_services")
local S = require("sound_db")
local SH = require("klove.shader_db")
local SU = require("screen_utils")
local U = require("utils")
local UPGR = require("upgrades")
local V = require("klua.vector")
local v = V.v
local km = require("klua.macros")
local i18n = require("i18n")
local storage = require("storage")
local signal = require("hump.signal")
local timer = require("hump.timer").new()
local utf8 = require("utf8")
local achievements_data, map_data

require("klove.kui")

local kui_db = require("klove.kui_db")

require("gg_views_custom")
require("shop_views")

local IS_KR1 = KR_GAME == "kr1"
local IS_KR3 = KR_GAME == "kr3" or KR_GAME == "kr5"

screen_map = {}
screen_map.required_sounds = {
	"common",
	"music_screen_map"
}
screen_map.required_textures = {
	"screen_map",
	"screen_map_animations",
	"view_options",
	"achievements",
	"encyclopedia",
	"encyclopedia_thumbs",
	"gui_shop",
	"gui_shop_bg"
}

if IS_KR1 then
	table.insert(screen_map.required_textures, "screen_map_hero_room")
end

screen_map.ref_w = 1920
screen_map.ref_h = 1080
screen_map.ref_res = TEXTURE_SIZE_ALIAS.fullhd

local function ISW(...)
	return i18n.sw(i18n, ...)
end

local function CJK(default, zh, ja, kr)
	return i18n.cjk(i18n, default, zh, ja, kr)
end

local function wid(name)
	return screen_map.window:get_child_by_id(name)
end

local function get_hero_index(hero_name)
	for i, h in ipairs(screen_map.hero_data) do
		if hero_name == h.name then
			return i
		end
	end

	log.error("Hero named %s not found in hero_data", hero_name)

	return nil
end

local function get_hero_stats(p)
	local out = {}
	local index, hero_name

	if type(p) == "number" then
		index = p
	else
		index = get_hero_index(p)
	end

	local data = screen_map.hero_data[index]

	hero_name = data.name

	local user_data = storage:load_slot()
	local status = user_data.heroes.status[hero_name]

	if not status then
		log.debug("hero status for %s not found in slot. overwritting from template", hero_name)

		local template = require("data.slot_template")

		user_data.heroes.status[hero_name] = template.heroes.status[hero_name]
		status = template.heroes.status[hero_name]
	end

	local h = E:create_entity(hero_name)

	h.hero.xp = status.xp

	local level, level_progress = U.get_hero_level(h.hero.xp, GS.hero_xp_thresholds)

	h.hero.level = level

	if h.hero.level < data.starting_level then
		h.hero.level = data.starting_level
		h.hero.xp = GS.hero_xp_thresholds[h.hero.level]
	end

	out.skill_names = {}
	out.skill_names_i18n = {}

	local used_points = 0

	for k, v in pairs(status.skills) do
		h.hero.skills[k].level = v

		local i = h.hero.skills[k].hr_order

		out.skill_names[i] = k
		out.skill_names_i18n[i] = h.hero.skills[k].key

		for j = 1, v do
			used_points = used_points + h.hero.skills[k].hr_cost[j]
		end
	end

	h.hero.fn_level_up(h, {}, true)

	local info = h.info.fn(h)

	out.index = index
	out.name = hero_name
	out.name_i18n = h.info.i18n_key or hero_name
	out.icon = data.icon
	out.thumb = data.thumb
	out.portrait = data.portrait
	out.level = h.hero.level
	out.xp = h.hero.xp
	out.level_progress = level_progress
	out.taunt = h.sound_events.change_rally_point .. "Select"
	out.hero_class = _(string.upper(out.name_i18n) .. "_CLASS")
	out.health = info.hp_max
	out.damage = info.damage_min .. " - " .. info.damage_max
	out.armor = GU.armor_value_desc(info.armor)
	out.attack_rate = _(string.upper(out.name_i18n) .. "_ATTACKRATE")
	out.damage_icon = h.info.damage_icon or 1
	out.skills = h.hero.skills
	out.remaining_points = GS.skill_points_for_hero_level[h.hero.level] - used_points

	return out, h
end

screen_map.signal_handlers = {
	[SGN_SHOP_GEMS_CHANGED] = function()
		screen_map:update_gems()
	end
}

function screen_map:init(w, h, done_callback)
	self.done_callback = done_callback

	local sw, sh, scale, origin = SU.clamp_window_aspect(w, h, self.ref_w, self.ref_h)

	self.sw, self.sh = sw, sh

	local window = KWindow:new(V.v(sw, sh))

	window.scale = v(scale, scale)
	window.origin = origin
	window.timer = timer
	self.window = window
	GGLabel.static.font_scale = scale
	GGLabel.static.ref_h = self.ref_h
	self.is_premium = PS.services.iap and PS.services.iap:is_premium()

	if DEBUG then
		package.loaded["data.achievements_data"] = nil
		package.loaded["data.map_data"] = nil
		package.loaded.map_decos_functions = nil
	end

	achievements_data = require("data.achievements_data")
	map_data = require("data.map_data")
	screen_map.hero_data = map_data.hero_data
	screen_map.tower_data = map_data.tower_data
	screen_map.level_data = map_data.level_data

	E:load()

	local points_data = require("data.map_points")
	local ppl = {}

	if points_data.points then
		table.sort(points_data.points, function(e1, e2)
			local e1l, e2l = tonumber(e1.level), tonumber(e2.level)
			local e1p, e2p = tonumber(e1.id), tonumber(e2.id)

			if e1l == e2l then
				return e1p < e2p
			else
				return e1l < e2l
			end
		end)

		for _, p in ipairs(points_data.points) do
			local l = tonumber(p.level)

			if not ppl[l] then
				ppl[l] = {}
			end

			table.insert(ppl[l], {
				pos = p.pos,
				water = p.water
			})
		end
	end

	self.map_points = {}
	self.map_points.points = ppl
	self.map_points.flags = points_data.flags
	self.map_points.endless_flags = points_data.endless_flags
	self.user_data = storage:load_slot()
	self.unlock_data = {}
	self.unlock_data.unlocked_levels = {}

	local levels = self.user_data.levels
	local victory = self.user_data.last_victory

	if victory then
		local level = levels[victory.level_idx]

		if not level then
			log.error("victory level %s was not shown in map before. ignoring victory", victory.level_idx)
		else
			if victory.level_mode == GAME_MODE_CAMPAIGN then
				if not level[GAME_MODE_CAMPAIGN] then
					level.stars = victory.stars
					self.unlock_data.show_stars_level = victory.level_idx
					self.unlock_data.star_count_before = 0

					local next_level_idx = U.find_next_level_in_ranges(GS.level_ranges, victory.level_idx)

					if not levels[next_level_idx] then
						levels[next_level_idx] = {}
						self.unlock_data.new_level = next_level_idx

						table.insert(self.unlock_data.unlocked_levels, self.unlock_data.new_level)
					end
				elseif victory.stars > level.stars then
					self.unlock_data.show_stars_level = victory.level_idx
					self.unlock_data.star_count_before = level.stars
					level.stars = victory.stars
				end
			elseif victory.level_mode == GAME_MODE_HEROIC then
				self.unlock_data.heroic_level = not level[GAME_MODE_HEROIC] and victory.level_idx or nil
			elseif victory.level_mode == GAME_MODE_IRON then
				self.unlock_data.iron_level = not level[GAME_MODE_IRON] and victory.level_idx or nil
			end

			level[victory.level_mode] = math.max(victory.level_difficulty, level[victory.level_mode] or 0)
		end

		self.user_data.last_victory = nil

		storage:save_slot(self.user_data)
	elseif #self.user_data.levels == 0 then
		self.unlock_data.unlocked_levels = {
			1
		}
		levels[1] = {}

		storage:save_slot(self.user_data)
	end

	if U.unlock_next_levels_in_ranges(self.unlock_data, levels, GS) then
		storage:save_slot(self.user_data)
	end

	self.total_stars = U.count_stars(self.user_data)

	local map = MapView:new(sw, sh)

	self.window:add_child(map)

	self.map_view = map

	local vign = KImageView:new("map_vignette_small")

	vign.scale = V.v(1.02 * sw / vign.size.x, 1.02 * sh / vign.size.y)
	vign.pos.x, vign.pos.y = -2, -2
	vign.propagate_on_click = true
	vign.propagate_on_down = true
	vign.propagate_on_up = true

	self.window:add_child(vign)

	local map_scroll_hotspots_l = KView:new(V.v(100, sh))

	map_scroll_hotspots_l.propagate_on_click = true
	map_scroll_hotspots_l.anchor = v(0, sh / 2)
	map_scroll_hotspots_l.pos = v(0, sh / 2)

	function map_scroll_hotspots_l.on_enter()
		map.scrolling_dir = 1
	end

	function map_scroll_hotspots_l.on_exit()
		map.scrolling_dir = 0
	end

	self.window:add_child(map_scroll_hotspots_l)
	map_scroll_hotspots_l:order_below(self.map_view)

	local map_scroll_hotspots_r = KView:new(V.v(100, sh - 184))

	map_scroll_hotspots_r.propagate_on_click = true
	map_scroll_hotspots_r.anchor = v(100, sh / 2)
	map_scroll_hotspots_r.pos = v(sw, sh / 2)

	function map_scroll_hotspots_r.on_enter()
		map.scrolling_dir = -1
	end

	function map_scroll_hotspots_r.on_exit()
		map.scrolling_dir = 0
	end

	self.window:add_child(map_scroll_hotspots_r)
	map_scroll_hotspots_r:order_below(self.map_view)

	local o_button = KImageButton:new("map_configBtn_0001", "map_configBtn_0002", "map_configBtn_0003")

	o_button.anchor = v(o_button.size.x / 2, o_button.size.y / 2)
	o_button.pos = v(80, 70)

	function o_button.on_click(this, button, x, y)
		S:queue("GUIButtonCommon")
		self.option_panel:show()
	end

	self.window:add_child(o_button)

	local a_button = GGButton:new("mapButtons-notxt_0004", "mapButtons-notxt_0005")

	a_button.anchor = v(a_button.size.x / 2, a_button.size.y / 2)
	a_button.pos = v(sw - 100, sh - 90)

	function a_button.on_click(this, button, x, y)
		S:queue("GUIButtonCommon")
		self.achievements:show()
	end

	a_button.label.pos = v(50, 121)
	a_button.label.size = v(126, 30)
	a_button.label.text_size = a_button.label.size
	a_button.label.font_size = 18
	a_button.label.vertical_align = CJK("middle", "top", nil, "top")
	a_button.label.text = _("Achievements")
	a_button.label.fit_lines = 1

	self.window:add_child(a_button)

	self.TTT = a_button

	local e_button = GGButton:new("mapButtons-notxt_0007", "mapButtons-notxt_0008")

	e_button.anchor = v(e_button.size.x / 2, e_button.size.y / 2)
	e_button.pos = v(a_button.pos.x - 170, sh - 90)

	function e_button.on_click(this, button, x, y)
		S:queue("GUIButtonCommon")
		self.encyclopedia:show()
	end

	e_button.label.pos = v(50, 121)
	e_button.label.size = v(126, 30)
	e_button.label.text_size = e_button.label.size
	e_button.label.font_size = 18
	e_button.label.vertical_align = CJK("middle", "top", nil, "top")
	e_button.label.text = _("Encyclopedia")
	e_button.label.fit_lines = 1

	self.window:add_child(e_button)

	local u_button = GGButton:new("mapButtons-notxt_0010", "mapButtons-notxt_0011")

	u_button.anchor = v(u_button.size.x / 2, u_button.size.y / 2)
	u_button.pos = v(e_button.pos.x - 170, sh - 90)

	function u_button.on_click(this, button, x, y)
		S:queue("GUIButtonCommon")
		self.upgrades:show()

		if self.upgradeTip then
			self.upgradeTip.hidden = true
		end
	end

	u_button.label.pos = v(50, 121)
	u_button.label.size = v(126, 30)
	u_button.label.text_size = u_button.label.size
	u_button.label.font_size = 18
	u_button.label.vertical_align = CJK("middle", "top", nil, "top")
	u_button.label.text = _("UPGRADES")
	u_button.label.fit_lines = 1

	self.window:add_child(u_button)

	if DBG_SHOW_BALLOONS or self.unlock_data.new_level == 2 then
		self.upgradeTip = KImageView:new("mapBaloon_buyUpgrade_notxt")
		self.upgradeTip.anchor = v(self.upgradeTip.size.x / 2, self.upgradeTip.size.y)
		self.upgradeTip.pos = v(e_button.pos.x - 120, sh - 160)

		self.window:add_child(self.upgradeTip)

		local l = GGLabel:new(V.v(228, 34))

		l.pos = v(15, CJK(19, nil, 24, 26))
		l.font_name = "body"
		l.font_size = 28
		l.text = _("BUY UPGRADES!")
		l.text_align = "center"
		l.vertical_align = "middle"
		l.colors.text = {
			0,
			102,
			158,
			255
		}
		l.line_height = CJK(0.7, nil, 1.1, nil)
		l.fit_lines = 2

		self.upgradeTip:add_child(l)

		local l = GGLabel:new(V.v(228, 72))

		l.pos = v(15, CJK(62, nil, 80, 74))
		l.font_name = "body"
		l.font_size = 18
		l.text = _("Use the earned stars to improve your towers and powers!")
		l.colors.text = {
			46,
			41,
			39,
			255
		}
		l.line_height = CJK(0.9, nil, 1.25, nil)
		l.fit_lines = 3

		self.upgradeTip:add_child(l)
	end

	self.upgrade_star = KImageView:new("mapUpgradePointsAvailable")
	self.upgrade_star.anchor = v(self.upgrade_star.size.x / 2, self.upgrade_star.size.y / 2)
	self.upgrade_star.pos = v(u_button.pos.x + 20, u_button.pos.y - 50)
	self.upgrade_star.scale = v(0.85, 0.85)
	self.upgrade_star.propagate_on_click = true

	self.window:add_child(self.upgrade_star)

	local points_label = KLabel:new(V.v(self.upgrade_star.size.x, 24))

	points_label.pos = v(0, 19)
	points_label.font = F:f("Comic Book Italic", "22")
	points_label.colors.text = {
		78,
		43,
		7
	}
	points_label.text = "1"
	points_label.text_align = "center"
	points_label.propagate_on_click = true

	self.upgrade_star:add_child(points_label)

	self.upgrade_points = points_label

	local h_button = GGButton:new("mapButtons-notxt_0001", "mapButtons-notxt_0002")

	h_button.anchor = v(h_button.size.x / 2, u_button.size.y / 2)
	h_button.pos = v(u_button.pos.x - 170, sh - 90)

	function h_button.on_click(this, button, x, y)
		S:queue("GUIButtonCommon")
		self.hero_room:show()

		if self.heroTip then
			self.heroTip.hidden = true
		end
	end

	h_button.label.pos = v(50, 121)
	h_button.label.size = v(126, 30)
	h_button.label.text_size = h_button.label.size
	h_button.label.font_size = 18
	h_button.label.vertical_align = CJK("middle", "top", nil, "top")
	h_button.label.text = _("HERO ROOM")
	h_button.label.fit_lines = 1

	self.window:add_child(h_button)

	self.hero_but = h_button

	local hero_unlock_levels = table.map(screen_map.hero_data, function(k, v)
		return v.available_level
	end)

	if DBG_SHOW_BALLOONS or table.contains(hero_unlock_levels, self.unlock_data.new_level) then
		self.heroTip = KImageView:new("mapBalloon_heroUnlocked_notxt")
		self.heroTip.anchor = v(self.heroTip.size.x / 2, self.heroTip.size.y)
		self.heroTip.pos = v(h_button.pos.x, sh - 165)

		self.window:add_child(self.heroTip)

		local l = GGLabel:new(V.v(160, 46))

		l.pos = v(10, 10)
		l.font_name = "body"
		l.font_size = 22
		l.line_height = 0.8
		l.text = _("HERO UNLOCKED!")
		l.text_align = "center"
		l.vertical_align = "middle"
		l.colors.text = {
			0,
			102,
			158,
			255
		}
		l.fit_lines = 2

		self.heroTip:add_child(l)
	end

	self.hero_icon_portrait = KImageView:new("mapButtons_portrait_hero_0001")
	self.hero_icon_portrait.propagate_on_click = true
	self.hero_icon_portrait.propagate_on_down = true
	self.hero_icon_portrait.propagate_on_up = true
	self.hero_icon_portrait.hidden = true

	if self.user_data.heroes.selected then
		self.hero_icon_portrait.hidden = false
	end

	h_button:add_child(self.hero_icon_portrait)

	self.skill_star = KImageView:new("mapButtons_portrait_hero_points")
	self.skill_star.anchor = v(self.skill_star.size.x / 2, self.skill_star.size.y / 2)
	self.skill_star.pos = v(h_button.pos.x + 40, h_button.pos.y - 45)
	self.skill_star.propagate_on_click = true
	self.skill_star.hidden = true

	self.window:add_child(self.skill_star)

	local points_label = KLabel:new(V.v(self.skill_star.size.x, 24))

	points_label.pos = v(-1, 11)
	points_label.font = F:f("Comic Book Italic", "22")
	points_label.colors.text = {
		78,
		43,
		7
	}
	points_label.text_align = "center"
	points_label.propagate_on_click = true

	self.skill_star:add_child(points_label)

	self.skill_label = points_label

	if not IS_KR1 then
		local hs = get_hero_stats(screen_map.user_data.heroes.selected)

		if hs.remaining_points > 0 then
			self.skill_star.hidden = false
			points_label.text = tostring(hs.remaining_points)
		end

		if DBG_SHOW_BALLOONS or not screen_map.user_data.seen.map_skill_tip and not self.heroTip and screen_map.user_data.heroes.selected == GS.default_hero and screen_map.user_data.heroes.status[GS.default_hero].xp >= GS.hero_xp_thresholds[1] then
			self.heroTip = KImageView:new("mapBaloon_heroLvlUp_notxt")
			self.heroTip.anchor = v(self.heroTip.size.x / 2, self.heroTip.size.y)
			self.heroTip.pos = v(h_button.pos.x - 120, sh - 160)

			self.window:add_child(self.heroTip)

			screen_map.user_data.seen.map_skill_tip = true

			local l = GGLabel:new(V.v(228, 34))

			l.pos = v(15, 19)
			l.font_name = "body"
			l.font_size = 26
			l.text = _("HERO LEVEL UP!")
			l.text_align = "center"
			l.vertical_align = "middle"
			l.colors.text = {
				0,
				102,
				158,
				255
			}
			l.line_height = 0.7
			l.fit_lines = 2

			self.heroTip:add_child(l)

			local l = GGLabel:new(V.v(228, 52))

			l.pos = v(15, 62)
			l.font_name = "body"
			l.font_size = 18
			l.text = _("Use the earned hero points to train your hero!")
			l.colors.text = {
				46,
				41,
				39,
				255
			}
			l.line_height = CJK(0.9, nil, 1.25, nil)
			l.fit_lines = 3

			self.heroTip:add_child(l)
		end
	end

	if self.is_premium then
		local s_button = GGButton:new("mapButtons-notxt_0013", "mapButtons-notxt_0014")

		s_button.anchor = v(s_button.size.x / 2, s_button.size.y / 2)
		s_button.pos = v(h_button.pos.x - 170, sh - 90)

		function s_button.on_click(this, button, x, y)
			S:queue("GUIButtonCommon")
			self.shop_view:show()
		end

		s_button.label.pos = v(50, 121)
		s_button.label.size = v(126, 30)
		s_button.label.text_size = s_button.label.size
		s_button.label.font_size = 18
		s_button.label.vertical_align = CJK("middle", "top", nil, "top")
		s_button.label.text = _("MAP_BUTTON_SHOP")
		s_button.label.fit_lines = 1

		self.window:add_child(s_button)

		local g = KImageView:new("mapGem")

		g.id = "gems_to_spend_view"
		g.pos = v(160, 50)
		g.anchor = v(26, 23)
		g.hidden = false

		s_button:add_child(g)

		self.gems_to_spend_view = g
	end

	if IS_KR3 then
		local stars_banner = StarsBanner:new()

		stars_banner.pos = v(sw - 190, 30)

		self.window:add_child(stars_banner)
	else
		local map_counters = GG9View:new_from_table(kui_db:get_table("map_counters_view", {
			ref_h = self.ref_h,
			sw = self.sw,
			premium = self.is_premium
		}))

		self.window:add_child(map_counters)

		wid("map_counters_stars").text = string.format("%s/%s", screen_map.total_stars, GS.max_stars)
	end

	local upgrades = UpgradesView:new(sw, sh)

	upgrades.pos = v(0, 0)

	self.window:add_child(upgrades)

	self.upgrades = upgrades

	self.upgrades:set_init_values(screen_map.total_stars, screen_map.user_data.upgrades)

	local encyclopedia = EncyclopediaView:new(sw, sh)

	encyclopedia.pos = v(0, 0)
	self.encyclopedia = encyclopedia

	self.window:add_child(encyclopedia)

	local hero_room

	if IS_KR1 then
		local ctx = {}

		ctx.ref_h = self.ref_h

		function ctx.cjk(default, zh, ja, kr)
			return i18n.cjk(i18n, default, zh, ja, kr)
		end

		local tt = kui_db:get_table("hero_room_view", ctx)

		hero_room = HeroRoomViewKR1:new_from_table(tt)
		hero_room.pos = v((sw - hero_room.size.x) / 2, 0)
	else
		hero_room = HeroRoomView:new(sw, sh)
		hero_room.pos = v(0, 0)
	end

	self.hero_room = hero_room

	self.window:add_child(hero_room)

	self.difficulty_view = DifficultyView:new(sw, sh)
	self.difficulty_view.pos = v(0, 0)

	self.window:add_child(self.difficulty_view)

	self.option_panel = OptionsView:new(sw, sh)
	self.option_panel.pos = v(0, 0)

	self.window:add_child(self.option_panel)

	self.achievements = AchievementsView:new(sw, sh)
	self.achievements.pos = v(0, 0)

	self.window:add_child(self.achievements)

	if self.is_premium then
		local sv = KView:new(V.v(sw, sh))

		sv.id = "modal_bg_shaded_view"
		sv.colors.background = {
			0,
			0,
			0,
			160
		}
		sv.hidden = true
		sv.propagate_on_enter = false

		self.window:add_child(sv)

		local shop_view = ShopView:new_from_table(kui_db:get_table("shop_view", {}))

		self.window:add_child(shop_view)

		shop_view.pos.x = sw / 2
		self.shop_view = shop_view
	end

	S:queue("MusicMap")

	self.stime = 0

	for sn, fn in pairs(self.signal_handlers) do
		signal.register(sn, fn)
	end

	if self.is_premium then
		self:update_gems()
	end

	local ask_for_rating_level = PS and PS.services and PS.services.rating and 5 or nil

	if screen_map.user_data.difficulty == nil or DEBUG_SHOW_DIFFICULTY then
		self.difficulty_view:show()
	elseif ask_for_rating_level ~= nil and screen_map.user_data.levels and screen_map.user_data.levels[ask_for_rating_level] and not screen_map.user_data.levels[ask_for_rating_level + 1] then
		log.debug("trying to show rating dialog...")
		PS.services.rating:request_review()
	end
end

function screen_map:destroy()
	for sn, fn in pairs(self.signal_handlers) do
		signal.remove(sn, fn)
	end

	timer:clear()

	self.window.timer = nil

	self.window:destroy()

	self.window = nil

	SU.remove_references(self, KView)
end

function screen_map:update(dt)
	self.window:update(dt)
	timer:update(dt)

	self.stime = self.stime + dt * 10

	if not self.upgrade_star.hidden then
		self.upgrade_star.scale = v(math.sin(self.stime) * 0.05 + 0.8, math.sin(self.stime) * 0.05 + 0.8)
	end

	if self.upgradeTip then
		self.upgradeTip.scale = v(math.sin(self.stime * 0.5) * 0.02 + 0.98, math.sin(self.stime * 0.5) * 0.02 + 0.98)
	end

	if self.heroTip then
		self.heroTip.scale = v(math.sin(self.stime * 0.5) * 0.02 + 0.98, math.sin(self.stime * 0.5) * 0.02 + 0.98)
	end

	if not self.skill_star.hidden then
		self.skill_star.scale = v(math.sin(self.stime) * 0.05 + 0.95, math.sin(self.stime) * 0.05 + 0.95)
	end

	if self.gems_to_spend_view and not self.gems_to_spend_view.hidden then
		self.gems_to_spend_view.scale = v(math.sin(self.stime) * 0.05 + 0.95, math.sin(self.stime) * 0.05 + 0.95)
	end

	if self.endlessTip then
		self.endlessTip.scale = v(math.sin(self.stime * 0.5) * 0.02 + 0.98, math.sin(self.stime * 0.5) * 0.02 + 0.98)
	end
end

function screen_map:update_gems()
	if not self.is_premium then
		return
	end

	local user_data = storage:load_slot()
	local amount = user_data.gems

	wid("map_counters_gems").text = amount

	if wid("shop_gems") then
		wid("shop_gems").text = amount
	end

	local iap_data = require("data.iap_data")

	self.gems_to_spend_view.hidden = user_data.gems < iap_data.cheapest_item_cost
end

function screen_map:draw()
	self.window:draw()
end

function screen_map:keypressed(key, isrepeat)
	if key == "escape" then
		if self.level_select and not self.level_select.hidden then
			self.level_select:hide()
		elseif not self.hero_room.hidden then
			self.hero_room:hide()
		elseif not self.upgrades.hidden then
			self.upgrades:hide()
		elseif not self.encyclopedia.hidden then
			self.encyclopedia:hide()
		elseif not self.achievements.hidden then
			self.achievements:hide()
		elseif not self.difficulty_view.hidden then
			-- block empty
		elseif not self.option_panel.hidden then
			self.option_panel:hide()
		elseif self.shop_view and not self.shop_view.hidden then
			self.shop_view:hide()
		else
			self.option_panel:show()
		end
	end

	if DEBUG_MAP_ANI_EDITOR and self.SEL_ANI then
		local inc = 1

		if love.keyboard.isDown("lshift") then
			inc = 20
		end

		local ctrl = love.keyboard.isDown("lctrl")
		local av = self.SEL_ANI

		if ctrl then
			if key == "up" then
				if not av.scale then
					av.scale = {
						x = 1,
						y = 1
					}
				end

				av.scale.x = av.scale.x + 0.1
				av.scale.y = av.scale.y + 0.1
			elseif key == "down" then
				if not av.scale then
					av.scale = {
						x = 1,
						y = 1
					}
				end

				av.scale.x = av.scale.x - 0.1
				av.scale.y = av.scale.y - 0.1
			end
		elseif key == "up" then
			av.pos.y = av.pos.y - inc
		elseif key == "down" then
			av.pos.y = av.pos.y + inc
		elseif key == "right" then
			av.pos.x = av.pos.x + inc
		elseif key == "left" then
			av.pos.x = av.pos.x - inc
		end

		if key == "h" then
			av.hidden = not av.hidden
		end

		if key == "c" then
			if not av.colors.background then
				av.colors.background = {
					200,
					200,
					200,
					100
				}
			else
				av.colors.background = nil
			end
		end

		if key == "space" or key == "return" then
			if not self.SEL_LIST then
				self.SEL_LIST = {}
			end

			self.SEL_LIST[av.id] = {
				pos = av.pos,
				scale = av.scale
			}

			local out = "---------------------------\n"

			for iid, iv in pairs(self.SEL_LIST) do
				out = out .. string.format("%s = { pos=v(%s,%s), scale=v(%s,%s)\n", iid, iv.pos.x, iv.pos.y, iv.scale.x, iv.scale.y)
			end

			out = out .. "---------------------------\n"

			log.debug("\n%s\n", out)
		end
	end

	if DEBUG_MAP_KEYS then
		if not self._test_unlocked_level then
			self._test_unlocked_level = #self.user_data.levels
		end

		local function reset_unlock_data()
			self.unlock_data = {}
			self.unlock_data.unlocked_levels = {}
		end

		if isrepeat then
			return
		end

		if self.map_view.show_flags_in_progress then
			log.debug("show_flags in progress... it will look ugly!")
		end

		if key == "r" then
			self.map_view:clear_flags()

			self.user_data.levels = {
				{}
			}

			reset_unlock_data()

			self._test_unlocked_level = 1

			self.map_view:show_flags()
		elseif key == "n" then
			local cur = self._test_unlocked_level
			local nex = U.find_next_level_in_ranges(GS.level_ranges, cur)

			self.map_view:clear_flags()
			reset_unlock_data()

			self.user_data.levels[cur] = {
				2,
				stars = 1
			}
			self.unlock_data.show_stars_level = cur
			self.unlock_data.star_count_before = 0

			U.unlock_next_levels_in_ranges(self.unlock_data, self.user_data.levels, GS)
			log.debug("test unlock level: %s", tul)

			self._test_unlocked_level = nex

			self.map_view:show_flags()
		end

		if self._test_unlocked_level > 1 then
			if key == "s" then
				self.map_view:clear_flags()
				reset_unlock_data()

				local lvl = self._test_unlocked_level - 1

				self.unlock_data.show_stars_level = lvl
				self.unlock_data.star_count_before = screen_map.user_data.levels[lvl].stars
				self.user_data.levels[lvl].stars = km.clamp(1, 3, screen_map.user_data.levels[lvl].stars + 1)

				self.map_view:show_flags()
			elseif key == "h" then
				self.map_view:clear_flags()
				reset_unlock_data()

				local lvl = self._test_unlocked_level - 1

				self.user_data.levels[lvl][2] = 2
				self.unlock_data.heroic_level = lvl

				self.map_view:show_flags()
			elseif key == "i" then
				self.map_view:clear_flags()
				reset_unlock_data()

				local lvl = self._test_unlocked_level - 1

				self.unlock_data.iron_level = lvl
				self.user_data.levels[lvl][3] = 2

				self.map_view:show_flags()
			end
		end
	end
end

function screen_map:keyreleased(key)
	return
end

function screen_map:mousepressed(x, y, button)
	self.window:mousepressed(x, y, button)
end

function screen_map:mousereleased(x, y, button)
	self.window:mousereleased(x, y, button)
end

function screen_map:start_level(level_idx, level_mode)
	local user_data = storage:load_slot()

	storage:save_slot(user_data, nil, true)
	self.done_callback({
		next_item_name = "game",
		level_idx = level_idx,
		level_mode = level_mode,
		level_difficulty = self.user_data.difficulty
	})
end

MapView = class("MapView", KImageView)

function MapView:initialize(screen_w, screen_h)
	KImageView.initialize(self, IS_KR3 and "map_background_0001" or "map_background")

	self.screen_w = screen_w
	self.screen_h = screen_h
	self.stime = 0
	self.max_scroll_speed = 280
	self.scrolling_dir = 0
	self.ma_under_layer = KView:new(V.v(screen_w, screen_h))
	self.ma_under_layer.propagate_on_click = true
	self.ma_under_layer.propagate_on_down = true
	self.ma_under_layer.propagate_on_up = true

	self:add_child(self.ma_under_layer)

	if IS_KR3 then
		self.mask_under_layer = KImageView:new("map_background_0003")

		self:add_child(self.mask_under_layer)
	end

	self.points_layer = KView:new(V.v(screen_w, screen_h))
	self.points_layer.propagate_on_click = true
	self.points_layer.propagate_on_down = true
	self.points_layer.propagate_on_up = true

	self:add_child(self.points_layer)

	self.ma_mid_layer = KView:new(V.v(screen_w, screen_h))
	self.ma_mid_layer.propagate_on_click = true
	self.ma_mid_layer.propagate_on_down = true
	self.ma_mid_layer.propagate_on_up = true

	self:add_child(self.ma_mid_layer)

	self.flags_layer = KView:new(V.v(screen_w, screen_h))
	self.flags_layer.propagate_on_click = true
	self.flags_layer.propagate_on_down = true
	self.flags_layer.propagate_on_up = true

	self:add_child(self.flags_layer)

	self.ma_over_layer = KView:new(V.v(screen_w, screen_h))
	self.ma_over_layer.propagate_on_click = true
	self.ma_over_layer.propagate_on_down = true
	self.ma_over_layer.propagate_on_up = true

	self:add_child(self.ma_over_layer)

	local last_flag_idx = screen_map.unlock_data.new_level or #screen_map.user_data.levels
	local last_flag = screen_map.map_points.flags[last_flag_idx]

	if last_flag and last_flag.pos then
		log.debug("scroll to show level idx:%s", last_flag_idx)

		local vl, vr = -1 * self.pos.x, -1 * self.pos.x + self.screen_w

		if vl > last_flag.pos.x or vr < last_flag.pos.x then
			self.pos.x = -(last_flag.pos.x - self.screen_w / 2)
			self.pos.x = km.clamp(self.screen_w - self.size.x, 0, self.pos.x)
		end
	end

	self:load_map_animations()
	self:show_flags()
end

function MapView:load_map_animations()
	local anis = map_data.map_animations

	for _, o in pairs(anis) do
		anis[o.id] = o
	end

	for i = 1, #anis do
		local val = anis[i]
		local ani

		if val.template then
			ani = table.deepmerge(anis[val.template], val, true)
		else
			ani = table.deepclone(val)
		end

		if ani.pos_list then
			ani.pos = ani.pos_list[1]
		end

		if ani.scale_list then
			ani.scale = ani.scale_list[1]
		end

		ani.animation = ani.animation or ani.idle_animation

		local av

		if ani.fns then
			local v
			local animation = ani.animations and ani.animations.default or ani.animation

			if animation and animation.prefix and animation.from then
				local f1 = string.format("%s_%04d", animation.prefix, animation.from)

				v = KImageView:new(f1)
			end

			v = v or KView:new()
			v.pos = V.vclone(ani.pos)
			v.anchor = ani.anchor and V.vclone(ani.anchor) or V.v(v.size.x / 2, v.size.y / 2)
			v.loop = ani.loop

			if ani.fns then
				for fk, fn in pairs(ani.fns) do
					v[fk] = fn
				end
			end

			v.ctx = {
				screen_map = screen_map,
				timer = timer,
				data = ani
			}
			av = v
		elseif ani.pos or ani.path or ani.move then
			local f1 = string.format("%s_%04d", ani.animation.prefix, ani.animation.from)

			av = KImageView:new(f1)
			av.anchor = v(av.size.x / 2, av.size.y / 2)

			if ani.scale then
				av.scale = ani.scale
			end

			if ani.pos then
				av.pos = ani.pos
			elseif ani.path then
				av.path = ani.path
				av.pos = ani.path[1]
			end
		else
			av = KView:new(V.v(self.screen_w, self.screen_h))
		end

		av.id = ani.id
		av.alpha = ani.alpha or 1
		av.animation = ani.animation

		if ani.fns then
			if av.prepare then
				av:prepare()
			end
		elseif ani.path then
			av.loop = ani.loop
			av.path_idx = 1
			av.hidden = true

			if ani.wait then
				av.every_min = ani.wait[1]
				av.every_max = ani.wait[2]
			end

			timer:after(av.every_min and math.random(av.every_min, av.every_max) or 0.03333333333333333, function(func)
				if av.path_idx == 1 then
					av.hidden = false
					av.ts = 0
				end

				if av.path_idx > #av.path then
					av.hidden = true
					av.path_idx = 1
					av.ts = 0

					timer:after(av.every_min and math.random(av.every_min, av.every_max) or 0.03333333333333333, func)
				else
					av.pos = av.path[av.path_idx]
					av.path_idx = av.path_idx + 1

					timer:after(0.03333333333333333, func)
				end
			end)
		elseif ani.move then
			av.move = ani.move
			av.loop = ani.loop
			av.pingpong = ani.pingpong
			av.random_start = ani.random_start

			if ani.wait then
				av.every_min = ani.wait[1]
				av.every_max = ani.wait[2]
			end

			if not av.move.permanent then
				av.hidden = true
			end

			local function move_func()
				timer:after(av.every_min and math.random(av.every_min, av.every_max) or 0.03333333333333333, function(func)
					av.ts = 0

					if not av.move.permanent then
						av.hidden = false
					end

					local m = av.move
					local move_time = m.time

					av.pos.x, av.pos.y = m.from.x, m.from.y

					local params = {
						pos = {
							x = m.to.x,
							y = m.to.y
						}
					}

					log.paranoid(" MOVING (%s): %s,%s to %s,%s in %s", av.id, av.pos.x, av.pos.y, m.to.x, m.to.y, move_time)
					timer:tween(move_time, av, params, m.interp, function(func2)
						if not av.move.permanent then
							av.hidden = true
						end

						if av.move.pingpong then
							local v = av.move.to

							av.move.to = av.move.from
							av.move.from = v
						end

						timer:after(av.every_min and math.random(av.every_min, av.every_max) or 0.03333333333333333, func)
					end)
				end)
			end

			if av.random_start then
				av.ts = 0

				local m = av.move

				av.pos.x, av.pos.y = math.random(m.from.x, m.to.x), math.random(m.from.y, m.to.y)

				local move_time = m.time * math.abs(m.to.x - av.pos.x) / math.abs(m.to.x - m.from.x)

				if not av.move.permanent then
					av.hidden = false
				end

				log.paranoid(" RANDOM_START (%s): %s,%s to %s,%s in %s", av.id, av.pos.x, av.pos.y, m.to.x, m.to.y, move_time)
				timer:tween(move_time, av, {
					pos = {
						x = m.to.x,
						y = m.to.y
					}
				}, m.interp, move_func)
			else
				move_func()
			end
		elseif ani.toggle then
			av.every_min = ani.every_min or ani.wait[1]
			av.every_max = ani.every_max or ani.wait[2]
			av.hidden = math.random() > 0.5

			timer:after(math.random(av.every_min, av.every_max), function(func)
				av.hidden = not av.hidden

				timer:after(math.random(av.every_min, av.every_max), func)
			end)
		elseif ani.loop then
			av.loop = ani.loop
			av.ts = math.random(av.animation.from, av.animation.to) / 30
		else
			av.ts = ani.animation.to / 30
			av.every_min = ani.every_min or ani.wait[1]
			av.every_max = ani.every_max or ani.wait[2]

			if ani.idle_animation then
				av.loop = true
			end

			local w = math.random(av.every_min, av.every_max)

			if ani.idle_animation then
				local a = ani.idle_animation
				local a_len = (a.to - a.from + 1) / 30

				w = math.ceil(w / a_len) * a_len
			end

			timer:after(w, function(func)
				if ani.pos_list then
					local idx = math.random(1, #ani.pos_list)

					av.pos = ani.pos_list[idx]

					if ani.scale_list then
						av.scale = ani.scale_list[idx]
					end
				end

				if ani.action_animation then
					av.animation = ani.action_animation
				end

				av.ts = 0
				av.loop = false

				local dur = (av.animation.to - av.animation.from + 1) / 30
				local w2 = math.random(av.every_min, av.every_max)

				if ani.idle_animation then
					timer:after(dur, function()
						av.animation = ani.idle_animation
						av.ts = 0
						av.loop = true
					end)

					local a = ani.idle_animation
					local a_len = (a.to - a.from + 1) / 30

					w2 = math.ceil(w2 / a_len) * a_len
				end

				timer:after(dur + w2, func)
			end)
		end

		if ani.layer == 1 then
			self.ma_under_layer:add_child(av)
		elseif ani.layer == 2 then
			self.ma_mid_layer:add_child(av)
		elseif ani.layer == 3 then
			self.ma_over_layer:add_child(av)
		else
			log.error("animation layer %s does not exist", ani.layer)
		end

		if DEBUG_MAP_ANI_EDITOR then
			function av.on_click(this)
				screen_map.SEL_ANI = this

				log.debug("sel ani: %s", this.id)
			end
		else
			av.propagate_on_click = true
			av.propagate_on_down = true
			av.propagate_on_up = true
		end
	end
end

function MapView:clear_flags()
	for _, f in pairs(self.flags) do
		self.flags_layer:remove_child(f)
	end

	for _, w in pairs(self.wings) do
		self.flags_layer:remove_child(w)
	end

	for _, pg in pairs(self.point_groups) do
		for _, p in pairs(pg) do
			self.points_layer:remove_child(p)
		end
	end

	for _, ld in pairs(self.level_decos) do
		ld.view.parent:remove_child(ld.view)
	end

	self.flags = {}
	self.wings = {}
	self.point_groups = {}
	self.level_decos = {}
end

function MapView:load_level_decos()
	local layers = {
		self.ma_under_layer,
		self.ma_mid_layer,
		self.ma_over_layer
	}
	local out = {}

	for _, d in pairs(map_data.map_decos) do
		local v = KImageView:new(d.image)

		v.id = d.id
		v.pos = V.vclone(d.pos)
		v.anchor = d.anchor and V.vclone(d.anchor) or V.v(v.size.x / 2, v.size.y / 2)
		v.animations = d.animations
		v.loop = d.loop
		v.hidden = d.hidden
		v.hit_rect = d.hit_rect

		if d.fns then
			for fk, fn in pairs(d.fns) do
				v[fk] = fn
			end
		end

		layers[d.layer]:add_child(v)

		v.ctx = {
			screen_map = screen_map,
			timer = timer
		}

		if v.prepare then
			v.prepare(v)
		end

		if d.trigger_level then
			out[d.trigger_level] = {
				view = v
			}
		end

		if DEBUG_MAP_ANI_EDITOR then
			function v.on_click(this)
				screen_map.SEL_ANI = this

				log.debug("sel deco: %s", this.id)
			end
		end
	end

	return out
end

function MapView:show_flags()
	self.flags = {}
	self.wings = {}
	self.point_groups = {}
	self.level_decos = self:load_level_decos()

	local max_level = GS.last_level
	local levels = screen_map.user_data.levels

	timer:script(function(wait)
		self.show_flags_in_progress = true

		local ud = screen_map.unlock_data

		for i = 1, max_level do
			local level = levels[i]

			if not level then
				-- block empty
			else
				local points_data = screen_map.map_points.points[i]
				local flag_pos = V.vclone(screen_map.map_points.flags[i].pos)

				if self.level_decos[i] and not table.contains(ud.unlocked_levels, i) then
					local v = self.level_decos[i].view

					v:unlock()
				end

				self.point_groups[i] = {}

				if i > 1 and points_data then
					for _, point_data in ipairs(points_data) do
						local texture_name = point_data.water and "flag_bullet_water_0010" or "flag_bullet_0010"
						local pointt = KImageView:new(texture_name)

						pointt.is_in_water = point_data.water
						pointt.pos = point_data.pos

						self.points_layer:add_child(pointt)
						table.insert(self.point_groups[i], pointt)

						pointt.anchor = v(pointt.size.x / 2, pointt.size.y - 4)
						pointt.propagate_on_click = true

						if table.contains(ud.unlocked_levels, i) then
							pointt.hidden = true
						end
					end
				end

				local flag = LevelFlagView:new(i)

				flag:set_data(level)
				self.flags_layer:add_child(flag)

				self.flags[i] = flag
				flag.pos = flag_pos

				flag:set_mode("nostar")

				if table.contains(ud.unlocked_levels, i) then
					flag.hidden = true
				end

				if level[GAME_MODE_CAMPAIGN] and level.stars then
					if ud.show_stars_level ~= i or ud.star_count_before > 0 then
						flag:set_mode("campaign")
					end

					for j = 1, level.stars do
						local star = KImageView:new("mapFlag_star_0017")

						star.propagate_on_click = true

						flag:add_child(star)
						table.insert(flag.star_views, star)

						star.pos = flag.star_pos[j]

						if ud.show_stars_level == i and j > ud.star_count_before then
							star.hidden = true
						end
					end
				end

				if level[GAME_MODE_IRON] and ud.iron_level ~= i then
					flag:set_mode("iron")
				end

				if level[GAME_MODE_HEROIC] then
					local wing = KImageView:new("map_flag_heroic_0015")

					self.flags_layer:add_child(wing)

					self.wings[i] = wing

					wing:order_below(flag)

					wing.pos = v(flag_pos.x - 3, flag_pos.y)
					wing.anchor = v(wing.size.x / 2, wing.size.y / 2)
					wing.hidden = ud.heroic_level == i
				end

				if screen_map.is_premium then
					for lid, f in pairs(screen_map.map_points.endless_flags) do
						if f.unlocks_at_level == i then
							local flag = EndlessLevelFlagView:new(lid)

							flag.pos = V.vclone(f.pos)
							self.flags[lid] = flag

							self.flags_layer:add_child(flag)

							if f.show_balloon and (DBG_SHOW_BALLOONS or not screen_map.user_data.seen[f.show_balloon]) then
								local t = KImageView:new_from_table(kui_db:get_table("screen_map_balloon_endless", {
									CJK = CJK
								}))

								t.pos = V.v(flag.pos.x, flag.pos.y - 40)

								self:add_child(t)

								screen_map.endlessTip = t
							end
						end
					end
				end
			end
		end

		wait(1)

		while not screen_map.difficulty_view.hidden do
			wait(0.5)
		end

		for i = 1, max_level do
			local level = levels[i]

			if not level then
				-- block empty
			else
				local points_data = screen_map.map_points.points[i]
				local flag_pos = screen_map.map_points.flags[i].pos
				local flag = self.flags[i]
				local wing = self.wings[i]

				if flag and ud.show_stars_level == i then
					flag:disable(false)

					local first_star = ud.star_count_before + 1

					for j = first_star, level.stars do
						flag.star_views[j].hidden = true
					end

					wait(0.5)

					if not level[GAME_MODE_IRON] then
						flag:set_mode("gotstar", true)
						wait(1)
						flag:set_mode("campaign")
					end

					for j = first_star, level.stars do
						local star = flag.star_views[j]

						star.hidden = false
						star.animation = {
							to = 17,
							prefix = "mapFlag_star",
							from = 1
						}
						star.ts = 0

						S:queue("GUIWinStars")
						wait(0.5)
					end

					flag:enable()
				end

				if flag and ud.iron_level == i then
					flag:disable(false)
					wait(0.5)
					S:queue("GUIWinStars")
					flag:set_mode("turnIron", true)
					wait(4)
					flag:set_mode("iron")
					flag:enable()
				end

				if wing and ud.heroic_level == i then
					flag:disable(false)

					wing.hidden = true

					wait(0.5)
					S:queue("GUIWinStars")

					wing.animation = {
						to = 15,
						prefix = "map_flag_heroic",
						from = 1
					}
					wing.ts = 0
					wing.hidden = false

					wait(2)
					flag:enable()
				end

				if self.level_decos[i] and table.contains(ud.unlocked_levels, i) then
					local v = self.level_decos[i].view

					v:unlock(wait)
				end

				if i > 1 and ud.new_level == i then
					S:queue("GuimapNewRoad")

					for _, pointt in ipairs(self.point_groups[i]) do
						pointt.hidden = false
						pointt.animation = {
							to = 10,
							from = 1,
							prefix = pointt.is_in_water and "flag_bullet_water" or "flag_bullet"
						}
						pointt.ts = 0

						wait(0.4)
					end
				end

				if table.contains(ud.unlocked_levels, i) then
					flag.hidden = false

					flag:disable(false)
					flag:set_mode("newFlag", true)
					S:queue("GUIMapNewFlah")
					wait(1)
					flag:set_mode("nostar")
					flag:enable()
				end
			end
		end

		self.show_flags_in_progress = nil

		if DBG_SHOW_BALLOONS or #screen_map.user_data.levels == 1 then
			local start_here = KImageView:new("mapBalloon_starthere_notxt")

			start_here.anchor = v(start_here.size.x / 2, start_here.size.y)

			if KR_GAME == "kr1" then
				start_here.pos = v(292, 775)
			elseif KR_GAME == "kr2" then
				start_here.pos = v(307, 280)
			else
				start_here.pos = v(194, 170)
			end

			screen_map.map_view:add_child(start_here)

			screen_map.map_view.start_here = start_here

			local l = GGLabel:new(V.v(164, 32))

			l.pos = v(8, 8)
			l.font_name = "body"
			l.font_size = 18
			l.text = _("START HERE!")
			l.text_align = "center"
			l.vertical_align = "middle"
			l.colors.text = {
				46,
				41,
				39,
				255
			}
			l.fit_lines = 1

			start_here:add_child(l)

			start_here.alpha = 0

			timer:tween(0.5, start_here, {
				alpha = 1
			}, "in-quad")
		end
	end)
end

function MapView:update(dt)
	MapView.super.update(self, dt)

	self.stime = self.stime + dt * 10

	if self.start_here then
		self.start_here.scale = v(math.sin(self.stime * 0.5) * 0.02 + 0.98, math.sin(self.stime * 0.5) * 0.02 + 0.98)
	end

	if self.scrolling_dir == 0 then
		return
	end

	self.pos = v(self.pos.x + self.scrolling_dir * self.max_scroll_speed * dt, self.pos.y)

	if self.pos.x >= 0 then
		self.scrolling_dir = 0
		self.pos = v(0, self.pos.y)
	end

	if self.pos.x <= self.screen_w - self.size.x then
		self.scrolling_dir = 0
		self.pos = v(self.screen_w - self.size.x, self.pos.y)
	end
end

LevelFlagView = class("LevelFlagView", KImageView)

function LevelFlagView:initialize(level_num)
	KImageView.initialize(self, "map_flag_0181")

	self.star_pos = {
		v(12, 12),
		v(28, 12),
		v(43, 12)
	}
	self.star_views = {}
	self.anchor = v(self.size.x / 2, self.size.y / 2)
	self.mode = "default"
	self.animations = {}
	self.level_num = level_num
	self.button = KButton:new(V.v(self.size.x, self.size.y))

	self:add_child(self.button)

	self.button.hit_rect = V.r(20, 34, 44, 74)

	function self.button.on_click()
		S:queue("GUIButtonCommon")

		screen_map.level_select = LevelSelectView:new(screen_map.sw, screen_map.sh, self.level_num, self.stars, self.heroic, self.iron, self.slot_data)

		screen_map.window:add_child(screen_map.level_select)
		screen_map.level_select:show()
		self:disable(false)
		timer:after(0.5, function()
			self:enable()
		end)
	end

	function self.button.on_enter()
		S:queue("GUIQuickMenuOver")

		self.animation = nil

		if self.mode == "campaign" then
			self:set_image("map_flag_0181")
		elseif self.mode == "iron" then
			self:set_image("map_flag_0182")
		else
			self:set_image("map_flag_0180")
		end

		self.randomWait = -1
	end

	function self.button.on_exit()
		self:set_mode(self.mode, true)
	end

	self.animations = {
		gotstar = {
			to = 89,
			prefix = "map_flag",
			from = 65
		},
		campaign = {
			to = 134,
			prefix = "map_flag",
			from = 90
		},
		newFlag = {
			to = 24,
			prefix = "map_flag",
			from = 1
		},
		nostar = {
			to = 64,
			prefix = "map_flag",
			from = 24
		},
		iron = {
			to = 179,
			prefix = "map_flag",
			from = 160
		},
		turnIron = {
			to = 150,
			prefix = "map_flag",
			from = 135
		}
	}

	self:set_mode("campaign", false)
end

function LevelFlagView:set_data(data)
	self.stars = data.stars or 0
	self.iron = data[GAME_MODE_IRON] and 1 or 0
	self.heroic = data[GAME_MODE_HEROIC] and 1 or 0
	self.slot_data = data
end

function LevelFlagView:set_mode(mode, restart)
	self.mode = mode

	if self.animations[mode] then
		self.animation = self.animations[mode]

		if restart then
			self.ts = 0
		else
			self.ts = 1000000000
		end

		self.randomWait = love.math.random(3, 10)
	end
end

function LevelFlagView:update(dt)
	LevelFlagView.super.update(self, dt)

	if self.randomWait < 0 then
		return
	end

	self.randomWait = self.randomWait - dt

	if self.randomWait < 0 then
		self.randomWait = love.math.random(3, 10.1)
		self.ts = 0
	end
end

EndlessLevelFlagView = class("EndlessLevelFlagView", KImageButton)

function EndlessLevelFlagView:initialize(level_num)
	KImageButton.initialize(self, "mapFlag_endless_desktop_0001", "mapFlag_endless_desktop_0002", "mapFlag_endless_desktop_0002")

	self.anchor = v(self.size.x / 2, self.size.y / 2)
	self.level_num = level_num
end

function EndlessLevelFlagView:on_click()
	S:queue("GUIButtonCommon")

	if screen_map.endlessTip then
		screen_map.endlessTip.hidden = true
		screen_map.user_data.seen.map_balloon_endless_view = true

		storage:save_slot(screen_map.user_data)
	end

	screen_map.level_select = EndlessLevelSelectView:new(screen_map.sw, screen_map.sh, self.level_num, self.slot_data)

	screen_map.window:add_child(screen_map.level_select)
	screen_map.level_select:show()
	self:on_exit()
	self:disable(false)
	timer:after(0.5, function()
		self:enable()
	end)
end

StarsBanner = class("StarsBanner", KImageView)

function StarsBanner:initialize()
	KImageView.initialize(self, "mapStarsContainer")

	self.anchor = v(self.size.x / 2, 0)

	self:set_value(screen_map.total_stars, GS.max_stars)
end

function StarsBanner:set_value(got_value, of_value)
	local aux = tostring(got_value):reverse()
	local half_moved = self.size.x / 2 - 25
	local posx = half_moved - 5

	for digit in aux.gmatch(aux, "%d") do
		local digit_image

		if digit == "0" then
			digit_image = KImageView:new("mapStarsContainer_numbers_0010")
		else
			digit_image = KImageView:new("mapStarsContainer_numbers_000" .. digit)
		end

		digit_image.pos = v(posx - 20, self.size.y / 2)
		digit_image.anchor = v(digit_image.size.x / 2, digit_image.size.y / 2)

		self:add_child(digit_image)

		posx = posx - 20
	end

	local slash_image = KImageView:new("mapStarsContainer_numbers_0011")

	slash_image.anchor = v(slash_image.size.x / 2, slash_image.size.y / 2)
	slash_image.pos = v(half_moved, self.size.y / 2)

	self:add_child(slash_image)

	aux = tostring(of_value)

	local posx = half_moved + 5

	for digit in aux.gmatch(aux, "%d") do
		local digit_image

		if digit == "0" then
			digit_image = KImageView:new("mapStarsContainer_numbers_0010")
		else
			digit_image = KImageView:new("mapStarsContainer_numbers_000" .. digit)
		end

		digit_image.pos = v(posx + 20, self.size.y / 2)
		digit_image.anchor = v(digit_image.size.x / 2, digit_image.size.y / 2)

		self:add_child(digit_image)

		posx = posx + 20
	end
end

local ls_page_l_x = 214
local ls_page_r_x = 690
local ls_page_w = 360
local ls_page_y = 104
local ls_page_l_m = ls_page_l_x + ls_page_w / 2
local ls_page_r_m = ls_page_r_x + ls_page_w / 2

local function add_level_title(parent, text, style, y)
	local px, pm, py, fs, lines

	py = y or ls_page_y

	if style == "left" then
		px = ls_page_l_x
		pm = ls_page_l_m
		fs = CJK(36, nil, 34)
		lines = 2

		local words = string.split(text, " ")

		if #words == 1 then
			lines = 1
		end

		text = string.gsub(text, "-", " ")
	elseif style == "right" then
		px = ls_page_r_x
		pm = ls_page_r_m
		fs = 32
		lines = 1
	elseif style == "sub" then
		px = ls_page_r_x
		pm = ls_page_r_m
		fs = 26
		lines = 1
	end

	local title = GGLabel:new(V.v(ls_page_w - 120, lines * 40))

	title.pos = v(px + 60, py)
	title.anchor.y = title.size.y / 2
	title.font_name = "h_book"
	title.font_size = fs
	title.font_align = "center"
	title.vertical_align = "middle"
	title.colors.text = style == "sub" and {
		142,
		131,
		91,
		255
	} or {
		100,
		89,
		52,
		255
	}
	title.text = text
	title.line_height = CJK(0.9, 0.9, 1, 0.9)
	title.fit_lines = lines

	title:do_fit_lines()
	parent:add_child(title)

	local tw, wrn, wr = title:get_wrap_lines()
	local title_w = 0

	for i = 1, wrn do
		title_w = math.max(title_w, title:get_text_width(wr[i]))
	end

	local deco_y = py + 3
	local d
	local dn = "levelSelect_volutas_0001"

	d = KImageView:new(dn)
	d.pos = v(pm - title_w / 2 - 8, deco_y)
	d.anchor = v(0, d.size.y / 2)
	d.scale.x = -1
	d.alpha = style == "sub" and 0.5 or 1

	parent:add_child(d)

	d = KImageView:new(dn)
	d.pos = v(pm + title_w / 2 + 10, deco_y)
	d.anchor = v(0, d.size.y / 2)
	d.alpha = style == "sub" and 0.5 or 1

	parent:add_child(d)
end

local function add_level_description(parent, text)
	local LEFT_MARGIN = ls_page_r_x + 10
	local FULL_PARAGRAPH_WIDTH = ls_page_w - 10
	local TEXT_TOP_POS = ls_page_y + 50 + CJK(0, 0, 0, -4)
	local RIGHT_PAGE_MAX_Y = 468
	local font_name = "body"
	local font_size = 17.5
	local line_height = CJK(0.85, 0.85, 1.1, 0.9)
	local bg = KImageView:new("levelSelect_capitular_bg")

	bg.pos = v(LEFT_MARGIN - 10, TEXT_TOP_POS - 30)

	parent:add_child(bg)

	local FIRST_PARAGRAPH_WIDTH = ls_page_w - bg.size.x
	local p = string.sub(text, utf8.offset(text, 2))
	local first_letter_label = GGLabel:new(V.v(bg.size.x, bg.size.y))

	first_letter_label.pos = v(bg.pos.x + CJK(-4, 0, 0, 0), bg.pos.y + CJK(0, -4, -6, -6))
	first_letter_label.font_name = "capitals"
	first_letter_label.font_size = CJK(64, 56, 56, 56)
	first_letter_label.colors.text = {
		247,
		234,
		186
	}
	first_letter_label.text_align = "center"
	first_letter_label.vertical_align = "bottom"
	first_letter_label.text = string.sub(text, 1, utf8.offset(text, 2) - 1)

	parent:add_child(first_letter_label)

	local first_paragraph_1_label = GGLabel:new(V.v(FIRST_PARAGRAPH_WIDTH, 100))

	first_paragraph_1_label.pos = v(bg.pos.x + bg.size.x - 2, TEXT_TOP_POS)
	first_paragraph_1_label.font_name = font_name
	first_paragraph_1_label.font_size = font_size
	first_paragraph_1_label.line_height = line_height
	first_paragraph_1_label.colors.text = {
		64,
		57,
		36
	}
	first_paragraph_1_label.text_align = "left"
	first_paragraph_1_label.text = p

	parent:add_child(first_paragraph_1_label)

	local w, p_nlines, p_lines = first_paragraph_1_label:get_wrap_lines()
	local p_max_lines = math.ceil((bg.pos.y + bg.size.y - TEXT_TOP_POS - 3) / (first_paragraph_1_label:get_font_height() * line_height))
	local p_1_nlines = math.min(p_max_lines, #p_lines)

	for i = 1, #p_lines do
		p_lines[i] = string.trim(p_lines[i])
	end

	local p_1 = table.concat(p_lines, "\n", 1, p_1_nlines)
	local p_2 = table.concat(p_lines, CJK(" ", "", "", nil), p_1_nlines + 1)

	first_paragraph_1_label.text = p_1

	log.debug("Lines:\n%s", getdump(p_lines))
	log.debug("p_1_nlines:%i", p_1_nlines)

	local p2_pos = v(LEFT_MARGIN, first_paragraph_1_label.pos.y + first_paragraph_1_label:get_font_height() * p_1_nlines * line_height)
	local first_paragraph_2_label = GGLabel:new(V.v(FULL_PARAGRAPH_WIDTH, RIGHT_PAGE_MAX_Y - p2_pos.y))

	first_paragraph_2_label.pos = p2_pos
	first_paragraph_2_label.fit_size = true
	first_paragraph_2_label.font_name = font_name
	first_paragraph_2_label.font_size = font_size
	first_paragraph_2_label.line_height = line_height
	first_paragraph_2_label.colors.text = {
		64,
		57,
		36
	}
	first_paragraph_2_label.text_align = "left"

	parent:add_child(first_paragraph_2_label)

	first_paragraph_2_label.text = p_2
end

local function add_difficulty_stamp(parent, mode, diff, x, y)
	if diff then
		local im = KImageView:new("levelSelect_difficultyCompleted_000" .. diff)

		im.pos = v(x, y)

		parent:add_child(im)
	end
end

local function add_level_battle_button(parent, mode, level_num)
	local c1 = {
		0.9529411764705882,
		0.7764705882352941,
		0.596078431372549,
		1
	}
	local c3 = {
		0.6862745098039216,
		0.5372549019607843,
		0.38823529411764707,
		1
	}
	local co = {
		0.37254901960784315,
		0.023529411764705882,
		0.050980392156862744,
		1
	}
	local sh = {
		"p_bands",
		"p_outline",
		"p_glow"
	}
	local sha = {
		{
			margin = 0,
			p1 = 0,
			p2 = 0.4,
			c1 = c1,
			c2 = c1,
			c3 = c3
		},
		{
			thickness = 2.5,
			outline_color = co
		},
		{
			thickness = 1.6,
			glow_color = {
				0,
				0,
				0,
				0.6
			}
		}
	}
	local c1_hover = {
		1,
		1,
		1,
		1
	}
	local c3_hover = {
		1,
		1,
		0.6941176470588235,
		1
	}
	local co_hover = {
		0.807843137254902,
		0.13725490196078433,
		0.08627450980392157,
		1
	}
	local sha_hover = {
		{
			margin = 0,
			p1 = 0,
			p2 = 0.4,
			c1 = c1_hover,
			c2 = c1_hover,
			c3 = c3_hover
		},
		{
			thickness = 2.5,
			outline_color = co_hover
		},
		{
			thickness = 1.6,
			glow_color = {
				c3[1],
				c3[2],
				c3[3],
				0.6
			}
		}
	}
	local prefix = "levelSelect_startMode_notxt_000%i"
	local nu = string.format(prefix, 2 * mode - 1)
	local nh = string.format(prefix, 2 * mode)
	local b = KImageButton:new(nu, nh, nh)

	b.pos = v(805, 470)

	parent:add_child(b)

	function b.on_click()
		S:queue("GUIButtonCommon")
		screen_map:start_level(level_num, mode)
	end

	function b.on_enter(this)
		this.class.on_enter(this)

		this.t1.shader_args = sha_hover
		this.t2.shader_args = sha_hover

		this.t1:redraw()
		this.t2:redraw()
	end

	function b.on_exit(this)
		this.class.on_exit(this)

		this.t1.shader_args = sha
		this.t2.shader_args = sha

		this.t1:redraw()
		this.t2:redraw()
	end

	local t = GGShaderLabel:new(V.v(b.size.x, 20))

	t.pos.y = 70
	t.font_size = 15
	t.font_name = "h_noti"
	t.text_align = "center"
	t.text = _("BUTTON_TO_BATTLE_1")
	t.colors.text = {
		255,
		255,
		255,
		255
	}
	t.shaders = sh
	t.shader_args = sha
	t.propagate_on_click = true

	b:add_child(t)

	b.t1 = t
	t = GGShaderLabel:new(V.v(b.size.x, 30))
	t.pos.y = 86
	t.font_size = 22
	t.font_name = "h_noti"
	t.text_align = "center"
	t.text = _("BUTTON_TO_BATTLE_2")
	t.colors.text = {
		255,
		255,
		255,
		255
	}
	t.shaders = sh
	t.shader_args = sha
	t.propagate_on_click = true

	b:add_child(t)

	b.t2 = t
end

local function add_level_rules(parent, level_num, y)
	local level_data = screen_map.level_data[level_num]
	local has_hero = level_data.upgrades.heroe
	local upg_desc = _("UPGRADE_LEVEL") .. "\n" .. tostring(level_data.upgrades.level)
	local upg_icon = KImageView:new("levelSelect_modeRules_0010")

	upg_icon.pos = v(ls_page_r_x + 20, y)

	parent:add_child(upg_icon)

	local upg_label = GGLabel:new(V.v(90, upg_icon.size.y))

	upg_label.pos = v(upg_icon.pos.x + upg_icon.size.x, upg_icon.pos.y + upg_icon.size.y / 2)
	upg_label.anchor.y = upg_label.size.y / 2
	upg_label.font_name = "body"
	upg_label.font_size = 11
	upg_label.text_align = "center"
	upg_label.vertical_align = "middle"
	upg_label.text = upg_desc
	upg_label.colors.text = {
		64,
		57,
		36
	}

	parent:add_child(upg_label)

	local hero_icon = KImageView:new(has_hero and "levelSelect_modeRules_0011" or "levelSelect_modeRules_0009")

	hero_icon.pos = v(ls_page_r_x + ls_page_w / 2 + 20, y)

	parent:add_child(hero_icon)

	local hero_label = GGLabel:new(V.v(90, hero_icon.size.y))

	hero_label.pos = v(hero_icon.pos.x + hero_icon.size.x, hero_icon.pos.y + hero_icon.size.y / 2)
	hero_label.anchor.y = hero_label.size.y / 2
	hero_label.font_name = "body"
	hero_label.font_size = 11
	hero_label.text_align = "center"
	hero_label.vertical_align = "middle"
	hero_label.text = has_hero and _("HEROES") or _("NO HEROES")
	hero_label.colors.text = {
		64,
		57,
		36
	}

	parent:add_child(hero_label)
end

local function add_level_tab(parent, mode, y, stars)
	local x = 1105
	local fmt = "levelSelect_Mode_notxt_00%02i"
	local indexes = {
		[GAME_MODE_CAMPAIGN] = {
			nil,
			1,
			2,
			3
		},
		[GAME_MODE_HEROIC] = {
			4,
			5,
			6,
			7
		},
		[GAME_MODE_IRON] = {
			8,
			9,
			10,
			11
		}
	}
	local i_l, i_n, i_h, i_s = unpack(indexes[mode])
	local texts = {
		_("Campaign"),
		_("Heroic"),
		_("Iron")
	}

	if not parent.tabs_locked then
		parent.tabs_locked = {}
	end

	if not parent.tabs then
		parent.tabs = {}
	end

	if not parent.tabs_selected then
		parent.tabs_selected = {}
	end

	local oy = (mode ~= GAME_MODE_CAMPAIGN and -2 or 0) + CJK(0, -4, 3, 0)
	local ox = mode ~= GAME_MODE_CAMPAIGN and 0 or 0
	local lx = 40
	local ly = 56
	local lx_sel = 53

	if i_l and stars < 3 then
		local t = KImageView:new(string.format(fmt, i_l))

		t.pos = v(x, y)

		function t.on_enter()
			local msg = mode == GAME_MODE_HEROIC and _("Heroic challenge") or _("Iron challenge")

			parent:show_tooltip(msg)
		end

		function t.on_exit()
			parent:hide_tooltip()
		end

		parent.back:add_child(t)

		parent.tabs_locked[mode] = t

		local l = GGLabel:new(V.v(68, 10))

		l.anchor = v(l.size.x / 2, l.size.y / 2)
		l.font_name = CJK("body", nil, nil, "h_noti")
		l.font_size = 13
		l.font_align = "center"
		l.pos = v(lx + ox, ly + oy)
		l.colors.text = {
			198,
			134,
			95,
			255
		}
		l.text = texts[mode]
		l.propagate_on_click = true
		l.fit_lines = 1

		t:add_child(l)
	else
		if i_n then
			local l = GGLabel:new(V.v(68, 10))

			l.anchor = v(l.size.x / 2, l.size.y / 2)
			l.font_name = CJK("body", nil, nil, "h_noti")
			l.font_size = 13
			l.font_align = "center"
			l.pos = v(lx + ox, ly + oy)
			l.colors.text = {
				198,
				134,
				95,
				255
			}
			l.text = texts[mode]
			l.propagate_on_click = true
			l.fit_lines = 1

			local t = KImageButton:new(string.format(fmt, i_n), string.format(fmt, i_h))

			t.pos = v(x, y)

			function t.on_click(this)
				S:queue("GUIButtonCommon")
				parent:show_page(mode, stars)
			end

			function t.on_enter(this)
				S:queue("GUIQuickMenuOver")

				l.colors.text = {
					95,
					59,
					38,
					255
				}

				this.class.on_enter(this)
			end

			function t.on_exit(this)
				l.colors.text = {
					198,
					134,
					95,
					255
				}

				this.class.on_exit(this)
			end

			t:add_child(l)
			parent.back:add_child(t)

			parent.tabs[mode] = t
		end

		if i_s then
			local l = GGLabel:new(V.v(68, 10))

			l.anchor = v(l.size.x / 2, l.size.y / 2)
			l.font_name = CJK("body", nil, nil, "h_noti")
			l.font_size = 13
			l.font_align = "center"
			l.pos = v(lx_sel + ox, ly + oy)
			l.colors.text = {
				142,
				213,
				246,
				255
			}
			l.text = texts[mode]
			l.propagate_on_click = true
			l.fit_lines = 1

			local t = KImageView:new(string.format(fmt, i_s))

			t.pos = v(x, y)

			t:add_child(l)
			parent.back:add_child(t)

			parent.tabs_selected[mode] = t
		end
	end
end

LevelSelectDifficultyButton = class("LevelSelectDifficultyButton", KImageButton)

function LevelSelectDifficultyButton:initialize()
	KImageButton.initialize(self, "levelSelect_difficulty_0001")

	local diff = screen_map.user_data.difficulty or DIFFICULTY_NORMAL

	self:set_difficulty(diff)
end

function LevelSelectDifficultyButton:on_click()
	S:queue("GUIButtonCommon")

	local campaign_done = #screen_map.user_data.levels > GS.main_campaign_levels
	local diff = screen_map.user_data.difficulty

	diff = km.zmod(diff + 1, campaign_done and GS.max_difficulty or 3)
	screen_map.user_data.difficulty = diff

	storage:save_slot(screen_map.user_data)
	self:set_difficulty(diff)
	self:set_image(self.hover_image_name)
end

function LevelSelectDifficultyButton:set_difficulty(diff)
	local fmt = "levelSelect_difficulty_000%i"
	local img_n = string.format(fmt, 2 * diff - 1)
	local img_h = string.format(fmt, 2 * diff)

	self.default_image_name = img_n
	self.hover_image_name = img_h
	self.click_image_name = img_h

	self:set_image(self.default_image_name)

	self.difficulty = diff
end

function LevelSelectDifficultyButton:update(dt)
	local diff = screen_map.user_data.difficulty

	if diff ~= self.difficulty then
		self:set_difficulty(diff)
	end

	LevelSelectDifficultyButton.super.update(self, dt)
end

LevelSelectView = class("LevelSelectView", PopUpView)

function LevelSelectView:initialize(sw, sh, level_num, stars, heroic, iron, slot_data)
	PopUpView.initialize(self, V.v(sw, sh))

	local level_string = string.format("%02i", level_num)
	local level_data = screen_map.level_data[level_num]

	self.back = KImageView:new("levelSelect_background")
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2 - 15, sh / 2 - 50)

	self:add_child(self.back)

	self.back.alpha = 0

	local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

	close_button.pos = v(self.back.size.x - 50, 20)
	self.close_button = close_button

	self.back:add_child(close_button)

	function close_button.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end

	add_level_title(self.back, _(string.format("LEVEL_%d_TITLE", level_num)), "left", ls_page_y + 22)

	local stage_thumb = KImageView:new("stage_thumbs_00" .. level_string)

	stage_thumb.pos = v(215, 190)

	self.back:add_child(stage_thumb)

	local thumb_frame = KImageView:new("levelSelect_thumbFrame")

	thumb_frame.pos = v(202, 175)

	self.back:add_child(thumb_frame)

	local badge_x = 310
	local badge_x_off = 35
	local badge_y = 490
	local badge_fmt = "levelSelect_badges_000%i"

	for i = 1, 5 do
		local n

		if i == 5 then
			n = iron > 0 and 5 or 6
		elseif i == 4 then
			n = heroic > 0 and 3 or 4
		else
			n = i <= stars and 1 or 2
		end

		local bn = string.format(badge_fmt, n)
		local b = KImageView:new(bn)

		b.scale = v(0.8, 0.8)
		b.pos = v(badge_x, badge_y)
		badge_x = badge_x + badge_x_off

		self.back:add_child(b)
	end

	self.campaign = KView:new()

	self.back:add_child(self.campaign)
	add_level_title(self.campaign, _("Campaign"), "right")

	local desc_h = add_level_description(self.campaign, _("LEVEL_" .. tostring(level_num) .. "_HISTORY"))

	add_difficulty_stamp(self.campaign, GAME_MODE_CAMPAIGN, slot_data[GAME_MODE_CAMPAIGN], 690, 520)

	local b = LevelSelectDifficultyButton:new()

	b.pos = v(982, 522)

	self.campaign:add_child(b)
	add_level_battle_button(self.campaign, GAME_MODE_CAMPAIGN, level_num)
	add_level_tab(self, GAME_MODE_CAMPAIGN, 175, stars)

	local rules_y = 290

	self.heroic = KView:new()

	self.back:add_child(self.heroic)

	self.heroic.hidden = true

	local rbg = KImageView:new("levelSelect_modebg_notxt_0001")

	rbg.pos = v(ls_page_r_x + (ls_page_w - rbg.size.x) / 2, rules_y + 20)

	self.heroic:add_child(rbg)
	add_level_title(self.heroic, _("Heroic"), "right")

	local desc_h = add_level_description(self.heroic, _("LEVEL_MODE_HEROIC_DESCRIPTION"))

	add_level_title(self.heroic, _("Challenge Rules"), "sub", rules_y)
	add_level_rules(self.heroic, level_num, rules_y + 38)
	add_difficulty_stamp(self.heroic, GAME_MODE_HEROIC, slot_data[GAME_MODE_HEROIC], 690, 520)

	local b = LevelSelectDifficultyButton:new()

	b.pos = v(982, 522)

	self.heroic:add_child(b)
	add_level_battle_button(self.heroic, GAME_MODE_HEROIC, level_num)
	add_level_tab(self, GAME_MODE_HEROIC, 260, stars)

	local rules_y = 290

	self.iron = KView:new()

	self.back:add_child(self.iron)

	self.iron.hidden = true

	local rbg = KImageView:new("levelSelect_modebg_notxt_0001")

	rbg.pos = v(ls_page_r_x + (ls_page_w - rbg.size.x) / 2, rules_y + 20)

	self.iron:add_child(rbg)

	local rbbg = KImageView:new("levelSelect_modebg_notxt_0002")

	rbbg.pos = v(ls_page_r_x + (ls_page_w - rbbg.size.x) / 2, rules_y + 90)

	self.iron:add_child(rbbg)
	add_level_title(self.iron, _("Iron"), "right")

	local desc_h = add_level_description(self.iron, _("LEVEL_MODE_IRON_DESCRIPTION"))

	add_level_title(self.iron, _("Challenge Rules"), "sub", rules_y)
	add_level_rules(self.iron, level_num, rules_y + 38)

	local b_x = 770
	local b_y = rbbg.pos.y + 10
	local b_o = 50
	local allowed_towers = screen_map.level_data[level_num].iron
	local opts = IS_KR3 and {
		"archers",
		"barracks",
		"mages",
		"druids"
	} or {
		"archers",
		"barracks",
		"mages",
		"artillery"
	}

	for i, v in ipairs(opts) do
		local n = table.contains(allowed_towers, v) and 2 * i or 2 * i - 1
		local b = KImageView:new(string.format("levelSelect_modeRules_000%i", n))

		b.pos = V.v(b_x, b_y)
		b_x = b_x + b_o

		self.iron:add_child(b)
	end

	add_difficulty_stamp(self.iron, GAME_MODE_IRON, slot_data[GAME_MODE_IRON], 690, 520)

	local b = LevelSelectDifficultyButton:new()

	b.pos = v(982, 522)

	self.iron:add_child(b)
	add_level_battle_button(self.iron, GAME_MODE_IRON, level_num)
	add_level_tab(self, GAME_MODE_IRON, 345, stars)
	self:show_page(GAME_MODE_CAMPAIGN, stars)

	local name_label = GGLabel:new(V.v(280, 18))

	name_label.pos = v(10, 10)
	name_label.font_name = "body"
	name_label.font_size = 18
	name_label.colors.text = {
		255,
		255,
		255
	}
	name_label.text = _("Heroic")
	name_label.text_align = "left"

	local desc_label = GGLabel:new(V.v(280, 18))

	desc_label.pos = v(10, name_label.pos.y + name_label.size.y + 5)
	desc_label.font_name = "body"
	desc_label.font_size = 18
	desc_label.colors.text = {
		245,
		203,
		6
	}
	desc_label.text_align = "left"
	desc_label.text = _("LEVEL_MODE_LOCKED_DESCRIPTION")
	desc_label.line_height = 0.9

	local w, lines = desc_label:get_wrap_lines()
	local panel_h = desc_label.pos.y + lines * desc_label:get_font_height() * desc_label.line_height + 10

	self.tip_panel = KView:new(V.v(300, panel_h))
	self.tip_panel.colors.background = {
		21,
		17,
		13,
		255
	}
	self.tip_panel.alpha = 0.9

	self:add_child(self.tip_panel)

	self.tip_panel.title = name_label

	self.tip_panel:add_child(name_label)

	self.tip_panel.desc = desc_label

	self.tip_panel:add_child(desc_label)

	local tip_panel_tip = KImageView:new("Upgrades_Tips_tip")

	tip_panel_tip.pos = v(self.tip_panel.size.x + 10, self.tip_panel.size.y - 20)
	tip_panel_tip.scale = v(-1, 1)
	tip_panel_tip.propagate_on_click = true

	self.tip_panel:add_child(tip_panel_tip)

	self.tip_panel.tip = tip_panel_tip
	self.tip_panel.anchor = v(self.tip_panel.size.x + 15, self.tip_panel.size.y + 20)
	self.tip_panel.hidden = true
end

function LevelSelectView:show_tooltip(title)
	self.tip_panel.hidden = false
	self.tip_panel.title.text = title

	self:update_tooltip_position()
end

function LevelSelectView:hide_tooltip()
	self.tip_panel.hidden = true
end

function LevelSelectView:update_tooltip_position()
	if not self.tip_panel.hidden then
		local mx, my = screen_map.window:get_mouse_position()

		self.tip_panel.pos = v(mx / screen_map.window.scale.x, my / screen_map.window.scale.y)
	end
end

function LevelSelectView:update(dt)
	LevelSelectView.super.update(self, dt)
	self:update_tooltip_position()
end

function LevelSelectView:show_page(page, stars)
	self.campaign.hidden = page ~= GAME_MODE_CAMPAIGN
	self.heroic.hidden = page ~= GAME_MODE_HEROIC
	self.iron.hidden = page ~= GAME_MODE_IRON

	for _, m in pairs({
		GAME_MODE_CAMPAIGN,
		GAME_MODE_HEROIC,
		GAME_MODE_IRON
	}) do
		if self.tabs[m] then
			self.tabs[m].hidden = page == m
		end

		if self.tabs_selected[m] then
			self.tabs_selected[m].hidden = page ~= m
		end
	end
end

EndlessLevelSelectView = class("EndlessLevelSelectView", PopUpView)

function EndlessLevelSelectView:initialize(sw, sh, level_num, slot_data)
	PopUpView.initialize(self, V.v(sw, sh))

	self.level_idx = level_num

	local level_string = string.format("%02i", level_num)
	local level_data = screen_map.level_data[level_num]

	self.back = KImageView:new("levelSelect_background")
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2 - 15, sh / 2 - 50)

	self:add_child(self.back)

	self.back.alpha = 0

	local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

	close_button.pos = v(self.back.size.x - 50, 20)
	self.close_button = close_button

	self.back:add_child(close_button)

	function close_button.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end

	add_level_title(self.back, _(string.format("ENDLESS_LEVEL_%d_TITLE", level_num - 80)), "left", ls_page_y + 22)

	local stage_thumb = KImageView:new("stage_thumbs_endless_00" .. level_string)

	stage_thumb.pos = v(215, 190)

	self.back:add_child(stage_thumb)

	local thumb_frame = KImageView:new("levelSelect_thumbFrame")

	thumb_frame.pos = v(202, 175)

	self.back:add_child(thumb_frame)

	local bp = KImageView:new("levelSelect_bg_patch")

	bp.scale = v(21, 6)
	bp.pos = v(290, 475)

	self.back:add_child(bp)

	local w = KImageView:new("levelSelect_waves")

	w.anchor = v(w.size.x / 2, w.size.y / 2)
	w.pos = v(290, 485)

	self.back:add_child(w)

	local wl = GGLabel:new(v(30, 24))

	wl.pos = v(29, 29)
	wl.vertical_align = "middle"
	wl.font_name = "body"
	wl.font_size = 20
	wl.fit_size = true
	wl.colors.text = {
		64,
		57,
		36
	}
	wl.colors.background = {
		0,
		0,
		0,
		0
	}
	wl.text = "99"

	w:add_child(wl)

	self.waves_label = wl

	local wd = GGLabel:new(V.v(100, 40))

	wd.text = _("ENDLESS_LEVEL_SELECT_SURVIVED")
	wd.pos = v(w.pos.x, w.pos.y + 55)
	wd.anchor = v(wd.size.x / 2, wd.size.y / 2)
	wd.font_name = "body"
	wd.font_size = 16
	wd.text_align = "center"
	wd.vertical_align = "top"
	wd.colors.text = {
		64,
		57,
		36
	}

	self.back:add_child(wd)

	local s = KImageView:new("levelSelect_maxScore")

	s.anchor = v(s.size.x / 2, s.size.y / 2)
	s.pos = v(480, 487)

	self.back:add_child(s)

	local sl = GGLabel:new(v(84, 24))

	sl.pos = v(32, 25)
	sl.vertical_align = "middle"
	sl.font_name = "body"
	sl.font_size = 20
	sl.fit_size = true
	sl.fit_lines = 1
	sl.colors.text = {
		64,
		57,
		36
	}
	sl.colors.background = {
		0,
		0,
		0,
		0
	}
	sl.text = "999999"

	s:add_child(sl)

	self.score_label = sl

	local sd = GGLabel:new(V.v(100, 40))

	sd.text = _("ENDLESS_LEVEL_SELECT_MAX_SCORE")
	sd.pos = v(s.pos.x, s.pos.y + 55)
	sd.anchor = v(sd.size.x / 2, sd.size.y / 2)
	sd.font_name = "body"
	sd.font_size = 16
	sd.text_align = "center"
	sd.vertical_align = "top"
	sd.colors.text = {
		64,
		57,
		36
	}

	self.back:add_child(sd)
	self:load_score()

	local right_page = KView:new()

	self.back:add_child(right_page)
	add_level_title(right_page, _("ENDLESS_LEVEL_SELECT_HEADER"), "right")

	local desc_h = add_level_description(right_page, _("ENDLESS_LEVEL_" .. tostring(level_num - 80) .. "_HISTORY"))
	local rules_y = 320
	local rbg = KImageView:new("levelSelect_modebg_notxt_0001")

	rbg.pos = v(ls_page_r_x + (ls_page_w - rbg.size.x) / 2, rules_y + 20)

	right_page:add_child(rbg)
	add_level_title(right_page, _("Challenge Rules"), "sub", rules_y)

	rules_y = rules_y + 38

	local heart_icon = KImageView:new("levelSelect_modeRules_endless_0001")

	heart_icon.pos = v(ls_page_r_x + 20, rules_y)

	right_page:add_child(heart_icon)

	local skull_icon = KImageView:new("levelSelect_modeRules_endless_0002")

	skull_icon.pos = v(ls_page_r_x + ls_page_w / 2 + 20, rules_y)

	right_page:add_child(skull_icon)

	local heart_label = GGLabel:new(V.v(90, heart_icon.size.y))

	heart_label.text = _("ENDLESS_LEVEL_SELECT_LIVES_INFO")
	heart_label.pos = v(heart_icon.pos.x + heart_icon.size.x, heart_icon.pos.y + heart_icon.size.y / 2)
	heart_label.anchor.y = heart_label.size.y / 2
	heart_label.font_name = "body"
	heart_label.font_size = 13
	heart_label.text_align = "center"
	heart_label.vertical_align = "middle"
	heart_label.colors.text = {
		64,
		57,
		36
	}

	right_page:add_child(heart_label)

	local skull_label = GGLabel:new(V.v(90, skull_icon.size.y))

	skull_label.text = _("ENDLESS_LEVEL_SELECT_WAVES_INFO")
	skull_label.pos = v(skull_icon.pos.x + skull_icon.size.x, skull_icon.pos.y + skull_icon.size.y / 2)
	skull_label.anchor.y = skull_label.size.y / 2
	skull_label.font_name = "body"
	skull_label.font_size = 13
	skull_label.text_align = "center"
	skull_label.vertical_align = "middle"
	skull_label.colors.text = {
		64,
		57,
		36
	}

	right_page:add_child(skull_label)

	local b = LevelSelectDifficultyButton:new()

	b.pos = v(982, 522)
	b.parent_on_click = b.on_click

	function b.on_click(this)
		this:parent_on_click()
		self:load_score()
	end

	right_page:add_child(b)

	local ps_ld = PS and PS.services.leaderboards or nil
	local r = KImageButton("levelSelect_rankings_0001", "levelSelect_rankings_0002", "levelSelect_rankings_0002")

	r.pos = v(720, 550)
	r.anchor = v(r.size.x / 2, r.size.y / 2)
	r.alpha = ps_ld and ps_ld:get_status() and 1 or 0.5

	function r.on_click()
		S:queue("GUIButtonCommon")

		if not ps_ld then
			return
		end

		if ps_ld:get_status() then
			local user_data = storage:load_slot()

			ps_ld:show_leaderboard(level_num, user_data.difficulty)
		else
			ps_ld:do_signin()
		end
	end

	right_page:add_child(r)
	add_level_battle_button(right_page, GAME_MODE_ENDLESS, level_num)
end

function EndlessLevelSelectView:load_score()
	local waves_survived = 0
	local high_score = 0
	local user_data = storage:load_slot()
	local slot_level = user_data.levels[self.level_idx]

	if slot_level and slot_level[user_data.difficulty] then
		waves_survived = slot_level[user_data.difficulty].waves_survived
		high_score = slot_level[user_data.difficulty].high_score
	end

	self.waves_label.text = tostring(waves_survived)
	self.score_label.text = tostring(high_score)
end

UpgradesView = class("UpgradesView", PopUpView)

function UpgradesView:initialize(sw, sh)
	PopUpView.initialize(self, V.v(sw, sh))

	self.back = KImageView:new("Upgrades_BG_notxt")
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2 - 15, sh / 2 - 50)

	self:add_child(self.back)

	self.back.alpha = 1

	if IS_KR3 then
		local header_bg = KImageView("kr3_title_bg")

		header_bg.anchor.x = km.round(header_bg.size.x / 2)
		header_bg.pos = v(km.round(self.back.size.x / 2) - 10, -34)

		self.back:add_child(header_bg)
	end

	local header = GGPanelHeader:new(_("UPGRADES"), 274)

	header.pos = V.v(308, CJK(27, 25, nil, 25) + (IS_KR3 and -36 or 0))

	self.back:add_child(header)

	local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

	close_button.pos = v(self.back.size.x - 55, 20)
	self.close_button = close_button

	self.back:add_child(close_button)

	self.reset_button = GGUpgradesButton:new(_("BUTTON_RESET"))
	self.reset_button.pos = v(240, 630)

	self.back:add_child(self.reset_button)

	self.undo_button = GGUpgradesButton:new(_("BUTTON_UNDO"))
	self.undo_button.pos = v(550, 630)

	self.undo_button:disable()
	self.back:add_child(self.undo_button)

	self.done_button = GGUpgradesButton:new(_("BUTTON_DONE"))
	self.done_button.pos = v(680, 630)

	self.back:add_child(self.done_button)

	self.star_container = KImageView:new("Upgrades_StarContainer")
	self.star_container.pos = v(100, 637)

	self.back:add_child(self.star_container)

	self.stars_label = KLabel:new(V.v(self.star_container.size.x / 2, self.star_container.size.y))
	self.stars_label.pos = v(85 + self.star_container.size.x / 2, 648)
	self.stars_label.font = F:f("Comic Book Italic", "32")
	self.stars_label.colors.text = {
		231,
		222,
		175
	}
	self.stars_label.text = "0"

	self.back:add_child(self.stars_label)

	self.disabled_icon = {}

	local bar_positions = {
		v(152, 538),
		v(274, 538),
		v(394, 538),
		v(514, 538),
		v(636, 538),
		v(755, 538)
	}

	self.upgrade_bars = {}

	for i, k in ipairs(UPGR.display_order) do
		local b = KImageView:new("YellowBar")

		b.anchor = IS_KR3 and v(6, 376) or v(6, 372)
		b.pos = bar_positions[i]

		self.back:add_child(b)

		self.upgrade_bars[k] = b
	end

	self.upgrade_buttons = {}

	local init_bought_list = screen_map.user_data.upgrades

	self.spent_stars = 0

	local start_y = 520
	local separation_y = 80
	local x_offsets = {
		115,
		237,
		355,
		477,
		598,
		718
	}

	for key, value in pairs(UPGR.list) do
		local class_ind = table.keyforobject(UPGR.display_order, value.class)
		local icon_index = value.icon
		local icon_name = string.format("Upgrades_Icons_%04i", icon_index)

		self.upgrade_buttons[key] = UpgradeButtons:new(icon_name, value, key)

		local _button = self.upgrade_buttons[key]

		_button.pos = v(x_offsets[class_ind], start_y - value.level * separation_y)

		self.back:add_child(_button)
	end

	self:set_bought_levels(init_bought_list)
	self:set_stars_and_check()

	self.tip_panel = KView:new(V.v(320, 100))
	self.tip_panel.colors.background = {
		21,
		17,
		13,
		255
	}
	self.tip_panel.anchor = v(0, 105)
	self.tip_panel.alpha = 0.9

	self:add_child(self.tip_panel)

	local tip_panel_tip = KImageView:new("Upgrades_Tips_tip")

	tip_panel_tip.pos = v(6, 72)
	tip_panel_tip.propagate_on_click = true

	self.tip_panel:add_child(tip_panel_tip)

	self.tip_panel.tip = tip_panel_tip

	local name_label = GGLabel:new(V.v(240, 18))

	name_label.pos = v(20, 8)
	name_label.font_name = "body"
	name_label.font_size = 18
	name_label.colors.text = {
		255,
		255,
		255
	}
	name_label.text = "title_name"
	name_label.text_align = "left"
	name_label.fit_lines = 1
	self.tip_panel.title = name_label

	self.tip_panel:add_child(name_label)

	local desc_label = GGLabel:new(V.v(280, 18))

	desc_label.pos = v(20, 33)
	desc_label.font_name = "body"
	desc_label.font_size = 18
	desc_label.colors.text = {
		245,
		203,
		6
	}
	desc_label.text_align = "left"
	desc_label.text = "desc_name"
	desc_label.line_height = CJK(0.85, nil, 1, 0.9)
	self.tip_panel.desc = desc_label

	self.tip_panel:add_child(desc_label)

	local price_label = GGLabel:new(V.v(50, 18))

	price_label.pos = v(295, 8)
	price_label.font_name = "numbers"
	price_label.font_size = 18
	price_label.colors.text = {
		255,
		255,
		255
	}
	price_label.text = "2"
	price_label.text_align = "left"
	self.tip_panel.price = price_label

	self.tip_panel:add_child(price_label)

	self.tip_panel.propagate_on_click = true
	self.tip_panel.hidden = true

	local tip_star = KImageView:new("Upgrades_Tips_Star")

	tip_star.pos = v(270, 10)
	self.tip_panel.star = tip_star

	self.tip_panel:add_child(tip_star)

	local max_upgrade_stars = UPGR:get_total_stars()
	local l_stars_num = math.min(screen_map.total_stars, max_upgrade_stars) - self.spent_stars

	screen_map.upgrade_star.hidden = l_stars_num == 0
	screen_map.upgrade_points.text = l_stars_num
	screen_map.upgrade_points.hidden = l_stars_num == 0
end

function UpgradesView:set_tip_panel(title, desc, price)
	if self.im_disabled then
		return
	end

	self.tip_panel.title.text = title
	self.tip_panel.price.text = price

	local d = self.tip_panel.desc

	d.text = desc

	local _w, lines = d:get_wrap_lines()

	self.tip_panel.size.y = d.pos.y + (lines + 1) * d.line_height * d:get_font_height()
	self.tip_panel.tip.pos = v(-14, self.tip_panel.size.y - 20)
	self.tip_panel.anchor = v(-15, self.tip_panel.size.y + 10)
	self.tip_panel.hidden = false

	self:update_tooltip_position()
end

function UpgradesView:hide_tip_panel()
	self.tip_panel.hidden = true
end

function UpgradesView:set_init_values(stars, init_list)
	self.max_stars = screen_map.total_stars
	self.orig_bought = {}

	for key, value in pairs(init_list) do
		self.orig_bought[key] = value
	end
end

function UpgradesView:update_tooltip_position()
	if not self.tip_panel.hidden then
		local mx, my = screen_map.window:get_mouse_position()

		self.tip_panel.pos = v(mx / screen_map.window.scale.x, my / screen_map.window.scale.y)
	end
end

function UpgradesView:update(dt)
	UpgradesView.super.update(self, dt)
	self:update_tooltip_position()
end

function UpgradesView:set_stars_and_check()
	local l_stars_num = screen_map.total_stars - self.spent_stars

	for key, value in pairs(self.upgrade_buttons) do
		local do_grey = true

		if self.bought_list[value.data_values.class] + 1 == value.data_values.level and not value.bought and l_stars_num >= value.data_values.price then
			do_grey = false
		end

		if not value.bought then
			if do_grey then
				value:grey_me()
			else
				value:ungrey_me()
			end
		end
	end

	if self.spent_stars > 0 then
		self.reset_button:enable()
	else
		self.reset_button:disable()
	end

	self.stars_label.text = l_stars_num
end

function UpgradesView:set_bought_levels(new_bought_list)
	self.bought_list = {}

	for key, value in pairs(new_bought_list) do
		self.bought_list[key] = value
	end

	for key, value in pairs(new_bought_list) do
		self.upgrade_bars[key].scale = v(1, 0.2 * value)
	end

	self.spent_stars = 0

	for key, value in pairs(self.upgrade_buttons) do
		if new_bought_list[value.data_values.class] >= value.data_values.level then
			self.spent_stars = self.spent_stars + value:set_bought()
		else
			value:grey_me()
		end
	end

	self:set_stars_and_check()

	screen_map.user_data.upgrades = new_bought_list

	storage:save_slot(screen_map.user_data)
end

function UpgradesView:rest_stars(stars_num)
	if stars_num > self.stars_label.text then
		return false
	else
		return true
	end
end

function UpgradesView:upgrade_bought(class, level, stars_num)
	self.undo_button:enable()

	self.bought_list[class] = level

	self:set_bought_levels(self.bought_list)
	self:set_stars_and_check()
end

function UpgradesView:show()
	self:set_init_values(screen_map.total_stars, screen_map.user_data.upgrades)
	UpgradesView.super.show(self)
end

function UpgradesView:hide()
	UpgradesView.super.hide(self)

	self.tip_panel.hidden = true
end

function UpgradesView:enable()
	UpgradesView.super.enable(self)

	self.im_disabled = false

	function self.close_button.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end

	function self.done_button.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end

	self.undo_button:disable()

	function self.undo_button.on_click(button, x, y)
		S:queue("GUIButtonCommon")
		self:set_bought_levels(self.orig_bought)
		self.undo_button:disable()
	end

	function self.reset_button.on_click(button, x, y)
		S:queue("GUIButtonCommon")

		none_bought = {}

		for _, k in pairs(UPGR.display_order) do
			none_bought[k] = 0
		end

		self.reset_button:disable()
		self.undo_button:disable()
		self:set_bought_levels(none_bought)
		self:set_init_values(self.max_stars, none_bought)
	end

	if self.spent_stars > 0 then
		self.reset_button:enable()
	else
		self.reset_button:disable()
	end

	self.undo_button:disable()
end

function UpgradesView:disable()
	UpgradesView.super.disable(self, false)

	self.im_disabled = true
	self.close_button.on_click = nil
	self.undo_button.on_click = nil
	self.done_button.on_click = nil
	self.reset_button.onclick = nil

	local max_upgrade_stars = UPGR:get_total_stars()
	local l_stars_num = math.min(screen_map.total_stars, max_upgrade_stars) - self.spent_stars

	screen_map.upgrade_star.hidden = l_stars_num == 0
	screen_map.upgrade_points.text = l_stars_num
	screen_map.upgrade_points.hidden = l_stars_num == 0
end

UpgradeButtons = class("UpgradeButtons", KImageView)

function UpgradeButtons:initialize(sprite, data_values, my_id)
	KImageView.initialize(self, sprite)

	self.my_id = my_id
	self.disabled_image = KImageView:new("Disabled_" .. sprite)

	self:add_child(self.disabled_image)

	self.data_values = data_values
	self.over_circle = KImageView:new("Upgrades_Icons_over")
	self.over_circle.anchor = v(self.over_circle.size.x / 2, self.over_circle.size.y / 2)
	self.over_circle.pos = v(self.size.x / 2, self.size.y / 2)
	self.over_circle.propagate_on_click = true

	self:add_child(self.over_circle)

	self.bought_circle = KImageView:new("Upgrades_Icons_Bought")
	self.bought_circle.anchor = v(self.bought_circle.size.x / 2, self.bought_circle.size.y / 2)
	self.bought_circle.pos = v(self.size.x / 2, self.size.y / 2)

	self:add_child(self.bought_circle)

	self.cost_panel = KImageView:new("Upgrades_Icons_PriceTag")
	self.cost_panel.pos = v(35, 55)

	self:add_child(self.cost_panel)

	local price_value = KImageView:new("Upgrades_Icons_PriceTag_Nm_000" .. data_values.price)

	price_value.anchor = v(price_value.size.x / 2, price_value.size.y / 2)
	price_value.pos = v(self.cost_panel.size.x / 2 + 4, self.cost_panel.size.y / 2)

	self.cost_panel:add_child(price_value)

	self.disabled_cost_panel = KImageView:new("Disabled_Upgrades_Icons_PriceTag")
	self.disabled_cost_panel.pos = v(35, 55)

	self:add_child(self.disabled_cost_panel)

	local disabled_price_value = KImageView:new("Disabled_Upgrades_Icons_PriceTag_Nm_000" .. data_values.price)

	disabled_price_value.anchor = v(disabled_price_value.size.x / 2, disabled_price_value.size.y / 2)
	disabled_price_value.pos = v(self.cost_panel.size.x / 2 + 4, self.cost_panel.size.y / 2)

	self.disabled_cost_panel:add_child(disabled_price_value)

	self.cost_panel.propagate_on_click = true
	self.disabled_cost_panel.propagate_on_click = true
	self.over_circle.hidden = true
	self.bought_circle.hidden = true
	self.bought = false
	self.grey_out = true
	self.cost_panel.hidden = true
end

function UpgradeButtons:on_enter()
	if not self.bought and not self.grey_out then
		self.over_circle.hidden = false
	end

	screen_map.upgrades:set_tip_panel(_(self.my_id .. "_NAME"), _(self.my_id .. "_DESCRIPTION"), self.data_values.price)
end

function UpgradeButtons:on_exit()
	self.over_circle.hidden = true

	screen_map.upgrades:hide_tip_panel()
end

function UpgradeButtons:grey_me()
	self.grey_out = true
	self.disabled_image.hidden = false
	self.cost_panel.hidden = true
	self.disabled_cost_panel.hidden = false
	self.bought = false
	self.bought_circle.hidden = true
	self.over_circle.hidden = true
end

function UpgradeButtons:ungrey_me()
	self.grey_out = false
	self.disabled_image.hidden = true
	self.cost_panel.hidden = false
	self.disabled_cost_panel.hidden = true
	self.bought = false
	self.bought_circle.hidden = true
	self.over_circle.hidden = true
end

function UpgradeButtons:on_click(button, x, y)
	if not self.grey_out and not self.bought and screen_map.upgrades:rest_stars(self.data_values.price) then
		S:queue("GUIBuyUpgrade")
		screen_map.upgrades:hide_tip_panel()
		self:set_bought()
		screen_map.upgrades:upgrade_bought(self.data_values.class, self.data_values.level, self.data_values.price)

		self.explotion = KImageView:new()
		self.explotion.pos = v(-17.5, -17.5)
		self.explotion.animation = {
			to = 18,
			prefix = "Upgrades_Icons_buyFx",
			from = 1
		}
		self.explotion.ts = 0

		self:add_child(self.explotion)
		timer:tween(0.6, nil, {}, "linear", function()
			self:remove_child(self.explotion)

			self.explotion = nil
		end)
	end
end

function UpgradeButtons:set_bought()
	self.cost_panel.hidden = true
	self.disabled_cost_panel.hidden = true
	self.bought = true
	self.bought_circle.hidden = false
	self.over_circle.hidden = true
	self.disabled_image.hidden = true

	return self.data_values.price
end

EncyclopediaTabLabel = class("EncyclopediaTabLabel", GGShaderLabel)

function EncyclopediaTabLabel:initialize(text, selected, rotation)
	GGShaderLabel.initialize(self, V.v(62, 18))

	self.font_name = CJK("body", nil, nil, "h_noti")
	self.font_size = 16
	self.font_align = "center"
	self.anchor.x, self.anchor.y = self.size.x / 2, self.size.y / 2
	self.r = rotation or 4 * math.pi / 180
	self.text = text
	self.fit_lines = 1
	self.shaders = {
		"p_glow"
	}

	if selected then
		self.colors.text = {
			224,
			242,
			253,
			255
		}
		self.shader_args = {
			{
				thickness = 2,
				glow_color = {
					0.03137254901960784,
					0.12549019607843137,
					0.1803921568627451,
					1
				}
			}
		}
	else
		self.shader_args = {
			{
				thickness = 2,
				glow_color = {
					0.29411764705882354,
					0.13725490196078433,
					0.06666666666666667,
					1
				}
			}
		}
		self.colors.text = {
			198,
			134,
			95,
			255
		}
	end
end

EncyclopediaView = class("EncyclopediaView", PopUpView)

function EncyclopediaView:initialize(sw, sh)
	PopUpView.initialize(self, V.v(sw, sh))

	self.back = KView:new(V.v(sw, sh))
	self.back.pos = v(0, 0)
	self.back.anchor = v(sw / 2, sh / 2)

	self:add_child(self.back)

	self.back.alpha = 0

	local hf = sw / 2 - 700

	self.hf = hf
	self.tower_button = KImageButton:new("encyclopedia_buttons_notxt_0002", "encyclopedia_buttons_notxt_0003", "encyclopedia_buttons_notxt_0003")
	self.tower_button.pos = v(hf + 300, 100)

	self.back:add_child(self.tower_button)

	self.tower_button.hidden = true

	function self.tower_button.on_click()
		S:queue("GUIButtonCommon")

		self.enemies_button.hidden = false
		self.enemies_selected.hidden = true
		self.tower_selected.hidden = false
		self.tower_button.hidden = true

		self:load_towers()
	end

	local tl = EncyclopediaTabLabel:new(_("Towers"), false)

	tl.pos.x, tl.pos.y = 56, 86

	self.tower_button:add_child(tl)

	self.tower_selected = KImageView:new("encyclopedia_buttons_notxt_0001")
	self.tower_selected.pos = v(hf + 300, 100)

	self.back:add_child(self.tower_selected)

	local tl = EncyclopediaTabLabel:new(_("Towers"), true)

	tl.pos.x, tl.pos.y = 56, ISW(81, "zh-Hans", 81)

	self.tower_selected:add_child(tl)

	self.enemies_button = KImageButton:new("encyclopedia_buttons_notxt_0005", "encyclopedia_buttons_notxt_0006", "encyclopedia_buttons_notxt_0006")
	self.enemies_button.pos = v(hf + 400, 90)

	self.back:add_child(self.enemies_button)

	function self.enemies_button.on_click()
		S:queue("GUIButtonCommon")

		self.enemies_button.hidden = true
		self.enemies_selected.hidden = false
		self.tower_selected.hidden = true
		self.tower_button.hidden = false

		self:load_creeps(1)

		if self.right_panel then
			self.back:remove_child(self.right_panel)

			self.right_panel = nil
		end

		self:detail_creep(1)
	end

	local tl = EncyclopediaTabLabel:new(_("Enemies"), false, 2 * math.pi / 180)

	tl.pos.x, tl.pos.y = 56, ISW(88, "zh-Hans", 90)

	self.enemies_button:add_child(tl)

	self.enemies_selected = KImageView:new("encyclopedia_buttons_notxt_0004")
	self.enemies_selected.pos = v(hf + 400, 90)

	self.back:add_child(self.enemies_selected)

	self.enemies_selected.hidden = true

	local tl = EncyclopediaTabLabel:new(_("Enemies"), true, 2 * math.pi / 180)

	tl.pos.x, tl.pos.y = 56, 81

	self.enemies_selected:add_child(tl)

	self.backback = KImageView:new("encyclopedia_bg")
	self.backback.anchor = v(self.backback.size.x / 2, self.backback.size.y / 2)
	self.backback.pos = v(sw / 2, sh / 2)

	self.back:add_child(self.backback)

	local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

	close_button.pos = v(self.backback.size.x - 52, 16)
	self.close_button = close_button

	self.backback:add_child(close_button)

	function self.close_button.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end
end

function EncyclopediaView:show()
	EncyclopediaView.super.show(self)

	local user_data = storage:load_slot()

	E:load()
	UPGR:set_levels(user_data.upgrades)
	DI:set_level(screen_map.user_data.difficulty)
	UPGR:patch_templates(5)
	DI:patch_templates()
	self:load_towers()

	self.enemies_button.hidden = false
	self.enemies_selected.hidden = true
	self.tower_selected.hidden = false
	self.tower_button.hidden = true
end

function EncyclopediaView:load_towers()
	if self.creep then
		self.creep.hidden = true
	end

	if self.towers then
		self.towers.hidden = false
		self.over_sprite = KImageView:new("encyclopedia_tower_thumbs_0022")
		self.over_sprite.hidden = true
		self.over_sprite.anchor = v(self.over_sprite.size.x / 2, self.over_sprite.size.y / 2)
		self.over_sprite.propagate_on_click = true

		self.towers:add_child(self.over_sprite)
		self:detail_tower(1)

		self.select_sprite.pos = v(50, 150)
		self.select_sprite.hidden = false

		return
	end

	self.towers = KView:new(V.v(366, 444))
	self.towers.pos = v(self.hf + 310, 200)

	self.back:add_child(self.towers)

	local title = GGLabel:new(V.v(self.towers.size.x, 70))

	title.pos.y = 32
	title.font_name = "h_book"
	title.font_size = 40
	title.font_align = "center"
	title.colors.text = {
		100,
		89,
		51,
		255
	}
	title.text = _("Towers")

	self.towers:add_child(title)

	local title_w = title:get_text_width(title.text)
	local deco_y = 60
	local left_deco = KImageView:new("encyclopedia_rightArt")

	left_deco.pos = v(self.towers.size.x / 2 - title_w / 2 - 10, deco_y)
	left_deco.anchor = v(left_deco.size.x, left_deco.size.y / 2)

	self.towers:add_child(left_deco)

	local right_deco = KImageView:new("encyclopedia_rightArt")

	right_deco.pos = v(self.towers.size.x / 2 + title_w / 2 + 13, deco_y)
	right_deco.anchor = v(right_deco.size.x, right_deco.size.y / 2)
	right_deco.scale.x = -1

	self.towers:add_child(right_deco)

	local st1 = GGLabel:new(V.v(self.towers.size.x, 24))

	st1.pos.y = 88
	st1.font_name = "body"
	st1.font_size = 15
	st1.font_align = "center"
	st1.colors.text = {
		100,
		89,
		51,
		255
	}
	st1.text = _("Basic")

	self.towers:add_child(st1)

	local st2 = GGLabel:new(V.v(self.towers.size.x, 24))

	st2.pos.y = 363
	st2.font_name = "body"
	st2.font_size = 15
	st2.font_align = "center"
	st2.colors.text = {
		100,
		89,
		51,
		255
	}
	st2.text = _("Advanced")

	self.towers:add_child(st2)

	self.over_sprite = KImageView:new("encyclopedia_tower_thumbs_0022")
	self.select_sprite = KImageView:new("encyclopedia_tower_thumbs_0023")
	self.select_sprite.pos = v(50, 150)
	self.select_sprite.hidden = false

	for i = 1, 20 do
		local icon_idx = screen_map.tower_data[i].icon or i
		local icon = string.format(GS.encyclopedia_tower_thumb_fmt, icon_idx)
		local off_y = i <= 12 and 150 or 170

		self:create_tower(icon, v(math.fmod(i - 1, 4) * 88 + 50, math.floor((i - 1) / 4) * 85 + off_y), i, true)
	end

	self.towers:add_child(self.over_sprite)

	self.over_sprite.hidden = true
	self.over_sprite.anchor = v(self.over_sprite.size.x / 2, self.over_sprite.size.y / 2)
	self.over_sprite.propagate_on_click = true

	self.towers:add_child(self.select_sprite)

	self.select_sprite.pos = v(50, 150)
	self.select_sprite.anchor = v(self.select_sprite.size.x / 2, self.select_sprite.size.y / 2)
	self.select_sprite.hidden = false

	self:detail_tower(1)
end

function EncyclopediaView:create_tower(icon, pos, information, enabled)
	if information <= 4 or screen_map.user_data.seen[screen_map.tower_data[information].name] then
		local tower = KButton:new()

		tower:set_image(icon)

		tower.anchor = v(tower.size.x / 2, tower.size.y / 2)
		tower.pos = pos

		self.towers:add_child(tower)

		function tower.on_enter()
			self:update_over_sprite(tower.pos)
		end

		function tower.on_exit()
			self:remove_over_sprite()
		end

		function tower.on_click()
			S:queue("GUINotificationPaperOver")
			self:tower_clicked(information, pos)
		end
	else
		local tower = KImageView:new("encyclopedia_tower_thumbs_0021")

		tower.anchor = v(tower.size.x / 2, tower.size.y / 2)
		tower.pos = pos

		self.towers:add_child(tower)
	end
end

function EncyclopediaView:update_over_sprite(pos)
	self.over_sprite.hidden = false
	self.over_sprite.pos = pos
end

function EncyclopediaView:remove_over_sprite()
	self.over_sprite.hidden = true
end

function EncyclopediaView:tower_clicked(information, pos)
	self.select_sprite.hidden = false
	self.select_sprite.pos = pos

	self:detail_tower(information)
end

function EncyclopediaView:detail_tower(index)
	if self.right_panel then
		self.back:remove_child(self.right_panel)

		self.right_panel = nil
	end

	self.right_panel = KView:new(V.v(600, 700))
	self.right_panel.pos = v(self.sw / 2 - 30, 200)
	self.right_panel.propagate_on_click = true

	self.back:add_child(self.right_panel)

	local tower_name = screen_map.tower_data[index].name
	local dt = E:create_entity(tower_name)
	local di = dt.info.fn(dt)
	local title_label = GGLabel:new(V.v(280, 50))

	title_label.pos = v(300, 44)
	title_label.anchor.x = title_label.size.x / 2
	title_label.font_name = "h_book"
	title_label.font_size = 22
	title_label.colors.text = {
		148,
		94,
		58
	}
	title_label.text = _(string.upper(dt.info.i18n_key or tower_name) .. "_NAME")
	title_label.text_align = "center"
	title_label.fit_lines = 1

	local title_width, _w = title_label:get_wrap_lines()

	self.right_panel:add_child(title_label)

	local left_decoration = KImageView:new("encyclopedia_rightArt")

	left_decoration.pos = v(300 - title_width / 2 - 10, 60)
	left_decoration.anchor = v(left_decoration.size.x, left_decoration.size.y / 2)
	left_decoration.scale.x = 0.7

	self.right_panel:add_child(left_decoration)

	local right_decoration = KImageView:new("encyclopedia_rightArt")

	right_decoration.pos = v(300 + title_width / 2 + 10, 60)
	right_decoration.anchor = v(left_decoration.size.x, right_decoration.size.y / 2)
	right_decoration.scale.x = -0.7

	self.right_panel:add_child(right_decoration)

	local portrait = KImageView:new(string.format(GS.encyclopedia_tower_fmt, screen_map.tower_data[index].icon or index))

	portrait.anchor = v(portrait.size.x / 2, portrait.size.y / 2)
	portrait.pos = v(300, 175)
	portrait.scale = v(0.7, 0.708)

	self.right_panel:add_child(portrait)

	local over_portrait = KImageView:new("encyclopedia_frame")

	over_portrait.anchor = v(over_portrait.size.x / 2, over_portrait.size.y / 2)
	over_portrait.pos = v(300, 175)

	self.right_panel:add_child(over_portrait)

	local desc_label = GGLabel:new(V.v(330, 50))

	desc_label.pos = v(300, 280)
	desc_label.anchor = v(165, 0)
	desc_label.font_name = "body"
	desc_label.font_size = 16
	desc_label.line_height = CJK(0.85, nil, 1.1, 0.9)
	desc_label.colors.text = {
		0,
		0,
		0
	}
	desc_label.text = _(string.upper(dt.info.i18n_key or tower_name) .. "_DESCRIPTION")
	desc_label.text_align = "center"
	desc_label.fit_lines = 4

	self.right_panel:add_child(desc_label)

	local frame = KImageView:new("encyclopedia_rightPages_0001")

	frame.anchor = v(frame.size.x / 2, 0)
	frame.pos = v(305, 352)

	self.right_panel:add_child(frame)

	local icons_list = {
		reload = 5,
		armor = 2,
		range = 6,
		health = 1,
		respawn = 4,
		dmg = 3,
		mdmg = 7
	}
	local stats_list

	if di.type == STATS_TYPE_TOWER_BARRACK then
		stats_list = {
			"health",
			"dmg",
			"armor",
			"respawn"
		}
	elseif di.type == STATS_TYPE_TOWER_MAGE then
		stats_list = {
			"mdmg",
			"reload",
			"range"
		}
	else
		stats_list = {
			"dmg",
			"reload",
			"range"
		}
	end

	local mx = 200
	local my = 380

	for i, v in pairs(stats_list) do
		local icon = KImageView:new("encyclopedia_icons_00" .. string.format("%02i", icons_list[v]))

		icon.pos = V.v(mx, my)
		icon.anchor = V.v(icon.size.x / 2, icon.size.y / 2)

		self.right_panel:add_child(icon)

		local lwidth = #stats_list == 3 and i == 3 and 180 or 85
		local label = GGLabel:new(V.v(lwidth, 25))

		label.pos = V.v(mx + 20, my - 10)
		label.font_name = "body"
		label.font_size = 15
		label.text_align = "left"
		label.vertical_align = "middle"
		label.line_height = 0.75

		if v == "health" then
			label.text = di.hp_max
		elseif v == "armor" then
			label.text = GU.armor_value_desc(di.armor)
		elseif v == "dmg" or v == "mdmg" then
			label.text = di.damage_min .. "-" .. di.damage_max
		elseif v == "respawn" then
			label.text = string.format(_("%i sec."), di.respawn)
		elseif v == "reload" then
			label.text = GU.cooldown_value_desc(di.cooldown)
		elseif v == "range" then
			label.text = GU.range_value_desc(di.range)
		end

		label.fit_lines = 2

		self.right_panel:add_child(label)

		mx = mx + 125

		if mx > 400 then
			mx = 200
			my = 420
		end
	end

	if dt.powers then
		local specials = GGLabel:new(V.v(190, 26))

		specials.pos = v(300, 462)
		specials.anchor.x = specials.size.x / 2
		specials.text = _("Specials")
		specials.font_name = "h_book"
		specials.font_size = 20
		specials.text_align = "center"
		specials.colors.text = {
			116,
			105,
			66,
			255
		}
		specials.fit_lines = 1

		self.right_panel:add_child(specials)

		local title_w = specials:get_text_width(specials.text)
		local left_deco = KImageView:new("encyclopedia_rightArt")

		left_deco.pos = v(self.right_panel.size.x / 2 - title_w / 2 - 10, specials.pos.y + 16)
		left_deco.anchor = v(left_deco.size.x, left_deco.size.y / 2)
		left_deco.alpha = 0.6
		left_deco.scale.x = 0.7

		self.right_panel:add_child(left_deco)

		local right_deco = KImageView:new("encyclopedia_rightArt")

		right_deco.pos = v(self.right_panel.size.x / 2 + title_w / 2 + 13, specials.pos.y + 16)
		right_deco.anchor = v(right_deco.size.x, right_deco.size.y / 2)
		right_deco.alpha = 0.6
		right_deco.scale.x = -0.7

		self.right_panel:add_child(right_deco)

		local power_names = {}

		for k, v in pairs(dt.powers) do
			table.insert(power_names, k)
		end

		table.sort(power_names)

		local tw = 360
		local iw = math.ceil(tw / #power_names)

		for i, k in pairs(power_names) do
			local power = dt.powers[k]
			local px = 120 + (2 * i - 1) * iw / 2
			local icon = KImageView:new(string.format("encyclopedia_tower_specials_%04i", power.enc_icon))

			icon.pos = v(px, 515)
			icon.anchor = v(icon.size.x / 2, icon.size.y / 2)

			self.right_panel:add_child(icon)

			local label = GGLabel:new(V.v(tw / #power_names, 50))

			label.pos = v(px, 535)
			label.anchor = v(label.size.x / 2, 0)
			label.font_name = "body"
			label.font_size = 14
			label.line_height = 0.85
			label.colors.text = {
				0,
				0,
				0
			}
			label.text = _(string.upper(string.format("%s_%s_NAME", dt.info.i18n_key or tower_name, power.name or k)))
			label.text_align = "center"
			label.fit_lines = 2

			self.right_panel:add_child(label)
		end
	end
end

function EncyclopediaView:load_creeps(index)
	if self.creep then
		self.back:remove_child(self.creep)
	end

	if self.towers then
		self.towers.hidden = true
		self.select_sprite.hidden = true
	end

	self.creep = KView:new(V.v(372, 444))
	self.creep.pos = v(self.hf + 310, 200)

	self.back:add_child(self.creep)

	self.over_sprite = KImageView:new("encyclopedia_creep_thumbs_over")
	self.select_sprite2 = KImageView:new("encyclopedia_creep_thumbs_selected")

	local title = GGLabel:new(V.v(self.creep.size.x, 70))

	title.pos.y = 32
	title.font_name = "h_book"
	title.font_size = 40
	title.font_align = "center"
	title.colors.text = {
		100,
		89,
		51,
		255
	}
	title.text = _("Enemies")

	self.creep:add_child(title)

	local title_w = title:get_text_width(title.text)
	local deco_y = 60
	local left_deco = KImageView:new("encyclopedia_rightArt")

	left_deco.pos = v(self.creep.size.x / 2 - title_w / 2 - 10, deco_y)
	left_deco.anchor = v(left_deco.size.x, left_deco.size.y / 2)

	self.creep:add_child(left_deco)

	local right_deco = KImageView:new("encyclopedia_rightArt")

	right_deco.pos = v(self.creep.size.x / 2 + title_w / 2 + 13, deco_y)
	right_deco.anchor = v(right_deco.size.x, right_deco.size.y / 2)
	right_deco.scale.x = -1

	self.creep:add_child(right_deco)

	local creeps_per_page = 36
	local creeps_data = GS.encyclopedia_enemies
	local max_creeps = #creeps_data

	for d = 1, creeps_per_page do
		local i = d + creeps_per_page * (index - 1)

		if i <= max_creeps then
			local t = E:get_template(creeps_data[i].name)
			local icon = string.format(GS.encyclopedia_enemy_thumb_fmt, t.info.enc_icon)

			self:create_creep(icon, v(math.fmod(d - 1, 6) * 63 + 35, math.floor((d - 1) / 6) * 63 + 140), i, true)
		end
	end

	self.creep:add_child(self.over_sprite)

	self.over_sprite.hidden = true
	self.over_sprite.anchor = v(self.over_sprite.size.x / 2, self.over_sprite.size.y / 2)
	self.over_sprite.propagate_on_click = true

	self.creep:add_child(self.select_sprite2)

	self.select_sprite2.anchor = v(self.select_sprite2.size.x / 2, self.select_sprite2.size.y / 2)
	self.select_sprite2.hidden = false
	self.select_sprite2.pos = v(35, 140)
	self.page_buttons = {}

	local total_pages = math.ceil(max_creeps / creeps_per_page)
	local boffset = 40
	local bx, by = 192 - 40 * (total_pages - 1) / 2, 530

	for i = 1, total_pages do
		if i == index then
			local b = KImageView:new("encyclopedia_pageNbrSelected_000" .. i)

			b.anchor = v(b.size.x / 2, b.size.y / 2)
			b.pos = v(bx + boffset * (i - 1), by)

			self.creep:add_child(b)
			table.insert(self.page_buttons, b)
		else
			local b = KImageButton:new("encyclopedia_pageNbr_000" .. i, "encyclopedia_pageNbrOver_000" .. i, "encyclopedia_pageNbrSelected_000" .. i)

			b.anchor = v(b.size.x / 2, b.size.y / 2)
			b.pos = v(bx + boffset * (i - 1), by)

			function b.on_click(this, button, x, y)
				local this_idx = i

				S:queue("GUIButtonCommon")
				self:load_creeps(this_idx)
			end

			self.creep:add_child(b)
			table.insert(self.page_buttons, b)
		end
	end

	local first_creep = creeps_data[(index - 1) * creeps_per_page + 1]

	if first_creep and screen_map.user_data.seen[first_creep.name] then
		self:detail_creep((index - 1) * creeps_per_page + 1)
	else
		self.select_sprite2.hidden = true
	end
end

function EncyclopediaView:create_creep(icon, pos, information, enabled)
	if not screen_map.user_data.seen then
		screen_map.user_data.seen = {}
	end

	local creep_data = GS.encyclopedia_enemies[information]
	local t = E:get_template(creep_data.name)

	if creep_data.always_shown or screen_map.user_data.seen[creep_data.name] then
		local b = KButton:new()

		b:set_image(icon)

		b.anchor = v(b.size.x / 2, b.size.y / 2)
		b.pos = pos

		self.creep:add_child(b)

		function b.on_enter()
			self:update_over_sprite(b.pos)
		end

		function b.on_exit()
			self:remove_over_sprite()
		end

		function b.on_click()
			S:queue("GUINotificationPaperOver")
			self:creep_clicked(information, pos)
		end
	else
		local b = KImageView:new("encyclopedia_creep_thumbs_0049")

		b.anchor = v(b.size.x / 2, b.size.y / 2)
		b.pos = pos

		self.creep:add_child(b)
	end
end

function EncyclopediaView:creep_clicked(information, pos)
	self.select_sprite2.hidden = false
	self.select_sprite2.pos = pos

	self:detail_creep(information)
end

function EncyclopediaView:detail_creep(index)
	if self.right_panel then
		self.back:remove_child(self.right_panel)

		self.right_panel = nil
	end

	self.right_panel = KView:new(V.v(600, 700))
	self.right_panel.propagate_on_click = true
	self.right_panel.pos = v(self.sw / 2 - 30, 200)

	self.back:add_child(self.right_panel)

	local creep_data = GS.encyclopedia_enemies[index]
	local ce = E:create_entity(creep_data.name)
	local name_prefix = ce.info.i18n_key or string.upper(creep_data.name)
	local title_label = GGLabel:new(V.v(280, 50))

	title_label.pos = v(300, 44)
	title_label.anchor.x = title_label.size.x / 2
	title_label.font_name = "h_book"
	title_label.font_size = 22
	title_label.colors.text = {
		148,
		94,
		58
	}
	title_label.text = _(name_prefix .. "_NAME")
	title_label.text_align = "center"
	title_label.fit_lines = 1

	local title_width, _w = title_label:get_wrap_lines()

	self.right_panel:add_child(title_label)

	local left_decoration = KImageView:new("encyclopedia_rightArt")

	left_decoration.pos = v(300 - title_width / 2 - 10, 60)
	left_decoration.anchor = v(left_decoration.size.x, left_decoration.size.y / 2)
	left_decoration.scale.x = 0.7

	self.right_panel:add_child(left_decoration)

	local right_decoration = KImageView:new("encyclopedia_rightArt")

	right_decoration.pos = v(300 + title_width / 2 + 10, 60)
	right_decoration.anchor = v(left_decoration.size.x, right_decoration.size.y / 2)
	right_decoration.scale.x = -0.7

	self.right_panel:add_child(right_decoration)

	local portrait = KImageView:new(string.format(GS.encyclopedia_enemy_fmt, ce.info.enc_icon))

	portrait.anchor = v(portrait.size.x / 2, portrait.size.y / 2)
	portrait.pos = v(300, 175)
	portrait.scale = v(0.7, 0.708)

	self.right_panel:add_child(portrait)

	local over_portrait = KImageView:new("encyclopedia_frame")

	over_portrait.anchor = v(over_portrait.size.x / 2, over_portrait.size.y / 2)
	over_portrait.pos = v(300, 175)

	self.right_panel:add_child(over_portrait)

	local desc_label = GGLabel:new(V.v(330, 50))

	desc_label.pos = v(300, 280)
	desc_label.anchor = v(165, 0)
	desc_label.font_name = "body"
	desc_label.font_size = 16
	desc_label.line_height = CJK(1, nil, 1.1, 0.9)
	desc_label.colors.text = {
		0,
		0,
		0
	}
	desc_label.text = _(name_prefix .. "_DESCRIPTION")
	desc_label.text_align = "center"
	desc_label.fit_lines = 4

	self.right_panel:add_child(desc_label)

	local frame = KImageView:new("encyclopedia_rightPages_0002")

	frame.anchor = v(frame.size.x / 2, 0)
	frame.pos = v(305, 360)

	self.right_panel:add_child(frame)

	local mx = 205
	local my = 380
	local ci = ce.info.fn(ce)
	local skill_table = {
		ci.hp_max,
		GU.damage_value_desc(ci.damage_min, ci.damage_max),
		GU.armor_value_desc(ci.armor),
		GU.armor_value_desc(ci.magic_armor),
		GU.speed_value_desc(ce.motion.max_speed),
		(GU.lives_desc(ci.lives))
	}

	for i = 1, 6 do
		local desc_label = GGLabel:new(V.v(90, 50))

		desc_label.pos = v(mx + 20, my - 5)
		desc_label.anchor = v(0, 2)
		desc_label.font_name = "body"
		desc_label.font_size = 15
		desc_label.line_height = 2
		desc_label.text = skill_table[i]
		desc_label.text_align = "left"
		desc_label.fit_lines = 1

		self.right_panel:add_child(desc_label)

		mx = mx + 130

		if mx > 400 then
			mx = 200
			my = my + 30
		end
	end

	local special_key = string.upper(creep_data.name) .. "_SPECIAL"
	local special = _(special_key)

	if special == special_key then
		special = ""
	end

	local special_frame = KImageView:new("encyclopedia_rightPages_0004")

	special_frame.anchor.x = special_frame.size.x / 2
	special_frame.pos = v(300, 390)
	special_frame.scale = v(0.75, 0.75)

	self.right_panel:add_child(special_frame)

	if string.len(special) == 0 then
		special_frame.hidden = true
	end

	local desc_label = GGLabel:new(V.v(400, 22))

	desc_label.pos = v(300, 506)
	desc_label.anchor = v(desc_label.size.x / 2, 0)
	desc_label.font_name = "body"
	desc_label.font_size = 15
	desc_label.text = special
	desc_label.text_align = "center"
	desc_label.colors.text = {
		148,
		94,
		58
	}
	desc_label.vertical_align = "middle"
	desc_label.fit_lines = 1

	self.right_panel:add_child(desc_label)
end

HeroNameLabel = class("HeroNameLabel", KView)

function HeroNameLabel:initialize(size)
	HeroNameLabel.super.initialize(self, size or self.size)

	self.labels = {}
	self.hero_name_config = map_data.hero_names_config
end

function HeroNameLabel:set_hero(hero_name, hero_i18n_key)
	local conf = self.hero_name_config[hero_name] or self.hero_name_config.default
	local text = _(string.upper(hero_i18n_key or hero_name) .. "_NAME")

	for _, s in pairs({
		"・",
		"·"
	}) do
		text = string.gsub(text, s, " ")
	end

	local parts = conf.single_line and {
		text
	} or string.split(text, " ")
	local labels = self.labels
	local fs = conf.font_size or #parts > 2 and 28 or #parts > 1 and (IS_KR1 and 38 or 44) or IS_KR1 and 64 or 70

	if #labels < #parts then
		for i = #labels + 1, #parts do
			local l = GGShaderLabel:new(self.size)

			self:add_child(l)

			labels[i] = l
			l.font_name = IS_KR1 and "hero_name_label_kr1" or "hero_name_label"
			l.shaders = {
				"p_bands",
				"p_outline",
				"p_glow",
				"p_drop_shadow"
			}
			l.fit_lines = 1

			if IS_KR1 then
				l.shader_margin = math.ceil(0.35 * self.size.x)
			end
		end
	end

	for i = 1, #labels do
		local l = labels[i]

		l.hidden = true
	end

	local longest_idx = 1

	for i = 1, #parts do
		if utf8.len(parts[i]) > utf8.len(parts[longest_idx]) then
			longest_idx = i
		end
	end

	local longest_l = labels[longest_idx]

	longest_l.text = parts[longest_idx]

	longest_l:do_fit_lines(1, fs)

	longest_l.size.y = longest_l:get_font_height()

	local bl = longest_l:get_font_baseline()

	for i = 1, #parts do
		local l = labels[i]

		if i ~= longest_idx then
			l.text = parts[i]
			l.font_size = longest_l:get_fitted_font_size()
		end

		l.size.y = longest_l.size.y
		l.text_size.y = longest_l.size.y
		l.hidden = nil
		l.pos.y = self.size.y - bl - (#parts - i) * longest_l.size.y
		l.shader_args = conf.shader_args

		l:redraw()
	end
end

if IS_KR1 then
	HeroStatDots = class("HeroStatDots", KView)

	function HeroStatDots:initialize()
		HeroStatDots.super.initialize(self, size)

		self.dots_per_second = 20

		for i = 1, 8 do
			local d = KImageView:new("heroroom_buttons")

			d.pos.x = (i - 1) * 20

			self:add_child(d)
		end
	end

	function HeroStatDots:set(value, animated)
		if animated then
			self.dest_value = value
			self.value = 0
			self.ts = 0

			for i, c in ipairs(self.children) do
				c.hidden = true
			end
		else
			self.dest_value = value
			self.value = value

			for i, c in ipairs(self.children) do
				c.hidden = value < i
			end
		end
	end

	function HeroStatDots:update(dt)
		HeroStatDots.super.update(self, dt)

		if self.value < self.dest_value then
			local on_count = km.clamp(0, self.dest_value, math.floor(self.ts * self.dots_per_second))

			self.value = on_count

			for i, c in ipairs(self.children) do
				c.hidden = on_count < i
			end
		end
	end

	HPAni = class("HPAni", KView)
	HPAni.static.init_arg_names = {
		"image_name"
	}

	function HPAni:initialize(image_name)
		HPAni.super.initialize(self, nil, image_name)

		self.propagate_on_click = true
		self.propagate_on_down = true
		self.propagate_on_up = true
		self.propagate_on_enter = true
		self.propagate_on_exit = true
	end

	function HPAni:update(dt)
		if self.animation then
			local fn, runs = self:animation_frame(self.animation, self.ts, self.loop, self.fps)

			if runs >= 1 and self.loop_wait then
				local t1, t2

				if type(self.loop_wait) == "table" then
					t1, t2 = unpack(self.loop_wait)
				else
					t1, t2 = self.loop_wait, self.loop_wait
				end

				self.ts = -1 * (t1 + math.random() * (t2 - t1))
			end

			if self.loop_wait_hidden then
				self.hidden = self.ts < 0
			end
		end

		local aa = self.ani_alpha

		if aa and aa[1] then
			local t = self.ani_alpha_loop and self.ts % aa[#aa][1] or self.ts
			local t1, v1 = unpack(aa[1])
			local t2, v2 = t1, v1

			for _, p in pairs(aa) do
				t2, v2 = unpack(p)

				if t < t1 then
					self.alpha = v1

					break
				elseif t1 <= t and t < t2 then
					local phase = (t - t1) / (t2 - t1)

					self.alpha = U.ease_value(v1, v2, phase)

					break
				else
					self.alpha = v2
				end

				t1, v1 = t2, v2
			end
		end

		HPAni.super.update(self, dt)
	end

	HeroRoomViewKR1 = class("HeroRoomViewKR1", PopUpView)

	function HeroRoomViewKR1:initialize(size)
		HeroRoomViewKR1.super.initialize(self, size)

		local ht = self:get_child_by_id("hero_thumbs")
		local last_level = #screen_map.user_data.levels

		for i, d in ipairs(screen_map.hero_data) do
			local tpos = V.v((i - 1) % 5 * 75, math.floor((i - 1) / 5) * 77)

			if i > 10 then
				tpos.x = tpos.x + 75
			end

			local v2

			if last_level < d.available_level then
				local v1 = KImageView:new(string.format("heroroom_thumbs__off_%04d", d.thumb))

				v2 = KImageView:new("heroroom_portraitsLock")
				v1.pos = tpos
				v2.pos = tpos

				ht:add_child(v1)
				ht:add_child(v2)
			else
				v2 = KImageView:new(string.format("heroroom_thumbs_%04d", d.thumb))
				v2.pos = tpos

				ht:add_child(v2)
			end

			v2.id = d.name

			function v2.on_click(this)
				S:queue("GUIQuickMenuOpen")
				self:show_hero(this.id)
			end

			function v2.on_enter(this)
				self.hover_image.pos = this.pos
				self.hover_image.hidden = false
			end

			function v2.on_exit(this)
				self.hover_image.hidden = true
			end
		end

		self.check_image = KImageView("heroroom_thumbs_0010")
		self.border_image = KImageView("heroroom_thumbs_0009")
		self.hover_image = KImageView("heroroom_thumbs_0008")
		self.check_image.hidden = true
		self.border_image.hidden = true
		self.hover_image.hidden = true
		self.check_image.not_thumb = true
		self.border_image.not_thumb = true
		self.hover_image.not_thumb = true

		ht:add_child(self.check_image)
		ht:add_child(self.border_image)
		ht:add_child(self.hover_image)

		local bs = self:get_child_by_id("hero_room_sel_select")
		local bd = self:get_child_by_id("hero_room_sel_deselect")

		function bs.on_click(this)
			S:queue("GUIBuyUpgrade")
			self:select_hero(self.hero_shown)
		end

		function bd.on_click(this)
			S:queue("GUIBuyUpgrade")
			self:deselect_hero(self.hero_shown)
		end

		self:get_child_by_id("close_button").on_click = function()
			S:queue("GUIButtonCommon")
			self:hide()
		end
		self:get_child_by_id("done_button").on_click = self:get_child_by_id("close_button").on_click

		local selected_name = screen_map.user_data.heroes.selected

		if selected_name and not get_hero_index(selected_name) then
			selected_name = nil
		end

		self:show_hero(selected_name or "hero_gerald")

		if selected_name then
			self:select_hero(selected_name, true)
		end

		if selected_name and get_hero_index(selected_name) then
			local hd = screen_map.hero_data[get_hero_index(selected_name)]

			screen_map.hero_icon_portrait:set_image(string.format("mapButtons_portrait_hero_%04i", hd.icon))
		else
			screen_map.hero_icon_portrait:set_image("mapButtons_portrait_hero_0010")
		end
	end

	function HeroRoomViewKR1:show_hero(name)
		self.hero_shown = name

		local hd = screen_map.hero_data[get_hero_index(name)]
		local ht = E:get_template(hd.name)
		local th = self:get_child_by_id(name)

		self.border_image.pos = th.pos
		self.border_image.hidden = false

		local hp = self:get_child_by_id("hero_portraits")

		for _, c in pairs(hp.children) do
			local name_img = c:get_child_by_id("name_img")

			if name_img then
				c.hidden = c.id ~= "portrait_" .. name
				name_img.hidden = i18n.current_locale ~= "en"
			end
		end

		local lt = self:get_child_by_id("portrait_hero_name_label")

		lt:set_hero(name, ht.info.i18n_key)

		lt.hidden = i18n.current_locale == "en"

		local ll = self:get_child_by_id("hero_room_sel_locked")
		local bs = self:get_child_by_id("hero_room_sel_select")
		local bd = self:get_child_by_id("hero_room_sel_deselect")

		if hd.available_level > #screen_map.user_data.levels then
			ll.hidden = false
			ll.text = string.format(_("MAP_HERO_ROOM_UNLOCK"), hd.available_level)
			bs.hidden = true
			bd.hidden = true
		else
			ll.hidden = true

			if screen_map.user_data.heroes.selected == name then
				bs.hidden = true
				bd.hidden = false
			else
				bs.hidden = false
				bd.hidden = true
			end
		end

		self:get_child_by_id("skills_bio_desc").text = _(ht.info.i18n_key .. "_DESCRIPTION")
		self:get_child_by_id("skills_spec_desc").text = _(ht.info.i18n_key .. "_SPECIAL")

		for i, c in pairs(self:get_child_by_id("hero_room_stats").children) do
			c:set(hd.stats[i], true)
		end
	end

	function HeroRoomViewKR1:deselect_hero(name)
		self.check_image.hidden = true

		local bs = self:get_child_by_id("hero_room_sel_select")
		local bd = self:get_child_by_id("hero_room_sel_deselect")

		bs.hidden = false
		bd.hidden = true

		screen_map.hero_icon_portrait:set_image("mapButtons_portrait_hero_0010")

		screen_map.user_data.heroes.selected = nil

		storage:save_slot(screen_map.user_data)
	end

	function HeroRoomViewKR1:select_hero(name, silent)
		local thumbs = self:get_child_by_id("hero_thumbs")
		local th = thumbs:get_child_by_id(name)

		self.check_image.pos = th.pos
		self.check_image.hidden = false

		local bs = self:get_child_by_id("hero_room_sel_select")
		local bd = self:get_child_by_id("hero_room_sel_deselect")

		bs.hidden = true
		bd.hidden = false

		local hd = screen_map.hero_data[get_hero_index(name)]
		local ht = E:get_template(hd.name)

		if not silent then
			S:queue(ht.sound_events.hero_room_select)
		end

		screen_map.hero_icon_portrait:set_image(string.format("mapButtons_portrait_hero_%04i", hd.icon))

		screen_map.hero_icon_portrait.hidden = false
		screen_map.user_data.heroes.selected = name

		storage:save_slot(screen_map.user_data)
	end
else
	HeroRoomView = class("HeroRoomView", PopUpView)

	local hrvt_scale = v(0.625, 0.625)
	local hrvt_size = v(160 * hrvt_scale.x, 168 * hrvt_scale.y)
	local hrvt_margin = v(14, 10)
	local hrvt_sep = v(6, 4)
	local hrvt_per_row = 8

	function HeroRoomView:hero_thumb_pos(i, ox, oy)
		local frame = self.hero_select
		local sx = frame.pos.x - frame.size.x / 2 * frame.scale.x + hrvt_margin.x
		local dx = hrvt_size.x + hrvt_sep.x
		local sy = frame.pos.y - frame.size.y / 2 * frame.scale.y + hrvt_margin.y
		local dy = hrvt_size.y + hrvt_sep.y
		local per_row = hrvt_per_row
		local pos = v(math.fmod(i - 1, per_row) * dx + sx, math.floor((i - 1) / per_row) * dy + sy)

		pos.x = pos.x + (ox and ox or 0)
		pos.y = pos.y + (oy and oy or 0)

		return pos
	end

	function HeroRoomView:initialize(sw, sh)
		PopUpView.initialize(self, V.v(sw, sh))

		self.back = KImageView:new("heroroom_001_notxt")
		self.back.pos = v(0, 0)
		self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)

		self:add_child(self.back)

		self.back.alpha = 0
		self.hero_select = KImageView:new("heroroom_002")
		self.hero_select.anchor = v(self.hero_select.size.x / 2, self.hero_select.size.y / 2)
		self.hero_select.pos = v(self.back.size.x / 2, 203)
		self.hero_select.scale.y = (2 * hrvt_margin.y + 2 * hrvt_size.y + hrvt_sep.y) / self.hero_select.size.y

		self.back:add_child(self.hero_select)

		self.hero_select.selected = KImageView:new("heroroom_portraitsDecos_0002")
		self.hero_select.selected.pos = v(30, 30)
		self.hero_select.selected.scale = hrvt_scale
		self.hero_select.selected.hidden = true
		self.hero_select.over = KImageView:new("heroroom_portraitsDecos_0003")
		self.hero_select.over.pos = v(30, 30)
		self.hero_select.over.propagate_on_click = true
		self.hero_select.over.scale = hrvt_scale
		self.hero_select.over.hidden = false
		self.selected_index = -1
		self.hero_select.mouse_over = KImageView:new("heroroom_thumbs_0008")
		self.hero_select.mouse_over.propagate_on_click = true
		self.hero_select.mouse_over.hidden = true
		self.hero_select.mouse_over.scale = v(hrvt_size.x / self.hero_select.mouse_over.size.x, hrvt_size.y / self.hero_select.mouse_over.size.y)

		if screen_map.user_data.heroes.selected then
			for i, hd in ipairs(screen_map.hero_data) do
				if hd.name == screen_map.user_data.heroes.selected then
					self.selected_index = i
					self.real_selected = i
					self.hero_select.selected.pos = self:hero_thumb_pos(i)
					self.hero_select.over.pos = self:hero_thumb_pos(i)

					screen_map.hero_icon_portrait:set_image(string.format("mapButtons_portrait_hero_%04i", hd.icon))

					screen_map.hero_icon_portrait.hidden = false
					self.hero_select.selected.hidden = false

					break
				end
			end
		end

		if self.selected_index < 0 then
			self.hero_select.selected.hidden = true
			self.selected_index = 1
			self.hero_select.over.pos = v(sx, sy)
		end

		self.over_index = self.selected_index

		local max_level = #screen_map.user_data.levels

		for i = 1, 16 do
			local hd = screen_map.hero_data[i]

			if not hd or hd.coming_soon then
				local portrait = KImageView:new("heroroom_portraitsDecos_0001")

				portrait.pos = self:hero_thumb_pos(i)
				portrait.scale = hrvt_scale

				self.back:add_child(portrait)
			else
				local portrait = KImageView:new(string.format("heroroom_portraits_%04i", hd.thumb))

				portrait.pos = self:hero_thumb_pos(i)
				portrait.scale = hrvt_scale

				self.back:add_child(portrait)

				function portrait.on_enter()
					self.hero_select.mouse_over.hidden = false
					self.hero_select.mouse_over.pos = self:hero_thumb_pos(i, 0, -1)
				end

				function portrait.on_exit()
					self.hero_select.mouse_over.hidden = true
				end

				function portrait.on_click()
					S:queue("GUIQuickMenuOpen")

					self.selected_index = i
					self.over_index = i

					self:construct_hero(i)

					self.hero_select.over.pos = portrait.pos
					self.hero_select.over.hidden = false
				end

				if max_level < hd.available_level then
					local portraitLock = KImageView:new("heroroom_portraitsLock")

					portraitLock.pos = self:hero_thumb_pos(i)
					portraitLock.scale = v(hrvt_size.x / portraitLock.size.x, hrvt_size.y / portraitLock.size.y)

					self.back:add_child(portraitLock)

					portraitLock.propagate_on_click = true
				end
			end
		end

		self.hero_select.selected.propagate_on_click = true

		self.back:add_child(self.hero_select.mouse_over)
		self.back:add_child(self.hero_select.over)
		self.back:add_child(self.hero_select.selected)

		self.tip_panel = HeroToolTip:new()

		self:add_child(self.tip_panel)

		self.skills = HeroSkills:new(1, {})
		self.skills.anchor = v(0, 0)
		self.skills.pos = v(self.back.size.x / 2 - 15, 375 + (IS_KR3 and -6 or 0))

		self.back:add_child(self.skills)

		self.skills.tip_panel = self.tip_panel

		local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

		close_button.pos = v(self.back.size.x - 53, 19)

		function close_button.on_click()
			S:queue("GUIButtonCommon")
			self:hide()
		end

		self.close_button = close_button

		self.back:add_child(close_button)

		self.portrait = KImageView:new("portrait_notxt_0001")
		self.portrait.scale = v(0.9, 0.9)
		self.portrait.anchor = v(self.portrait.size.x / 2, self.portrait.size.y / 2)
		self.portrait.pos = v(400, 510)

		self.back:add_child(self.portrait)

		self.portrait_name = HeroNameLabel:new(V.v(200, 100))
		self.portrait_name.pos = v(300, 552)

		self.back:add_child(self.portrait_name)

		self.portrait_over = KView:new(V.v(self.portrait.size.x, self.portrait.size.y))
		self.portrait_over.scale = v(0.9, 0.9)
		self.portrait_over.colors.background = {
			255,
			255,
			255,
			0
		}
		self.portrait_over.propagate_on_click = true
		self.portrait_over.anchor = v(self.portrait.size.x / 2, self.portrait.size.y / 2)
		self.portrait_over.pos = v(400, 510)

		self.back:add_child(self.portrait_over)

		local over_portrait = KImageView:new("heroroom_020")

		over_portrait.anchor = v(over_portrait.size.x / 2, over_portrait.size.y / 2)
		over_portrait.pos = v(400, 510)

		self.back:add_child(over_portrait)
		self.skills:load_hero(1)

		self.selected_spr = KImageView:new("heroroom_btnSelect_0003")
		self.selected_spr.pos = v(320, 655)

		self.back:add_child(self.selected_spr)

		self.selected_spr.hidden = true

		local selected_text = GGShaderLabel:new(V.v(114, 38))

		selected_text.pos = v(25, 16)
		selected_text.font_size = 24
		selected_text.font_name = "button"
		selected_text.text_align = "center"
		selected_text.vertical_align = ISW("middle-caps", "zh-Hans", "middle", "ko", "middle", "ja", "middle", "zh-Hant", "middle")
		selected_text.text = _("MAP_HERO_ROOM_SELECTED")
		selected_text.colors.text = {
			233,
			222,
			178,
			255
		}
		selected_text.fit_lines = 1
		selected_text.shaders = {
			"p_glow"
		}
		selected_text.shader_args = {
			{
				thickness = 3,
				glow_color = {
					0.23921568627450981,
					0.19607843137254902,
					0.1568627450980392,
					1
				}
			}
		}

		self.selected_spr:add_child(selected_text)

		self.locked_spr = KImageView:new("heroroom_btnSelect_0004")
		self.locked_spr.pos = v(320, 655)

		self.back:add_child(self.locked_spr)

		self.locked_spr.hidden = true

		local locked_text = GGLabel:new(V.v(114, 38))

		locked_text.pos = v(25, 16)
		locked_text.font_size = 16
		locked_text.font_name = "button"
		locked_text.text_align = "center"
		locked_text.vertical_align = ISW("middle-caps", "zh-Hans", "middle", "ko", "middle", "ja", "middle", "zh-Hant", "middle")
		locked_text.colors.text = {
			255,
			255,
			255
		}

		self.locked_spr:add_child(locked_text)

		self.locked_spr.l_text = locked_text
		self.select_but = GGButton:new("heroroom_btnSelect_0001", "heroroom_btnSelect_0002", "heroroom_btnSelect_0002")
		self.select_but.pos = v(320, 655)
		self.select_but.anchor = v(0, 0)
		self.select_but.on_down_scale = nil
		self.select_but.label.size = v(114, 38)
		self.select_but.label.text_size = self.select_but.label.size
		self.select_but.label.pos = v(25, 16)
		self.select_but.label.font_size = 24
		self.select_but.label.vertical_align = ISW("middle-caps", "zh-Hans", "middle", "ko", "middle", "ja", "middle", "zh-Hant", "middle")
		self.select_but.label.text = _("MAP_HERO_ROOM_SELECT")
		self.select_but.label.fit_lines = 1

		function self.select_but.on_click()
			S:queue("GUIBuyUpgrade")

			if not screen_map.user_data.seen.heroroom_help_select then
				screen_map.user_data.seen.heroroom_help_select = true
				self.help_select.hidden = true
			end

			local i = self.selected_index
			local hd = screen_map.hero_data[i]

			screen_map.skill_label.text = self.skills.points.text

			if tonumber(self.skills.points.text) == 0 then
				screen_map.skill_star.hidden = true
			else
				screen_map.skill_star.hidden = false
			end

			self.hero_select.selected.pos = self:hero_thumb_pos(i)
			screen_map.user_data.heroes.selected = hd.name

			local ht = E:get_template(hd.name)

			S:queue(ht.sound_events.hero_room_select)

			local h_status = screen_map.user_data.heroes.status[screen_map.user_data.heroes.selected]
			local starting_xp = hd.starting_level < 2 and 0 or GS.hero_xp_thresholds[hd.starting_level - 1]

			h_status.xp = math.max(h_status.xp, starting_xp)

			storage:save_slot(screen_map.user_data)

			self.select_but.hidden = true
			self.selected_spr.hidden = false
			self.real_selected = i

			screen_map.hero_icon_portrait:set_image(string.format("mapButtons_portrait_hero_%04i", hd.icon))

			screen_map.hero_icon_portrait.hidden = false
			self.portrait_over.colors.background = {
				255,
				255,
				255,
				255
			}

			timer:tween(0.8, self.portrait_over.colors, {
				background = {
					255,
					255,
					255,
					0
				}
			}, "out-quad")
		end

		self.back:add_child(self.select_but)
		self:construct_hero(self.selected_index)

		if not IS_KR3 then
			local header = GGPanelHeader:new(_("HERO ROOM"), 274)

			header.pos = V.v(397, CJK(26, 24, nil, 24))

			self.back:add_child(header)
		end

		if not screen_map.user_data.seen.heroroom_help or DEBUG_HEROROOM_HELP then
			self.hero_help = KImageView:new("heroroom_001_notxt")

			self.back:add_child(self.hero_help)

			self.hero_help.colors.tint = {
				0,
				0,
				0,
				150
			}

			function self.hero_help.on_click()
				timer:tween(0.5, self.hero_help, {
					alpha = 0
				}, "out-quad", function()
					self.back:remove_child(self.hero_help)
				end)

				screen_map.user_data.seen.heroroom_help = true

				storage:save_slot(screen_map.user_data)
			end

			function self.hero_help.disable()
				self.hero_help.colors.tint = {
					0,
					0,
					0,
					120
				}
			end

			function self.hero_help.remove_disabled_tint()
				self.hero_help.colors.tint = {
					0,
					0,
					0,
					120
				}
			end

			local help_ability = KImageView:new("heroroom_help_abilities_notxt")

			help_ability.pos = v(572, 466)

			self.hero_help:add_child(help_ability)

			local help_ability_text = GGLabel:new(V.v(326, 28))

			help_ability_text.font_name = "body"
			help_ability_text.font_size = 24
			help_ability_text.colors.text = {
				0,
				0,
				0,
				255
			}
			help_ability_text.text_align = "center"
			help_ability_text.vertical_align = "middle"
			help_ability_text.text = _("Select and train abilities")
			help_ability_text.pos = v(12, 15)
			help_ability_text.fit_lines = 1

			help_ability:add_child(help_ability_text)

			local help_select = KImageView:new("heroroom_help_select_notxt")

			help_select.pos = v(85, 705)

			self.hero_help:add_child(help_select)

			local help_select_text = GGLabel:new(V.v(200, 30))

			help_select_text.font_name = "body"
			help_select_text.font_size = 24
			help_select_text.colors.text = {
				0,
				0,
				0,
				255
			}
			help_select_text.text_align = "center"
			help_select_text.vertical_align = "middle"
			help_select_text.text = _("Click to select")
			help_select_text.pos = v(13, 15)
			help_select_text.fit_lines = 1

			help_select:add_child(help_select_text)
		end

		if IS_KR3 then
			local header_bg = KImageView("kr3_title_bg")

			header_bg.anchor.x = km.round(header_bg.size.x / 2)
			header_bg.pos = v(km.round(self.back.size.x / 2), -36)

			self.back:add_child(header_bg)

			local header = GGPanelHeader:new(_("HERO ROOM"), 274)

			header.pos = V.v(397, CJK(26, 24, nil, 24) - 36)

			self.back:add_child(header)
		end

		local done_button = GGButton:new("heroroom_btnDone_large_0001", "heroroom_btnDone_large_0002")

		done_button.anchor = v(math.floor(done_button.size.x / 2), done_button.size.y / 2)
		done_button.pos = v(self.back.size.x - 166, self.back.size.y - 32)
		done_button.label.size = v(100, 34)
		done_button.label.text_size = done_button.label.size
		done_button.label.pos = v(20, 19)
		done_button.label.font_size = 24
		done_button.label.vertical_align = CJK("middle-caps", "middle", "middle", "middle")
		done_button.label.text = _("BUTTON_DONE")
		done_button.label.fit_lines = 1

		function done_button.on_click()
			S:queue("GUIButtonCommon")
			self:hide()
		end

		self.back:add_child(done_button)

		self.done_button = done_button

		local over_done_button = KImageView:new("heroroom_014_large")

		over_done_button.anchor = v(math.floor(over_done_button.size.x / 2), over_done_button.size.y / 2)
		over_done_button.pos = v(self.back.size.x - 168, self.back.size.y - 34)

		self.back:add_child(over_done_button)

		over_done_button.propagate_on_click = true
	end

	function HeroRoomView:construct_hero(index)
		if self.help_select then
			self.back:remove_child(self.help_select)

			self.help_select = nil
		end

		if index == self.real_selected then
			self.select_but.hidden = true
			self.selected_spr.hidden = false
			self.skills.no_buy = false
			self.locked_spr.hidden = true
		elseif screen_map.hero_data[index].available_level > #screen_map.user_data.levels then
			self.locked_spr.hidden = false
			self.select_but.hidden = true
			self.locked_spr.l_text.text = string.format(_("MAP_HERO_ROOM_UNLOCK"), screen_map.hero_data[index].available_level)
			self.locked_spr.l_text.fit_lines = 2
			self.skills.no_buy = true
		else
			self.select_but.hidden = false
			self.selected_spr.hidden = true
			self.skills.no_buy = false
			self.locked_spr.hidden = true

			if not screen_map.user_data.seen.heroroom_help_select then
				self.help_select = KImageView:new("heroroom_help_select_notxt")
				self.help_select.pos = v(85, 705)

				self.back:add_child(self.help_select)

				local help_select_text = GGLabel:new(V.v(200, 30))

				help_select_text.font_name = "body"
				help_select_text.font_size = 24
				help_select_text.colors.text = {
					0,
					0,
					0,
					255
				}
				help_select_text.text_align = "center"
				help_select_text.vertical_align = "middle"
				help_select_text.text = _("Click to select")
				help_select_text.pos = v(13, 15)
				help_select_text.fit_lines = 1

				self.help_select:add_child(help_select_text)
			end
		end

		local hero_data = get_hero_stats(index)

		if index ~= self.old_index then
			self.old_index = index

			self.portrait:set_image(string.format("portrait_notxt_%04i", hero_data.portrait))
			self.portrait_name:set_hero(hero_data.name, hero_data.name_i18n)

			self.portrait_over.colors.background = {
				255,
				255,
				255,
				255
			}

			timer:tween(0.2, self.portrait_over.colors, {
				background = {
					255,
					255,
					255,
					0
				}
			}, "out-quad")
		end

		self.skills:load_hero(index)
	end

	HeroToolTip = class("HeroToolTip", KLabel)

	function HeroToolTip:initialize()
		self.rect_w = 300
		self.rect_h = 78
		self.tip_w = 15
		self.tip_h = 23

		local coin_pos_from_right = 51

		KLabel.initialize(self, V.v(self.rect_w, self.rect_h))

		self.anchor = v(self.rect_w / 2, 0)
		self.alpha = 0.9

		local name_label = GGLabel:new(V.v(self.rect_w - coin_pos_from_right - 10, 18))

		name_label.pos = v(15, 30)
		name_label.font_name = "body"
		name_label.font_size = 18
		name_label.colors.text = {
			255,
			255,
			255
		}
		name_label.text_align = "left"
		self.title = name_label

		self:add_child(name_label)

		local desc_label = GGLabel:new(V.v(self.rect_w - 30, 18))

		desc_label.pos = v(15, 55)
		desc_label.font_name = "body"
		desc_label.font_size = 18
		desc_label.colors.text = {
			245,
			203,
			6
		}
		desc_label.text_align = "left"
		desc_label.line_height = CJK(0.85, nil, 1, 0.9)
		self.desc = desc_label

		self:add_child(desc_label)

		self.bullet = KImageView:new("heroroom_tooltip_coin")
		self.bullet.pos = v(self.rect_w - coin_pos_from_right, 30)

		self:add_child(self.bullet)

		local price_label = GGLabel:new(V.v(50, 18))

		price_label.pos = v(self.rect_w - coin_pos_from_right + 20, 28)
		price_label.font_name = "Comic Book Italic"
		price_label.font_size = 18
		price_label.colors.text = {
			255,
			255,
			255
		}
		price_label.text = "2"
		price_label.text_align = "left"
		self.price = price_label

		self:add_child(price_label)

		self.hidden = true
	end

	function HeroToolTip:_draw_self()
		HeroToolTip.super._draw_self(self)

		local pr, pg, pb, pa = G.getColor()
		local current_alpha = pa / 255
		local new_c = {
			20,
			16,
			13,
			224 * current_alpha
		}

		G.setColor(new_c)
		G.rectangle("fill", 0, self.tip_h, self.size.x, self.size.y)
		G.polygon("fill", (self.rect_w - self.tip_w) / 2, self.tip_h, self.rect_w / 2, 0, (self.rect_w + self.tip_w) / 2, self.tip_h)
		G.setColor(pr, pg, pb, pa)
	end

	HeroSkills = class("HeroSkills", KImageView)

	function HeroSkills:initialize()
		KImageView.initialize(self, "heroroom_003")

		local movel = 245
		local kr3_y_offset = IS_KR3 and 4 or 0
		local title_bg = KImageView:new("heroroom_006_notxt")

		title_bg.pos = v(V.csnap(self.size.x / 2 - 4, IS_KR3 and 6 or 2))
		title_bg.anchor = v(title_bg.size.x / 2, title_bg.size.y / 2)

		self:add_child(title_bg)

		local header = GGShaderLabel:new(V.v(130, 26))

		header.font_name = "h"
		header.font_size = 22
		header.text_align = "center"
		header.vertical_align = CJK("middle-caps", "middle", nil, "middle")
		header.colors.text = {
			250,
			250,
			250,
			255
		}
		header.shaders = {
			"p_bands",
			"p_glow"
		}
		header.shader_args = {
			{
				margin = 1,
				p1 = 0.42,
				p2 = 0.56,
				c1 = {
					0.9803921568627451,
					0.9803921568627451,
					0.9803921568627451,
					1
				},
				c2 = {
					0.9098039215686274,
					0.8745098039215686,
					0.6901960784313725,
					1
				},
				c3 = {
					0.6588235294117647,
					0.6274509803921569,
					0.4588235294117647,
					1
				}
			},
			{
				thickness = 1.6,
				glow_color = {
					0,
					0,
					0,
					0.85
				}
			}
		}
		header.text = _("Skills")
		header.fit_lines = 1
		header.pos = v(23, ISW(9, "zh-Hans", 8))

		title_bg:add_child(header)

		local stat_panel = KImageView:new("heroroom_004")

		stat_panel.pos = v(V.csnap(8 - movel, self.size.y / 2 + 30))
		stat_panel.anchor = v(stat_panel.size.x, stat_panel.size.y / 2)

		self:add_child(stat_panel)

		local stat_bullets = KImageView:new("heroroom_007")

		stat_bullets.pos = v(V.csnap(stat_panel.size.x / 2, stat_panel.size.y / 2 - 2))
		stat_bullets.anchor = v(stat_bullets.size.x / 2, stat_bullets.size.y / 2)

		stat_panel:add_child(stat_bullets)

		self.reset_button = GGButton:new("heroroom_btnReset_large_0001", "heroroom_btnReset_large_0002")
		self.reset_button.anchor = v(0, 0)
		self.reset_button.pos = v(310, 9 + kr3_y_offset)
		self.reset_button.on_down_scale = nil
		self.reset_button.label.size = v(80, 26)
		self.reset_button.label.text_size = self.reset_button.label.size
		self.reset_button.label.pos = v(19, 16)
		self.reset_button.label.font_size = 18
		self.reset_button.label.vertical_align = ISW("middle-caps", "zh-Hans", "top", "zh-Hant", "top", "ko", "middle")
		self.reset_button.label.text = _("BUTTON_RESET")
		self.reset_button.label.fit_lines = 1

		self:add_child(self.reset_button)
		self.reset_button:disable()

		function self.reset_button.on_click()
			S:queue("GUIButtonCommon")

			local selected_hero = screen_map.hero_data[screen_map.hero_room.over_index].name

			for v, i in pairs(screen_map.user_data.heroes.status[selected_hero].skills) do
				screen_map.user_data.heroes.status[selected_hero].skills[v] = 0
			end

			storage:save_slot(screen_map.user_data)
			screen_map.hero_room:construct_hero(screen_map.hero_room.selected_index)
			self.reset_button:disable()
		end

		local points_back = KImageView:new("heroroom_013")

		points_back.pos = v(25, 19 + kr3_y_offset)

		self:add_child(points_back)

		local points_icon = KImageView:new("heroroom_012")

		points_icon.pos = v(50, 36 + kr3_y_offset)
		points_icon.anchor = v(points_icon.size.x / 2, points_icon.size.y / 2)

		self:add_child(points_icon)

		local point_label = KLabel:new(V.v(50, 50))

		point_label.pos = v(55, 20 + kr3_y_offset)
		point_label.font = F:f("Comic Book Italic", "24")
		point_label.text_align = "center"
		point_label.colors.text = {
			231,
			222,
			175
		}
		point_label.text = "1"
		self.points = point_label

		self:add_child(point_label)

		local ay = -5
		local dx = 82

		self.bars = {}

		for i = 0, 4 do
			local is_ulti = i == 4 and IS_KR3
			local bg = KImageView:new("heroroom_009")

			bg.pos = v(82 * i + 25, 73 + ay)
			bg.level = 0

			self:add_child(bg)

			self.bars[i] = bg

			if is_ulti then
				local ulti_frame = KImageView("heroroom_009_ulti")

				ulti_frame.pos = V.v(-5, 0)

				bg:add_child(ulti_frame)
			end

			bg.plus_pos = {
				[0] = v(bg.size.x / 2, 74 + ay - 0),
				v(bg.size.x / 2, 74 + ay - 28),
				(v(bg.size.x / 2, 74 + ay - 56))
			}
			bg.plus = KImageButton:new("heroroom_018")

			bg:add_child(bg.plus)

			bg.plus.anchor = v(bg.plus.size.x / 2 - 1, 1)
			bg.plus.pos = bg.plus_pos[0]
			bg.plus.hidden = true

			function bg.plus.on_click()
				if self.no_buy then
					return
				end

				S:queue("GUIBuyUpgrade")

				local new_level = bg.level + 1
				local user_data = screen_map.user_data
				local hero_data = get_hero_stats(self.index)
				local sk_name = hero_data.skill_names[i + 1]

				user_data.heroes.status[hero_data.name].skills[sk_name] = bg.level + 1

				storage:save_slot(user_data)
				screen_map.hero_room:construct_hero(self.index)
				self:show_tooltip(i)
			end

			bg.over = KView:new(V.v(46, 30))

			bg:add_child(bg.over)

			bg.over.anchor = v(bg.over.size.x / 2, 0)
			bg.over.pos = bg.plus_pos[0]
			bg.over.propagate_on_click = true
			bg.over.propagate_on_down = true
			bg.over.propagate_on_up = true

			function bg.over.on_enter()
				bg.plus.hidden = false
			end

			function bg.over.on_exit()
				bg.plus.hidden = true
			end

			bg.bullets = {}

			for o = 0, 2 do
				local b = KImageView:new("heroroom_010")

				b.anchor = v(b.size.x / 2, 0)
				b.pos = bg.plus_pos[o]

				bg:add_child(b)

				b.hidden = true
				bg.bullets[o] = b
			end

			bg.icon = KImageView:new("heroroom_upgradeIcons0001")
			bg.icon.anchor = v(bg.icon.size.x / 2, bg.icon.size.y / 2)
			bg.icon.pos = v(bg.size.x / 2, 137)

			bg:add_child(bg.icon)

			function bg.icon.on_enter()
				self:show_tooltip(i)

				bg.icon_over.hidden = false
			end

			function bg.icon.on_exit()
				self:hide_tooltip()

				bg.icon_over.hidden = true
			end

			function bg.icon.on_click()
				if bg.level < 3 and not bg.over.hidden then
					bg.plus:on_click()
				end
			end

			bg.icon_over = KImageView:new(IS_KR3 and "heroroom_upgradeIcons0081" or "heroroom_015")
			bg.icon_over.anchor = v(bg.icon_over.size.x / 2, bg.icon_over.size.y / 2)
			bg.icon_over.pos = V.vclone(bg.icon.pos)
			bg.icon_over.hidden = true

			bg:add_child(bg.icon_over)

			bg.cost_panel = KImageView:new("heroroom_011")
			bg.cost_panel.anchor = v(bg.cost_panel.size.x / 2, bg.cost_panel.size.y / 2)
			bg.cost_panel.pos = v(bg.size.x / 2, bg.icon.pos.y + bg.icon.size.y / 2)

			bg:add_child(bg.cost_panel)

			local cost_label = KLabel:new(V.v(20, 20))

			cost_label.pos = v(33, 6)
			cost_label.font = F:f("Comic Book Italic", "14")
			cost_label.colors.text = {
				231,
				222,
				175
			}
			cost_label.text = "2"
			cost_label.text_align = "center"
			bg.cost = cost_label

			bg.cost_panel:add_child(cost_label)
		end

		local hero_badge_contain = KImageView:new("heroroom_017")

		hero_badge_contain.anchor = v(hero_badge_contain.size.x, hero_badge_contain.size.y / 2)
		hero_badge_contain.pos = v(-5 - movel, 60)

		self:add_child(hero_badge_contain)

		do
			local y_o, y_d = 6, 34
			local x, y = 31, y_o
			local health_label = GGLabel:new(V.v(80, 17))

			health_label.pos = v(x, y)
			health_label.colors.text = {
				255,
				255,
				255
			}
			health_label.text = "200"
			health_label.text_align = "left"
			health_label.font_name = "Comic Book Italic"
			health_label.font_size = 16
			health_label.vertical_align = "middle"
			health_label.fit_lines = 1
			self.health = health_label

			stat_bullets:add_child(health_label)

			y = y + y_d

			local armor_label = GGLabel:new(V.v(80, 17))

			armor_label.pos = v(x, y)
			armor_label.colors.text = {
				255,
				255,
				255
			}
			armor_label.text = "200"
			armor_label.text_align = "left"
			armor_label.font_name = CJK("body", nil, nil, "h_noti")
			armor_label.font_size = 16
			armor_label.text_offset.y = -2
			armor_label.vertical_align = "middle"
			armor_label.fit_lines = 1
			self.armor = armor_label

			stat_bullets:add_child(armor_label)

			y = y + y_d

			local damage_label = GGLabel:new(V.v(80, 17))

			damage_label.pos = v(x, y)
			damage_label.colors.text = {
				255,
				255,
				255
			}
			damage_label.text = "100"
			damage_label.text_align = "left"
			damage_label.font_name = "Comic Book Italic"
			damage_label.font_size = 16
			damage_label.vertical_align = "middle"
			damage_label.fit_lines = 1
			self.attack = damage_label

			stat_bullets:add_child(damage_label)

			self.attack_icon = KImageView:new("heroroom_attackIcons_0001")
			self.attack_icon.pos = v(x - 29, y - 8)

			stat_bullets:add_child(self.attack_icon)

			y = y + y_d

			local time_label = GGLabel:new(V.v(80, 17))

			time_label.pos = v(x, y)
			time_label.colors.text = {
				255,
				255,
				255
			}
			time_label.text = "200"
			time_label.text_align = "left"
			time_label.font_name = CJK("body", nil, nil, "h_noti")
			time_label.font_size = 16
			time_label.text_offset.y = -1
			time_label.vertical_align = "middle"
			time_label.fit_lines = 1
			self.time = time_label

			stat_bullets:add_child(time_label)
		end

		local hero_badge = KImageView:new("heroroom_heroBadge_notxt_0002")

		hero_badge.anchor = v(hero_badge.size.x, hero_badge.size.y / 2)
		hero_badge.pos = v(-5 - movel, 40)
		self.hero_badge = hero_badge

		self:add_child(hero_badge)

		self.level_num = KImageView:new("heroroom_heroBadge_numbers_0001")
		self.level_num.pos = v(-75 - movel, 40)
		self.level_num.scale = v(0.5, 0.5)
		self.level_num.anchor = v(self.level_num.size.x / 2, self.level_num.size.y / 2)

		self:add_child(self.level_num)

		self.hero_bar = KImageView:new("hero_bar_middle")
		self.hero_bar.pos = v(-105 - movel, 60)
		self.hero_bar.anchor = v(0, self.hero_bar.size.y / 2)
		self.hero_bar.scale = v(0.5, 1)

		self:add_child(self.hero_bar)

		self.hero_bar_init = KImageView:new("hero_bar_init")
		self.hero_bar_init.anchor = v(self.hero_bar_init.size.x, self.hero_bar_init.size.y / 2)
		self.hero_bar_init.pos = v(-104 - movel, 60)

		self:add_child(self.hero_bar_init)

		self.hero_bar_end = KImageView:new("hero_bar_end")
		self.hero_bar_end.anchor = v(self.hero_bar_end.size.x, self.hero_bar_end.size.y / 2)
		self.hero_bar_end.pos = v(-105 - movel + 58, 60)

		self:add_child(self.hero_bar_end)

		local class_label = GGLabel:new(V.v(104, 14))

		class_label.pos = v(-155 - movel + 24, ISW(71, "zh-Hans", 66, "zh-Hant", 69, "ko", 69))
		class_label.font_name = CJK("body", nil, nil, "sans_bold")
		class_label.font_size = 14
		class_label.colors.text = {
			0,
			0,
			0
		}
		class_label.text = "class"
		class_label.text_align = "center"
		class_label.vertical_align = ISW("middle-caps", "zh-Hans", "top", "zh-Hant", "top")
		class_label.fit_lines = 1
		self.class_label = class_label

		self:add_child(class_label)
	end

	function HeroSkills:enable()
		UpgradesView.super.enable(self)

		if self.disable_reset then
			self.reset_button:disable()
		end
	end

	function HeroSkills:set_panel_height(title, desc, price)
		self.tip_panel.price.text = price
		self.tip_panel.desc.text = desc
		self.tip_panel.title.text = title

		local titleLineHeight = self.tip_panel.title:get_font_height() * self.tip_panel.title.line_height
		local descLineHeight = self.tip_panel.desc:get_font_height() * self.tip_panel.desc.line_height
		local _w, lines = self.tip_panel.desc:get_wrap_lines()

		self.tip_panel.size.y = titleLineHeight * 1.5 + (descLineHeight * lines + 15)
		self.tip_panel.hidden = false
	end

	function HeroSkills:show_tooltip(i)
		local hero_data = get_hero_stats(self.index)
		local sk_key = hero_data.skill_names_i18n[i + 1] or hero_data.skill_names[i + 1]
		local sk_name = hero_data.skill_names[i + 1]
		local sk = hero_data.skills[sk_name]

		if sk.level == 3 then
			self.tip_panel.price.hidden = true
			self.tip_panel.bullet.hidden = true

			if self.tip_panel.star then
				self.tip_panel.star.hidden = true
			end
		else
			self.tip_panel.price.hidden = false
			self.tip_panel.bullet.hidden = false

			if self.tip_panel.star then
				self.tip_panel.star.hidden = false
			end
		end

		self:set_panel_height(_(string.format("%s_%s_TITLE", string.upper(hero_data.name_i18n), string.upper(sk_key))), _(string.format("%s_%s_DESCRIPTION_%s", string.upper(hero_data.name_i18n), string.upper(sk_key), tostring(km.clamp(1, 3, sk.level + 1)))), sk.hr_cost[sk.level + 1])

		self.tip_panel.hidden = false

		self:update_tooltip_position()
	end

	function HeroSkills:hide_tooltip()
		self.tip_panel.hidden = true
	end

	function HeroSkills:update_tooltip_position()
		if not self.tip_panel.hidden then
			local mx, my = screen_map.window:get_mouse_position()

			my = my + 30
			self.tip_panel.pos = v(mx / screen_map.window.scale.x, my / screen_map.window.scale.y)
		end
	end

	function HeroSkills:update(dt)
		HeroSkills.super.update(self, dt)
		self:update_tooltip_position()
	end

	function HeroSkills:load_hero(index)
		local damage_icons = {
			default = "heroroom_attackIcons_0001",
			magic = "heroroom_attackIcons_0002",
			sword = "heroroom_attackIcons_0001",
			fireball = "heroroom_attackIcons_0004",
			arrow = "heroroom_attackIcons_0003",
			shot = "heroroom_attackIcons_0001"
		}
		local hero_data = get_hero_stats(index)

		self.hero_data = hero_data
		self.class_label.text = hero_data.hero_class
		self.time.text = hero_data.attack_rate
		self.armor.text = hero_data.armor
		self.attack.text = hero_data.damage
		self.health.text = hero_data.health

		self.attack_icon:set_image(damage_icons[hero_data.damage_icon] or damage_icons.default)
		self.level_num:set_image(string.format("heroroom_heroBadge_numbers_%04i", hero_data.level))

		self.index = hero_data.index

		local hero_level = hero_data.level

		log.paranoid("hero:%s  xp:%s  level:%s  perc:%s", hero_data.name, hero_data.xp, hero_level, percentaje_lvl)

		self.hero_bar.scale = v(hero_data.level_progress, 1)
		self.hero_bar.hidden = false
		self.hero_bar_end.hidden = hero_data.level_progress < 1
		self.hero_bar_init.hidden = hero_data.level_progress == 0

		local disable_reset = true

		for i = 0, 4 do
			self.bars[i].cost_panel.hidden = false

			local sk_name = hero_data.skill_names[i + 1]
			local sk = hero_data.skills[sk_name]

			if self.no_buy or sk.level < 3 and sk.hr_cost[sk.level + 1] > hero_data.remaining_points then
				self.bars[i].icon:set_image("heroroom_upgradeIcons00" .. string.format("%02i", sk.hr_icon) .. "_disabled")
				self.bars[i].cost_panel:set_image("heroroom_011_disabled")
			else
				self.bars[i].icon:set_image("heroroom_upgradeIcons00" .. string.format("%02i", sk.hr_icon))
				self.bars[i].cost_panel:set_image("heroroom_011")
			end

			self.bars[i].cost.text = tostring(sk.hr_cost[sk.level + 1])
			self.bars[i].skill_name = sk_name
			self.bars[i].level = sk.level

			for d = 0, 2 do
				if d < sk.level then
					self.bars[i].bullets[d].hidden = false

					self.reset_button:enable()

					disable_reset = false
				else
					self.bars[i].bullets[d].hidden = true
				end
			end

			if sk.level < 3 and hero_data.remaining_points >= sk.hr_cost[sk.level + 1] then
				local bar = self.bars[i]

				bar.over.pos = bar.plus_pos[sk.level]
				bar.plus.pos = bar.plus_pos[sk.level]
				bar.over.hidden = false
			else
				self.bars[i].over.hidden = true

				if self.bars[i].level == 3 then
					self.bars[i].cost_panel.hidden = true
				end
			end
		end

		self.disable_reset = disable_reset
		self.points.text = hero_data.remaining_points

		local selected_hero = screen_map.user_data.heroes.selected

		if screen_map.hero_room and screen_map.hero_room.real_selected == screen_map.hero_room.over_index and selected_hero == hero_data.name then
			screen_map.skill_label.text = self.points.text

			if hero_data.remaining_points == 0 then
				screen_map.skill_star.hidden = true
			else
				screen_map.skill_star.hidden = false
			end
		end

		for i = 0, 4 do
			-- block empty
		end
	end
end

OptionsView = class("OptionsView", PopUpView)

function OptionsView:initialize(sw, sh)
	PopUpView.initialize(self, V.v(sw, sh))

	self.back = KImageView:new("options_bg_notxt")
	self.pos = v(0, 0)
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2, sh / 2 - 50)

	self:add_child(self.back)

	self.back.alpha = 1

	local mx = 100
	local y = 130
	local header = GGPanelHeader:new(_("OPTIONS"), 242)

	header.pos = V.v(240, CJK(41, 39, nil, 39) - (IS_KR3 and 19 or 0))

	self.back:add_child(header)

	local title = GGOptionsLabel:new(V.v(240, 30))

	title.text = _("SFX")
	title.text_align = "center"
	title.fit_lines = 1
	title.anchor.x = title.size.x / 2
	title.pos = V.v(self.back.size.x / 2, y)
	title.vertical_align = "middle"

	self.back:add_child(title)

	y = y + title.size.y + 7

	local s_sfx = VolumeSlider:new("options_sounds_0004", "options_sounds_0005", "options_sounds_0006")

	s_sfx.pos = V.v(self.back.size.x / 2, y)
	s_sfx.anchor.x = s_sfx.size.x / 2

	function s_sfx:on_change(value)
		S:set_main_gain_fx(value)
	end

	s_sfx.id = "s_sfx"

	self.back:add_child(s_sfx)

	y = y + 50
	title = GGOptionsLabel:new(V.v(200, 30))
	title.text = _("Music")
	title.text_align = "center"
	title.fit_lines = 1
	title.pos = V.v(self.back.size.x / 2, y)
	title.anchor.x = title.size.x / 2
	title.vertical_align = "middle"

	self.back:add_child(title)

	y = y + title.size.y + 7

	local s_music = VolumeSlider:new("options_sounds_0001", "options_sounds_0002", "options_sounds_0003")

	function s_music:on_change(value)
		S:set_main_gain_music(value)
	end

	s_music.pos = V.v(self.back.size.x / 2, y)
	s_music.anchor.x = s_music.size.x / 2
	s_music.id = "s_music"

	self.back:add_child(s_music)

	y = y + 85 - 30
	title = GGOptionsLabel:new(V.v(200, 38))
	title.text = _("Difficulty")
	title.text_align = "center"
	title.vertical_align = CJK("middle-caps", "middle", nil, nil)
	title.pos = V.v(self.back.size.x / 2, y)
	title.anchor.x = title.size.x / 2
	title.propagate_on_click = true
	title.fit_size = true

	self.back:add_child(title)

	self.difficulty_idx = screen_map.user_data.difficulty

	if not self.difficulty_idx then
		self.difficulty_idx = 1
	end

	self.difficulty_labels = {
		"LEVEL_SELECT_DIFFICULTY_CASUAL",
		"LEVEL_SELECT_DIFFICULTY_NORMAL",
		"LEVEL_SELECT_DIFFICULTY_VETERAN",
		"LEVEL_SELECT_DIFFICULTY_IMPOSSIBLE"
	}
	y = y + 38

	local diff_bg = KImageView:new("difficulty_select_bg")

	diff_bg.anchor.x = diff_bg.size.x / 2
	diff_bg.pos = v(self.back.size.x / 2, y)

	self.back:add_child(diff_bg)

	self.difficulty = GGLabel:new(V.v(220, 46))
	self.difficulty.pos = v(self.back.size.x / 2, y)
	self.difficulty.anchor.x = self.difficulty.size.x / 2
	self.difficulty.vertical_align = CJK("middle-caps", "middle", nil, nil)
	self.difficulty.text_align = "center"
	self.difficulty.font_name = CJK("body", nil, nil, "h")
	self.difficulty.font_size = 24
	self.difficulty.text = _(self.difficulty_labels[self.difficulty_idx])
	self.difficulty.colors.text = {
		214,
		189,
		131
	}
	self.difficulty.colors.text_default = {
		214,
		189,
		131
	}
	self.difficulty.colors.text_hover = {
		255,
		223,
		0
	}
	self.difficulty.fit_size = true

	self.back:add_child(self.difficulty)

	function self.difficulty.on_enter(this)
		this.colors.text = this.colors.text_hover
	end

	function self.difficulty.on_exit(this)
		this.colors.text = this.colors.text_default
	end

	function self.difficulty.on_click(this)
		screen_map.option_panel:hide()
		screen_map.difficulty_view:show()
	end

	mx = 150
	y = y + 120 - 10

	local b

	b = GGOptionsButton:new(_("BUTTON_QUIT"))
	b.anchor.x = 0
	b.pos = V.v(mx, y)

	function b.on_click()
		screen_map.done_callback({
			next_item_name = "slots"
		})
		S:queue("GUIButtonCommon")
	end

	self.quit = b

	self.back:add_child(b)

	b = GGOptionsButton:new(_("BUTTON_RESUME"))
	b.anchor.x = b.size.x
	b.pos = V.v(self.back.size.x - mx, y)

	function b.on_click()
		S:queue("GUIButtonCommon")
		self:hide()
	end

	self.resume = b

	self.back:add_child(b)

	local settings = storage:load_settings()

	if settings then
		if settings.volume_fx and type(settings.volume_fx) == "number" then
			s_sfx:set_value(km.clamp(0, 1, settings.volume_fx))
		end

		if settings.volume_music and type(settings.volume_music) == "number" then
			s_music:set_value(km.clamp(0, 1, settings.volume_music))
		end
	end
end

function OptionsView:show()
	OptionsView.super.show(self)

	self.difficulty_idx = screen_map.user_data.difficulty

	if not self.difficulty_idx then
		self.difficulty_idx = 1
	end

	self.difficulty.text = _(self.difficulty_labels[self.difficulty_idx])
	self._last_volume_fx = km.clamp(0, 1, self:get_child_by_id("s_sfx").value)
	self._last_volume_music = km.clamp(0, 1, self:get_child_by_id("s_music").value)
end

function OptionsView:hide()
	OptionsView.super.hide(self)

	local s_sfx = self:get_child_by_id("s_sfx")
	local s_music = self:get_child_by_id("s_music")

	if self._last_volume_fx ~= s_sfx.value or self._last_volume_music ~= s_music.value then
		local settings = storage:load_settings()

		settings.volume_fx = km.clamp(0, 1, s_sfx.value)
		settings.volume_music = km.clamp(0, 1, s_music.value)

		storage:save_settings(settings)
	end
end

DifficultyButton = class("DifficultyButton", KImageButton)

function DifficultyButton:initialize(label_text, desc_text, difficulty)
	KImageButton.initialize(self, "difficulty_btns_notxt_marco_0001", "difficulty_btns_notxt_marco_0002", "difficulty_btns_notxt_marco_0001")

	self.scale = V.v(1, 1)
	self.on_down_scale = 0.98
	self.anchor.x, self.anchor.y = self.size.x / 2, self.size.y / 2

	local illus = KImageView:new("difficulty_btns_ilustraciones_000" .. difficulty)

	illus.anchor.x, illus.anchor.y = illus.size.x / 2, illus.size.y / 2
	illus.pos.x, illus.pos.y = self.size.x / 2, self.size.y / 2

	self:add_child(illus)

	local glow = KImageView:new("difficulty_btns_notxt_marco_0003")

	glow.hidden = true

	self:add_child(glow)

	self.glow = glow

	local label = GGShaderLabel:new(V.v(268, 50))

	label.font_name = "h"
	label.font_size = 46
	label.text_align = "center"
	label.vertical_align = "middle-caps"
	label.colors.text = {
		255,
		226,
		99,
		255
	}
	label.propagate_on_up = true
	label.propagate_on_down = true
	label.propagate_on_click = true
	label.text = label_text
	label.fit_lines = 1
	label.shaders = {
		"p_bands",
		"p_outline",
		"p_glow"
	}
	label.shader_args = {
		{
			margin = 2,
			p1 = 0,
			p2 = 0.47,
			c1 = {
				1,
				0.8862745098039215,
				0.38823529411764707,
				1
			},
			c2 = {
				1,
				0.8862745098039215,
				0.38823529411764707,
				1
			},
			c3 = {
				0.8509803921568627,
				0.5137254901960784,
				0.10588235294117647,
				1
			}
		},
		{
			thickness = 2.5,
			outline_color = {
				0.2901960784313726,
				0.1607843137254902,
				0,
				1
			}
		},
		{
			thickness = 1.6,
			glow_color = {
				0,
				0,
				0,
				0.6
			}
		}
	}
	label.anchor = v(label.size.x / 2, label.size.y)
	label.pos = v(self.size.x / 2, 272)

	self:add_child(label)

	self.label = label

	local desc = GGLabel:new(V.v(260, 92))

	desc.font_name = "body"
	desc.font_size = 20
	desc.line_height = CJK(1, nil, nil, 0.8)
	desc.text_align = "center"
	desc.vertical_align = "top"
	desc.colors.text = {
		255,
		232,
		189
	}
	desc.propagate_on_up = true
	desc.propagate_on_down = true
	desc.propagate_on_click = true
	desc.text = desc_text
	desc.fit_lines = 3
	desc.anchor = v(desc.size.x / 2, 0)
	desc.pos = v(self.size.x / 2, 280)

	self:add_child(desc)

	self.desc = desc
end

function DifficultyButton:on_down(button, x, y)
	if self.on_down_scale then
		self.original_scale = V.vclone(self.scale)
		self.scale.x, self.scale.y = self.scale.x * self.on_down_scale, self.scale.y * self.on_down_scale
	end
end

function DifficultyButton:on_up(button, x, y)
	if self.on_down_scale and self.original_scale then
		self.scale = self.original_scale
	end
end

function DifficultyButton:on_exit(drag_view)
	if DifficultyButton.super.on_exit then
		DifficultyButton.super.on_exit(self, drag_view)
	end

	if self.on_down_scale and self.original_scale then
		self.scale = self.original_scale
	end

	self.glow.hidden = true
end

function DifficultyButton:on_enter(drag_view)
	if DifficultyButton.super.on_enter then
		DifficultyButton.super.on_enter(self, drag_view)
	end

	self.glow.hidden = false
end

function DifficultyButton:disable(tint, color)
	DifficultyButton.super.disable(self, tint, color)

	local args = self.label.shader_args[1]

	args.c1 = {
		0.6078431372549019,
		0.49411764705882355,
		0,
		1
	}
	args.c2 = {
		0.6078431372549019,
		0.49411764705882355,
		0,
		1
	}
	args.c3 = {
		0.4588235294117647,
		0.12156862745098039,
		0,
		1
	}
end

function DifficultyButton:enable(untint)
	DifficultyButton.super.disable(self, untint)

	local args = self.label.shader_args[1]

	args.c1 = {
		1,
		0.8862745098039215,
		0.38823529411764707,
		1
	}
	args.c2 = {
		1,
		0.8862745098039215,
		0.38823529411764707,
		1
	}
	args.c3 = {
		0.8509803921568627,
		0.5137254901960784,
		0.10588235294117647,
		1
	}
end

DifficultyView = class("DifficultyView", PopUpView)

function DifficultyView:initialize(sw, sh)
	PopUpView.initialize(self, V.v(sw, sh))

	local impo = GS.max_difficulty > DIFFICULTY_HARD

	self.back = KImageView:new(impo and "difficulty_bg_wide_notxt" or "difficulty_bg_notxt")
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2, sh / 2)

	self:add_child(self.back)

	sw = self.back.size.x
	sh = self.back.size.y

	if IS_KR3 then
		local header_bg = KImageView("kr3_title_bg")

		header_bg.anchor.x = km.round(header_bg.size.x / 2)
		header_bg.pos = v(km.round(self.back.size.x / 2), -30)

		self.back:add_child(header_bg)
	end

	local header = GGPanelHeader:new(_("DIFFICULTY LEVEL"), 260)

	header.pos = V.v(sw / 2, 29 + (IS_KR3 and -34 or 0))
	header.anchor.x = 130

	self.back:add_child(header)

	local campaign_done = #screen_map.user_data.levels > GS.main_campaign_levels
	local b_y = sh / 2 + (impo and -20 or 0)
	local offset = 90
	local aw = self.back.size.x - 2 * offset
	local sep = impo and -15 or 0
	local b_xs = impo and {
		sw / 2 - 400,
		sw / 2 - 133.33333333333334,
		sw / 2 + 133.33333333333334,
		sw / 2 + 400
	} or {
		sw / 2 - 330,
		sw / 2,
		sw / 2 + 330
	}
	local b_texts = {
		{
			_("LEVEL_SELECT_DIFFICULTY_CASUAL"),
			_("For beginners to strategy games!")
		},
		{
			_("LEVEL_SELECT_DIFFICULTY_NORMAL"),
			_("A good challenge!")
		},
		{
			_("LEVEL_SELECT_DIFFICULTY_VETERAN"),
			_("Hardcore! play at your own risk!")
		}
	}

	if impo then
		table.insert(b_texts, {
			_("LEVEL_SELECT_DIFFICULTY_IMPOSSIBLE"),
			campaign_done and _("DIFFICULTY_SELECTION_IMPOSSIBLE_DESCRIPTION") or _("DIFFICULTY_SELECTION_IMPOSSIBLE_LOCKED_DESCRIPTION")
		})
	end

	for i, set in pairs(b_texts) do
		local title, desc = unpack(set)
		local b = DifficultyButton:new(title, desc, i)
		local bw = b.size.x
		local x

		if impo then
			x = sw / 2 + (2 * i - 5) * (bw / 2 + sep / 2)
		else
			x = sw / 2 + (i - 2) * (bw + sep)
		end

		b.pos = V.v(x, b_y)

		if i == 4 and not campaign_done then
			b:disable()
		end

		function b.on_click(this, b, x, y)
			S:queue("GUIButtonCommon")

			screen_map.user_data.difficulty = i

			storage:save_slot(screen_map.user_data)
			self:hide()
		end

		self.back:add_child(b)
	end

	local tip = GGLabel:new(V.v(550, 40))

	tip.font_name = "body"
	tip.font_size = 20
	tip.text_align = "left"
	tip.vertical_align = "middle"
	tip.colors.text = {
		255,
		232,
		189
	}
	tip.propagate_on_up = true
	tip.propagate_on_down = true
	tip.propagate_on_click = true
	tip.text = _("You can always change the difficulty in the options menu.")
	tip.fit_lines = 1
	tip.anchor = v(0, 0)
	tip.pos = v(354 + (impo and 82 or 0), 584)

	self.back:add_child(tip)
end

AchievementsView = class("AchievementsView", PopUpView)

function AchievementsView:initialize(sw, sh)
	PopUpView.initialize(self, V.v(sw, sh))

	self.back = KImageView:new("Achievements_BG_notxt")
	self.back.anchor = v(self.back.size.x / 2, self.back.size.y / 2)
	self.back.pos = v(sw / 2 - 15, sh / 2)

	self:add_child(self.back)

	sw = self.back.size.x
	sh = self.back.size.y

	if IS_KR3 then
		local header_bg = KImageView("kr3_title_bg")

		header_bg.anchor.x = km.round(header_bg.size.x / 2)
		header_bg.pos = v(km.round(self.back.size.x / 2) - 10, -24)

		self.back:add_child(header_bg)
	end

	local header = GGPanelHeader:new(_("ACHIEVEMENTS"), 274)

	header.pos = V.v(364, CJK(39, 35, nil, 36) + (IS_KR3 and -36 or 0))

	self.back:add_child(header)

	local close_button = KImageButton:new("levelSelect_closeBtn_0001", "levelSelect_closeBtn_0002", "levelSelect_closeBtn_0003")

	close_button.pos = v(self.back.size.x - 55, 31)
	self.close_button = close_button

	self.back:add_child(close_button)

	function close_button.on_click(this, x, y)
		S:queue("GUIButtonCommon")
		self:hide()
	end

	self.items_per_page = 10
	self.max_pages = math.ceil(#achievements_data / self.items_per_page)
	self.boxes = {}

	for i = 1, self.items_per_page do
		local ach = KImageView:new("Achievements_Box_Large")

		ach.anchor = v(math.floor(ach.size.x / 2), math.floor(ach.size.y / 2))
		ach.pos = v(self.back.size.x / 2, 173 + math.floor((i - 1) / 2) * 108)

		if i % 2 == 0 then
			ach.pos.x = ach.pos.x + 230
		else
			ach.pos.x = ach.pos.x - 230
		end

		ach.img = KImageView:new("achievement_icons_0001")
		ach.img.anchor = v(math.floor(ach.img.size.x / 2), math.floor(ach.img.size.y / 2))
		ach.img.pos = IS_KR3 and v(59, 53) or v(57, 49)

		ach:add_child(ach.img)

		ach.title = GGLabel:new(V.v(260, 32))
		ach.title.pos = v(118, 2 + (IS_KR3 and 4 or 0))
		ach.title.font_name = "h"
		ach.title.font_size = 18
		ach.title.colors.text = {
			233,
			224,
			117
		}
		ach.title.text_align = "left"
		ach.title.vertical_align = "bottom"
		ach.title.fit_lines = 1

		ach:add_child(ach.title)

		ach.desc = GGLabel:new(V.v(260, 40))
		ach.desc.pos = v(118, CJK(33, nil, 36, 36) + (IS_KR3 and 6 or 0))
		ach.desc.font_name = "body"
		ach.desc.font_size = 15
		ach.desc.colors.text = {
			156,
			152,
			126
		}
		ach.desc.line_height = CJK(0.75, nil, 1.1, 0.9)
		ach.desc.text_align = "left"
		ach.desc.fit_lines = CJK(4, nil, nil, 2)

		ach:add_child(ach.desc)
		self.back:add_child(ach)

		self.boxes[i] = ach
	end

	local button_w = 45
	local start_x = math.floor(self.back.size.x / 2 - button_w * self.max_pages / 2)
	local ox = start_x

	for i = 1, self.max_pages do
		local o_button = AchievementsPageButton:new(i)

		o_button.pos = v(ox, 696)
		o_button.page_idx = i

		self.back:add_child(o_button)

		ox = ox + button_w
	end

	self:createPage(1)
end

function AchievementsView:show()
	self:createPage(1)
	AchievementsView.super.show(self)
end

function AchievementsView:createPage(pagenum)
	local init = (pagenum - 1) * self.items_per_page

	for i = 1, self.items_per_page do
		if init + i <= #achievements_data then
			local ach = achievements_data[init + i]
			local box = self.boxes[i]

			box.hidden = false

			if not screen_map.user_data.achievements then
				screen_map.user_data.achievements = {}
			end

			local isActive = screen_map.user_data.achievements[ach.name]

			if isActive then
				box.img:set_image("achievement_icons_" .. string.format("%04i", ach.icon))
			else
				box.img:set_image("achievement_icons_disabled_" .. string.format("%04i", ach.icon))
			end

			local prefix = IS_KR3 and "ELVES_" or ""
			local title = _(prefix .. "ACHIEVEMENT_" .. ach.name .. "_NAME")
			local desc = _(prefix .. "ACHIEVEMENT_" .. ach.name .. "_DESCRIPTION")

			box.title.text = title
			box.desc.text = desc

			if isActive then
				box.desc.colors.text = {
					156,
					152,
					126
				}
				box.title.colors.text = {
					233,
					224,
					177
				}
			else
				box.desc.colors.text = {
					107,
					98,
					87
				}
				box.title.colors.text = {
					107,
					98,
					87
				}
			end

			function box.img.on_click(this, button, x, y)
				if isActive then
					log.info("Manually retriggering achievement signal for ach %s", ach.name)
					signal.emit("got-achievement", ach.name)
				end
			end
		else
			local box = self.boxes[i]

			box.hidden = true
		end
	end

	self.current_page_idx = pagenum

	for _, c in pairs(self.back.children) do
		if c:isInstanceOf(AchievementsPageButton) then
			if c.page_idx == pagenum then
				c:select()
			else
				c:deselect()
			end
		end
	end
end

AchievementsPageButton = class("AchievementsPageButton", GGButton)
AchievementsPageButton.static.init_arg_names = {
	"label_text"
}

function AchievementsPageButton:initialize(label_text)
	local rs = GGLabel.static.ref_h / REF_H

	GGButton.initialize(self, "Achievements_page_0001", "Achievements_page_0002", "Achievements_page_0002")

	self.deselected_image_name = "Achievements_page_0001"
	self.selected_image_name = "Achievements_page_0003"
	self.label.pos.x, self.label.pos.y = rs * 1, 0
	self.label.vertical_align = "middle-caps"
	self.label.font_name = "numbers_bold"
	self.label.font_size = rs * 14
	self.label.fit_lines = 1

	if not self.label_text_key and label_text then
		self.label.text = label_text
	end

	self.on_down_scale = 0.95
end

function AchievementsPageButton:on_click()
	S:queue("GUIButtonCommon")
	self.parent.parent:createPage(self.page_idx)
end

function AchievementsPageButton:select()
	self.default_image_name = self.selected_image_name

	self:disable()
	self:set_image(self.selected_image_name)
end

function AchievementsPageButton:deselect()
	self.default_image_name = self.deselected_image_name

	self:enable()

	if not self:is_disabled() then
		self:set_image(self.default_image_name)
	end
end

return screen_map
