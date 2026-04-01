
    function ADVR.onLoad()
    pickup.name = "Soggy Map"
    pickup.desc = "Entering a new room grants you a small amount of gold"
    pickup.weight = 70
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 20
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onRoomEntered(room)
        player.currentCash = player.currentCash + (3 * pickup.AmountActiveLocal())
end