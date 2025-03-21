local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    C_CVar.RegisterCVar("addonProfilerEnabled", "1")
    C_CVar.SetCVar("addonProfilerEnabled", "0")
    
    print("|cffFFC0CBAutoProfiler|r: CVar已启用")
end)