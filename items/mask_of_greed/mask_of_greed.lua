function ADVR.onLoad()
    pickup.name = "Mask Of Greed"
    pickup.desc = "Loose a heart container, but the more gold you have, the higher your luck"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onGlobalTick()
    player.Luck.ClearAddend(pickup.id)
    player.Luck.RegisterAddend(pickup.id, math.floor(player.currentCash / 10) * 0.01)
end