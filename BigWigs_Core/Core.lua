-------------------------------------------------------------------------------
-- BigWigs API
-- @module BigWigs
-- @alias core

local core, plugins, bossPrototype, pluginPrototype
do
	local _, tbl =...
	core = tbl.core
	plugins = tbl.plugins
	bossPrototype = tbl.bossPrototype
	pluginPrototype = tbl.pluginPrototype

	core.name = "BigWigs"
end

local CL = BigWigsAPI:GetLocale("BigWigs: Common")
local loader = BigWigsLoader
core.SendMessage = loader.SendMessage

local mod, bosses = {}, {}
local coreEnabled = false

-- Try to grab unhooked copies of critical loading funcs (hooked by some crappy addons)
local GetBestMapForUnit = loader.GetBestMapForUnit
local SendAddonMessage = loader.SendAddonMessage
local GetInstanceInfo = loader.GetInstanceInfo
local UnitGUID = loader.UnitGUID
local UnitIsDeadOrGhost = loader.UnitIsDeadOrGhost

-- Upvalues
local next, type, setmetatable = next, type, setmetatable

local pName = loader.UnitName("player")

-------------------------------------------------------------------------------
-- Event handling
--

do
	local noEvent = "Module %q tried to register/unregister an event without specifying which event."
	local noFunc = "Module %q tried to register event %q to the function %q which doesn't exist in the module."
	local curEvent = "Module %q tried to register event %q to the function %q but the event is in the middle of dispatching."

	local eventMap = {}
	local bwUtilityFrame = CreateFrame("Frame")
	local currentEvent = nil
	bwUtilityFrame:SetScript("OnEvent", function(_, event, ...)
		currentEvent = event
		for k,v in next, eventMap[event] do
			if type(v) == "function" then
				v(event, ...)
			else
				k[v](k, event, ...)
			end
		end
		currentEvent = nil
	end)

	function core:RegisterEvent(event, func)
		if type(event) ~= "string" then error((noEvent):format(self.moduleName)) end
		if (not func and not self[event]) or (type(func) == "string" and not self[func]) then error((noFunc):format(self.moduleName or "?", event, func or event)) end
		if not eventMap[event] then eventMap[event] = {} end

		if eventMap[event][self] then -- Event is already registered to this specific module, just change the assigned function
			eventMap[event][self] = func or event
		else -- Event has not been previously registered to this specific module
			if event == currentEvent then
				core:Error(curEvent:format(self.moduleName or "?", event, func or event))
			end
			eventMap[event][self] = func or event
			bwUtilityFrame:RegisterEvent(event)
		end
	end
	function core:UnregisterEvent(event)
		if type(event) ~= "string" then error((noEvent):format(self.moduleName)) end
		if not eventMap[event] then return end
		eventMap[event][self] = nil
		if not next(eventMap[event]) then
			bwUtilityFrame:UnregisterEvent(event)
			eventMap[event] = nil
		end
	end

	local function UnregisterAllEvents(_, module)
		for k,v in next, eventMap do
			for j in next, v do
				if j == module then
					module:UnregisterEvent(k)
				end
			end
		end
	end
	loader.RegisterMessage(mod, "BigWigs_OnBossDisable", UnregisterAllEvents)
	loader.RegisterMessage(mod, "BigWigs_OnBossWipe", UnregisterAllEvents)
	loader.RegisterMessage(mod, "BigWigs_OnPluginDisable", UnregisterAllEvents)
end

-------------------------------------------------------------------------------
-- ENCOUNTER event handler
--

if loader.isRetail or loader.isMists or loader.isCata then
	function mod:ENCOUNTER_START(_, encounterId)
		for _, module in next, bosses do
			if module:IsEncounterID(encounterId) and not module:IsEnabled() then
				module:Enable()
				if UnitGUID("boss1") then -- Only if _START fired after IEEU
					module:Engage()
				end
			end
		end
	end
else
	function mod:ENCOUNTER_START(_, encounterId)
		for _, module in next, bosses do
			if module:IsEncounterID(encounterId) then
				if not module:IsEnabled() then
					module:Enable()
				end
				module:Engage()
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Target monitoring
--

local enablemobs = {}

