local addonName,ns = ...

ItemUseInputSaved = {}
W_ItemUseSaved = {}
_G[addonName] = ns


local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, _, addon)
    if addon ~= addonName then  return end
    if type(ItemUseInputSaved) ~="table" then 
		ItemUseInputSaved = {}
	end
	if type(W_ItemUseSaved) ~= "table" then
		W_ItemUseSaved = {}
	end

end)
local function Debug(...)
	--print(...)
end

local function GetOrCreateCharacterSaved(namespace,defaultSaved)
	assert(type(namespace) == "string","namespace must be string.")
	if (ItemUseInputSaved[namespace] == nil) then
		ItemUseInputSaved[namespace] = {}
		if defaultSaved then
			assert(type(defaultSaved) == "table","defaultSaved must be table. ")
			ItemUseInputSaved[namespace] = defaultSaved
		end
		Debug("Create Saved",namespace,defaultSaved)
	end
	Debug("Get Saved", namespace)
	return ItemUseInputSaved[namespace]
end

local function GetOrCreateGlobleSaved(namespace,defaultSaved)
	assert(type(namespace) == "string","namespace must be string.")
	if (W_ItemUseSaved[namespace] == nil) then
		W_ItemUseSaved[namespace] = {}
		if defaultSaved then
			assert(type(defaultSaved) == "table","defaultSaved must be table. ")
			W_ItemUseSaved[namespace] = defaultSaved
		end
		Debug("Create Saved",namespace,defaultSaved)
	end
	Debug("Get Saved", namespace)
	return W_ItemUseSaved[namespace]
end

function ns:GetOrCreateSaved(namespace,savedType,defaultSaved)
	if savedType == "G" then
		return GetOrCreateGlobleSaved(namespace,defaultSaved)
	end
	return GetOrCreateCharacterSaved(NAMESPACE,DEFAULTsAVED)
end


function ns:ClearSaved(namespace,savedType)
	assert(type(namespace) == "string","namespace must be string.")
	if savedType == "G" then
		assert(W_ItemUseSaved[namespace] ~= nil ,string.format("Saved [%s] is not exists.",namespace))
		W_ItemUseSaved[namespace] = nil
	else
		assert(ItemUseInputSaved[namespace] ~= nil ,string.format("Saved [%s] is not exists.",namespace))
		ItemUseInputSaved[namespace] = nil
	end
	Debug("Clear Saved",namespace)
end
