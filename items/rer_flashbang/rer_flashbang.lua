function ADVR.onLoad()
    pickup.name = "Flashbang"
    pickup.desc = "Increase damage but take a guess on what happens if you get hit"
    pickup.weight = 90
    pickup.tier = 2
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 20
    pickup.spawnsIn = { relicPool.SECRET, relicPool.BOSS, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    OGlight = game.GetAmbientLight()

    player.PrimaryDamage.RegisterAddend(pickup.id, 4)
    player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.2)
    player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
    player.SecondaryDamage.RegisterAddend(pickup.id, 2)
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
    if damageSource == nil or isStatsProbe then
        return damage
    end
    game.SetAmbientLight(col(256, 256, 256, 1))
    pickup.CallFunctionIn("ResetLight", 3)
    audio.PlaySoundLocal(sounds.IMPACT_KNIFE_METAL, game.playerController.rightHand.transform.position)
    audio.PlaySoundLocal(sounds.IMPACT_KNIFE_METAL, game.playerController.rightHand.transform.position)

    return damage
end

function ResetLight()
    game.SetAmbientLight(OGlight)
end
