--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local light_damage_min = 14 or (default.LIGHT_MAX / 2)
local light_damage_max = 16 or (default.LIGHT_MAX + 1)

local sounds = {
	random = "mobs_mc_skeleton_random",
	attack = "mobs_mc_skeleton_slash_attack",
	damage = "mobs_mc_skeleton_hurt",
	death = "mobs_mc_skeleton_death",
	distance = 16,
}

local fn_DamagePerSecond = function(self)

	-- direct sunlight returns full damage
	if sunlight then
		return 7
	end

	-- Constants
	local i_SECONDS_PER_DAY = 86400
	local i_SECONDS_PER_5_MINUTES = 300

	local i_hitPoints = self.health
	local i_timeSpeed = tonumber(minetest.settings:get("i_timeSpeed")) or 72

	if i_timeSpeed == 0 then
		i_timeSpeed = 1
	end

	local i_inGameDayLength = i_SECONDS_PER_DAY / i_timeSpeed
	local i_fiveInGameMinutes =
			(i_inGameDayLength * i_SECONDS_PER_5_MINUTES) / i_SECONDS_PER_DAY

	local i_damagePerSecond = i_hitPoints / i_fiveInGameMinutes

	return i_damagePerSecond
end

--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### SKELETON
--###################

local skeleton = {
	type = "monster",
	hp_min = (minetest.PLAYER_MAX_HP_DEFAULT - 10),
	hp_max = (minetest.PLAYER_MAX_HP_DEFAULT + 10),
	walk_velocity = 4,
	run_velocity = 5.2,
	stand_chance = 50,
	walk_chance = 50,
	jump = true,
	jump_height = 1.1,
	stepheight = 1.1,
	pushable = true,
	view_range = 16,
	damage = 2,
	knock_back = true,
	fear_height = 6,
	fall_damage = true,
	lava_damage = 9999,
	light_damage = 1,
	light_damage_min = light_damage_min,
	light_damage_max = light_damage_max,
	suffocation = 0,
	floats = 0,
	reach = 4,
	attack_chance = 1,
	attack_animals = true,
	attack_npcs = true,
	attack_players = true,
	group_attack = true,
	attack_type = "shoot",
	arrow = "mobs_mc:arrow",
	shoot_interval = 1.5,
	shoot_offset = 1.0,
	blood_amount = 0,
	pathfinding = 1,
	makes_footstep_sound = true,
	sounds = sounds,
	visual = "mesh",
	visual_size = {x = 2.7, y = 2.7},
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	selectionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	textures = {
		"mobs_mc_skeleton_bow.png",
		"mobs_mc_skeleton.png",
	},
	mesh = "mobs_mc_skeleton.b3d",
	animation = {
		stand_speed = 15,
		stand_start = 0,
		stand_end = 40,
		walk_speed = 15,
		walk_start = 40,
		walk_end = 60,
		run_speed = 30,
		shoot_start = 70,
		shoot_end = 90,
		die_start = 160,
		die_end = 170,
		die_speed = 15,
		die_loop = false,
	},
	drops = {},

	on_spawn = function(self)
		self.light_damage = fn_DamagePerSecond(self)
	end
}

if mobs_mc.items.arrow then
	table.insert(skeleton.drops, {
		name = mobs_mc.items.arrow,
		chance = 1,
		min = 0,
		max = 2,
	})
end

if mobs_mc.items.bow then
	table.insert(skeleton.drops, {
		name = mobs_mc.items.bow,
		chance = 11,
		min = 1,
		max = 1,
	})
end

if mobs_mc.items.bone then
	table.insert(skeleton.drops, {
		name = mobs_mc.items.bone,
		chance = 1,
		min = 0,
		max = 2,
	})
end

mobs:register_mob("mobs_mc:skeleton", skeleton)


--###################
--################### STRAY
--###################

local stray = {
	type = "monster",
	hp_min = (minetest.PLAYER_MAX_HP_DEFAULT - 10),
	hp_max = (minetest.PLAYER_MAX_HP_DEFAULT + 10),
	walk_velocity = 4,
	run_velocity = 5.2,
	stand_chance = 50,
	walk_chance = 50,
	jump = true,
	jump_height = 1.1,
	stepheight = 1.1,
	pushable = true,
	view_range = 16,
	damage = 2,
	knock_back = true,
	fear_height = 6,
	fall_damage = true,
	lava_damage = 9999,
	light_damage = 1,
	light_damage_min = light_damage_min,
	light_damage_max = light_damage_max,
	suffocation = 0,
	floats = 0,
	reach = 4,
	attack_chance = 1,
	attack_animals = true,
	attack_npcs = true,
	attack_players = true,
	group_attack = true,
	attack_type = "shoot",
	arrow = "mobs_mc:arrow",
	shoot_interval = 1.5,
	shoot_offset = 1.0,
	blood_amount = 0,
	pathfinding = 1,
	makes_footstep_sound = true,
	sounds = sounds,
	visual = "mesh",
	visual_size = {x = 2.7, y = 2.7},
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	selectionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	textures = {
		"mobs_mc_skeleton_bow.png",
		"mobs_mc_stray.png",
		"mobs_mc_stray_overlay.png",
	},
	mesh = "mobs_mc_stray.b3d",
	animation = {
		stand_speed = 15,
		stand_start = 0,
		stand_end = 40,
		walk_speed = 15,
		walk_start = 40,
		walk_end = 60,
		run_speed = 30,
		shoot_start = 70,
		shoot_end = 90,
		die_start = 160,
		die_end = 170,
		die_speed = 15,
		die_loop = false,
	},
	drops = {},

	on_spawn = function(self)
		self.light_damage = fn_DamagePerSecond(self)
	end
}

