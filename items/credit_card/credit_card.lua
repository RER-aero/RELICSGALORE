function ADVR.onLoad()
    pickup.name = "Credit Card"
    pickup.desc = "Shop items are free, but taking them has a chance to hurt you"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	player.networkedFreeStoreItems = 9999
	pickup.RegisterItem()
end


function ADVR.onItemBought(item, pos)
if helperMethods.IsValidWithLuck(1, .2, .5) then
player.DamagePlayer(1, false)
end
end
