local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G

function S:TaxiFrame()
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.taxi) then return end

	local TaxiFrame = _G.TaxiFrame
	S:HandleFrame(TaxiFrame, true, nil, 11, -12, -32, 76)
	_G.TaxiPortrait:Kill()
	_G.TaxiMap:PointXY(-11, -71)
	_G.TaxiRouteMap:PointXY(-11, -71)
	_G.TaxiMerchant:SetTextColor(1, 1, 1)

	S:HandleCloseButton(_G.TaxiCloseButton, TaxiFrame.backdrop)
end

S:AddCallback('TaxiFrame')
