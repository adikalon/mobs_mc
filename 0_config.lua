-- HEIGHTS
mobs_mc.height = {
	min = -31000,
	max = 31000,
	nether_min = nil,
	nether_max = nil,
	floatlands_min = nil,
	-- floatlands_max = 31000,
}

if minetest.get_modpath("nether") then
	mobs_mc.height.min = nether.FLOOR_CEILING
	mobs_mc.height.nether_min = nether.FLOOR_CEILING
	mobs_mc.height.nether_max = nether.DEPTH_CEILING
end

if minetest.get_modpath("cloudlands") then
	mobs_mc.height.floatlands_min = tonumber(minetest.settings:get("cloudlands_altitude")) or 200
end

if minetest.get_mapgen_setting("mg_name") == "v7" then
	local mgv7_spflags = minetest.get_mapgen_setting("mgv7_spflags")
	local captures_float = string.match(mgv7_spflags, "floatlands")
	local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")

	if not captures_nofloat and captures_float and mobs_mc.height.floatlands_min and mobs_mc.height.floatlands_min > 1280 then
		mobs_mc.height.floatlands_min = 1280
	end
end

if mobs_mc.height.floatlands_min then
	mobs_mc.height.max = mobs_mc.height.floatlands_min
end

mobs_mc.create_monster_egg_nodes = true

-- ITEMS
mobs_mc.items = {
	rabbit_raw = (minetest.registered_items["mobs:rabbit_raw"] and "mobs:rabbit_raw" or nil),
	rabbit_hide = (minetest.registered_items["mobs:rabbit_hide"] and "mobs:rabbit_hide" or nil),
	bucket_milk = (minetest.registered_items["mobs:bucket_milk"] and "mobs:bucket_milk" or nil),
	wooden_bucket_milk = (minetest.registered_items["mobs:wooden_bucket_milk"] and "mobs:wooden_bucket_milk" or nil),
	pork_raw = (minetest.registered_items["mobs:pork_raw"] and "mobs:pork_raw" or nil),
	carrot = (minetest.registered_items["farming:carrot"] and "farming:carrot" or nil),
	bone = (minetest.registered_items["bonemeal:bone"] and "bonemeal:bone" or nil),
	potato = (minetest.registered_items["farming:potato"] and "farming:potato" or nil),
	lava_orb = (minetest.registered_items["mobs:lava_orb"] and "mobs:lava_orb" or nil),
	rawfish = (minetest.registered_items["animalworld:rawfish"] and "animalworld:rawfish" or nil),
	raw_exotic_fish = (minetest.registered_items["marinaramobs:raw_exotic_fish"] and "marinaramobs:raw_exotic_fish" or nil),
	catfish_raw = (minetest.registered_items["nativevillages:catfish_raw"] and "nativevillages:catfish_raw" or nil),
	fish_edible = (minetest.registered_items["xocean:fish_edible"] and "xocean:fish_edible" or nil),
	leather = (minetest.registered_items["mobs:leather"] and "mobs:leather" or nil),
}

-- FOLLOWS
mobs_mc.follows = {
	baby_husk = {},
	baby_pigman = {},
	baby_zombie = {},
	blaze = {},
	creeper = {},
	cave_spider = {},
	dog = {"mobs:meat", "mobs:meat_raw", "bonemeal:bone"},
	donkey = {"farming:wheat", "default:apple", "farming:oat", "farming:barley", "farming:corn"},
	enderman = {},
	endermite = {},
	ghast = {},
	guardian = {},
	guardian_elder = {},
	iron_golem = {},
	husk = {},
	killer_bunny = {"flowers:dandelion_yellow", "flowers:dandelion_yellow", "group:grass", "farming:carrot", "farming:carrot_gold"},
	llama = {"farming:wheat", "default:apple", "farming:oat", "farming:barley", "farming:corn"},
	magma_cube_tiny = {},
	magma_cube_small = {},
	magma_cube_big = {},
	mooshroom = {"farming:wheat", "default:grass_1", "farming:barley", "farming:oat", "farming:rye"},
	mule = {"farming:wheat", "default:apple", "farming:oat", "farming:barley", "farming:corn"},
	ocelot = {"fishing:fish_raw"},
	pig = {"default:apple", "mobs_mc:carrot_on_a_stick"},
	pigman = {},
	shulker = {},
	silverfish = {},
	skeleton_horse = {},
	slime_tiny = {},
	slime_small = {},
	slime_big = {},
	snowman = {},
	spider = {},
	squid = {},
	vex = {},
	evoker = {},
	illusioner = {},
	vindicator = {},
	villager_zombie = {},
	villager = {},
	witch = {},
	wither = {},
	zombie_horse = {},
	zombie = {},
}

