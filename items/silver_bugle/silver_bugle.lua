function ADVR.onLoad()
    pickup.name = "Silver bugle"
    pickup.desc = "defeating a boss spawns in many wisps"
	pickup.weight = 40
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    	KilledBoss = false
end


function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if KilledBoss == false and not player.isDead then
        local rand = math.random(5,9)
        for i=0, rand, 1 do
		game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        end
		KilledBoss = true
	end
end