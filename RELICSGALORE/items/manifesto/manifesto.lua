function ADVR.onLoad()
    pickup.name = "Manifesto"
    pickup.desc = "lowers all stats but picking up relics will increase damage"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 60
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
   pickup.isVanishItem = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.PrimaryDamage.RegisterMultiplier(pickup.id, -.6)
    player.SecondaryDamageDamage.RegisterMultiplier(pickup.id, -.6)
    player.PrimaryCritChance.RegisterMultiplier(pickup.id, -.6)
    player.SecondaryCritChance.RegisterMultiplier(pickup.id, -.6)
    player.EvasionChance.RegisterMultiplier(pickup.id, -.6)
end


function ADVR.onPickupTaken(takenPickup)
player.PrimaryDamage = player.PrimaryDamage + 1
player.SecondaryDamage = player.SecondaryDamage + 1
end
