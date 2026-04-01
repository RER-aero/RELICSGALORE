function ADVR.onLoad()
    pickup.name = "Mask Of Diligence"
    pickup.desc = "Loose a heart container, but entering ng+ increases evasion and gives coins"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.CHEST, relicPool.SECRET, relicPool.SACRIFICE }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onEnteredNGPlus()
    player.EvasionChance.RegisterAddend(pickup.id, 0.1)
    player.CurrentCash = player.currentCash + 20
end
