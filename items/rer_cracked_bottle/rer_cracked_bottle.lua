function ADVR.onLoad()
	pickup.name = "Cracked Bottle"
	pickup.desc = "Periodically release glass shards"
	pickup.weight = 75
	pickup.tier = 3
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 35
	pickup.spawnsIn = { relicPool.SPECIAL, relicPool.CHEST }
	
end

function ADVR.onPickup()
	pickup.RegisterItem()
end



function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
     if isStatsProbe then
        return damage
    end
if damage > 0 then
	local bones = game.SpawnObjectNetwork(objects.EFFECT_KNIFE_SCATTERSHOT, game.playerController.rightHand.transform.position)
	bones.transform.forward = game.playerHeadset.transform.forward
   

	local particleDamage = bones.GetComponent_ParticleDamage_()
	particleDamage.damage = player.PrimaryDamage.GetValueFloat() * 0.5 + 1
end
	
    return damage
end