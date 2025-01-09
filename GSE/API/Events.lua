local GNOME, _ = ...

local GSE = GSE

local L = GSE.L
local Statics = GSE.Static

function GSE:UNIT_FACTION()
    -- local pvpType, ffa, _ = GetZonePVPInfo()
    if UnitIsPVP("player") then
        GSE.PVPFlag = true
    else
        GSE.PVPFlag = false
    end
    GSE.PrintDebugMessage("PVP Flag toggled to " .. tostring(GSE.PVPFlag), Statics.DebugModules["API"])
    GSE.ReloadSequences()
end

function GSE:ZONE_CHANGED_NEW_AREA()
    local _, type, difficulty, _, _, _, _, _, _ = GetInstanceInfo()
    if type == "pvp" then
        GSE.PVPFlag = true
    else
        GSE.PVPFlag = false
    end
    if difficulty == 23 then -- Mythic 5 player
        GSE.inMythic = true
    else
        GSE.inMythic = false
    end
    if difficulty == 1 then -- Normal
        GSE.inDungeon = true
    else
        GSE.inDungeon = false
    end
    if difficulty == 2 then -- Heroic
        GSE.inHeroic = true
    else
        GSE.inHeroic = false
    end
    if difficulty == 8 then -- Mythic+
        GSE.inMythicPlus = true
    else
        GSE.inMythicPlus = false
    end

    if difficulty == 24 or difficulty == 33 then -- Timewalking  24 Dungeon, 33 raid
        GSE.inTimeWalking = true
    else
        GSE.inTimeWalking = false
    end
    if type == "raid" then
        GSE.inRaid = true
    else
        GSE.inRaid = false
    end
    if IsInGroup() then
        GSE.inParty = true
    else
        GSE.inParty = false
    end
    if type == "arena" then
        GSE.inArena = true
    else
        GSE.inArena = false
    end
    if type == "scenario" or difficulty == 167 or difficulty == 152 then
        GSE.inScenario = true
    else
        GSE.inScenario = false
    end

    GSE.PrintDebugMessage(
        table.concat(
            {
                "PVP: ",
                tostring(GSE.PVPFlag),
                " inMythic: ",
                tostring(GSE.inMythic),
                " inRaid: ",
                tostring(GSE.inRaid),
                " inDungeon ",
                tostring(GSE.inDungeon),
                " inHeroic ",
                tostring(GSE.inHeroic),
                " inArena ",
                tostring(GSE.inArena),
                " inTimeWalking ",
                tostring(GSE.inTimeWalking),
                " inMythicPlus ",
                tostring(GSE.inMythicPlus),
                " inScenario ",
                tostring(GSE.inScenario)
            }
        ),
        Statics.DebugModules["API"]
    )
    -- Force Reload of all Sequences
    GSE.UnsavedOptions.ReloadQueued = nil
    GSE.ReloadSequences()
end

function GSE:PLAYER_ENTERING_WORLD()
    GSE.PerformOneOffEvents()
    GSE.PrintAvailable = true
    GSE.PerformPrint()
    GSE.currentZone = GetRealZoneText()
    GSE:ZONE_CHANGED_NEW_AREA()
end

