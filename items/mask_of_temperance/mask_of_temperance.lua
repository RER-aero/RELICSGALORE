function ADVR.onLoad()
    pickup.name = "Mask Of Gluttony"
    pickup.desc = "Loose a heart container, but eating food when at low health or throwing food away increases crit chance"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SECRET, relicPool.BOSS, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end


  function ADVR.onLoad()
    pickup.name = "Mask Of Temperance"
    pickup.desc = "Loose a heart container, but eating food at low health or throwing it away increases crit chance"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SECRET, relicPool.BOSS, relicPool.SACRIFICE}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
    
	FoodProperties = {
		[objects.ITEM_FOOD_DRAGONFRUIT] = { upgrades = 6},
		[objects.ITEM_FOOD_STEAK]       = { upgrades = 4},
		[objects.ITEM_FOOD_CHICKEN]     = { upgrades = 4},
		[objects.ITEM_FOOD_APPLE]       = { upgrades = 2},
		[objects.ITEM_FOOD_ORANGE]      = { upgrades = 2},
		[objects.ITEM_FOOD_PEAR]        = { upgrades = 2},
		[objects.ITEM_FOOD_CHEESE]      = { upgrades = 4},
		[objects.ITEM_FOOD_POTATO]      = { upgrades = 1},
		[objects.ITEM_FOOD_YAM]         = { upgrades = 1},
		[objects.ITEM_FOOD_BEET]        = { upgrades = 1},
		[objects.ITEM_FOOD_PLUM]        = { upgrades = 1},
	}

end

function ADVR.onFoodEaten(food)
  local item = FoodProperties[food.livingBase.livingId]
if player.RealHealth - item.upgrades == 1 then
player.PrimaryCritChance.RegisterAddend(pickup.id, .05)
player.SecondaryCritChance.RegisterAddend(pickup.id, .025)
end

end



function ADVR.onEntityDeath(livingBaseReference, sourceReference, lastDamageType)
	if game.IsProxy() then
		return
	end

    if lastDamageType ~= damageType.PIT then
		return
	end
player.PrimaryCritChance.RegisterAddend(pickup.id, .025)
player.SecondaryCritChance.RegisterAddend(pickup.id, .05)
	
	end
