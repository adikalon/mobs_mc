mobs:register_mob("mobs_mc:iron_golem", {
	type = "npc",
	attack_animals = false,
	attack_npcs = false,
	attacks_monsters = true,
	group_attack = true,
	passive = false,
	hp_min = 100,
	hp_max = 100,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.69, 0.7},
	visual = "mesh",
	mesh = "mobs_mc_iron_golem.b3d",
	textures = {
		{"mobs_mc_iron_golem.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	sounds = {
		damage = "mobs_mc_iron_golem_hurt"
	},
	view_range = 100,
	stepheight = 1.1,
	owner = "",
	order = "follow",
	floats = 0,
	walk_velocity = 0.6,
	run_velocity = 1.2,
	damage = 14,
	reach = 3,
	attack_type = "dogfight",
	drops = mobs_mc.drops.iron_golem,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = true,
	animation = {
		stand_speed = 15,
		walk_speed = 15,
		run_speed = 25,
		punch_speed = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 40,
		punch_end = 50,
	},
	jump = true,
	blood_amount = 0,
	stay_near = {{"mg_villages:mob_spawner"}, 5},
})

mobs:register_egg("mobs_mc:iron_golem", mobs_mc.S("Iron Golem"), "mobs_mc_spawn_icon_iron_golem.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.iron_golem then
	mobs:spawn(mobs_mc.spawns.iron_golem)
end
