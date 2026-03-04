function ADVR.onLoad()
    pickup.name = "White Flag"
    pickup.desc = "Hitting an enemy increases damage, but killing an enemy or leaving a room resets it"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
    AddDmg = 0
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onWeaponHitEntity(infos)
AddDmg = AddDmg + 1
	return HandleDamage(infos, player.PrimaryDamage.GetValueFloat()) + AddDmg
end
function ADVR.onEntityDeath(living, source)
 if living.IsEnemy() and source == player.LocalPlayerRef then
        AddDmg = 0
    end
end
function ADVR.onRoomEntered()
  AddDmg = 0
end