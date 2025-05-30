--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ahn'Qiraj Trash", 531)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	15264, -- Anubisath Sentinel
	15247, -- Qiraji Brainwasher
	15246, -- Qiraji Mindslayer
	234762, -- Qiraji Mindslayer (Season of Discovery)
	15277, -- Anubisath Defender
	234830, -- Anubisath Defender (Season of Discovery)
	15240 -- Vekniss Hive Crawler
)
if mod:GetSeason() == 2 then
	mod:RegisterEnableMob(15516, 15510, 15299) -- Sartura, Fankriss, Viscidus
end

--------------------------------------------------------------------------------
-- Locals
--

local defendersAlive = 5

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.sentinel = "Anubisath Sentinel"
	L.brainwasher = "Qiraji Brainwasher"
	L.defender = "Anubisath Defender"
	L.crawler = "Vekniss Hive Crawler"

	L.target_buffs = "Target Buff Warnings"
	L.target_buffs_desc = "When your target is an Anubisath Sentinel, show a warning for what buff it has."
	L.target_buffs_message = "Target Buffs: %s"
	L.detect_magic_missing_message = "Detect Magic is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on your target for buff warnings to work."

	L["17430_icon"] = "spell_nature_insectswarm" -- Summon Anubisath Swarmguard
	L["17431_icon"] = "ability_warrior_savageblow" -- Summon Anubisath Warrior
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Anubisath Sentinel
		"target_buffs",
		{26565, "OFF"}, -- Heal Brethren
		8599, -- Enrage
		-- Qiraji Brainwasher
		{26079, "ICON", "SAY", "SAY_COUNTDOWN"}, -- Cause Insanity
		-- Anubisath Defender
		{26556, "SAY", "ME_ONLY_EMPHASIZE"}, -- Plague
		8269, -- Frenzy / Enrage (different name on classic era)
		26554, -- Thunderclap
		26558, -- Meteor
		26555, -- Shadow Storm
		{25698, "EMPHASIZE", "COUNTDOWN"}, -- Explode
		17430, -- Summon Anubisath Swarmguard
		17431, -- Summon Anubisath Warrior
		"stages",
		-- Vekniss Hive Crawler
		25051, -- Sunder Armor
	},{
		["target_buffs"] = L.sentinel,
		[26079] = L.brainwasher,
		[26556] = L.defender,
		[25051] = L.crawler,
	},{
		[26079] = CL.mind_control, -- Cause Insanity (Mind Control)
	}
end

if mod:GetSeason() == 2 then
	function mod:GetOptions()
		return {
			-- Anubisath Sentinel
			"target_buffs",
			{26565, "OFF"}, -- Heal Brethren
			8599, -- Enrage
			-- Qiraji Brainwasher
			{26079, "ICON", "SAY", "SAY_COUNTDOWN"}, -- Cause Insanity
			-- Anubisath Defender
			{26556, "SAY", "ME_ONLY_EMPHASIZE"}, -- Plague
			8269, -- Frenzy / Enrage (different name on classic era)
			26554, -- Thunderclap
			26558, -- Meteor
			26555, -- Shadow Storm
			{25698, "EMPHASIZE", "COUNTDOWN"}, -- Explode
			17430, -- Summon Anubisath Swarmguard
			17431, -- Summon Anubisath Warrior
			"stages",
			-- Vekniss Hive Crawler
			25051, -- Sunder Armor
			-- SoD hard mode abilities
			{1214956, "OFF"}, -- Curse of Despair
			1215421, -- Toxic Pool
			{1215202, "ME_ONLY_EMPHASIZE"}, -- Noxious Burst
		},{
			["target_buffs"] = L.sentinel,
			[26079] = L.brainwasher,
			[26556] = L.defender,
			[25051] = L.crawler,
			[1214956] = CL.hard,
		},{
			[26079] = CL.mind_control, -- Cause Insanity (Mind Control)
			[1214956] = CL.curse, -- Curse of Despair (Curse)
			[1215421] = CL.underyou:format(mod:SpellName(1215421)), -- Toxic Pool (Toxic Pool under YOU)
			[1215202] = CL.spread, -- Noxious Burst (Spread)
		}
	end
