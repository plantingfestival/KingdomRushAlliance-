﻿-- chunkname: @./kr5/data/kui_templates/group_shop_gems_special_offer_title_X2.lua

return {
	class = "KView",
	children = {
		{
			class = "KImageView",
			image_name = "shop_room_image_shop_special_offer_title_bg_x2_",
			pos = v(2.05, -1.1),
			anchor = v(285.15, 28.55)
		},
		{
			vertical_align = "middle-caps",
			text_align = "center",
			font_size = 34,
			line_height_extra = "0",
			fit_size = true,
			text = "SPECIAL OFFER REWARD!",
			text_key = "SHOP_ROOM_SPECIAL_OFFER_TITLE",
			class = "GG5ShaderLabel",
			id = "label_shop_special_offer_title",
			font_name = "fla_h",
			pos = v(-228.65, -25.65),
			scale = v(1, 1),
			size = v(451.8, 43.5),
			colors = {
				text = {
					242,
					235,
					255
				}
			},
			shaders = {
				"p_outline_tint"
			},
			shader_args = {
				{
					thickness = 2.0833333333333335,
					outline_color = {
						0.6431,
						0.1137,
						0.2863,
						1
					}
				}
			}
		}
	}
}
