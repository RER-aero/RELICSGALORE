
function ADVR.onLoad()
	  pickup.name = "Writing Quill"
    pickup.desc = "swaps primary and secondary damage"
	pickup.weight = 55
	pickup.maxAmount = 1
	pickup.price = 35
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.CHEST, relicPool.GOLDEN_CHEST, relicPool.SHOP, relicPool.BOSS, relicPool.PODEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()

   local temp = player.PrimaryDamage
   player.PrimaryDamage = player.SecondaryDamage
   player.SecondaryDamage = temp

end



