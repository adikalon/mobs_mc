--[[ This table contains the concrete itemstrings to be used by this mod.
All mobs in this mod must use variables in this table, instead
of hardcoding the itemstring.
This way, external mods are enabled to replace the itemstrings to provide
their own items and game integration is made much simpler.

An item IDs is supposed to be overwritten by adding
mobs_mc.override.items["example:item"] in a game mod
with name "mobs_mc_gameconfig". ]]


-- Standard items

-- If true, mobs_mc adds the monster egg nodes (needs default mod).
-- Set to false in your gameconfig mod if you create your own monster egg nodes.

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

mobs_mc.items = {}

mobs_mc.items = {
	rabbit_raw = (minetest.registered_items["mobs:rabbit_raw"] and "mobs:rabbit_raw" or nil),
	rabbit_hide = (minetest.registered_items["mobs:rabbit_hide"] and "mobs:rabbit_hide" or nil),
	bucket_milk = (minetest.registered_items["mobs:bucket_milk"] and "mobs:bucket_milk" or nil),
	wooden_bucket_milk = (minetest.registered_items["mobs:wooden_bucket_milk"] and "mobs:wooden_bucket_milk" or nil),
	pork_raw = (minetest.registered_items["mobs:pork_raw"] and "mobs:pork_raw" or nil),
	carrot = (minetest.registered_items["farming:carrot"] and "farming:carrot" or nil),
	bone = (minetest.registered_items["bonemeal:bone"] and "bonemeal:bone" or nil),








	-- Items defined in mobs_mc
	dragon_egg = "mobs_mc:dragon_egg",
	egg = "mobs_mc:egg",
	spider_eye = "mobs_mc:spider_eye",
	totem = "mobs_mc:totem",
	head_creeper = "mobs_mc:head_creeper",
	head_zombie = "mobs_mc:head_zombie",

	-- External items
	-- Mobs Redo
	shears = "mobs:shears",

	-- Minetest Game
	top_snow = "default:snow",
	snow_block = "default:snowblock",
	mushroom_red = "flowers:mushroom_red",
	grass_block = "default:dirt_with_grass",
	string = "farming:string",
	stick = "default:stick",
	flint = "default:flint",
	iron_ingot = "default:steel_ingot",
	iron_block = "default:steelblock",
	fire = "fire:basic_flame",
	gunpowder = "tnt:gunpowder",
	flint_and_steel = "fire:flint_and_steel",
	water_source = "default:water_source",
	river_water_source = "default:river_water_source",
	black_dye = "dye:black",
	poppy = "flowers:rose",
	dandelion = "flowers:dandelion_yellow",
	coal = "default:coal_lump",
	emerald = "default:diamond",
	iron_axe = "default:axe_steel",
	gold_sword = "default:sword_mese",
	gold_ingot = "default:gold_ingot",
	gold_nugget = "default:gold_lump",
	glowstone_dust = "default:mese_crystal_fragment",
	redstone = "default:mese_crystal_fragment",
	glass_bottle = "vessels:glass_bottle",
	sugar = "default:papyrus",
	hay_bale = "farming:straw",
	prismarine_shard = "default:mese_crystal_fragment",
	prismarine_crystals = "default:mese_crystal",
	apple = "default:apple",
	golden_apple = "default:apple",

	-- Boss items
	wet_sponge = "default:gold_block", -- only dropped by elder guardian; there is no equivalent block in Minetest Game

	-- Other
	nether_brick_block = "nether:brick",
	mycelium = "ethereal:mushroom_dirt",
	potato = "farming:potato",
	fishing_rod = "fishing:pole_wood",
	fish_raw = "fishing:fish_raw",
	salmon_raw = "fishing:carp_raw",
	clownfish_raw = "fishing:clownfish_raw",
	pufferfish_raw = "fishing:pike_raw",

	-- TODO: Add actual ender pearl
	ender_pearl = "farorb:farorb",

	nether_portal = "nether:portal",
	netherrack = "nether:rack",
	nether_brick_block = "nether:brick",

	-- Special items
	music_discs = {}, -- No music discs by default; used by creeper. Override this if your game has music discs.
}

-- Tables for attracting, feeding and breeding mobs
mobs_mc.follow = {
	-- TODO: Edit this
	pig = { mobs_mc.items.potato, mobs_mc.items.carrot, "mobs_mc:carrot_on_a_stick", mobs_mc.items.apple },
}

-- Contents for replace_what
mobs_mc.replace = {
	-- Silverfish populate stone, etc. with monster eggs
	silverfish = {
		{"default:stone", "mobs_mc:monster_egg_stone", -1},
		{"default:cobble", "mobs_mc:monster_egg_cobble", -1},
		{"default:mossycobble", "mobs_mc:monster_egg_mossycobble", -1},
		{"default:stonebrick", "mobs_mc:monster_egg_stonebrick", -1},
		{"default:stone_block", "mobs_mc:monster_egg_stone_block", -1},
	},
}

