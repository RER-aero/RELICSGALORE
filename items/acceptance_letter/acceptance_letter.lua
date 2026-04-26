function ADVR.onLoad()
    pickup.name = "Acceptance Letter"
    pickup.desc = "Chance to gain or lose a heart container"
	pickup.weight = 80
	pickup.tier = 2
	pickup.maxAmount = 10
	pickup.amountUses = -1
	pickup.price = 25
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
  
    if helperMethods.IsValidWithLuck(.50,.50,.50) then
	player.MaxHealth = player.MaxHealth + 2
	player.Health = player.Health + 2
	else
    player.MaxHealth = player.MaxHealth - 2
end

	pickup.RegisterItem()
end