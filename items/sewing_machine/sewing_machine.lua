function ADVR.onLoad()
	pickup.name = "Sweing MAchine"
    pickup.desc = "All of your current and future clothing related relics increase your melee damage by 1"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end
RelicsToCheck = {
    relics.HOLY_UNDERWEAR,
    relics.WOOL_SLIPPERS,
    relics.WINGED_SHOE,
    relics.DIS_ARMOR,
    relics.PUNCTURED_BREASTPLATE,
    relics.TIGHT_BREECHES,
    relics.EMBROIDERED_SLEEVE,
    relics.DUELING_GLOVE
}
function ADVR.onPickup()
pickup.RegisterItem()
 

local count = 0
for i = 1, #RelicsToCheck do
    if game.itemInterpreter.AmountPickupFoundByLocalPlayer(RelicsToCheck[i]) > 0 then
        count = count + 1
    end
end

helperMethods.RegisterMeleeDamageAddend(pickup.id, count)
end

function ADVR.onPickupTaken(itemUpgrade) 
for i = 1, #RelicsToCheck do
    if itemUpgrade == RelicsToCheck[i] then
     helperMethods.RegisterMeleeDamageAddend(pickup.id, 1)
    end
end

end



