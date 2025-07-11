﻿-- chunkname: @./kr5/data/levels/level06_spawner.lua

return {
	groups = {
		{
			1
		},
		som1 = {
			"door"
		},
		{
			2
		},
		{
			3
		},
		{
			4
		},
		{
			5
		},
		{
			6
		}
	},
	points = {
		{
			path = 1,
			from = {
				x = 2,
				y = 391
			},
			to = {
				x = 173,
				y = 339
			}
		},
		{
			path = 1
		},
		{
			path = 2
		},
		{
			path = 3
		},
		{
			path = 4
		},
		{
			path = 5
		}
	},
	waves = {
		{
			[2] = {
				{
					10,
					0,
					"som1",
					nil,
					nil,
					nil,
					nil,
					nil,
					nil,
					"CUSTOM",
					{
						open = true
					}
				}
			},
			[5] = {
				{
					8,
					0,
					"som1",
					nil,
					nil,
					nil,
					nil,
					nil,
					nil,
					"CUSTOM",
					{
						open = true
					}
				}
			},
			[8] = {
				{
					14,
					0,
					"som1",
					nil,
					nil,
					nil,
					nil,
					nil,
					nil,
					"CUSTOM",
					{
						open = true
					}
				}
			},
			[11] = {
				{
					10,
					0,
					"som1",
					nil,
					nil,
					nil,
					nil,
					nil,
					nil,
					"CUSTOM",
					{
						open = true
					}
				}
			},
			[14] = {
				{
					10,
					0,
					"som1",
					nil,
					nil,
					nil,
					nil,
					nil,
					nil,
					"CUSTOM",
					{
						open = true
					}
				}
			},
			BOSS1 = {
				{
					5,
					0,
					6,
					1,
					3,
					true,
					false,
					1,
					1,
					"enemy_tusked_brawler"
				},
				{
					8,
					0,
					6,
					2,
					3,
					true,
					false,
					1,
					1,
					"enemy_tusked_brawler"
				},
				{
					11,
					0,
					5,
					1,
					3,
					true,
					false,
					1,
					1,
					"enemy_tusked_brawler"
				},
				{
					14,
					0,
					5,
					3,
					3,
					true,
					false,
					1,
					1,
					"enemy_tusked_brawler"
				},
				{
					18,
					0,
					3,
					nil,
					6,
					true,
					false,
					0.8,
					0.8,
					"enemy_hyena5"
				}
			},
			BOSS2 = {
				{
					8,
					0,
					5,
					1,
					2,
					true,
					false,
					1,
					1,
					"enemy_skunk_bombardier"
				},
				{
					10,
					0,
					5,
					3,
					3,
					true,
					false,
					1,
					1,
					"enemy_skunk_bombardier"
				},
				{
					13,
					0,
					6,
					1,
					2,
					true,
					false,
					1,
					1,
					"enemy_skunk_bombardier"
				},
				{
					15,
					0,
					6,
					2,
					3,
					true,
					false,
					1,
					1,
					"enemy_skunk_bombardier"
				},
				{
					15,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					15,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					16,
					0,
					2,
					1,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					17,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					17,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					18,
					0,
					2,
					1,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					19,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					19,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					27,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					27,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					28,
					0,
					2,
					1,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					29,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					29,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					30,
					0,
					2,
					1,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					31,
					0,
					2,
					2,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				},
				{
					31,
					0,
					2,
					3,
					1,
					true,
					false,
					0,
					0,
					"enemy_hyena5"
				}
			},
			BOSS3 = {
				{
					2,
					0,
					6,
					1,
					3,
					true,
					false,
					1,
					1,
					"enemy_hyena5"
				},
				{
					5,
					0,
					6,
					2,
					3,
					true,
					false,
					1,
					1,
					"enemy_hyena5"
				},
				{
					8,
					0,
					5,
					1,
					3,
					true,
					false,
					1,
					1,
					"enemy_hyena5"
				},
				{
					11,
					0,
					5,
					3,
					3,
					true,
					false,
					1,
					1,
					"enemy_hyena5"
				},
				{
					15,
					0,
					4,
					nil,
					5,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					20,
					0,
					5,
					1,
					3,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					23,
					0,
					5,
					1,
					3,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					20,
					0,
					5,
					3,
					2,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					23,
					0,
					6,
					3,
					2,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					28,
					0,
					4,
					nil,
					4,
					true,
					false,
					1,
					1,
					"enemy_hyena5"
				}
			}
		}
	}
}
