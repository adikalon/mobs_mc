mobs:register_mob("mobs_mc:shulker", {
	type = "monster",
	attack_animals = false,
	attack_npcs = true,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_mc:shulkerbullet",
	shoot_offset = 0.5,
	passive = false,
	hp_min = 30,
	hp_max = 30,
	armor = 150,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.99, 0.5},
	visual = "mesh",
	mesh = "mobs_mc_shulker.b3d",
	textures = {
		{"mobs_mc_shulker.png"},
		{"mobs_mc_shulker_black.png"},
		{"mobs_mc_shulker_blue.png"},
		{"mobs_mc_shulker_brown.png"},
		{"mobs_mc_shulker_cyan.png"},
		{"mobs_mc_shulker_gray.png"},
		{"mobs_mc_shulker_green.png"},
		{"mobs_mc_shulker_light_blue.png"},
		{"mobs_mc_shulker_lime.png"},
		{"mobs_mc_shulker_magenta.png"},
		{"mobs_mc_shulker_orange.png"},
		{"mobs_mc_shulker_pink.png"},
		{"mobs_mc_shulker_purple.png"},
		{"mobs_mc_shulker_red.png"},
		{"mobs_mc_shulker_silver.png"},
		{"mobs_mc_shulker_white.png"},
		{"mobs_mc_shulker_yellow.png"},
	},
	visual_size = {x = 2.7, y = 2.7},
	walk_chance = 0,
	jump = false,
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		punch_speed = 25,
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 45,
		walk_start = 0,
		walk_end = 45,
		run_start = 0,
		run_end = 45,
        punch_start = 80,
		punch_end = 100,
	},
	blood_amount = 0,
	view_range = 16,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	fall_damage = true,
	drops = mobs_mc.drops.shulker,
})

mobs:register_arrow("mobs_mc:shulkerbullet", {
	visual = "sprite",
	visual_size = {x = 0.25, y = 0.25},
	textures = {"mobs_mc_shulkerbullet.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 4},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 4},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})


mobs:register_egg("mobs_mc:shulker", mobs_mc.S("Shulker"), "mobs_mc_spawn_icon_shulker.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.shulker then
	mobs:spawn(mobs_mc.spawns.shulker)
end
