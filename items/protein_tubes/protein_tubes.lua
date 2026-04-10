function ADVR.onLoad()
    pickup.name = "Protein Tubes"
    pickup.desc = "With that white sauce (this relic has a weight of 1 and iss tier 3, pretty cool that you found it)"
	pickup.weight = 1
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.amountUses = -1
	pickup.price = 15
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true

end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.MaxHealth = player.MaxHealth + 10
	
end






