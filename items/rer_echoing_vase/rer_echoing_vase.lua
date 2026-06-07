function ADVR.onLoad()
    pickup.name = "Echoing Vase"
    pickup.desc = "Wisps have a chance to duplicate when spawned"
    pickup.weight = 90
    pickup.maxAmount = 1
    pickup.price = 24
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.BOSS, relicPool.SHOP, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
    pickup.postObjectSpawnListeners = {
        game.companionWispPrefab
    }
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPostObjectSpawn(prefab, override)
    if helperMethods.IsValidWithLuck(0, .5, .1) then
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
    end
end
