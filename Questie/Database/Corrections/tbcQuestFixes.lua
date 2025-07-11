---@class QuestieTBCQuestFixes
local QuestieTBCQuestFixes = QuestieLoader:CreateModule("QuestieTBCQuestFixes")
local _QuestieTBCQuestFixes = {}

---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
---@type QuestieProfessions
local QuestieProfessions = QuestieLoader:ImportModule("QuestieProfessions")
---@type QuestieCorrections
local QuestieCorrections = QuestieLoader:ImportModule("QuestieCorrections")
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")


QuestieCorrections.killCreditObjectiveFirst = {
    [10503] = true, -- The Bladespire Threat
}

function QuestieTBCQuestFixes:Load()
    _QuestieTBCQuestFixes:InsertMissingQuestIds()

    local questKeys = QuestieDB.questKeys
    local raceIDs = QuestieDB.raceKeys
    local classIDs = QuestieDB.classKeys
    local factionIDs = QuestieDB.factionIDs
    local zoneIDs = ZoneDB.zoneIDs
    local sortKeys = QuestieDB.sortKeys
    local questFlags = QuestieDB.questFlags
    local profKeys = QuestieProfessions.professionKeys
    local specKeys = QuestieProfessions.specializationKeys

    return {
        [62] = {
            [questKeys.triggerEnd] = {"Scout through the Fargodeep Mine", {[zoneIDs.ELWYNN_FOREST]={{40.01,81.42}}}},
        },
        [76] = {
            [questKeys.triggerEnd] = {"Scout through the Jasperlode Mine", {[zoneIDs.ELWYNN_FOREST]={{60.53,50.18}}}},
        },
        [77] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [100] = {
            [questKeys.childQuests] = {},
        },
        [171] = {
            [questKeys.questLevel] = -1,
        },
        [172] = {
            [questKeys.questLevel] = -1,
        },
        [201] = {
            [questKeys.triggerEnd] = {"Locate the hunters' camp", {[zoneIDs.STRANGLETHORN_VALE]={{35.73,10.82}}}},
        },
        [225] = {
            [questKeys.requiredLevel] = 25,
        },
        [254] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [275] = {
            [questKeys.objectivesText] = {"Kill 8 Fen Creepers, then return to Rethiel the Greenwarden in the Wetlands."}, -- override classic correction
        },
        [287] = {
            [questKeys.triggerEnd] = {"Fully explore Frostmane Hold", {[zoneIDs.DUN_MOROGH]={{21.47,52.2}}}},
        },
        [349] = {
            [questKeys.objectivesText] = {"Speak with Witch Doctor Unbagwa.",},
        },
        [364] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [403] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [415] = {
            [questKeys.startedBy] = {{1378,1872}},
        },
        [455] = {
            [questKeys.triggerEnd] = {"Traverse Dun Algaz", {[zoneIDs.WETLANDS]={{53.49,70.36}}}},
        },
        [460] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [504] = {
            [questKeys.objectivesText] = {"Slay 10 Crushridge Warmongers, then return to Marshal Redpath in Southshore."},
        },
        [510] = {
            [questKeys.startedBy] = {nil,{1740,186420},nil}, -- in TBC, 1738 and 1739 are removed, but 186420 is added to a nearby camp
        },
        [511] = {
            [questKeys.startedBy] = {nil,{1740,186420},nil}, -- in TBC, 1738 and 1739 are removed, but 186420 is added to a nearby camp
        },
        [558] = {
            [questKeys.questLevel] = -1,
        },
        [578] = {
            [questKeys.triggerEnd] = {"Locate the haunted island", {[zoneIDs.STRANGLETHORN_VALE]={{21.56,21.98}}}},
        },
        [663] = {
            [questKeys.requiredLevel] = 35,
        },
        [729] = {
            [questKeys.requiredLevel] = 15,
        },
        [748] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [756] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [759] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [870] = {
            [questKeys.triggerEnd] = {"Explore the waters of the Forgotten Pools", {[zoneIDs.THE_BARRENS]={{45.06,22.56}}}},
        },
        [910] = {
            [questKeys.questLevel] = -1,
        },
        [911] = {
            [questKeys.questLevel] = -1,
        },
        [915] = {
            [questKeys.questLevel] = -1,
            [questKeys.preQuestGroup] = {910,911,1800},
        },
        [925] = {
            [questKeys.questLevel] = -1,
        },
        [927] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [930] = {
            [questKeys.requiredLevel] = 4,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [931] = {
            [questKeys.requiredLevel] = 4,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [949] = {
            [questKeys.requiredLevel] = 12,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [950] = {
            [questKeys.requiredLevel] = 12,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [968] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [990] = {
            [questKeys.exclusiveTo] = {}, -- starting with tbc only, exclusivity is present in classic
        },
        [1001] = {
            [questKeys.requiredLevel] = 7,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [1002] = {
            [questKeys.requiredLevel] = 7,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [1003] = {
            [questKeys.requiredLevel] = 7,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [1046] = {
            [questKeys.objectives] = {nil,nil,{{5388,nil},{5462,nil}},nil},
        },
        [1048] = {
            [questKeys.requiredLevel] = 30,
        },
        [1049] = { -- Not available to UNDEAD
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.TAUREN + raceIDs.TROLL + raceIDs.BLOOD_ELF,
        },
        [1103] = {
            [questKeys.preQuestSingle] = {100},
            [questKeys.parentQuest] = 0,
        },
        [1109] = {
            [questKeys.requiredLevel] = 22,
            [questKeys.questLevel] = 26,
        },
        [1133] = {
            [questKeys.zoneOrSort] = zoneIDs.DARKSHORE,
        },
        [1135] = {
            [questKeys.startedBy] = {{4456},nil,nil},
            [questKeys.zoneOrSort] = zoneIDs.DARKSHORE,
        },
        [1220] = {
            [questKeys.startedBy] = {{23951}},
        },
        [1322] = {
            [questKeys.objectivesText] = {"Acquire 5 Acidic Venom Sacs for Do'gol in Brackenwall Village."},
        },
        [1437] = {
            [questKeys.triggerEnd] = {"Find and search Tyranis and Dalinda Malem's wagon", {[zoneIDs.DESOLACE]={{56.52,17.84}}}},
        },
        [1468] = {
            [questKeys.questLevel] = -1,
        },
        [1479] = {
            [questKeys.questLevel] = -1,
        },
        [1486] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [1506] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [1507] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD,
        },
        [1508] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [1558] = {
            [questKeys.questLevel] = -1,
        },
        [1687] = {
            [questKeys.questLevel] = -1,
        },
        [1699] = {
            [questKeys.triggerEnd] = {"Enter the Rethban Caverns", {[zoneIDs.REDRIDGE_MOUNTAINS]={{19.22,25.25}}}},
        },
        [1719] = {
            [questKeys.triggerEnd] = {"Step on the grate to begin the Affray", {[zoneIDs.THE_BARRENS]={{68.61,48.72}}}},
        },
        [1782] = {
            [questKeys.zoneOrSort] = sortKeys.WARRIOR,
        },
        [1799] = {
            [questKeys.preQuestSingle] = {4967,4969},
        },
        [1800] = {
            [questKeys.questLevel] = -1,
        },
        [1801] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [1803] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [1805] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [1858] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.TROLL,
        },
        [1859] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.TROLL,
        },
        [1886] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [1898] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [1899] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [1963] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.TROLL,
        },
        [1978] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [1998] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [1999] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [2240] = {
            [questKeys.triggerEnd] = {"Explore the Hidden Chamber", {[zoneIDs.BADLANDS]={{35.22,10.32}}}},
        },
        [2279] = {
            [questKeys.requiredLevel] = 40,
        },
        [2280] = {
            [questKeys.requiredLevel] = 40,
        },
        [2381] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [2399] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [2501] = {
            [questKeys.zoneOrSort] = -181,
        },
        [2861] = {
            [questKeys.startedBy] = {{4568,5144,5497,5885,16651,17514}}
        },
        [2880] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.specialFlags] = 1,
        },
        [2881] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.specialFlags] = 1,
        },
        [2989] = {
            [questKeys.triggerEnd] = {"Search the Altar of Zul", {[zoneIDs.THE_HINTERLANDS]={{48.86,68.42}}}},
        },
        [2996] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [3001] = {
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [3088] = {
            [questKeys.requiredRaces] = raceIDs.ORC,
        },
        [3090] = {
            [questKeys.requiredRaces] = raceIDs.ORC,
        },
        [3091] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [3092] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [3093] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [3094] = {
            [questKeys.requiredRaces] = raceIDs.TAUREN,
        },
        [3095] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [3096] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [3097] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [3098] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [3099] = {
            [questKeys.requiredRaces] = raceIDs.UNDEAD,
        },
        [3116] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [3117] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [3118] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [3119] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [3120] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [3505] = {
            [questKeys.triggerEnd] = {"Find Magus Rimtori's camp", {[zoneIDs.AZSHARA]={{59.29,31.21}}}},
        },
        [3631] = {
            [questKeys.startedBy] = {{3326}},
            [questKeys.finishedBy] = {{6251}},
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [3741] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [3803] = { -- Morrowgrain to Darnassus
            [questKeys.startedBy] = {{4217}},
        },
        [4021] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.THE_BARRENS]={{44.7,28.1}}}, Questie.ICON_TYPE_EVENT, l10n("Defeat Centaur to summon Warlord Krom'zar"), 0}},
        },
        [4485] = {
            [questKeys.startedBy] = {}, -- Hiding via startedBy because the quest does not exist in TBC, but does in Era
        },
        [4486] = {
            [questKeys.startedBy] = {}, -- Hiding via startedBy because the quest does not exist in TBC, but does in Era
        },
        [4487] = {
            [questKeys.startedBy] = {{5172}},
            [questKeys.finishedBy] = {{6251}},
        },
        [4488] = {
            [questKeys.startedBy] = {{461}},
            [questKeys.finishedBy] = {{6251}},
        },
        [4489] = {
            [questKeys.startedBy] = {{4563}},
            [questKeys.finishedBy] = {{6251}},
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },
        [4490] = {
            [questKeys.startedBy] = {{6251}},
            [questKeys.finishedBy] = {{6251}},
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [4813] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [4822] = {
            [questKeys.questLevel] = -1,
            [questKeys.preQuestGroup] = {1479,1558,1687},
        },
        [4842] = {
            [questKeys.triggerEnd] = {"Discover Darkwhisper Gorge", {[zoneIDs.WINTERSPRING]={{60.1,73.44}}}},
        },
        [4983] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [5002] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [5168] = {
            [questKeys.preQuestSingle] = {5210},
        },
        [5401] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.exclusiveTo] = {5405,5503},
        },
        [5405] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.exclusiveTo] = {5401,5503},
        },
        [5502] = {
            [questKeys.questLevel] = -1,
        },
        [5503] = {
            [questKeys.exclusiveTo] = {5401,5405},
        },
        [5649] = {
            [questKeys.requiredLevel] = 5,
        },
        [5961] = {
            [questKeys.requiredLevel] = 54,
        },
        [6025] = {
            [questKeys.triggerEnd] = {"Overlook Hearthglen from a high vantage point", {[zoneIDs.WESTERN_PLAGUELANDS]={{45.7,18.5}}}},
        },
        [6185] = {
            [questKeys.triggerEnd] = {"The Blightcaller Uncovered", {[zoneIDs.EASTERN_PLAGUELANDS]={{27.4,75.14}}}},
        },
        [6341] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [6342] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [6343] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [6344] = {
            [questKeys.requiredRaces] = raceIDs.NIGHT_ELF,
        },
        [6421] = {
            [questKeys.triggerEnd] = {"Investigate Cave in Boulderslide Ravine", {[zoneIDs.STONETALON_MOUNTAINS]={{58.96,90.16}}}},
        },
        [6681] = {
            [questKeys.startedBy] = {{332,918,3327,3328,3401,4214,4215,4163,4582,4583,4584,5165,5166,5167,6467,13283,16684,16685,16686},nil,{17126}},
        },
        [6761] = {
            [questKeys.preQuestSingle] = {1015,1019,1047},
        },
        [7484] = {
            [questKeys.specialFlags] = 1,
        },
        [7583] = {
            [questKeys.preQuestGroup] = {7581,7582},
        },
        [7623] = {
            [questKeys.preQuestSingle] = {},
        },
        [7792] = {
            [questKeys.startedBy] = {{20604},nil,nil},
            [questKeys.finishedBy] = {{20604},nil},
            [questKeys.reputationReward] = {{factionIDs.EXODAR,350}},
        },
        [7795] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7791,7793,7794},
        },
        [7798] = {
            [questKeys.startedBy] = {{20604},nil,nil},
            [questKeys.finishedBy] = {{20604},nil},
            [questKeys.reputationReward] = {{factionIDs.EXODAR,350}},
        },
        [7800] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7799,10352,10354},
        },
        [7805] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7802,7803,7804},
        },
        [7811] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7807,7808,7809},
        },
        [7818] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7813,7814,7817},
        },
        [7823] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7820,7821,7822},
        },
        [7824] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7826,7827,7831},
        },
        [7836] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {7833,7834,7835},
        },
        [7863] = {
            [questKeys.requiredMinRep] = {890,3000},
        },
        [7864] = {
            [questKeys.requiredMinRep] = {890,9000},
        },
        [7865] = {
            [questKeys.requiredMinRep] = {890,21000},
        },
        [7866] = {
            [questKeys.requiredMinRep] = {889,3000},
        },
        [7867] = {
            [questKeys.requiredMinRep] = {889,9000},
        },
        [7868] = {
            [questKeys.requiredMinRep] = {889,21000},
        },
        [8114] = {
            [questKeys.triggerEnd] = {"Take Four Bases in Arathi Basin", {[zoneIDs.ARATHI_HIGHLANDS]={{45.9,45.8}}}},
        },
        [8115] = {
            [questKeys.triggerEnd] = {"Take Five Bases in Arathi Basin", {[zoneIDs.ARATHI_HIGHLANDS]={{45.9,45.8}}}},
        },
        [8121] = {
            [questKeys.triggerEnd] = {"Hold Four Bases in Arathi Basin", {[zoneIDs.ARATHI_HIGHLANDS]={{73.2,30}}}},
        },
        [8122] = {
            [questKeys.triggerEnd] = {"Hold Five Bases in Arathi Basin", {[zoneIDs.ARATHI_HIGHLANDS]={{73.2,30}}}},
        },
        [8259] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [8311] = {
            [questKeys.requiredLevel] = 10,
            [questKeys.questLevel] = -1,
        },
        [8312] = {
            [questKeys.requiredLevel] = 10,
        },
        [8325] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8326] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8327] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8328] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8330] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8334] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8335] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8336] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8338] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8344] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8345] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8346] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{15294,15274},15274,"Mana Tap creature"}}},
        },
        [8347] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [8353] = {
            [questKeys.requiredLevel] = 10,
        },
        [8354] = {
            [questKeys.requiredLevel] = 10,
        },
        [8355] = {
            [questKeys.requiredLevel] = 10,
        },
        [8356] = {
            [questKeys.requiredLevel] = 10,
        },
        [8357] = {
            [questKeys.requiredLevel] = 10,
            [questKeys.questLevel] = -1,
        },
        [8358] = {
            [questKeys.requiredLevel] = 10,
        },
        [8359] = {
            [questKeys.requiredLevel] = 10,
        },
        [8360] = {
            [questKeys.requiredLevel] = 10,
            [questKeys.questLevel] = -1,
        },
        [8367] = {
            [questKeys.requiredLevel] = 61,
        },
        [8371] = {
            [questKeys.requiredLevel] = 61,
        },
        [8410] = {
            [questKeys.startedBy] = {{3032,13417,20407,23127,},nil,nil,},
        },
        [8412] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [8413] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [8423] = {
            [questKeys.preQuestSingle] = {},
        },
        [8465] = {
            [questKeys.preQuestSingle] = {8461},
        },
        [8473] = {
            [questKeys.preQuestSingle] = {},
        },
        [8474] = {
            [questKeys.startedBy] = {nil,nil,{23228}},
        },
        [8476] = {
            [questKeys.preQuestSingle] = {},
        },
        [8482] = {
            [questKeys.startedBy] = {nil,nil,{20765}},
        },
        [8484] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [8487] = {
            [questKeys.preQuestSingle] = {},
        },
        [8488] = {
            [questKeys.objectives] = {{{15402,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [8490] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the Infused Crystal and protect it from the Scourge for 1 minute"), 0, {{"object", 181164}}}},
            [questKeys.objectives] = {{{16364,nil,Questie.ICON_TYPE_EVENT}}},
            [questKeys.requiredSourceItems] = {},
        },
        [8544] = { -- Conqueror's Spaulders
            [questKeys.preQuestSingle] = {8579},
        },
        [8548] = {
            [questKeys.specialFlags] = 1,
        },
        [8551] = {
            [questKeys.questLevel] = 42,
        },
        [8559] = { -- Conqueror's Greaves
            [questKeys.preQuestSingle] = {8579},
        },
        [8560] = { -- Conqueror's Legguards
            [questKeys.preQuestSingle] = {8579},
        },
        [8561] = { -- Conqueror's Crown
            [questKeys.preQuestSingle] = {8579},
        },
        [8562] = { -- Conqueror's Breastplate
            [questKeys.preQuestSingle] = {8579},
        },
        [8572] = {
            [questKeys.specialFlags] = 1,
        },
        [8573] = {
            [questKeys.specialFlags] = 1,
        },
        [8574] = {
            [questKeys.specialFlags] = 1,
        },
        [8592] = { -- Tiara of the Oracle
            [questKeys.preQuestSingle] = {8579},
        },
        [8593] = { -- Trousers of the Oracle
            [questKeys.preQuestSingle] = {8579},
        },
        [8594] = { -- Mantle of the Oracle
            [questKeys.preQuestSingle] = {8579},
        },
        [8596] = { -- Footwraps of the Oracle
            [questKeys.preQuestSingle] = {8579},
        },
        [8602] = { -- Stormcaller's Pauldrons
            [questKeys.preQuestSingle] = {8579},
        },
        [8603] = { -- Vestments of the Oracle
            [questKeys.preQuestSingle] = {8579},
        },
        [8619] = {
            [questKeys.questLevel] = -1,
        },
        [8621] = { -- Stormcaller's Footguards
            [questKeys.preQuestSingle] = {8579},
        },
        [8622] = { -- Stormcaller's Hauberk
            [questKeys.preQuestSingle] = {8579},
        },
        [8623] = { -- Stormcaller's Diadem
            [questKeys.preQuestSingle] = {8579},
        },
        [8624] = { -- Stormcaller's Leggings
            [questKeys.preQuestSingle] = {8579},
        },
        [8625] = { -- Enigma Shoulderpads
            [questKeys.preQuestSingle] = {8579},
        },
        [8626] = { -- Striker's Footguards
            [questKeys.preQuestSingle] = {8579},
        },
        [8627] = { -- Avenger's Breastplate
            [questKeys.preQuestSingle] = {8579},
        },
        [8628] = { -- Avenger's Crown
            [questKeys.preQuestSingle] = {8579},
        },
        [8629] = { -- Avenger's Legguards
            [questKeys.preQuestSingle] = {8579},
        },
        [8630] = { -- Avenger's Pauldrons
            [questKeys.preQuestSingle] = {8579},
        },
        [8631] = { -- Enigma Leggings
            [questKeys.preQuestSingle] = {8579},
        },
        [8632] = { -- Enigma Circlet
            [questKeys.preQuestSingle] = {8579},
        },
        [8633] = { -- Enigma Robes
            [questKeys.preQuestSingle] = {8579},
        },
        [8634] = { -- Enigma Boots
            [questKeys.preQuestSingle] = {8579},
        },
        [8635] = {
            [questKeys.questLevel] = -1,
        },
        [8636] = {
            [questKeys.questLevel] = -1,
        },
        [8637] = { -- Deathdealer's Boots
            [questKeys.preQuestSingle] = {8579},
        },
        [8638] = { -- Deathdealer's Vest
            [questKeys.preQuestSingle] = {8579},
        },
        [8639] = { -- Deathdealer's Helm
            [questKeys.preQuestSingle] = {8579},
        },
        [8640] = { -- Deathdealer's Leggings
            [questKeys.preQuestSingle] = {8579},
        },
        [8641] = { -- Deathdealer's Spaulders
            [questKeys.preQuestSingle] = {8579},
        },
        [8642] = {
            [questKeys.questLevel] = -1,
        },
        [8643] = {
            [questKeys.questLevel] = -1,
        },
        [8644] = {
            [questKeys.questLevel] = -1,
        },
        [8645] = {
            [questKeys.questLevel] = -1,
        },
        [8646] = {
            [questKeys.questLevel] = -1,
        },
        [8647] = {
            [questKeys.questLevel] = -1,
        },
        [8648] = {
            [questKeys.questLevel] = -1,
        },
        [8649] = {
            [questKeys.questLevel] = -1,
        },
        [8650] = {
            [questKeys.questLevel] = -1,
        },
        [8651] = {
            [questKeys.questLevel] = -1,
        },
        [8652] = {
            [questKeys.questLevel] = -1,
        },
        [8653] = {
            [questKeys.questLevel] = -1,
        },
        [8654] = {
            [questKeys.questLevel] = -1,
        },
        [8655] = { -- Avenger's Greaves
            [questKeys.preQuestSingle] = {8579},
        },
        [8656] = { -- Striker's Hauberk
            [questKeys.preQuestSingle] = {8579},
        },
        [8657] = { -- Striker's Diadem
            [questKeys.preQuestSingle] = {8579},
        },
        [8658] = { -- Striker's Leggings
            [questKeys.preQuestSingle] = {8579},
        },
        [8659] = { -- Striker's Pauldrons
            [questKeys.preQuestSingle] = {8579},
        },
        [8660] = { -- Doomcaller's Footwraps
            [questKeys.preQuestSingle] = {8579},
        },
        [8661] = { -- Doomcaller's Robes
            [questKeys.preQuestSingle] = {8579},
        },
        [8662] = { -- Doomcaller's Circlet
            [questKeys.preQuestSingle] = {8579},
        },
        [8663] = { -- Doomcaller's Trousers
            [questKeys.preQuestSingle] = {8579},
        },
        [8664] = { -- Doomcaller's Mantle
            [questKeys.preQuestSingle] = {8579},
        },
        [8665] = { -- Genesis Boots
            [questKeys.preQuestSingle] = {8579},
        },
        [8666] = { -- Genesis Vest
            [questKeys.preQuestSingle] = {8579},
        },
        [8667] = { -- Genesis Helm
            [questKeys.preQuestSingle] = {8579},
        },
        [8668] = { -- Genesis Trousers
            [questKeys.preQuestSingle] = {8579},
        },
        [8669] = { -- Genesis Shoulderpads
            [questKeys.preQuestSingle] = {8579},
        },
        [8670] = {
            [questKeys.questLevel] = -1,
        },
        [8671] = {
            [questKeys.questLevel] = -1,
        },
        [8672] = {
            [questKeys.questLevel] = -1,
        },
        [8673] = {
            [questKeys.questLevel] = -1,
        },
        [8674] = {
            [questKeys.questLevel] = -1,
        },
        [8675] = {
            [questKeys.questLevel] = -1,
        },
        [8676] = {
            [questKeys.questLevel] = -1,
        },
        [8677] = {
            [questKeys.questLevel] = -1,
        },
        [8678] = {
            [questKeys.questLevel] = -1,
        },
        [8679] = {
            [questKeys.questLevel] = -1,
        },
        [8680] = {
            [questKeys.questLevel] = -1,
        },
        [8681] = {
            [questKeys.questLevel] = -1,
        },
        [8682] = {
            [questKeys.questLevel] = -1,
        },
        [8683] = {
            [questKeys.questLevel] = -1,
        },
        [8684] = {
            [questKeys.questLevel] = -1,
        },
        [8685] = {
            [questKeys.questLevel] = -1,
        },
        [8686] = {
            [questKeys.questLevel] = -1,
        },
        [8688] = {
            [questKeys.questLevel] = -1,
        },
        [8713] = {
            [questKeys.questLevel] = -1,
        },
        [8714] = {
            [questKeys.questLevel] = -1,
        },
        [8715] = {
            [questKeys.questLevel] = -1,
        },
        [8716] = {
            [questKeys.questLevel] = -1,
        },
        [8717] = {
            [questKeys.questLevel] = -1,
        },
        [8718] = {
            [questKeys.questLevel] = -1,
        },
        [8719] = {
            [questKeys.questLevel] = -1,
        },
        [8720] = {
            [questKeys.questLevel] = -1,
        },
        [8721] = {
            [questKeys.questLevel] = -1,
        },
        [8722] = {
            [questKeys.questLevel] = -1,
        },
        [8723] = {
            [questKeys.questLevel] = -1,
        },
        [8724] = {
            [questKeys.questLevel] = -1,
        },
        [8725] = {
            [questKeys.questLevel] = -1,
        },
        [8726] = {
            [questKeys.questLevel] = -1,
        },
        [8727] = {
            [questKeys.questLevel] = -1,
        },
        [8860] = { -- New Year Celebrations!
            [questKeys.questLevel] = -1,
        },
        [8861] = { -- New Year Celebrations!
            [questKeys.questLevel] = -1,
        },
        [8862] = {
            [questKeys.requiredLevel] = 10,
        },
        [8863] = {
            [questKeys.requiredLevel] = 1,
        },
        [8866] = {
            [questKeys.questLevel] = -1,
        },
        [8867] = {
            [questKeys.questLevel] = -1,
        },
        [8870] = {
            [questKeys.questLevel] = -1,
        },
        [8871] = {
            [questKeys.questLevel] = -1,
        },
        [8872] = {
            [questKeys.questLevel] = -1,
        },
        [8873] = {
            [questKeys.questLevel] = -1,
        },
        [8874] = {
            [questKeys.questLevel] = -1,
        },
        [8875] = {
            [questKeys.questLevel] = -1,
        },
        [8876] = {
            [questKeys.requiredLevel] = 25,
        },
        [8883] = {
            [questKeys.questLevel] = -1,
        },
        [8887] = {
            [questKeys.startedBy] = {nil,nil,{21776}},
        },
        [8894] = {
            [questKeys.preQuestSingle] = {},
        },
        [9066] = {
            [questKeys.objectives] = {{{15945,nil,Questie.ICON_TYPE_INTERACT},{15941,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [9094] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9130] = {
            [questKeys.requiredMinRep] = {},
        },
        [9144] = {
            [questKeys.requiredLevel] = 10,
            [questKeys.nextQuestInChain] = 9147,
        },
        [9147] = {
            [questKeys.preQuestSingle] = {},
        },
        [9149] = {
            [questKeys.preQuestSingle] = {9327,9329},
        },
        [9152] = {
            [questKeys.preQuestSingle] = {9327,9329},
        },
        [9160] = {
            [questKeys.triggerEnd] = {"Investigate An'daroth", {[zoneIDs.GHOSTLANDS]={{37.13,16.15}}}},
        },
        [9161] = {
            [questKeys.preQuestSingle] = {},
        },
        [9164] = {
            [questKeys.objectives] = {{{16208,nil,Questie.ICON_TYPE_TALK},{16206,nil,Questie.ICON_TYPE_TALK},{16209,nil,Questie.ICON_TYPE_TALK}}},
        },
        [9174] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Use the Bundle of Medallions"), 0, {{"object", 181157}}}},
        },
        [9177] = {
            [questKeys.startedBy] = {{16252},nil},
            [questKeys.finishedBy] = {{10181},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE - raceIDs.BLOOD_ELF, -- 9180 is the blood elf version of this quest
            [questKeys.preQuestSingle] = {9175},
        },
        [9180] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9181] = {
            [questKeys.specialFlags] = 1,
        },
        [9189] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF
        },
        [9190] = {
            [questKeys.specialFlags] = 1,
        },
        [9193] = {
            [questKeys.triggerEnd] = {"Investigate the Amani Catacombs", {[zoneIDs.GHOSTLANDS]={{62.91,30.98}}}},
        },
        [9195] = {
            [questKeys.specialFlags] = 1,
        },
        [9205] = {
            [questKeys.specialFlags] = 1,
        },
        [9206] = {
            [questKeys.specialFlags] = 1,
        },
        [9207] = {
            [questKeys.requiredMinRep] = {922,3000},
        },
        [9212] = {
            [questKeys.triggerEnd] = {"Escort Ranger Lilatha back to the Farstrider Enclave", {[zoneIDs.GHOSTLANDS]={{72.24,30.21}}}},
        },
        [9280] = {
            [questKeys.preQuestSingle] = {},
        },
        [9287] = {
            [questKeys.preQuestSingle] = {9280},
        },
        [9288] = {
            [questKeys.requiredRaces] = raceIDs.DRAENEI,
            [questKeys.preQuestSingle] = {9280},
        },
        [9289] = {
            [questKeys.preQuestSingle] = {9280},
        },
        [9290] = {
            [questKeys.startedBy] = {{16500},nil,nil},
            [questKeys.finishedBy] = {{16500},nil,nil},
            [questKeys.preQuestSingle] = {9280},
        },
        [9291] = {
            [questKeys.startedBy] = {{16502},nil,nil},
            [questKeys.finishedBy] = {{16502},nil,nil},
            [questKeys.requiredRaces] = raceIDs.DRAENEI,
            [questKeys.preQuestSingle] = {9280},
        },
        [9303] = {
            [questKeys.objectives] = {{{16518,"Nestlewood Owlkin inoculated",Questie.ICON_TYPE_INTERACT}}},
        },
        [9312] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {9305,9311},
        },
        [9317] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9318] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9320] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9333] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9334] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9335] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9336] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9337] = {
            [questKeys.zoneOrSort] = sortKeys.INVASION,
        },
        [9339] = {
            [questKeys.objectivesText] = {},
        },
        [9355] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [9358] = {
            [questKeys.exclusiveTo] = {9252},
        },
        [9360] = {
            [questKeys.startedBy] = {nil,nil,{23249}},
        },
        [9365] = {
            [questKeys.objectivesText] = {},
        },
        [9370] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the Signaling Gem"), 0, {{"object", 181449}}}},
        },
        [9375] = {
            [questKeys.triggerEnd] = {"Escort Wounded Blood Elf Pilgrim to Falcon Watch", {[zoneIDs.HELLFIRE_PENINSULA]={{27.09,61.92}}}},
        },
        [9383] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_LOOT, l10n("Use the Sanctified Crystal against a wounded Uncontrolled Voidwalker"), 0, {{"monster", 16975}}}},
        },
        [9392] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9397] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Disturb the nest"), 0, {{"object", 181582}}}},
        },
        [9400] = {
            [questKeys.preQuestSingle] = {10124},
            [questKeys.triggerEnd] = nil,
            [questKeys.objectives] = {{{17062,"Find Krun Spinebreaker",Questie.ICON_TYPE_EVENT}}},
        },
        [9410] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Wolf Totem at the location where you found Krun Spinebreaker's body and follow the Ancestral Spirit Wolf."), 0, {{"monster", 17062}}}},
        },
        [9415] = { -- Report to Marshal Bluewall
            [questKeys.nextQuestInChain] = 9419,
        },
        [9416] = { -- Report to General Kirika
            [questKeys.nextQuestInChain] = 9422,
        },
        [9417] = {
            [questKeys.preQuestSingle] = {},
        },
        [9418] = {
            [questKeys.startedBy] = {nil,nil,{23580}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Take Avruu's Orb to the Haal'eshi Altar"), 0, {{"object", 181606}}}},
        },
        [9421] = {
            [questKeys.preQuestSingle] = {9280,9369},
        },
        [9425] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9428] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9429] = {
            [questKeys.requiredRaces] = raceIDs.DRAENEI,
        },
        [9433] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Robotron Control near the Concealed Command Console hidden in a small cluster of bushes"), 0, {{"object", 181825}}}},
        },
        [9437] = { -- Twilight of the Dawn Runner
            [questKeys.objectives] = {{{17119,nil,Questie.ICON_TYPE_TALK}},nil,{{23657}}},
        },
        [9446] = {
            [questKeys.triggerEnd] = {"Escort Anchorite Truuen to Uther's Tomb", {[zoneIDs.WESTERN_PLAGUELANDS]={{52.06,83.26}}}},
        },
        [9453] = {
            [questKeys.nextQuestInChain] = 9454,
        },
        [9454] = {
            [questKeys.preQuestSingle] = {},
        },
        [9455] = {
            [questKeys.startedBy] = {nil,nil,{23678}},
        },
        [9457] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Gift of Naias near the Altar of Naias"), 0, {{"object", 181636}}}},
        },
        [9460] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_LOOT, l10n("Pickpocket the Lacy Handkerchief from the Sentinel Leader"), 0, {{"monster", 17210}}}},
        },
        [9467] = {
            [questKeys.requiredSourceItems] = {24335},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Summon Hauteur using the Ritual Torch"), 0, {{"object", 181672}}}},
        },
        [9472] = {
            [questKeys.requiredSourceItems] = {29112},
            [questKeys.objectives] = {{{17226,"Carinda's Scroll of Retribution used",Questie.ICON_TYPE_INTERACT}}},
        },
        [9484] = {
            [questKeys.triggerEnd] = {"Tame a Crazed Dragonhawk", {[zoneIDs.EVERSONG_WOODS]={{60.39,59.09},{61.23,65.08}}}},
        },
        [9485] = {
            [questKeys.triggerEnd] = {"Tame a Mistbat", {[zoneIDs.GHOSTLANDS]={{48.29,13.42},{55.22,11.22},{50.59,15.86}}}},
        },
        [9486] = {
            [questKeys.triggerEnd] = {"Tame an Elder Springpaw", {[zoneIDs.EVERSONG_WOODS]={{61.95,64.61},{64.77,59.93}}}},
        },
        [9487] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9489] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9491] = {
            [questKeys.preQuestSingle] = {},
        },
        [9494] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Gather a Fel Ember using Grand Warlock's Amulet"), 0, {{"object", 181679}}}},
        },
        [9498] = {
            [questKeys.preQuestSingle] = {10124},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE - raceIDs.BLOOD_ELF,
        },
        [9499] = {
            [questKeys.preQuestSingle] = {10124},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9500] = {
            [questKeys.questLevel] = -1,
        },
        [9501] = {
            [questKeys.questLevel] = -1,
        },
        [9503] = {
            [questKeys.questLevel] = -1,
        },
        [9504] = {
            [questKeys.questLevel] = -1,
        },
        [9508] = {
            [questKeys.questLevel] = -1,
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Destroy the barrel using the Skin of Purest Water"), 0, {{"object", 181699}}}},
        },
        [9509] = {
            [questKeys.questLevel] = -1,
        },
        [9514] = {
            [questKeys.preQuestSingle] = {9506},
            [questKeys.startedBy] = {nil,nil,{23759}},
        },
        [9523] = {
            [questKeys.preQuestSingle] = {9506,9512},
        },
        [9527] = {
            [questKeys.preQuestSingle] = {},
        },
        [9528] = {
            [questKeys.triggerEnd] = {"Magwin Escorted to Safety", {[zoneIDs.AZUREMYST_ISLE]={{16.38,94.14}}}},
        },
        [9531] = {
            [questKeys.objectives] = {nil,{{181694,"The Traitor Uncovered"}}},
        },
        [9532] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9538] = {
            [questKeys.triggerEnd] = {"Stillpine Furbolg Language Primer Read", {[zoneIDs.AZUREMYST_ISLE]={{49.29,51.07}}}},
        },
        [9544] = {
            [questKeys.requiredSourceItems] = {23801},
            [questKeys.objectives] = {{{17375,nil,Questie.ICON_TYPE_INTERACT}}},
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_INTERACT,l10n("Open the cage"),0,{{"object",410019}}}},
        },
        [9545] = {
            [questKeys.objectives] = {{{16852,"Vision Granted"}},nil,nil,nil},
        },
        [9549] = {
            [questKeys.preQuestSingle] = {},
        },
        [9558] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [9560] = {
            [questKeys.preQuestSingle] = {9544},
        },
        [9562] = {
            [questKeys.preQuestSingle] = {9544},
        },
        [9564] = {
            [questKeys.startedBy] = {nil,nil,{23850}},
            [questKeys.preQuestSingle] = {9559},
        },
        [9565] = {
            [questKeys.preQuestGroup] = {},
            [questKeys.preQuestSingle] = {9560,9562},
        },
        [9573] = {
            [questKeys.preQuestSingle] = {9560,9562},
        },
        [9575] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [9576] = {
            [questKeys.startedBy] = {nil,nil,{23870}},
        },
        [9582] = {
            [questKeys.requiredSourceItems] = {},
        },
        [9587] = {
            [questKeys.startedBy] = {nil,nil,{23890}},
        },
        [9588] = {
            [questKeys.startedBy] = {nil,nil,{23892}},
        },
        [9591] = {
            [questKeys.triggerEnd] = {"Tame a Barbed Crawler", {[zoneIDs.AZUREMYST_ISLE]={{20.29,64.87},{22.04,72.29},{20.57,68.9}}}},
        },
        [9592] = {
            [questKeys.triggerEnd] = {"Tame a Greater Timberstrider", {[zoneIDs.AZUREMYST_ISLE]={{36.46,35.49},{35.16,30.99},{40.27,37.65},{40.25,32.31}}}},
        },
        [9593] = {
            [questKeys.triggerEnd] = {"Tame a Nightstalker", {[zoneIDs.AZUREMYST_ISLE]={{36.41,40.24},{35.82,37.14}}}},
        },
        [9594] = {
            [questKeys.startedBy] = {nil,nil,{23900}},
        },
        [9601] = {
            [questKeys.startedBy] = {{16681,20406},nil,nil},
        },
        [9607] = {
            [questKeys.triggerEnd] = {"Fully Investigate The Blood Furnace", {[zoneIDs.HELLFIRE_PENINSULA]={{45.89,51.93}}}},
        },
        [9608] = {
            [questKeys.triggerEnd] = {"Fully Investigate The Blood Furnace", {[zoneIDs.HELLFIRE_PENINSULA]={{45.89,51.93}}}},
        },
        [9616] = {
            [questKeys.startedBy] = {nil,nil,{23910}},
        },
        [9618] = {
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
        },
        [9619] = {
            [questKeys.requiredSourceItems] = {},
        },
        [9629] = {
            [questKeys.objectives] = {{{17326,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [9630] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9635] = {
            [questKeys.requiredSkill] = {202,305},
        },
        [9636] = {
            [questKeys.requiredSkill] = {202,305},
        },
        [9637] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9638] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9639] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9640] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9644] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9645] = {
            [questKeys.triggerEnd] = {"Journal Entry Read", {[3457]={{-1,-1}}}},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9663] = {
            [questKeys.objectives] = {{{17440,"High Chief Stillpine Warned",Questie.ICON_TYPE_TALK},{17116,"Exarch Menelaous Warned",Questie.ICON_TYPE_TALK},{17240,"Admiral Odesyus Warned",Questie.ICON_TYPE_TALK}}},
        },
        [9666] = {
            [questKeys.objectives] = {{{17701},{17701,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [9667] = {
            [questKeys.preQuestSingle] = {9559},
            [questKeys.extraObjectives] = {
                {nil,Questie.ICON_TYPE_SLAY, l10n("Kill Bristlelimb Furbolgs to lure High Chief Bristlelimb"), 0, {{"monster", 17320}, {"monster", 17321}}},
                {nil,Questie.ICON_TYPE_INTERACT,l10n("Open the cage"),0,{{"object",181928}}},
            },
            [questKeys.objectives] = {{{17682,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [9668] = {
            [questKeys.nextQuestInChain] = 9693,
        },
        [9669] = {
            [questKeys.requiredLevel] = 16,
        },
        [9670] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17681,17680},17681,"Expedition Researcher Freed"}}},
        },
        [9671] = {
            [questKeys.requiredLevel] = 15,
        },
        [9672] = {
            [questKeys.startedBy] = {nil,{410001},nil},
        },
        [9678] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Light the brazier"), 0, {{"object", 181956}}}},
        },
        [9683] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Defile the Statue of Queen Azshara"), 0, {{"object", 181964}}}},
        },
        [9685] = {
            [questKeys.preQuestSingle] = {9684,63866},
        },
        [9686] = {
            [questKeys.triggerEnd] = {"Complete the Second Trial", {[zoneIDs.EVERSONG_WOODS]={{43.34,28.7}}}},
        },
        [9689] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Place the Bundle of Dragon Bones at the Ever-burning Pyre"), 0, {{"object", 181988}}}},
        },
        [9697] = {
            [questKeys.requiredMinRep] = {942,3000},
        },
        [9700] = {
            [questKeys.triggerEnd] = {"Sun Portal Site Confirmed", {[zoneIDs.BLOODMYST_ISLE]={{52.92,22.32}}}},
        },
        [9701] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.triggerEnd] = {"Investigate the Spawning Glen", {[zoneIDs.ZANGARMARSH]={{15.1,61.21}}}},
            [questKeys.requiredLevel] = 61,
        },
        [9704] = {
            [questKeys.preQuestSingle] = {},
        },
        [9711] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17664},17664,"Matis the Cruel Captured"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Call for help from Trackers of the Hand"), 0, {{"monster", 17664}}}},
        },
        [9716] = {
            [questKeys.triggerEnd] = {"Umbrafen Lake Investigated", {[zoneIDs.ZANGARMARSH]={{70.89,80.51}}}},
        },
        [9718] = {
            [questKeys.triggerEnd] = {"Use the Stormcrow Amulet and explore the lakes of Zangarmarsh", {[zoneIDs.ZANGARMARSH]={{76.8,44.1}}}},
        },
        [9720] = {
            [questKeys.objectives] = {{{17998,"Umbrafen Lake Controls Disabled",Questie.ICON_TYPE_EVENT},{18002,"Marshlight Lake Controls Disabled",Questie.ICON_TYPE_EVENT},{18000,"Serpent Lake Controls Disabled",Questie.ICON_TYPE_EVENT},{17999,"Lagoon Controls Disabled",Questie.ICON_TYPE_EVENT}}},
        },
        [9728] = {
            [questKeys.preQuestSingle] = {},
        },
        [9729] = {
            [questKeys.triggerEnd] = {"Ark of Ssslith safely returned to Sporeggar", {[zoneIDs.ZANGARMARSH]={{19.71,50.72}}}},
        },
        [9731] = {
            [questKeys.triggerEnd] = {"Drain Located", {[zoneIDs.ZANGARMARSH]={{50.44,40.91}}}},
        },
        [9737] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17910,17911,17912,17913,17914},17910,"Remove Alonsus Chapel Protection"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Use the Extinguishing Mixture near the eternal flame"), 0, {{"object", 182068}}}},
        },
        [9738] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.objectives] = {{{17885,"Earthbinder Rayge Discovered"},{17893,"Naturalist Bite Discovered"},{17890,"Weeder Greenthumb Discovered"},{17827,"Windcaller Claw Discovered"}}},
        },
        [9739] = {
            [questKeys.requiredMinRep] = {},
            [questKeys.requiredMaxRep] = {},
        },
        [9740] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Destroy all 4 Sunhawk Portal Controller"), 0, {{"object", 184850}}}},
        },
        [9743] = {
            [questKeys.requiredMinRep] = {},
            [questKeys.requiredMaxRep] = {},
        },
        [9752] = {
            [questKeys.triggerEnd] = {"Escort Kayra Longmane to safety", {[zoneIDs.ZANGARMARSH]={{79.76,71.09}}}},
        },
        [9753] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.requiredRaces] = raceIDs.DRAENEI,
        },
        [9756] = {
            [questKeys.objectives] = {{{17824,"Sunhawk Information Recovered",Questie.ICON_TYPE_TALK}}},
        },
        [9757] = {
            [questKeys.requiredRaces] = raceIDs.DRAENEI,
        },
        [9759] = {
            [questKeys.preQuestSingle] = {9756},
            [questKeys.triggerEnd] = {"Vector Coil Destroyed and Sironas Slain", {[zoneIDs.BLOODMYST_ISLE]={{14.86,54.84}}}},
        },
        [9760] = {
            [questKeys.exclusiveTo] = {9759},
        },
        [9785] = {
            [questKeys.objectives] = {{{17900,nil,Questie.ICON_TYPE_TALK},{17901,nil,Questie.ICON_TYPE_TALK}}},
        },
        [9786] = {
            [questKeys.triggerEnd] = {"Explore the Boha'mu Ruins", {[zoneIDs.ZANGARMARSH]={{44.13,68.97}}}},
        },
        [9796] = {
            [questKeys.requiredLevel] = 62,
            [questKeys.exclusiveTo] = {10105},
        },
        [9798] = {
            [questKeys.startedBy] = {nil,nil,{24414}},
            [questKeys.preQuestSingle] = {9309},
        },
        [9802] = {
            [questKeys.requiredMaxRep] = {},
        },
        [9805] = {
            [questKeys.objectives] = {{{18110,"Large Hut Destroyed",Questie.ICON_TYPE_EVENT},{18142,"Western Hut Destroyed",Questie.ICON_TYPE_EVENT},{18143,"Southern Hut Destroyed",Questie.ICON_TYPE_EVENT},{18144,"Eastern Hut Destroyed",Questie.ICON_TYPE_EVENT}}},
        },
        [9808] = {
            [questKeys.requiredMinRep] = {970,0},
        },
        [9816] = {
            [questKeys.objectives] = {nil,{{182164,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [9824] = {
            [questKeys.objectives] = {{{18161,nil,Questie.ICON_TYPE_EVENT},{18162,nil,Questie.ICON_TYPE_EVENT}}},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9825] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9830] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9831] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the container"), 0, {{"object", 182196}}}},
        },
        [9832] = {
            [questKeys.extraObjectives] = {
                {nil, Questie.ICON_TYPE_OBJECT, l10n("Open the container"), 1, {{"object", 182197}}},
                {nil, Questie.ICON_TYPE_OBJECT, l10n("Open the container"), 2, {{"object", 182198}}},
            },
        },
        [9833] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9834] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9836] = {
            [questKeys.objectives] = {{{15608,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [9838] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9840] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9843] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9844] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [9847] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Plant the Feralfen Totem on the ground"), 0, {{"object", 182176}}}},
        },
        [9849] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Gordawg's Boulder to shatter Shattered Rumblers into Minions of Gurok"), 0, {{"monster", 17157}}}},
        },
        [9853] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use 7 Warmaul Skulls to summon Gurok the Usurper"), 0, {{"object", 182182}}}},
        },
        [9863] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9864] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9867] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9868] = {
            [questKeys.triggerEnd] = {"Free the Mag'har Captive", {[zoneIDs.NAGRAND]={{31.77,38.78}}}},
            [questKeys.requiredMinRep] = {941,0},
        },
        [9869] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9870] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9871] = {
            [questKeys.startedBy] = {nil,nil,{24559}},
        },
        [9872] = {
            [questKeys.startedBy] = {nil,nil,{24558}},
        },
        [9874] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9878] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9879] = {
            [questKeys.requiredMinRep] = {978,0},
            [questKeys.triggerEnd] = {"Free the Kurenai Captive", {[zoneIDs.NAGRAND]={{31.57,38.78}}}},
        },
        [9889] = {
            [questKeys.objectives] = {{{18260},{18262}}},
        },
        [9898] = {
            [questKeys.name] = "The Respect of Another",
        },
        [9902] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9905] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9910] = {
            [questKeys.objectives] = {nil,{{182261},{182264},{182262}}},
        },
        [9911] = {
            [questKeys.startedBy] = {nil,nil,{25459}},
        },
        [9913] = {
            [questKeys.exclusiveTo] = {9882},
        },
        [9918] = {
            [questKeys.objectives] = {{{18351,"Lump Interrogated"}}},
        },
        [9923] = {
            [questKeys.requiredMinRep] = {978,0},
            [questKeys.requiredSourceItems] = {25490},
        },
        [9924] = {
            [questKeys.requiredSourceItems] = {25509},
        },
        [9927] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17146,17147,17148},17147,"Warmaul Ogre Banner Planted",Questie.ICON_TYPE_INTERACT}}},
            [questKeys.preQuestSingle] = {10107,10108},
        },
        [9928] = {
            [questKeys.preQuestSingle] = {10107,10108},
        },
        [9931] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17138,18064},17138,"Kil'sorrow Banner Planted",Questie.ICON_TYPE_INTERACT}}},
            [questKeys.preQuestGroup] = {9927,9928},
        },
        [9932] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Make smoke signals"), 0, {{"object", 182369}}}},
            [questKeys.preQuestGroup] = {9927,9928},
        },
        [9933] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {9931,9932},
        },
        [9934] = {
            [questKeys.preQuestGroup] = {9931,9932},
        },
        [9935] = {
            [questKeys.requiredMinRep] = {941,0},
            [questKeys.objectives] = {{{18391}},nil,nil,nil,{{{17146,17147,17148,18658,21276},21276}}},
        },
        [9936] = {
            [questKeys.requiredMinRep] = {978,0},
            [questKeys.objectives] = {{{18391}},nil,nil,nil,{{{17146,17147,17148,18658,21276},21276}}},
        },
        [9939] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9940] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9944] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [9945] = {
            [questKeys.requiredMinRep] = {941,0},
            [questKeys.preQuestSingle] = {},
        },
        [9948] = {
            [questKeys.requiredMinRep] = {941,0},
            [questKeys.objectives] = {{{18428,nil,Questie.ICON_TYPE_INTERACT}}},
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_INTERACT,l10n("Open the cage"),0,{{"object",182484}}}},
        },
        [9955] = {
            [questKeys.objectives] = {{{18445,"Corki Freed"}}},
        },
        [9956] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [9957] = {
            [questKeys.requiredMinRep] = {942,3000},
        },
        [9962] = {
            [questKeys.nextQuestInChain] = 9967,
        },
        [9967] = {
            [questKeys.nextQuestInChain] = 9970,
        },
        [9970] = {
            [questKeys.nextQuestInChain] = 9972,
        },
        [9972] = {
            [questKeys.nextQuestInChain] = 9973,
        },
        [9973] = {
            [questKeys.nextQuestInChain] = 9977,
        },
        [9982] = {
            [questKeys.requiredMinRep] = {978,0},
            [questKeys.exclusiveTo] = {9991},
        },
        [9983] = {
            [questKeys.exclusiveTo] = {9991},
            [questKeys.requiredMinRep] = {941,0},
        },
        [9991] = {
            [questKeys.triggerEnd] = {"Forge Camps Surveyed", {[zoneIDs.NAGRAND]={{27.22,43.05}}}},
            [questKeys.preQuestSingle] = {},
        },
        [10000] = {
            [questKeys.requiredLevel] = 62,
        },
        [10004] = {
            [questKeys.objectives] = {{{18584,"Sal'salabim Persuaded"}}},
        },
        [10008] = {
            [questKeys.preQuestSingle] = {},
        },
        [10012] = {
            [questKeys.preQuestSingle] = {9998,10000},
        },
        [10013] = {
            [questKeys.preQuestSingle] = {9998,10000},
        },
        [10017] = {
            [questKeys.preQuestSingle] = {10211},
            [questKeys.requiredMaxRep]= {932,0},
        },
        [10019] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,10017},
            [questKeys.requiredMaxRep]= {932,0},
        },
        [10020] = {
            [questKeys.preQuestSingle] = {10551},
        },
        [10021] = {
            [questKeys.preQuestSingle] = {10551},
            [questKeys.requiredMinRep]= {932,0},
        },
        [10024] = {
            [questKeys.preQuestSingle] = {10211},
            [questKeys.requiredMaxRep]= {934,0},
        },
        [10025] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,10024},
            [questKeys.requiredMaxRep]= {934,0},
        },
        [10035] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the carcass"), 0, {{"object", 184842}}}},
        },
        [10036] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the carcass"), 0, {{"object", 184842}}}},
        },
        [10039] = {
            [questKeys.requiredLevel] = 62,
        },
        [10040] = {
            [questKeys.objectives] = {{{18716,"Shadowy Initiate Spoken To",Questie.ICON_TYPE_TALK},{18717,"Shadowy Laborer Spoken To",Questie.ICON_TYPE_TALK},{18719,"Shadowy Advisor Spoken To",Questie.ICON_TYPE_TALK}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Get a disguise"), 0, {{"monster", 18714}}}},
        },
        [10041] = {
            [questKeys.objectives] = {{{18716,"Shadowy Initiate Spoken To",Questie.ICON_TYPE_TALK},{18717,"Shadowy Laborer Spoken To",Questie.ICON_TYPE_TALK},{18719,"Shadowy Advisor Spoken To",Questie.ICON_TYPE_TALK}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Get a disguise"), 0, {{"monster", 18714}}}},
        },
        [10044] = {
            [questKeys.objectives] = {{{18141,"Listen to Greatmother Geyah",Questie.ICON_TYPE_TALK}}},
            [questKeys.preQuestGroup] = {9934,9868,10011},
            [questKeys.preQuestSingle] = {},
        },
        [10047] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [10050] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [10051] = {
            [questKeys.triggerEnd] = {"Escort Isla Starmane to safety", {[zoneIDs.TEROKKAR_FOREST]={{67.51,37.28}}}},
        },
        [10052] = {
            [questKeys.triggerEnd] = {"Escort Isla Starmane to safety", {[zoneIDs.TEROKKAR_FOREST]={{67.51,37.28}}}},
        },
        [10058] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [10063] = {
            [questKeys.exclusiveTo] = {9549},
        },
        [10066] = {
            [questKeys.startedBy] = {{17986,18020},nil,nil},
        },
        [10067] = {
            [questKeys.startedBy] = {{17986,18020},nil,nil},
        },
        [10068] = {
            [questKeys.startedBy] = {{15279},nil,nil},
            [questKeys.exclusiveTo] = {8330},
            [questKeys.preQuestSingle] = {8328},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [10069] = {
            [questKeys.startedBy] = {{15280},nil,nil},
            [questKeys.exclusiveTo] = {8330},
            [questKeys.preQuestSingle] = {9676},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
        },
        [10070] = {
            [questKeys.startedBy] = {{15513},nil,nil},
            [questKeys.exclusiveTo] = {8330},
            [questKeys.preQuestSingle] = {9393},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.HUNTER,
        },
        [10071] = {
            [questKeys.exclusiveTo] = {8330},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.ROGUE,
        },
        [10072] = {
            [questKeys.startedBy] = {{15284},nil,nil},
            [questKeys.exclusiveTo] = {8330},
            [questKeys.preQuestSingle] = {8564},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PRIEST,
        },
        [10073] = {
            [questKeys.exclusiveTo] = {8330},
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.WARLOCK,
        },
        [10074] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [10075] = {
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [10076] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [10077] = {
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [10079] = {
            [questKeys.preQuestSingle] = {10143,10483},
        },
        [10085] = {
            [questKeys.objectives] = {{{18840,nil,Questie.ICON_TYPE_EVENT},{18841,nil,Questie.ICON_TYPE_EVENT},{18842,nil,Questie.ICON_TYPE_EVENT},{18843,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [10105] = {
            [questKeys.exclusiveTo] = {9796},
        },
        [10106] = {
            [questKeys.questLevel] = -1,
            [questKeys.requiredMaxRep] = {},
        },
        [10107] = {
            [questKeys.objectives] = {{{18261,"Hear the Tale of the Blademaster",Questie.ICON_TYPE_TALK}}},
        },
        [10108] = {
            [questKeys.objectives] = {{{18261,"Hear the Tale of the Blademaster",Questie.ICON_TYPE_TALK}}},
        },
        [10110] = {
            [questKeys.questLevel] = -1,
            [questKeys.requiredMaxRep] = {},
        },
        [10111] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Jump!"), 0, {{"object", 183146}}}},
        },
        [10113] = {
            [questKeys.exclusiveTo] = {9854,9857,9789},
            [questKeys.requiredLevel] = 64,
        },
        [10114] = {
            [questKeys.exclusiveTo] = {9854,9857,9789},
        },
        [10120] = {
            [questKeys.preQuestSingle] = {},
        },
        [10121] = {
            [questKeys.preQuestSingle] = {},
        },
        [10129] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Wing Commander Brack"), 0, {{"monster", 19401}}}},
            [questKeys.objectives] = {nil,{{183350,"Gateway Murketh Destroyed"},{183351,"Gateway Shaadraz Destroyed"}}},
        },
        [10146] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Wing Commander Dabir'ee"), 0, {{"monster", 19409}}}},
            [questKeys.objectives] = {nil,{{183350,"Gateway Murketh Destroyed"},{183351,"Gateway Shaadraz Destroyed"}}},
        },
        [10162] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Wing Commander Brack"), 0, {{"monster", 19401}}}},
        },
        [10163] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Gryphoneer Windbellow"), 0, {{"monster", 20235}}}},
            [questKeys.preQuestSingle] = {10146},
        },
        [10168] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Soul Mirror near Ancient Orc Ancestors to summon Darkened Spirits."), 0, {{"monster", 18688}}}},
        },
        [10172] = {
            [questKeys.objectives] = {{{18141,"Speak to Greatmother Geyah",Questie.ICON_TYPE_TALK}}},
        },
        [10182] = {
            [questKeys.objectives] = {nil,{{183269,"Put Dathric's Spirit to Rest"}}},
        },
        [10183] = {
            [questKeys.exclusiveTo] = {11036,11037,11038,11039,11040,11042},
        },
        [10184] = {
            [questKeys.preQuestSingle] = {10300},
        },
        [10189] = {
            [questKeys.preQuestSingle] = {10551,10552},
            [questKeys.requiredMinRep] = {934,3000},
        },
        [10190] = {
            [questKeys.objectives] = {{{18879,"Battery Charge Level"}},nil,nil,nil},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Battery Recharging Blaster when it's weakened"), 0, {{"monster", 18879}}}},
        },
        [10191] = {
            [questKeys.triggerEnd] = {"Escort the Maxx A. Million Mk. V safely through the Ruins of Enkaat", {[zoneIDs.NETHERSTORM]={{31.54,56.47}}}},
        },
        [10198] = {
            [questKeys.triggerEnd] = {"Information Gathering", {[zoneIDs.NETHERSTORM]={{48.18,84.08}}}},
        },
        [10200] = {
            [questKeys.requiredMinRep] = {934,3000},
        },
        [10201] = {
            [questKeys.objectives] = {{{19606,"Have Grek Test Olemba Oil",Questie.ICON_TYPE_TALK}}},
        },
        [10204] = {
            [questKeys.triggerEnd] = {"Siphon Bloodgem Crystal", {[zoneIDs.NETHERSTORM]={{25.42,66.51},{22.37,65.73}}}},
            [questKeys.requiredSourceItems] = {28452},
        },
        [10211] = {
            [questKeys.triggerEnd] = {"City of Light", {[zoneIDs.SHATTRATH_CITY]={{50.45,42.93}}}},
        },
        [10218] = {
            [questKeys.triggerEnd] = {"Escort Cryo-Engineer Sha'heen", {[zoneIDs.MANA_TOMBS]={{-1,-1}}}},
        },
        [10222] = {
            [questKeys.preQuestSingle] = {10188},
        },
        [10226] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Elemental Power Extractor before killing it"), 0, {{"monster", 18865},{"monster", 18881}}}},
        },
        [10231] = {
            [questKeys.objectives] = {{{19720,"Beat Down \"Dirty\" Larry and Get Information"}}},
        },
        [10240] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Activate the rune"), 0, {{"object", 183947}}}},
            [questKeys.objectives] = {{{19866,"Activate Eastern Rune", Questie.ICON_TYPE_EVENT},{19867,"Activate Northeastern Rune", Questie.ICON_TYPE_EVENT},{19868,"Activate Western Rune", Questie.ICON_TYPE_EVENT}}},
        },
        [10242] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Take a ride to Spinebreaker Post"), 0, {{"monster", 19401}}}},
        },
        [10243] = {
            [questKeys.preQuestSingle] = {10241},
        },
        [10246] = {
            [questKeys.preQuestSingle] = {10299},
        },
        [10248] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Take control of the Scrap Reaver X6000."), 0, {{"monster", 19849}}}},
        },
        [10250] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Blow the Unyielding Battle Horn near the Alliance Banner"), 0, {{"object", 184005}}}},
        },
        [10255] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Cenarion Antidote on a Hulking Helboar"), 0, {{"monster", 16880}}}},
            [questKeys.objectives] = {{{16880,"Administer Antidote"}}},
        },
        [10256] = {
            [questKeys.objectives] = {{{19938,nil,Questie.ICON_TYPE_EVENT}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Use Apex's Crystal Focus near Archmage Vargoth's Orb"), 0, {{"object", 183507}}}},
        },
        [10263] = {
            [questKeys.preQuestGroup] = {10551,10186},
            [questKeys.requiredMinRep] = {932,3000},
        },
        [10264] = {
            [questKeys.preQuestGroup] = {10552,10186},
            [questKeys.requiredMinRep] = {934,3000},
        },
        [10265] = {
            [questKeys.preQuestSingle] = {},
        },
        [10269] = {
            [questKeys.triggerEnd] = {"First triangulation point discovered", {[zoneIDs.NETHERSTORM]={{66.67,33.85}}}},
        },
        [10270] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Wind Trader Marid"), 0, {{"object", 184073}}}},
        },
        [10274] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Challenge of the Blue Fight to challenge Veraku"), 0, {{"object", 184108}}}},
        },
        [10275] = {
            [questKeys.triggerEnd] = {"Second triangulation point discovered", {[zoneIDs.NETHERSTORM]={{28.92,41.25}}}},
        },
        [10277] = {
            [questKeys.triggerEnd] = {"Caverns of Time Explained", {[zoneIDs.TANARIS]={{58.87,54.3}}}},
            [questKeys.nextQuestInChain] = 10282,
        },
        [10283] = {
            [questKeys.objectives] = {nil,{{182589,"Internment Lodges Set Ablaze"}}},
        },
        [10288] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.nextQuestInChain] = 0,
        },
        [10291] = {
            [questKeys.preQuestSingle] = {},
        },
        [10296] = {
            [questKeys.startedBy] = {{20130}},
        },
        [10297] = {
            [questKeys.objectives] = {{{15608,"The Dark Portal Opened"}}},
        },
        [10299] = {
            [questKeys.objectives] = {nil,{{183770}},{{29366}}},
        },
        [10302] = {
            [questKeys.preQuestSingle] = {},
        },
        [10305] = {
            [questKeys.objectives] = {nil,{{183268,"Put Belmara's Spirit to Rest"}}},
        },
        [10306] = {
            [questKeys.objectives] = {nil,{{183267,"Put Luminrath's Spirit to Rest"}}},
        },
        [10307] = {
            [questKeys.objectives] = {nil,{{183266,"Put Cohlien's Spirit to Rest"}}},
        },
        [10308] = {
            [questKeys.requiredMinRep] = {933,0},
        },
        [10310] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.triggerEnd] = {"Burning Legion warp-gate sabotaged", {[zoneIDs.NETHERSTORM]={{48.14,63.38}}}},
        },
        [10321] = {
            [questKeys.objectives] = {nil,{{183956}},{{29396}}},
        },
        [10322] = {
            [questKeys.objectives] = {nil,{{184311}},{{29397}}},
        },
        [10323] = {
            [questKeys.objectives] = {nil,{{184312}},{{29411}}},
        },
        [10325] = {
            [questKeys.requiredMaxRep] = {932,9000},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10326] = {
            [questKeys.requiredMaxRep] = {932,9000},
            [questKeys.preQuestGroup] = {10551,10325},
            [questKeys.preQuestSingle] = {},
        },
        [10327] = {
            [questKeys.requiredMaxRep] = {932,9000},
            [questKeys.preQuestGroup] = {10551,10325},
            [questKeys.preQuestSingle] = {},
        },
        [10329] = {
            [questKeys.objectives] = {nil,{{183770}},{{29366}}},
        },
        [10330] = {
            [questKeys.objectives] = {nil,{{183956}},{{29396}}},
        },
        [10335] = {
            [questKeys.objectives] = {{{20473,"Surveying Marker One placed",Questie.ICON_TYPE_EVENT},{20475,"Surveying Marker Two placed",Questie.ICON_TYPE_EVENT},{20476,"Surveying Marker Three placed",Questie.ICON_TYPE_EVENT}}},
        },
        [10337] = {
            [questKeys.triggerEnd] = {"Escort Bessy on her way home.", {[zoneIDs.NETHERSTORM]={{57.71,84.97}}}},
        },
        [10338] = {
            [questKeys.objectives] = {nil,{{184311}},{{29397}}},
        },
        [10339] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10340] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Wing Commander Dabir'ee"), 0, {{"monster", 19409}}}},
        },
        [10344] = {
            [questKeys.exclusiveTo] = {10163},
        },
        [10352] = {
            [questKeys.startedBy] = {{14725},nil,nil},
            [questKeys.finishedBy] = {{14725},nil},
            [questKeys.reputationReward] = {{factionIDs.DARNASSUS,350}},
        },
        [10354] = {
            [questKeys.startedBy] = {{14725},nil,nil},
            [questKeys.finishedBy] = {{14725},nil},
            [questKeys.reputationReward] = {{factionIDs.DARNASSUS,350}},
        },
        [10357] = {
            [questKeys.preQuestGroup] = {7792,7798,10356},
        },
        [10362] = {
            [questKeys.preQuestGroup] = {10359,10360,10361},
        },
        [10365] = {
            [questKeys.objectives] = {nil,{{184312}},{{29411}}},
        },
        [10367] = {
            [questKeys.preQuestSingle] = {},
        },
        [10368] = {
            [questKeys.objectives] = {{{20677,"Morod Freed",Questie.ICON_TYPE_TALK},{20678,"Akoru Freed",Questie.ICON_TYPE_TALK},{20679,"Aylaan Freed",Questie.ICON_TYPE_TALK}}},
        },
        [10369] = {
            [questKeys.objectives] = {{{19354}}},
        },
        [10373] = {
            [questKeys.startedBy] = {{20722},nil,nil},
            [questKeys.exclusiveTo] = {5066,5090,5091},
        },
        [10374] = {
            [questKeys.startedBy] = {{20724},nil,nil},
            [questKeys.exclusiveTo] = {5093,5094,5095},
        },
        [10382] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Speak with Gryphoneer Windbellow"), 0, {{"monster", 20235}}}},
        },
        [10384] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10385] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10388] = {
            [questKeys.startedBy] = {{16576,19273},nil,nil},
            [questKeys.preQuestSingle] = {10129},
        },
        [10389] = {
            [questKeys.preQuestSingle] = {10392},
        },
        [10403] = {
            [questKeys.startedBy] = {{20677,20678,20679},nil,nil},
        },
        [10405] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10406] = {
            [questKeys.triggerEnd] = {"Ethereum Conduit Sabotaged", {[zoneIDs.NETHERSTORM]={{56.42,42.66}}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10408] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Communicate with Commander Ameer"), 0, {{"object", 410018}}}},
        },
        [10409] = {
            [questKeys.objectives] = {{{20132,"Deathblow to the Legion"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Take the portal to Socrethar's Seat"), 0, {{"object", 410016}}},
                                           {nil, Questie.ICON_TYPE_OBJECT, l10n("Take the portal back to Invasion Point: Overlord"), 0, {{"object", 410017}}},
                                           {nil, Questie.ICON_TYPE_TALK, l10n("When at Socrethar's Seat, ask for his help against Socrethar"), 0, {{"monster", 18537}}},
                                           {{[zoneIDs.NETHERSTORM]={{36.44,18.35}}}, Questie.ICON_TYPE_EVENT, l10n("Open a portal to Socrethar's Seat with Socrethar's Teleporting Stone")},
                                           {{[zoneIDs.NETHERSTORM]={{30.56,17.69}}}, Questie.ICON_TYPE_EVENT, l10n("After defeating Socrethar, you can open a portal back")},
            },
        },
        [10411] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use Navuud's Concoction before attacking Seeping Sludges"), 1, {{"monster", 20501}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Use Navuud's Concoction before attacking Void Wastes"), 2, {{"monster", 20778}}},
            },
        },
        [10412] = {
            [questKeys.requiredMaxRep] = {934,9000},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10414] = {
            [questKeys.requiredMaxRep] = {934,9000},
            [questKeys.preQuestGroup] = {10412,10552},
            [questKeys.preQuestSingle] = {},
        },
        [10415] = {
            [questKeys.requiredMaxRep] = {934,9000},
            [questKeys.preQuestGroup] = {10412,10552},
            [questKeys.preQuestSingle] = {},
        },
        [10422] = {
            [questKeys.requiredSourceItems] = {29742},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the prison"), 0, {{"object", 184588}}}},
            [questKeys.objectives] = {nil,nil,nil,nil,{{{20787,20825},20787,"Captain Tyralius Freed",Questie.ICON_TYPE_EVENT}}},
        },
        [10424] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Diagnostic Device while standing near the Eco-Dome Sutheron Generator"), 0, {{"object", 184609}}}},
        },
        [10425] = {
            [questKeys.triggerEnd] = {"Captured Protectorate Vanguard Escorted", {[zoneIDs.NETHERSTORM]={{58.9,32.43}}}},
        },
        [10426] = {
            [questKeys.objectives] = {{{20774,"Test Energy Modulator",Questie.ICON_TYPE_INTERACT}}},
        },
        [10427] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{20610,20777},20777,"Talbuk Tagged",Questie.ICON_TYPE_INTERACT}}},
        },
        [10438] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Protectorate Nether Drake will fly you close enough to Ultris so that you can drop the disruptor on top of the Void Conduit"), 0, {{"monster", 20903}}}},
        },
        [10439] = {
            [questKeys.objectives] = {{{19554},{20985,"Speak to Captain Saeed",Questie.ICON_TYPE_TALK}}},
        },
        [10446] = {
            [questKeys.objectives] = {nil,{{184725,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [10447] = {
            [questKeys.objectives] = {nil,{{184725,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [10451] = {
            [questKeys.triggerEnd] = {"Earthmender Wilda Escorted to Safety", {[zoneIDs.SHADOWMOON_VALLEY]={{53.14,25.17}}}},
        },
        [10458] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.objectives] = {{{21050,"Earthen Soul Captured"},{21061,"Fiery Soul Captured"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Totem of Spirits on Enraged Earth and Fiery Spirits"), 0, {{"monster", 21050}, {"monster", 21061}}}},
        },
        [10460] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 10467,
            [questKeys.preQuestSingle] = {10445},
        },
        [10461] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 10465,
            [questKeys.preQuestSingle] = {10445},
        },
        [10462] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 10466,
            [questKeys.preQuestSingle] = {10445},
        },
        [10463] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 10464,
            [questKeys.preQuestSingle] = {10445},
        },
        [10464] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.exclusiveTo] = {10460,10461,10462},
        },
        [10465] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,3000},
            [questKeys.exclusiveTo] = {10460,10462,10463},
        },
        [10466] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,3000},
            [questKeys.exclusiveTo] = {10460,10461,10463},
        },
        [10467] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,3000},
            [questKeys.exclusiveTo] = {10461,10462,10463},
        },
        [10468] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.exclusiveTo] = {10460,10461,10462},
        },
        [10469] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.exclusiveTo] = {10460,10462,10463},
        },
        [10470] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,9000},
            [questKeys.exclusiveTo] = {10460,10461,10463},
        },
        [10471] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,9000},
            [questKeys.exclusiveTo] = {10461,10462,10463},
        },
        [10472] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 11103,
            [questKeys.exclusiveTo] = {10460,10461,10462},
        },
        [10473] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 11104,
            [questKeys.exclusiveTo] = {10460,10462,10463},
        },
        [10474] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.requiredMinRep] = {990,21000},
            [questKeys.nextQuestInChain] = 11105,
            [questKeys.exclusiveTo] = {10460,10461,10463},
        },
        [10475] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.nextQuestInChain] = 11106,
            [questKeys.exclusiveTo] = {10461,10462,10463},
        },
        [10476] = {
            [questKeys.requiredMinRep] = {978,0},
        },
        [10479] = {
            [questKeys.requiredMinRep] = {941,0},
        },
        [10480] = {
            [questKeys.objectives] = {{{21059,"Watery Soul Captured"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Totem of Spirits on Enraged Water Spirits"), 0, {{"monster", 21059}}}},
        },
        [10481] = {
            [questKeys.objectives] = {{{21060,"Airy Soul Captured"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Totem of Spirits on Enraged Air Spirits"), 0, {{"monster", 21060}}}},
        },
        [10488] = {
            [questKeys.objectives] = {{{20748,"Use Gor'drek's Ointment to strengthen the Thunderlord Dire Wolves",Questie.ICON_TYPE_INTERACT}}},
        },
        [10506] = {
            [questKeys.objectives] = {{{20058,"Apply the Diminution Powder on the Bloodmaul Dire Wolves"}}},
        },
        [10507] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Take the portal to Socrethar's Seat"), 0, {{"object", 410016}}},
                                           {nil, Questie.ICON_TYPE_OBJECT, l10n("Take the portal back to Invasion Point: Overlord"), 0, {{"object", 410017}}},
                                           {{[zoneIDs.NETHERSTORM]={{36.44,18.35}}}, Questie.ICON_TYPE_EVENT, l10n("Open a portal to Socrethar's Seat with Socrethar's Teleporting Stone")},
                                           {{[zoneIDs.NETHERSTORM]={{30.56,17.69}}}, Questie.ICON_TYPE_EVENT, l10n("After defeating Socrethar, you can open a portal back")},
            },
        },
        [10512] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{19998,20334,20723,20726,20730,20731,20732,21296,21975,19995},19995,"Bladespire Ogres drunken"}}},
        },
        [10514] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Oronok's Boar Whistle to dig up a Shadowmoon Tuber"), 0, {{"object", 184701}}}},
        },
        [10518] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the Bladespire Banner atop the Northmaul Tower"), 0, {{"object", 184704}}}},
        },
        [10519] = {
            [questKeys.objectives] = {{{21183,"The Cipher of Damnation - History and Truth"}}},
        },
        [10520] = {
            [questKeys.startedBy] = {{16739},nil,nil},
            [questKeys.exclusiveTo] = {3516,3789,3790},
        },
        [10522] = {
            [questKeys.requiredSourceItems] = {30426},
        },
        [10525] = {
            [questKeys.triggerEnd] = {"Final Thunderlord artifact discovered", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{52.76,58.89}}}},
        },
        [10526] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Attempt to loot The Thunderspike"), 0, {{"object", 184729}}}},
        },
        [10540] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.SHADOWMOON_VALLEY]={{30,57}}}, Questie.ICON_TYPE_EVENT, l10n("Walk with your Spirit Hunter")}},
        },
        [10545] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{19998,20334,20723,20726,20730,20731,20732,21296,21975,19995},19995,"Bladespire Ogres drunken",Questie.ICON_TYPE_INTERACT}}},
        },
        [10554] = {
            [questKeys.requiredMinRep]= {932,0},
        },
        [10556] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Fistful of Feathers on the Lashh'an Spell Circle and get back to Daranelle"), 0, {{"object", 184826}, {"monster", 21469}}}},
        },
        [10557] = {
            -- Since you don't just have to reach the position this triggerEnd does not make much sense as is empty on purpose!
            [questKeys.triggerEnd] = {"Test Tally's Experiment", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{-1,-1}}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Speak with Rally Zapnabber and use the Zephyrium Capacitorium"), 0, {{"monster", 21461}}}},
        },
        [10563] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Box o'Tricks while standing near the communication device"), 0, {{"object", 184833}}}},
        },
        [10565] = { -- The Stones of Vekh'nir
            [questKeys.extraObjectives] = {{{[zoneIDs.BLADES_EDGE_MOUNTAINS]={{77.81,74.67}}}, Questie.ICON_TYPE_EVENT, l10n("Charge the Vekh'nir Crystal")}},
        },
        [10566] = { -- Trial and Error
            [questKeys.objectives] = {{{21254,nil,Questie.ICON_TYPE_INTERACT},{21254,nil,Questie.ICON_TYPE_INTERACT},{21254,nil,Questie.ICON_TYPE_INTERACT},{21254,nil,Questie.ICON_TYPE_INTERACT}}}, -- Yes, this is correct. The quest requires you to use four wands on the same NPC.
            [questKeys.requiredSourceItems] = {30651,30652,30653,30654,30655},
        },
        [10567] = { -- Creating the Pendant
            [questKeys.extraObjectives] = {{{[zoneIDs.BLADES_EDGE_MOUNTAINS]={{64.48,33.11}}}, Questie.ICON_TYPE_EVENT, l10n("Use 6 Ruuan'ok Claws to summon a Harbinger of the Raven")}},
        },
        [10570] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Place the Bundle of Bloodthistle at the end of the bridge"), 0, {{"object", 184841}}}},
        },
        [10577] = {
            [questKeys.objectives] = {{{20563,"Illidan's Message Delivered"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Blood Elf Disguise before talking to him"), 0, {{"monster", 20563}}}},
        },
        [10580] = {
            [questKeys.exclusiveTo] = {10584},
        },
        [10581] = {
            [questKeys.exclusiveTo] = {10584},
        },
        [10584] = {
            [questKeys.objectives] = {{{21729,"Electromentals collected"},{21731,"Electromentals collected"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the Power Converters and encase what is inside with the Protovoltaic Magneto Collector"), 0, {{"object", 184906}}}},
        },
        [10585] = {
            [questKeys.sourceItemId] = 30672,
            [questKeys.extraObjectives] = {{{[zoneIDs.SHADOWMOON_VALLEY]={{37,38}}}, Questie.ICON_TYPE_EVENT, l10n("Use the Elemental Displacer to disrupt the ritual in the summoning chamber"), 0}},
        },
        [10588] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use The Cipher of Damnation at Altar of Damnation"), 0, {{"object", 184907}}},
                                           {nil, Questie.ICON_TYPE_TALK, l10n("Let him know when you are ready for Cyrukh"), 0, {{"monster", 21685}}},
            },
        },
        [10594] = {
            [questKeys.triggerEnd] = {"Singing crystal resonant frequency gauged", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{59.77,73.83}}}},
        },
        [10596] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Box o'Tricks while standing near the communication device"), 0, {{"object", 184833}}}},
        },
        [10598] = {
            [questKeys.objectives] = {{{21512,"Destroy Legion Hold Infernals",Questie.ICON_TYPE_EVENT}}},
        },
        [10605] = {
            [questKeys.exclusiveTo] = {1472,1507},
        },
        [10607] = {
            [questKeys.objectives] = {nil,{{184950,"Receive the First Prophecy"},{184967,"Receive the Second Prophecy"},{184968,"Receive the Third Prophecy"},{184969,"Receive the Fourth Prophecy"}}},
        },
        [10609] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open Nether Drake Eggs and use the Temporal Phase Modulator on whatever hatches"), 0, {{"object", 184867}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Use the Temporal Phase Modulator"), 0, {{"monster", 20021}}},
            },
        },
        [10612] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use a Fel Reaver Control Console to take control of a Fel Reaver Sentinel"), 0, {{"object", 185057}}}},
            [questKeys.objectives] = {nil,{{184979,"Deathforged Infernal Destroyed"}}},
        },
        [10613] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use a Fel Reaver Control Console to take control of a Fel Reaver Sentinel"), 0, {{"object", 185059}}}},
            [questKeys.objectives] = {nil,{{184979,"Deathforged Infernal Destroyed"}}},
        },
        [10629] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill some Deranged Helboars"), 0, {{"monster", 16863}}},
                                           {nil, Questie.ICON_TYPE_EVENT, l10n("Use the Felhound Whistle"), 0, {{"monster", 16915}}},
            },
        },
        [10634] = {
            [questKeys.preQuestSingle] = {10633,10644},
        },
        [10635] = {
            [questKeys.preQuestSingle] = {10633,10644},
        },
        [10636] = {
            [questKeys.preQuestSingle] = {10633,10644},
        },
        [10637] = {
            [questKeys.objectives] = {{{21506,"Azaloth Freed"}}},
        },
        [10639] = {
            [questKeys.preQuestGroup] = {10634,10635,10636},
        },
        [10641] = {
            [questKeys.preQuestSingle] = {10640,10689},
        },
        [10645] = {
            [questKeys.preQuestGroup] = {10634,10635,10636},
        },
        [10646] = {
            [questKeys.objectives] = {{{18417,"Illidan's Pupil"}}},
        },
        [10652] = {
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_TALK,l10n("Take a ride"),0,{{"monster",20162}}}},
        },
        [10653] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10654] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestGroup] = {10551,10653},
            [questKeys.preQuestSingle] = {},
        },
        [10655] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestGroup] = {10551,10653},
            [questKeys.preQuestSingle] = {},
        },
        [10656] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10657] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Repolarized Magneto Sphere to absorb 25 lightning strikes from the Scalewing Serpents"), 0, {{"monster", 20749}}}},
        },
        [10658] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestGroup] = {10656,10552},
            [questKeys.preQuestSingle] = {},
        },
        [10659] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestGroup] = {10656,10552},
            [questKeys.preQuestSingle] = {},
        },
        [10668] = {
            [questKeys.preQuestSingle] = {10640,10689},
        },
        [10669] = {
            [questKeys.preQuestSingle] = {10640,10689},
            [questKeys.extraObjectives] = {{{[zoneIDs.ZANGARMARSH]={{15.9,40.5}}}, Questie.ICON_TYPE_EVENT, l10n("Use the Imbued Silver Spear at Portal Clearing near Marshlight Lake to awake Xeleth")}},
        },
        [10672] = {
            [questKeys.objectives] = {{{21462,"Greater Felfire Diemetradon Tagged",Questie.ICON_TYPE_INTERACT}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use a Arcano Control Unit and then swim in the lava to tag the Greater Felfire Diemetradon"), 0, {{"object", 185008},{"object", 185009},{"object", 185010}}}},
        },
        [10674] = {
            [questKeys.objectives] = {{{20635,"Razaani Light Orbs trapped",Questie.ICON_TYPE_EVENT}}},
        },
        [10675] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Razaani ethereals to lure Nexus-Prince Razaan out"), 0, {{"monster", 20601}, {"monster", 20609}, {"monster", 20614}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Kill Nexus-Prince Razaan to spawn the Collection of Souls"), 0, {{"monster", 21057}}},
            },
        },
        [10682] = {
            [questKeys.objectives] = {{{21981,"Negotiations with Overseer Nuaar complete",Questie.ICON_TYPE_TALK}}},
        },
        [10683] = {
            [questKeys.preQuestSingle] = {10552},
        },
        [10687] = {
            [questKeys.preQuestSingle] = {10552},
        },
        [10707] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Kill the 3 Shadowmoon Soulstealers to force Shadowlord Deathwail to land"), 0, {{"object", 185125}}}},
        },
        [10708] = {
            [questKeys.exclusiveTo] = {11052},
        },
        [10710] = {
            -- Since you don't just have to reach the position this triggerEnd does not make much sense as is empty on purpose!
            [questKeys.triggerEnd] = {"Throw caution to the wind.", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{-1,-1}}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Sign Tally's Waiver, then speak with Rally Zapnabber to use the Zephyrium Capacitorium"), 0, {{"monster", 21461}}}},
        },
        [10711] = {
            -- Since you don't just have to reach the position this triggerEnd does not make much sense as is empty on purpose!
            [questKeys.triggerEnd] = {"Reach the Sky's Limit.", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{-1,-1}}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10710, 10657},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Speak with Rally Zapnabber to use the Zephyrium Capacitorium"), 0, {{"monster", 21461}}}},
        },
        [10712] = {
            -- Since you don't just have to reach the position this triggerEnd does not make much sense as is empty on purpose!
            [questKeys.triggerEnd] = {"Launch to Ruuan Weald.", {[zoneIDs.BLADES_EDGE_MOUNTAINS]={{-1,-1}}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10711, 10675},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Speak with Rally Zapnabber to use the Zephyrium Capacitorium and spin the Nether-weather Vane while flying"), 0, {{"monster", 21461}}}},
        },
        [10719] = {
            [questKeys.preQuestSingle] = {10682},
        },
        [10714] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{22160,22384},22160,"Meeting with Kolphis Darkscale attended",Questie.ICON_TYPE_EVENT}}},
        },
        [10720] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Control the Marmot"), 0, {{"monster", 22480}}}},
            [questKeys.objectives] = {nil,{{185206,"Poison the keg of Green Spot Grog",Questie.ICON_TYPE_EVENT},{185213,"Poison the keg of Ripe Moonshine",Questie.ICON_TYPE_EVENT},{185214,"Poison the keg of Fermented Seed Beer",Questie.ICON_TYPE_EVENT}}},
        },
        [10721] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Blow the whistle and have Grulloc run after the boar"), 0, {{"monster", 20216}}}},
        },
        [10722] = {
            [questKeys.objectives] = {{{22019,"Meeting with Kolphis Darkscale attended",Questie.ICON_TYPE_TALK}}},
            [questKeys.requiredSourceItems] = {31121,31122},
        },
        [10723] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Sablemane's Trap at Gorgrom's Altar"), 0, {{"object", 185234}}}},
            [questKeys.objectives] = {{{21514,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [10724] = {
            [questKeys.objectives] = {{{22268,"Rescue Leokk",Questie.ICON_TYPE_EVENT}}},
        },
        [10725] = {
            [questKeys.nextQuestInChain] = 11031,
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10726] = {
            [questKeys.nextQuestInChain] = 11034,
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10727] = {
            [questKeys.nextQuestInChain] = 11033,
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10728] = {
            [questKeys.nextQuestInChain] = 11032,
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10729] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10730] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10731] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10732] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10733] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10734] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10735] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10736] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10738] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10739] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10740] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10741] = {
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [10742] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Rexxar's Battle Horn at the Altar of Goc"), 0, {{"object", 185309}}}},
        },
        [10747] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_LOOT, l10n("Throw a net at the targeted wyrmcult blackwhelp"), 0, {{"monster", 21387}}}},
        },
        [10750] = {
            [questKeys.triggerEnd] = {"The Path of Conquest Discovered", {[zoneIDs.SHADOWMOON_VALLEY]={{51.23,62.75},{52.45,59.19}}}},
        },
        [10752] = {
            [questKeys.exclusiveTo] = {},
        },
        [10754] = {
            [questKeys.startedBy] = {{22037},nil,nil},
        },
        [10755] = {
            [questKeys.startedBy] = {{22037},nil,nil},
        },
        [10772] = {
            [questKeys.triggerEnd] = {"The Path of Conquest Discovered", {[zoneIDs.SHADOWMOON_VALLEY]={{51.23,62.75},{52.45,59.19}}}},
        },
        [10781] = {
            [questKeys.triggerEnd] = {"Crimson Sigil Forces Annihilated", {[zoneIDs.SHADOWMOON_VALLEY]={{51.75,72.79}}}},
        },
        [10782] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Equip the Unfinished Headpiece, travel to the Altar of Damnation, and use it while standing near Gul'dan."), 0, {{"monster", 17008}}}},
        },
        [10788] = {
            [questKeys.startedBy] = {{5675,5875},nil,nil},
        },
        [10791] = {
            [questKeys.objectives] = {{{18384,"Help Malukaz Summon the Wolf Spirit",Questie.ICON_TYPE_INTERACT}}},
        },
        [10792] = {
            [questKeys.requiredSourceItems] = {31347,31346},
            [questKeys.objectives] = {{{20813,"Barracks Burned", Questie.ICON_TYPE_EVENT},{20815,"Eastern Hovel Burned", Questie.ICON_TYPE_EVENT},{20816,"Western Hovel Burned", Questie.ICON_TYPE_EVENT},{20814,"Stable Burned", Questie.ICON_TYPE_EVENT}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Light the torches"), 0, {{"object", 185144}}}},
        },
        [10793] = {
            [questKeys.startedBy] = {nil,nil,{31345}},
        },
        [10797] = {
            [questKeys.startedBy] = {{20753},nil,nil},
            [questKeys.preQuestSingle] = {},
        },
        [10800] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Put Grulloc to sleep using Sablemane's Sleeping Powder"), 0, {{"monster", 20216}}}},
        },
        [10802] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Sablemane's Trap at Gorgrom's Altar"), 0, {{"object", 185234}}}},
            [questKeys.objectives] = {{{21514,nil,Questie.ICON_TYPE_INTERACT}}},
        },
        [10804] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_LOOT, l10n("Kill flayers and take their carcasses. Place a carcass in the field"), 0, {{"monster", 21477}, {"monster", 21478}}}},
            [questKeys.requiredSourceItems] = {31372,31373},
            [questKeys.objectives] = {{{21648,"Mature Netherwing Drake fed",Questie.ICON_TYPE_EVENT}}},
        },
        [10806] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Sablemane's Signet at the Altar of Goc"), 0, {{"object", 185309}}}},
        },
        [10807] = {
            [questKeys.preQuestSingle] = {10552},
        },
        [10808] = {
            [questKeys.objectives] = {{{22137,"End Dark Conclave Summoning Ritual",Questie.ICON_TYPE_EVENT}}},
        },
        [10813] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{19440,22177},22177,"Eye of Grillok Returned"}}},
        },
        [10814] = {
            [questKeys.objectives] = {{{21657,"The Tale of Neltharaku"}}},
        },
        [10821] = {
            [questKeys.requiredSourceItems] = {31536},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Retrieve five Camp Anger Keys and activate the five Legion obelisks. The obelisks have a short duration, so make sure they are all activated at the same time."), 0, {{"object", 185193},{"object", 185195},{"object", 185196},{"object", 185197},{"object", 185198}}}},
        },
        [10822] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
            [questKeys.zoneOrSort] = zoneIDs.SHADOWMOON_VALLEY,
        },
        [10823] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10824] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10826] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10827] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10828] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [10830] = {
            [questKeys.requiredSourceItems] = {31517,31495,31518},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Use Exorcism Feathers to summon Koi-Koi Spirits"), 0, {{"monster", 21326}}}},
        },
        [10831] = {
            [questKeys.requiredSkill] = {197,350},
        },
        [10832] = {
            [questKeys.requiredSkill] = {197,350},
        },
        [10833] = {
            [questKeys.requiredSkill] = {197,350},
        },
        [10838] = {
            [questKeys.extraObjectives] = {{{[3483]={{44,51}}}, Questie.ICON_TYPE_EVENT, l10n("Use the Demoniac Scryer")}},
        },
        [10839] = {
            [questKeys.objectives] = {nil,{{185191}}},
        },
        [10840] = {
            [questKeys.preQuestSingle] = {10915,10852},
        },
        [10842] = {
            [questKeys.preQuestSingle] = {10915,10852},
        },
        [10852] = {
            [questKeys.objectives] = {{{22314,nil,Questie.ICON_TYPE_EVENT}}},
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_INTERACT,l10n("Open the cage"),0,{{"object",185202}}}},
        },
        [10854] = {
            [questKeys.objectives] = {{{21722,"Enslaved Netherwing Drake freed"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Use Enchanted Nethervine Crystal on Enslaved Netherwing Drake"), 0, {{"monster", 21722}}}},
        },
        [10855] = { -- Fel Reavers, No Thanks!
            [questKeys.objectives] = {{{22293,"Inactive Fel Reaver Destroyed",Questie.ICON_TYPE_EVENT}}},
        },
        [10857] = {
            [questKeys.objectives] = {{{22348,"Western Teleporter Destroyed",Questie.ICON_TYPE_EVENT},{22350,"Central Teleporter Destroyed",Questie.ICON_TYPE_EVENT},{22351,"Eastern Teleporter Destroyed",Questie.ICON_TYPE_EVENT}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Use the Mental Interference Rod on the Mo'arg and use their Detonate Teleporter ability"), 0, {{"monster", 16943}}}},
        },
        [10859] = {
            [questKeys.objectives] = {{{20635,"Razaani Light Orbs trapped",Questie.ICON_TYPE_EVENT}}},
        },
        [10861] = {
            [questKeys.objectives] = {nil,{{185210,"Hatchlings Redeemed"}},nil,nil,{{{22337},22337}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Collect Cursed Eggs to spawn a Hatchling"), 0, {{"object", 185210}}}},
        },
        [10862] = {
            [questKeys.exclusiveTo] = {10908},
        },
        [10863] = {
            [questKeys.exclusiveTo] = {10908},
        },
        [10866] = {
            [questKeys.objectives] = {nil,{{185156,"Karynaku freed"}},nil,nil,{{{11980},11980}}},
        },
        [10867] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Razaani ethereals to lure Nexus-Prince Razaan out"), 0, {{"monster", 20601}, {"monster", 20609}, {"monster", 20614}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Kill Nexus-Prince Razaan to spawn the Collection of Souls"), 0, {{"monster", 21057}}},
            },
        },
        [10872] = {
            [questKeys.finishedBy] = {{22112},nil},
        },
        [10873] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{22459,22355},22459,"Sha'tar Warrior Freed"}}},
        },
        [10876] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Force Commander Gorax and place the Challenge From the Horde upon his corpse"), 0, {{"monster", 19264}}}},
        },
        [10879] = {
            [questKeys.triggerEnd] = {"Attack thwarted", {[zoneIDs.SHATTRATH_CITY]={{51.62,20.69}}}},
        },
        [10886] = {
            [questKeys.triggerEnd] = {"Millhouse Manastorm Rescued", {[zoneIDs.THE_ARCATRAZ]={{-1,-1}}}},
        },
        [10887] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.TEROKKAR_FOREST]={{33.77,51.61}}}, Questie.ICON_TYPE_EVENT, l10n("Help Akuno find his way to the Refugee Caravan in Terokkar Forest.")}},
        },
        [10891] = {
            [questKeys.requiredSpell] = -16663,
            [questKeys.exclusiveTo] = {7652},
        },
        [10892] = {
            [questKeys.requiredSpell] = -16663,
            [questKeys.exclusiveTo] = {7652},
        },
        [10896] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Rotting Forest-Ragers and Infested Root-Walkers to spawn Wood Mites"), 0, {{"monster", 22307}, {"monster", 22095}}}},
        },
        [10897] = {
            [questKeys.preQuestSingle] = {},
        },
        [10898] = {
            [questKeys.triggerEnd] = {"Escort Skywing", {[zoneIDs.TEROKKAR_FOREST]={{55.66,69.49}}}},
        },
        [10899] = {
            [questKeys.preQuestSingle] = {},
        },
        [10902] = {
            [questKeys.preQuestSingle] = {},
        },
        [10905] = {
            [questKeys.exclusiveTo] = {10899,10902,10906,10907},
        },
        [10906] = {
            [questKeys.exclusiveTo] = {10897,10899,10905,10907},
        },
        [10907] = {
            [questKeys.exclusiveTo] = {10897,10902,10905,10906},
        },
        [10908] = {
            [questKeys.exclusiveTo] = {10862,10863},
        },
        [10909] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.HELLFIRE_PENINSULA]={{45,74.4}}}, Questie.ICON_TYPE_EVENT, l10n("Place the Achorite Relic")},
                                           {nil, Questie.ICON_TYPE_OBJECT, l10n("Slay Shattered Hand Berserkers near it"), 0, {{"object", 185298}}},
            },
        },
        [10911] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use the Naturalized Ammunition to take control of the Death's Door Fel Cannon"), 0, {{"object", 185306}}}},
        },
        [10913] = {
            [questKeys.objectives] = {{{21859,"Slain Sha'tar Vindicator corpse burned",Questie.ICON_TYPE_EVENT},{21846,"Slain Auchenai Warrior corpse burned",Questie.ICON_TYPE_EVENT}}},
        },
        [10915] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the coffin and kill its contents"), 0, {{"object", 184999}}}},
        },
        [10917] = {
            [questKeys.requiredMaxRep] = {},
        },
        [10922] = {
            [questKeys.triggerEnd] = {"Protect the Explorers", {[zoneIDs.TEROKKAR_FOREST]={{30.12,70.9}}}},
        },
        [10923] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Dread Relic with 20 Doom Skulls near the Writhing Mound Summoning Circle to call Teribus the Cursed"), 0, {{"object", 185311}}}},
        },
        [10929] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.TEROKKAR_FOREST]={{31.9,76.3}}}, Questie.ICON_TYPE_EVENT, l10n("Use the Fumper to lure Mature Bone Sifter"), 0}},
        },
        [10930] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Decrepit Clefthoofs and use the Fumper on their corpses"), 0, {{"monster", 22105}}}},
        },
        [10935] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Perform the exorcism"), 0, {{"monster", 22431}}}},
        },
        [10942] = {
            [questKeys.questLevel] = -1,
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.finishedBy] = {{22817}}, -- removed Draenei Orphan as turn in NPC
        },
        [10943] = {
            [questKeys.questLevel] = -1,
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
        },
        [10945] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Salandria taken to Sporeggar", {[zoneIDs.ZANGARMARSH]={{19.22,51.23}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.preQuestSingle] = {10942},
        },
        [10946] = {
            [questKeys.objectives] = {{{19514,"Ruse of the Ashtongue"}}},
        },
        [10950] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Dornaa taken to the Ring of Observance", {[zoneIDs.TEROKKAR_FOREST]={{39.71,64.6}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestSingle] = {10943},
        },
        [10951] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Salandria taken to the Dark Portal", {[zoneIDs.HELLFIRE_PENINSULA]={{88.33,50.19}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.preQuestSingle] = {10942},
        },
        [10952] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Dornaa taken to the Dark Portal", {[zoneIDs.HELLFIRE_PENINSULA]={{88.26,50.32}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestSingle] = {10943},
        },
        [10953] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Salandria taken to the Throne of the Elements", {[zoneIDs.NAGRAND]={{60.5,22.7}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.preQuestSingle] = {10942},
        },
        [10954] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Dornaa taken to Aeris Landing", {[zoneIDs.NAGRAND]={{31.47,57.45}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestSingle] = {10943},
        },
        [10956] = {
            [questKeys.questLevel] = -1,
            [questKeys.preQuestGroup] = {10950,10952,10954},
            [questKeys.triggerEnd] = {"Dornaa taken to the Seat of the Naaru", {[zoneIDs.THE_EXODAR]={{56.65,40.73}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [10960] = {
            [questKeys.questLevel] = -1,
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [10962] = {
            [questKeys.questLevel] = -1,
            [questKeys.preQuestGroup] = {10950,10952,10954},
            [questKeys.triggerEnd] = {"Dornaa taken to the Caverns of Time", {[zoneIDs.TANARIS]={{60.52,57.74}}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [10963] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Salandria taken to the Caverns of Time", {[zoneIDs.TANARIS]={{60.53,57.72}}}},
            [questKeys.preQuestGroup] = {10945,10951,10953},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [10966] = {
            [questKeys.questLevel] = -1,
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestGroup] = {10962,10968},
            [questKeys.preQuestSingle] = {},
        },
        [10967] = {
            [questKeys.questLevel] = -1,
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.preQuestGroup] = {10963,11975},
        },
        [10968] = {
            [questKeys.questLevel] = -1,
            [questKeys.objectives] = {{{17204,"Dornaa taken to Farseer Nobundo",Questie.ICON_TYPE_EVENT}}},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestGroup] = {},
            [questKeys.preQuestSingle] = {10956},
        },
        [10971] = {
            [questKeys.requiredSourceItems] = {29460},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the prison"), 0, {{"object", 184998}}}},
        },
        [10974] = {
            [questKeys.requiredMinRep] = {933,21000},
        },
        [10975] = {
            [questKeys.requiredMinRep] = {933,21000},
        },
        [10976] = {
            [questKeys.requiredMinRep] = {933,21000},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Open the prison"), 0, {{"object", 185001}}}},
        },
        [10977] = {
            [questKeys.objectives] = {nil,{{185519,"Mana-Tombs Stasis Chamber Investigated"}}},
            [questKeys.requiredMinRep] = {933,21000},
        },
        [10981] = {
            [questKeys.requiredMaxRep] = {},
            [questKeys.exclusiveTo] = {10982},
        },
        [10984] = {
            [questKeys.exclusiveTo] = {10983,10989,11057},
        },
        [10985] = {
            [questKeys.triggerEnd] = {"Help Akama and Maiev enter the Black Temple.", {[zoneIDs.SHADOWMOON_VALLEY]={{71.05,46.11},{66.29,44.06}}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Let Xi'ri know you're ready to battle"), 1, {{"monster", 18528}}}},
        },
        [10987] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_LOOT, l10n("Use the Sparrowhawk Net to capture a Wild Sparrowhawk"), 0, {{"monster", 22979}}}},
        },
        [10990] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat the Guardian of the Eagle and obtain the Essence of the Eagle"), 0, {{"object", 185547}}}},
        },
        [10991] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat the Guardian of the Falcon and obtain the Essence of the Falcon"), 0, {{"object", 185553}}}},
        },
        [10992] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat the Guardian of the Hawk and obtain the Essence of the Hawk"), 0, {{"object", 185551}}}},
        },
        [10995] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat him so he spawns Grulloc's Dragon Skull"), 0, {{"monster", 20216}}}},
        },
        [10996] = {
            [questKeys.preQuestSingle] = {10983,10989,11057},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat him so he spawns Maggoc's Treasure Chest"), 0, {{"monster", 20600}}}},
        },
        [10997] = {
            [questKeys.preQuestSingle] = {10983,10989,11057},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Defeat him so he spawns Slaag's Standard"), 0, {{"monster", 22199}}}},
        },
        [10998] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Step into fire rings to summon Vim'gol"), 0, {{"monster", 22911}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Defeat him so he spawns Vim'gol's Vile Grimoire"), 0, {{"monster", 22911}}},
            },
        },
        [11000] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use Vim'gol's Grimoire at Soulgrinder's Altar"), 0, {{"object", 185880}}},
                                           {nil, Questie.ICON_TYPE_SLAY, l10n("Defeat him so he spawns Skulloc's Soul"), 0, {{"monster", 22910}}},
            },
        },
        [11002] = {
            [questKeys.startedBy] = {nil,nil,{32385}},
        },
        [11003] = {
            [questKeys.startedBy] = {nil,nil,{32386}},
        },
        [11007] = {
            [questKeys.startedBy] = {nil,nil,{32405}},
        },
        [11010] = {
            [questKeys.requiredClasses] = classIDs.WARLOCK + classIDs.ROGUE + classIDs.MAGE + classIDs.PRIEST + classIDs.WARRIOR + classIDs.PALADIN + classIDs.HUNTER + classIDs.SHAMAN,
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Skyguard Bombs to destroy 15 Fel Cannonball Stacks"), 0, {{"object", 185861}}}},
        },
        [11013] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11014] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11015] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11016] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11017] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11018] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11019] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {11013},
        },
        [11020] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredSourceItems] = {},
            [questKeys.extraObjectives] = {
                {nil, Questie.ICON_TYPE_SLAY, l10n("Kill any wildlife in Shadowmoon Valley to collect Fel Gland"), 0, {{"monster", 21408},{"monster", 21901},{"monster", 21462},{"monster", 21878},{"monster", 21879}}},
                {nil, Questie.ICON_TYPE_EVENT, l10n("Use Yarzill's Mutton together with the Fel Gland to poison Dragonmaw Peons"), 0, {{"monster", 22252}}},
            },
        },
        [11021] = {
            [questKeys.preQuestSingle] = {11004},
            [questKeys.startedBy] = {nil,nil,{32523}},
        },
        [11023] = {
            [questKeys.requiredLevel] = 70,
            [questKeys.preQuestSingle] = {11010,11102},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Skyguard Bombs to destroy 15 Fel Cannonball Stacks"), 0, {{"object", 185861}}}},
        },
        [11025] = {
            [questKeys.preQuestSingle] = {11000},
        },
        [11026] = {
            [questKeys.preQuestSingle] = {11009},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Banishing Crystal and slay demons near the summoned portal"), 0, {{"monster", 20557},{"monster", 22195},{"monster", 22291},{"monster", 19973},{"monster", 22204},{"monster", 22304},{"monster", 23174}}}},
            [questKeys.objectives] = {nil,nil,nil,nil,{{{20557,22195,22291,19973,22204,22304,23174},20557}}},
        },
        [11031] = {
            [questKeys.preQuestSingle] = {10725},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [11032] = {
            [questKeys.preQuestSingle] = {10728},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [11033] = {
            [questKeys.preQuestSingle] = {10727},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [11034] = {
            [questKeys.preQuestSingle] = {10726},
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [11035] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11036] = {
            [questKeys.exclusiveTo] = {10183,11037,11038,11039,11040,11042},
        },
        [11037] = {
            [questKeys.exclusiveTo] = {10183,11036,11038,11039,11040,11042},
            [questKeys.requiredMinRep] = {941,0},
        },
        [11038] = {
            [questKeys.startedBy] = {{23270,23271},nil,nil},
            [questKeys.exclusiveTo] = {10183,11036,11037,11039,11040,11042},
            [questKeys.preQuestSingle] = {10551,10552},
        },
        [11039] = {
            [questKeys.preQuestSingle] = {10551,10552},
            [questKeys.exclusiveTo] = {10183,11036,11037,11038,11040,11042},
            [questKeys.requiredMinRep] = {934,3000},
        },
        [11040] = {
            [questKeys.requiredLevel] = 67,
            [questKeys.exclusiveTo] = {10183,11036,11037,11038,11039,11042},
        },
        [11041] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.startedBy] = {nil,nil,{32621}},
        },
        [11042] = {
            [questKeys.requiredLevel] = 67,
            [questKeys.exclusiveTo] = {10183,11036,11037,11038,11039,11040},
            [questKeys.requiredMinRep] = {978,0},
        },
        [11043] = {
            [questKeys.requiredLevel] = 67,
            [questKeys.exclusiveTo] = {11044,11045},
        },
        [11044] = {
            [questKeys.requiredLevel] = 67,
            [questKeys.exclusiveTo] = {11043,11045},
            [questKeys.requiredMinRep] = {978,0},
        },
        [11045] = {
            [questKeys.exclusiveTo] = {11043,11044,10642},
        },
        [11046] = {
            [questKeys.exclusiveTo] = {11047,11048},
        },
        [11047] = {
            [questKeys.exclusiveTo] = {11046,11048},
        },
        [11048] = {
            [questKeys.exclusiveTo] = {11046,11047},
        },
        [11049] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11050] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11051] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Banishing Crystal and slay demons near the summoned portal"), 0, {{"monster", 20557},{"monster", 22195},{"monster", 22291},{"monster", 19973},{"monster", 22204},{"monster", 22304},{"monster", 23174}}}},
            [questKeys.objectives] = {nil,nil,nil,nil,{{{20557,22195,22291,19973,22204,22304,23174},20557}}},
        },
        [11052] = {
            [questKeys.exclusiveTo] = {10708},
            [questKeys.finishedBy] = {{18481},nil},
        },
        [11057] = {
            [questKeys.requiredLevel] = 70,
        },
        [11058] = {
            [questKeys.objectives] = {nil,{{185890,"Apexis Vibrations attained"}}},
        },
        [11059] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to activate Apexis Monument. Apexis Guardian will spawn after six rounds"), 0, {{"object", 185944}}}},
        },
        [11060] = {
            [questKeys.specialFlags] = 1,
        },
        [11063] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11064] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{23340,"Murg \"Oldie\" Muckjaw Defeated"}}},
        },
        [11065] = {
            [questKeys.requiredLevel] = 70,
            [questKeys.preQuestSingle] = {11010, 11102},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Use Wrangling Rope on weakened Aether Rays"), 0, {{"monster", 22181}}}},
            [questKeys.objectives] = {{{22181,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [11066] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_INTERACT, l10n("Use Wrangling Rope on weakened Aether Rays"), 0, {{"monster", 22181}}}},
            [questKeys.objectives] = {{{22181,nil,Questie.ICON_TYPE_EVENT}}},
        },
        [11067] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{23342,"Trope the Filth-Belcher Defeated"}}},
        },
        [11068] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{23344,"Corlok the Vet Defeated"}}},
        },
        [11069] = {
            [questKeys.startedBy] = {{23345},nil,nil},
            [questKeys.objectives] = {{{23345,"Wing Commander Ichman Defeated"}}},
        },
        [11070] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{23346,"Wing Commander Mulverick Defeated"}}},
        },
        [11071] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{23348,"Captain Skyshatter Defeated"}}},
        },
        [11073] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use a Time-Lost offering to summon Terokk"), 0, {{"object", 185928}}}},
        },
        [11077] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11078] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to open Furywing's Egg"), 0, {{"object", 185937}}},
                                           {nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to open Insidion's Egg"), 0, {{"object", 185938}}},
                                           {nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to open Rivendark's Egg"), 0, {{"object", 185936}}},
                                           {nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to open Obsidia's Egg"), 0, {{"object", 185932}}},
            },
        },
        [11079] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Use 35 Apexis Shards to activate Fel Crystal Prism"), 0, {{"object", 185927}}}},
        },
        [11080] = {
            [questKeys.objectives] = {nil,{{185890,"Apexis Emanations attained"}}},
        },
        [11081] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11082] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.triggerEnd] = {"Murkblood Information Gathered", {[zoneIDs.SHADOWMOON_VALLEY]={{73.06,82.26},{68.63,79.81}}}},
        },
        [11083] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11085] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.triggerEnd] = {"Rescue the Skyguard Prisoner.", {[zoneIDs.TEROKKAR_FOREST]={{69.77,75.98},{62.41,73.85},{73.94,88.3}}}},
        },
        [11086] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
        },
        [11089] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak with Sar'this for his help hunting a Flawless Arcane Elemental"), 4, {{"monster", 23093}}}},
        },
        [11090] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {{{22357,"Subdue Reth'hedron the Subduer"}}},
        },
        [11093] = {
            [questKeys.objectives] = {{{23219,"Nether Ray Meal"}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Nether Ray Cage and slay Blackwind Warp Chasers near the Hungry Nether Ray"), 0, {{"monster", 23219}}}},
        },
        [11094] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11092},
            [questKeys.requiredMaxRep]= {932,0},
        },
        [11095] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11094},
            [questKeys.requiredMaxRep]= {932,0},
        },
        [11097] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11095},
            [questKeys.requiredMaxRep]= {932,0},
            [questKeys.triggerEnd] = {"Dragonmaw Forces Defeated", {[zoneIDs.SHADOWMOON_VALLEY]={{56.87,58.18},{64.27,31.01}}}},
        },
        [11099] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11092},
            [questKeys.requiredMaxRep]= {934,0},
        },
        [11100] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11099},
            [questKeys.requiredMaxRep]= {934,0},
        },
        [11101] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
            [questKeys.preQuestGroup] = {10211,11100},
            [questKeys.requiredMaxRep]= {934,0},
            [questKeys.triggerEnd] = {"Dragonmaw Forces Defeated", {[zoneIDs.SHADOWMOON_VALLEY]={{56.87,58.18},{64.27,31.01}}}},
        },
        [11102] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use the Skyguard Bombs to destroy 15 Fel Cannonball Stacks"), 0, {{"object", 185861}}}},
        },
        [11103] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.finishedBy] = {{19935,19936}},
            [questKeys.preQuestSingle] = {10472},
            [questKeys.exclusiveTo] = {10460,10461,10462},
        },
        [11104] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.finishedBy] = {{19935,19936}},
            [questKeys.preQuestSingle] = {10473},
            [questKeys.exclusiveTo] = {10460,10462,10463},
        },
        [11105] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.finishedBy] = {{19935,19936}},
            [questKeys.preQuestSingle] = {10474},
            [questKeys.exclusiveTo] = {10460,10461,10463},
        },
        [11106] = {
            [questKeys.startedBy] = {{19935,19936}},
            [questKeys.finishedBy] = {{19935,19936}},
            [questKeys.preQuestSingle] = {10475},
            [questKeys.exclusiveTo] = {10461,10462,10463},
        },
        [11108] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.triggerEnd] = {"Meeting with Illidan Stormrage", {[zoneIDs.SHADOWMOON_VALLEY]={{65.93,86.15}}}},
        },
        [11119] = {
            [questKeys.preQuestSingle] = {11102,11010},
            [questKeys.requiredLevel] = 70,
        },
        [11123] = {
            [questKeys.preQuestSingle] = {},
        },
        [11131] = {
            [questKeys.triggerEnd] = {"Put Out the Fires", {[zoneIDs.DUN_MOROGH]={{44.8,52.1},{47.5,51.6}},[zoneIDs.ELWYNN_FOREST]={{41.3,65.2},{43.6,65.8}},[zoneIDs.AZUREMYST_ISLE]={{49.8,52.3},{48.8,50}}}},
            [questKeys.requiredSourceItems] = {32971},
            [questKeys.exclusiveTo] = {12133},
        },
        [11140] = {
            [questKeys.requiredSourceItems] = {33040},
        },
        [11142] = {
            [questKeys.objectives] = {{{23704,nil,Questie.ICON_TYPE_TALK}}},
        },
        [11145] = {
            [questKeys.requiredSourceItems] = {33061},
            [questKeys.objectives] = {{{23720,nil,Questie.ICON_TYPE_INTERACT}}},
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_INTERACT,l10n("Open the cage"),0,{{"object",410020}}}},
        },
        [11146] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{4351,4352},4351,"Raptors Captured"}}},
        },
        [11152] = {
            [questKeys.objectives] = {nil,{{186322,nil,Questie.ICON_TYPE_EVENT}}},
            [questKeys.extraObjectives] = {{nil,Questie.ICON_TYPE_INTERACT,l10n("Use the cannon"),0,{{"object",186432}}}},
        },
        [11159] = {
            [questKeys.preQuestSingle] = {11161},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Redeem Remains"), 0, {{"object", 186332}}}},
        },
        [11162] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Plant the Stonemaul Banner"), 0, {{"object", 186336}}}},
        },
        [11164] = {
            [questKeys.preQuestSingle] = {11132},
        },
        [11169] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{4344,4345},4344,"Totem Tests Performed"}}},
        },
        [11172] = {
            [questKeys.nextQuestInChain] = 11174,
        },
        [11174] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.objectives] = {nil,nil,nil,nil,{{{4392,4393,4394},4392,"Oozes Dissolved"}}},
        },
        [11177] = {
            [questKeys.nextQuestInChain] = 1218,
        },
        [11180] = {
            [questKeys.objectives] = {nil,nil,nil,nil,{{{23554,23555,23861},23861,"Information Gathered"}}},
        },
        [11183] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.DUSTWALLOW_MARSH]={{55.2,26.6}}}, Questie.ICON_TYPE_EVENT, l10n("Plant the torch at the end of the dock")}},
        },
        [11185] = {
            [questKeys.startedBy] = {{23881},nil,nil},
        },
        [11186] = {
            [questKeys.startedBy] = {{23881},nil,nil},
        },
        [11198] = {
            [questKeys.objectives] = {{{23899,"Defend Theramore Docks from Tethyr"}}},
        },
        [11208] = {
            [questKeys.exclusiveTo] = {11158},
        },
        [11209] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.DUSTWALLOW_MARSH]={{56.38,62.42}}}, Questie.ICON_TYPE_EVENT, l10n("Smear the Fish Paste on yourself and swim to the ship wreck")}},
        },
        [11211] = {
            [questKeys.exclusiveTo] = {11158,11214,11215},
        },
        [11214] = {
            [questKeys.exclusiveTo] = {11158,11211,11215},
        },
        [11215] = {
            [questKeys.exclusiveTo] = {11158,11214,11211},
        },
        [11216] = {
            [questKeys.nextQuestInChain] = 9824,
            [questKeys.zoneOrSort] = zoneIDs.KARAZHAN,
        },
        [11219] = {
            [questKeys.triggerEnd] = {"Put Out the Fires", {[zoneIDs.DUROTAR]={{52.12,43.59},{53.21,42.56},{51.58,42.08}},[zoneIDs.TIRISFAL_GLADES]={{60.32,53.29},{61.11,51.25},{61.64,51.97}},[zoneIDs.EVERSONG_WOODS]={{47.76,47.3},{48.21,46.16}}}},
            [questKeys.requiredSourceItems] = {32971},
            [questKeys.exclusiveTo] = {12155},
        },
        [11242] = {
            [questKeys.startedBy] = {{23904},nil,nil},
            [questKeys.finishedBy] = {{24519},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.preQuestSingle] = {11135},
        },
        [11335] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{67.38,33.8}},
                [zoneIDs.STORMWIND_CITY]={{82.45,12.92}},
                [zoneIDs.IRONFORGE]={{70.12,89.41}},
            }},
        },
        [11336] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{67.49,34.31}},
                [zoneIDs.STORMWIND_CITY]={{82.12,12.83}},
                [zoneIDs.IRONFORGE]={{70.09,90.26}},
            }},
        },
        [11337] = {
            [questKeys.triggerEnd] = {"Victory in the Eye of the Storm", {
                [zoneIDs.SHATTRATH_CITY]={{67.4,34.08}},
                [zoneIDs.STORMWIND_CITY]={{82.51,13.69}},
                [zoneIDs.IRONFORGE]={{70.04,89.98}},
            }},
        },
        [11338] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{67.4,34.64}},
                [zoneIDs.STORMWIND_CITY]={{82.5,13.26}},
                [zoneIDs.IRONFORGE]={{70.5,89.56}},
            }},
        },
        [11339] = {
            [questKeys.triggerEnd] = {"Victory in Arathi Basin", {
                [zoneIDs.SHATTRATH_CITY]={{66.58,56.23}},
                [zoneIDs.ORGRIMMAR]={{79.39,30.08}},
            }},
        },
        [11340] = {
            [questKeys.triggerEnd] = {"Victory in Alterac Valley", {
                [zoneIDs.SHATTRATH_CITY]={{66.85,57.04}},
                [zoneIDs.ORGRIMMAR]={{79.09,31.1}},
            }},
        },
        [11341] = {
            [questKeys.triggerEnd] = {"Victory in Eye of the Storm", {
                [zoneIDs.SHATTRATH_CITY]={{67.02,56.14}},
                [zoneIDs.ORGRIMMAR]={{79.21,30.08}},
            }},
        },
        [11342] = {
            [questKeys.triggerEnd] = {"Victory in Warsong Gulch", {
                [zoneIDs.SHATTRATH_CITY]={{66.62,57.45}},
                [zoneIDs.ORGRIMMAR]={{79.03,30.65}},
            }},
        },
        [11356] = {
            [questKeys.exclusiveTo] = {11360,11439,11440},
        },
        [11357] = {
            [questKeys.exclusiveTo] = {11361,11449,11450},
        },
        [11360] = {
            [questKeys.exclusiveTo] = {11439,11440},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11361] = {
            [questKeys.exclusiveTo] = {11449,11450},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11379] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Cook Demon Broiled Surprise in the remains of a Abyssal Flamebringer in Blade's Edge Mountains"), 0, {{"monster", 19973}}}},
        },
        [11381] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Cook Spiritual Soup at the Ancestral Grounds in Nagrand"), 0, {{"object", 184317}}}},
        },
        [11383] = {
            [questKeys.objectives] = {{{17839}},nil,nil,nil,nil},
        },
        [11403] = {
            [questKeys.startedBy] = {{23904},nil,nil},
            [questKeys.finishedBy] = {{23973},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.preQuestSingle] = {11220},
        },
        [11439] = {
            [questKeys.startedBy] = {},
            [questKeys.exclusiveTo] = {11360,11440},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11440] = {
            [questKeys.startedBy] = {},
            [questKeys.exclusiveTo] = {11360,11439},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11441] = {
            [questKeys.startedBy] = {{18927,19148,19171,19172,19173,20102},nil,nil},
            [questKeys.exclusiveTo] = {11442},
        },
        [11442] = {
            [questKeys.exclusiveTo] = {11441},
            [questKeys.objectivesText] = {},
            [questKeys.startedBy] = {{24710}},
            [questKeys.finishedBy] = {{24710}},
        },
        [11446] = {
            [questKeys.startedBy] = {{19169,19175,19176,19177,19178,20102},nil,nil},
            [questKeys.exclusiveTo] = {11447},
        },
        [11447] = {
            [questKeys.exclusiveTo] = {11446},
            [questKeys.objectivesText] = {},
            [questKeys.startedBy] = {{24711}},
            [questKeys.finishedBy] = {{24711}},
        },
        [11449] = {
            [questKeys.startedBy] = {},
            [questKeys.exclusiveTo] = {11361,11450},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11450] = {
            [questKeys.startedBy] = {},
            [questKeys.exclusiveTo] = {11361,11449},
            [questKeys.requiredSourceItems] = {32971},
        },
        [11481] = {
            [questKeys.requiredMinRep] = {932,0},
            [questKeys.exclusiveTo] = {11482},
        },
        [11482] = {
            [questKeys.requiredMinRep] = {934,0},
            [questKeys.exclusiveTo] = {11481},
        },
        [11490] = {
            [questKeys.objectives] = {nil,{{187578, "Scrying Orb Activated"}}},
        },
        [11496] = {
            [questKeys.objectives] = {nil,{{187078, "Energize a Crystal Ward"}}},
        },
        [11502] = {
            [questKeys.requiredMinRep] = {978,0},
            [questKeys.extraObjectives] = {{{[zoneIDs.NAGRAND]={{42.3,45.5}}}, Questie.ICON_TYPE_EVENT, l10n("Defeat enemy players")}},
        },
        [11503] = {
            [questKeys.requiredMinRep] = {941,0},
            [questKeys.extraObjectives] = {{{[zoneIDs.NAGRAND]={{42.3,45.5}}}, Questie.ICON_TYPE_EVENT, l10n("Defeat enemy players")}},
        },
        [11505] = {
            [questKeys.triggerEnd] = {"Secure a Spirit Tower", {[zoneIDs.TEROKKAR_FOREST]={{42.49,54},{32.47,57.86},{48.98,60.29},{47.2,72.29},{40.48,77.99}}}},
        },
        [11506] = {
            [questKeys.triggerEnd] = {"Secure a Spirit Tower", {[zoneIDs.TEROKKAR_FOREST]={{42.49,54},{32.47,57.86},{48.98,60.29},{47.2,72.29},{40.48,77.99}}}},
        },
        [11513] = {
            [questKeys.preQuestSingle] = {},
        },
        [11514] = {
            [questKeys.preQuestSingle] = {},
        },
        [11515] = {
            [questKeys.objectives] = {{{24918}}},
            [questKeys.requiredSourceItems] = {34259},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Use Fel Siphon and then kill the weakened Felblood Initiate"), 0, {{"monster", 24918}}}},
        },
        [11516] = {
            [questKeys.triggerEnd] = {"Legion Gateway Destroyed", {[zoneIDs.HELLFIRE_PENINSULA]={{58.51,18.5}}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_SLAY, l10n("Kill Incandescent Fel Sparks after summoning your Living Flare"), 0, {{"monster", 22323}}}},
        },
        [11517] = {
            [questKeys.exclusiveTo] = {11513,11514},
        },
        [11520] = {
            [questKeys.extraObjectives] = {
                {nil, Questie.ICON_TYPE_EVENT, l10n("Use Razorthorn Flayer Gland on Razorthorn Ravager to tame it"), 0, {{"monster", 24922}}},
                {nil, Questie.ICON_TYPE_OBJECT, l10n("Use Expose Razorthorn Root of your tamed Razorthorn Ravager to expose Razorthorn Root"), 0, {{"object", 187073}}},
            },
        },
        [11521] = {
            [questKeys.extraObjectives] = {
                {nil, Questie.ICON_TYPE_EVENT, l10n("Use Razorthorn Flayer Gland on Razorthorn Ravager to tame it"), 0, {{"monster", 24922}}},
                {nil, Questie.ICON_TYPE_OBJECT, l10n("Use Expose Razorthorn Root of your tamed Razorthorn Ravager to expose Razorthorn Root"), 0, {{"object", 187073}}},
            },
        },
        [11523] = {
            [questKeys.objectives] = {nil,{{187078, "Energize a Crystal Ward"}}},
        },
        [11524] = {
            [questKeys.objectives] = {{{24972, "Converted Sentry Deployed"}}},
        },
        [11525] = {
            [questKeys.objectives] = {{{24972, "Converted Sentry Deployed"}}},
        },
        [11526] = {
            [questKeys.preQuestSingle] = {},
        },
        [11532] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak to Ayren Cloudbreaker"), 0, {{"monster", 25059}}}},
        },
        [11533] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak to Ayren Cloudbreaker"), 0, {{"monster", 25059}}}},
        },
        [11534] = {
            [questKeys.exclusiveTo] = {11513,11514},
        },
        [11537] = {
            [questKeys.objectives] = {{{25003,"Emissary of Hate Impaled"}},nil,nil,nil,{{{24999,25001,25002,25008,25068},25068}}},
        },
        [11538] = {
            [questKeys.objectives] = {{{25003,"Emissary of Hate Impaled"}},nil,nil,nil,{{{24999,25001,25002,25008,25068},25068}}},
        },
        [11541] = {
            [questKeys.objectives] = {{{25084,"Greengill Slave freed"}}},
            [questKeys.requiredSourceItems] = {34483},
        },
        [11542] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak to Ayren Cloudbreaker"), 0, {{"monster", 25059}}},
                                           {nil, Questie.ICON_TYPE_TALK, l10n("Take a ride back to the isle"), 0, {{"monster", 25236}}},
            },
        },
        [11543] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_TALK, l10n("Speak to Ayren Cloudbreaker"), 0, {{"monster", 25059}}},
                                           {nil, Questie.ICON_TYPE_TALK, l10n("Take a ride back to the isle"), 0, {{"monster", 25236}}},
            },
        },
        [11544] = {
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Break down Ata'mal Metal on the anvil to cleanse it"), 0, {{"object", 187111}}}},
        },
        [11545] = {
            [questKeys.requiredMaxRep] = {1077,42000},
        },
        [11580] = {
            [questKeys.startedBy] = {nil,{187559},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
        },
        [11581] = {
            [questKeys.startedBy] = {nil,{187564},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [11583] = {
            [questKeys.startedBy] = {{25910},nil,nil},
        },
        [11584] = {
            [questKeys.startedBy] = {{25939},nil,nil},
        },
        [11657] = {
            [questKeys.startedBy] = {{25975},nil,nil},
            [questKeys.finishedBy] = {{25975},nil},
            [questKeys.preQuestSingle] = {11731},
            [questKeys.triggerEnd] = {"Catch 4 torches in a row.", {
                [zoneIDs.ORGRIMMAR]={{47.02,36.83}},
                [zoneIDs.THUNDER_BLUFF]={{21.95,26.74}},
                [zoneIDs.STORMWIND_CITY]={{37.65,59.98}},
                [zoneIDs.IRONFORGE]={{62.15,27.58}},
                [zoneIDs.UNDERCITY]={{64.58,8.08}},
            }},
        },
        [11665] = { -- Crocolisks in the City
            [questKeys.extraObjectives] = {
                {{[zoneIDs.ORGRIMMAR]={{70.4,28.3},{67.8,33.7},{64.8,26},{35.2,78.6},{37.6,81.7},{33.3,84.4},{36.3,86}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish for Baby Crocolisk")},
                {{[zoneIDs.STORMWIND_CITY]={{48.5,67.9},{45.7,60.5},{45.4,53.3},{35.7,45.6},{34.3,59},{51.8,47.1},{60.2,46.6},{65.2,53.7},{61.1,37},{65.6,32},{55.9,33.5},{50.9,23.8}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish for Baby Crocolisk")},
            },
        },
        [11666] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.TEROKKAR_FOREST]={{51.9,34.7},{55.3,44.1},{60.2,53.9}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish here for Blackfin Darter")}},
        },
        [11667] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.NAGRAND]={{62,35}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish here for World's Largest Mudfish")}},
        },
        [11668] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.ZANGARMARSH]={{75.6,82.9}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish here for Bloated Barbed Gill Trout")}},
        },
        [11669] = {
            [questKeys.extraObjectives] = {{{[zoneIDs.HELLFIRE_PENINSULA]={{39.4,43}},[zoneIDs.SHADOWMOON_VALLEY]={{24,32.5},{31.9,29.9},{40.1,60.1}}}, Questie.ICON_TYPE_NODE_FISH, l10n("Fish here for Monstrous Felblood Snapper")}},
        },
        [11731] = {
            [questKeys.startedBy] = {{25975},nil,nil},
            [questKeys.finishedBy] = {{25975},nil},
            [questKeys.triggerEnd] = {"Hit 8 braziers.", {
                [zoneIDs.TELDRASSIL]={{56.59,92.06}},
                [zoneIDs.ORGRIMMAR]={{46.65,38.17}},
                [zoneIDs.STORMWIND_CITY]={{39.21,61.71}},
                [zoneIDs.IRONFORGE]={{65,23.73}},
                [zoneIDs.UNDERCITY]={{68.58,7.88}},
            }},
        },
        [11732] = {
            [questKeys.startedBy] = {nil,{187914},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11734] = {
            [questKeys.startedBy] = {nil,{187916},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11735] = {
            [questKeys.startedBy] = {nil,{187917},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11736] = {
            [questKeys.startedBy] = {nil,{187919},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11737] = {
            [questKeys.startedBy] = {nil,{187920},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11738] = {
            [questKeys.startedBy] = {nil,{187921},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11739] = {
            [questKeys.startedBy] = {nil,{187922},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11740] = {
            [questKeys.startedBy] = {nil,{187923},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11741] = {
            [questKeys.startedBy] = {nil,{187924},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11742] = {
            [questKeys.startedBy] = {nil,{187925},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11743] = {
            [questKeys.startedBy] = {nil,{187926},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11744] = {
            [questKeys.startedBy] = {nil,{187927},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11745] = {
            [questKeys.startedBy] = {nil,{187928},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11746] = {
            [questKeys.startedBy] = {nil,{187929},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11747] = {
            [questKeys.startedBy] = {nil,{187930},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11748] = {
            [questKeys.startedBy] = {nil,{187931},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11749] = {
            [questKeys.startedBy] = {nil,{187932},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11750] = {
            [questKeys.startedBy] = {nil,{187933},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11751] = {
            [questKeys.startedBy] = {nil,{187934},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11752] = {
            [questKeys.startedBy] = {nil,{187935},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11753] = {
            [questKeys.startedBy] = {nil,{187936},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11754] = {
            [questKeys.startedBy] = {nil,{187937},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11755] = {
            [questKeys.startedBy] = {nil,{187938},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11756] = {
            [questKeys.startedBy] = {nil,{187939},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11757] = {
            [questKeys.startedBy] = {nil,{187940},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11758] = {
            [questKeys.startedBy] = {nil,{187941},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11759] = {
            [questKeys.startedBy] = {nil,{187942},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11760] = {
            [questKeys.startedBy] = {nil,{187943},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11761] = {
            [questKeys.startedBy] = {nil,{187944},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11762] = {
            [questKeys.startedBy] = {nil,{187945},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11763] = {
            [questKeys.startedBy] = {nil,{187946},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11764] = {
            [questKeys.startedBy] = {nil,{187947},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11765] = {
            [questKeys.startedBy] = {nil,{187948},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11766] = {
            [questKeys.startedBy] = {nil,{187954},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11767] = {
            [questKeys.startedBy] = {nil,{187955},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11768] = {
            [questKeys.startedBy] = {nil,{187956},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11769] = {
            [questKeys.startedBy] = {nil,{187957},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11770] = {
            [questKeys.startedBy] = {nil,{187958},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11771] = {
            [questKeys.startedBy] = {nil,{187959},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11772] = {
            [questKeys.startedBy] = {nil,{187960},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11773] = {
            [questKeys.startedBy] = {nil,{187961},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11774] = {
            [questKeys.startedBy] = {nil,{187962},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11775] = {
            [questKeys.startedBy] = {nil,{187963},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11776] = {
            [questKeys.startedBy] = {nil,{187964},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11777] = {
            [questKeys.startedBy] = {nil,{187965},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11778] = {
            [questKeys.startedBy] = {nil,{187966},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11779] = {
            [questKeys.startedBy] = {nil,{187967},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11780] = {
            [questKeys.startedBy] = {nil,{187968},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11781] = {
            [questKeys.startedBy] = {nil,{187969},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11782] = {
            [questKeys.startedBy] = {nil,{187970},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11783] = {
            [questKeys.startedBy] = {nil,{187971},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11784] = {
            [questKeys.startedBy] = {nil,{187972},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11785] = {
            [questKeys.startedBy] = {nil,{187973},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11786] = {
            [questKeys.startedBy] = {nil,{187974},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11787] = {
            [questKeys.startedBy] = {nil,{187975},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11799] = {
            [questKeys.startedBy] = {nil,{187949},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11800] = {
            [questKeys.startedBy] = {nil,{187950},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11801] = {
            [questKeys.startedBy] = {nil,{187951},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11802] = {
            [questKeys.startedBy] = {nil,{187952},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11803] = {
            [questKeys.startedBy] = {nil,{187953},nil},
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11804] = {
            [questKeys.startedBy] = {{25887},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11805] = {
            [questKeys.startedBy] = {{25883},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11806] = {
            [questKeys.startedBy] = {{25888},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11807] = {
            [questKeys.startedBy] = {{25889},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11808] = {
            [questKeys.startedBy] = {{25890},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11809] = {
            [questKeys.startedBy] = {{25891},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11810] = {
            [questKeys.startedBy] = {{25892},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11811] = {
            [questKeys.startedBy] = {{25893},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11812] = {
            [questKeys.startedBy] = {{25894},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11813] = {
            [questKeys.startedBy] = {{25895},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11814] = {
            [questKeys.startedBy] = {{25896},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11815] = {
            [questKeys.startedBy] = {{25897},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11816] = {
            [questKeys.startedBy] = {{25898},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11817] = {
            [questKeys.startedBy] = {{25899},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11818] = {
            [questKeys.startedBy] = {{25900},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11819] = {
            [questKeys.startedBy] = {{25901},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11820] = {
            [questKeys.startedBy] = {{25902},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11821] = {
            [questKeys.startedBy] = {{25903},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11822] = {
            [questKeys.startedBy] = {{25904},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11823] = {
            [questKeys.startedBy] = {{25905},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11824] = {
            [questKeys.startedBy] = {{25906},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11825] = {
            [questKeys.startedBy] = {{25907},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11826] = {
            [questKeys.startedBy] = {{25908},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11827] = {
            [questKeys.startedBy] = {{25909},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11828] = {
            [questKeys.startedBy] = {{25911},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11829] = {
            [questKeys.startedBy] = {{25912},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11830] = {
            [questKeys.startedBy] = {{25913},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11831] = {
            [questKeys.startedBy] = {{25914},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11832] = {
            [questKeys.startedBy] = {{25915},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11833] = {
            [questKeys.startedBy] = {{25916},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11834] = {
            [questKeys.startedBy] = {{25917},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11835] = {
            [questKeys.startedBy] = {{25918},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11836] = {
            [questKeys.startedBy] = {{25919},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11837] = {
            [questKeys.startedBy] = {{25920},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11838] = {
            [questKeys.startedBy] = {{25921},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11839] = {
            [questKeys.startedBy] = {{25922},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11840] = {
            [questKeys.startedBy] = {{25923},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11841] = {
            [questKeys.startedBy] = {{25884},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11842] = {
            [questKeys.startedBy] = {{25925},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11843] = {
            [questKeys.startedBy] = {{25926},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11844] = {
            [questKeys.startedBy] = {{25927},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11845] = {
            [questKeys.startedBy] = {{25928},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11846] = {
            [questKeys.startedBy] = {{25929},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11847] = {
            [questKeys.startedBy] = {{25930},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11848] = {
            [questKeys.startedBy] = {{25931},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11849] = {
            [questKeys.startedBy] = {{25932},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11850] = {
            [questKeys.startedBy] = {{25933},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11851] = {
            [questKeys.startedBy] = {{25934},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11852] = {
            [questKeys.startedBy] = {{25936},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11853] = {
            [questKeys.startedBy] = {{25935},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11854] = {
            [questKeys.startedBy] = {{25937},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11855] = {
            [questKeys.startedBy] = {{25938},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11856] = {
            [questKeys.startedBy] = {{25940},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11857] = {
            [questKeys.startedBy] = {{25941},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11858] = {
            [questKeys.startedBy] = {{25942},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11859] = {
            [questKeys.startedBy] = {{25943},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11860] = {
            [questKeys.startedBy] = {{25944},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11861] = {
            [questKeys.startedBy] = {{25945},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11862] = {
            [questKeys.startedBy] = {{25946},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11863] = {
            [questKeys.startedBy] = {{25947},nil,nil},
            [questKeys.zoneOrSort] = sortKeys.MIDSUMMER,
        },
        [11875] = {
            [questKeys.preQuestSingle] = {},
            [questKeys.startedBy] = {}, -- we use fake quests, so we don't show the real quest -- this needs proper fix
            [questKeys.exclusiveTo] = {64997,64998,64999},
        },
        [11877] = {
            [questKeys.preQuestSingle] = {},
        },
        [11880] = {
            [questKeys.preQuestSingle] = {},
        },
        [11882] = {
            [questKeys.startedBy] = {{25962},nil,nil},
            [questKeys.finishedBy] = {{25975},nil},
        },
        [11885] = {
            [questKeys.objectives] = {{{23161},{23165},{23163},{23162}}},
            [questKeys.requiredSourceItems] = {32620},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_EVENT, l10n("Summon and defeat each of the descendants by using 10 Time-Lost Scrolls"), 0, {{"object", 185913}}}},
        },
        [11886] = {
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.objectives] = {nil,nil,{{35277,nil}},nil},
            [questKeys.finishedBy] = {{25324},nil},
        },
        [11891] = {
            [questKeys.triggerEnd] = {"Listen to the plan of the Twilight Cultists", {[zoneIDs.ASHENVALE]={{9.15,12.41}}}},
            [questKeys.startedBy] = {{25324},nil,nil},
            [questKeys.finishedBy] = {{25324},nil},
            [questKeys.preQuestSingle] = {11886},
        },
        [11915] = {
            [questKeys.startedBy] = {{25994},nil,nil},
        },
        [11917] = {
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.specialFlags] = 0,
            [questKeys.requiredMaxLevel] = 28,
        },
        [11922] = {
            [questKeys.startedBy] = {{26113},nil,nil},
            [questKeys.finishedBy] = {{26113},nil},
            [questKeys.triggerEnd] = {"Hit 8 braziers.", {
                [zoneIDs.TELDRASSIL]={{56.59,92.06}},
                [zoneIDs.ORGRIMMAR]={{46.65,38.17}},
                [zoneIDs.STORMWIND_CITY]={{39.21,61.71}},
                [zoneIDs.IRONFORGE]={{65,23.73}},
                [zoneIDs.UNDERCITY]={{68.58,7.88}},
            }},
        },
        [11921] = {
            [questKeys.startedBy] = {{25975},nil,nil},
            [questKeys.finishedBy] = {{25975},nil},
            [questKeys.preQuestSingle] = {11657},
            [questKeys.specialFlags] = 0,
            [questKeys.triggerEnd] = {"Hit 20 braziers.", {
                [zoneIDs.ORGRIMMAR]={{46.67,38.13}},
                [zoneIDs.THUNDER_BLUFF]={{20.99,26.46}},
                [zoneIDs.STORMWIND_CITY]={{39.2,61.72}},
                [zoneIDs.IRONFORGE]={{65,23.68}},
                [zoneIDs.UNDERCITY]={{68.62,8.01}},
            }},
        },
        [11923] = {
            [questKeys.startedBy] = {{26113},nil,nil},
            [questKeys.finishedBy] = {{26113},nil},
            [questKeys.preQuestSingle] = {11922},
            [questKeys.triggerEnd] = {"Catch 4 torches in a row.", {
                [zoneIDs.ORGRIMMAR]={{47.02,36.83}},
                [zoneIDs.THUNDER_BLUFF]={{21.95,26.74}},
                [zoneIDs.STORMWIND_CITY]={{37.65,59.98}},
                [zoneIDs.IRONFORGE]={{62.15,27.58}},
                [zoneIDs.UNDERCITY]={{64.58,8.08}},
            }},
        },
        [11924] = {
            [questKeys.startedBy] = {{25975},nil,nil},
            [questKeys.finishedBy] = {{25975},nil},
            [questKeys.specialFlags] = 0,
            [questKeys.preQuestSingle] = {11657},
            [questKeys.triggerEnd] = {"Catch 10 torches in a row.", {
                [zoneIDs.ORGRIMMAR]={{47.11,36.69}},
                [zoneIDs.THE_EXODAR]={{41.63,22.55}},
                [zoneIDs.STORMWIND_CITY]={{37.5,59.8}},
                [zoneIDs.IRONFORGE]={{62.04,27.83}},
                [zoneIDs.THUNDER_BLUFF]={{22.17,26.94}},
            }},
        },
        [11925] = {
            [questKeys.startedBy] = {{26113},nil,nil},
            [questKeys.finishedBy] = {{26113},nil},
            [questKeys.specialFlags] = 0,
            [questKeys.preQuestSingle] = {11923},
            [questKeys.triggerEnd] = {"Catch 10 torches in a row.", {
                [zoneIDs.ORGRIMMAR]={{47.11,36.69}},
                [zoneIDs.THE_EXODAR]={{41.63,22.55}},
                [zoneIDs.STORMWIND_CITY]={{37.5,59.8}},
                [zoneIDs.IRONFORGE]={{62.04,27.83}},
                [zoneIDs.THUNDER_BLUFF]={{22.17,26.94}},
            }},
        },
        [11926] = {
            [questKeys.startedBy] = {{26113},nil,nil},
            [questKeys.finishedBy] = {{26113},nil},
            [questKeys.specialFlags] = 0,
            [questKeys.preQuestSingle] = {11923},
            [questKeys.triggerEnd] = {"Hit 20 braziers.", {
                [zoneIDs.ORGRIMMAR]={{46.67,38.13}},
                [zoneIDs.THUNDER_BLUFF]={{20.99,26.46}},
                [zoneIDs.STORMWIND_CITY]={{39.2,61.72}},
                [zoneIDs.IRONFORGE]={{65,23.68}},
                [zoneIDs.UNDERCITY]={{68.62,8.01}},
            }},
        },
        [11933] = {
            [questKeys.startedBy] = {nil,nil,{35569}},
        },
        [11935] = {
            [questKeys.startedBy] = {nil,nil,{35568}},
        },
        [11947] = {
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.specialFlags] = 0,
            [questKeys.requiredMaxLevel] = 38,
        },
        [11948] = {
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.specialFlags] = 0,
            [questKeys.requiredMaxLevel] = 48,
        },
        [11952] = {
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.specialFlags] = 0,
            [questKeys.requiredMaxLevel] = 55,
        },
        [11953] = {
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.specialFlags] = 0,
            [questKeys.requiredMaxLevel] = 63,
        },
        [11954] = {
            [questKeys.startedBy] = {{26221},nil,nil},
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.requiredLevel] = 64,
            [questKeys.specialFlags] = 0,
        },
        [11955] = {
            [questKeys.startedBy] = {{26221},nil,nil},
            [questKeys.finishedBy] = {{25710},nil},
            [questKeys.preQuestSingle] = {12012},
            [questKeys.requiredLevel] = 65,
        },
        [11964] = {
            [questKeys.startedBy] = {{16817},nil,nil},
        },
        [11970] = {
            [questKeys.startedBy] = {{18927,19148,19171,19172,19173,20102},nil,nil},
        },
        [11971] = {
            [questKeys.startedBy] = {{19169,19175,19176,19177,19178,20102},nil,nil},
        },
        [11972] = {
            [questKeys.startedBy] = {nil,{187892},{35723,},},
            [questKeys.finishedBy] = {{25697},nil},
        },
        [11975] = {
            [questKeys.questLevel] = -1,
            [questKeys.triggerEnd] = {"Salandria taken to the Dark Portal", {[zoneIDs.SILVERMOON_CITY]={{76.6,81.2}}}},
            [questKeys.preQuestGroup] = {10945,10951,10953},
            [questKeys.zoneOrSort] = sortKeys.SPECIAL,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
        },
        [12012] = {
            [questKeys.startedBy] = {{25324},nil,nil},
            [questKeys.finishedBy] = {{26221},nil},
            [questKeys.questLevel] = -1,
            [questKeys.objectives] = {nil,nil,{{35828,nil}},nil},
            [questKeys.preQuestSingle] = {11891},
            [questKeys.requiredSourceItems] = {},
        },
        [12020] = {
            [questKeys.preQuestSingle] = {},
        },
        [12062] = {
            [questKeys.preQuestSingle] = {},
        },
        [12133] = {
            [questKeys.name] = "Smash the Pumpkin",
            [questKeys.startedBy] = {nil,{186887},nil,},
            [questKeys.finishedBy] = {{24519,},nil,},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Give the Scorched Holy Symbol to the Costumed Orphan Matron.",},
            [questKeys.sourceItemId] = 36876,
            [questKeys.zoneOrSort] = -22,
            [questKeys.specialFlags] = 1,
            [questKeys.questFlags] = 4224,
        },
        [12135] = {
            [questKeys.name] = "\"Let the Fires Come!\"",
            [questKeys.startedBy] = {{24519},nil,nil,},
            [questKeys.finishedBy] = {{24519,},nil,},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"The Costumed Orphan Matron wants you to help put out all the village fires after the Headless Horseman lights them. When they are out, speak again to the Costumed Orphan Matron.",},
            [questKeys.triggerEnd] = {"Put Out the Fires", {[zoneIDs.DUN_MOROGH]={{44.8,52.1},{47.5,51.6}},[zoneIDs.ELWYNN_FOREST]={{41.3,65.2},{43.6,65.8}},[zoneIDs.AZUREMYST_ISLE]={{49.8,52.3},{48.8,50}}}},
            [questKeys.preQuestSingle] = {11360,11439,11440},
            [questKeys.zoneOrSort] = -22,
            [questKeys.specialFlags] = 1,
            [questKeys.requiredSourceItems] = {32971},
            [questKeys.questFlags] = 4224,
            [questKeys.exclusiveTo] = {12133},
        },
        [12139] = {
            [questKeys.name] = "\"Let the Fires Come!\"",
            [questKeys.startedBy] = {{23973},nil,nil,},
            [questKeys.finishedBy] = {{23973,},nil,},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"The Masked Orphan Matron wants you to help put out all the village fires. When they are out, speak again to the Masked Orphan Matron in town.",},
            [questKeys.triggerEnd] = {"Put Out the Fires", {[zoneIDs.DUROTAR]={{52.12,43.59},{53.21,42.56},{51.58,42.08}},[zoneIDs.TIRISFAL_GLADES]={{60.32,53.29},{61.11,51.25},{61.64,51.97}},[zoneIDs.EVERSONG_WOODS]={{47.76,47.3},{48.21,46.16}}}},
            [questKeys.preQuestSingle] = {11361,11449,11450},
            [questKeys.zoneOrSort] = -22,
            [questKeys.specialFlags] = 1,
            [questKeys.requiredSourceItems] = {32971},
            [questKeys.questFlags] = 4224,
            [questKeys.exclusiveTo] = {12155},
        },
        [12155] = {
            [questKeys.name] = "Smash the Pumpkin",
            [questKeys.startedBy] = {nil,{186887},nil,},
            [questKeys.finishedBy] = {{23973,},nil,},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Give the Scorched Holy Symbol to the Masked Orphan Matron.",},
            [questKeys.sourceItemId] = 36876,
            [questKeys.zoneOrSort] = -22,
            [questKeys.specialFlags] = 1,
            [questKeys.questFlags] = 4224,
        },
        [12192] = {
            [questKeys.name] = "This One Time, When I Was Drunk...",
            [questKeys.startedBy] = {nil,{189990,},nil,},
            [questKeys.finishedBy] = {{27216,},nil,},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Talk to Bizzle Quicklift in the Brewfest camp.",},
            [questKeys.zoneOrSort] = -370,
            [questKeys.specialFlags] = 1,
            [questKeys.questFlags] = 4096,
        },
        [12194] = {
            [questKeys.preQuestSingle] = {11409,},
        },
        [12286] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{189303,},nil,},
            [questKeys.finishedBy] = {nil,{189303,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12318] = {
            [questKeys.startedBy] = {{27584,28329},nil,nil,},
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.preQuestSingle] = {},
        },
        [12331] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190034,},nil,},
            [questKeys.finishedBy] = {nil,{190034,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12332] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190036,},nil,},
            [questKeys.finishedBy] = {nil,{190036,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12333] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190037,},nil,},
            [questKeys.finishedBy] = {nil,{190037,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12334] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190038,},nil,},
            [questKeys.finishedBy] = {nil,{190038,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12335] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190039,},nil,},
            [questKeys.finishedBy] = {nil,{190039,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12336] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190040,},nil,},
            [questKeys.finishedBy] = {nil,{190040,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12337] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190041,},nil,},
            [questKeys.finishedBy] = {nil,{190041,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12338] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190042,},nil,},
            [questKeys.finishedBy] = {nil,{190042,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12339] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190043,},nil,},
            [questKeys.finishedBy] = {nil,{190043,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12340] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190047,},nil,},
            [questKeys.finishedBy] = {nil,{190047,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12341] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190045,},nil,},
            [questKeys.finishedBy] = {nil,{190045,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12342] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190046,},nil,},
            [questKeys.finishedBy] = {nil,{190046,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12343] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190044,},nil,},
            [questKeys.finishedBy] = {nil,{190044,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12344] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190048,},nil,},
            [questKeys.finishedBy] = {nil,{190048,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12345] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190035,},nil,},
            [questKeys.finishedBy] = {nil,{190035,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12346] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190049,},nil,},
            [questKeys.finishedBy] = {nil,{190049,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12347] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190050,},nil,},
            [questKeys.finishedBy] = {nil,{190050,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12348] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190051,},nil,},
            [questKeys.finishedBy] = {nil,{190051,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12349] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190052,},nil,},
            [questKeys.finishedBy] = {nil,{190052,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12350] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190053,},nil,},
            [questKeys.finishedBy] = {nil,{190053,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12351] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190054,},nil,},
            [questKeys.finishedBy] = {nil,{190054,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12352] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190055,},nil,},
            [questKeys.finishedBy] = {nil,{190055,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12353] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190056,},nil,},
            [questKeys.finishedBy] = {nil,{190056,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12354] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190057,},nil,},
            [questKeys.finishedBy] = {nil,{190057,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12355] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190058,},nil,},
            [questKeys.finishedBy] = {nil,{190058,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12356] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190059,},nil,},
            [questKeys.finishedBy] = {nil,{190059,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12357] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190060,},nil,},
            [questKeys.finishedBy] = {nil,{190060,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12358] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190061,},nil,},
            [questKeys.finishedBy] = {nil,{190061,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12359] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190062,},nil,},
            [questKeys.finishedBy] = {nil,{190062,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12360] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190063,},nil,},
            [questKeys.finishedBy] = {nil,{190063,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.zoneOrSort] = -22,
        },
        [12361] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190064,},nil,},
            [questKeys.finishedBy] = {nil,{190064,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12362] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190065,},nil,},
            [questKeys.finishedBy] = {nil,{190065,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12363] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190066,},nil,},
            [questKeys.finishedBy] = {nil,{190066,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12364] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190067,},nil,},
            [questKeys.finishedBy] = {nil,{190067,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12365] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190068,},nil,},
            [questKeys.finishedBy] = {nil,{190068,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12366] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190069,},nil,},
            [questKeys.finishedBy] = {nil,{190069,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12367] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190070,},nil,},
            [questKeys.finishedBy] = {nil,{190070,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12368] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190071,},nil,},
            [questKeys.finishedBy] = {nil,{190071,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12369] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190072,},nil,},
            [questKeys.finishedBy] = {nil,{190072,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12370] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190073,},nil,},
            [questKeys.finishedBy] = {nil,{190073,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12371] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190074,},nil,},
            [questKeys.finishedBy] = {nil,{190074,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12373] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190075,},nil,},
            [questKeys.finishedBy] = {nil,{190075,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12374] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190076,},nil,},
            [questKeys.finishedBy] = {nil,{190076,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12375] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190077,},nil,},
            [questKeys.finishedBy] = {nil,{190077,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12376] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190078,},nil,},
            [questKeys.finishedBy] = {nil,{190078,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12377] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190079,},nil,},
            [questKeys.finishedBy] = {nil,{190079,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12378] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190080,},nil,},
            [questKeys.finishedBy] = {nil,{190080,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12379] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190081,},nil,},
            [questKeys.finishedBy] = {nil,{190081,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12380] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190082,},nil,},
            [questKeys.finishedBy] = {nil,{190082,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12381] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190083,},nil,},
            [questKeys.finishedBy] = {nil,{190083,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12382] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190084,},nil,},
            [questKeys.finishedBy] = {nil,{190084,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12383] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190085,},nil,},
            [questKeys.finishedBy] = {nil,{190085,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12384] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190086,},nil,},
            [questKeys.finishedBy] = {nil,{190086,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12385] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190087,},nil,},
            [questKeys.finishedBy] = {nil,{190087,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12386] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190088,},nil,},
            [questKeys.finishedBy] = {nil,{190088,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12387] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190089,},nil,},
            [questKeys.finishedBy] = {nil,{190089,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12388] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190090,},nil,},
            [questKeys.finishedBy] = {nil,{190090,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12389] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190091,},nil,},
            [questKeys.finishedBy] = {nil,{190091,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12390] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190096,},nil,},
            [questKeys.finishedBy] = {nil,{190096,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12391] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190097,},nil,},
            [questKeys.finishedBy] = {nil,{190097,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12392] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190098,},nil,},
            [questKeys.finishedBy] = {nil,{190098,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12393] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190099,},nil,},
            [questKeys.finishedBy] = {nil,{190099,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12394] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190100,},nil,},
            [questKeys.finishedBy] = {nil,{190100,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12395] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190101,},nil,},
            [questKeys.finishedBy] = {nil,{190101,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.zoneOrSort] = -22,
        },
        [12396] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190102,},nil,},
            [questKeys.finishedBy] = {nil,{190102,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12397] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190103,},nil,},
            [questKeys.finishedBy] = {nil,{190103,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12398] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190104,},nil,},
            [questKeys.finishedBy] = {nil,{190104,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12399] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190105,},nil,},
            [questKeys.finishedBy] = {nil,{190105,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12400] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190106,},nil,},
            [questKeys.finishedBy] = {nil,{190106,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12401] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190107,},nil,},
            [questKeys.finishedBy] = {nil,{190107,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12402] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190108,},nil,},
            [questKeys.finishedBy] = {nil,{190108,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12403] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190109,},nil,},
            [questKeys.finishedBy] = {nil,{190109,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12404] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190110,190111},nil},
            [questKeys.finishedBy] = {nil,{190110,190111}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12406] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190112,},nil,},
            [questKeys.finishedBy] = {nil,{190112,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12407] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190113,},nil,},
            [questKeys.finishedBy] = {nil,{190113,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12408] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190114,},nil,},
            [questKeys.finishedBy] = {nil,{190114,},},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12409] = {
            [questKeys.name] = "Candy Bucket",
            [questKeys.startedBy] = {nil,{190115,190116},nil},
            [questKeys.finishedBy] = {nil,{190115,190116}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.zoneOrSort] = -22,
        },
        [12420] = {
            [questKeys.name] = "Brew of the Month Club",
            [questKeys.startedBy] = {nil,nil,{37736}},
            [questKeys.finishedBy] = {{27478},nil},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Bring the \"Brew of the Month\" club membership form to Larkin Thunderbrew in the Stonefire Tavern in Ironforge."},
            [questKeys.sourceItemId] = 37736,
            [questKeys.zoneOrSort] = -370,
        },
        [12421] = {
            [questKeys.name] = "Brew of the Month Club",
            [questKeys.startedBy] = {nil,nil,{37737}},
            [questKeys.finishedBy] = {{27489},nil},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Bring the \"Brew of the Month\" club membership form to Ray'ma in the Darkbriar Lodge in Orgrimmar's Valley of Spirits."},
            [questKeys.sourceItemId] = 37737,
            [questKeys.zoneOrSort] = -370,
        },
        [12513] = {
            [questKeys.exclusiveTo] = {12515},
            [questKeys.requiredRaces] = raceIDs.GNOME + raceIDs.HUMAN + raceIDs.DWARF,
        },
        [12515] = {
            [questKeys.exclusiveTo] = {12513},
            [questKeys.startedBy] = {{28126},nil},
            [questKeys.finishedBy] = {{28126},nil},
            [questKeys.requiredRaces] = raceIDs.ORC + raceIDs.NIGHT_ELF + raceIDs.DRAENEI + raceIDs.TROLL + raceIDs.TAUREN + raceIDs.UNDEAD + raceIDs.BLOOD_ELF,
        },

        -- Below are quests that were not originally in TBC or in a different form

        [63866] = {
            [questKeys.name] = "Claiming the Light",
            [questKeys.startedBy] = {{178420},nil,nil},
            [questKeys.finishedBy] = {{17717},nil},
            [questKeys.requiredLevel] = 12,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Use the Shimmering Vessel on M'uru to fill it and return to Knight-Lord Bloodvalor in Silvermoon City."},
            [questKeys.objectives] = {nil,nil,{{24156}},nil},
            [questKeys.sourceItemId] = 24157,
            [questKeys.preQuestSingle] = {9681,64319},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 9685,
            [questKeys.questFlags] = 128,
        },
        [64845] = {
            [questKeys.name] = "Alliance War Effort",
            [questKeys.startedBy] = {{15351},nil,nil},
            [questKeys.finishedBy] = {{15351},nil},
            [questKeys.requiredLevel] = 70,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Win a battleground match and return to an Alliance Brigadier General at any Alliance capital city or Shattrath."},
            [questKeys.triggerEnd] = {"Victory in a battleground match", {
                [zoneIDs.SHATTRATH_CITY] = {{67.41,33.86}},
                [zoneIDs.IRONFORGE] = {{69.8,90.6}},
                [zoneIDs.DARNASSUS] = {{58,34.4}},
                [zoneIDs.STORMWIND_CITY] = {{79.4,18.0}},
                [zoneIDs.ALTERAC_MOUNTAINS] = {{39.4,82.2}},
                [zoneIDs.ARATHI_HIGHLANDS] = {{45.6,45.8}},
                [zoneIDs.ASHENVALE] = {{61.8,83.8}},
                [zoneIDs.THE_EXODAR]={{26.6,50.1}},
            }},
            [questKeys.zoneOrSort] = sortKeys.BATTLEGROUND,
            [questKeys.questFlags] = questFlags.RAID,
            [questKeys.specialFlags] = 1,
        },
        -- Blood Elf Paladin Epic Mount quest
        [64139] = {
            [questKeys.name] = "A Summons from Lady Liadrin",
            [questKeys.startedBy] = {{17717},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Speak with Lady Liadrin in Silvermoon City."},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64140,
            [questKeys.questFlags] = 136,
        },
        [64140] = {
            [questKeys.name] = "The Master's Path",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Speak with Lady Liadrin again to accept her offer of sponsorship."},
            [questKeys.preQuestSingle] = {64139},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64141,
            [questKeys.questFlags] = 136,
        },
        [64141] = {
            [questKeys.name] = "A Gesture of Commitment",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Bring 40 Runecloth, 6 Arcanite Bars, 10 Sungrass, 5 Dark Runes, and 150 Gold to Lady Liadrin in Silvermoon City. "},
            [questKeys.objectives] = {nil,nil,{{14047,nil},{12360,nil},{8838,nil},{20520,nil}},nil},
            [questKeys.sourceItemId] = 24277,
            [questKeys.preQuestSingle] = {64140},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64142,
            [questKeys.questFlags] = 128,
        },
        [64142] = {
            [questKeys.name] = "A Demonstration of Loyalty",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Lady Liadrin in Silvermoon City wants you to destroy 3 Scourge Meat Wagons and kill 15 Scourge Siege Engineers. "},
            [questKeys.objectives] = {{{17878,nil}},{{182058,"Destroy Scourge Meat Wagons"}},nil,nil},
            [questKeys.preQuestSingle] = {64141},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64143,
            [questKeys.questFlags] = 136,
        },
        [64143] = {
            [questKeys.name] = "True Masters of the Light",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Lady Liadrin in Silvermoon City wants you to bring her a vial of Tyr's Hand Holy Water. "},
            [questKeys.objectives] = {nil,nil,{{24284,nil}},nil},
            [questKeys.preQuestSingle] = {64142},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64144,
            [questKeys.questFlags] = 136,
        },
        [64144] = {
            [questKeys.name] = "True Masters of the Light",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Lady Liadrin in Silvermoon City wants you to bring him 1 Arcane Catalyst, 1 Crepuscular Powder, 1 Azerothian Diamond, and 1 Pristine Black Diamond."},
            [questKeys.objectives] = {nil,nil,{{24286,nil},{24285,nil},{12800,nil},{18335,nil}},nil},
            [questKeys.preQuestSingle] = {64143},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 64145,
            [questKeys.questFlags] = 136,
        },
        [64145] = {
            [questKeys.name] = "True Masters of the Light",
            [questKeys.startedBy] = {{17076},nil,nil},
            [questKeys.finishedBy] = {{17076},nil},
            [questKeys.requiredLevel] = 60,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Use the Extinguishing Mixture near the eternal flame in the Alonsus Chapel to remove the Light's protection. Be prepared to fight anyone who may attempt to defend the chapel."},
            [questKeys.objectives] = {nil,nil,nil,nil,{{{17910,17911,17912,17913,17914},17910,"Remove Alonsus Chapel Protection"}}},
            [questKeys.extraObjectives] = {{nil, Questie.ICON_TYPE_OBJECT, l10n("Use the Extinguishing Mixture near the eternal flame"), 0, {{"object", 182068}}}},
            [questKeys.sourceItemId] = 24287,
            [questKeys.preQuestSingle] = {64144},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.questFlags] = 128,
        },
        -------------
        [64319] = {
            [questKeys.name] = "A Study in Power",
            [questKeys.startedBy] = {{17717},nil,nil},
            [questKeys.finishedBy] = {{178420},nil},
            [questKeys.requiredLevel] = 12,
            [questKeys.questLevel] = -1,
            [questKeys.requiredRaces] = raceIDs.BLOOD_ELF,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Speak with Magister Astalor Bloodsworn in the hidden chamber beneath Blood Knight headquarters."},
            [questKeys.objectives] = {},
            [questKeys.preQuestSingle] = {9678},
            [questKeys.zoneOrSort] = sortKeys.PALADIN,
            [questKeys.nextQuestInChain] = 63866,
            [questKeys.questFlags] = 136,
        },

        ----- Boosted character quests -----
        [64037] = {
            [questKeys.name] = "Eastern Plaguelands",
            [questKeys.startedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil,nil},
            [questKeys.finishedBy] = {{11036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Travel to the Eastern Plaguelands and find Leonid Barthalomew. He awaits your arrival at Light's Hope Chapel. "},
            [questKeys.objectives] = {{{352, "Speak to Dungar Longdrink, the Gryphon Master"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64035},
            [questKeys.exclusiveTo] = {64038},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64028] = {
            [questKeys.name] = "A New Beginning",
            [questKeys.startedBy] = {}, -- This quest is auto accept
            [questKeys.finishedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Meet with your class trainer in Stormwind."},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64031] = {
            [questKeys.name] = "Tools for Survival",
            [questKeys.startedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil,nil},
            [questKeys.finishedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Open the survival kit and equip a weapon."},
            [questKeys.objectives] = {nil,{{410010, "Open the Survival Kit"}, {410011, "Equip a Weapon"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64028},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64034] = {
            [questKeys.name] = "Combat Training",
            [questKeys.startedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil,nil},
            [questKeys.finishedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Train a spell by speaking to your class trainer."},
            [questKeys.objectives] = {nil,{{410012, "Train a Spell"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64031},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64035] = {
            [questKeys.name] = "Talented",
            [questKeys.startedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil,nil},
            [questKeys.finishedBy] = {{376,914,928,5495,5497,5505,5515,13283},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Activate the Talents interface and allocate a Talent Point."},
            [questKeys.objectives] = {nil,{{410013, "Spend a Talent Point"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64034},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64038] = {
            [questKeys.name] = "The Dark Portal",
            [questKeys.startedBy] = {{331,376,914,928,5495,5497,5505,5515,13283},nil,nil},
            [questKeys.finishedBy] = {{16841},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.objectivesText] = {"Find Watch Commander Relthorn Netherwane at the Blasted Lands. He awaits your arrival before the Dark Portal."},
            [questKeys.objectives] = {{{352, "Speak to Dungar Longdrink, the Gryphon Master"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64035},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64046] = {
            [questKeys.name] = "A New Beginning",
            [questKeys.startedBy] = {}, -- This quest is auto accept
            [questKeys.finishedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Meet with your class trainer in Orgrimmar."},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64047] = {
            [questKeys.name] = "A New Beginning",
            [questKeys.startedBy] = {}, -- This quest is auto accept
            [questKeys.finishedBy] = {{3036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Meet with your Druid trainer in Thunder Bluff."},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64048] = {
            [questKeys.name] = "Tools for Survival",
            [questKeys.startedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil,nil},
            [questKeys.finishedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Open the survival kit and equip a weapon."},
            [questKeys.objectives] = {nil,{{410002, "Open the Survival Kit"}, {410003, "Equip a Weapon"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64046},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64049] = {
            [questKeys.name] = "Tools for Survival",
            [questKeys.startedBy] = {{3036},nil,nil},
            [questKeys.finishedBy] = {{3036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Open the survival kit and equip a weapon."},
            [questKeys.objectives] = {nil,{{410004, "Open the Survival Kit"}, {410005, "Equip a Weapon"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64047},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64050] = {
            [questKeys.name] = "Combat Training",
            [questKeys.startedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil,nil},
            [questKeys.finishedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Train a spell by speaking to your class trainer."},
            [questKeys.objectives] = {nil,{{410006, "Train a Spell"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64048},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64051] = {
            [questKeys.name] = "Combat Training",
            [questKeys.startedBy] = {{3036},nil,nil},
            [questKeys.finishedBy] = {{3036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Train a spell by speaking to your Druid trainer."},
            [questKeys.objectives] = {nil,{{410007, "Train a Spell"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64049},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64052] = {
            [questKeys.name] = "Talented",
            [questKeys.startedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil,nil},
            [questKeys.finishedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Activate the Talents interface and allocate five Talent Points."},
            [questKeys.objectives] = {nil,{{410008, "Spend 5 Talent Points"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64050},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64053] = {
            [questKeys.name] = "Talented",
            [questKeys.startedBy] = {{3036},nil,nil},
            [questKeys.finishedBy] = {{3036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Activate the Talents interface and allocate five Talent Points."},
            [questKeys.objectives] = {nil,{{410009, "Spend 5 Talent Points"}},nil,nil,nil},
            [questKeys.preQuestSingle] = {64051},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64063] = {
            [questKeys.name] = "The Dark Portal",
            [questKeys.startedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil,nil},
            [questKeys.finishedBy] = {{19254},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Find Watch Warlord Dar'toon at the Blasted Lands. He awaits your arrival before the Dark Portal."},
            [questKeys.objectives] = {{{12136, "Visit Snurk Bucksqick by the Zepplin Master"},{1387, "Speak to Thysta at Grom'Gol Base Camp"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64052},
            [questKeys.exclusiveTo] = {64217},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64064] = {
            [questKeys.name] = "Eastern Plaguelands",
            [questKeys.startedBy] = {{3324,3328,3344,3353,3406,5885,5994},nil,nil},
            [questKeys.finishedBy] = {{11036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.objectivesText] = {"Travel to the Eastern Plaguelands and find Leonid Barthalomew. He awaits your arrival at Light's Hope Chapel. "},
            [questKeys.objectives] = {{{9564, "Visit Zeppelin Master Frezza"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64052},
            [questKeys.exclusiveTo] = {64063,64217,64128},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64128] = {
            [questKeys.name] = "Eastern Plaguelands",
            [questKeys.startedBy] = {{3036},nil,nil},
            [questKeys.finishedBy] = {{11036},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Travel to the Eastern Plaguelands and find Leonid Barthalomew. He awaits your arrival at Light's Hope Chapel. "},
            [questKeys.objectives] = {{{9564, "Speak to Tal, the Wind Rider Master"},{9564, "Visit Zeppelin Master Frezza"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64053},
            [questKeys.exclusiveTo] = {64063,64064,64217},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64217] = {
            [questKeys.name] = "The Dark Portal",
            [questKeys.startedBy] = {{3036},nil,nil},
            [questKeys.finishedBy] = {{19254},nil},
            [questKeys.requiredLevel] = 58,
            [questKeys.questLevel] = 58,
            [questKeys.requiredRaces] = raceIDs.TAUREN,
            [questKeys.objectivesText] = {"Find Watch Warlord Dar'toon at the Blasted Lands. He awaits your arrival before the Dark Portal."},
            [questKeys.objectives] = {{{12136, "Visit Snurk Bucksqick by the Zepplin Master"},{1387, "Speak to Thysta at Grom'Gol Base Camp"}},nil,nil,nil,nil},
            [questKeys.preQuestSingle] = {64053},
            [questKeys.exclusiveTo] = {64063,64064,64128},
            [questKeys.zoneOrSort] = sortKeys.REPUTATION,
        },
        [64997] = {
            [questKeys.name] = "Gaining the Advantage",
            [questKeys.startedBy] = {{19202}},
            [questKeys.finishedBy] = {{19202}},
            [questKeys.requiredLevel] = 70,
            [questKeys.questLevel] = 70,
            [questKeys.requiredRaces] = 0,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring 8 Nether Residue to Emissary Mordin in Shattrath City."},
            [questKeys.objectives] = {nil,nil,{{35229}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.exclusiveTo] = {11875,64998,64999},
            [questKeys.zoneOrSort] = 3703,
            [questKeys.requiredSkill] = {profKeys.HERBALISM,275}, -- this needs proper fix, you need master or higher mining, skinning OR herbalism
            [questKeys.questFlags] = 4232,
            [questKeys.specialFlags] = 1,
            [questKeys.reputationReward] = {{1077,250}},
        },
        [64998] = {
            [questKeys.name] = "Gaining the Advantage",
            [questKeys.startedBy] = {{19202}},
            [questKeys.finishedBy] = {{19202}},
            [questKeys.requiredLevel] = 70,
            [questKeys.questLevel] = 70,
            [questKeys.requiredRaces] = 0,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring 8 Nether Residue to Emissary Mordin in Shattrath City."},
            [questKeys.objectives] = {nil,nil,{{35229}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.exclusiveTo] = {11875,64997,64999},
            [questKeys.zoneOrSort] = 3703,
            [questKeys.requiredSkill] = {profKeys.MINING,275}, -- this needs proper fix, you need master or higher mining, skinning OR herbalism
            [questKeys.questFlags] = 4232,
            [questKeys.specialFlags] = 1,
            [questKeys.reputationReward] = {{1077,250}},
        },
        [64999] = {
            [questKeys.name] = "Gaining the Advantage",
            [questKeys.startedBy] = {{19202}},
            [questKeys.finishedBy] = {{19202}},
            [questKeys.requiredLevel] = 70,
            [questKeys.questLevel] = 70,
            [questKeys.requiredRaces] = 0,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring 8 Nether Residue to Emissary Mordin in Shattrath City."},
            [questKeys.objectives] = {nil,nil,{{35229}}},
            [questKeys.preQuestSingle] = {},
            [questKeys.exclusiveTo] = {11875,64997,64998},
            [questKeys.zoneOrSort] = 3703,
            [questKeys.requiredSkill] = {profKeys.SKINNING,275}, -- this needs proper fix, you need master or higher mining, skinning OR herbalism
            [questKeys.questFlags] = 4232,
            [questKeys.specialFlags] = 1,
            [questKeys.reputationReward] = {{1077,250}},
        },
    }
end

function _QuestieTBCQuestFixes:InsertMissingQuestIds()
    QuestieDB.questData[12192] = {} -- This One Time, When I Was Drunk... (Horde)
    QuestieDB.questData[12420] = {} -- Brew of the Month Club (Alliance)
    QuestieDB.questData[12421] = {} -- Brew of the Month Club (Horde)
    QuestieDB.questData[63866] = {} -- Claiming the Light
    QuestieDB.questData[64139] = {} -- A Summons from Lady Liadrin
    QuestieDB.questData[64140] = {} -- The Master's Path
    QuestieDB.questData[64141] = {} -- A Gesture of Commitment
    QuestieDB.questData[64142] = {} -- A Demonstration of Loyalty
    QuestieDB.questData[64143] = {} -- True Masters of the Light
    QuestieDB.questData[64144] = {} -- True Masters of the Light
    QuestieDB.questData[64145] = {} -- True Masters of the Light
    QuestieDB.questData[64319] = {} -- A Study in Power
    QuestieDB.questData[64845] = {} -- Alliance War Effort

    -- Alliance boosted quests
    QuestieDB.questData[64028] = {} -- A New Beginning
    QuestieDB.questData[64031] = {} -- Tools for Survival
    QuestieDB.questData[64034] = {} -- Combat Training
    QuestieDB.questData[64035] = {} -- Talented
    QuestieDB.questData[64037] = {} -- Eastern Plaguelands
    QuestieDB.questData[64038] = {} -- The Dark Portal
    -- Horde boosted quests
    QuestieDB.questData[64046] = {} -- A New Beginning
    QuestieDB.questData[64047] = {} -- A New Beginning
    QuestieDB.questData[64048] = {} -- Tools for Survival
    QuestieDB.questData[64049] = {} -- Tools for Survival
    QuestieDB.questData[64050] = {} -- Combat Training
    QuestieDB.questData[64051] = {} -- Combat Training
    QuestieDB.questData[64052] = {} -- Talented
    QuestieDB.questData[64053] = {} -- Talented
    QuestieDB.questData[64063] = {} -- The Dark Portal
    QuestieDB.questData[64064] = {} -- Eastern Plaguelands
    QuestieDB.questData[64128] = {} -- Eastern Plaguelands
    QuestieDB.questData[64217] = {} -- The Dark Portal

    -- Halloween Candy quests
    QuestieDB.questData[12133] = {} -- Smash the Pumpkin
    QuestieDB.questData[12135] = {} -- Let the Fires Come!
    QuestieDB.questData[12139] = {} -- Let the Fires Come!
    QuestieDB.questData[12155] = {} -- Smash the Pumpkin

    QuestieDB.questData[12286] = {} -- Candy Bucket
    QuestieDB.questData[12331] = {} -- Candy Bucket
    QuestieDB.questData[12332] = {} -- Candy Bucket
    QuestieDB.questData[12333] = {} -- Candy Bucket
    QuestieDB.questData[12334] = {} -- Candy Bucket
    QuestieDB.questData[12335] = {} -- Candy Bucket
    QuestieDB.questData[12336] = {} -- Candy Bucket
    QuestieDB.questData[12337] = {} -- Candy Bucket
    QuestieDB.questData[12338] = {} -- Candy Bucket
    QuestieDB.questData[12339] = {} -- Candy Bucket
    QuestieDB.questData[12340] = {} -- Candy Bucket
    QuestieDB.questData[12341] = {} -- Candy Bucket
    QuestieDB.questData[12342] = {} -- Candy Bucket
    QuestieDB.questData[12343] = {} -- Candy Bucket
    QuestieDB.questData[12344] = {} -- Candy Bucket
    QuestieDB.questData[12345] = {} -- Candy Bucket
    QuestieDB.questData[12346] = {} -- Candy Bucket
    QuestieDB.questData[12347] = {} -- Candy Bucket
    QuestieDB.questData[12348] = {} -- Candy Bucket
    QuestieDB.questData[12349] = {} -- Candy Bucket
    QuestieDB.questData[12350] = {} -- Candy Bucket
    QuestieDB.questData[12351] = {} -- Candy Bucket
    QuestieDB.questData[12352] = {} -- Candy Bucket
    QuestieDB.questData[12353] = {} -- Candy Bucket
    QuestieDB.questData[12354] = {} -- Candy Bucket
    QuestieDB.questData[12355] = {} -- Candy Bucket
    QuestieDB.questData[12356] = {} -- Candy Bucket
    QuestieDB.questData[12357] = {} -- Candy Bucket
    QuestieDB.questData[12358] = {} -- Candy Bucket
    QuestieDB.questData[12359] = {} -- Candy Bucket
    QuestieDB.questData[12360] = {} -- Candy Bucket
    QuestieDB.questData[12361] = {} -- Candy Bucket
    QuestieDB.questData[12362] = {} -- Candy Bucket
    QuestieDB.questData[12363] = {} -- Candy Bucket
    QuestieDB.questData[12364] = {} -- Candy Bucket
    QuestieDB.questData[12365] = {} -- Candy Bucket
    QuestieDB.questData[12366] = {} -- Candy Bucket
    QuestieDB.questData[12367] = {} -- Candy Bucket
    QuestieDB.questData[12368] = {} -- Candy Bucket
    QuestieDB.questData[12369] = {} -- Candy Bucket
    QuestieDB.questData[12370] = {} -- Candy Bucket
    QuestieDB.questData[12371] = {} -- Candy Bucket
    QuestieDB.questData[12373] = {} -- Candy Bucket
    QuestieDB.questData[12374] = {} -- Candy Bucket
    QuestieDB.questData[12375] = {} -- Candy Bucket
    QuestieDB.questData[12376] = {} -- Candy Bucket
    QuestieDB.questData[12377] = {} -- Candy Bucket
    QuestieDB.questData[12378] = {} -- Candy Bucket
    QuestieDB.questData[12379] = {} -- Candy Bucket
    QuestieDB.questData[12380] = {} -- Candy Bucket
    QuestieDB.questData[12381] = {} -- Candy Bucket
    QuestieDB.questData[12382] = {} -- Candy Bucket
    QuestieDB.questData[12383] = {} -- Candy Bucket
    QuestieDB.questData[12384] = {} -- Candy Bucket
    QuestieDB.questData[12385] = {} -- Candy Bucket
    QuestieDB.questData[12386] = {} -- Candy Bucket
    QuestieDB.questData[12387] = {} -- Candy Bucket
    QuestieDB.questData[12388] = {} -- Candy Bucket
    QuestieDB.questData[12389] = {} -- Candy Bucket
    QuestieDB.questData[12390] = {} -- Candy Bucket
    QuestieDB.questData[12391] = {} -- Candy Bucket
    QuestieDB.questData[12392] = {} -- Candy Bucket
    QuestieDB.questData[12393] = {} -- Candy Bucket
    QuestieDB.questData[12394] = {} -- Candy Bucket
    QuestieDB.questData[12395] = {} -- Candy Bucket
    QuestieDB.questData[12396] = {} -- Candy Bucket
    QuestieDB.questData[12397] = {} -- Candy Bucket
    QuestieDB.questData[12398] = {} -- Candy Bucket
    QuestieDB.questData[12399] = {} -- Candy Bucket
    QuestieDB.questData[12400] = {} -- Candy Bucket
    QuestieDB.questData[12401] = {} -- Candy Bucket
    QuestieDB.questData[12402] = {} -- Candy Bucket
    QuestieDB.questData[12403] = {} -- Candy Bucket
    QuestieDB.questData[12404] = {} -- Candy Bucket
    QuestieDB.questData[12406] = {} -- Candy Bucket
    QuestieDB.questData[12407] = {} -- Candy Bucket
    QuestieDB.questData[12408] = {} -- Candy Bucket
    QuestieDB.questData[12409] = {} -- Candy Bucket
end

function QuestieTBCQuestFixes:LoadFactionFixes()
    local questKeys = QuestieDB.questKeys
    local raceIDs = QuestieDB.raceKeys

    local questFixesHorde = {
        [2861] = {
            [questKeys.startedBy] = {{4568,5885,16651}}
        },
    }

    local questFixesAlliance = {
        [2861] = {
            [questKeys.startedBy] = {{5144,5497,17514}}
        },
    }

    if UnitFactionGroup("Player") == "Horde" then
        return questFixesHorde
    else
        return questFixesAlliance
    end
end
