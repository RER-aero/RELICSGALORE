function ADVR.onLoad()
	progress.name = "Combined blast"
	progress.desc = "You have one mana orb, but it deals increased damage and knocks back enemies "
	progress.price = 5
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end
function ADVR.onDungeonGenerated(worldGenerator)
  if helperMethods.IsInFirstDungeon(worldGenerator) then
		game.inventory.currentSecondaryWeapon.AsMagicBookBase().SetMaxMana(1)
    end
    player.PrimaryDamage.RegisterAddend(progress.id, 3)
end


function ADVR.onWandCast(spawnedBullet)
spawnedBullet.transform.localScale = spawnedBullet.transform.localScale * 2.5
end

function ADVR.onRangedHitEntity(infos)
   
        if infos.entity == nil then
            return infos.damage
        end
        if infos.entity.IsEnemy() then
            infos.entity.AsEnemy().RpcKnockback(5, game.playerHeadset.transform.position, 10, knockbackType.FORCE_PUSH)
        end
    
    return infos.damage
end