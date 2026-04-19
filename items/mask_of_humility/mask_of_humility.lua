function ADVR.onLoad()
    pickup.name = "Mask Of Humility"
    pickup.desc = "Loose a heart container, but getting has a chance to reward you"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.GOLDEN_CHEST, relicPool.BOSS, relicPool.SACRIFICE }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if isStatsProbe then
        return damage
    end
    local epstein = math.random(10)
    if epstein == 1 then
        local result = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 1)
        game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
    elseif epstein == 2 then
        if game.runSaveManager.isInLoadRoutine == false then
            local randomUpgrade = game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, vector3.__new(math.random() * 20,
                math.random() * 20, math.random() * 20))
            pickup.CallFunctionIn("UsePickup", 0.2, randomUpgrade)
        end
    elseif epstein == 3 then
        player.CurrentCash = player.currentCash + math.random(10, 25)
        player.CurrentKeys = player.CurrentKeys + math.random(5, 10)
    end

    return damage
end

function UsePickup(randomUpgrade)
    local upgradeItem = randomUpgrade.GetComponent_ItemUpgrade_() ---@type ItemUpgrade
    game.ShowMessageInWorld(upgradeItem.GetLocalizedName(), 3)
    upgradeItem.OnUseStart()
end
