function ADVR.onLoad()
    pickup.name = "Sickly Needle"
    pickup.desc = "Gambling will empower your next attack"
    pickup.weight = 55
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 20
    pickup.tier = 1
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.CHEST, relicPool.GOLDEN_CHEST }
    pickup.supportedInMultiplayer = true
    Empower = 0
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onSlotMachineGamble()
    Empower = Empower + 1
end

function ADVR.onWeaponHitEntity(infos)
    local add = Empower
    Empower = 0
    return infos.damage + math.floor(add * 1.5)
end
