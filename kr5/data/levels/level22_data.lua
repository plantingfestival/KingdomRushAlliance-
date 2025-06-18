﻿-- chunkname: @./kr5/data/levels/level22_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 402,
				y = 212
			}
		},
		{
			pos = {
				x = 905,
				y = 300
			}
		}
	},
	custom_start_pos = {
		zoom = 2,
		pos = {
			x = 510,
			y = 800
		}
	},
	entities_list = {
		{
			template = "controller_stage_22_boss_crocs",
			["editor.game_mode"] = 1,
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
			template = "decal_achievement_stage_22_croc_king",
			pos = {
				x = 940,
				y = 188
			}
		},
		{
			template = "decal_background",
			["render.sprites[1].z"] = 1000,
			["render.sprites[1].name"] = "Stage22_0001",
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
				x = 533,
				y = 92
			}
		},
		{
			["editor.flip"] = 1,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 1007,
				y = 303
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 465,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 604,
				y = 92
			}
		},
		{
			["editor.flip"] = -1,
			template = "decal_defense_flag5",
			extra_trigger_dist = 30,
			pos = {
				x = 1040,
				y = 227
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 982,
				y = 368
			}
		},
		{
			template = "decal_stage_22_easteregg_sheepy",
			pos = {
				x = 890,
				y = 600
			}
		},
		{
			template = "decal_stage_22_puerta1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_puerta2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_puerta3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_puerta4",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_puerta5",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_puerta6",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_remolino",
			pos = {
				x = 358,
				y = 372
			}
		},
		{
			template = "decal_stage_22_rune_doors",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_rune_rock",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 1013,
				y = 152
			}
		},
		{
			template = "decal_stage_22_rune_rock",
			pos = {
				x = 527,
				y = 237
			}
		},
		{
			template = "decal_stage_22_rune_rock",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 160,
				y = 349
			}
		},
		{
			template = "decal_stage_22_sombras",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_sombras",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_water_vfx1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_22_water_vfx2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 10,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = -2,
				y = 270
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 9,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = -2,
				y = 296
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 11,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = -2,
				y = 316
			}
		},
		{
			["editor.r"] = 1.7416623698807e-15,
			["editor.path_id"] = 7,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 997,
				y = 537
			}
		},
		{
			["editor.r"] = 1.7416623698807e-15,
			["editor.path_id"] = 8,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 997,
				y = 590
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 816,
				y = 690
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 6,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 733,
				y = 691
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 12,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 775,
				y = 691
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 193,
				y = 693
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 237,
				y = 693
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 237,
				y = 693
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 279,
				y = 693
			}
		},
		{
			load_file = "level22_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			template = "stage_22_paths_mask1",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_22_mascara1",
			pos = {
				x = 512,
				y = 384
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "stage_22_paths_mask2",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_22_mascara4",
			pos = {
				x = 512,
				y = 384
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "stage_22_paths_mask3",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_22_mascara2",
			pos = {
				x = 512,
				y = 384
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "stage_22_paths_mask4",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_22_mascara3",
			pos = {
				x = 512,
				y = 384
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 717,
				y = 195
			},
			["tower.default_rally_pos"] = {
				x = 710,
				y = 274
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 594,
				y = 198
			},
			["tower.default_rally_pos"] = {
				x = 474,
				y = 185
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 607,
				y = 201
			},
			["tower.default_rally_pos"] = {
				x = 474,
				y = 185
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 198,
				y = 212
			},
			["tower.default_rally_pos"] = {
				x = 188,
				y = 293
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 54,
				y = 213
			},
			["tower.default_rally_pos"] = {
				x = 60,
				y = 289
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 826,
				y = 223
			},
			["tower.default_rally_pos"] = {
				x = 821,
				y = 301
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 950,
				y = 223
			},
			["tower.default_rally_pos"] = {
				x = 938,
				y = 303
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 698,
				y = 335
			},
			["tower.default_rally_pos"] = {
				x = 605,
				y = 312
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 702,
				y = 339
			},
			["tower.default_rally_pos"] = {
				x = 605,
				y = 312
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 55,
				y = 352
			},
			["tower.default_rally_pos"] = {
				x = 130,
				y = 438
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 75,
				y = 355
			},
			["tower.default_rally_pos"] = {
				x = 130,
				y = 438
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 609,
				y = 405
			},
			["tower.default_rally_pos"] = {
				x = 517,
				y = 388
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 740,
				y = 473
			},
			["tower.default_rally_pos"] = {
				x = 643,
				y = 526
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 87,
				y = 496
			},
			["tower.default_rally_pos"] = {
				x = 49,
				y = 434
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 7,
			template = "tower_holder_sea_of_trees_7",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 208,
				y = 508
			},
			["tower.default_rally_pos"] = {
				x = 264,
				y = 462
			}
		},
		{
			["tower.holder_id"] = "44",
			["ui.nav_mesh_id"] = "44",
			template = "tower_stage_22_arborean_mages",
			["editor.game_mode"] = 3,
			pos = {
				x = 592,
				y = 211
			},
			["tower.default_rally_pos"] = {
				x = 474,
				y = 185
			}
		},
		{
			["tower.holder_id"] = "45",
			["ui.nav_mesh_id"] = "45",
			template = "tower_stage_22_arborean_mages",
			["editor.game_mode"] = 3,
			pos = {
				x = 708,
				y = 350
			},
			["tower.default_rally_pos"] = {
				x = 605,
				y = 312
			}
		},
		{
			["tower.holder_id"] = "46",
			["ui.nav_mesh_id"] = "46",
			template = "tower_stage_22_arborean_mages",
			["editor.game_mode"] = 3,
			pos = {
				x = 55,
				y = 360
			},
			["tower.default_rally_pos"] = {
				x = 130,
				y = 438
			}
		},
		{
			["tower.holder_id"] = "42",
			["ui.nav_mesh_id"] = "42",
			template = "tower_stage_22_arborean_mages",
			["editor.game_mode"] = 1,
			pos = {
				x = 405,
				y = 480
			},
			["tower.default_rally_pos"] = {
				x = 429,
				y = 442
			}
		},
		{
			["tower.holder_id"] = "42",
			["ui.nav_mesh_id"] = "42",
			template = "tower_stage_22_arborean_mages",
			["editor.game_mode"] = 3,
			pos = {
				x = 405,
				y = 480
			},
			["tower.default_rally_pos"] = {
				x = 429,
				y = 442
			}
		},
		{
			["tunnel.speed_factor"] = 1,
			["tunnel.place_pi"] = 10,
			template = "tunnel_KR5",
			["tunnel.name"] = "1",
			["tunnel.pick_pi"] = 1,
			pos = {
				x = -128,
				y = 409
			}
		},
		{
			["tunnel.speed_factor"] = 1,
			["tunnel.place_pi"] = 11,
			template = "tunnel_KR5",
			["tunnel.name"] = "2",
			["tunnel.pick_pi"] = 2,
			pos = {
				x = -128,
				y = 409
			}
		},
		{
			["tunnel.speed_factor"] = 1,
			["tunnel.place_pi"] = 9,
			template = "tunnel_KR5",
			["tunnel.name"] = "3",
			["tunnel.pick_pi"] = 3,
			pos = {
				x = -128,
				y = 409
			}
		},
		{
			["tunnel.speed_factor"] = 1,
			["tunnel.place_pi"] = 9,
			template = "tunnel_KR5",
			["tunnel.name"] = "4",
			["tunnel.pick_pi"] = 12,
			pos = {
				x = -128,
				y = 409
			}
		},
		{
			["tunnel.name"] = "5",
			["tunnel.place_pi"] = 20,
			template = "tunnel_KR5_stage22_boss",
			["tunnel.pick_pi"] = 19,
			pos = {
				x = -128,
				y = 409
			}
		}
	},
	ignore_walk_backwards_paths = {},
	invalid_path_ranges = {
		{
			from = 52,
			to = 74,
			path_id = 4
		},
		{
			from = 76,
			to = 105,
			path_id = 5
		},
		{
			from = 84,
			to = 113,
			path_id = 8
		},
		{
			from = 64,
			to = 94,
			path_id = 11
		},
		{
			path_id = 13,
			to = 15
		},
		{
			path_id = 14,
			to = 15
		},
		{
			path_id = 15,
			to = 18
		},
		{
			path_id = 16,
			to = 13
		},
		{
			path_id = 17,
			to = 13
		},
		{
			path_id = 18,
			to = 13
		}
	},
	level_mode_overrides = {
		{
			max_upgrade_level = 5,
			locked_powers = {},
			locked_towers = {}
		},
		{
			nav_mesh = {
				{
					nil,
					2,
					nil,
					5
				},
				{
					4,
					nil,
					nil,
					1
				},
				[4] = {
					7,
					nil,
					2
				},
				[5] = {
					6,
					1
				},
				[6] = {
					8,
					4,
					5
				},
				[7] = {
					14,
					8,
					4,
					8
				},
				[8] = {
					9,
					7,
					6
				},
				[9] = {
					13,
					14,
					8
				},
				[11] = {
					nil,
					12,
					13
				},
				[12] = {
					11,
					nil,
					7,
					14
				},
				[13] = {
					11,
					14,
					9
				},
				[14] = {
					13,
					12,
					7,
					9
				}
			}
		},
		{
			available_towers = {
				"tower_build_dark_elf",
				"tower_build_barrel"
			},
			locked_towers = {
				"tower_build_arborean_emissary",
				"tower_build_ballista",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_demon_pit",
				"tower_build_rocket_gunners",
				"tower_build_elven_stargazers",
				"tower_build_royal_archers",
				"tower_build_ray",
				"tower_build_ghost",
				"tower_build_sand",
				"tower_build_arcane_wizard",
				"tower_build_necromancer"
			},
			nav_mesh = {
				[2] = {
					4,
					nil,
					nil,
					46
				},
				[4] = {
					42,
					nil,
					2,
					6
				},
				[5] = {
					6,
					46
				},
				[6] = {
					44,
					4,
					5
				},
				[7] = {
					45,
					nil,
					42,
					44
				},
				[9] = {
					13,
					45,
					44
				},
				[11] = {
					nil,
					12,
					13
				},
				[12] = {
					11,
					nil,
					7,
					45
				},
				[13] = {
					11,
					45,
					9
				},
				[42] = {
					7,
					nil,
					4
				},
				[44] = {
					9,
					7,
					6
				},
				[45] = {
					13,
					12,
					7,
					9
				},
				[46] = {
					nil,
					2,
					nil,
					5
				}
			}
		}
	},
	nav_mesh = {
		{
			nil,
			2,
			nil,
			5
		},
		{
			4,
			nil,
			nil,
			1
		},
		[4] = {
			42,
			nil,
			2,
			6
		},
		[5] = {
			6,
			1
		},
		[6] = {
			8,
			4,
			5
		},
		[7] = {
			14,
			nil,
			42,
			8
		},
		[8] = {
			9,
			7,
			6
		},
		[9] = {
			13,
			14,
			8
		},
		[11] = {
			nil,
			12,
			13
		},
		[12] = {
			11,
			nil,
			7,
			14
		},
		[13] = {
			11,
			14,
			9
		},
		[14] = {
			13,
			12,
			7,
			9
		},
		[42] = {
			7,
			nil,
			4
		}
	},
	required_exoskeletons = {
		"boss_gator1Def",
		"boss_gator2Def",
		"boss_gator3Def",
		"boss_gator4Def",
		"boss_gator5Def",
		"hydra_unitDef",
		"hydra_unit_transformedDef",
		"hydra_deathDef",
		"hydra_trailDef",
		"hydra_poisonDef",
		"hydra_hit_Skill1Def",
		"hydra_projectileDef",
		"hydra_decal_skill2Def",
		"hydra_death1_headsDef",
		"hydra_death_threeheadsDef",
		"boss_gator_dirt_explosionDef",
		"boss_gator_groundcrack_lvl1Def",
		"boss_gator_groundcrack_lvl2Def",
		"boss_gator_groundcrack_lvl3Def",
		"boss_gator_lvl2_bubbleDef",
		"boss_gator_lvl2_puddleDef",
		"boss_gator_lvl3_explosionDef",
		"boss_gator_lvl3_puddleDef",
		"boss_gator_tower_killDef",
		"Rocks_Paths1Def",
		"Rocks_Paths2Def",
		"Rocks_Paths3Def",
		"Rocks_Paths4Def",
		"rune_rockDef",
		"boss_crocs_intro_bossDef",
		"stage_22_bubbles_01Def",
		"stage_22_bubbles_02Def",
		"stage_22_Glow_Rock1Def",
		"stage_22_Glow_Rock2Def",
		"stage_22_Glow_Rock3Def",
		"stage_22_Glow_Rock4Def",
		"stage_22_Glow_Rock5Def",
		"Shaman_baseDef",
		"Tank_crocs_animationsDef",
		"Fx_Shaman_BlocktowerDef",
		"animations_tower_killDef"
	},
	required_sounds = {
		"music_stage22",
		"enemies_terrain_crocs",
		"stage_22"
	},
	required_textures = {
		"go_stage22_bg",
		"go_stage22",
		"go_enemies_terrain_5"
	}
}
