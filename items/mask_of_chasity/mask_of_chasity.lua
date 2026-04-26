function ADVR.onLoad()
    pickup.name = "Mask Of Chasity"
    pickup.desc = "Loose a heart container, but gaining protection hearts will increase evasion"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.SECRET, relicPool.SACRIFICE, relicPool.SPECIAL }
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onPlayerValueChanged(statID)
    if statID == playerValues.ETHEREAL_HEALTH then
        player.EvasionChance.RegisterAddend(pickup.id, .015)
    end
end
