function ADVR.onLoad()
	pickup.name = "Iron Gum"
    pickup.desc = "Increases luck and evasion but eating food decreases a random stat"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS, relicPool.PODEST}
	pickup.supportedInMultiplayer = true

end
function ADVR.onPickup()
    pickup.RegisterItem()
    player.Luck.RegisterAddend(pickup.id, 0.75)
    player.EvasionChance.RegisterAddend(pickup.id, 0.4)
end

function ADVR.onFoodEaten()
 local results = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, -1)
    local textResult = ""
    if results == nil then
    return
end
    for i = 0, #results - 1 do
        local color = ""
        if i ~= 0 then
            color = "<color=#289407>"
        else
            color = "<color=#e82e20>"
        end
        textResult = textResult .. color .. results[i] .. "</color>"
        if i == 0 then
            textResult = textResult .. "\n\n"
        elseif i < #results - 1 then
            textResult = textResult .. "\n"
        end
    end
    game.ShowMessageInWorld(textResult, 2)
end
