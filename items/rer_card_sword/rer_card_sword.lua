function ADVR.onLoad()
    pickup.name = "Sword Card"
    pickup.desc = "Increases Melee Damage"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
	helperMethods.RegisterMeleeDamageAddend(pickup.id, 4)
    helperMethods.RegisterMeleeDamageMultiplier(pickup.id, 1.2)
    
end
