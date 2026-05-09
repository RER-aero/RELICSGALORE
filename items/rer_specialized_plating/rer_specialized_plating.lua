function ADVR.onLoad()
    pickup.name = "Specialized Plating"
    pickup.desc = "Killing an enemy with melee has a chance to heal you for half a heart"
    pickup.weight = 35
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 48
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end
function ADVR.onMeleeHitEntity(infos)
Melee = true
return infos.damage
end
function ADVR.onRangedHitEntity(infos)
Melee = false
return infos.damage
end
function ADVR.onEntityDeath(living, source)
    if living.IsEnemy() and source == player.LocalPlayerRef and player.MaxHealth ~= player.RealHealth then
        if Melee == true and math.random(8) == 1 then
            player.Heal(1)
        end
    end
end