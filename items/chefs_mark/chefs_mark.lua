function ADVR.onLoad()
	pickup.name = "Chefs Mark"
    pickup.desc = "When used, spawn a random food item"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.amountUses = 12
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.BOSS, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
    pickup.isActivateItem = true
end

function ADVR.onPickup()
pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local epstein = math.random(4)
	local food = game.SpawnObjectNetwork(objects.ITEM_FOOD_POTATO, game.playerController.rightHand.transform.position)
	if epstein == 1 then
 food = game.SpawnObjectNetwork(objects.ITEM_APPLE, game.playerController.rightHand.transform.position)
	elseif epstein == 2 then
 food = game.SpawnObjectNetwork(objects.ITEM_FOOD_STEAK, game.playerController.rightHand.transform.position)
	elseif epstein == 3 then
		 food = game.SpawnObjectNetwork(objects.ITEM_FOOD_CHICKEN, game.playerController.rightHand.transform.position)
	else 
		 food = game.SpawnObjectNetwork(objects.ITEM_FOOD_CHEESE, game.playerController.rightHand.transform.position)
	end
	food.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
end
