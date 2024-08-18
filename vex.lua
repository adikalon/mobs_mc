local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:vex", {
	type = "monster",
	pathfinding = 1,
	passive = false,
	attack_type = "dogfight",
	physical = false,
	hp_min = 14,
	hp_max = 14,
	collisionbox = {-0.2, 0.2, -0.2, 0.2, 1.0, 0.2},
	visual = "mesh",
	mesh = "mobs_mc_vex.b3d",
	textures = {
		{"mobs_mc_vex.png^mobs_mc_vex_sword.png"},
	},
	visual_size = {x = 1.25, y = 1.25},
	damage = 9,
	reach = 2,
	view_range = 16,
	walk_velocity = 3.2,
	run_velocity = 5.9,
	attack_type = "dogfight",
	sounds = {
		death = "mobs_mc_vex_death",
		damage = "mobs_mc_vex_hurt",
	},
	animation = {
		stand_speed = 25,
		walk_speed = 25,
		run_speed = 50,
		stand_start = 40,
		stand_end = 80,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},
	drops = mobs_mc.drops.vex,

	do_custom = function(self, dtime)
		if self.state == "attack" then
			if self.base_texture[1] ~= "mobs_mc_vex_charging.png^mobs_mc_vex_sword.png" then
				self.base_texture = {"mobs_mc_vex_charging.png^mobs_mc_vex_sword.png"}
				self.object:set_properties({textures=self.base_texture})
			end
		else
			if self.base_texture[1] ~= "mobs_mc_vex.png^mobs_mc_vex_sword.png" then
				self.base_texture = {"mobs_mc_vex.png^mobs_mc_vex_sword.png"}
				self.object:set_properties({textures=self.base_texture})
			end
		end

		if self._summoned then
			if not self._lifetimer then
				self._lifetimer = 33
			end

			self._lifetimer = self._lifetimer - dtime

			if self._lifetimer <= 0 then
				if self._damagetimer then
					self._damagetimer = self._damagetimer - 1
				end

				self.object:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups = {fleshy = 2},
				}, nil)

				self._damagetimer = 1
			end
		end
	end,

	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fly = true,
	fly_in = {"air"},
})

mobs:register_egg("mobs_mc:vex", S("Vex"), "mobs_mc_spawn_icon_vex.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.vex)
end
