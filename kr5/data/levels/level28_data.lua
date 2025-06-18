﻿-- chunkname: @./kr5/data/levels/level28_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -78,
				y = 405
			}
		},
		{
			pos = {
				x = 540,
				y = 55
			}
		}
	},
	custom_start_pos = {
		zoom = 1.2,
		pos = {
			x = 373,
			y = 202
		}
	},
	entities_list = {
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
			template = "decal_achievement_into_the_ogreverse",
			pos = {
				x = 1000,
				y = 610
			}
		},
		{
			template = "decal_background",
			["render.sprites[1].z"] = 1000,
			["render.sprites[1].name"] = "Stage28_0001",
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
				x = 539,
				y = 52
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = -78,
				y = 405
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 462,
				y = 52
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 613,
				y = 52
			}
		},
		{
			["editor.flip"] = -1,
			template = "decal_defense_flag5",
			pos = {
				x = -151,
				y = 353
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -26,
				y = 457
			}
		},
		{
			template = "decal_stage_28_mask_1",
			pos = {
				x = 766,
				y = 549
			}
		},
		{
			template = "decal_stage_28_mask_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_28_mask_3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_28_torches",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.r"] = -7.3478361508961,
			["editor.path_id"] = 7,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 858,
				y = 166
			}
		},
		{
			["editor.r"] = -6.2831853071796,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 1119,
				y = 325
			}
		},
		{
			["editor.r"] = -5.7595865315813,
			["editor.path_id"] = 6,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 1079,
				y = 547
			}
		},
		{
			["editor.r"] = -4.7123889803847,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 770,
				y = 591
			}
		},
		{
			["editor.r"] = -4.7123889803847,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 723,
				y = 592
			}
		},
		{
			["editor.r"] = -4.7123889803847,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 202,
				y = 608
			}
		},
		{
			["editor.r"] = -6.0911990894603,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 1064,
				y = 615
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 977,
				y = 183
			},
			["tower.default_rally_pos"] = {
				x = 893,
				y = 256
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 246,
				y = 261
			},
			["tower.default_rally_pos"] = {
				x = 225,
				y = 188
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 380,
				y = 261
			},
			["tower.default_rally_pos"] = {
				x = 383,
				y = 198
			}
		},
		{
			["tower.spawn_path_index"] = 3,
			["tower.terrain_style"] = 4,
			["ui.nav_mesh_id"] = "14",
			["tower.holder_id"] = "14",
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 1,
			["tower.spawn_node_index"] = 115,
			pos = {
				x = 14,
				y = 282
			},
			["tower.default_rally_pos"] = {
				x = 136,
				y = 263
			}
		},
		{
			["tower.spawn_path_index"] = 3,
			["tower.terrain_style"] = 4,
			["ui.nav_mesh_id"] = "14",
			["tower.holder_id"] = "14",
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 2,
			["tower.spawn_node_index"] = 15,
			pos = {
				x = 14,
				y = 282
			},
			["tower.default_rally_pos"] = {
				x = 136,
				y = 263
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 882,
				y = 326
			},
			["tower.default_rally_pos"] = {
				x = 799,
				y = 281
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 882,
				y = 326
			},
			["tower.default_rally_pos"] = {
				x = 799,
				y = 281
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 628,
				y = 363
			},
			["tower.default_rally_pos"] = {
				x = 590,
				y = 451
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 980,
				y = 370
			},
			["tower.default_rally_pos"] = {
				x = 979,
				y = 283
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 330,
				y = 425
			},
			["tower.default_rally_pos"] = {
				x = 330,
				y = 350
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 43,
				y = 447
			},
			["tower.default_rally_pos"] = {
				x = 20,
				y = 380
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 842,
				y = 453
			},
			["tower.default_rally_pos"] = {
				x = 749,
				y = 410
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 628,
				y = 518
			},
			["tower.default_rally_pos"] = {
				x = 692,
				y = 462
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 513,
				y = 531
			},
			["tower.default_rally_pos"] = {
				x = 460,
				y = 460
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 99,
				y = 539
			},
			["tower.default_rally_pos"] = {
				x = 214,
				y = 543
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 316,
				y = 575
			},
			["tower.default_rally_pos"] = {
				x = 305,
				y = 516
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.spawn_path_index"] = 3,
			template = "tower_stage_28_priests_barrack",
			["editor.game_mode"] = 3,
			["tower.spawn_node_index"] = 115,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 14,
				y = 282
			},
			["tower.default_rally_pos"] = {
				x = 136,
				y = 263
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.spawn_path_index"] = 3,
			template = "tower_stage_28_priests_barrack",
			["editor.game_mode"] = 3,
			["tower.spawn_node_index"] = 115,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 892,
				y = 340
			},
			["tower.default_rally_pos"] = {
				x = 799,
				y = 281
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 4,
			template = "tower_stage_28_priests_barrack",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 330,
				y = 433
			},
			["tower.default_rally_pos"] = {
				x = 230,
				y = 360
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.spawn_path_index"] = 3,
			template = "tower_stage_28_priests_barrack",
			["editor.game_mode"] = 3,
			["tower.spawn_node_index"] = 115,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 330,
				y = 433
			},
			["tower.default_rally_pos"] = {
				x = 230,
				y = 360
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
		6,
		7,
		8,
		9,
		10
	},
	invalid_path_ranges = {
		{
			path_id = 1,
			to = 13
		},
		{
			path_id = 2,
			to = 14
		},
		{
			path_id = 3,
			to = 14
		},
		{
			path_id = 10,
			to = 28
		}
	},
	level_mode_overrides = {
		{
			max_upgrade_level = 5,
			locked_powers = {},
			locked_towers = {}
		},
		{},
		{
			available_towers = {
				"tower_build_hermit_toad"
			},
			locked_towers = {
				"tower_build_arborean_emissary",
				"tower_build_ballista",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_arcane_wizard",
				"tower_build_barrel",
				"tower_build_royal_archers",
				"tower_build_ray",
				"tower_build_ghost",
				"tower_build_necromancer",
				"tower_build_sand"
			}
		}
	},
	nav_mesh = {
		{
			2,
			3,
			nil,
			14
		},
		{
			5,
			4,
			1,
			12
		},
		{
			4,
			nil,
			nil,
			1
		},
		{
			5,
			5,
			3,
			2
		},
		{
			6,
			nil,
			4,
			11
		},
		{
			7,
			nil,
			5,
			11
		},
		{
			9,
			nil,
			6,
			8
		},
		{
			9,
			7,
			11,
			10
		},
		{
			nil,
			7,
			8,
			10
		},
		{
			nil,
			8,
			11
		},
		{
			10,
			6,
			12
		},
		{
			11,
			2,
			13
		},
		{
			12,
			2,
			14
		},
		{
			13,
			1
		}
	},
	required_exoskeletons = {
		"stage_28_antorchasDef"
	},
	required_sounds = {
		"music_stage28",
		"enemies_terrain_spiders",
		"stage_28"
	},
	required_textures = {
		"go_stage28_bg",
		"go_stage28",
		"go_enemies_terrain_7"
	}
}
