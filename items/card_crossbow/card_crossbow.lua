function ADVR.onLoad()
    pickup.name = "Crossbow Card"
    pickup.desc = "Increases Ranged Damage"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
     helperMethods.RegisterRangedDamageAddend(pickup.id, 4)
    helperMethods.RegisterRangedDamageMultiplier(pickup.id, 1.2)
end
