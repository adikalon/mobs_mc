local zombie = {
	type = "monster",
	attack_animals = false,
	attack_npcs = true,
	hp_min = 20,
	hp_max = 20,
	armor = 90,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_zombie.b3d",
	textures = {
		{"mobs_mc_zombie.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_mc_zombie_growl",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 3,
	reach = 2,
	pathfinding = 1,
	jump = true,
	group_attack = true,
	drops = mobs_mc.drops.zombie,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 40,
		stand_end = 80,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	lava_damage = 4,
	light_damage = 2,
	view_range = 16,
	water_damage = 0.01,
	fall_damage = true,
	attack_type = "dogfight",
}

local baby_zombie = table.copy(zombie)
baby_zombie.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby_zombie.visual_size = {x = zombie.visual_size.x/2, y = zombie.visual_size.y/2}
baby_zombie.walk_velocity = 1.2
baby_zombie.run_velocity = 2.4
baby_zombie.drops = mobs_mc.drops.baby_zombie,

mobs:register_mob("mobs_mc:zombie", zombie)
mobs:register_mob("mobs_mc:baby_zombie", baby_zombie)
mobs:register_egg("mobs_mc:zombie", mobs_mc.S("Zombie"), "mobs_mc_spawn_icon_zombie.png", 0)

if not mobs_mc.custom_spawn then
	if mobs_mc.spawns.zombie then
		mobs:spawn(mobs_mc.spawns.zombie)
	end

	if mobs_mc.spawns.baby_zombie then
		mobs:spawn(mobs_mc.spawns.baby_zombie)
	end
end
