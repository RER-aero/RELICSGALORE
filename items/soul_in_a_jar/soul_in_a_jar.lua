function ADVR.onLoad()
    pickup.name = "Soul in a Jar"
    pickup.desc = "Revive once, but loose heart containers and revive with 1 protection heart"
    pickup.weight = 10
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 50
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if not isStatsProbe and damage >= player.RealHealth then
        pickup.UnregisterItem()
        audio.PlaySoundLocal(sounds.DEATH_REVIVE_FOOD_EAT_FROM_SLOT, player.transform.position)
         player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))	
	player.MaxHealth = 0
        return 0
    end



    return damage
end
