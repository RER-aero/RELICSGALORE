function ADVR.onLoad()
    pickup.name = "Prism"
    pickup.desc = "Throwing food into pits will give lower tier food items that add up to the same heal value"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.price = 55
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SPECIAL }
    pickup.entityDeathListeners = { objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_POTATO, objects.ITEM_FOOD_APPLE,
        objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_ORANGE, objects.ITEM_FOOD_PEAR, objects
        .ITEM_FOOD_CHEESE, objects.ITEM_FOOD_YAM, objects.ITEM_FOOD_BEET, objects.ITEM_FOOD_PLUM }
    pickup.isSharedItem = true
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
    pickup.RegisterItemNoSync()
end

function ADVR.onEntityDeath(livingBaseReference, sourceReference, lastDamageType)
    if game.IsProxy() then
        return
    end

    if lastDamageType ~= damageType.PIT then
        return
    end

   

    local foodProperties = {
        [objects.ITEM_FOOD_DRAGONFRUIT] = { heal = 3, },
        [objects.ITEM_FOOD_STEAK]       = { heal = 2, },
        [objects.ITEM_FOOD_CHICKEN]     = { heal = 2, },
        [objects.ITEM_FOOD_APPLE]       = { heal = 1, },
        [objects.ITEM_FOOD_ORANGE]      = { heal = 1, },
        [objects.ITEM_FOOD_PEAR]        = { heal = 1, },
        [objects.ITEM_FOOD_CHEESE]      = { heal = 2, },
        [objects.ITEM_FOOD_POTATO]      = { heal = 0.5, },
        [objects.ITEM_FOOD_YAM]         = { heal = 0, },
        [objects.ITEM_FOOD_BEET]        = { heal = 0.5, },
        [objects.ITEM_FOOD_PLUM]        = { heal = 1, },
    }

    local props = foodProperties[livingBaseReference.livingId]

    -- If the food ID was found in the table, update the values
    if props.heal == 3 then
        game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
        game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
        game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
    elseif props.heal == 2 then
        game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
        game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
    elseif props.heal == 1 then
        game.SpawnObjectNetwork(objects.ITEM_FOOD_BEET, game.playerController.rightHand.transform.position)
        game.SpawnObjectNetwork(objects.ITEM_FOOD_POTATO, game.playerController.rightHand.transform.position)
    else
        game.SpawnObjectNetwork(objects.ITEM_FOOD_YAM, game.playerController.rightHand.transform.position)
    end
end
