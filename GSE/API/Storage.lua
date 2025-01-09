local GSE = GSE
local Statics = GSE.Static

local L = GSE.L

local GNOME = "Storage"

--- Delete a sequence starting with the macro and then the sequence from the library
function GSE.DeleteSequence(classid, sequenceName)
    GSE.DeleteMacroStub(sequenceName)
    GSE.Library[tonumber(classid)][sequenceName] = nil
    GSE3Storage[tonumber(classid)][sequenceName] = nil
end

function GSE.CloneSequence(orig, keepcomments)
    local orig_type = type(orig)
    local copy
    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[GSE.CloneSequence(orig_key)] = GSE.CloneSequence(orig_value)
        end
        setmetatable(copy, GSE.CloneSequence(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    -- if not GSE.isEmpty(keepcomments) then
    --     for k,v in ipairs(copy.Macros) do
    --         -- TODO Strip COmments
    --     end
    -- end
    return copy
end

--- Add a sequence to the library
function GSE.AddSequenceToCollection(sequenceName, sequence, classid)
    local vals = {}
    vals.action = "Save"
    vals.sequencename = sequenceName
    vals.sequence = sequence
    vals.classid = classid
    table.insert(GSE.OOCQueue, vals)
end

function GSE.PerformMergeAction(action, classid, sequenceName, newSequence)
    local vals = {}
    vals.action = "MergeSequence"
    vals.sequencename = sequenceName
    vals.newSequence = newSequence
    vals.classid = classid
    vals.mergeaction = action
    table.insert(GSE.OOCQueue, vals)
end

--- Replace a current version of a Macro
function GSE.ReplaceMacro(classid, sequenceName, sequence)
    GSE3Storage[classid][sequenceName] = GSE.EncodeMessage({sequenceName, sequence})
    GSE.Library[classid][sequenceName] = sequence
end

--- Load the GSEStorage into a new table.
function GSE.LoadStorage(destination)
    if GSE.isEmpty(destination) then
        destination = {}
    end
    if GSE.isEmpty(GSE3Storage) then
        GSE3Storage = {}
        for iind = 0, 13 do
            GSE3Storage[iind] = {}
        end
    end
    for k = 0, 13 do
        if GSE.isEmpty(destination[k]) then
            destination[k] = {}
        end
        local v = GSE3Storage[k]
        for i, j in pairs(v) do
            local status, err =
                pcall(
                function()
                    local localsuccess, uncompressedVersion = GSE.DecodeMessage(j)
                    destination[k][i] = uncompressedVersion[2]
                end
            )
            if err then
                GSE.Print(
                    "There was an error processing " ..
                        i .. ", You will need to reimport this macro from another source.",
                    err
                )
            end
        end
    end
end

--- Load a collection of Sequences
function GSE.ImportCompressedMacroCollection(Sequences)
    for _, v in ipairs(Sequences) do
        GSE.ImportSerialisedSequence(v)
    end
end
--- Return the Active Sequence Version for a Sequence.
function GSE.GetActiveSequenceVersion(sequenceName)
    local classid = GSE.GetCurrentClassID()
    if GSE.isEmpty(GSE.Library[GSE.GetCurrentClassID()][sequenceName]) then
        classid = 0
    end
    -- Set to default or 1 if no default
    local vers = 1
    if GSE.isEmpty(GSE.Library[classid][sequenceName]) then
        return
    end
    if not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Default) then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Default
    end
    if not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Scenario) and GSE.inScenario then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Scenario
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Arena) and GSE.inArena then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Arena
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].PVP) and GSE.inArena then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Arena
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].PVP) and GSE.PVPFlag then
        vers = GSE.Library[classid][sequenceName]["MetaData"].PVP
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Raid) and GSE.inRaid then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Raid
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Mythic) and GSE.inMythic then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Mythic
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].MythicPlus) and GSE.inMythicPlus then
        vers = GSE.Library[classid][sequenceName]["MetaData"].MythicPlus
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Heroic) and GSE.inHeroic then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Heroic
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Dungeon) and GSE.inDungeon then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Dungeon
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Timewalking) and GSE.inTimeWalking then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Timewalking
    elseif not GSE.isEmpty(GSE.Library[classid][sequenceName]["MetaData"].Party) and GSE.inParty then
        vers = GSE.Library[classid][sequenceName]["MetaData"].Party
    end
    if vers == 0 then
        vers = 1
    end
    return vers
