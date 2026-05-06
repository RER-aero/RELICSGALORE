function ADVR.onLoad()
    pickup.name = "Hot Mug"
    pickup.desc = "Eating food has a chance to spawn an orb"
    pickup.weight = 60
    pickup.maxAmount = 20
    pickup.tier = 3
    pickup.amountUses = -1
    pickup.price = 35
    pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()

end

function ADVR.onFoodEaten()
    if helperMethods.IsValidWithLuck(.1, 1, .4) then
        local orb = game.SpawnObjectNetwork(objects.ITEM_ORB, game.playerController.rightHand.transform.position)
        orb.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
    end

end
