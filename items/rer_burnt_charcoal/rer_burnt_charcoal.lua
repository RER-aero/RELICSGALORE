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
local hasMark = false


function ADVR.onPickup()
	pickup.RegisterItem()
 if game.itemInterpreter.currentUsable ~= nil then
	  helperMethods.RegisterMeleeDamageAddend(pickup.id, 2)
	  hasMark = true
    end

 end



function ADVR.onPickupTaken(itemUpgrade) 
    if string.match(itemUpgrade.name, "mark") and hasMark == false then
        hasMark = true
     helperMethods.RegisterMeleeDamageAddend(pickup.id, 2)
    end
end

