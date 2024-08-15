local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
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
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	replace_what = mobs_mc.replaces.silverfish,
	replace_rate = 2,
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
	drops = mobs_mc.drops.silverfish,
	follow = mobs_mc.follows.silverfish,
	specific_attack = mobs_mc.attacks.silverfish,
})

local spawn_silverfish = function(pos, oldnode, oldmetadata, digger)
	minetest.add_entity(pos, "mobs_mc:silverfish")
end

minetest.register_node("mobs_mc:monster_egg_stone", {
	description = S("Stone Monster Egg"),
	tiles = {"default_stone.png"},
	groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
	drop = '',
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	after_dig_node = spawn_silverfish,
})

local scarcity = 22 * 22 * 22

if minetest.get_mapgen_setting("mg_name") == "v6" then
	scarcity = 28 * 28 * 28
end

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mobs_mc:monster_egg_stone",
	wherein        = "default:stone",
	clust_scarcity = scarcity,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = 31000,
})

mobs:register_egg("mobs_mc:silverfish", S("Silverfish"), "mobs_mc_spawn_icon_silverfish.png", 0)
