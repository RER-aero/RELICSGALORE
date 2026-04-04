function ADVR.onLoad()
    pickup.name = "Blue Ball"
    pickup.desc = "Each room you complete without taking damage gives you Keys"
    pickup.weight = 55
    pickup.maxAmount = 3
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

function ADVR.onEntityDeath(living, source)
    if living.IsEnemy() and source == player.LocalPlayerRef and not TookDamageInRoom then
        player.CurrentKeys = player.CurrentKeys + math.random(2, 5)
    end
end