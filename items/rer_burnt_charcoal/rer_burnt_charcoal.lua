function ADVR.onLoad()
    pickup.name = "Burnt Charcoal"
    pickup.desc = "Having a mark equipped gives increased damage"
	pickup.weight = 80
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end
local hasMark = 0


function ADVR.onPickup()
	pickup.RegisterItem()

end



function ADVR.onPickupTaken(itemUpgrade) 
    if string.match(itemUpgrade.name, "mark") and hasMark == 0 then
        hasMark = 1
     helperMethods.RegisterMeleeDamageAddend(pickup.id, 1)
    end
end

