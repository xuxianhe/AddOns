-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local LibStub = _G.LibStub
local RareScanner = LibStub("AceAddon-3.0"):GetAddon("RareScanner")
local ADDON_NAME, private = ...

-- RareScanner database libraries
local RSNpcDB = private.ImportLib("RareScannerNpcDB")
local RSContainerDB = private.ImportLib("RareScannerContainerDB")
local RSEventDB = private.ImportLib("RareScannerEventDB")
local RSGeneralDB = private.ImportLib("RareScannerGeneralDB")
local RSConfigDB = private.ImportLib("RareScannerConfigDB")
local RSGuideDB = private.ImportLib("RareScannerGuideDB")

-- RareScanner service libraries
local RSMinimap = private.ImportLib("RareScannerMinimap")
local RSTooltip = private.ImportLib("RareScannerTooltip")
local RSProvider = private.ImportLib("RareScannerProvider")

-- RareScanner services
local RSGuidePOI = private.ImportLib("RareScannerGuidePOI")
local RSTomtom = private.ImportLib("RareScannerTomtom")
local RSEntityStateHandler = private.ImportLib("RareScannerEntityStateHandler")

-- RareScanner general libraries
local RSUtils = private.ImportLib("RareScannerUtils")
local RSConstants = private.ImportLib("RareScannerConstants")

RSEntityPinMixin = CreateFromMixins(MapCanvasPinMixin);

RSEntityPinMixin.SetPassThroughButtons = function() end

function RSEntityPinMixin:OnLoad()
	self:SetScalingLimits(1, 0.75, 1.0);
end

function RSEntityPinMixin:OnAcquired(POI, dataProvider)
	self:UseFrameLevelType("PIN_FRAME_LEVEL_AREA_POI", self:GetMap():GetNumActivePinsByTemplate("RSEntityPinTemplate"));
	self.POI = POI
	self.dataProvider = dataProvider
	self.Texture:SetTexture(POI.Texture)
	self.Texture:SetScale(RSConfigDB.GetIconsWorldMapScale())
	self.IconTexture:SetAtlas(POI.iconAtlas)
	self:SetPosition(RSUtils.FixCoord(POI.x), RSUtils.FixCoord(POI.y));
end

function RSEntityPinMixin:OnMouseEnter()
	RSTooltip.ShowSimpleTooltip(self)
end

function RSEntityPinMixin:OnMouseLeave()
	if (RSTooltip.HideTooltip(self.tooltip)) then
		self.tooltip = nil
	end
end

