function ADVR.onLoad()
    pickup.name = "Bamboo Boomerang"
	pickup.desc = "Ranged hits will knockback enemies"
	pickup.weight = 85
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 3
	pickup.price = 34
	pickup.spawnsIn = {relicPool.BOSS}
end


function ADVR.onRangedHitEntity(infos)
if infos.entity == nil then
        return infos.damage
    end
    if infos.entity.IsEnemy() then
        infos.entity.AsEnemy().RpcKnockback(3, game.playerHeadset.transform.position, 10, knockbackType.FORCE_PUSH)
    end
    return infos.damage

end