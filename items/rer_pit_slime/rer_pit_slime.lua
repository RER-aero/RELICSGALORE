function ADVR.onLoad()
    pickup.name = "Pit Slime"
    pickup.desc = "Throwing food into pits rewards you with coins (fav food: cheese)"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SPECIAL}
	pickup.entityDeathListeners = {objects.ITEM_FOOD_DRAGONFRUIT, objects.ITEM_FOOD_POTATO, objects.ITEM_FOOD_APPLE, objects.ITEM_FOOD_STEAK, objects.ITEM_FOOD_CHICKEN, objects.ITEM_FOOD_ORANGE, objects.ITEM_FOOD_PEAR, objects.ITEM_FOOD_CHEESE, objects.ITEM_FOOD_YAM, objects.ITEM_FOOD_BEET, objects.ITEM_FOOD_PLUM}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true

end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onEntityDeath(livingBaseReference, sourceReference, lastDamageType)
	if game.IsProxy() then
		return
	end

    if lastDamageType ~= damageType.PIT then
		return
	end

	local numberOfUpgrades = 1
	local chance = 0.0

	local foodProperties = {
		[objects.ITEM_FOOD_DRAGONFRUIT] = { coins = 30,  },
		[objects.ITEM_FOOD_STEAK]       = { coins = 15,  },
		[objects.ITEM_FOOD_CHICKEN]     = { coins = 20,  },
		[objects.ITEM_FOOD_APPLE]       = { coins = 10,  },
		[objects.ITEM_FOOD_ORANGE]      = { coins = 8,  },
		[objects.ITEM_FOOD_PEAR]        = { coins = 10,  },
		[objects.ITEM_FOOD_CHEESE]      = { coins = 35,  },
		[objects.ITEM_FOOD_POTATO]      = { coins = 5,  },
		[objects.ITEM_FOOD_YAM]         = { coins = 2,  },
		[objects.ITEM_FOOD_BEET]        = { coins = 5,  },
		[objects.ITEM_FOOD_PLUM]        = { coins = 6,  },
	}

	local props = foodProperties[livingBaseReference.livingId]

	-- If the food ID was found in the table, update the values
	if props then
		player.currentCash = player.currentCash + props.coins
	else
		return
	end

end
