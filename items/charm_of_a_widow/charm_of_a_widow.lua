function ADVR.onLoad()
	pickup.name = "Charm Of a widow"
    pickup.desc = "Loose 1 heart container but gain 2 protection hearts"
	pickup.weight = 80
	pickup.tier = 2
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 45
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	player.MaxHealth = player.MaxHealth -2
	player.AddEtherealHealth(4, player.GetBaseEtherealHeartType())
	pickup.RegisterItem()
end
