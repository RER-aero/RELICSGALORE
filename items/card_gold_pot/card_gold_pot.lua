function ADVR.onLoad()
    pickup.name = "Gold pot Card"
    pickup.desc = "Increases high tier loot chance"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
function RemoveLevelOnePickups()
	for pick in objects.ITEM_UPGRADE_ALL do
		if pick.tier == 3 then
			pick.weight = 85
		end
	end
end
end
