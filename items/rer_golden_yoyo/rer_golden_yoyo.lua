function ADVR.onLoad()
    pickup.name = "Golden YoYo"
    pickup.desc = "Gain extra grand library coins if you win this run"
	pickup.weight = 55
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 35
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
    	
end


function ADVR.onRunComplete()
	
        local rand = math.random(5,8)
        
		player.GrandLibraryCoins = player.GrandLibraryCoins + rand + player.newGamePlusLevel
        
	end