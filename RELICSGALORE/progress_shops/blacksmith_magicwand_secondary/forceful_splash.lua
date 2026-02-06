function ADVR.onLoad()
	progress.name = "Forceful Splash"
	progress.desc = "tome sweep deal major knockback and increases crit chance"
	progress.price = 1
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end
function ADVR.onDungeonGenerated()
    player.PrimaryCritChance.RegisterAddend(progress.id, .25)
end


function ADVR.onRangedHitEntity(infos)
   
        if infos.entity == nil then
            return infos.damage
        end
        if infos.entity.IsEnemy() and infos.customData == "sweep_attack" then
            infos.entity.AsEnemy().RpcKnockback(10, game.playerHeadset.transform.position, 10, knockbackType.FORCE_PUSH)
        end
    
    return infos.damage
end