function ADVR.onLoad()
    pickup.name = "Tainted Lily"
    pickup.desc =
    "Gain a 3 heart containers and a protection heart, but if you dont kill an enemy within a time limit YOU DIE"
    pickup.weight = 30
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 65
    pickup.tier = 3
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.SACRIFICE, relicPool.BOSS }
    pickup.supportedInMultiplayer = true

    
    Timer = 60
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth + 6
    player.AddEtherealHealth(2, game.itemInterpreter.GetItemById(relics.BELOVED_KEEPSAKE))
end

function ADVR.onGlobalTick()
    pickup.CallFunctionIn("Tick", 1.0)
end

function ADVR.onEntityDeath(living)
    if living.IsEnemy() and living.networkObject.HasStateAuthority then
        Timer = 60
        ShouldDamagePlayer = false
    end
end

function ADVR.onRunComplete()
    ShouldDamagePlayer = false
end

function Tick()
    if Timer < 21 then
    game.ShowMessageInWorld("tainted death incoming: "..tostring(Timer), 1)
    end
    Timer = Timer - 1
    if Timer <= 0 then
        player.DamagePlayer(6767, false)
    end
end