end

function GSE.ReloadSequences()
    if GSE.isEmpty(GSE.UnsavedOptions.ReloadQueued) then
        GSE.PerformReloadSequences()
        GSE.UnsavedOptions.ReloadQueued = true
    end
end

function GSE.PerformReloadSequences()
    GSE.PrintDebugMessage("Reloading Sequences", Statics.DebugModules["Storage"])

    for name, sequence in pairs(GSE.Library[GSE.GetCurrentClassID()]) do
        -- check that the macro exists.  This will cause an issue if people are calling macros that are in GSE but there is no macro stub made.
        local sequenceIndex = GetMacroIndexByName(name)
        if sequenceIndex > 0 then
            GSE.UpdateSequence(name, sequence.Macros[GSE.GetActiveSequenceVersion(name)])
        end
    end
    if GSEOptions.CreateGlobalButtons then
        if not GSE.isEmpty(GSE.Library[0]) then
            for name, sequence in pairs(GSE.Library[0]) do
                -- check that the macro exists.  This will cause an issue if people are calling macros that are in GSE but there is no macro stub made.
                local sequenceIndex = GetMacroIndexByName(name)
                if sequenceIndex > 0 then
                    GSE.UpdateSequence(name, sequence.Macros[GSE.GetActiveSequenceVersion(name)])
                end
            end
        end
    end
    local vals = {}
    vals.action = "FinishReload"
    table.insert(GSE.OOCQueue, vals)
end

function GSE.PrepareLogout(deletenonlocalmacros)
    GSE.CleanMacroLibrary(deletenonlocalmacros)
    if GSEOptions.deleteOrphansOnLogout and GSE.Utils then
        GSE.CleanOrphanSequences()
    end
end

--- This function is used to clean the local sequence library
function GSE.CleanMacroLibrary(forcedelete)
    -- Clean out the sequences database except for the current version
    if forcedelete then
        GSE3Storage[GSE.GetCurrentClassID()] = nil
        GSE3Storage[GSE.GetCurrentClassID()] = {}
        GSE.Library[GSE.GetCurrentClassID()] = nil
        GSE.Library[GSE.GetCurrentClassID()] = {}
    end
end

--- This function resets a gsebutton back to its initial setting
function GSE.ResetButtons()
    for k, _ in pairs(GSE.UsedSequences) do
        local gsebutton = _G[k]
        if gsebutton:GetAttribute("combatreset") == true then
            gsebutton:SetAttribute("step", 1)
            GSE.UpdateIcon(gsebutton, true)
            GSE.UsedSequences[k] = nil
        end
    end
end

--- This functions schedules an update to a sequence in the OOCQueue.
function GSE.UpdateSequence(name, sequence)
    local vals = {}
    vals.action = "UpdateSequence"
    vals.name = name
    vals.macroversion = sequence
    table.insert(GSE.OOCQueue, vals)
end

--- This function updates the button for an existing sequence.  It is called from the OOC queue
function GSE.OOCUpdateSequence(name, sequence)
    if GSE.isEmpty(sequence) then
        return
    end
    if GSE.isEmpty(name) then
        return
    end
    if GSE.isEmpty(GSE.Library[GSE.GetCurrentClassID()][name]) and GSE.isEmpty(GSE.Library[0][name]) then
        return
    end

    local combatReset = false
    if GSE.isEmpty(sequence.InbuiltVariables) then
        sequence.InbuiltVariables = {["Combat"] = false}
    end
    if sequence.InbuiltVariables.Combat or GSE.GetResetOOC() then
        combatReset = true
    end

    local compiledTemplate = GSE.CompileTemplate(sequence)
    local actionCount = table.getn(compiledTemplate)
    if actionCount > 255 then
        GSE.Print(
            string.format(
                L[
                    "%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."
                ],
                name,
                actionCount
            ),
            "MACRO ERROR"
        )
    end
    GSE.CreateGSE3Button(compiledTemplate, name, combatReset)
