function ADVR.onLoad()
    pickup.name = "Zinc Chalice"
    pickup.desc = "Moderately increases discount and luck, but orbs can no longer be found in the dungeon"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 30
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.CHEST, relicPool.SHOP, relicPool.PODEST }
    pickup.supportedInMultiplayer = true
end
--Credit to FartExploder69 for the sprite and idea
function ADVR.onPickup()
    pickup.RegisterItem()
    game.dropTableHandler.RemoveObjectFromAllDropTables(objects.ITEM_ORB)
    player.ShopDiscount.RegisterMultiplier(pickup.id, 1.2, false)
    player.Luck.RegisterMultiplier(pickup.id, 1.2, false)

end
