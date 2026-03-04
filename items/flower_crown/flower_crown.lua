function ADVR.onLoad()
    pickup.name = "Flower Crown"
    pickup.desc = "Each floor you complete permanently increases your max health"
    pickup.weight = 40
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 50
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onDungeonGenerated(worldGenerator)
    player.MaxHealth = player.MaxHealth + 2
end