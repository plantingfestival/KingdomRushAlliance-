﻿-- chunkname: @./kr5/data/levels/level16_data.lua

return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 474,
				y = 92
			}
		},
		{
			pos = {
				x = 640,
				y = 92
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 480,
			y = 350
		}
	},
	entities_list = {
		{
			template = "controller_glare_terrain_3",
			pos = {
				x = 512,
				y = 384
			},
			waves = {
				{
					1,
					2,
					15
				}
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
			template = "controller_stage_16_mouth_left",
			["editor.game_mode"] = 1,
			pos = {
				x = 275,
				y = 520
			}
		},
		{
			template = "controller_stage_16_mouth_right",
			["editor.game_mode"] = 1,
			pos = {
				x = 720,
				y = 520
			}
		},
		{
			template = "controller_stage_16_overseer",
			["editor.game_mode"] = 1,
			pos = {
				x = 505,
				y = 400
			}
		},
		{
			template = "controller_stage_16_overseer_eye1",
			["editor.game_mode"] = 1,
			pos = {
				x = 505,
				y = 400
			}
		},
		{
			template = "controller_stage_16_overseer_eye2",
			["editor.game_mode"] = 1,
			pos = {
				x = 505,
				y = 400
			}
		},
		{
			template = "controller_stage_16_overseer_eye3",
			["editor.game_mode"] = 1,
			pos = {
				x = 505,
				y = 400
			}
		},
		{
			template = "controller_stage_16_overseer_eye4",
			["editor.game_mode"] = 1,
			pos = {
				x = 505,
				y = 400
			}
		},
		{
			template = "controller_stage_16_tentacle_bottom_left",
			["editor.game_mode"] = 1,
			pos = {
				x = 280,
				y = -85
			}
		},
		{
			template = "controller_stage_16_tentacle_bottom_right",
			["editor.game_mode"] = 1,
			pos = {
				x = 740,
				y = 110
			}
		},
		{
			template = "controller_stage_16_tentacle_left",
			["editor.game_mode"] = 1,
			pos = {
				x = -90,
				y = 630
			}
		},
		{
			template = "controller_stage_16_tentacle_right",
			["editor.game_mode"] = 1,
			pos = {
				x = 1150,
				y = 620
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
			template = "controller_terrain_3_stage_16_glare1",
			pos = {
				x = 356,
				y = 173
			}
		},
		{
			template = "controller_terrain_3_stage_16_glare2",
			pos = {
				x = 844,
				y = 548
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
			["render.sprites[1].name"] = "Stage16_0001",
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
				x = 474,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			["editor.orientation"] = 1,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 10,
			pos = {
				x = 640,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 420,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 540,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 584,
				y = 92
			}
		},
		{
			["editor.flip"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 703,
				y = 92
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
				x = 1.3,
				y = 1.29
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
			template = "decal_stage_16_mask_1",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_16_mask_2",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_16_mask_3",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_16_mask_4",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 9,
			pos = {
				x = 1119,
				y = 59.5
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 16,
			pos = {
				x = 866,
				y = 75.5
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 24,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 35,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 17,
			pos = {
				x = 900,
				y = 103.5
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 26,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 31,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 12,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 15,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 20,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 21,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_1",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 28,
			pos = {
				x = 943,
				y = 708.5
			},
			["render.sprites[1].scale"] = {
				x = 0.57,
				y = 0.57
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 5,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 2,
			pos = {
				x = 902,
				y = 64.5
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 23,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 3,
			pos = {
				x = 1049,
				y = 85.5
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 34,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 32,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 37,
			pos = {
				x = -94,
				y = 113.5
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 6,
			pos = {
				x = -54,
				y = 118.5
			},
			["render.sprites[1].scale"] = {
				x = 0.63,
				y = 0.63
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 1,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 33,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 29,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 13,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 14,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 2,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 1,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 8,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 7,
			pos = {
				x = 139,
				y = 661.5
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 19,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 27,
			pos = {
				x = 958,
				y = 666.5
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 8,
			pos = {
				x = 115,
				y = 670.5
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_2",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 4,
			pos = {
				x = 1041,
				y = 709.5
			},
			["render.sprites[1].scale"] = {
				x = 0.61,
				y = 0.61
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_3",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 39,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_3",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 7,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 22,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 0,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 0,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 18,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 4,
			pos = {
				x = 925,
				y = 677.5
			},
			["render.sprites[1].scale"] = {
				x = 0.73,
				y = 0.73
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_4",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 6,
			pos = {
				x = 76,
				y = 731.5
			},
			["render.sprites[1].scale"] = {
				x = 0.71,
				y = 0.71
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_5",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 25,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_5",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 11,
			pos = {
				x = 1084,
				y = 103.5
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_5",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 36,
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
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = true,
			template = "decal_terrain_3_floating_rock_5",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 38,
			pos = {
				x = -76,
				y = 130.5
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["render.sprites[1].r"] = 0,
			["render.sprites[1].flip_x"] = false,
			template = "decal_terrain_3_floating_rock_5",
			["render.sprites[1].draw_order"] = 2,
			["render.sprites[1].sort_y_offset"] = 10,
			pos = {
				x = 991,
				y = 690.5
			},
			["render.sprites[1].scale"] = {
				x = 0.81,
				y = 0.81
			}
		},
		{
			["editor.r"] = -1.7437440380519e-14,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 1110,
				y = 272
			}
		},
		{
			["editor.r"] = 3.1485739705978,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = -72,
				y = 288
			}
		},
		{
			["editor.r"] = 1.9792033717616,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 740,
				y = 492
			}
		},
		{
			["editor.r"] = 1.2566370614359,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 264,
				y = 493
			}
		},
		{
			load_file = "level16_spawner",
			template = "mega_spawner",
			["editor.game_mode"] = 1
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 60,
				y = 224
			},
			["tower.default_rally_pos"] = {
				x = 27,
				y = 300
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 752,
				y = 380
			},
			["tower.default_rally_pos"] = {
				x = 821,
				y = 454
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 5,
			template = "tower_holder_blocked_terrain_3",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 158,
				y = 486
			},
			["tower.default_rally_pos"] = {
				x = 218,
				y = 418
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
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 750,
				y = 188
			},
			["tower.default_rally_pos"] = {
				x = 644,
				y = 201
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 560,
				y = 204
			},
			["tower.default_rally_pos"] = {
				x = 455,
				y = 213
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 208,
				y = 216
			},
			["tower.default_rally_pos"] = {
				x = 296,
				y = 277
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 954,
				y = 244
			},
			["tower.default_rally_pos"] = {
				x = 864,
				y = 208
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 138,
				y = 260
			},
			["tower.default_rally_pos"] = {
				x = 192,
				y = 348
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 464,
				y = 312
			},
			["tower.default_rally_pos"] = {
				x = 378,
				y = 260
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 590,
				y = 312
			},
			["tower.default_rally_pos"] = {
				x = 679,
				y = 258
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 678,
				y = 338
			},
			["tower.default_rally_pos"] = {
				x = 738,
				y = 279
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 316,
				y = 352
			},
			["tower.default_rally_pos"] = {
				x = 241,
				y = 309
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 838,
				y = 352
			},
			["tower.default_rally_pos"] = {
				x = 844,
				y = 285
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 120,
				y = 416
			},
			["tower.default_rally_pos"] = {
				x = 103,
				y = 341
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 5,
			template = "tower_holder_sea_of_trees_5",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 949,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 886,
				y = 438
			}
		}
	},
	ignore_walk_backwards_paths = {
		5,
		6,
		7
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
			2
		},
		{
			3,
			4,
			1,
			1
		},
		{
			15,
			6,
			2
		},
		{
			6,
			5,
			nil,
			2
		},
		{
			12,
			nil,
			nil,
			4
		},
		{
			7,
			nil,
			4,
			3
		},
		{
			8,
			nil,
			6,
			15
		},
		{
			9,
			nil,
			7,
			15
		},
		{
			10,
			10,
			8,
			14
		},
		{
			11,
			nil,
			9,
			14
		},
		{
			13,
			12,
			10,
			13
		},
		{
			[3] = 5,
			[4] = 11
		},
		{
			nil,
			11,
			14
		},
		{
			13,
			10,
			15
		},
		{
			14,
			8,
			3
		}
	},
	required_exoskeletons = {
		"overseer_backDef",
		"overseer_mouthDef",
		"overseer_tentacleDef",
		"overseerDef",
		"overseer_minieye1Def",
		"overseer_minieye2Def",
		"overseer_minieye3Def",
		"overseer_minieye4Def",
		"overseer_tentacle2Def",
		"overseer_undertent1Def",
		"overseer_undertent2Def",
		"overseer_underbacktents1Def",
		"overseer_underbacktents2Def",
		"stage_16_glare_1Def",
		"stage_16_glare_2Def",
		"overseer_deathbrightDef",
		"t3_craterDef"
	},
	required_sounds = {
		"music_stage16",
		"terrain_3_common",
		"enemies_terrain_3",
		"stage_16"
	},
	required_textures = {
		"go_enemies_terrain_3",
		"go_stage16_bg",
		"go_stage16",
		"go_stages_terrain3"
	}
}
