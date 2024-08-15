local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:blaze", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.79, 0.3},
	rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_blaze.b3d",
	textures = {
		{"mobs_mc_blaze.png"},
	},
	visual_size = {x = 3, y = 3},
	sounds = {
		random = "mobs_mc_blaze_breath",
		death = "mobs_mc_blaze_died",
		damage = "mobs_mc_blaze_hurt",
		distance = 16,
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 6,
	reach = 2,
	pathfinding = 1,
	drops = mobs_mc.drops.blaze,
	animation = {
		stand_start = 1,
		stand_end = 40,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
		shoot_start = 1,
		shoot_end = 40,
	},
	water_damage = 2,
	lava_damage = 0,
	fall_damage = 0,
	fall_speed = -2.25,
	light_damage = 0,
	view_range = 16,
	attack_type = "dogshoot",
	arrow = "mobs_mc:blaze_fireball",
	shoot_interval = 3.5,
	passive = false,
	jump = true,
	jump_height = 4,
	fly = true,
	jump_chance = 98,
	fear_height = 120,
	blood_amount = 0,
	follow = mobs_mc.follows.blaze,
	replace_what = mobs_mc.replaces.blaze,
	specific_attack = mobs_mc.attacks.blaze,
	glow = 10,
})

mobs:register_arrow("mobs_mc:blaze_fireball", {
	visual = "sprite",
	visual_size = {x = 0.3, y = 0.3},
	textures = {"mcl_fire_fire_charge.png"},
	velocity = 12,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 5},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 5},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		if node.name == "air" then
			minetest.set_node(pos_above, {"fire:basic_flame"})
		else
			local v = self.object:getvelocity()
			v = vector.normalize(v)
			local crashpos = vector.subtract(pos, v)
			local crashnode = minetest.get_node(crashpos)
			-- Set fire if node is air, or a replacable flammable node (e.g. a plant)
			if crashnode.name == "air" or
					(minetest.registered_nodes[crashnode.name].buildable_to and minetest.get_item_group(crashnode.name, "flammable") >= 1) then
				minetest.set_node(crashpos, {name = "fire:basic_flame"})
			end
		end
	end
})

mobs:register_egg("mobs_mc:blaze", S("Blaze"), "mobs_mc_spawn_icon_blaze.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.blaze)
end
