# DBM - Dungeons, Delves, & Events

## [r136](https://github.com/DeadlyBossMods/DBM-Dungeons/tree/r136) (2024-07-08)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Dungeons/compare/r135...r136) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Dungeons/releases)

- Update DBM-Delves-WarWithin\_Mainline.toc (#225)  
- Update DBM-Party-WarWithin\_Mainline.toc (#226)  
- Push reworked Shadowcrown mod that now handles spell queuing with a hard coded table (based on limited number of logs, if it proves inaccurate, a backup method is also already coded)  
- Enable trash warnings to force enable on Bromach and treemouth since those bosses are often pulled with trash  
- Rework Dungeon Rashanan to vastly improve timer accuracy by accounting for all ability true CDs, and all ability interactive CDs (spell queuing from ICDs). this should result in extremely precise (but jarring) auto correct code that only extends CDs where appropriate.  
    Also fixed Stage 2 detection, since event I was using was removed.  
- Significantly improve accuracy of Anub'Ikkaj with auto correcting timers that handle bosses overly annoying spell queue ICDs  
- Flag DBM mods as current on 11.0.2 (in addition to 11.0.0)  
