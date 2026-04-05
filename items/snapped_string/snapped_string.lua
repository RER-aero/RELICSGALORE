function ADVR.onLoad()
    pickup.name = "Snapped String"
    pickup.desc = "Taking damage boosts your movement speed briefly"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if isStatsProbe then
        return damage
    end

    if damage > 0 then
        player.MoveSpeed.RegisterAddend(pickup.id, 2.67) --6767676767676767676767676767 hahahahahahahah, why are you looking at the code go away
        pickup.CallFunctionIn("RemoveSpeed", 3)
    end

    return damage
end

function RemoveSpeed()
    player.MoveSpeed.ClearAddend(pickup.id)
end