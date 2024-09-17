mobs:register_mob("mobs_mc:llama", {
	type = "animal",
	hp_min = 15,
	hp_max = 30,
	passive = false,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.86, 0.45},
	visual = "mesh",
	mesh = "mobs_mc_llama.b3d",
	textures = {
		{"blank.png", "blank.png", "mobs_mc_llama_brown.png"},
		{"blank.png", "blank.png", "mobs_mc_llama_creamy.png"},
		{"blank.png", "blank.png", "mobs_mc_llama_gray.png"},
		{"blank.png", "blank.png", "mobs_mc_llama_white.png"},
		{"blank.png", "blank.png", "mobs_mc_llama.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	runaway = true,
	walk_velocity = 1,
	run_velocity = 4.4,
	floats = 1,
	drops = mobs_mc.drops.llama,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = true,
	sounds = {
		random = "mobs_mc_llama",
	},
	animation = {
		speed_normal = 24,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		hurt_start = 118,
		hurt_end = 154,
		death_start = 154,
		death_end = 179,
		eat_start = 49,
		eat_end = 78,
		look_start = 78,
		look_end = 108,
	},
	follow = mobs_mc.follows.llama,
	view_range = 16,

	do_custom = function(self, dtime)
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 4
			self.max_speed_reverse = 2
			self.accel = 4
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 4.3, z = -1.5}
			self.driver_eye_offset = {x = 0, y = 15, z = 0}
			self.driver_scale = {x = 1/3, y = 1/3}
		end

		if self.driver then
			mobs.drive(self, "walk", "stand", false, dtime)

			return false
		end

		return true
	end,

	on_die = function(self, pos)
		if self.driver then
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end
	end,

	do_punch = function(self, hitter)
		if hitter ~= self.driver then
			return true
		end
	end,

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

		local player_name = clicker:get_player_name()

		if self.tamed and self.owner == player_name then
			if self.driver and clicker == self.driver then
				mobs.detach(clicker, {x = 1, y = 0, z = 1})
				return
			else
				mobs.attach(self, clicker)
			end

			if not self.driver then
				self.order = "stand"
				self.object:set_properties({stepheight = 1.2})
				return
			end
		end

		if mobs:capture_mob(self, clicker, 0, 50, 80, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:llama", mobs_mc.S("Llama"), "mobs_mc_spawn_icon_llama.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.llama then
	mobs:spawn(mobs_mc.spawns.llama)
end
