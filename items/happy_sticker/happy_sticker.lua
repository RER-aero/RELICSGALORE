
function ADVR.onLoad()
	pickup.name = "Happy Sticker"
    pickup.desc = "When invincible, gain a speed boost"
	pickup.weight = 84
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.CHEST}
	pickup.supportedInMultiplayer = true
	
    
end

function ADVR.onPickup()
	pickup.RegisterItem()

	Speed = false
   
end

function ADVR.onGlobalTick()
	if player.IsInvincible() and Speed == false then
        Speed = true
		player.MoveSpeed.RegisterMultiplier(pickup.id, 1.5)
	end
   if not player.IsInvincible() then
    player.MoveSpeed.ClearMultiplier(pickup.id)
    Speed = false
   end

end