local function UpdateMouseoverUnit()
	local guid = UnitGUID("mouseover")
	if not guid or UnitIsCorpse("mouseover") or UnitIsDead("mouseover") then return end
	local _, _, _, _, _, mobIdString = strsplit("-", guid)
	local mobId = tonumber(mobIdString)
	if mobId then
		local moduleNameOrTable = enablemobs[mobId]
		if type(moduleNameOrTable) == "table" then
			for i = 1, #moduleNameOrTable do
				local moduleName = moduleNameOrTable[i]
				local module = bosses[moduleName]
				if module and not module:IsEnabled() and (not module.VerifyEnable or module:VerifyEnable("mouseover", mobId, GetBestMapForUnit("player"))) then
					module:Enable()
					if not module.worldBoss then
						module:Sync("Enable", module.moduleName)
					end
				end
			end
		elseif moduleNameOrTable then
			local module = bosses[moduleNameOrTable]
			if module and not module:IsEnabled() and (not module.VerifyEnable or module:VerifyEnable("mouseover", mobId, GetBestMapForUnit("player"))) then
				module:Enable()
				if not module.worldBoss then
					module:Sync("Enable", module.moduleName)
				end
			end
		end
	end
end

local function UnitTargetChanged(_, mobId, unitTarget)
	if not UnitIsDead(unitTarget) then
		local moduleNameOrTable = enablemobs[mobId]
		if type(moduleNameOrTable) == "table" then
			for i = 1, #moduleNameOrTable do
				local moduleName = moduleNameOrTable[i]
				local module = bosses[moduleName]
				if module and not module:IsEnabled() and (not module.VerifyEnable or module:VerifyEnable(unitTarget, mobId, GetBestMapForUnit("player"))) then
					module:Enable()
				end
			end
		elseif moduleNameOrTable then
			local module = bosses[moduleNameOrTable]
			if module and not module:IsEnabled() and (not module.VerifyEnable or module:VerifyEnable(unitTarget, mobId, GetBestMapForUnit("player"))) then
				module:Enable()
			end
		end
	end
end

