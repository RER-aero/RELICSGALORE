function ADVR.onLoad()
    pickup.name = "Flail Card"
    pickup.desc = "Increases Knockback"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
    if infos.entity == nil then
        return infos.damage
    end
    if infos.isCritical and infos.entity.IsEnemy() then
        infos.entity.AsEnemy().RpcKnockback(4, game.playerHeadset.transform.position, 4, knockbackType.FORCE_PUSH)
    end
    return infos.damage
end