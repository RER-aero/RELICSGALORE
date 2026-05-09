function ADVR.onLoad()    pickup.name = "Sword of Valor"
    pickup.desc = "Gain 1 protection hearts but loose a great amount of coins"
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
	player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))
   player.currentCash = player.currentCash - 50
end