end

--- Return whether to store the macro in Personal Character Macros or Account Macros
function GSE.SetMacroLocation()
    local numAccountMacros, numCharacterMacros = GetNumMacros()
    local returnval = 1
    if numCharacterMacros >= MAX_CHARACTER_MACROS - 1 and GSEOptions.overflowPersonalMacros then
        returnval = nil
    end
    return returnval
end

function GSE.CreateMacroString(macroname)
    local returnVal = "#showtooltip\n/click "
    local state = GSE.GetMacroStringFormat()
    local t = state == "DOWN" and "t" or "f"

    if GSE.GetMacroStringFormat() == "DOWN" or GSEOptions.MacroResetModifiers["LeftButton"] then
        returnVal = returnVal .. "[button:1] " .. macroname .. " LeftButton " .. t .. "; "
    end
    if GSEOptions.MacroResetModifiers["RightButton"] then
        returnVal = returnVal .. "[button:2] " .. macroname .. " RightButton " .. t .. "; "
    end
    if GSEOptions.MacroResetModifiers["MiddleButton"] then
        returnVal = returnVal .. "[button:3] " .. macroname .. " MiddleButton " .. t .. "; "
    end
    if GSEOptions.MacroResetModifiers["Button4"] then
        returnVal = returnVal .. "[button:4] " .. macroname .. " Button4 " .. t .. "; "
    end
    if GSEOptions.MacroResetModifiers["Button5"] then
        returnVal = returnVal .. "[button:5] " .. macroname .. " Button5 " .. t .. "; "
    end
    if GSEOptions.virtualButtonSupport then
        returnVal = returnVal .. "[nobutton:1] " .. macroname .. "; "
    end

    returnVal = returnVal .. macroname
    return returnVal
end

function GSE.UpdateMacroString()
    local maxmacros = MAX_ACCOUNT_MACROS + MAX_CHARACTER_MACROS + 2
    for macid = 1, maxmacros do
        local mname, _, _ = GetMacroInfo(macid)
        if not GSE.isEmpty(mname) then
            if not GSE.isEmpty(GSE.Library[GSE.GetCurrentClassID()][mname]) then
                EditMacro(macid, nil, nil, GSE.CreateMacroString(mname))
                GSE.PrintDebugMessage(string.format("Updating macro %s to %s", mname, GSE.CreateMacroString(mname)))
            end
            if not GSE.isEmpty(GSE.Library[0]) then
                if not GSE.isEmpty(GSE.Library[0][mname]) then
                    EditMacro(macid, nil, nil, GSE.CreateMacroString(mname))
                    GSE.PrintDebugMessage(string.format("Updating macro %s to %s", mname, GSE.CreateMacroString(mname)))
                end
            end
        end
    end
end

--- Add a Create Macro to the Out of Combat Queue
function GSE.CheckMacroCreated(SequenceName, create)
    local vals = {}
    vals.action = "CheckMacroCreated"
    vals.sequencename = SequenceName
    vals.create = create
    table.insert(GSE.OOCQueue, vals)
end

--- Check if a macro has been created and if the create flag is true and the macro hasn't been created, then create it.
function GSE.OOCCheckMacroCreated(SequenceName, create)
    local found = false

    local macroIndex = GetMacroIndexByName(SequenceName)
    if macroIndex and macroIndex ~= 0 then
        found = true
        if create then
            EditMacro(macroIndex, nil, nil, GSE.CreateMacroString(SequenceName))
        end
    else
        if create then
            GSE.CreateMacroIcon(SequenceName, Statics.QuestionMark)
            found = true
        end
    end
    return found
end

--- This removes a macro Stub.
function GSE.DeleteMacroStub(sequenceName)
    local mname, _, mbody = GetMacroInfo(sequenceName)
    if mname == sequenceName then
        local trimmedmbody = mbody:gsub("[^%w ]", "")
        local compar = GSE.CreateMacroString(mname)
        local trimmedcompar = compar:gsub("[^%w ]", "")
        if string.lower(trimmedmbody) == string.lower(trimmedcompar) then
            GSE.Print(L[" Deleted Orphaned Macro "] .. mname, GNOME)
            DeleteMacro(sequenceName)
        end
    end
