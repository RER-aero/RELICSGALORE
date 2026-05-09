function ADVR.onLoad()
    pickup.name = "Mask Of Patience"
    pickup.desc = "Loose a heart container, but every time you are hit increase either evasion or luck"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SECRET, relicPool.BOSS, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onPlayerEvade()
    if math.random(2) == 2 then
player.Luck.RegisterAddend(pickup.id, .01)
    else
player.EvasionChance.RegisterAddend(pickup.id, .01)
    end
end