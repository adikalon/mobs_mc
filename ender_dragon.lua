local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:enderdragon", {
	type = "monster",
	pathfinding = 1,
	attacks_animals = true,
	walk_chance = 100,
	hp_max = 200,
	hp_min = 200,
	collisionbox = {-2, 3, -2, 2, 5, 2},
	physical = false,
	visual = "mesh",
	mesh = "mobs_mc_dragon.b3d",
	textures = {
		{"mobs_mc_dragon.png"},
	},
	visual_size = {x = 3, y = 3},
	view_range = 35,
	walk_velocity = 6,
	run_velocity = 6,
	sounds = {
		shoot_attack = "mobs_mc_ender_dragon_shoot",
		attack = "mobs_mc_ender_dragon_attack",
		distance = 60,
	},
	physical = true,
	damage = 10,
	jump = true,
	jump_height = 14,
	stepheight = 1.2,
	jump_chance = 100,
	fear_height = 120,
	fly = true,
	fly_in = {"air"},
	dogshoot_switch = 1,
	dogshoot_count_max =5,
	dogshoot_count2_max = 5,
	passive = false,
	attack_animals = true,
	drops = mobs_mc.drops.enderdragon,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	arrow = "mobs_mc:fireball",
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		fly_speed = 8,
		stand_speed = 8,
		stand_start = 0,
		stand_end = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	blood_amount = 0,
	follow = mobs_mc.follows.enderdragon,
})

mobs:register_arrow("mobs_mc:fireball", {
	visual = "sprite",
	visual_size = {x = 1.5, y = 1.5},
	textures = {"mobs_mc_dragon_fireball.png"},
	velocity = 6,

	hit_player = function(self, player)
		minetest.sound_play("tnt_explode", {pos = player:getpos(), gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 6},
		}, nil)

	end,

	hit_mob = function(self, mob)
		minetest.sound_play("tnt_explode", {pos = mob:getpos(), gain = 1.5, max_hear_distance = 2*64})
		mob:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 12},
		}, nil)

	end,

	hit_node = function(self, pos, node)
		mobs:explosion(pos, 3, 0, 1)
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
	end
})

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.enderdragon)
end

mobs:register_egg("mobs_mc:enderdragon", S("Ender Dragon"), "mobs_mc_spawn_icon_dragon.png", 0)
