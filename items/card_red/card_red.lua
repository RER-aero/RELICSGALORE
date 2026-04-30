function ADVR.onLoad()
    pickup.name = "Red Card"
    pickup.desc = "Increases health"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth +2
end
