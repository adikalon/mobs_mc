local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:snowman", {
	type = "npc",
	passive = true,
	hp_min = 4,
	hp_max = 4,
	pathfinding = 1,
	view_range = 10,
	fall_damage = 0,
	water_damage = 4,
	lava_damage = 20,
	collisionbox = {-0.35, -0.01, -0.35, 0.35, 1.89, 0.35},
	visual = "mesh",
	mesh = "mobs_mc_snowman.b3d",
	textures = {
		{"mobs_mc_snowman.png^mobs_mc_snowman_pumpkin.png"},
	},
	gotten_texture = { "mobs_mc_snowman.png" },
	drops = {
		{
			name = "default:snowblock",
			chance = 1,
			min = 0,
			max = 5,
		}
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	makes_footstep_sound = true,
	shoot_interval = 1,
	shoot_offset = 1,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 20,
		stand_end = 40,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
		die_start = 40,
		die_end = 50,
		die_loop = false,
	},
	blood_amount = 0,
	do_custom = function(self, dtime)
		if not self._snowtimer then
			self._snowtimer = 0
			return
		end

		self._snowtimer = self._snowtimer + dtime
		if self.health > 0 and self._snowtimer > 0.5 then
			self._snowtimer = 0
			local pos = self.object:getpos()
			local below = {x=pos.x, y=pos.y-1, z=pos.z}
			local def = minetest.registered_nodes[minetest.get_node(pos).name]

			if def and def.buildable_to then
				local belowdef = minetest.registered_nodes[minetest.get_node(below).name]

				if belowdef and belowdef.walkable and (belowdef.node_box == nil or belowdef.node_box.type == "regular") then
					minetest.set_node(pos, {name = mobs_mc.items.top_snow})
				end
			end
		end
	end,
})

mobs:spawn({
	name = "mobs_mc:snowman",
	nodes = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "default:dirt", "default:dirt_with_snow", "default:snow", "default:snowblock"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:snowman", S("Snow Golem"), "mobs_mc_spawn_icon_snowman.png", 0)
