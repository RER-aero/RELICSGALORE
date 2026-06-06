function ADVR.onLoad()
    pickup.name = "Forgotten Rune"
    pickup.desc = "Every second have a small chance to spawn a wisp"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.tier = 2
    pickup.amountUses = -1
    pickup.price = 15
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SECRET, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onGlobalTick()
    pickup.CallFunctionIn("Wisp", 1)
end

function Wisp()
    if helperMethods.IsValidWithLuck(0, .05, .01) then
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
    end
end
