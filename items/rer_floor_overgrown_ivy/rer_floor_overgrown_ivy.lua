function ADVR.onLoad()
    pickup.name = "Overgrown Ivy"
    pickup.desc = "Using a mark has a small chance to refill it instantly"
    pickup.weight = 80
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 30
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SHOP }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPostMarkTriggered()
    if helperMethods.IsValidWithLuck(0, .25, .05) then
        game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.amountUses
        game.activePickupSlot.UpdateChargeDisplay()
    end
end
