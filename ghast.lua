mobs:register_mob("mobs_mc:ghast", {
	type = "monster",
	attack_animals = false,
	attack_npcs = true,
	pathfinding = 1,
	hp_min = 100,
	hp_max = 100,
	collisionbox = {-2, 5, -2, 2, 9, 2},
	visual = "mesh",
	mesh = "mobs_mc_ghast.b3d",
	textures = {
		{"mobs_mc_ghast.png"},
	},
	visual_size = {x = 12, y = 12},
	sounds = {
		shoot = "mobs_fireball",
		death = "mobs_mc_zombie_death",
		damage = "ghast_damage",
		attack = "mobs_fireball",
		random = "mobs_eerie",
	},
	walk_velocity = 1.6,
	run_velocity = 3.2,
	drops = mobs_mc.drops.ghast,
	animation = {
		stand_speed = 50,
		walk_speed = 50,
		run_speed = 50,
		stand_start = 0,
		stand_end = 40,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	lava_damage = 0,
	light_damage = 2,
	fall_damage = 0,
	view_range = 100,
	attack_type = "dogshoot",
	arrow = "mobs_monster:fireball",
	shoot_interval = 3.5,
	shoot_offset = 1,
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	passive = false,
	jump = true,
	jump_height = 4,
	floats = 1,
	fly = true,
	fly_in = {"air"},
	jump_chance = 1,
	blood_amount = 0,
	glow = 10,
})

mobs:register_arrow(":mobs_monster:fireball", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mcl_fire_fire_charge.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})

mobs:register_egg("mobs_mc:ghast", mobs_mc.S("Ghast"), "mobs_mc_spawn_icon_ghast.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.ghast then
	mobs:spawn(mobs_mc.spawns.ghast)
end
