local SpellBookList = {};  -- Stores the Filtered Spell List
local SBA_SkillLines = {}; -- Stores offset and number of Spells data for the SpellTabs/SkillLines.
local Forms = {}; -- Stores Forms details if player can change forms
local SpellsChanged = true; -- Flags when SpellBookFrame_Update needs the list rebuilt.
local numForms = 0; -- Store number of forms outside of the functions to track needs for updates.

local SBA_SelectedID = 0;  -- For Color Picker
local oldColor = { r = 0, g = 0, b = 0};  -- For Color Picker
local colorList = {}; -- List of Colors
local colorDefaults = {};  -- List of Color Defaults
colorDefaults[11] = { r = 1.0 , g = 0.82, b = 0};
colorDefaults[12] = { r = 0.35, g = 0.2 , b = 0}; 
colorDefaults[13] = { r = 1   , g = 1   , b = 1};
colorDefaults[21] = { r = 1.0 , g = 0.82, b = 0};
colorDefaults[22] = { r = 0.35, g = 0.2 , b = 0}; 
colorDefaults[23] = { r = 1   , g = 1   , b = 1};
colorDefaults[31] = { r = 0.65 , g = 0.65 , b = 0.65};
colorDefaults[32] = { r = 0.35, g = 0.2 , b = 0}; 
colorDefaults[33] = { r = 0.6 , g = 0.6 , b = 0.6};
colorList[41] = { r = 1.0 , g = 0.82, b = 0};
colorList[42] = { r = 0.35, g = 0.2 , b = 0}; 
colorList[43] = { r = 1   , g = 1   , b = 1};
local PET_SPELL = 16777216; -- 2^24 Spell Flag for Pet Spell
local AUTOCAST_STATE = 1073741824; -- 2^30 Spell Flag for Autocast's State (0 = off, 1 = on)
local IS_CASTABLE = 2147483648; -- 2^31 Assuming Spell Flag for Is Castable (0 = passive, 1 = castable)
local FLAG_MASK = 16777215; -- Value for retrieving the SpellID from Pet Spells

local L = LibStub("AceLocale-3.0"):GetLocale("SpellbookAbridged")

-- Slash command to reset Rank Filter Button Location
SLASH_SBA1 = "/sba";
SlashCmdList["SBA"] = function (msg, editbox)
	AutoUpRankButton:ClearAllPoints();
	AutoUpRankButton:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 74, -55); 
end

-- Addon's Initial Loading Function
function SpellBookAbridged_OnLoad(self)
	-- Ensure the SpellList is properly generated when starting
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_LOGOUT");
	self:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
	
	-- These are the events SpellBookFrame watches.
	self:RegisterEvent("SPELLS_CHANGED");
	self:RegisterEvent("LEARNED_SPELL_IN_TAB");
	
	getglobal(AutoUpRankButton:GetName() .. "Text"):SetText(L["Auto UpRank"]);


	-- Ensure there is SpellTabInfo to grab as early as possible
	SpellBookAbridged_CreateSpellList();
	
	-- Create SecureActionButtons for each SpellButton to capture clicks
	
