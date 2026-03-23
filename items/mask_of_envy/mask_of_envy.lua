function ADVR.onLoad()
    pickup.name = "Mask Of Envy"
    pickup.desc = "Loose a heart container, but picking up tier 3 relics increases a random stat "
    pickup.weight = 55
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 35
    pickup.tier = 2
    pickup.spawnsIn = {relicPool.CHEST, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
    player.MaxHealth = player.MaxHealth - 1
end

function ADVR.onPickupTaken(itemUpgrade)
    local relicTier = GetTierofPickup(itemUpgrade.name)
if  relicTier  == 3 then
  
	if game.runSaveManager.isInLoadRoutine then
		return
	end

	local result = helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
	game.ShowMessageInWorld("<color=#289407>" .. result .. "</color>", 4)
end
end

function GetTierofPickup(pickupName)
    for pick in game.itemInterpreter.pickupsOnDisk do
        if pick.name == pickupName then
            return pick.tier
        end
    end
end

