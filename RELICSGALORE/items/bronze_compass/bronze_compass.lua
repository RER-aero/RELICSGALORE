function ADVR.onLoad()
    pickup.name = "Bronze Compass"
    pickup.desc = "Entering a secret room permanently increases your luck"
    pickup.weight = 80
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onRoomEntered(room)
    if room.type == roomTypes.SECRET then
        player.Luck.RegisterAddend(pickup.id, .02)
    end
end