--	SBA_SpellButton1 = CreateFrame("CheckButton", "SBA_SpellButton1", SpellButton1, "SBA_SpellButtonTemplate");
--	SBA_SpellButton2 = CreateFrame("CheckButton", "SBA_SpellButton2", SpellButton2, "SBA_SpellButtonTemplate");
--	SBA_SpellButton3 = CreateFrame("CheckButton", "SBA_SpellButton3", SpellButton3, "SBA_SpellButtonTemplate");
--	SBA_SpellButton4 = CreateFrame("CheckButton", "SBA_SpellButton4", SpellButton4, "SBA_SpellButtonTemplate");
--	SBA_SpellButton5 = CreateFrame("CheckButton", "SBA_SpellButton5", SpellButton5, "SBA_SpellButtonTemplate");
--	SBA_SpellButton6 = CreateFrame("CheckButton", "SBA_SpellButton6", SpellButton6, "SBA_SpellButtonTemplate");
--	SBA_SpellButton7 = CreateFrame("CheckButton", "SBA_SpellButton7", SpellButton7, "SBA_SpellButtonTemplate");
--	SBA_SpellButton8 = CreateFrame("CheckButton", "SBA_SpellButton8", SpellButton8, "SBA_SpellButtonTemplate");
--	SBA_SpellButton9 = CreateFrame("CheckButton", "SBA_SpellButton9", SpellButton9, "SBA_SpellButtonTemplate");
--	SBA_SpellButton10 = CreateFrame("CheckButton", "SBA_SpellButton10", SpellButton10, "SBA_SpellButtonTemplate");
--	SBA_SpellButton11 = CreateFrame("CheckButton", "SBA_SpellButton11", SpellButton11, "SBA_SpellButtonTemplate");
--	SBA_SpellButton12 = CreateFrame("CheckButton", "SBA_SpellButton12", SpellButton12, "SBA_SpellButtonTemplate");
	
	-- Create Scanning Tooltip to pull stance data
	
	CreateFrame("GameTooltip", "SBA_Tooltip", SpellBookFrameAbridged, "GameTooltipTemplate");
	SBA_Tooltip:SetOwner( SpellBookFrameAbridged, "ANCHOR_NONE" );
	SBA_Tooltip:ClearLines();
	
	-- Fixes Blizzard's Oversight.
	SpellBookFrame:HookScript("OnHide", MultiActionBar_UpdateGridVisibility);

	
	-- Config Frame setup
	
--	SpellBookFrameTabButton3.bookType = SBA_CONFIG;
--	SpellBookFrameTabButton3.Text:SetText(OPTIONS);
--	SpellBookFrameTabButton3:Enable();
--	SpellBookFrameTabButton3:SetScript("OnClick", SBA_ConfigTab_OnClick);
--	SpellBookFrameTabButton3:SetScript("OnEnter", nil);
--	SpellBookFrameTabButton3:SetScript("OnLeave", nil);
--	hooksecurefunc("ToggleSpellBook", SBA_ConfigFrame_Hide);
	
--	SpellBookFrameTabButton1:HookScript("OnClick", SBA_ConfigFrame_Hide);
--	SpellBookFrameTabButton2:HookScript("OnClick", SBA_ConfigFrame_Hide);
end

