function ADVR.onLoad()
    pickup.name = "Anglers Mark"
    pickup.desc = "Teleports the nearby enemy with the lowest health to you"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.amountUses = 4
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS, relicPool.SACRIFICE }
    pickup.isActivateItem = true
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
    local lowestHealth = 200
    local enemies = game.GetEnemiesInRadius(8, game.playerHeadset.position, true, true)
    local chosen = nil
    for v in enemies do
        if v.Health < lowestHealth then
            chosen = v
        end
    end
    pickup.CallFunctionIn("TeleportEntityLater", 0.25, chosen)
end

function TeleportEntityLater(infos)
    local goalPos = player.transform.position + player.transform.forward * 1.8
    infos.transform.position = goalPos


    -- stun ai and loose target info
    if infos.HasStateAuthority then
        local ai = infos.gameObject.GetComponent_AI_()
        if ai ~= nil then
            ai.networkedHasSeenTarget = base.ToNetworkBool(false)
            ai.Stun(1.2)
        end
    end

    -- other update stuff for more consistency
    TryStopSyncing(infos)
end

-- try to stop syncing the transforms for a short time to stop accidentally snapping back the enemy
function TryStopSyncing(entity)
    local transformSimpleHumanoid = entity.gameObject.GetComponent_ADVRNetworkTransformSimpleHumanoid_()
    if transformSimpleHumanoid ~= nil then
        transformSimpleHumanoid.SetDontUpdateTimer(0.5)
        return
    end

    local transformSpecial = entity.gameObject.GetComponent_ADVRNetworkTransformSpecial_()
    if transformSpecial ~= nil then
        transformSpecial.SetInterruptAdjustmentTimer(0.5)
        return
    end

    local networkRigidbody = entity.gameObject.GetComponent_ADVRNetworkRigidbody_()
    if networkRigidbody ~= nil then
        networkRigidbody.StopSyncingFor(0.5)
        return
    end
end
