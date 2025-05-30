--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Silithid Royalty", 531, 1547)
if not mod then return end
mod:RegisterEnableMob(15543, 15544, 15511) -- Princess Yauj, Vem, Lord Kri
mod:SetEncounterID(710)

--------------------------------------------------------------------------------
-- Locals
--

local killedBosses = {}
local UpdateInfoBoxList
local bossList = {
	[15543] = 1, -- Princess Yauj
	[15544] = 3, -- Vem
	[15511] = 5, -- Lord Kri
}

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L[15543] = "Yauj"
	L[15544] = "Vem"
	L[15511] = "Kri"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{25807, "CASTBAR"}, -- Great Heal
		26580, -- Fear
		25812, -- Toxic Volley
		25786, -- Toxic Vapors
		"stages",
	},nil,{
		[26580] = CL.fear, -- Fear (Fear)
	}
end

if mod:Vanilla() then
	function mod:GetOptions()
		return {
			{25807, "CASTBAR"}, -- Great Heal
			26580, -- Fear
			25812, -- Toxic Volley
			25786, -- Toxic Vapors
			"stages",
			{"health", "INFOBOX"},
		},nil,{
			[26580] = CL.fear, -- Fear (Fear)
		}
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "GreatHeal", 25807)
	self:Log("SPELL_INTERRUPT", "GreatHealInterrupted", "*")
	self:Log("SPELL_CAST_SUCCESS", "Fear", 26580)
	self:Log("SPELL_CAST_SUCCESS", "ToxicVolley", 25812)

	self:Log("SPELL_AURA_APPLIED", "ToxicVaporsDamage", 25786)
	self:Log("SPELL_PERIODIC_DAMAGE", "ToxicVaporsDamage", 25786)
	self:Log("SPELL_PERIODIC_MISSED", "ToxicVaporsDamage", 25786)

	self:Death("YaujDies", 15543) -- Princess Yauj
	self:Death("Deaths", 15544, 15511) -- Vem, Lord Kri
end

function mod:OnEngage()
	killedBosses = {}

	if self:Vanilla() then
		self:OpenInfo("health", CL.other:format("BigWigs", CL.health))
		for npcId, line in next, bossList do
			self:SetInfo("health", line, L[npcId])
			self:SetInfoBar("health", line, 1)
			self:SetInfo("health", line + 1, "100%")
		end
		self:SimpleTimer(UpdateInfoBoxList, 1)
	end

	self:CDBar(25807, 8.1) -- Great Heal
	self:CDBar(26580, 11.3, CL.fear) -- Fear
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GreatHeal(args)
	self:Message(args.spellId, "orange", CL.casting:format(args.spellName))
	self:CastBar(args.spellId, 2)
	self:Bar(args.spellId, 12.9)
	if self:Interrupter() then
		self:PlaySound(args.spellId, "alert")
	end
end

function mod:GreatHealInterrupted(args)
	if args.extraSpellName == self:SpellName(25807) then
		self:StopBar(CL.cast:format(args.extraSpellName))
		self:Message(25807, "green", CL.interrupted_by:format(args.extraSpellName, self:ColorName(args.sourceName)))
	end
end

function mod:Fear(args)
	self:Message(args.spellId, "red", CL.fear)
	self:CDBar(args.spellId, 21, CL.fear)
	self:PlaySound(args.spellId, "long")
end

function mod:ToxicVolley(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "info")
end

do
	local prev = 0
	function mod:ToxicVaporsDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 3 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

function mod:YaujDies(args)
	self:StopBar(CL.cast:format(self:SpellName(25807))) -- Great Heal
	self:StopBar(25807) -- Great Heal
	self:StopBar(CL.fear) -- Fear
	self:Deaths(args)
end

do
	local unitTracker = {}
	local currentHealth = {}
	function mod:Deaths(args)
		unitTracker[args.mobId] = nil
		currentHealth[args.mobId] = nil
		killedBosses[args.mobId] = true
		local count = #killedBosses + 1
		killedBosses[count] = true

		if self:Vanilla() then
			local line = bossList[args.mobId]
			self:SetInfoBar("health", line, 0)
			self:SetInfo("health", line + 1, CL.dead)
		end

		if count < 3 then
			self:Message("stages", "cyan", CL.mob_killed:format(args.destName, count, 3), false)
		else
			unitTracker, currentHealth = {}, {}
		end
	end

	function UpdateInfoBoxList()
		if not mod:IsEngaged() then return end
		mod:SimpleTimer(UpdateInfoBoxList, 0.5)

		for npcId in next, bossList do
			if not killedBosses[npcId] and (not unitTracker[npcId] or mod:MobId(mod:UnitGUID(unitTracker[npcId])) ~= npcId) then
				unitTracker[npcId] = mod:GetUnitIdByGUID(npcId)
			end
		end

		for npcId, unitToken in next, unitTracker do
			local line = bossList[npcId]
			local currentHealthPercent = math.floor(mod:GetHealth(unitToken))
			if currentHealthPercent ~= currentHealth[npcId] then
				currentHealth[npcId] = currentHealthPercent
				mod:SetInfoBar("health", line, currentHealthPercent/100)
				mod:SetInfo("health", line + 1, ("%d%%"):format(currentHealthPercent))
			end
		end
	end
end
