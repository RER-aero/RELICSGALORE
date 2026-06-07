function ADVR.onLoad()
    pickup.name = "HUD"
    pickup.desc = "Each enemy in the room increases your damage slightly"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 40
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.PODEST, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
     player.PrimaryDamage.RegisterAddend(pickup.id, 0)
     player.SecondaryDamage.RegisterAddend(pickup.id, 0)
end

function ADVR.onRoomEntered()
    Enemies = game.GetEnemiesInRadius(15, player.transform.position, false, false)
    player.PrimaryDamage.ChangeAddend(pickup.id, #Enemies)
     player.SecondaryDamage.ChangeAddend(pickup.id, #Enemies)
end

