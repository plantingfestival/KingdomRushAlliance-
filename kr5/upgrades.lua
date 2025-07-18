﻿-- chunkname: @./kr5/upgrades.lua

local log = require("klua.log"):new("upgrades")
local E = require("entity_db")
local bit = require("bit")

require("constants")

local balance = require("balance/balance")
local storage = require("storage")
local GS = require("game_settings")
local km = require("klua.macros")
local U = require("utils")
local V = require("klua.vector")

local function T(name)
	return E:get_template(name)
end

local function fts(v)
	return v / FPS
end

local epsilon = 1e-09
local upgrades = {}

upgrades.max_level = nil
upgrades.levels = {}
upgrades.levels.towers = 0
upgrades.levels.heroes = 0
upgrades.levels.reinforcements = 0
upgrades.levels.alliance = 0
upgrades.display_order = {
	"towers",
	"heroes",
	"reinforcements",
	"alliance"
}
upgrades.list = {
	towers_war_rations = {
		key = "towers_war_rations",
		class = "towers",
		id = 1,
		price = 1,
		level = 1,
		next = {
			3
		}
	},
	towers_wise_investment = {
		key = "towers_wise_investment",
		class = "towers",
		id = 2,
		price = 1,
		level = 2,
		next = {
			4
		}
	},
	towers_scoping_mechanism = {
		key = "towers_scoping_mechanism",
		class = "towers",
		id = 3,
		price = 2,
		level = 2,
		next = {
			2,
			5
		}
	},
	towers_golden_time = {
		key = "towers_golden_time",
		class = "towers",
		id = 4,
		price = 2,
		level = 3,
		next = {
			6
		}
	},
	towers_royal_training = {
		key = "towers_royal_training",
		class = "towers",
		id = 5,
		price = 2,
		level = 4,
		next = {
			7
		}
	},
	towers_favorite_customer = {
		key = "towers_favorite_customer",
		class = "towers",
		id = 6,
		price = 3,
		level = 4,
		next = {}
	},
	towers_improved_formulas = {
		key = "towers_improved_formulas",
		class = "towers",
		id = 7,
		price = 3,
		level = 3,
		next = {
			8
		}
	},
	towers_keen_accuracy = {
		key = "towers_keen_accuracy",
		class = "towers",
		id = 8,
		price = 4,
		level = 5,
		next = {}
	},
	heroes_desperate_effort = {
		key = "heroes_desperate_effort",
		class = "heroes",
		id = 1,
		price = 1,
		level = 1,
		next = {
			2,
			3
		}
	},
	heroes_lone_wolves = {
		key = "heroes_lone_wolves",
		class = "heroes",
		id = 2,
		price = 1,
		level = 2,
		next = {
			4
		},
		check_cooldown = fts(25)
	},
	heroes_visual_learning = {
		key = "heroes_visual_learning",
		class = "heroes",
		id = 3,
		price = 1,
		level = 2,
		next = {
			4
		},
		check_cooldown = fts(30)
	},
	heroes_unlimited_vigor = {
		key = "heroes_unlimited_vigor",
		class = "heroes",
		id = 4,
		price = 2,
		level = 3,
		next = {
			5,
			6
		}
	},
	heroes_lethal_focus = {
		key = "heroes_lethal_focus",
		class = "heroes",
		id = 5,
		price = 2,
		level = 4,
		next = {
			7
		}
	},
	heroes_nimble_physique = {
		key = "heroes_nimble_physique",
		class = "heroes",
		id = 6,
		price = 2,
		level = 4,
		next = {
			7
		}
	},
	heroes_limit_pushing = {
		key = "heroes_limit_pushing",
		class = "heroes",
		id = 7,
		price = 3,
		level = 5,
		next = {}
	},
	reinforcements_master_blacksmiths = {
		key = "reinforcements_master_blacksmiths",
		class = "reinforcements",
		id = 1,
		price = 1,
		level = 1,
		next = {
			2
		}
	},
	reinforcements_intense_workout = {
		key = "reinforcements_intense_workout",
		class = "reinforcements",
		id = 2,
		price = 1,
		level = 2,
		next = {
			3,
			4
		}
	},
	reinforcements_rebel_militia = {
		class = "reinforcements",
		key = "reinforcements_rebel_militia",
		id = 3,
		price = 2,
		level = 3,
		next = {
			5
		},
		blocks = {
			4
		}
	},
	reinforcements_shadow_archer = {
		class = "reinforcements",
		key = "reinforcements_shadow_archer",
		id = 4,
		price = 2,
		level = 3,
		next = {
			6
		},
		blocks = {
			3
		}
	},
	reinforcements_thorny_armor = {
		key = "reinforcements_thorny_armor",
		class = "reinforcements",
		id = 5,
		price = 2,
		level = 4,
		next = {
			7
		}
	},
	reinforcements_night_veil = {
		key = "reinforcements_night_veil",
		class = "reinforcements",
		id = 6,
		price = 2,
		level = 4,
		next = {
			8
		}
	},
	reinforcements_power_trio = {
		key = "reinforcements_power_trio",
		class = "reinforcements",
		id = 7,
		price = 4,
		level = 5,
		next = {}
	},
	reinforcements_power_trio_dark = {
		key = "reinforcements_power_trio_dark",
		class = "reinforcements",
		id = 8,
		price = 4,
		level = 5,
		next = {}
	},
	alliance_corageous_stand = {
		key = "alliance_corageous_stand",
		class = "alliance",
		id = 1,
		price = 1,
		level = 1,
		next = {
			3
		},
		check_cooldown = fts(40)
	},
	alliance_merciless = {
		key = "alliance_merciless",
		class = "alliance",
		id = 2,
		price = 1,
		level = 1,
		next = {
			4
		},
		check_cooldown = fts(35)
	},
	alliance_friends_of_the_crown = {
		key = "alliance_friends_of_the_crown",
		class = "alliance",
		id = 3,
		price = 2,
		level = 2,
		next = {
			5
		}
	},
	alliance_shady_company = {
		key = "alliance_shady_company",
		class = "alliance",
		id = 4,
		price = 2,
		level = 2,
		next = {
			5
		}
	},
	alliance_shared_reserves = {
		key = "alliance_shared_reserves",
		class = "alliance",
		id = 5,
		price = 2,
		level = 3,
		next = {
			6,
			7
		}
	},
	alliance_flux_altering_coils = {
		key = "alliance_flux_altering_coils",
		class = "alliance",
		id = 6,
		price = 3,
		level = 4,
		next = {
			8
		}
	},
	alliance_seal_of_punishment = {
		key = "alliance_seal_of_punishment",
		class = "alliance",
		id = 7,
		price = 3,
		level = 4,
		next = {
			9
		}
	},
	alliance_display_of_true_might_linirea = {
		key = "alliance_display_of_true_might_linirea",
		class = "alliance",
		id = 8,
		price = 3,
		level = 5,
		next = {}
	},
	alliance_display_of_true_might_dark = {
		key = "alliance_display_of_true_might_dark",
		class = "alliance",
		id = 9,
		price = 3,
		level = 5,
		next = {}
	}
}

