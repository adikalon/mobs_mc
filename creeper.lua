mobs:register_mob("mobs_mc:creeper", {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	passive = false,
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.69, 0.3},
	pathfinding = 1,
	visual = "mesh",
	mesh = "mobs_mc_creeper.b3d",
	textures = {
		{"mobs_mc_creeper.png"},
	},
	visual_size = {x = 3, y = 3},
	sounds = {
		attack = "tnt_ignite",
		fuse = "tnt_ignite",
		explode = "tnt_explode",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.05,
	run_velocity = 2.1,
	runaway_from = {"mobs_mc:ocelot", "mobs_animal:kitten"},
	attack_type = "explode",
	explosion_radius = 3,
	reach = 4,
	explosion_damage_radius = 7,
	explosion_timer = 1.5,
	allow_fuse_reset = true,
	stop_to_explode = true,
	maxdrops = 2,
	drops = mobs_mc.drops.creeper,
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 110,
		hurt_end = 139,
		death_start = 140,
		death_end = 189,
		look_start = 50,
		look_end = 108,
	},
	floats = 1,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	view_range = 16,
	blood_amount = 0,
	fall_damage = true,

	on_rightclick = function(self, clicker)
		if self._forced_explosion_countdown_timer ~= nil then
			return
		end

		local item = clicker:get_wielded_item()

		if item:get_name() == "fire:flint_and_steel" then
			local wdef = item:get_definition()
			-- item:add_wear(1000)

			if item:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = clicker:getpos(), gain = 0.5})
			end

			clicker:set_wielded_item(item)
			self._forced_explosion_countdown_timer = self.explosion_timer * 2
			minetest.sound_play(self.sounds.attack, {pos = self.object:getpos(), gain = 1, max_hear_distance = 16})
		end
	end,

	do_custom = function(self, dtime)
		if self._forced_explosion_countdown_timer ~= nil then
			self._forced_explosion_countdown_timer = self._forced_explosion_countdown_timer - dtime
			if self._forced_explosion_countdown_timer <= 0 then
				mobs:explosion(self.object:getpos(), self.explosion_radius, 0, 1, self.sounds.explode)
				self.object:remove()
			end
		end
	end,
})

mobs:register_egg("mobs_mc:creeper", mobs_mc.S("Creeper"), "mobs_mc_spawn_icon_creeper.png", 0)

if not mobs_mc.custom_spawn and mobs_mc.spawns.creeper then
	mobs:spawn(mobs_mc.spawns.creeper)
end
