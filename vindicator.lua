local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:vindicator", {
	type = "monster",
	physical = false,
	pathfinding = 1,
	hp_min = 24,
	hp_max = 24,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_vindicator.b3d",
	textures = {
		{
			"mobs_mc_vindicator_base.png",
			"blank.png",
			"mobs_mc_iron_axe.png",
		},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	damage = 13,
	reach = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	attack_type = "dogfight",
	sounds = {
		random = "Villager1",
		death = "Villagerdead",
		damage = "Villagerhurt1",
	},
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 25,
		punch_speed = 25,
		stand_start = 40,
		stand_end = 59,
		walk_start = 0,
		walk_end = 40,
		punch_start = 90,
		punch_end = 110,
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	view_range = 16,
	fear_height = 4,
	drops = mobs_mc.drops.vindicator,
})

mobs:register_egg("mobs_mc:vindicator", S("Vindicator"), "mobs_mc_spawn_icon_vindicator.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.vindicator)
end