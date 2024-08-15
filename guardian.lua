local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:guardian", {
	type = "monster",
	hp_min = 30,
	hp_max = 30,
    	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 6,
	reach = 3,
	collisionbox = {-0.425, 0.25, -0.425, 0.425, 1.1, 0.425},
	visual = "mesh",
	mesh = "mobs_mc_guardian.b3d",
	textures = {
		{"mobs_mc_guardian.png"},
	},
	visual_size = {x = 3, y = 3},
	sounds = {
		damage = "mobs_mc_squid_hurt",
		distance = 16,
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
	drops = mobs_mc.drops.guardian,
	fly = true,
	fly_in = {"default:river_water_source", "default:water_source", "df_farming:dwarven_syrup_source", "ebiomes:swamp_water_source", "livingcaves:water_source", "swamp:swamp_water_source"},
	stepheight = 0.1,
	jump = false,
	view_range = 16,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	blood_amount = 0,
	air_damage = 2,
	follow = mobs_mc.follows.guardian,
	replace_what = mobs_mc.replaces.guardian,
	specific_attack = mobs_mc.attacks.guardian,
})

mobs:register_egg("mobs_mc:guardian", S("Guardian"), "mobs_mc_spawn_icon_guardian.png", 0)

if not mobs_mc.guardian then
	mobs:spawn(mobs_mc.spawns.guardian)
end
