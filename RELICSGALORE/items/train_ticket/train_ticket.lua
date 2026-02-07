function ADVR.onLoad()
    pickup.name = "Train Ticket"
    pickup.desc = "A random stat is increased and another is decreased after each floor"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
    if game.runSaveManager.isInLoadRoutine == true then
        return
    end

    local results = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, -1, 1)
    local textResult = ""
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
    game.ShowMessageInWorld(textResult, 4)
end