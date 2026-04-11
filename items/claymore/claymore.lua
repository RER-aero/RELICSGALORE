function ADVR.onLoad()
	pickup.name = "C4"
	pickup.desc = "Next time you attack with a melee this relic self destructs"
	pickup.weight = 80
	pickup.tier = 1
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 24
	pickup.spawnsIn = { relicPool.SPECIAL, relicPool.CHEST }
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, game.playerController.rightHand.transform.position)
		pickup.UnregisterItem()
	
	end
		return infos.damage + 1000
end
