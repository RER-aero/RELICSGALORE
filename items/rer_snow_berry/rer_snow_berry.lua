function ADVR.onLoad()
	pickup.name = "Snow Berry"
	pickup.desc = "Eating food freezess nearby enemies"
	pickup.weight = 85
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end


function ADVR.onFoodEaten(food)

	local enemySearchDistance = 15
	
	local foundEnemies = game.GetEnemiesInRadius(enemySearchDistance, player.transform.position)
	for i = 0, #foundEnemies - 1 do
		local enemy = foundEnemies[i]
		pickup.StartLuaCoroutine(FreezeRoutine, enemy, 1)
	end
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