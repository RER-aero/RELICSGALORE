function ADVR.onLoad()
    pickup.name = "Carnivorous Plant"
    pickup.desc = "If an enemy comes near you, they take some damage"
	pickup.weight = 65
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 40
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.PODEST, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
	pickup.globalTickDelay = 5
FoundEnemy = nil
end



function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onGlobalTick()

	if FoundEnemy ~= nil then
		audio.PlaySoundLocal(sounds.ITEM_FOOD_APPLE_EAT, FoundEnemy.transform.positon)
		FoundEnemy.DoHit(player.networkObject, player.PrimaryDamage.GetValueFloat() * 4)
        FoundEnemy = nil
	else
		local enemies = game.GetEnemiesInRadius(3, game.playerController.rightHand.transform.position, true, true)
		for v in enemies do
			if not v.IsInvincible then
				FoundEnemy = v
				break
			end
		end
	end
end

