function ADVR.onLoad()
    pickup.name = "Jesters Mark"
    pickup.desc = "Turns nearby enemies into relics"
    pickup.weight = 20
    pickup.maxAmount = 1
    pickup.amountUses = 25
    pickup.price = 55
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SACRIFICE }
    pickup.isActivateItem = true
    pickup.supportedInMultiplayer = true

    game.RegisterForRPCEvents(pickup)
end

function ADVR.onPickup()
    pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
    local items = game.GetEnemiesInRadius(5, game.playerController.rightHand.transform.position, true, true)
    for enemy in items do
        if not enemy.isBoss() then
            game.SpawnObjectNetwork(objects.ITEM_UPGRADE_ALL, enemy.transform.position)
            enemy.DoHit(player.networkObject, 999)
        end
    end
end