end

--- This returns a list of Sequence Names for the current spec
function GSE.GetSequenceNames(Library)
    if not Library then
        Library = GSE.Library
    end
    if GSE.isEmpty(GSEOptions.filterList) then
        GSEOptions.filterList = {}
        GSEOptions.filterList[Statics.Spec] = true
        GSEOptions.filterList[Statics.Class] = true
        GSEOptions.filterList[Statics.All] = false
        GSEOptions.filterList[Statics.Global] = true
    end
    local keyset = {}
    for k, _ in pairs(Library) do
        if GSEOptions.filterList[Statics.All] or k == GSE.GetCurrentClassID() then
            for i, j in pairs(Library[k]) do
                local disable = 0
                if j.DisableEditor then
                    disable = 1
                end
                local keyLabel = k .. "," .. i .. "," .. disable
                if k == GSE.GetCurrentClassID() and GSEOptions.filterList["Class"] then
                    keyset[keyLabel] = i
                elseif k == GSE.GetCurrentClassID() and not GSEOptions.filterList["Class"] then
                    if j.MetaData.SpecID == GSE.GetCurrentSpecID() or j.MetaData.SpecID == GSE.GetCurrentClassID() then
                        keyset[keyLabel] = i
                    end
                else
                    keyset[keyLabel] = i
                end
            end
        else
            if k == 0 and GSEOptions.filterList[Statics.Global] then
                for i, j in pairs(Library[k]) do
                    local disable = 0
                    if j.DisableEditor then
                        disable = 1
                    end
                    local keyLabel = k .. "," .. i .. "," .. disable
                    keyset[keyLabel] = i
                end
            end
        end
    end

    return keyset
end

--- Return the Macro Icon for the specified Sequence
function GSE.GetMacroIcon(classid, sequenceIndex)
    classid = tonumber(classid)
    GSE.PrintDebugMessage("sequenceIndex: " .. (GSE.isEmpty(sequenceIndex) and "No value" or sequenceIndex), GNOME)
    classid = tonumber(classid)
    local macindex = GetMacroIndexByName(sequenceIndex)
    local a, iconid, c = GetMacroInfo(macindex)
    if not GSE.isEmpty(a) then
        GSE.PrintDebugMessage(
            "Macro Found " ..
                a ..
                    " with iconid " ..
                        (GSE.isEmpty(iconid) and "of no value" or iconid) ..
                            " " .. (GSE.isEmpty(iconid) and L["with no body"] or c),
            GNOME
        )
    else
        GSE.PrintDebugMessage("No Macro Found. Possibly different spec for Sequence " .. sequenceIndex, GNOME)
        return GSEOptions.DefaultDisabledMacroIcon
    end

    local sequence = GSE.Library[classid][sequenceIndex]
    if GSE.isEmpty(sequence) then
        GSE.PrintDebugMessage("No Macro Found. Possibly different spec for Sequence " .. sequenceIndex, GNOME)
        return GSEOptions.DefaultDisabledMacroIcon
    end
    if GSE.isEmpty(sequence.Icon) and GSE.isEmpty(iconid) then
        GSE.PrintDebugMessage("SequenceSpecID: " .. sequence.Metadata.SpecID, GNOME)
        if sequence.Metadata.SpecID == 0 then
            return "INV_MISC_QUESTIONMARK"
        else
            local _, _, _, specicon, _, _, _ =
                GetSpecializationInfoByID(
                (GSE.isEmpty(sequence.Metadata.SpecID) and GSE.GetCurrentSpecID() or sequence.Metadata.SpecID)
            )
            GSE.PrintDebugMessage("No Sequence Icon setting to " .. strsub(specicon, 17), GNOME)
            return strsub(specicon, 17)
        end
    elseif GSE.isEmpty(iconid) and not GSE.isEmpty(sequence.Icon) then
        return sequence.Icon
    else
        return iconid
    end
end