function SBA_LoadOptions()	-- Load Saved Options
	if (SpellBookAbridgedOptions == nil) then
		--Just to ensure the basic options exist
		SpellBookAbridgedOptions = {};  
	end
	
	if (SpellBookAbridgedOptions["AutoUpRank"]) then  -- Auto Up-Rank Option
		AutoUpRankButton:SetChecked(SpellBookAbridgedOptions["AutoUpRank"]);
	else
		AutoUpRankButton:ClearAllPoints();
		AutoUpRankButton:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 74, -55); 		
		SpellBookAbridgedOptions["AutoUpRank"] = true;
	end
	if (SpellBookAbridgedOptions["NormalColor"]) then -- Use Custom Colors for Normal
		colorList[1] = SpellBookAbridgedOptions["NormalColor"];
		NormalCheckButton:SetChecked(colorList[1]);
	else
		colorList[1] = false;
	end
	if (SpellBookAbridgedOptions["NormalTextColor"]) then -- Custom Spell Text Color for Normal
		colorList[11] = SpellBookAbridgedOptions["NormalTextColor"];
	else
		SBA_ResetDefaultColor(11);
	end
	if (SpellBookAbridgedOptions["NormalSubtextColor"]) then -- Custom Spell Subtext Color for Normal
		colorList[12] = SpellBookAbridgedOptions["NormalSubtextColor"];
	else
		SBA_ResetDefaultColor(12);
	end
	if (SpellBookAbridgedOptions["NormalIconColor"]) then -- Custom Spell Icon Color for Normal
		colorList[13] = SpellBookAbridgedOptions["NormalIconColor"];
	else
		SBA_ResetDefaultColor(13);
	end
	if (SpellBookAbridgedOptions["InFormColor"]) then -- Use Custom Colors for Spells that Require Stance/Form and Player is In Form
		colorList[2] = SpellBookAbridgedOptions["InFormColor"];
		InFormCheckButton:SetChecked(colorList[2]);
	else
		colorList[2] = false;
	end
	if (SpellBookAbridgedOptions["InFormTextColor"]) then -- Custom Spell Text Color for In Form
		colorList[21] = SpellBookAbridgedOptions["InFormTextColor"];
	else
		SBA_ResetDefaultColor(21);
	end
	if (SpellBookAbridgedOptions["InFormSubtextColor"]) then -- Custom Spell Subtext Color for In Form
		colorList[22] = SpellBookAbridgedOptions["InFormSubtextColor"];
	else
		SBA_ResetDefaultColor(22);
	end
	if (SpellBookAbridgedOptions["InFormIconColor"]) then -- Custom Spell Icon Color for In Form
		colorList[23] = SpellBookAbridgedOptions["InFormIconColor"];
	else
		SBA_ResetDefaultColor(23);
	end
	if (SpellBookAbridgedOptions["OutFormColor"]) then -- Use Custom Colors for Spells that Require Stance/Form and Player is Out of Form
		colorList[3] = SpellBookAbridgedOptions["OutFormColor"];
		OutFormCheckButton:SetChecked(colorList[3]);
	else
		colorList[3] = false;
	end
	if (SpellBookAbridgedOptions["OutFormTextColor"]) then -- Custom Spell Text Color for Out of Form
		colorList[31] = SpellBookAbridgedOptions["OutFormTextColor"];
	else
		SBA_ResetDefaultColor(31);
	end
	if (SpellBookAbridgedOptions["OutFormSubtextColor"]) then -- Custom Spell Subtext Color for Out of Form
		colorList[32] = SpellBookAbridgedOptions["OutFormSubtextColor"];
	else
		SBA_ResetDefaultColor(32);
	end
	if (SpellBookAbridgedOptions["OutFormIconColor"]) then -- Custom Spell Icon Color for Out of Form
		colorList[33] = SpellBookAbridgedOptions["OutFormIconColor"];
	else
		SBA_ResetDefaultColor(33);
	end	
end

function SBA_SaveOptions()  -- Save Options
	SpellBookAbridgedOptions["AutoUpRank"] = AutoUpRankButton:GetChecked();
	SpellBookAbridgedOptions["NormalColor"] = colorList[1];
	SpellBookAbridgedOptions["NormalTextColor"] = colorList[11];
	SpellBookAbridgedOptions["NormalSubtextColor"] = colorList[12];
	SpellBookAbridgedOptions["NormalIconColor"] = colorList[13];
	SpellBookAbridgedOptions["InFormColor"] = colorList[2];
	SpellBookAbridgedOptions["InFormTextColor"] = colorList[21];
	SpellBookAbridgedOptions["InFormSubtextColor"] = colorList[22];
	SpellBookAbridgedOptions["InFormIconColor"] = colorList[23];
	SpellBookAbridgedOptions["OutFormColor"] = colorList[3];
	SpellBookAbridgedOptions["OutFormTextColor"] = colorList[31];
	SpellBookAbridgedOptions["OutFormSubtextColor"] = colorList[32];
	SpellBookAbridgedOptions["OutFormIconColor"] = colorList[33];
end

-- Addon's Primary Event Handler
function SpellBookAbridged_OnEvent(self, event, ...)
	-- When Spells change or such, set flag so the next time SpellBookFrame_Update function is called.
	-- Player_Login event is last event in loading, so this is a safe time to process some addon compatibility fixes
	if (event == "PLAYER_LOGIN") then
		-- Clique initializes on demand, so the Spellbook Buttons are not available after addons load.
		-- Therefore, I must force Clique to initialize its CliqueSpellButtons so I can process a simple change.
