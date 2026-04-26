function ADVR.onLoad()
	pickup.name = "Noxious Sludge"
	pickup.desc = "Eating food applies poison to nearby enemies"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end


function ADVR.onFoodEaten(food)

	local enemySearchDistance = 15
	
	local foundEnemies = game.GetEnemiesInRadius(enemySearchDistance, player.transform.position)
	for i = 0, #foundEnemies - 1 do
		local enemy = foundEnemies[i]
		enemy.applyEffect(damageType.POISON, player.SecondaryDamage.GetValueFloat() * 3)
	end
end

