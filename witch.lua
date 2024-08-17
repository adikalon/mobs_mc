local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:witch", {
	type = "monster",
	hp_min = 26,
	hp_max = 26,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_witch.b3d",
	textures = {
		{"mobs_mc_witch.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	damage = 2,
	reach = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	pathfinding = 1,
	group_attack = true,
	attack_type = "dogshoot",
	arrow = "mobs_mc:potion_arrow",
	shoot_interval = 2.5,
	shoot_offset = 1,
	dogshoot_switch = 1,
	dogshoot_count_max =1.8,
	max_drops = 3,
	drops = mobs_mc.drops.witch,
	animation = {
		speed_normal = 30,
		speed_run = 60,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		hurt_start = 85,
		hurt_end = 115,
		death_start = 117,
		death_end = 145,
		shoot_start = 50,
		shoot_end = 82,
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
	fear_height = 4,
})

mobs:register_arrow("mobs_mc:potion_arrow", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"vessels_glass_bottle.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})

mobs:register_egg("mobs_mc:witch", S("Witch"), "mobs_mc_spawn_icon_witch.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.witch)
end
