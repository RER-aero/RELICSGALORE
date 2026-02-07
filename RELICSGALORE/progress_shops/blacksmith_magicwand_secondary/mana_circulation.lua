function ADVR.onLoad()
	progress.name = "Mana Circulation"
	progress.desc = "Mana recharges almost instantly, but spell damage is decreased"
	progress.price = 3
	progress.currency = "beastblood"
end
function ADVR.ProgressEvents.onBuy()
end
function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
		player.PrimaryDamage = 2
	game.inventory.currentPrimaryWeapon.AsMagicOrbBase().timeForManaChargeToComeBack = .1
    end
end