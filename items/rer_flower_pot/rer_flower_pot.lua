function ADVR.onLoad()
    pickup.name = "Flower Pot"
    pickup.desc = "Attacks will sometimes deal great damage, but your critical chance is decreased greatly"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 50
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.BOSS }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.PrimaryCritChance.RegisterMultiplier(pickup.id, .65)
    player.SecondaryCritChance.RegisterMultiplier(pickup.id, .75)
    Add = 0
end

function ADVR.onWeaponHitEntity(infos)
    return infos.damage + Add
end

function ADVR.onGlobalTick()
    if math.random(4) == 1 then
        Add = 20
    else
        Add = 0
    end
end
