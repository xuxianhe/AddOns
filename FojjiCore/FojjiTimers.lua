local ADDON_MESSAGE_PREFIX = "FojjiTimerAddon"
local isDBMLoaded = IsAddOnLoaded("DBM-Core")
local isBigWigsLoaded = IsAddOnLoaded("BigWigs")

if not FTSavedVars then
    FTSavedVars = {}
end

if not FTSavedVars.breakEndTime then
    FTSavedVars.breakEndTime = nil
end

if not FTSavedVars.pullEndTime then
    FTSavedVars.pullEndTime = nil
end

if isDBMLoaded or isBigWigsLoaded then
    return false
end

local function chatMessage(type, playerName, duration)
    if type == "BREAK" and duration ~= 0 then
        print(string.format("%s started a break timer for %d minutes!", playerName, duration/60))
    elseif type == "BREAK_CANCEL" then
        print(string.format("%s cancelled the break timer!", playerName))
    elseif type == "PULL" and duration ~= 0 then
        print(string.format("%s started a pull timer for %d seconds!", playerName, duration))
    elseif type == "PULL_CANCEL" then
        print(string.format("%s cancelled the pull timer!", playerName))
    end
end

local function SendMessage(cmd, timeValue)
    local message = cmd .. ":" .. (timeValue or "") .. ":" .. UnitName("player")
    local currentTime = GetTime()

    if cmd == "BREAK" then
        FTSavedVars.breakEndTime = currentTime + timeValue
    elseif cmd == "BREAK_CANCEL" then
        FTSavedVars.breakEndTime = nil
    elseif cmd == "PULL" then
        FTSavedVars.pullEndTime = currentTime + timeValue
    elseif cmd == "PULL_CANCEL" then
        FTSavedVars.pullEndTime = nil
    end

    if IsInRaid() then
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "RAID")
    elseif IsInGroup() then
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "PARTY")
    else
        C_ChatInfo.SendAddonMessage(ADDON_MESSAGE_PREFIX, message, "WHISPER", UnitName("player"))
        print("Timer started!")
    end

    if IsInRaid() then
        local fullname = UnitName("player")
        local realm = GetRealmName()
        local normalizedPlayerRealm = realm:gsub("[%s-]+", "")
        if cmd == "BREAK" then
            local _, _, _, _, _, _, _, instanceId = GetInstanceInfo()
            instanceId = tonumber(instanceId) or 0
            local dbmMessage = ("%s-%s\t1\tBT\t%s\t%d"):format(fullname, normalizedPlayerRealm, timeValue, instanceId)
            C_ChatInfo.SendAddonMessage("D5", dbmMessage, "RAID")
        elseif cmd == "BREAK_CANCEL" then
            local dbmMessage = fullname .. "\tD5WC\t0\tBT"
            C_ChatInfo.SendAddonMessage("D5", dbmMessage, "RAID")
        end
    end
end

local hasReceivedBreakStatus = false
local hasReceivedPullStatus = false

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("GROUP_JOINED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "CHAT_MSG_ADDON" then
        local prefix, content, channel, sender = ...
        if (prefix == "D5WCWC" or prefix == "D5WCC" or prefix == "D5WC" or prefix == "D5") and channel == "RAID" then
            local playerName, _, timerType, timerValue = strsplit("\t", content)
            if timerType == "BT" and tonumber(timerValue) == 0 then
                FTSavedVars.breakEndTime = nil
            elseif timerType == "PT" and tonumber(timerValue) == 0 then
                FTSavedVars.pullEndTime = nil
            end
        end
        if prefix == ADDON_MESSAGE_PREFIX and channel == "RAID" then
            local cmd, timeValue, playerName = strsplit(":", content)
            local playerNameFull = UnitName("player") .. "-" .. GetRealmName()

            if cmd == "BREAK" or cmd == "BREAK_CANCEL" or cmd == "PULL" or cmd == "PULL_CANCEL" then
                chatMessage(cmd, playerName, tonumber(timeValue or "0"))
            end
        end
    elseif event == "GROUP_JOINED" then
        FTSavedVars.pullEndTime = nil
        FTSavedVars.breakEndTime = nil
    end
end)

SLASH_FOJJIPULL1 = "/pull"
SLASH_FOJJIBREAK1 = "/break"

local function StartCountdown(timeInSeconds)
    if timeInSeconds > 0 then
        SlashCmdList.COUNTDOWN(tostring(timeInSeconds))
    else
        SlashCmdList.COUNTDOWN("0")
    end
end

SlashCmdList["FOJJIPULL"] = function(msg)
    local timeValue = tonumber(msg)

    if IsInGroup() and not (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        print("You do not have permission.")
        return
    end

    if msg == "cancel" then
        SendMessage("PULL_CANCEL")
        StartCountdown(0)
        return
    end

    if timeValue then
        SendMessage("PULL", timeValue)
        StartCountdown(timeValue)
    else
        print("Invalid pull time specified.")
    end
end

SlashCmdList["FOJJIBREAK"] = function(msg)
    local timeValue = tonumber(msg)

    if IsInGroup() and not (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        print("You do not have permission.")
        return
    end

    if msg == "cancel" then
        SendMessage("BREAK_CANCEL")
        return
    end

    if timeValue then
        timeValue = timeValue * 60
        SendMessage("BREAK", timeValue)
    else
        print("Invalid break time specified.")
    end
end

C_ChatInfo.RegisterAddonMessagePrefix(ADDON_MESSAGE_PREFIX)