end

function mod:OnBossEnable()
	defendersAlive = 5

	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	if self:Vanilla() then
		self:Log("SPELL_AURA_APPLIED", "DetectMagicApplied", 2855)
	end
	self:Death("SentinelKilled", 15264)
	self:Log("SPELL_HEAL", "HealBrethren", 26565)
	self:Log("SPELL_AURA_APPLIED", "EnrageApplied", 8599)

	self:Log("SPELL_AURA_APPLIED", "CauseInsanityApplied", 26079)
	self:Log("SPELL_AURA_REMOVED", "CauseInsanityRemoved", 26079)
	if self:GetSeason() == 2 then
		self:Log("SPELL_AURA_APPLIED", "CauseInsanityApplied", 474400)
		self:Log("SPELL_AURA_REMOVED", "CauseInsanityRemoved", 474400)
	end

	self:Log("SPELL_AURA_APPLIED", "PlagueApplied", 26556)
	self:Log("SPELL_AURA_REFRESH", "PlagueApplied", 26556)
	self:Log("SPELL_AURA_REMOVED", "PlagueRemoved", 26556)

	self:Log("SPELL_DAMAGE", "Thunderclap", 26554)
	self:Log("SPELL_MISSED", "Thunderclap", 26554)

	self:Log("SPELL_DAMAGE", "Meteor", 26558)
	self:Log("SPELL_MISSED", "Meteor", 26558)

	self:Log("SPELL_DAMAGE", "ShadowStorm", 26555)
	self:Log("SPELL_MISSED", "ShadowStorm", 26555)

	self:Log("SPELL_AURA_APPLIED", "FrenzyEnrage", 8269)
	self:Log("SPELL_AURA_APPLIED", "ExplodeApplied", 25698)
	self:Log("SPELL_AURA_REMOVED", "ExplodeRemoved", 25698)

	self:Log("SPELL_SUMMON", "SummonAnubisathSwarmguard", 17430)
	self:Log("SPELL_SUMMON", "SummonAnubisathWarrior", 17431)
	self:Death("DefenderKilled", 15277, 234830) -- Anubisath Defender, Anubisath Defender (Season of Discovery)

	self:Log("SPELL_AURA_APPLIED", "SunderArmor", 25051)
	self:Log("SPELL_AURA_APPLIED_DOSE", "SunderArmor", 25051)
	self:Log("SPELL_AURA_REMOVED", "SunderArmorRemoved", 25051)

	if self:GetSeason() == 2 then
		self:Log("SPELL_AURA_APPLIED", "CurseOfDespairApplied", 1214956)
		self:Log("SPELL_PERIODIC_DAMAGE", "ToxicPoolDamage", 1215421) -- Purposely not using APPLIED so we don't trigger for people running over it
		self:Log("SPELL_PERIODIC_MISSED", "ToxicPoolDamage", 1215421)
		self:Log("SPELL_AURA_APPLIED", "NoxiousBurstApplied", 1215202)
	else
		self:RegisterMessage("BigWigs_OnBossEngage", "Disable")
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

--[[ Anubisath Sentinel ]]--