function GSE.UpdateIcon(self, reset)
    local step = self:GetAttribute("step") or 1
    local gsebutton = self:GetName()
    local executionseq = GSE.SequencesExec[gsebutton]
    local commandline, foundSpell, notSpell = executionseq[step], false, ""
    for cmd, etc in gmatch(commandline or "", "/(%w+)%s+([^\n]+)") do
        if Statics.CastCmds[strlower(cmd)] or strlower(cmd) == "castsequence" then
            local spell, target = SecureCmdOptionParse(etc)
            if not reset and GSE.Utils then
                GSE.TraceSequence(gsebutton, step, spell)
            end
            if spell then
                local GetSpellInfo = C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo
                if GetSpellInfo(spell) then
                    SetMacroSpell(gsebutton, spell, target)
                    foundSpell = true
                    break
                elseif notSpell == "" then
                    notSpell = spell
                end
            end
            if strlower(cmd) == "castsequence" then
                local index, csitem, csspell = QueryCastSequence(etc)
                if not GSE.isEmpty(csitem) then
                    SetMacroSpell(gsebutton, csitem, target)
                    foundSpell = true
                end
                if not GSE.isEmpty(csspell) then
                    SetMacroSpell(gsebutton, csspell, target)
                    foundSpell = true
                end
            end
        end
    end
    if not foundSpell then
        SetMacroItem(gsebutton, notSpell)
    end
    if not reset then
        GSE.UsedSequences[gsebutton] = true
    end
    GSE.WagoAnalytics:Switch(gsebutton .. "_" .. GSE.GetCurrentClassID(), true)
end

--- Takes a collection of Sequences and returns a list of names
function GSE.GetSequenceNamesFromLibrary(library)
    local sequenceNames = {}
    for k, _ in pairs(library) do
        table.insert(sequenceNames, k)
    end
    return sequenceNames
end

--- This function returns in addition to the stepfunction for the KeyBind to Reset a sequence
function GSE.GetMacroResetImplementation()
    local activemods = {}
    local returnstring = ""
    local flagactive = false

    -- Extra null check just in case.
    if GSE.isEmpty(GSEOptions.MacroResetModifiers) then
        GSE.resetMacroResetModifiers()
    end

    for k, v in pairs(GSEOptions.MacroResetModifiers) do
        if v == true then
            flagactive = true
            if string.find(k, "Button") then
                table.insert(activemods, 'GetMouseButtonClicked() == "' .. k .. '"')
            else
                table.insert(activemods, "Is" .. k .. "KeyDown() == true")
            end
        end
    end
    if flagactive then
        returnstring = string.format(Statics.MacroResetSkeleton, table.concat(activemods, " and "))
    end
    return returnstring
end

--- This function takes a text string and compresses it without loading it to the library
function GSE.CompressSequenceFromString(importstring)
    local importStr = GSE.StripControlandExtendedCodes(importstring)
    local returnstr = ""
    local functiondefinition = GSE.FixQuotes(importStr) .. [===[
  return Sequences
  ]===]

    local fake_globals =
        setmetatable(
        {
            Sequences = {}
        },
        {
            __index = _G
        }
    )
    local func, err = loadstring(functiondefinition, "Storage")
    if func then
        -- Make the compiled function see this table as its "globals"
        setfenv(func, fake_globals)

        local TempSequences = assert(func())
        if not GSE.isEmpty(TempSequences) then
            for k, v in pairs(TempSequences) do
                returnstr = GSE.ExportSequence(v, k, false, "ID", false)
            end
        end
    end
    return returnstr
end

--- This function takes a text string and decompresses it without loading it to the library
function GSE.DecompressSequenceFromString(importstring)
    local decompresssuccess, actiontable = GSE.DecodeMessage(importstring)
    local returnstr = ""
    local seqName = ""
    if
        (decompresssuccess) and (table.getn(actiontable) == 2) and (type(actiontable[1]) == "string") and
            (type(actiontable[2]) == "table")
     then
        seqName = string.upper(actiontable[1])
        returnstr = GSE.Dump(actiontable[2])
    end
    return returnstr, seqName, decompresssuccess
end

