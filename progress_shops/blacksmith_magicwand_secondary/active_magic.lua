function ADVR.onLoad()
	progress.name = "Active Mana"
	progress.desc = "Start with 2 mana but each floor conquered increases max mana by 1"
	progress.price = 8
	progress.currency = "beastblood"
end
function ADVR.ProgressEvents.onBuy()
end
function ADVR.onDungeonGenerated(worldGenerator)
	if helperMethods.IsInFirstDungeon(worldGenerator) then
	game.inventory.currentSecondaryWeapon.AsMagicBookBase().SetMaxMana(1)
    local NextManalevel = 1
    end
    
 NextManalevel = NextManalevel + 1 
    game.inventory.currentSecondaryWeapon.AsMagicBookBase().SetMaxMana(NextManalevel)
    
end

