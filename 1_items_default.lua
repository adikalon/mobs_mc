--MCmobs v0.5
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--THIS IS THE MASTER ITEM LIST TO USE WITH DEFAULT

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local c = mobs_mc.is_item_variable_overridden

-- Ender dragon
if c("dragon_egg") then

	local dragon_egg_sounds
	if minetest.get_modpath("default") then
		dragon_egg_sounds = default.node_sound_stone_defaults()
	end

	--ender dragon
	minetest.register_node("mobs_mc:dragon_egg", {
		description = S("Dragon Egg"),
		tiles = {
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
		},
		drawtype = "nodebox",
		is_ground_content = false,
		paramtype = "light",
		light_source = 1,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375},
				{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5},
				{-0.4375, -0.1875, -0.4375, 0.4375, 0, 0.4375},
				{-0.375, 0, -0.375, 0.375, 0.125, 0.375},
				{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
				{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
				{-0.1875, 0.3125, -0.1875, 0.1875, 0.375, 0.1875},
				{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
				{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625},
			}
		},
		selection_box = {
			type = "regular",
		},
		groups = {snappy = 1, falling_node = 1, deco_block = 1, not_in_creative_inventory = 1, dig_by_piston = 1 },
		sounds = dragon_egg_sounds,
		-- TODO: Make dragon egg teleport on punching
	})
end

local longdesc_craftitem
if minetest.get_modpath("doc_items") then
	longdesc_craftitem = doc.sub.items.temp.craftitem
end

minetest.register_tool("mobs_mc:carrot_on_a_stick", {
	description = S("Carrot on a Stick"),
	_doc_items_longdesc = S("A carrot on a stick can be used on saddled pigs to ride them. Pigs will also follow anyone who holds a carrot on a stick near them."),
	_doc_items_usagehelp = S("Rightclick a saddled pig with the carrot on a stick to mount it. You can now ride it like a horse."),
	wield_image = "mcl_mobitems_carrot_on_a_stick.png",
	inventory_image = "mcl_mobitems_carrot_on_a_stick.png",
	sounds = { breaks = "default_tool_breaks" },
})

if mobs_mc.mods_enabled.farming then
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"},
			{"",            "group:stick", "farming:string"},
			{"group:stick", "",            "farming:carrot"},
		}
	})
end

-- Slime
if c("slimeball") then
	minetest.register_craftitem("mobs_mc:slimeball", {
		description = S("Slimeball"),
		_doc_items_longdesc = S("Slimeballs are used in crafting. They are dropped from slimes."),
		inventory_image = "mcl_mobitems_slimeball.png"
	})
	if minetest.get_modpath("mesecons_materials") then
		minetest.register_craft({
			output = "mesecons_materials:glue",
			recipe = {{ "mobs_mc:slimeball" }},
		})
	end
end

-- Spider
if c("spider_eye") then
	minetest.register_craftitem("mobs_mc:spider_eye", {
		description = S("Spider Eye"),
		_doc_items_longdesc = S("Spider eyes are used mainly in crafting and brewing. Spider eyes can be eaten, but they poison you and reduce your health by 2 hit points."),
		inventory_image = "mcl_mobitems_spider_eye.png",
		wield_image = "mcl_mobitems_spider_eye.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -2 },
		on_use = minetest.item_eat(-2),
	})
end

-- Evoker
if c("totem") then
	local hud_totem = {}

	-- Totem of Undying
	minetest.register_craftitem("mobs_mc:totem", {
		description = S("Totem of Undying"),
		_doc_items_longdesc = S("A totem of undying is a rare artifact which may safe you from certain death."),
		_doc_items_usagehelp = S("The totem only works while you hold it in your hand. If you receive fatal damage, you are saved from death and you get a second chance with 1 HP. The totem is destroyed in the process, however."),
		inventory_image = "mcl_totems_totem.png",
		wield_image = "mcl_totems_totem.png",
		stack_max = 1,
	})

	minetest.register_on_leaveplayer(function(player)
		hud_totem[player:get_player_name()] = nil
	end)

	-- Save the player from death when holding totem of undying in hand
	minetest.register_on_player_hpchange(function(player, hp_change)
		local hp = player:get_hp()
		-- Fatal damage?
		if hp + hp_change <= 0 then
			local wield = player:get_wielded_item()
			if wield:get_name() == "mobs_mc:totem" then
				local ppos = player:get_pos()
				local pnname = minetest.get_node(ppos).name
				-- Some exceptions when _not_ to save the player
				for n=1, #mobs_mc.misc.totem_fail_nodes do
					if pnname == mobs_mc.misc.totem_fail_nodes[n] then
						return hp_change
					end
				end
				-- Reset breath as well
				if player:get_breath() < 11 then
					player:set_breath(10)
				end
				if not minetest.settings:get_bool("creative_mode") then
					wield:take_item()
					player:set_wielded_item(wield)
				end
				-- Effects
				minetest.sound_play({name = "mcl_totems_totem", gain=1}, {pos=ppos, max_hear_distance=16})

				-- Big totem overlay
				if not hud_totem[player:get_player_name()] then
					hud_totem[player:get_player_name()] = player:hud_add({
						hud_elem_type = "image",
						text = "mcl_totems_totem.png",
						position = { x=0.5, y=1 },
						scale = { x=17, y=17 },
						offset = { x=0, y=-178 },
					})
					minetest.after(3, function(player)
						if player and player:is_player() then
							local name = player:get_player_name()
							if hud_totem[name] then
								player:hud_remove(hud_totem[name])
								hud_totem[name] = nil
							end
						end
					end, player)
				end

				-- Set HP to exactly 1
				return -hp + 1
			end
		end
		return hp_change
	end, true)
end

-- Rotten flesh
if c("rotten_flesh") then
	minetest.register_craftitem("mobs_mc:rotten_flesh", {
		description = S("Rotten Flesh"),
		_doc_items_longdesc = S("Yuck! This piece of flesh clearly has seen better days. Eating it will only poison you and reduces your health by 4 hit points. But tamed wolves can eat it just fine."),
		inventory_image = "mcl_mobitems_rotten_flesh.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -4 },
		on_use = minetest.item_eat(-4),
	})
end

if c("snowball") and minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs_mc:snowball 2",
		recipe = {
			{"default:snow"},
		},
	})
	minetest.register_craft({
		output = "default:snow 2",
		recipe = {
			{"mobs_mc:snowball", "mobs_mc:snowball"},
			{"mobs_mc:snowball", "mobs_mc:snowball"},
		},
	})
	-- Change the appearance of default snow to avoid confusion with snowball
	minetest.override_item("default:snow", {
		inventory_image = "",
		wield_image = "",
	})
end
