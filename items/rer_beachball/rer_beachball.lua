function ADVR.onLoad()
    pickup.name = "Fun Beachball"
    pickup.desc = "Being under an orbs effect will boost stats temporarily"
    pickup.weight = 85
    pickup.maxAmount = 1
    pickup.tier = 2
    pickup.amountUses = -1
    pickup.price = 15
    pickup.spawnsIn = { relicPool.BOSS, relicPool.SACRIFICE, relicPool.SHOP, relicPool.CHEST, relicPool.GOLDEN_CHEST,
        relicPool.PODEST, relicPool.SECRET, relicPool.SPECIAL }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onGlobalTick()
local isActive = false
    for key, value in pairs(game.potionInterpreter.activePotions) do
        if value.id ~= "demanding_orb" then
            for _, effectInstance in pairs(value.potionEffectInstances) do
                if effectInstance.affectedPlayer ~= nil then
                    isActive = true
                end
            end
        end
    end
    if isActive then
        player.PrimaryDamage.ChangeAddend(pickup.id, 4)
           player.PrimaryCritChance.ChangeAddend(pickup.id, .15)
             player.SecondaryDamage.ChangeAddend(pickup.id, 3)
           player.SecondaryCritChance.ChangeAddend(pickup.id, .1)
    else
        player.PrimaryDamage.ClearAddend(pickup.id)
           player.PrimaryCritChance.ClearAddend(pickup.id)
             player.SecondaryDamage.ClearAddend(pickup.id)
           player.SecondaryCritChance.ClearAddend(pickup.id)
    end
end