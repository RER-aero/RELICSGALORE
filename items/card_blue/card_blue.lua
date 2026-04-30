function ADVR.onLoad()
    pickup.name = "Blue Card"
    pickup.desc = "Increases Speed"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
    player.MoveSpeed.RegisterMultiplier(pickup.id, 1.1)
end
