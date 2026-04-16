
function ADVR.onLoad()
    pickup.name = "Skipping Stone"
    pickup.desc = "Moderately Increase stats, but taking relics will slow you down"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	player.PrimaryDamage.RegisterAddend(pickup.id, 4)
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.15)
	player.SecondaryDamage.RegisterAddend(pickup.id, 2)
	player.EvasionChance.RegisterAddend(pickup.id, 0.15)
end


function ADVR.onPickupTaken(takenPickup)
	player.MoveSpeed.RegisterAddend(pickup.id, -.05)

end