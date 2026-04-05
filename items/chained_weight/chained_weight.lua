function ADVR.onLoad()
    pickup.name = "Chained Weight"
    pickup.desc = "Increases damage, but slows you down"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.SECRET, relicPool.SPECIAL, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MoveSpeed.RegisterAddend(pickup.id, .75)
    player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.5)
    player.SecondaryDamage.RegisterMultiplier(pickup.id, 1.5)
end


