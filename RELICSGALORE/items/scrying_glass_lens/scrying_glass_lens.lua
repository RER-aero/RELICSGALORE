function ADVR.onLoad()
    pickup.name = "Scrying glass lens"
    pickup.desc = "decreases your melee damage greatly, but melee hits have a chance to spawn food"
    pickup.weight = 50
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 60
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onMeleeHitEntity(infos)
    if infos.entity == nil then
		return infos.damage
	end
    if infos.entity.IsEnemy() then
local result = math.random(1,30)

if result == 1 then
local food = game.SpawnObjectNetwork(objects.ITEM_APPLE, game.playerController.rightHand.transform.position)
	food.GetComponent_StartHoverWhenLowVelocity_().SetDistanceOverGround(1.1, 0)
end

end
return infos.damage
end