if mobs_mc.items.potato then
	table.insert(mobs_mc.follows.pig, mobs_mc.items.potato)
end

if mobs_mc.items.carrot then
	table.insert(mobs_mc.follows.pig, mobs_mc.items.carrot)
end

-- SPAWN NODES
mobs_mc.spawn_nodes = {
	baby_husk = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	baby_pigman = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	baby_zombie = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	blaze = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	creeper = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	cave_spider = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	dog = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	donkey = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	enderman = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	endermite = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	ghast = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	guardian = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	guardian_elder = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	iron_golem = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	husk = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	killer_bunny = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	llama = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	magma_cube_tiny = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	magma_cube_small = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	magma_cube_big = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	mooshroom = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	mule = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	ocelot = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	pig = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	pigman = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	shulker = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	silverfish = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	skeleton_horse = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	slime_tiny = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	slime_small = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	slime_big = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	snowman = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	spider = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	squid = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	vex = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	evoker = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	illusioner = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	vindicator = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	villager_zombie = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	villager = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	witch = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	wither = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	zombie_horse = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
	zombie = {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"},
}

-- REPLACE
mobs_mc.replaces = {
	baby_husk = {},
	baby_pigman = {},
	baby_zombie = {},
	blaze = {},
	creeper = {},
	cave_spider = {},
	dog = {},
	donkey = {},
	enderman = {},
	endermite = {},
	ghast = {},
	guardian = {},
	guardian_elder = {},
	iron_golem = {},
	husk = {},
	killer_bunny = {},
	llama = {},
	magma_cube_tiny = {},
	magma_cube_small = {},
	magma_cube_big = {},
	mooshroom = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1},
	},
	mule = {},
	ocelot = {},
	pig = {},
	pigman = {},
	shulker = {},
	silverfish = {
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
	skeleton_horse = {},
	slime_tiny = {},
	slime_small = {},
	slime_big = {},
	snowman = {},
	spider = {},
	squid = {},
	vex = {},
	evoker = {},
	illusioner = {},
	vindicator = {},
	villager_zombie = {},
	villager = {},
	witch = {},
	wither = {},
	zombie_horse = {},
	zombie = {},
}

-- ATTACKS
mobs_mc.attacks = {
	baby_husk = {},
	baby_pigman = {},
	baby_zombie = {},
	blaze = {},
	creeper = {},
	cave_spider = {},
	dog = {},
	donkey = {},
	enderman = {},
	endermite = {},
	ghast = {},
	guardian = {},
	guardian_elder = {},
	iron_golem = {},
	husk = {},
	killer_bunny = {"player", "animalworld:wolf"},
	llama = {},
	magma_cube_tiny = {},
	magma_cube_small = {},
	magma_cube_big = {},
	mooshroom = {},
	mule = {},
	ocelot = {"mobs_animal:chicken", "mobs_animal:rat", "animalworld:rat"},
	pig = {},
	pigman = {},
	shulker = {},
	silverfish = {},
	skeleton_horse = {},
	slime_tiny = {},
	slime_small = {},
	slime_big = {},
	snowman = {},
	spider = {},
	squid = {},
	vex = {},
	evoker = {},
	illusioner = {},
	vindicator = {},
	villager_zombie = {},
	villager = {},
	witch = {},
	wither = {},
	zombie_horse = {},
	zombie = {},
}

