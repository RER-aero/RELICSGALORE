function ADVR.onLoad()
	pickup.name = "Gluttons Brand"
	pickup.name = "Spend coins to deal a small bit of damage to nearby enemies"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.amountUses = 9999
	pickup.tier = 2
	pickup.price = 34
	pickup.spawnsIn = {relicPool.BOSS}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
    BrandCost = 10
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
		local enemies = game.GetEnemiesInRadius(13, game.playerHeadset.transform.position, true)
	for v in enemies do
		v.DoHit(player.networkObject, (3))
	end
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