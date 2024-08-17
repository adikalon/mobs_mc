local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:villager", {
	type = "npc",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_villager.b3d",
	textures = {
		{
			"mobs_mc_villager.png",
		},
		{
			"mobs_mc_villager_farmer.png",
		},
		{
			"mobs_mc_villager_priest.png",
		},
		{
			"mobs_mc_villager_librarian.png",
		},
		{
			"mobs_mc_villager_butcher.png",
		},
		{
			"mobs_mc_villager_smith.png",
		},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	drops = mobs_mc.drops.villager,
	sounds = {
		random = "mobs_mc_villager",
		damage = "mobs_mc_villager_hurt",
	},
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		stand_start = 40,
		stand_end = 59,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	view_range = 16,
	fear_height = 4,
})

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.villager)
end

mobs:register_egg("mobs_mc:villager", S("Villager"), "mobs_mc_spawn_icon_villager.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.villager)
end
