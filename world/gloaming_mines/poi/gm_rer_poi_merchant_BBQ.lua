function ADVR.onLoad()
    poi.name = "Merchant BBQ"
    poi.correspondingFloor = dungeonFloor.GLOAMING_MINES
    poi.probability = 1
    poi.replaceType = "secret"
    poi.spawnAtDeepness = -1
    poi.insightOnFind = 10
end

function ADVR.POIEvents.onFound(firstVisit)
end
