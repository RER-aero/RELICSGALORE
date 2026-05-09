function ADVR.onLoad()
    pickup.name = "KODB Flyer"
    pickup.desc = "Picking up relics will reward you with coins"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 60
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end
function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItem()
end

function ADVR.onPickupTaken(takenPickup)
player.CurrentCash = player.CurrentCash + 5
end
