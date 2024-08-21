local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:endermite", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	passive = false,
	hp_min = 8,
	hp_max = 8,
	armor = 100,
	group_attack = true,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.29, 0.2},
	visual = "mesh",
	mesh = "mobs_mc_endermite.b3d",
	textures = {
		{"mobs_mc_endermite.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_mc_endermite_random",
		damage = "mobs_mc_endermite_hurt",
		death = "mobs_mc_endermite_death",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	fear_height = 4,
	view_range = 16,
	damage = 2,
	reach = 1,
	blood_amount = 0,
	fall_damage = true,
})

mobs:register_egg("mobs_mc:endermite", S("Endermite"), "mobs_mc_spawn_icon_endermite.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.endermite then
	mobs:spawn(mobs_mc.spawns.endermite)
end
