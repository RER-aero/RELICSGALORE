function ADVR.onLoad()
    pickup.name = "Apple Slice"
    pickup.desc = "Eating food will give some speed"
	pickup.weight = 80
	pickup.tier = 2
	pickup.maxAmount = 10
	pickup.amountUses = -1
	pickup.price = 25
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

end

function ADVR.onFoodEaten()
    player.MoveSpeed.RegisterAddend(pickup.id, .15)
end