﻿-- chunkname: @./kr5/data/waves/level12_waves_campaign.lua

return {
	cash = 1300,
	groups = {
		{
			interval = 800,
			waves = {
				{
					delay = 0,
					path_index = 1,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 300,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 120,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 480,
							max = 4
						}
					}
				},
				{
					delay = 180,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 420,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 600,
							max = 1
						}
					}
				}
			}
		},
		{
			interval = 700,
			waves = {
				{
					delay = 0,
					path_index = 1,
					notification_second_level = "TIP_GLARE",
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 510,
							max = 4
						}
					}
				},
				{
					delay = 180,
					path_index = 3,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 510,
							max = 3
						}
					}
				}
			}
		},
		{
			interval = 750,
			waves = {
				{
					delay = 0,
					path_index = 1,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 80,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 180,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 80,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 120,
							max = 3
						}
					}
				},
				{
					delay = 510,
					path_index = 6,
					some_flying = true,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 600,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 120,
							max = 1
						}
					}
				}
			}
		},
		{
			interval = 700,
			waves = {
				{
					delay = 0,
					path_index = 5,
					some_flying = true,
					spawns = {
						{
							interval = 120,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 210,
							max = 2
						},
						{
							interval = 120,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 210,
							max = 2
						}
					}
				}
			}
		},
		{
			interval = 550,
			waves = {
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 450,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 640,
							max = 1
						}
					}
				},
				{
					delay = 300,
					path_index = 3,
					spawns = {
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 270,
							max = 10
						},
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 60,
							max = 20
						},
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 360,
							max = 10
						}
					}
				}
			}
		},
		{
			interval = 600,
			waves = {
				{
					delay = 240,
					path_index = 1,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 300,
							max = 2
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 210,
							max = 3
						}
					}
				},
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 48,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 600,
							max = 1
						}
					}
				},
				{
					delay = 120,
					path_index = 3,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 300,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 210,
							max = 2
						}
					}
				}
			}
		},
		{
			interval = 850,
			waves = {
				{
					delay = 0,
					path_index = 3,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 510,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 540,
							max = 1
						}
					}
				},
				{
					delay = 0,
					path_index = 4,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 3,
							interval_next = 0,
							max = 1
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 3,
							interval_next = 90,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 3,
							interval_next = 240,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 3,
							interval_next = 90,
							max = 3
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 3,
							interval_next = 210,
							max = 3
						}
					}
				}
			}
		},
		{
			interval = 750,
			waves = {
				{
					delay = 240,
					path_index = 3,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 660,
							max = 1
						}
					}
				},
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 120,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 30,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 120,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 120,
							max = 1
						}
					}
				}
			}
		},
		{
			interval = 800,
			waves = {
				{
					delay = 60,
					path_index = 1,
					spawns = {
						{
							interval = 30,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 300,
							max = 5
						},
						{
							interval = 30,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 450,
							max = 5
						}
					}
				},
				{
					delay = 0,
					path_index = 4,
					spawns = {
						{
							interval = 30,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 360,
							max = 5
						},
						{
							interval = 30,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 2,
							interval_next = 450,
							max = 5
						}
					}
				}
			}
		},
		{
			interval = 700,
			waves = {
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 30,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 420,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 30,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 420,
							max = 1
						}
					}
				},
				{
					delay = 300,
					path_index = 6,
					some_flying = true,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 360,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 90,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 270,
							max = 1
						}
					}
				}
			}
		},
		{
			interval = 650,
			waves = {
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 120,
							max = 1
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 300,
							max = 5
						}
					}
				},
				{
					delay = 0,
					path_index = 3,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 120,
							max = 1
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 300,
							max = 5
						}
					}
				}
			}
		},
		{
			interval = 550,
			waves = {
				{
					delay = 0,
					path_index = 5,
					some_flying = true,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 330,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 270,
							max = 1
						}
					}
				},
				{
					delay = 150,
					path_index = 6,
					some_flying = true,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 330,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 60,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 270,
							max = 1
						}
					}
				}
			}
		},
		{
			interval = 550,
			waves = {
				{
					delay = 0,
					path_index = 1,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 240,
							max = 5
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 240,
							max = 5
						}
					}
				},
				{
					delay = 1050,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 2,
							interval_next = 30,
							max = 2
						},
						{
							interval = 30,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_unblinded_abomination",
							path = 3,
							interval_next = 360,
							max = 2
						}
					}
				},
				{
					delay = 780,
					path_index = 3,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 240,
							max = 5
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 120,
							max = 5
						}
					}
				},
				{
					delay = 180,
					path_index = 2,
					spawns = {
						{
							interval = 90,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 300,
							max = 2
						}
					}
				}
			}
		},
		{
			interval = 700,
			waves = {
				{
					delay = 30,
					path_index = 1,
					spawns = {
						{
							interval = 40,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 90,
							max = 10
						},
						{
							interval = 40,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 600,
							max = 10
						}
					}
				},
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 90,
							max = 10
						},
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 90,
							max = 10
						},
						{
							interval = 20,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 150,
							max = 10
						}
					}
				},
				{
					delay = 0,
					path_index = 3,
					spawns = {
						{
							interval = 40,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 90,
							max = 10
						},
						{
							interval = 40,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_glareling",
							path = 1,
							interval_next = 600,
							max = 10
						}
					}
				}
			}
		},
		{
			interval = 600,
			waves = {
				{
					delay = 0,
					path_index = 2,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 600,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 600,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_unblinded_abomination",
							path = 1,
							interval_next = 420,
							max = 1
						}
					}
				},
				{
					delay = 210,
					path_index = 3,
					spawns = {
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 420,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 390,
							max = 1
						},
						{
							interval = 0,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_vile_spawner",
							path = 1,
							interval_next = 420,
							max = 1
						}
					}
				},
				{
					delay = 1070,
					path_index = 5,
					some_flying = true,
					spawns = {
						{
							interval = 90,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 150,
							max = 1
						},
						{
							interval = 90,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 150,
							max = 1
						},
						{
							interval = 90,
							max_same = 0,
							fixed_sub_path = 1,
							creep = "enemy_blinker",
							path = 1,
							interval_next = 300,
							max = 2
						}
					}
				},
				{
					delay = 0,
					path_index = 1,
					spawns = {
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 210,
							max = 6
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 210,
							max = 6
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 210,
							max = 6
						},
						{
							interval = 45,
							max_same = 0,
							fixed_sub_path = 0,
							creep = "enemy_mindless_husk",
							path = 1,
							interval_next = 300,
							max = 6
						}
					}
				}
			}
		}
	}
}
