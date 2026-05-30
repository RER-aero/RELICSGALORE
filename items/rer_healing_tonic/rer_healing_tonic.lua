function ADVR.onLoad()
    pickup.name = "Healing Tonic"
    pickup.desc = "Turn all of your protection hearts into heart containers"
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.price = 45
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.BOSS, relicPool.CHEST }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()

    local prot = player.EtherealHealth
    if prot % 2 ~= 0 then
        prot = prot - 1
    end
    player.RemoveEtherealHealth(prot, true)
    player.MaxHealth = player.MaxHealth + prot
end
