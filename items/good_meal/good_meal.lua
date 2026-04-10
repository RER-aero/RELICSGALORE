function ADVR.onLoad()
    pickup.name = "Good Meal"
    pickup.desc = "Gain a stat boost until you defeat the next boss"
    pickup.weight = 90
    pickup.maxAmount = 3
    pickup.tier = 2
    pickup.amountUses = -1
    pickup.price = 30
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()


    helperMethods.RegisterMeleeCritAddend(pickup.id, 0.30)
    helperMethods.RegisterMeleeDamageAddend(pickup.id, 5)

    helperMethods.RegisterRangedCritAddend(pickup.id, 0.30)
    helperMethods.RegisterRangedDamageAddend(pickup.id, 5)
end

function ADVR.onAfterBossAreaGenerated()
    pickup.UnregisterItem()
end
