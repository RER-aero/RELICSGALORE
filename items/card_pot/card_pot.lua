function ADVR.onLoad()
    pickup.name = "Pot Card"
    pickup.desc = "Decreases Abberant spawn rates"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()

   player.ProbabilityForChampionEnemy = player.ProbabilityForChampionEnemy * .95
end
