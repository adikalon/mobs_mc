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

-- egg throwing item
-- egg entity
if c("egg") then
	local egg_GRAVITY = 9
	local egg_VELOCITY = 19

	mobs:register_arrow("mobs_mc:egg_entity", {
		visual = "sprite",
		visual_size = {x=.5, y=.5},
		textures = {"mobs_chicken_egg.png"},
		velocity = egg_VELOCITY,

		hit_player = function(self, player)
			player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
				full_punch_interval = 1.0,
				damage_groups = {},
			}, nil)
		end,

		hit_mob = function(self, player)
			player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
				full_punch_interval = 1.0,
				damage_groups = {},
			}, nil)
		end,

		hit_node = function(self, pos, node)

			if math.random(1, 10) > 1 then
				return
			end

			pos.y = pos.y + 1

			local nod = minetest.get_node_or_nil(pos)

			if not nod
			or not minetest.registered_nodes[nod.name]
			or minetest.registered_nodes[nod.name].walkable == true then
				return
			end

			local mob = minetest.add_entity(pos, "mobs_mc:chicken")
			local ent2 = mob:get_luaentity()

			mob:set_properties({
				visual_size = {
					x = ent2.base_size.x / 2,
					y = ent2.base_size.y / 2
				},
				collisionbox = {
					ent2.base_colbox[1] / 2,
					ent2.base_colbox[2] / 2,
					ent2.base_colbox[3] / 2,
					ent2.base_colbox[4] / 2,
					ent2.base_colbox[5] / 2,
					ent2.base_colbox[6] / 2
				},
			})

			ent2.child = true
			ent2.tamed = true
			ent2.owner = self.playername
		end
	})

	-- shoot egg
	local mobs_shoot_egg = function (item, player, pointed_thing)

		local playerpos = player:getpos()

		minetest.sound_play("default_place_node_hard", {
			pos = playerpos,
			gain = 1.0,
			max_hear_distance = 5,
		})

		local obj = minetest.add_entity({
			x = playerpos.x,
			y = playerpos.y +1.5,
			z = playerpos.z
		}, "mobs_mc:egg_entity")

		local ent = obj:get_luaentity()
		local dir = player:get_look_dir()

		ent.velocity = egg_VELOCITY -- needed for api internal timing
		ent.switch = 1 -- needed so that egg doesn't despawn straight away

		obj:setvelocity({
			x = dir.x * egg_VELOCITY,
			y = dir.y * egg_VELOCITY,
			z = dir.z * egg_VELOCITY
		})

		obj:setacceleration({
			x = dir.x * -3,
			y = -egg_GRAVITY,
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

	minetest.register_craftitem("mobs_mc:egg", {
		description = S("Egg"),
		_doc_items_longdesc = S("Eggs can be thrown and break on impact. There is a small chance that 1 or even 4 chicks will pop out"),
		_doc_items_usagehelp = how_to_throw,
		inventory_image = "mobs_chicken_egg.png",
		on_use = mobs_shoot_egg,
	})
end

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
