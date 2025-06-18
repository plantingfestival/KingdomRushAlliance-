return {
	locked_hero = false,
	level_terrain_type = 1,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 514,
				y = 78
			}
		},
		{
			pos = {
				x = 150,
				y = 400
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 512,
			y = 384
		}
	},
	entities_list = {
		{
			template = "decal_background",
			["render.sprites[1].z"] = 1000,
			["render.sprites[1].name"] = "stage_122",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.exit_id"] = 1,
			template = "decal_defend_point",
			pos = {
				x = 514,
				y = 78
			}
		},
		{
			["editor.r"] = 6.2482787221397,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 978,
				y = 303
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 240,
			pos = {
				x = 44,
				y = 396
			}
		},
		{
			["editor.r"] = 7.8539816339745,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 50,
			pos = {
				x = 532,
				y = 703
			}
		},
		{
			["editor.r"] = 7.8539816339745,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 50,
			pos = {
				x = 502,
				y = 733
			}
		},
		{
			["editor.r"] = 7.8539816339745,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 50,
			pos = {
				x = 562,
				y = 733
			}
		},
		{
			template = "swamp_controller",
			["graveyard.spawn_pos"] = {
				{
					x = 830,
					y = 494
				},
				{
					x = 816,
					y = 503
				},
				{
					x = 819,
					y = 483
				},
				{
					x = 807,
					y = 492
				},
				{
					x = 880,
					y = 216
				},
				{
					x = 866,
					y = 211
				},
				{
					x = 871,
					y = 197
				},
				{
					x = 857,
					y = 200
				},
				{
					x = 882,
					y = 203
				}
			},
			pos = {
				x = 0,
				y = 0
			}
		},
		{
			["tower.holder_id"] = "18",
			template = "tower_special_elf",
			["editor.game_mode"] = 1,
			["tower.terrain_style"] = 103,
			["ui.nav_mesh_id"] = "18",
			["barrack.rally_pos"] = {
				x = 630,
				y = 177
			},
			pos = {
				x = 630,
				y = 239
			},
			["tower.default_rally_pos"] = {
				x = 630,
				y = 177
			}
		},
		{
			["tower.holder_id"] = "18",
			template = "tower_special_elf",
			["editor.game_mode"] = 2,
			["tower.terrain_style"] = 103,
			["ui.nav_mesh_id"] = "18",
			["barrack.rally_pos"] = {
				x = 627,
				y = 178
			},
			pos = {
				x = 630,
				y = 239
			},
			["tower.default_rally_pos"] = {
				x = 627,
				y = 178
			}
		},
		{
			["tower.holder_id"] = "16",
			["tower.terrain_style"] = 103,
			template = "tower_elf_holder",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "16",
			pos = {
				x = 422,
				y = 125
			},
			["tower.default_rally_pos"] = {
				x = 519,
				y = 140
			}
		},
		{
			["tower.holder_id"] = "18",
			["tower.terrain_style"] = 103,
			template = "tower_elf_holder",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "18",
			pos = {
				x = 630,
				y = 239
			},
			["tower.default_rally_pos"] = {
				x = 627,
				y = 178
			}
		},
		{
			["tower.holder_id"] = "17",
			["tower.terrain_style"] = 103,
			template = "tower_elf_holder",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "17",
			pos = {
				x = 434,
				y = 259
			},
			["tower.default_rally_pos"] = {
				x = 432,
				y = 204
			}
		},
		{
			["tower.holder_id"] = "16",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "16",
			pos = {
				x = 422,
				y = 125
			},
			["tower.default_rally_pos"] = {
				x = 519,
				y = 140
			}
		},
		{
			["tower.holder_id"] = "16",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "16",
			pos = {
				x = 422,
				y = 125
			},
			["tower.default_rally_pos"] = {
				x = 519,
				y = 140
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 777,
				y = 133
			},
			["tower.default_rally_pos"] = {
				x = 782,
				y = 230
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 777,
				y = 133
			},
			["tower.default_rally_pos"] = {
				x = 782,
				y = 230
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 777,
				y = 133
			},
			["tower.default_rally_pos"] = {
				x = 782,
				y = 230
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 146,
				y = 196
			},
			["tower.default_rally_pos"] = {
				x = 204,
				y = 257
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 146,
				y = 196
			},
			["tower.default_rally_pos"] = {
				x = 204,
				y = 257
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 146,
				y = 196
			},
			["tower.default_rally_pos"] = {
				x = 204,
				y = 257
			}
		},
		{
			["tower.holder_id"] = "17",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "17",
			pos = {
				x = 434,
				y = 259
			},
			["tower.default_rally_pos"] = {
				x = 432,
				y = 204
			}
		},
		{
			["tower.holder_id"] = "17",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "17",
			pos = {
				x = 434,
				y = 259
			},
			["tower.default_rally_pos"] = {
				x = 432,
				y = 204
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 905,
				y = 261
			},
			["tower.default_rally_pos"] = {
				x = 872,
				y = 339
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 905,
				y = 261
			},
			["tower.default_rally_pos"] = {
				x = 872,
				y = 339
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 905,
				y = 261
			},
			["tower.default_rally_pos"] = {
				x = 872,
				y = 339
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 715,
				y = 271
			},
			["tower.default_rally_pos"] = {
				x = 726,
				y = 212
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 715,
				y = 271
			},
			["tower.default_rally_pos"] = {
				x = 726,
				y = 212
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 715,
				y = 271
			},
			["tower.default_rally_pos"] = {
				x = 726,
				y = 212
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 279,
				y = 296
			},
			["tower.default_rally_pos"] = {
				x = 273,
				y = 243
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 279,
				y = 296
			},
			["tower.default_rally_pos"] = {
				x = 273,
				y = 243
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 279,
				y = 296
			},
			["tower.default_rally_pos"] = {
				x = 273,
				y = 243
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 578,
				y = 367
			},
			["tower.default_rally_pos"] = {
				x = 590,
				y = 306
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 578,
				y = 367
			},
			["tower.default_rally_pos"] = {
				x = 590,
				y = 306
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 578,
				y = 367
			},
			["tower.default_rally_pos"] = {
				x = 590,
				y = 306
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 402,
				y = 371
			},
			["tower.default_rally_pos"] = {
				x = 423,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 402,
				y = 371
			},
			["tower.default_rally_pos"] = {
				x = 423,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 402,
				y = 371
			},
			["tower.default_rally_pos"] = {
				x = 423,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 258,
				y = 376
			},
			["tower.default_rally_pos"] = {
				x = 165,
				y = 364
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 258,
				y = 376
			},
			["tower.default_rally_pos"] = {
				x = 165,
				y = 364
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 258,
				y = 376
			},
			["tower.default_rally_pos"] = {
				x = 165,
				y = 364
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 840,
				y = 406
			},
			["tower.default_rally_pos"] = {
				x = 932,
				y = 410
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 840,
				y = 406
			},
			["tower.default_rally_pos"] = {
				x = 932,
				y = 410
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 840,
				y = 406
			},
			["tower.default_rally_pos"] = {
				x = 932,
				y = 410
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 495,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 486,
				y = 437
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 495,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 486,
				y = 437
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 495,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 486,
				y = 437
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 692,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 647,
				y = 426
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 692,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 647,
				y = 426
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 692,
				y = 493
			},
			["tower.default_rally_pos"] = {
				x = 647,
				y = 426
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 297,
				y = 511
			},
			["tower.default_rally_pos"] = {
				x = 194,
				y = 529
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 297,
				y = 511
			},
			["tower.default_rally_pos"] = {
				x = 194,
				y = 529
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 297,
				y = 511
			},
			["tower.default_rally_pos"] = {
				x = 194,
				y = 529
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 583,
				y = 517
			},
			["tower.default_rally_pos"] = {
				x = 577,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 583,
				y = 517
			},
			["tower.default_rally_pos"] = {
				x = 577,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 583,
				y = 517
			},
			["tower.default_rally_pos"] = {
				x = 577,
				y = 452
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 793,
				y = 548
			},
			["tower.default_rally_pos"] = {
				x = 868,
				y = 597
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 793,
				y = 548
			},
			["tower.default_rally_pos"] = {
				x = 868,
				y = 597
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 793,
				y = 548
			},
			["tower.default_rally_pos"] = {
				x = 868,
				y = 597
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 1,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 349,
				y = 579
			},
			["tower.default_rally_pos"] = {
				x = 355,
				y = 665
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 2,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 349,
				y = 579
			},
			["tower.default_rally_pos"] = {
				x = 355,
				y = 665
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 3,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 349,
				y = 579
			},
			["tower.default_rally_pos"] = {
				x = 355,
				y = 665
			}
		}
	},
	invalid_path_ranges = {},
	level_mode_overrides = {
		[3] = {
			locked_hero = false,
			max_upgrade_level = 5,
			available_towers = {
				"tower_build_arcane_wizard",
				"tower_build_paladin_covenant"
			}
		}
	},
	nav_mesh = {
		{
			3,
			4,
			nil,
			2
		},
		{
			14,
			1,
			nil,
			7
		},
		{
			6,
			4,
			1,
			14
		},
		{
			3,
			nil,
			1,
			1
		},
		{
			10,
			10,
			6,
			15
		},
		{
			5,
			nil,
			3,
			15
		},
		{
			17,
			2,
			8,
			8
		},
		{
			16,
			7
		},
		{
			nil,
			10,
			15,
			12
		},
		{
			[3] = 5,
			[4] = 9
		},
		{
			12,
			9,
			18,
			13
		},
		{
			nil,
			9,
			11,
			13
		},
		{
			12,
			11,
			18
		},
		{
			15,
			3,
			2,
			17
		},
		{
			9,
			6,
			14,
			18
		},
		{
			18,
			17,
			8
		},
		{
			18,
			14,
			7,
			16
		},
		{
			11,
			15,
			17,
			13
		}
	},
	required_sounds = {
		"kr1_common",
		"tower_elven_stargazers",
		"music_stage122",
		"MushroomSounds"
	},
	required_textures = {
		"go_towers_elven_stargazers",
		"go_enemies_rotten",
		"go_enemies_wastelands",
		"go_stage122",
		"go_stage122_bg"
	}
}