function ADVR.onLoad()
    pickup.name = "Tome Card"
    pickup.desc = "Increases Critical Chance"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
      player.PrimaryCritChance.RegisterAddend(pickup.id, .1)
      player.SecondaryCritChance.RegisterAddend(pickup.id, .1)
  
end
