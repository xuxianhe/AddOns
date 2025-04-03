-----------------------------------
--Highlight Missing Hotbar Spells--
-----------------------------------
--Novaspark/Venomisto-Arugal OCE (classic)
--https://www.curseforge.com/members/venomisto/projects
--I just modified my spell rank checker addon a bit for this.
--For Cata and SoD/Era.

---Works for Default UI, Bartender, ElvUI, and Dominos.
---Check all hotbar slots for missing spells.
---Check all macros on hotbars also for spellID and texture matches.
---Also check the body of each macro for spells being cast for increased reliability when spellID check fails, or multiple spells on the same macro etc.
---This uses some of the code from the retail API with my macro checking on top and some other extra bits.
---Highlight texture in the spellbook is exactly the same as retail also.

local _, HMHS = ...;
local isClassic, isTBC, isWrath, isCata, useRanks;
if (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC) then
	isClassic = true;
elseif (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC) then
	isTBC = true;
elseif (WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC) then
	isWrath = true;
elseif (WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC) then
	isCata = true;
end
if (isClassic or isTBC or isWrath) then
	useRanks = true;
end

local spellData, highlighted, maxRankSpells = {}, {}, {};
local defaultBars = {"Action", "MultiBarBottomLeft", "MultiBarBottomRight", "MultiBarRight", "MultiBarLeft"};

local function buildMaxRankSpells()
	if (not useRanks) then
		return;
	end
	maxRankSpells = {};
	for tab = 1, GetNumSpellTabs() do
		local name, texture, offset, numSlots, isGuild, offspecID = GetSpellTabInfo(tab);
		for i = offset + 1, offset + numSlots do
			local spellName, spellSubText, spellID = GetSpellBookItemName(i, BOOKTYPE_SPELL);
			local rank;
			if (spellSubText) then
				rank = strmatch(spellSubText, "%d+");
			end
			if (rank) then
				rank = tonumber(rank);
				if (rank > 0 and not maxRankSpells[spellName] or rank > maxRankSpells[spellName].rank) then
					maxRankSpells[spellName] = {
						rank = rank,
						spellID = spellID
					};
				end
			else
				--If no rank then spell has no ranks, just give it a rank of 1.
				maxRankSpells[spellName] = {
					rank = 1,
					spellID = spellID
				};
			end
		end
	end
end

local function isMaxRank(spellName, spellID)
	if (not useRanks) then
		return true;
	end
	local data = maxRankSpells[spellName];
	if (data and data.spellID == spellID) then
		return true;
	end
end

--Add our highlight texture to ach spellbook button, this is exactly the same as the retail highlight.
for i = 1, 12 do
	local self = _G["SpellButton" .. i];
	if (not self.HMHSHighlightTexture) then
		local texture = self:CreateTexture(nil, "OVERLAY");
		texture:SetAtlas("bags-newitem", false, "ADD");
		texture:SetPoint("CENTER");
		texture:SetSize(48, 48);
		texture:Hide();
		self.HMHSHighlightTexture = texture;
	end
end

--Check a macro for containing a spell.
local function doesMacroHaveSpell(macroID, spellName, spellID, iconID, iconTexture)
	local id = GetMacroSpell(macroID);
	local name, texture, body = GetMacroInfo(macroID);
	if (id and spellID == id) then
		--Check spellID.
		return true;
	end
	if (texture and iconID == texture) then
		--Check texture match.
		return true;
	end
	if (iconTexture) then
		--Check hotbar addon custom icons.
		local texture = iconTexture:GetTexture();
		if (iconID == texture) then
			return true;
		end
	end
	if (body) then
		--Check macro body for /cast spellName/spellID.
		local body = strlower(body);
		local spellName = strlower(spellName);
		for line in gmatch(body, "([^\n]+)") do
			--If /cast and spell name are on the same line then it's very likely it's in the macro.
			--And if the line isn't commented out.
			local found;
			if (spellName and (strmatch(line, SLASH_CAST1 .. " .*" .. spellName) or strmatch(line, SLASH_CAST2 .. " .*" .. spellName))) then
				return true;
			end
			if (spellID and (not strmatch(line, "^%-%-")) and (strmatch(line, SLASH_CAST1 .. " .*" .. spellID) or strmatch(line, SLASH_CAST2 .. " .*" .. spellID))) then
				return true;
			end
		end
	end
end

