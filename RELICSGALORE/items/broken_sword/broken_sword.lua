function ADVR.onLoad()
    pickup.name = "Broken Sword"
    pickup.desc = "Increases melee damage, but decreases ranged damage"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS, relicPool.GOLDEN_CHEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	helperMethods.RegisterRangedDamageAddend(pickup.id, -3)
    helperMethods.RegisterMeleeDamageAddend(pickup.id, 6)
end
