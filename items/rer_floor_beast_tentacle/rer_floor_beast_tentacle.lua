function ADVR.onLoad()
    pickup.name = "Cradle Tentacle"
    pickup.desc = "The next time you hit a boss, do great damage"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS }
    pickup.priority = -100 --low priority so the swordHitEntity runs last
    pickup.supportedInMultiplayer = true
end

function ADVR.onPrimaryHitEntity(infos)
    if infos.entity ~= nil then
        if infos.entity.IsBoss() then
            audio.PlaySoundNetwork(sounds.SFX_GLOWING_ORANGE_SPOT, infos.hitPosition)
            return 50 + infos.damage
        end
    end
    pickup.UnregisterItem()
    return infos.damage
end

function ADVR.onSecondaryHitEntity(infos)
    if infos.entity ~= nil then
        if infos.entity.IsBoss() then
            audio.PlaySoundNetwork(sounds.SFX_GLOWING_ORANGE_SPOT, infos.hitPosition)
            return 50 + infos.damage
        end
    end
    pickup.UnregisterItem()
    return infos.damage
end
