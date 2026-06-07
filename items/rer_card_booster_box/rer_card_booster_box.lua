function ADVR.onLoad()
	pickup.name = "Booster Box"
	pickup.desc = "Gives 5 buffing cards"
	pickup.weight = 75
	pickup.maxAmount = 5
	pickup.price = 20
	pickup.tier = 3
	pickup.spawnsIn = { relicPool.SHOP, relicPool.SECRET }
end

function ADVR.onPickup()
	if helperMethods.IsValidWithLuck(.1, .75, .25) then
		Raredrop()
	else
		Commondrop()
	end

	if helperMethods.IsValidWithLuck(.1, .75, .25) then
		Raredrop()
	else
		Commondrop()
	end

	if helperMethods.IsValidWithLuck(.05, .65, .15) then
		Raredrop()
	else
		Commondrop()
	end

	if helperMethods.IsValidWithLuck(.1, .75, .25) then
		Raredrop()
	else
		Commondrop()
	end

	if helperMethods.IsValidWithLuck(.05, .65, .15) then
		Raredrop()
	else
		Commondrop()
	end

end

function Commondrop()
	local rare = math.random(6)
	local drop = nil
	if rare == 1 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_orange", player.transform.position)
	elseif rare == 2 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_yellow", player.transform.position)
	elseif rare == 3 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_green", player.transform.position)
	elseif rare == 4 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_blue", player.transform.position)
	elseif rare == 5 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_violet", player.transform.position)
	else
		drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_pot", player.transform.position)
	end
	
	pickup.CallFunctionIn("UseIt", 1.5, drop.GetComponent_ItemUpgrade_())
end

function Raredrop()
	local rare = math.random(7)
	local drop = nil
	if rare == 1 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_clarence", player.transform.position)
	elseif rare == 2 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_sword", player.transform.position)
	elseif rare == 3 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_tome", player.transform.position)
	elseif rare == 4 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_flail", player.transform.position)
	elseif rare == 5 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_crossbow", player.transform.position)
	elseif rare == 6 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_golden_slime", player.transform.position)
	else
		drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "rer_card_gold_pot", player.transform.position)
	end

	pickup.CallFunctionIn("UseIt", 1.5, drop.GetComponent_ItemUpgrade_())
end

function UseIt(upgrade)
	upgrade.OnUseStart()
end