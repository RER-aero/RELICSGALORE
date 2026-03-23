function ADVR.onLoad()
    pickup.name = "Mask Of wrath"
    pickup.desc = "Loose a heart container, but every evaded attack increases one of your weapons damage slightly, your damage goes up slightly"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SECRET, relicPool.BOSS, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onPlayerEvade()
    if math.random(2) == 2 then
player.PrimaryDamage.RegisterAddend(pickup.id, 1)
    else
player.SecondaryDamage.RegisterAddend(pickup.id, 1)
    end
end