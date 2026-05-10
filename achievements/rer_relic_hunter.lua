function ADVR.onLoad()
	achievement.name = "Relic Hunter"
	achievement.desc = "Discover every item from RELICSGALORE"
	achievement.hideDescription = false
	achievement.category = "exploration"
	achievement.predecessors = {achievements.GOOD_LUCK}
	achievement.showProgressBar = true
	RelicsList = {}
	for pick in game.itemInterpreter.pickupsOnDisk do
		if string.match(pick.id, "rer_") then
			table.insert(RelicsList, pick.id)
		end
	end
end

function ADVR.onPlayerDeathOrRunComplete()
	Unlock(false)
end

function GetProgressInfo()
	local val = Unlock(true)
	return val, #RelicsList
end

function Unlock(check)
	local unlocked = true
	if not check then
		for value in RelicsList do
			local relic = game.itemInterpreter.GetPickupById(value)
			if relic ~= nil and unlocked == true then
				if not relic.HasFoundItem() then
					unlocked = false
				end
			end
		end
	else
		local num = 0
		unlocked = false
		for value in RelicsList do
			local relic = game.itemInterpreter.GetPickupById(value)
			if relic ~= nil then
				if relic.HasFoundItem() then
					num = num + 1
				end
			end
		end
		return num
	end

	if unlocked then
		achievement.Unlock()
	end
end
