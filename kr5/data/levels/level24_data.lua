﻿-- chunkname: @./kr5/data/levels/level24_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 1071,
				y = 280
			}
		},
		{
			pos = {
				x = 1071,
				y = 567
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 640,
			y = 420
		}
	},
	entities_list = {
		{
			template = "controller_stage_24_machinist",
			pos = {
				x = 512,
				y = 384
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
			["render.sprites[1].name"] = "Stage24_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.flip"] = 1,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 1071,
				y = 280
			}
		},
		{
			["editor.flip"] = 1,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 1071,
				y = 567
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1109,
				y = 239
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1040,
				y = 320
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1071,
				y = 513
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1071,
				y = 618
			}
		},
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain6AmbienceSoundForge"
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 567,
				y = 10
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 24,
				y = 21
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 496,
				y = 21
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 1009,
				y = 30
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = -78,
				y = 47
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 1052,
				y = 52
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 83,
				y = 55
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 406,
				y = 232
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 986,
				y = 432
			}
		},
		{
			template = "decal_stage_24_bubble",
			pos = {
				x = 1063,
				y = 692
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 717,
				y = 17
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 769,
				y = 18
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1018,
				y = 21
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1081,
				y = 29
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 700,
				y = 38
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1030,
				y = 62
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 742,
				y = 68
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1079,
				y = 79
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = -52,
				y = 85
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 19,
				y = 85
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = -12,
				y = 133
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = -95,
				y = 341
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = -162,
				y = 411
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = -106,
				y = 431
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1096,
				y = 677
			}
		},
		{
			template = "decal_stage_24_dust",
			pos = {
				x = 1146,
				y = 739
			}
		},
		{
			template = "decal_stage_24_modes_decos",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_modes_decos",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_elevator",
			["editor.game_mode"] = 1,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_factory",
			["spawner.name"] = "factory_door",
			pos = {
				x = 516,
				y = 384
			}
		},
		{
			template = "decal_stage_24_factory_conveyor_belt",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = -92,
				y = 336
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = -120,
				y = 347
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = -72,
				y = 434
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = -32,
				y = 462
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = 12,
				y = 472
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = 121,
				y = 584
			}
		},
		{
			template = "decal_stage_24_factory_sparks",
			pos = {
				x = 120,
				y = 633
			}
		},
		{
			template = "decal_stage_24_fans",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_gear_factory",
			pos = {
				x = 516,
				y = 384
			}
		},
		{
			template = "decal_stage_24_gear_floor",
			pos = {
				x = 289,
				y = 181
			}
		},
		{
			template = "decal_stage_24_gear_tower",
			pos = {
				x = 844,
				y = 669
			}
		},
		{
			template = "decal_stage_24_gears",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_3",
			["editor.game_mode"] = 1,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_4",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_5",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_24_mask_6",
			pos = {
				x = 516,
				y = 384
			}
		},
		{
			template = "decal_stage_24_smoke",
			pos = {
				x = 572,
				y = 33
			}
		},
		{
			template = "decal_stage_24_smoke",
			pos = {
				x = 916,
				y = 71
			}
		},
		{
			template = "decal_stage_24_smoke",
			pos = {
				x = -205,
				y = 129
			}
		},
		{
			template = "decal_stage_24_smoke",
			pos = {
				x = 1039,
				y = 400
			}
		},
		{
			template = "decal_stage_24_upgrade_station",
			pos = {
				x = 443,
				y = 445
			}
		},
		{
			template = "decal_terrain_6_exodia_arm",
			pos = {
				x = 136,
				y = 184
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 531,
				y = 171
			}
		},
		{
			["editor.r"] = -3.1415926535898,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 160,
			pos = {
				x = -68,
				y = 222
			}
		},
		{
			["editor.r"] = -3.1415926535898,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = -68,
				y = 268
			}
		},
		{
			["editor.r"] = 1.0646508437165,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 227,
				y = 674
			}
		},
		{
			load_file = "level24_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			load_file = "level24_factory",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 9,
			template = "tower_holder_blocked_terrain_6_2",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 625,
				y = 338
			},
			["tower.default_rally_pos"] = {
				x = 635,
				y = 417
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 9,
			template = "tower_holder_blocked_terrain_6_2",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 831,
				y = 373
			},
			["tower.default_rally_pos"] = {
				x = 784,
				y = 453
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 9,
			template = "tower_holder_blocked_terrain_6_2",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 343,
				y = 395
			},
			["tower.default_rally_pos"] = {
				x = 371,
				y = 347
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 9,
			template = "tower_holder_blocked_terrain_6_2",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 343,
				y = 395
			},
			["tower.default_rally_pos"] = {
				x = 371,
				y = 347
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 9,
			template = "tower_holder_blocked_terrain_6_2",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 882,
				y = 573
			},
			["tower.default_rally_pos"] = {
				x = 792,
				y = 546
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 642,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 645,
				y = 281
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 642,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 585,
				y = 263
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 642,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 585,
				y = 263
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 738,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 739,
				y = 288
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 738,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 739,
				y = 288
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 738,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 739,
				y = 288
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 235,
				y = 256
			},
			["tower.default_rally_pos"] = {
				x = 200,
				y = 346
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 342,
				y = 256
			},
			["tower.default_rally_pos"] = {
				x = 288,
				y = 342
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 342,
				y = 256
			},
			["tower.default_rally_pos"] = {
				x = 288,
				y = 342
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 342,
				y = 256
			},
			["tower.default_rally_pos"] = {
				x = 288,
				y = 342
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 469,
				y = 271
			},
			["tower.default_rally_pos"] = {
				x = 440,
				y = 367
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 890,
				y = 297
			},
			["tower.default_rally_pos"] = {
				x = 864,
				y = 242
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 625,
				y = 338
			},
			["tower.default_rally_pos"] = {
				x = 635,
				y = 417
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 625,
				y = 338
			},
			["tower.default_rally_pos"] = {
				x = 635,
				y = 417
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 831,
				y = 373
			},
			["tower.default_rally_pos"] = {
				x = 784,
				y = 453
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 831,
				y = 373
			},
			["tower.default_rally_pos"] = {
				x = 784,
				y = 453
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 343,
				y = 395
			},
			["tower.default_rally_pos"] = {
				x = 371,
				y = 347
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 912,
				y = 432
			},
			["tower.default_rally_pos"] = {
				x = 857,
				y = 502
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 601,
				y = 485
			},
			["tower.default_rally_pos"] = {
				x = 542,
				y = 419
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 703,
				y = 485
			},
			["tower.default_rally_pos"] = {
				x = 722,
				y = 415
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 703,
				y = 485
			},
			["tower.default_rally_pos"] = {
				x = 722,
				y = 415
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 703,
				y = 485
			},
			["tower.default_rally_pos"] = {
				x = 722,
				y = 415
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 322,
				y = 551
			},
			["tower.default_rally_pos"] = {
				x = 294,
				y = 486
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 882,
				y = 573
			},
			["tower.default_rally_pos"] = {
				x = 792,
				y = 546
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 9,
			template = "tower_holder_sea_of_trees_9",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 882,
				y = 573
			},
			["tower.default_rally_pos"] = {
				x = 792,
				y = 546
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
		6,
		9
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
				"tower_build_ray",
				"tower_build_dwarf"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_flamespitter",
				"tower_build_necromancer",
				"tower_build_barrel",
				"tower_build_ghost"
			}
		}
	},
	nav_mesh = {
		{
			2
		},
		{
			5,
			4,
			1
		},
		{
			6,
			nil,
			nil,
			4
		},
		{
			6,
			3,
			nil,
			2
		},
		{
			8,
			4,
			2
		},
		{
			9,
			nil,
			3,
			8
		},
		{
			10,
			8,
			5
		},
		{
			11,
			6,
			5,
			7
		},
		{
			12,
			nil,
			6,
			10
		},
		{
			13,
			9,
			7
		},
		{
			14,
			14,
			8,
			13
		},
		{
			[3] = 9,
			[4] = 14
		},
		{
			nil,
			11,
			10
		},
		{
			nil,
			12,
			11,
			11
		}
	},
	required_exoskeletons = {
		"stage2dlcanimsfansDef",
		"lavabubbleDef",
		"stage2dlcanimstuercasDef",
		"t5_dustDef",
		"t5_smokeDef",
		"towerDef",
		"factoryDef",
		"factory2Def",
		"ascensorDef",
		"converterDef",
		"dlcdwarfbossstage02Def",
		"dlcdwarfbossstage02_particleDef",
		"dlcdwarfbossstage02_smokeDef",
		"dlcdwarfbossstage02_floorsmokeDef",
		"stage2DLC_ascensor_modosDef"
	},
	required_sounds = {
		"music_stage24",
		"terrain_6_common",
		"enemies_terrain_6",
		"stage_24",
		"tower_dwarf"
	},
	required_textures = {
		"go_enemies_terrain_6",
		"go_stage24_bg",
		"go_stage24",
		"go_stages_terrain6"
	}
}
