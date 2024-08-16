local S = minetest.get_translator(minetest.get_current_modname())

local magma_cube_big = {
	type = "monster",
	hp_min = 16,
	hp_max = 16,
	collisionbox = {-1.02, -0.01, -1.02, 1.02, 2.03, 1.02},
	visual_size = {x = 12.5, y = 12.5},
	textures = {
        {"mobs_mc_magmacube.png"}
    },
	visual = "mesh",
	mesh = "mobs_mc_magmacube.b3d",
	blood_texture = "mobs_mc_magmacube_blood.png",
	makes_footstep_sound = true,
    sounds = {
		jump = "mobs_mc_magma_cube_big",
		death = "mobs_mc_magma_cube_big",
		attack = "mobs_mc_magma_cube_attack",
	},
	walk_velocity = 4,
	run_velocity = 4,
	damage = 6,
	reach = 3,
	armor = 40,
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
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	passive = false,
	jump = true,
	jump_height = 8,
	walk_chance = 0,
	jump_chance = 100,
	fear_height = 100000,
	glow = 10,
	drops = mobs_mc.drops.magma_cube_big,
	follow = mobs_mc.follows.magma_cube_big,
	replace_what = mobs_mc.replaces.magma_cube_big,
	specific_attack = mobs_mc.attacks.magma_cube_big,

	on_die = function(self, pos)
		local angle, posadd
		angle = math.random(0, math.pi*2)

		for i=1,3 do
			posadd = {x=math.cos(angle),y=0,z=math.sin(angle)}
			posadd = vector.normalize(posadd)
			local mob = minetest.add_entity(vector.add(pos, posadd), "mobs_mc:magma_cube_small")
			mob:setvelocity(vector.multiply(posadd, 1.5))
			mob:setyaw(angle-math.pi/2)
			angle = angle + (math.pi*2) / 3
		end
	end,
}


local magma_cube_small = table.copy(magma_cube_big)
magma_cube_small.hp_min = 4
magma_cube_small.hp_max = 4
magma_cube_small.collisionbox = {-0.51, -0.01, -0.51, 0.51, 1.00, 0.51}
magma_cube_small.visual_size = {x=6.25, y=6.25}
magma_cube_small.damage = 3
magma_cube_small.reach = 2.75
magma_cube_small.walk_velocity = .8
magma_cube_small.run_velocity = 2.6
magma_cube_small.jump_height = 6
magma_cube_small.damage = 4
magma_cube_small.reach = 2.75
magma_cube_small.armor = 70
magma_cube_small.drops = mobs_mc.drops.magma_cube_small
magma_cube_small.follow = mobs_mc.follows.magma_cube_small
magma_cube_small.replace_what = mobs_mc.replaces.magma_cube_small
magma_cube_small.specific_attack = mobs_mc.attacks.magma_cube_small
magma_cube_small.on_die = function(self, pos)
	local angle, posadd, dir
	angle = math.random(0, math.pi*2)

	for i=1,4 do
		dir = vector.normalize({x=math.cos(angle),y=0,z=math.sin(angle)})
		posadd = vector.multiply(dir, 0.6)
		local mob = minetest.add_entity(vector.add(pos, posadd), "mobs_mc:magma_cube_tiny")
		mob:setvelocity(dir)
		mob:setyaw(angle-math.pi/2)
		angle = angle + math.pi/2
	end
end


local magma_cube_tiny = table.copy(magma_cube_big)
magma_cube_tiny.hp_min = 1
magma_cube_tiny.hp_max = 1
magma_cube_tiny.collisionbox = {-0.2505, -0.01, -0.2505, 0.2505, 0.50, 0.2505}
magma_cube_tiny.visual_size = {x=3.125, y=3.125}
magma_cube_tiny.walk_velocity = 1.02
magma_cube_tiny.run_velocity = 1.02
magma_cube_tiny.jump_height = 4
magma_cube_tiny.damage = 3
magma_cube_tiny.reach = 2.5
magma_cube_tiny.armor = 85
magma_cube_tiny.on_die = nil
magma_cube_tiny.drops = mobs_mc.drops.magma_cube_tiny
magma_cube_tiny.follow = mobs_mc.follows.magma_cube_tiny
magma_cube_tiny.replace_what = mobs_mc.replaces.magma_cube_tiny
magma_cube_tiny.specific_attack = mobs_mc.attacks.magma_cube_tiny

mobs:register_mob("mobs_mc:magma_cube_big", magma_cube_big)
mobs:register_mob("mobs_mc:magma_cube_small", magma_cube_small)
mobs:register_mob("mobs_mc:magma_cube_tiny", magma_cube_tiny)

mobs:register_egg("mobs_mc:magma_cube_big", S("Magma Cube"), "mobs_mc_spawn_icon_magmacube.png")

if not mobs_mc.custom_spawn then
	mobs:spawn(mobs_mc.spawns.magma_cube_big)
	mobs:spawn(mobs_mc.spawns.magma_cube_small)
	mobs:spawn(mobs_mc.spawns.magma_cube_tiny)
end
