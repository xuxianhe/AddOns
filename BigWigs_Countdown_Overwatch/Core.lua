local _, ns = ...
local L = ns.L

local localeMap = {
	enUS = "English",
	deDE = "Deutsch",
	esES = "Español",
	esMX = "Español",
	frFR = "Français",
	itIT = "Italiano",
	koKR = "한국어",
	ptBR = "Português",
	ruRU = "Русский",
	zhCN = "简体中文",
	zhTW = "繁體中文",
}

local heroes = {
	Announcer = "Athena",
	Ana = "Ana",
	Ashe = "Ashe",
	Baptiste = "Baptiste",
	Bastion = "Bastion",
	Brigitte = "Brigitte",
	McCree = "Cassidy",
	DVa = "D.Va",
	Doomfist = "Doomfist",
	Echo = "Echo",
	Freja = "Freja",
	Genji = "Genji",
	Hanzo = "Hanzo",
	Hazard = "Hazard",
	Illari = "Illari",
	JunkerQueen = "Junker Queen",
	Junkrat = "Junkrat",
	Juno = "Juno",
	Kiriko = "Kiriko",
	Lifeweaver = "Lifeweaver",
	Lucio = "Lúcio",
	Mauga = "Mauga",
	Mei = "Mei",
	Mercy = "Mercy",
	Moira = "Moira",
	Orisa = "Orisa",
	Pharah = "Pharah" ,
	Ramattra = "Ramattra",
	Reaper = "Reaper",
	Reinhardt = "Reinhardt",
	Roadhog = "Roadhog",
	Sigma = "Sigma",
	Sojourn = "Sojourn",
	Soldier76 = "Soldier: 76",
	Sombra = "Sombra",
	Symmetra = "Symmetra",
	Torbjorn = "Torbjörn",
	Tracer = "Tracer",
	Venture = "Venture",
	Widowmaker = "Widowmaker",
	Winston = "Winston",
	WreckingBall = "Wrecking Ball",
	Zarya = "Zarya",
	Zenyatta = "Zenyatta",
}

-- After Sigma, all the countdowns were changed to 3..2..1 :\
local five = {
	Announcer = true,
	Ana = true,
	Ashe = true,
	Baptiste = true,
	Bastion = true,
	Brigitte = true,
	McCree = true,
	DVa = true,
	Doomfist = true,
	Genji = true,
	Hanzo = true,
	Junkrat = true,
	Lucio = true,
	Mei = true,
	Mercy = true,
	Moira = true,
	Orisa = true,
	Pharah = "Pharah" ,
	Reaper = true,
	Reinhardt = true,
	Roadhog = true,
	Sigma = true,
	Soldier76 = true,
	Sombra = true,
	Symmetra = true,
	Torbjorn = true,
	Tracer = true,
	Widowmaker = true,
	Winston = true,
	WreckingBall = true,
	Zarya = true,
	Zenyatta = true,
}

local function register(locale)
	local lang = localeMap[locale]
	local path = "Interface\\AddOns\\BigWigs_Countdown_Overwatch\\"..locale.."\\%s_%d.ogg"
	local key = locale ~= "enUS" and L.key or "%s: Overwatch: %s"

	for k, v in next, heroes do
		local id = ("%s: Overwatch: %s"):format(lang, k)
		local name = key:format(lang, locale ~= "enUS" and L[k] or v)
		if k == "Bastion" then
			-- Bastion beeps and boops are the same for all locales
			BigWigsAPI:RegisterCountdown(id, name, {
				"Interface\\AddOns\\BigWigs_Countdown_Overwatch\\enUS\\Bastion_1.ogg",
				"Interface\\AddOns\\BigWigs_Countdown_Overwatch\\enUS\\Bastion_2.ogg",
				"Interface\\AddOns\\BigWigs_Countdown_Overwatch\\enUS\\Bastion_3.ogg",
				"Interface\\AddOns\\BigWigs_Countdown_Overwatch\\enUS\\Bastion_4.ogg",
				"Interface\\AddOns\\BigWigs_Countdown_Overwatch\\enUS\\Bastion_5.ogg",
			})
		elseif five[k] then
			BigWigsAPI:RegisterCountdown(id, name, {
				path:format(k, 1),
				path:format(k, 2),
				path:format(k, 3),
				path:format(k, 4),
				path:format(k, 5),
			})
		else
			BigWigsAPI:RegisterCountdown(id, ("%s [3]"):format(name), {
				path:format(k, 1),
				path:format(k, 2),
				path:format(k, 3),
				false,
				false,
			})
		end
	end
end

local locale = GetLocale()
if not localeMap[locale] then
	locale = "enUS"
end
register(locale)
if locale ~= "enUS" then
	register("enUS")
end
