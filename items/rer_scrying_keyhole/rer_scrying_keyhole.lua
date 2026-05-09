function ADVR.onLoad()
    pickup.name = "Scrying Keyhole"
    pickup.desc = "Donating coins to the scrying glass will also take keys, but will reward extra grand library coins"
    pickup.weight = 65
    pickup.maxAmount = 1
    pickup.amountUses = 1
    pickup.price = 60
    pickup.tier = 3
    pickup.spawnsIn = {relicPool.SPECIAL, relicPool.SHOP, relicPool.PODEST}
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
end
function ADVR.onPostScryingGlassDonation()
    if player.CurrentKeys > 0 then
        player.CurrentKeys = player.CurrentKeys - 1
        player.GrandLibraryCoins = player.GrandLibraryCoins + math.random(4,7)
    end
end