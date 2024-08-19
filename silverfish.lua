local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
	passive = false,
	group_attack = true,
	reach = 1,
	hp_min = 8,
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.44, 0.4},
	visual = "mesh",
	mesh = "mobs_mc_silverfish.b3d",
	textures = {
		{"mobs_mc_silverfish.png"},
	},
	pathfinding = 1,
	visual_size = {x = 3, y = 3},
	sounds = {
		random = "mobs_mc_silverfish_idle",
		death = "mobs_mc_silverfish_death",
		damage = "mobs_mc_silverfish_hurt",
	},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	fear_height = 4,
	replace_rate = 10,
	fall_damage = true,
	replace_what = {
		{"default:stone", "mobs_mc:monster_egg_stone", -1},
		{"underch:afualite", "mobs_mc:monster_egg_afualite", -1},
		{"underch:amphibolite", "mobs_mc:monster_egg_amphibolite", -1},
		{"underch:andesite", "mobs_mc:monster_egg_andesite", -1},
		{"underch:aplite", "mobs_mc:monster_egg_aplite", -1},
		{"underch:basalt", "mobs_mc:monster_egg_basalt", -1},
		{"underch:dark_vindesite", "mobs_mc:monster_egg_dark_vindesite", -1},
		{"underch:diorite", "mobs_mc:monster_egg_diorite", -1},
		{"underch:dolomite", "mobs_mc:monster_egg_dolomite", -1},
		{"underch:emutite", "mobs_mc:monster_egg_emutite", -1},
		{"underch:gabbro", "mobs_mc:monster_egg_gabbro", -1},
		{"underch:gneiss", "mobs_mc:monster_egg_gneiss", -1},
		{"underch:granite", "mobs_mc:monster_egg_granite", -1},
		{"underch:green_slimestone", "mobs_mc:monster_egg_green_slimestone", -1},
		{"underch:hektorite", "mobs_mc:monster_egg_hektorite", -1},
		{"underch:limestone", "mobs_mc:monster_egg_limestone", -1},
		{"underch:marble", "mobs_mc:monster_egg_marble", -1},
		{"underch:omphyrite", "mobs_mc:monster_egg_omphyrite", -1},
		{"underch:pegmatite", "mobs_mc:monster_egg_pegmatite", -1},
		{"underch:peridotite", "mobs_mc:monster_egg_peridotite", -1},
		{"underch:phonolite", "mobs_mc:monster_egg_phonolite", -1},
		{"underch:phylite", "mobs_mc:monster_egg_phylite", -1},
		{"underch:purple_slimestone", "mobs_mc:monster_egg_purple_slimestone", -1},
		{"underch:quartzite", "mobs_mc:monster_egg_quartzite", -1},
		{"underch:red_slimestone", "mobs_mc:monster_egg_red_slimestone", -1},
		{"underch:schist", "mobs_mc:monster_egg_schist", -1},
		{"underch:sichamine", "mobs_mc:monster_egg_sichamine", -1},
		{"underch:slate", "mobs_mc:monster_egg_slate", -1},
		{"underch:vindesite", "mobs_mc:monster_egg_vindesite", -1},
	},
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 0,
		stand_end = 20,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
	},
	view_range = 16,
	attack_type = "dogfight",
	damage = 1,
	reach = 1,
	blood_amount = 0,
})

local spawn_silverfish = function(pos, oldnode, oldmetadata, digger)
	minetest.add_entity(pos, "mobs_mc:silverfish")
end

minetest.register_node("mobs_mc:monster_egg_stone", {
	description = S("Stone Monster Egg"),
	tiles = {"default_stone.png"},
	groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
	drop = '',
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	after_dig_node = spawn_silverfish,
})

local scarcity = 22 * 22 * 22

if minetest.get_mapgen_setting("mg_name") == "v6" then
	scarcity = 28 * 28 * 28
end

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mobs_mc:monster_egg_stone",
	wherein        = "default:stone",
	clust_scarcity = scarcity,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = 31000,
})