function GSE:ADDON_LOADED(event, addon)
    if addon == GNOME then
        GSE.LoadStorage(GSE.Library)

        if GSE.isEmpty(GSE3Storage[GSE.GetCurrentClassID()]) then
            GSE3Storage[GSE.GetCurrentClassID()] = {}
        end
        if GSE.isEmpty(GSE.Library[GSE.GetCurrentClassID()]) then
            GSE.Library[GSE.GetCurrentClassID()] = {}
        end
        if GSE.isEmpty(GSE.Library[0]) then
            GSE.Library[0] = {}
        end

        GSE.PrintDebugMessage("I am loaded")

        GSE:SendMessage(Statics.CoreLoadedMessage)

        -- Register the Sample Macros
        local seqnames = {}
        -- table.insert(seqnames, "Assorted Sample Macros")
        -- GSE.RegisterAddon("Samples", GSE.VersionString, seqnames)

        -- GSE:RegisterMessage(Statics.ReloadMessage, "processReload")

        -- table.insert(seqnames, "GSE2 Macros")
        -- GSE.RegisterAddon("GSE2Library", GSE.VersionString, seqnames)

        -- GSE:RegisterMessage(Statics.ReloadMessage, "processReload")

        LibStub("AceConfigDialog-3.0"):AddToBlizOptions("GSE", "|cffff0000GSE:|r Advanced Macro Compiler")
        if not GSEOptions.HideLoginMessage then
            GSE.Print(
                GSEOptions.AuthorColour ..
                    L["GSE: Advanced Macro Compiler loaded.|r  Type "] ..
                        GSEOptions.CommandColour .. L["/gse help|r to get started."],
                GNOME
            )
        end

        if GSE.isEmpty(GSEOptions) then
            GSE.SetDefaultOptions()
        end

        -- Added in 2.1.0
        if GSE.isEmpty(GSEOptions.MacroResetModifiers) then
            GSEOptions.MacroResetModifiers = {}
            GSEOptions.MacroResetModifiers["LeftButton"] = false
            GSEOptions.MacroResetModifiers["RighttButton"] = false
            GSEOptions.MacroResetModifiers["MiddleButton"] = false
            GSEOptions.MacroResetModifiers["Button4"] = false
            GSEOptions.MacroResetModifiers["Button5"] = false
            GSEOptions.MacroResetModifiers["LeftAlt"] = false
            GSEOptions.MacroResetModifiers["RightAlt"] = false
            GSEOptions.MacroResetModifiers["Alt"] = false
            GSEOptions.MacroResetModifiers["LeftControl"] = false
            GSEOptions.MacroResetModifiers["RightControl"] = false
            GSEOptions.MacroResetModifiers["Control"] = false
            GSEOptions.MacroResetModifiers["LeftShift"] = false
            GSEOptions.MacroResetModifiers["RightShift"] = false
            GSEOptions.MacroResetModifiers["Shift"] = false
            GSEOptions.MacroResetModifiers["LeftAlt"] = false
            GSEOptions.MacroResetModifiers["RightAlt"] = false
            GSEOptions.MacroResetModifiers["AnyMod"] = false
        end

        -- Fix issue where IsAnyShiftKeyDown() was referenced instead of IsShiftKeyDown() #327
        if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyShift"]) then
            GSEOptions.MacroResetModifiers["Shift"] = GSEOptions.MacroResetModifiers["AnyShift"]
            GSEOptions.MacroResetModifiers["AnyShift"] = nil
        end
        if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyControl"]) then
            GSEOptions.MacroResetModifiers["Control"] = GSEOptions.MacroResetModifiers["AnyControl"]
            GSEOptions.MacroResetModifiers["AnyControl"] = nil
        end
        if not GSE.isEmpty(GSEOptions.MacroResetModifiers["AnyAlt"]) then
            GSEOptions.MacroResetModifiers["Alt"] = GSEOptions.MacroResetModifiers["AnyAlt"]
            GSEOptions.MacroResetModifiers["AnyAlt"] = nil
        end

        if GSE.isEmpty(GSEOptions.showMiniMap) then
            GSEOptions.showMiniMap = {
                hide = true
            }
        end
        GSE.WagoAnalytics:Switch("minimapIcon", GSEOptions.showMiniMap.hide)
    end
end

function GSE:PLAYER_REGEN_ENABLED(unit, event, addon)
    GSE:UnregisterEvent("PLAYER_REGEN_ENABLED")
    GSE.ResetButtons()
    GSE:RegisterEvent("PLAYER_REGEN_ENABLED")
end

function GSE:PLAYER_LOGOUT()
    GSE.PrepareLogout()
end

function GSE:PLAYER_SPECIALIZATION_CHANGED()
    GSE.ReloadSequences()
end

function GSE:PLAYER_LEVEL_UP()
    GSE.ReloadSequences()
end

function GSE:CHARACTER_POINTS_CHANGED()
    GSE.ReloadSequences()
end

