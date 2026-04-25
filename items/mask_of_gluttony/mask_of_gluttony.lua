function ADVR.onLoad()
	pickup.name = "Mask Of Gluttony"
	pickup.desc = "Loose a heart container, but eating food increases a random stat"
	pickup.weight = 55
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.SECRET, relicPool.BOSS, relicPool.SACRIFICE }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.MaxHealth = player.MaxHealth - 1

end

function ADVR.onFoodEaten(food)
	
		local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
		game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)

end
