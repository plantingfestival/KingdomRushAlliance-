﻿-- chunkname: @./kr5/data/levels/level02_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 112.39511957052,
				y = 350.41639824305
			}
		},
		{
			pos = {
				x = 157.9728648121,
				y = 376.8035139092
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 0,
			y = 380
		}
	},
	entities_list = {
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain1AmbienceSoundBirds"
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
			template = "decal_arborean_baby_clickeable",
			pos = {
				x = 515,
				y = 428
			}
		},
		{
			template = "decal_arborean_baby_clickeable",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 428,
				y = 469
			}
		},
		{
			template = "decal_arborean_baby_clickeable",
			["render.sprites[1].flip_x"] = true,
			pos = {
				x = 504,
				y = 511
			}
		},
		{
			template = "decal_background",
			["render.sprites[1].z"] = 1000,
			["render.sprites[1].name"] = "Stage02_0001",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_background",
			["render.sprites[1].z"] = 3100,
			["render.sprites[1].name"] = "stage_2_mask_path",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 3,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 113,
				y = 393
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 38,
				y = 374
			}
		},
		{
			["editor.flip"] = 0,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 182,
				y = 406
			}
		},
		{
			["delayed_play.min_delay"] = 10,
			["render.sprites[1].r"] = 0,
			template = "decal_stage_02_butterfly_1",
			["delayed_play.max_delay"] = 30,
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
			["delayed_play.min_delay"] = 15,
			["render.sprites[1].r"] = 0,
			template = "decal_stage_02_butterfly_2",
			["delayed_play.max_delay"] = 35,
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
			["delayed_play.min_delay"] = 12,
			["render.sprites[1].r"] = 0,
			template = "decal_stage_02_butterfly_3",
			["delayed_play.max_delay"] = 32,
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
			template = "decal_stage_02_elder_rune",
			["editor.game_mode"] = 1,
			pos = {
				x = 567,
				y = 522
			}
		},
		{
			template = "decal_stage_02_elder_rune_static",
			["editor.game_mode"] = 2,
			pos = {
				x = 567,
				y = 522
			}
		},
		{
			template = "decal_stage_02_elder_rune_static",
			["editor.game_mode"] = 3,
			pos = {
				x = 567,
				y = 522
			}
		},
		{
			template = "decal_stage_02_fishing_link",
			pos = {
				x = 380,
				y = 209
			}
		},
		{
			template = "decal_stage_02_fishing_link_water_splash",
			pos = {
				x = 327,
				y = 110
			}
		},
		{
			template = "decal_stage_02_lion_king",
			pos = {
				x = 979,
				y = 428
			}
		},
		{
			template = "decal_stage_02_wisps",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 316,
				y = 7
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 115,
				y = 10
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 211,
				y = 12
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 381,
				y = 14
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 273,
				y = 21
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 232,
				y = 39
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 133,
				y = 40
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 361,
				y = 43
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 301,
				y = 52
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 34,
				y = 56
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 191,
				y = 59
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 241,
				y = 74
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 137,
				y = 83
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 322,
				y = 87
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 379,
				y = 91
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 207,
				y = 98
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 36,
				y = 106
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 265,
				y = 111
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_water_shine",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "props_water_shine",
			pos = {
				x = 124,
				y = 116
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_waterfall",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_2_props_waterfall",
			pos = {
				x = -192,
				y = 286
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_waterfall_splash",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].name"] = "stage_2_props_waterfall_splash",
			pos = {
				x = 6,
				y = 113
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.55850536063818,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 148,
				y = 20
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -1.0646508437165,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 182,
				y = 24
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.83775804095723,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 326,
				y = 49
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.29670597283899,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 352,
				y = 59
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.087266462599714,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 78,
				y = 76
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.62831853071796,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 6,
				y = 81
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = 0.017453292519987,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 258,
				y = 91
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.052359877559827,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 79,
				y = 98
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = -0.19198621771938,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 37,
				y = 108
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].z"] = 1401,
			template = "decal_waterfall_waves",
			["render.sprites[1].r"] = 0.13962634015959,
			["render.sprites[1].name"] = "props_waterfall_waves",
			pos = {
				x = 278,
				y = 113
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["editor.r"] = -9.5132235422568e-15,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 164,
			pos = {
				x = 1062,
				y = 224
			}
		},
		{
			["editor.r"] = 0.017453292519941,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 166,
			pos = {
				x = 1062,
				y = 532
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 539,
				y = 216
			},
			["tower.default_rally_pos"] = {
				x = 589,
				y = 294
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 293,
				y = 257
			},
			["tower.default_rally_pos"] = {
				x = 314,
				y = 346
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 846,
				y = 266
			},
			["tower.default_rally_pos"] = {
				x = 854,
				y = 206
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 738,
				y = 270
			},
			["tower.default_rally_pos"] = {
				x = 684,
				y = 217
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 961,
				y = 273
			},
			["tower.default_rally_pos"] = {
				x = 932,
				y = 218
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 393,
				y = 279
			},
			["tower.default_rally_pos"] = {
				x = 430,
				y = 354
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 572,
				y = 355
			},
			["tower.default_rally_pos"] = {
				x = 507,
				y = 316
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 264,
				y = 392
			},
			["tower.default_rally_pos"] = {
				x = 217,
				y = 327
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 646,
				y = 402
			},
			["tower.default_rally_pos"] = {
				x = 686,
				y = 337
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 847,
				y = 466
			},
			["tower.default_rally_pos"] = {
				x = 771,
				y = 523
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 1,
			template = "tower_holder_sea_of_trees",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 921,
				y = 511
			},
			["tower.default_rally_pos"] = {
				x = 832,
				y = 578
			}
		},
		{
			template = "trees_guardian_tree",
			pos = {
				x = 77,
				y = 448
			}
		}
	},
	invalid_path_ranges = {},
	level_mode_overrides = {
		{
			max_upgrade_level = 5,
			locked_towers = {
				"tower_royal_archers_lvl3",
				"tower_paladin_covenant_lvl3",
				"tower_arcane_wizard_lvl3",
				"tower_tricannon_lvl3",
				"tower_arborean_emissary_lvl3",
				"tower_demon_pit_lvl3",
				"tower_elven_stargazers_lvl3",
				"tower_rocket_gunners_lvl3",
				"tower_necromancer_lvl3",
				"tower_ballista_lvl3",
				"tower_flamespitter_lvl3",
				"tower_barrel_lvl3",
				"tower_sand_lvl3",
				"tower_ghost_lvl3",
				"tower_ray_lvl3",
				"tower_dark_elf_lvl3",
				"tower_dwarf_lvl3",
				"tower_hermit_toad_lvl3",
				"tower_sparking_geode_lvl3"
			}
		},
		{
			locked_towers = {
				"tower_royal_archers_lvl3",
				"tower_paladin_covenant_lvl3",
				"tower_arcane_wizard_lvl3",
				"tower_tricannon_lvl3",
				"tower_arborean_emissary_lvl3",
				"tower_demon_pit_lvl3",
				"tower_elven_stargazers_lvl3",
				"tower_rocket_gunners_lvl3",
				"tower_necromancer_lvl3",
				"tower_ballista_lvl3",
				"tower_flamespitter_lvl3",
				"tower_barrel_lvl3",
				"tower_sand_lvl3",
				"tower_ghost_lvl3",
				"tower_ray_lvl3",
				"tower_dark_elf_lvl3",
				"tower_dwarf_lvl3",
				"tower_hermit_toad_lvl3",
				"tower_sparking_geode_lvl3"
			}
		},
		{
			available_towers = {
				"tower_build_arcane_wizard",
				"tower_build_tricannon"
			},
			locked_towers = {
				"tower_arcane_wizard_lvl3",
				"tower_tricannon_lvl3"
			}
		}
	},
	nav_mesh = {
		{
			5,
			nil,
			nil,
			2
		},
		{
			3,
			1
		},
		{
			4,
			nil,
			2
		},
		{
			7,
			5,
			3
		},
		{
			6,
			nil,
			1,
			4
		},
		{
			8,
			nil,
			5,
			7
		},
		{
			9,
			6,
			4
		},
		{
			10,
			nil,
			6,
			9
		},
		{
			11,
			8,
			7
		},
		{
			[3] = 8,
			[4] = 11
		},
		{
			nil,
			10,
			9
		}
	},
	required_exoskeletons = {
		"Stage02TreePart2Def",
		"Stage02TreeDef",
		"stage_2_butterfly_2Def",
		"stage_2_butterfly_3Def",
		"stage_2_wisps_1Def",
		"stage_2_butterfly_1Def",
		"stage_2_wisps_2Def"
	},
	required_sounds = {
		"music_stage02",
		"enemies_sea_of_trees",
		"stage_02",
		"terrain_1_common"
	},
	required_textures = {
		"go_enemies_sea_of_trees",
		"go_stages_sea_of_trees",
		"go_stage02_bg",
		"go_stage02"
	}
}
