function ADVR.onLoad()
    pickup.name = "Musical Note"
    pickup.desc = "Defeating a boss has a chance to spawn an eternal wisp"
    pickup.weight = 80
    pickup.maxAmount = 1
    pickup.price = 25
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.GOLDEN_CHEST, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onAfterBossAreaGenerated()
    if helperMethods.IsValidWithLuck(.05, .45, .2) then
        game.SpawnObjectNetwork(objects.COMPANION_WISP_INVINCIBLE, player.transform.position)
    end
end