-- DROPS
mobs_mc.drops = {
	baby_husk = {},
	baby_pigman = {},
	baby_zombie = {},
	blaze = {},
	creeper = {
		{
			name = "tnt:gunpowder",
			chance = 1,
			min = 0,
			max = 2,
		},
		{
			name = "mobs_mc:head_creeper",
			chance = 200,
			min = 1,
			max = 1,
		},
	},
	cave_spider = {},
	dog = {},
	donkey = {
		{
			name = "mobs:meat_raw",
			chance = 1,
			min = 1,
			max = 3
		},
		{
			name = "mobs:leather",
			chance = 1,
			min = 0,
			max = 2
		},
	},
	enderman = {},
	endermite = {},
	ghast = {
		{
			name = "tnt:gunpowder",
			chance = 1,
			min = 0,
			max = 2,
		}
	},
	guardian = {
		{
			name = "default:mese_crystal_fragment",
			chance = 1,
			min = 0,
			max = 2,
		},
		{
			name = "default:gold_block",
			chance = 1,
			min = 1,
			max = 1,
		},
		{
			name = "default:mese_crystal",
			chance = 4,
			min = 1,
			max = 1,
		},
	},
	guardian_elder = {
		{
			name = "default:mese_crystal_fragment",
			chance = 1,
			min = 0,
			max = 2,
		},
		{
			name = "default:gold_block",
			chance = 1,
			min = 1,
			max = 1,
		},
		{
			name = "default:mese_crystal",
			chance = 4,
			min = 1,
			max = 1,
		},
	},
	iron_golem = {
		{
			name = "default:steel_ingot",
			chance = 1,
			min = 3,
			max = 5,
		},
		{
			name = "flowers:rose",
			chance = 1,
			min = 0,
			max = 2,
		},
	},
	husk = {},
	killer_bunny = {},
	llama = {},
	magma_cube_tiny = {},
	magma_cube_small = {},
	magma_cube_big = {},
	mooshroom = {
		{
			name = "flowers:mushroom_brown",
			chance = 1,
			min = 0,
			max = 2,
		},
		{
			name = "mobs:meat_raw",
			chance = 1,
			min = 1,
			max = 3
		},
		{
			name = "mobs:leather",
			chance = 1,
			min = 0,
			max = 2
		},
	},
	mule = {
		{
			name = "mobs:meat_raw",
			chance = 1,
			min = 1,
			max = 3
		},
		{
			name = "mobs:leather",
			chance = 1,
			min = 0,
			max = 2
		},
	},
	ocelot = {},
	pig = {},
	pigman = {},
	shulker = {},
	silverfish = {},
	skeleton_horse = {},
	slime_tiny = {},
	slime_small = {},
	slime_big = {},
	snowman = {},
	spider = {},
	squid = {},
	vex = {},
	evoker = {},
	illusioner = {},
	vindicator = {},
	villager_zombie = {},
	villager = {},
	witch = {},
	wither = {},
	zombie_horse = {},
	zombie = {},
}

if mobs_mc.items.lava_orb then
	table.insert(mobs_mc.drops.blaze, {name = mobs_mc.items.lava_orb, chance = 15, min = 1, max = 1})
end

if mobs_mc.items.rawfish then
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.rawfish, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.raw_exotic_fish then
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.raw_exotic_fish, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.catfish_raw then
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.catfish_raw, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.fish_edible then
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.fish_edible, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.rabbit_raw then
	table.insert(mobs_mc.drops.killer_bunny, {name = mobs_mc.items.rabbit_raw, chance = 1, min = 1, max = 1})
end

if mobs_mc.items.rabbit_hide then
	table.insert(mobs_mc.drops.killer_bunny, {name = mobs_mc.items.rabbit_hide, chance = 1, min = 0, max = 1})
end

if mobs_mc.items.leather then
	table.insert(mobs_mc.drops.llama, {name = mobs_mc.items.leather, chance = 1, min = 0, max = 2})
end

if mobs_mc.items.pork_raw then
	table.insert(mobs_mc.drops.pig, {name = mobs_mc.items.pork_raw, chance = 1, min = 1, max = 1})
end

