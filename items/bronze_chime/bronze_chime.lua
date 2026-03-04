function ADVR.onLoad()
	pickup.name = "Bronze chime"
    pickup.desc = "Critical strikes spawn a wisp"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsEnemy() then
		
             if infos.isCritical and infos.entity.IsEnemy() then
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
    end

    end
    return infos.damage
end
function ADVR.onPrimaryHitEntity(infos)
	if infos.entity ~= nil and infos.entity.IsEnemy() then
		
             if infos.isCritical and infos.entity.IsEnemy() then
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
    end
    
end
	return infos.damage
end