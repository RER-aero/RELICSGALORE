function ADVR.onLoad()
	pickup.name = "Charm Of a Newlywed"
	pickup.desc = "Gain two heart containers"
	pickup.weight = 45
	pickup.tier = 3
	pickup.maxAmount = 2
	pickup.amountUses = -1
	pickup.price = 45
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	player.MaxHealth = player.MaxHealth + 4
	player.Health = player.Health + 4
	pickup.RegisterItem()
end
