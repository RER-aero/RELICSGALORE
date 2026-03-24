function ADVR.onLoad()
    pickup.name = "Mask Of Gluttony"
    pickup.desc = "Loose a heart container, but eating food increases multiple random stats based on food tier"
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
		[objects.ITEM_FOOD_DRAGONFRUIT] = { upgrades = 3},
		[objects.ITEM_FOOD_STEAK]       = { upgrades = 2},
		[objects.ITEM_FOOD_CHICKEN]     = { upgrades = 2},
		[objects.ITEM_FOOD_APPLE]       = { upgrades = 1},
		[objects.ITEM_FOOD_ORANGE]      = { upgrades = 0},
		[objects.ITEM_FOOD_PEAR]        = { upgrades = 1},
		[objects.ITEM_FOOD_CHEESE]      = { upgrades = 2},
		[objects.ITEM_FOOD_POTATO]      = { upgrades = 0},
		[objects.ITEM_FOOD_YAM]         = { upgrades = 0},
		[objects.ITEM_FOOD_BEET]        = { upgrades = 0},
		[objects.ITEM_FOOD_PLUM]        = { upgrades = 1},
	}

end
function ADVR.onFoodEaten(food)
  local props = FoodProperties[food.livingBase.livingID]
if props then
		 NumberOfUpgrades = props.upgrades
end
for i = 0, NumberOfUpgrades do
local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
end


end