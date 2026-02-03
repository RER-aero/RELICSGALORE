function ADVR.onLoad()
	progress.name = "Combined blast"
	progress.desc = "Casting uses all available orbs, that casted orbs damage scales both in size and damage with how many orbs were used"
	progress.price = 3
	progress.currency = "beastblood"
end

function ADVR.ProgressEvents.onBuy()
end
function ADVR.onDungeonGenerated()
  OrbsPlayerHas = game.inventory.currentSecondaryWeapon.AsMagicBookBase().maxMana
end
function ADVR.onWandCast(spawnedBullet)
	spawnedBullet.transform.localScale = spawnedBullet.transform.localScale * (OrbsPlayerHas / 2)
	 OrbsPlayerHas = OrbsPlayerHas - 1
	 OrbsPlayerHas = 
	
end
  
	function ADVR.onWandCharged
		 game.inventory.currentSecondaryWeapon.AsMagicOrbBase().orbLoadedParticles =  OrbsPlayerHas
	end
	onorbreturn