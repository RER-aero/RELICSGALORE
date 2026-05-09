
function ADVR.onLoad()
    pickup.name = "Silver Microphone"
    pickup.desc = "Using a mark spawns a wisp"
	pickup.weight = 40
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
end




function ADVR.onPreMarkTriggered()
  game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
end