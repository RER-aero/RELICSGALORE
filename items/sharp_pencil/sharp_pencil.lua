function ADVR.onLoad()
	pickup.name = "Sharp Pencil"
    pickup.desc = "Increases both: all stats and abberant spawns"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
end
function ADVR.onPickup()
pickup.RegisterItem()
 player.ProbabilityForChampionEnemy = player.ProbabilityForChampionEnemy + .1


	player.PrimaryDamage.RegisterAddend(pickup.id, 3)
	player.SecondaryDamage.RegisterAddend(pickup.id, 3)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.1)

	player.ShopDiscount.RegisterAddend(pickup.id, 0.1)
	player.Luck.RegisterAddend(pickup.id, 0.1)
end