--Scan all macros on our hotbars.
local function scanMacrosForSpell(spellName, spellID, icon)
	if (Bartender4) then
		for i = 1, 120 do
			local button = _G["BT4Button" .. i];
			if (button) then
				local slot = _G["BT4Button" .. i].id;
				if (slot and HasAction(slot)) then
					local actionType, macroID = GetActionInfo(slot);
					local iconTexture = _G["BT4Button" .. i .. "Icon"];
					if (actionType == "macro") then
						local found = doesMacroHaveSpell(macroID, spellName, spellID, icon, iconTexture);
						if (found) then
							return true;
						end
					end
				end
			end
		end
	elseif (ElvUI) then
		for bar = 1, 12 do
			for slotNum = 1, 12 do
				local button = _G["ElvUI_Bar" .. bar .. "Button" .. slotNum];
				if (button) then
					local slot = _G["ElvUI_Bar" .. bar .. "Button" .. slotNum]._state_action;
	                if (slot and HasAction(slot)) then
						local actionType, macroID = GetActionInfo(slot);
						if (actionType == "macro") then
							local found = doesMacroHaveSpell(macroID, spellName, spellID, icon);
							if (found) then
								return true;
							end
						end
					end
				end
			end
		end
	elseif (Dominos) then
		for i = 1, 168 do --14 Bars.
			local button = _G["DominosActionButton" .. i];
			if (button) then
				local slot = _G["DominosActionButton" .. i].action;
				if (slot and HasAction(slot)) then
					local actionType, macroID = GetActionInfo(slot);
					local iconTexture = _G["BT4Button" .. i .. "Icon"];
					if (actionType == "macro") then
						local found = doesMacroHaveSpell(macroID, spellName, spellID, icon, iconTexture);
						if (found) then
							return true;
						end
					end
				end
			end
		end
	else
		for bar, barName in pairs(defaultBars) do
			for i = 1, 12 do
				local button = _G[barName .. "Button" .. i];
				if (button) then
					local slot = button.action or 0;
					if (slot and HasAction(slot)) then
						local actionType, macroID = GetActionInfo(slot);
						if (actionType == "macro") then
							local found = doesMacroHaveSpell(macroID, spellName, spellID, icon);
							if (found) then
								return true;
							end
						end
					end
				end
			end
		end
	end
end

local function hideAllHighlights()
	for i = 1, 12 do
		_G["SpellButton" .. i].HMHSHighlightTexture:Hide();
	end
end

--Main func, scan all hotbar slots.
local function scanForHighlights()
	--Buttons are shared between pages and just refreshed.
	--local tab = SpellBook_GetCurrentPage();
	--local name, texture, offset, numSlots, isGuild, offspecID = GetSpellTabInfo(tab);
	hideAllHighlights();
	if (SpellBookFrame.bookType == BOOKTYPE_SPELL) then
		local _, _, offset, numSlots, _, offSpecID, shouldHide, specID = GetSpellTabInfo(SpellBookFrame.selectedSkillLine);
		local isOffSpec = (offSpecID ~= 0) and (SpellBookFrame.bookType == BOOKTYPE_SPELL);
		for i = 1, 12 do
			local self = _G["SpellButton" .. i];
			local iconTexture = _G["SpellButton" .. i .. "IconTexture"]; --Need to lookup the global so it works for era too.
			if (self and iconTexture:IsShown()) then
				local slot, slotType, slotID = SpellBook_GetSpellBookSlot(self);
				local isPassive = IsPassiveSpell(slot, SpellBookFrame.bookType);
				local _, actionID = GetSpellBookItemInfo(slot, SpellBookFrame.bookType);
				local spellName = self.SpellName:GetText();
				local _, spellSubText, spellID = GetSpellBookItemName(slot, SpellBookFrame.bookType);
				local icon = iconTexture:GetTexture();
				if (self.HMHSHighlightTexture and isMaxRank(spellName, spellID)) then
					self.HMHSHighlightTexture:Hide();
					if (ActionbarPlusF1) then
						--Treat this as a seperate addon that often exists with other addon mods.
						--Check more than just macros, normal spells could be dragged here too.
						for bar = 1, 10 do
							for slotNum = 1, 10 do
								local button = _G["ActionbarPlusF" .. bar .. "Button" .. slotNum];
								if (button) then
									local macroID = button.widget:GetMacroIndex();
									local iconTexture = button.widget:GetIcon();
									local addonSpellID = button.widget:GetSpellID();
									if (addonSpellID == spellID) then
										return true;
									end
									local found = doesMacroHaveSpell(macroID, spellName, spellID, icon);
									if (found) then
										return true;
									end
								end
							end
						end
					end
					if ((SpellBookFrame.selectedSkillLine > 1 and not isOffSpec) or SpellBookFrame.bookType == BOOKTYPE_PET) then
						if (slotType == "SPELL") then
							local isMacro = scanMacrosForSpell(spellName, spellID, icon);
							self.HMHSHighlightTexture:SetShown(not isPassive and not C_ActionBar.IsOnBarOrSpecialBar(actionID) and not isMacro);
						elseif (slotType == "FLYOUT" and C_ActionBar.HasFlyoutActionButtons) then
							self.HMHSHighlightTexture:SetShown(not C_ActionBar.HasFlyoutActionButtons(actionID));
						elseif (slotType == "PETACTION") then
							if (isPassive) then
								self.HMHSHighlightTexture:Hide();
							else
								local onBarSomewhere = C_ActionBar.HasPetActionButtons(actionID) or C_ActionBar.HasPetActionPetBarIndices(actionID);
								self.HMHSHighlightTexture:SetShown(not onBarSomewhere);
							end
						end
					end
				end
			end
		end
	end
