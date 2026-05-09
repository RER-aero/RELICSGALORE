function ADVR.onLoad()
    pickup.name = "Mountainiers Mark"
    pickup.desc = "Use to freeze a nearby enemy for a long time"
	pickup.weight = 55
	pickup.maxAmount = 1
	pickup.amountUses = 7
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.GOLDEN_CHEST}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local enemies = game.GetEnemiesInRadius(8, game.playerHeadset.position, true, true)
	for v in enemies do
		if v.isBoss() == false then
			pickup.StartLuaCoroutine(FreezeRoutine, enemies, 5)
		end
		break
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