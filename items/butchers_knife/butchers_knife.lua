function ADVR.onLoad()
	pickup.name = "Butchers knife"
    pickup.desc = "All of your current and future bone related relics increase your melee damage by 1"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end
RelicsToCheck = {
    relics.BONE_DICE,
    relics.BLUNTED_KNUCKLEBONE,
    relics.PACKRAT_MANDIBLE,
    relics.ASCETICS_MARK,
    relics.GOLD_TOOTH,
    relics.SNAKE_FANG,
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



