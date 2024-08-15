local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:ocelot", {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.69, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_ocelot.b3d",
	textures = {"mobs_mc_ocelot.png"},
	visual_size = {x = 2.0, y = 2.0},
	makes_footstep_sound = true,
	walk_chance = 70,
	walk_velocity = 1,
	run_velocity = 3,
	floats = 1,
	runaway = true,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	fear_height = 4,
	sounds = {
		random = "mobs_ocelot",
		distance = 16,
	},
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	follow = mobs_mc.follows.ocelot,
	view_range = 12,
	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	damage = 2,
	reach = 1,
	attack_animals = true,
	specific_attack = mobs_mc.attacks.ocelot,
	drops = mobs_mc.drops.ocelot,
	replace_what = mobs_mc.replaces.ocelot,
})

mobs:register_egg("mobs_mc:ocelot", S("Ocelot"), "mobs_mc_spawn_icon_ocelot.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.ocelot)
end
