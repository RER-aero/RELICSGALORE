function ADVR.onLoad()
	pickup.name = "blue oil"
    pickup.desc = "Increases the chance to find food, but higher tier food no longer spawns"
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
    ProbabilityPotatoReplace = 0.80
	ProbabilityAppleReplace = 0.2
	ProbabilitySteakReplace = 0.0
	ProbabilityDragonfruitReplace = 0.0
end
function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItem()
    ProbabilityPotatoReplace = 0.8
	ProbabilityAppleReplace = 0.2
	ProbabilitySteakReplace = 0.0
	ProbabilityDragonfruitReplace = 0.0
end


