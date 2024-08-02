-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- Zombie by BlockMen

mobs:register_mob("mobs_mc:zombie_white", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 3,
	hp_min = 12,
	hp_max = 35,
	armor = 150,
	collisionbox = {-0.25, -1, -0.3, 0.25, 0.75, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_zombie_white.x",
	textures = {
		{
			"mobs_mc_zombie_white.png"
		},
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_mc_zombie_white_1",
		damage = "mobs_mc_zombie_white_hit",
		attack = "mobs_mc_zombie_white_3",
		death = "mobs_mc_zombie_white_death",
	},
	walk_velocity = 0.5,
	run_velocity = 0.5,
	jump = true,
	floats = 0,
	view_range = 10,
	drops = {
		{
			name = "mobs_mc:rotten_flesh",
			chance = 2,
			min = 3,
			max = 5,
		},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 188,
		run_start = 168,
		run_end = 188,
	},
})

mobs:spawn({
	name = "mobs_mc:zombie_white",
	nodes = {"group:cracky", "group:crumbly", "group:dirt", "group:stone", "group:sand", "group:snowy"},
	min_light = 0,
	max_light = 7,
	chance = 7000,
	active_object_count = 2,
	day_toggle = false,
})

mobs:register_egg("mobs_mc:zombie_white", S("Zombie White"), "mobs_mc_spawn_icon_zombie_white.png", 0)
