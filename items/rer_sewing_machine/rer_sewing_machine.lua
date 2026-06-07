function ADVR.onLoad()
	pickup.name = "Sewing Machine"
	pickup.desc = "All of your future clothing and accesory related relics increase your melee damage by 1"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.amountUses = -1
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL }
	pickup.supportedInMultiplayer = true
end


function ADVR.onPickup()
	pickup.RegisterItem()
	
end

function ADVR.onPickupTaken(itemUpgrade)
	local relicsToCheck = {
	relics.HOLY_UNDERWEAR,
	relics.WOOL_SLIPPERS,
	relics.WINGED_SHOE,
	relics.DIS_ARMOR,
	relics.PUNCTURED_BREASTPLATE,
	relics.TIGHT_BREECHES,
	relics.EMBROIDERED_SLEEVE,
	relics.DUELING_GLOVE,
	relics.BURLAP_BLINDFOLD,
}
	if not table.contains(relicsToCheck, itemUpgrade.rolledItem.id) then
		
		return
	end
	
	helperMethods.RegisterMeleeDamageAddend(pickup.id, 1)
end

function table.contains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end
