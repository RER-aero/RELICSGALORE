function ADVR.onLoad()
    pickup.name = "Element bundle"
    pickup.desc = "receive 4 random relics"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function UsePickup(randomUpgrade)
	local upgradeItem = randomUpgrade.GetComponent_ItemUpgrade_() ---@type ItemUpgrade
	game.ShowMessageInWorld(upgradeItem.GetLocalizedName(), 3)
	upgradeItem.OnUseStart()
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if game.runSaveManager.isInLoadRoutine == false then
		local randomUpgrade = game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, vector3.__new(math.random() * 20, math.random() * 20, math.random() * 20))
		pickup.CallFunctionIn("UsePickup", 0.2, randomUpgrade)
         randomUpgrade = game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, vector3.__new(math.random() * 20, math.random() * 20, math.random() * 20))
		pickup.CallFunctionIn("UsePickup", 0.2, randomUpgrade)
	 randomUpgrade = game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, vector3.__new(math.random() * 20, math.random() * 20, math.random() * 20))
		pickup.CallFunctionIn("UsePickup", 0.2, randomUpgrade)
	 randomUpgrade = game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, vector3.__new(math.random() * 20, math.random() * 20, math.random() * 20))
		pickup.CallFunctionIn("UsePickup", 0.2, randomUpgrade)
	
	end
end

        

