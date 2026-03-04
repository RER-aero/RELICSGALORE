function ADVR.onLoad()
    pickup.name = "Glass capsule"
    pickup.desc = "Gain half a protection heart"
	pickup.weight = 0
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true

end

function ADVR.onPickup()
	pickup.RegisterItem()

	if game.runSaveManager.isInLoadRoutine then
		return
	end
	
	player.Heal(1, player.GetBaseEtherealHeartType())
	
end