function upgrades:get_by_group_idx(group, idx)
	for _, v in pairs(self.list) do
		if v.class == group and v.id == idx then
			return v
		end
	end

	return nil
end

function upgrades:set_levels(levels)
	for k, v in pairs(levels) do
		self.levels[k] = v
	end
end

function upgrades:get_upgrade(name)
	local u = self.list[name]

	if u and table.contains(self.levels[u.class], u.id) then
		return u
	end

	return nil
end

function upgrades:get_previous_upgrades(group, idx)
	local prev_idx = {}

	for _, v in pairs(self.list) do
		if v.class == group and v.next and table.contains(v.next, idx) then
			table.insert(prev_idx, v)
		end
	end

	return prev_idx
end

function upgrades:get_spent_points()
	local spent_points = 0
	local user_data = storage:load_slot()

	for _, u in pairs(self.list) do
		for _, uidx in pairs(user_data.upgrades[u.class]) do
			if uidx == u.id then
				spent_points = spent_points + u.price

				break
			end
		end
	end

	return spent_points
end

function upgrades:get_current_points_by_level()
	local last_level = 1
	local user_data = storage:load_slot()

	for lvl, value in ipairs(user_data.levels) do
		if value[1] ~= nil then
			last_level = lvl
		end
	end

	if DEBUG and storage.active_slot_idx == "1" then
		return 60
	end

	if last_level > GS.main_campaign_levels then
		last_level = GS.main_campaign_levels
	end

	local b = balance.upgrades

	return b.points_distribution[last_level]
