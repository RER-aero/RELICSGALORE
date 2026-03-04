function ADVR.onLoad()
    pickup.name = "Explosive compound"
    pickup.desc = "Hitting enemies with your wand causes an explosion, but damage is decreased"
    pickup.supportedInMultiplayer = true
    game.RegisterForRPCEvents(pickup)

function ADVR.onPickup()
    pickup.RegisterItem()
    helperMethods.RegisterMeleeDamageAddMult(pickup.id, 1, -1.8)
end


function ADVR.onMeleeWeaponCollide(wand, collision)
	-- special case for chests, which should just open naturally 
	local living = collision.gameObject.GetComponent_LivingBase_()
	if living ~= nil and string.find(living.livingId, "prop_chest_") then
		living.DoHit(player.networkObject, 1, damageType.PLAYER_PRIMARY_NO_KNOCKBACK, vector3.__new(0,0,0), false)
		return
	end

	if collision.relativeVelocity.magnitude > 2 then
		local expl = game.SpawnObjectLocal(objects.EFFECT_EXPLOSION_SMALL, wand.transform.position).GetComponent_Explosion_()
		expl.damage = player.GetSecondaryDamageWithPickupModifiers()
		expl.enableCritChance = true
		pickup.SendRPCEvent(1, wand.transform.position, rpcType.TO_PROXIES)
	end
end

function ADVR.onRPCReceived(eventID, sourcePlayer, position)
	if eventID == 1 then
		local expl = game.SpawnObjectLocal(objects.EFFECT_EXPLOSION_SMALL, position).GetComponent_Explosion_()
		expl.damage = 0
	end
end
end