local S = minetest.get_translator(minetest.get_current_modname())

-- ENDER DRAGON
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
	groups = {
		snappy = 1,
		falling_node = 1,
		deco_block = 1,
		not_in_creative_inventory = 1,
		dig_by_piston = 1,
	},
	sounds = default.node_sound_stone_defaults(),
})

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

-- ROTTEN FLESH
minetest.register_craftitem("mobs_mc:rotten_flesh", {
	description = S("Rotten Flesh"),
	inventory_image = "mcl_mobitems_rotten_flesh.png",
	groups = {food = 2, eatable = -4},
	on_use = minetest.item_eat(-4),
})

-- SPIDER EYE
minetest.register_craftitem("mobs_mc:spider_eye", {
	description = S("Spider Eye"),
	inventory_image = "mcl_mobitems_spider_eye.png",
	wield_image = "mcl_mobitems_spider_eye.png",
	groups = {food = 2, eatable = -2},
	on_use = minetest.item_eat(-2),
})

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
