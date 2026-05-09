function ADVR.onLoad()
	pickup.name = "Quantun Tunnel"
	pickup.desc = "Increases all stats very greatly, but relics and food will no longer spawn"
	pickup.weight = 66
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.SACRIFICE, relicPool.BOSS, relicPool.SPECIAL, relicPool.SECRET}
	pickup.supportedInMultiplayer = true
      pickup.AddPreObjectSpawnListenersRuntimeByStrings({objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_APPLE, objects.ITEM_FOOD_PEAR, objects.ITEM_FOOD_CHEESE, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_ORANGE, objects.ITEM_FOOD_PLUM})
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 2.5)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 2.5)
    player.PrimaryCritChance.RegisterMultiplier(pickup.id, 2.5)
     player.SecondaryCritChance.RegisterMultiplier(pickup.id, 2.5)

     player.EvasionChance.RegisterAddend(pickup.id, .35)
     player.Luck.RegisterAddend(pickup.id, .20)
    	for pick in game.itemInterpreter.pickupsOnDisk do
			pick.weight = 0
	end
    
end


function ADVR.onPreObjectSpawn(prefab, override, position, rotation)
  
    return nil
end