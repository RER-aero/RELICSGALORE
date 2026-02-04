function ADVR.onLoad()
	pickup.name = "orb of cantrips"
    pickup.desc = "attacks have a chance to apply either, fire, freeze, or poison"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.price = 80
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.SECRET}
	pickup.supportedInMultiplayer = true
end
function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPrimaryHitEntity(infos)
	return HandleDamage(infos, player.PrimaryDamage.GetValueFloat())
end

function ADVR.onSecondaryHitEntity(infos)
	return HandleDamage(infos, player.SecondaryDamage.GetValueFloat())
end


function HandleDamage(infos, damage)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
	
		if math.random(1,8) == 1 then
            local choice = math.random(1,3)
            if choice == 1 then
			infos.entity.applyEffect(damageType.POISON, damage * 1.3 + 2)
            end
            if choice == 2 then
            infos.entity.applyEffect(damageType.FIRE, damage * 1.3 + 2)
            end
            if choice == 3 then
            pickup.StartLuaCoroutine(FreezeRoutine, infos.entity, 1.5) 
            end
        end
        return infos.damage
end 
end
	function FreezeRoutine(entity, duration)
	local timer = 0
	local originalPosition = entity.transform.position
	local animator = entity.gameObject.GetComponent_Animator_()
	local animatorSpeed = 1
	if animator ~= nil then
		animatorSpeed = animator.speed
		animator.speed = 0
	end

	local originalHitFlashType = entity.hitFlashType
	entity.hitFlashType = hitFlashType.NONE

	---@type MeshRenderer[] | Component[]
	local renderers = entity.gameObject.GetComponentsInChildren(game.GetType("MeshRenderer"))
	for i = 0, #renderers - 1 do
		renderers[i].material.EnableKeyword("_EMISSION")
		renderers[i].material.SetColor("_EmissionColor", colors.Create(0, 0, 0.15, 1))
	end

	while timer < duration do
		entity.rigidb.velocity = vector3.__new(0, entity.rigidb.velocity.y, 0)
		entity.transform.position = vector3.__new(originalPosition.x, entity.transform.position.y, originalPosition.z)
		timer = timer + game.DELTA_TIME
		coroutine.yield()
	end

	if animator ~= nil then
		animator.speed = animatorSpeed
	end

	for i = 0, #renderers - 1 do
		renderers[i].material.DisableKeyword("_EMISSION")
	end
	entity.hitFlashType = originalHitFlashType
end
	


