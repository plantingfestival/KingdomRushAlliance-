﻿-- chunkname: @./kr5/data/levels/level15_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = -68,
				y = 435
			}
		},
		{
			pos = {
				x = -68,
				y = 292
			}
		}
	},
	custom_start_pos = {
		zoom = 1.2,
		pos = {
			x = 200,
			y = 300
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
			decal_ground = "decal_stage_15_glare",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_15",
				"decal_terrain_3_glare_eye_small_1_stage_15",
				"decal_terrain_3_glare_eye_small_2_stage_15",
				"decal_terrain_3_glare_eye_small_3_stage_15"
			},
			pos = {
				x = 570,
				y = 374
			},
			waves = {
				{
					1,
					6,
					25
				},
				{
					3,
					6,
					30
				},
				{
					6,
					6,
					25
				},
				{
					7,
					10,
					30
				},
				{
					10,
					6,
					30
				},
				{
					11,
					6,
					45
				},
				{
					13,
					6,
					30
				},
				{
					15,
					6,
					30
				},
				{
					16,
					6,
					30
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 2,
			decal_ground = "decal_stage_15_glare",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_15",
				"decal_terrain_3_glare_eye_small_1_stage_15",
				"decal_terrain_3_glare_eye_small_2_stage_15",
				"decal_terrain_3_glare_eye_small_3_stage_15"
			},
			pos = {
				x = 570,
				y = 374
			},
			waves = {
				{
					2,
					10,
					26
				},
				{
					3,
					30,
					30
				},
				{
					5,
					10,
					30
				},
				{
					6,
					40,
					25
				}
			}
		},
		{
			template = "controller_terrain_3_local_glare",
			["editor.game_mode"] = 3,
			decal_ground = "decal_stage_15_glare",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_15",
				"decal_terrain_3_glare_eye_small_1_stage_15",
				"decal_terrain_3_glare_eye_small_2_stage_15",
				"decal_terrain_3_glare_eye_small_3_stage_15"
			},
			pos = {
				x = 570,
				y = 374
			},
			waves = {
				{
					1,
					45,
					25
				},
				{
					1,
					115,
					30
				},
				{
					1,
					170,
					35
				},
				{
					1,
					273,
					35
				}
			}
		},
		{
			template = "controller_terrain_3_stage_15_glare",
			["editor.game_mode"] = 1,
			decal_ground = "decal_stage_15_glare",
			eyes_t = {
				"decal_terrain_3_glare_eye_big_stage_15",
				"decal_terrain_3_glare_eye_small_1_stage_15",
				"decal_terrain_3_glare_eye_small_2_stage_15",
				"decal_terrain_3_glare_eye_small_3_stage_15"
			},
			phases = {
				{
					45,
					30
				},
				{
					26,
					30
				},
				{
					8,
					30
				}
			},
			pos = {
				x = 570,
				y = 374
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
			["render.sprites[1].name"] = "Stage15_0001",
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
				y = 292
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
				y = 435
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 228
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 339
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 374
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = -68,
				y = 486
			}
		},
		{
			template = "decal_stage_15_cult_leader_tower_mask",
			["editor.game_mode"] = 0,
			pos = {
				x = 952,
				y = 495
			}
		},
		{
			template = "decal_stage_15_mask_1",
			pos = {
				x = 320,
				y = 614
			}
		},
		{
			template = "decal_stage_15_mask_2",
			pos = {
				x = -158,
				y = 568
			}
		},
		{
			template = "decal_stage_15_mask_3",
			pos = {
				x = 763,
				y = 731
			}
		},
		{
			template = "decal_stage_15_mask_4",
			pos = {
				x = 920,
				y = 425
			}
		},
		{
			template = "decal_stage_15_mask_5",
			pos = {
				x = 1125,
				y = 201
			}
		},
		{
			template = "decal_stage_15_mask_modes",
			["editor.game_mode"] = 2,
			pos = {
				x = 516,
				y = 386
			}
		},
		{
			template = "decal_stage_15_mask_modes",
			["editor.game_mode"] = 3,
			pos = {
				x = 516,
				y = 386
			}
		},
		{
			template = "decal_stage_15_tentacles",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 8,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 469.2,
				y = 22.85
			},
			["render.sprites[1].scale"] = {
				x = 0.72,
				y = 0.72
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 7,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 493.35,
				y = 32
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
			["render.sprites[1].name"] = "stage_15_rock_01",
			pos = {
				x = 541.18,
				y = 46.2
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 9,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 464.15,
				y = 48.05
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
			["render.sprites[1].name"] = "stage_15_rock_20",
			pos = {
				x = 829.05,
				y = 73.75
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 11,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_21",
			pos = {
				x = 517.55,
				y = 89.08
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 13,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_19",
			pos = {
				x = 887.8,
				y = 97.48
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
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 411,
				y = 117
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 14,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3100,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_18",
			pos = {
				x = 1134.35,
				y = 192.13
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 26,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3100,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_05",
			pos = {
				x = 1159.45,
				y = 304.73
			},
			["render.sprites[1].scale"] = {
				x = 0.86,
				y = 0.86
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 27,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3100,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_05",
			pos = {
				x = 1135.95,
				y = 358.23
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 15,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3121,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_17",
			pos = {
				x = 1047.95,
				y = 472.78
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 17,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_15",
			pos = {
				x = 1101.17,
				y = 520.65
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 23,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_08",
			pos = {
				x = 1190.27,
				y = 550.3
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 16,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3121,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_16",
			pos = {
				x = 1072.45,
				y = 586.7
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 31,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 389.15,
				y = 602.4
			},
			["render.sprites[1].scale"] = {
				x = 0.72,
				y = 0.72
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 32,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 423.3,
				y = 610.95
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 36,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_02",
			pos = {
				x = 7.3,
				y = 611.15
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 30,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 590.5,
				y = 617.9
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 34,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_03",
			pos = {
				x = 46.4,
				y = 626.4
			},
			["render.sprites[1].scale"] = {
				x = 0.83,
				y = 0.83
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 19,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_12",
			pos = {
				x = 750.98,
				y = 638.35
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 3,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_25",
			pos = {
				x = 460.32,
				y = 641.33
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 29,
			["render.sprites[1].flip_x"] = true,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 633.15,
				y = 643.05
			},
			["render.sprites[1].scale"] = {
				x = 0.72,
				y = 0.72
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 35,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_03",
			pos = {
				x = 82.1,
				y = 644.13
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
			["render.sprites[1].name"] = "stage_15_rock_25",
			pos = {
				x = 424.1,
				y = 647.27
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 37,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_01",
			pos = {
				x = -9.33,
				y = 648.2
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 18,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_13",
			pos = {
				x = 829.72,
				y = 649.1
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 38,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_11",
			pos = {
				x = 796.52,
				y = 659.42
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 5,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_22",
			pos = {
				x = 214.18,
				y = 666.1
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 25,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_06",
			pos = {
				x = 1067.5,
				y = 668.17
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 2,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_25",
			pos = {
				x = 461.23,
				y = 673
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 33,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_02",
			pos = {
				x = 91.25,
				y = 674.75
			},
			["render.sprites[1].scale"] = {
				x = 0.9,
				y = 0.9
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 28,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_04",
			pos = {
				x = 666.45,
				y = 682.05
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 21,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_09",
			pos = {
				x = 869.92,
				y = 687.42
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 1,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = -0.77,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_25",
			pos = {
				x = 655.23,
				y = 699.77
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 24,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_07",
			pos = {
				x = 1145.45,
				y = 707.42
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 20,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_10",
			pos = {
				x = 1013.1,
				y = 725.4
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 22,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_14",
			pos = {
				x = 915.65,
				y = 729.92
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 39,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_05",
			pos = {
				x = 850.3,
				y = 731.58
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["render.sprites[1].sort_y_offset"] = 0,
			["render.sprites[1].flip_x"] = false,
			["render.sprites[1].r"] = 0,
			["render.sprites[1].z"] = 3000,
			template = "decal_terrain_3_floating_rock",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].name"] = "stage_15_rock_25",
			pos = {
				x = 732.08,
				y = 736.98
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["editor.r"] = -1.0471975511966,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 160,
			pos = {
				x = 817,
				y = 92
			}
		},
		{
			["editor.r"] = 0.87266462599717,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 140,
			pos = {
				x = 1066,
				y = 220
			}
		},
		{
			["editor.r"] = 0.87266462599717,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 150,
			pos = {
				x = 1066,
				y = 268
			}
		},
		{
			["editor.r"] = 0.034906585039902,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 120,
			pos = {
				x = 825,
				y = 505
			}
		},
		{
			["editor.r"] = 0.87266462599716,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 792,
				y = 709
			}
		},
		{
			load_file = "level15_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
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
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 682,
				y = 356
			},
			["tower.default_rally_pos"] = {
				x = 743,
				y = 285
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 100,
				y = 358
			},
			["tower.default_rally_pos"] = {
				x = 80,
				y = 278
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 331,
				y = 361
			},
			["tower.default_rally_pos"] = {
				x = 447,
				y = 389
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 565,
				y = 506
			},
			["tower.default_rally_pos"] = {
				x = 552,
				y = 448
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 598,
				y = 214
			},
			["tower.default_rally_pos"] = {
				x = 517,
				y = 275
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 714,
				y = 214
			},
			["tower.default_rally_pos"] = {
				x = 652,
				y = 297
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 402,
				y = 274
			},
			["tower.default_rally_pos"] = {
				x = 402,
				y = 212
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 214,
				y = 280
			},
			["tower.default_rally_pos"] = {
				x = 155,
				y = 237
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 682,
				y = 356
			},
			["tower.default_rally_pos"] = {
				x = 756,
				y = 280
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 682,
				y = 356
			},
			["tower.default_rally_pos"] = {
				x = 661,
				y = 296
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 258,
				y = 437
			},
			["tower.default_rally_pos"] = {
				x = 177,
				y = 489
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 46,
				y = 495
			},
			["tower.default_rally_pos"] = {
				x = 75,
				y = 444
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 694,
				y = 509
			},
			["tower.default_rally_pos"] = {
				x = 754,
				y = 450
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 436,
				y = 510
			},
			["tower.default_rally_pos"] = {
				x = 377,
				y = 461
			}
		}
	},
	ignore_walk_backwards_paths = {
		1,
		5
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
				"tower_build_ray"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_tricannon",
				"tower_build_arborean_emissary",
				"tower_build_demon_pit",
				"tower_build_elven_stargazers"
			}
		}
	},
	nav_mesh = {
		{
			4,
			nil,
			nil,
			2
		},
		{
			3,
			1,
			nil,
			3
		},
		{
			6,
			4,
			2
		},
		{
			5,
			nil,
			1,
			3
		},
		{
			10,
			7,
			2,
			6
		},
		{
			9,
			5,
			3
		},
		{
			8,
			nil,
			4,
			5
		},
		{
			11,
			nil,
			7,
			9
		},
		{
			12,
			8,
			6
		},
		{
			nil,
			11,
			5,
			12
		},
		{
			[3] = 8,
			[4] = 10
		},
		{
			nil,
			10,
			9
		}
	},
	required_exoskeletons = {
		"BKtentacle_S15Def",
		"stage_15_glareDef",
		"mydrias_finalstage_topDef",
		"mydrias_finalstage_bottomDef",
		"mutamydriasDef",
		"mutamydrias_ray_decalDef",
		"mutamydrias_rayDef",
		"t3stage15_eastereggDef",
		"t3stage15_easteregg_tempportalDef"
	},
	required_sounds = {
		"music_stage15",
		"terrain_3_common",
		"enemies_terrain_3",
		"stage_15",
		"tower_necromancer"
	},
	required_textures = {
		"go_enemies_terrain_3",
		"go_stage15_bg",
		"go_stage15",
		"go_stages_terrain3",
		"go_towers_necromancer"
	}
}