end

hooksecurefunc("SpellBookFrame_Update", function(...)
	buildMaxRankSpells();
	scanForHighlights();
end)

local f = CreateFrame("Frame");
f:RegisterEvent("ACTIONBAR_SLOT_CHANGED");
f:RegisterEvent("SPELLS_CHANGED");
f:SetScript("OnEvent", function(self, event, ...)
	if (event == "ACTIONBAR_SLOT_CHANGED") then
		if (SpellBookFrame:IsShown()) then
			scanForHighlights();
		end
	elseif (event == "SPELLS_CHANGED") then
		buildMaxRankSpells();
	end
end)









-----------------------------------------------------------------------------
--Below is the original version I was working without using the blizzard api.
--90% finished and may need some of it for classic era.
-----------------------------------------------------------------------------

--[[local function buildSpellData()
	spellData = {};
	for tab = 1, GetNumSpellTabs() do
		local name, texture, offset, numSlots, isGuild, offspecID = GetSpellTabInfo(tab);
		for i = offset + 1, offset + numSlots do
			local spellName, spellSubText, spellID = GetSpellBookItemName(i, BOOKTYPE_SPELL);
			if (spellName) then
				local spellType = GetSpellBookItemInfo(spellName);
				local rank, skip;
				if (spellSubText) then
					if (strmatch(spellSubText, RANK)) then
						rank = strmatch(spellSubText, "%d+");
					end
					--if (strmatch(spellSubText, SPELL_PASSIVE)) then
						--Has "Passive" in the spell desc.
					--	skip = true;
					--end
					if (isCata and tab == 1 and strmatch(spellSubText, RANK)) then
						--Guild perks.
						skip = true;
					end
				end
				if (not skip) then
					spellData[spellName] = {
						spellName = spellName,
						spellSubText = spellSubText,
						spellID = spellID,
						rank = rank;
						bookID = i,
						spellType = spellType,
					};
				end
			end
		end
	end
end

local function removeAllHighlighted()
	for i = 1, 12 do
		local frame = _G["SpellButton" .. i];
		if (frame.overlay) then
			ActionButton_HideOverlayGlow(frame);
			frame.overlay:Hide();
		end
	end
end]]

--[[local function scanForHighlights()
	removeAllHighlighted();
	--Buttons are shared between pages and just refreshed.
	--local tab = SpellBook_GetCurrentPage();
	--local name, texture, offset, numSlots, isGuild, offspecID = GetSpellTabInfo(tab);
	for i = 1, 12 do
		local frame = _G["SpellButton" .. i];
		if (frame and frame.IconTexture:IsShown()) then
			local spellName = frame.SpellName:GetText();
			local spellSubText = frame.SubSpellName and frame.SubSpellName:GetText();
			local isPassive = frame.isPassive;
			if (spellName and not isPassive) then
				local rank;
				if (spellSubText) then
					rank = strmatch(spellSubText, "%d+");
				end
				if (spellData[spellName] and not spellData[spellName].found) then
					if (spellData[spellName].spellType == "SPELL" or spellData[spellName].spellType == "PETACTION") then
						--"FUTURSPELL" seems to just be nil in cata?
						--Maybe add "PETACTION" later from pet book.
						--print(i, _G["SpellButton" .. i - offset])
						ActionButton_ShowOverlayGlow(frame);
						print("Missing:", spellName, spellData[spellName].spellType)
					end
				end
			end
		end
	end
end]]

