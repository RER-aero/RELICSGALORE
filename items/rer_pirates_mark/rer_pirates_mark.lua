function ADVR.onLoad()
    pickup.name = "Pirates Mark"
    pickup.desc = "Once used, enemies drop a lot of coins for short period"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.amountUses = 12
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS, relicPool.SACRIFICE }
    pickup.isActivateItem = true
    pickup.supportedInMultiplayer = true
    IsActive = false
end

function ADVR.onPickup()
    pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
    IsActive = true
    pickup.CallFunctionIn("Stop", 15)
end

function Stop()
    IsActive = false
end

function ADVR.onEntityDeath(living, source)
    if not IsActive then
        return
    end
    if living.IsEnemy() == false or source ~= player.LocalPlayerRef then
        return
    end
    for i = 0, math.random(8, 12) do
        game.SpawnObjectNetwork(objects.ITEM_COIN, living.transform.position)
    end
end
