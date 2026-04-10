function ADVR.onLoad()
    pickup.name = "Vial of Blood"
    pickup.desc = "Damage scales with the amount of heart containers you have"
	pickup.weight = 80
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SACRIFICE}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onWeaponHitEntity(infos)

return infos.damage + player.MaxHealth 
end