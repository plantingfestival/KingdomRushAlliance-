return {
	locked_hero = false,
	level_terrain_type = 3,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 60,
				y = 340
			}
		},
		{
			pos = {
				x = 415,
				y = 290
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
			["render.sprites[1].name"] = "stage_115",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			["editor.exit_id"] = 1,
			template = "decal_defend_point",
			pos = {
				x = 60,
				y = 340
			}
		},
		{
			template = "decal_demon_portal_big",
			out_nodes = {
				[2] = 3
			},
			pos = {
				x = 785,
				y = 644
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333334,
			pos = {
				x = 410,
				y = 86
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333334,
			pos = {
				x = 420,
				y = 100
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333334,
			pos = {
				x = 450,
				y = 116
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333334,
			pos = {
				x = 417,
				y = 126
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333,
			pos = {
				x = 1181,
				y = 263
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333,
			pos = {
				x = 1176,
				y = 420
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333,
			pos = {
				x = 1146,
				y = 456
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["delayed_play.min_delay"] = 5,
			["render.sprites[1].r"] = 0,
			template = "decal_swamp_bubble",
			["delayed_play.max_delay"] = 13.333333333333,
			pos = {
				x = 1182,
				y = 456
			},
			["render.sprites[1].scale"] = {
				x = 1,
				y = 1
			}
		},
		{
			["editor.r"] = -1.5707963267949,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 80,
			pos = {
				x = 666,
				y = 57
			}
		},
		{
			["editor.r"] = -1.5533430342749,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 30,
			pos = {
				x = 456,
				y = 202
			}
		},
		{
			["editor.r"] = 0.925024503557,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 40,
			pos = {
				x = 733,
				y = 539
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 70,
			pos = {
				x = 444,
				y = 740
			}
		},
		{
			template = "s15_rotten_spawner",
			["editor.game_mode"] = 1,
			pos = {
				x = 0,
				y = 0
			}
		},
		{
			template = "swamp_controller",
			["graveyard.pi"] = 4,
			["graveyard.spawn_pos"] = {
				{
					x = 417,
					y = 126
				},
				{
					x = 420,
					y = 100
				},
				{
					x = 410,
					y = 86
				},
				{
					x = 450,
					y = 116
				}
			},
			pos = {
				x = 0,
				y = 0
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 591,
				y = 122
			},
			["tower.default_rally_pos"] = {
				x = 682,
				y = 140
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 794,
				y = 144
			},
			["tower.default_rally_pos"] = {
				x = 696,
				y = 198
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 341,
				y = 202
			},
			["tower.default_rally_pos"] = {
				x = 412,
				y = 294
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 846,
				y = 222
			},
			["tower.default_rally_pos"] = {
				x = 746,
				y = 268
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 536,
				y = 285
			},
			["tower.default_rally_pos"] = {
				x = 528,
				y = 219
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 659,
				y = 285
			},
			["tower.default_rally_pos"] = {
				x = 629,
				y = 222
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 227,
				y = 331
			},
			["tower.default_rally_pos"] = {
				x = 227,
				y = 275
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 312,
				y = 359
			},
			["tower.default_rally_pos"] = {
				x = 315,
				y = 305
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 620,
				y = 373
			},
			["tower.default_rally_pos"] = {
				x = 502,
				y = 409
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 853,
				y = 416
			},
			["tower.default_rally_pos"] = {
				x = 755,
				y = 402
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 327,
				y = 443
			},
			["tower.default_rally_pos"] = {
				x = 340,
				y = 545
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 424,
				y = 445
			},
			["tower.default_rally_pos"] = {
				x = 445,
				y = 367
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 623,
				y = 467
			},
			["tower.default_rally_pos"] = {
				x = 520,
				y = 474
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 817,
				y = 485
			},
			["tower.default_rally_pos"] = {
				x = 724,
				y = 466
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 615,
				y = 556
			},
			["tower.default_rally_pos"] = {
				x = 719,
				y = 538
			}
		},
		{
			["tower.holder_id"] = "16",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "16",
			pos = {
				x = 375,
				y = 597
			},
			["tower.default_rally_pos"] = {
				x = 277,
				y = 587
			}
		},
		{
			["tower.holder_id"] = "17",
			["tower.terrain_style"] = 103,
			template = "tower_holder_wasteland",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "17",
			pos = {
				x = 472,
				y = 600
			},
			["tower.default_rally_pos"] = {
				x = 476,
				y = 549
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
			2,
			6,
			3
		},
		{
			nil,
			4,
			1
		},
		{
			5,
			8,
			7,
			1
		},
		{
			nil,
			10,
			6,
			2
		},
		{
			6,
			9,
			3,
			1
		},
		{
			4,
			9,
			5,
			1
		},
		{
			8,
			11,
			nil,
			3
		},
		{
			9,
			11,
			7,
			3
		},
		{
			10,
			13,
			8,
			6
		},
		{
			nil,
			14,
			9,
			4
		},
		{
			12,
			16,
			7,
			8
		},
		{
			13,
			17,
			11,
			8
		},
		{
			14,
			15,
			12,
			9
		},
		{
			nil,
			15,
			13,
			10
		},
		{
			14,
			nil,
			17,
			13
		},
		{
			17,
			nil,
			nil,
			11
		},
		{
			15,
			nil,
			16,
			12
		}
	},
	required_sounds = {
		"kr1_common",
		"music_stage115",
		"MushroomSounds"
	},
	required_textures = {
		"kr1_enemies_common",
		"go_enemies_rotten",
		"go_enemies_wastelands",
		"go_stages_rotten_torment",
		"go_stage115",
		"go_stage115_bg"
	}
}