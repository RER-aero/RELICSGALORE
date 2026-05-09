function ADVR.onLoad()
    pickup.name = "Pot Card"
    pickup.desc = "Gives Cash And Keys"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
 player.CurrentKeys = player.CurrentKeys +5
   player.CurrentCashy = player.CurrentCash +15
end
