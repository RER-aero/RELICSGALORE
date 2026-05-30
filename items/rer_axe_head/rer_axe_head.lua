function ADVR.onLoad()
    pickup.name = "Axe Head"
    pickup.desc = "Halves your heart containers but gives coins and keys accordingly"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.price = 24
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.BOSS, relicPool.SHOP, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()

    local hp = player.MaxHealth
    hp = hp / 2
    if hp % 2 ~= 0 then
        hp = hp - 1
    end
    player.MaxHealth = hp
    if player.Health > player.MaxHealth then
        player.Health = hp
    end

    player.CurrentCash = player.CurrentCash + (math.random(9, 11) * hp)
    player.CurrentKeys = player.CurrentKeys + math.ceil((math.random(2, 4) + math.random()) * hp)
end
