--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

local path = minetest.get_modpath("mobs_mc")

if not minetest.get_modpath("mobs_mc_gameconfig") then
	mobs_mc = {}
end

function mobs_mc.load_setting(sname, stype, defaultval, valid_values)
	local sval
	if stype == "string" then
		sval = minetest.settings:get(sname)
	elseif stype == "bool" then
		sval = minetest.settings:get_bool(sname)
	elseif stype == "number" then
		sval = tonumber(minetest.settings:get(sname))
	end
	if sval ~= nil then
		if valid_values ~= nil then
			local valid = false
			for i=1,#valid_values do
				if sval == valid_values[i] then
					valid = true
				end
			end
			if not valid then
				minetest.log("error", "[mobs_mc] Invalid value for "..sname.."! Using default value ("..tostring(defaultval)..").")
				return defaultval
			else
				return sval
			end
		else
			return sval
		end
	else
		return defaultval
	end
end

mobs_mc.tools = {}

-- TODO: Understand and simplify/remove this block
-- This function checks if the item ID has been overwritten and returns true if it is unchanged
if minetest.get_modpath("mobs_mc_gameconfig") and mobs_mc.override and mobs_mc.override.items then
	mobs_mc.is_item_variable_overridden = function(id)
		return mobs_mc.override.items[id] == nil
	end
else
	-- No items are overwritten, so always return true
	mobs_mc.is_item_variable_overridden = function(id)
		return true
	end
end

--MOB ITEMS SELECTOR SWITCH
dofile(path .. "/0_gameconfig.lua")
--Items
dofile(path .. "/1_items_default.lua")

-- Bow, arrow and throwables
dofile(path .. "/2_throwing.lua")

-- Shared functions
dofile(path .. "/3_shared.lua")

--Mob heads
dofile(path .. "/4_heads.lua")

-- Animals
dofile(path .. "/bat.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/killer_bunny.lua") -- Mesh and animation byExeterDad
dofile(path .. "/mooshroom.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/horse.lua") -- KrupnoPavel; Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/llama.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/ocelot.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/parrot.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/pig.lua") -- Mesh and animation by Pavel_S
dofile(path .. "/dog.lua") -- KrupnoPavel
dofile(path .. "/squid.lua") -- Animation, sound and egg texture by daufinsyd

-- NPCs
dofile(path .. "/villager.lua") -- KrupnoPavel Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/agent.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

-- Illagers and witch
dofile(path .. "/villager_evoker.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_vindicator.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_zombie.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

dofile(path .. "/witch.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

--Monsters
dofile(path .. "/blaze.lua") -- Animation by daufinsyd
dofile(path .. "/creeper.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/ender_dragon.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/enderman.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/endermite.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_illusioner.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/ghast.lua") -- maikerumine
dofile(path .. "/guardian.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/guardian_elder.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/snowman.lua")
dofile(path .. "/iron_golem.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/shulker.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/silverfish.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/zombie.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/zombiepig.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/slime+magma_cube.lua") -- Wuzzy
dofile(path .. "/spider.lua") -- Spider by AspireMint (fishyWET (CC-BY-SA 3.0 license for texture)
dofile(path .. "/vex.lua") -- KrupnoPavel
dofile(path .. "/wither.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "[MOD] Mobs Redo 'MC' loaded")
end
