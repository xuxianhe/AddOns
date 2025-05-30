--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Baron Braunpyke", 2649, 2570)
if not mod then return end
mod:RegisterEnableMob(207939) -- Baron Braunpyke
mod:SetEncounterID(2835)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Locals
--

local vindictiveWrathActive = false
local unleashedPyreCharges = 0
local nextUnleashedPyre = 0

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.charges = "%d charges"
	L.warmup_icon = "inv_achievement_dungeon_prioryofthesacredflame"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"warmup",
		422969, -- Vindictive Wrath
		423015, -- Castigator's Shield
		423051, -- Burning Light
		423062, -- Hammer of Purity
		-- Mythic
		446368, -- Sacrificial Pyre
		{446403, "ME_ONLY"}, -- Sacrificial Flame
		{446525, "COUNTDOWN"}, -- Unleashed Pyre
	}, {
		[446368] = CL.mythic,
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "VindictiveWrath", 422969)
	self:Log("SPELL_AURA_APPLIED", "VindictiveWrathApplied", 422969)
	self:Log("SPELL_AURA_REMOVED", "VindictiveWrathRemoved", 422969)
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", nil, "boss1") -- for Castigator's Shield timer
	self:Log("SPELL_CAST_START", "CastigatorsShield", 423015, 446649) -- Standard, Empowered
	self:Log("SPELL_CAST_START", "BurningLight", 423051, 446657) -- Standard, Empowered
	self:Log("SPELL_CAST_START", "HammerOfPurity", 423062, 446598) -- Standard, Empowered

	-- Mythic
	self:Log("SPELL_CAST_START", "SacrificialPyre", 446368)
	self:Log("SPELL_AURA_APPLIED", "SacrificialFlameApplied", 446403)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SacrificialFlameApplied", 446403)
	self:Log("SPELL_MISSED", "SacrificialFlameMissed", 446403) -- for immunities
end

function mod:OnEngage()
	vindictiveWrathActive = false
	self:StopBar(CL.active)
	if self:Mythic() then
		unleashedPyreCharges = 0
		nextUnleashedPyre = 0
		self:CDBar(423062, 7.0) -- Hammer of Purity
		self:CDBar(446368, 15.0) -- Sacrificial Pyre
		self:CDBar(423015, 22.8) -- Castigator's Shield
		self:CDBar(423051, 29.6) -- Burning Light
		self:CDBar(422969, 35.6) -- Vindictive Wrath
	else -- Normal, Heroic
		self:CDBar(423062, 8.2) -- Hammer of Purity
		self:CDBar(423051, 17.0) -- Burning Light
		self:CDBar(423015, 22.8) -- Castigator's Shield
		self:CDBar(422969, 45.8) -- Vindictive Wrath
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Warmup() -- called from trash module
	-- 0.00 [CHAT_MSG_MONSTER_SAY] They've served their purpose. Baron, demonstrate your worth.#Prioress Murrpray
	-- 10.63 [NAME_PLATE_UNIT_ADDED] Baron Braunpyke
	self:Bar("warmup", 10.6, CL.active, L.warmup_icon)
end

function mod:VindictiveWrath(args)
	self:Message(args.spellId, "cyan")
	if self:Mythic() then
		self:CDBar(args.spellId, 68.8)
	else -- Normal, Heroic
		self:CDBar(args.spellId, 48.1)
	end
	self:PlaySound(args.spellId, "info")
end

function mod:VindictiveWrathApplied()
	vindictiveWrathActive = true
end

function mod:VindictiveWrathRemoved()
	vindictiveWrathActive = false
end

function mod:UNIT_SPELLCAST_SUCCEEDED(_, _, _, spellId)
	if spellId == 446645 then -- Castigator's Shield
		-- start the timer here because often the actual Castigator's Shield cast will be skipped
		if self:Mythic() then
			self:CDBar(423015, 33.6) -- Castigator's Shield
		else -- Normal, Heroic
			self:CDBar(423015, 23.1) -- Castigator's Shield
		end
	end
end

function mod:CastigatorsShield(args)
	self:Message(423015, "orange")
	self:PlaySound(423015, "alert")
end

function mod:BurningLight(args)
	self:Message(423051, "red", CL.casting:format(args.spellName))
	if self:Mythic() then
		self:CDBar(423051, 33.2)
	else -- Normal, Heroic
		self:CDBar(423051, 31.6)
	end
	self:PlaySound(423051, "warning")
end

function mod:HammerOfPurity(args)
	self:Message(423062, "yellow")
	if self:Mythic() then
		self:CDBar(423062, 35.2)
	else -- Normal, Heroic
		self:CDBar(423062, 20.7)
	end
	self:PlaySound(423062, "alarm")
end

-- Mythic

function mod:SacrificialPyre(args)
	unleashedPyreCharges = vindictiveWrathActive and 5 or 3
	nextUnleashedPyre = args.time + 30
	self:Message(args.spellId, "cyan", CL.extra:format(args.spellName, L.charges:format(unleashedPyreCharges)))
	self:Bar(446525, 30, CL.count:format(self:SpellName(446525), unleashedPyreCharges)) -- Unleashed Pyre
	self:CDBar(args.spellId, 33.6)
	self:PlaySound(args.spellId, "info")
end

function mod:SacrificialFlameApplied(args)
	self:StopBar(CL.count:format(self:SpellName(446525), unleashedPyreCharges)) -- Unleashed Pyre
	self:StackMessage(args.spellId, "yellow", args.destName, args.amount, 1)
	unleashedPyreCharges = unleashedPyreCharges - 1
	if unleashedPyreCharges > 0 then
		local unleashedPyreTimeLeft = nextUnleashedPyre - args.time
		self:Bar(446525, {unleashedPyreTimeLeft, 30}, CL.count:format(self:SpellName(446525), unleashedPyreCharges)) -- Unleashed Pyre
	elseif unleashedPyreCharges == 0 then
		self:Message(446368, "green", CL.over:format(self:SpellName(446368))) -- Sacrificial Pyre
	end
	self:PlaySound(args.spellId, "info", nil, args.destName)
end

function mod:SacrificialFlameMissed(args)
	self:StopBar(CL.count:format(self:SpellName(446525), unleashedPyreCharges)) -- Unleashed Pyre
	unleashedPyreCharges = unleashedPyreCharges - 1
	if unleashedPyreCharges > 0 then
		local unleashedPyreTimeLeft = nextUnleashedPyre - args.time
		self:Bar(446525, {unleashedPyreTimeLeft, 30}, CL.count:format(self:SpellName(446525), unleashedPyreCharges)) -- Unleashed Pyre
	elseif unleashedPyreCharges == 0 then
		self:Message(446368, "green", CL.over:format(self:SpellName(446368))) -- Sacrificial Pyre
	end
end
