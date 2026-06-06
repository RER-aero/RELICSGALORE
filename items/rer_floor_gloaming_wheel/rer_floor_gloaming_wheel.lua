function ADVR.onLoad()
    pickup.name = "Gloaming Wheel"
    pickup.desc = "Collecting keys has a chance to give you some cash"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.price = 30
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SECRET, relicPool.SHOP, relicPool.BOSS }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPreObjectCollect(object, amount)
    if object ~= "key" then
        return amount
    end
    if helperMethods.IsValidWithLuck(0, .75, .35) then
        player.CurrentCash = player.currentCash + math.random(1, 3)
    end
    return amount
end
