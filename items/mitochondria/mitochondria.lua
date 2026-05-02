function ADVR.onLoad()
    pickup.name = "Mitochondria"
    pickup.desc = "Gain some speed at the cost of a heart container"
    pickup.weight = 75
    pickup.maxAmount = 5
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 1
    pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.CHEST, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MoveSpeed.RegisterMultiplier(pickup.id, 1.4)
    player.MaxHealth = player.MaxHealth - 2

end


