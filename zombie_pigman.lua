local S = minetest.get_translator(minetest.get_current_modname())

local zombie_pigman = {
	type = "monster",
	passive = false,
	hp_min = 20,
	hp_max = 20,
	armor = 90,
	attack_type = "dogfight",
	group_attack = true,
	damage = 9,
	reach = 2,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_zombie_pigman.b3d",
	textures = {
		{"mobs_mc_zombie_pigman.png^mobs_mc_zombie_pigman_sword.png"},
	},
	visual_size = {x = 3, y = 3},
	sounds = {
		random = "mobs_mc_zombiepig_random",
		war_cry = "mobs_mc_zombiepig_war_cry",
		damage = "mobs_mc_zombiepig_hurt",
		death = "mobs_mc_zombiepig_death",
		distance = 16,
	},
	jump = true,
	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 2.6,
	pathfinding = 1,
	drops = mobs_mc.drops.zombie_pigman,
	animation = {
		stnd_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		punch_speed = 25,
		stand_start = 40,
		stand_end = 80,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 90,
		punch_end = 130,
	},
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	fear_height = 4,
	view_range = 16,
	fall_damage = true,
}

local baby_zombie_pigman = table.copy(zombie_pigman)
baby_zombie_pigman.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby_zombie_pigman.visual_size = {x = zombie_pigman.visual_size.x/2, y = zombie_pigman.visual_size.y/2}
baby_zombie_pigman.textures = {{"mobs_mc_zombie_pigman.png"}}
baby_zombie_pigman.walk_velocity = 1.2
baby_zombie_pigman.run_velocity = 2.4
baby_zombie_pigman.light_damage = 0
baby_zombie_pigman.drops = mobs_mc.drops.baby_zombie_pigman,

mobs:register_mob("mobs_mc:zombie_pigman", zombie_pigman)
mobs:register_mob("mobs_mc:baby_pigman", baby_zombie_pigman)
mobs:register_egg("mobs_mc:zombie_pigman", S("Zombie Pigman"), "mobs_mc_spawn_icon_zombie_pigman.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.zombie_pigman)
	mobs:spawn(mobs_mc.spawns.baby_zombie_pigman)
end
