﻿-- chunkname: @./kr5/data/levels/level21.lua

local log = require("klua.log"):new("level01")
local signal = require("hump.signal")
local E = require("entity_db")
local S = require("sound_db")
local U = require("utils")
local LU = require("level_utils")
local V = require("klua.vector")
local P = require("path_db")
local storage = require("storage")
local GR = require("grid_db")

require("constants")

local function fts(v)
	return v / FPS
end

local level = {}

function level:load(store)
	return
end

function level:update(store)
	while not store.waves_finished or LU.has_alive_enemies(store) do
		coroutine.yield()
	end
end

return level
