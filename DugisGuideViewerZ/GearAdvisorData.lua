local _, GAD, staticSpecs, unpackedSpecs, GetCreateTable, PackStrings

local DGV = DugisGuideViewer
local GAD = DGV:RegisterModule("GearAdvisorData")
GAD.essential = true


function GAD:Initialize()
    function GAD:Load()
        GetCreateTable, PackStrings = DGV.GetCreateTable, DGV.PackStrings

        staticSpecs = GetCreateTable()
        staticSpecs["DEATHKNIGHT:Blood"] = "CRIT_RATING,0.57:HASTE_RATING,0.55:STAMINA,0.001:ARMOR,0.01:DAMAGE,3.6:ARMOR_PENETRATION,1:STR,0.99:HIT_RATING,0.91:EXPERTISE_RATING,0.9:ATTACK_POWER,0.36:RED_SOCKET,8:BLUE_SOCKET,8:YELLOW_SOCKET,8"
        staticSpecs["DEATHKNIGHT:Frost"] = "STR,0.97:DAMAGE,3.37:ATTACK_POWER,0.35:HIT_RATING,1:EXPERTISE_RATING,0.81:CRIT_RATING,0.45:HASTE_RATING,0.28:ARMOR_PENETRATION,0.61:STAMINA,0.001:ARMOR,0.01:RED_SOCKET,8:BLUE_SOCKET,8:YELLOW_SOCKET,8"
        staticSpecs["DEATHKNIGHT:Unholy"] = "STR,1:DAMAGE,2.09:ATTACK_POWER,0.34:HIT_RATING,0.66:EXPERTISE_RATING,0.51:CRIT_RATING,0.45:HASTE_RATING,0.48:ARMOR_PENETRATION,0.32:STAMINA,0.001:ARMOR,0.01:RED_SOCKET,8:BLUE_SOCKET,8:YELLOW_SOCKET,8"				
        staticSpecs["PALADIN:Protection"] = "SPELL_POWER,0.44:MANA_REGEN,1:STA,1:ARMOR_PENETRATION,0.09:SPI,0.05:PARRY_RATING,0.6:EXPERTISE_RATING,0.27:DAMAGE_SPELL_POWER,0.44:HIT_RATING,0.16:DODGE_RATING,0.7:FIRE_RES,0.2:HASTE_RATING,0.5:ARMOR,0.02:ATTACK_POWER,0.06:HOLY_SPELL_POWER,0.44:YELLOW_SOCKET,8:STR,0.2:INT,0.5:SPELL_HIT_RATING,0.78:SPELL_CRIT_RATING,0.6:NATURE_RES,0.2:ARCANE_RES,0.2:SPELL_HASTE_RATING,0.12:MANA,0.045:HEALTH,0.09:SPELL_PENETRATION,0.03:BLUE_SOCKET,8:RED_SOCKET,8:SHADOW_RES,0.2:BLOCK_VALUE,0.15:FROST_RES,0.2:RESILIENCE_RATING,0.2:HEALTH_REGEN,2:DPS,1.77:AGI,0.6:BLOCK_RATING,0.6:DEFENSE_RATING,0.7:CRIT_RATING,0.15"
        staticSpecs["WARLOCK:Destruction"] = "SPELL_POWER,1:MANA_REGEN,0.65:STA,0.5:YELLOW_SOCKET,8:FIRE_SPELL_POWER,0.23:INT,0.34:SPELL_HIT_RATING,1.6:SPELL_CRIT_RATING,0.87:DAMAGE_SPELL_POWER,1:BLUE_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,1.15:RED_SOCKET,8:MANA,0.028:HEALTH,0.05:NATURE_RES,0.04:SPELL_PENETRATION,0.08:FIRE_RES,0.04:ARMOR,0.005:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPI,0.25:SHADOW_SPELL_POWER,0.95"
        staticSpecs["PALADIN:Retribution"] = "SPELL_POWER,0.33:MANA_REGEN,1:STA,0.5:ARMOR_PENETRATION,0.09:SPI,0.05:PARRY_RATING,0.05:EXPERTISE_RATING,0.87:DAMAGE_SPELL_POWER,0.33:HIT_RATING,0.84:FROST_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.25:ARMOR,0.005:ATTACK_POWER,0.41:HOLY_SPELL_POWER,0.33:YELLOW_SOCKET,8:STR,1:INT,0.34:SPELL_HIT_RATING,0.21:SPELL_CRIT_RATING,0.12:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.04:MANA,0.032:HEALTH,0.05:SPELL_PENETRATION,0.015:BLUE_SOCKET,8:RED_SOCKET,8:SHADOW_RES,0.04:DODGE_RATING,0.05:HEALTH_REGEN,1:DPS,5.4:AGI,0.64:RESILIENCE_RATING,0.2:DEFENSE_RATING,0.05:CRIT_RATING,0.66"
        staticSpecs["ROGUE:Combat"] = "DAMAGE,0.875:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:STR,0.5:SPI,0.05:PARRY_RATING,0.12:EXPERTISE_RATING,1.1:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:BLUE_SOCKET,8:HEALTH,0.05:RED_SOCKET,8:SHADOW_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.9:FROST_RES,0.04:DODGE_RATING,0.05:DEFENSE_RATING,0.05:ARMOR,0.005:HEALTH_REGEN,1:DPS,3:AGI,1:ATTACK_POWER,0.45:ARMOR_PENETRATION,0.24:CRIT_RATING,0.81"
        staticSpecs["PRIEST:Shadow"] = "SPELL_POWER,1:MANA_REGEN,1:STA,0.5:YELLOW_SOCKET,8:SPI,0.21:INT,0.19:SPELL_HIT_RATING,1.12:SPELL_CRIT_RATING,0.76:DAMAGE_SPELL_POWER,1:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.65:BLUE_SOCKET,8:MANA,0.017:HEALTH,0.05:RED_SOCKET,8:SPELL_PENETRATION,0.08:FIRE_RES,0.04:NATURE_RES,0.04:DODGE_RATING,0.05:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:HEALTH_REGEN,1:SHADOW_SPELL_POWER,1"
        staticSpecs["ROGUE:Assassination"] = "DAMAGE,1.25:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:ARMOR_PENETRATION,0.24:SPI,0.05:PARRY_RATING,0.12:EXPERTISE_RATING,1.1:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:BLUE_SOCKET,8:HEALTH,0.05:RED_SOCKET,8:SHADOW_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.9:FROST_RES,0.04:DODGE_RATING,0.05:DEFENSE_RATING,0.05:HEALTH_REGEN,1:ARMOR,0.005:DPS,3:AGI,1:ATTACK_POWER,0.45:STR,0.5:CRIT_RATING,0.81"
        staticSpecs["PALADIN:Holy"] = "SPELL_POWER,0.54:MANA_REGEN,1.24:STA,0.5:YELLOW_SOCKET,8:HEALING_SPELL_POWER,0.54:SPI,0.28:INT,1:SPELL_CRIT_RATING,0.46:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.39:MANA,0.009:DODGE_RATING,0.05:BLUE_SOCKET,8:FIRE_RES,0.04:BLOCK_RATING,0.01:RED_SOCKET,8:HEALTH,0.05:FROST_RES,0.04:RESILIENCE_RATING,0.2:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:PARRY_RATING,0.05:ARMOR,0.005"
        staticSpecs["DRUID:Restoration"] = "SPELL_POWER,1.21:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:HEALING_SPELL_POWER,1.21:SPI,0.87:INT,1:SPELL_CRIT_RATING,0.35:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.49:MANA,0.09:DODGE_RATING,0.05:FIRE_RES,0.04:BLUE_SOCKET,8:RED_SOCKET,8:MANA_REGEN,1.7:FROST_RES,0.04:HEALTH,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:PARRY_RATING,0.05:ARMOR,0.005"
        staticSpecs["SHAMAN:Enchance Two-Hand"] = "SPELL_POWER,0.3:DAMAGE,1.25:MANA_REGEN,1:STA,0.5:ARMOR_PENETRATION,0.12:SPI,0.05:PARRY_RATING,0.05:EXPERTISE_RATING,1.5:DAMAGE_SPELL_POWER,0.3:HIT_RATING,0.67:FROST_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.64:NATURE_SPELL_POWER,0.3:ARMOR,0.005:ATTACK_POWER,0.5:RESILIENCE_RATING,0.2:YELLOW_SOCKET,8:STR,1:INT,0.34:SPELL_HIT_RATING,0.223:SPELL_CRIT_RATING,0.326:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.08:MANA,0.032:HEALTH,0.05:SPELL_PENETRATION,0.11:BLUE_SOCKET,8:RED_SOCKET,8:SHADOW_RES,0.04:HEALTH_REGEN,1:DPS,3:AGI,0.87:DODGE_RATING,0.05:DEFENSE_RATING,0.05:CRIT_RATING,0.98"
        staticSpecs["SHAMAN:Enchance Dual Wield"] = "SPELL_POWER,0.3:MANA_REGEN,1:STA,0.5:ARMOR_PENETRATION,0.12:SPI,0.05:PARRY_RATING,0.05:EXPERTISE_RATING,1.5:DAMAGE_SPELL_POWER,0.3:HIT_RATING,0.67:FROST_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.64:NATURE_SPELL_POWER,0.3:ARMOR,0.005:ATTACK_POWER,0.5:RESILIENCE_RATING,0.2:YELLOW_SOCKET,8:STR,1:INT,0.34:SPELL_HIT_RATING,0.223:SPELL_CRIT_RATING,0.326:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.08:MANA,0.032:HEALTH,0.05:SPELL_PENETRATION,0.11:BLUE_SOCKET,8:RED_SOCKET,8:SHADOW_RES,0.04:HEALTH_REGEN,1:DPS,3:AGI,0.87:DODGE_RATING,0.05:DEFENSE_RATING,0.05:CRIT_RATING,0.98"
        staticSpecs["PRIEST:Holy"] = "SPELL_POWER,0.81:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:HEALING_SPELL_POWER,0.81:SPI,0.73:INT,1:SPELL_CRIT_RATING,0.24:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.6:MANA,0.09:DODGE_RATING,0.05:FIRE_RES,0.04:BLUE_SOCKET,8:RED_SOCKET,8:MANA_REGEN,1.35:FROST_RES,0.04:HEALTH,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:PARRY_RATING,0.05:ARMOR,0.005"
        staticSpecs["WARRIOR:Dual Wield"] = "RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:ARMOR_PENETRATION,0.47:SPI,0.05:PARRY_RATING,0.12:EXPERTISE_RATING,0.57:NATURE_RES,0.04:HIT_RATING,0.57:ARCANE_RES,0.04:BLUE_SOCKET,8:HEALTH,0.05:RED_SOCKET,8:SHADOW_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.41:FROST_RES,0.04:DODGE_RATING,0.05:DEFENSE_RATING,0.05:ARMOR,0.005:HEALTH_REGEN,1:DPS,5.22:AGI,0.57:ATTACK_POWER,0.54:STR,1:CRIT_RATING,0.7"
        staticSpecs["HUNTER:Survival"] = "MANA_REGEN,2.4:STA,0.5:YELLOW_SOCKET,8:STR,0.05:SPI,0.05:INT,0.8:EXPERTISE_RATING,0.05:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:BLUE_SOCKET,8:RED_SOCKET,8:MANA,0.075:HEALTH,0.05:SHADOW_RES,0.04:FROST_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.4:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:ARMOR,0.005:ARMOR_PENETRATION,0.28:HEALTH_REGEN,1:DPS,2.4:AGI,1:ATTACK_POWER,0.55:CRIT_RATING,0.65:RANGED_ATTACK_POWER,0.55"
        staticSpecs["DRUID:Feral Tank"] = "SPELL_POWER,0.025:DODGE_CHANCE,100:STA,1:ARMOR_PENETRATION,0.2:SPI,0.05:BLUE_SOCKET,8:FERAL_ATTACK_POWER,0.34:EXPERTISE_RATING,0.18:RED_SOCKET,8:HIT_RATING,0.16:SHADOW_RES,0.2:FROST_RES,0.2:DODGE_RATING,0.38:MANA_REGEN,0.3:FIRE_RES,0.2:HASTE_RATING,0.31:NATURE_SPELL_POWER,0.025:DEFENSE_RATING,0.26:ARMOR,0.1:HEALTH,0.08:ATTACK_POWER,0.34:HEALING_SPELL_POWER,0.025:RESILIENCE_RATING,0.2:YELLOW_SOCKET,8:STR,0.2:INT,0.1:NATURE_RES,0.2:ARCANE_RES,0.2:MANA,0.009:DEFENSE,12:HEALTH_REGEN,2:DPS,0.1:AGI,0.48:CRIT_RATING,0.15"
        staticSpecs["SHAMAN:Elemental"] = "SPELL_POWER,1:MANA_REGEN,1.14:STA,0.5:YELLOW_SOCKET,8:SPI,0.09:INT,0.31:SPELL_HIT_RATING,0.9:SPELL_CRIT_RATING,1.05:DAMAGE_SPELL_POWER,1:BLUE_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.9:RED_SOCKET,8:MANA,0.024:HEALTH,0.05:NATURE_RES,0.04:SPELL_PENETRATION,0.38:FIRE_RES,0.04:BLOCK_RATING,0.01:PARRY_RATING,0.12:FROST_RES,0.04:NATURE_SPELL_POWER,1:RESILIENCE_RATING,0.2:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:DODGE_RATING,0.05:HEALTH_REGEN,1"
        staticSpecs["HUNTER:Beast Mastery"] = "MANA_REGEN,2.4:BLUE_SOCKET,8:STA,0.5:YELLOW_SOCKET,8:STR,0.05:SPI,0.05:INT,0.8:RED_SOCKET,8:EXPERTISE_RATING,0.05:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:SHADOW_RES,0.04:FROST_RES,0.04:MANA,0.075:HEALTH,0.05:PARRY_RATING,0.05:RESILIENCE_RATING,0.2:FIRE_RES,0.04:HASTE_RATING,0.5:DODGE_RATING,0.05:DEFENSE_RATING,0.05:ARMOR,0.005:ARMOR_PENETRATION,0.17:HEALTH_REGEN,1:DPS,2.4:AGI,1:ATTACK_POWER,0.43:CRIT_RATING,0.8:RANGED_ATTACK_POWER,0.43"
        staticSpecs["MAGE:Fire"] = "SPELL_POWER,1:MANA_REGEN,0.9:STA,0.5:YELLOW_SOCKET,8:BLUE_SOCKET,8:FIRE_SPELL_POWER,0.94:INT,0.44:SPELL_HIT_RATING,0.93:ARCANE_SPELL_POWER,0.168:DAMAGE_SPELL_POWER,1:RED_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.82:NATURE_RES,0.04:MANA,0.036:HEALTH,0.05:HEALTH_REGEN,1:SPELL_PENETRATION,0.09:FIRE_RES,0.04:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:FROST_SPELL_POWER,0.32:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPELL_CRIT_RATING,0.77:SPI,0.066"
        staticSpecs["WARLOCK:Demonology"] = "SPELL_POWER,1:MANA_REGEN,1:STA,0.5:YELLOW_SOCKET,8:SPI,0.5:INT,0.4:SHADOW_SPELL_POWER,0.8:SPELL_CRIT_RATING,0.66:DAMAGE_SPELL_POWER,1:BLUE_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.7:RED_SOCKET,8:MANA,0.03:HEALTH,0.05:NATURE_RES,0.04:SPELL_PENETRATION,0.08:FIRE_RES,0.04:ARMOR,0.005:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPELL_HIT_RATING,1.2:FIRE_SPELL_POWER,0.8"
        staticSpecs["ROGUE:Subtlety"] = "DAMAGE,1.25:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:ARMOR_PENETRATION,0.24:SPI,0.05:PARRY_RATING,0.12:EXPERTISE_RATING,1.1:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:BLUE_SOCKET,8:HEALTH,0.05:RED_SOCKET,8:SHADOW_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.9:FROST_RES,0.04:DODGE_RATING,0.05:DEFENSE_RATING,0.05:HEALTH_REGEN,1:ARMOR,0.005:DPS,3:AGI,1:ATTACK_POWER,0.45:STR,0.5:CRIT_RATING,0.81"
        staticSpecs["MAGE:Frost"] = "SPELL_POWER,1:MANA_REGEN,0.8:STA,0.5:YELLOW_SOCKET,8:BLUE_SOCKET,8:FIRE_SPELL_POWER,0.05:INT,0.37:SPELL_HIT_RATING,1.22:ARCANE_SPELL_POWER,0.13:DAMAGE_SPELL_POWER,1:RED_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.63:NATURE_RES,0.04:MANA,0.032:HEALTH,0.05:HEALTH_REGEN,1:SPELL_PENETRATION,0.07:FIRE_RES,0.04:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:FROST_SPELL_POWER,0.95:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPELL_CRIT_RATING,0.58:SPI,0.06"
        staticSpecs["WARRIOR:Two-Hand"] = "DAMAGE,1.25:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:ARMOR_PENETRATION,1.1:SPI,0.05:PARRY_RATING,0.05:EXPERTISE_RATING,1:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:BLUE_SOCKET,8:HEALTH,0.05:RED_SOCKET,8:SHADOW_RES,0.04:FIRE_RES,0.04:HASTE_RATING,0.57:FROST_RES,0.04:DODGE_RATING,0.05:DEFENSE_RATING,0.05:ARMOR,0.005:HEALTH_REGEN,1:DPS,5.31:AGI,0.69:ATTACK_POWER,0.45:STR,1:CRIT_RATING,0.85"
        staticSpecs["SHAMAN:Restoration"] = "SPELL_POWER,0.9:MANA_REGEN,1.33:STA,0.5:YELLOW_SOCKET,8:HEALING_SPELL_POWER,0.9:SPI,0.61:INT,1:SPELL_CRIT_RATING,0.48:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.74:MANA,0.009:DODGE_RATING,0.05:BLUE_SOCKET,8:FIRE_RES,0.04:BLOCK_RATING,0.01:RED_SOCKET,8:HEALTH,0.05:FROST_RES,0.04:RESILIENCE_RATING,0.2:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:PARRY_RATING,0.05:ARMOR,0.005"
        staticSpecs["DRUID:Feral"] = "SPELL_POWER,0.025:PARRY_RATING,0.05:MANA_REGEN,0.3:BLUE_SOCKET,8:STA,0.5:YELLOW_SOCKET,8:STR,1.48:SPI,0.05:INT,0.1:FERAL_ATTACK_POWER,0.59:EXPERTISE_RATING,0.61:NATURE_RES,0.04:HIT_RATING,0.61:ARCANE_RES,0.04:RED_SOCKET,8:HEALING_SPELL_POWER,0.025:MANA,0.009:HEALTH,0.05:FROST_RES,0.04:RESILIENCE_RATING,0.2:FIRE_RES,0.04:HASTE_RATING,0.43:DODGE_RATING,0.05:DEFENSE_RATING,0.05:NATURE_SPELL_POWER,0.025:HEALTH_REGEN,1:ARMOR,0.02:SHADOW_RES,0.04:AGI,1:ATTACK_POWER,0.59:ARMOR_PENETRATION,0.4:CRIT_RATING,0.59"
        staticSpecs["DRUID:Balance"] = "SPELL_POWER,1:MANA_REGEN,0.58:STA,0.5:YELLOW_SOCKET,8:SPI,0.34:INT,0.38:SPELL_HIT_RATING,1.21:ARCANE_SPELL_POWER,0.64:DAMAGE_SPELL_POWER,1:BLUE_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.8:RED_SOCKET,8:MANA,0.032:HEALTH,0.05:NATURE_RES,0.04:SPELL_PENETRATION,0.21:FIRE_RES,0.04:DODGE_RATING,0.05:FROST_RES,0.04:RESILIENCE_RATING,0.2:NATURE_SPELL_POWER,0.43:PARRY_RATING,0.05:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:HEALTH_REGEN,1:SPELL_CRIT_RATING,0.62"
        staticSpecs["PRIEST:Discipline"] = "SPELL_POWER,0.72:RESILIENCE_RATING,0.2:STA,0.5:YELLOW_SOCKET,8:HEALING_SPELL_POWER,0.72:SPI,0.48:INT,1:SPELL_CRIT_RATING,0.32:NATURE_RES,0.04:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.57:MANA,0.09:DODGE_RATING,0.05:FIRE_RES,0.04:BLUE_SOCKET,8:RED_SOCKET,8:MANA_REGEN,1.19:FROST_RES,0.04:HEALTH,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:PARRY_RATING,0.05:ARMOR,0.005"
        staticSpecs["WARRIOR:Tanking"] = "RESILIENCE_RATING,0.2:STA,1:YELLOW_SOCKET,8:STR,0.33:SPI,0.05:PARRY_RATING,0.58:EXPERTISE_RATING,0.67:NATURE_RES,0.2:HIT_RATING,0.67:ARCANE_RES,0.2:BLUE_SOCKET,8:RED_SOCKET,8:SHADOW_RES,0.2:HEALTH,0.09:FROST_RES,0.2:BLOCK_RATING,0.59:FIRE_RES,0.2:HASTE_RATING,0.21:DODGE_RATING,0.7:DEFENSE_RATING,0.81:BLOCK_VALUE,0.35:ARMOR,0.02:HEALTH_REGEN,2:DPS,3.13:AGI,0.59:ATTACK_POWER,0.06:ARMOR_PENETRATION,0.19:CRIT_RATING,0.28"
        staticSpecs["WARLOCK:Affliction"] = "SPELL_POWER,1:MANA_REGEN,1:STA,0.5:YELLOW_SOCKET,8:FIRE_SPELL_POWER,0.35:INT,0.4:SPELL_HIT_RATING,1.2:SPELL_CRIT_RATING,0.39:DAMAGE_SPELL_POWER,1:BLUE_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.78:RED_SOCKET,8:MANA,0.03:HEALTH,0.05:NATURE_RES,0.04:SPELL_PENETRATION,0.08:FIRE_RES,0.04:ARMOR,0.005:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:HEALTH_REGEN,1:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPI,0.1:SHADOW_SPELL_POWER,0.91"
        staticSpecs["HUNTER:Marksmanship"] = "MANA_REGEN,2.4:BLUE_SOCKET,8:STA,0.5:YELLOW_SOCKET,8:STR,0.05:SPI,0.05:INT,0.9:RED_SOCKET,8:EXPERTISE_RATING,0.05:NATURE_RES,0.04:HIT_RATING,1:ARCANE_RES,0.04:SHADOW_RES,0.04:FROST_RES,0.04:MANA,0.085:HEALTH,0.05:PARRY_RATING,0.05:RESILIENCE_RATING,0.2:FIRE_RES,0.04:HASTE_RATING,0.4:DODGE_RATING,0.05:DEFENSE_RATING,0.05:HEALTH_REGEN,1:CRIT_RATING,0.6:ARMOR,0.005:DPS,2.6:AGI,1:ATTACK_POWER,0.55:ARMOR_PENETRATION,0.37:RANGED_ATTACK_POWER,0.55"
        staticSpecs["MAGE:Arcane"] = "SPELL_POWER,1:MANA_REGEN,1.13:STA,0.5:YELLOW_SOCKET,8:BLUE_SOCKET,8:FIRE_SPELL_POWER,0.064:INT,0.46:SPELL_HIT_RATING,0.87:ARCANE_SPELL_POWER,0.88:DAMAGE_SPELL_POWER,1:RED_SOCKET,8:ARCANE_RES,0.04:SPELL_HASTE_RATING,0.59:NATURE_RES,0.04:MANA,0.038:HEALTH,0.05:HEALTH_REGEN,1:SPELL_PENETRATION,0.09:FIRE_RES,0.04:FROST_RES,0.04:RESILIENCE_RATING,0.2:PARRY_RATING,0.05:DODGE_RATING,0.05:FROST_SPELL_POWER,0.52:ARMOR,0.005:SHADOW_RES,0.04:AGI,0.05:DEFENSE_RATING,0.05:SPELL_CRIT_RATING,0.6:SPI,0.59"
        staticSpecs["FISHING"] = "FISHING,100"

        DGV.staticSpecs = staticSpecs
        unpackedSpecs = GetCreateTable()

        local function StoreKeyValues(statTable, statKey, ...)
            statTable[statKey] = GetCreateTable(...)
        end

        local function GetAllCSV(...)
            local tbl = GetCreateTable()
            for i=1,select("#", ...) do
                StoreKeyValues(tbl, strsplit(",", (select(i,...))))
            end
            return tbl
        end

        local function EnsureCustomSpecs()
            local options = DGV.db.global[DGV_GAWEIGHTSCUSTOM].options
            if not options then
                options = {}
                DGV.db.global[DGV_GAWEIGHTSCUSTOM].options = options
            end
            return options
        end

        local function GetSpecString(specKey)
            local str = EnsureCustomSpecs()[specKey]
            if not str then
                return staticSpecs[specKey]
            end
            return str
        end

        local function GetSpecData(specKey)
            local specData = unpackedSpecs[specKey]
            if not specData then
                local str = GetSpecString(specKey)
                if str and str ~= "" then
                    specData = GetAllCSV(strsplit(":", str))
                    unpackedSpecs[specKey] = specData
                end
            end
            return specData
        end

        local function ClearUnpackedSpec(specKey)
            if unpackedSpecs[specKey] then
                unpackedSpecs[specKey]:Pool()
            end
            unpackedSpecs[specKey] = nil
        end

        function ResetSpecData(specKey)
            ClearUnpackedSpec(specKey)
            EnsureCustomSpecs()[specKey] = nil
        end
        GAD.ResetSpecData = ResetSpecData

        function GAD.IterateSpecData(specKey, statKey)
            local specData = GetSpecData(specKey)
            if specData then
                local statKey, statTable = next(specData, statKey)
                return statKey, statTable
            end
        end

        function GAD.IterateClassSpecs(class, specKey)
            if not class then _, class = UnitClass("player") end
            local specClass, specName
            repeat 
                specKey = next(staticSpecs, specKey)
                if specKey then
                    specClass, specName = string.split(':', specKey)
                end
            until(not specKey or specClass == class)
            return specKey, specName
        end

        local function PackSpec(specData)
            local accumulate = nil
            for statKey, statData in next, specData do
                local join = table.concat(statData, ',')
                if not accumulate then
                    accumulate = string.format("%s,%s", statKey, join)
                else
                    accumulate = string.format("%s:%s,%s", accumulate, statKey, join)
                end
            end
            return accumulate
        end

        function GAD.SetCustomValue(specKey, statKey, value)
            local options = EnsureCustomSpecs()
            if not options[specKey] then
                options[specKey] = staticSpecs[specKey]
            end
            ClearUnpackedSpec(specKey)
            local specData = GetSpecData(specKey)
            if not specData[statKey] and value then
                specData[statKey] = GetCreateTable()
            elseif specData[statKey] then
                wipe(specData[statKey])
            end
            if value then
                tinsert(specData[statKey], value)
            elseif specData[statKey] then
                specData[statKey]:Pool()
                specData[statKey] = nil
            end
            options[specKey] = PackSpec(specData)
            ClearUnpackedSpec(specKey)
        end

        function GAD.IterateClasses(invariant, control)
            if not control then control = 1
            else control = control + 1 end
            if control > 12 then return end
            local info = C_CreatureInfo.GetClassInfo(control)
            if not info then
                return GAD.IterateClasses(invariant, control)
            else
                return control, info.classFile, info.className, "|c"..RAID_CLASS_COLORS[info.classFile].colorStr
            end
        end
    end

    function GAD:Unload()
        for _, specTable in next, unpackedSpecs do
            if type(specTable)=="table" then
                for _, statTable in next, specTable do
                    if type(statTable)=="table" then
                        statTable:Pool()
                    end
                end
				specTable:Pool()
			end
        end
        unpackedSpecs:Pool()
		staticSpecs:Pool()
    end
end