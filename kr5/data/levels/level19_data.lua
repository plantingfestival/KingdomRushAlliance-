﻿-- chunkname: @./kr5/data/levels/level19_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -68,
				y = 288
			}
		},
		{
			pos = {
				x = -68,
				y = 502
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 300,
			y = 450
		}
	},
	entities_list = {
		{
			template = "controller_stage_19_mausoleum",
			["editor.game_mode"] = 3,
			pos = {
				x = 745,
				y = 265
			}
		},
		{
			template = "controller_stage_19_mausoleum",
			pos = {
				x = 551,
				y = 427
			}
		},
		{
			template = "controller_stage_19_navira",
			["editor.game_mode"] = 1,
			pos = {
				x = 808,
				y = 519
			}
		},
		{
			template = "debug_path_renderer",
			["path_debug.background_color"] = {
				46,
				193,
				142,
				0
			},
			["path_debug.path_color"] = {
				168,
				199,
				169,
				0
			},
			pos = {
				x = -300,
				y = 868
			}
		},
		{
			template = "decal_background",
			["render.sprites[1].z"] = 1000,
			["render.sprites[1].name"] = "Stage19_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = -68,
				y = 288
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = -68,
				y = 502
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 226
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 343
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 438
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 557
			}
		},
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain4AmbienceSoundWind"
			}
		},
		{
			template = "decal_stage_19_bubbles",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_bubbles_water",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_mask_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_mask_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_mask_3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_smoke",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_statue",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_19_statue_hands",
			["editor.game_mode"] = 1,
			pos = {
				x = 808,
				y = 520
			}
		},
		{
			template = "decal_terrain_4_cheshire_cat_easter_egg",
			level_index = 2,
			pos = {
				x = 1028,
				y = 633
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 160,
			pos = {
				x = 522,
				y = 89
			}
		},
		{
			["editor.r"] = 3.3861802251067e-15,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 903,
				y = 203
			}
		},
		{
			["editor.r"] = 0.017453292519947,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 697,
				y = 634
			}
		},
		{
			["editor.r"] = 0.03490658503989,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 696,
				y = 679
			}
		},
		{
			load_file = "level19_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 71,
				y = 202
			},
			["tower.default_rally_pos"] = {
				x = 134,
				y = 276
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 545,
				y = 259
			},
			["tower.default_rally_pos"] = {
				x = 531,
				y = 195
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 745,
				y = 265
			},
			["tower.default_rally_pos"] = {
				x = 760,
				y = 201
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 745,
				y = 265
			},
			["tower.default_rally_pos"] = {
				x = 760,
				y = 201
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 263,
				y = 287
			},
			["tower.default_rally_pos"] = {
				x = 241,
				y = 238
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 263,
				y = 287
			},
			["tower.default_rally_pos"] = {
				x = 241,
				y = 238
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 263,
				y = 287
			},
			["tower.default_rally_pos"] = {
				x = 241,
				y = 238
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 417,
				y = 292
			},
			["tower.default_rally_pos"] = {
				x = 407,
				y = 230
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 347,
				y = 347
			},
			["tower.default_rally_pos"] = {
				x = 304,
				y = 416
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 78,
				y = 349
			},
			["tower.default_rally_pos"] = {
				x = 50,
				y = 299
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 147,
				y = 403
			},
			["tower.default_rally_pos"] = {
				x = 211,
				y = 362
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 650,
				y = 411
			},
			["tower.default_rally_pos"] = {
				x = 659,
				y = 350
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 227,
				y = 454
			},
			["tower.default_rally_pos"] = {
				x = 272,
				y = 536
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 457,
				y = 471
			},
			["tower.default_rally_pos"] = {
				x = 399,
				y = 422
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 417,
				y = 539
			},
			["tower.default_rally_pos"] = {
				x = 335,
				y = 490
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 617,
				y = 555
			},
			["tower.default_rally_pos"] = {
				x = 536,
				y = 538
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
		6,
		7,
		8
	},
	invalid_path_ranges = {},
	level_mode_overrides = {
		{
			max_upgrade_level = 5,
			locked_powers = {},
			locked_towers = {}
		},
		{},
		{
			available_towers = {
				"tower_build_tricannon",
				"tower_build_arborean_emissary"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_paladin_covenant",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_necromancer",
				"tower_build_barrel",
				"tower_build_ghost",
				"tower_build_flamespitter",
				"tower_build_ray"
			}
		}
	},
	nav_mesh = {
		{
			5,
			2
		},
		{
			5,
			3,
			nil,
			1
		},
		{
			4,
			4,
			2,
			2
		},
		{
			8,
			nil,
			3,
			5
		},
		{
			7,
			4,
			1
		},
		{
			7,
			4,
			5,
			7
		},
		{
			10,
			9,
			5
		},
		{
			11,
			nil,
			4,
			9
		},
		{
			11,
			8,
			4,
			7
		},
		{
			10,
			12,
			7
		},
		{
			[3] = 8,
			[4] = 12
		},
		{
			nil,
			11,
			9,
			13
		},
		{
			[2] = 12,
			[3] = 10
		}
	},
	required_exoskeletons = {
		"spawner_mausoleumDef",
		"spawner_mausoleum_lightDef",
		"stage_19_statue_decoDef",
		"stage_19_bubblesDef",
		"stage_19_bubbles_waterDef",
		"stage_19_smokeDef"
	},
	required_sounds = {
		"music_stage19",
		"stage_19",
		"terrain_4_common",
		"enemies_terrain_4",
		"tower_dark_elf"
	},
	required_textures = {
		"go_enemies_terrain_4",
		"go_stage19_bg",
		"go_stage19",
		"go_stages_terrain4",
		"go_towers_dark_elf"
	}
}
