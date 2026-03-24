function ADVR.onLoad()
    pickup.name = "Mask Of Sloth"
    pickup.desc = "Loose a heart container, but entering ng+ increases speed and gives keys "
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SECRET, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onEnteredNGPlus()
player.MoveSpeed = player.MoveSpeed * 1.25
player.CurrentKeys = player.CurrentKeys + 10
end


