-- HEIGHTS
mobs_mc.height = {
	water = tonumber(minetest.setting_get("water_level")) or 0,
	min = -31000,
	max = 31000,
	nether_min = nil,
	nether_max = nil,
	floatlands_min = nil,
	-- floatlands_max = 31000,
}

if minetest.get_modpath("nether") then
	mobs_mc.height.min = nether.DEPTH_CEILING
	mobs_mc.height.nether_min = nether.DEPTH_FLOOR
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

-- ITEMS
mobs_mc.items = {
	pork_raw = (minetest.registered_items["mobs:pork_raw"] and "mobs:pork_raw" or nil),
	carrot = (minetest.registered_items["farming:carrot"] and "farming:carrot" or nil),
	potato = (minetest.registered_items["farming:potato"] and "farming:potato" or nil),
	lava_orb = (minetest.registered_items["mobs:lava_orb"] and "mobs:lava_orb" or nil),
	rawfish = (minetest.registered_items["animalworld:rawfish"] and "animalworld:rawfish" or nil),
	raw_exotic_fish = (minetest.registered_items["marinaramobs:raw_exotic_fish"] and "marinaramobs:raw_exotic_fish" or nil),
	catfish_raw = (minetest.registered_items["nativevillages:catfish_raw"] and "nativevillages:catfish_raw" or nil),
	fish_edible = (minetest.registered_items["xocean:fish_edible"] and "xocean:fish_edible" or nil),
	emerald = (minetest.registered_items["underch:emerald"] and "underch:emerald" or nil),
	bow_wood = (minetest.registered_items["x_bows:bow_wood"] and "x_bows:bow_wood" or nil),
	quiver = (minetest.registered_items["x_bows:quiver"] and "x_bows:quiver" or nil),
	arrow_diamond = (minetest.registered_items["x_bows:arrow_diamond"] and "x_bows:arrow_diamond" or nil),
	potion_dispel = (minetest.registered_items["gadgets_consumables:potion_dispel"] and "gadgets_consumables:potion_dispel" or nil),
	potion_fire_shield_01 = (minetest.registered_items["gadgets_consumables:potion_fire_shield_01"] and "gadgets_consumables:potion_fire_shield_01" or nil),
	potion_fire_shield_02 = (minetest.registered_items["gadgets_consumables:potion_fire_shield_02"] and "gadgets_consumables:potion_fire_shield_02" or nil),
	potion_gravity_01 = (minetest.registered_items["gadgets_consumables:potion_gravity_01"] and "gadgets_consumables:potion_gravity_01" or nil),
	potion_gravity_02 = (minetest.registered_items["gadgets_consumables:potion_gravity_02"] and "gadgets_consumables:potion_gravity_02" or nil),
	potion_gravity_03 = (minetest.registered_items["gadgets_consumables:potion_gravity_03"] and "gadgets_consumables:potion_gravity_03" or nil),
	potion_health_regen_01 = (minetest.registered_items["gadgets_consumables:potion_health_regen_01"] and "gadgets_consumables:potion_health_regen_01" or nil),
	potion_health_regen_02 = (minetest.registered_items["gadgets_consumables:potion_health_regen_02"] and "gadgets_consumables:potion_health_regen_02" or nil),
	potion_jump_01 = (minetest.registered_items["gadgets_consumables:potion_jump_01"] and "gadgets_consumables:potion_jump_01" or nil),
	potion_jump_02 = (minetest.registered_items["gadgets_consumables:potion_jump_02"] and "gadgets_consumables:potion_jump_02" or nil),
	potion_jump_03 = (minetest.registered_items["gadgets_consumables:potion_jump_03"] and "gadgets_consumables:potion_jump_03" or nil),
	potion_mana_regen_01 = (minetest.registered_items["gadgets_consumables:potion_mana_regen_01"] and "gadgets_consumables:potion_mana_regen_01" or nil),
	potion_mana_regen_02 = (minetest.registered_items["gadgets_consumables:potion_mana_regen_02"] and "gadgets_consumables:potion_mana_regen_02" or nil),
	potion_speed_01 = (minetest.registered_items["gadgets_consumables:potion_speed_01"] and "gadgets_consumables:potion_speed_01" or nil),
	potion_speed_02 = (minetest.registered_items["gadgets_consumables:potion_speed_02"] and "gadgets_consumables:potion_speed_02" or nil),
	potion_speed_03 = (minetest.registered_items["gadgets_consumables:potion_speed_03"] and "gadgets_consumables:potion_speed_03" or nil),
	potion_stamina_regen_01 = (minetest.registered_items["gadgets_consumables:potion_stamina_regen_01"] and "gadgets_consumables:potion_stamina_regen_01" or nil),
	potion_stamina_regen_02 = (minetest.registered_items["gadgets_consumables:potion_stamina_regen_02"] and "gadgets_consumables:potion_stamina_regen_02" or nil),
	potion_teleport = (minetest.registered_items["gadgets_consumables:potion_teleport"] and "gadgets_consumables:potion_teleport" or nil),
	potion_water_breath_01 = (minetest.registered_items["gadgets_consumables:potion_water_breath_01"] and "gadgets_consumables:potion_water_breath_01" or nil),
	potion_water_breath_02 = (minetest.registered_items["gadgets_consumables:potion_water_breath_02"] and "gadgets_consumables:potion_water_breath_02" or nil),
	chicken_feather = (minetest.registered_items["mobs:chicken_feather"] and "mobs:chicken_feather" or nil),
	shield_bronze = (minetest.registered_items["shields:shield_bronze"] and "shields:shield_bronze" or nil),
	shield_steel = (minetest.registered_items["shields:shield_steel"] and "shields:shield_steel" or nil),
	jackolantern = (minetest.registered_items["farming:jackolantern"] and "farming:jackolantern" or nil),
}