function GSE:SPELLS_CHANGED()
    GSE.ReloadSequences()
end

function GSE:ACTIVE_TALENT_GROUP_CHANGED()
    GSE.ReloadSequences()
end

function GSE:PLAYER_PVP_TALENT_UPDATE()
    GSE.ReloadSequences()
end

function GSE:SPEC_INVOLUNTARILY_CHANGED()
    GSE.ReloadSequences()
end

function GSE:PLAYER_TALENT_UPDATE()
    GSE.ReloadSequences()
end

function GSE:TRAIT_NODE_CHANGED()
    GSE.ReloadSequences()
end
function GSE:TRAIT_NODE_CHANGED_PARTIAL()
    GSE.ReloadSequences()
end
function GSE:TRAIT_NODE_ENTRY_UPDATED()
    GSE.ReloadSequences()
end
function GSE:TRAIT_TREE_CHANGED()
    GSE:UnregisterEvent("TRAIT_TREE_CHANGED")
    GSE.ReloadSequences()
    GSE:RegisterEvent("TRAIT_TREE_CHANGED")
end

function GSE:PLAYER_TARGET_CHANGED()
    GSE:UnregisterEvent("PLAYER_TARGET_CHANGED")
    if GSE.isEmpty(GSE.UnsavedOptions.ReloadQueued) and not InCombatLockdown() then
        GSE.ReloadSequences()
    end
    GSE:RegisterEvent("PLAYER_TARGET_CHANGED")
end

function GSE:TRAIT_CONFIG_UPDATED()
    GSE:UnregisterEvent("TRAIT_CONFIG_UPDATED")
    GSE.ReloadSequences()
    GSE:RegisterEvent("TRAIT_CONFIG_UPDATED")
end
function GSE:ACTIVE_COMBAT_CONFIG_CHANGED()
    GSE.ReloadSequences()
end

