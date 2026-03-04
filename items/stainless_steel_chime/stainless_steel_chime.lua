function ADVR.onLoad()
	pickup.name = "Stainless steel chime"
    pickup.desc = "Buying relics from the shop spawns a wisp"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.price = 20
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
end




function ADVR.onItemBought(infos)
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
end
	
