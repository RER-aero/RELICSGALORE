function ADVR.onLoad()
	pickup.name = "Luminous Geode"
    pickup.desc = "The faster you move, the more damage you deal"
	pickup.weight = 74
	pickup.maxAmount = 1
	pickup.price = 45
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
end



function ADVR.onSecondaryHitEntity(infos)
	return HandleDamage(infos)
end

function ADVR.onPrimaryHitEntity(infos)
	return HandleDamage(infos)
end

function HandleDamage(infos)
	if infos.entity == nil then
		return infos.damage
	end


	return infos.damage *  (1 + player.MoveSpeed.GetValueFloat())
end
