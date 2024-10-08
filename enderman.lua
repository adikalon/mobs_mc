mobs:register_mob("mobs_mc:enderman", {
	type = "monster",
	attack_animals = false,
	attack_npcs = true,
	passive = false,
	pathfinding = 1,
	stepheight = 1.2,
	hp_min = 40,
	hp_max = 40,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 2.89, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_enderman.b3d",
	textures = {"mobs_mc_enderman.png"},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_sandmonster",
		death = "mobs_mc_enderman_death",
		damage = "mobs_mc_enderman_hurt",
		random = "mobs_mc_enderman_random",
	},
	walk_velocity = 0.2,
	run_velocity = 3.4,
	damage = 7,
	reach = 2,
	animation = {
		walk_speed = 25,
		run_speed = 50,
		stand_speed = 25,
		stand_start = 40,
		stand_end = 80,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 81,
		punch_end = 120,
	},
	water_damage = 8,
	lava_damage = 4,
	light_damage = 2,
	view_range = 16,
	attack_type = "dogfight",
	blood_amount = 0,
	fall_damage = true,
})

mobs:register_egg("mobs_mc:enderman", mobs_mc.S("Enderman"), "mobs_mc_spawn_icon_enderman.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.enderman then
	mobs:spawn(mobs_mc.spawns.enderman)
end
