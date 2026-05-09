function ADVR.onLoad()
    pickup.name = "Mask Of Pride"
    pickup.desc = "Loose a heart container, but defeating bosses increases a random stat greatly"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.BOSS, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end


function ADVR.onAfterBossAreaGenerated(worldGenerator)

       local result = helperMethods.ChangeRandomPlayerStatsSlightlyUnique(pickup.id, 2)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)

	
end