mobs:register_mob("mobs_mc:parrot", {
	type = "animal",
	pathfinding = 1,
	hp_min = 6,
	hp_max = 6,
	collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.89, 0.25},
	visual = "mesh",
	mesh = "mobs_mc_parrot.b3d",
	textures = {
		{"mobs_mc_parrot_blue.png"},
		{"mobs_mc_parrot_green.png"},
		{"mobs_mc_parrot_grey.png"},
		{"mobs_mc_parrot_red_blue.png"},
		{"mobs_mc_parrot_yellow_blue.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 5,
	sounds = {
		random = "mobs_mc_parrot_random",
		damage = "mobs_mc_parrot_hurt",
		death = "mobs_mc_parrot_death",
	},
	drops = mobs_mc.drops.parrot,
	animation = {
		stand_speed = 50,
		walk_speed = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 130,
	},
	walk_chance = 100,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -2.25,
	attack_type = "dogfight",
	jump = true,
	jump_height = 4,
	floats = 1,
	physical = true,
	fly = true,
	fly_in = {"air"},
	view_range = 16,
	stay_near = {{"aqua_farming:alga_seed", "aqua_farming:sea_anemone_seed", "aqua_farming:sea_cucumber_seed", "aqua_farming:sea_grass_seed", "aqua_farming:sea_strawberry_seed", "aqua_farming:sponge_seed", "df_farming:cave_wheat_seed", "df_farming:dimple_cup_seed", "df_farming:pig_tail_seed", "df_farming:sweet_pod_seed", "farming:seed_barley", "farming:seed_cotton", "farming:seed_hemp", "farming:seed_mint", "farming:seed_oat", "farming:seed_rice", "farming:seed_rye", "farming:seed_sunflower", "farming:seed_wheat", "farming:sunflower_seeds_toasted"}, 5},
	follow = mobs_mc.follows.parrot,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 5, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 50, 80, false, nil) then return end
	end,
})

mobs:register_egg("mobs_mc:parrot", mobs_mc.S("Parrot"), "mobs_mc_spawn_icon_parrot.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.parrot then
	mobs:spawn(mobs_mc.spawns.parrot)
end
