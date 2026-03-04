function ADVR.onLoad()
	progress.name = "Synced Mana"
	progress.desc = "Projectiles deal more damage the more mana orbs you have on your tome"
	progress.price = 5
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end





function ADVR.onWeaponHitEntity(infos)
   
        if infos.entity == nil then
            local mult = game.inventory.currentSecondaryWeapon.AsMagicBookBase().GetAvailableMana() - 1.5
            if mult < 0 then
                mult = 1
            end
            return infos.damage * mult
        end
        
    
    return infos.damage
end