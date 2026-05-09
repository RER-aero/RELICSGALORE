function ADVR.onLoad()
    pickup.name = "Odd Mushroom"
    pickup.desc = "When hit, have a chance to release some gas"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.price = 20
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.SHOP, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if helperMethods.IsValidWithLuck(.15, .9, .35) then
        local cloud = game.SpawnObjectLocal(objects.EFFECT_POISONOUS_GAS,
            game.playerController.rightHand.transform.position)
        cloud.transform.localScale = vector3.__new(2, 2, 2)
        local dmgArea = cloud.GetComponent_DamageArea_()
        dmgArea.playerImmune = true


        dmgArea.enemiesImmune = false
        dmgArea.damage = (player.SecondaryDamage.GetValueFloat()) * 0.4
    end


    return damage
end
