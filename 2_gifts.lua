if minetest.get_modpath("lootchests_default") then
	local items = {
		{"mobs_mc:totem"},
		{"mobs_mc:carrot_on_a_stick"},
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
	})
end

if minetest.get_modpath("bones_loot") then
	bones_loot.register_loot({
		{name = "mobs_mc:totem", chance = 0.1, count = {1, 1}, types = {"underworld_warrior"}},
		{name = "mobs_mc:carrot_on_a_stick", chance = 15, count = {1, 1}, types = {"underworld_warrior"}},
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
end
