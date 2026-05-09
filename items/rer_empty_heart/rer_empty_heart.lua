function ADVR.onLoad()
    pickup.name = "Black Heart"
    pickup.desc = "Gain a random protection heart"
	pickup.weight = 60
	pickup.tier = 2
	pickup.maxAmount = 10
	pickup.amountUses = 1
	pickup.price = 20
	pickup.spawnsIn = {relicPool.SECRET, relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    local hello = math.random(6)
 if hello == 1 then
    player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.COVETOUS_HEART))
elseif hello == 2 then
    player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.WINSOME_HEART))
elseif hello == 3 then
   player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.TORTURED_HEART))
elseif hello == 4 then
   player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.IMPASSIONED_HEART))
elseif hello == 5 then
 player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.RESOLUTE_HEART))
else
 player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))	
	
end
pickup.RegisterItem()
end