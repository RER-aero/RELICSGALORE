function ADVR.onLoad()
    pickup.name = "Manifesto"
    pickup.desc = "lowers all stats but picking up relics will increase damage"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 50
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
   pickup.isVanishItem = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.PrimaryDamage.RegisterMultiplier(pickup.id, .5)
    player.SecondaryDamage.RegisterMultiplier(pickup.id, .5)
    player.PrimaryCritChance.RegisterMultiplier(pickup.id, .5)
    player.SecondaryCritChance.RegisterMultiplier(pickup.id, .5)
    player.EvasionChance.RegisterMultiplier(pickup.id, .5)
end


function ADVR.onPickupTaken()
player.PrimaryDamage.RegisterAddend(pickup.id, math.random(2,4))
player.SecondaryDamage.RegisterAddend(pickup.id, math.random(2,4))
end