do
	local buffList = {
		[812] = "|T136170:0|t".. mod:SpellName(11981), -- Periodic Mana Burn (Mana Burn)
		[2147] = "|T136085:0|t".. mod:SpellName(2147), -- Mending
		[2148] = "|T136163:0|t".. mod:SpellName(14297), -- Periodic Shadow Storm (Shadow Storm)
		[2834] = "|T132326:0|t".. mod:SpellName(8732), -- Periodic Thunderclap (Thunderclap)
		[9347] = "|T132355:0|t".. mod:SpellName(9347), -- Mortal Strike
		[13022] = "|T135736:0|t|cFFFFFFFF".. mod:SpellName(13022) .."|r", -- Fire and Arcane Reflect (White)
		[19595] = "|T135736:0|t|cFFFFFFFF".. mod:SpellName(19595) .."|r", -- Shadow and Frost Reflect (White)
		[21737] = "|T132330:0|t".. mod:SpellName(18670), -- Periodic Knock Away (Knock Away)
		[25777] = "|T136104:0|t|cFFFFFFFF".. mod:SpellName(25777) .."|r", -- Thorns (White)
	}
	local printed = false
	local prevMsg = 0
	local prevGUID = nil
	function mod:CheckTarget()
		local guid = self:UnitGUID("target")
		if guid ~= prevGUID then
			local npcId = self:MobId(guid)
			if npcId == 15264 or npcId == 15277 or npcId == 234830 then -- Anubisath Sentinel, Anubisath Defender, Anubisath Defender (Season of Discovery)
				if self:Vanilla() and not self:UnitDebuff("target", 2855) then
					if not printed then
						printed = true
						BigWigs:Print(L.detect_magic_warning)
					end
					if GetTime() - prevMsg > 40 and self:GetHealth("target") > 5 then
						prevMsg = GetTime()
						local icon = self:GetIconTexture(self:GetIcon("target"))
						if icon then
							self:Message("target_buffs", "red", icon.. L.detect_magic_missing_message, 2855)
						else
							self:Message("target_buffs", "red", L.detect_magic_missing_message, 2855)
						end
					end
					return
				end
				local total = {}
				for buffId, message in next, buffList do
					if self:UnitBuff("target", buffId) then
						prevGUID = guid
						total[#total+1] = message
					end
				end
				if total[1] then
					local msg = self:TableToString(total, #total)
					local icon = self:GetIconTexture(self:GetIcon("target"))
					if icon then
						self:Message("target_buffs", "yellow", icon.. L.target_buffs_message:format(msg), false)
					else
						self:Message("target_buffs", "yellow", L.target_buffs_message:format(msg), false)
					end
				end
			end
		end
	end
	function mod:PLAYER_TARGET_CHANGED()
		prevGUID = nil
		self:CheckTarget()
	end
	function mod:PLAYER_REGEN_DISABLED()
		self:ScheduleTimer("CheckTarget", 1)
	end
	function mod:DetectMagicApplied(args)
		if args.destGUID == self:UnitGUID("target") then
			self:SimpleTimer(function() self:CheckTarget() end, 0.1) -- Combat log is sometimes faster than the aura API
		end
	end
	function mod:SentinelKilled(args)
		if args.destGUID ~= self:UnitGUID("target") then
			prevGUID = nil
			self:CheckTarget()
		end
	end
end

do
	local prev = 0
	function mod:HealBrethren(args)
		if args.time - prev > 0.5 then
			prev = args.time
			self:Message(args.spellId, "orange")
			self:PlaySound(args.spellId, "info")
		end
	end
end

function mod:EnrageApplied(args)
	if args.destGUID == self:UnitGUID("target") and self:MobId(args.destGUID) == 15264 then -- Anubisath Sentinel
		local icon = self:GetIconTexture(self:GetIcon(args.destRaidFlags))
		if icon then
			self:Message(args.spellId, "red", icon .. CL.percent:format(30, args.spellName))
		else
			self:Message(args.spellId, "red", CL.percent:format(30, args.spellName))
		end
	end
end

--[[ Qiraji Brainwasher / Qiraji Mindslayer ]]--

do
	local prevMindControl = nil
	function mod:CauseInsanityApplied(args) -- Mind control
		prevMindControl = args.destGUID
		local duration = args.spellId == 26079 and 10 or 6
		self:TargetMessage(26079, "yellow", args.destName, CL.mind_control)
		self:TargetBar(26079, duration, args.destName, CL.mind_control_short)
		self:PrimaryIcon(26079, args.destName)
		if self:Me(args.destGUID) then
			self:Say(26079, CL.mind_control, nil, "Mind Control")
			self:SayCountdown(26079, duration, 8, duration-2)
		end
		self:PlaySound(26079, "alert", nil, args.destName)
	end
	function mod:CauseInsanityRemoved(args)
		self:StopBar(CL.mind_control_short, args.destName)
		if self:Me(args.destGUID) then
			self:CancelSayCountdown(26079)
		end
		if args.destGUID == prevMindControl then
			prevMindControl = nil
			self:PrimaryIcon(26079)
		end
	end
end

--[[ Anubisath Defender ]]--

function mod:PlagueApplied(args)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:TargetBar(args.spellId, 40, args.destName)
	if self:Me(args.destGUID) then
		self:Say(args.spellId, nil, nil, "Plague")
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end

function mod:PlagueRemoved(args)
	self:StopBar(args.spellName, args.destName)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "removed")
	end
end

do
	local prev = 0
	function mod:Thunderclap(args)
		if args.time-prev > 6 then
			prev = args.time
			self:Message(args.spellId, "orange")
			self:PlaySound(args.spellId, "alert")
		end
	end
end

do
	local prev = 0
	function mod:Meteor(args)
		if args.time-prev > 6 then
			prev = args.time
			self:Message(args.spellId, "red")
			self:PlaySound(args.spellId, "info")
		end
	end
end

do
	local prev = 0
	function mod:ShadowStorm(args)
		if args.time-prev > 6 then
			prev = args.time
			self:Message(args.spellId, "red")
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

function mod:FrenzyEnrage(args)
	local id = self:MobId(args.destGUID) -- Battleguard Sartura also gains this, lock to trash only
	if id == 15277 or id == 234830 then -- Anubisath Defender, Anubisath Defender (Season of Discovery)
		self:Message(args.spellId, "red")
		self:PlaySound(args.spellId, "long")
	end
end

function mod:ExplodeApplied(args)
	self:Message(args.spellId, "orange", CL.explosion)
	self:Bar(args.spellId, 6, CL.explosion) -- Duration is 7s but it expires after 6s
	self:PlaySound(args.spellId, "long")
end

function mod:ExplodeRemoved()
	self:StopBar(CL.explosion)
end

function mod:SummonAnubisathSwarmguard(args)
	self:Message(args.spellId, "green", args.spellName, L["17430_icon"])
end

function mod:SummonAnubisathWarrior(args)
	self:Message(args.spellId, "green", args.spellName, L["17431_icon"])
end

function mod:DefenderKilled()
	defendersAlive = defendersAlive - 1
	self:Message("stages", "cyan", CL.mob_remaining:format(L.defender, defendersAlive), false, nil, 5) -- Stay onscreen for 5s
end

--[[ Vekniss Hive Crawler ]]--

function mod:SunderArmor(args)
	if self:Player(args.destFlags) then -- Players, not target dummies (they can taunt)
		self:StackMessage(args.spellId, "purple", args.destName, args.amount, 3)
		self:TargetBar(args.spellId, 20, args.destName)
	end
end

function mod:SunderArmorRemoved(args)
	self:StopBar(args.spellName, args.destName)
end

--[[ SoD hard mode abilities ]]--

do
	local prev = 0
	function mod:CurseOfDespairApplied(args)
		if args.time - prev > 10 then
			prev = args.time
			self:Message(args.spellId, "yellow", CL.on_group:format(CL.curse))
			self:Bar(args.spellId, 30, CL.curse)
		end
	end
end

do
	local prev = 0
	function mod:ToxicPoolDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 4 then
			prev = args.time
			self:PersonalMessage(args.spellId, "underyou")
			self:PlaySound(args.spellId, "underyou")
		end
	end
end

function mod:NoxiousBurstApplied(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, false, CL.spread)
		self:PlaySound(args.spellId, "warning", nil, args.destName)
	end
end
