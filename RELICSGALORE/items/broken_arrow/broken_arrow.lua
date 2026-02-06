function ADVR.onLoad()
    pickup.name = "Broken Arrow"
    pickup.desc = "Increases ranged damage but decreases melee damage"
    pickup.weight = 50
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS, relicPool.GOLDEN_CHEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	helperMethods.RegisterRangedDamageAddend(pickup.id, 6)
    helperMethods.RegisterMeleeDamageAddend(pickup.id, -3)
end
