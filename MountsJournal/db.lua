local mounts = MountsJournal


mounts.mountsDB = setmetatable({
	[6] = {1, 3}, -- 458 | Brown Horse
	[7] = {1, 3}, -- 459 | Gray Wolf
	[8] = {1, 3}, -- 468 | White Stallion
	[9] = {1, 3}, -- 470 | Black Stallion
	[11] = {1, 3}, -- 472 | Pinto
	[12] = {1, 3}, -- 578 | Black Wolf
	[13] = {1, 3}, -- 579 | Red Wolf
	[14] = {1, 3}, -- 580 | Timber Wolf
	[15] = {1, 3}, -- 581 | Winter Wolf
	[17] = {1, 2}, -- 5784 | Felsteed
	[18] = {1, 3}, -- 6648 | Chestnut Mare
	[19] = {1, 3}, -- 6653 | Dire Wolf
	[20] = {1, 3}, -- 6654 | Brown Wolf
	[21] = {1, 3}, -- 6777 | Gray Ram
	[22] = {1, 3}, -- 6896 | Black Ram
	[24] = {1, 3}, -- 6898 | White Ram
	[25] = {1, 3}, -- 6899 | Brown Ram
	[26] = {1, 3}, -- 8394 | Striped Frostsaber
	[27] = {1, 3}, -- 8395 | Emerald Raptor
	[28] = {1, 3}, -- 8980 | Skeletal Horse
	[31] = {1, 3}, -- 10789 | Spotted Frostsaber
	[34] = {1, 3}, -- 10793 | Striped Nightsaber
	[35] = {1, 3}, -- 10795 | Ivory Raptor
	[36] = {1, 3}, -- 10796 | Turquoise Raptor
	[38] = {1, 3}, -- 10799 | Violet Raptor
	[39] = {1, 3}, -- 10873 | Red Mechanostrider
	[40] = {1, 3}, -- 10969 | Blue Mechanostrider
	[41] = {1, 2}, -- 13819 | Warhorse
	[42] = {1, 3}, -- 15779 | White Mechanostrider Mod B
	[43] = {1, 3}, -- 15780 | Green Mechanostrider
	[45] = {1, 3}, -- 16055 | Black Nightsaber
	[46] = {1, 3}, -- 16056 | Ancient Frostsaber
	[50] = {1, 3}, -- 16080 | Red Wolf
	[51] = {1, 1}, -- 16081 | Winter Wolf
	[52] = {1, 3}, -- 16082 | Palomino
	[53] = {1, 3}, -- 16083 | White Stallion
	[54] = {1, 3}, -- 16084 | Mottled Red Raptor
	[55] = {1, 2}, -- 17229 | Winterspring Frostsaber
	[56] = {1, 3}, -- 17450 | Ivory Raptor
	[57] = {1, 3}, -- 17453 | Green Mechanostrider
	[58] = {1, 3}, -- 17454 | Unpainted Mechanostrider
	[62] = {1, 3}, -- 17459 | Icy Blue Mechanostrider Mod A
	[63] = {1, 3}, -- 17460 | Frost Ram
	[64] = {1, 3}, -- 17461 | Black Ram
	[65] = {1, 3}, -- 17462 | Red Skeletal Horse
	[66] = {1, 3}, -- 17463 | Blue Skeletal Horse
	[67] = {1, 3}, -- 17464 | Brown Skeletal Horse
	[68] = {1, 3}, -- 17465 | Green Skeletal Warhorse
	[69] = {1, 1}, -- 17481 | Rivendare's Deathcharger
	[70] = {1, 3}, -- 18363 | Riding Kodo
	[71] = {1, 3}, -- 18989 | Gray Kodo
	[72] = {1, 3}, -- 18990 | Brown Kodo
	[73] = {1, 3}, -- 18991 | Green Kodo
	[74] = {1, 3}, -- 18992 | Teal Kodo
	[83] = {1, 2}, -- 23161 | Dreadsteed
	[84] = {1, 2}, -- 23214 | Charger
	[85] = {1, 3}, -- 23219 | Swift Mistsaber
	[87] = {1, 3}, -- 23221 | Swift Frostsaber
	[88] = {1, 3}, -- 23222 | Swift Yellow Mechanostrider
	[89] = {1, 3}, -- 23223 | Swift White Mechanostrider
	[90] = {1, 3}, -- 23225 | Swift Green Mechanostrider
	[91] = {1, 3}, -- 23227 | Swift Palomino
	[92] = {1, 3}, -- 23228 | Swift White Steed
	[93] = {1, 3}, -- 23229 | Swift Brown Steed
	[94] = {1, 3}, -- 23238 | Swift Brown Ram
	[95] = {1, 3}, -- 23239 | Swift Gray Ram
	[96] = {1, 3}, -- 23240 | Swift White Ram
	[97] = {1, 3}, -- 23241 | Swift Blue Raptor
	[98] = {1, 3}, -- 23242 | Swift Olive Raptor
	[99] = {1, 3}, -- 23243 | Swift Orange Raptor
	[100] = {1, 3}, -- 23246 | Purple Skeletal Warhorse
	[101] = {1, 3}, -- 23247 | Great White Kodo
	[102] = {1, 3}, -- 23248 | Great Gray Kodo
	[103] = {1, 3}, -- 23249 | Great Brown Kodo
	[104] = {1, 3}, -- 23250 | Swift Brown Wolf
	[105] = {1, 3}, -- 23251 | Swift Timber Wolf
	[106] = {1, 3}, -- 23252 | Swift Gray Wolf
	[107] = {1, 3}, -- 23338 | Swift Stormsaber
	[108] = {1, 3}, -- 23509 | Frostwolf Howler
	[109] = {1, 3}, -- 23510 | Stormpike Battle Charger
	[110] = {1, 1}, -- 24242 | Swift Razzashi Raptor
	[111] = {1, 1}, -- 24252 | Swift Zulian Tiger
	[116] = {1, 1}, -- 25863 | Black Qiraji Battle Tank
	[117] = {1, 1}, -- 25953 | Blue Qiraji Battle Tank
	[118] = {1, 1}, -- 26054 | Red Qiraji Battle Tank
	[119] = {1, 1}, -- 26055 | Yellow Qiraji Battle Tank
	[120] = {1, 1}, -- 26056 | Green Qiraji Battle Tank
	[121] = {1, 1}, -- 26655 | Black Qiraji Battle Tank
	[122] = {1, 1}, -- 26656 | Black Qiraji Battle Tank
	[145] = {1, 3}, -- 33630 | Blue Mechanostrider
	[75] = {2, 3}, -- 22717 | Black War Steed
	[76] = {2, 3}, -- 22718 | Black War Kodo
	[77] = {2, 3}, -- 22719 | Black Battlestrider
	[78] = {2, 3}, -- 22720 | Black War Ram
	[79] = {2, 3}, -- 22721 | Black War Raptor
	[80] = {2, 3}, -- 22722 | Red Skeletal Warhorse
	[81] = {2, 3}, -- 22723 | Black War Tiger
	[82] = {2, 3}, -- 22724 | Black War Wolf
	[123] = {2, 3}, -- 28828 | Nether Drake
	[125] = {2, 9}, -- 30174 | Riding Turtle
	[129] = {2, 3}, -- 32235 | Golden Gryphon
	[130] = {2, 3}, -- 32239 | Ebon Gryphon
	[131] = {2, 3}, -- 32240 | Snowy Gryphon
	[132] = {2, 3}, -- 32242 | Swift Blue Gryphon
	[133] = {2, 3}, -- 32243 | Tawny Wind Rider
	[134] = {2, 3}, -- 32244 | Blue Wind Rider
	[135] = {2, 1}, -- 32245 | Green Wind Rider
	[136] = {2, 3}, -- 32246 | Swift Red Wind Rider
	[137] = {2, 3}, -- 32289 | Swift Red Gryphon
	[138] = {2, 3}, -- 32290 | Swift Green Gryphon
	[139] = {2, 3}, -- 32292 | Swift Purple Gryphon
	[140] = {2, 3}, -- 32295 | Swift Green Wind Rider
	[141] = {2, 3}, -- 32296 | Swift Yellow Wind Rider
	[142] = {2, 3}, -- 32297 | Swift Purple Wind Rider
	[146] = {2, 3}, -- 33660 | Swift Pink Hawkstrider
	[147] = {2, 3}, -- 34406 | Brown Elekk
	[149] = {2, 2}, -- 34767 | Thalassian Charger
	[150] = {2, 2}, -- 34769 | Thalassian Warhorse
	[151] = {2, 3}, -- 34790 | Dark War Talbuk
	[152] = {2, 3}, -- 34795 | Red Hawkstrider
	[153] = {2, 3}, -- 34896 | Cobalt War Talbuk
	[154] = {2, 3}, -- 34897 | White War Talbuk
	[155] = {2, 3}, -- 34898 | Silver War Talbuk
	[156] = {2, 3}, -- 34899 | Tan War Talbuk
	[157] = {2, 3}, -- 35018 | Purple Hawkstrider
	[158] = {2, 3}, -- 35020 | Blue Hawkstrider
	[159] = {2, 3}, -- 35022 | Black Hawkstrider
	[160] = {2, 3}, -- 35025 | Swift Green Hawkstrider
	[161] = {2, 3}, -- 35027 | Swift Purple Hawkstrider
	[162] = {2, 3}, -- 35028 | Swift Warstrider
	[163] = {2, 3}, -- 35710 | Gray Elekk
	[164] = {2, 3}, -- 35711 | Purple Elekk
	[165] = {2, 3}, -- 35712 | Great Green Elekk
	[166] = {2, 3}, -- 35713 | Great Blue Elekk
	[167] = {2, 3}, -- 35714 | Great Purple Elekk
	[168] = {2, 1}, -- 36702 | Fiery Warhorse
	[169] = {2, 6}, -- 37015 | Swift Nether Drake
	[170] = {2, 3}, -- 39315 | Cobalt Riding Talbuk
	[171] = {2, 3}, -- 39316 | Dark Riding Talbuk
	[172] = {2, 3}, -- 39317 | Silver Riding Talbuk
	[173] = {2, 3}, -- 39318 | Tan Riding Talbuk
	[174] = {2, 3}, -- 39319 | White Riding Talbuk
	[176] = {2, 3}, -- 39798 | Green Riding Nether Ray
	[177] = {2, 3}, -- 39800 | Red Riding Nether Ray
	[178] = {2, 3}, -- 39801 | Purple Riding Nether Ray
	[179] = {2, 3}, -- 39802 | Silver Riding Nether Ray
	[180] = {2, 3}, -- 39803 | Blue Riding Nether Ray
	[183] = {2, 1}, -- 40192 | Ashes of Al'ar
	[185] = {2, 1}, -- 41252 | Raven Lord
	[186] = {2, 2}, -- 41513 | Onyx Netherwing Drake
	[187] = {2, 2}, -- 41514 | Azure Netherwing Drake
	[188] = {2, 2}, -- 41515 | Cobalt Netherwing Drake
	[189] = {2, 2}, -- 41516 | Purple Netherwing Drake
	[190] = {2, 2}, -- 41517 | Veridian Netherwing Drake
	[191] = {2, 2}, -- 41518 | Violet Netherwing Drake
	[199] = {2, 1}, -- 43688 | Amani War Bear
	[201] = {2, 7}, -- 43899 | Brewfest Ram
	[202] = {2, 1}, -- 43900 | Swift Brewfest Ram
	[203] = {2, 3}, -- 43927 | Cenarion War Hippogryph
	[204] = {2, 4}, -- 44151 | Turbo-Charged Flying Machine
	[205] = {2, 4}, -- 44153 | Flying Machine
	[206] = {2, 6}, -- 44317 | Merciless Nether Drake
	[207] = {2, 6}, -- 44744 | Merciless Nether Drake
	[213] = {2, 1}, -- 46628 | Swift White Hawkstrider
	[219] = {2, 1}, -- 48025 | Headless Horseman's Mount
	[220] = {2, 3}, -- 48027 | Black War Elekk
	[223] = {2, 6}, -- 49193 | Vengeful Nether Drake
	[226] = {2, 1}, -- 49379 | Great Brewfest Kodo
	[241] = {2, 3}, -- 58615 | Brutal Nether Drake
	[243] = {2, 8}, -- 58983 | Big Blizzard Bear
	[293] = {2, 1}, -- 62048 | Black Dragonhawk Mount
	[1761] = {2, 8}, -- 348459 | Reawakened Phase-Hunter
	[196] = {3, 9}, -- 42776 | Spectral Tiger
	[197] = {3, 9}, -- 42777 | Swift Spectral Tiger
	[211] = {3, 9}, -- 46197 | X-51 Nether-Rocket
	[212] = {3, 9}, -- 46199 | X-51 Nether-Rocket X-TREME
	[221] = {3, 3}, -- 48778 | Acherus Deathcharger
	[225] = {3, 7}, -- 49378 | Brewfest Riding Kodo
	[230] = {3, 9}, -- 51412 | Big Battle Bear
	[236] = {3, 3}, -- 54729 | Winged Steed of the Ebon Blade
	[237] = {3, 1}, -- 54753 | White Polar Bear
	[240] = {3, 4}, -- 55531 | Mechano-Hog
	[246] = {3, 1}, -- 59567 | Azure Drake
	[247] = {3, 1}, -- 59568 | Blue Drake
	[248] = {3, 1}, -- 59569 | Bronze Drake
	[249] = {3, 3}, -- 59570 | Red Drake
	[250] = {3, 1}, -- 59571 | Twilight Drake
	[251] = {3, 3}, -- 59572 | Black Polar Bear
	[253] = {3, 1}, -- 59650 | Black Drake
	[254] = {3, 3}, -- 59785 | Black War Mammoth
	[255] = {3, 3}, -- 59788 | Black War Mammoth
	[256] = {3, 3}, -- 59791 | Wooly Mammoth
	[257] = {3, 3}, -- 59793 | Wooly Mammoth
	[258] = {3, 3}, -- 59797 | Ice Mammoth
	[259] = {3, 3}, -- 59799 | Ice Mammoth
	[262] = {3, 6}, -- 59961 | Red Proto-Drake
	[263] = {3, 3}, -- 59976 | Black Proto-Drake
	[264] = {3, 1}, -- 59996 | Blue Proto-Drake
	[265] = {3, 1}, -- 60002 | Time-Lost Proto-Drake
	[266] = {3, 6}, -- 60021 | Plagued Proto-Drake
	[267] = {3, 6}, -- 60024 | Violet Proto-Drake
	[268] = {3, 6}, -- 60025 | Albino Drake
	[269] = {3, 3}, -- 60114 | Armored Brown Bear
	[270] = {3, 3}, -- 60116 | Armored Brown Bear
	[271] = {3, 6}, -- 60118 | Black War Bear
	[272] = {3, 6}, -- 60119 | Black War Bear
	[273] = {3, 3}, -- 60136 | Grand Caravan Mammoth
	[274] = {3, 3}, -- 60140 | Grand Caravan Mammoth
	[275] = {3, 4}, -- 60424 | Mekgineer's Chopper
	[276] = {3, 3}, -- 61229 | Armored Snowy Gryphon
	[277] = {3, 3}, -- 61230 | Armored Blue Wind Rider
	[278] = {3, 1}, -- 61294 | Green Proto-Drake
	[279] = {3, 4}, -- 61309 | Magnificent Flying Carpet
	[280] = {3, 3}, -- 61425 | Traveler's Tundra Mammoth
	[284] = {3, 3}, -- 61447 | Traveler's Tundra Mammoth
	[285] = {3, 4}, -- 61451 | Flying Carpet
	[286] = {3, 1}, -- 61465 | Grand Black War Mammoth
	[287] = {3, 1}, -- 61467 | Grand Black War Mammoth
	[288] = {3, 3}, -- 61469 | Grand Ice Mammoth
	[289] = {3, 3}, -- 61470 | Grand Ice Mammoth
	[291] = {3, 6}, -- 61996 | Blue Dragonhawk
	[292] = {3, 6}, -- 61997 | Red Dragonhawk
	[294] = {3, 3}, -- 63232 | Stormwind Steed
	[295] = {3, 3}, -- 63635 | Darkspear Raptor
	[296] = {3, 3}, -- 63636 | Ironforge Ram
	[297] = {3, 3}, -- 63637 | Darnassian Nightsaber
	[298] = {3, 3}, -- 63638 | Gnomeregan Mechanostrider
	[299] = {3, 3}, -- 63639 | Exodar Elekk
	[300] = {3, 3}, -- 63640 | Orgrimmar Wolf
	[301] = {3, 3}, -- 63641 | Thunder Bluff Kodo
	[302] = {3, 3}, -- 63642 | Silvermoon Hawkstrider
	[303] = {3, 3}, -- 63643 | Forsaken Warhorse
	[304] = {3, 1}, -- 63796 | Mimiron's Head
	[305] = {3, 3}, -- 63844 | Argent Hippogryph
	[306] = {3, 6}, -- 63956 | Ironbound Proto-Drake
	[307] = {3, 6}, -- 63963 | Rusted Proto-Drake
	[308] = {3, 3}, -- 64656 | Blue Skeletal Warhorse
	[309] = {3, 3}, -- 64657 | White Kodo
	[310] = {3, 3}, -- 64658 | Black Wolf
	[311] = {3, 2}, -- 64659 | Venomhide Ravasaur
	[312] = {3, 4}, -- 64731 | Sea Turtle
	[313] = {3, 3}, -- 64927 | Deadly Gladiator's Frost Wyrm
	[314] = {3, 3}, -- 64977 | Black Skeletal Horse
	[317] = {3, 3}, -- 65439 | Furious Gladiator's Frost Wyrm
	[318] = {3, 3}, -- 65637 | Great Red Elekk
	[319] = {3, 3}, -- 65638 | Swift Moonsaber
	[320] = {3, 3}, -- 65639 | Swift Red Hawkstrider
	[321] = {3, 3}, -- 65640 | Swift Gray Steed
	[322] = {3, 3}, -- 65641 | Great Golden Kodo
	[323] = {3, 3}, -- 65642 | Turbostrider
	[324] = {3, 3}, -- 65643 | Swift Violet Ram
	[325] = {3, 3}, -- 65644 | Swift Purple Raptor
	[326] = {3, 3}, -- 65645 | White Skeletal Warhorse
	[327] = {3, 3}, -- 65646 | Swift Burgundy Wolf
	[328] = {3, 9}, -- 65917 | Magic Rooster
	[329] = {3, 3}, -- 66087 | Silver Covenant Hippogryph
	[330] = {3, 3}, -- 66088 | Sunreaver Dragonhawk
	[331] = {3, 3}, -- 66090 | Quel'dorei Steed
	[332] = {3, 3}, -- 66091 | Sunreaver Hawkstrider
	[333] = {3, 9}, -- 66122 | Magic Rooster
	[334] = {3, 9}, -- 66123 | Magic Rooster
	[335] = {3, 9}, -- 66124 | Magic Rooster
	[336] = {3, 3}, -- 66846 | Ochre Skeletal Warhorse
	[337] = {3, 3}, -- 66847 | Striped Dawnsaber
	[338] = {3, 3}, -- 66906 | Argent Charger
	[340] = {3, 6}, -- 67336 | Relentless Gladiator's Frost Wyrm
	[341] = {3, 3}, -- 67466 | Argent Warhorse
	[342] = {3, 3}, -- 68056 | Swift Horde Wolf
	[343] = {3, 3}, -- 68057 | Swift Alliance Steed
	[344] = {3, 6}, -- 68187 | Crusader's White Warhorse
	[345] = {3, 6}, -- 68188 | Crusader's Black Warhorse
	[349] = {3, 1}, -- 69395 | Onyxian Drake
	[352] = {3, 1}, -- 71342 | X-45 Heartbreaker
	[358] = {3, 6}, -- 71810 | Wrathful Gladiator's Frost Wyrm
	[363] = {3, 1}, -- 72286 | Invincible
	[364] = {3, 6}, -- 72807 | Icebound Frostbrood Vanquisher
	[365] = {3, 6}, -- 72808 | Bloodbathed Frostbrood Vanquisher
	[366] = {3, 2}, -- 73313 | Crimson Deathcharger
	[371] = {3, 9}, -- 74856 | Blazing Hippogryph
	[372] = {3, 9}, -- 74918 | Wooly White Rhino
	[375] = {3, 4}, -- 75596 | Frosty Flying Carpet
	[376] = {3, 10}, -- 75614 | Celestial Steed
	[1758] = {3, 4}, -- 61442 | Swift Mooncloth Carpet
	[1759] = {3, 4}, -- 61444 | Swift Shadoweave Carpet
	[1760] = {3, 4}, -- 61446 | Swift Spellfire Carpet
	[1762] = {3, 8}, -- 372677 | Kalu'ak Whalebone Glider
	[1763] = {3, 9}, -- 387308 | Magic Rooster
	[1764] = {3, 9}, -- 387311 | X-51 Nether-Rocket X-TREME
	[1765] = {3, 9}, -- 387319 | Big Battle Bear
	[1766] = {3, 9}, -- 387320 | Blazing Hippogryph
	[1767] = {3, 9}, -- 387321 | Wooly White Rhino
	[1768] = {3, 9}, -- 387323 | X-51 Nether-Rocket
	[1769] = {3, 10}, -- 388516 | Hao-Yue, River Foreseer
	[1770] = {3, 8}, -- 394209 | Festering Emerald Drake
	[1807] = {3, 8}, -- 423869 | Avatar of Flame
	[1823] = {3, 6}, -- 55164 | Swift Spectral Gryphon
	[1832] = {3, 8}, -- 416158 | Nightmarish Emerald Drake
}, {
	__index = function(self, key)
		self[key] = {tonumber(GetBuildInfo():match("(.-)%.")), 0}
		return self[key]
	end
})