--		if Clique then
--			CliqueConfig:OnShow();
--			CliqueConfig:OnHide();
--		end
		-- Set Frame Level of any child that inherited Button at some point of SpellBookFrame's SpellButtonXX 1 higher than SpellBookAbridged's Action button
		

--		for i = 1, 12 do
--			local parent = _G["SpellButton" .. i];
--			local SBAchild = parent.SBAchild;
--			local children = { parent:GetChildren() };
--			local test = SBAchild:GetName();
--			for _, child in ipairs(children) do
--				if (child:IsObjectType("Button")) then
--					if (child:GetName() ~= test) then
--						child:SetFrameLevel(SBAchild:GetFrameLevel() +1);
--					end
--				end
--			end
			
			-- insert variables to store color ID for post hook update
--			parent.nameColor = 41;
--			parent.subtextColor = 42;
--			parent.iconColor = 43;
--		end
		
		-- Compensates for skinning addons with hook functions that change colors relevant to this addon
--		hooksecurefunc("SpellButton_UpdateButton", SBA_SpellButton_ColorUpdate);
		
		-- Load Options data
		SBA_LoadOptions();
		SpellsChanged = true; 
	
	elseif (event == "PLAYER_LOGOUT") then
		-- Store current states
		SBA_SaveOptions();
	
	elseif (event == "LEARNED_SPELL_IN_TAB") then
		-- Auto UpRank Function
		if (AutoUpRankButton:GetChecked()) then
			local spellID, skillTab = ...;
			SpellBookAbridged_AutoUpRank(spellID);
		end
		SpellsChanged = true;
		
	elseif (event == "SPELLS_CHANGED") then
		SBA_SetFormsData();
		SpellsChanged = true;
	end
end
-- Functions for SecureActionButton on the SpellButtons
-- I can't modify the SpellButtons to be SecureActionButtons, therefore a SecureActionButton
-- is added to each SpellButton to capture the click, but unfortunately also blocks all
-- mouse activity
--
-- Therefore, all click activity has to be handled by the SecureActionButton frame

-- Actions from SpellButton OnClick:
-- - CastSpell: Handled by SecureActionButtonTemplate
-- - ToggleAutoCast for Pet Spells:	Handled by SecureActionButtonTemplate
-- - CHATLINK Modified Click: PostClick to Parent Function
-- - PICKUPACTION Modified Click: PostClick to Parent Function
-- - SELFCAST Modified Click: Handled by SecureActionButtonTemplate

function SBA_SpellButton_OnLoad(self)
	--Configure the secure action button
	local parent = self:GetParent();
	self:SetAttribute("*type1", "spell");  -- Default to cast spell
	self:SetAttribute("*type2", "spell");
	self:SetAttribute("checkselfcast", true); -- Check for SELFCAST modifier
	self:SetAllPoints();
	self.parent = parent;
	parent.SBAchild = self;
	self:RegisterForDrag("LeftButton");
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

function SBA_SpellButton_PreClick(self)
	self:SetChecked(false);
	self.parent:SetChecked(false);
end

function SBA_SpellButton_PostClick(self, ...)
	-- If Click Action is for CHATLINK or PICKUPACTION, use parent's OnModifiedClick
	if ( IsModifiedClick("CHATLINK") or IsModifiedClick("PICKUPACTION") ) then
		SpellButton_OnModifiedClick(self.parent, ...);
	end
end

function SBA_SpellButton_OnDragStart(self, button)
	-- Wrap to SpellButton's OnDragStart
	SpellButton_OnDragStart(self.parent, button);
end

function SBA_SpellButton_OnReceiveDrag(self)
	-- Wrap to SpellButton's OnReceiveDrag
	SpellButton_OnReceiveDrag(self.parent);
end

function SBA_SpellButton_OnEnter(self, motion)
		SpellButton_OnEnter(self.parent, motion);
end

-- Functions for Option Buttons
function SBA_OptionButton_OnLoad(self)
	-- Register dragging with Right Button
	self:RegisterForDrag("RightButton");
end

function SBA_OptionButton_OnDragStart(self)
	if (IsControlKeyDown() and not(InCombatLockdown())) then
		self:StartMoving();
	end
