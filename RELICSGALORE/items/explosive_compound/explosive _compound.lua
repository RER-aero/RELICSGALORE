
function ADVR.onLoad()
    pickup.name = "Explosive compound"
    pickup.desc = "Melee attacks cause an explosion, but melee damage is decreased"
    pickup.weight = 45
    pickup.maxAmount = 1
    pickup.amountUses = 0
    pickup.price = 60
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
    pickup.supportedInMultiplayer = true
end


   
