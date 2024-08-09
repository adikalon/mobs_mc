local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP .. "/intllib.lua")

local killer_bunny = {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	specific_attack = {"player", "animalworld:wolf"},
	attacks_monsters = true,
	attack_players = true,
	damage = 8,
	armor = 50,
	textures = { "mobs_mc_killer_bunny_caerbannog.png" },
	view_range = 16,
	replace_rate = nil,
	replace_what = nil,
	on_rightclick = nil,
	run_velocity = 6,
	reach = 1,

	hp_min = 3,
	hp_max = 3,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.49, 0.2},

	visual = "mesh",
	mesh = "mobs_mc_killer_bunny.b3d",
	visual_size = {x=1.5, y=1.5},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	floats = 1,
	runaway = true,
	jump = true,
	drops = {},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},

	follow = {"flowers:dandelion_yellow", "flowers:dandelion_yellow", "group:grass", "farming:carrot", "farming:carrot_gold"},
}

if mobs_mc.items.rabbit_raw then
	table.insert(killer_bunny.drops, {
		name = mobs_mc.items.rabbit_raw,
		chance = 1,
		min = 1,
		max = 1,
	})
end

if mobs_mc.items.rabbit_hide then
	table.insert(killer_bunny.drops, {
		name = mobs_mc.items.rabbit_hide,
		chance = 1,
		min = 0,
		max = 1,
	})
end

mobs:register_mob("mobs_mc:killer_bunny", killer_bunny)

mobs:spawn({
	name = "mobs_mc:killer_bunny",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:killer_bunny", S("Killer Bunny"), "mobs_mc_spawn_icon_killer_bunny.png", 0)
