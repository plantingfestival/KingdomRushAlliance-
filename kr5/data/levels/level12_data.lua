﻿-- chunkname: @./kr5/data/levels/level12_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -68,
				y = 244
			}
		},
		{
			pos = {
				x = -68,
				y = 500
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 400,
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
				"Terrain3AmbienceSoundGutural"
			}
		},
		{
			template = "controller_terrain_3_floating_elements",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 1,
			pos = {
				x = 621,
				y = 420
			},
			waves = {
				{
					2,
					12,
					25
				},
				{
					5,
					35,
					15
				},
				{
					8,
					5,
					25
				},
				{
					11,
					10,
					20
				},
				{
					13,
					15,
					25
				},
				{
					14,
					10,
					20
				},
				{
					15,
					50,
					15
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 2,
			pos = {
				x = 621,
				y = 420
			},
			waves = {
				{
					2,
					12,
					25
				},
				{
					4,
					5,
					25
				},
				{
					6,
					10,
					30
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 3,
			pos = {
				x = 621,
				y = 420
			},
			waves = {
				{
					1,
					10,
					25
				},
				{
					1,
					90,
					25
				},
				{
					1,
					210,
					40
				},
				{
					1,
					270,
					40
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
			["render.sprites[1].name"] = "Stage12_0001",
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
				y = 244
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
				y = 500
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 180
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 304
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 453
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 552
			}
		},
		{
			template = "decal_stage_12_easter_egg_strangerthings",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["render.sprites[1].flip_x"] = false,
			template = "decal_stage_12_mask_1",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].sort_y_offset"] = 1,
			pos = {
				x = 547,
				y = 630
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].flip_x"] = false,
			template = "decal_stage_12_mask_2",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].sort_y_offset"] = 2,
			pos = {
				x = 892.92,
				y = 674.9
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].flip_x"] = false,
			template = "decal_stage_12_mask_3",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].sort_y_offset"] = 0,
			pos = {
				x = 610.95,
				y = 526.27
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].flip_x"] = false,
			template = "decal_stage_12_mask_4",
			["render.sprites[1].r"] = 0,
			["render.sprites[1].sort_y_offset"] = 3,
			pos = {
				x = 1089.42,
				y = 112.75
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			template = "decal_stage_12_sheepy_easteregg",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_12_tentacles",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_12_windmill",
			pos = {
				x = 733.73,
				y = 633.95
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 5,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 217.47,
				y = 18.63
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 22,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = 233.63,
				y = 61.68
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 0,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = 144.35,
				y = 74.68
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 24,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 253.27,
				y = 78.13
			},
			["render.sprites[1].scale"] = {
				x = 0.49,
				y = 0.49
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 23,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 221.72,
				y = 82.07
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 25,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_05",
			pos = {
				x = 231.27,
				y = 90.3
			},
			["render.sprites[1].scale"] = {
				x = 0.69,
				y = 0.69
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 35,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 169.88,
				y = 94.42
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 34,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 122.05,
				y = 99
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 39,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_03",
			pos = {
				x = 60.9,
				y = 105.1
			},
			["render.sprites[1].scale"] = {
				x = 0.74,
				y = 0.74
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 36,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_05",
			pos = {
				x = 140.2,
				y = 108.63
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 32,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 366.27,
				y = 109.67
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 26,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 299,
				y = 121.15
			},
			["render.sprites[1].scale"] = {
				x = 0.87,
				y = 0.87
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 1,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 332.42,
				y = 123.22
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 33,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = -13.83,
				y = 126.92
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 16,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 888.53,
				y = 129.13
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 31,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = -125,
				y = 136.38
			},
			["render.sprites[1].scale"] = {
				x = 0.87,
				y = 0.87
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 37,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 383.43,
				y = 153.82
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 29,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = -6.38,
				y = 158.38
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 2,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 881,
				y = 161.55
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 6,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 335.88,
				y = 168.52
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 38,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_05",
			pos = {
				x = 365,
				y = 169.07
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 17,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 900.18,
				y = 196.97
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 3,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = 1033.75,
				y = 241.23
			},
			["render.sprites[1].scale"] = {
				x = 0.71,
				y = 0.71
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 3,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 896.25,
				y = 242.9
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 4,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 989.58,
				y = 245.05
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 11,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_05",
			pos = {
				x = 925.8,
				y = 245.32
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 5,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 1064.73,
				y = 246.4
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 10,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0.11,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_06",
			pos = {
				x = 1026.75,
				y = 257.35
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 12,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = -125.17,
				y = 361.15
			},
			["render.sprites[1].scale"] = {
				x = 0.66,
				y = 0.66
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 13,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = -158.45,
				y = 370.65
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 0,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = -76.05,
				y = 383.83
			},
			["render.sprites[1].scale"] = {
				x = 0.71,
				y = 0.71
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 14,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 28.5,
				y = 385.65
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 2,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = -45.08,
				y = 389
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 1,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = -118.67,
				y = 392.3
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 9,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 1112.93,
				y = 396.63
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 8,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 1065.1,
				y = 401.2
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 15,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = -10.83,
				y = 402.65
			},
			["render.sprites[1].scale"] = {
				x = 0.66,
				y = 0.66
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 9,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0.03,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_06",
			pos = {
				x = -82.23,
				y = 404.35
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 10,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_05",
			pos = {
				x = 1083.25,
				y = 410.82
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 2,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_09",
			pos = {
				x = 673.57,
				y = 617.02
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 1,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_08",
			pos = {
				x = 654.78,
				y = 640.25
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 6,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = 373.45,
				y = 645.77
			},
			["render.sprites[1].scale"] = {
				x = 0.71,
				y = 0.71
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 0,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = -0.36,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_08",
			pos = {
				x = 682.42,
				y = 650.1
			},
			["render.sprites[1].scale"] = {
				x = 0.79,
				y = 0.79
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 8,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 404.42,
				y = 650.95
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 7,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 330.83,
				y = 654.25
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 18,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = -17.05,
				y = 655.23
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 20,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = -50.42,
				y = 659.67
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 19,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 4.65,
				y = 666
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 12,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0.03,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_06",
			pos = {
				x = 366.92,
				y = 667.4
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 4,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_04",
			pos = {
				x = 740.7,
				y = 676.13
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 21,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 164.32,
				y = 677.15
			},
			["render.sprites[1].scale"] = {
				x = 0.66,
				y = 0.66
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 27,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_02",
			pos = {
				x = 638.2,
				y = 679.15
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 7,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_03",
			pos = {
				x = 64.25,
				y = 681.15
			},
			["render.sprites[1].scale"] = {
				x = 0.74,
				y = 0.74
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 28,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "T3_Stage_12_floating_01",
			pos = {
				x = 767.02,
				y = 694.58
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 620,
				y = 102
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 666,
				y = 102
			}
		},
		{
			["editor.r"] = 0,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 1086,
				y = 514
			}
		},
		{
			["editor.r"] = 0,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 1086,
				y = 557
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
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 807,
				y = 257
			},
			["tower.default_rally_pos"] = {
				x = 733,
				y = 334
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 181,
				y = 356
			},
			["tower.default_rally_pos"] = {
				x = 219,
				y = 291
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 517,
				y = 414
			},
			["tower.default_rally_pos"] = {
				x = 396,
				y = 404
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 975,
				y = 439
			},
			["tower.default_rally_pos"] = {
				x = 860,
				y = 461
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 403,
				y = 560
			},
			["tower.default_rally_pos"] = {
				x = 349,
				y = 482
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 579,
				y = 235
			},
			["tower.default_rally_pos"] = {
				x = 579,
				y = 327
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 424,
				y = 253
			},
			["tower.default_rally_pos"] = {
				x = 435,
				y = 355
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 84,
				y = 304
			},
			["tower.default_rally_pos"] = {
				x = 78,
				y = 244
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 917,
				y = 334
			},
			["tower.default_rally_pos"] = {
				x = 831,
				y = 397
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 282,
				y = 393
			},
			["tower.default_rally_pos"] = {
				x = 342,
				y = 329
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 725,
				y = 412
			},
			["tower.default_rally_pos"] = {
				x = 790,
				y = 358
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 975,
				y = 439
			},
			["tower.default_rally_pos"] = {
				x = 860,
				y = 461
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 975,
				y = 439
			},
			["tower.default_rally_pos"] = {
				x = 860,
				y = 461
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 196,
				y = 446
			},
			["tower.default_rally_pos"] = {
				x = 196,
				y = 531
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 451,
				y = 483
			},
			["tower.default_rally_pos"] = {
				x = 376,
				y = 448
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 403,
				y = 560
			},
			["tower.default_rally_pos"] = {
				x = 349,
				y = 482
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 403,
				y = 560
			},
			["tower.default_rally_pos"] = {
				x = 349,
				y = 482
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
		6
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
				"tower_build_rocket_gunners",
				"tower_build_flamespitter"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers",
				"tower_build_ballista",
				"tower_build_necromancer",
				"tower_build_paladin_covenant",
				"tower_build_barrel"
			}
		}
	},
	nav_mesh = {
		{
			2
		},
		{
			4,
			3,
			1
		},
		{
			4,
			nil,
			nil,
			2
		},
		{
			8,
			5,
			2,
			6
		},
		{
			7,
			nil,
			3,
			4
		},
		{
			9,
			7,
			4
		},
		{
			8,
			5,
			5,
			6
		},
		{
			10,
			7,
			4,
			9
		},
		{
			11,
			8,
			6
		},
		{
			13,
			nil,
			8,
			11
		},
		{
			12,
			10,
			9
		},
		{
			nil,
			13,
			11
		},
		{
			[3] = 10,
			[4] = 12
		}
	},
	required_exoskeletons = {
		"BKtentacleDef",
		"stage_12_glareDef",
		"t3_windmillDef",
		"stranger_thingsDef",
		"stage_12_sheepyDef"
	},
	required_sounds = {
		"music_stage12",
		"stage_12",
		"terrain_3_common",
		"enemies_terrain_3",
		"tower_sand"
	},
	required_textures = {
		"go_enemies_terrain_3",
		"go_stage12_bg",
		"go_stage12",
		"go_stages_terrain3",
		"go_towers_sand"
	}
}
