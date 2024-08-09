local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP .. "/intllib.lua")

local mooshroom = {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	visual_size = {x = 2.7, y = 2.7},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.2, 0.4},
	visual = "mesh",
	mesh = "mobs_mc_cow.b3d",
	textures = {
		{
			"mobs_mc_mooshroom.png",
			"mobs_mc_mushroom_red.png",
		},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_mc_cow",
		death = "Cowhurt1",
		damage = "Cowhurt1",
		distance = 16,
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{
			name = "flowers:mushroom_brown",
			chance = 1,
			min = 0,
			max = 2,
		},
		{
			name = "mobs:meat_raw",
			chance = 1,
			min = 1,
			max = 3
		},
		{
			name = "mobs:leather",
			chance = 1,
			min = 0,
			max = 2
		},
	},
	water_damage = 0.01,
	lava_damage = 5,
	light_damage = 0,
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
	follow = {
		"farming:wheat", "default:grass_1", "farming:barley",
		"farming:oat", "farming:rye",
	},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1},
	},
	fear_height = 2,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then

			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		if mobs_mc.items.bucket_milk then
			local tool = clicker:get_wielded_item()
			local name = clicker:get_player_name()
			local item = tool:get_name()

			if item == "bucket:bucket_empty"
			or item == "wooden_bucket:bucket_wood_empty"
			or item == "bucket_wooden:bucket_empty" then

				if self.child == true then
					return
				end

				if self.gotten == true then

					minetest.chat_send_player(name, S("Cow already milked!"))

					return
				end

				local inv = clicker:get_inventory()

				tool:take_item()
				clicker:set_wielded_item(tool)

				local ret_item = mobs_mc.items.bucket_milk

				if mobs_mc.items.wooden_bucket_milk then
					if item == "wooden_bucket:bucket_wood_empty"
					or item == "bucket_wooden:bucket_empty" then
						ret_item = mobs_mc.items.wooden_bucket_milk
					end
				end

				if inv:room_for_item("main", {name = ret_item}) then
					clicker:get_inventory():add_item("main", ret_item)
				else
					local pos = self.object:get_pos()

					pos.y = pos.y + 0.5

					minetest.add_item(pos, {name = ret_item})
				end

				self.gotten = true

				return
			end
		end
	end,

	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end
}

mobs:register_mob("mobs_mc:mooshroom", mooshroom)

mobs:spawn({
	name = "mobs_mc:mooshroom",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:mooshroom", S("Mooshroom"), "mobs_mc_spawn_icon_mooshroom.png", 0)
