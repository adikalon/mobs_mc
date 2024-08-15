local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("mobs_mc:dog", {
	type = "animal",
	hp_min = 20,
	hp_max = 20,
	passive = true,
	group_attack = true,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.84, 0.3},
	visual = "mesh",
	mesh = "mobs_mc_dog.b3d",
	textures = {
		{"mobs_mc_dog.png"},
	},
	visual_size = {x = 3, y = 3},
	makes_footstep_sound = true,
	owner = "",
	order = "roam",
	owner_loyal = true,
	sounds = {
		random = "mobs_dog_random",
		distance = 16,
	},
	pathfinding = 1,
	floats = 1,
	view_range = 16,
	walk_chance = 50,
	walk_velocity = 2,
	run_velocity = 3,
	stepheight = 1.1,
	damage = 4,
	reach = 2,
	attack_type = "dogfight",
	fear_height = 4,
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 0,
	drops = mobs_mc.drops.dog,
	follow = mobs_mc.follows.dog,
	replace_what = mobs_mc.replaces.dog,
	specific_attack = mobs_mc.attacks.dog,

	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 4, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		if self.owner and self.owner == clicker:get_player_name() then
			if not self.order or self.order == "" or self.order == "sit" then
				self.order = "roam"
				self.walk_chance = 50
				self.jump = true
			else
				self.order = "sit"
				self.walk_chance = 0
				self.jump = false
			end
		end
	end,

	animation = {
		speed_normal = 50,
		speed_run = 100,
		stand_start = 40,
		stand_end = 45,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
	},

	jump = true,
	attacks_monsters = true,
})

mobs:register_egg("mobs_mc:dog", S("Dog"), "mobs_mc_spawn_icon_dog.png", 0)

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.dog)
end
