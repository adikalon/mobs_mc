--License for code WTFPL and otherwise stated in readmes

local S = minetest.get_translator(minetest.get_current_modname())

local dog = {
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
	visual_size = {x = 2.7, y = 2.7},
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
	follow = {"mobs:meat", "mobs:meat_raw", "mobs_mc:rotten_flesh"},

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
}

mobs:register_mob("mobs_mc:dog", dog)

mobs:spawn({
	name = "mobs_mc:killer_bunny",
	nodes = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter", "default:dirt", "default:dirt_with_snow", "default:snow", "default:snowblock"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true
})

mobs:register_egg("mobs_mc:dog", S("Dog"), "mobs_mc_spawn_icon_dog.png", 0)
