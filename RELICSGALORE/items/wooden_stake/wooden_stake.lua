
function ADVR.onLoad()
	pickup.name = "Wooden Spike"
    pickup.desc = "Increase all personal stats greatly, but every time you are hit will decrease a personal stat"
	pickup.weight = 78
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

	 player.PrimaryDamage.RegisterAddMult(pickup.id, 1, 1.8)
     player.PrimaryCritChance.RegisterAddend(pickup.id, 0.5)
     player.SecondaryDamage.RegisterAddMult(pickup.id, 1, 1.6)
     player.SecondaryCritChance.RegisterAddend(pickup.id, 0.5)
   
end

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
	if isStatsProbe then
		return damage
	end
    player.PrimaryDamage.RegisterAddend(pickup.id, -2)
	player.PrimaryCritChance.RegisterAddend(pickup.id, -0.1)
	player.SecondaryCritChance.RegisterAddend(pickup.id, -0.05)
    player.SecondaryDamage.RegisterAddend(pickup.id, -2)
	return damage
end
