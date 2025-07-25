local isElevenDotTwo = BigWigsLoader.isNext -- XXX remove in 11.2
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Captain Dailcry", 2649, 2571)
if not mod then return end
mod:RegisterEnableMob(
	207946, -- Captain Dailcry
	211291, -- Sergeant Shaynemail
	211290, -- Elaena Emberlanz
	211289 -- Taener Duelmal
)
mod:SetEncounterID(2847)
mod:SetRespawnTime(30)

--------------------------------------------------------------------------------
-- Locals
--

local isSavageMauling = false
local energyGainedDuringSavageMauling = 0
local nextSavageMauling = 0

--------------------------------------------------------------------------------
-- Initialization
--

if isElevenDotTwo then -- XXX remove check in 11.2
	function mod:GetOptions()
		return {
			424419, -- Battle Cry
			1238780, -- Earthshattering Spear
			{424414, "TANK_HEALER"}, -- Pierce Armor
			447439, -- Savage Mauling
		}
	end
else -- XXX remove block in 11.2
	function mod:GetOptions()
		return {
			424419, -- Battle Cry
			447270, -- Hurl Spear
			{424414, "TANK"}, -- Pierce Armor
			447439, -- Savage Mauling
		}
	end
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BattleCry", 424419)
	self:Log("SPELL_CAST_SUCCESS", "BattleCrySuccess", 424419)
	if isElevenDotTwo then -- XXX remove check in 11.2
		self:Log("SPELL_CAST_START", "EarthshatteringSpear", 1238780)
		self:Log("SPELL_PERIODIC_DAMAGE", "EarthshatteringSpearDamage", 1238782)
		self:Log("SPELL_PERIODIC_MISSED", "EarthshatteringSpearDamage", 1238782)
	else -- XXX remove block in 11.2
		self:Log("SPELL_CAST_START", "HurlSpear", 447270)
	end
	self:Log("SPELL_CAST_START", "PierceArmor", 424414)
	self:Log("SPELL_CAST_SUCCESS", "SavageMauling", 447439)
	self:Log("SPELL_AURA_REMOVED", "SavageMaulingRemoved", 447443)
end

function mod:OnEngage()
	local t = GetTime()
	isSavageMauling = false
	energyGainedDuringSavageMauling = 0
	self:CDBar(424414, 5.2) -- Pierce Armor
	if isElevenDotTwo then -- XXX remove check in 11.2
		self:CDBar(1238780, 9.3) -- Earthshattering Spear
	else -- XXX remove block in 11.2
		self:CDBar(447270, 8.1) -- Hurl Spear
	end
	self:CDBar(424419, 12.0) -- Battle Cry
	nextSavageMauling = t + 13.0
	self:CDBar(447439, 13.0) -- Savage Mauling
end

function mod:OnWipe()
	local trashMod = BigWigs:GetBossModule("Priory of the Sacred Flame Trash", true)
	if trashMod then
		trashMod:CaptainDailcryDespawn()
	end
end

function mod:OnWin()
	local trashMod = BigWigs:GetBossModule("Priory of the Sacred Flame Trash", true)
	if trashMod then
		trashMod:CaptainDailcryDespawn()
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BattleCry(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:CDBar(args.spellId, 26.7)
	self:PlaySound(args.spellId, "warning")
end

function mod:BattleCrySuccess()
	-- boss and any engaged mini-bosses all gain 50 energy
	local t = GetTime()
	-- Dailcry: subtracts 12.5s from Savage Mauling cooldown
	if not isSavageMauling then
		nextSavageMauling = nextSavageMauling - 12.5
		local savageMaulingTimeLeft = nextSavageMauling - t
		if savageMaulingTimeLeft > 0 then
			self:CDBar(447439, {savageMaulingTimeLeft, 25.7}) -- Savage Mauling
		else
			-- set to very small duration so bar will pause on next frame
			self:CDBar(447439, {0.01, 25.7}) -- Savage Mauling
		end
	else
		-- there is a bug where Dailcry can cast this while he still has the shield, he
		-- gains 50 energy if successful despite his energy gain still being paused.
		energyGainedDuringSavageMauling = energyGainedDuringSavageMauling + 50
	end
end

function mod:EarthshatteringSpear(args)
	self:Message(args.spellId, "orange")
	self:CDBar(args.spellId, 25.5)
	self:PlaySound(args.spellId, "alarm")
end

do
	local prev = 0
	function mod:EarthshatteringSpearDamage(args)
		if self:Me(args.destGUID) and args.time - prev > 2.25 then -- ticks every 0.5s
			prev = args.time
			self:PersonalMessage(1238780, "underyou")
			self:PlaySound(1238780, "underyou")
		end
	end
end

function mod:HurlSpear(args) -- XXX remove in 11.2
	self:Message(args.spellId, "orange")
	self:CDBar(args.spellId, 30.3)
	self:PlaySound(args.spellId, "alarm")
end

function mod:PierceArmor(args)
	self:Message(args.spellId, "purple")
	self:CDBar(args.spellId, 12.1)
	self:PlaySound(args.spellId, "alert")
end

function mod:SavageMauling(args)
	energyGainedDuringSavageMauling = 0
	self:StopBar(args.spellId)
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PlaySound(args.spellId, "alert", nil, args.destName)
end

function mod:SavageMaulingRemoved(args)
	local t = GetTime()
	self:Message(447439, "green", CL.over:format(args.spellName))
	-- Savage Mauling is cast at 100 energy, 25s energy gain starts now
	local timeUntilSavageMauling = 25.7 - energyGainedDuringSavageMauling / 4
	nextSavageMauling = t + timeUntilSavageMauling
	self:CDBar(447439, timeUntilSavageMauling)
	self:PlaySound(447439, "info")
end
