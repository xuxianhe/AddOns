WorldTrackingRawItems = {} 


--WorldTrackingRawItems to unitId2itemIds map
local unitId2itemIds = {}
DugisGuideViewer.unitId2itemIds = unitId2itemIds

for itemId, info in pairs(WorldTrackingRawItems) do
    if info.U then
        for _, unitId in pairs(info.U) do
            local items = unitId2itemIds[unitId]
            if not items then
                items = {}
                unitId2itemIds[unitId] = items
            end
            items[itemId] = true
        end
    end
end