-- FOLLOWS
mobs_mc.follows = {
	dog = {"mobs:meat", "mobs:meat_raw", "bonemeal:bone", "goblins:goblins_goblin_bone", "goblins:goblins_goblin_bone_meaty"},
	donkey = {"default:apple", "farming:wheat", "farming:oat", "farming:barley", "farming:corn", "farming:carrot", "farming:rye", "df_farming:cave_wheat"},
	llama = {"default:apple", "farming:wheat", "farming:oat", "farming:barley", "farming:corn", "farming:carrot", "farming:rye", "df_farming:cave_wheat"},
	mule = {"default:apple", "farming:wheat", "farming:oat", "farming:barley", "farming:corn", "farming:carrot", "farming:rye", "df_farming:cave_wheat"},
	ocelot = {"animalworld:rawfish", "marinaramobs:raw_exotic_fish", "nativevillages:catfish_raw", "xocean:fish_edible"},
	parrot = {"aqua_farming:alga_seed", "aqua_farming:sea_anemone_seed", "aqua_farming:sea_cucumber_seed", "aqua_farming:sea_grass_seed", "aqua_farming:sea_strawberry_seed", "aqua_farming:sponge_seed", "df_farming:cave_wheat_seed", "df_farming:dimple_cup_seed", "df_farming:pig_tail_seed", "df_farming:sweet_pod_seed", "farming:seed_barley", "farming:seed_cotton", "farming:seed_hemp", "farming:seed_mint", "farming:seed_oat", "farming:seed_rice", "farming:seed_rye", "farming:seed_sunflower", "farming:seed_wheat", "farming:sunflower_seeds_toasted"},
	pig = {"default:apple", "farming:carrot", "farming:potato", "mobs_mc:carrot_on_a_stick"},
}

-- SPAWN NODES
mobs_mc.spawn_nodes = {
	axolotl = {"group:water", "default:river_water_source", "default:water_source", "ebiomes:swamp_water_source", "swamp:swamp_water_source"},
	baby_husk = {"group:cracky", "group:crumbly"},
	baby_zombie_pigman = {"group:cracky", "group:crumbly"},
	baby_zombie = {"group:cracky", "group:crumbly"},
	blaze = {"air"},
	creeper = {"group:cracky", "group:crumbly"},
	dog = {"group:cracky", "group:crumbly"},
	donkey = {"group:soil", "group:dirt"},
	enderman = {"nether:geodelite", "nether:brick", "nextgen_bedrock:bedrock", "bedrock2:bedrock", "df_underworld_items:slade", "df_underworld_items:slade_sand"},
	endermite = {"group:cracky", "group:stone"},
	ghast = {"air"},
	guardian = {"group:water", "default:river_water_source", "default:water_source", "ebiomes:swamp_water_source", "swamp:swamp_water_source"},
	guardian_elder = {"group:water", "default:river_water_source", "default:water_source", "ebiomes:swamp_water_source", "swamp:swamp_water_source"},
	iron_golem = {"group:cracky", "group:crumbly"},
	husk = {"group:sand"},
	llama = {"group:soil", "group:dirt"},
	mule = {"group:soil", "group:dirt"},
	ocelot = {"naturalbiomes:bambooforest_litter", "variety:dirt_with_bamboo"},
	parrot = {"default:junglegrass", "ebiomes:jungle_savanna_grass_1", "ebiomes:jungle_savanna_grass_2", "ebiomes:jungle_savanna_grass_3", "ebiomes:jungle_savanna_grass_4", "ebiomes:jungle_savanna_grass_5", "livingjungle:mangrove_leaves", "livingjungle:samauma_leaves", "livingjungle:alocasia", "livingjungle:flamingoflower", "livingjungle:stinkflower", "livingjungle:grass1", "livingjungle:grass2", "naturalbiomes:palmbeach_grass1", "naturalbiomes:palmbeach_grass2", "naturalbiomes:palmbeach_grass3", "naturalbiomes:palm_leaves"},
	pig = {"group:soil", "group:dirt"},
	zombie_pigman = {"group:cracky", "group:crumbly"},
	shulker = {"variety:terracotta_1", "default:desert_stone"},
	silverfish = {"group:cracky", "group:stone"},
	snowman = {"default:dirt_with_snow", "default:snow", "default:ice", "default:snowblock"},
	squid = {"group:water", "default:river_water_source", "default:water_source", "ebiomes:swamp_water_source", "swamp:swamp_water_source"},
	vex = {"air"},
	evoker = {"group:cracky", "group:crumbly"},
	illusioner = {"group:cracky", "group:crumbly"},
	vindicator = {"group:cracky", "group:crumbly"},
	villager_zombie = {"group:cracky", "group:crumbly"},
	villager = {"group:cracky", "group:crumbly"},
	witch = {"group:cracky", "group:crumbly"},
	wither = {"air"},
	zombie = {"group:cracky", "group:crumbly"},
}

