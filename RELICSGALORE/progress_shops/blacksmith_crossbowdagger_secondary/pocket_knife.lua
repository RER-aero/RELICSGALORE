function ADVR.onLoad()
	progress.name = "Pocket knife"
	progress.desc = "shortens your dagger, but increase crit chance"
	progress.price = 3
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(dungeon)
	game.inventory.currentSecondaryWeapon.AsSwordBase().bladeCreator.transform.localScale = vector3.__new(.8, .6, 1)
	player.SecondaryCritChance.RegisterMultiplier(progress.id, 1.2)
end