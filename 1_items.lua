local S = minetest.get_translator(minetest.get_current_modname())

-- CARROT ON A STICK
minetest.register_tool("mobs_mc:carrot_on_a_stick", {
	description = S("Carrot on a Stick"),
	wield_image = "mcl_mobitems_carrot_on_a_stick.png",
	inventory_image = "mcl_mobitems_carrot_on_a_stick.png",
	sounds = { breaks = "default_tool_breaks" },
})

if mobs_mc.items.carrot then
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"},
			{"",            "group:stick", "farming:string"},
			{"group:stick", "",            mobs_mc.items.carrot},
		}
	})
end

-- TOTEM OF UNDYING
local totem_fail_nodes = {}
local hud_totem = {}

minetest.register_craftitem("mobs_mc:totem", {
	description = S("Totem of Undying"),
	inventory_image = "mcl_totems_totem.png",
	wield_image = "mcl_totems_totem.png",
	stack_max = 1,
})

minetest.register_on_leaveplayer(function(player)
	hud_totem[player:get_player_name()] = nil
end)

minetest.register_on_player_hpchange(function(player, hp_change)
	local hp = player:get_hp()

	if hp + hp_change <= 0 then
		local wield = player:get_wielded_item()

		if wield:get_name() == "mobs_mc:totem" then
			local ppos = player:get_pos()
			local pnname = minetest.get_node(ppos).name

			for n=1, #totem_fail_nodes do
				if pnname == totem_fail_nodes[n] then
					return hp_change
				end
			end

			if player:get_breath() < 11 then
				player:set_breath(10)
			end

			if not minetest.settings:get_bool("creative_mode") then
				wield:take_item()
				player:set_wielded_item(wield)
			end

			minetest.sound_play({name = "mcl_totems_totem", gain = 1}, {pos = ppos, max_hear_distance = 16})

			if not hud_totem[player:get_player_name()] then
				hud_totem[player:get_player_name()] = player:hud_add({
					hud_elem_type = "image",
					text = "mcl_totems_totem.png",
					position = {x = 0.5, y = 1},
					scale = {x = 17, y = 17},
					offset = {x = 0, y = -178},
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

			return -hp + 1
		end
	end

	return hp_change
end, true)

-- HORSE ARMOR
minetest.register_craftitem("mobs_mc:horse_armor_iron", {
	description = S("Iron Horse Armor"),
	inventory_image = "mobs_mc_iron_horse_armor.png",
	_horse_overlay_image = "mobs_mc_horse_armor_iron.png",
	stack_max = 1,
	groups = { horse_armor = 85 },
})

minetest.register_craftitem("mobs_mc:horse_armor_gold", {
	description = S("Golden Horse Armor"),
	inventory_image = "mobs_mc_gold_horse_armor.png",
	_horse_overlay_image = "mobs_mc_horse_armor_gold.png",
	stack_max = 1,
	groups = { horse_armor = 60 },
})

minetest.register_craftitem("mobs_mc:horse_armor_diamond", {
	description = S("Diamond Horse Armor"),
	inventory_image = "mobs_mc_diamond_horse_armor.png",
	_horse_overlay_image = "mobs_mc_horse_armor_diamond.png",
	stack_max = 1,
	groups = { horse_armor = 45 },
})

-- HORSE SHOES
minetest.register_craftitem("mobs_mc:horseshoe_steel", {
	description = S("Steel Horseshoes"),
	inventory_image = "mobs_mc_horseshoe_steel.png",
})

minetest.register_craftitem("mobs_mc:horseshoe_bronze", {
	description = S("Bronze Horseshoes"),
	inventory_image = "mobs_mc_horseshoe_bronze.png",
})

minetest.register_craftitem("mobs_mc:horseshoe_mese", {
	description = S("Mese Horseshoes"),
	inventory_image = "mobs_mc_horseshoe_mese.png",
})

minetest.register_craftitem("mobs_mc:horseshoe_diamond", {
	description = S("Diamond Horseshoes"),
	inventory_image = "mobs_mc_horseshoe_diamond.png",
})

if minetest.registered_items["ethereal:crystal_block"] and minetest.registered_items["ethereal:crystal_ingot"] then

	minetest.register_craftitem("mobs_mc:horseshoe_crystal", {
		description = S("Crystal Horseshoes"),
		inventory_image = "mobs_mc_horseshoe_crystal.png",
	})

	minetest.register_craft({
		output = "mobs_mc:horseshoe_crystal",
		recipe = {
			{"",                       "ethereal:crystal_block", ""                      },
			{"ethereal:crystal_ingot", "",                       "ethereal:crystal_ingot"},
			{"ethereal:crystal_ingot", "",                       "ethereal:crystal_ingot"},
		}
	})
end

mobs_mc.shoes = {
	["mobs_mc:horseshoe_steel"] = {7, 4, 2, "mobs_mc_horseshoe_steelo.png"},
	["mobs_mc:horseshoe_bronze"] = {7, 4, 4, "mobs_mc_horseshoe_bronzeo.png"},
	["mobs_mc:horseshoe_mese"] = {9, 5, 8, "mobs_mc_horseshoe_meseo.png"},
	["mobs_mc:horseshoe_diamond"] = {10, 6, 6, "mobs_mc_horseshoe_diamondo.png"},
	["mobs_mc:horseshoe_crystal"] = {11, 6, 6, "mobs_mc_horseshoe_crystalo.png"}
}

-- HEADS
local function addhead(mobname, desc)
	minetest.register_node("mobs_mc:head_" .. mobname, {
		description = desc,
		drawtype = "nodebox",
		is_ground_content = false,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25},
			},
		},
		groups = {oddly_breakable_by_hand = 3, head = 1},
		tiles = {
			"[combine:16x16:-4,4=mobs_mc_" .. mobname .. ".png",
			"([combine:16x16:-4,4=mobs_mc_" .. mobname .. ".png)^([combine:16x16:-12,4=mobs_mc_" .. mobname .. ".png)",
			"[combine:16x16:-12,0=mobs_mc_" .. mobname .. ".png",
			"[combine:16x16:4,0=mobs_mc_" .. mobname .. ".png",
			"[combine:16x16:-20,0=mobs_mc_" .. mobname .. ".png",
			"[combine:16x16:-4,0=mobs_mc_" .. mobname .. ".png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		walkable = true,
		sounds = default.node_sound_defaults({
			footstep = {name = "default_hard_footstep", gain = 0.3}
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.0, 0.25},
		},
	})
end

addhead("zombie", S("Zombie Head"))
addhead("creeper", S("Creeper Head"))
