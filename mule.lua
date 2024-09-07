mobs:register_mob("mobs_mc:mule", {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_mc_horse.b3d",
	visual_size = {x = 2.82, y = 2.82},
	collisionbox = {-0.656355, -0.0094, -0.656355, 0.656355, 1.4946, 0.656355},
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
		{"mobs_mc_mule.png"},
	},
	fly = false,
	walk_chance = 60,
	view_range = 16,
	follow = mobs_mc.follows.mule,
	passive = true,
	hp_min = 15,
	hp_max = 30,
	health = 30,
	floats = 1,
	lava_damage = 4,
	water_damage = 0.01,
	makes_footstep_sound = true,
	fall_damage = true,
	jump = true,
	jump_height = 3.75,
	drops = mobs_mc.drops.mule,

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

		if mobs:capture_mob(self, clicker, nil, nil, 100, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:mule", mobs_mc.S("Mule"), "mobs_mc_spawn_icon_mule.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.mule then
	mobs:spawn(mobs_mc.spawns.mule)
end
