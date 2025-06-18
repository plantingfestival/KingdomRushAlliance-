﻿-- chunkname: @./kr5/data/levels/level09_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -51,
				y = 266
			}
		},
		{
			pos = {
				x = -51,
				y = 521
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 300,
			y = 400
		}
	},
	entities_list = {
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain2AmbienceSoundBats",
				"Terrain2AmbienceSoundWind"
			}
		},
		{
			template = "controller_stage_09_spawn_nightmares",
			pos = {
				x = 0,
				y = 0
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
			["render.sprites[1].name"] = "Stage09_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 4,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = -51,
				y = 266
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 4,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = -51,
				y = 521
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -51,
				y = 196
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -51,
				y = 326
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -51,
				y = 458
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -51,
				y = 580
			}
		},
		{
			template = "decal_stage_09_fire",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_09_mask",
			pos = {
				x = 435,
				y = 393.5
			}
		},
		{
			template = "decal_stage_09_sheepy_easteregg",
			["editor.game_mode"] = 1,
			pos = {
				x = 478,
				y = 628
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 897,
				y = -10
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 31,
				y = -7
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = -113,
				y = -1
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 1088,
				y = 7
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = -142,
				y = 373
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 1173,
				y = 571
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = -90,
				y = 643
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 1194,
				y = 660
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = -160,
				y = -77
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = 915,
				y = -75
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = 1096,
				y = -49
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = -257,
				y = -10
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = -229,
				y = 639
			}
		},
		{
			["editor.r"] = -1.5498523757709,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 270,
			pos = {
				x = 481,
				y = 145.5
			}
		},
		{
			["editor.r"] = -0.0017453292519408,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 270,
			pos = {
				x = 1020,
				y = 212
			}
		},
		{
			["editor.r"] = 1.2042771838761,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 200,
			pos = {
				x = 488,
				y = 664
			}
		},
		{
			["editor.r"] = 0.85521133347727,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 200,
			pos = {
				x = 990,
				y = 664
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 4,
			template = "tower_holder_blocked_terrain_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 278,
				y = 286
			},
			["tower.default_rally_pos"] = {
				x = 264,
				y = 221
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 4,
			template = "tower_holder_blocked_terrain_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 406,
				y = 440
			},
			["tower.default_rally_pos"] = {
				x = 393,
				y = 541
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 580,
				y = 177
			},
			["tower.default_rally_pos"] = {
				x = 555,
				y = 266
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 720,
				y = 177
			},
			["tower.default_rally_pos"] = {
				x = 733,
				y = 276
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 106,
				y = 180
			},
			["tower.default_rally_pos"] = {
				x = 178,
				y = 249
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 378,
				y = 286
			},
			["tower.default_rally_pos"] = {
				x = 362,
				y = 213
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 464,
				y = 312
			},
			["tower.default_rally_pos"] = {
				x = 461,
				y = 229
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 808,
				y = 392
			},
			["tower.default_rally_pos"] = {
				x = 806,
				y = 318
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 512,
				y = 456
			},
			["tower.default_rally_pos"] = {
				x = 560,
				y = 540
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 202,
				y = 542
			},
			["tower.default_rally_pos"] = {
				x = 212,
				y = 485
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 770,
				y = 556
			},
			["tower.default_rally_pos"] = {
				x = 743,
				y = 483
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 114,
				y = 570
			},
			["tower.default_rally_pos"] = {
				x = 115,
				y = 502
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 290,
				y = 572
			},
			["tower.default_rally_pos"] = {
				x = 309,
				y = 507
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 672,
				y = 572
			},
			["tower.default_rally_pos"] = {
				x = 652,
				y = 503
			}
		}
	},
	ignore_walk_backwards_paths = {
		1,
		4,
		5,
		6
	},
	invalid_path_ranges = {},
	level_mode_overrides = {
		{},
		{},
		{
			available_towers = {
				"tower_build_demon_pit",
				"tower_build_arcane_wizard"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_necromancer",
				"tower_build_ballista"
			}
		}
	},
	nav_mesh = {
		{
			3,
			nil,
			nil,
			2
		},
		{
			4,
			1
		},
		{
			5,
			nil,
			1,
			4
		},
		{
			6,
			5,
			2
		},
		{
			7,
			nil,
			3,
			4
		},
		{
			8,
			7,
			4
		},
		{
			9,
			5,
			5,
			6
		},
		{
			10,
			9,
			6,
			10
		},
		{
			14,
			11,
			7,
			8
		},
		{
			12,
			8,
			8
		},
		{
			13,
			nil,
			9,
			9
		},
		{
			nil,
			14,
			10
		},
		{
			[3] = 11,
			[4] = 14
		},
		{
			nil,
			13,
			9,
			12
		}
	},
	required_exoskeletons = {
		"stage_9_bridge1Def",
		"stage_9_bridge2Def",
		"stage_9_bridge3Def",
		"stage_9_bridge1_maskDef",
		"stage_9_bridge2_maskDef",
		"stage_9_bridge3_maskDef",
		"stage_9_candles_back_1Def",
		"stage_9_candles_back_2Def",
		"stage_9_candles_back_3Def",
		"stage_9_candles_front_1Def",
		"stage_9_candles_front_2Def",
		"stage_9_candles_front_3Def",
		"stage_9_candles_glow_backDef",
		"stage_9_candles_glow_frontDef",
		"stage_9_fireDef",
		"stage_9_portal_path_spawn_FXDef",
		"stage_9_portal_pathDef",
		"stage_9_portalDef",
		"t2_dustDef",
		"t2_smokeDef",
		"skeleton_koopaDef",
		"stage_9_sheepyDef"
	},
	required_sounds = {
		"stage_09",
		"music_stage09",
		"enemies_terrain_2",
		"terrain_2_common"
	},
	required_textures = {
		"go_enemies_terrain_2",
		"go_stage09_bg",
		"go_stage09",
		"go_stages_terrain2"
	}
}
