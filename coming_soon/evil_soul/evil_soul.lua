 
        function ADVR.onLoad()
	pickup.name = "Evil Soul"
    pickup.desc = "Increases ranged damage but friendly wisps can sometime bring an evil spirit when spawning"
	pickup.weight = 35
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
pickup.RegisterItem()
helperMethods.RegisterRangedDamageAddend(pickup.id, 5)
end

function ADVR.onWispSummon()
 game.SpawnObjectNetwork(objects.ENEMY_FG_WISP, game.playerController.rightHand.transform.position)
end

