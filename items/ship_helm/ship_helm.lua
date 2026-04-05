function ADVR.onLoad()
    pickup.name = "Ship Helm"
    pickup.desc = "Triple heart containers but has a chance to just straight up kill you"
	pickup.weight = 20
	pickup.maxAmount = 2
	pickup.amountUses = -1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if player.Health <= 0 then
		return
	end
	
	player.MaxHealth = player.MaxHealth * 3
    if math.random(6) == 1 then
        player.DamagePlayer(999, false)
    end
end