﻿-- chunkname: @./kr5/data/slot_template.lua

return {
	achievements = {},
	achievements_claimed = {},
	difficulty = DIFFICULTY_NORMAL,
	levels = {
		{}
	},
	upgrades = {
		towers = {},
		heroes = {},
		reinforcements = {},
		alliance = {}
	},
	seen = {
		hero_vesper = true,
		royal_archers = true,
		paladin_covenant = true,
		arcane_wizard = true
	},
	heroes = {
		selected = "hero_vesper",
		team = {
			"hero_vesper",
			"hero_raelyn"
		},
		status = {
			hero_bird = {
				xp = 0,
				skills = {
					eat_instakill = 0,
					shout_stun = 0,
					ultimate = 1,
					gattling = 0,
					cluster_bomb = 0
				}
			},
			hero_builder = {
				xp = 0,
				skills = {
					demolition_man = 0,
					defensive_turret = 0,
					lunch_break = 0,
					overtime_work = 0,
					ultimate = 1
				}
			},
			hero_dragon_bone = {
				xp = 0,
				skills = {
					nova = 0,
					ultimate = 1,
					cloud = 0,
					rain = 0,
					burst = 0
				}
			},
			hero_dragon_gem = {
				xp = 0,
				skills = {
					floor_impact = 0,
					stun = 0,
					ultimate = 1,
					crystal_instakill = 0,
					crystal_totem = 0
				}
			},
			hero_hunter = {
				xp = 0,
				skills = {
					ricochet = 0,
					beasts = 0,
					shoot_around = 0,
					heal_strike = 0,
					ultimate = 1
				}
			},
			hero_lumenir = {
				xp = 0,
				skills = {
					shield = 0,
					fire_balls = 0,
					mini_dragon = 0,
					celestial_judgement = 0,
					ultimate = 1
				}
			},
			hero_mecha = {
				xp = 0,
				skills = {
					mine_drop = 0,
					power_slam = 0,
					goblidrones = 0,
					tar_bomb = 0,
					ultimate = 1
				}
			},
			hero_muyrn = {
				xp = 0,
				skills = {
					ultimate = 1,
					sentinel_wisps = 0,
					leaf_whirlwind = 0,
					verdant_blast = 0,
					faery_dust = 0
				}
			},
			hero_raelyn = {
				xp = 0,
				skills = {
					unbreakable = 0,
					brutal_slash = 0,
					inspire_fear = 0,
					onslaught = 0,
					ultimate = 1
				}
			},
			hero_robot = {
				xp = 0,
				skills = {
					jump = 0,
					uppercut = 0,
					fire = 0,
					explode = 0,
					ultimate = 1
				}
			},
			hero_space_elf = {
				xp = 0,
				skills = {
					black_aegis = 0,
					ultimate = 1,
					spatial_distortion = 0,
					void_rift = 0,
					astral_reflection = 0
				}
			},
			hero_venom = {
				xp = 0,
				skills = {
					floor_spikes = 0,
					eat_enemy = 0,
					inner_beast = 0,
					ranged_tentacle = 0,
					ultimate = 1
				}
			},
			hero_vesper = {
				xp = 0,
				skills = {
					disengage = 0,
					ricochet = 0,
					arrow_to_the_knee = 0,
					martial_flourish = 0,
					ultimate = 1
				}
			},
			hero_witch = {
				xp = 0,
				skills = {
					disengage = 0,
					polymorph = 0,
					path_aoe = 0,
					soldiers = 0,
					ultimate = 1
				}
			},
			hero_dragon_arb = {
				xp = 0,
				skills = {
					thorn_bleed = 0,
					ultimate = 1,
					tower_runes = 0,
					arborean_spawn = 0,
					tower_plants = 0
				}
			},
			hero_lava = {
				xp = 0,
				skills = {
					hotheaded = 0,
					ultimate = 1,
					wild_eruption = 0,
					double_trouble = 0,
					temper_tantrum = 0
				}
			},
			hero_spider = {
				xp = 0,
				skills = {
					area_attack = 0,
					tunneling = 0,
					supreme_hunter = 0,
					instakill_melee = 0,
					ultimate = 1
				}
			}
		}
	},
	towers = {
		selected = {
			"royal_archers",
			"paladin_covenant",
			"arcane_wizard"
		},
		status = {
			paladin_covenant = {},
			royal_archers = {},
			arcane_wizard = {},
			tricannon = {},
			arborean_emissary = {},
			demon_pit = {},
			ballista = {},
			flamespitter = {},
			rocket_gunners = {},
			ray = {},
			barrel = {},
			sand = {},
			elven_stargazers = {},
			necromancer = {},
			ghost = {},
			dark_elf = {},
			hermit_toad = {},
			dwarf = {},
			sparking_geode = {}
		}
	},
	items = {
		selected = {
			"cluster_bomb",
			"portable_coil",
			"winter_age"
		},
		status = {
			winter_age = 0,
			summon_blackburn = 0,
			loot_box = 0,
			deaths_touch = 0,
			portable_coil = 0,
			second_breath = 0,
			veznan_wrath = 0,
			cluster_bomb = 0,
			scroll_of_spaceshift = 0,
			medical_kit = 0
		}
	},
	claimed_gifts = {}
}
