function ADVR.onLoad()
    pickup.name = "Cracked Hourglass"
    pickup.desc = "Taking damage empowers your next 3 attacks to deal double damage"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true

    EmpoweredHits = 0
end

function ADVR.onPickup()
    pickup.RegisterItem()
    EmpoweredHits = 0
end

function ADVR.onPickupProxies(originalPlayerRef)
    pickup.RegisterItemNoSync()
    EmpoweredHits = 0
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if isStatsProbe then
        return damage
    end

    if damage > 0 then
        EmpoweredHits = 3
    end

    return damage
end

function ADVR.onPrimaryHitEntity(infos)
    if EmpoweredHits > 0 then
        if infos.entity ~= nil then
            EmpoweredHits = EmpoweredHits - 1
        end
        return infos.damage * 2
    end
    return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
    if EmpoweredHits > 0 then
        if infos.entity ~= nil then
            EmpoweredHits = EmpoweredHits - 1
        end
        return infos.damage * 2
    end
    return infos.damage
end