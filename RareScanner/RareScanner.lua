-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local LibStub = _G.LibStub
local RareScanner = LibStub("AceAddon-3.0"):NewAddon("RareScanner", "AceConsole-3.0")

local ADDON_NAME, private = ...

-- Locales
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner");

-- LibAbout frames
local LibAboutPanel = LibStub:GetLibrary("LibAboutPanel-2.0RS", true)

-- RareScanner database libraries
local RSNpcDB = private.ImportLib("RareScannerNpcDB")
local RSContainerDB = private.ImportLib("RareScannerContainerDB")
local RSGeneralDB = private.ImportLib("RareScannerGeneralDB")
local RSConfigDB = private.ImportLib("RareScannerConfigDB")
local RSMapDB = private.ImportLib("RareScannerMapDB")

-- RareScanner internal libraries
local RSConstants = private.ImportLib("RareScannerConstants")
local RSLogger = private.ImportLib("RareScannerLogger")
local RSTimeUtils = private.ImportLib("RareScannerTimeUtils")
local RSUtils = private.ImportLib("RareScannerUtils")
local RSRoutines = private.ImportLib("RareScannerRoutines")

-- RareScanner services
local RSButtonHandler = private.ImportLib("RareScannerButtonHandler")
local RSRespawnTracker = private.ImportLib("RareScannerRespawnTracker")
local RSMap = private.ImportLib("RareScannerMap")
local RSMinimap = private.ImportLib("RareScannerMinimap")
local RSLoot = private.ImportLib("RareScannerLoot")
local RSAudioAlerts = private.ImportLib("RareScannerAudioAlerts")
local RSEventHandler = private.ImportLib("RareScannerEventHandler")
local RSCommandLine = private.ImportLib("RareScannerCommandLine")
local RSTargetUnitTracker = private.ImportLib("RareScannerTargetUnitTracker")

-- RareScanner other addons integration services
local RSTomtom = private.ImportLib("RareScannerTomtom")

-- Main button
local scanner_button = CreateFrame("Button", "scanner_button", UIParent, "SecureActionButtonTemplate, BackdropTemplate")
scanner_button:Hide();
scanner_button:SetIgnoreParentScale(true)
scanner_button:SetFrameStrata("MEDIUM")
scanner_button:SetFrameLevel(200)
scanner_button:SetSize(200, 50)
scanner_button:SetScale(0.8)
scanner_button:RegisterForClicks("RightButtonUp", "LeftButtonUp")
scanner_button:SetAttribute("*type1", "macro")
scanner_button:SetAttribute("*type2", "closebutton")
scanner_button.closebutton = function(self)
	if (not InCombatLockdown()) then
		self.CloseButton:Click()
	end
end
scanner_button:SetNormalTexture([[Interface\AchievementFrame\UI-Achievement-Parchment-Horizontal-Desaturated]])
scanner_button:SetBackdrop({ tile = true, edgeSize = 16, edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]] })
scanner_button:SetBackdropBorderColor(0, 0, 0)
scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)
scanner_button:SetMovable(true)
scanner_button:SetUserPlaced(true)
scanner_button:SetClampedToScreen(true)
scanner_button:RegisterForDrag("LeftButton")

scanner_button:SetScript("OnDragStart", function(self)
	if (not RSConfigDB.IsLockingPosition()) then
		self:StartMoving()
	end
end)
scanner_button:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	RSGeneralDB.SetButtonPositionCoordinates(self:GetLeft(), self:GetBottom())
end)
scanner_button:SetScript("OnEnter", function(self)
	self:SetBackdropBorderColor(0.9, 0.9, 0.9)
end)
scanner_button:SetScript("OnLeave", function(self)
	self:SetBackdropBorderColor(0, 0, 0)
end)
scanner_button:SetScript("OnHide", function(self)
	self.npcID = nil
	self.name = nil
	self.NextButton:Reset()
	self.PreviousButton:Reset()
end)

-- Model view
scanner_button.ModelView = CreateFrame("PlayerModel", "mxpplayermodel", scanner_button)
scanner_button.ModelView:ClearAllPoints()
scanner_button.ModelView:SetPoint("TOP", 0 , 122) -- bottom left corner 2px separation from scanner_button's top left corner
scanner_button.ModelView:SetSize(120, 120)
scanner_button.ModelView:SetScale(1.25)

local Background = scanner_button:GetNormalTexture()
Background:SetDrawLayer("BACKGROUND")
Background:ClearAllPoints()
Background:SetPoint("BOTTOMLEFT", 3, 3)
Background:SetPoint("TOPRIGHT", -3, -3)
Background:SetTexCoord(0, 1, 0, 0.25)

