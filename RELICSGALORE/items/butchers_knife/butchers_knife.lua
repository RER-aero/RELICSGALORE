function ADVR.onLoad()
	pickup.name = "Butchers knife"
    pickup.desc = "All of your current bone related relics increase your melee damage by 1"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 1
	pickup.spawnsIn = { relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
local relicsToCheck = {
    relics.BONE_DICE,
    relics.BLUNTED_KNUCKLEBONE,
    relics.PACKRAT_MANDIBLE,
    relics.ASCETICS_MARK,
    relics.GOLD_TOOTH,
    relics.SNAKE_FANG,
}

local count = 0
for i = 1, #relicsToCheck do
    if game.itemInterpreter.AmountPickupFoundByLocalPlayer(relicsToCheck[i]) > 0 then
        count = count + 1
    end
end

helperMethods.RegisterMeleeDamageAddend(pickup.id, count*1.25)
end



