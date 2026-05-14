function ADVR.onLoad()
    pickup.name = "Warriors Trophy"
    pickup.desc = "Increase all stats but all enemies that can will spawn as abberants"
    pickup.weight = 90
    pickup.tier = 3
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.spawnsIn = { relicPool.SACRIFICE, relicPool.BOSS, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.ProbabilityForChampionEnemy = 1
    player.PrimaryDamage.RegisterAddend(pickup.id, 4)
    player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.2)
    player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
    player.SecondaryDamage.RegisterAddend(pickup.id, 2)
end
