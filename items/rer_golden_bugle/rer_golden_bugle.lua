function ADVR.onLoad()
    pickup.name = "Golden bugle"
    pickup.desc = "Gain many wisps after defeating a floor"
	pickup.weight = 55
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    	KilledBoss = false
end


function ADVR.onAfterBossAreaGenerated(worldGenerator)
	
        local rand = math.random(6,7)
        for i=0, rand, 1 do
		game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
        end
		KilledBoss = true
	end