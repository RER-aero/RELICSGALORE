function ADVR.onLoad()
    pickup.name = "Green Card"
    pickup.desc = "Increases Evasion"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()

    player.EvasionChance.RegisterMultiplier(pickup.id, 1.2)
end
