local AddonName, Addon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(AddonName, "zhTW")

if L then
L["Transmute"] = "轉換"

L["Reset due to update"] = function(oldv, newv) return "因版本更新而重置部分或者全部數據 ("..oldv.." -> "..newv.. ")" end
L["extended"] = "(擴展)"

L["minites"] = "分鐘"
L["Enabled"] = "啟用"
L["Disabled"] = "禁用"

L["Raid Table Notice"] = "左鍵點擊打開進度表格, 右鍵點擊打開設置"
L["Display settings"] = "顯示設置"
L["Desc - Common"] = "|cff00ff00■|r |cffccaa00每個配置已保存 [單角色]|r"
L["Show floating UI frame"] = "顯示懸浮窗"
L["Floating UI width"] = "懸浮窗寬度"
L["Floating UI height"] = "懸浮窗高度"
L["Desc - Frame"] = "|cff00ff00■|r |cffccaa00Shift - 拖動來移動框架|r"
L["Show minimap icon"] = "顯示小地圖按鈕"
L["Show info"] = "顯示信息"
L["per Character"] = "單角色"
L["per Realm"] = "單服務器"
L["Show total gold"] = "顯示總金"
L["Hide info from level under"] = "低於等級隱藏信息"
L["Show current chracter first"] = "優先顯示當前角色"
L["Sort Order"] = true
L["Sort Option"] = true
L["Exclude Characters"] = "不想看見的角色(用英文逗號或者空格分隔)"
L["Descending"] = true
L["Asscending"] = true
L["Tooltip - Character info."] = "提示 - 角色信息"
L["Line 1 of char info."] = "角色信息第一行"
L["Line 2 of char info."] = "角色信息第二行"
L["Left"] = "左"
L["Right"] = "右"
L["Desc_Char"] = "|cff00ff00■|r |cffccaa00使用方法 - 角色信息|r|n"
    .."|cffccaa00[name]|r 名稱(職業顏色)|n"
    .."|cffccaa00[name2]|r 名稱(無顏色)|n"
    .."|cffccaa00[level] [expCur] [expMax] [exp%]|r|n"
    .."|cffccaa00[expRest] [expRest%] [zone] [subzone]|r|n"
    .."|cffccaa00[elapsed]|r 自上次更新經過的時間|n"
    .."|cffccaa00[item:|cffffeeaaname or ID|r]|r 物品圖標和數量|n"
    .."|cffccaa00[cooldown]|r 專業技能冷卻時間|n"
    .."|cffccaa00[dqCom] [dqMax]|r|n"
    .."|cffccaa00[dqReset]|r 日常任務重置時間|n"
    .."|cffccaa00[gs] [ilvl]|r|n"
    .."|cffccaa00[color/######]|r 顏色開始(RGB 代碼)|n|cffccaa00[color]|r  顏色結束|n"
    .."  通過在末尾添加 /###### 著色|n"
    .."|cffffeeaa(例如) |r|cffccaa00[color/ffffff]白色[color] =>|r |cffffffff白色|r|n   |cffccaa00[item:6265|cffcc3333/cc66cc|r] => |r|cffcc66cc".."|T"..GetItemIcon(6265)..":14:14|t12|r|n"
    .."|cffccaa00[currency:|cffffeeaaname or ID|r]|r 物品圖標和數量|n"
L["Tooltip - Raid instances"] = "提示 - 團本信息"
L["Lines of raid instances"] = "團本信息行"
L["Desc_Inst"] = "|cff00ff00■|r |cffccaa00使用方法 - 副本信息|r|n"
    .."|cffccaa00[instName]|r 副本名稱|n"
    .."|cffccaa00[difficulty]|r 大小和難度|n"
    .."|cffccaa00[progress]|r BOSS擊殺數量|n"
    .."|cffccaa00[bosses]|r BOSS數量|n"
    .."|cffccaa00[time]|r 重置時間|n"
    .."|cffccaa00[instID]|r 副本 ID|n"
L["Tooltip - Heroic instances"] = "提示 - 英雄本信息"
L["Lines of heroic instances"] = "英雄本信息行"
L["Show in one-line"] = "單行顯示"

L["Select character"] = "選擇角色"
L["Reset selected character"] = "重置選擇的角色"
L["Are you really want to reset?"] = "你確定要重置嗎？"
L["Reset all characters"] = "重置所有角色"
L["Copy settings to"] = "複製設定到"
L["Copy"] = "複製"
L["Confirm copy"] = "將設置覆蓋到目標角色上"

-- Localized Translation Table
L["color"     ] = true
L["item"      ] = true
L["currency"  ] = true
L["name"      ] = true
L["name2"     ] = true
L["zone"      ] = true
L["subzone"   ] = true
L["cooldown"  ] = true
L["elapsed"   ] = true
L["level"     ] = true
L["expCur"    ] = true
L["expMax"    ] = true
L["exp%"      ] = true
L["expRest"   ] = true
L["expRest%"  ] = true
L["dqCom"     ] = true
L["dqMax"     ] = true
L["dqReset"   ] = true
L["gs"        ] = true
L["ilvl"      ] = true
L["instName"  ] = true
L["instID"    ] = true
L["difficulty"] = true
L["progress"  ] = true
L["bosses"    ] = true
L["time"      ] = true
-- Localized Currency Name
L["gold"    ] = true
L["silver"  ] = true
L["copper"  ] = true
L["honor"   ] = true
L["arena"   ] = true
L["jewel"   ] = true
L["cook"    ] = true
L["heroism" ] = true
L["valor"   ] = true
L["conquest"] = true
L["triumph" ] = true
L["frost"   ] = true
L["champion"] = true
L["AV"      ] = true
L["AB"      ] = true
L["EotS"    ] = true
L["SotA"    ] = true
L["WSG"     ] = true
L["WG"      ] = true
L["IoC"     ] = true
L["shard"   ] = true
L["venture" ] = true
L["justice" ] = true
L["sidereal"] = true
L["defilers"] = true
-- Heroic dungeon names, abbrs
L["TOK"] = true
L[ "AN"] = true
L["DTK"] = true
L["Gun"] = true
L["HoL"] = true
L["HoS"] = true
L["CoS"] = true
L["Nex"] = true
L["Ocu"] = true
L[ "VH"] = true
L[ "UK"] = true
L[ "UP"] = true
L["ToCh"] = "ToC"
L["HoR"] = true
L["PoS"] = true
L["FoS"] = true
-- Raid abbr. WotLK
L["Naxx"] = true
L["OS"]   = true
L["EoE"]  = true
L["ULD"]  = true
L["Ony"]  = true
L["ToC"]  = true
L["ICC"]  = true
L["RS"]   = true
L["VoA"]  = true
-- Raid abbr. TBC
L["SP"] = true
L["ZA"] = true
L["BT"] = true
L["MH"] = true
L["SC"] = true
L["TK"] = true
L["KZ"] = true
L["GL"] = true
L["ML"] = true
-- Raid abbr. Vanilla
L["AQ"] = true
L["RA"] = true
L["ZG"] = true
L["BW"] = true
L["MC"] = true
end