function GSE.GetSequenceSummary()
    local returntable = {}
    for k, v in ipairs(GSE.Library) do
        returntable[k] = {}
        for i, j in pairs(v) do
            returntable[k][i] = {}
            returntable[k][i].Help = j["MetaData"].Help
            returntable[k][i].LastUpdated = j["MetaData"].LastUpdated
        end
    end
    return returntable
end

local function buildAction(action, metaData, variables)
    if action.Type == Statics.Actions.Loop then
        -- we have a loop within a loop
        return GSE.processAction(action, metaData, variables)
    else
        if GSE.GetRequireTarget() then
            -- See #20 prevent target hopping
            table.insert(action, 1, "/stopmacro [@playertarget, noexists]")
        end

        for k, v in ipairs(action) do
            action[k] = GSE.TranslateString(v, "STRING", nil, true)
        end

        if not GSE.isEmpty(metaData) then
            if metaData.Ring1 or (metaData.Ring1 == nil and GSE.GetUse11()) then
                table.insert(action, "/use [combat,nochanneling] 11")
            end
            if metaData.Ring2 or (metaData.Ring2 == nil and GSE.GetUse12()) then
                table.insert(action, "/use [combat,nochanneling] 12")
            end
            if metaData.Trinket1 or (metaData.Trinket1 == nil and GSE.GetUse13()) then
                table.insert(action, "/use [combat,nochanneling] 13")
            end
            if metaData.Trinket2 or (metaData.Trinket2 == nil and GSE.GetUse14()) then
                table.insert(action, "/use [combat,nochanneling] 14")
            end
            if metaData.Neck or (metaData.Neck == nil and GSE.GetUse2()) then
                table.insert(action, "/use [combat,nochanneling] 2")
            end
            if metaData.Head or (metaData.Head == nil and GSE.GetUse1()) then
                table.insert(action, "/use [combat,nochanneling] 1")
            end
            if metaData.Belt or (metaData.Belt == nil and GSE.GetUse6()) then
                table.insert(action, "/use [combat,nochanneling] 6")
            end
        end
        if GSEOptions.hideUIErrors then
            table.insert(action, "/script UIErrorsFrame:Hide();")
        -- Potentially change this to UIErrorsFrame:Hide()
        end
        if GSEOptions.clearUIErrors then
            -- Potentially change this to UIErrorsFrame:Clear()
            table.insert(action, "/run UIErrorsFrame:Clear()")
        end

        return GSE.SafeConcat(action, "\n")
    end
end

