function ADVR.onLoad()
	pickup.name = "Chefs Mark"
    pickup.desc = "When used, spawn a randome food item"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.BOSS, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
    pickup.isActivateItem = true
end

function ADVR.onPickup()
pickup.RegisterItem()
end
function ADVR.onPickupActivate()
local food = game.SpawnObjectNetwork(objects.ITEM_APPLE, game.playerController.rightHand.transform.position)
	food.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
end