end

function upgrades:set_upgrades_current_for(level)
	if DEBUG then
		local function block_item(upgrade, bought, class)
			for _, bougth_id in pairs(bought) do
				local item = self:get_by_group_idx(class, bougth_id)

				if item.blocks and table.contains(item.blocks, upgrade.id) then
					return true
				end
			end

			return false
		end

		local function get_next_buy(bought, level, class)
			for _, v in pairs(self.list) do
				if v.class == class and level >= v.level then
					for _, bougth_id in pairs(bought) do
						local upgrade = self:get_by_group_idx(class, bougth_id)

						if table.contains(upgrade.next, v.id) and not table.contains(bought, v.id) and not block_item(v, bought, class) then
							return v
						end
					end
				end
			end

			return nil
		end

		local user_data = storage:load_slot()
		local b = balance.upgrades

		if level <= 1 then
			level = 2
		end

		local points = b.points_distribution[km.clamp(1, 16, level - 1)]

		user_data.upgrades = {
			towers = {
				1
			},
			heroes = {
				1
			},
			reinforcements = {
				1
			},
			alliance = {
				1,
				2
			}
		}

		if level > 6 then
			if math.random() > 0.5 then
				table.insert(user_data.upgrades.reinforcements, 3)
			else
				table.insert(user_data.upgrades.reinforcements, 4)
			end
		end

		local upgrade_found = false
		local level = 2

		points = points - 5

		repeat
			upgrade_found = false

			for class, list in pairs(user_data.upgrades) do
				local idx = 1
				local upgrade = get_next_buy(list, level, class)

				if upgrade and points > upgrade.price then
					points = points - upgrade.price

					table.insert(user_data.upgrades[class], upgrade.id)

					upgrade_found = true

					log.info("buy upgrade " .. class .. " id " .. upgrade.id .. " points remain " .. points)
				end
			end

			level = level + 1
		until points <= 0 or not upgrade_found
	end
end

function upgrades:get_points_by_level(level_idx)
	local b = balance.upgrades

	return b.points_distribution[km.clamp(1, 16, level_idx)]
end

function upgrades:get_upgrade_bitfield(class)
	local out = 0
	local user_data = storage:load_slot()
	local u = user_data.upgrades

	if not u[class] then
		log.error("upgrade class %s not found", class)

		return out
	end

	for _, v in pairs(u[class]) do
		out = bit.bor(out, 2^(v - 1))
	end

	return out
end

function upgrades:get_upgrade_array(bitfield)
	local out = {}

	for i = 0, 15 do
		if bit.band(bitfield, 2^i) ~= 0 then
			table.insert(out, i + 1)
		end
	end

	return out
end

