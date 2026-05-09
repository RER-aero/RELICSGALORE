function ADVR.onLoad()
    pickup.name = "Vial of Gold Blood"
    pickup.desc = "Damage scales with the amount of protection hearts you have"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SACRIFICE}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onWeaponHitEntity(infos)

return infos.damage + player.EtherealHealth 
end