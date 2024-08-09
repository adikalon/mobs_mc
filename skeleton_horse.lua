local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP .. "/intllib.lua")

local shoes = {
	["mobs:horseshoe_steel"] = {9, 6, 4, "mobs_mc_horseshoe_steelo.png"},
	["mobs:horseshoe_bronze"] = {9, 6, 6, "mobs_mc_horseshoe_bronzeo.png"},
	["mobs:horseshoe_mese"] = {11, 7, 10, "mobs_mc_horseshoe_meseo.png"},
	["mobs:horseshoe_diamond"] = {12, 8, 8, "mobs_mc_horseshoe_diamondo.png"},
	["mobs:horseshoe_crystal"] = {13, 8, 11, "mobs_mc_horseshoe_crystalo.png"}
}

local skeleton_horse = {
	type = "animal",
	visual = "mesh",
	mesh = "mobs_mc_horse.b3d",
	visual_size = {x = 3.0, y = 3.0},
	collisionbox = {-0.69825, -0.01, -0.69825, 0.69825, 1.59, 0.69825},
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	sounds = {
		random = "skeleton1",
		death = "skeletondeath",
		damage = "skeletonhurt1",
		distance = 16,
	},
	blood_amount = 0,
	textures = {{"mobs_mc_horse_skeleton.png"}},
	fear_height = 4,
	fly = false,
	walk_chance = 60,
	view_range = 16,
	follow = {"farming:wheat", "default:apple", "farming:oat", "farming:barley", "farming:corn"},
	passive = true,
	hp_min = 15,
	hp_max = 30,
	health = 30,
	floats = 1,
	lava_damage = 4,
	water_damage = 1,
	makes_footstep_sound = true,
	jump = true,
	jump_height = 5.75,
	drops = {},
	do_custom = function(self, dtime)
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 4.3, z = -1.75}
			self.driver_eye_offset = {x = 0, y = 10, z = 0}
			self.driver_scale = {x = 1/3.0, y = 1/3.0}
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

			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				return
			end

			if not self.driver
			and not self.child
			and clicker:get_wielded_item():get_name() == "mobs:saddle"
			and not self.saddle then

				self.saddle = true
				self.order = "stand"
				self.object:set_properties({stepheight = 1.2})

				inv:remove_item("main", "mobs:saddle")

				self.texture_mods = self.texture_mods .. "^mobs_mc_horse_saddle.png"

				self.object:set_texture_mod(self.texture_mods)

				return
			end

			if item:find("mobs:horseshoe") then
				if self.shoed then
					minetest.add_item(self.object:get_pos(), self.shoed)
				end

				local speed = shoes[item][1]
				local jump = shoes[item][2]
				local reverse = shoes[item][3]
				local overlay = shoes[item][4]

				self.max_speed_forward = speed
				self.jump_height = jump
				self.max_speed_reverse = reverse
				self.accel = speed
				self.shoed = item

				if overlay then

					self.texture_mods = "^" .. overlay

					if self.saddle then
						self.texture_mods = self.texture_mods
							.. "^mobs_mc_horse_saddle.png"
					end

					self.object:set_texture_mod(self.texture_mods)
				end

				minetest.chat_send_player(player_name,
						S("Horse shoes fitted -")
						.. S(" speed: ") .. speed
						.. S(" , jump height: ") .. jump
						.. S(" , stop speed: ") .. reverse)

				tool:take_item()

				clicker:set_wielded_item(tool)

				return
			end
		end

		if mobs:capture_mob(self, clicker, nil, nil, 100, false, nil) then return end

		if self.saddle and self.owner == player_name then
			mobs.attach(self, clicker)
		end
	end,
}

if mobs_mc.items.bone then
	table.insert(skeleton_horse.drops, {
		name = mobs_mc.items.bone,
		chance = 1,
		min = 0,
		max = 2,
	})
end

mobs:register_mob("mobs_mc:skeleton_horse", skeleton_horse)

mobs:spawn({
	name = "mobs_mc:skeleton_horse",
	nodes = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "default:dirt", "default:dirt_with_snow", "default:snow", "default:snowblock"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:skeleton_horse", S("Skeleton Horse"), "mobs_mc_spawn_icon_horse_skeleton.png", 0)
