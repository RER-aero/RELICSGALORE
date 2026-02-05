function ADVR.onLoad()
    progress.name = "photinic arrow"
    progress.desc = "damage is decreased but arrow returns instantly no matter what"
	progress.price = 5
	progress.currency = "beastblood"
	progress.postObjectSpawnListeners = {game.GetObjectMapping(objects.EFFECT_EXPLOSION_CROSSBOWBOLT)}
	HitEnemy = nil
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated(dungeon)
    player.PrimaryDamage.RegisterAddend(progress.id, -3)
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.spawnExplosion = false
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.dealDirectHitDamage = true
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.delayUntilReturnToPlayer = 0
	game.inventory.currentPrimaryWeapon.AsCrossbowBase().bolt.delayUntilReturnToPlayerMiss = 0
end