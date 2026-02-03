function ADVR.onLoad()
    progress.name = "Frag grenade"
    progress.desc = "Bomb no longer explodes but rather sends out many shrapnel pieces which deal bleeding damage"
	progress.price = 8
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
		player.SecondaryDamage.RegisterMultiplier(progress.id, 1.3)

		local bomb = game.inventory.currentSecondaryWeapon.AsFlailBombBase()

		bomb.explosionRadius = bomb.explosionRadius * 0
		bomb.explosionParticles.transform.localScale = bomb.explosionParticles.transform.localScale * 0.1
		bomb.afterExplosionParticles.transform.localScale = bomb.afterExplosionParticles.transform.localScale * 0.1
	end
end
function ADVR.onBombExploded(bomb)
	progress.StartLuaCoroutine(WaitUntilStart, bomb)
end

function DamageEnemyRoutine(sourceObject, entity, damage)
	if entity == nil or not entity.IsEnemy() then
		return
	end

	entity.DoHit(player.networkObject, mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * RangedDamageMultipler), damageType.PLAYER_TERTIARY_NO_KNOCKBACK, vector3.zero)
end
---@param bomb FlailBombBase
function WaitUntilStart(bomb)
	coroutine.yield(0.5)
    game.inventory.currentPrimaryWeapon.AsFlailBase().bombBladeParts =  game.inventory.currentPrimaryWeapon.AsFlailBase().bombBladeParts * 2   
	local bombParts = game.inventory.currentPrimaryWeapon.AsFlailBase().bombBladeParts
	local partCount = #bombParts 
	
	-- Store original positions relative to bomb
	local angles = {}
	local heights = {}
	for i = 0, partCount - 1 do
		angles[i] = (i / partCount) * math.pi * 2  -- Evenly distribute around circle
		heights[i] = 0
	end
	
	local time = 0
	local damageTimer = 0
	local damageInterval = .1  -- Deal damage every 1.2 seconds
	local rotationSpeed = 8  -- Radians per second
	local radius = 1.5  -- Distance from bomb center
	local verticalSpeed = 4  -- Vertical oscillation speed
	local maxHeight = 1.2  -- Max height above bomb
	local minHeight = 0.1  -- Min height (upward bias)
	
	local bombParts = game.inventory.currentPrimaryWeapon.AsFlailBase().bombBladeParts
	for i = 0, #bombParts - 1 do
		bombParts[i].enabled = false
	end
	
	while bomb.IsExploded do
		coroutine.yield(0)
		time = time + game.DELTA_TIME
		damageTimer = damageTimer + game.DELTA_TIME
		
		local bombPos = bomb.transform.position
		
		-- Deal damage to nearby enemies in interval
		if damageTimer >= damageInterval then
			damageTimer = 0
			local enemies = game.GetEnemiesInRadius(radius, bombPos, false, true)
			for i = 0, #enemies - 1 do
				enemies[i].DoHit(player.networkObject, 1 + math.floor(player.SecondaryDamage.GetValueFloat() / 10), damageType.BASE_DEFAULT, bomb.transform.position)
                local bleedDamage = mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * RangedDamageMultipler)
			local bleedDuration = 5 -- Duration of the bleed effect in seconds
			local bleedInterval = 1 -- How often the bleed damage is applied in seconds
			base.CallFunctionOnRepeat("DamageEnemyRoutine", bleedDuration, bleedInterval, infos.entity, bleedDamage)
			end
		end
		
		for i = 0, partCount - 1 do
			-- Update angle for rotation
			angles[i] = angles[i] + rotationSpeed * game.DELTA_TIME
			
			-- Calculate vertical position with upward bias
			local verticalOffset = minHeight + (maxHeight - minHeight) * (0.5 + 0.5 * math.sin(time * verticalSpeed + angles[i]))
			
			-- Calculate new position in whirlwind pattern
			local x = bombPos.x + math.cos(angles[i]) * radius
			local y = bombPos.y + verticalOffset
			local z = bombPos.z + math.sin(angles[i]) * radius
			
			bombParts[i].transform.position = vector3.__new(x, y, z)
			
			-- Make parts face outward and spin
			local lookDir = vector3.__new(math.cos(angles[i]), 0.3, math.sin(angles[i]))
			bombParts[i].transform.rotation = quaternion.LookRotation(lookDir) * quaternion.Euler(time * 360, 0, 0)
		end
	end
end

function ADVR.onBombReassemble(bomb)
	local bombParts = game.inventory.currentPrimaryWeapon.AsFlailBase().bombBladeParts
	for i = 0, #bombParts - 1 do
		bombParts[i].enabled = true
	end
end