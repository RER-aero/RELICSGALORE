function ADVR.onLoad()
    pickup.name = "Energy Transporter"
    pickup.desc = "Picking up relics recharges your current mark slightly"
    pickup.weight = 90
    pickup.maxAmount = 1
    pickup.amountUses = -1
    pickup.price = 20
    pickup.tier = 1
    pickup.spawnsIn = { relicPool.PODEST }
    pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
    pickup.RegisterItem()
  
end

function ADVR.onPickupTaken(itemUpgrade)
  if game.itemInterpreter.currentUsable ~= nil and not itemUpgrade.IsInInventory()  then
        game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.currentCharge + 3
        game.activePickupSlot.UpdateChargeDisplay()
    end

end