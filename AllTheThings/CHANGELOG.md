# AllTheThings

## [4.0.12](https://github.com/DFortun81/AllTheThings/tree/4.0.12) (2024-09-08)
[Full Changelog](https://github.com/DFortun81/AllTheThings/compare/4.0.11...4.0.12) [Previous Releases](https://github.com/DFortun81/AllTheThings/releases)

- let me parse again just incase  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
    * 'master' of https://github.com/DFortun81/AllTheThings:  
      Sort patron work order reward  
- parse mkay  
- Sort patron work order reward  
- But like, correctly this time  
- Sweep some last minute retail errors  
- TWW/Khaz Algar: Additional "Stay awhile" event during "Against the Current" quest chain  
    Re-arranged the order of Alleria's "Stay awhile" event during "Against the Current" quest chain  
    Started commenting out where a certain quest needs to be accepted or completed in order for "Stay awhile" to be available to player (for internal use).  
    Corrected some coordinates  
- Engineering First Crafts are nearly all different.  
- Added more Aspirant's Tribute questIDs.  
- Fixes VSC error  
- Retail errors  
- The Explorers (quest) is actually level 83.  
- Retail: contribute - now ignores checking coords for shared quests  
- Borean Tundra: Unborn Val'kyr  
- TWW/Azj-Kahet: Correct "Weaving Supplies" objectID, add cost, and add supporting Threads for it  
    Clean-up treasure drops  
    Remove currencies from drops  
    Add Kej as a zone drop  
    Add Pilfered Loot (shares spawn points with Stashed Loot and they alternate)  
- The Winterfin murlocs also can drop the clams.  
- Added Winterfin Clam's object data.  
- Tonraq's npc ID changed after 7.3.5.  
- Added Ethereum Prison.  
- Retail: /att contribute no longer checks quest coords when started from an Item (also a bit more debug prints so people using it can show me better feedback about issues of wrong/bad reports etc.)  
- TWW/Azj-Kahet: Correct coordinates for quest givers and treasures (Part 4)  
    Gossip option for Alleria's "Stay awhile" at the end of the campaign appears when you accept "What We Still Have"  
    Add two vendors, Tulumun and Tyro Uwe  
    Add a general "area" coordinate and notes for Snuffling related quest items  
    Correct Renown requirements for two quests  
    Unsort one quest reward  
- 11.0.0-11.0.5: Mounts Sorting  
- Corrected coords for 2 profession treasures.  
- TWW/Azj-Kahet: Correct the order of Anduin's "Stay awhile" event  
    Gossip option becomes available after you take both "Like a Spider on the Wall" and "Rewriting the Rewritten" quests  
- 10.2.7-11.0.5: Pet Sorting  
- Fixed Undermoth and Gummi  
- 11.0.2-11.0.5: Toys Unsorted Sorting  
- Broad sorting through of 11.0.5  
- Fixing some SL HQTs headers from yesterday.  
    Removed empty Hallowfall fishing derby HQT header.  
    Fixed First Craft of Potion Bomb of Speed.  
- Adjust some Isle of Dorn quests, add Adelgonn stay awhile and expand Moira stay awhile  
- Retail: missing ore hqt, fixed coords for spider quest and for forgotten memorial  
- Misc fixes  
- added meraldar fishing derby quests as uncollectible under quests & attached a name to them.  
    they remain uncollectible as they are HQT, however if you wish you can now look at them via debug mode  
- Update Cata and Wrath factionIDs to use constants for those missing, catch missed conversions  
- create comma issue, fix comma issue (reparsed in additon)  
- this settings.json >\_<  
- Retail: Hillhelm Family is weekly, added missing quests and fixed general treasure  questID  
- Update WoD and MoP factionIDs to use constants for those missing, add Brann Bronzebeard rep, catch missed conversions  
- Using the name() function everywhere instead of manual 'type' field assignment  
- Cleaned up a bunch of CharacterUnlock Items which were erroneously assigned this Type due to having a questID attached directly originally. These have been re-structured into hopefully an understandable representation of how they interact with the original questID's.  
    Tiragarde Sound Treasures are no longer under Achievements. They've overstayed their 18 month vacation from their proper Treasures category  
- nyi fix  
- More account wide quests detected  
- TWW/Azj-Kahet: Correct coordinates for quest givers and treasures (Part 3)  
    Add Anub'okki vendor items  
- Retail: Expose RequestLoadQuestByID when Debugging  
    Retail: Fixed a possible cost logic for determining blocked parent group  
- Update some garrison questgivers  
- Add Family Battler achievement and fix missing criteria  
- Add two pet battle achievements and some retroactive achievement rewards  
- Generating Missing Files  
- Refactored the Item DB (used by Classic builds) to reside in the Item DB folder with the rest of the stuff.  
- Moved the Item Database Consolidator to the tools folder.  
- Correcting few typos.  
- Huge Shadowlands HQTs consolidation part 1.  
    Sorted many of them to the correct files + timelined all.  
- Retail: Fixed infinite loop for contributor reports  
    Retail: Revised coord checking for quests which are nested directly under an NPC (unusual situation)  
- rebuild as release.  
- You can now once again be lazy and run parser directly.  
- Harvested Skill Level Requirements.  
- Renamed the Spells Learned At tool to Skill Level Requirements and split up the output file by expansion.  
- Refactored the Spells Learned At file to the Skill Level Requirements folder.  
- Retail: Contributor report data should no longer duplicate fields applied by different checks  
- TWW/Azj-Kahet: Correct coordinates for quest givers and treasures (Part 2)  
    Removed commendations from Treasures as they are looted only once per account  
    Symlinked 2 vendors in Azj-Kahet to a vendor in Hallowfall  
- Add DF Vicious mounts to the saddle vendors  
- Moved the Spell Learned At tool to the .tools folder to cleanup the Parser folder a bit more.  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
- Fix Isle of Dorn bonus objective coordinates  
- Merge branch 'master' of https://github.com/DFortun81/AllTheThings  
- Parser: Fixed a logic gap where Achievement Criteria were still being thrown into the Unsorted Void and disappearing from the Main list  
    Added a bunch of Sourceless quests which are required by Criteria and will be sorted in the future  
- Added some template build configurations for Classic WOD through TWW.  
- Add new Mage polymorph quest, sweep some retail errors  
- Merge pull request #1775 from NORPG/master  
    localization: add zhTW on no-retail TOC  
- localization: add zhTW on no-retail TOC  
    add tw.lua on no-retail TOC  
- Added a new dynamic object.  
- Moved the parser config files into a .config file to try to clean up the root Parser folder a bit.  
- Reparsed all DBs  
- Added TW as a distinct locale in the LocalizationDB. Also now forcing the locales to be sorted a particular order on export.  
- Retail: Contributor report dialogs now have tenth-rounded player coords & adjusted report layout slightly  
- Player Coords is now rounded instead of floored  
    Coordinate display is now rounded instead of floored (nearly all are already stored with tenths precision anyway)  
- Added 'app.round' function  
- Merge pull request #1774 from NORPG/master  
    Localization: Separate zhCN and zhTW translation  
- TWW/Delves: Add HQT for Delver's Call: Spiral Weave turn in  
- add zhTW localization file  
    add tw.lua  
    Most strings are translated by cn.lua  
- remove zhTW on zhCN  
    remove zhTW localization string on cn.lua  
- Fixed map of jewelcrafting treasure.  
- added more spacing for catalyst description  
- Moved Severed Threads Pact treasures to its file + added few questIDs.  
- Sorting Recipes  
- Harvest: 11.0.5.56487  
- Harvest: 11.0.2.56461  
- Harvest: 4.4.1.56464  
- Harvest: 1.15.4.56493  
- Retail: Added a WIP Contributor module which provides some report handling and Quest data checking (coords & quest giver). (Auto-accept/turn-in addons may cause the functionality to be skipped since the in-game quest dialogs need to show for ATT to capture the details for verification)  
- Retail: When toggling /att contribute, additional event hooks will now be attached/removed as needed  
- Moved distance to app.distance  
    Moved GetPlayerPosition to app.GetPlayerPosition within Maps.lua (also removed the IsInInstance exclusion since some 'instances' still return valid coords)  
- Another Beledar's Spawn coord  
- Another delve quest  
    Added coords for Attention-Getter  
- unfiltered pvp toy for now  
- more global note  
- cloan ensemble note  
- Update Legion and Brawler's Guild  factionIDs to use constants for those missing, catch missed conversions  
- Add constants for Dracthyr racial factionIDs, Keg Leg's Crew, and update some missed conversions + lurker drop  
- Update BFA factionIDs to use constants for those missing  
- Found another new Delve quest  
- Update Shadowland factionIDs to use constants for those missing  
- Update CharacterItemDB with Fated/Awakened Raid TPs  
- Update characteritemdb to log M+ teleports  
- Removed rune of hysteria with release of 11.0.0  
- Moved one group of DF achievement HQTs.  
- Sweep some retail errors, update and add some Severed Threads quests  
- Retail: Make Sourceless description less bloaty in categories  
- Almost done with DF HQTs sorting.  
    Removed useless Sourceless root in Build NYI file.  
    Added one more quest version for starting The Harbinger questline.  
- ADDED instead of CREATED. We don't want these things to be marked as NYI.  
- Re-sorted all stuff in Sourceless into expansions, patches and timelines.  
- Made a new section / header for Sourceless stuff under /att unsorted.  
- CTRL + Backspace is dangerous  
- Sort some items, add a FirstCraft  
- Fixed wrong maps on profession treasures.  
    Fixed Engineering First Craft.  
- TWW/Azj-Kahet: Correct coordinates for quest givers and treasures (Part 1)  
- Retail: Tailoring first crafts, mostly  
- Added Tailoring First Crafts.  
    Added Delve HQTs.  
    Added 'Cooking With Style' quest HQT.  
    Added Savered Threads Pact quest.  
- Revised some Dynamic Category logic  
    Fixed Simple Dynamic Professions not generating properly  
    Fixed an issue where saved Debugger data would cause display errors when being loaded again in game  
- Another uncollectible  
- Fix handful of humming shinies  
- Moved delve quest to delve  
- New Delve quest showed up for Earthcrawl Mines  
- Sort some rare drops and missing quests  
- Add Bountiful Delve HQTs, adjust Thimble notes  
- Minor fixes and retail sorting  
- Move some collected NYI quests to sourceless  
- Harvested sources.  
- Add Gummi and adjust some descriptions  
- TWW/Hallowfall: Correct some coordinates and update descriptions for the sake of consistency  
- Added missing Flight Path in Hellfire Peninsula.  
    Added one Alchemy First Craft.  
    Added Big Candle quest reward.  
- Retail: Added a little toggle which allows someone to mark themselves as 'Contributor' in their ATT to allow for additional data-checking and reportable information to help crowd-source more niche discrepancies over time. Use `/att contribute` to toggle this setting (persists through reloads)  
- Parsed again  
- Retail: Reeeee flightpath TOC  
- Blossoming Delight exists as a quest and is an achievement criteria, but does it even really exist outside of beta?  
- Migrated Flight Path lib to separate file  
    Improved & consolidated some Flight Path logic  
    Added some logic for the Contributor flag for Flight Paths missing in ATT which are available on the map  
    Report audio always plays if Contributor flag is set  
- Earthen-only transmogs that can be collected added to the quests you get them from (someone please help me address the duplication).  
- Removed questID from Strange Eggs.  
    Transfering between accounts actually changes guid.  
- DmF: 8.2.5 Darkmoon Top Hat  
- Sorted few quests and added a new one + treasure questID.  
- TWW: Sort some unsorted items  
- Machine-Warden's Cog comes from Awakened Cache  
- Fixed LFR Devouring Cold (need harvest)  
- Fix a set of Thimble coords, add some quests  
- Updated timeline to 10.2.7  
- Included symlink for Gaal in the Exodar as an alternate vendor  
- Sort a JC item and fix some quest data  
- Update LocalizationDB.lua  
- Add Phoenix Wishwing fake objects to DB  
- More localization  
- more objects  
- Objects!  
- Dynamic Object Files cleanup  
- First pass at adding debug notes for Phoenix Wishing secret  
