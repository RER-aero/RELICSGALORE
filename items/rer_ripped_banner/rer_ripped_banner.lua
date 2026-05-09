function ADVR.onLoad()
    pickup.name = "Ripped Banner"
    pickup.desc = "Entering a boss room fully restores your health"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 55
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onRoomEntered(room)
    if room.type == roomTypes.BOSS then
        player.Health = player.MaxHealth
    end
end