local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:illusioner", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	passive = false,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_mc:arrow_entity",
	shoot_offset = 1.5,
	hp_min = 32,
	hp_max = 32,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.94, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_illusioner.b3d",
	textures = {
		{
			"mobs_mc_illusionist.png",
			"mobs_mc_illusionist.png",
			"mcl_throwing_bow.png",
		},
	},
	visual_size = {x = 3, y = 3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		walk_speed = 25,
		run_speed = 25,
		stand_start = 40,
		stand_end = 59,
		walk_start = 0,
		walk_end = 40,
		shoot_start = 150,
		shoot_end = 170,
	},
	view_range = 16,
	fear_height = 4,
	lava_damage = 4,
	light_damage = 2,
	water_damage = 0.01,
	fall_damage = true,
	drops = mobs_mc.drops.illusioner,
})

minetest.register_node("mobs_mc:arrow_box", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-6.5/17, -1.5/17, -1.5/17, 6.5/17, 1.5/17, 1.5/17},
			{-4.5/17, 2.5/17, 2.5/17, -3.5/17, -2.5/17, -2.5/17},
			{-8.5/17, 0.5/17, 0.5/17, -6.5/17, -0.5/17, -0.5/17},
			{6.5/17, 1.5/17, 1.5/17, 7.5/17, 2.5/17, 2.5/17},
			{7.5/17, -2.5/17, 2.5/17, 6.5/17, -1.5/17, 1.5/17},
			{7.5/17, 2.5/17, -2.5/17, 6.5/17, 1.5/17, -1.5/17},
			{6.5/17, -1.5/17, -1.5/17, 7.5/17, -2.5/17, -2.5/17},
			{7.5/17, 2.5/17, 2.5/17, 8.5/17, 3.5/17, 3.5/17},
			{8.5/17, -3.5/17, 3.5/17, 7.5/17, -2.5/17, 2.5/17},
			{8.5/17, 3.5/17, -3.5/17, 7.5/17, 2.5/17, -2.5/17},
			{7.5/17, -2.5/17, -2.5/17, 8.5/17, -3.5/17, -3.5/17},
		}
	},
	tiles = {
		"mcl_throwing_arrow.png^[transformFX",
		"mcl_throwing_arrow.png^[transformFX",
		"mcl_throwing_arrow_back.png",
		"mcl_throwing_arrow_front.png",
		"mcl_throwing_arrow.png",
		"mcl_throwing_arrow.png^[transformFX",
	},
	groups = {not_in_creative_inventory = 1},
})

minetest.register_entity("mobs_mc:arrow_entity", {
	physical = false,
	timer = 0,
	visual = "wielditem",
	visual_size = {x = 0.1, y = 0.1},
	textures = {"mobs_mc:arrow_box"},
	velocity = 10,
	lastpos = {},
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_step = function(self, dtime)
		self.timer=self.timer+dtime
		local pos = self.object:getpos()
		local node = minetest.get_node(pos)

		minetest.add_particle({
			pos = pos,
			velocity = {x = 0, y = 0, z = 0},
			acceleration = {x = 0, y = 0, z = 0},
			expirationtime = .3,
			size = 1,
			collisiondetection = false,
			vertical = false,
			texture = "mobs_mc_arrow_particle.png",
		})

		if self.timer > 0.2 then
			local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)

			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_mc:arrow_entity" and obj:get_luaentity().name ~= "__builtin:item" then
						local damage = 3
						minetest.sound_play("damage", {pos = pos})

						obj:punch(self.object, 1.0, {
							full_punch_interval = 1.0,
							damage_groups={fleshy = damage},
						}, nil)

						self.object:remove()
					end
				else
					local damage = 3
					minetest.sound_play("damage", {pos = pos})

					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups={fleshy = damage},
					}, nil)

					self.object:remove()
				end
			end
		end

		if self.lastpos.x ~= nil then
			if node.name ~= "air" then
				minetest.sound_play("bowhit1", {pos = pos})
				minetest.add_item(self.lastpos, 'mobs_mc:arrow')
				self.object:remove()
			end
		end

		self.lastpos = {x = pos.x, y = pos.y, z = pos.z}
	end
})

mobs:register_egg("mobs_mc:illusioner", S("Illusioner"), "mobs_mc_spawn_icon_illusioner.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.illusioner then
	mobs:spawn(mobs_mc.spawns.illusioner)
end
