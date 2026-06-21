function ADVR.onLoad()
	pickup.name = "Infested Spores"
	pickup.desc = "Hitting enemies with your melee weapon has a chance to release some spores"
	pickup.weight = 80
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(hitInfos)
	if helperMethods.IsValidWithLuck(.1, .85, .45) then
		local damageArea = game.SpawnObjectNetwork(objects.EFFECT_SWOLLEN_TICK, hitInfos.hitPosition)
		.GetComponent_DamageArea_()
		damageArea.enemiesImmune = false
		damageArea.playerImmune = true
		damageArea.damageMode = damageMode.ALL_OBJECTS
		damageArea.damage = player.SecondaryDamage.GetValueFloat()
		damageArea.damageIntervall = .5
	end
	return hitInfos.damage
end
