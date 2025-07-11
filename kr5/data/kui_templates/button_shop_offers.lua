﻿-- chunkname: @./kr5/data/kui_templates/button_shop_offers.lua

return {
	default_image_name = "shop_room_button_offer_big_bg_0001",
	class = "GG5Button",
	focus_image_name = "shop_room_button_offer_big_bg_0003",
	image_offset = v(-418.4, -214.35),
	hit_rect = r(-418.4, -214.35, 832.8, 430.75),
	children = {
		{
			image_name = "shop_room_9slice_shop_offer_gold_frame_",
			class = "GG59View",
			pos = v(-2, 13.15),
			size = v(832.8073, 430.7605),
			anchor = v(416.4037, 227.488),
			slice_rect = r(19.85, 90.95, 23.6, 20.65)
		},
		{
			image_name = "shop_room_9slice_shop_offer_cost_bg_",
			class = "GG59View",
			pos = v(-1.05, 177.2),
			size = v(819.1831, 63.6),
			anchor = v(409.5916, 31.8),
			slice_rect = r(5.25, 15.9, 5.7, 31.8)
		},
		{
			id = "image_shop_offer_discount_bg",
			image_name = "shop_room_image_shop_offer_discount_bg_",
			class = "KImageView",
			pos = v(364.2, -172.3),
			anchor = v(40.95, 32.85)
		},
		{
			vertical_align = "middle",
			text_align = "center",
			font_size = 30,
			fit_size = true,
			line_height_extra = "0",
			text = "50%",
			class = "GG5ShaderLabel",
			id = "label_shop_offer_discount",
			font_name = "fla_numbers_2",
			pos = v(325.75, -198.5),
			scale = v(1, 1),
			size = v(76.8, 45.7),
			colors = {
				text = {
					255,
					254,
					225
				}
			},
			shaders = {
				"p_outline_tint"
			},
			shader_args = {
				{
					thickness = 2.0833333333333335,
					outline_color = {
						0.5137,
						0.2784,
						0,
						1
					}
				}
			}
		},
		{
			vertical_align = "middle-caps",
			text_align = "center",
			font_size = 21,
			line_height_extra = "0",
			fit_size = true,
			text = "off!",
			text_key = "OFF!",
			class = "GG5ShaderLabel",
			id = "label_shop_offer_discount_off",
			font_name = "fla_h",
			pos = v(325.55, -170.35),
			scale = v(1, 1),
			size = v(77, 33.15),
			colors = {
				text = {
					255,
					254,
					225
				}
			},
			shaders = {
				"p_outline_tint"
			},
			shader_args = {
				{
					thickness = 2.0833333333333335,
					outline_color = {
						0.5137,
						0.2784,
						0,
						1
					}
				}
			}
		},
		{
			vertical_align = "middle-caps",
			text_align = "center",
			font_size = 40,
			fit_size = true,
			line_height_extra = "1",
			text = "$4.99",
			class = "GG5ShaderLabel",
			id = "label_shop_offer_cost",
			font_name = "fla_numbers_2",
			pos = v(-403.3, 153.7),
			scale = v(1, 1),
			size = v(804.95, 59.55),
			colors = {
				text = {
					255,
					255,
					255
				}
			},
			shaders = {
				"p_outline_tint"
			},
			shader_args = {
				{
					thickness = 2.5,
					outline_color = {
						0.5137,
						0.2784,
						0,
						1
					}
				}
			}
		},
		{
			template_name = "group_shop_normal_title",
			class = "KView",
			id = "MovieClip4669",
			pos = v(-0.65, -174.45),
			UNLESS = ctx.custom_offer
		},
		{
			class = "KView",
			template_name = "group_shop_custom_offer_title",
			id = "MovieClip4667",
			pos = v(-0.65, -174.75),
			WHEN = ctx.custom_offer
		},
		{
			class = "KImageView",
			image_name = "shop_room_image_shop_offer_all_towers_",
			id = "all_tower",
			pos = v(-2, 5),
			WHEN = ctx.custom_offer and ctx.all_towers,
			anchor = v(525.85, 144.1)
		},
		{
			class = "KImageView",
			image_name = "shop_room_image_shop_offer_all_heroes_",
			id = "all_heroes",
			pos = v(-2, 5),
			WHEN = ctx.custom_offer and ctx.all_heroes,
			anchor = v(525.85, 144.1)
		},
		{
			class = "KView",
			id = "cards_3",
			pos = v(-0.45, 10.45),
			UNLESS = ctx.custom_offer,
			children = {
				{
					class = "KImageView",
					image_name = "shop_room_image_room_offers_plus_sign_",
					id = "image_room_offers_plus_sign",
					pos = v(-132.05, 0),
					scale = v(1, 1),
					anchor = v(14.6, 14.6)
				},
				{
					id = "card_1",
					class = "KView",
					template_name = "group_shop_offer_card",
					pos = v(-264.45, 0)
				},
				{
					id = "card_2",
					class = "KView",
					template_name = "group_shop_offer_card",
					pos = v(0.45, 0)
				},
				{
					class = "KImageView",
					image_name = "shop_room_image_room_offers_plus_sign_",
					id = "image_room_offers_plus_sign",
					pos = v(132.9, 0),
					scale = v(1, 1),
					anchor = v(14.6, 14.6)
				},
				{
					id = "card_3",
					class = "KView",
					template_name = "group_shop_offer_card",
					pos = v(265.45, 0)
				},
				{
					id = "multi_card_1",
					class = "KView",
					template_name = "group_card_bundle",
					pos = v(-267.95, -6.35)
				},
				{
					id = "multi_card_2",
					class = "KView",
					template_name = "group_card_bundle",
					pos = v(2, -6.85)
				},
				{
					id = "multi_card_3",
					class = "KView",
					template_name = "group_card_bundle",
					pos = v(268, -6.85)
				}
			}
		}
	}
}