function core:RegisterEnableMob(module, ...)
	for i = 1, select("#", ...) do
		local mobId = select(i, ...)
		if type(mobId) ~= "number" or mobId < 1 then
			core:Error(("Module %q tried to register the mobId %q, but it wasn't a valid number."):format(module.moduleName, tostring(mobId)))
		else
			module.enableMobs[mobId] = true -- Module specific list
			-- Global list
			local entryType = type(enablemobs[mobId])
			if entryType == "nil" then
				enablemobs[mobId] = module.moduleName
			elseif entryType == "table" then
				enablemobs[mobId][#enablemobs[mobId] + 1] = module.moduleName
			elseif entryType == "string" then -- Converting from 1 module registered to this mobId, to multiple modules
				local previousModuleEntry = enablemobs[mobId]
				enablemobs[mobId] = { previousModuleEntry, module.moduleName }
			else
				core:Error(("Unknown type in a enable trigger table at index %d for %q."):format(i, module.moduleName))
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Communication
--

local function bossComm(_, msg, extra, sender)
	if msg == "Enable" and extra then
		local m = bosses[extra]
		if m and not m:IsEnabled() and sender ~= pName then
			m:Enable()
		end
	end
end

function mod:RAID_BOSS_WHISPER(_, msg) -- Purely for Transcriptor to assist in logging purposes.
	if msg ~= "" and IsInGroup() then
		local result = SendAddonMessage("Transcriptor", msg, IsInGroup(2) and "INSTANCE_CHAT" or "RAID")
		if type(result) == "number" and result ~= 0 then
			core:Error("Failed to send TS comm. Error code: ".. result)
		end
	end
end

-------------------------------------------------------------------------------
-- Initialization
--

local initModules = {}
do
	local function InitializeModules()
		local count = #initModules
		if count > 0 then
			for i = 1, count do
				initModules[i]:Initialize()
			end
			initModules = {}
		end
	end

	local addonName = ...
	function mod:ADDON_LOADED(_, name)
		if name ~= addonName then return end

		mod.ADDON_LOADED = InitializeModules
		InitializeModules()
	end
	core.RegisterEvent(mod, "ADDON_LOADED")
end

do
	local function DisableModules()
		for _, module in next, bosses do
			if module:IsEngaged() and (module:GetJournalID() or module:GetAllowWin()) and UnitIsDeadOrGhost("player") then
				module:Wipe()
			end
			module:Disable()
		end
		for i = #plugins, 1, -1 do
			plugins[i]:Disable()
		end
	end
	local function DisableCore()
		if coreEnabled then
			coreEnabled = false

			loader.UnregisterMessage(mod, "BigWigs_BossComm")
			core.UnregisterEvent(mod, "ZONE_CHANGED_NEW_AREA")
			core.UnregisterEvent(mod, "PLAYER_LEAVING_WORLD")
			core.UnregisterEvent(mod, "ENCOUNTER_START")
			core.UnregisterEvent(mod, "RAID_BOSS_WHISPER")
			core.UnregisterEvent(mod, "UPDATE_MOUSEOVER_UNIT")
			loader.UnregisterMessage(mod, "BigWigs_UNIT_TARGET")

			core:SendMessage("BigWigs_StopConfigureMode")
			if BigWigsOptions then
				BigWigsOptions:Close()
			end
			DisableModules()
			core:SendMessage("BigWigs_CoreDisabled")
		end
	end
	local function zoneChanged()
		-- Not if you released spirit on a world boss or if the GUI is open
		if not UnitIsDeadOrGhost("player") and (not BigWigsOptions or not BigWigsOptions:IsOpen()) then
			local bars = plugins.Bars
			if not bars or not bars:HasActiveBars() then -- Not if bars are showing
				DisableCore() -- Alive in a non-enable zone, disable
			end
		end
	end

	local function EnablePlugins()
		for i = 1, #plugins do
			plugins[i]:Enable()
		end
	end
	local zoneList = loader.zoneTbl
	local function CheckIfLeavingDelve(_, oldId, newId)
		if zoneList[oldId] and not zoneList[newId] then
			DisableCore() -- Leaving a Delve
		elseif zoneList[newId] then
			-- Joining a delve but we were already enabled from something
			DisableCore()
			--core:Enable() -- We rely on the 0 second delay from the loader to re-enable the core
		end
	end
	function core:Enable()
		if not coreEnabled then
			coreEnabled = true

			loader.RegisterMessage(mod, "BigWigs_BossComm", bossComm)
			core.RegisterEvent(mod, "ENCOUNTER_START")
			core.RegisterEvent(mod, "RAID_BOSS_WHISPER")
			core.RegisterEvent(mod, "UPDATE_MOUSEOVER_UNIT", UpdateMouseoverUnit)
			loader.RegisterMessage(mod, "BigWigs_UNIT_TARGET", UnitTargetChanged)
			core.RegisterEvent(mod, "PLAYER_LEAVING_WORLD", DisableCore) -- Simple disable when leaving instances
			if C_EventUtils.IsEventValid("PLAYER_MAP_CHANGED") then
				core.RegisterEvent(mod, "PLAYER_MAP_CHANGED", CheckIfLeavingDelve)
			end
			local _, instanceType = GetInstanceInfo()
			if instanceType == "none" then -- We don't want to be disabling in instances
				core.RegisterEvent(mod, "ZONE_CHANGED_NEW_AREA", zoneChanged) -- Special checks for disabling after world bosses
			end


			if IsLoggedIn() then
				EnablePlugins()
			else
				core.RegisterEvent(mod, "PLAYER_LOGIN", EnablePlugins)
			end

			core:SendMessage("BigWigs_CoreEnabled")
		end
	end
end

function core:IsEnabled()
	return coreEnabled
end

function core:Print(msg)
	print("BigWigs: |cffffff00"..msg.."|r")
end

function core:Error(msg, noPrint)
	if not noPrint then
		core:Print(msg)
	end
	geterrorhandler()("BigWigs: ".. msg)
end

-------------------------------------------------------------------------------
-- API
--

do
	local currentLocale = GetLocale()
	if currentLocale == "enGB" then currentLocale = "enUS" end
	function core:NewBossLocale(moduleName, locale)
		local module = bosses[moduleName]
		if module and currentLocale == locale then
			return module:GetLocale()
		end
	end
end

-------------------------------------------------------------------------------
-- Module handling
--

do
	local errorAlreadyRegistered = "%q already exists as a module in BigWigs, but something is trying to register it again."
	local errorJournalIdInvalid = "%q is using the invalid journal id of %q."
	local bossMeta = { __index = bossPrototype, __metatable = false }
	local EJ_GetEncounterInfo = loader.isCata and function(key)
		return EJ_GetEncounterInfo(key) or BigWigsAPI:GetLocale("BigWigs: Encounters")[key]
	end or (loader.isRetail or loader.isMists) and EJ_GetEncounterInfo or function(key)
		return BigWigsAPI:GetLocale("BigWigs: Encounters")[key]
	end
	function core:NewBoss(moduleName, zoneId, journalId)
		if bosses[moduleName] then
			core:Print(errorAlreadyRegistered:format(moduleName))
		else
			local m = setmetatable({
				name = "BigWigs_Bosses_"..moduleName, -- XXX AceAddon/AceDB backwards compat
				moduleName = moduleName,
				enableMobs = {},

				-- Embed callback handler
				RegisterMessage = loader.RegisterMessage,
				UnregisterMessage = loader.UnregisterMessage,
				SendMessage = loader.SendMessage,

				-- Embed event handler
				RegisterEvent = core.RegisterEvent,
				UnregisterEvent = core.UnregisterEvent,
			}, bossMeta)
			bosses[moduleName] = m
			initModules[#initModules+1] = m

			if journalId then
				local name = EJ_GetEncounterInfo(journalId)
				if name or journalId < 0 then
					m.journalId = journalId
					m.displayName = name or moduleName
				else
					m.displayName = moduleName
					core:Print(errorJournalIdInvalid:format(moduleName, journalId))
				end
			else
				m.displayName = moduleName
			end

			if type(zoneId) == "table" or zoneId > 0 then
				m.instanceId = zoneId
			else
				m.mapId = -zoneId
			end
			return m, CL
		end
	end

	local L = BigWigsAPI:GetLocale("BigWigs")
	local pluginMeta = { __index = pluginPrototype, __metatable = false }
	function core:NewPlugin(moduleName, globalFuncs)
		if plugins[moduleName] then
			core:Print(errorAlreadyRegistered:format(moduleName))
		else
			local m = setmetatable({
				name = "BigWigs_Plugins_"..moduleName, -- XXX AceAddon/AceDB backwards compat
				moduleName = moduleName,
				globalFuncs = globalFuncs or {"db"},

				-- Embed callback handler
				RegisterMessage = loader.RegisterMessage,
				UnregisterMessage = loader.UnregisterMessage,
				SendMessage = loader.SendMessage,

				-- Embed event handler
				RegisterEvent = core.RegisterEvent,
				UnregisterEvent = core.UnregisterEvent,
			}, pluginMeta)
			plugins[#plugins+1] = m
			plugins[moduleName] = m
			initModules[#initModules+1] = m

			return m, L
		end
	end
end

function core:IterateBossModules()
	return next, bosses
end

function core:GetBossModule(moduleName, silent)
	if not silent and not bosses[moduleName] then
		error(("No boss module named '%s' found."):format(moduleName))
	else
		return bosses[moduleName]
	end
end

function core:GetPluginOptions()
	local tbl = {}
	for i = 1, #plugins do
		local module = plugins[i]
		tbl[module.moduleName] = {module.pluginOptions, module.subPanelOptions}
	end
	return tbl
end

function core:GetPlugin(moduleName, silent)
	if not plugins[moduleName] then
		if not silent then
			error(("No plugin named '%s' found."):format(moduleName))
		else
			return
		end
	else
		local moduleTbl = {}
		for i = 1, #plugins[moduleName].globalFuncs do
			local entry = plugins[moduleName].globalFuncs[i]
			moduleTbl[entry] = plugins[moduleName][entry]
		end
		return moduleTbl
	end
end

do
	local C_EncounterJournal_GetSectionInfo = loader.isCata and function(key)
		return C_EncounterJournal.GetSectionInfo(key) or BigWigsAPI:GetLocale("BigWigs: Encounter Info")[key]
	end or (loader.isRetail or loader.isMists) and C_EncounterJournal.GetSectionInfo or function(key)
		return BigWigsAPI:GetLocale("BigWigs: Encounter Info")[key]
	end
	local C = core.C -- Set from Constants.lua
	local standardFlag = C.BAR + C.CASTBAR + C.MESSAGE + C.ICON + C.SOUND + C.SAY + C.SAY_COUNTDOWN + C.PROXIMITY + C.FLASH + C.ALTPOWER + C.VOICE + C.INFOBOX + C.NAMEPLATE
	local defaultToggles = setmetatable({
		berserk = C.BAR + C.MESSAGE + C.SOUND,
		proximity = C.PROXIMITY,
		altpower = C.ALTPOWER,
		infobox = C.INFOBOX,
	}, {__index = function()
		return standardFlag
	end})

	local function setupOptions(module)
		if module.optionHeaders then
			for k, v in next, module.optionHeaders do
				if type(v) == "string" then
					if CL[v] then
						module.optionHeaders[k] = CL[v]
					end
				elseif type(v) == "number" then
					if v > 0 then
						local n = loader.GetSpellName(v)
						if not n then core:Error(("Invalid spell ID %d in the optionHeaders for module %s."):format(v, module.name)) end
						module.optionHeaders[k] = n or v
					else
						local tbl = C_EncounterJournal_GetSectionInfo(-v)
						if not tbl then core:Error(("Invalid journal ID (-)%d in the optionHeaders for module %s."):format(-v, module.name)) end
						module.optionHeaders[k] = tbl and tbl.title or v
					end
				end
			end
		end

		if module.toggleOptions then
			module.toggleDefaults = {}
			for k, v in next, module.toggleOptions do
				local bitflags = 0
				local disabled = false
				local t = type(v)
				if t == "table" then
					for i = 2, #v do
						local flagName = v[i]
						if C[flagName] then
							bitflags = bitflags + C[flagName]
						elseif flagName == "OFF" then
							disabled = true
							break
						else
							error(("%q tried to register '%q' as a bitflag for toggleoption '%q'"):format(module.moduleName, flagName, v[1]))
						end
					end
					v = v[1]
					t = type(v)
				end
				-- mix in default toggles for keys we know
				-- this allows for mod.toggleOptions = {{1234, "bar", "message"}}
				-- while option keys don't usually specify common features such as bar or message
				for _, b in next, C do
					if bit.band(defaultToggles[v], b) == b and bit.band(bitflags, b) ~= b then
						bitflags = bitflags + b
					end
				end
				if disabled then
					if not module.toggleDisabled then
						module.toggleDisabled = {}
					end
					module.toggleDisabled[v] = bitflags
					bitflags = 0
				end
				if t == "string" then
					local custom = v:match("^custom_(o[nf]f?)_.*")
					if custom then
						module.toggleDefaults[v] = custom == "on" and true or false
					elseif v:find("custom_select", nil, true) then
						module.toggleDefaults[v] = 1
					else
						module.toggleDefaults[v] = bitflags
					end
				elseif t == "number" then
					if v > 0 then
						local n = loader.GetSpellName(v)
						if not n then core:Error(("Invalid spell ID %d in the toggleOptions for module %s."):format(v, module.name)) end
						module.toggleDefaults[v] = bitflags
					else
						local tbl = C_EncounterJournal_GetSectionInfo(-v)
						if not tbl then core:Error(("Invalid journal ID (-)%d in the toggleOptions for module %s."):format(-v, module.name)) end
						module.toggleDefaults[v] = bitflags
					end
				end
			end
			module.db = loader.db:RegisterNamespace(module.name, { profile = module.toggleDefaults })
			local db = module.db.profile
			for k, v in next, db do -- Option validation
				local defaultType = type(module.toggleDefaults[k])
				if defaultType == "nil" then
					db[k] = nil
				elseif type(v) ~= defaultType then
					db[k] = module.toggleDefaults[k]
				end
			end
		end
	end

	local function moduleOptions(self)
		if self.GetOptions then
			local toggles, headers, notes = self:GetOptions(CL) -- XXX stop passing CL at some point
			if toggles then self.toggleOptions = toggles end
			if headers then self.optionHeaders = headers end
			if notes then self.notes = notes end
			self.GetOptions = nil
		end
		setupOptions(self)
		self.SetupOptions = nil
	end

	function core:RegisterBossModule(module)
		module.SetupOptions = moduleOptions

		-- Call the module's OnRegister (which is our OnInitialize replacement)
		if type(module.OnRegister) == "function" then
			module:OnRegister()
			module.OnRegister = nil
		end

		core:SendMessage("BigWigs_BossModuleRegistered", module.moduleName, module)
	end

	function core:RegisterPlugin(module)
		if type(module.defaultDB) == "table" then
			module.db = loader.db:RegisterNamespace(module.name, { profile = module.defaultDB } )
		end

		-- Call the module's OnRegister (which is our OnInitialize replacement)
		if type(module.OnRegister) == "function" then
			module:OnRegister()
			module.OnRegister = nil
		end
		core:SendMessage("BigWigs_PluginOptionsReady", module.moduleName, module.pluginOptions, module.subPanelOptions)

		if coreEnabled then
			module:Enable() -- Support LoD plugins that load after we're enabled (e.g. zone based)
		end
	end
end

function core:AddColors(moduleName, options)
	local module = bosses[moduleName]
	if not module then
		-- core:Error(("AddColors: Invalid module %q."):format(moduleName))
		return
	end
	module.colorOptions = options
end

function core:AddSounds(moduleName, options)
	local module = bosses[moduleName]
	if not module then
		-- core:Error(("AddSounds: Invalid module %q."):format(moduleName))
		return
	end
	module.soundOptions = options
end

-------------------------------------------------------------------------------
-- Global
--

BigWigs = setmetatable({}, { __index = core, __newindex = function() end, __metatable = false })
