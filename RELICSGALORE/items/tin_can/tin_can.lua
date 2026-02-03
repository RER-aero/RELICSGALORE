function ADVR.onLoad()
    pickup.name = "tin can"
    pickup.desc = "Being hit charges marks slightly"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
	local randomint = math.random(2,4)
		if game.itemInterpreter.currentUsable ~= nil then
			game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.currentCharge + randomint
			game.activePickupSlot.UpdateChargeDisplay()
		
	end
    return damage
end