function ADVR.onLoad()
	pickup.name = "Tattoo needle"
    pickup.desc = "Increases ranged damage but using marks damages you"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
helperMethods.RegisterRangedDamageAddend(pickup.id, 5)
end

function ADVR.onPickupActivate()
player.Health = player.Health - 1
end