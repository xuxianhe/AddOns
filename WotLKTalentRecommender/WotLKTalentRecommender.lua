-- 职业与专精映射表（英文到中文）
local classMap = {
    ["WARRIOR"] = { name = "战士", specs = { "武器", "狂怒", "防护" } },
    ["PALADIN"] = { name = "圣骑士", specs = { "神圣", "防护", "惩戒" } },
    ["HUNTER"] = { name = "猎人", specs = { "野兽控制", "射击", "生存" } },
    ["ROGUE"] = { name = "盗贼", specs = { "刺杀", "战斗", "敏锐" } },
    ["PRIEST"] = { name = "牧师", specs = { "戒律", "神圣", "暗影" } },
    ["DEATHKNIGHT"] = { name = "死亡骑士", specs = { "鲜血", "冰霜", "邪恶" } },
    ["SHAMAN"] = { name = "萨满祭司", specs = { "元素", "增强", "恢复" } },
    ["MAGE"] = { name = "法师", specs = { "奥术", "火焰", "冰霜" } },
    ["WARLOCK"] = { name = "术士", specs = { "痛苦", "恶魔", "毁灭" } },
    ["DRUID"] = { name = "德鲁伊", specs = { "平衡", "野性战斗", "恢复" } },
}

-- 主 Frame
local frame = CreateFrame("Frame", "WotLKTalentFrame", UIParent, "UIPanelDialogTemplate")
frame:SetSize(800, 600)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()

-- 标题
local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -10)
title:SetText("巫妖王之怒天赋推荐")

-- 职业显示
local classText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
classText:SetPoint("TOPLEFT", 20, -50)
classText:SetText("当前职业：")

-- 下拉菜单
local dropdown = CreateFrame("Frame", "WotLKTalentDropdown", frame, "UIDropDownMenuTemplate")
dropdown:SetPoint("TOPLEFT", 20, -80)

-- 图片纹理（最多4张）
local textures = {}
for i = 1, 4 do
    textures[i] = frame:CreateTexture(nil, "ARTWORK")
    textures[i]:SetSize(256, 435)
    textures[i]:SetPoint("TOPLEFT", (i-1)*260 + 20, -150)
    textures[i]:Hide()
end

-- 专精图片名称映射（完整版）
local specImageMap = {
    -- 战士
    ["武器"] = "Arms",
    ["狂怒"] = "Fury",
    ["防护"] = "Protection",
    
    -- 圣骑士
    ["神圣"] = "Holy",
    ["防护"] = "Protection",
    ["惩戒"] = "Retribution",
    
    -- 猎人
    ["野兽控制"] = "BeastMastery",
    ["射击"] = "Marksmanship",
    ["生存"] = "Survival",
    
    -- 盗贼
    ["刺杀"] = "Assassination",
    ["战斗"] = "Combat",
    ["敏锐"] = "Subtlety",
    
    -- 牧师
    ["戒律"] = "Discipline",
    ["神圣"] = "Holy",
    ["暗影"] = "Shadow",
    
    -- 死亡骑士
    ["鲜血"] = "Blood",
    ["冰霜"] = "Frost",
    ["邪恶"] = "Unholy",
    
    -- 萨满祭司
    ["元素"] = "Elemental",
    ["增强"] = "Enhancement",
    ["恢复"] = "Restoration",
    
    -- 法师
    ["奥术"] = "Arcane",
    ["火焰"] = "Fire",
    ["冰霜"] = "Frost",
    
    -- 术士
    ["痛苦"] = "Affliction",
    ["恶魔"] = "Demonology",
    ["毁灭"] = "Destruction",
    
    -- 德鲁伊
    ["平衡"] = "Balance",
    ["野性战斗"] = "FeralCombat",
    ["恢复"] = "Restoration",
}

-- 更新图片函数
local function UpdateTextures(classCN, specCN)
    -- 获取专精对应的英文名（用于文件名）
    local specEN = specImageMap[specCN]
    
    if not specEN then
        for i = 1, 4 do
            textures[i]:Hide()
        end
        return
    end
    
    for i = 1, 4 do
        -- 使用标准文件名格式：职业名-专精名-序号
        local path = "Interface\\AddOns\\WotLKTalentRecommender\\Textures\\"..classCN.."-"..specEN.."-"..i
        textures[i]:SetTexture(path)
        if textures[i]:GetTexture() then
            textures[i]:Show()
        else
            textures[i]:Hide()
        end
    end
end