-- Title
local TitleBackground = scanner_button:CreateTexture(nil, "BORDER")
TitleBackground:SetTexture([[Interface\AchievementFrame\UI-Achievement-RecentHeader]])
TitleBackground:SetPoint("TOPRIGHT", -5, -7)
TitleBackground:SetPoint("LEFT", 5, 0)
TitleBackground:SetSize(180, 10)
TitleBackground:SetTexCoord(0, 1, 0, 1)
TitleBackground:SetAlpha(0.8)

scanner_button.Title = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontNormal", 1)
scanner_button.Title:SetNonSpaceWrap(true)
scanner_button.Title:SetPoint("TOPLEFT", TitleBackground, 0, 0)
scanner_button.Title:SetPoint("RIGHT", TitleBackground)
scanner_button.Title:SetTextColor(1, 1, 1, 1)
scanner_button:SetFontString(scanner_button.Title)

local Description = scanner_button:CreateFontString(nil, "OVERLAY", "SystemFont_Tiny")
Description:SetPoint("BOTTOMLEFT", TitleBackground, 0, -12)
Description:SetPoint("RIGHT", -8, 0)
Description:SetTextHeight(6)
Description:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)

scanner_button.Description_text = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontWhiteTiny")
scanner_button.Description_text:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, -4)
scanner_button.Description_text:SetPoint("RIGHT", Description)

-- Close button
scanner_button.CloseButton = CreateFrame("Button", "CloseButton", scanner_button, "UIPanelCloseButton")
scanner_button.CloseButton:SetPoint("BOTTOMRIGHT")
scanner_button.CloseButton:SetSize(32, 32)
scanner_button.CloseButton:SetScale(0.8)
scanner_button.CloseButton:SetHitRectInsets(8, 8, 8, 8)

