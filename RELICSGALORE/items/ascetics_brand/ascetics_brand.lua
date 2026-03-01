function ADVR.onLoad()
    pickup.name = "Ascetics Brand"
	pickup.desc = "Spend coins to increase a random stat"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = 9999
	pickup.tier = 2
	pickup.price = 34
	pickup.spawnsIn = {relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
    BrandCost = 25
end

function ADVR.onPickup()
	pickup.RegisterUsable()
	if player.SharedCashPool < BrandCost then
		pickup.currentCharge = 0
		game.activePickupSlot.UpdateChargeDisplay()
	end

	local livings = game.GetLivingInRadius(100, player.transform.position, false)
end

function ADVR.onPickupActivate()
	if player.SharedCashPool > BrandCost then
		player.currentCash = player.currentCash - BrandCost
		if player.SharedCashPool > BrandCost then
			pickup.CallFunctionIn("Recharge", 1)
		end
local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 2)
	
	end
end

function Recharge()
	pickup.currentCharge = 9999
	game.activePickupSlot.UpdateChargeDisplay()
end

function ADVR.onPlayerValueChanged(statID)
    if statID == playerValues.CURRENT_CASH then
		if player.SharedCashPool >= BrandCost then
			pickup.currentCharge = 9999
			game.activePickupSlot.UpdateChargeDisplay()
		end
    end
end

function ADVR.onObjectCollect(obj)
	if obj == "coin" then
		if player.SharedCashPool >= BrandCost then
			pickup.currentCharge = 9999
			game.activePickupSlot.UpdateChargeDisplay()
		end
	end
end