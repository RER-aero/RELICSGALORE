function ADVR.onLoad()
	progress.name = "Scorching Mana"
	progress.desc = "Decreases damage but orbs create magma on collision"
	progress.price = 5
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()

end

function ColorTrail(playerRef)
helperMethods.SetTrailColorAll(playerRef, colors.Create(0.949, 0.35, 0.01, 1.0))
end

function ADVR.onRangedWeaponCollide(magicProjectile, collision)
       local living = collision.gameObject.GetComponent_LivingBase_()
	if living ~= nil and string.find(living.livingId, "prop_chest_") then
		living.DoHit(player.networkObject, 1, damageType.PLAYER_SECONDARY_NO_KNOCKBACK, vector3.__new(0,0,0), false)
		return
	end

	
	local expl = game.SpawnObjectLocal(objects.EFFECT_MAGMA_ORB_EXPLOSION, collision.GetContact(0).point).GetComponent_Explosion_()
	expl.damage = player.GetPrimaryDamageWithPickupModifiers()
	if magicProjectile.isSpecialOrbFire then
		expl.damage = player.GetSecondaryDamageWithPickupModifiers() * 3.3
	end
	expl.damagePlayer = false
	expl.damagesEnemies = true
	expl.enableCritChance = true
	pickup.SendRPCEvent(1, magicProjectile.transform.position, rpcType.TO_PROXIES)
end