mobs:register_mob("mobs_mc:guardian_elder", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	hp_min = 80,
	hp_max = 80,
	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 8,
	reach = 3,
	collisionbox = {-0.99875, 0.5, -0.99875, 0.99875, 2.4975, 0.99875},
	visual = "mesh",
	mesh = "mobs_mc_guardian.b3d",
	textures = {
		{"mobs_mc_guardian_elder.png"},
	},
	visual_size = {x = 7, y = 7},
	sounds = {
		random = "mobs_mc_guardian_random",
		war_cry = "mobs_mc_guardian_random",
		damage = "mobs_mc_guardian_hurt",
		death = "mobs_mc_guardian_death",
		flop = "mobs_mc_squid_flop",
	},
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		stand_start = 0,
		stand_end = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	drops = mobs_mc.drops.guardian_elder,
	fly = true,
	fly_in = {"default:river_water_source", "default:water_source", "df_farming:dwarven_syrup_source", "ebiomes:swamp_water_source", "livingcaves:water_source", "swamp:swamp_water_source"},
	stepheight = 0.1,
	jump = false,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 2,
	view_range = 16,
	blood_amount = 0,
	air_damage = 2,
	fall_damage = true,
})

mobs:register_egg("mobs_mc:guardian_elder", mobs_mc.S("Elder Guardian"), "mobs_mc_spawn_icon_guardian_elder.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.guardian_elder then
	mobs:spawn(mobs_mc.spawns.guardian_elder)
end
