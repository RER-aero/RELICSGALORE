function ADVR.onLoad()
    pickup.name = "Guitar Pick"
    pickup.desc = "Turns your keys into wisps"
    pickup.weight = 80
    pickup.maxAmount = 3
    pickup.price = 45
    pickup.tier = 1
    pickup.spawnsIn = { relicPool.SECRET, relicPool.BOSS, relicPool.GOLDEN_CHEST }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    local keys = player.CurrentKeys 
    player.CurrentKeys = 0
    for i = 0, keys do
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
    end
end
