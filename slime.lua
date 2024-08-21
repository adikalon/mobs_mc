local S = minetest.get_translator(minetest.get_current_modname())

local slime_big = {
	type = "monster",
	attack_animals = true,
	attack_npcs = true,
	pathfinding = 1,
	group_attack = true,
	hp_min = 16,
	hp_max = 16,
	collisionbox = {-1.02, -0.01, -1.02, 1.02, 2.03, 1.02},
	visual_size = {x = 12.5, y = 12.5},
	textures = {
        {"mobs_mc_slime.png"},
    },
	visual = "mesh",
	mesh = "mobs_mc_slime.b3d",
	blood_texture ="mobs_mc_slime_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "green_slime_land",
		jump = "green_slime_jump",
		death = "green_slime_death",
		damage = "green_slime_damage",
		attack = "green_slime_attack",
	},
	damage = 4,
	reach = 3,
	armor = 100,
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	water_damage = 0.01,
	lava_damage = 4,
	light_damage = 2,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	passive = false,
	jump = true,
	walk_velocity = 2.5,
	run_velocity = 2.5,
	walk_chance = 0,
	jump_height = 5.2,
	jump_chance = 100,
	fear_height = 60,
	drops = mobs_mc.drops.slime_big,

	on_die = function(self, pos)
		local angle, posadd
		angle = math.random(0, math.pi*2)

		for i=1,4 do
			posadd = {x = math.cos(angle), y = 0, z = math.sin(angle)}
			posadd = vector.normalize(posadd)
			local slime = minetest.add_entity(vector.add(pos, posadd), "mobs_mc:slime_small")
			slime:setvelocity(vector.multiply(posadd, 1.5))
			slime:setyaw(angle-math.pi/2)
			angle = angle + math.pi/2
		end
	end,
}


local slime_small = table.copy(slime_big)
slime_small.hp_min = 4
slime_small.hp_max = 4
slime_small.collisionbox = {-0.51, -0.01, -0.51, 0.51, 1.00, 0.51}
slime_small.visual_size = {x = 6.25, y = 6.25}
slime_small.damage = 3
slime_small.reach = 2.75
slime_small.walk_velocity = 1.3
slime_small.run_velocity = 1.3
slime_small.jump_height = 4.3
slime_small.drops = mobs_mc.drops.slime_small
slime_small.on_die = function(self, pos)
	local angle, posadd, dir
	angle = math.random(0, math.pi*2)

	for i=1,4 do
		dir = {x = math.cos(angle), y = 0, z = math.sin(angle)}
		posadd = vector.multiply(vector.normalize(dir), 0.6)
		local slime = minetest.add_entity(vector.add(pos, posadd), "mobs_mc:slime_tiny")
		slime:setvelocity(dir)
		slime:setyaw(angle-math.pi/2)
		angle = angle + math.pi/2
	end
end

local slime_tiny = table.copy(slime_big)
slime_tiny.hp_min = 1
slime_tiny.hp_max = 1
slime_tiny.collisionbox = {-0.2505, -0.01, -0.2505, 0.2505, 0.50, 0.2505}
slime_tiny.visual_size = {x=3.125, y=3.125}
slime_tiny.damage = 0
slime_tiny.reach = 2.5
slime_tiny.walk_velocity = 0.7
slime_tiny.run_velocity = 0.7
slime_tiny.jump_height = 3
slime_tiny.on_die = nil
slime_tiny.drops = mobs_mc.drops.slime_tiny

mobs:register_mob("mobs_mc:slime_big", slime_big)
mobs:register_mob("mobs_mc:slime_small", slime_small)
mobs:register_mob("mobs_mc:slime_tiny", slime_tiny)

mobs:register_egg("mobs_mc:slime_big", S("Slime"), "mobs_mc_spawn_icon_slime.png")

if not mobs_mc.custom_spawn then
	if mobs_mc.spawns.slime_big then
		mobs:spawn(mobs_mc.spawns.slime_big)
	end

	if mobs_mc.spawns.slime_small then
		mobs:spawn(mobs_mc.spawns.slime_small)
	end

	if mobs_mc.spawns.slime_tiny then
		mobs:spawn(mobs_mc.spawns.slime_tiny)
	end
end
