local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')
local LCG = E.Libs.CustomGlow

local _G = _G
local min, next = min, next
local unpack, pairs = unpack, pairs
local hooksecurefunc = hooksecurefunc

local UnitIsGroupLeader = UnitIsGroupLeader
local C_LFGList_GetAvailableActivities = C_LFGList.GetAvailableActivities
local C_LFGList_GetAvailableRoles = C_LFGList.GetAvailableRoles

local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME

local function LFDQueueFrameRoleButtonIconOnShow(self)
	LCG.ShowOverlayGlow(self:GetParent().checkButton)
end

local function LFDQueueFrameRoleButtonIconOnHide(self)
	LCG.HideOverlayGlow(self:GetParent().checkButton)
end

local function HandleGoldIcon(button)
	local Button = _G[button]
	if Button.backdrop then return end

	local count = _G[button..'Count']
	local nameFrame = _G[button..'NameFrame']
	local iconTexture = _G[button..'IconTexture']

	Button:CreateBackdrop()
	Button.backdrop:ClearAllPoints()
	Button.backdrop:Point('LEFT', 1, 0)
	Button.backdrop:Size(42)

	iconTexture:SetTexCoord(unpack(E.TexCoords))
	iconTexture:SetDrawLayer('OVERLAY')
	iconTexture:SetParent(Button.backdrop)
	iconTexture:SetInside()

	count:SetParent(Button.backdrop)
	count:SetDrawLayer('OVERLAY')

	nameFrame:SetTexture()
	nameFrame:Size(118, 39)
end

local function SkinItemButton(parentFrame, _, index)
	local parentName = parentFrame:GetName()
	local item = _G[parentName..'Item'..index]
	if item and not item.backdrop then
		item:CreateBackdrop()
		item.backdrop:ClearAllPoints()
		item.backdrop:Point('LEFT', 1, 0)
		item.backdrop:Size(42)

		item.Icon:SetTexCoord(unpack(E.TexCoords))
		item.Icon:SetDrawLayer('OVERLAY')
		item.Icon:SetParent(item.backdrop)
		item.Icon:SetInside()

		item.Count:SetDrawLayer('OVERLAY')
		item.Count:SetParent(item.backdrop)

		item.NameFrame:SetTexture()
		item.NameFrame:Size(118, 39)

		item.shortageBorder:SetTexture()

		item.roleIcon1:SetParent(item.backdrop)
		item.roleIcon2:SetParent(item.backdrop)

		S:HandleIconBorder(item.IconBorder)
	end
end

