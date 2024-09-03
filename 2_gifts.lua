if minetest.get_modpath("mobs_npc") then
	table.insert(mobs.human.items, {"mobs_mc:totem", "default:gold_ingot 150", 10})
	table.insert(mobs.human.items, {"mobs_mc:carrot_on_a_stick", "default:gold_ingot 50", 10})
	table.insert(mobs.human.items, {"mobs_mc:horse_armor_iron", "default:gold_ingot 60", 10})
	table.insert(mobs.human.items, {"mobs_mc:horse_armor_gold", "default:gold_ingot 80", 10})
	table.insert(mobs.human.items, {"mobs_mc:horse_armor_diamond", "default:gold_ingot 100", 10})
	table.insert(mobs.human.items, {"mobs_mc:horseshoe_steel", "default:gold_ingot 50", 10})
	table.insert(mobs.human.items, {"mobs_mc:horseshoe_bronze", "default:gold_ingot 70", 10})
	table.insert(mobs.human.items, {"mobs_mc:horseshoe_mese", "default:gold_ingot 90", 10})
	table.insert(mobs.human.items, {"mobs_mc:horseshoe_diamond", "default:gold_ingot 110", 10})
	table.insert(mobs.human.items, {"mobs_mc:horseshoe_crystal", "default:gold_ingot 130", 10})
end

if minetest.get_modpath("lootchests_default") then
	local items = {
		{"mobs_mc:totem"},
		{"mobs_mc:carrot_on_a_stick"},
		{"mobs_mc:horse_armor_iron"},
		{"mobs_mc:horse_armor_gold"},
		{"mobs_mc:horse_armor_diamond"},
		{"mobs_mc:horseshoe_steel"},
		{"mobs_mc:horseshoe_bronze"},
		{"mobs_mc:horseshoe_mese"},
		{"mobs_mc:horseshoe_diamond"},
		{"mobs_mc:horseshoe_crystal"},
	}

	lootchests.add_to_loot_table("lootchests_default:ocean_chest", items)
	lootchests.add_to_loot_table("lootchests_default:urn", items)
	lootchests.add_to_loot_table("lootchests_default:stone_chest", items)
	lootchests.add_to_loot_table("lootchests_default:basket", items)
	lootchests.add_to_loot_table("lootchests_default:barrel", items)
end

if minetest.get_modpath("dungeon_loot") then
	dungeon_loot.register({
		{name = "mobs_mc:totem", chance = 0.1, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:carrot_on_a_stick", chance = 15, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horse_armor_iron", chance = 10, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horse_armor_gold", chance = 7, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horse_armor_diamond", chance = 3, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horseshoe_steel", chance = 10, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horseshoe_bronze", chance = 7, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horseshoe_mese", chance = 5, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horseshoe_diamond", chance = 3, count = {1, 1}, y = {-31000, 31000}},
		{name = "mobs_mc:horseshoe_crystal", chance = 1, count = {1, 1}, y = {-31000, 31000}},
	})
end

if minetest.get_modpath("bones_loot") then
	bones_loot.register_loot({
		{name = "mobs_mc:totem", chance = 0.1, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:carrot_on_a_stick", chance = 15, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horse_armor_iron", chance = 10, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horse_armor_gold", chance = 7, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horse_armor_diamond", chance = 3, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horseshoe_steel", chance = 10, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horseshoe_bronze", chance = 7, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horseshoe_mese", chance = 5, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horseshoe_diamond", chance = 3, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:horseshoe_crystal", chance = 1, count = {1, 1}, types = {"underworld_warrior"}},
	})
end

if minetest.get_modpath("handle_schematics") then
	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:totem",
		1,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:carrot_on_a_stick",
		15,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horse_armor_iron",
		10,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horse_armor_gold",
		7,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horse_armor_diamond",
		3,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horseshoe_steel",
		10,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horseshoe_bronze",
		7,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horseshoe_mese",
		5,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horseshoe_diamond",
		3,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})

	table.insert(handle_schematics.random_chest_content, {
		"mobs_mc:horseshoe_crystal",
		1,
		1,
		1,
		chest_default = 1,
		farm_tiny = 1,
		farm_full = 1,
		shed = 1,
		hut = 1,
		chest_work = 1,
		lumberjack = 1,
		forge = 1,
		guard = 1,
		ship = 1,
		church = 1,
		library = 1,
		chest_private = 1,
		wreck = 1,
		tavern = 1,
		inn = 1,
		bakery = 1,
		shelf = 1,
	})
end
