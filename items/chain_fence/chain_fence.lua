function ADVR.onLoad()
	pickup.name = "Chain Fence"
	pickup.desc = "Ranged hits have a chance to chain to a nearby enemy"

	pickup.weight = 60
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 45
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity ~= nil then
		if infos.entity.IsEnemy() and infos.entity.Health > 0 then
			if helperMethods.IsValidWithLuck(0.0, 0.5, 0.2) then
				pickup.CallFunctionIn("ChainHit", 0.15, infos.entity, infos.usedWeapon, infos.hitPosition)
			end
		end
	end

	return infos.damage
end
--this relic is ai generated
--gave claude the gamedata
--might train a model to make relics another time
--let this be a warning <3
function ChainHit(originalTarget, weapon, hitPosition)
	if originalTarget ~= nil and weapon ~= nil then
		local enemies = game.GetLivingInRadius(6, originalTarget.transform.position, false)
		for i = 0, enemies.Length - 1 do
			local enemy = enemies[i]
			if enemy ~= nil and enemy.IsEnemy() and enemy ~= originalTarget and enemy.Health > 0 then
				enemy.DoHit(
					weapon.networkObject,
					weapon.damageStat.GetValueFloat() * 0.6 * pickup.AmountActiveLocal(),
					damageType.PLAYER_SECONDARY_NO_KNOCKBACK,
					enemy.transform.position
				)
				break
			end
		end
	end
end