-- SPAWNS
mobs_mc.spawns = {
	baby_husk = {
		name = "mobs_mc:baby_husk",
		nodes = mobs_mc.spawn_nodes.baby_husk,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	baby_pigman = {
		name = "mobs_mc:baby_pigman",
		nodes = mobs_mc.spawn_nodes.baby_pigman,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	baby_zombie = {
		name = "mobs_mc:baby_zombie",
		nodes = mobs_mc.spawn_nodes.baby_zombie,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	blaze = {
		name = "mobs_mc:blaze",
		nodes = mobs_mc.spawn_nodes.blaze,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	creeper = {
		name = "mobs_mc:creeper",
		nodes = mobs_mc.spawn_nodes.creeper,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	cave_spider = {
		name = "mobs_mc:cave_spider",
		nodes = mobs_mc.spawn_nodes.cave_spider,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	dog = {
		name = "mobs_mc:dog",
		nodes = mobs_mc.spawn_nodes.dog,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	donkey = {
		name = "mobs_mc:donkey",
		nodes = mobs_mc.spawn_nodes.donkey,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	enderman = {
		name = "mobs_mc:enderman",
		nodes = mobs_mc.spawn_nodes.enderman,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	endermite = {
		name = "mobs_mc:endermite",
		nodes = mobs_mc.spawn_nodes.endermite,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	ghast = {
		name = "mobs_mc:ghast",
		nodes = mobs_mc.spawn_nodes.ghast,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	guardian = {
		name = "mobs_mc:guardian",
		nodes = mobs_mc.spawn_nodes.guardian,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	guardian_elder = {
		name = "mobs_mc:guardian_elder",
		nodes = mobs_mc.spawn_nodes.guardian_elder,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	iron_golem = {
		name = "mobs_mc:iron_golem",
		nodes = mobs_mc.spawn_nodes.iron_golem,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	husk = {
		name = "mobs_mc:husk",
		nodes = mobs_mc.spawn_nodes.husk,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	killer_bunny = {
		name = "mobs_mc:killer_bunny",
		nodes = mobs_mc.spawn_nodes.killer_bunny,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	llama = {
		name = "mobs_mc:llama",
		nodes = mobs_mc.spawn_nodes.llama,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	magma_cube_tiny = {
		name = "mobs_mc:magma_cube_tiny",
		nodes = mobs_mc.spawn_nodes.magma_cube_tiny,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	magma_cube_small = {
		name = "mobs_mc:magma_cube_small",
		nodes = mobs_mc.spawn_nodes.magma_cube_small,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	magma_cube_big = {
		name = "mobs_mc:magma_cube_big",
		nodes = mobs_mc.spawn_nodes.magma_cube_big,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	mooshroom = {
		name = "mobs_mc:mooshroom",
		nodes = mobs_mc.spawn_nodes.mooshroom,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	mule = {
		name = "mobs_mc:mule",
		nodes = mobs_mc.spawn_nodes.mule,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	ocelot = {
		name = "mobs_mc:ocelot",
		nodes = mobs_mc.spawn_nodes.ocelot,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	pig = {
		name = "mobs_mc:pig",
		nodes = mobs_mc.spawn_nodes.pig,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	pigman = {
		name = "mobs_mc:pigman",
		nodes = mobs_mc.spawn_nodes.pigman,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	shulker = {
		name = "mobs_mc:shulker",
		nodes = mobs_mc.spawn_nodes.shulker,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	silverfish = {
		name = "mobs_mc:silverfish",
		nodes = mobs_mc.spawn_nodes.silverfish,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	skeleton_horse = {
		name = "mobs_mc:skeleton_horse",
		nodes = mobs_mc.spawn_nodes.skeleton_horse,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	slime_tiny = {
		name = "mobs_mc:slime_tiny",
		nodes = mobs_mc.spawn_nodes.slime_tiny,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	slime_small = {
		name = "mobs_mc:slime_small",
		nodes = mobs_mc.spawn_nodes.slime_small,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	slime_big = {
		name = "mobs_mc:slime_big",
		nodes = mobs_mc.spawn_nodes.slime_big,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	snowman = {
		name = "mobs_mc:snowman",
		nodes = mobs_mc.spawn_nodes.snowman,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	spider = {
		name = "mobs_mc:spider",
		nodes = mobs_mc.spawn_nodes.spider,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	squid = {
		name = "mobs_mc:squid",
		nodes = mobs_mc.spawn_nodes.squid,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	vex = {
		name = "mobs_mc:vex",
		nodes = mobs_mc.spawn_nodes.vex,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	evoker = {
		name = "mobs_mc:evoker",
		nodes = mobs_mc.spawn_nodes.evoker,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	illusioner = {
		name = "mobs_mc:illusioner",
		nodes = mobs_mc.spawn_nodes.illusioner,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	vindicator = {
		name = "mobs_mc:vindicator",
		nodes = mobs_mc.spawn_nodes.vindicator,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	villager_zombie = {
		name = "mobs_mc:villager_zombie",
		nodes = mobs_mc.spawn_nodes.villager_zombie,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	villager = {
		name = "mobs_mc:villager",
		nodes = mobs_mc.spawn_nodes.villager,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	witch = {
		name = "mobs_mc:witch",
		nodes = mobs_mc.spawn_nodes.witch,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	wither = {
		name = "mobs_mc:wither",
		nodes = mobs_mc.spawn_nodes.wither,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	zombie_horse = {
		name = "mobs_mc:zombie_horse",
		nodes = mobs_mc.spawn_nodes.zombie_horse,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
	zombie = {
		name = "mobs_mc:zombie",
		nodes = mobs_mc.spawn_nodes.zombie,
		neighbors = {"air"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true
	},
}
