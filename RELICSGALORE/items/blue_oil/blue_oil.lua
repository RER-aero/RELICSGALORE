function ADVR.onLoad()
	pickup.name = "blue oil"
    pickup.desc = "Increases the chance to find food, but higher tier food no longer spawns"
	pickup.weight = 45
	pickup.maxAmount = 1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end


function ADVR.onPickup()
	
	base.preObjectSpawnListeners = {
		game.GetObjectMapping(objects.ITEM_FOOD_APPLE),
		game.GetObjectMapping(objects.ITEM_FOOD_POTATO),
		game.GetObjectMapping(objects.ITEM_FOOD_STEAK),
		game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT)
	}
    pickup.RegisterItem()
    ProbabilityPotatoReplace = 0.80
	ProbabilityAppleReplace = 0.2
	ProbabilitySteakReplace = 0.0
	ProbabilityDragonfruitReplace = 0.0
end
function ADVR.onPickupProxies(originalPlayerRef)
	
	base.preObjectSpawnListeners = {
		game.GetObjectMapping(objects.ITEM_FOOD_APPLE),
		game.GetObjectMapping(objects.ITEM_FOOD_POTATO),
		game.GetObjectMapping(objects.ITEM_FOOD_STEAK),
		game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT)
	}
	pickup.RegisterItemNoSync()
    ProbabilityPotatoReplace = 0.8
	ProbabilityAppleReplace = 0.2
	ProbabilitySteakReplace = 0.0
	ProbabilityDragonfruitReplace = 0.0
end



function ADVR.onPreObjectSpawn(prefab, override)
    -- Apple
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_APPLE) then
        if math.random() < ProbabilityAppleReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_PLUM),
                game.GetObjectMapping(objects.ITEM_FOOD_CHEESE),
                game.GetObjectMapping(objects.ITEM_FOOD_PEAR),
                game.GetObjectMapping(objects.ITEM_FOOD_ORANGE)
            }
            -- Randomly pick one replacement
            return replacements[math.random(#replacements)]
        end
    end

    -- Potato
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_POTATO) then
        if math.random() < ProbabilityPotatoReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_YAM),
                game.GetObjectMapping(objects.ITEM_FOOD_BEET)
            }
            return replacements[math.random(#replacements)]
        end
    end

    -- Steak
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_STEAK) then
        if math.random() < ProbabilitySteakReplace then
            local replacements = {
                game.GetObjectMapping(objects.ITEM_FOOD_CHICKEN)
            }
            return replacements[math.random(#replacements)]
        end
    end

    -- Dragonfruit
    if prefab == game.GetObjectMapping(objects.ITEM_FOOD_DRAGONFRUIT) then
        if math.random() < ProbabilityDragonfruitReplace then
            local replacements = {
            }
            if #replacements > 0 then
                return replacements[math.random(#replacements)]
            end
        end
    end

    return override
end