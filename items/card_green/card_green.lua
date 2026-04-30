function ADVR.onLoad()
    pickup.name = "Green Card"
    pickup.desc = "Increases Luck"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
      player.Luck.RegisterAddend(pickup.id, .1)
    player.Luck.RegisterMultiplier(pickup.id, 1.2)
end
