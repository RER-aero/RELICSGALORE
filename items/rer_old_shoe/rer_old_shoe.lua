function ADVR.onLoad()
    pickup.name = "Old Boot"
    pickup.desc = "Massively increases evasion, but mortality increases by 1 every floor"
	pickup.weight = 50
	pickup.tier = 2
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
    Add = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
	player.EvasionChance.RegisterMultiplier(pickup.id, 1.5)
  
end
function ADVR.onAfterBossAreaGenerated()
Add= Add + 1
end
    

function ADVR.onPlayerHit(damage, damageSource, receivedDamageType, hitPosition, isStatsProbe)
	return damage + Add
end