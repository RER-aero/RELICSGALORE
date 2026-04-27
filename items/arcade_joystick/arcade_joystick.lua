function ADVR.onLoad()
    pickup.name = "Arcade Joystick"
    pickup.desc = "A stat bonus rotates bewtween melee damage, melee crit, ranged damage, ranged crit on each hit."
    pickup.weight = 88
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 25
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS, relicPool.GOLDEN_CHEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function  ADVR.onMeleeHitEntity(infos)
      Switch()
    
return infos.damage
end

function  ADVR.onRangedHitEntity(infos)
   Switch()
    
return infos.damage
end

function Switch()
      
	player.PrimaryDamage.ClearAddend(pickup.id)
    player.PrimaryCritChance.ClearAddend(pickup.id)
      
	player.SecondaryCritChance.ClearAddend(pickup.id)
    player.SecondaryDamage.ClearAddend(pickup.id)
 local num = math.random(4)

    if num == 1 then
        player.PrimaryDamage.RegisterAddend(pickup.id, 6)
    elseif num == 2 then
        player.PrimaryCritChance.RegisterAddend(pickup.id, .2)
    elseif num == 3 then
    
	player.SecondaryCritChance.RegisterAddend(pickup.id, .15)
else
   player.SecondaryDamage.RegisterAddend(pickup.id, 4)
    end

end