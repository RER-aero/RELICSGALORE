function ADVR.onLoad()
    pickup.name = "Golden Slime Card"
    pickup.desc = "Increases Golden Slime Chance"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end



function ADVR.onPickup()
	pickup.preObjectSpawnListeners = {
		game.GetObjectMapping("enemy_og_slime"),
		game.GetObjectMapping("enemy_id_slime"),
		game.GetObjectMapping("enemy_fg_slime_phase"),
		game.GetObjectMapping("enemy_gm_slime_bone"),
		game.GetObjectMapping("enemy_ns_slime"),
		game.GetObjectMapping("enemy_ns_slime_rotten"),
	}
	
end



function ADVR.onPreObjectSpawn(prefab, obj, position)
	if game.IsPlayerWhoStartedRun() and game.currentFloor ~= dungeonFloor.ARENA then
		if helperMethods.RandomFromPosition(position) < 0.030 then
			return game.stringToObjectMapper.GetObject("enemy_golden_slime")
		end
	end
	return obj
end