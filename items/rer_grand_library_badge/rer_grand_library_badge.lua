function ADVR.onLoad()
    pickup.name = "Grand Library Badge"
    pickup.desc = "Donating coins to the scrying glass has a chance to not take a coin"
    pickup.weight = 80
    pickup.maxAmount = 3
    pickup.amountUses = -1
    pickup.price = 20
    pickup.tier = 1
    pickup.spawnsIn = { relicPool.PODEST}
    pickup.supportedInMultiplayer = true
  
end

function ADVR.onPickup()
    pickup.RegisterItem()
end

function ADVR.onPreScryingGlassDonation()
    if helperMethods.IsValidWithLuck(.05, .42, .15) then
      player.currentCash = player.currentCash + 1
    end
end
