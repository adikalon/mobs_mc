local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:ocelot", {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.69, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_ocelot.b3d",
	textures = {
		{"mobs_mc_ocelot.png"},
		{"mobs_mc_ocelot_black.png"},
		{"mobs_mc_ocelot_red.png"},
		{"mobs_mc_ocelot_siamese.png"},
	},
	visual_size = {x = 2.0, y = 2.0},
	makes_footstep_sound = true,
	walk_chance = 70,
	walk_velocity = 1,
	run_velocity = 3,
	floats = 1,
	runaway = true,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = true,
	fear_height = 4,
	sounds = {
		random = "mobs_mc_ocelot",
		damage = "mobs_mc_ocelot_hurt",
		death = "mobs_mc_ocelot_hurt",
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
	follow = mobs_mc.follows.ocelot,
	view_range = 12,
	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	damage = 2,
	reach = 1,
	attack_animals = true,
	specific_attack = {"mobs_animal:chicken", "mobs_animal:rat", "animalworld:rat"},
	drops = mobs_mc.drops.ocelot,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 5, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 50, 80, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:ocelot", S("Ocelot"), "mobs_mc_spawn_icon_ocelot.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.ocelot then
	mobs:spawn(mobs_mc.spawns.ocelot)
end
