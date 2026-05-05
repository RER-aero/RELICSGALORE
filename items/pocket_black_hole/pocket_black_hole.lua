function ADVR.onLoad()
    pickup.name = "Pocket Black Hole"
    pickup.desc = "Pulls enemies towards you when using a mark"
    pickup.weight = 35
    pickup.maxAmount = 1
    pickup.price = 80
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.SACRIFICE, relicPool.SECRET }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
 
  
end

function ADVR.onPostMarkTriggered()
   local bombPosition =game.playerController.rightHand.transform.position
        local pullRadius = 5.0
        local pullStrength = 0.5

        local living = game.GetEnemiesInRadius(pullRadius, bombPosition, false, true)
        for i = 0, #living - 1 do
            local living = living[i]

            if not living.rigidb.isKinematic and not living.isInKnockback then
                local direction = vector3.Normalize(bombPosition - living.transform.position)

                -- do via knockback so networking kind of works --
                local distance = vector3.Distance(bombPosition, living.transform.position)
for k = 1, 8, 1 do
                if distance > 0.5 then
                    living.RpcKnockback(math.min(distance, 0.25) * -1, game.playerHeadset.transform.position, 3,
                        knockbackType.FORCE_PUSH)
                end
            end
        end
    end


end