-- Filter disabled button
scanner_button.FilterEntityButton = CreateFrame("Button", "FilterEntityButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.FilterEntityButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.FilterEntityButton:SetSize(16, 16)
scanner_button.FilterEntityButton:SetNormalTexture([[Interface\WorldMap\Dash_64]])
scanner_button.FilterEntityButton:SetScript("OnClick", function(self)
	local entityID = self:GetParent().npcID
	if (entityID) then
		if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
			if (RSConfigDB.GetDefaultNpcFilter() == RSConstants.ENTITY_FILTER_WORLDMAP) then
				RSConfigDB.SetNpcFiltered(entityID, RSConstants.ENTITY_FILTER_ALL)
			else
				RSConfigDB.SetNpcFiltered(entityID)
			end
			RSLogger:PrintMessage(AL["DISABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		elseif (RSConstants.IsContainerAtlas(self:GetParent().atlasName)) then
			if (RSConfigDB.GetDefaultContainerFilter() == RSConstants.ENTITY_FILTER_WORLDMAP) then
				RSConfigDB.SetContainerFiltered(entityID, RSConstants.ENTITY_FILTER_ALL)
			else
				RSConfigDB.SetContainerFiltered(entityID)
			end
			RSLogger:PrintMessage(string.format(AL["DISABLED_SEARCHING_CONTAINER"], self:GetParent().Title:GetText()))
		end
		
		self:Hide()
		self:GetParent().UnfilterEnabledButton:Show()
	end
end)
scanner_button.FilterEntityButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["DISABLE_SEARCHING_RARE_TOOLTIP"])
	elseif (RSConstants.IsContainerAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["DISABLE_SEARCHING_CONTAINER_TOOLTIP"])
	end
	GameTooltip:Show()
end)

scanner_button.FilterEntityButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

-- Filter enabled button
scanner_button.UnfilterEnabledButton = CreateFrame("Button", "UnfilterEnabledButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.UnfilterEnabledButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.UnfilterEnabledButton:SetSize(16, 16)
scanner_button.UnfilterEnabledButton:SetScript("OnClick", function(self)
	local entityID = self:GetParent().npcID
	if (entityID) then
		if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
			RSConfigDB.DeleteNpcFiltered(entityID)
			RSLogger:PrintMessage(AL["ENABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		elseif (RSConstants.IsContainerAtlas(self:GetParent().atlasName)) then
			RSConfigDB.DeleteContainerFiltered(entityID)
			RSLogger:PrintMessage(string.format(AL["ENABLED_SEARCHING_CONTAINER"], self:GetParent().Title:GetText()))
		end
		self:Hide()
		self:GetParent().FilterEntityButton:Show()
	end
end)
scanner_button.UnfilterEnabledButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["ENABLE_SEARCHING_RARE_TOOLTIP"])
	elseif (RSConstants.IsContainerAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["ENABLE_SEARCHING_CONTAINER_TOOLTIP"])
	end
	GameTooltip:Show()
end)

scanner_button.UnfilterEnabledButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

scanner_button.FilterEnabledTexture = scanner_button.UnfilterEnabledButton:CreateTexture()
scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
scanner_button.FilterEnabledTexture:SetSize(12, 12)
scanner_button.FilterEnabledTexture:SetTexCoord(0,0.5,0,0.5)
scanner_button.FilterEnabledTexture:SetPoint("CENTER")
scanner_button.UnfilterEnabledButton:SetNormalTexture(scanner_button.FilterEnabledTexture)
scanner_button.UnfilterEnabledButton:Hide()

-- Loot bar
scanner_button.LootBar = CreateFrame("Frame", "LootBar", scanner_button)
scanner_button.LootBar.itemFramesPool = CreateFramePool("FRAME", scanner_button.LootBar, "RSLootTemplate");
scanner_button.LootBar.itemFramesPool.InitItemList = function(self, atlasName, entityID)
	self:ReleaseAll()
	
	-- Cancels previous requests
	scanner_button.LootBar:SetScript("OnUpdate", nil)
	
	if (not atlasName or not entityID) then
		return
	end
	
	local parent = self
	parent.items = {}
	parent.totalLoaded = 0

	-- Extract entity loot
	local updateCacheItemRoutine = RSRoutines.LoopRoutineNew()
	if (RSConstants.IsNpcAtlas(atlasName) and RSNpcDB.GetNpcLoot(entityID)) then
		updateCacheItemRoutine:Init(RSNpcDB.GetNpcLoot, 3, nil, nil, entityID)
		parent.totalItems = RSUtils.GetTableLength(RSNpcDB.GetNpcLoot(entityID))
	elseif (RSConstants.IsContainerAtlas(atlasName) and RSContainerDB.GetContainerLoot(entityID)) then
		updateCacheItemRoutine:Init(RSContainerDB.GetContainerLoot, 3, nil, nil, entityID)
		parent.totalItems = RSUtils.GetTableLength(RSContainerDB.GetContainerLoot(entityID))
	else
		return
	end
	
	scanner_button.LootBar:SetScript("OnUpdate", function()
		local finished = updateCacheItemRoutine:Run(function(context, _, itemID)
			if (C_Item.DoesItemExistByID(itemID)) then
				parent:UpdateCacheItem(itemID, entityID)
			else
				parent.totalItems = self.totalItems - 1
				RSLogger:PrintDebugMessage(string.format("Detectado ITEM [%s] para la entidad [%s] que no existe!.", itemID, entityID))
			end
		end)
		if (finished) then
			scanner_button.LootBar:SetScript("OnUpdate", nil)
		end
	end)
end
scanner_button.LootBar.itemFramesPool.UpdateCacheItem = function(self, itemID, entityID)
	if (not itemID or not self.items) then
		return
	end
	
	-- If enough items to show ignore the rest
	if (self.totalLoaded >= RSConfigDB.GetMaxNumItemsToShow()) then
		return
	end
	
	-- Otherwise try to add the item
	self.items[itemID] = {}
	self.items[itemID].loaded = false
	
	local item = Item:CreateFromItemID(itemID)
	if (not item) then
		return
	end
	
	item:ContinueOnItemLoad(function()
		if (not item:GetItemID()) then
			return
		end
		
		local itemIDr, _, _, itemEquipLoc, _, itemClassID, itemSubClassID = GetItemInfoInstant(item:GetItemID())
		if (not itemIDr) then
			return
		end
		
		if (RSLoot.IsFiltered(entityID, itemID, item:GetItemLink(), item:GetItemQuality(), itemEquipLoc, itemClassID, itemSubClassID)) then
			self.items[item:GetItemID()] = nil
			self.totalItems = self.totalItems - 1
		elseif (self.items[item:GetItemID()]) then
			self.items[item:GetItemID()].loaded = true
			self.totalLoaded = self.totalLoaded + 1
		end
		
		if (self.totalLoaded >= RSConfigDB.GetMaxNumItemsToShow() and self:GetNumActive() == 0) then
			self:ShowIfReady()
		elseif (self.totalItems == self.totalLoaded) then
			self:ShowIfReady()
		end
	end)
end
scanner_button.LootBar.itemFramesPool.ShowIfReady = function(self)
	if (not self.items) then
		return
	end
	
	local currentIndex = 1
	for itemID, _ in pairs (self.items) do
		if (self.items[itemID].loaded) then
			if (currentIndex <= RSConfigDB.GetMaxNumItemsToShow()) then
				local itemFrame = self:Acquire()
				itemFrame:AddItem(itemID, self:GetNumActive())
				currentIndex = currentIndex + 1
			else
				break
			end
		end
	end
end
scanner_button.LootBar.LootBarToolTip = CreateFrame("GameTooltip", "LootBarToolTip", scanner_button, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTip:SetScale(0.9)
scanner_button.LootBar.LootBarToolTipComp1 = CreateFrame("GameTooltip", "LootBarToolTipComp1", nil, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTipComp1:SetScale(0.7)
scanner_button.LootBar.LootBarToolTipComp2 = CreateFrame("GameTooltip", "LootBarToolTipComp2", nil, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTipComp2:SetScale(0.7)
scanner_button.LootBar.LootBarToolTip.shoppingTooltips = { scanner_button.LootBar.LootBarToolTipComp1, scanner_button.LootBar.LootBarToolTipComp2 }

-- Show navigation buttons
scanner_button.NextButton = CreateFrame("Frame", "NextButton", scanner_button, "RSRightNavTemplate")
scanner_button.NextButton:Hide()
scanner_button.PreviousButton = CreateFrame("Frame", "PreviousButton", scanner_button, "RSLeftNavTemplate")
scanner_button.PreviousButton:Hide()

-- Register events
RSEventHandler.RegisterEvents(scanner_button, RareScanner)

function scanner_button:SimulateRareFound(npcID, objectGUID, name, x, y, atlasName)
	local vignetteInfo = {}
	vignetteInfo.atlasName = atlasName
	vignetteInfo.id = npcID
	vignetteInfo.name = name
	vignetteInfo.objectGUID = objectGUID or string.format("a-a-a-a-a-%s-a", npcID)
	vignetteInfo.x = x
	vignetteInfo.y = y
	vignetteInfo.simulated = true
	self:DetectedNewVignette(self, vignetteInfo)
end

-- Checks if the rare has been found already in the last 5 minutes
function scanner_button:DetectedNewVignette(self, vignetteInfo, isNavigating)
	RSButtonHandler.AddAlert(self, vignetteInfo, isNavigating)
end

function scanner_button:DisplayMessages(name)
	if (name) then
		if (RSConfigDB.IsDisplayingRaidWarning()) then
			RaidNotice_AddMessage(RaidWarningFrame, string.format(AL["JUST_SPAWNED"], name), ChatTypeInfo["RAID_WARNING"], RSConstants.RAID_WARNING_SHOWING_TIME)
		end

		-- Print message in chat if user wants
		if (RSConfigDB.IsDisplayingChatMessages()) then
			RSLogger:PrintMessage(string.format(AL["JUST_SPAWNED"], name))
		end
	else
		if (RSConfigDB.IsDisplayingRaidWarning()) then
			RaidNotice_AddMessage(RaidWarningFrame, AL["ALARM_MESSAGE"], ChatTypeInfo["RAID_WARNING"], RSConstants.RAID_WARNING_SHOWING_TIME)
		end
	end
end

-- Hide action
function scanner_button:HideButton()
	if (not InCombatLockdown()) then
		GameTooltip:Hide()
		scanner_button.ModelView:ClearModel()
		scanner_button.ModelView:Hide()
		scanner_button:Hide()
	else
		scanner_button.pendingToHide = true
	end
end

-- Show action
function scanner_button:ShowButton()
	if (not self.npcID) then
		return
	end

	-- Resizes the button
	self:SetScale(RSConfigDB.GetButtonScale())

	-- Sets the name
	self.Title:SetText(self.preEvent and string.format(AL["PRE_EVENT"], self.name) or self.name)

	-- show loot bar
	if (RSConfigDB.IsDisplayingLootBar()) then
		self.LootBar.itemFramesPool:InitItemList(self.atlasName, self.npcID)
	else
		self.LootBar.itemFramesPool:ReleaseAll()
	end

	-- show navigation arrows
	if (RSConfigDB.IsDisplayingNavigationArrows()) then
		if (self.NextButton:EnableNextButton()) then
			self.NextButton:Show()
		else
			self.NextButton:Hide()
		end

		if (self.PreviousButton:EnablePreviousButton()) then
			self.PreviousButton:Show()
		else
			self.PreviousButton:Hide()
		end
	end
	
	-- In case it wasn't possible to extract the mapID
	local mapID = self.mapID and self.mapID or ""	

	-- Show button, model and loot panel
	if (RSConstants.IsNpcAtlas(self.atlasName)) then
		self.Description_text:SetText(AL["CLICK_TARGET"])

		local macrotext = "/cleartarget\n/targetexact "..self.name
		if (RSConfigDB.IsDisplayingMarkerOnTarget()) then
			macrotext = string.format("%s\n/tm %s", macrotext, RSConfigDB.GetMarkerOnTarget())
		end

		macrotext = string.format("%s\n/rarescanner %s;%s;%s;%s;%s", macrotext, RSConstants.CMD_TOMTOM_WAYPOINT, mapID, self.x, self.y, self.name)
		
		if (RSConfigDB.IsShowingAnimationForNpcs() and RSConfigDB.GetAnimationForNpcs() ~= RSConstants.MAP_ANIMATIONS_ON_FOUND) then
			macrotext = string.format("%s\n/rarescanner %s;%s", macrotext, RSConstants.CMD_RECENTLY_SEEN, self.npcID, mapID, self.x, self.y)
		end
		self:SetAttribute("macrotext", macrotext)

		-- show model
		if (self.displayID and RSConfigDB.IsDisplayingModel()) then
			self.ModelView:SetCreature(self.npcID, self.displayID)
			
			C_Timer.After(1, function()
				self.ModelView:SetCreature(self.npcID, self.displayID)
				self.ModelView:Show() 
			end)
		else
			self.ModelView:Hide()
		end
	else
		self.Description_text:SetText(AL["NOT_TARGETEABLE"])
		
		local macrotext = string.format("\n/rarescanner %s;%s;%s;%s;%s", RSConstants.CMD_TOMTOM_WAYPOINT, mapID, self.x, self.y, self.name)
		
		-- Set animation on containers
		if (RSConstants.IsContainerAtlas(self.atlasName) and RSConfigDB.IsShowingAnimationForContainers() and RSConfigDB.GetAnimationForContainers() ~= RSConstants.MAP_ANIMATIONS_ON_FOUND) then
			macrotext = string.format("%s\n/rarescanner %s;%s;%s;%s;%s", macrotext, RSConstants.CMD_RECENTLY_SEEN, self.npcID, mapID, self.x, self.y)
		end
		
		self:SetAttribute("macrotext", macrotext)

		-- hide model if displayed
		self.ModelView:ClearModel()
		self.ModelView:Hide()
	end
	
	-- Toggle filter buttons
	if ((RSConstants.IsNpcAtlas(self.atlasName) and RSConfigDB.GetNpcFiltered(self.npcID) == nil) or (RSConstants.IsContainerAtlas(self.atlasName) and RSConfigDB.GetContainerFiltered(self.npcID) == nil) or (RSConstants.IsEventAtlas(self.atlasName))) then
		self.UnfilterEnabledButton:Hide()
		self.FilterEntityButton:Show()
	else
		self.UnfilterEnabledButton:Show()
		self.FilterEntityButton:Hide()
	end
	
	-- show button
	self:Show()

	-- set the time to auto hide
	self:StartHideTimer()
end

local AUTOHIDING_TIMER
function scanner_button:StartHideTimer()
	if (RSConfigDB.GetAutoHideButtonTime() > 0) then
		if (AUTOHIDING_TIMER) then
			AUTOHIDING_TIMER:Cancel()
		end
		AUTOHIDING_TIMER = C_Timer.NewTimer(RSConfigDB.GetAutoHideButtonTime(), function()
			scanner_button:HideButton()
		end)
	end
end

----------------------------------------------
-- Testing
----------------------------------------------
function RareScanner:Test()
	local npcTestName = "Time-Lost Proto-Drake"
	local npcTestID = 32491
	local npcTestDisplayID = 26711

	scanner_button.npcID = npcTestID
	scanner_button.name = npcTestName
	scanner_button.displayID = npcTestDisplayID
	scanner_button.mapID = 120
	scanner_button.x = 2800
	scanner_button.y = 6540
	scanner_button.atlasName = RSConstants.NPC_VIGNETTE
	scanner_button.Title:SetText(npcTestName)
	scanner_button:DisplayMessages(npcTestName)
	RSAudioAlerts.PlaySoundAlert(RSConstants.NPC_VIGNETTE)
	scanner_button.Description_text:SetText(AL["CLICK_TARGET"])

	if (not InCombatLockdown()) then
		scanner_button:ShowButton()
		scanner_button.FilterEntityButton:Hide()
	end

	RSLogger:PrintMessage("test launched")
end

function RareScanner:ResetPosition()
	scanner_button:ClearAllPoints()
	scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)
	RSGeneralDB.SetButtonPositionCoordinates(scanner_button:GetLeft(), scanner_button:GetBottom())
end

----------------------------------------------
-- Loading addon methods
----------------------------------------------
function RareScanner:OnInitialize()
	-- Init database
	self:InitializeDataBase()

	-- Adds about panel to wow options
	if (LibAboutPanel) then
		self.optionsFrame = LibAboutPanel:CreateAboutPanel("RareScanner")
	end

	-- Initialize setup panels
	self:SetupOptions()

	-- Initialize not discovered lists
	RSMap.InitializeNotDiscoveredLists()

	-- Setup our map provider
	WorldMapFrame:AddDataProvider(CreateFromMixins(RareScannerDataProviderMixin));

	-- Add options button to the world map
	RSMap.LoadWorldMapButton()
	
	-- Add minimap icon
	RSMinimap.LoadMinimapButton()

	-- Refresh minimap
	C_Timer.NewTicker(2, function()
		RSMinimap.RefreshAllData()
	end)
	
	-- Initialize command line
	RSCommandLine.Initialize(self)

	RSLogger:PrintDebugMessage("Cargado")
end

local function RefreshDatabaseData(previousDbVersion)
	RareScanner.db:RegisterDefaults(RSConstants.PROFILE_DEFAULTS)
		
	-- Creates a chain of routines to execute in order
	local routines = {}
		
	-- Checks again if the rare names DB is totally updated
	-- It could fail if a "script run too long" exception was launched on the first login
	local currentDbVersion = RSGeneralDB.GetDbVersion()
	if (not currentDbVersion.sync) then
		local recheckRareNamesRoutine = RSRoutines.LoopRoutineNew()
		recheckRareNamesRoutine:Init(RSNpcDB.GetAllInternalNpcInfo, 1000, 
			function(context, npcID, _)
				if (not RSNpcDB.GetNpcName(npcID)) then
					RSLogger:PrintDebugMessage(string.format("NPC [%s]. Sin nombre, reintentando obtenerlo.", npcID))
				end
				if (not RSNpcDB.GetNpcName(npcID)) then
					context.sync = false
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage(string.format("Version sincronizada: [%s]", (context.sync == nil and 'true' or 'false')))
				currentDbVersion.sync = context.sync
			end
		)
		table.insert(routines, recheckRareNamesRoutine)
	end
	
	-- Sync loot found with internal database and remove duplicates
	local lootDbVersion = RSGeneralDB.GetLootDbVersion()
	if (not lootDbVersion or lootDbVersion < RSConstants.CURRENT_LOOT_DB_VERSION) then
		RSGeneralDB.SetLootDbVersion(RSConstants.CURRENT_LOOT_DB_VERSION)
		
		local syncLocalNpcLootRoutine = RSRoutines.LoopRoutineNew()
		syncLocalNpcLootRoutine:Init(RSNpcDB.GetAllNpcsLootFound, 200, 
			function(context, npcID, npcLootFound)
				local cleanItemsList = RSUtils.FilterRepeated(npcLootFound, RSNpcDB.GetInteralNpcLoot(npcID))
				if (cleanItemsList) then
					RSNpcDB.SetNpcLootFound(npcID, cleanItemsList)
				else
					RSNpcDB.RemoveNpcLootFound(npcID)
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage("Sincronizado loot de NPCs local con interno")
			end
		)
		table.insert(routines, syncLocalNpcLootRoutine)
		
		local syncLocalContainercLootRoutine = RSRoutines.LoopRoutineNew()
		syncLocalContainercLootRoutine:Init(RSContainerDB.GetAllContainersLootFound, 200, 
			function(context, containerID, containerLootFound)
				local cleanItemsList = RSUtils.FilterRepeated(containerLootFound, RSNpcDB.GetInteralNpcLoot(containerID))
				if (cleanItemsList) then
					RSContainerDB.SetContainerLootFound(containerID, cleanItemsList)
				else
					RSContainerDB.RemoveContainerLootFound(containerID)
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage("Sincronizado loot de Contenedores local con interno")
			end
		)
		table.insert(routines, syncLocalContainercLootRoutine)
	end
	
	-- Update older container filters system to newer (10.0.5)
	if (RSUtils.GetTableLength(private.db.general.filteredContainers) > 0) then
		-- Set default behaviour
		if (private.db.containerFilters.filterOnlyMap) then
			RSConfigDB.SetDefaultContainerFilter(RSConstants.ENTITY_FILTER_WORLDMAP)
		elseif (private.db.containerFilters.filterOnlyAlerts) then
			RSConfigDB.SetDefaultContainerFilter(RSConstants.ENTITY_FILTER_ALERTS)
		else
			RSConfigDB.SetDefaultContainerFilter(RSConstants.ENTITY_FILTER_ALL)
		end
		
		local fixContainerFilters = RSRoutines.LoopRoutineNew()
		fixContainerFilters:Init(function() return private.db.general.filteredContainers end, 100,
			function(context, containerID, value)
				if (private.db.general.filtersFixed and value == true) then
					RSConfigDB.SetContainerFiltered(containerID)
				elseif (not private.db.general.filtersFixed and value == false) then
					RSConfigDB.SetContainerFiltered(containerID)
				end
			end, 
			function(context)			
				private.db.containerFilters.filterOnlyMap = nil
				private.db.containerFilters.filterOnlyAlerts = nil
				private.db.general.filteredContainers = nil
				RSLogger:PrintDebugMessage("Migrados filtros de contenedores")
			end
		)
		table.insert(routines, fixContainerFilters)
	end

	-- Update older npc filters system to newer (10.0.5)
	if (RSUtils.GetTableLength(private.db.general.filteredRares) > 0) then
		-- Set default behaviour
		if (private.db.rareFilters.filterOnlyMap) then
			RSConfigDB.SetDefaultNpcFilter(RSConstants.ENTITY_FILTER_WORLDMAP)
		else
			RSConfigDB.SetDefaultNpcFilter(RSConstants.ENTITY_FILTER_ALL)
		end
		
		local fixNpcFilters = RSRoutines.LoopRoutineNew()
		fixNpcFilters:Init(function() return private.db.general.filteredRares end, 100,
			function(context, npcID, value)
				if (private.db.general.filtersFixed and value == true) then
					RSConfigDB.SetNpcFiltered(npcID)
				elseif (not private.db.general.filtersFixed and value == false) then
					RSConfigDB.SetNpcFiltered(npcID)
				end
			end, 
			function(context)			
				private.db.rareFilters.filterOnlyMap = nil
				private.db.general.filteredRares = nil
				RSLogger:PrintDebugMessage("Migrados filtros de NPCs")
			end
		)
		table.insert(routines, fixNpcFilters)
	end

	-- Update older event filters system to newer (10.0.5)
	if (RSUtils.GetTableLength(private.db.general.filteredEvents) > 0) then
		-- Set default behaviour
		if (private.db.eventFilters.filterOnlyMap) then
			RSConfigDB.SetDefaultEventFilter(RSConstants.ENTITY_FILTER_WORLDMAP)
		else
			RSConfigDB.SetDefaultEventFilter(RSConstants.ENTITY_FILTER_ALL)
		end
		
		local fixEventFilters = RSRoutines.LoopRoutineNew()
		fixEventFilters:Init(function() return private.db.general.filteredEvents end, 100,
			function(context, eventID, value)
				if (private.db.general.filtersFixed and value == true) then
					RSConfigDB.SetEventFiltered(eventID)
				elseif (not private.db.general.filtersFixed and value == false) then
					RSConfigDB.SetEventFiltered(eventID)
				end
			end, 
			function(context)			
				private.db.eventFilters.filterOnlyMap = nil
				private.db.general.filteredEvents = nil
				RSLogger:PrintDebugMessage("Migrados filtros de Eventos")
			end
		)
		table.insert(routines, fixEventFilters)
	end

	-- Update older zone filters system to newer (10.1.0)
	if (RSUtils.GetTableLength(private.db.general.filteredZones) > 0) then
		-- Set default behaviour
		if (private.db.zoneFilters.filterOnlyMap) then
			RSConfigDB.SetDefaultZoneFilter(RSConstants.ENTITY_FILTER_WORLDMAP)
		else
			RSConfigDB.SetDefaultZoneFilter(RSConstants.ENTITY_FILTER_ALL)
		end
		
		local fixZoneFilters = RSRoutines.LoopRoutineNew()
		fixZoneFilters:Init(function() return private.db.general.filteredZones end, 100,
			function(context, zoneID, value)
				if (private.db.general.filtersFixed and value == true) then
					RSConfigDB.SetZoneFiltered(zoneID)
				elseif (not private.db.general.filtersFixed and value == false) then
					RSConfigDB.SetZoneFiltered(zoneID)
				end
			end, 
			function(context)			
				private.db.zoneFilters.filterOnlyMap = nil
				private.db.general.filteredZones = nil
				RSLogger:PrintDebugMessage("Migrados filtros de Zonas")
			end
		)
		table.insert(routines, fixZoneFilters)
	end

	-- Update older custom NPCs to newer (10.2.0)
	if (RSUtils.GetTableLength(private.dbglobal.custom_npcs) > 0) then
		local needFix = false
		for customNpcID, customNpcInfo in pairs (private.dbglobal.custom_npcs) do
			if (not private.dbglobal.custom_npcs.custom or not private.dbglobal.custom_npcs.noVignette) then
				needFix = true
				break;
			end
		end

		local fixCustomNpcs = RSRoutines.LoopRoutineNew()
		fixCustomNpcs:Init(function() return private.dbglobal.custom_npcs end, 100,
			function(context, customNpcID, customNpcInfo)
				customNpcInfo.custom = true
				customNpcInfo.noVignette = true
				customNpcInfo.nameplate = nil
				-- If decimal values (older custom NPCs), transform to newer coord system
				if (type(customNpcInfo.zoneID) == "table") then
					for zoneID, zoneInfo in pairs (customNpcInfo.zoneID) do
						if (zoneID ~= RSConstants.ALL_ZONES_CUSTOM_NPC and zoneInfo.x and zoneInfo.y) then
							customNpcInfo.zoneID[zoneID].x = RSUtils.Rpad(tostring(zoneInfo.x):gsub('(0%.)',''), 4, '0')
							customNpcInfo.zoneID[zoneID].y = RSUtils.Rpad(tostring(zoneInfo.y):gsub('(0%.)',''), 4, '0')
						end
					end
				else
					if (customNpcInfo.zoneID ~= RSConstants.ALL_ZONES_CUSTOM_NPC and customNpcInfo.x and customNpcInfo.y) then
						customNpcInfo.x = RSUtils.Rpad(tostring(customNpcInfo.x):gsub('(0%.)',''), 4, '0')
						customNpcInfo.y = RSUtils.Rpad(tostring(customNpcInfo.y):gsub('(0%.)',''), 4, '0')
					end
				end

				private.dbglobal.custom_npcs[customNpcID] = customNpcInfo
			end, 
			function(context)			
				RSLogger:PrintDebugMessage("Migrados NPCs personalizados")
			end
		)
		table.insert(routines, fixCustomNpcs)
	end
	
	-- Launch all the routines in order
	local chainRoutines = RSRoutines.ChainLoopRoutineNew()
	chainRoutines:Init(routines)
	chainRoutines:Run(function(context)		
		-- Initialize unit target tracker
		RSTargetUnitTracker.Init(scanner_button)
		
		-- Refresh minimap
		RSMinimap.RefreshAllData(true)
	end)
	
	-- Clear previous overlay if active when closed the game
	RSGeneralDB.RemoveAllOverlayActive()
end

local function UpdateRareNamesDB(currentDbVersion)
	RSGeneralDB.AddDbVersion(RSConstants.CURRENT_DB_VERSION)

	local npcNameScannerRoutine = RSRoutines.LoopRoutineNew()
	npcNameScannerRoutine:Init(RSNpcDB.GetAllInternalNpcInfo, 100)
	C_Timer.NewTicker(0.5, function(self)
		local finished = npcNameScannerRoutine:Run(function(context, npcID, _)
			RSNpcDB.GetNpcName(npcID, true);
		end)
	
		if (finished) then
			npcNameScannerRoutine:Reset()
			self:Cancel()			
			
			-- Continue refreshing the rest of the database
			RefreshDatabaseData(currentDbVersion)
		end
	end);
end

function RareScanner:InitializeDataBase()
	--============================================
	-- Initialize default profiles
	--============================================

	-- Initialize loot filter list
	for categoryID, subcategories in pairs(private.ITEM_CLASSES) do
		table.foreach(subcategories, function(index, subcategoryID)
			if (not RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID]) then
				RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID] = {}
			end

			RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID][subcategoryID] = true
		end)
	end

	--============================================
	-- Initialize database
	--============================================

	self.db = LibStub("AceDB-3.0"):New("RareScannerDB", RSConstants.PROFILE_DEFAULTS, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "RefreshOptions")
	self.db.RegisterCallback(self, "OnProfileCopied", "RefreshOptions")
	self.db.RegisterCallback(self, "OnProfileReset", "RefreshOptions")
	private.dbm = self.db
	private.db = self.db.profile
	private.dbchar = self.db.char
	private.dbglobal = self.db.global

	-- Initialize global database
	RSGeneralDB.InitItemInfoDB()
	RSGeneralDB.InitAlreadyFoundEntitiesDB()
	RSGeneralDB.InitRecentlySeenDB()
	RSGeneralDB.InitDbVersionDB()
	RSNpcDB.InitNpcNamesDB()
	RSNpcDB.InitNpcLootFoundDB()
	RSNpcDB.InitCustomNpcDB()
	RSContainerDB.InitContainerNamesDB()
	RSContainerDB.InitContainerLootFoundDB()

	-- Check if rare NPC names database is updated
	local currentDbVersion = RSGeneralDB.GetDbVersion()
	local version = nil
	local databaseUpdated = false
	if (currentDbVersion) then
		version = currentDbVersion.version
		databaseUpdated = currentDbVersion.version == RSConstants.CURRENT_DB_VERSION
	end
	if (not databaseUpdated) then
		UpdateRareNamesDB(version); -- Internally calls to RefreshDatabaseData once its done
	else
		RefreshDatabaseData(version)
	end
end

function RareScanner:GetOptionsTable()
	return LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db, RSConstants.PROFILE_DEFAULTS)
end