-- List of nodes which endermen can take
mobs_mc.enderman_takable = {
	-- Generic handling, useful for entensions
	"group:enderman_takable",

	-- Generic nodes
	"group:sand",
	"group:flower",

	-- Minetest Game
	"default:dirt",
	"default:dirt_with_grass",
	"default:dirt_with_dry_grass",
	"default:dirt_with_snow",
	"default:dirt_with_rainforest_litter",
	"default:dirt_with_grass_footsteps",
-- FIXME: For some reason, Minetest has a Lua error when an enderman tries to place a Minetest Game cactus.
-- Maybe this is because default:cactus has rotate_and_place?
--	"default:cactus", -- TODO: Re-enable cactus when it works again
	"default:gravel",
	"default:clay",
	"flowers:mushroom_red",
	"flowers:mushroom_brown",
	"tnt:tnt",

	-- Nether mod
	"nether:rack",
}

--[[ Table of nodes to replace when an enderman takes it.
If the enderman takes an indexed node, it the enderman will get the item in the value.
Table indexes: Original node, taken by enderman.
Table values: The item which the enderman *actually* gets
Example:
	mobs_mc.enderman_node_replace = {
		["default:dirt_with_dry_grass"] = "default_dirt_with_grass",
	}
-- This means, if the enderman takes a dirt with dry grass, he will get a dirt with grass
-- on his hand instead.
]]
mobs_mc.enderman_replace_on_take = {} -- no replacements by default

-- A table which can be used to override block textures of blocks carried by endermen.
-- Only works for cube-shaped nodes and nodeboxes.
-- Key: itemstrings of the blocks to replace
-- Value: A table with the texture overrides (6 textures)
mobs_mc.enderman_block_texture_overrides = {
}

-- List of nodes on which mobs can spawn
mobs_mc.spawn = {
	solid = { "group:cracky", "group:crumbly", "group:shovely", "group:pickaxey" }, -- spawn on "solid" nodes (this is mostly just guessing)

	grassland = { mobs_mc.items.grass_block, "ethereal:prairie_dirt" },
	savanna = { "default:dirt_with_dry_grass" },
	grassland_savanna = { mobs_mc.items.grass_block, "default:dirt_with_dry_grass" },
	desert = { "default:desert_sand", "group:sand" },
	jungle = { "default:dirt_with_rainforest_litter", "default:jungleleaves", "default:junglewood", "mcl_core:jungleleaves", "mcl_core:junglewood" },
	snow = { "default:snow", "default:snowblock", "default:dirt_with_snow" },
	end_city = { "default:sandstonebrick", "mcl_end:purpur_block", "mcl_end:end_stone" },
	village = { "mg_villages:road" },

	-- These probably don't need overrides
	mushroom_island = { mobs_mc.items.mycelium, "mcl_core:mycelium" },
	nether_fortress = { mobs_mc.items.nether_brick_block, "mcl_nether:nether_brick", "mcl_portals:nether_air"  },
	nether = { mobs_mc.items.netherrack, "mcl_nether:netherrack", "mcl_portals:nether_air" },
	nether_portal = { mobs_mc.items.nether_portal, "mcl_portals:portal" },
	water = { mobs_mc.items.water_source, "mcl_core:water_source", "default:water_source" },
}

-- TODO: Remove this block
-- This table contains important spawn height references for the mob spawn height.
-- Please base your mob spawn height on these numbers to keep things clean.
mobs_mc.spawn_height = {
	water = tonumber(minetest.setting_get("water_level")) or 0, -- Water level in the Overworld

	-- Overworld boundaries (inclusive)
	overworld_min = -2999,
	overworld_max = 31000,

	-- Nether boundaries (inclusive)
	nether_min = -3369,
	nether_max = -3000,

	-- End boundaries (inclusive)
	end_min = -6200,
	end_max = -6000,
}

mobs_mc.misc = {
	shears_wear = 276, -- Wear to add per shears usage (238 uses)
	totem_fail_nodes = {} -- List of nodes in which the totem of undying fails
}

-- Item name overrides from mobs_mc_gameconfig (if present)
if minetest.get_modpath("mobs_mc_gameconfig") and mobs_mc.override then
	local tables = {"items", "follow", "replace", "spawn", "spawn_height", "misc"}
	for t=1, #tables do
		local tbl = tables[t]
		if mobs_mc.override[tbl] then
			for k, v in pairs(mobs_mc.override[tbl]) do
				mobs_mc[tbl][k] = v
			end
		end
	end

	if mobs_mc.override.enderman_takable then
		mobs_mc.enderman_takable = mobs_mc.override.enderman_takable
	end
	if mobs_mc.override.enderman_replace_on_take then
		mobs_mc.enderman_replace_on_take = mobs_mc.override.enderman_replace_on_take
	end
	if mobs_mc.enderman_block_texture_overrides then
		mobs_mc.enderman_block_texture_overrides = mobs_mc.override.enderman_block_texture_overrides
	end
end
