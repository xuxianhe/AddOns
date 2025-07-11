local E = unpack(ElvUI)
local S = E:GetModule('Skins')
local _G = _G
local pairs = _G.pairs
local hooksecurefunc = _G.hooksecurefunc

--skin biaoge
function ElvUI_EltreumUI:EltruismBiaoGe()
	if E.db.ElvUI_EltreumUI.skins.biaoge then
		S:HandleFrame(BG.MainFrame)
		S:HandleButton(BG.ButtonQingKong)
		S:HandleFrame(BG.History.List)
		for _, v in pairs(BG.TongBaoButtons) do
			S:HandleButton(v)
		end
		for _, v in pairs(BG.tabButtons) do
			local bt = v.button
			S:HandleButton(bt)
		end
		S:HandleButton(BG.ButtonHopeQingKong)
		S:HandleButton(BG.DuiZhangMainFrame.ButtonCopy)
		S:HandleButton(BG.DuiZhangMainFrame.ButtonRaidMember)
		S:HandleButton(BG.YYMainFrame.search)
		S:HandleButton(BG.AchievementMainFrame.ButtonRefresh)
		S:HandleButton(BG.History.EscButton)
		S:HandleFrame(BG.FilterClassItemMainFrame)
		S:HandleFrame(BG.FilterClassItemMainFrame.AddFrame)
		S:HandleFrame(BG.auctionLogFrame)
		S:HandleButton(BG.auctionLogFrame.ButtonAdd)
		S:HandleButton(BG.auctionLogFrame.ButtonCreateLedger)
		S:HandleButton(BG.auctionLogFrame.ButtonCreateDuiZhang)
		S:HandleFrame(BG.itemGuoQiFrame)
--		hooksecurefunc(BG, "SetFBCD", function()
--			S:HandleFrame(BG.FBCDFrame)
--		end)
	end
end
S:AddCallbackForAddon('BiaoGe', "EltruismBiaoGe", ElvUI_EltreumUI.EltruismBiaoGe)