function ADVR.onLoad()
    pickup.name = "Messengers Brand"
	pickup.name = "Spend coins to dash"
	pickup.weight = 45
	pickup.maxAmount = 1
	pickup.amountUses = 9999
	pickup.tier = 2
	pickup.price = 39
	pickup.spawnsIn = {relicPool.BOSS, relicPool.SHOP}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
    BrandCost = 8
		InvincibilityQueue = 0
end

function ADVR.onPickup()
	pickup.RegisterUsable()
	if player.SharedCashPool < BrandCost then
		pickup.currentCharge = 0
		game.activePickupSlot.UpdateChargeDisplay()
	end

	local livings = game.GetLivingInRadius(100, player.transform.position, false)
end

function RemoveInvincibility()
	InvincibilityQueue = InvincibilityQueue - 1
	if InvincibilityQueue == 0 then
		player.UnregisterInvincibility(pickup.id)
	end
end

function OnDashStep()
	local direction = game.playerHeadset.transform.forward
	direction.y = 0
	direction = direction.normalized * time.deltaTime * 12

	if physics.Raycast(game.playerLiving.transform.position, direction, 0.45, layerMask.GetMask(layers.STATIC, layers.GROUND)) then
		direction = vector3.zero
	end

	player.characterController.Move(direction)
end

function ADVR.onPickupActivate()
	if player.SharedCashPool > BrandCost then
		player.currentCash = player.currentCash - BrandCost
		if player.SharedCashPool > BrandCost then
			pickup.CallFunctionIn("Recharge", 1)
		end
if InvincibilityQueue == 0 then
		player.RegisterInvincibility(pickup.id)
	end
	InvincibilityQueue = InvincibilityQueue + 1
	audio.PlaySoundNetwork(sounds.WIGHT_DASH_MONO, player.transform.position)
	pickup.CallFunctionOnRepeat("OnDashStep", 0.4, 0.0)
	pickup.CallFunctionIn("RemoveInvincibility", 0.4)
	
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