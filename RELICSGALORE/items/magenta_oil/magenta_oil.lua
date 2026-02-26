function ADVR.onLoad()
	pickup.name = "magenta oil"
    pickup.desc = "Decreases the chance to find food, but higher tier food has a greater chance of spawning"
	pickup.weight = 45
	pickup.maxAmount = 1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end


function ADVR.onPickup()
    pickup.RegisterItem()
    ProbabilityPotatoReplace = 0.1
	ProbabilityAppleReplace = 0.1
	ProbabilitySteakReplace = 0.4
	ProbabilityDragonfruitReplace = 0.3
end
function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
    ProbabilityPotatoReplace = 0.1
	ProbabilityAppleReplace = 0.1
	ProbabilitySteakReplace = 0.4
	ProbabilityDragonfruitReplace = 0.3
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