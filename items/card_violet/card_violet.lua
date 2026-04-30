function ADVR.onLoad()
    pickup.name = "Violet Card"
    pickup.desc = "Increases Discount"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
    player.ShopDiscount.RegisterMultiplier(pickup.id, 1.15)
    
end
