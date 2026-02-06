function ADVR.onLoad()
	pickup.name = "Chefs Mark"
    pickup.desc = "When used, spawn a randome food item"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.BOSS, relicPool.Golden_chest}
	pickup.supportedInMultiplayer = true
    pickup.isactiveitem = true
end

function ADVR.onPickup()
pickup.RegisterItem()

end

