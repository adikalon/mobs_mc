local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:snowman", {
	type = "npc",
	attack_animals = false,
	attack_npcs = false,
	passive = false,
	hp_min = 4,
	hp_max = 4,
	pathfinding = 1,
	view_range = 10,
	fall_damage = true,
	water_damage = 4,
	lava_damage = 20,
	attacks_monsters = true,
	collisionbox = {-0.35, -0.01, -0.35, 0.35, 1.89, 0.35},
	visual = "mesh",
	mesh = "mobs_mc_snowman.b3d",
	textures = {
		{"mobs_mc_snowman.png"},
		{"mobs_mc_snowman.png^mobs_mc_snowman_pumpkin.png"},
	},
	gotten_texture = {"mobs_mc_snowman.png"},
	visual_size = {x = 3, y = 3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	makes_footstep_sound = true,
	shoot_interval = 1,
	shoot_offset = 1,
	attack_type = "shoot",
	arrow = "mobs_mc:snowball_entity",
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
	drops = mobs_mc.drops.snowman,

	do_custom = function(self, dtime)
		if not self._snowtimer then
			self._snowtimer = 0
			return
		end

		self._snowtimer = self._snowtimer + dtime

		if self.health > 0 and self._snowtimer > 0.5 then
			self._snowtimer = 0
			local pos = self.object:getpos()
			local below = {x = pos.x, y = pos.y-1, z = pos.z}
			local def = minetest.registered_nodes[minetest.get_node(pos).name]

			if def and def.buildable_to then
				local belowdef = minetest.registered_nodes[minetest.get_node(below).name]

				if belowdef and belowdef.walkable and (belowdef.node_box == nil or belowdef.node_box.type == "regular") then
					minetest.set_node(pos, {name = "default:snow"})
				end
			end
		end
	end,
})

mobs:register_arrow("mobs_mc:snowball_entity", {
	visual = "sprite",
	visual_size = {x = .5, y = .5},
	textures = {"mcl_throwing_snowball.png"},
	velocity = 19,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {},
		}, nil)
	end,

	hit_mob = function(self, mob)
		mob:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

})

mobs:register_egg("mobs_mc:snowman", S("Snow Golem"), "mobs_mc_spawn_icon_snowman.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.snowman then
	mobs:spawn(mobs_mc.spawns.snowman)
end
