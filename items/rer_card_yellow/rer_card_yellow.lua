function ADVR.onLoad()
    pickup.name = "Yellow Card"
    pickup.desc = "Increases Coins"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
     player.currentCash = player.currentCash + 20 
end
