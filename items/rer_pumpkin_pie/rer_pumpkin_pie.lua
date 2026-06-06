function ADVR.onLoad()
    pickup.name = "Pumpkin Pie"
    pickup.desc = "Eating food has a chance to spawn another piece of food"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.tier = 2
    pickup.amountUses = -1
    pickup.price = 15
    pickup.spawnsIn = { relicPool.BOSS, relicPool.SACRIFICE, relicPool.SHOP, relicPool.CHEST, relicPool.GOLDEN_CHEST,
        relicPool.PODEST, relicPool.SECRET, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onFoodEaten()
    if helperMethods.IsValidWithLuck(.01, .25, .1) then
        local epstein = math.random(4)
        local food = game.SpawnObjectNetwork(objects.ITEM_FOOD_POTATO, game.playerController.rightHand.transform
        .position)
        if epstein == 1 then
            food = game.SpawnObjectNetwork(objects.ITEM_FOOD_APPLE, game.playerController.rightHand.transform.position)
        elseif epstein == 2 then
            food = game.SpawnObjectNetwork(objects.ITEM_FOOD_STEAK, game.playerController.rightHand.transform.position)
        elseif epstein == 3 then
            food = game.SpawnObjectNetwork(objects.ITEM_FOOD_CHICKEN, game.playerController.rightHand.transform.position)
        else
            food = game.SpawnObjectNetwork(objects.ITEM_FOOD_CHEESE, game.playerController.rightHand.transform.position)
        end
        food.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
    end
end