--[[local function scanForHighlights()
	local tab = SpellBook_GetCurrentPage();
	local name, texture, offset, numSlots, isGuild, offspecID = GetSpellTabInfo(tab);
	for i = offset + 1, offset + numSlots do
		local spellName, spellSubText, spellID = GetSpellBookItemName(i, BOOKTYPE_SPELL);
		if (spellName) then
			local rank;
			if (spellSubText) then
				rank = strmatch(spellSubText, "%d+");
			end
			if (spellData[spellName] and not spellData[spellName].found) then
				if (spellData[spellName].spellType == "SPELL" or spellData[spellName].spellType == "PETACTION") then
					--"FUTURSPELL" seems to just be nil in cata?
					--Maybe add "PETACTION" later from pet book.
					print(i, _G["SpellButton" .. i - offset])
					ActionButton_ShowOverlayGlow(_G["SpellButton" .. i - offset]);
					print("Missing:", spellName, spellData[spellName].spellType)
				end
			end
		end
	end
end]]

--Some of these addons also use default bars or whatever, this is made so multiple scan types can be run in one go.
--[[local function scanDefaultUI(spellData, count)
	count = count or 0;
	for bar, barName in pairs(defaultBars) do
		for i = 1, 12 do
			local button = _G[barName .. "Button" .. i];
			if (button) then
				local slot = button.action or 0;
				if (slot and HasAction(slot)) then
					local spellID = 0;
					local actionType, id = GetActionInfo(slot);
					if (actionType == "macro") then
						spellID = GetMacroSpell(id);
					elseif (actionType == "spell") then
						spellID = id;
					end
					if (spellID and spellID > 0) then
						local spellName, rank = GetSpellInfo(spellID)
						local spell = Spell:CreateFromSpellID(spellID);
						spell:ContinueOnSpellLoad(function()
							local spellName = spell:GetSpellName();
							local spellSubText = spell:GetSpellSubtext();
							local rank = strmatch(spellSubText, "%d+");
							if (rank) then
								rank = tonumber(rank);
								if (rank and spellData[spellName] and rank < spellData[spellName]) then
									count = count + 1;
									ActionButton_ShowOverlayGlow(button);
									tinsert(highlighted, button);
									local text = "|cFFFFFF00Bar " .. bar .. " Slot " .. i .. ":|r " .. GetSpellLink(spellID) .. " |cFF9CD6DE(" .. RANK .. " " .. rank .. ")|r";
									text = text .. " |cFFFF6900Not Max Rank.|r";
									print(text);
								end
							end
						end);
					end
				end
			end
		end
	end
	return count;
end

local function scanBartender4(spellData, count)
	count = count or 0;
	for i = 1, 120 do
		local button = _G["BT4Button" .. i];
		if (button) then
			local slot = _G["BT4Button" .. i].id;
			if (slot and HasAction(slot)) then
				local spellID = 0;
				local actionType, id = GetActionInfo(slot);
				if (actionType == "macro") then
					spellID = GetMacroSpell(id);
				elseif (actionType == "spell") then
					spellID = id;
				end
				if (spellID and spellID > 0) then
					local spellName, rank = GetSpellInfo(spellID)
					local spell = Spell:CreateFromSpellID(spellID);
					spell:ContinueOnSpellLoad(function()
						local spellName = spell:GetSpellName();
						local spellSubText = spell:GetSpellSubtext();
						local rank = strmatch(spellSubText, "%d+");
						if (spellData[spellName]) then
							if (rank) then
								rank = tonumber(rank);
								if (rank and spellData[spellName] and (spellData[spellName].rank and rank < spellData[spellName])) then
									spellData[spellName] = nil;
								end
							else
								if (spellData[spellName]) then
									spellData[spellName].found = true;
								end
							end
						end
					end);
				end
			end
		end
	end
	return count;
end

local function scanElvUI(spellData, count)
	count = count or 0;
	for bar = 1, 12 do
		for slotNum = 1, 12 do
			local button = _G["ElvUI_Bar" .. bar .. "Button" .. slotNum];
			if (button) then
				local slot = _G["ElvUI_Bar" .. bar .. "Button" .. slotNum]._state_action;
                if (slot and HasAction(slot)) then
					local spellID = 0;
					local actionType, id = GetActionInfo(slot);
					if (actionType == "macro") then
						spellID = GetMacroSpell(id);
					elseif (actionType == "spell") then
						spellID = id;
					end
					if (spellID and spellID > 0) then
						local spellName, rank = GetSpellInfo(spellID)
						local spell = Spell:CreateFromSpellID(spellID);
						spell:ContinueOnSpellLoad(function()
							local spellName = spell:GetSpellName();
							local spellSubText = spell:GetSpellSubtext();
							local rank = strmatch(spellSubText, "%d+");
							if (rank) then
								rank = tonumber(rank);
								if (rank and spellData[spellName] and rank < spellData[spellName]) then
									count = count + 1;
									ActionButton_ShowOverlayGlow(button);
									tinsert(highlighted, button);
									local text = "|cFFFFFF00Bar " .. bar .. " Slot " .. slotNum .. ":|r " .. GetSpellLink(spellID) .. " |cFF9CD6DE(" .. RANK .. " " .. rank .. ")|r";
									text = text .. " |cFFFF6900Not Max Rank.|r";
									print(text);
								end
							end
						end);
					end
				end
			end
		end
	end
	return count;
end

local function scanDominos(spellData, count)
	count = count or 0;
	--For dominos we need to scan default bars too, it seems to use some.
	count = count + scanDefaultUI(spellData, count);
	for i = 1, 168 do
		local button = _G["DominosActionButton" .. i];
		if (button) then
			local slot = _G["DominosActionButton" .. i].action;
			if (slot and HasAction(slot)) then
				local spellID = 0;
				local actionType, id = GetActionInfo(slot);
				if (actionType == "macro") then
					spellID = GetMacroSpell(id);
				elseif (actionType == "spell") then
					spellID = id;
				end
				if (spellID and spellID > 0) then
					local spellName, rank = GetSpellInfo(spellID)
					local spell = Spell:CreateFromSpellID(spellID);
					spell:ContinueOnSpellLoad(function()
						local spellName = spell:GetSpellName();
						local spellSubText = spell:GetSpellSubtext();
						local rank = strmatch(spellSubText, "%d+");
						if (rank) then
							rank = tonumber(rank);
							if (rank and spellData[spellName] and rank < spellData[spellName]) then
								count = count + 1;
								local bar = ceil(i / 12);
								local slot = i % 12;
								if (slot == 0) then
									slot = 12;
								end
								ActionButton_ShowOverlayGlow(button);
								tinsert(highlighted, button);
								local text = "|cFFFFFF00Bar " .. bar .. " Slot " .. slot .. ":|r " .. GetSpellLink(spellID) .. " |cFF9CD6DE(" .. RANK .. " " .. rank .. ")|r";
								text = text .. " |cFFFF6900Not Max Rank.|r";
								print(text);
							end
						end
					end);
				end
			end
		end
	end
	return count;
end

local function scanHotbars()
	removeAllHighlighted();
	buildSpellData();
	local count;
	if (Bartender4) then
		count = scanBartender4(spellData)
	elseif (ElvUI) then
		count = scanElvUI(spellData)
	elseif (Dominos) then
		count = scanDominos(spellData);
	else
		count = scanDefaultUI(spellData);
	end
	scanForHighlights();
end

--SpellBookFrame:HookScript("OnShow", function(self, arg)
--	scanHotbars();
--end)

hooksecurefunc("SpellBookFrame_Update", function(...)
	scanHotbars();
end)]]

--[[local f = CreateFrame("Frame");
f:RegisterEvent("ACTIONBAR_SLOT_CHANGED");
f:SetScript("OnEvent", function(self, event, ...)
	if (SpellBookFrame:IsShown()) then
		scanHotbars();
	end
end)]]

--[[SpellBookFrame:HookScript("OnHide", function(self, arg)
	removeAllHighlighted();
end)]]

--[[local button = CreateFrame("Button", "$parentButton", SpellBookFrame, "UIPanelButtonTemplate");
button:SetFrameLevel(15);
if (ElvUI) then
	button:SetPoint("TOPRIGHT", SpellBookFrame, "TOPRIGHT", -72, -34);
else
	button:SetPoint("TOPRIGHT", SpellBookFrame, "TOPRIGHT", -56, -52);
end
button:SetWidth(140);
button:SetHeight(24);
button:SetScale(0.8);
button:SetText("Check Hotbar Ranks");
button:SetScript("OnClick", function(self, arg)
	scanHotbars();
end)]]