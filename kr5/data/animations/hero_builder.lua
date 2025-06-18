﻿-- chunkname: @./kr5/data/animations/hero_builder.lua

local a = {
	hero_obdul_hero_idle = {
		prefix = "hero_obdul_hero",
		to = 40,
		from = 1
	},
	hero_obdul_hero_walk = {
		prefix = "hero_obdul_hero",
		to = 64,
		from = 41
	},
	hero_obdul_hero_attack = {
		prefix = "hero_obdul_hero",
		to = 100,
		from = 65
	},
	hero_obdul_hero_skill_1 = {
		prefix = "hero_obdul_hero",
		to = 146,
		from = 101
	},
	hero_obdul_hero_skill_2 = {
		prefix = "hero_obdul_hero",
		to = 206,
		from = 147
	},
	hero_obdul_hero_skill_3_start = {
		prefix = "hero_obdul_hero",
		to = 222,
		from = 207
	},
	hero_obdul_hero_skill_3_loop = {
		prefix = "hero_obdul_hero",
		to = 228,
		from = 223
	},
	hero_obdul_hero_skill_3_end = {
		prefix = "hero_obdul_hero",
		to = 250,
		from = 229
	},
	hero_obdul_hero_skill_4 = {
		prefix = "hero_obdul_hero",
		to = 324,
		from = 251
	},
	hero_obdul_hero_skill_5 = {
		prefix = "hero_obdul_hero",
		to = 360,
		from = 325
	},
	hero_obdul_hero_levelup = {
		prefix = "hero_obdul_hero",
		to = 388,
		from = 361
	},
	hero_obdul_hero_respawn = {
		prefix = "hero_obdul_hero",
		to = 422,
		from = 389
	},
	hero_obdul_hero_death = {
		prefix = "hero_obdul_hero",
		to = 474,
		from = 423
	},
	hero_obdul_hero_grave = {
		prefix = "hero_obdul_hero",
		to = 475,
		from = 475
	},
	hero_obdul_basic_attack_hit = {
		prefix = "hero_obdul_basic_attack_hit",
		to = 7,
		from = 1
	},
	hero_obdul_woody_idle = {
		prefix = "hero_obdul_woody",
		to = 1,
		from = 1
	},
	hero_obdul_woody_death = {
		prefix = "hero_obdul_woody",
		to = 21,
		from = 2
	},
	hero_obdul_ultimate_projectile = {
		prefix = "hero_obdul_ultimate_projectile",
		to = 1,
		from = 1
	},
	hero_obdul_ultimate_dust_cloud = {
		prefix = "hero_obdul_ultimate_dust_cloud",
		to = 24,
		from = 1
	},
	hero_obdul_ultimate_dust_over_ball_run = {
		prefix = "hero_obdul_ultimate_dust_over_ball",
		to = 13,
		from = 1
	},
	hero_obdul_ultimate_rock_03_in = {
		prefix = "hero_obdul_ultimate_rock_03",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_rock_02_in = {
		prefix = "hero_obdul_ultimate_rock_02",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_rock_01_in = {
		prefix = "hero_obdul_ultimate_rock_01",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_rock_04_in = {
		prefix = "hero_obdul_ultimate_rock_04",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_ball = {
		prefix = "hero_obdul_ultimate_ball",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_in = {
		prefix = "hero_obdul_ultimate",
		to = 17,
		from = 1
	},
	hero_obdul_ultimate_idle = {
		prefix = "hero_obdul_ultimate",
		to = 18,
		from = 18
	},
	hero_obdul_ultimate_decal = {
		prefix = "hero_obdul_ultimate_decal",
		to = 1,
		from = 1
	},
	hero_obdul_ultimate_decal_enemy = {
		prefix = "hero_obdul_ultimate_decal_enemy",
		to = 16,
		from = 1
	},
	hero_obdul_skill_3_hit = {
		prefix = "hero_obdul_skill_3_hit",
		to = 7,
		from = 1
	},
	hero_obdul_skill_4_tower_layerX_idle = {
		layer_to = 3,
		from = 1,
		layer_prefix = "hero_obdul_skill_4_tower_layer%i",
		to = 1,
		layer_from = 1
	},
	hero_obdul_skill_4_tower_layerX_spawn = {
		layer_to = 3,
		from = 2,
		layer_prefix = "hero_obdul_skill_4_tower_layer%i",
		to = 53,
		layer_from = 1
	},
	hero_obdul_skill_4_tower_layerX_attack = {
		layer_to = 3,
		from = 54,
		layer_prefix = "hero_obdul_skill_4_tower_layer%i",
		to = 73,
		layer_from = 1
	},
	hero_obdul_skill_4_tower_layerX_death = {
		layer_to = 3,
		from = 74,
		layer_prefix = "hero_obdul_skill_4_tower_layer%i",
		to = 101,
		layer_from = 1
	},
	hero_obdul_skill_4_tower_hit = {
		prefix = "hero_obdul_skill_4_tower_hit",
		to = 7,
		from = 1
	},
	hero_obdul_skill_4_tower_projectile = {
		prefix = "hero_obdul_skill_4_tower_projectile",
		to = 1,
		from = 1
	},
	hero_obdul_skill_5_soldier_idle = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 1,
		from = 1
	},
	hero_obdul_skill_5_soldier_running = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 21,
		from = 2
	},
	hero_obdul_skill_5_soldier_walkDown = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 41,
		from = 22
	},
	hero_obdul_skill_5_soldier_walkUp = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 61,
		from = 42
	},
	hero_obdul_skill_5_soldier_attack = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 81,
		from = 62
	},
	hero_obdul_skill_5_soldier_death = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 101,
		from = 82
	},
	hero_obdul_skill_5_soldier_raise = {
		prefix = "hero_obdul_skill_5_soldier",
		to = 107,
		from = 102
	},
	hero_obdul_skill_5_soldier_spawn_decal = {
		prefix = "hero_obdul_skill_5_soldier_spawn",
		to = 13,
		from = 1
	},
	hero_obdul_skill_3_fx_start = {
		prefix = "hero_obdul_skill_3_fx",
		to = 16,
		from = 1
	},
	hero_obdul_skill_3_fx_loop = {
		prefix = "hero_obdul_skill_3_fx",
		to = 22,
		from = 17
	},
	hero_obdul_skill_3_fx_end = {
		prefix = "hero_obdul_skill_3_fx",
		to = 44,
		from = 23
	},
	hero_builder_worker_idle = {
		prefix = "hero_builder_worker",
		to = 1,
		from = 1
	},
	hero_builder_worker_running = {
		prefix = "hero_builder_worker",
		to = 21,
		from = 2
	},
	hero_builder_worker_attack = {
		prefix = "hero_builder_worker",
		to = 81,
		from = 62
	},
	hero_builder_worker_death = {
		prefix = "hero_builder_worker",
		to = 101,
		from = 82
	}
}

return a
