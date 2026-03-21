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
    game.itemInterpreter.GetItemById(relics.COVETOUS_HEART).Execute("ADVR.onPickup")	
elseif hello == 2 then
    game.itemInterpreter.GetItemById(relics.WINSOME_HEART).Execute("ADVR.onPickup")	
elseif hello == 3 then
    game.itemInterpreter.GetItemById(relics.TORTURED_HEART).Execute("ADVR.onPickup")	
elseif hello == 4 then
    game.itemInterpreter.GetItemById(relics.IMPASSIONED_HEART).Execute("ADVR.onPickup")	
elseif hello == 5 then
    game.itemInterpreter.GetItemById(relics.RESOLUTE_HEART).Execute("ADVR.onPickup")	
else
  game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE).Execute("ADVR.onPickup")	
	
end
pickup.RegisterItem()
end