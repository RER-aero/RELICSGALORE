function ADVR.onLoad()
    pickup.name = "Green Ball"
    pickup.desc = "Each room you complete without taking damage increases luck"
    pickup.weight = 55
    pickup.maxAmount = 2
    pickup.amountUses = -1
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true

    TookDamageInRoom = false
end

function ADVR.onPickup()
    pickup.RegisterItem()
    TookDamageInRoom = false
end

function ADVR.onRoomEntered(room)
    if not TookDamageInRoom then
      player.Luck.RegisterAddend(pickup.id, .01)
    end
    TookDamageInRoom = false
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if isStatsProbe then
        return damage
    end
    if damage > 0 then
        TookDamageInRoom = true
    end
    return damage
end
