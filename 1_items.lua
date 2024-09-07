-- CARROT ON A STICK
minetest.register_tool("mobs_mc:carrot_on_a_stick", {
	description = mobs_mc.S("Carrot on a Stick"),
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
	description = mobs_mc.S("Totem of Undying"),
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
