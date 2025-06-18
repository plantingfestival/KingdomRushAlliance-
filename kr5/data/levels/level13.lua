﻿-- chunkname: @./kr5/data/levels/level13.lua

local log = require("klua.log"):new("level01")
local signal = require("hump.signal")
local E = require("entity_db")
local S = require("sound_db")
local U = require("utils")
local LU = require("level_utils")
local V = require("klua.vector")
local P = require("path_db")
local storage = require("storage")

require("constants")

local function fts(v)
	return v / FPS
end

local level = {}

function level:update(store)
	P:add_invalid_range(3, P:get_start_node(3), P:get_start_node(3) + 12)
	P:add_invalid_range(4, P:get_start_node(4), P:get_start_node(4) + 12)
	P:add_invalid_range(6, nil, nil, bit.bor(NF_RALLY, NF_TWISTER))

	if store.level_mode == GAME_MODE_IRON then
		local starting_gold = store.player_gold
		local holder = table.filter(game.store.entities, function(k, e)
			return e.tower and e.tower.holder_id == "2"
		end)[1]

		holder.tower.upgrade_to = "tower_barrel_lvl1"
		holder = table.filter(game.store.entities, function(k, e)
			return e.tower and e.tower.holder_id == "7"
		end)[1]
		holder.tower.upgrade_to = "tower_barrel_lvl1"

		coroutine.yield()

		store.player_gold = starting_gold
	end

	while not store.waves_finished or LU.has_alive_enemies(store) do
		coroutine.yield()
	end

	log.debug("-- WON")

	if store.level_mode == GAME_MODE_CAMPAIGN then
		-- block empty
	end
end

return level
