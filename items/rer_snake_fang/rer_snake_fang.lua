function ADVR.onLoad()
	pickup.name = "Snake Fang"
	pickup.desc = "Attacks have a chance to inflict poison"
	pickup.weight = 85
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
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
		local amount =  pickup.AmountActiveLocal()
		if helperMethods.IsValidWithLuck(0.0, amount * 0.66, amount * 0.33) then
			infos.entity.applyEffect(damageType.POISON, damage * 2 + 3)
		end
	end
	return infos.damage
end
