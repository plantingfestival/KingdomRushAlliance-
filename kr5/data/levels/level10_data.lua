return {
	locked_hero = false,
	level_terrain_type = 5,
	max_upgrade_level = 5,
	custom_spawn_pos = {
		{
			pos = {
				x = 556,
				y = 134
			}
		},
		{
			pos = {
				x = 1086,
				y = 256
			}
		}
	},
	custom_start_pos = {
		zoom = 1.3,
		pos = {
			x = 512,
			y = 600
		}
	},
	entities_list = {
		{
			min_delay = 7,
			template = "background_sounds_kr5",
			max_delay = 13,
			only_on_preparation = true,
			sounds = {
				"Terrain2AmbienceSoundBats",
				"Terrain2AmbienceSoundWind"
			}
		},
		{
			template = "controller_stage_10_obelisk_iron",
			["editor.game_mode"] = 3,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_10_obelisk_wave_fixed",
			["editor.game_mode"] = 1,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_10_obelisk_wave_fixed",
			["editor.game_mode"] = 2,
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "controller_stage_10_ymca",
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
			["render.sprites[1].name"] = "Stage10_0001",
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
			["editor.alpha"] = 15,
			pos = {
				x = 556,
				y = 134
			}
		},
		{
			["editor.flip"] = 1,
			["editor.orientation"] = 10,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = 1086,
				y = 256
			}
		},
		{
			["editor.flip"] = 1,
			["editor.orientation"] = 10,
			template = "decal_defend_point5",
			["editor.exit_id"] = 1,
			["editor.alpha"] = 15,
			pos = {
				x = 1086,
				y = 439
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 490,
				y = 134
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 622,
				y = 134
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 200
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 320
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 362
			}
		},
		{
			["editor.flip"] = 1,
			["editor.tag"] = 0,
			template = "decal_defense_flag5",
			pos = {
				x = 1086,
				y = 499
			}
		},
		{
			template = "decal_stage_10_fire",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_10_mask",
			pos = {
				x = 512,
				y = 384
			}
		},
		{
			template = "decal_stage_10_obelisk",
			pos = {
				x = 531,
				y = 545
			}
		},
		{
			template = "decal_stage_10_obelisk_back",
			pos = {
				x = 531,
				y = 545
			}
		},
		{
			template = "decal_stage_10_ymca_ground_decos",
			pos = {
				x = 1022,
				y = 586
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = -120,
				y = 491
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 1159,
				y = 538
			}
		},
		{
			template = "decal_terrain_2_dust",
			pos = {
				x = 33,
				y = 588
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 1,
			template = "editor_wave_flag",
			["editor.len"] = 160,
			pos = {
				x = -60,
				y = 206
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 2,
			template = "editor_wave_flag",
			["editor.len"] = 207,
			pos = {
				x = -60,
				y = 356
			}
		},
		{
			["editor.r"] = -3.1415926535898,
			["editor.path_id"] = 3,
			template = "editor_wave_flag",
			["editor.len"] = 210,
			pos = {
				x = -60,
				y = 396
			}
		},
		{
			["editor.r"] = 3.1415926535898,
			["editor.path_id"] = 4,
			template = "editor_wave_flag",
			["editor.len"] = 210,
			pos = {
				x = -60,
				y = 436
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 5,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 244,
				y = 627
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 6,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 292,
				y = 627
			}
		},
		{
			["editor.r"] = 1.5707963267949,
			["editor.path_id"] = 7,
			template = "editor_wave_flag",
			["editor.len"] = 190,
			pos = {
				x = 776,
				y = 627
			}
		},
		{
			["tower.holder_id"] = "8",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "8",
			pos = {
				x = 436,
				y = 180
			},
			["tower.default_rally_pos"] = {
				x = 483,
				y = 254.5
			}
		},
		{
			["tower.holder_id"] = "6",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "6",
			pos = {
				x = 328,
				y = 192
			},
			["tower.default_rally_pos"] = {
				x = 382,
				y = 276.5
			}
		},
		{
			["tower.holder_id"] = "10",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "10",
			pos = {
				x = 646,
				y = 204
			},
			["tower.default_rally_pos"] = {
				x = 544,
				y = 199.5
			}
		},
		{
			["tower.holder_id"] = "1",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "1",
			pos = {
				x = 60,
				y = 296
			},
			["tower.default_rally_pos"] = {
				x = 129,
				y = 222.5
			}
		},
		{
			["tower.holder_id"] = "15",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "15",
			pos = {
				x = 864,
				y = 296
			},
			["tower.default_rally_pos"] = {
				x = 808,
				y = 231.5
			}
		},
		{
			["tower.holder_id"] = "13",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "13",
			pos = {
				x = 778,
				y = 326
			},
			["tower.default_rally_pos"] = {
				x = 710,
				y = 277.5
			}
		},
		{
			["tower.holder_id"] = "9",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "9",
			pos = {
				x = 482,
				y = 332
			},
			["tower.default_rally_pos"] = {
				x = 563,
				y = 389.5
			}
		},
		{
			["tower.holder_id"] = "5",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "5",
			pos = {
				x = 310,
				y = 350
			},
			["tower.default_rally_pos"] = {
				x = 261,
				y = 288.5
			}
		},
		{
			["tower.holder_id"] = "7",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "7",
			pos = {
				x = 396,
				y = 386
			},
			["tower.default_rally_pos"] = {
				x = 469,
				y = 457.5
			}
		},
		{
			["tower.holder_id"] = "11",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "11",
			pos = {
				x = 700,
				y = 388
			},
			["tower.default_rally_pos"] = {
				x = 638,
				y = 330.5
			}
		},
		{
			["tower.holder_id"] = "14",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "14",
			pos = {
				x = 864,
				y = 388
			},
			["tower.default_rally_pos"] = {
				x = 919,
				y = 468.5
			}
		},
		{
			["tower.holder_id"] = "3",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "3",
			pos = {
				x = 228,
				y = 398
			},
			["tower.default_rally_pos"] = {
				x = 168,
				y = 339.5
			}
		},
		{
			["tower.holder_id"] = "4",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "4",
			pos = {
				x = 310,
				y = 428
			},
			["tower.default_rally_pos"] = {
				x = 362,
				y = 505
			}
		},
		{
			["tower.holder_id"] = "12",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "12",
			pos = {
				x = 780,
				y = 428
			},
			["tower.default_rally_pos"] = {
				x = 830,
				y = 518
			}
		},
		{
			["tower.holder_id"] = "2",
			["tower.terrain_style"] = 4,
			template = "tower_holder_sea_of_trees_4",
			["editor.game_mode"] = 0,
			["ui.nav_mesh_id"] = "2",
			pos = {
				x = 74,
				y = 512.5
			},
			["tower.default_rally_pos"] = {
				x = 120,
				y = 451.5
			}
		}
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
				"tower_build_flamespitter",
				"tower_build_arborean_emissary"
			},
			locked_towers = {
				"tower_build_royal_archers",
				"tower_build_arcane_wizard",
				"tower_build_paladin_covenant",
				"tower_build_tricannon",
				"tower_build_demon_pit",
				"tower_build_ballista",
				"tower_build_elven_stargazers",
				"tower_build_rocket_gunners",
				"tower_build_necromancer"
			}
		}
	},
	nav_mesh = {
		{
			6,
			2
		},
		{
			3,
			nil,
			nil,
			1
		},
		{
			4,
			2,
			1,
			5
		},
		{
			7,
			nil,
			3,
			5
		},
		{
			7,
			4,
			3,
			6
		},
		{
			8,
			5,
			1
		},
		{
			9,
			nil,
			5,
			8
		},
		{
			10,
			9,
			6
		},
		{
			11,
			nil,
			7,
			8
		},
		{
			13,
			11,
			8
		},
		{
			12,
			nil,
			9,
			10
		},
		{
			14,
			nil,
			11,
			13
		},
		{
			15,
			12,
			11,
			10
		},
		{
			[3] = 12,
			[4] = 15
		},
		{
			nil,
			14,
			13
		}
	},
	required_exoskeletons = {
		"stage_10_fireDef",
		"YMCAPuntosDef",
		"HealFx1Def",
		"HealFx2Def",
		"HealFx3Def",
		"HealFx1BigDef",
		"HealFx2BigDef",
		"TeleportDecalDef",
		"TeleportFxDef",
		"StunCircleDef",
		"StunFxDef",
		"StunWhiteDef",
		"t2_dustDef",
		"t2_smokeDef"
	},
	required_sounds = {
		"stage_10",
		"music_stage10",
		"enemies_terrain_2",
		"terrain_2_common",
		"enemies_ancient_metropolis",
		"enemies_underground"
	},
	required_textures = {
		"go_enemies_terrain_2",
		"go_stage10_bg",
		"go_stage10",
		"go_stages_terrain2",
		"go_towers_paladin_covenant",
		"go_enemies_ancient_metropolis",
		"go_enemies_halloween",
		"go_enemies_underground"
	}
}
