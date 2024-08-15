local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:killer_bunny", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	specific_attack = mobs_mc.attacks.killer_bunny,
	attacks_monsters = true,
	attack_players = true,
	damage = 8,
	armor = 50,
	textures = {"mobs_mc_killer_bunny_caerbannog.png"},
	view_range = 16,
	replace_rate = nil,
	replace_what = mobs_mc.replaces.killer_bunny,
	on_rightclick = nil,
	run_velocity = 6,
	reach = 1,
	hp_min = 3,
	hp_max = 3,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.49, 0.2},
	visual = "mesh",
	mesh = "mobs_mc_killer_bunny.b3d",
	visual_size = {x=1.5, y=1.5},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	floats = 1,
	runaway = true,
	jump = true,
	drops = mobs_mc.drops.killer_bunny,
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	follow = mobs_mc.follows.killer_bunny,
})

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.killer_bunny)
end

mobs:register_egg("mobs_mc:killer_bunny", S("Killer Bunny"), "mobs_mc_spawn_icon_killer_bunny.png", 0)
