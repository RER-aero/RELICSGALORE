function ADVR.onLoad()
    pickup.name = "Crab Claw"
    pickup.desc = "Your first attack in each room deals double damage"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true

    FirstHit = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    FirstHit = true
end

function ADVR.onRoomEntered(room)
    if room.type == roomTypes.ENEMY then
        FirstHit = true
    end
end

function ADVR.onPrimaryHitEntity(infos)
    if infos.entity == nil then
        return infos.damage
    end
    if FirstHit then
        FirstHit = false
        return infos.damage * 2
    end
    return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
    if infos.entity == nil then
        return infos.damage
    end
    if FirstHit then
        FirstHit = false
        return infos.damage * 2
    end
    return infos.damage
end