function ADVR.onLoad()
    pickup.name = "HUD"
    pickup.desc = "Each enemy in the room increases your damage slightly"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 40
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onRoomEntered()
    Enemies = game.GetEnemiesInRadius(15, player.transform.position, false, false)
    Dih = #Enemies
end

function ADVR.onPrimaryHitEntity(infos)
    if not Dih == 0 then
    return infos.damage + math.ceil(Dih * 1.25)
    end
    return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
     if not Dih == 0 then
    return infos.damage + math.ceil(Dih * 1.25)
     end
     return infos.damage
end