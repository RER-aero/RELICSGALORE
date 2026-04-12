function ADVR.onLoad()
    pickup.name = "Kaleidoscope"
    pickup.desc = "Increases stats greatly but being hit inverts movement controls"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 30
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true

   
end

function ADVR.onPickup()
    pickup.RegisterItem()
   
	player.PrimaryDamage.RegisterAddend(pickup.id, 4)
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryDamage.RegisterAddend(pickup.id, 2)
	player.EvasionChance.RegisterAddend(pickup.id, 0.15)
end


function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if isStatsProbe then
        return damage
    end
 player.MoveSpeed.RegisterMultiplier(pickup.id, -1)
    return damage
end

