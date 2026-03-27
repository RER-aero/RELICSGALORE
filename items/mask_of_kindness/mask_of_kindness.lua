function ADVR.onLoad()
    pickup.name = "Mask Of Kindness"
    pickup.desc = "Loose a heart container, but reviving players and purchasing relics increases crit chance"
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
player.PrimaryCritChance.RegisterAddend(pickup.id, 1)
    else
player.SecondaryCritChance.RegisterAddend(pickup.id, 1)
    end
end


function ADVR.onItemBought()
    if math.random(2) == 2 then
player.PrimaryCritChance.RegisterAddend(pickup.id, 1)
    else
player.SecondaryCritChance.RegisterAddend(pickup.id, 1)
    end
end