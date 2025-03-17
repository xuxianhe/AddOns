if BG.IsBlackListPlayer then return end
local AddonName, ns = ...

local LibBG = ns.LibBG
local L = ns.L

local RR = ns.RR
local NN = ns.NN
local RN = ns.RN
local Size = ns.Size
local RGB = ns.RGB
local RGB_16 = ns.RGB_16
local GetClassRGB = ns.GetClassRGB
local SetClassCFF = ns.SetClassCFF
local GetText_T = ns.GetText_T
local FrameDongHua = ns.FrameDongHua
local FrameHide = ns.FrameHide
local AddTexture = ns.AddTexture
local GetItemID = ns.GetItemID

local Width = ns.Width
local Height = ns.Height
local Maxb = ns.Maxb
local Maxi = ns.Maxi
local HopeMaxn = ns.HopeMaxn
local HopeMaxb = ns.HopeMaxb
local HopeMaxi = ns.HopeMaxi

local pt = print
local RealmId = GetRealmID()
local player = UnitName("player")

BG.Init(function()
    local sending = {}
    local sendDone = {}
    local sendingCount = {}
    local notShowSendingText = {}

    local function UpdateGuildFrame(frame)
        if IsInRaid(1) then
            frame:SetWidth(1)
            frame:Hide()
        elseif IsInGuild() then
            local numTotal, numOnline, numOnlineAndMobile = GetNumGuildMembers()
            frame.text:SetFormattedText(frame.title2, (Size(frame.table) .. "/" .. numOnline))
            frame:SetWidth(frame.text:GetWidth() + 10)
            frame:Show()
        end
    end

    local function UpdateAddonFrame(frame)
        if IsInRaid(1) then
            local count = 0
            for name in pairs(frame.table) do
                if BG.raidRosterName[name] then
                    count = count + 1
                end
            end
            frame.text:SetFormattedText(frame.title2, (count .. "/" .. GetNumGroupMembers()))
            frame:SetWidth(frame.text:GetWidth() + 10)
            frame:Show()
        else
            wipe(frame.table)
            frame:Hide()
        end
    end
    local function Guild_OnEnter(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 0)
        GameTooltip:ClearLines()
        GameTooltip:AddLine(self.title, 0, 1, 0)
        GameTooltip:AddLine(" ")
        local ii = 0
        for i = 1, GetNumGuildMembers() do
            local name, rankName, rankIndex, level, classDisplayName, zone,
            publicNote, officerNote, isOnline, status, class, achievementPoints,
            achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(i)
            name = strsplit("-", name)
            if isOnline then
                if ii > 40 then
                    GameTooltip:AddLine("......")
                    break
                end
                ii = ii + 1
                local line = 2
                local Ver = self.table[name] or L["无"]
                local r, g, b = GetClassColor(class)
                GameTooltip:AddDoubleLine(name, Ver, r, g, b, 1, 1, 1)
                if Ver == L["无"] then
                    local alpha = 0.3
                    if _G["GameTooltipTextLeft" .. (ii + line)] then
                        _G["GameTooltipTextLeft" .. (ii + line)]:SetAlpha(alpha)
                    end
                    if _G["GameTooltipTextRight" .. (ii + line)] then
                        _G["GameTooltipTextRight" .. (ii + line)]:SetAlpha(alpha)
                    end
                end
            end
        end
        GameTooltip:Show()
    end

    local function Addon_OnEnter(self)
        self.isOnEnter = true

        local line = 2
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 0)
        GameTooltip:ClearLines()
        GameTooltip:AddLine(self.title, 0, 1, 0)
        if self.isAuciton then
            GameTooltip:AddLine(L["需全团安装拍卖WA，没安装的人将会看不到拍卖窗口"], 0.5, 0.5, 0.5, true)
            line = line + 1
        end
        GameTooltip:AddLine(" ")
        local raid = BG.PaiXuRaidRosterInfo()
        for i, v in ipairs(raid) do
            local Ver = self.table[v.name]
            if not Ver then
                if v.online then
                    Ver = L["无"]
                else
                    Ver = L["未知"]
                end
            end

            if self.isAuciton then
                if sending[v.name] then
                    Ver = L["正在接收拍卖WA"]
                end
                if sendDone[v.name] then
                    Ver = L["接收完毕，但未导入"]
                end
            end

            local vip = self.table2[v.name] and AddTexture("VIP") or ""
            local role = ""
            local y
            if v.rank == 2 then
                role = role .. AddTexture("interface/groupframe/ui-group-leadericon", y)
            elseif v.rank == 1 then
                role = role .. AddTexture("interface/groupframe/ui-group-assistanticon", y)
            end
            if v.isML then
                role = role .. AddTexture("interface/groupframe/ui-group-masterlooter", y)
            end
            local c1, c2, c3 = GetClassRGB(v.name)
            GameTooltip:AddDoubleLine(v.name .. role .. vip, Ver, c1, c2, c3, 1, 1, 1)
            if Ver == L["无"] or Ver == L["未知"] then
                local alpha = 0.4
                if _G["GameTooltipTextLeft" .. (i + line)] then
                    _G["GameTooltipTextLeft" .. (i + line)]:SetAlpha(alpha)
                end
                if _G["GameTooltipTextRight" .. (i + line)] then
                    _G["GameTooltipTextRight" .. (i + line)]:SetAlpha(alpha)
                end
            end
        end
        GameTooltip:Show()
    end

    local function UpdateOnEnter(self)
        if self and self.isOnEnter then
            self:GetScript("OnEnter")(self)
        end
    end

    ------------------团长开始拍卖UI------------------
    do
        BiaoGe.Auction = BiaoGe.Auction or {}
        if BG.IsVanilla then
            BiaoGe.Auction.money = BiaoGe.Auction.money or 1
            BiaoGe.Auction.fastMoney = BiaoGe.Auction.fastMoney or { 100, 300, 500, 1000, 2000 }
        else
            BiaoGe.Auction.money = BiaoGe.Auction.money or 1000
            BiaoGe.Auction.fastMoney = BiaoGe.Auction.fastMoney or { 1000, 2000, 3000, 5000, 10000 }
        end
        BiaoGe.Auction.duration = BiaoGe.Auction.duration or 30
        BiaoGe.Auction.mod = BiaoGe.Auction.mod or "normal"

        local function ClearAllFocus(f)
            f.Edit1:ClearFocus()
            f.Edit2:ClearFocus()
            LibBG:CloseDropDownMenus()
        end
        local function item_OnEnter(self)
            if BG.ButtonIsInRight(self) then
                GameTooltip:SetOwner(self, "ANCHOR_LEFT", 0, 0)
            else
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
            end
            GameTooltip:ClearLines()
            GameTooltip:SetItemByID(self.itemID)
            GameTooltip:Show()
            self.isOnEnter = true
            if self.isIcon then
                self.owner.lastIcon = self
                if not self.isChooseTex then
                    self.isChooseTex = self:CreateTexture()
                    self.isChooseTex:SetAllPoints()
                    self.isChooseTex:SetColorTexture(1, 1, 1, .2)
                    self.isChooseTex:Hide()
                end
                self.isChooseTex:Show()
            end
        end
        local function item_OnLeave(self)
            GameTooltip_Hide()
            self.isOnEnter = nil
            if self.isIcon then
                self.owner.lastIcon = nil
                self.isChooseTex:Hide()
            end
        end
        local function Start_OnClick(self)
            BG.PlaySound(1)
            local money = self.money or tonumber(BiaoGe.Auction.money)
            local _duration = tonumber(BiaoGe.Auction.duration)
            local duration = _duration and _duration > 0 and _duration
            local mod = BiaoGe.Auction.mod
            if not (money and duration) then return end
            local t = 0
            for i, itemID in ipairs(self.itemIDs) do
                BG.After(t, function()
                    local text = "StartAuction," .. GetTime() .. "," .. itemID .. "," ..
                        money .. "," .. duration .. ",," .. mod
                    C_ChatInfo.SendAddonMessage("BiaoGeAuction", text, "RAID")
                end)
                t = t + 0.2
            end
            self:GetParent():Hide()
        end
        local function OnTextChanged(self)
            BiaoGe.Auction[self._type] = self:GetText()
        end
        local function OnEnterPressed(self)
            if self.num == 1 then
                self:GetParent().Edit2:SetFocus()
            else
                Start_OnClick(self:GetParent().bt)
            end
        end
        local function Edit_OnEnter(self)
            if BG.ButtonIsInRight(self) then
                GameTooltip:SetOwner(self, "ANCHOR_LEFT", 0, 0)
            else
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
            end
            GameTooltip:ClearLines()
            GameTooltip:AddLine(self:GetText(), 1, 1, 1, true)
            GameTooltip:AddLine(L["最后20秒有人出价时，拍卖时间会重置到20秒"], 1, 0.82, 0, true)
            GameTooltip:Show()
        end

        function BG.StartAuction(link, bt, isNotAuctioned, notAlt, isRightButton)
            if BiaoGe.options["autoAuctionStart"] ~= 1 and not notAlt then return end
            if not link then return end
            if not BG.IsML then return end
            local link = BG.Copy(link)
            local itemIDs = {}
            if type(link) == "table" then
                itemIDs = link
            else
                itemIDs[1] = GetItemID(link)
            end
            if BG.StartAucitonFrame then BG.StartAucitonFrame:Hide() end
            GameTooltip:Hide()
            local name, link, quality, level, _, itemType, itemSubType, _, itemEquipLoc, Texture,
            _, classID, subclassID, bindType = GetItemInfo(itemIDs[1])

            local mainFrame
            local mainFrameWidth = 250
            local mainFrameHeight = 145
            local f = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
            do
                f:SetBackdrop({
                    bgFile = "Interface/ChatFrame/ChatFrameBackground",
                    edgeFile = "Interface/ChatFrame/ChatFrameBackground",
                    edgeSize = 2,
                })
                f:SetBackdropColor(0.3, 0.3, 0.3, 0.8)
                f:SetBackdropBorderColor(0, 0, 0, 1)
                f:SetSize(mainFrameWidth, mainFrameHeight)
                if bt then
                    if isNotAuctioned then
                        f:SetPoint("TOP", bt, "BOTTOM", 10, 0)
                    else
                        f:SetPoint("BOTTOM", bt, "TOP", 0, 0)
                    end
                else
                    local x, y = GetCursorPosition()
                    x, y = x / UIParent:GetEffectiveScale(), y / UIParent:GetEffectiveScale()
                    f:SetPoint("BOTTOM", UIParent, "BOTTOMLEFT", x + 10, y + 10)
                end
                f:SetFrameStrata("DIALOG")
                f:SetFrameLevel(300)
                f:SetClampedToScreen(true)
                f:SetToplevel(true)
                f:EnableMouse(true)
                f:SetMovable(true)
                f:SetScript("OnMouseUp", function(self)
                    f:StopMovingOrSizing()
                    f:SetScript("OnUpdate", nil)
                end)
                f:SetScript("OnMouseDown", function(self)
                    f:StartMoving()
                    ClearAllFocus(f)

                    f.time = 0
                    f:SetScript("OnUpdate", function(self, time)
                        f.time = f.time + time
                        if f.time >= 0.2 then
                            f.time = 0
                            if f.itemFrame.isOnEnter then
                                GameTooltip:Hide()
                                f.itemFrame:GetScript("OnEnter")(f.itemFrame)
                            elseif f.lastIcon then
                                GameTooltip:Hide()
                                f.lastIcon:GetScript("OnEnter")(f.lastIcon)
                            end
                        end
                    end)
                end)
                mainFrame = f
                BG.StartAucitonFrame = mainFrame

                f.CloseButton = CreateFrame("Button", nil, f, "UIPanelCloseButton")
                f.CloseButton:SetFrameLevel(f.CloseButton:GetParent():GetFrameLevel() + 50)
                f.CloseButton:SetPoint("TOPRIGHT", f, 0, 0)
                f.CloseButton:SetSize(35, 35)
            end

            -- 装备显示
            do
                local f = CreateFrame("Frame", nil, mainFrame, "BackdropTemplate")
                f:SetPoint("TOPLEFT", f:GetParent(), "TOPLEFT", 2, -2)
                f:SetPoint("BOTTOMRIGHT", f:GetParent(), "TOPRIGHT", -2, -35)
                f:SetFrameLevel(f:GetParent():GetFrameLevel() + 10)
                f.itemID = itemIDs[1]
                f:SetScript("OnMouseUp", function(self)
                    mainFrame:GetScript("OnMouseUp")(mainFrame)
                end)
                f:SetScript("OnMouseDown", function(self)
                    mainFrame:GetScript("OnMouseDown")(mainFrame)
                end)
                mainFrame.itemFrame = f
                -- 黑色背景
                local s = CreateFrame("StatusBar", nil, f)
                s:SetAllPoints()
                s:SetFrameLevel(s:GetParent():GetFrameLevel() - 5)
                s:SetStatusBarTexture("Interface/ChatFrame/ChatFrameBackground")
                s:SetStatusBarColor(0, 0, 0, 0.8)

                local icons = {}
                for i, itemID in ipairs(itemIDs) do
                    local name, link, quality, level, _, itemType, itemSubType, _, itemEquipLoc, Texture,
                    _, classID, subclassID, bindType = GetItemInfo(itemID)

                    -- 图标
                    local r, g, b = GetItemQualityColor(quality)
                    local ftex = CreateFrame("Frame", nil, f, "BackdropTemplate")
                    ftex:SetBackdrop({
                        edgeFile = "Interface/ChatFrame/ChatFrameBackground",
                        edgeSize = 1.5,
                    })
                    ftex:SetBackdropBorderColor(r, g, b, 1)
                    if i == 1 then
                        ftex:SetPoint("TOPLEFT", 0, 0)
                    else
                        ftex:SetPoint("TOPLEFT", icons[i - 1], "TOPRIGHT", 3, 0)
                    end
                    ftex:SetSize(f:GetHeight() - 2, f:GetHeight() - 2)
                    ftex.itemID = itemID
                    tinsert(icons, ftex)

                    ftex.isIcon = true
                    ftex.owner = mainFrame
                    ftex:SetScript("OnEnter", item_OnEnter)
                    ftex:SetScript("OnLeave", item_OnLeave)
                    ftex:SetScript("OnMouseUp", function(self)
                        mainFrame:GetScript("OnMouseUp")(mainFrame)
                    end)
                    ftex:SetScript("OnMouseDown", function(self)
                        mainFrame:GetScript("OnMouseDown")(mainFrame)
                    end)

                    ftex.tex = ftex:CreateTexture(nil, "BACKGROUND")
                    ftex.tex:SetAllPoints()
                    ftex.tex:SetTexture(Texture)
                    ftex.tex:SetTexCoord(0.1, 0.9, 0.1, 0.9)
                    -- 装备等级
                    local t = ftex:CreateFontString()
                    t:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
                    t:SetPoint("BOTTOM", ftex, "BOTTOM", 0, 1)
                    t:SetText(level)
                    t:SetTextColor(r, g, b)
                    -- 装绑
                    if bindType == 2 then
                        local t = ftex:CreateFontString()
                        t:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
                        t:SetPoint("TOP", ftex, 0, -2)
                        t:SetText(L["装绑"])
                        t:SetTextColor(0, 1, 0)
                    end
                end

                if #itemIDs == 1 then
                    -- 装备名称
                    local t = f:CreateFontString()
                    t:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
                    t:SetPoint("TOPLEFT", icons[1], "TOPRIGHT", 2, -2)
                    t:SetWidth(f:GetWidth() - f:GetHeight() - 10)
                    t:SetText(link:gsub("%[", ""):gsub("%]", ""))
                    t:SetJustifyH("LEFT")
                    t:SetWordWrap(false)
                    -- 装备类型
                    local t = f:CreateFontString()
                    t:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
                    t:SetPoint("BOTTOMLEFT", icons[1], "BOTTOMRIGHT", 2, 1)
                    t:SetHeight(12)

                    if _G[itemEquipLoc] then
                        if classID == 2 then
                            t:SetText(itemSubType)
                        else
                            t:SetText(_G[itemEquipLoc] .. " " .. itemSubType)
                        end
                    else
                        t:SetText("")
                    end
                    t:SetJustifyH("LEFT")
                end
            end

            local width = 90
            -- 起拍价、拍卖时长
            do
                local t = mainFrame:CreateFontString()
                t:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
                t:SetSize(width, 20)
                t:SetPoint("TOPLEFT", mainFrame.itemFrame, "BOTTOMLEFT", 8, -2)
                t:SetJustifyH("LEFT")
                t:SetWordWrap(false)
                t:SetText(L["|cffFFD100拍卖时长(秒)"])
                mainFrame.Text1 = t

                local edit = CreateFrame("EditBox", nil, mainFrame, "InputBoxTemplate")
                edit:SetSize(width, 20)
                edit:SetPoint("TOPLEFT", t, "BOTTOMLEFT", 3, 0)
                edit._type = "duration"
                edit.num = 1
                edit:SetText(BiaoGe.Auction[edit._type])
                edit:SetAutoFocus(false)
                edit:SetNumeric(true)
                edit:SetScript("OnTextChanged", OnTextChanged)
                edit:SetScript("OnEnterPressed", OnEnterPressed)
                edit:SetScript("OnEnter", Edit_OnEnter)
                edit:SetScript("OnLeave", GameTooltip_Hide)
                mainFrame.Edit1 = edit

                local t = f:CreateFontString()
                t:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
                t:SetSize(width, 20)
                t:SetPoint("TOPLEFT", mainFrame.Text1, "BOTTOMLEFT", 0, -20)
                t:SetJustifyH("LEFT")
                t:SetWordWrap(false)
                t:SetText(L["|cffFFD100起拍价|r"])
                mainFrame.Text2 = t

                local edit = CreateFrame("EditBox", nil, mainFrame, "InputBoxTemplate")
                edit:SetSize(width, 20)
                edit:SetPoint("TOPLEFT", t, "BOTTOMLEFT", 3, 0)
                edit._type = "money"
                edit.num = 2
                edit:SetText(BiaoGe.Auction[edit._type])
                edit:SetAutoFocus(false)
                edit:SetNumeric(true)
                edit:SetScript("OnTextChanged", OnTextChanged)
                edit:SetScript("OnEnterPressed", OnEnterPressed)
                mainFrame.Edit2 = edit
            end

            -- 拍卖模式
            do
                local t = f:CreateFontString()
                t:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
                t:SetSize(width, 20)
                t:SetPoint("LEFT", mainFrame.Text1, "RIGHT", 25, 0)
                t:SetJustifyH("LEFT")
                t:SetText(L["|cffFFD100拍卖模式|r"])
                mainFrame.Text3 = t

                local tbl = {
                    normal = L["正常模式"],
                    anonymous = L["匿名模式"],
                }

                local dropDown = LibBG:Create_UIDropDownMenu(nil, mainFrame)
                dropDown:SetScale(0.95)
                dropDown:SetPoint("TOPLEFT", mainFrame.Text3, "BOTTOMLEFT", -17, 2)
                LibBG:UIDropDownMenu_SetText(dropDown, tbl[BiaoGe.Auction.mod])
                dropDown.Text:SetJustifyH("LEFT")
                LibBG:UIDropDownMenu_SetWidth(dropDown, width + 5)
                LibBG:UIDropDownMenu_SetAnchor(dropDown, 0, 0, "BOTTOM", dropDown, "TOP")
                mainFrame.dropDown = dropDown
                BG.dropDownToggle(dropDown)
                LibBG:UIDropDownMenu_Initialize(dropDown, function(self, level)
                    ClearAllFocus(mainFrame)
                    local info = LibBG:UIDropDownMenu_CreateInfo()
                    info.text = L["正常模式"]
                    info.arg1 = "normal"
                    info.func = function(self, arg1, arg2)
                        BiaoGe.Auction.mod = arg1
                        LibBG:UIDropDownMenu_SetText(dropDown, tbl[BiaoGe.Auction.mod])
                    end
                    if info.arg1 == BiaoGe.Auction.mod then
                        info.checked = true
                    end
                    LibBG:UIDropDownMenu_AddButton(info)

                    local info = LibBG:UIDropDownMenu_CreateInfo()
                    info.text = L["匿名模式"]
                    info.arg1 = "anonymous"
                    info.tooltipTitle = L["匿名模式"]
                    info.tooltipText = L["拍卖过程中不会显示当前出价最高人是谁。拍卖结束后才会知晓"]
                    info.tooltipOnButton = true
                    info.func = function(self, arg1, arg2)
                        BiaoGe.Auction.mod = arg1
                        LibBG:UIDropDownMenu_SetText(dropDown, tbl[BiaoGe.Auction.mod])
                    end
                    if info.arg1 == BiaoGe.Auction.mod then
                        info.checked = true
                    end
                    LibBG:UIDropDownMenu_AddButton(info)
                end)
            end

            -- 开始拍卖
            do
                local bt= BG.CreateButton(mainFrame)
                bt:SetSize(width + 19, 25)
                bt:SetPoint("TOPLEFT", mainFrame.Text3, "BOTTOMLEFT", -1, -35)
                bt.itemIDs = itemIDs
                bt:SetText(L["开始拍卖"])
                mainFrame.bt = bt
                bt:SetScript("OnClick", Start_OnClick)
                if isRightButton and BiaoGeVIP and BiaoGeVIP.auction then
                    local _duration = tonumber(BiaoGe.Auction.duration)
                    local duration = _duration and _duration > 0 and _duration
                    if duration then
                        local tbl = {}
                        for _, FB in pairs(BG.FBtable) do
                            if FB == BG.FB1 then
                                tinsert(tbl, 1, FB)
                            else
                                tinsert(tbl, FB)
                            end
                        end
                        local itemID = itemIDs[1]
                        for _, FB in ipairs(tbl) do
                            local money = BiaoGeVIP.auction[FB].money[itemID]
                            if money then
                                bt.money = money
                                Start_OnClick(bt)
                                break
                            end
                        end
                    end
                end
            end

            -- 底部文字
            if BiaoGe.options["fastMoney"] == 1 then
                local tex = mainFrame:CreateTexture()
                tex:SetPoint("TOPLEFT", mainFrame, "BOTTOMLEFT", 2, 22)
                tex:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -2, 2)
                tex:SetColorTexture(0.2, 0.2, 0.2, 1)

                local buttons = {}
                local function CreateButton()
                    local bt = CreateFrame("Button", nil, f)
                    bt:SetSize(50, 20)
                    if #buttons == 0 then
                        bt:SetPoint("BOTTOMLEFT", mainFrame, 0, 2)
                    else
                        bt:SetPoint("BOTTOMLEFT", buttons[#buttons], "BOTTOMRIGHT", 0, 0)
                    end
                    if BiaoGe.Auction.fastMoney[#buttons + 1] == "" then
                        bt:Hide()
                    end
                    local t = bt:CreateFontString()
                    t:SetFont(STANDARD_TEXT_FONT, 10, "OUTLINE")
                    t:SetWidth(bt:GetWidth())
                    t:SetPoint("CENTER")
                    t:SetText(20000)
                    t:SetText(BiaoGe.Auction.fastMoney[#buttons + 1])
                    t:SetTextColor(1, 0.82, 0)
                    t:SetWordWrap(false)
                    bt:SetFontString(t)
                    tinsert(buttons, bt)
                    bt:SetScript("OnClick", function(self)
                        BG.PlaySound(1)
                        local money = bt:GetText()
                        mainFrame.Edit2:SetText(money)
                        BiaoGe.Auction.money = money
                        Start_OnClick(mainFrame.bt)
                    end)
                    bt:SetScript("OnEnter", function(self)
                        t:SetTextColor(1, 1, 1)
                        if t:GetStringWidth() > bt:GetWidth() then
                            GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 0)
                            GameTooltip:ClearLines()
                            GameTooltip:AddLine(t:GetText(), 1, 0.82, 0, true)
                            GameTooltip:Show()
                        end
                    end)
                    bt:SetScript("OnLeave", function(self)
                        t:SetTextColor(1, .82, 0)
                        GameTooltip:Hide()
                    end)
                end
                for i = 1, #BiaoGe.Auction.fastMoney do
                    CreateButton()
                end
            else
                mainFrame:SetHeight(mainFrameHeight - 20)
            end
            --[[             do
                local tex = mainFrame:CreateTexture()
                tex:SetPoint("TOPLEFT", mainFrame, "BOTTOMLEFT", 2, 22)
                tex:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -2, 2)
                tex:SetColorTexture(0.2, 0.2, 0.2, 1)

                local auction = CreateFrame("Frame", nil, mainFrame)
                auction:SetSize(1, 20)
                auction:SetPoint("LEFT", tex, "LEFT", 0, 0)
                auction.title = L["拍卖WA版本"]
                auction.title2 = L["拍卖：%s"]
                auction.table = BG.raidAuctionVersion
                auction.isAuciton = true
                auction:SetScript("OnEnter", Addon_OnEnter)
                auction.text = auction:CreateFontString()
                auction.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
                auction.text:SetPoint("CENTER")
                auction.text:SetTextColor(0.7, 0.7, 0.7)
                mainFrame.auction = auction
                UpdateAddonFrame(auction)

                auction:SetScript("OnMouseUp", function(self)
                    mainFrame:GetScript("OnMouseUp")(mainFrame)
                end)
                auction:SetScript("OnMouseDown", function(self)
                    mainFrame:GetScript("OnMouseDown")(mainFrame)
                end)
                auction:SetScript("OnLeave", function(self)
                    GameTooltip:Hide()
                    self.isOnEnter = false
                end)
            end ]]
        end

        -- ALT点击背包生效
        hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", function(self, button)
            if not IsAltKeyDown() then return end
            local link = C_Container.GetContainerItemLink(self:GetParent():GetID(), self:GetID())
            BG.StartAuction(link, self, nil, nil, button == "RightButton")
        end)
    end
    ------------------插件版本------------------
    do
        BG.guildBiaoGeVersion = {}
        BG.guildClass = {}
        BG.raidBiaoGeVersion = {}
        BG.raidAuctionVersion = {}
        BG.raidBiaoGeVIPVersion = {}

        -- 会员插件
        local guild = CreateFrame("Frame", nil, BG.MainFrame)
        do
            guild:SetSize(1, 20)
            guild:SetPoint("LEFT", BG.ButtonAd, "RIGHT", 0, 0)
            guild:Hide()
            guild.title = L["BiaoGe版本"] .. "(" .. GUILD .. ")"
            guild.title2 = GUILD .. L["插件：%s"]
            guild.table = BG.guildBiaoGeVersion
            guild.isGuild = true
            guild:SetScript("OnEnter", Guild_OnEnter)
            BG.GameTooltip_Hide(guild)
            guild.text = guild:CreateFontString()
            guild.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
            guild.text:SetPoint("LEFT")
            guild.text:SetTextColor(RGB(BG.g1))
            BG.ButtonGuildVer = guild
        end

        -- 团员插件
        local addon = CreateFrame("Frame", nil, BG.MainFrame)
        do
            addon:SetSize(1, 20)
            addon:SetPoint("LEFT", BG.ButtonGuildVer, "RIGHT", 0, 0)
            addon:Hide()
            addon.title = L["BiaoGe版本"] .. "(" .. RAID .. ")"
            addon.title2 = L["插件：%s"]
            addon.table = BG.raidBiaoGeVersion
            addon.table2 = BG.raidBiaoGeVIPVersion
            addon.isAddon = true
            addon:SetScript("OnEnter", Addon_OnEnter)
            addon.text = addon:CreateFontString()
            addon.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
            addon.text:SetPoint("LEFT")
            addon.text:SetTextColor(RGB(BG.g1))
            BG.ButtonRaidVer = addon
            addon:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
                self.isOnEnter = false
            end)
        end

        -- 拍卖WA
        local auction = CreateFrame("Frame", nil, BG.MainFrame)
        do
            auction:SetSize(1, 20)
            auction:SetPoint("LEFT", addon, "RIGHT", 0, 0)
            auction:Hide()
            auction.title = L["拍卖WA版本"]
            auction.title2 = L["拍卖：%s"]
            auction.table = BG.raidAuctionVersion
            auction.table2 = BG.raidBiaoGeVIPVersion
            auction.isAuciton = true
            auction:SetScript("OnEnter", Addon_OnEnter)
            auction.text = auction:CreateFontString()
            auction.text:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
            auction.text:SetPoint("LEFT")
            auction.text:SetTextColor(RGB(BG.g1))
            BG.ButtonRaidAuction = auction
            auction:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
                self.isOnEnter = false
            end)
        end

        local f = CreateFrame("Frame")
        f:RegisterEvent("GROUP_ROSTER_UPDATE")
        f:RegisterEvent("GUILD_ROSTER_UPDATE")
        f:RegisterEvent("CHAT_MSG_SYSTEM")
        f:RegisterEvent("CHAT_MSG_ADDON")
        f:RegisterEvent("PLAYER_ENTERING_WORLD")
        f:SetScript("OnEvent", function(self, event, ...)
            if event == "GROUP_ROSTER_UPDATE" then
                BG.After(1, function()
                    if IsInRaid(1) then
                        C_ChatInfo.SendAddonMessage("BiaoGe", "MyVer-" .. BG.ver, "RAID")
                    else
                        UpdateAddonFrame(addon)
                        UpdateAddonFrame(auction)
                    end
                    UpdateGuildFrame(guild)
                end)
            elseif event == "GUILD_ROSTER_UPDATE" then
                BG.After(1, function()
                    for i = 1, GetNumGuildMembers() do
                        local name, rankName, rankIndex, level, classDisplayName, zone,
                        publicNote, officerNote, isOnline, status, class, achievementPoints,
                        achievementRank, isMobile, canSoR, repStanding, guid = GetGuildRosterInfo(i)
                        if name then
                            name = strsplit("-", name)
                            if not isOnline then
                                BG.guildBiaoGeVersion[name] = nil
                                BG.guildClass[name] = nil
                            else
                                BG.guildClass[name] = class
                            end
                        end
                    end
                    UpdateGuildFrame(guild)
                end)
            elseif event == "CHAT_MSG_SYSTEM" then -- 如果团队里有人退出，就删掉
                local text = ...
                local leave = ERR_RAID_MEMBER_REMOVED_S:gsub("%%s", "(.+)")
                local name = strmatch(text, leave)
                if name then
                    name = strsplit("-", name)
                    BG.raidBiaoGeVersion[name] = nil
                    BG.raidAuctionVersion[name] = nil
                    BG.raidBiaoGeVIPVersion[name] = nil
                    UpdateAddonFrame(addon)
                    UpdateAddonFrame(auction)
                end
            elseif event == "CHAT_MSG_ADDON" then
                local prefix, msg, distType, senderFullName = ...
                local sender = strsplit("-", senderFullName)
                if prefix == "BiaoGe" and distType == "GUILD" then
                    if strfind(msg, "MyVer") then
                        local _, version = strsplit("-", msg)
                        BG.guildBiaoGeVersion[sender] = version
                        UpdateGuildFrame(guild)
                    end
                elseif prefix == "BiaoGe" and distType == "RAID" then -- 插件版本
                    if msg == "VersionCheck" then
                        C_ChatInfo.SendAddonMessage("BiaoGe", "MyVer-" .. BG.ver, "RAID")
                    elseif strfind(msg, "MyVer") then
                        local _, version = strsplit("-", msg)
                        BG.raidBiaoGeVersion[sender] = version
                        UpdateAddonFrame(addon)
                    end
                elseif prefix == "BiaoGeAuction" and distType == "RAID" then -- 拍卖版本
                    local arg1, version = strsplit(",", msg)
                    if arg1 == "MyVer" then
                        BG.raidAuctionVersion[sender] = version
                        UpdateAddonFrame(auction)
                        if sendDone[sender] then
                            sendDone[sender] = nil
                            if not notShowSendingText[sender] and sendingCount[sender] <= 2 then
                                BG.SendSystemMessage(format(BG.STC_g1(L["%s已成功导入拍卖WA。"]), SetClassCFF(sender)))
                            end
                            UpdateOnEnter(BG.ButtonRaidAuction)
                            UpdateOnEnter(BG.StartAucitonFrame)
                        end
                    end
                elseif prefix == "BiaoGeVIP" and distType == "RAID" then -- VIP版本
                    if strfind(msg, "MyVer") then
                        local _, version = strsplit("-", msg)
                        BG.raidBiaoGeVIPVersion[sender] = version
                    end
                end
            elseif event == "PLAYER_ENTERING_WORLD" then
                local isLogin, isReload = ...
                if not (isLogin or isReload) then return end
                C_Timer.After(3, function()
                    if IsInRaid(1) then
                        C_ChatInfo.SendAddonMessage("BiaoGe", "VersionCheck", "RAID")
                        C_ChatInfo.SendAddonMessage("BiaoGeAuction", "VersionCheck", "RAID")
                    end
                end)
            end
        end)
    end
    ------------------给拍卖WA设置关注和心愿------------------
    function BG.HookCreateAuction(f)
        -- 关注
        if not f.itemFrame2.guanzhu then
            local t = f.itemFrame2:CreateFontString()
            t:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
            t:SetPoint("LEFT", f.itemFrame2.itemTypeText, "RIGHT", 2, 0)
            t:SetText(L["<关注>"])
            t:SetTextColor(RGB(BG.b1))
            f.itemFrame2.guanzhu = t
        end
        f.itemFrame2.guanzhu:Hide()
        for _, FB in ipairs(BG.GetAllFB()) do
            for b = 1, Maxb[FB] do
                for i = 1, BG.Maxi do
                    local zb = BG.Frame[FB]["boss" .. b]["zhuangbei" .. i]
                    if zb and f.itemID == GetItemID(zb:GetText()) and BiaoGe[FB]["boss" .. b]["guanzhu" .. i] then
                        f.itemFrame2.guanzhu:Show()
                        BG.After(0.5, function()
                            f.autoFrame:Show()
                        end)
                        break
                    end
                end
                if f.itemFrame2.guanzhu:IsVisible() then break end
            end
            if f.itemFrame2.guanzhu:IsVisible() then break end
        end
        -- 心愿
        if not f.itemFrame2.hope then
            local t = f.itemFrame2:CreateFontString()
            t:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
            t:SetPoint("LEFT", f.itemFrame2.guanzhu, "RIGHT", 2, 0)
            t:SetText(L["<心愿>"])
            t:SetTextColor(0, 1, 0)
            f.itemFrame2.hope = t
        end
        f.itemFrame2.hope:Hide()
        for _, FB in ipairs(BG.GetAllFB()) do
            for n = 1, HopeMaxn[FB] do
                for b = 1, HopeMaxb[FB] do
                    for i = 1, HopeMaxi do
                        local zb = BG.HopeFrame[FB]["nandu" .. n]["boss" .. b]["zhuangbei" .. i]
                        if zb and f.itemID == GetItemID(zb:GetText()) then
                            local hope = f.itemFrame2.hope
                            hope:ClearAllPoints()
                            if f.itemFrame2.guanzhu:IsVisible() then
                                hope:SetPoint("LEFT", f.itemFrame2.guanzhu, "RIGHT", 2, 0)
                            else
                                hope:SetPoint("LEFT", f.itemFrame2.itemTypeText, "RIGHT", 2, 0)
                            end
                            hope:Show()
                            BG.After(0.5, function()
                                f.autoFrame:Show()
                            end)
                            break
                        end
                    end
                    if f.itemFrame2.hope:IsVisible() then break end
                end
                if f.itemFrame2.hope:IsVisible() then break end
            end
            if f.itemFrame2.hope:IsVisible() then break end
        end
        if f.itemFrame2.guanzhu:IsVisible() or f.itemFrame2.hope:IsVisible() then
            if not f.highlight then
                local function Create()
                    local f1, f2
                    f1 = BG.CreateHighLightAnim(f)
                    f1:SetFrameLevel(120)
                    f.highlight = f1
                    f1:SetScript("OnEnter", function(self)
                        f1.flashGroup:Stop()
                        f2.flashGroup:Stop()
                        f1:Hide()
                        f2:Hide()
                    end)

                    f2 = BG.CreateHighLightAnim(f.autoFrame)
                    f2:SetFrameLevel(120)
                    f2:SetScript("OnEnter", f1:GetScript("OnEnter"))
                end
                Create()
            end
        end
        -- 过滤
        f.filter = nil
        local num = BiaoGe.FilterClassItemDB[RealmId][player].chooseID
        if num then
            local name, link, quality, level, _, _, _, _, EquipLoc, Texture, _, typeID, subclassID, bindType = GetItemInfo(f.itemID)
            if BG.FilterAll(f.itemID, typeID, EquipLoc, subclassID) then
                f.filter = true
                if not (f.player and f.player == UnitName("player")) then
                    f:SetBackdropColor(unpack(BGA.aura_env.backdropColor_filter))
                    f:SetBackdropBorderColor(unpack(BGA.aura_env.backdropBorderColor_filter))
                    f.autoFrame:SetBackdropColor(unpack(BGA.aura_env.backdropColor_filter))
                    f.autoFrame:SetBackdropBorderColor(unpack(BGA.aura_env.backdropBorderColor_filter))

                    f.hide:SetNormalFontObject(_G.BGA.FontDis15)
                    f.cancel:SetNormalFontObject(_G.BGA.FontDis15)
                    f.autoTextButton:SetNormalFontObject(_G.BGA.FontDis15)
                    f.logTextButton:SetNormalFontObject(_G.BGA.FontDis15)
                end
            end
        end

        tinsert(BG.auctionLogFrame.auctioning, f.itemID)
        BG.UpdateAuctioning()
    end

    ------------------拍卖WA字符串------------------
    local wa
    -- WA字符串
    wa = [[
!WA:2!S3xAtUXXvcAp7hMi6y)Gxpr4VS7hqGnKfGiAi0nvtlXLKX23ST6doDdkUZYGbuHgf6UgIUkmOkqPwY0bfLL5HenLff1LPSUT1iBrjRzSefpKIy(fWq)e80aDZp5iMFbBEuh5XlZQkaqj5zndjsuv9YxM5lF5lF57iZV7mF)n((1((1o7)RwoT9AyzB2APdxE(5wC632Avh7vCA3AvZV7xz02BDNwl10ZYX2DOpPMLBZggBw28X9(BE7vB765Sb53FL76g1CES)HLQx3107)X35tmSxfvUd5yz7vDYPxS80l)vR640abJ9kpMvtZhTzggCvPUtRnm8Q0SIN1gM(p9DB(9IQHd3SMHNz12K)5FlavtxBnZ1Na3EF0t71YAT1mB5U4pSL)p)nt4TztZjABB59NA7AwXOXJzSPRxR2Mp6FYTDvZtyA7Ts761TE8pPYKJVs5kRuE8LlVm59V9Ko21Si96B)3vf3onBDA3MMnAmxn3HongDy8gHOd1YeHOLx5qtp)8lBBSHP7qVDnudUE9YOgrRdo98hAMdp)l022VXrOL)JTTx1Z6eMJAyVzZ)BgKFxM(9fCQz(7)onZQMkTHtTkTquJh9)arKnBzB04rqDFul(s)hh30S54Ow7QElBG6dR)cg2wBG)L9Ew21ZOL3m3(7pHTJT5)MPHR5kETmTxZB9)2VQw7weOQGjCTCnre2AUNgddUtC77BInmSSrL9233T31F7TlC7HVDXBFFvRBzB5UU4RxEvNgoT(X)xq)briCn8W42C9wBs5ro4)7h9)7hCQVZ35VzI6o2En)EZ0Y6jY8332OgckJmLl)2iQPzTJyvZB9F2)1M)3bidR6)dulyDtR1w37P(tiUvhC)Cvs5MyC0Jt0WXO2N2YYEneFEZFqvx0VAyorldRAVaEuSbA0RX6v9mAGge)blVr7gEwdT8QnmCD)b3E8HEbmGvA50WCOpbdUpEE0VYYgriTx1KqQgIGkBeQAT(ey6oUOVDnleV1QieU5p827h1gB5yTk69t4A9eMyaAHhWrmy7525)bNUMtfxN221qSZi(QF4lGEMY9)OvP)7P(U)DxjtMmnCw1OrgdeXSIP9jYS)OF60kZtEYHqGe(QIO2dcISNy0Ipq2HiFQoHJZXocMzn9q8nl2EJCOPg5jaH)tlt0aMDgph72Bu1Sf(JO(Ere1D11XpuaH2C3tTDDpfr)v(S5ZJR)sKIBAxJwzw1Zy74LPYSfNy2XZ4TUPDi69F3(dAYrVR4mTWZEI(KzdxZqyqOeOLZ2HZNzF7hcgFStGGRPe1BdFvypWVk9l74Tj0UfWtcWnsz8OaW9EqRAM5YZHFz0pnsoIsuI)4EpSDlZ1SCrZ2hVrd8B8CJfR(Ktj8ILcNJdgzmf8Vr0oggo8JSFfGNCiE2XXRvZXEY1nSTnBG5lNWYWzwtFIvwcStwb9DV5SR7uC5GUkUuly66ASMjvkBoqmMNwB0jiZJWpskZgMEiXjvByM7jpzHmpzeRgAICnZhhbuWeICeWkK54MBMhG1anrGodihhabeOtMpKJphILBECBanGNz)OE5tSE5JKvGNB(JMD8gE7A7t)5DoZn6EUlSZtFRTFX3O7LpB2JHjm4VDNB8R7EPZZ9n2I35IFq3RCUo)Q3(ox(l7E2xA7Z9p35spvNZ(ZVZZCHDo1ZG(u3x)PVZR(8DU4l19tpB3N9cDUWlrXTFbVYRCNl)zWf83FE2cUZ)Y7WvXDFZpV7fU6w36n3(1(zDoZ136gFwNZ)(Dp1t19f)8ox8v682)6oN5ID(8NPZ1)n06dd)LETq4780FENN9YDFMNfb)ox98i47ETFLp8SvdUB9CNRZf)OTUX715l)D35uVXoF8t39Y)RO6R7BEtkQX9aby(GVebdQoWWWrUUY7VZxCPopZ719T(5BDRVC7x897EJxBNBD1T(83avEvvaUu38A8L6l25MFaxPuvLh4azq96m7BFuCf9ix76SV3wx)6568CFzNN)c59Rv(3XrvUYPUZV7v266)Io36sDo3f4igKp19LU52x(trFcObfwy8W(hEo0p25p(zOryeweqbfa0pOaGWLaVNmtLcULDENNz7B8lPaTZ786B)Ppf3N)jRwV(mZm1iLkX2H(Z381(jTOLjca2Uffayef2NaXsyhshkOS1Djud0CcqerzLfGbgD7ldDOS77)wDU5fZCazKbabh9M0E8P0K6LFg5h(oDU21OL1Foh7B4Wet14Jp23Wc6t2YBKtshJ7CZt153(SKxK5ECZWsHrpsHP7l)POPSK34IaII8aCG4kUZl9SY4GooqXbcMUV6PrtPJWbxNKulBFJl191Fd)ojPmB)hFE8BKP8Lq)P7F8Pqqjn(j(jHU9p6K0ps(jBFr6dI1APsyK39Sp)wx)DL5az)QsoqkqB95FCNR(PGLFNp5Zc)KqdFp(JxOQOZ5FdYlW067HBazp(diGajtXPZSzP4(VrMOXapePJPWGeqQazuhtL0yQS3iauj4LU0Hgerx3iEerxEgd37EHoN9tzfr15Z)u8sDN)n9XizXAeK78UNzN35wSYQ26A)gFi56SN)v6Cr)cJ(92V055NN(hUmAsN)m0)WLrtEagAOJGSdn(VHduchRpq0FZjF(QFX236QD(YNE7N)NZsI259)WW3dTCksIWZ)r7CMpaT2pR0j8S8l)g43)SxgqsfD0xUyrVhSyYfqjOh4ayzFOLTzks0kWrFlOWIlhZqiUZl(uDU6RT11(q)2idT4o)IxY)t67DDE(FbvbUT(YRI035F)uNwv)TZx8CIqYH6FZP7(RVsNZ(7qkg4V60h9Ii1jWlx)YiHbpNFTEnSIzuaqVS7hDXU)(3cX6HECRRDD0IvBDRFbvxl0xPGT11UWw381O6fGklIFa1ZWQQXqjIA3(nJ3J2mWeJWMXREA)MbQl95)oAZGiLlQzGEC7td0mqVh1m6ELNMQ9bUz8(FiBZGs1LiksCTk5xr1zNp(IukbTMr0JaXtHFepoW8rwe8NV5zVh3)8nphTeHpXvhFYBH0EoCaYh3FYle(sPzde425QFCNBDz2f3359FL78C)mHPPrab85)9t9u0VH)H869SR0d2c(cuhgj8IVr8HOXk8l53tVSbewE2jYTU5JxiZ4nAUUr0EJOBeRLzn8wXOwpWTDvkOJuiZOIqUwlt0(FLHD3fY8aIWwTrBtaqhRqM9KFigByGR7qtyGEevZ7jFM7pZOJnwiub1BiCKxabPFTgci(zw4y39nHyOYqdzinf)6HIfc8r7RK1MhAkh4o2vmoTIP3KyZAn5mZKdBGYczOM1SqgSjSYZ24XVG02dQxm8C2xGomuPqgILYyllfPa2XWhweb8W2w0MsokW5v3VblfU1aB2dAZIy5rstgXoNLTXrXLuBJPye7g0WCvVCpqHmZgqYWFjhPW55Toaxv9twnBMIf9Xd6hK3J(3SSQQXmAgw4c0Fg7WpfwMUK0W(WdNbP5)DoZfjpvZjeYq2aIvghb1CxzPdV4up8CLlo7kvkpx55NUYshQ8ClTyLLEymAqAiDNx8Q35n(x6E5ZQalJIWYy75Hg7H2DgW)GBmx4mBF9FRkSm7Ytp9I42swQUTzLbz5PNIaavR9SdjdXrMBQYhebYUhPK8hp40Zn7blJ(6iLgdc5hA6XlJ69lmncKrHk)Ctn9mlp(ctha0ULHXS2AMRy9eywGrlculvnw941A50CsF(RNmtPc()xX9K5KQlWeoTQz2kQyJqeCIk2i6kfb(k1TA4zslwrKyXW)F3jScvHafvT(cv8bJVbpN7cMKcYTWcIX4HEi04oMuLpPn9quvslbdBA)LDWMyeBVrQbNLHAblBRfCSn3SCvSrlFYHe5W)4lITKYh9EufrOQJXQ5vOMo(k(W8soC9Kz2nT9IASfe(YiLWFQe43gRe9J0)cSS4VnMsagRuagOGPaf0pQceBRgfcQk8)WcXjLLr9HV8w36sIYO4fdNDwNg1g5bZIHNyKAhBp6RK8yq4xqfBYwMgEM4xLlBWhJelNxDz3lAbsS)LOc7X8nfFWrr)DmfHutRuE8fNA8LNQs5P))uUYmlTyzev4brIQ99PAwgTse6Ltz5k0jjVbQsjFO36IKIY3dJMGQVejTdQP)nMu)Bmvv5y9E)BSu3)gtF)BSenaolwDmHUO)7a5COFQh5uPfMVJ6lLlUc0V9ZhBDlptH(P)7GQ5Jq)uV1p9lS0us8)fxbsA)mg1LNZDz06dZBAGwwrspvFpBQsxx)3t1zDrKsB5YsFvwLERlOi7NF9jA9RCFe4Gzin7baTY48Fn0zYPT3qCvmeilmF(bwpLgWilZTepJVsjE)uHMa5HvvWFOy)4L6autyEHVGidZ5oNnUfKBeG(vDerWcRykzBgl2EJzXbwWcM4Dw6Mlp76I8tiPBcOLH9XlKbTZxs8iuidjog83S0O()BHmpbsXLczCSXX3tbj8z5ofQpHWLd2ZNwiEd8gr2OQH3YO3GABOgMaf0kVmwQt3OJupm4p(BpcTzD3MnSqcbggPoh)E4K7Lgs6AbGscPqjqysecicLsjqbuqCdmGyQeycrgbjLyRem6Gaco)rd9agaNAWWJIiOidMkbIoiJat1On)Oocq)HF10pktaH7qd2iC(eMh19twMQOhaH)KGVL4D(Iw2UMT8unVTqgdyokehkLxaTbn1SPAMWJyZalcRypHkKqxswDrfDKM6q8DCXRIqyuSc6JSHqbCWtGwzCHnFeKmDI9kkq(h2a9a99LhFUPuiYNilRqguV2oJvtdlKam(ilruAM)so1rlinTDTmg4)NBnQ8W0U6fxfh0vn27kR78y5Yd8DCiGHvzyI2EEo27DYgMg4GLHejIUjPeiniiaNlB5Loesq1dG0Ay4r5lOK9z4ABcb7ZDX2wjGMgZWscwMejH3p(BSSxBMwoBqwVss3aXvYcwvMT2cXjImWHwSjtzx9Uxyo5qywzUXjRu2AdZwfhVosyawtXW46HN8ORrw3GDyf1YIvhr8iDLLSNSH1QhpNRzJ6I7cQo1CI1l68y2MTyPQyw)v2WOrJJyzxZ5Xa0pqaaX2hzXleQd0rohJxfZpK4ST(E2vQz5fLrjZmlxj1l2WzT4az12TAzA7rSjdn66abZZPPEqeKbPGISXMeSmDnlpqYIuVeTpKni15ObWZdaE8cBTWC8gWSGOnlZRcV6LBWciN4I5NEMYOjo1rZDIEs2gM7cRq6W1lUoAeDVOzihKeATioMHZS7KuttSu5YlTWY4EquTf84Ws1h6DJnMs8wehA3PRtZueWUFeKCeIsCBGoj4uOJQaVSejgQjHed(Le2iMq2SN5AB3e92CGLPiDV2AWo6x4n3HN9LcInBPIHEh1y4zkgvErm2svDTK3CqWIAeQHSQrR4qggKESJaXdXJoD8m8FJhxscFLxCGBfwO1gccPer5reXYGrPCCs4LKOdcdVeD4QqsIoiy8s0bbHvAniamsN9)EcLop6UhmcKtNiSbKupiXUsV7RrXFOftGAsQGExz61glKysFZiQxG)GuAymsqyKdwAqkgCqZfWHv(HFO11JfZ)LJW4u29y1j8qnm2CfSVYZj4a(y3BXKe5Uk2DbX4IJ3W7Hn3Ck0wlGuOVx2LfTodsiJitbiPxC0EAqRbqGEUPK3uwciajCBQHeJPXP6wk3QfRj9jsuifxMInlEQRJtdpRMy2KLW4jhwd2XxCYdU0YvavvuAP54WIIv4z4zyXazcY8w2MStoybancI)mPpHfAswUpFGio0)HvmqFr1Kmku5Ku)GMqu1tjMcUsgJ9VuxvmBctddZ8SADOGVHWTy56)rrDO(RCv(JNCrPOeJflj5)jrBpxSDwlPNqWGFPWMSaxOJWZiGPlmv0bYmYyjRIYwK8NS6qoRxzcQHHZmYdui8jaFYavzwyjNHHLj630IFuRJvCdS6PKxrYD1CCHwAbga9DshHsdp)tYAFsBsiYdt)Lrhqb3AVnJFEtJtyg3mEEtQXwPm7EqtL(JTmq)NDocvbB0XATlKPIu8usEdjza3vwLE4Ksz3fbjIm8riyyaeGaGw4HjfgnTOeS5S4QPH5RjMAJ2DWvhgI8eZZtF1pfXnLiuZelEkTEOFrk1p2VgXXsQYGrabApviUF3jkWDjVGjJLzK3Zss8DRXjyCRbyyHPY9gN4OJCmCLqR)9rFg2oJ4HT9Jay0Jj9TQTmnoEIM04tqtc3zHOEQgQlAYaXkdGkC5VxBw6kVsiGey296ZT2kvYIIrUG6AyUYpWhO4AC6gVcNXHbA3htTJ(8hsWaj7fpOjfmfs2E)Q89xQIaegTvyLrfnsGhbN0KOWuEKSKdp3HmWufUxpOctd8MU6nT6HCGcKBP6xv1WWoq0wJhrdyf2q1YCis5eBo3u5ORYHEAUPIvf6WntoPJTxlNgA2qjo)bA3Y1PvUSZHhVQBSQ59tFZ9pNn50grH7H1ROnhVWCQGc1iNywWL(My2I4ouLXB04GOr3g4ry4jKqqsPwnSSpUEh74xrMEh0Y1ZPLV8iLvdpCWdj9WSx60fivBuO7sc06rj9NhSOHFBRg5t24cX)OjACrcYCjz4axQenEicyU(AuiYRX4TGfCO5eHsFlnXplJkpZdrxlnKKjPwz1wwn9YLDjBACRLLXb2u5gMnmA6AwJVDJXMhsLr)pcKtlTmXhzp(oHpyzAFv3ZEpf3D9SrDa0QREcEikkwSIq09hwaaqRuiZggKZvdsxdTKbA93fmE8hXOrBtrd8rlc5adjZ9HlhS96iLn3jK8EButAF487q5k11l6Nwcy9yXl3NRU)UtiVj8H9dfIJ5vV2E0ONNHxB3jm49dh7zIIygsKpFY1gqv1msqsKuQ4EYpuscBO6fdjz4OLqoG3LSzQIsPmeBhTeyiHRS)9FQhDgzWo6Wh7Z9YOdqaqRoogaBm5IKDudj5iegSpAgjpXGXUzZRctSIrgs7S5sjjCmugNvWn9SLCZg7IkCTIHlvCmvne1cUjlpgBRszJhJyLFKgQkaE7fYxTkIFypI0zghHgfF(RqpIJKRzpT8v7w9S(Wch5dNe5XfCUon8ya9bIedi5d)uCUEQwCGhxCsXD(jKxFbuKKfQDHDG7)cQnnNmietRrTgHQajvVaq9HyAKpZv3M4pQrizRk6B8baQFEAsnkiZ5AeCJwPSYEUjvNg(kIjUG2qGngfufuq0fvEsRAEhSykX3eD26LGYF0av9pgzMg2GOJM62mCEOeZ4n2rFyV(f4NViB0g7PddX0Tw4CkiGHRqiRjSN90gGYQyb4Ng6F2KKOjGk1pjztaHoqGIB2NcE1SzZ)14WM8PruWqvVmUaXXXh7Sks9zLruR02iPlesKRNRoOQpA38vS2CNDKUYs2l4021KyZcaB9hApRO1PdHpB(CkoUg7PMWHBMgdyvhOrD4M9rtYxXiuRHmLzDd71mRLMwKctLR1KUKLNihOSACkX(cMKbpjGno1IDNiuV7GNVSaT)U3PSCjNVJ51QPWpnDRDcurfRz5wxvAhORmf9qDmefnUdGV4n0lKmvqQNQDkit9M2wbXtjfiMi923ds(J87x9qFYhl7XXX(JVs7WDAgQ5pOghydOa0CfETrM6KqktYhHsd9loAx0AFkpZMkOQRQXI8jKSM45ijD(HGNis(8cSJ7ai3arcmd8snvW8ZHUa94nA4BQx3CPy1fYkvhzDtZg(gMSMzdpPt9jF)vJDxnB3NalEJmaoroSi7kRYt0yTEbx7QBPXTLslJ5xcIBW9)TUHWi3HLiV2YfO2Yo2wmWUO(VnfJyqoxtPdQOKTi3ur3wUKFQgKHOwSrGK2dgYKgHAcIIu7skn00y98sLK75L4dQKEjAh1YIx0eB1m9UNVsHGyraielOOTaTIfI0I4cqTELrkmlTOQzgyKy2mhngTdWGe1IdIcNKozoMOIl6KZlWYj0)WB)KqsOF1ua3eYRJ1vsoVV7CkKzTczQsdQlmLuuwLChfw8uiE8TRLw7IQAYSFfH75ziDyAeM4JCOW9s1m8uCMIRJQPPk0EOWQDKi(OsRNfOentp1PqAFmt)B6PurTq1R6Xnrjg96IdxqYT6rvK6Vq6pA4wLrlGCsS)7QudFeLvI5aMlqXH7cop2NfHudyUcSAL1YfZoTu5lKuQBKF97L5a7N2RbRusRh)1Hr0KrGtqHy4laMPOGhrI)q)s09IvTe4nKSMusiYAp8pd3NspNW6YBnslRHcdkX7dpvYO61myHP1Pl)vQhL2kmh4fbICamQkFRMOPYmoR2wmIg0iBao3ZJebtVmuy(zrh6TUfWRksQd4jg(hsqT3GE03uZzJCJuc(u7bbZ(ugqVCDNzSqBRCIzpAwsVPYbB7wfH6jD2WCjAEcb1(og(qfXaF6SKn)GomgrZeObYds6M)WMIJ1QeCql0oYI1WMSimfz1bkNT1dw8B)z4dR1K4OcvxhgbCOSbAu4HZf9hS1tKhZy1MN9uawKIP90oiGxvmUW4o7YsIX507bqT3ah9J3jRZMpOCHcIMdK08AWbqQ3h7PsAELCwdIwhm2giTtYXbbcPlInpxdCKaSu1)r8PKS8znOIeiV3kS8bGtpGeHdvKEahE(N8uuV5wiZtMHB6DHOdjV44prmNbmYTYIV3OuxnJExPEKuHMS2(go1iQXBy7yV5ginqYQkWx6NjVax4raHlsIP1ShW9Nmrhxn9tJpMGqi5nBEzZNuFmjLcwcT4Lns7GhztReiLXkxFjLunw7DzLPfNdW2CsKBsojAZR50yQhlE6KDQenPs6jawGNkMYXWbmB2aL)6UgJvpZrbUgwFVA8aBf5b1QYIYk5dKfCc(QjMvyIMFphMTnMtEJ8XySi4qVGtz68jZet8732Yf308ThhvO)b2V)iWcQ8Eiz4XYRHP4sCq30t5tsHdDxQ4XHU)becPvIau9reu0qC4HreW9hLMsQWfSHecmjU48M19ONWonx3i3i6bMKhyjg6fSQvRHPgW9hQGoJ(GMXeoMelbGVCKR14CsFzwAS5ge9U4NPqMxB3kr(dxQebw8bi35fOAwUZ7S6Xj3bpqKfIGmqpwRCYsihbEsk3bonBuMJnKe)Tam798H0CgfP1duHZNotuWAYTu7kVVXCrljsmcZEH()O4qNT07LdowobRmUCbuRwL(dxH4zfgJMnklsCvkAKywKKMACquHjO(4wpoU6uC5BUOzKuUS5ZjauFLZDHCrugJ(MhYfX7oPHThXu40BZBwhHP1IHHAsXuA1XkgpCf5DUJA01Z(1HZfiEbcxu5PhrFhtC7sXhuFalNwp(Wvofj3IMqwoV(d7666pgXWhg3kI5OWTriDcJPimCJ5mdv9wDuvbuw0JAHpYmowyAWevbdp2aywJuSyh5MXrgIRz2xUsCyvUsKWtvsd5NQvLxsiM0j7vs(SDo2aCSiJD7HwU7kGsh2VIZJHyZ4fvOdmhU0f4(GKUKof0dPFKZjeUX)lqjhq7TwXSufZl27kelRDcKUtl1AfRNaolYsTK6iPJu)zzLi6scwZOx8qRHT1g5AsokmIqe95IOfl8SiJQSoO3)JEGVMo4zGu(D35b)uCZefMUikUF4mEdblGpm)kJktjjczKiECtCe0Qh(aF)0F43JZhxD0xrlqAhIqQEG0MJ4y2zrSMsjariGnmCPG5tVgsyfk)dHaQRPLU9Y4UIFpZT6E5pw8Mmd6mdGULnfEFNpJv4TEewZc7CbXJHeeZ5(iwUwKDrfp(q61rQEtWSinHhwJX0n1MdkPjsDtvUOiSdujpVQF)K8nYe0jXmAAc)Jy7IWXlz0avS7Vlr7XJDsz42XbNwQkohHVqSvU9W4qxIUISJle)axUvrnYBIfLNlMX1U)M)(3owIIMG2uBKkOARwQMCOI9gpDKtwAAmJN)UovLIrKTSXm3wZjeat9Po3WsuL6NxnkZWnGgwm56Muv7qfGuomVH4MVLQ0flf9EykGInWcLgAI96ysgIEOlRjTP6RH5yUcpsGG)WdysvlJhROFwJ7RGEPXEY9Tz(7vt9NaZ93FM8p1g1p9g2VhmUF)yd)7s2XV3SLFQTNFQTPVo76RjOmcz2vCQMOKxVV4YvEGEWYJR9AgdGhxs9MeWJRoAsJFcH4xnWVn1ts6rSioXjvObEY0boq3p8D6CL3NLecFqJ8nX0knSmkNwrMLKQ5vGZcsQ3QzMccVSO4Y5dMT8P9Cw)Bz7hcsfFvAOODFo9Ug2Xmigg5YmkjaD0MkMD8XFEPjHkGbjBZhtENZXPhCqHYeQky8s(zktmjaey0Rhu6dWPlkB0sSp9blbyBpe(0FPBY2O23(JVUVlMFdQZXHGwiCAoKs3lqp5W8ngCoMBce65FuyO5hCGrgeSI4puRaMjNeQo9RV8I6NKBt6Gh61eZwWnj07Bz6zJ0)uBJgwEBgEDlxH2vlVztt6VwPDv6d(Fz6)P2wnrI2lKbloPDl6xi33Vy6JB7QH)UQLDTY0CGFw6P5l9gxw4uJ1x4aU9aEORG)yaHvfFhBysvkM4KIB1N0oGtYoRXeg2H10u75ceWih7NPdu(nlcNs0G4WdNzRRDJTV8ZDNx)TdFPaxu0Qt(NfEehMLL8pu7sRZJGbr3xzZnq9tpZSAsAGCY3P1vxdNDn4q6M5yvgjyGG(OFHXa(6P2Uww5lAz8Lq0GblKlbY9dCxrXb9j7VCRyaMwfqOk9xVM47ueobn6mXe01WBp4iyjNaZ3cI8gC8EcMIDQkNK0hur0zfkMmskjW19fba6petKclYnQo(FeZooC(dGNEpeKF7eOT7kZiYzOb2vmcNXE(X8U8hyNPJx1gmI5f90jeJI0bWLGx2YRi962iy6pQ2viyqQKBKoNLIpVtqyokRadFQytmpKA9zeamOLHjJmnIzd4fhjpWDUoKFvz6aj29DG3VIaNfBFnr3r6Vsj8WeCa)dQKkldR(nYRLIwmW7XPMOl6uyjFYQSUeEXUiLvvOtiamoEokgZDPFc6CSQ9vPxcmaEtQgDNaQp41050hnrNKSKYWzsqX(wia6XgeFbOhgK82BY6CSfMRLI3YkPHg(9EVHQ6BjnGUKUuAxvmAzuRyw9eOcgq01P(wNugwYpMhRYFUrlvkg41VmSqokShT6ElHB4tFpjQhtwk3)KoUuE(UQMSNmHvTW94AXhiMYPEOwaqMX5rgRKgGP22e1tzcRhzG8C8mAuMk8R4dOPQbZCcH2MWe3yxWKgioQK8M8Zoe1ROWwdr)wZ6i(3Me(Ko)Wic)WWmL3p(IIOD3hdKkp2DjOzFbX1uqvusPGPG(p1Y1kSuTG4tz2QykRFKxGf7sHnVM4I6UDS1QRZmacjx4CKsiyP6N9FZQZF8ITa0xiU9HpO2l(GB)4PBp5asq)wAMwgUh9rW3xi)ODdbI(vr1gJQbXJY(5TiKiySFmAEH02jb22sYeaNGqthARhXChLPYGc83FcItwyJQ8rvEkQR)G7xQY8XhyDfEroOP2sIKL(zR6IdY90rUDp16s2wAtq7ljNt56vguItxiDuyz8tMWxbmeVS4e3eGVR3vDQnNwukCFV3FOnEXtPsr)KxXkK5bpWpq3jqA3nWGA90tMIMH4od2DckRoHZPAhcjsVEfoDLCUkf3nXdGsnE96f(uyHfTK9WpOca5pUWvfHy9qWOjTqCye7GJgIKq9WhIFIS34WQycNhNLbFo7MTXVl56mgCccs0wPotKJG2Yc(wpAuakqqz4e7qx3D0FKAWXE6NA7qfHmsaGl2gjwXAvfIDWqLm9FmdJrh82t3D8dlbXvFPec600rfC9OMWgUEhtkdKTGUekiFcqgXkChQLPRRm24dGZeJnr0WMaajbjKJoAesepUOtudGpRwyBksFu59(L(TxzkLg0Ik9fSY5iygzDA1pksQZOJLcf25yFcd(oqnX9Lws)QV8sFpRdDTLHdHp9s49bjahzTcxNQLHvT6K1Pq1sTnxDDZvp(WKFMvtnbebPkeAvvsKfLZKvIf(Ux22Sb9djxSvvqbqi5vaJkvvkGdV5SrhvvjsxC9IkJ6W0UQxpUJnkDbvSQEQ6xHZHiZ2JtwGc(nCOJNC9JJAzYDvAqORNLuv(ie8nCKSRkobjFpreZGwsmI54JSV8janjxqNcQwrFYn(Fs0nOWWdNP7LUWw36kQSVecG78Ap)oV8f7HPHSns(UaLdl1NAr0IfMJHWL8iRB5zcxs)5r1s8bWvvfxaJdlzqjCwOJ3Zou5dV02o)R05IVP4CCgPiv90eXTOLpEqOsYOxnT807CEAzz(i5IgvQ)fphFSsdixa1G6eWXLIJSwQ8grgmASFtVI9(RSzr7FxMjBxz2tP44YyPMduETLnxZcFKepJtlYyTBUSJBVj2oqdEEQjjN1AWCvvJthZWcdi4TApPBPObgqOxEPtEtrUW8QCZCvpWCPcYcIv9s0gHv5RG))V5qjj1I(2YKa5nVhM4fYmxjsNm2SKpFpZBkyyJhymzjoQywHmkYOjG59QFCNBD5)QOF9I(Jv)ckzCqYUNsMyUZSQ45HLeCppB5tN8BL4GaGAxS(optN39mDFLVy7396F95Iv4Z1O6SkVXDCjPIBqs)kmgoOjXjye7SPUAfmPVCvRwvxCa1ogaMz01SEC6HkfHiXYO1ZbyBm8CyKbYPvpggnAbfyV6hNUnWC4MKZ26DhTHw3yo3vw3QU3dBUj5w3rJJv9tHcutFs6n1aQmt4y0QMFGDQ3LSyxAqSm44Og0jqtAWVix4BNCDhhxZjCEC0kV4u5bkfe1fpDHiAosmoppIpjh5QGg8g4M0VNejOSLtJe0ZNcBV0d3eN5jXG4VMCLPE(bERggeSLswn0xW3O6D)vsqngf1hvYWc34xUZ5(KDE6NR7R(rdLutvsQ0Stm(Kp8SlV0HxumnSIXUL(FM4mMamwkipflvCSK0zkwfFp3JWK0(y)vFr338mAV758tpP)EAYqr9jKFMrbM1NuAq)fgI(9zn(BCGNdmJQp6efArSXft4nG3iWLbYj3ApybfkOKRSfxaoy5t0QCCplJ1I(mO4kiv8ObfwBawYataA9)xTaoPdIyMRurIJgFi8Fr)fqHix5bKuBiG)8KjH73AvM0hbywavLQT)WZT91)TQCx7OX5V2yCo7OkDolO57XntHCcAeGIr0JMKEIk(ihlAIevqWgO)yPuQTVXVuCFArjZiAEKUlQQKrjta1CKu6QBk5eyVDYEXM0dbVQss45dGkrW(ejLU6gKPSZZFHT)TFCVgdb9CadaVfpFMsgvThvMI6XC4mW7IP6c66lgsfmC0iLr27AUTRMl79Cuu1KnB(Ghpg9rGs(JB76zvFZdMllP5c1QqcAoslJMqoDxLOd0VWzvVQjeD(SpP7voN4eIjMLEpUnBr)vpNeTaKh07cY4x8DVzj8HQfWh9tIwki6MDrfUpkKO97D8LlFKLw(HVxLEZKgJMJvid0f4a3ks3lM(EVOwfcTb)KmsJiTnnRfU58s31CaRIbR1rBSPg1zYIs5vobB7)Wn68RF2Vni1NFsg)Q(YEHNA1h6KPr2TKPZQm7rzZi9JP8anZpJ01i6MFQjtEVNITlevEPgw0fkSEudCYKPrsE2SXCtlfRednce4eJljr4uVWox9T6(YFA3x)TayRCfvoEfpdV2Uty0sX2tCtOOyz9iD1Qej)BuuAgJG4QZajafnSFfozpP6PRdzSX8hz)p7ba6fSq718XFeJgTnDjRtxsmpUCtPzcRAGH1vEW(C)ZBDRxfnyFNx(FfAxubxtf(5fu8Yt4krVU6TesecQh8WFOXYgtAKxQ4XCwJXrPe7YCpRYMM0WfuV1mXxufpgEPf8bz(dvcY07edOgaZOJbaY6ebM4VkT1E2dHW(YyQQoJcc7aYrsiS1vHLajgH)7gngU7eB8SqBbYEZKYEhvNqddQfphUzQTv6GtP2hq)sUknZsSlieD3NI1Jl6ktpRIBpX(6YEfCUf8DYAcwnKRbeEUI2J1UuOijU2kDSu8QVvYwD8EOMbAyt7PeCqvZ5GEdLNr045983bKPEQVytjbt)PsHsIiarKdCPruk)F5orcCEd3qNQR8yyUI0FlidX)M2j6P(sroojed(7dzqZ23)xcXXH2bWTrS(e47UuF4U2DRS2njHp5ns4nZBpZbLOlL3ytpWuxTQMMMohI1hCV3DzCVBYZ(1f7A(eFAGNuMufCj7ldL1R77)wDU5fZCampIEbYC91GB15eOLa7fan4E135lUuNN596(w)8ElnJawDoMSoIlfJe9H6YHwgveX8FD3YBGqinK0QaHwBgyYCo4MdqRWeLatXN8sjlXLsCEdbEPSMFOElTH4VkhbImnzur21Zrw30SbCRk67jQrbJeGa(qDIhXKYqaX7r)M0rQ10EtTjdgrD7EjU8XykHzidBWJfzqa5KBrryS5xtCAzdyJKeeSEonQbh(7XhXDpyVeFYfnvq1rFQIh9Sgn7WzvfnEbqPp41aTLq0vrPcZiaIfE7iiGdrtieBWKgv(Ej(RfUmntza8bohJBEr0DbQCmgINuC(38BHtkGmdvuhHXgIL(pntp21FD6X3OtpGND0RPiqQNGO3eSHTY4uIciJmdaMB5fgmmmKnHeYsgfPgq)Y8Rlivb6)mQh1dX8pOYvP2MBvHmEMY4sc(extrEvMK46nMzla3f4jkoDtrc94N0K1fhldFp8nHhOEY5uPbxC3t7K7itypFaDnRZhW5bhA48xT7rboXbDCoo3bqU8EmHGsr7r64Tx4(pBzdRAl7GZsgYXWEEEyWhPBH9JzA5Sbg8C5dVIi5pYXz8Evs4LXsNWBrtFyr2dh11rr4(kEiATrU79GiaUxbaMSHXgnnRv2bXpAAAlSxnXOKFewhPs(yzNMKigdQGl4CcssGd8j6nnkZbES)HySttmz2f4vhnl2kh(JdKIN9yKlfYIpetaROiIJ5Nte7PTmW7kQKnubGhD0JHQv0qSkZ87BtgffNXCmsMIRUIu8fn6GJhl2XijgFFc00NW0gMTmViyHjqg(buno5bhVCLfwz2kJp1ulTy8WJdO0dvz5LwP80lx5WhAQXlpD8f6qZp()ac8PxevO5wC2khzPLNFQ4l2cln1CZmhQGRugvnvqn1fNDAOYXlbhxyGB)6tqMwwSyrUlKbYRjgatGsiZAqN)3SLzDRhVqMnCxRaop39OxAeUOXeZwZ0UrJfPCOffUBpW(vGuuSZhaVJq0EzX4FaC2ATr()vExB90ghrHBeVu5hPvvQTVe5QwHvjumxcjsPrfsPkUk0w5KuIuvebFd7wW2DxdjK0ubo3aNWLqOPPanjyfsiPjHi3kIbdkp0)arr9Fq3lMNIu)f0Zzo7UET9URTHw6dLhwGzpZzoZCM5SZLZC(QfF2a7zJSNnXE2m75UzpBbDVHyC8r7ne0KuRDM0A0jlrsDTqH2DV9LxM2L9cRtokCMCr5W(SQSOCfTIVxGqgzkG8aifCqRARl7TmipXkhMtFmYxd3zr5X0isEHGulk2)dc91AybKl(2HAdbVnvcGNOJrwIGpfDSdmS15dlnGwA40kyM6z44JgMGq64shATnaHwk3tdiVDKwfBGktXFRk6LqSRWiKTrBYEU(4Owu5JcBlDY1wpqj6LB(qIMmJynKIjF6B2m6ZDwUGXatfaFebTyooQTLGUidcumfecpHzdcZHh60y1fUs5G59Gxd)ZyApNWSTmHWkveD8sNMoMe7hVwtZJ25WOaXQ6oDfZY2zTzHm2fbasLaAIkO9Wyiks)pOXA0D)ur9QayvLTY2ZWfZ5zPW)agGHU3LzjSZ3LFN69vf4FjAq3T7hEglfEGiRAAyvkgyovKgUgqv8vG694SXu23h7y11sdpS99BhNFj6S5k4NvxD2Q7pdMnI9nXrMw54W0wvPurkN)RvsB7kRY6Rlgfcy3S2XPq8X2JH8TYeqmDchOeRF2jw2FsNBiP7ovwo38NYZ7KW4XOf3aitUhlAoaRbUtPUvrvm(lz6XARmGGfaBmZvkm4Yd5uDBdTi6TNVB4wYG9UNU5knrKMZKWjwoY0TjqLMNuWLrLoRMsAf)nZYYQulNvVsGLazWr5k27Wy0pSWXULPL7CB3IRpU9pXDRD0ExhXvhTx2wZlyJNOLEhWrLBdQetdDZyIkV95YutuyY0CKX1LwU(72wXKun6m74qzvrAJok6)3VL3KL8DOC8mF0xLZbDMgdOMAH0b9jrtb2eG5u9hfQRrNK6qhxQrdkxPVIL)RW54sPBrV0kgFrJr(dsNh01H)I2DxIvVVv6xzzNk1IFt2V6)DlYz75J9wo(zty25FT1Mzv)UV0phFiSdVFVFtLnJRndA92XGq5P3eIgHdGsBjrGxs4ZT7IgTVPflTv26kkNJ9WWV8uK0z8g0A2wGIiEEpHaDxiE3(7ns3(mE7or781OqlAWtLAhwUrNBtnbfxunuEfKzhFu53yBY2ABwRnb8UKlnyqRCnQoW5HoWrCFi26MutXnlfhM6N7Xug740YqQtEbCixLh88Dywi4HhMBS(7jilLpWvy(O(9gZEf8fjZwkEUIXq8vYiy)2GJsXXZR3w03gmMGMIyHWoAgPDfv5pCJOBLV4bWf6e60(Ftp8r6NZRFpH6lAeUyj7Nx9GEd(c(GD7lYjp2NhiaV)yvf)Kk3r94Qxw9g6pKVuNUtUV9G94iGZD3b3Pisp4hDk3p4vGFsY5VhOVfAwRn8t6PcfMecirBT5ZpV3tv13j9O70zRs3yjXztkE1Bi)ll9Y1UI80lkS64sJVG00ldPdlxxCIRkEPvLN58kRHF5rKggPuk18IpEum0imZ5joqXFmH0JjS6fjIpQR)CO4zx6PeNKsKi7sl0zRahLZ8tuEiwaujE34s3CoLeFAk5mtqVc4fDuystmLqMLfxzzH0tlp6isZ9qX5w0zDTux9sJCDHmliKobivItSe7VhdQiedyfjua2Sjn7VjD9NqHxUxU2m2gOH6Ac(DJIJDUD1m8aRijUTqMNkUYfex9UstVIq6vDwF9aBBui9L2vZWdZOPEKBncCtPvA(lkS(1eN4xbPk79McYff(HLUYOBm1JPCrXrxkfm3nG5(kJsSx6hxwR2idYnOqsKG82dctfagio5iBmuCG3kxqrGhobEqTKcRFBuwz5q8opqy9Xvyj5p(ZFrvT1QYRMm7OPWCd10z24sJjo8mzF2SIxybXelkpDMxU2SGyjN58y5n9Jb2qIfOg3yOHHg)S3lU4s3IU682gWzD7ffIK3eRiPhsi9dKZ8mOa2yQ7l(OjPUys)8czNFrS4x)2yhWjVlPYLU8csZnkOXKh9(IxByKz7rJzQ1Es9n7rDjV29fFYeqheOyKJVckNtm5g)YnWUFZne8k9AkKxTOXl9bwtXe3k75whF)U1Ep14GB26ClsAuOXmVGdaqEZAQBsbq9e((gHEdf0nrE8NamIEpiSspC(ukgkC5nsypoBSXw2ttj573JB2Ww(36nEE1Va(xpAxa6OVNHwwqtkD1R)E627GDfO3ir4cg9DmNWOC(9gcN9tvUz(63WUzO)qvTD6ir6BhCFnDbTAd9ZPKXI4DaAQsV6a)U9q(I(A7JghUFQkVtC0t0338cZ3GH7UVqE7kwqo)8bJ0RVbJwnyJ7aGnoW2w4oI4Zn8P2t8xDh2BWiCSPLIMR8C4dG3EPOVUxfcrwR6(Fb9anxbc1JnUqHrPZFWPWJLLTzoEOTSjfz7KTLkF6o2XoQkjKfFHyUlGT4Qm9ePcKZjiQQAEpnxNZgQBVvpWFCS)o
    ]]
    -- 更新记录
    local updateTbl = {
        L["v2.4：3千-5千的加价幅度改为100，3万-5万的加价幅度改为1000"],
        L["v2.3：拍卖框体右上角的隐藏按钮改为折叠按钮"],
        L["v2.2：按加价时，可以直接把出价设置为合适的价格"],
        L["v2.1：如果你的出价太低时，出价框显示为红色"],
        L["v2.0：重做进入动画；按组合键时可以发送或观察装备"],
        L["v1.9：增加一个绿色钩子，用来表示你是否已经拥有该物品"],
        L["v1.8：增加出价记录；UI缩小了一点；提高了最小加价幅度"],
        L["v1.7：增加自动出价功能"],
        L["v1.6：增加显示正在拍卖的装备类型"],
        L["v1.5：拍卖价格为100~3000的加价幅度现在为100一次"],
        -- L["v1.4：增加一个开始拍卖时的动画效果"],
        -- L["v1.3：修复有部分玩家不显示拍卖界面的问题；当你是出价最高者时的高亮效果更加显眼"],
        -- L["v1.2：现在物品分配者也可以开始拍卖装备了"],
    }
    do
        local function OnClick(self)
            if self.frame and self.frame:IsVisible() then
                self.frame:Hide()
            else
                local f = CreateFrame("Frame", nil, self, "BackdropTemplate")
                f:SetBackdrop({
                    bgFile = "Interface/ChatFrame/ChatFrameBackground",
                    insets = { left = 3, right = 3, top = 3, bottom = 3 }
                })
                f:SetBackdropColor(0, 0, 0, 1)
                f:SetBackdropBorderColor(1, 1, 1, 0.6)
                f:SetPoint("TOPLEFT", BG.MainFrame, "TOPLEFT", 0, -20)
                f:SetPoint("BOTTOMRIGHT", BG.MainFrame, "BOTTOMRIGHT", 0, 0)
                f:SetFrameLevel(310)
                f:EnableMouse(true)
                self.frame = f
                local edit = CreateFrame("EditBox", nil, f)
                edit:SetWidth(f:GetWidth())
                edit:SetAutoFocus(true)
                edit:EnableMouse(true)
                edit:SetTextInsets(5, 20, 5, 10)
                edit:SetMultiLine(true)
                edit:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE")
                edit:SetText(wa)
                edit:HighlightText()
                edit:SetCursorPosition(0)
                self.edit = edit
                local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
                scroll:SetWidth(f:GetWidth() - 10)
                scroll:SetHeight(f:GetHeight() - 10)
                scroll:SetPoint("CENTER")
                scroll.ScrollBar.scrollStep = BG.scrollStep
                BG.CreateSrollBarBackdrop(scroll.ScrollBar)
                BG.HookScrollBarShowOrHide(scroll)
                scroll:SetScrollChild(edit)
                edit:SetScript("OnEscapePressed", function()
                    f:Hide()
                end)
            end

            BG.PlaySound(1)
        end
        local function OnEnter(self)
            GameTooltip:SetOwner(self, "ANCHOR_NONE")
            GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(self:GetText(), 1, 1, 1, true)
            GameTooltip:AddDoubleLine(L["拍卖WA版本"], BGA.ver)
            GameTooltip:AddLine(" ", 1, 0, 0, true)
            GameTooltip:AddLine(L["全新的拍卖方式，不再通过传统的聊天栏来拍卖装备，而是使用新的UI来拍卖。"], 1, 0.82, 0, true)
            GameTooltip:AddLine(" ", 1, 0, 0, true)
            GameTooltip:AddLine(L["|cffFFFFFF安装WA：|r此WA是团员端，用于接收团长发出的拍卖消息，没安装的团员显示不了拍卖UI。请团长安装该WA字符串后发给团员安装。如果团员已经安装了BiaoGe插件并且版本在1.7.0或以上，可以不用安装该WA。"], 1, 0.82, 0, true)
            GameTooltip:AddLine(" ", 1, 0, 0, true)
            GameTooltip:AddLine(L["|cffFFFFFF拍卖教程：|r团长/物品分配者ALT+点击表格/背包/聊天框的装备来打开拍卖面板，填写起拍价、拍卖时长、拍卖模式即可开始拍卖。可同时拍卖多件装备。"], 1, 0.82, 0, true)
            GameTooltip:AddLine(" ", 1, 0, 0, true)
            GameTooltip:AddLine(L["更新记录："], 1, 1, 1, true)
            for i, text in ipairs(updateTbl) do
                GameTooltip:AddLine(text, 1, 0.82, 0, true)
            end
            GameTooltip:Show()
        end

        local bt = CreateFrame("Button", nil, BG.MainFrame)
        bt:SetPoint("LEFT", BG.ButtonMove, "RIGHT", BG.TopLeftButtonJianGe, 0)
        bt:SetNormalFontObject(BG.FontGreen15)
        bt:SetDisabledFontObject(BG.FontDis15)
        bt:SetHighlightFontObject(BG.FontWhite15)
        bt:SetText(L["拍卖WA"])
        bt:SetSize(bt:GetFontString():GetWidth(), 20)
        BG.SetTextHighlightTexture(bt)
        bt:SetScript("OnClick", OnClick)
        bt:SetScript("OnEnter", OnEnter)
        BG.GameTooltip_Hide(bt)
        BG.ButtonAucitonWA = bt
    end

    -- WA链接版本提醒
    local function ChangSendLink(self, event, msg, player, l, cs, t, flag, channelId, ...)
        if not _G.BGA.ver then
            return false, msg, player, l, cs, t, flag, channelId, ...
        end
        msg = msg:gsub("(%[WeakAuras:.+<BiaoGe>拍卖%s-v(%d+%.%d+)%])", function(wa, ver)
            ver = tonumber(ver)
            local myver = tonumber(_G.BGA.ver:match("v(%d+%.%d+)"))
            if ver then
                if myver and myver >= ver then
                    return wa .. "  " .. format(BG.STC_g1(L["（你当前版本是%s，无需下载）"]), _G.BGA.ver)
                else
                    return wa
                end
            end
        end)
        return false, msg, player, l, cs, t, flag, channelId, ...
    end

    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", ChangSendLink)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", ChangSendLink)

    ------------------正在发送WA------------------
    do
        hooksecurefunc(C_ChatInfo, "SendAddonMessage", function(prefix, msg, channel, player)
            local done, total, displayName, ver = strsplit(" ", msg)
            if not (prefix == "WeakAurasProg" and displayName:find("<BiaoGe>拍卖")) then return end
            if not sending[player] then
                sending[player] = true
                sendingCount[player] = sendingCount[player] or 0
                sendingCount[player] = sendingCount[player] + 1
                if sendingCount[player] > 2 then
                    if not notShowSendingText[player] then
                        notShowSendingText[player] = true
                        BG.SendSystemMessage(format(L["由于%s多次点击WA链接，不再提示他的相关文本了。"], SetClassCFF(player)))
                    end
                else
                    BG.SendSystemMessage(format(L["%s正在接收拍卖WA。"], SetClassCFF(player)))
                end
                UpdateOnEnter(BG.ButtonRaidAuction)
                UpdateOnEnter(BG.StartAucitonFrame)
            end
            if done == total then
                sending[player] = nil
                sendDone[player] = true
                UpdateOnEnter(BG.ButtonRaidAuction)
                UpdateOnEnter(BG.StartAucitonFrame)
            end
        end)
    end
end)
