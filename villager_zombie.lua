local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:villager_zombie", {
	type = "monster",
	passive = false,
	hp_min = 20,
	hp_max = 20,
	armor = 90,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_villager_zombie.b3d",
	textures = {
		{"mobs_mc_zombie_butcher.png"},
		{"mobs_mc_zombie_farmer.png"},
		{"mobs_mc_zombie_librarian.png"},
		{"mobs_mc_zombie_priest.png"},
		{"mobs_mc_zombie_smith.png"},
		{"mobs_mc_zombie_villager.png"}
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	damage = 3,
	reach = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	attack_type = "dogfight",
	group_attack = true,
	drops = mobs_mc.drops.villager_zombie,
	sounds = {
		random = "mobs_mc_zombie_growl",
		war_cry = "mobs_mc_zombie_growl",
		death = "mobs_mc_zombie_death",
		damage = "mobs_mc_zombie_hurt",
	},
	animation = {
		speed_normal = 25,
        speed_run = 50,
		stand_start = 20,
        stand_end = 40,
		walk_start = 0,
        walk_end = 20,
		run_start = 0,
        run_end = 20,
	},
	water_damage = 0.01,
	lava_damage = 5,
	light_damage = 2,
	view_range = 16,
	fear_height = 5,
	fall_damage = true,
	stay_near = {{"mg_villages:mob_spawner"}, 5},
})

mobs:register_egg("mobs_mc:villager_zombie", S("Zombie Villager"), "mobs_mc_spawn_icon_zombie_villager.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.villager_zombie)
end