function upgrades:patch_templates(max_level)
	if max_level then
		self.max_level = max_level
	end

	local b = balance.upgrades
	local u
	local all_towers = {
		"tower_paladin_covenant_lvl",
		"tower_demon_pit_lvl",
		"tower_tricannon_lvl",
		"tower_royal_archers_lvl",
		"tower_arborean_emissary_lvl",
		"tower_elven_stargazers_lvl",
		"tower_arcane_wizard_lvl",
		"tower_necromancer_lvl",
		"tower_ballista_lvl",
		"tower_flamespitter_lvl",
		"tower_rocket_gunners_lvl",
		"tower_barrel_lvl",
		"tower_sand_lvl",
		"tower_ghost_lvl",
		"tower_ray_lvl",
		"tower_dark_elf_lvl",
		"tower_hermit_toad_lvl",
		"tower_dwarf_lvl",
		"tower_sparking_geode_lvl"
	}

	u = self:get_upgrade("towers_war_rations")

	if u then
		for _, n in pairs(all_towers) do
			for i = 1, 4 do
				if T(n .. i).barrack then
					local st = T(T(n .. i).barrack.soldier_type)

					st.health.hp_max = km.round(st.health.hp_max * b.towers_war_rations.hp_factor)
				end
			end
		end

		for i = 1, 4 do
			for _, n in pairs({
				"soldier_tower_necromancer_skeleton_lvl",
				"soldier_tower_necromancer_skeleton_golem_lvl",
				"soldier_tower_demon_pit_basic_attack_lvl"
			}) do
				T(n .. i).health.hp_max = km.round(T(n .. i).health.hp_max * b.towers_war_rations.hp_factor)
			end
		end

		T("big_guy_tower_demon_pit_lvl4").health.hp_max = km.round(T("big_guy_tower_demon_pit_lvl4").health.hp_max * b.towers_war_rations.hp_factor)
		T("soldier_tower_barrel_skill_warrior").war_rations_hp_factor = b.towers_war_rations.hp_factor
		T("tower_paladin_covenant_soldier_lvl4").powers.lead.b.hp = T("tower_paladin_covenant_soldier_lvl4").powers.lead.b.hp * b.towers_war_rations.hp_factor
		T("soldier_tower_dark_elf").war_rations_hp_factor = b.towers_war_rations.hp_factor
	end

	u = self:get_upgrade("towers_wise_investment")

	if u then
		for _, n in pairs(all_towers) do
			for i = 1, 4 do
				T(n .. i).tower.refund_factor = b.towers_wise_investment.refund_factor
			end
		end
	end

	u = self:get_upgrade("towers_scoping_mechanism")

	if u then
		local range_factor = b.towers_scoping_mechanism.range_factor
		local rally_range_factor = b.towers_scoping_mechanism.rally_range_factor

		for _, n in pairs(all_towers) do
			for i = 1, 4 do
				local t = T(n .. i)

				if t.barrack then
					t.barrack.rally_range = t.barrack.rally_range * rally_range_factor
				end

				if t.attacks then
					t.attacks.range = t.attacks.range * range_factor
				end
			end
		end
	end

	u = self:get_upgrade("towers_golden_time")

	if u then
		GS.early_wave_reward_per_second = GS.early_wave_reward_per_second_default * b.towers_golden_time.early_wave_reward_per_second_factor
	else
		GS.early_wave_reward_per_second = GS.early_wave_reward_per_second_default
	end

	u = self:get_upgrade("towers_improved_formulas")

	if u then
		local r_factor = b.towers_improved_formulas.range_factor

		for _, n in pairs({
			"soldier_tower_demon_pit_basic_attack_lvl"
		}) do
			for i = 1, 4 do
				for j = 1, 4 do
					T(n .. i).explosion_range[j] = T(n .. i).explosion_range[j] * r_factor
				end
			end
		end

		for i = 1, 4 do
			T("tower_tricannon_bomb_" .. i).bullet.damage_radius = T("tower_tricannon_bomb_" .. i).bullet.damage_radius * r_factor
		end

		T("tower_tricannon_bomb_bombardment_bomb").bullet.damage_radius = T("tower_tricannon_bomb_bombardment_bomb").bullet.damage_radius * r_factor
		T("soldier_tower_rocket_gunners_lvl4").melee.attacks[2].damage_radius = T("soldier_tower_rocket_gunners_lvl4").melee.attacks[2].damage_radius * r_factor
		T("bullet_tower_ballista_skill_bomb").bullet.damage_radius = T("bullet_tower_ballista_skill_bomb").bullet.damage_radius * r_factor
		T("bullet_tower_flamespitter_skill_bomb").bullet.damage_radius = T("bullet_tower_flamespitter_skill_bomb").bullet.damage_radius * r_factor
		T("controller_tower_flamespitter_column").radius_in = T("controller_tower_flamespitter_column").radius_in * r_factor
		T("controller_tower_flamespitter_column").radius_out = T("controller_tower_flamespitter_column").radius_out * r_factor

		for i = 1, 4 do
			T("bullet_tower_barrel_lvl" .. i).bullet.damage_radius = T("bullet_tower_barrel_lvl" .. i).bullet.damage_radius * r_factor
		end

		T("aura_bullet_tower_barrel_skill_barrel").explosion_damage_radius = T("aura_bullet_tower_barrel_skill_barrel").explosion_damage_radius * r_factor

		for i = 1, 4 do
			T("bullet_tower_hermit_toad_engineer_basic_lvl" .. i).bullet.damage_radius = T("bullet_tower_hermit_toad_engineer_basic_lvl" .. i).bullet.damage_radius * r_factor
		end
	end

	u = self:get_upgrade("towers_favorite_customer")

	if u then
		u.refund_cost_factor = b.towers_favorite_customer.refund_cost_factor
		u.refund_cost_factor_one_level = b.towers_favorite_customer.refund_cost_factor_one_level
	end

	u = self:get_upgrade("towers_keen_accuracy")

	if u then
		for _, n in pairs(all_towers) do
			local template = T(n .. 4)

			for _, p in pairs(T(n .. 4).powers) do
				if p.cooldown then
					for k, _ in pairs(p.cooldown) do
						p.cooldown[k] = p.cooldown[k] * b.towers_keen_accuracy.cooldown_mult
					end
				end
			end
		end
	end

	local all_heroes = {
		"hero_vesper",
		"hero_raelyn",
		"hero_muyrn",
		"hero_venom",
		"hero_builder",
		"hero_hunter",
		"hero_space_elf",
		"hero_robot",
		"hero_mecha",
		"hero_lumenir",
		"hero_dragon_gem",
		"hero_bird",
		"hero_dragon_bone",
		"hero_dragon_arb",
		"hero_spider"
	}

	u = self:get_upgrade("heroes_desperate_effort")

	if u then
		local armor_p = b.heroes_desperate_effort.armor_penetration
		local all_basic = {}

		for _, h in pairs(all_heroes) do
			if T(h).melee then
				for _, ma in pairs(T(h).melee.attacks) do
					if ma.basic_attack then
						ma.reduce_armor = ma.reduce_armor + armor_p
						ma.reduce_magic_armor = ma.reduce_magic_armor + armor_p
					end
				end
			end

			if T(h).ranged then
				for _, ra in pairs(T(h).ranged.attacks) do
					if ra.basic_attack then
						local bt = T(ra.bullet)

						bt.bullet.reduce_armor = bt.bullet.reduce_armor + armor_p
						bt.bullet.reduce_magic_armor = bt.bullet.reduce_magic_armor + armor_p
					end
				end
			end

			if T(h).timed_attacks then
				for _, ta in pairs(T(h).timed_attacks.list) do
					if ta.basic_attack and ta.bullet then
						local bt = T(ta.bullet)

						bt.bullet.reduce_armor = bt.bullet.reduce_armor + armor_p
						bt.bullet.reduce_magic_armor = bt.bullet.reduce_magic_armor + armor_p
					end
				end
			end
		end
	end

	u = self:get_upgrade("heroes_visual_learning")

	if u then
		u.modifier = "mod_upgrade_visual_learning"
		u.distance_to_trigger = b.heroes_visual_learning.distance_to_trigger
	end

	u = self:get_upgrade("heroes_lone_wolves")

	if u then
		u.modifier = "mod_upgrade_lone_wolves"
		u.distance_to_trigger = b.heroes_lone_wolves.distance_to_trigger
	end

	u = self:get_upgrade("heroes_unlimited_vigor")

	if u then
		local cd_factor = b.heroes_unlimited_vigor.cooldown_factor

		for _, h in pairs(all_heroes) do
			for i = 1, 4 do
				T(h).hero.skills.ultimate.cooldown[i] = T(h).hero.skills.ultimate.cooldown[i] * cd_factor
			end
		end
	end

	u = self:get_upgrade("heroes_nimble_physique")

	if u then
		local c_upg = E:create_entity("controller_upgrade_heroes_nimble_physique")

		simulation:queue_insert_entity(c_upg)
	end

	u = self:get_upgrade("heroes_lethal_focus")

	if u then
		u.total_cards = b.heroes_lethal_focus.deck_data.total_cards
		u.trigger_cards = b.heroes_lethal_focus.deck_data.trigger_cards
		u.damage_factor = b.heroes_lethal_focus.damage_factor
		u.damage_factor_area = b.heroes_lethal_focus.damage_factor_area
	end

	u = self:get_upgrade("heroes_limit_pushing")

	if u then
		u.total_cards = b.heroes_limit_pushing.deck_data.total_cards
		u.trigger_cards = b.heroes_limit_pushing.deck_data.trigger_cards
	end

	u = self:get_upgrade("reinforcements_master_blacksmiths")

	if u then
		local portrait_idxs = {
			25,
			26,
			27
		}

		for i = 1, 3 do
			local t = T("soldier_reinforcement_basic_0" .. i)

			t.unit.damage_factor = b.reinforcements_master_blacksmiths.damage_factor
			t.health.armor = b.reinforcements_master_blacksmiths.armor
			t.render.sprites[1].prefix = "reinforcements_lvl2_0" .. i
			t.info.portrait = "gui_bottom_info_image_soldiers_00" .. portrait_idxs[i]
		end
	end

	u = self:get_upgrade("reinforcements_intense_workout")

	if u then
		for i = 1, 3 do
			local t = T("soldier_reinforcement_basic_0" .. i)

			t.health.hp_max = t.health.hp_max * b.reinforcements_intense_workout.hp_factor
			t.reinforcement.duration = t.reinforcement.duration + b.reinforcements_intense_workout.duration_extra
		end
	end

	u = self:get_upgrade("reinforcements_rebel_militia")

	if u then
		for i = 1, 2 do
			local num = km.zmod(i, 2)

			E:set_template("re_current_" .. i, E:get_template("soldier_reinforcement_rebel_militia_0" .. num))
		end
	end

	u = self:get_upgrade("reinforcements_shadow_archer")

	if u then
		for i = 1, 1 do
			local num = km.zmod(i, 2)

			E:set_template("re_current_" .. i, E:get_template("soldier_reinforcement_shadow_archer_0" .. num))
		end
	end

	u = self:get_upgrade("towers_royal_training")

	if u then
		for _, n in pairs(all_towers) do
			for i = 1, 4 do
				if T(n .. i).barrack then
					local st = T(T(n .. i).barrack.soldier_type)

					st.health.dead_lifetime = st.health.dead_lifetime - b.towers_royal_training.reduce_cooldown
				end
			end
		end

		for i = 1, 3 do
			T("tower_barrel_lvl4").attacks.list[3].cooldown[i] = T("tower_barrel_lvl4").attacks.list[3].cooldown[i] - b.towers_royal_training.reinforcements_cooldown
		end

		T("re_current_1").cooldown = T("re_current_1").cooldown - b.towers_royal_training.reinforcements_cooldown
	end

	u = self:get_upgrade("reinforcements_thorny_armor")

	if u then
		local portrait_idxs = {
			31,
			33
		}

		for i = 1, 2 do
			local num = km.zmod(i, 2)
			local t = T("soldier_reinforcement_rebel_militia_0" .. num)

			t.health.spiked_armor = b.reinforcements_thorny_armor.spiked_armor
			t.render.sprites[1].prefix = "reinforcements_lvl4_0" .. num
			t.info.portrait = "gui_bottom_info_image_soldiers_00" .. portrait_idxs[i]
		end
	end

	u = self:get_upgrade("reinforcements_night_veil")

	if u then
		for i = 1, 1 do
			local num = km.zmod(i, 2)
			local t = T("soldier_reinforcement_shadow_archer_0" .. num)

			t.ranged.attacks[1].max_range = t.ranged.attacks[1].max_range + b.reinforcements_night_veil.extra_range
			t.ranged.attacks[1].cooldown = t.ranged.attacks[1].cooldown - b.reinforcements_night_veil.cooldown_red
			t.render.sprites[1].prefix = "reinforcements_lvl4_0" .. num + 2
			t.info.portrait = "gui_bottom_info_image_soldiers_0032"

			local t = T("arrow_soldier_re_shadow_archer")

			t.render.sprites[1].name = "reinforcements_lvl4_03_arrow"
		end
	end

	u = self:get_upgrade("alliance_merciless")

	if u then
		u.damage_factor_per_tower = b.alliance_merciless.damage_factor_per_tower
	end

	u = self:get_upgrade("alliance_corageous_stand")

	if u then
		u.hp_factor_per_tower = b.alliance_corageous_stand.hp_factor_per_tower
	end

	u = self:get_upgrade("alliance_shady_company")

	if u then
		local slot = storage:load_slot()
		local heroes = 0

		for _, h in ipairs(slot.heroes.team) do
			if T(h).hero.team == TEAM_DARK_ARMY then
				heroes = heroes + 1
			end
		end

		if heroes > 0 then
			local tower_t, bullet_t, soldier_t
			local d_mult = 1 + b.alliance_shady_company.damage_extra * heroes

			for i = 1, 4 do
				tower_t = T("tower_royal_archers_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			tower_t = T("tower_arcane_wizard_lvl1")
			bullet_t = T(tower_t.attacks.list[1].bullet)

			for i = 1, 4 do
				bullet_t.bullet.damage_min_config[i] = math.ceil(bullet_t.bullet.damage_min_config[i] * d_mult)
				bullet_t.bullet.damage_max_config[i] = math.ceil(bullet_t.bullet.damage_max_config[i] * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_paladin_covenant_lvl" .. i)
				soldier_t = T(tower_t.barrack.soldier_type)
				soldier_t.melee.attacks[1].damage_min = math.ceil(soldier_t.melee.attacks[1].damage_min * d_mult)
				soldier_t.melee.attacks[1].damage_max = math.ceil(soldier_t.melee.attacks[1].damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_arborean_emissary_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			tower_t = T("tower_elven_stargazers_lvl1")
			bullet_t = T(tower_t.attacks.list[1].bullet)

			for i = 1, 4 do
				bullet_t.bullet.damage_min_config[i] = math.ceil(bullet_t.bullet.damage_min_config[i] * d_mult)
				bullet_t.bullet.damage_max_config[i] = math.ceil(bullet_t.bullet.damage_max_config[i] * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_tricannon_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_demon_pit_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				soldier_t = T(bullet_t.bullet.hit_payload)
				soldier_t.melee.attacks[1].damage_min = math.ceil(soldier_t.melee.attacks[1].damage_min * d_mult)
				soldier_t.melee.attacks[1].damage_max = math.ceil(soldier_t.melee.attacks[1].damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_ballista_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_rocket_gunners_lvl" .. i)
				soldier_t = T(tower_t.barrack.soldier_type)
				soldier_t.melee.attacks[1].damage_min = math.ceil(soldier_t.melee.attacks[1].damage_min * d_mult)
				soldier_t.melee.attacks[1].damage_max = math.ceil(soldier_t.melee.attacks[1].damage_max * d_mult)
				bullet_t = T(soldier_t.ranged.attacks[1].bullet)
				bullet_t.bullet.damage_min_config[i] = math.ceil(bullet_t.bullet.damage_min_config[i] * d_mult)
				bullet_t.bullet.damage_max_config[i] = math.ceil(bullet_t.bullet.damage_max_config[i] * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_necromancer_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_flamespitter_lvl" .. i)

				local aura_t = T(tower_t.attacks.list[1].aura)

				aura_t.damage_min_config[i] = math.ceil(aura_t.damage_min_config[i] * d_mult)
				aura_t.damage_max_config[i] = math.ceil(aura_t.damage_max_config[i] * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_barrel_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_sand_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_ghost_lvl" .. i)
				soldier_t = T(tower_t.barrack.soldier_type)
				soldier_t.melee.attacks[1].damage_min = math.ceil(soldier_t.melee.attacks[1].damage_min * d_mult)
				soldier_t.melee.attacks[1].damage_max = math.ceil(soldier_t.melee.attacks[1].damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_ray_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			tower_t = T("tower_ray_lvl4")
			bullet_t = T(tower_t.attacks.list[2].bullet)
			bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
			bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)

			for i = 1, 4 do
				tower_t = T("tower_dark_elf_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_dwarf_lvl" .. i)
				soldier_t = T(tower_t.barrack.soldier_type)
				soldier_t.melee.attacks[1].damage_min = math.ceil(soldier_t.melee.attacks[1].damage_min * d_mult)
				soldier_t.melee.attacks[1].damage_max = math.ceil(soldier_t.melee.attacks[1].damage_max * d_mult)
			end

			for i = 1, 4 do
				tower_t = T("tower_hermit_toad_lvl" .. i)

				for b_i = 1, 2 do
					bullet_t = T(tower_t.attacks.list[b_i].bullet)
					bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
					bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
				end
			end

			for i = 1, 4 do
				tower_t = T("tower_sparking_geode_lvl" .. i)
				bullet_t = T(tower_t.attacks.list[1].bullet)
				bullet_t.bullet.damage_min = math.ceil(bullet_t.bullet.damage_min * d_mult)
				bullet_t.bullet.damage_max = math.ceil(bullet_t.bullet.damage_max * d_mult)
			end
		end
	end

	u = self:get_upgrade("alliance_friends_of_the_crown")

	if u then
		local slot = storage:load_slot()
		local cost_red = 0

		for _, h in ipairs(slot.heroes.team) do
			if T(h).hero.team == TEAM_LINIREA then
				cost_red = cost_red + b.alliance_friends_of_the_crown.cost_red_per_hero
			end
		end

		if cost_red > 0 then
			for _, n in pairs(all_towers) do
				for i = 1, 4 do
					T(n .. i).tower.price = T(n .. i).tower.price - cost_red
				end
			end
		end
	end

	u = self:get_upgrade("alliance_shared_reserves")

	local c_upg

	if u then
		c_upg = E:create_entity("controller_upgrades_alliance")

		simulation:queue_insert_entity(c_upg)
	end

	u = self:get_upgrade("alliance_seal_of_punishment")

	if u and c_upg then
		c_upg.seal = "decal_upgrade_alliance_seal_of_punishment"
	end

	u = self:get_upgrade("alliance_flux_altering_coils")

	if u and c_upg then
		c_upg.coil = "decal_upgrade_alliance_flux_altering_coils"
	end

	u = self:get_upgrade("alliance_display_of_true_might_linirea")

	if u then
		u.mod_linirea = "mod_upgrade_alliance_display_of_true_might_linirea"
		u.overlay_linirea = "decal_upgrade_alliance_display_of_true_might_linirea_overlay"
	end

	u = self:get_upgrade("alliance_display_of_true_might_dark")

	if u then
		u.mod_dark_army = "mod_upgrade_alliance_display_of_true_might_dark_army"
		u.overlay_dark_army = "decal_upgrade_alliance_display_of_true_might_dark_army_overlay"
	end
end

return upgrades
