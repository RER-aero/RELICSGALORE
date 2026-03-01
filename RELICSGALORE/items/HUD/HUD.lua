function ADVR.onLoad()
    pickup.name = "HUD"
    pickup.desc = "Each enemy in the room increases your damage slightly"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 40
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
    local enemies = game.GetEnemiesInRadius(32, player.transform.position, true, true)
    return infos.damage + (enemies * 1.25)
end

function ADVR.onSecondaryHitEntity(infos)
    local enemies = game.GetEnemiesInRadius(32, player.transform.position, true, true)
    return infos.damage + (enemies * 1.25)
end