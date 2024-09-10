mobs:register_mob("mobs_mc:vindicator", {
	type = "monster",
	attack_animals = false,
	attack_npcs = true,
	passive = false,
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
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	view_range = 16,
	fall_damage = true,
	drops = mobs_mc.drops.vindicator,
})

mobs:register_egg("mobs_mc:vindicator", mobs_mc.S("Vindicator"), "mobs_mc_spawn_icon_vindicator.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.vindicator then
	mobs:spawn(mobs_mc.spawns.vindicator)
end
