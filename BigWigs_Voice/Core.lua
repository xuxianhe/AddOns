
local name, addon = ...

--------------------------------------------------------------------------------
-- Locals
--

local tostring = tostring
local format = format
addon.SendMessage = BigWigsLoader.SendMessage

--------------------------------------------------------------------------------
-- Event Handlers
--

local path = "Interface\\AddOns\\BigWigs_Voice\\Sounds\\%s.ogg"
local pathYou = "Interface\\AddOns\\BigWigs_Voice\\Sounds\\%sy.ogg"
local function handler(event, module, key, sound, isOnMe)
	local success = PlaySoundFile(format(isOnMe and pathYou or path, tostring(key)), "Master")
	if not success then
		addon:SendMessage("BigWigs_Sound", module, key, sound) 
	end
end

BigWigsLoader.RegisterMessage(addon, "BigWigs_Voice", handler)
BigWigsAPI.RegisterVoicePack("temp")

BigWigsAPI:RegisterCountdown("中文语音：Yoda小兔头", {
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\1.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\2.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\3.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\4.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\5.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\6.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\7.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\8.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\9.ogg",
    "Interface\\AddOns\\BigWigs_Voice\\Media\\Sounds\\10.ogg",
})
