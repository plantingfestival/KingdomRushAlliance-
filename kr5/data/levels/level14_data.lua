﻿-- chunkname: @./kr5/data/levels/level14_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 644,
				y = 92
			}
		},
		{
			pos = {
				x = 1086,
				y = 333
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 600,
			y = 350
		}
	},
	entities_list = {
		{
			template = "aura_controller_stage_14_amalgam",
			pos = {
				x = 497,
				y = 520
			}
		},
		{
			template = "aura_stage_14_prevent_polymorph",
			pos = {
				x = 225,
				y = 742
			}
		},
		{
			template = "aura_stage_14_prevent_polymorph",
			pos = {
				x = 807,
				y = 743
			}
		},
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain3AmbienceSoundGutural"
			}
		},
		{
			template = "controller_stage_14_amalgam",
			pos = {
				x = 703,
				y = 388
			}
		},
		{
			template = "controller_terrain_3_floating_elements",
			pos = {
				x = 703,
				y = 388
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 1,
			decal_ground = "decal_stage_14_glare_1",
			pos = {
				x = 332,
				y = 314
			},
			waves = {
				{
					4,
					12,
					25
				},
				{
					5,
					15,
					25
				},
				{
					11,
					35,
					25
				},
				{
					14,
					35,
					25
				},
				{
					15,
					22,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 2,
			decal_ground = "decal_stage_14_glare_1",
			pos = {
				x = 332,
				y = 314
			},
			waves = {
				{
					1,
					15,
					25
				},
				{
					4,
					15,
					25
				},
				{
					6,
					30,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 3,
			decal_ground = "decal_stage_14_glare_1",
			pos = {
				x = 332,
				y = 314
			},
			waves = {
				{
					1,
					80,
					15
				},
				{
					1,
					118,
					20
				},
				{
					1,
					208,
					25
				},
				{
					1,
					340,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 1,
			decal_ground = "decal_stage_14_glare_2",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_14",
				"decal_terrain_3_glare_eye_small_1_stage_14",
				"decal_terrain_3_glare_eye_small_2_stage_14",
				"decal_terrain_3_glare_eye_small_3_stage_14"
			},
			pos = {
				x = 761,
				y = 420
			},
			waves = {
				{
					2,
					10,
					25
				},
				{
					4,
					5,
					25
				},
				{
					8,
					22,
					30
				},
				{
					14,
					15,
					25
				},
				{
					15,
					40,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 2,
			decal_ground = "decal_stage_14_glare_2",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_14",
				"decal_terrain_3_glare_eye_small_1_stage_14",
				"decal_terrain_3_glare_eye_small_2_stage_14",
				"decal_terrain_3_glare_eye_small_3_stage_14"
			},
			pos = {
				x = 761,
				y = 420
			},
			waves = {
				{
					3,
					5,
					25
				},
				{
					4,
					10,
					25
				},
				{
					6,
					15,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 3,
			decal_ground = "decal_stage_14_glare_2",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_14",
				"decal_terrain_3_glare_eye_small_1_stage_14",
				"decal_terrain_3_glare_eye_small_2_stage_14",
				"decal_terrain_3_glare_eye_small_3_stage_14"
			},
			pos = {
				x = 761,
				y = 420
			},
			waves = {
				{
					1,
					45,
					15
				},
				{
					1,
					85,
					15
				},
				{
					1,
					208,
					25
				},
				{
					1,
					270,
					25
				},
				{
					1,
					318,
					25
				}
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
			["render.sprites[1].name"] = "Stage14_0001",
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
				x = 644,
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
				x = 1086,
				y = 333
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 578,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 715,
				y = 92
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 264
			}
		},
		{
			["editor.flip"] = 1,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 391
			}
		},
		{
			template = "decal_stage_14_easter_egg_rickmorty",
			pos = {
				x = 980,
				y = 682
			}
		},
		{
			template = "decal_stage_14_hidden_path",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_14_mask_1",
			pos = {
				x = 102,
				y = 709
			}
		},
		{
			template = "decal_stage_14_mask_2",
			pos = {
				x = 1124,
				y = 545
			}
		},
		{
			template = "decal_stage_14_mask_3",
			pos = {
				x = 987,
				y = 651
			}
		},
		{
			template = "decal_stage_14_mask_4",
			pos = {
				x = 1011,
				y = 421
			}
		},
		{
			template = "decal_stage_14_mask_amalgam",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_14_tentacles",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.r"] = 3.4208453339089,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = -68,
				y = 257
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 192,
				y = 696
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 130,
			pos = {
				x = 238,
				y = 696
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 120,
			pos = {
				x = 786,
				y = 696
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 120,
			pos = {
				x = 832,
				y = 696
			}
		},
		{
			template = "ps_terrain_3_spores_1",
			pos = {
				x = 512,
				y = 0
			}
		},
		{
			template = "ps_terrain_3_spores_2",
			pos = {
				x = 512,
				y = 0
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 669,
				y = 272
			},
			["tower.default_rally_pos"] = {
				x = 599,
				y = 222
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 233,
				y = 337
			},
			["tower.default_rally_pos"] = {
				x = 196,
				y = 267
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 673,
				y = 430
			},
			["tower.default_rally_pos"] = {
				x = 636,
				y = 380
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 487,
				y = 173
			},
			["tower.default_rally_pos"] = {
				x = 527,
				y = 260
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 727,
				y = 194
			},
			["tower.default_rally_pos"] = {
				x = 628,
				y = 155
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 911,
				y = 271
			},
			["tower.default_rally_pos"] = {
				x = 850,
				y = 232
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 572,
				y = 326
			},
			["tower.default_rally_pos"] = {
				x = 473,
				y = 346
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 29,
				y = 327
			},
			["tower.default_rally_pos"] = {
				x = 127,
				y = 353
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 943,
				y = 333
			},
			["tower.default_rally_pos"] = {
				x = 870,
				y = 388
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 368,
				y = 369
			},
			["tower.default_rally_pos"] = {
				x = 464,
				y = 396
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 237,
				y = 422
			},
			["tower.default_rally_pos"] = {
				x = 134,
				y = 437
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 307,
				y = 479
			},
			["tower.default_rally_pos"] = {
				x = 172,
				y = 509
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 811,
				y = 481
			},
			["tower.default_rally_pos"] = {
				x = 901,
				y = 501
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 727,
				y = 518
			},
			["tower.default_rally_pos"] = {
				x = 737,
				y = 597
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
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
				"tower_build_royal_archers",
				"tower_build_ray"
			},
			locked_towers = {
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
			3
		},
		{
			4,
			3,
			1
		},
		{
			5,
			2,
			1
		},
		{
			5,
			nil,
			2,
			5
		},
		{
			7,
			4,
			3,
			6
		},
		{
			10,
			7,
			5
		},
		{
			9,
			8,
			5,
			6
		},
		{
			11,
			11,
			7,
			9
		},
		{
			10,
			8,
			7,
			10
		},
		{
			13,
			9,
			6
		},
		{
			12,
			nil,
			8,
			10
		},
		{
			14,
			nil,
			11,
			13
		},
		{
			14,
			12,
			10
		},
		{
			[3] = 12,
			[4] = 13
		}
	},
	required_exoskeletons = {
		"BKtentacle14Def",
		"stage_14_glare_1Def",
		"stage_14_glare_2Def",
		"dust_pathDef",
		"hidden_pathDef",
		"Rick1Def",
		"Rick2Def",
		"Rick3Def"
	},
	required_sounds = {
		"music_stage14",
		"terrain_3_common",
		"enemies_terrain_3",
		"tower_ghost",
		"stage_14"
	},
	required_textures = {
		"go_enemies_terrain_3",
		"go_stage14_bg",
		"go_stage14",
		"go_stages_terrain3",
		"go_towers_ghost"
	}
}
