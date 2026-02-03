function ADVR.onLoad()
	pickup.name = "magenta oil"
    pickup.desc = "Decreases the chance to find food, but higher tier food has a greater chance of spawning"
	pickup.weight = 45
	pickup.maxAmount = 1
	pickup.price = 50
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
    pickup.isSharedItem = true
end


function ADVR.onPickup()
    pickup.RegisterItem()
    ProbabilityPotatoReplace = 0.1
	ProbabilityAppleReplace = 0.1
	ProbabilitySteakReplace = 0.4
	ProbabilityDragonfruitReplace = 0.3
end
function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
    ProbabilityPotatoReplace = 0.1
	ProbabilityAppleReplace = 0.1
	ProbabilitySteakReplace = 0.4
	ProbabilityDragonfruitReplace = 0.3
end


