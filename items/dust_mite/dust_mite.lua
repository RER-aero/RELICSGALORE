function ADVR.onLoad()
    pickup.name = "Dust Mite"
    pickup.desc = "Gain a stat boost but you can't obtain protection hearts anymore"
    pickup.weight = 75
    pickup.maxAmount = 1
    pickup.price = 24
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.PODEST, relicPool.BOSS, relicPool.SHOP, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
end
   
function ADVR.onPlayerValueChanged(statID)
    if statID == playerValues.ETHEREAL_HEALTH then
        player.RemoveEtherealHealth(player.EtherealHealth, false)
    end
end

function ADVR.onPickup()
    pickup.RegisterItem()

    helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
    helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
    helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)



    player.RemoveEtherealHealth(50)
end

