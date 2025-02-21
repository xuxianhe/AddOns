local AddonName, SAO = ...

-- Apply all values from the database to the engine
function SAO.ApplyAllVariables(self)
    self:ApplySpellAlertOpacity();
    self:ApplySpellAlertGeometry();
    self:ApplySpellAlertTimer();
    self:ApplySpellAlertSound();
    self:ApplyGlowingButtonsToggle();
end

-- Apply spell alert opacity
function SAO.ApplySpellAlertOpacity(self)
    -- Change the main frame's visibility and opacity
    SpellActivationOverlayContainerFrame:SetShown(SpellActivationOverlayDB.alert.enabled);
    SpellActivationOverlayContainerFrame:SetAlpha(SpellActivationOverlayDB.alert.opacity);
end

-- Apply spell alert geometry i.e., scale and offset
function SAO.ApplySpellAlertGeometry(self)
    SpellActivationOverlayFrame.scale = SpellActivationOverlayDB.alert.scale;
    SpellActivationOverlayFrame.offset = SpellActivationOverlayDB.alert.offset;
    SpellActivationOverlay_OnChangeGeometry(SpellActivationOverlayFrame);
end

-- Apply spell alert progressive timer effect
function SAO.ApplySpellAlertTimer(self)
    SpellActivationOverlayFrame.useTimer = SpellActivationOverlayDB.alert.timer ~= 0;
    SpellActivationOverlay_OnChangeTimerVisibility(SpellActivationOverlayFrame);
end

-- Apply spell alert sound effects toggle
function SAO.ApplySpellAlertSound(self)
    SpellActivationOverlayFrame.useSound = SpellActivationOverlayDB.alert.sound ~= 0;
    SpellActivationOverlay_OnChangeSoundToggle(SpellActivationOverlayFrame);
end

-- Apply glowing buttons on/off
function SAO.ApplyGlowingButtonsToggle(self)
    -- Don't do anything
    -- Buttons will stop glowing by themselves, and will never light up again

    -- A better function would be to stop glowing / start glowing now
    -- But this would be more complex to code, and the benefit is minimal
end