local function processRepeats(actionList)
    local inserts = {}
    local removes = {}
    for k, v in ipairs(actionList) do
        if type(v) == "table" then
            table.insert(inserts, {Action = v.Action, Interval = v.Interval, Start = k})
            table.insert(removes, k)
        end
    end

    for i = #removes, 1, -1 do
        table.remove(actionList, removes[i])
    end

    for _, v in ipairs(inserts) do
        local startInterval = v["Interval"]
        if startInterval == 1 then
            startInterval = 2
        end
        local insertcount = math.ceil((#actionList - v["Start"]) / startInterval)
        insertcount = math.ceil((#actionList + insertcount - v["Start"]) / startInterval)
        local interval = v["Interval"]
        table.insert(actionList, v["Start"], v["Action"])
        for i = 1, insertcount do
            local insertpos = v["Start"] + i * interval
            table.insert(actionList, insertpos, v["Action"])
        end
    end
    return actionList
end

function GSE.processAction(action, metaData, variables)
    if action.Disabled then
        return
    end
    if action.Type == Statics.Actions.Loop then
        local actionList = {}
        -- setup the interation
        for id, v in ipairs(action) do
            local builtaction = GSE.processAction(v, metaData, variables)
            if type(builtaction) == "table" and GSE.isEmpty(builtaction.Interval) then
                for _, j in ipairs(builtaction) do
                    table.insert(actionList, j)
                end
            elseif type(builtaction) == "table" and builtaction.Interval then
                builtaction.Action = GSE.ProcessLoopVariables(builtaction.Action, id)
                table.insert(actionList, builtaction)
            else
                if builtaction then
                    builtaction = GSE.ProcessLoopVariables(builtaction, id)
                end
                table.insert(actionList, builtaction)
            end
        end
        local returnActions = {}
        local loop = tonumber(action.Repeat)
        if GSE.isEmpty(loop) or loop < 1 then
            loop = 1
        end
        for _ = 1, loop do
            if action.StepFunction == Statics.Priority or action.StepFunction == Statics.ReversePriority then
                local limit = 1
                local step = 1
                local looplimit = 0
                for x = 1, table.getn(actionList) do
                    looplimit = looplimit + x
                end
                if action.StepFunction == Statics.Priority then
                    for _ = 1, looplimit do
                        table.insert(returnActions, actionList[step])
                        if step == limit then
                            limit = limit % #actionList + 1
                            step = 1
                            GSE.PrintDebugMessage("Limit is now " .. limit, "Storage")
                        else
                            step = step + 1
                        end
                    end
                else
                    for _ = looplimit, 1, -1 do
                        table.insert(returnActions, actionList[step])
                        if step == 1 then
                            limit = limit % #actionList + 1
                            step = limit
                            GSE.PrintDebugMessage("Limit is now " .. limit, "Storage")
                        else
                            step = step - 1
                        end
                    end
                end
            elseif action.StepFunction == Statics.Random then
                for _ = 1, #actionList do
                    local randomAction = math.random(1, #actionList)
                    table.insert(returnActions, actionList[randomAction])
                    table.remove(actionList, randomAction)
                end
            else
                for _, v in ipairs(actionList) do
                    table.insert(returnActions, v)
                end
            end
        end

        -- process repeats for the block
        return processRepeats(returnActions)
    elseif action.Type == Statics.Actions.Pause then
        local PauseActions = {}
        local clicks = action.Clicks and action.Clicks or 0
        if not GSE.isEmpty(action.Variable) then
            if action.Variable == "GCD" then
                clicks = GSE.GetGCD() * 1000 / GSE.GetClickRate()
            else
                local funcline = GSE.RemoveComments(variables[action.Variable])

                funcline = string.sub(table.concat(funcline, "\n"), 11)
                funcline = funcline:sub(1, -4)
                funcline = loadstring(funcline)
                local value
                if funcline ~= nil then
                    value = funcline
                    value = value()
                end
                clicks = tonumber(value) / GSE.GetClickRate()
            end
        elseif not GSE.isEmpty(action.MS) then
            if action.MS == "GCD" or action.MS == "~~GCD~~" then
                clicks = GSE.GetGCD() * 1000 / GSE.GetClickRate()
            else
                clicks = action.MS and action.MS and 1000 -- pause for 1 second if no ms specified.
                clicks = math.ceil(clicks / GSE.GetClickRate())
            end
        end
        if clicks > 1 then
            for loop = 1, clicks do
                table.insert(PauseActions, "/click GSE.Pause")
                GSE.PrintDebugMessage(loop, "Storage1")
            end
        end
        -- print(#PauseActions, GSE.Dump(action))
        return PauseActions
    elseif action.Type == Statics.Actions.Repeat then
        if GSE.isEmpty(action.Interval) then
            if not GSE.isEmpty(action.Repeat) then
                action.Interval = action.Repeat
                action.Repeat = nil
            else
                action.Interval = 2
            end
        end
        local returnAction = {
            ["Action"] = buildAction(action, metaData),
            ["Interval"] = action.Interval
        }
        return returnAction
    elseif action.Type == Statics.Actions.If then
        if GSE.isEmpty(action.Variable) then
            GSE.Print(L["If Blocks Require a variable."], L["Macro Compile Error"])
            return
        end

        local funcline = GSE.RemoveComments(variables[action.Variable])

        funcline = string.sub(funcline, 11)
        funcline = funcline:sub(1, -4)
        funcline = loadstring(funcline)
        local value
        if funcline ~= nil then
            value = funcline
            value = value()
        end

        local actions
        if type(value) == "boolean" then
            if value == true then
                actions = action[1]
            else
                actions = action[2]
            end
        else
            GSE.Print(
                string.format(
                    L["Boolean not found.  There is a problem with %s not returning true or false."],
                    action.Variable
                ),
                L["Macro Compile Error"]
            )
            return
        end

        local actionList = {}
        for _, v in ipairs(actions) do
            local builtaction = GSE.processAction(v, metaData, variables)
            if type(builtaction) == "table" and GSE.isEmpty(builtaction.Interval) then
                for _, j in ipairs(builtaction) do
                    table.insert(actionList, j)
                end
            else
                table.insert(actionList, builtaction)
            end
        end

        -- process repeats for the block
        return processRepeats(actionList)
    elseif action.Type == Statics.Actions.Action then
        return buildAction(action, metaData)
    end
end

--- Compiles a macro template into a macro
function GSE.CompileTemplate(macro)
    if #macro.Actions < 1 then
        -- return early nothing to compile
        return {}
    end
    -- print(#macro.Actions)
    local template = GSE.CloneSequence(macro)
    setmetatable(
        template.Actions,
        {
            __index = function(t, k)
                for _, v in ipairs(k) do
                    if not t then
                        error("attempt to index nil")
                    end
                    t = rawget(t, v)
                end
                return t
            end,
            __newindex = function(t, key, v)
                local last_k
                for _, k in ipairs(key) do
                    k, last_k = last_k, k
                    if k ~= nil then
                        local parent_t = t
                        t = rawget(parent_t, k)
                        if t == nil then
                            t = {}
                            rawset(parent_t, k, t)
                        end
                        if type(t) ~= "table" then
                            error("Unexpected subtable", 2)
                        end
                    end
                end
                rawset(t, last_k, v)
            end
        }
    )

    local actions = {
        ["Type"] = "Loop",
        ["Repeat"] = "1"
    }
    for _, action in ipairs(template.Actions) do
        table.insert(actions, GSE.TranslateSequence(action, Statics.TranslatorMode.String, true))
    end
    local compiledMacro = GSE.processAction(actions, template.InbuiltVariables, template.Variables)

    local variables = {}

    for k, v in pairs(template.Variables) do
        if type(v) == "table" then
            for i, j in ipairs(v) do
                template.Variables[k][i] = GSE.TranslateString(j, Statics.TranslatorMode.String, nil, true)
            end
            variables[k] = GSE.RemoveComments(template.Variables[k])
        end
    end

    return GSE.UnEscapeTable(GSE.ProcessVariables(compiledMacro, variables)), template
end

local function PCallCreateGSE3Button(macro, name, combatReset)
    if GSE.isEmpty(macro) then
        print("Macro missing for ", name)
        return
    end
    if GSE.isEmpty(combatReset) then
        combatReset = false
    end

    -- name = name .. "T"
    GSE.SequencesExec[name] = macro

    -- if button already exists no need to recreate it.  Maybe able to create this in combat.
    if GSE.isEmpty(_G[name]) then
        local gsebutton = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
        gsebutton:SetAttribute("type", "macro")
        gsebutton:SetAttribute("step", 1)
        gsebutton.UpdateIcon = GSE.UpdateIcon
        gsebutton:RegisterForClicks("AnyUp", "AnyDown")
        gsebutton:SetAttribute("combatreset", combatReset)

        local stepfunction =
            (GSEOptions.DebugPrintModConditionsOnKeyPress and Statics.PrintKeyModifiers or "") ..
            GSE.GetMacroResetImplementation() .. Statics.GSE3OnClick
        gsebutton:WrapScript(gsebutton, "OnClick", stepfunction)
    end
    _G[name]:Execute(
        "name, macros = self:GetName(), newtable([=======[" ..
            strjoin("]=======],[=======[", unpack(macro)) .. "]=======])"
    )
    if combatReset then
        _G[name]:SetAttribute("step", 1)
    end
    GSE.UpdateIcon(_G[name], true)
end

--- Build GSE3 Executable Buttons
function GSE.CreateGSE3Button(macro, name, combatReset)
    local status, err = pcall(PCallCreateGSE3Button, macro, name, combatReset)
    if err or not status then
        GSE.Print(
            string.format(
                "%s " ..
                    L["was unable to be programmed.  This macro will not fire until errors in the macro are corrected."],
                name
            ),
            "BROKEN MACRO"
        )
    end
end

GSE.DebugProfile("Storage")