end

function SBA_OptionButton_OnDragStop(self)
	self:StopMovingOrSizing();
end

function AutoUpRankButton_OnClick()
	if AutoUpRankButton:GetChecked() then
		for i = 1, GetNumSpellTabs() do
			local _, _, offset, numSlots = GetSpellTabInfo(i)
			for j = offset+1, offset+numSlots do
				local spellType, spellID = GetSpellBookItemInfo(j, BOOKTYPE_SPELL)
				SpellBookAbridged_AutoUpRank(spellID);
			end
		end
	end
end

-- Functions for Configuration Frame

function SBA_ConfigTab_OnClick(self)
	if (not InCombatLockdown()) then
		SpellBookSpellIconsFrame:Hide();
		SpellBookPageNavigationFrame:Hide();
		SpellBookPageText:Hide();
		SpellBookSideTabsFrame:Hide();
		SBA_ConfigFrame:Show();
		SpellBookFrameTabButton1:Enable();
		if ( SpellBookFrameTabButton2:IsShown() ) then
			SpellBookFrameTabButton2:Enable();
		end
		SpellBookFrameTabButton3:Disable();
		SpellBookFrame.bookType = "SBA";

		SBA_UpdateConfigFrame();
	end
end

function SBA_UpdateConfigFrame()
	SBA_UpdateExampleButton(NormalExampleButton);
	SBA_UpdateExampleButton(InFormExampleButton);
	SBA_UpdateExampleButton(OutFormExampleButton);
end

function SBA_ConfigFrame_Hide()
	if (not InCombatLockdown()) then
		SBA_ConfigFrame:Hide();
	end
end

function SBA_ExampleButton_OnLoad(self)
	-- Example Buttons need scripts disabled from SpellButtonTemplate
	SBA_ClearButtonScripts(self);
end

function SBA_UpdateExampleButton(self)
	local name = self:GetName();
	local iconTexture = _G[name.."IconTexture"];
	local spellString = _G[name.."SpellName"];
	local subSpellString = _G[name.."SubSpellName"];
	local texture = GetSpellTexture(1, BOOKTYPE_SPELL);
	
	iconTexture:SetTexture(texture);
	spellString:SetText("Spell Name");

	self.SpellSubName:SetHeight(6);
	subSpellString:SetText("Spell Subtext");

	spellString:SetPoint("LEFT", self, "RIGHT", 5, 3);

	iconTexture:Show();
	spellString:Show();
	subSpellString:Show();
	
	local id = self:GetID() * 10;
	local textColor = colorList[(id + 1)];
	local subtextColor = colorList[(id + 2)];
	local iconColor = colorList[(id + 3)];
	
	spellString:SetTextColor(textColor.r, textColor.g, textColor.b);
	subSpellString:SetTextColor(subtextColor.r, subtextColor.g, subtextColor.b);
	iconTexture:SetVertexColor(iconColor.r, iconColor.g, iconColor.b);
end

function SBA_ColorSelectButton_OnClick(self)
	-- Opens ColorPickerFrame for the relevant button example
	ColorPickerFrame.cancelFunc = SBA_ColorSelect_cancelFunc; 
	ColorPickerFrame.func = SBA_ColorSelect_func; 
	ColorPickerFrame.opacityFunc = nil;
	
	-- self.hasOpacity sets if Color has Opacity
	ColorPickerFrame.hasOpacity = false;
	ColorPickerFrame.opacity = 1;
	
	-- Need to set anchor to appropriate button, so User can see the changes.
	local id = self:GetID(); -- Identify which button
	SBA_SelectedID = id;
	oldColor.r, oldColor.g, oldColor.b = colorList[id].r, colorList[id].g, colorList[id].b;
	ColorPickerFrame:SetColorRGB(colorList[id].r, colorList[id].g, colorList[id].b);
	
	ColorPickerFrame:Hide();
	ColorPickerFrame:Show();
end

