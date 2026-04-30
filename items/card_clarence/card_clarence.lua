function ADVR.onLoad()
    pickup.name = "Clarence Card"
    pickup.desc = "Increases multiple random stats"
	pickup.weight = 0
	pickup.maxAmount = 3
	pickup.price = 20
	pickup.tier = 1
	pickup.spawnsIn = {}
	
end


function ADVR.onPickup()
	pickup.RegisterItem()
     helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
      helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1.1)
       helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1)
        helperMethods.ChangeRandomPlayerStatSlightly(pickup.id, 1.1)

end
