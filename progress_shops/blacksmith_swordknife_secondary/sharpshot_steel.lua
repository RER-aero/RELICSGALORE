function ADVR.onLoad()
	progress.name = "Sharpshot steel"
	progress.desc = "Attacks from a large distance will deal critical damage."
	progress.price = 2
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onSecondaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	local distance = vector3.Distance(infos.hitPosition, player.transform.position)
	
	if distance > 7 then
		infos.isCritical = true
		return infos.damage + 2 
	end

	return infos.damage
end
