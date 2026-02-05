function ADVR.onLoad()
	progress.name = "Folded Steel"
	progress.desc = "Your sword is thinner and is shorter, but applies a bleeding affect"
	progress.price = 4
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end

function DamageEnemyRoutine(sourceObject, entity, damage)
	if entity == nil or not entity.IsEnemy() then
		return
	end

	entity.DoHit(player.networkObject, mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * RangedDamageMultipler), damageType.PLAYER_TERTIARY_NO_KNOCKBACK, vector3.zero)
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end
	if infos.entity.IsEnemy() then
		if helperMethods.IsValidWithLuck(0, 3, 1) then
			-- Apply bleeding effect
			local bleedDamage = mathf.RoundToInt(player.PrimaryDamage.GetValueFloat() * .8)
			local bleedDuration = 3 -- Duration of the bleed effect in seconds
			local bleedInterval = 0.5 -- How often the bleed damage is applied in seconds
			base.CallFunctionOnRepeat("DamageEnemyRoutine", bleedDuration, bleedInterval, infos.entity, bleedDamage)
		end
	end

	return infos.damage
end

function ADVR.onDungeonGenerated(dungeon)
	game.inventory.currentPrimaryWeapon.AsSwordBase().bladeCreator.transform.localScale = vector3.__new(.6, .8, .8)
end