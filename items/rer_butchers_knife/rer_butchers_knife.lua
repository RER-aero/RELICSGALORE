function ADVR.onLoad()
    pickup.name = "Butchers Knife"
    pickup.desc = "All of your current and future bone related relics increase your melee damage by 1"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.price = 35
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

RelicsToCheck = {
    relics.BONE_DICE,
    relics.BLUNTED_KNUCKLEBONE,
    relics.PACKRAT_MANDIBLE,
    relics.ASCETICS_MARK,
    relics.GOLD_TOOTH,
}
function ADVR.onPickup()
    pickup.RegisterItem()


    local count = 0
    local items = game.itemInterpreter.GetActivePickupsFromAllPlayers()
    for i = 1, #RelicsToCheck do
        for j = 1, #RelicsToCheck do
            if items[i] == RelicsToCheck[j] then
                count = count + 1
            end
        end

        helperMethods.RegisterMeleeDamageAddend(pickup.id, count)
    end
end

function ADVR.onPickupTaken(itemUpgrade)
    for i = 1, #RelicsToCheck do
        if itemUpgrade == RelicsToCheck[i] then
            helperMethods.RegisterMeleeDamageAddend(pickup.id, 1)
        end
    end
end