-- DROPS
mobs_mc.drops = {
	axolotl = {},
	baby_husk = {
		{
			name = "default:steel_ingot",
			chance = 120,
			min = 1,
			max = 1,
		},
	},
	baby_zombie_pigman = {
		{
			name = "default:gold_lump",
			chance = 1,
			min = 0,
			max = 1,
		},
		{
			name = "default:gold_ingot",
			chance = 40,
			min = 1,
			max = 1,
		},
	},
	baby_zombie = {
		{
			name = "default:steel_ingot",
			chance = 120,
			min = 1,
			max = 1,
		},
	},
	blaze = {},
	creeper = {
		{
			name = "tnt:gunpowder",
			chance = 1,
			min = 0,
			max = 2,
		},
	},
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
	husk = {
		{
			name = "default:steel_ingot",
			chance = 120,
			min = 1,
			max = 1,
		},
	},
	llama = {
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
	ocelot = {
		{
			name = "farming:string",
			chance = 1,
			min = 0,
			max = 2,
		},
	},
	parrot = {},
	pig = {},
	zombie_pigman = {
		{
			name = "default:gold_lump",
			chance = 1,
			min = 0,
			max = 1,
		},
		{
			name = "default:gold_ingot",
			chance = 40,
			min = 1,
			max = 1,
		},
		{
			name = "default:sword_mese",
			chance = 12,
			min = 1,
			max = 1,
		},
	},
	shulker = {
		{
			name = "default:steel_ingot",
			chance = 1,
			min = 1,
			max = 5,
		},
		{
			name = "default:bronze_ingot",
			chance = 1,
			min = 1,
			max = 5,
		},
	},
	snowman = {
		{
			name = "default:snowblock",
			chance = 1,
			min = 0,
			max = 5,
		}
	},
	squid = {
		{
			name = "dye:black",
			chance = 1,
			min = 1,
			max = 3,
		},
	},
	vex = {
		{
			name = "default:sword_steel",
			chance = 100,
			min = 1,
			max = 1,
		},
	},
	evoker = {
		{
			name = "default:diamond",
			chance = 1,
			min = 0,
			max = 1,
		},
		{
			name = "mobs_mc:totem",
			chance = 150,
			min = 1,
			max = 1,
		},
	},
	illusioner = {
		{
			name = "mobs_mc:totem",
			chance = 150,
			min = 1,
			max = 1,
		},
	},
	vindicator = {
		{
			name = "default:diamond",
			chance = 1,
			min = 0,
			max = 1,
		},
		{
			name = "default:axe_steel",
			chance = 11,
			min = 1,
			max = 1,
		},
		{
			name = "mobs_mc:totem",
			chance = 150,
			min = 1,
			max = 1,
		},
	},
	villager_zombie = {
		{
			name = "default:steel_ingot",
			chance = 120,
			min = 1,
			max = 1,
		},
	},
	villager = {
		{
			name = "default:gold_ingot",
			chance = 10,
			min = 1,
			max = 5,
		},
	},
	witch = {
		{
			name = "vessels:glass_bottle",
			chance = 8,
			min = 0,
			max = 2,
		},
		{
			name = "tnt:gunpowder",
			chance = 8,
			min = 0,
			max = 2,
		},
		{
			name = "default:papyrus",
			chance = 8,
			min = 0,
			max = 2,
		},
		{
			name = "mobs_mc:totem",
			chance = 150,
			min = 1,
			max = 1,
		},
	},
	wither = {
		{
			name = "mobs_mc:totem",
			chance = 1,
			min = 1,
			max = 10,
		},
	},
	zombie = {
		{
			name = "default:steel_ingot",
			chance = 120,
			min = 1,
			max = 1,
		},
	},
}

if mobs_mc.items.rawfish then
	table.insert(mobs_mc.drops.axolotl, {name = mobs_mc.items.rawfish, chance = 160, min = 1, max = 1})
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.rawfish, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.raw_exotic_fish then
	table.insert(mobs_mc.drops.axolotl, {name = mobs_mc.items.raw_exotic_fish, chance = 160, min = 1, max = 1})
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.raw_exotic_fish, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.catfish_raw then
	table.insert(mobs_mc.drops.axolotl, {name = mobs_mc.items.catfish_raw, chance = 160, min = 1, max = 1})
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.catfish_raw, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.fish_edible then
	table.insert(mobs_mc.drops.axolotl, {name = mobs_mc.items.fish_edible, chance = 160, min = 1, max = 1})
	table.insert(mobs_mc.drops.guardian_elder, {name = mobs_mc.items.fish_edible, chance = 160, min = 1, max = 1})
end

if mobs_mc.items.lava_orb then
	table.insert(mobs_mc.drops.blaze, {name = mobs_mc.items.lava_orb, chance = 5, min = 1, max = 3})
end

if mobs_mc.items.pork_raw then
	table.insert(mobs_mc.drops.pig, {name = mobs_mc.items.pork_raw, chance = 1, min = 1, max = 1})
end

if mobs_mc.items.emerald then
	table.insert(mobs_mc.drops.evoker, {name = mobs_mc.items.emerald, chance = 1, min = 0, max = 1})
	table.insert(mobs_mc.drops.vindicator, {name = mobs_mc.items.emerald, chance = 1, min = 0, max = 1})
end

if mobs_mc.items.bow_wood then
	table.insert(mobs_mc.drops.illusioner, {name = mobs_mc.items.bow_wood, chance = 15, min = 1, max = 1})
end

if mobs_mc.items.quiver then
	table.insert(mobs_mc.drops.illusioner, {name = mobs_mc.items.quiver, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.arrow_diamond then
	table.insert(mobs_mc.drops.illusioner, {name = mobs_mc.items.arrow_diamond, chance = 1, min = 1, max = 5})
end

if mobs_mc.items.carrot then
	table.insert(mobs_mc.drops.villager_zombie, {name = mobs_mc.items.carrot, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.zombie, {name = mobs_mc.items.carrot, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.baby_zombie, {name = mobs_mc.items.carrot, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.husk, {name = mobs_mc.items.carrot, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.baby_husk, {name = mobs_mc.items.carrot, chance = 120, min = 1, max = 1})
end

if mobs_mc.items.potato then
	table.insert(mobs_mc.drops.villager_zombie, {name = mobs_mc.items.potato, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.zombie, {name = mobs_mc.items.potato, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.baby_zombie, {name = mobs_mc.items.potato, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.husk, {name = mobs_mc.items.potato, chance = 120, min = 1, max = 1})
	table.insert(mobs_mc.drops.baby_husk, {name = mobs_mc.items.potato, chance = 120, min = 1, max = 1})
end

if mobs_mc.items.potion_dispel then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_dispel, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_fire_shield_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_fire_shield_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_fire_shield_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_fire_shield_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_gravity_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_gravity_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_gravity_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_gravity_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_gravity_03 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_gravity_03, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_health_regen_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_health_regen_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_health_regen_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_health_regen_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_jump_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_jump_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_jump_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_jump_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_jump_03 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_jump_03, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_mana_regen_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_mana_regen_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_mana_regen_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_mana_regen_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_speed_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_speed_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_speed_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_speed_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_speed_03 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_speed_03, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_stamina_regen_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_stamina_regen_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_stamina_regen_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_stamina_regen_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_teleport then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_teleport, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_water_breath_01 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_water_breath_01, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.potion_water_breath_02 then
	table.insert(mobs_mc.drops.witch, {name = mobs_mc.items.potion_water_breath_02, chance = 150, min = 1, max = 1})
end

if mobs_mc.items.chicken_feather then
	table.insert(mobs_mc.drops.parrot, {name = mobs_mc.items.chicken_feather, chance = 1, min = 1, max = 2})
end

if mobs_mc.items.shield_bronze then
	table.insert(mobs_mc.drops.shulker, {name = mobs_mc.items.shield_bronze, chance = 100, min = 1, max = 1})
end

if mobs_mc.items.shield_steel then
	table.insert(mobs_mc.drops.shulker, {name = mobs_mc.items.shield_steel, chance = 100, min = 1, max = 1})
end

if mobs_mc.items.jackolantern then
	table.insert(mobs_mc.drops.snowman, {name = mobs_mc.items.jackolantern, chance = 50, min = 1, max = 1})
end

-- SPAWNS
mobs_mc.spawns = {
	axolotl = {
		name = "mobs_mc:axolotl",
		nodes = mobs_mc.spawn_nodes.axolotl,
		neighbors = {"default:coral_brown", "default:coral_cyan", "default:coral_green", "default:coral_orange", "default:coral_pink", "default:sand_with_kelp", "decorations_sea:coral_01", "decorations_sea:coral_02", "decorations_sea:coral_03", "decorations_sea:coral_04", "decorations_sea:coral_05", "decorations_sea:coral_06", "decorations_sea:coral_07", "decorations_sea:coral_08", "decorations_sea:coral_plantlike_01", "decorations_sea:coral_plantlike_02", "decorations_sea:coral_plantlike_03", "decorations_sea:coral_plantlike_04", "decorations_sea:coral_plantlike_05", "decorations_sea:sea_pickle", "decorations_sea:seagrass_01", "decorations_sea:seagrass_02", "decorations_sea:seagrass_03", "decorations_sea:seagrass_04", "decorations_sea:seagrass_05", "decorations_sea:seagrass_06", "xocean:brain_block", "xocean:bubble", "xocean:bubble_block", "xocean:fire", "xocean:horn", "xocean:kelp_block", "xocean:ocean_stone", "xocean:pickle", "xocean:seagrass", "xocean:tube_block", "xocean:brain_skeleton", "xocean:bubble_skeleton", "xocean:fire_skeleton", "xocean:skeleton_brain", "xocean:skeleton_bubble", "xocean:skeleton_fire", "xocean:horn_skeleton", "xocean:skeleton_horn", "xocean:skeleton_tube", "xocean:tube_skeleton", "marinara:coastrock", "marinara:coastrock_alage", "marinara:coastrock_with_brownalage", "marinara:hardcoral", "marinara:hardcoral_blue", "marinara:hardcoral_brown", "marinara:hardcoral_green", "marinara:hardcoral_pink", "marinara:hardcoral_red", "marinara:hardcoral_violet", "marinara:hardcoral_yellow", "marinara:mussels", "marinara:oisterbank", "marinara:reed", "marinara:reed_root", "marinara:sand_with_alage", "marinara:sand_with_kelp", "marinara:sand_with_seagrass", "marinara:sand_with_seagrass2", "marinara:sand_with_seashells", "marinara:sand_with_seashells_broken", "marinara:sand_with_seashells_brown", "marinara:sand_with_seashells_orange", "marinara:sand_with_seashells_pink", "marinara:sand_with_seashells_white", "marinara:sand_with_seashells_yellow", "marinara:seaanemone_tentacle", "marinara:seaanemone_tentacle2", "marinara:seaanemone_tentacle3", "marinara:seaanemone_tentacle4", "marinara:seapocks", "marinara:seaworm", "marinara:seaworm2", "marinara:seaworm3", "marinara:softcoral", "marinara:softcoral_brown", "marinara:softcoral_green", "marinara:softcoral_red", "marinara:softcoral_white", "marinara:softcoral_yellow", "aqua_farming:alga_item", "aqua_farming:sea_anemone_item", "aqua_farming:sea_cucumber_item", "aqua_farming:sea_grass_item"},
		min_light = 0,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.water - 20,
		max_height = mobs_mc.height.water,
		day_toggle = true,
	},
	baby_husk = {
		name = "mobs_mc:baby_husk",
		nodes = mobs_mc.spawn_nodes.baby_husk,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 30000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	baby_zombie = {
		name = "mobs_mc:baby_zombie",
		nodes = mobs_mc.spawn_nodes.baby_zombie,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 30000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	creeper = {
		name = "mobs_mc:creeper",
		nodes = mobs_mc.spawn_nodes.creeper,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	dog = {
		name = "mobs_mc:dog",
		nodes = mobs_mc.spawn_nodes.dog,
		neighbors = {"mg_villages:mob_spawner"},
		min_light = 7,
		interval = 10,
		chance = 200,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	donkey = {
		name = "mobs_mc:donkey",
		nodes = mobs_mc.spawn_nodes.donkey,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	enderman = {
		name = "mobs_mc:enderman",
		nodes = mobs_mc.spawn_nodes.enderman,
		neighbors = {"air"},
		min_light = 0,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = -31000,
		max_height = mobs_mc.height.max,
	},
	endermite = {
		name = "mobs_mc:endermite",
		nodes = mobs_mc.spawn_nodes.endermite,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	guardian = {
		name = "mobs_mc:guardian",
		nodes = mobs_mc.spawn_nodes.guardian,
		neighbors = {"default:coral_brown", "default:coral_cyan", "default:coral_green", "default:coral_orange", "default:coral_pink", "default:sand_with_kelp", "decorations_sea:coral_01", "decorations_sea:coral_02", "decorations_sea:coral_03", "decorations_sea:coral_04", "decorations_sea:coral_05", "decorations_sea:coral_06", "decorations_sea:coral_07", "decorations_sea:coral_08", "decorations_sea:coral_plantlike_01", "decorations_sea:coral_plantlike_02", "decorations_sea:coral_plantlike_03", "decorations_sea:coral_plantlike_04", "decorations_sea:coral_plantlike_05", "decorations_sea:sea_pickle", "decorations_sea:seagrass_01", "decorations_sea:seagrass_02", "decorations_sea:seagrass_03", "decorations_sea:seagrass_04", "decorations_sea:seagrass_05", "decorations_sea:seagrass_06", "xocean:brain_block", "xocean:bubble", "xocean:bubble_block", "xocean:fire", "xocean:horn", "xocean:kelp_block", "xocean:ocean_stone", "xocean:pickle", "xocean:seagrass", "xocean:tube_block", "xocean:brain_skeleton", "xocean:bubble_skeleton", "xocean:fire_skeleton", "xocean:skeleton_brain", "xocean:skeleton_bubble", "xocean:skeleton_fire", "xocean:horn_skeleton", "xocean:skeleton_horn", "xocean:skeleton_tube", "xocean:tube_skeleton", "marinara:coastrock", "marinara:coastrock_alage", "marinara:coastrock_with_brownalage", "marinara:hardcoral", "marinara:hardcoral_blue", "marinara:hardcoral_brown", "marinara:hardcoral_green", "marinara:hardcoral_pink", "marinara:hardcoral_red", "marinara:hardcoral_violet", "marinara:hardcoral_yellow", "marinara:mussels", "marinara:oisterbank", "marinara:reed", "marinara:reed_root", "marinara:sand_with_alage", "marinara:sand_with_kelp", "marinara:sand_with_seagrass", "marinara:sand_with_seagrass2", "marinara:sand_with_seashells", "marinara:sand_with_seashells_broken", "marinara:sand_with_seashells_brown", "marinara:sand_with_seashells_orange", "marinara:sand_with_seashells_pink", "marinara:sand_with_seashells_white", "marinara:sand_with_seashells_yellow", "marinara:seaanemone_tentacle", "marinara:seaanemone_tentacle2", "marinara:seaanemone_tentacle3", "marinara:seaanemone_tentacle4", "marinara:seapocks", "marinara:seaworm", "marinara:seaworm2", "marinara:seaworm3", "marinara:softcoral", "marinara:softcoral_brown", "marinara:softcoral_green", "marinara:softcoral_red", "marinara:softcoral_white", "marinara:softcoral_yellow", "aqua_farming:alga_wild", "aqua_farming:sea_anemone_wild", "aqua_farming:sea_cucumber_wild", "aqua_farming:sea_grass_wild", "aqua_farming:sea_strawberry_wild", "aqua_farming:sponge_wild"},
		min_light = 0,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = -50,
		max_height = mobs_mc.height.min,
	},
	guardian_elder = {
		name = "mobs_mc:guardian_elder",
		nodes = mobs_mc.spawn_nodes.guardian_elder,
		neighbors = {"default:coral_brown", "default:coral_cyan", "default:coral_green", "default:coral_orange", "default:coral_pink", "default:sand_with_kelp", "decorations_sea:coral_01", "decorations_sea:coral_02", "decorations_sea:coral_03", "decorations_sea:coral_04", "decorations_sea:coral_05", "decorations_sea:coral_06", "decorations_sea:coral_07", "decorations_sea:coral_08", "decorations_sea:coral_plantlike_01", "decorations_sea:coral_plantlike_02", "decorations_sea:coral_plantlike_03", "decorations_sea:coral_plantlike_04", "decorations_sea:coral_plantlike_05", "decorations_sea:sea_pickle", "decorations_sea:seagrass_01", "decorations_sea:seagrass_02", "decorations_sea:seagrass_03", "decorations_sea:seagrass_04", "decorations_sea:seagrass_05", "decorations_sea:seagrass_06", "xocean:brain_block", "xocean:bubble", "xocean:bubble_block", "xocean:fire", "xocean:horn", "xocean:kelp_block", "xocean:ocean_stone", "xocean:pickle", "xocean:seagrass", "xocean:tube_block", "xocean:brain_skeleton", "xocean:bubble_skeleton", "xocean:fire_skeleton", "xocean:skeleton_brain", "xocean:skeleton_bubble", "xocean:skeleton_fire", "xocean:horn_skeleton", "xocean:skeleton_horn", "xocean:skeleton_tube", "xocean:tube_skeleton", "marinara:coastrock", "marinara:coastrock_alage", "marinara:coastrock_with_brownalage", "marinara:hardcoral", "marinara:hardcoral_blue", "marinara:hardcoral_brown", "marinara:hardcoral_green", "marinara:hardcoral_pink", "marinara:hardcoral_red", "marinara:hardcoral_violet", "marinara:hardcoral_yellow", "marinara:mussels", "marinara:oisterbank", "marinara:reed", "marinara:reed_root", "marinara:sand_with_alage", "marinara:sand_with_kelp", "marinara:sand_with_seagrass", "marinara:sand_with_seagrass2", "marinara:sand_with_seashells", "marinara:sand_with_seashells_broken", "marinara:sand_with_seashells_brown", "marinara:sand_with_seashells_orange", "marinara:sand_with_seashells_pink", "marinara:sand_with_seashells_white", "marinara:sand_with_seashells_yellow", "marinara:seaanemone_tentacle", "marinara:seaanemone_tentacle2", "marinara:seaanemone_tentacle3", "marinara:seaanemone_tentacle4", "marinara:seapocks", "marinara:seaworm", "marinara:seaworm2", "marinara:seaworm3", "marinara:softcoral", "marinara:softcoral_brown", "marinara:softcoral_green", "marinara:softcoral_red", "marinara:softcoral_white", "marinara:softcoral_yellow", "aqua_farming:alga_wild", "aqua_farming:sea_anemone_wild", "aqua_farming:sea_cucumber_wild", "aqua_farming:sea_grass_wild", "aqua_farming:sea_strawberry_wild", "aqua_farming:sponge_wild"},
		min_light = 14,
		interval = 0,
		chance = 20000,
		active_object_count = 1,
		min_height = -50,
		max_height = mobs_mc.height.min,
	},
	iron_golem = {
		name = "mobs_mc:iron_golem",
		nodes = mobs_mc.spawn_nodes.iron_golem,
		neighbors = {"mg_villages:mob_spawner"},
		min_light = 7,
		interval = 10,
		chance = 100,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
	},
	husk = {
		name = "mobs_mc:husk",
		nodes = mobs_mc.spawn_nodes.husk,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	llama = {
		name = "mobs_mc:llama",
		nodes = mobs_mc.spawn_nodes.llama,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	mule = {
		name = "mobs_mc:mule",
		nodes = mobs_mc.spawn_nodes.mule,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	ocelot = {
		name = "mobs_mc:ocelot",
		nodes = mobs_mc.spawn_nodes.ocelot,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
	},
	parrot = {
		name = "mobs_mc:parrot",
		nodes = mobs_mc.spawn_nodes.parrot,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 3,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	pig = {
		name = "mobs_mc:pig",
		nodes = mobs_mc.spawn_nodes.pig,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
		day_toggle = true,
	},
	shulker = {
		name = "mobs_mc:shulker",
		nodes = mobs_mc.spawn_nodes.shulker,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	silverfish = {
		name = "mobs_mc:silverfish",
		nodes = mobs_mc.spawn_nodes.silverfish,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
	snowman = {
		name = "mobs_mc:snowman",
		nodes = mobs_mc.spawn_nodes.snowman,
		neighbors = {"air"},
		min_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
	},
	squid = {
		name = "mobs_mc:squid",
		nodes = mobs_mc.spawn_nodes.squid,
		neighbors = {"default:coral_brown", "default:coral_cyan", "default:coral_green", "default:coral_orange", "default:coral_pink", "default:sand_with_kelp", "decorations_sea:coral_01", "decorations_sea:coral_02", "decorations_sea:coral_03", "decorations_sea:coral_04", "decorations_sea:coral_05", "decorations_sea:coral_06", "decorations_sea:coral_07", "decorations_sea:coral_08", "decorations_sea:coral_plantlike_01", "decorations_sea:coral_plantlike_02", "decorations_sea:coral_plantlike_03", "decorations_sea:coral_plantlike_04", "decorations_sea:coral_plantlike_05", "decorations_sea:sea_pickle", "decorations_sea:seagrass_01", "decorations_sea:seagrass_02", "decorations_sea:seagrass_03", "decorations_sea:seagrass_04", "decorations_sea:seagrass_05", "decorations_sea:seagrass_06", "xocean:brain_block", "xocean:bubble", "xocean:bubble_block", "xocean:fire", "xocean:horn", "xocean:kelp_block", "xocean:ocean_stone", "xocean:pickle", "xocean:seagrass", "xocean:tube_block", "xocean:brain_skeleton", "xocean:bubble_skeleton", "xocean:fire_skeleton", "xocean:skeleton_brain", "xocean:skeleton_bubble", "xocean:skeleton_fire", "xocean:horn_skeleton", "xocean:skeleton_horn", "xocean:skeleton_tube", "xocean:tube_skeleton", "marinara:coastrock", "marinara:coastrock_alage", "marinara:coastrock_with_brownalage", "marinara:hardcoral", "marinara:hardcoral_blue", "marinara:hardcoral_brown", "marinara:hardcoral_green", "marinara:hardcoral_pink", "marinara:hardcoral_red", "marinara:hardcoral_violet", "marinara:hardcoral_yellow", "marinara:mussels", "marinara:oisterbank", "marinara:reed", "marinara:reed_root", "marinara:sand_with_alage", "marinara:sand_with_kelp", "marinara:sand_with_seagrass", "marinara:sand_with_seagrass2", "marinara:sand_with_seashells", "marinara:sand_with_seashells_broken", "marinara:sand_with_seashells_brown", "marinara:sand_with_seashells_orange", "marinara:sand_with_seashells_pink", "marinara:sand_with_seashells_white", "marinara:sand_with_seashells_yellow", "marinara:seaanemone_tentacle", "marinara:seaanemone_tentacle2", "marinara:seaanemone_tentacle3", "marinara:seaanemone_tentacle4", "marinara:seapocks", "marinara:seaworm", "marinara:seaworm2", "marinara:seaworm3", "marinara:softcoral", "marinara:softcoral_brown", "marinara:softcoral_green", "marinara:softcoral_red", "marinara:softcoral_white", "marinara:softcoral_yellow", "aqua_farming:alga_wild", "aqua_farming:sea_anemone_wild", "aqua_farming:sea_cucumber_wild", "aqua_farming:sea_grass_wild", "aqua_farming:sea_strawberry_wild", "aqua_farming:sponge_wild"},
		min_light = 0,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.water - 20,
		max_height = mobs_mc.height.water,
		day_toggle = true,
	},
	villager_zombie = {
		name = "mobs_mc:villager_zombie",
		nodes = mobs_mc.spawn_nodes.villager_zombie,
		neighbors = {"mg_villages:mob_spawner"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = 0,
		max_height = mobs_mc.height.max,
	},
	villager = {
		name = "mobs_mc:villager",
		nodes = mobs_mc.spawn_nodes.villager,
		neighbors = {"mg_villages:mob_spawner"},
		min_light = 7,
		interval = 10,
		chance = 100,
		active_object_count = 3,
		min_height = 0,
		max_height = mobs_mc.height.max,
	},
	zombie = {
		name = "mobs_mc:zombie",
		nodes = mobs_mc.spawn_nodes.zombie,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.min,
		max_height = mobs_mc.height.max,
	},
}

if mobs_mc.height.nether_min and mobs_mc.height.nether_max then
	mobs_mc.spawns.baby_zombie_pigman = {
		name = "mobs_mc:baby_zombie_pigman",
		nodes = mobs_mc.spawn_nodes.baby_zombie_pigman,
		neighbors = {"air"},
		min_light = 0,
		interval = 60,
		chance = 30000,
		active_object_count = 1,
		min_height = mobs_mc.height.nether_min,
		max_height = mobs_mc.height.nether_max,
	}

	mobs_mc.spawns.blaze = {
		name = "mobs_mc:blaze",
		nodes = mobs_mc.spawn_nodes.blaze,
		neighbors = {"nether:lava_crust"},
		min_light = 0,
		interval = 60,
		chance = 5000,
		active_object_count = 1,
		min_height = mobs_mc.height.nether_min,
		max_height = mobs_mc.height.nether_max,
	}

	mobs_mc.spawns.ghast = {
		name = "mobs_mc:ghast",
		nodes = mobs_mc.spawn_nodes.ghast,
		neighbors = {"air"},
		min_light = 0,
		interval = 60,
		chance = 10000,
		active_object_count = 1,
		min_height = mobs_mc.height.nether_min,
		max_height = mobs_mc.height.nether_max,
	}

	mobs_mc.spawns.zombie_pigman = {
		name = "mobs_mc:zombie_pigman",
		nodes = mobs_mc.spawn_nodes.zombie_pigman,
		neighbors = {"air"},
		min_light = 0,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.nether_min,
		max_height = mobs_mc.height.nether_max,
	}

	mobs_mc.spawns.wither = {
		name = "mobs_mc:wither",
		nodes = mobs_mc.spawn_nodes.wither,
		neighbors = {"air"},
		min_light = 0,
		interval = 60,
		chance = 60000,
		active_object_count = 1,
		min_height = mobs_mc.height.nether_min,
		max_height = mobs_mc.height.nether_max,
	}
end

if mobs_mc.height.floatlands_min then
	mobs_mc.spawns.vex = {
		name = "mobs_mc:vex",
		nodes = mobs_mc.spawn_nodes.vex,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 30000,
		active_object_count = 5,
		min_height = mobs_mc.height.floatlands_min,
		max_height = 31000,
	}

	mobs_mc.spawns.evoker = {
		name = "mobs_mc:evoker",
		nodes = mobs_mc.spawn_nodes.evoker,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.floatlands_min,
		max_height = 31000,
	}

	mobs_mc.spawns.illusioner = {
		name = "mobs_mc:illusioner",
		nodes = mobs_mc.spawn_nodes.illusioner,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.floatlands_min,
		max_height = 31000,
	}

	mobs_mc.spawns.vindicator = {
		name = "mobs_mc:vindicator",
		nodes = mobs_mc.spawn_nodes.vindicator,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.floatlands_min,
		max_height = 31000,
	}

	mobs_mc.spawns.witch = {
		name = "mobs_mc:witch",
		nodes = mobs_mc.spawn_nodes.witch,
		neighbors = {"air"},
		max_light = 7,
		interval = 60,
		chance = 20000,
		active_object_count = 1,
		min_height = mobs_mc.height.floatlands_min,
		max_height = 31000,
	}
end
