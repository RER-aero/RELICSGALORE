function ADVR.onLoad()
    pickup.name = "Grass Blade"
    pickup.desc = "loose 2 heart containers but melee critical chance and damage is massively increased"
	pickup.weight = 76
	pickup.maxAmount = 3
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 65
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	-- do nothing when using blue blood
	if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relics.VIAL_OF_BLUE_BLOOD) > 0 then
		return
	end

	if player.newGamePlusLevel < 3 then
		if player.MaxHealth >= 4 then
			player.MaxHealth = player.MaxHealth - 4
		else
			player.RemoveEtherealHealth(4)
		end
		player.Health = math.max(0, math.min(player.MaxHealth, player.Health))
		
		if player.RealHealth <= 0 then
			player.OnDeath()
		end
	end

	helperMethods.RegisterMeleeCritAddend(pickup.id, 0.30)
    helperMethods.RegisterMeleeDamageAddend(pickup.id, 5)
	

	
end

