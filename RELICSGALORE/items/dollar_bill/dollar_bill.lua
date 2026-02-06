function ADVR.onLoad()
    pickup.name = "Dollar bill"
    pickup.desc = "Increases discount moderately and gives you some coins"
	pickup.weight = 55
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.CHEST, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    	player.ShopDiscount.RegisterAddend(pickup.id, 1.3)
		player.CurrentCash = player.CurrentCash + 20
end

function ADVR.onPickupProxies()
	pickup.RegisterItemNoSync()
    	player.ShopDiscount.RegisterAddend(pickup.id, 1.3)
end

