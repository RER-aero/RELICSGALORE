function ADVR.onLoad()
    pickup.name = "Caviar"
    pickup.desc = "Eating food has a chance to reward keys"
	pickup.weight = 35
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onFoodEaten(food)
	player.CurrentKeys = player.CurrentKeys + math.ceil(food.healAmount * 2.5) * pickup.AmountActiveLocal()
end