--------------------------------------------------------------------------------
-- Module Declaration
--

if BigWigsLoader.isSeasonOfDiscovery then return end
local mod, CL = BigWigs:NewBoss("Emeriss", -1440)
if not mod then return end
mod:RegisterEnableMob(14889)
mod:SetAllowWin(true)
mod.otherMenu = -947
mod.worldBoss = 14889

--------------------------------------------------------------------------------
-- Locals
--

local warnHP = 80
local tankDebuffOnMe = false
local corruptionOfTheEarthPercent = 100

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.bossName = "Emeriss"

	L.engage_trigger = "Hope is a DISEASE of the soul! This land shall wither and die!"
end

--------------------------------------------------------------------------------
-- Initialization
--

local volatileInfectionMarker = mod:AddMarkerOption(true, "player", 8, 24928, 8) -- Volatile Infection
function mod:GetOptions()
	return {
		24928, -- Volatile Infection
		volatileInfectionMarker,
		24910, -- Corruption of the Earth
		24871, -- Spore Cloud
		-- Shared
		24818, -- Noxious Breath
		24814, -- Seeping Fog
	},{
		[24818] = CL.general,
	},{
		[24928] = CL.disease, -- Volatile Infection (Disease)
		[24818] = CL.breath, -- Noxious Breath (Breath)
	}
end

function mod:OnRegister()
	self.displayName = L.bossName
end

function mod:OnBossEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:Log("SPELL_CAST_SUCCESS", "NoxiousBreath", 24818)
	self:Log("SPELL_AURA_APPLIED", "NoxiousBreathApplied", 24818)
	self:Log("SPELL_AURA_APPLIED_DOSE", "NoxiousBreathApplied", 24818)
	self:Log("SPELL_AURA_REMOVED", "NoxiousBreathRemoved", 24818)
	self:Log("SPELL_CAST_SUCCESS", "SeepingFog", 24814)
	self:Log("SPELL_AURA_APPLIED", "VolatileInfectionApplied", 24928)
	self:Log("SPELL_AURA_REMOVED", "VolatileInfectionRemoved", 24928)
	self:Log("SPELL_CAST_SUCCESS", "CorruptionOfTheEarth", 24910)
	self:Log("SPELL_AURA_APPLIED", "SporeCloudDamage", 24871)
	self:Log("SPELL_PERIODIC_DAMAGE", "SporeCloudDamage", 24871)
	self:Log("SPELL_PERIODIC_MISSED", "SporeCloudDamage", 24871)

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:Death("Win", 14889)
end

function mod:OnEngage()
	warnHP = 80
	corruptionOfTheEarthPercent = 100
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.engage_trigger, nil, true) then
		self:Engage()
		self:Message(24818, "yellow", CL.custom_start_s:format(self.displayName, CL.breath, 10), false)
		self:Bar(24818, 10, CL.breath) -- Noxious Breath
	end
end

function mod:NoxiousBreath(args)
	self:Bar(args.spellId, 10, CL.breath)
end

function mod:NoxiousBreathApplied(args)
	local unit, targetUnit = self:GetUnitIdByGUID(args.sourceGUID), self:UnitTokenFromGUID(args.destGUID)
	if unit and targetUnit then
		local tanking = self:Tanking(unit, targetUnit)
		if self:Me(args.destGUID) then
			tankDebuffOnMe = true
			if not tanking then -- Not tanking, 1+
				self:StackMessage(args.spellId, "purple", args.destName, args.amount, 1, CL.breath)
			elseif args.amount then -- Tanking, 2+
				self:StackMessage(args.spellId, "purple", args.destName, args.amount, 100, CL.breath) -- No emphasize when on you
			end
		elseif tanking and args.amount then -- On a tank that isn't me, 2+
			self:StackMessage(args.spellId, "purple", args.destName, args.amount, (tankDebuffOnMe or args.amount >= 6) and 100 or 3, CL.breath)
			if not tankDebuffOnMe and args.amount >= 3 and args.amount <= 5 then
				self:PlaySound(args.spellId, "warning", nil, args.destName)
			end
		end
	end
end

function mod:NoxiousBreathRemoved(args)
	if self:Me(args.destGUID) then
		tankDebuffOnMe = false
	end
end

do
	local prev = 0
	function mod:SeepingFog(args)
		if args.time-prev > 2 then
			prev = args.time
			self:Message(args.spellId, "green")
			self:PlaySound(args.spellId, "info")
			-- self:CDBar(24818, 20)
		end
	end
end

do
	local prev
	function mod:VolatileInfectionApplied(args)
		prev = args.destGUID
		self:TargetMessage(args.spellId, "orange", args.destName, CL.disease)
		self:CustomIcon(volatileInfectionMarker, args.destName, 8)
		self:PlaySound(args.spellId, "alert", nil, args.destName)
	end

	function mod:VolatileInfectionRemoved(args)
		if prev and args.destGUID == prev then
			prev = nil
			self:CustomIcon(volatileInfectionMarker, args.destName)
		end
	end
end

function mod:CorruptionOfTheEarth(args)
	corruptionOfTheEarthPercent = corruptionOfTheEarthPercent - 25
	self:Message(args.spellId, "red", CL.percent:format(corruptionOfTheEarthPercent, args.spellName))
	self:Bar(args.spellId, 10)
	self:PlaySound(args.spellId, "long")
end

do
	local prev = 0
	function mod:SporeCloudDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

function mod:UNIT_HEALTH(event, unit)
	if self:MobId(self:UnitGUID(unit)) == 14889 then
		local hp = self:GetHealth(unit)
		if hp < warnHP then -- 80, 55, 30
			warnHP = warnHP - 25
			if hp > warnHP then -- avoid multiple messages when joining mid-fight
				self:Message(24910, "red", CL.soon:format(self:SpellName(24910)), false) -- Corruption of the Earth
				self:PlaySound(24910, "alarm")
			end
			if warnHP < 30 then
				self:UnregisterEvent(event)
			end
		end
	end
end
