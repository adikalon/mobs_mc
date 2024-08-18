local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:parrot", {
	type = "animal",
	pathfinding = 1,
	hp_min = 6,
	hp_max = 6,
	collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.89, 0.25},
	visual = "mesh",
	mesh = "mobs_mc_parrot.b3d",
	textures = {
		{"mobs_mc_parrot_blue.png"},
		{"mobs_mc_parrot_green.png"},
		{"mobs_mc_parrot_grey.png"},
		{"mobs_mc_parrot_red_blue.png"},
		{"mobs_mc_parrot_yellow_blue.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 5,
	sounds = {
		random = "mobs_mc_parrot_random",
		damage = "mobs_mc_parrot_hurt",
		death = "mobs_mc_parrot_death",
	},
	drops = mobs_mc.drops.parrot,
	animation = {
		stand_speed = 50,
		walk_speed = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 130,
	},
	walk_chance = 100,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -2.25,
	attack_type = "dogfight",
	jump = true,
	jump_height = 4,
	floats = 1,
	physical = true,
	fly = true,
	fly_in = {"air"},
	fear_height = 4,
	view_range = 16,
	follow = mobs_mc.follows.parrot,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 5, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 50, 80, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:parrot", S("Parrot"), "mobs_mc_spawn_icon_parrot.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.parrot)
end