if mobs_mc.items.arrow then
	table.insert(stray.drops, {
		name = mobs_mc.items.arrow,
		chance = 2,
		min = 1,
		max = 1,
	})
end

mobs:register_mob("mobs_mc:stray", stray)

local witherskeleton = {
	type = "monster",
	hp_min = (minetest.PLAYER_MAX_HP_DEFAULT - 10),
	hp_max = (minetest.PLAYER_MAX_HP_DEFAULT + 10),
	walk_velocity = 4,
	run_velocity = 5.2,
	stand_chance = 50,
	walk_chance = 50,
	jump = true,
	jump_height = 1.1,
	stepheight = 1.1,
	pushable = true,
	view_range = 16,
	damage = 7,
	knock_back = true,
	fear_height = 6,
	fall_damage = true,
	lava_damage = 9999,
	light_damage = 1,
	light_damage_min = light_damage_min,
	light_damage_max = light_damage_max,
	suffocation = 0,
	floats = 0,
	reach = 4,
	attack_chance = 1,
	attack_animals = true,
	attack_npcs = true,
	attack_players = true,
	group_attack = true,
	attack_type = "dogfight",
	blood_amount = 0,
	pathfinding = 1,
	makes_footstep_sound = true,
	sounds = sounds,
	visual = "mesh",
	visual_size = {x = 2.7, y = 2.7},
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	selectionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
	textures = {
		"default_tool_steelsword.png",
		"mobs_mc_wither_skeleton.png"
	},
	mesh = "mobs_mc_witherskeleton.b3d",
	animation = {
		stand_start = 0,
		stand_end = 40,
		stand_speed = 15,
		walk_start = 40,
		walk_end = 60,
		walk_speed = 15,
		run_start = 40,
		run_end = 60,
		run_speed = 30,
		shoot_start = 70,
		shoot_end = 90,
		punch_start = 110,
		punch_end = 130,
		punch_speed = 25,
		die_start = 160,
		die_end = 170,
		die_speed = 15,
		die_loop = false,
	},
	drops = {},

	on_spawn = function(self)
		self.light_damage = fn_DamagePerSecond(self)
	end
}

if mobs_mc.items.bone then
	table.insert(witherskeleton.drops, {
		name = mobs_mc.items.bone,
		chance = 1,
		min = 0,
		max = 2,
	})
end

mobs:register_mob("mobs_mc:witherskeleton", witherskeleton)

-- compatibility
mobs:alias_mob("mobs:skeleton", "mobs_mc:skeleton")

-- Overworld spawn
mobs:spawn_specific("mobs_mc:skeleton", mobs_mc.spawn.solid, {"air"}, 0, 7, 20, 17000, 2, mobs_mc.spawn_height.overworld_min, mobs_mc.spawn_height.overworld_max)
-- Nether spawn
mobs:spawn_specific("mobs_mc:skeleton", mobs_mc.spawn.nether_fortress, {"air"}, 0, 7, 30, 10000, 3, mobs_mc.spawn_height.nether_min, mobs_mc.spawn_height.nether_max)

-- Stray spawn
mobs:spawn_specific("mobs_mc:stray", mobs_mc.spawn.snow, {"air"}, 0, 7, 20, 19000, 2, mobs_mc.spawn_height.water, mobs_mc.spawn_height.overworld_max)

-- Wither spawn
mobs:spawn_specific("mobs_mc:witherskeleton", mobs_mc.spawn.nether_fortress, {"air"}, 0, 7, 30, 5000, 5, mobs_mc.spawn_height.nether_min, mobs_mc.spawn_height.nether_max)

-- spawn eggs
mobs:register_egg("mobs_mc:skeleton", S("Skeleton"), "mobs_mc_spawn_icon_skeleton.png", 0)
mobs:register_egg("mobs_mc:stray", S("Stray"), "mobs_mc_spawn_icon_stray.png", 0)
mobs:register_egg("mobs_mc:witherskeleton", S("Wither Skeleton"), "mobs_mc_spawn_icon_witherskeleton.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Skeleton loaded")
end
