function ADVR.onLoad()
    pickup.name = "High caliber bullet"
    pickup.desc = "Massively increases ranged damage but sets critical chance to 0"
	pickup.weight = 60
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 35
	pickup.spawnsIn = { relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	helperMethods.RegisterRangedDamageAddend(pickup.id, 12)
    local damage = helperMethods.GetMeleeDamageStat * -1
    helperMethods.RegisterRangedCritAddend(pickup.id, damage)
    
end