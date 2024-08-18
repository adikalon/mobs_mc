local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:axolotl", {
	type = "animal",
	passive = true,
	hp_min = 14,
	hp_max = 14,
	armor = 100,
	collisionbox = {-0.5, 0.0, -0.5, 0.5, 0.8, 0.5},
	visual = "mesh",
	mesh = "mobs_mc_axolotl.b3d",
	rotate = 180,
	textures = {
		{"mobs_mc_axolotl_brown.png"},
		{"mobs_mc_axolotl_yellow.png"},
		{"mobs_mc_axolotl_green.png"},
		{"mobs_mc_axolotl_pink.png"},
		{"mobs_mc_axolotl_black.png"},
		{"mobs_mc_axolotl_purple.png"},
		{"mobs_mc_axolotl_white.png"}
	},
	sounds = {
		random = "mobs_mc_axolotl",
		damage = "mobs_mc_axolotl_hurt",
	},
	animation = {
		stand_start = 61,
		stand_end = 81,
		stand_speed = 15,
		walk_start = 61,
		walk_end = 81,
		walk_speed = 15,
		run_start = 61,
		run_end = 81,
		run_speed = 20,
	},
	drops = mobs_mc.drops.axolotl,
	makes_footstep_sound = false,
	stepheight = 0.1,
	fly = true,
	fly_in = {"default:river_water_source", "default:water_source", "ebiomes:swamp_water_source", "swamp:swamp_water_source"},
	jump = false,
	fall_speed = 0.5,
	view_range = 16,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	runaway = true,
	fear_height = 4,
	blood_texture = "mobs_mc_squid_blood.png",
})

mobs:register_egg("mobs_mc:axolotl", S("Axolotl"), "mobs_mc_spawn_icon_axolotl.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.axolotl)
end
