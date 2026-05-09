function ADVR.onLoad()
    pickup.name = "Bombegranate"
    pickup.desc = "Eating food causes an explosion"
	pickup.weight = 90
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.BOSS, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onFoodEaten(food)

	for i = 0, pickup.AmountActiveLocal() do
		local explosion = game.SpawnObjectNetwork(objects.EFFECT_EXPLOSION_BIG, game.playerController.rightHand.transform.position).GetComponent_Explosion_()
		explosion.damage = player.PrimaryDamage.GetValueFloat() * player.SecondaryDamage.GetValueFloat()
    end
end