local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP .. "/intllib.lua")

local ocelot = {
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
	follow = {"fishing:fish_raw"},
	view_range = 12,
	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	damage = 2,
	reach = 1,
	attack_animals = true,
	specific_attack = {"mobs_animal:chicken", "mobs_animal:rat", "animalworld:rat"},
}

mobs:register_mob("mobs_mc:ocelot", ocelot)

mobs:spawn({
	name = "mobs_mc:ocelot",
	nodes = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "default:dirt", "default:dirt_with_snow", "default:snow", "default:snowblock"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:ocelot", S("Ocelot"), "mobs_mc_spawn_icon_ocelot.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Ocelot loaded")
end
