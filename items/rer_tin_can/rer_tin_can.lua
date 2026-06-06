function ADVR.onLoad()
	pickup.name = "Tin Can"
	pickup.desc = "Being hit charges marks slightly"
	pickup.weight = 90
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.SHOP }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
	if not isStatsProbe then
		local randomint = math.random(2, 4)
		if game.itemInterpreter.currentUsable ~= nil then
			game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.currentCharge +
			randomint
			game.activePickupSlot.UpdateChargeDisplay()
		end
	end
	return damage
end
