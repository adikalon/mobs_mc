--MCmobs v0.5
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

--maikerumines throwing code
--arrow (weapon)

local c = mobs_mc.is_item_variable_overridden

-- Snowball

local snowball_GRAVITY = 9
local snowball_VELOCITY = 19

mobs:register_arrow("mobs_mc:snowball_entity", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mcl_throwing_snowball.png"},
	velocity = snowball_VELOCITY,

	hit_player = function(self, player)
		-- FIXME: No knockback
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {},
		}, nil)
	end,

	hit_mob = function(self, mob)
		-- Hurt blazes, but not damage to anything else
		local dmg = {}
		if mob:get_luaentity().name == "mobs_mc:blaze" then
			dmg = {fleshy = 3}
		end
		-- FIXME: No knockback
		mob:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = dmg,
		}, nil)
	end,

})

if c("snowball") then
	-- shoot snowball
	local mobs_shoot_snowball = function (item, player, pointed_thing)

		local playerpos = player:getpos()

		local obj = minetest.add_entity({
			x = playerpos.x,
			y = playerpos.y +1.5,
			z = playerpos.z
		}, "mobs_mc:snowball_entity")

		local ent = obj:get_luaentity()
		local dir = player:get_look_dir()

		ent.velocity = snowball_VELOCITY -- needed for api internal timing
		ent.switch = 1 -- needed so that egg doesn't despawn straight away

		obj:setvelocity({
			x = dir.x * snowball_VELOCITY,
			y = dir.y * snowball_VELOCITY,
			z = dir.z * snowball_VELOCITY
		})

		obj:setacceleration({
			x = dir.x * -3,
			y = -snowball_GRAVITY,
			z = dir.z * -3
		})

		-- pass player name to egg for chick ownership
		local ent2 = obj:get_luaentity()
		ent2.playername = player:get_player_name()

		if not minetest.settings:get_bool("creative_mode") then
			item:take_item()
		end

		return item
	end


	-- Snowball
	minetest.register_craftitem("mobs_mc:snowball", {
		description = S("Snowball"),
		_doc_items_longdesc = S("Snowballs can be thrown at your enemies. A snowball deals 3 damage to blazes, but is harmless to anything else."),
		_doc_items_usagehelp = how_to_throw,
		inventory_image = "mcl_throwing_snowball.png",
		on_use = mobs_shoot_snowball,
	})
end

--end maikerumine code

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC mobs loaded")
end
