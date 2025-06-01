-- Leatrix Plus Fix for GetMouseFocus issue
-- Replace the ShowTip function in Leatrix_Plus.lua with this version

local function ShowTip()
    -- Do nothing if CTRL, SHIFT and ALT are being held
    if IsControlKeyDown() and IsAltKeyDown() and IsShiftKeyDown() then
        return
    end

    -- Get unit information safely
    local mouseFrame = GetMouseFocus and GetMouseFocus() or nil
    if mouseFrame and mouseFrame == WorldFrame then
        LT["Unit"] = "mouseover"
        -- Hide and quit if tips should be hidden during combat
        if LeaPlusLC["TipHideInCombat"] == "On" and UnitAffectingCombat("player") then
            if not IsShiftKeyDown() or LeaPlusLC["TipHideShiftOverride"] == "Off" then
                GameTooltip:Hide()
                return
            end
        end
    else
        LT["Unit"] = select(2, GameTooltip:GetUnit())
        if not (LT["Unit"]) then 
            -- Try to get mouseover unit as fallback
            LT["Unit"] = "mouseover"
            if not UnitExists(LT["Unit"]) then
                return
            end
        end
    end

    -- Rest of the original ShowTip function code goes here...
    -- (Copy the remaining code from the original ShowTip function)
end 