function RSEntityPinMixin:OnMouseDown(button)
	if (button == "LeftButton") then
		--Filter/unfilter
		if (IsShiftKeyDown() and IsAltKeyDown()) then
			if (self.POI.isNpc) then
				if (RSConfigDB.GetDefaultNpcFilter() == RSConstants.ENTITY_FILTER_ALERTS) then
					RSConfigDB.SetNpcFiltered(self.POI.entityID, RSConstants.ENTITY_FILTER_ALL)
				else
					RSConfigDB.SetNpcFiltered(self.POI.entityID)
				end
				self:Hide();
			elseif (self.POI.isContainer) then
				if (RSConfigDB.GetDefaultContainerFilter() == RSConstants.ENTITY_FILTER_ALERTS) then
					RSConfigDB.SetContainerFiltered(self.POI.entityID, RSConstants.ENTITY_FILTER_ALL)
				else
					RSConfigDB.SetContainerFiltered(self.POI.entityID)
				end
				self:Hide();
			elseif (self.POI.isEvent) then
				if (RSConfigDB.GetDefaultEventFilter() == RSConstants.ENTITY_FILTER_ALERTS) then
					RSConfigDB.SetEventFiltered(self.POI.entityID, RSConstants.ENTITY_FILTER_ALL)
				else
					RSConfigDB.SetEventFiltered(self.POI.entityID)
				end
				self:Hide();
			end
			RSProvider.RefreshAllDataProviders()
			RSMinimap.RefreshEntityState(self.POI.entityID)
		-- Toggle overlay
		elseif (not IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
			-- If overlay showing then hide it
			local overlayInfo = RSGeneralDB.GetOverlayActive(self.POI.entityID)
			if (overlayInfo) then
				for pin in self:GetMap():EnumeratePinsByTemplate("RSOverlayTemplate") do
					if (pin:GetEntityID() == self.POI.entityID) then
						self:GetMap():RemovePin(pin)
					end
				end
				RSGeneralDB.RemoveOverlayActive(self.POI.entityID)
				RSMinimap.RemoveOverlay(self.POI.entityID)
			else
				self:ShowOverlay()
			end
		end
	elseif (button == "RightButton") then
		-- Add waypoint
		if (IsShiftKeyDown()) then
			if (RSConfigDB.IsAddingWorldMapTomtomWaypoints()) then
				RSTomtom.AddWorldMapTomtomWaypoint(self.POI.mapID, self.POI.x, self.POI.y, self.POI.name)
			end
		-- Toggle guide
		elseif (not IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
			-- If guide showing then hide it
			local guideEntityID = RSGeneralDB.GetGuideActive()
			if (guideEntityID) then
				self:GetMap():RemoveAllPinsByTemplate("RSGuideTemplate");
				if (guideEntityID ~= self.POI.entityID) then
					self:ShowGuide(self.POI.mapID)
				else
					RSGeneralDB.RemoveGuideActive()
					RSMinimap.RemoveGuide(self.POI.entityID)
				end
			else
				self:ShowGuide(self.POI.mapID)
			end
			
			-- Hide the tooltip
			if (RSTooltip.HideTooltip(self.tooltip)) then
				self.tooltip = nil
			end
		end
	end
end

function RSEntityPinMixin:ShowOverlay()
	-- Overlay
	local overlay = nil
	if (self.POI.isNpc) then
		overlay = RSNpcDB.GetInternalNpcOverlay(self.POI.entityID, self.POI.mapID)
	elseif (self.POI.isContainer) then
		overlay = RSContainerDB.GetInternalContainerOverlay(self.POI.entityID, self.POI.mapID)
	elseif (self.POI.isEvent) then
		overlay = RSEventDB.GetInternalEventOverlay(self.POI.entityID, self.POI.mapID)
	end

	if (overlay) then
		-- Checks if the overlay is already shown, in which case is already active in the minimap
		local hasOverlayActive = RSGeneralDB.HasOverlayActive(self.POI.entityID);
		
		-- In the worldmap we always have to add it
		local r, g, b, replacedEntityID = RSGeneralDB.AddOverlayActive(self.POI.entityID)

		-- Cleans the replaced overlay
		if (replacedEntityID) then
			for pin in self:GetMap():EnumeratePinsByTemplate("RSOverlayTemplate") do
				if (pin:GetEntityID() == replacedEntityID) then
					self:GetMap():RemovePin(pin)
				end
			end
			
			-- Cleans the replaced overly in the minimap
			RSMinimap.RemoveOverlay(replacedEntityID)
		-- Checks if they are already shown
		else
			for pin in self:GetMap():EnumeratePinsByTemplate("RSOverlayTemplate") do
				if (pin:GetEntityID() == self.POI.entityID) then
					return
				end
			end
		end
		
		-- Adds the new one
		for _, coordinates in ipairs (overlay) do
			local x, y = strsplit("-", coordinates)
			self:GetMap():AcquirePin("RSOverlayTemplate", RSUtils.FixCoord(x), RSUtils.FixCoord(y), r, g, b, self);
		end
		
		-- Adds the new one to the minimap
		if (not hasOverlayActive) then
			RSMinimap.AddOverlay(self.POI.entityID)
		end
	end
end

function RSEntityPinMixin:ShowGuide(mapID)
	-- Guide
	local guide = nil
	if (self.POI.isNpc) then
		guide = RSGuideDB.GetNpcGuide(self.POI.entityID, mapID)
	elseif (self.POI.isContainer) then
		guide = RSGuideDB.GetContainerGuide(self.POI.entityID, mapID)
	else
		guide = RSGuideDB.GetEventGuide(self.POI.entityID, mapID)
	end

	if (guide) then
		for pinType, info in pairs (guide) do
			-- Skip if quest completed
			if (not info.questID or not C_QuestLog.IsQuestFlaggedCompleted(info.questID)) then
				local POI = RSGuidePOI.GetGuidePOI(self.POI.entityID, pinType, info)
				local pin = self:GetMap():AcquirePin("RSGuideTemplate", POI, self);
				pin.ShowPingAnim:Play()
			end
		end
		RSGeneralDB.SetGuideActive(self.POI.entityID)
		RSMinimap.AddGuide(self.POI.entityID)
	end
end

function RSEntityPinMixin:OnReleased()
	RSTooltip.ReleaseTooltip(self.tooltip)
	self.tooltip = nil
end