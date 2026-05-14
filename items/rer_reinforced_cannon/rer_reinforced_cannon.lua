function ADVR.onLoad()
	pickup.name = "Reinforced Cannon"
	pickup.desc = "Provides a few heart containers but decreases damage alot"
	pickup.weight = 90
	pickup.maxAmount = 1
	pickup.tier = 3
	pickup.amountUses = -1
	pickup.price = 50
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
	player.PrimaryDamage.ClearMultiplier(pickup.id)
	player.SecondaryDamage.ClearMultiplier(pickup.id)

	player.MaxHealth = OldMaxHealth
end

function ADVR.onPickup()
	pickup.RegisterItem()

	OldMaxHealth = player.MaxHealth

	player.MaxHealth = player.MaxHealth + 6
	player.Health = player.MaxHealth
	

	player.PrimaryDamage.RegisterMultiplier(pickup.id, .25)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, .25)
end

