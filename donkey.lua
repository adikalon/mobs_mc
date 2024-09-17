mobs:register_mob("mobs_mc:donkey", {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_mc_horse.b3d",
	visual_size = {x = 2.58, y = 2.58},
	collisionbox = {-0.600495, -0.0086, -0.600495, 0.600495, 1.3674, 0.600495},
	animation = {
		speed_normal = 25,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
	},
	sounds = {
		random = "mobs_mc_donkey_random",
		damage = "mobs_mc_donkey_hurt",
		death = "mobs_mc_donkey_death",
	},
	textures = {
		{"mobs_mc_donkey.png"},
	},
	fly = false,
	walk_chance = 60,
	view_range = 16,
	follow = mobs_mc.follows.donkey,
	passive = true,
	hp_min = 15,
	hp_max = 30,
	health = 30,
	floats = 1,
	lava_damage = 4,
	water_damage = 0.01,
	makes_footstep_sound = true,
	jump = true,
	jump_height = 3.75,
	fall_damage = true,
	drops = mobs_mc.drops.donkey,

	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end

		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		if mobs:protect(self, clicker) then
			return
		end

		if mobs:capture_mob(self, clicker, 0, 50, 80, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:donkey", mobs_mc.S("Donkey"), "mobs_mc_spawn_icon_donkey.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.donkey then
	mobs:spawn(mobs_mc.spawns.donkey)
end
