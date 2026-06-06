function ADVR.onLoad()
    pickup.name = "Mask Of Lust"
    pickup.desc = "Loose a heart container, but gaining heart containers will increase evasion"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.SECRET, relicPool.SACRIFICE, relicPool.SPECIAL}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
       player.MaxHealth = player.MaxHealth - 2
   player.Health = math.max(0, math.min(player.MaxHealth, player.Health))
		
   
end

function ADVR.onPlayerValueChanged(statID)
if statID == playerValues.MAX_HEALTH then
     player.EvasionChance.RegisterAddend(pickup.id, .02)
end

end