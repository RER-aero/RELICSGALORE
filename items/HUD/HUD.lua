function ADVR.onLoad()
    pickup.name = "HUD"
    pickup.desc = "Each enemy in the room increases your damage slightly"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 40
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onRoomEntered()
Enemies = game.GetEnemiesInRadius(10, player.transform.position, true, false)
Dih = #Enemies
end
function ADVR.onPrimaryHitEntity(infos)
    return infos.damage + math.ceil(Dih * 1.25)
end

function ADVR.onSecondaryHitEntity(infos)
    return infos.damage + math.ceil(Dih * 1.25)
end