function ADVR.onLoad()
    progress.name = "Phosphorus Coating"
    progress.desc = "Striking an enemy with the knife embedded in them sets that enemy aflame"
	progress.price = 6
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()

end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	local knife = game.inventory.currentSecondaryWeapon.AsThrowingKnifeBase()
	local stuckToLiving = knife.GetStuckToLiving()

	if stuckToLiving ~= nil and stuckToLiving == infos.entity then
		local critChance = math.max(player.PrimaryCritChance.GetValueFloat(), 0.2)
		infos.entity.applyEffect(damageType.FIRE, player.SecondaryDamage.GetValueFloat() * 0.8)
		end
	return infos.damage
end