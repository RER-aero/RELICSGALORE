function ADVR.onLoad()
	pickup.name = "Gold Hook"
    pickup.desc = "Defeating a boss gives a lot of coins"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()

end




function ADVR.onAfterBossAreaGenerated()
       player.currentCash = player.currentCash + 100
end
	