if minetest.registered_items["underch:afualite"] then
	minetest.register_node("mobs_mc:monster_egg_afualite", {
		description = S("Afualite Monster Egg"),
		tiles = {"underch_afualite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_afualite",
		wherein        = "underch:afualite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:amphibolite"] then
	minetest.register_node("mobs_mc:monster_egg_amphibolite", {
		description = S("Amphibolite Monster Egg"),
		tiles = {"underch_amphibolite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_amphibolite",
		wherein        = "underch:amphibolite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:andesite"] then
	minetest.register_node("mobs_mc:monster_egg_andesite", {
		description = S("Andesite Monster Egg"),
		tiles = {"underch_andesite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_andesite",
		wherein        = "underch:andesite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:aplite"] then
	minetest.register_node("mobs_mc:monster_egg_aplite", {
		description = S("Aplite Monster Egg"),
		tiles = {"underch_aplite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_aplite",
		wherein        = "underch:aplite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:basalt"] then
	minetest.register_node("mobs_mc:monster_egg_basalt", {
		description = S("Basalt Monster Egg"),
		tiles = {"underch_basalt.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_basalt",
		wherein        = "underch:basalt",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:dark_vindesite"] then
	minetest.register_node("mobs_mc:monster_egg_dark_vindesite", {
		description = S("Dark Vindesite Monster Egg"),
		tiles = {"underch_dark_vindesite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_dark_vindesite",
		wherein        = "underch:dark_vindesite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:diorite"] then
	minetest.register_node("mobs_mc:monster_egg_diorite", {
		description = S("Diorite Monster Egg"),
		tiles = {"underch_diorite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_diorite",
		wherein        = "underch:diorite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:dolomite"] then
	minetest.register_node("mobs_mc:monster_egg_dolomite", {
		description = S("Dolomite Monster Egg"),
		tiles = {"underch_dolomite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_dolomite",
		wherein        = "underch:dolomite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:emutite"] then
	minetest.register_node("mobs_mc:monster_egg_emutite", {
		description = S("Emutite Monster Egg"),
		tiles = {"underch_emutite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_emutite",
		wherein        = "underch:emutite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:gabbro"] then
	minetest.register_node("mobs_mc:monster_egg_gabbro", {
		description = S("Gabbro Monster Egg"),
		tiles = {"underch_gabbro.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_gabbro",
		wherein        = "underch:gabbro",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:gneiss"] then
	minetest.register_node("mobs_mc:monster_egg_gneiss", {
		description = S("Gneiss Monster Egg"),
		tiles = {"underch_gneiss.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_gneiss",
		wherein        = "underch:gneiss",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:granite"] then
	minetest.register_node("mobs_mc:monster_egg_granite", {
		description = S("Granite Monster Egg"),
		tiles = {"underch_granite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_granite",
		wherein        = "underch:granite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:green_slimestone"] then
	minetest.register_node("mobs_mc:monster_egg_green_slimestone", {
		description = S("Green Slimestone Monster Egg"),
		tiles = {"underch_green_slimestone.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_green_slimestone",
		wherein        = "underch:green_slimestone",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:hektorite"] then
	minetest.register_node("mobs_mc:monster_egg_hektorite", {
		description = S("Hektorite Monster Egg"),
		tiles = {"underch_hektorite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_hektorite",
		wherein        = "underch:hektorite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:limestone"] then
	minetest.register_node("mobs_mc:monster_egg_limestone", {
		description = S("Limestone Monster Egg"),
		tiles = {"underch_limestone.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_limestone",
		wherein        = "underch:limestone",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:marble"] then
	minetest.register_node("mobs_mc:monster_egg_marble", {
		description = S("Marble Monster Egg"),
		tiles = {"underch_marble.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_marble",
		wherein        = "underch:marble",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:omphyrite"] then
	minetest.register_node("mobs_mc:monster_egg_omphyrite", {
		description = S("Omphyrite Monster Egg"),
		tiles = {"underch_omphyrite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_omphyrite",
		wherein        = "underch:omphyrite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:pegmatite"] then
	minetest.register_node("mobs_mc:monster_egg_pegmatite", {
		description = S("Pegmatite Monster Egg"),
		tiles = {"underch_pegmatite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_pegmatite",
		wherein        = "underch:pegmatite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:peridotite"] then
	minetest.register_node("mobs_mc:monster_egg_peridotite", {
		description = S("Peridotite Monster Egg"),
		tiles = {"underch_peridotite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_peridotite",
		wherein        = "underch:peridotite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:phonolite"] then
	minetest.register_node("mobs_mc:monster_egg_phonolite", {
		description = S("Phonolite Monster Egg"),
		tiles = {"underch_phonolite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_phonolite",
		wherein        = "underch:phonolite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:phylite"] then
	minetest.register_node("mobs_mc:monster_egg_phylite", {
		description = S("Phylite Monster Egg"),
		tiles = {"underch_phylite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_phylite",
		wherein        = "underch:phylite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:purple_slimestone"] then
	minetest.register_node("mobs_mc:monster_egg_purple_slimestone", {
		description = S("Purple Slimestone Monster Egg"),
		tiles = {"underch_purple_slimestone.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_purple_slimestone",
		wherein        = "underch:purple_slimestone",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:quartzite"] then
	minetest.register_node("mobs_mc:monster_egg_quartzite", {
		description = S("Quartzite Monster Egg"),
		tiles = {"underch_quartzite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_quartzite",
		wherein        = "underch:quartzite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:red_slimestone"] then
	minetest.register_node("mobs_mc:monster_egg_red_slimestone", {
		description = S("Red Slimestone Monster Egg"),
		tiles = {"underch_red_slimestone.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_red_slimestone",
		wherein        = "underch:red_slimestone",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:schist"] then
	minetest.register_node("mobs_mc:monster_egg_schist", {
		description = S("Schist Monster Egg"),
		tiles = {"underch_schist.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_schist",
		wherein        = "underch:schist",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:sichamine"] then
	minetest.register_node("mobs_mc:monster_egg_sichamine", {
		description = S("Sichamine Monster Egg"),
		tiles = {"underch_sichamine.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_sichamine",
		wherein        = "underch:sichamine",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:slate"] then
	minetest.register_node("mobs_mc:monster_egg_slate", {
		description = S("Slate Monster Egg"),
		tiles = {"underch_slate.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_slate",
		wherein        = "underch:slate",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

if minetest.registered_items["underch:vindesite"] then
	minetest.register_node("mobs_mc:monster_egg_vindesite", {
		description = S("Vindesite Monster Egg"),
		tiles = {"underch_vindesite.png"},
		groups = {oddly_breakable_by_hand = 2, spawns_silverfish = 1},
		drop = '',
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		after_dig_node = spawn_silverfish,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs_mc:monster_egg_vindesite",
		wherein        = "underch:vindesite",
		clust_scarcity = scarcity,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = 31000,
	})
end

mobs:register_egg("mobs_mc:silverfish", S("Silverfish"), "mobs_mc_spawn_icon_silverfish.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.silverfish)
end
