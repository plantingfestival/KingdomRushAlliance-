﻿-- chunkname: @./kr5/data/levels/level24_factory.lua

return {
	groups = {
		{
			1
		},
		som1 = {
			"factory_door"
		},
		{
			2
		},
		{
			3
		}
	},
	points = {
		{
			path = 5,
			from = {
				x = 2,
				y = 391
			},
			to = {
				x = 2,
				y = 391
			}
		},
		{
			path = 5
		},
		{
			path = 6
		}
	},
	waves = {
		{
			DOOR1 = {
				{
					2,
					0,
					2,
					nil,
					4,
					true,
					false,
					3,
					3,
					"enemy_rolling_sentry"
				},
				{
					18,
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
						close = true
					}
				}
			},
			DOOR2 = {
				{
					1,
					0,
					3,
					nil,
					6,
					true,
					false,
					3,
					3,
					"enemy_rolling_sentry"
				},
				{
					24,
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
						close = true
					}
				}
			},
			DOOR3 = {
				{
					5,
					0,
					3,
					nil,
					6,
					true,
					false,
					2,
					2,
					"enemy_rolling_sentry"
				},
				{
					24,
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
						close = true
					}
				}
			},
			DOOR4 = {
				{
					1,
					0,
					2,
					nil,
					8,
					true,
					false,
					2,
					2,
					"enemy_rolling_sentry"
				},
				{
					34,
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
						close = true
					}
				}
			},
			DOOR5 = {
				{
					2,
					0,
					2,
					nil,
					6,
					true,
					false,
					3,
					3,
					"enemy_rolling_sentry"
				},
				{
					4,
					0,
					3,
					nil,
					6,
					true,
					false,
					3,
					3,
					"enemy_rolling_sentry"
				},
				{
					45,
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
						close = true
					}
				}
			}
		}
	}
}
