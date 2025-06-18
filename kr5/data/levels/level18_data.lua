return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 220,
				y = 416
			}
		},
		{
			pos = {
				x = 355,
				y = 519
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 475,
			y = 480
		}
	},
	entities_list = {
		{
			template = "controller_stage_18_eridan",
			pos = {
				x = 226,
				y = 568
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
			["render.sprites[1].name"] = "Stage18_0001",
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
				x = 220,
				y = 416
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 355,
				y = 519
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 166,
				y = 372
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 271,
				y = 456
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 301,
				y = 476
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 403,
				y = 558
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
			template = "decal_stage_18_bubbles",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_bubbles_water",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_cuckoo",
			pos = {
				x = 176,
				y = 670
			}
		},
		{
			template = "decal_stage_18_mask_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_streetlight_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_streetlight_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_streetlight_3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_streetlight_4",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_tree_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_18_tree_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_4_cheshire_cat_easter_egg",
			level_index = 1,
			pos = {
				x = 18,
				y = 213
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 160,
			pos = {
				x = 512,
				y = 121
			}
		},
		{
			["editor.r"] = 3.3861802251067e-15,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 1070,
				y = 356
			}
		},
		{
			["editor.r"] = 0.017453292519947,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 1070,
				y = 402
			}
		},
		{
			["editor.r"] = 0.03490658503989,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 1070,
				y = 566
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 729,
				y = 185
			},
			["tower.default_rally_pos"] = {
				x = 648,
				y = 237
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 317,
				y = 248
			},
			["tower.default_rally_pos"] = {
				x = 360,
				y = 335
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 438,
				y = 248
			},
			["tower.default_rally_pos"] = {
				x = 461,
				y = 326
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 438,
				y = 248
			},
			["tower.default_rally_pos"] = {
				x = 461,
				y = 326
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 543,
				y = 248
			},
			["tower.default_rally_pos"] = {
				x = 554,
				y = 331
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 760,
				y = 256
			},
			["tower.default_rally_pos"] = {
				x = 718,
				y = 338
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 827,
				y = 292
			},
			["tower.default_rally_pos"] = {
				x = 773,
				y = 366
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 225,
				y = 299
			},
			["tower.default_rally_pos"] = {
				x = 278,
				y = 372
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 412,
				y = 394
			},
			["tower.default_rally_pos"] = {
				x = 407,
				y = 495
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 532,
				y = 394
			},
			["tower.default_rally_pos"] = {
				x = 568,
				y = 487
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 651,
				y = 394
			},
			["tower.default_rally_pos"] = {
				x = 641,
				y = 328
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 924,
				y = 437
			},
			["tower.default_rally_pos"] = {
				x = 876,
				y = 376
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 749,
				y = 520
			},
			["tower.default_rally_pos"] = {
				x = 667,
				y = 480
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 6,
			template = "tower_holder_sea_of_trees_6",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 907,
				y = 540
			},
			["tower.default_rally_pos"] = {
				x = 849,
				y = 633
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 6,
			template = "tower_stage_18_elven_barrack",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 438,
				y = 248
			},
			["tower.default_rally_pos"] = {
				x = 461,
				y = 326
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 6,
			template = "tower_stage_18_elven_barrack",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 831,
				y = 473
			},
			["tower.default_rally_pos"] = {
				x = 759,
				y = 432
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 6,
			template = "tower_stage_18_elven_barrack",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 518,
				y = 548
			},
			["tower.default_rally_pos"] = {
				x = 490,
				y = 484
			}
		}
	},
	ignore_walk_backwards_paths = {},
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
				"tower_build_flamespitter",
				"tower_build_ray"
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
				"tower_build_necromancer",
				"tower_build_barrel",
				"tower_build_ghost"
			}
		}
	},
	nav_mesh = {
		{
			2,
			nil,
			nil,
			2
		},
		{
			4,
			3,
			1
		},
		{
			6,
			5,
			2,
			4
		},
		{
			7,
			3,
			2
		},
		{
			10,
			nil,
			nil,
			6
		},
		{
			8,
			5,
			3,
			7
		},
		{
			9,
			6,
			4
		},
		{
			12,
			10,
			6,
			7
		},
		{
			nil,
			11,
			7
		},
		{
			13,
			nil,
			5,
			8
		},
		{
			12,
			12,
			7,
			9
		},
		{
			15,
			15,
			11,
			11
		},
		{
			15,
			14,
			10,
			12
		},
		{
			[3] = 10,
			[4] = 15
		},
		{
			nil,
			14,
			13,
			12
		}
	},
	required_exoskeletons = {
		"stage_18_bubblesDef",
		"stage_18_bubbles_waterDef",
		"stage_18_light_1Def",
		"stage_18_light_2Def",
		"stage_18_light_3Def",
		"stage_18_light_4Def",
		"stage_18_tree_1Def",
		"stage_18_tree_2Def"
	},
	required_sounds = {
		"music_stage18",
		"terrain_4_common",
		"enemies_terrain_4",
		"stage_18"
	},
	required_textures = {
		"go_enemies_sea_of_trees",
		"go_enemies_terrain_4",
		"go_stage18_bg",
		"go_stage18",
		"go_stages_terrain4"
	}
}