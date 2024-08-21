local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:wither", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	hp_max = 300,
	hp_min = 300,
	armor = 80,
	collisionbox = {-0.9, 0.4, -0.9, 0.9, 2.45, 0.9},
	visual = "mesh",
	mesh = "mobs_mc_wither.b3d",
	textures = {
		{"mobs_mc_wither.png"},
	},
	visual_size = {x = 4, y = 4},
	makes_footstep_sound = true,
	view_range = 16,
	fear_height = 4,
	walk_velocity = 2,
	run_velocity = 4,
	stepheight = 1.2,
	sounds = {
		shoot_attack = "mobs_mc_ender_dragon_shoot",
		attack = "mobs_mc_ender_dragon_attack",
	},
	jump = true,
	jump_height = 10,
	jump_chance = 98,
	fly = true,
	dogshoot_switch = 1,
	dogshoot_count_max = 1,
	passive = false,
	floats = 1,
	drops = mobs_mc.drops.wither,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 20,
	attack_type = "dogshoot",
	explosion_radius = 3,
	explosion_fire = false,
	dogshoot_stop = true,
	arrow = "mobs_mc:fireball",
	reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		walk_speed = 12,
		run_speed = 12,
		stand_speed = 12,
		stand_start = 0,
		stand_end = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	blood_amount = 0,
})

mobs:register_arrow("mobs_mc:fireball", {
	visual = "sprite",
	visual_size = {x = 0.75, y = 0.75},
	textures = {"mobs_mc_wither_fireball.png"},
	velocity = 6,

	hit_player = function(self, player)
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 16})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 16})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)

	end,

	hit_node = function(self, pos, node)
		mobs:explosion(pos, 3, 0, 1)
	end,
})

mobs:register_egg("mobs_mc:wither", S("Wither"), "mobs_mc_spawn_icon_wither.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.wither then
	mobs:spawn(mobs_mc.spawns.wither)
end
