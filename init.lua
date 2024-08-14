local path = minetest.get_modpath(minetest.get_current_modname())

mobs_mc = {}

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

-- ANIMALS
dofile(path .. "/killer_bunny.lua")
dofile(path .. "/mooshroom.lua")
dofile(path .. "/skeleton_horse.lua")
dofile(path .. "/zombie_horse.lua")
dofile(path .. "/donkey.lua")
dofile(path .. "/mule.lua")
dofile(path .. "/llama.lua")
dofile(path .. "/ocelot.lua")
dofile(path .. "/pig.lua")
dofile(path .. "/dog.lua")
dofile(path .. "/squid.lua")

-- NPCs
dofile(path .. "/villager.lua")

-- VILLAGERS AND WITCH
dofile(path .. "/villager_evoker.lua")
dofile(path .. "/villager_vindicator.lua")
dofile(path .. "/villager_zombie.lua")
dofile(path .. "/witch.lua")

-- MONSTERS
dofile(path .. "/blaze.lua")
dofile(path .. "/creeper.lua")
dofile(path .. "/enderman.lua")
dofile(path .. "/endermite.lua")
dofile(path .. "/villager_illusioner.lua")
dofile(path .. "/ghast.lua")
dofile(path .. "/guardian.lua")
dofile(path .. "/guardian_elder.lua")
dofile(path .. "/snowman.lua")
dofile(path .. "/iron_golem.lua")
dofile(path .. "/shulker.lua")
dofile(path .. "/silverfish.lua")
dofile(path .. "/zombie.lua")
dofile(path .. "/zombiepig.lua")
dofile(path .. "/slime+magma_cube.lua")
dofile(path .. "/spider.lua")
dofile(path .. "/vex.lua")
dofile(path .. "/wither.lua")

if mobs_mc.custom_spawn then
	dofile(path .. "/spawn.lua")
end
