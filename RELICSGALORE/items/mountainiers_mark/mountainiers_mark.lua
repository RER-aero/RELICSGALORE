function ADVR.onLoad()
    pickup.name = "Mountainiers Mark"
    pickup.desc = "Use to freeze a nearby enemy for a long time"
	pickup.weight = 55
	pickup.maxAmount = 1
	pickup.amountUses = 7
	pickup.price = 40
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.GOLDEN_CHEST}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	local enemies = game.GetEnemiesInRadius(8, game.playerHeadset.position, true, true)
	for v in enemies do
		if v.isBoss() == false then
			pickup.StartLuaCoroutine(FreezeRoutine, enemies, 5)
		end
		break
	end
end