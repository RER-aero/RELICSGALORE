function ADVR.onLoad()
    pickup.name = "Dusting Broom"
    pickup.desc = "Buying items from the merchant increases discount more than usual"
    pickup.weight = 90
    pickup.maxAmount = 1
    pickup.price = 24
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.PODEST, relicPool.BOSS, relicPool.SHOP, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
end
   

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onItemBought()
player.ShopDiscount.RegisterAddend(pickup.id, .03)

end

