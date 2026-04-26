function ADVR.onLoad()
    pickup.name = "Magic Wand"
    pickup.desc = "Melee swings have a chance to release magic"
    pickup.weight = 45
    pickup.maxAmount = 3
    pickup.price = 50
    pickup.tier = 2
    pickup.spawnsIn = { relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS }
    pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onSwordSwing(velocity)
    if helperMethods.IsValidWithLuck(.10, .90, .350) then
        local enemies = game.GetEnemiesInRadius(10, game.playerController.rightHand.transform.position, false, true)

        local closestEnemy = nil
        local closestDistance = 9999.0
        for enemye in enemies do
            local distance = vector3.Distance(enemye.transform.position,
                game.playerController.rightHand.transform.position)
            if distance < closestDistance then
                closestDistance = distance
                closestEnemy = enemye
            end
        end

        local enemy = closestEnemy



        if enemy ~= nil then
            local projectile = game.SpawnObjectNetwork(objects.WEAPON_PLAYER_MAGIC_ORB_PROJECTILE,
                game.playerController.rightHand.transform.position)


            projectile.gameObject.GetComponent_Collider_().enabled = false


            local startPos = game.playerController.rightHand.transform.position

            local endPos = enemy.GetCenterInWorld()

            -- make time based on distance --
            local dist = vector3.Distance(startPos, endPos)
            pickup.StartLuaCoroutine(MoveBullet, projectile, dist, startPos, enemy)
        end
    end

    -- coroutine to move the projectile towards the enemy --
    function MoveBullet(projectile, duration, startPos, endEnemy)
        local elapsed = 0
        while elapsed < duration / 3 do
            if projectile == nil then
                return
            end

            -- move projectile towards the enemy --
            local endPos = endEnemy.GetCenterInWorld()
            local t = elapsed / (duration / 6)
            projectile.transform.position = vector3.Lerp(startPos, endPos, t)

            elapsed = elapsed + time.deltaTime
            coroutine.yield()
        end

        if projectile ~= nil then
            endEnemy.DoHit(player.networkObject, player.PrimaryDamage.GetValueFloat() * 0.5)
            game.Delete(projectile)
        end
    end
end