function S:LookingForGroupFrames()
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.lfg) then return end

	local PVEFrame = _G.PVEFrame
	S:HandlePortraitFrame(PVEFrame)

	_G.PVEFrameBg:Hide()
	PVEFrame.shadows:Kill() -- We need to kill it, because if you switch to Mythic Dungeon Tab and back, it shows back up.

	S:HandleButton(_G.LFDQueueFramePartyBackfillBackfillButton)
	S:HandleButton(_G.LFDQueueFramePartyBackfillNoBackfillButton)

	_G.GroupFinderFrame.groupButton1.icon:SetTexture(133076) -- interface\icons\inv_helmet_08.blp
	_G.GroupFinderFrame.groupButton2.icon:SetTexture(133074) -- interface\icons\inv_helmet_06.blp
	_G.GroupFinderFrame.groupButton3.icon:SetTexture(464820) -- interface\icons\achievement_general_stayclassy.blp

	_G.LFGDungeonReadyStatus:StripTextures()
	_G.LFGDungeonReadyStatus:SetTemplate('Transparent')

	S:HandleCloseButton(_G.LFGDungeonReadyDialogCloseButton)
	S:SkinReadyDialog(_G.LFGDungeonReadyDialog)

	_G.LFDQueueFrame:StripTextures(true)
	_G.LFDQueueFrameRoleButtonTankIncentiveIcon:SetAlpha(0)
	_G.LFDQueueFrameRoleButtonHealerIncentiveIcon:SetAlpha(0)
	_G.LFDQueueFrameRoleButtonDPSIncentiveIcon:SetAlpha(0)
	_G.LFDQueueFrameRoleButtonTankIncentiveIcon:HookScript('OnShow', LFDQueueFrameRoleButtonIconOnShow)
	_G.LFDQueueFrameRoleButtonHealerIncentiveIcon:HookScript('OnShow', LFDQueueFrameRoleButtonIconOnShow)
	_G.LFDQueueFrameRoleButtonDPSIncentiveIcon:HookScript('OnShow', LFDQueueFrameRoleButtonIconOnShow)
	_G.LFDQueueFrameRoleButtonTankIncentiveIcon:HookScript('OnHide', LFDQueueFrameRoleButtonIconOnHide)
	_G.LFDQueueFrameRoleButtonHealerIncentiveIcon:HookScript('OnHide', LFDQueueFrameRoleButtonIconOnHide)
	_G.LFDQueueFrameRoleButtonDPSIncentiveIcon:HookScript('OnHide', LFDQueueFrameRoleButtonIconOnHide)
	_G.LFDQueueFrameRoleButtonTank.shortageBorder:Kill()
	_G.LFDQueueFrameRoleButtonDPS.shortageBorder:Kill()
	_G.LFDQueueFrameRoleButtonHealer.shortageBorder:Kill()
	S:HandleCloseButton(_G.LFGDungeonReadyStatusCloseButton)

	-- Role check popup
	S:HandleFrame(_G.RolePollPopup)
	S:HandleButton(_G.RolePollPopupAcceptButton)
	S:HandleCloseButton(_G.RolePollPopupCloseButton)

	for _, roleButton in pairs({
		_G.LFDQueueFrameRoleButtonHealer,
		_G.LFDQueueFrameRoleButtonDPS,
		_G.LFDQueueFrameRoleButtonLeader,
		_G.LFDQueueFrameRoleButtonTank,
		_G.LFGInvitePopupRoleButtonTank,
		_G.LFGInvitePopupRoleButtonHealer,
		_G.LFGInvitePopupRoleButtonDPS,
		_G.LFGListApplicationDialog.TankButton,
		_G.LFGListApplicationDialog.HealerButton,
		_G.LFGListApplicationDialog.DamagerButton,

		-- these three arent scaled to 0.7
		_G.RolePollPopupRoleButtonTank,
		_G.RolePollPopupRoleButtonHealer,
		_G.RolePollPopupRoleButtonDPS,
	}) do
		local checkButton = roleButton.checkButton or roleButton.CheckButton
		if checkButton:GetScale() ~= 1 then
			checkButton:SetScale(1)
		end

		S:HandleCheckBox(checkButton, nil, nil, true)
		checkButton.backdrop:SetInside()
		checkButton:Size(18)
	end

	hooksecurefunc('SetCheckButtonIsRadio', function(button)
		if not button.isSkinned then
			S:HandleCheckBox(button)
		end
	end)

	for _, checkButton in pairs({ --Fix issue with role buttons overlapping each other (Blizzard bug)
		_G.LFGListApplicationDialog.TankButton.CheckButton,
		_G.LFGListApplicationDialog.HealerButton.CheckButton,
		_G.LFGListApplicationDialog.DamagerButton.CheckButton,
	}) do
		checkButton:ClearAllPoints()
		checkButton:Point('BOTTOMLEFT', 0, 0)
	end

	hooksecurefunc('LFGListApplicationDialog_UpdateRoles', function(dialog) --Copy from Blizzard, we just fix position
		local availTank, availHealer, availDPS = C_LFGList_GetAvailableRoles()

		local avail1, avail2
		if availTank then
			avail1 = dialog.TankButton
		end
		if availHealer then
			if avail1 then
				avail2 = dialog.HealerButton
			else
				avail1 = dialog.HealerButton
			end
		end
		if availDPS then
			if avail1 then
				avail2 = dialog.DamagerButton
			else
				avail1 = dialog.DamagerButton
			end
		end

		if avail2 then
			avail1:ClearAllPoints()
			avail1:Point('TOPRIGHT', dialog, 'TOP', -40, -35)
			avail2:ClearAllPoints()
			avail2:Point('TOPLEFT', dialog, 'TOP', 40, -35)
		elseif avail1 then
			avail1:ClearAllPoints()
			avail1:Point('TOP', dialog, 'TOP', 0, -35)
		end
	end)

	hooksecurefunc('LFG_DisableRoleButton', function(button)
		button.checkButton:SetAlpha(button.checkButton:GetChecked() and 1 or 0)

		if button.background then
			button.background:Show()
		end
	end)

	hooksecurefunc('LFG_EnableRoleButton', function(button)
		button.checkButton:SetAlpha(1)
	end)

	hooksecurefunc('LFG_PermanentlyDisableRoleButton', function(button)
		if button.background then
			button.background:Show()
			button.background:SetDesaturated(true)
		end
	end)

	for i = 1, 3 do
		local bu = _G.GroupFinderFrame['groupButton'..i]
		bu.ring:Kill()
		bu.bg:Kill()
		S:HandleButton(bu)

		bu.icon:Size(45)
		bu.icon:ClearAllPoints()
		bu.icon:Point('LEFT', 10, 0)
		S:HandleIcon(bu.icon, true)
	end

	for i = 1, 3 do
		S:HandleTab(_G['PVEFrameTab'..i])
	end

	-- Raid finder
	S:HandleButton(_G.LFDQueueFrameFindGroupButton)
	S:HandleTrimScrollBar(_G.LFDQueueFrameRandomScrollFrame.ScrollBar)

	_G.LFDParentFrame:StripTextures()
	_G.LFDParentFrameInset:StripTextures()

	HandleGoldIcon('LFDQueueFrameRandomScrollFrameChildFrameMoneyReward')

	hooksecurefunc('LFGDungeonListButton_SetDungeon', function(button)
		if button and button.expandOrCollapseButton:IsShown() then
			if button.isCollapsed then
				button.expandOrCollapseButton:SetNormalTexture(E.Media.Textures.PlusButton)
			else
				button.expandOrCollapseButton:SetNormalTexture(E.Media.Textures.MinusButton)
			end
		end
	end)

	S:HandleDropDownBox(_G.LFDQueueFrameTypeDropdown, 259)
	_G.LFDQueueFrameTypeDropdown:ClearAllPoints()
	_G.LFDQueueFrameTypeDropdown:Point('TOPRIGHT', PVEFrame, 'TOPRIGHT', -10, -117)

	-- Skin Reward Items (This works for all frames, LFD, Raid, Scenario)
	hooksecurefunc('LFGRewardsFrame_SetItemButton', SkinItemButton)

	--[[
		LFGInvitePopup_Update('Elvz', true, true, true)
		StaticPopupSpecial_Show(LFGInvitePopup)
	]]

	_G.LFGInvitePopup:StripTextures()
	_G.LFGInvitePopup:SetTemplate('Transparent')
	S:HandleButton(_G.LFGInvitePopupAcceptButton)
	S:HandleButton(_G.LFGInvitePopupDeclineButton)

	S:HandleButton(_G[_G.LFDQueueFrame.PartyBackfill:GetName()..'BackfillButton'])
	S:HandleButton(_G[_G.LFDQueueFrame.PartyBackfill:GetName()..'NoBackfillButton'])
	S:HandleTrimScrollBar(_G.LFDQueueFrameSpecific.ScrollBar)

	local RoleDialog = _G.LFGListCreateRoleDialog
	if RoleDialog then
		RoleDialog:StripTextures()
		RoleDialog:SetTemplate('Transparent')
		S:HandleButton(RoleDialog.SignUpButton)
		S:HandleButton(RoleDialog.CancelButton)

		S:HandleCheckBox(RoleDialog.DamagerButton.CheckButton)
		S:HandleCheckBox(RoleDialog.TankButton.CheckButton)
		S:HandleCheckBox(RoleDialog.HealerButton.CheckButton)
	end
		
	-- LFGListFrame
	local LFGListFrame = _G.LFGListFrame
	LFGListFrame.CategorySelection.Inset:StripTextures()
	S:HandleButton(LFGListFrame.CategorySelection.StartGroupButton)
	LFGListFrame.CategorySelection.StartGroupButton:ClearAllPoints()
	LFGListFrame.CategorySelection.StartGroupButton:Point('BOTTOMLEFT', -1, 3)
	LFGListFrame.CategorySelection.StartGroupButton.RightSeparator:StripTextures()
	S:HandleButton(LFGListFrame.CategorySelection.FindGroupButton)
	LFGListFrame.CategorySelection.FindGroupButton:ClearAllPoints()
	LFGListFrame.CategorySelection.FindGroupButton:Point('BOTTOMRIGHT', -6, 3)
	LFGListFrame.CategorySelection.FindGroupButton.LeftSeparator:StripTextures()

	LFGListFrame.EntryCreation.Inset:StripTextures()
	S:HandleButton(LFGListFrame.EntryCreation.CancelButton)
	S:HandleButton(LFGListFrame.EntryCreation.ListGroupButton)
	LFGListFrame.EntryCreation.CancelButton:ClearAllPoints()
	LFGListFrame.EntryCreation.CancelButton:Point('BOTTOMLEFT', -1, 3)
	LFGListFrame.EntryCreation.CancelButton.RightSeparator:StripTextures()
	LFGListFrame.EntryCreation.ListGroupButton:ClearAllPoints()
	LFGListFrame.EntryCreation.ListGroupButton:Point('BOTTOMRIGHT', -6, 3)
	LFGListFrame.EntryCreation.ListGroupButton.LeftSeparator:StripTextures()
	S:HandleEditBox(LFGListFrame.EntryCreation.Description)

	S:HandleEditBox(LFGListFrame.EntryCreation.ItemLevel.EditBox)
	S:HandleEditBox(LFGListFrame.EntryCreation.PVPRating.EditBox)
	S:HandleEditBox(LFGListFrame.EntryCreation.PvpItemLevel.EditBox)
	S:HandleEditBox(LFGListFrame.EntryCreation.VoiceChat.EditBox)
	S:HandleEditBox(LFGListFrame.EntryCreation.Name)

	S:HandleDropDownBox(_G.LFGListEntryCreationActivityDropdown)
	S:HandleDropDownBox(_G.LFGListEntryCreationGroupDropdown)
	S:HandleDropDownBox(_G.LFGListEntryCreationPlayStyleDropdown)

	S:HandleCheckBox(LFGListFrame.EntryCreation.ItemLevel.CheckButton)
	S:HandleCheckBox(LFGListFrame.EntryCreation.PrivateGroup.CheckButton)
	S:HandleCheckBox(LFGListFrame.EntryCreation.PvpItemLevel.CheckButton)
	S:HandleCheckBox(LFGListFrame.EntryCreation.PVPRating.CheckButton)
	S:HandleCheckBox(LFGListFrame.EntryCreation.VoiceChat.CheckButton)
	S:HandleCheckBox(LFGListFrame.EntryCreation.CrossFactionGroup.CheckButton)

	LFGListFrame.EntryCreation.ActivityFinder.Dialog:StripTextures()
	LFGListFrame.EntryCreation.ActivityFinder.Dialog:SetTemplate('Transparent')
	LFGListFrame.EntryCreation.ActivityFinder.Dialog.BorderFrame:StripTextures()
	LFGListFrame.EntryCreation.ActivityFinder.Dialog.BorderFrame:SetTemplate('Transparent')

	S:HandleEditBox(LFGListFrame.EntryCreation.ActivityFinder.Dialog.EntryBox)
	S:HandleButton(LFGListFrame.EntryCreation.ActivityFinder.Dialog.SelectButton)
	S:HandleButton(LFGListFrame.EntryCreation.ActivityFinder.Dialog.CancelButton)

	_G.LFGListApplicationDialog:StripTextures()
	_G.LFGListApplicationDialog:SetTemplate('Transparent')
	S:HandleButton(_G.LFGListApplicationDialog.SignUpButton)
	S:HandleButton(_G.LFGListApplicationDialog.CancelButton)
	S:HandleEditBox(_G.LFGListApplicationDialogDescription)

	_G.LFGListInviteDialog:StripTextures()
	_G.LFGListInviteDialog:SetTemplate('Transparent')
	S:HandleButton(_G.LFGListInviteDialog.AcknowledgeButton)
	S:HandleButton(_G.LFGListInviteDialog.AcceptButton)
	S:HandleButton(_G.LFGListInviteDialog.DeclineButton)

	S:HandleEditBox(LFGListFrame.SearchPanel.SearchBox)
	S:HandleButton(LFGListFrame.SearchPanel.BackButton)
	S:HandleButton(LFGListFrame.SearchPanel.SignUpButton)
	LFGListFrame.SearchPanel.BackButton:ClearAllPoints()
	LFGListFrame.SearchPanel.BackButton:Point('BOTTOMLEFT', -1, 3)
	LFGListFrame.SearchPanel.BackButton.RightSeparator:StripTextures()
	LFGListFrame.SearchPanel.SignUpButton:ClearAllPoints()
	LFGListFrame.SearchPanel.SignUpButton:Point('BOTTOMRIGHT', -6, 3)
	LFGListFrame.SearchPanel.SignUpButton.LeftSeparator:StripTextures()
	LFGListFrame.SearchPanel.ResultsInset:StripTextures()

	S:HandleTrimScrollBar(_G.LFGListFrame.SearchPanel.ScrollBar)

	S:HandleButton(LFGListFrame.SearchPanel.FilterButton)
	LFGListFrame.SearchPanel.FilterButton:Point('LEFT', LFGListFrame.SearchPanel.SearchBox, 'RIGHT', 5, 0)
	S:HandleButton(LFGListFrame.SearchPanel.RefreshButton)
	S:HandleButton(LFGListFrame.SearchPanel.BackToGroupButton)
	LFGListFrame.SearchPanel.RefreshButton:Size(24)
	LFGListFrame.SearchPanel.RefreshButton.Icon:Point('CENTER')

	hooksecurefunc('LFGListApplicationViewer_UpdateApplicant', function(button)
		if not button.DeclineButton.template then
			S:HandleButton(button.DeclineButton, nil, true)
		end
		if not button.InviteButton.template then
			S:HandleButton(button.InviteButton)
		end
		if not button.InviteButtonSmall.template then
			S:HandleButton(button.InviteButtonSmall)
		end
	end)

	hooksecurefunc('LFGListSearchEntry_Update', function(button)
		if not button.CancelButton.template then
			S:HandleButton(button.CancelButton, nil, true)
		end
	end)

	hooksecurefunc('LFGListSearchPanel_UpdateAutoComplete', function(panel)
		for _, child in next, { LFGListFrame.SearchPanel.AutoCompleteFrame:GetChildren() } do
			if not child.isSkinned and child:IsObjectType('Button') then
				S:HandleButton(child)
				child.isSkinned = true
			end
		end

		local text = panel.SearchBox:GetText()
		local matchingActivities = C_LFGList_GetAvailableActivities(panel.categoryID, nil, panel.filters, text)
		local numResults = min(#matchingActivities, _G.MAX_LFG_LIST_SEARCH_AUTOCOMPLETE_ENTRIES)

		for i = 2, numResults do
			local button = panel.AutoCompleteFrame.Results[i]
			if button and not button.moved then
				button:Point('TOPLEFT', panel.AutoCompleteFrame.Results[i-1], 'BOTTOMLEFT', 0, -2)
				button:Point('TOPRIGHT', panel.AutoCompleteFrame.Results[i-1], 'BOTTOMRIGHT', 0, -2)
				button.moved = true
			end
		end

		panel.AutoCompleteFrame:Height(numResults * (panel.AutoCompleteFrame.Results[1]:GetHeight() + 3.5) + 8)
	end)

	LFGListFrame.SearchPanel.AutoCompleteFrame:StripTextures()
	LFGListFrame.SearchPanel.AutoCompleteFrame:CreateBackdrop('Transparent')
	LFGListFrame.SearchPanel.AutoCompleteFrame.backdrop:Point('TOPLEFT', LFGListFrame.SearchPanel.AutoCompleteFrame, 'TOPLEFT', 0, 3)
	LFGListFrame.SearchPanel.AutoCompleteFrame.backdrop:Point('BOTTOMRIGHT', LFGListFrame.SearchPanel.AutoCompleteFrame, 'BOTTOMRIGHT', 6, 3)

	LFGListFrame.SearchPanel.AutoCompleteFrame:Point('TOPLEFT', LFGListFrame.SearchPanel.SearchBox, 'BOTTOMLEFT', -2, -8)
	LFGListFrame.SearchPanel.AutoCompleteFrame:Point('TOPRIGHT', LFGListFrame.SearchPanel.SearchBox, 'BOTTOMRIGHT', -4, -8)

	--ApplicationViewer (Custom Groups)
	LFGListFrame.ApplicationViewer.InfoBackground:Hide() -- even the ugly borders are now an atlas on the texutre? wtf????
	LFGListFrame.ApplicationViewer.InfoBackground:CreateBackdrop('Transparent')
	LFGListFrame.ApplicationViewer.EntryName:FontTemplate()
	S:HandleCheckBox(LFGListFrame.ApplicationViewer.AutoAcceptButton)

	LFGListFrame.ApplicationViewer.Inset:StripTextures()
	LFGListFrame.ApplicationViewer.Inset:SetTemplate('Transparent')

	S:HandleButton(LFGListFrame.ApplicationViewer.NameColumnHeader)
	S:HandleButton(LFGListFrame.ApplicationViewer.RoleColumnHeader)
	S:HandleButton(LFGListFrame.ApplicationViewer.ItemLevelColumnHeader)
	S:HandleButton(LFGListFrame.ApplicationViewer.RatingColumnHeader)
	LFGListFrame.ApplicationViewer.NameColumnHeader:ClearAllPoints()
	LFGListFrame.ApplicationViewer.NameColumnHeader:Point('BOTTOMLEFT', LFGListFrame.ApplicationViewer.Inset, 'TOPLEFT', 0, 1)
	LFGListFrame.ApplicationViewer.NameColumnHeader.Label:FontTemplate()
	LFGListFrame.ApplicationViewer.RoleColumnHeader:ClearAllPoints()
	LFGListFrame.ApplicationViewer.RoleColumnHeader:Point('LEFT', LFGListFrame.ApplicationViewer.NameColumnHeader, 'RIGHT', 1, 0)
	LFGListFrame.ApplicationViewer.RoleColumnHeader.Label:FontTemplate()
	LFGListFrame.ApplicationViewer.ItemLevelColumnHeader:ClearAllPoints()
	LFGListFrame.ApplicationViewer.ItemLevelColumnHeader:Point('LEFT', LFGListFrame.ApplicationViewer.RoleColumnHeader, 'RIGHT', 1, 0)
	LFGListFrame.ApplicationViewer.ItemLevelColumnHeader.Label:FontTemplate()
	LFGListFrame.ApplicationViewer.RatingColumnHeader:ClearAllPoints()
	LFGListFrame.ApplicationViewer.RatingColumnHeader:Point('LEFT', LFGListFrame.ApplicationViewer.ItemLevelColumnHeader, 'RIGHT', 1, 0)
	LFGListFrame.ApplicationViewer.RatingColumnHeader.Label:FontTemplate()
	LFGListFrame.ApplicationViewer.PrivateGroup:FontTemplate()

	S:HandleButton(LFGListFrame.ApplicationViewer.RefreshButton)
	LFGListFrame.ApplicationViewer.RefreshButton:Size(24)
	LFGListFrame.ApplicationViewer.RefreshButton:ClearAllPoints()
	LFGListFrame.ApplicationViewer.RefreshButton:Point('BOTTOMRIGHT', LFGListFrame.ApplicationViewer.Inset, 'TOPRIGHT', 16, 4)

	S:HandleButton(LFGListFrame.ApplicationViewer.RemoveEntryButton)
	S:HandleButton(LFGListFrame.ApplicationViewer.EditButton)
	S:HandleButton(LFGListFrame.ApplicationViewer.BrowseGroupsButton)
	LFGListFrame.ApplicationViewer.EditButton:ClearAllPoints()
	LFGListFrame.ApplicationViewer.EditButton:Point('BOTTOMRIGHT', -6, 3)
	LFGListFrame.ApplicationViewer.BrowseGroupsButton:ClearAllPoints()
	LFGListFrame.ApplicationViewer.BrowseGroupsButton:Point('BOTTOMLEFT', -1, 3)
	LFGListFrame.ApplicationViewer.BrowseGroupsButton:Size(120, 22)

	S:HandleTrimScrollBar(LFGListFrame.ApplicationViewer.ScrollBar)

	hooksecurefunc('LFGListApplicationViewer_UpdateInfo', function(frame)
		frame.RemoveEntryButton:ClearAllPoints()

		if UnitIsGroupLeader('player', LE_PARTY_CATEGORY_HOME) then
			frame.RemoveEntryButton:Point('RIGHT', frame.EditButton, 'LEFT', -2, 0)
		else
			frame.RemoveEntryButton:Point('BOTTOMLEFT', -1, 3)
		end
	end)

	hooksecurefunc('LFGListCategorySelection_AddButton', function(btn, btnIndex, categoryID, filters)
		local button = btn.CategoryButtons[btnIndex]
		if button then
			if not button.isSkinned then
				button:SetTemplate()
				button.Icon:SetDrawLayer('BACKGROUND', 2)
				button.Icon:SetTexCoord(unpack(E.TexCoords))
				button.Icon:SetInside()
				button.Cover:Hide()
				button.HighlightTexture:SetColorTexture(1, 1, 1, 0.1)
				button.HighlightTexture:SetInside()

				--Fix issue with labels not following changes to GameFontNormal as they should
				button.Label:SetFontObject('GameFontNormal')
				button.isSkinned = true
			end

			button.SelectedTexture:Hide()
			local selected = btn.selectedCategory == categoryID and btn.selectedFilters == filters
			if selected then
				button:SetBackdropBorderColor(1, 1, 0)
			else
				button:SetBackdropBorderColor(unpack(E.media.bordercolor))
			end
		end
	end)
end

S:AddCallback('LookingForGroupFrames')