function SBA_ColorSelect_func()
	local id = SBA_SelectedID;
	colorList[id].r, colorList[id].g, colorList[id].b = ColorPickerFrame:GetColorRGB();
	
	SBA_UpdateConfigFrame();
end

function SBA_ColorSelect_cancelFunc()
	local id = SBA_SelectedID;
	colorList[id].r, colorList[id].g, colorList[id].b = oldColor.r, oldColor.g, oldColor.b;
	
	SBA_UpdateConfigFrame();
end

function SBA_ResetDefaultColor(id)
	-- I need to copy data, not the pointer
	local rA, gA, bA = colorDefaults[id].r, colorDefaults[id].g, colorDefaults[id].b;
	colorList[id] = { r = rA, g = gA, b = bA};
end

function SBA_DefaultButton_OnClick(self)
	local id = self:GetID() * 10;
	SBA_ResetDefaultColor(id+1);
	SBA_ResetDefaultColor(id+2);
	SBA_ResetDefaultColor(id+3);
	
	SBA_UpdateConfigFrame();
end

function SBA_ClearButtonScripts(self)
	self:SetScript("OnLoad", nil);
	self:SetScript("OnEvent", nil);
	self:SetScript("PreClick", nil);
	self:SetScript("OnClick", nil);
	self:SetScript("OnShow", nil);
	self:SetScript("OnHide", nil);
	self:SetScript("OnDragStart", nil);
	self:SetScript("OnReceiveDrag", nil);
	self:SetScript("OnEnter", nil);
	self:SetScript("OnLeave", nil);
end

function SBA_ExampleCheckButton_OnClick(self)
	local id = self:GetID();
	colorList[id] = self:GetChecked();
end

-- Functions to read Spell List

function SBA_SetFormsData()
	numForms = GetNumShapeshiftForms(); -- numForms is stored at higher scope for chaos management
	local spellName, spellID, _;
	
	local formList = {};
	
	if (numForms > 0) then
		formList[1] = "";
		for i = 1, numForms do
			_, _, _, spellID = GetShapeshiftFormInfo(i);
			spellName = GetSpellInfo(spellID);
			if (spellName == nil) then return end
			formList[i] = spellName;
		end
	else
		formList = nil;
	end
	
	Forms = formList;
end

function SBA_IsUsableInForm(spellID)
	-- Current Idea: True = In form, False = Wrong Form, Nil = No data
	if (Forms == nil) then
		-- if no multiple forms detected, return nil
		return nil;
	end

	if (numForms < GetNumShapeshiftForms()) then
		-- If number of forms changed since last forms list update, update the list of forms.
		SBA_SetFormsData();
	end
	
	SBA_Tooltip:SetSpellBookItem(spellID, BOOKTYPE_SPELL);  --Set Tooltip
	
	local lineText, colorR, colorG, colorB;

	-- Test Lines 3, 4, and 5
	-- Step 1, find a line with forms (no line found, return nil)
	-- Step 2, see if line is red (red = false, not red = true)
	
	for i = 3, 5 do
		lineText = _G["SBA_TooltipTextLeft"..i]:GetText();
		if lineText then
			for j = 1, numForms do -- numForms is updated with SBA_SetFormsData for chaos management
				if (strmatch(lineText, Forms[j])) then
					colorR, colorG, colorB = _G["SBA_TooltipTextLeft"..i]:GetTextColor();
					if ((colorR > colorG) and (colorR > colorB)) then
						return false;
					else
						return true;
					end
				end
			end
		end
	end
	return nil;
end