function GSE:GROUP_ROSTER_UPDATE(...)
    -- Serialisation stuff
    GSE.sendVersionCheck()
    for k, _ in pairs(GSE.UnsavedOptions["PartyUsers"]) do
        if not (UnitInParty(k) or UnitInRaid(k)) then
            -- Take them out of the list
            GSE.UnsavedOptions["PartyUsers"][k] = nil
        end
    end
    local channel
    if IsInRaid() then
        channel =
            (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or
            "RAID"
    else
        channel =
            (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or
            "PARTY"
    end
    if #GSE.UnsavedOptions["PartyUsers"] > 1 then
        GSE.SendSpellCache(channel)
    end
    -- Group Team stuff
    GSE:ZONE_CHANGED_NEW_AREA()
end

function GSE:GUILD_ROSTER_UPDATE(...)
    -- Serialisation stuff
    GSE.sendVersionCheck("GUILD")
end

GSE:RegisterEvent("GROUP_ROSTER_UPDATE")
GSE:RegisterEvent("PLAYER_LOGOUT")
GSE:RegisterEvent("PLAYER_ENTERING_WORLD")
GSE:RegisterEvent("PLAYER_REGEN_ENABLED")
GSE:RegisterEvent("ADDON_LOADED")
GSE:RegisterEvent("ZONE_CHANGED_NEW_AREA")
GSE:RegisterEvent("UNIT_FACTION")
GSE:RegisterEvent("PLAYER_LEVEL_UP")
GSE:RegisterEvent("GUILD_ROSTER_UPDATE")
GSE:RegisterEvent("PLAYER_TARGET_CHANGED")

if GSE.GameMode > 8 then
    GSE:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    GSE:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
    GSE:RegisterEvent("PLAYER_PVP_TALENT_UPDATE")
end

if GSE.GameMode >= 10 then
    GSE:RegisterEvent("PLAYER_TALENT_UPDATE")
    GSE:RegisterEvent("SPEC_INVOLUNTARILY_CHANGED")
    GSE:RegisterEvent("TRAIT_NODE_CHANGED")
    GSE:RegisterEvent("TRAIT_NODE_CHANGED_PARTIAL")
    GSE:RegisterEvent("TRAIT_NODE_ENTRY_UPDATED")
    GSE:RegisterEvent("TRAIT_TREE_CHANGED")
    GSE:RegisterEvent("TRAIT_CONFIG_UPDATED")
    GSE:RegisterEvent("ACTIVE_COMBAT_CONFIG_CHANGED")
end

if GSE.GameMode <= 3 then
    GSE:RegisterEvent("CHARACTER_POINTS_CHANGED")
    GSE:RegisterEvent("SPELLS_CHANGED")
end

function GSE:OnEnable()
    GSE.StartOOCTimer()
end

--- Start the OOC Queue Timer
function GSE.StartOOCTimer()
    GSE.OOCTimer =
        GSE:ScheduleRepeatingTimer("ProcessOOCQueue", GSEOptions.OOCQueueDelay and GSEOptions.OOCQueueDelay or 7)
end

--- Stop the OOC Queue Timer
function GSE.StopOOCTimer()
    GSE:CancelTimer(GSE.OOCTimer)
    GSE.OOCTimer = nil
end

function GSE:ProcessOOCQueue()
    -- check ZONE_CHANGED_NEW_AREA issues
    if GSE.currentZone ~= GetRealZoneText() then
        GSE:ZONE_CHANGED_NEW_AREA()
        GSE.currentZone = GetRealZoneText()
    end
    for k, v in ipairs(GSE.OOCQueue) do
        if not InCombatLockdown() then
            if v.action == "UpdateSequence" then
                GSE.OOCUpdateSequence(v.name, v.macroversion)
            elseif v.action == "Save" then
                GSE.OOCAddSequenceToCollection(v.sequencename, v.sequence, v.classid)
            elseif v.action == "Replace" then
                if GSE.isEmpty(GSE.Library[v.classid][v.sequencename]) then
                    GSE.AddSequenceToCollection(v.sequencename, v.sequence, v.classid)
                else
                    GSE.ReplaceMacro(v.classid, v.sequencename, v.sequence)
                    GSE.UpdateSequence(v.sequencename, v.sequence.Macros[GSE.GetActiveSequenceVersion(v.sequencename)])
                end
                if v.checkmacro then
                    GSE.CheckMacroCreated(v.sequencename, v.checkmacro)
                end
            elseif v.action == "openviewer" then
                GSE.CheckGUI()
                GSE.GUIShowViewer()
            elseif v.action == "CheckMacroCreated" then
                GSE.OOCCheckMacroCreated(v.sequencename, v.create)
            elseif v.action == "MergeSequence" then
                GSE.OOCPerformMergeAction(v.mergeaction, v.classid, v.sequencename, v.newSequence)
            elseif v.action == "FinishReload" then
                GSE.UnsavedOptions.ReloadQueued = nil
            end
            GSE.OOCQueue[k] = nil
        end
    end
    if not GSE.isEmpty(GSE.GCDLDB) then
        GSE.GCDLDB.value = GSE.GetGCD()
        GSE.GCDLDB.text = string.format("GCD: %ss", GSE.GetGCD())
    end
end

function GSE.ToggleOOCQueue()
    if GSE.isEmpty(GSE.OOCTimer) then
        GSE.StartOOCTimer()
    else
        GSE.StopOOCTimer()
    end
end

local loadAddon = C_AddOns and C_AddOns.LoadAddOn or LoadAddOn

function GSE.CheckGUI()
    local loaded, reason = loadAddon("GSE_GUI")
    if not loaded then
        if reason == "DISABLED" then
            GSE.PrintDebugMessage("GSE GUI Disabled", "GSE_GUI")
            GSE.Print(
                L["The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."]
            )
        elseif reason == "MISSING" then
            GSE.Print(L["The GUI is missing.  Please ensure that your GSE install is complete."])
        elseif reason == "CORRUPT" then
            GSE.Print(L["The GUI is corrupt.  Please ensure that your GSE install is complete."])
        elseif reason == "INTERFACE_VERSION" then
            GSE.Print(L["The GUI needs updating.  Please ensure that your GSE install is complete."])
        end
    end
    return loaded
end

GSE.DebugProfile("Events")
