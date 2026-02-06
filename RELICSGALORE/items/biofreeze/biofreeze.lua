function ADVR.onLoad()
	pickup.name = "Biofreeze"
    pickup.desc = "A Critical hits have a chance to freeze enemies for a few seconds"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.price = 4
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
end

function ADVR.onSecondaryHitEntity(infos)
	if helperMethods.IsValidWithLuck(-20, 100) then
	if infos.entity ~= nil and infos.entity.IsEnemy() then
		
             if infos.isCritical and infos.entity.IsEnemy() then
        pickup.StartLuaCoroutine(FreezeRoutine, infos.entity, 2)
    end

    end
end
    return infos.damage
end
function ADVR.onPrimaryHitEntity(infos)
	if helperMethods.IsValidWithLuck(-20, 100) then
	if infos.entity ~= nil and infos.entity.IsEnemy() then
		
             if infos.isCritical and infos.entity.IsEnemy() then
        pickup.StartLuaCoroutine(FreezeRoutine, infos.entity, 3)
    end
	end	
    end
    return infos.damage
end
	

--- @param entity EnemyBase
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