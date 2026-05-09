function ADVR.onLoad()
    pickup.name = "Pin of Valor"
    pickup.desc = "Sets your health to half a heart but gain 2 protection hearts"
	pickup.weight = 40
	pickup.maxAmount = 5
	pickup.amountUses = -1
	pickup.price = 25
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if player.Health <= 0 then
		return
	end
	player.RemoveEtherealHealth(99)
	player.Health = 1
	player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))	
	player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))	
end