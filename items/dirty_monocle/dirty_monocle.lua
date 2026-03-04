function ADVR.onLoad()
    pickup.name = "dirty Monocle"
    pickup.desc = "Moderately increases stats but you can no longer view relic descriptions in advance"
	pickup.weight = 70
	pickup.maxAmount = 1
	pickup.amountUses = 1
	pickup.price = 60
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
	PickupsDictionary = {}

	game.RegisterForRPCEvents(pickup)
end


function ADVR.onPickup()
	FillDictornaryWithDefaultValues()
	pickup.RegisterItem()
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.35)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 1.35)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.1)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.1)
	if game.runSaveManager.isInLoadRoutine == false then
		HidePickupStats()
	end
end


function ADVR.onPickupProxies(originalPlayerRef)
	FillDictornaryWithDefaultValues()
	pickup.RegisterItemNoSync()
	player.PrimaryDamage.RegisterMultiplier(pickup.id, 1.35)
	player.SecondaryDamage.RegisterMultiplier(pickup.id, 1.35)
	player.PrimaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.SecondaryCritChance.RegisterAddend(pickup.id, 0.1)
	player.EvasionChance.RegisterAddend(pickup.id, 0.1)
	player.ShopDiscount.RegisterAddend(pickup.id, 0.1)
	HidePickupStats()
end


function ADVR.onPickupTaken(pick)
	pickup.SendRPCEvent(2, pick.rolledItem.id, rpcType.TO_ALL)
	ShowStatsOfCertainPickup(pick.rolledItem)
end

function ADVR.onRPCReceived(eventID, sourcePlayer, pickupId)
	ShowStatsOfCertainPickup(game.itemInterpreter.GetPickupById(pickupId))
end

function ADVR.onPreGameReload()
	ResetAllTranslations()
end

function ResetAllTranslations()
	for pick in game.itemInterpreter.pickupsOnDisk do
		ShowStatsOfCertainPickup(pick)
	end
end


function FillDictornaryWithDefaultValues()
	for pick in game.itemInterpreter.pickupsOnDisk do
		PickupsDictionary[pick.id] = {
			name = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("relic_" .. pick.id .. "_name"),
			desc = game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("relic_" .. pick.id .. "_desc"),
			sprite = pick.sprite
		}
	end
end


function HidePickupStats()
	AllActivePickups = game.itemInterpreter.GetActivePickupsFromAllPlayers()
	for pick in game.itemInterpreter.pickupsOnDisk do
		if not IsStringInList(AllActivePickups, pick.id) then
			game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("relic_" .. pick.id .. "_desc", "???")
				
		end
	end
end

function ADVR.onSaveLoaded()
	HidePickupStats()
	AllActivePickups = game.itemInterpreter.GetActivePickupsFromAllPlayers()
	for pick in game.itemInterpreter.pickupsOnDisk do
		if IsStringInList(AllActivePickups, pick.id) then
			ShowStatsOfCertainPickup(pick)
		end
	end
end

function ShowStatsOfCertainPickup(pick)
	local orginalPickupData = PickupsDictionary[pick.id]
	pick.sprite = orginalPickupData.sprite
	game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("relic_" .. pick.id .. "_name", orginalPickupData.name)
	game.localizationInterpreter.currentlySelectedLanguage.SetTranslation("relic_" .. pick.id .. "_desc", orginalPickupData.desc)
end

function IsStringInList(list, target)
    for value in list do
        if value.id == target then
            return true
        end
    end
    return false
end