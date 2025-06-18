﻿-- chunkname: @./kr5/data/levels/level06_door.lua

return {
	groups = {
		{
			1
		},
		som1 = {
			"door"
		}
	},
	points = {
		{
			path = 6,
			from = {
				x = 2,
				y = 391
			},
			to = {
				x = 2,
				y = 391
			}
		}
	},
	waves = {
		{
			DOOR1 = {
				{
					1,
					0,
					1,
					nil,
					6,
					true,
					false,
					0.8,
					0.8,
					"enemy_hog_invader"
				},
				{
					9,
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
						open = false
					}
				}
			},
			DOOR2 = {
				{
					1,
					0,
					1,
					nil,
					6,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					9,
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
						open = false
					}
				}
			},
			DOOR3 = {
				{
					1,
					0,
					1,
					nil,
					6,
					true,
					false,
					0.8,
					0.8,
					"enemy_tusked_brawler"
				},
				{
					9,
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
						open = false
					}
				}
			},
			DOOR4 = {
				{
					1,
					0,
					1,
					nil,
					4,
					true,
					false,
					0.8,
					0.8,
					"enemy_tusked_brawler"
				},
				{
					5,
					0,
					1,
					nil,
					6,
					true,
					false,
					0.8,
					0.8,
					"enemy_cutthroat_rat"
				},
				{
					13,
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
						open = false
					}
				}
			},
			DOOR5 = {
				{
					1,
					0,
					1,
					nil,
					2,
					true,
					false,
					2,
					2,
					"enemy_bear_vanguard"
				},
				{
					9,
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
						open = false
					}
				}
			}
		}
	}
}
