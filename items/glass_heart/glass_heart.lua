function ADVR.onLoad()
    pickup.name = "Glass Heart"
    pickup.desc = "Gain an empty heart container"
	pickup.weight = 88
	pickup.maxAmount = 20
	pickup.tier = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.supportedInMultiplayer = true

end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.MaxHealth = player.MaxHealth + 2
	
end



