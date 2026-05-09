function ADVR.onLoad()
	pickup.name = "Booster Pack"
	pickup.desc = "Gives two buffing cards"
	pickup.weight = 85
	pickup.maxAmount = 10
	pickup.price = 20
	pickup.tier = 2
	pickup.spawnsIn = { relicPool.SHOP, relicPool.SECRET }
end

function ADVR.onPickup()
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
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_orange", player.transform.position)
	elseif rare == 2 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_yellow", player.transform.position)
	elseif rare == 3 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_green", player.transform.position)
	elseif rare == 4 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_blue", player.transform.position)
	elseif rare == 5 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_violet", player.transform.position)
	else
		drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_pot", player.transform.position)
	end
	
	pickup.CallFunctionIn("UseIt", 0.5, drop.GetComponent_ItemUpgrade_())
end

function Raredrop()
	local rare = math.random(7)
	local drop = nil
	if rare == 1 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_clarence", player.transform.position)
	elseif rare == 2 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_sword", player.transform.position)
	elseif rare == 3 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_tome", player.transform.position)
	elseif rare == 4 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_flail", player.transform.position)
	elseif rare == 5 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_crossbow", player.transform.position)
	elseif rare == 6 then
		 drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_golden_slime", player.transform.position)
		else
		drop = game.DropItem(objects.ITEM_UPGRADE_ALL .. ":" .. "card_gold_pot", player.transform.position)
	end

	pickup.CallFunctionIn("UseIt", 0.5, drop.GetComponent_ItemUpgrade_())
end

function UseIt(upgrade)
	upgrade.OnUseStart()
end