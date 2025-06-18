﻿-- chunkname: @./kr5/data/exoskeletons/tower_tree_explosion_decalDef.lua

return {
	fps = 30,
	partScaleCompensation = 1,
	animations = {
		{
			name = "idle",
			frames = {
				{
					parts = {
						{
							name = "tower_tree_explosion_decal_asst_explosion_decal",
							xform = {
								kx = 0,
								sx = 1,
								r = 0,
								ky = 0,
								sy = 1,
								y = 0.65,
								x = 1.3
							}
						}
					}
				}
			}
		}
	},
	parts = {
		tower_tree_explosion_decal_asst_explosion_decal = {
			offsetY = 0,
			name = "tower_tree_explosion_decal_asst_explosion_decal",
			offsetX = 0
		}
	}
}
