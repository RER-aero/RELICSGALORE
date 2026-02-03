function ADVR.onLoad()
	progress.name = "supa long"
	progress.desc = "SUPER DUPER LONG AH BOI"
	progress.price = 350
	progress.currency = "gold"
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
		game.inventory.currentPrimaryWeapon.AsFlailBase().ChangeChainLength(3.5)
	end
end 