function ADVR.onLoad()
    pickup.name = "Volcano Mark"
    pickup.desc = "When used, set all nearby enemies on fire"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.price = 30
    pickup.amountUses = 12
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SACRIFICE, relicPool.BOSS, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
    pickup.isActivateItem = true
end

function ADVR.onPickup()
    pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
    local enemies = game.GetEnemiesInRadius(16, game.playerHeadset.position, false, true)
    if #enemies > 0 then
        for enemy in enemies do
            enemy.applyEffect(damageType.FIRE, 5)
            audio.PlaySoundLocal(sounds.IMPACT_SWORD_FIRE, enemy.transform.position)
          
        end
    end
end
