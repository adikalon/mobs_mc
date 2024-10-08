local path = minetest.get_modpath(minetest.get_current_modname())

mobs_mc = {}

mobs_mc.S = minetest.get_translator(minetest.get_current_modname())

mobs_mc.custom_spawn = false
local input = io.open(path .. "/spawn.lua", "r")

if input then
	mobs_mc.custom_spawn = true
	input:close()
	input = nil
end

-- CONFIG
dofile(path .. "/0_config.lua")

-- ITEMS
dofile(path .. "/1_items.lua")

-- GIFTS
dofile(path .. "/2_gifts.lua")

-- ANIMALS
dofile(path .. "/donkey.lua")
dofile(path .. "/mule.lua")
dofile(path .. "/llama.lua")
dofile(path .. "/ocelot.lua")
dofile(path .. "/pig.lua")
dofile(path .. "/dog.lua")
dofile(path .. "/squid.lua")
dofile(path .. "/parrot.lua")
dofile(path .. "/axolotl.lua")

-- NPCs
dofile(path .. "/villager.lua")

-- VILLAGERS AND WITCH
dofile(path .. "/evoker.lua")
dofile(path .. "/vindicator.lua")
dofile(path .. "/villager_zombie.lua")
dofile(path .. "/witch.lua")

-- MONSTERS
dofile(path .. "/blaze.lua")
dofile(path .. "/creeper.lua")
dofile(path .. "/enderman.lua")
dofile(path .. "/endermite.lua")
dofile(path .. "/illusioner.lua")
dofile(path .. "/ghast.lua")
dofile(path .. "/guardian.lua")
dofile(path .. "/guardian_elder.lua")
dofile(path .. "/snowman.lua")
dofile(path .. "/iron_golem.lua")
dofile(path .. "/shulker.lua")
dofile(path .. "/silverfish.lua")
dofile(path .. "/zombie.lua")
dofile(path .. "/husk.lua")
dofile(path .. "/zombie_pigman.lua")
dofile(path .. "/vex.lua")
dofile(path .. "/wither.lua")

if mobs_mc.custom_spawn then
	dofile(path .. "/spawn.lua")
end
