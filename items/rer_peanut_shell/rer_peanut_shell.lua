function ADVR.onLoad()
    pickup.name = "peanut shell"
    pickup.desc = "When you loose ethereal health, gain a random stat boost"
	pickup.weight = 0
	pickup.maxAmount = 1
	pickup.tier = 2
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
	
end


function ADVR.onEtherealHeartHit()

	if game.runSaveManager.isInLoadRoutine then
		return
	end

	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)

end
