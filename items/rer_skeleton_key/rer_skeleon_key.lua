
function ADVR.onLoad()
    pickup.name = "Skeleton Key"
    pickup.desc = "Unlocking locks takes coins instead of keys"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
    pickup.entityDeathListeners = {"prop_lock"}
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
end



function ADVR.onEntityDeath(living, source)
    if player.currentCash > 5 then

	if living.networkObject.HasStateAuthority then
		player.currentKeys = player.currentKeys + 1
        player.currentCash = player.currentCash - 5
	end
end
end