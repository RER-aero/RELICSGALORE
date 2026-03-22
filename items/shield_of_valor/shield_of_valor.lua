function ADVR.onLoad()    pickup.name = "Shield of Valor"
    pickup.desc = "Gain 3 protection hearts but loose all evasion"
	pickup.weight = 40
	pickup.maxAmount = 2
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.GOLDEN_CHEST, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if player.Health <= 0 then
		return
	end
	game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE).Execute("ADVR.onPickup")	
	game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE).Execute("ADVR.onPickup")	
	game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE).Execute("ADVR.onPickup")	
    player.EvasionChance.RegisterMultiplier(pickup.id, 0)
end