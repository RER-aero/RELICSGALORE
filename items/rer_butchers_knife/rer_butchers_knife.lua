function ADVR.onLoad()
    pickup.name = "Butchers Knife"
    pickup.desc = "All of your future bone related relics increase your melee damage by 2"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.price = 35
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end


function ADVR.onPickup()
	pickup.RegisterItem()
	
end

function ADVR.onPickupTaken(itemUpgrade)
	local relicsToCheck = {
	 relics.BONE_DICE,
    relics.BLUNTED_KNUCKLEBONE,
    relics.PACKRAT_MANDIBLE,
    relics.ASCETICS_MARK,
    relics.GOLD_TOOTH,
}
	if not table.contains(relicsToCheck, itemUpgrade.rolledItem.id) then
		
		return
	end
	
	helperMethods.RegisterMeleeDamageAddend(pickup.id, 2)
end

function table.contains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end
