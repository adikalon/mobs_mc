mobs:register_mob("mobs_mc:pig", {
	type = "animal",
	runaway = true,
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 0.865, 0.45},
	visual = "mesh",
	mesh = "mobs_mc_pig.b3d",
	textures = {
		{
		"blank.png",
		"mobs_mc_pig.png",
		"blank.png",
		}
	},
	visual_size = {x = 2.5, y = 2.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	drops = mobs_mc.drops.pig,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = true,
	sounds = {
		random = "mobs_pig",
		death = "mobs_pig_angry",
		damage = "mobs_pig",
	},
	animation = {
		stand_speed = 40,
		walk_speed = 40,
		run_speed = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	follow = mobs_mc.follows.pig,
	view_range = 5,

	do_custom = function(self, dtime)
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 4
			self.max_speed_reverse = 2
			self.accel = 4
			self.terrain_type = 3
			self.driver_attach_at = {x = 0.0, y = 2.8, z = -1.5}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 1/2.5, y = 1/2.5}
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

		if self.saddle then
			minetest.add_item(pos, "mobs:saddle")
		end
	end,

	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end

		local wielditem = clicker:get_wielded_item()

		if wielditem:get_name() ~= "mobs_mc:carrot_on_a_stick" then
			if mobs:feed_tame(self, clicker, 6, true, true) then return end
		end

		if mobs:protect(self, clicker) then return end

		if self.child then
			return
		end

		local item = clicker:get_wielded_item()

		if item:get_name() == "mobs:saddle" and not self.saddle then
			self.base_texture = {
				"blank.png",
				"mobs_mc_pig.png",
				"mobs_mc_pig_saddle.png",
			}

			self.object:set_properties({
				textures = self.base_texture
			})

			self.saddle = true

			local inv = clicker:get_inventory()
			local stack = inv:get_stack("main", clicker:get_wield_index())
			stack:take_item()
			inv:set_stack("main", clicker:get_wield_index(), stack)

			return
		end

		local name = clicker:get_player_name()

		if self.driver and clicker == self.driver then
			mobs.detach(clicker, {x = 1, y = 0, z = 0})
			return

		elseif not self.driver and self.tamed and self.saddle and wielditem:get_name() == "mobs_mc:carrot_on_a_stick" then
			mobs.attach(self, clicker)
			local inv = self.driver:get_inventory()

			if wielditem:get_wear() > 63000 then
				local def = wielditem:get_definition()

				if def.sounds and def.sounds.breaks then
					minetest.sound_play(def.sounds.breaks, {pos = clicker:getpos(), max_hear_distance = 8, gain = 0.5})
				end

				wielditem = {name = "default:stick", count = 1}
			else
				wielditem:add_wear(2521)
			end

			inv:set_stack("main",self.driver:get_wield_index(), wielditem)

			return

		elseif not self.driver and clicker:get_wielded_item():get_name() ~= "" then
			if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end
		end
	end,
})

mobs:register_egg("mobs_mc:pig", mobs_mc.S("Pig"), "mobs_mc_spawn_icon_pig.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.pig then
	mobs:spawn(mobs_mc.spawns.pig)
end
