function ADVR.onLoad()
    pickup.name = "Soul Net"
    pickup.desc = "Defeating a boss charges your mark to full"
	pickup.weight = 67
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end



function ADVR.onAfterBossAreaGenerated()
	
		if game.itemInterpreter.currentUsable ~= nil then
			game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.amountUses
			game.activePickupSlot.UpdateChargeDisplay()
		
	end

end