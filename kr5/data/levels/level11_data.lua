﻿-- chunkname: @./kr5/data/levels/level11_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -68,
				y = 330
			}
		},
		{
			pos = {
				x = 537,
				y = 92
			}
		}
	},
	custom_start_pos = {
		zoom = 1.2,
		pos = {
			x = 460,
			y = 150
		}
	},
	entities_list = {
		{
			template = "controller_stage_11_cult_leader",
			pos = {
				x = -53,
				y = 134
			}
		},
		{
			template = "controller_stage_11_cultist_leader_modes",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_11_cultist_leader_modes",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_11_portal",
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
			["render.sprites[1].name"] = "Stage11_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 6,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = 535,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 4,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = -68,
				y = 330
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 457,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 615,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 262
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 398
			}
		},
		{
			template = "decal_stage_11_boss_corrupted_denas_intro_base",
			["editor.game_mode"] = 1,
			pos = {
				x = 735,
				y = 430
			}
		},
		{
			template = "decal_stage_11_boss_corrupted_denas_intro_chains",
			["editor.game_mode"] = 1,
			pos = {
				x = 729,
				y = 512
			}
		},
		{
			template = "decal_stage_11_cultist_leader_modes",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_cultist_leader_modes",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_cultist_leader_modes_worker",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_cultist_leader_modes_worker",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_lightnings_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_lightnings_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_lightnings_3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_mask",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_rock_1",
			tween_amplitude = 20,
			tween_frecueny = 210,
			pos = {
				x = 18,
				y = 612
			}
		},
		{
			template = "decal_stage_11_rock_10",
			tween_amplitude = 20,
			tween_frecueny = 240,
			pos = {
				x = 554,
				y = 640
			}
		},
		{
			template = "decal_stage_11_rock_11",
			tween_amplitude = 20,
			tween_frecueny = 150,
			pos = {
				x = 803,
				y = 37
			}
		},
		{
			template = "decal_stage_11_rock_11",
			tween_amplitude = 20,
			tween_frecueny = 150,
			pos = {
				x = 152,
				y = 107
			}
		},
		{
			template = "decal_stage_11_rock_11",
			tween_amplitude = 10,
			tween_frecueny = 150,
			pos = {
				x = -95,
				y = 482
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 1161,
				y = 464
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 10,
			tween_frecueny = 150,
			pos = {
				x = -61,
				y = 466
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 10,
			tween_frecueny = 200,
			pos = {
				x = 1086,
				y = 486
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = -32,
				y = 602
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 30,
			tween_frecueny = 180,
			pos = {
				x = 399,
				y = 668
			}
		},
		{
			template = "decal_stage_11_rock_12",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 648,
				y = 690
			}
		},
		{
			template = "decal_stage_11_rock_13",
			tween_amplitude = 30,
			tween_frecueny = 210,
			pos = {
				x = -162,
				y = 92
			}
		},
		{
			template = "decal_stage_11_rock_14",
			tween_amplitude = 20,
			tween_frecueny = 210,
			pos = {
				x = -109,
				y = 110
			}
		},
		{
			template = "decal_stage_11_rock_15",
			tween_amplitude = 30,
			tween_frecueny = 270,
			pos = {
				x = -101,
				y = 4
			}
		},
		{
			template = "decal_stage_11_rock_15",
			tween_amplitude = 30,
			tween_frecueny = 270,
			pos = {
				x = 1142,
				y = 18
			}
		},
		{
			template = "decal_stage_11_rock_16",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = 971,
				y = -1
			}
		},
		{
			template = "decal_stage_11_rock_16",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = -181,
				y = 152
			}
		},
		{
			template = "decal_stage_11_rock_17",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = 583,
				y = 710
			}
		},
		{
			template = "decal_stage_11_rock_18",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = -124,
				y = 195
			}
		},
		{
			template = "decal_stage_11_rock_18",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = 455,
				y = 635
			}
		},
		{
			template = "decal_stage_11_rock_19",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 628,
				y = 640
			}
		},
		{
			template = "decal_stage_11_rock_2",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = 856,
				y = -3
			}
		},
		{
			template = "decal_stage_11_rock_2",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = 45,
				y = 55
			}
		},
		{
			template = "decal_stage_11_rock_2",
			tween_amplitude = 15,
			tween_frecueny = 240,
			pos = {
				x = 1225,
				y = 488
			}
		},
		{
			template = "decal_stage_11_rock_3",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = 298,
				y = 42
			}
		},
		{
			template = "decal_stage_11_rock_4",
			tween_amplitude = 30,
			tween_frecueny = 240,
			pos = {
				x = 176,
				y = 65
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 30,
			tween_frecueny = 210,
			pos = {
				x = 98,
				y = 22
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 907,
				y = 46
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 234,
				y = 93
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 30,
			tween_frecueny = 200,
			pos = {
				x = -112,
				y = 143
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 20,
			tween_frecueny = 150,
			pos = {
				x = -84,
				y = 540
			}
		},
		{
			template = "decal_stage_11_rock_5",
			tween_amplitude = 20,
			tween_frecueny = 180,
			pos = {
				x = 32,
				y = 565
			}
		},
		{
			template = "decal_stage_11_rock_6",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = 1097,
				y = 466
			}
		},
		{
			template = "decal_stage_11_rock_7",
			tween_amplitude = 10,
			tween_frecueny = 150,
			pos = {
				x = 44,
				y = 443
			}
		},
		{
			template = "decal_stage_11_rock_7",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = 1076,
				y = 464
			}
		},
		{
			template = "decal_stage_11_rock_8",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = -89,
				y = 180
			}
		},
		{
			template = "decal_stage_11_rock_8",
			tween_amplitude = 10,
			tween_frecueny = 150,
			pos = {
				x = 575,
				y = 347
			}
		},
		{
			template = "decal_stage_11_rock_8",
			tween_amplitude = 10,
			tween_frecueny = 180,
			pos = {
				x = 54,
				y = 588
			}
		},
		{
			template = "decal_stage_11_rock_8",
			tween_amplitude = 30,
			tween_frecueny = 200,
			pos = {
				x = 389,
				y = 694
			}
		},
		{
			template = "decal_stage_11_rock_9",
			tween_amplitude = 15,
			tween_frecueny = 210,
			pos = {
				x = 1126,
				y = 496
			}
		},
		{
			template = "decal_stage_11_sam_and_frodo",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_sam_and_frodo_mask",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_11_veznan_modes",
			["editor.game_mode"] = 2,
			pos = {
				x = 111,
				y = 555
			}
		},
		{
			template = "decal_stage_11_veznan_modes",
			["editor.game_mode"] = 3,
			pos = {
				x = 111,
				y = 555
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 963,
				y = -9
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 745,
				y = 16
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 376,
				y = 18
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = -166,
				y = -14
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = -64,
				y = -14
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = 889,
				y = 0
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = 96,
				y = 9
			}
		},
		{
			template = "decal_terrain_2_smoke",
			pos = {
				x = 994,
				y = 22
			}
		},
		{
			["editor.r"] = 6.1086523819802,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 210,
			pos = {
				x = 1070,
				y = 335
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 221,
				y = 696
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 266,
				y = 696
			}
		},
		{
			load_file = "level11_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 4,
			template = "tower_holder_blocked_terrain_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 340,
				y = 200
			},
			["tower.default_rally_pos"] = {
				x = 320,
				y = 285
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 4,
			template = "tower_holder_blocked_terrain_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 852,
				y = 292
			},
			["tower.default_rally_pos"] = {
				x = 743,
				y = 340.5
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 4,
			template = "tower_holder_blocked_terrain_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 536,
				y = 539
			},
			["tower.default_rally_pos"] = {
				x = 567,
				y = 476
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 659,
				y = 178
			},
			["tower.default_rally_pos"] = {
				x = 542,
				y = 200
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 433,
				y = 182
			},
			["tower.default_rally_pos"] = {
				x = 485,
				y = 261.5
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 748,
				y = 230
			},
			["tower.default_rally_pos"] = {
				x = 672,
				y = 296
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 955,
				y = 282
			},
			["tower.default_rally_pos"] = {
				x = 878,
				y = 391
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 212,
				y = 316
			},
			["tower.default_rally_pos"] = {
				x = 195,
				y = 247
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 566,
				y = 316
			},
			["tower.default_rally_pos"] = {
				x = 594,
				y = 254
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 442,
				y = 347
			},
			["tower.default_rally_pos"] = {
				x = 395,
				y = 275.5
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 134,
				y = 350
			},
			["tower.default_rally_pos"] = {
				x = 97,
				y = 277
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 536,
				y = 386
			},
			["tower.default_rally_pos"] = {
				x = 464,
				y = 467
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 246,
				y = 428
			},
			["tower.default_rally_pos"] = {
				x = 335,
				y = 358
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 432,
				y = 523
			},
			["tower.default_rally_pos"] = {
				x = 330,
				y = 499
			}
		}
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
				"tower_build_ballista",
				"tower_build_paladin_covenant"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_necromancer"
			}
		}
	},
	nav_mesh = {
		{
			2,
			3
		},
		{
			6,
			3,
			1,
			4
		},
		{
			5,
			nil,
			1,
			2
		},
		{
			7,
			6,
			2
		},
		{
			8,
			nil,
			3,
			6
		},
		{
			10,
			5,
			2,
			7
		},
		{
			11,
			6,
			4
		},
		{
			[3] = 5,
			[4] = 9
		},
		{
			nil,
			8,
			6,
			10
		},
		{
			13,
			9,
			6,
			11
		},
		{
			12,
			10,
			7
		},
		{
			13,
			nil,
			11
		},
		{
			14,
			nil,
			12
		},
		{
			[3] = 13
		}
	},
	required_exoskeletons = {
		"stage_11_portalDef",
		"stage_11_portal_fxDef",
		"stage_11_torchesDef",
		"stage_11_crystal1_1Def",
		"stage_11_crystal1_2Def",
		"stage_11_crystal2_1Def",
		"stage_11_crystal2_2Def",
		"stage_11_crystal2_3Def",
		"stage_11_crystal2_4Def",
		"stage_11_crystal2_5Def",
		"stage_11_crystal2_6Def",
		"denas_intro_baseDef",
		"denas_intro_chainsDef",
		"denas_intro_jumpDef",
		"mydriasDef",
		"stage_11_deco_mydrias_baseDef",
		"stage_11_deco_mydrias_workerDef",
		"t2_dustDef",
		"t2_smokeDef",
		"stage_11_elec1Def",
		"stage_11_elec2Def",
		"stage_11_elec3Def",
		"sam_and_frodoDef"
	},
	required_sounds = {
		"stage_11",
		"music_stage11",
		"enemies_terrain_2",
		"tower_elven_stargazers"
	},
	required_textures = {
		"go_enemies_terrain_2",
		"go_stage11_bg",
		"go_stage11",
		"go_towers_elven_stargazers",
		"go_stages_terrain2"
	}
}