function SpellBookAbridged_CreateSpellList()
-- Generates Spell List after the Spells change
	local spellList = {};
	--- Get Skill Line info and total number of spells
	
	local SBA_numSpells = 0;
	local SBA_offset = 0;
	local savedName = nil;
	local savedRank = nil;
	local countRank = 0;
	
	spellList[0] = {nil,0};
	
	--- Process SpellBook and SkillLine info
	for i = 1, MAX_SKILLLINE_TABS do
		--- For Each SkillLine, get the official data
		local _, _, offset, numSpells = GetSpellTabInfo(i);
		
		--- Set offset for the Abridged version's SkillLine
		SBA_offset = SBA_numSpells;
		
		--- Go to first spell of the SkillLine and set last spell of SkillLine
		local total = offset + numSpells;
		offset = offset + 1;
		
		--- For each spell in the SkillLine
		for slot = offset, total do
			--- Grab name information
			local name, rank = GetSpellBookItemName(slot, "spell");
			SBA_numSpells = SBA_numSpells + 1;
			countRank = 1;
			savedName = name;
			--- store real slot and number of ranks counted in current spellList slot
			spellList[SBA_numSpells] = {slot, countRank};
		end
		
		--- Store the Abridged SkillLine info
		local newTotal = SBA_numSpells - SBA_offset;
		
		SBA_SkillLines[i] = {SBA_offset, newTotal};
	end

	wipe(SpellBookList);  --clear old list, because some "spells" can be unlearned
	SpellBookList = spellList;

end

function SpellBookAbridged_GetSpellTabInfo(tab)
--- Replaces GetSpellTabInfo in SpellBookFrame so it pulls the filtered SpellList's data
--- The Filtered SpellList has different number of spells and offsets, so replace this part of the SkillLine data
		
	--- Grab SpellTab's info
	local name, texture, _,_, isGuild, offSpecID, shouldHide, specID = GetSpellTabInfo(tab);
	local tabInfo = SBA_SkillLines[tab];

	return name, texture, tabInfo[1], tabInfo[2], isGuild, offSpecID, shouldHide, specID;
end

function SpellBookAbridged_GetSpellBookItemInfo(slot, bookType)
	--- Originally, the SpellBook will grab an offset calculated slot that is the actual spell in WoW API's SpellList
	--- As such, that slot was the spell's slot number.  So, SpellBookFrame doesn't generate it.
	
	--- Because the SpellBookFrame slot refers to a slot in the Filtered SpellList,
	--- we need to return the correct spell slot in addition to the rest of the info.
	local realSlot = SpellBookList[slot];
		
	return realSlot[1], GetSpellBookItemInfo(realSlot[1],bookType);
end

-- Functions for Auto Up Rank

function SpellBookAbridged_AutoUpRank(spellID)
	local spellName = GetSpellInfo(spellID);

	for j = 1, 120 do -- 120 Action Slots
		local actionType, actionID = GetActionInfo(j);
		if (actionType == "spell" ) then
			actionSpellName = GetSpellInfo(actionID)
			if (actionSpellName == spellName) then
				if actionID < spellID then
					PickupSpell(spellID);  -- set new spell to cursor
					PlaceAction(j); -- place spell in cursor (no other function exists to alter action slots)
					ClearCursor(); -- clear old spell from cursor
				end				
			end
		end		
	end
end


OrigSpellBook_GetCurrentPage = function()
	local currentPage, maxPages;
	local numPetSpells = HasPetSpells() or 0;
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		currentPage = SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET];
		maxPages = ceil(numPetSpells/SPELLS_PER_PAGE);
	elseif ( SpellBookFrame.bookType == BOOKTYPE_SPELL) then
		currentPage = SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine];
		--- Replaced GetSpellTabInfo
		local _, _, _, numSlots = SpellBookAbridged_GetSpellTabInfo(SpellBookFrame.selectedSkillLine);
		maxPages = ceil(numSlots/SPELLS_PER_PAGE);
	end
	return currentPage, maxPages;
end

