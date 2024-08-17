local S = minetest.get_translator(minetest.get_current_modname())

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
	textures = {{"mobs_mc_donkey.png"}},
	fear_height = 4,
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
	water_damage = 1,
	makes_footstep_sound = true,
	jump = true,
	jump_height = 3.75,
	drops = mobs_mc.drops.donkey,
	replace_what = mobs_mc.replaces.donkey,
	specific_attack = mobs_mc.attacks.donkey,

	do_custom = function(self, dtime)
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 4.3, z = -1.75}
			self.driver_eye_offset = {x = 0, y = 10, z = 0}
			self.driver_scale = {x = 1/2.58, y = 1/2.58}
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

		if self.shoed and minetest.registered_items[self.shoed] then
			minetest.add_item(pos, self.shoed)
		end

		if self._horse_armor and minetest.registered_items[self._horse_armor] then
			minetest.add_item(pos, self._horse_armor)
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
			local inv = clicker:get_inventory()
			local tool = clicker:get_wielded_item()
			local item = tool:get_name()

			if not self.driver and not self.child then
				if
					self.saddle
					and not item:find("mobs_mc:horseshoe")
					and not item:find("mobs_mc:horse_armor")
					and item ~= "mobs:saddle"
				then
					mobs.attach(self, clicker)
					return
				end

				if not self.saddle and item == "mobs:saddle" then
					self.saddle = true
					self.order = "stand"
					self.object:set_properties({stepheight = 1.2})
					inv:remove_item("main", "mobs:saddle")
					self.texture_mods = self.texture_mods .. "^mobs_mc_horse_saddle.png"
					self.object:set_texture_mod(self.texture_mods)
					return
				end

				if item:find("mobs_mc:horseshoe") then
					if self.shoed then
						minetest.add_item(self.object:get_pos(), self.shoed)
					end

					local speed = mobs_mc.shoes[item][1]
					local jump = mobs_mc.shoes[item][2]
					local reverse = mobs_mc.shoes[item][3]
					local overlay = mobs_mc.shoes[item][4]

					self.max_speed_forward = speed
					self.jump_height = jump
					self.max_speed_reverse = reverse
					self.accel = speed
					self.shoed = item

					if overlay then
						self.texture_mods = self.texture_mods .. "^" .. overlay
						self.object:set_texture_mod(self.texture_mods)
					end

					minetest.chat_send_player(
						player_name,
						S("Donkey shoes fitted. Speed: @1, jump height: @2, stop speed: @3", speed, jump, reverse)
					)

					if not minetest.settings:get_bool("creative_mode") then
						tool:take_item()
						clicker:set_wielded_item(tool)
					end

					return
				end

				if not self._horse_armor and item:find("mobs_mc:horse_armor") then
					self.armor = minetest.get_item_group(item, "horse_armor")
					self._horse_armor = item

					if not minetest.settings:get_bool("creative_mode") then
						tool:take_item()
						clicker:set_wielded_item(tool)
					end

					local agroups = self.object:get_armor_groups()
					agroups.fleshy = self.armor
					self.object:set_armor_groups(agroups)

					self.texture_mods = self.texture_mods .. "^" .. minetest.registered_items[self._horse_armor]._horse_overlay_image
					self.object:set_texture_mod(self.texture_mods)

					return
				end
			end

			if self.driver and clicker == self.driver then
				mobs.detach(clicker, {x = 1, y = 0, z = 1})
				return
			end
		end

		if mobs:capture_mob(self, clicker, nil, nil, 100, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:donkey", S("Donkey"), "mobs_mc_spawn_icon_donkey.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.donkey)
end
