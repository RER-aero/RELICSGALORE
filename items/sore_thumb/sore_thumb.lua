function ADVR.onLoad()
    pickup.name = "Sore Thumb"
    pickup.desc = "The less gold you have, the more damage you deal"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
    local mult
    if player.currentCash < 225 then
        mult = 2 - player.currentCash / 150
    else mult = .5
end
return infos.damage * mult
end

function ADVR.onSecondaryHitEntity(infos)
   local mult
    if player.currentCash < 225 then
        mult = 2 - player.currentCash / 150
    else mult = .5
end
return infos.damage * mult
end