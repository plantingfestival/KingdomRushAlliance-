local log = require("klua.log"):new("level22")
local signal = require("hump.signal")
local E = require("entity_db")
local S = require("sound_db")
local U = require("utils")
local LU = require("level_utils")
local V = require("klua.vector")
local P = require("path_db")

require("constants")

local function fts(v)
	return v / FPS
end

local level = {}

function level:update(store)
	if store.level_mode == GAME_MODE_CAMPAIGN then
		while store.wave_group_number ~= store.wave_group_total do
			coroutine.yield()
		end

		local boss

		log.debug("+++++++++++++++ wait for boss")

		while not boss do
			boss = LU.list_entities(store.entities, "eb_myconid")[1]

			coroutine.yield()
		end

		log.debug("+++++++++++++++ wait for boss death")

		while not boss.health.dead do
			coroutine.yield()
		end

		log.debug("+++++++++++++++ wait for spawns")
		U.y_wait(store, boss.on_death_spawn_wait)

		while not store.waves_finished or LU.has_alive_enemies(store) do
			coroutine.yield()
		end

		log.debug("++++++++++++++++ done")
	end
end

return level
