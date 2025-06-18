return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 502,
				y = 92
			}
		},
		{
			pos = {
				x = 676,
				y = 92
			}
		}
	},
	custom_start_pos = {
		zoom = 1.2,
		pos = {
			x = 512,
			y = 500
		}
	},
	entities_list = {
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain1AmbienceSoundWind"
			}
		},
		{
			template = "controller_stage_06_minecraft_easter_egg",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_06_pool_party",
			["editor.game_mode"] = 2,
			pos = {
				x = 545,
				y = 554
			}
		},
		{
			template = "controller_stage_06_pool_party",
			["editor.game_mode"] = 3,
			pos = {
				x = 545,
				y = 554
			}
		},
		{
			template = "controller_stage_06_tiki_bar",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_06_tiki_bar",
			["editor.game_mode"] = 3,
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
			["render.sprites[1].name"] = "Stage06_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_boss_pig_pool",
			["editor.game_mode"] = 1,
			pos = {
				x = 545,
				y = 555
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 6,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 502,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 6,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 676,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 432,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 568,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 608,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 744,
				y = 92
			}
		},
		{
			template = "decal_gold_mount",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_gold_mount",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_pool_party1",
			["editor.game_mode"] = 2,
			pos = {
				x = 545,
				y = 554
			}
		},
		{
			template = "decal_pool_party1",
			["editor.game_mode"] = 3,
			pos = {
				x = 545,
				y = 554
			}
		},
		{
			template = "decal_pool_party2",
			["editor.game_mode"] = 2,
			pos = {
				x = 537,
				y = 603
			}
		},
		{
			template = "decal_pool_party2",
			["editor.game_mode"] = 3,
			pos = {
				x = 537,
				y = 603
			}
		},
		{
			template = "decal_pool_party3",
			["editor.game_mode"] = 2,
			pos = {
				x = 623,
				y = 621
			}
		},
		{
			template = "decal_pool_party3",
			["editor.game_mode"] = 3,
			pos = {
				x = 623,
				y = 621
			}
		},
		{
			template = "decal_pool_party4",
			["editor.game_mode"] = 2,
			pos = {
				x = 586,
				y = 564
			}
		},
		{
			template = "decal_pool_party4",
			["editor.game_mode"] = 3,
			pos = {
				x = 586,
				y = 564
			}
		},
		{
			template = "decal_pool_party5",
			["editor.game_mode"] = 2,
			pos = {
				x = 504,
				y = 609
			}
		},
		{
			template = "decal_pool_party5",
			["editor.game_mode"] = 3,
			pos = {
				x = 504,
				y = 609
			}
		},
		{
			template = "decal_pool_party6",
			["editor.game_mode"] = 2,
			pos = {
				x = 540,
				y = 623
			}
		},
		{
			template = "decal_pool_party6",
			["editor.game_mode"] = 3,
			pos = {
				x = 540,
				y = 623
			}
		},
		{
			template = "decal_pool_party7",
			["editor.game_mode"] = 2,
			pos = {
				x = 476,
				y = 556
			}
		},
		{
			template = "decal_pool_party7",
			["editor.game_mode"] = 3,
			pos = {
				x = 476,
				y = 556
			}
		},
		{
			template = "decal_pool_party8",
			["editor.game_mode"] = 2,
			pos = {
				x = 504,
				y = 626
			}
		},
		{
			template = "decal_pool_party8",
			["editor.game_mode"] = 3,
			pos = {
				x = 504,
				y = 626
			}
		},
		{
			template = "decal_stage_06_elder_rune",
			["editor.game_mode"] = 1,
			pos = {
				x = 1051,
				y = 110
			}
		},
		{
			template = "decal_stage_06_elder_rune_static",
			["editor.game_mode"] = 2,
			pos = {
				x = 1051,
				y = 110
			}
		},
		{
			template = "decal_stage_06_elder_rune_static",
			["editor.game_mode"] = 3,
			pos = {
				x = 1051,
				y = 110
			}
		},
		{
			template = "decal_stage_06_minecraft_easter_egg",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 1122,
				y = 230
			}
		},
		{
			template = "decal_stage_06_minecraft_easter_egg",
			pos = {
				x = 55,
				y = 602
			}
		},
		{
			template = "decal_stage_06_minecraft_easter_egg",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 1054,
				y = 614
			}
		},
		{
			template = "decal_tiki_bar1",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_tiki_bar1",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_tiki_bar6",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_tiki_bar6",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.r"] = 0.50440015382649,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 1070,
				y = 444
			}
		},
		{
			["editor.r"] = 1.5690509975429,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 302,
				y = 696
			}
		},
		{
			["editor.r"] = 1.569050997543,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 822,
				y = 700
			}
		},
		{
			load_file = "level06_door",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			load_file = "level06_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			["spawner.pi"] = 1,
			["spawner.name"] = "door",
			template = "stage_06_door",
			["editor.game_mode"] = 1,
			pos = {
				x = 59,
				y = 409
			}
		},
		{
			template = "stage_06_hole",
			pos = {
				x = 553,
				y = 383
			}
		},
		{
			template = "stage_06_hole_mask",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "stage_06_mask_1",
			pos = {
				x = -36,
				y = 586
			}
		},
		{
			template = "stage_06_mask_door",
			["editor.game_mode"] = 1,
			pos = {
				x = 28,
				y = 414
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 3,
			template = "tower_holder_blocked_sea_of_trees_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 584,
				y = 186
			},
			["tower.default_rally_pos"] = {
				x = 667,
				y = 185
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 3,
			template = "tower_holder_blocked_sea_of_trees_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 170,
				y = 400
			},
			["tower.default_rally_pos"] = {
				x = 181,
				y = 341
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 3,
			template = "tower_holder_blocked_sea_of_trees_2",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 942,
				y = 447
			},
			["tower.default_rally_pos"] = {
				x = 942,
				y = 385
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 250,
				y = 258
			},
			["tower.default_rally_pos"] = {
				x = 250,
				y = 334
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 412,
				y = 260
			},
			["tower.default_rally_pos"] = {
				x = 383,
				y = 197
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 692,
				y = 278
			},
			["tower.default_rally_pos"] = {
				x = 725,
				y = 211
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 908,
				y = 300
			},
			["tower.default_rally_pos"] = {
				x = 870,
				y = 245
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 332,
				y = 396
			},
			["tower.default_rally_pos"] = {
				x = 310,
				y = 334
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 788,
				y = 418
			},
			["tower.default_rally_pos"] = {
				x = 828,
				y = 362
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 296,
				y = 536
			},
			["tower.default_rally_pos"] = {
				x = 295,
				y = 475
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 3,
			template = "tower_holder_sea_of_trees_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 820,
				y = 568
			},
			["tower.default_rally_pos"] = {
				x = 815,
				y = 498
			}
		}
	},
	ignore_walk_backwards_paths = {
		4,
		5
	},
	invalid_path_ranges = {},
	level_mode_overrides = {
		{},
		{},
		{
			available_towers = {
				"tower_build_royal_archers",
				"tower_build_demon_pit"
			},
			locked_towers = {
				"tower_build_arcane_wizard",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_elven_stargazers"
			}
		}
	},
	nav_mesh = {
		{
			4,
			3,
			nil,
			2
		},
		{
			5,
			1
		},
		{
			9,
			nil,
			1,
			4
		},
		{
			8,
			3,
			1,
			5
		},
		{
			6,
			4,
			2,
			6
		},
		{
			7,
			nil,
			5
		},
		{
			10,
			8,
			6,
			6
		},
		{
			11,
			9,
			4,
			7
		},
		{
			11,
			nil,
			3,
			8
		},
		{
			nil,
			11,
			7
		},
		{
			nil,
			9,
			8,
			10
		}
	},
	required_exoskeletons = {
		"GoregrindDef",
		"GoregrindPoolDef"
	},
	required_sounds = {
		"music_stage06",
		"enemies_sea_of_trees",
		"stage_06",
		"terrain_1_common",
		"enemies_rising_tides"
	},
	required_textures = {
		"go_enemies_sea_of_trees",
		"go_stage06_bg",
		"go_stage06",
		"go_stages_sea_of_trees",
		"go_enemies_rising_tides"
	}
}
