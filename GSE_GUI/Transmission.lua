local GSE = GSE

local Statics = GSE.Static

local L = GSE.L

function GSE.GUIShowTransmissionGui(inckey, editframe)
  local AceGUI = LibStub("AceGUI-3.0")
  local Completing = LibStub("AceGUI-3.0-Completing-EditBox")

  local transauthor = GetUnitName("player", true) .. "@" .. GetRealmName()
  local transauthorlen = string.len(transauthor)

  local transmissionFrame = AceGUI:Create("Frame")
  transmissionFrame.frame:SetFrameStrata("MEDIUM")
  transmissionFrame.frame:SetClampedToScreen(true)

  Completing:Register("ExampleAll", AUTOCOMPLETE_LIST.WHISPER)

  GSE.PrintDebugMessage("GSE Version " .. GSE.VersionString, Statics.SourceTransmission)

  local transSequencevalue = ""

  transmissionFrame:SetTitle(L["Send To"])
  transmissionFrame:SetCallback(
    "OnClose",
    function(widget)
      transmissionFrame:Hide()
    end
  )
  transmissionFrame:SetLayout("List")
  transmissionFrame:SetWidth(290)
  transmissionFrame:SetHeight(190)
  transmissionFrame:Hide()

  local SequenceListbox = AceGUI:Create("Dropdown")
  --SequenceListbox:SetLabel(L["Load Sequence"])
  SequenceListbox:SetWidth(250)
  SequenceListbox:SetCallback(
    "OnValueChanged",
    function(obj, event, key)
      transSequencevalue = key
    end
  )
  transmissionFrame.SequenceListbox = SequenceListbox
  transmissionFrame:AddChild(SequenceListbox)

  local playereditbox = AceGUI:Create("EditBoxExampleAll")
  playereditbox:SetLabel(L["Send To"])
  playereditbox:SetWidth(250)
  playereditbox:DisableButton(true)
  transmissionFrame:AddChild(playereditbox)

  local sendbutton = AceGUI:Create("Button")
  sendbutton:SetText(L["Send"])
  sendbutton:SetWidth(250)
  sendbutton:SetCallback(
    "OnClick",
    function()
      GSE.TransmitSequence(transSequencevalue, "WHISPER", playereditbox:GetText(), transmissionFrame)
    end
  )
  transmissionFrame:AddChild(sendbutton)

  if editframe then
    local point, relativeTo, relativePoint, xOfs, yOfs = editframe:GetPoint()

    transmissionFrame:ClearAllPoints()
    transmissionFrame:SetPoint("TOPLEFT", editframe.frame, editframe.Width + 10, 0)
  end

  local names = GSE.GetSequenceNames()
  transmissionFrame.SequenceListbox:SetList(names)
  if not GSE.isEmpty(inckey) then
    transmissionFrame.SequenceListbox:SetValue(inckey)
    transSequencevalue = inckey
  end
  transmissionFrame:Show()
  transmissionFrame:SetStatusText(L["Ready to Send"])
end
