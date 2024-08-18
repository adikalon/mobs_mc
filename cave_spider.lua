local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:cave_spider", {
	type = "monster",
	passive = false,
	docile_by_day = true,
	attack_type = "dogfight",
	pathfinding = 1,
	damage = 3,
	reach = 2,
	hp_min = 1,
	hp_max = 12,
	collisionbox = {-0.35, -0.01, -0.35, 0.35, 0.49, 0.35},
	visual = "mesh",
	mesh = "mobs_mc_spider.b3d",
	textures = {
		{"mobs_mc_cave_spider.png"},
	},
	visual_size = {x = 1.66666, y = 1.5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_mc_spider_random",
		attack = "mobs_mc_spider_attack",
		damage = "mobs_mc_spider_hurt",
		death = "mobs_mc_spider_death",
	},
	walk_velocity = 4.1,
	jump = true,
	jump_height = 2,
	view_range = 16,
	floats = 1,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		stand_speed = 10,
		walk_speed = 25,
		run_speed = 50,
		stand_start = 20,
		stand_end = 40,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	blood_amount = 0,
	drops = mobs_mc.drops.cave_spider,
	follow = mobs_mc.follows.cave_spider,
	replace_what = mobs_mc.replaces.cave_spider,
	specific_attack = mobs_mc.attacks.cave_spider,
})

mobs:register_egg("mobs_mc:cave_spider", S("Cave Spider"), "mobs_mc_spawn_icon_cave_spider.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.cave_spider)
end