OrigSpellBook_GetSpellBookSlot = function(spellButton)
	local id = spellButton:GetID()
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		local slot = id + (SPELLS_PER_PAGE * (SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] - 1));
		if ( SpellBookFrame.numPetSpells and slot <= SpellBookFrame.numPetSpells) then
		--- Not Modifying Pet Spellbook yet.
		local slotType, slotID = GetSpellBookItemInfo(slot, SpellBookFrame.bookType);
		return slot, slotType, slotID;
		end
	else
		local relativeSlot = id + ( SPELLS_PER_PAGE * (SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] - 1));
		if ( SpellBookFrame.selectedSkillLineNumSlots and relativeSlot <= SpellBookFrame.selectedSkillLineNumSlots) then
			--- Replaced GetSpellBookItemInfo and added line to pull correct slot.
			local tempSlot = SpellBookFrame.selectedSkillLineOffset + relativeSlot;
			local slot, slotType, slotID = SpellBookAbridged_GetSpellBookItemInfo(tempSlot, SpellBookFrame.bookType);
			return slot, slotType, slotID;
		end
	end
	return nil, nil, nil;
end

OrigSpellBookFrame_UpdateSkillLineTabs = function()
	local numSkillLineTabs = GetNumSpellTabs();
	for i=1, MAX_SKILLLINE_TABS do
		local skillLineTab = _G["SpellBookSkillLineTab"..i];
		local prevTab = _G["SpellBookSkillLineTab"..i-1];
		if ( i <= numSkillLineTabs and SpellBookFrame.bookType == BOOKTYPE_SPELL ) then
			--- Replaced GetSpellTabInfo
			local name, texture, _, _, isGuild, offSpecID, shouldHide, specID = SpellBookAbridged_GetSpellTabInfo(i);
			
			if ( shouldHide ) then
				_G["SpellBookSkillLineTab"..i.."Flash"]:Hide();
				skillLineTab:Hide();
			else
				skillLineTab:SetNormalTexture(texture);
				skillLineTab.tooltip = name;
				skillLineTab:Show();

				-- Set the selected tab
				if ( SpellBookFrame.selectedSkillLine == i ) then
					skillLineTab:SetChecked(true);
				else
					skillLineTab:SetChecked(false);
				end
			end
		else
			_G["SpellBookSkillLineTab"..i.."Flash"]:Hide();
			skillLineTab:Hide();
		end
	end
end

OrigSpellBook_UpdatePlayerTab = function()
	-- Setup skillline tabs
	--- Replaced GetSpellTabInfo
	local _, _, offset, numSlots = SpellBookAbridged_GetSpellTabInfo(SpellBookFrame.selectedSkillLine);
	SpellBookFrame.selectedSkillLineOffset = offset;
	SpellBookFrame.selectedSkillLineNumSlots = numSlots;
	
	SpellBookFrame_UpdatePages();

	SpellBookFrame_UpdateSkillLineTabs();

	SpellBookFrame_UpdateSpells();
end

OrigSpellBookFrame_OpenToPageForSlot = function(realSlot, reason)
	local alreadyOpen = SpellBookFrame:IsShown();
	SpellBookFrame.bookType = BOOKTYPE_SPELL;
	ShowUIPanel(SpellBookFrame);
	if (SpellBookFrame.selectedSkillLine ~= 2) then
		SpellBookFrame.selectedSkillLine = 2;
		SpellBookFrame_Update();
	end

	if (alreadyOpen and reason == OPEN_REASON_PENDING_GLYPH) then
		local page = SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine];
		for i = 1, 12 do
			--- Replaced GetSpellBookItemInfo and added line to select correct spell
			local tempSlot = (i + ( SPELLS_PER_PAGE * (page - 1))) + SpellBookFrame.selectedSkillLineOffset;
			local slot, slotType, spellID = SpellBookAbridged_GetSpellBookItemInfo(tempSlot, SpellBookFrame.bookType);
			if (slotType == "SPELL") then
				if (IsSpellValidForPendingGlyph(spellID)) then
					SpellBookFrame_Update();
					return;
				end
			end
		end
	end

	--- Replaced GetSpellBookItemInfo
	local slot, slotType, spellID = SpellBookAbridged_GetSpellBookItemInfo(realSlot, SpellBookFrame.bookType);
	local relativeSlot = slot - SpellBookFrame.selectedSkillLineOffset;
	local page = math.floor((relativeSlot - 1)/ SPELLS_PER_PAGE) + 1;
	SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] = page;
	SpellBookFrame_Update();
end
