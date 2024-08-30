mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	passive = false,
	group_attack = true,
	reach = 1,
	hp_min = 8,
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.44, 0.4},
	visual = "mesh",
	mesh = "mobs_mc_silverfish.b3d",
	textures = {
		{"mobs_mc_silverfish.png"},
	},
	pathfinding = 1,
	visual_size = {x = 3, y = 3},
	sounds = {
		random = "mobs_mc_silverfish_idle",
		death = "mobs_mc_silverfish_death",
		damage = "mobs_mc_silverfish_hurt",
	},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	replace_rate = 10,
	fall_damage = true,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	view_range = 16,
	attack_type = "dogfight",
	damage = 1,
	reach = 1,
	blood_amount = 0,
})

mobs:register_egg("mobs_mc:silverfish", mobs_mc.S("Silverfish"), "mobs_mc_spawn_icon_silverfish.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.silverfish then
	mobs:spawn(mobs_mc.spawns.silverfish)
end