-- 初始化下拉菜单
local function InitDropdown(self, level)
    local currentClass = classMap[select(2, UnitClass("player"))]
    if currentClass then
        for _, spec in ipairs(currentClass.specs) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = spec
            info.func = function()
                UIDropDownMenu_SetText(dropdown, spec)
                UpdateTextures(currentClass.name, spec)
            end
            UIDropDownMenu_AddButton(info)
        end
    end
end

-- 加载事件
frame:SetScript("OnShow", function()
    local _, classEN = UnitClass("player")
    local currentClass = classMap[classEN]
    if currentClass then
        classText:SetText("当前职业：" .. currentClass.name)
        UIDropDownMenu_Initialize(dropdown, InitDropdown)
        UIDropDownMenu_SetWidth(dropdown, 150)
        UIDropDownMenu_SetText(dropdown, currentClass.specs[1])
        UpdateTextures(currentClass.name, currentClass.specs[1])
    else
        classText:SetText("无法识别职业")
    end
end)

-- 添加小地图按钮（优化版）
local miniMapButton = CreateFrame("Button", "WotLKTalentMinimapButton", Minimap)
miniMapButton:SetSize(24, 24)  -- 调整为更小的尺寸
miniMapButton:SetFrameStrata("MEDIUM")
miniMapButton:SetPoint("CENTER", Minimap, "TOP", 0, -15)  -- 初始位置
miniMapButton:SetMovable(true)
miniMapButton:EnableMouse(true)
miniMapButton:RegisterForDrag("LeftButton")

-- 创建圆形图标背景
local iconBg = miniMapButton:CreateTexture(nil, "BACKGROUND")
iconBg:SetTexture("Interface\\AddOns\\MyAddon\\Textures\\MinimapCircle")  -- 自定义圆形背景
iconBg:SetAllPoints(true)  -- 完全覆盖按钮区域
iconBg:SetTexCoord(0, 1, 0, 1)

-- 创建图标（圆形，完全适配在背景内）
local icon = miniMapButton:CreateTexture(nil, "OVERLAY")
icon:SetTexture("Interface\\Icons\\INV_Misc_Book_11") -- 使用默认书本图标
icon:SetSize(20, 20)  -- 比背景小一点
icon:SetPoint("CENTER")

-- 使用圆形遮罩确保图标不会超出背景
icon:SetMask("Interface\\AddOns\\WotLKTalentRecommender\\Textures\\MinimapMask")  -- 圆形遮罩

-- 鼠标悬停提示
miniMapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("WotLKTalentRecommender", 1, 1, 1)  -- 白色标题
    GameTooltip:AddLine("左键：打开天赋推荐界面", 0.8, 0.8, 0.8)  -- 灰色描述
    GameTooltip:Show()
end)

miniMapButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- 存储按钮位置的角度
local angle = 0
miniMapButton:SetUserPlaced(true)

-- 优化的小地图按钮拖拽
miniMapButton:SetScript("OnDragStart", function(self)
    self.isDragging = true
    self:SetScript("OnUpdate", function()
        if not self.isDragging then return end
        
        local mx, my = Minimap:GetCenter()
        local px, py = GetCursorPosition()
        local s = Minimap:GetEffectiveScale()
        px, py = px / s, py / s
        
        -- 计算角度
        angle = math.atan2(py - my, px - mx)
        
        -- 更新按钮位置
        self:ClearAllPoints()
        self:SetPoint("CENTER", Minimap, "CENTER", 
                      math.cos(angle) * 80, 
                      math.sin(angle) * 80)
    end)
end)

miniMapButton:SetScript("OnDragStop", function(self)
    self.isDragging = false
    self:SetScript("OnUpdate", nil)
end)

-- 点击小地图按钮显示主界面
miniMapButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        if frame:IsShown() then
            frame:Hide()
        else
            frame:Show()
        end
    end
end)

-- 右键点击小地图按钮显示选项菜单
miniMapButton:SetScript("OnMouseDown", function(self, button)
    if button == "RightButton" then
        local menu = {
            {text = "打开天赋界面", func = function() frame:Show() end},
            {text = "关闭天赋界面", func = function() frame:Hide() end},
            {text = "重置位置", func = function() 
                miniMapButton:ClearAllPoints()
                miniMapButton:SetPoint("CENTER", Minimap, "TOP", 0, -15)
            end},
        }
        EasyMenu(menu, CreateFrame("Frame", "WotLKTalentMenu", UIParent, "UIDropDownMenuTemplate"), "cursor", 0, 0, "MENU")
    end
end)

-- 修改slash命令为/wtt
SLASH_WTT1 = "/wtt"
SlashCmdList["WTT"] = function()
    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
    end
end