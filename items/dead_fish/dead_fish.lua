function ADVR.onLoad()
    pickup.name = "Dead Fish"
    pickup.desc = "donating coins to the scrying glass has a chance to reward you with a relic"
    pickup.weight = 55
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 20
    pickup.tier = 1
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP, relicPool.CHEST, relicPool.GOLDEN_CHEST }
    pickup.supportedInMultiplayer = true
    
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPostScryingGlassDonation()
    if helperMethods.IsValidWithLuck(.02, .5, .1) then
        game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, game.playerController.rightHand.transform.position)
    end
end
