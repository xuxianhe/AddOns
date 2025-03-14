if GetLocale() ~= "zhTW" then
    return
end

local L = LibStub("AceLocale-3.0"):NewLocale("GSE", "zhTW")

-- Options translation
L["  The Alternative ClassID is "] = "其他的職業ID"
L[" Deleted Orphaned Macro "] = "刪除未被使用的巨集"
L[" from "] = "來自"
L[" has been added as a new version and set to active.  Please review if this is as expected."] = "已經增加為新版本並設置為啟用。請檢查以確保這是你預期的設置。"
L[" is not available.  Unable to translate sequence "] = "無法使用。無法翻譯該序列"
L[" macros per Account.  You currently have "] = "帳號內巨集。你目前已有"
L[" macros per character.  You currently have "] = "角色內巨集。你目前已有"
L[" saved as version "] = "保存至版本"
L[" sent"] = "發送"
L[" tried to overwrite the version already loaded from "] = "試圖覆蓋已經加載的版本"
L[" was imported as a new macro."] = "導入為新的巨集。"
L[" was imported with the following errors."] = "導入時出現以下錯誤。"
L[" was updated to new version."] = "已更新為新版本。"
--[[Translation missing --]]
L["%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."] = "%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."
L["%sMACRO VALIDATION ERROR|r - PostMacro found with invalid LoopLimit.  PostMacro will not be saved for version %s"] = "%sMACRO VALIDATION ERROR|r - PostMacro 發現無效的 LoopLimit. PostMacro 將不會儲存此版本 %s"
L[". This version was not loaded."] = "。此版本尚未載入。"
--[[Translation missing --]]
L["/gse checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."] = "/gse checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."
--[[Translation missing --]]
L["/gse cleanorphans|r will loop through your macros and delete any left over GSE macros that no longer have a sequence to match them."] = "/gse cleanorphans|r will loop through your macros and delete any left over GSE macros that no longer have a sequence to match them."
--[[Translation missing --]]
L["/gse help|r to get started."] = "/gse help|r to get started."
--[[Translation missing --]]
L["/gse showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = "/gse showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."
--[[Translation missing --]]
L["/gse|r again."] = "/gse|r again."
--[[Translation missing --]]
L["/gse|r to get started."] = "/gse|r to get started."
--[[Translation missing --]]
L["/gse|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = "/gse|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."
L[":|r To get started "] = ":|r 獲取上手指南"
L[":|r You cannot delete the only copy of a sequence."] = ":|r 你不能刪除序列的唯一副本."
L[":|r Your current Specialisation is "] = ":|r 你現在的專精是"
L["|r Incomplete Sequence Definition - This sequence has no further information "] = "|r 不完整序列定義 - 此序列沒有其他信息"
L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = "|r. 此巨集未創建. 請刪除一些巨集並重新輸入"
L["|r.  You can also have a  maximum of "] = "|r. 同時你最多可以擁有"
L["<DEBUG> |r "] = "<DEBUG> |r "
L["<SEQUENCEDEBUG> |r "] = "<SEQUENCEDEBUG> |r "
L[ [=[A pause can be measured in either clicks or seconds.  It will either wait 5 clicks or 1.5 seconds.
If using seconds, you can also wait for the GCD by entering ~~GCD~~ into the box.]=] ] = "一個暫停可以用按鍵數或秒數來測量。它將會等待 5 次點擊或是 1.5 秒的時間。假如使用秒數，你也可以在編輯裡使用 ~~GCD~~ 等待一個 GCD 時間。"
L["A sequence collision has occured. "] = "發生了一個序列衝突."
L["A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "] = "發生了一個序列衝突. 已加載此巨集的其他版本. 管理序列器以確認如何使用它們"
L["A sequence collision has occured.  Your local version of "] = "發生了一個序列衝突. 你的本地版本"
L["About"] = "關於"
L["About GSE"] = "關於 GSE"
--[[Translation missing --]]
L["ActionButtonUseKeyDown"] = "ActionButtonUseKeyDown"
L["Actions"] = "動作"
L["Active Version: "] = "活動版本:"
L["Add a Loop Block."] = "增加一個迴圈區塊。"
L["Add a Pause Block."] = "增加一個暫停區塊。"
L["Add a Repeat Block."] = "增加一個重覆區塊。"
L["Add a substitution variable for this macro.  This can either be a straight string swap or can be a function.  If a lua function the function needs to return a value."] = "增加一個取代變數。這個數可以是簡單的字串交換或是一個函數。假如是一個 lua 函數，那麼這個函數需要傳回一個值。"
L["Add Action"] = "增加動作"
L["Add an Action Block."] = "增加一個動作區塊。"
--[[Translation missing --]]
L["Add an If Block.  If Blocks allow you to shoose between blocks based on the result of a variable that returns a true or false value."] = "Add an If Block.  If Blocks allow you to shoose between blocks based on the result of a variable that returns a true or false value."
--[[Translation missing --]]
L["Add If"] = "Add If"
L["Add Loop"] = "增加迴圈"
L["Add Pause"] = "增加暫停"
L["Add Repeat"] = "增加重覆"
L["Add Variable"] = "增加變數"
L["Add WeakAura"] = "增加 WeakAura"
L["Addin Version %s contained versions for the following macros:"] = "加載版本 %s 包含於以下巨集:"
L["All macros are now stored as upper case names.  You may need to re-add your old macros to your action bars."] = "所有的巨集名稱現在都被儲存為大寫。你也許需要重新添加舊的巨集到快捷列上。"
--[[Translation missing --]]
L["Allow Variable Editor"] = "Allow Variable Editor"
L["Alt Keys."] = "Alt 鍵。"
--[[Translation missing --]]
L["Alwaus use the highest rank of spell available.  This is useful for levelling."] = "Alwaus use the highest rank of spell available.  This is useful for levelling."
--[[Translation missing --]]
L["Always use Max Rank"] = "Always use Max Rank"
L["Any Alt Key"] = "任意 Alt 鍵"
L["Any Control Key"] = "任意 Ctrl 鍵"
L["Any Shift Key"] = "任意 Shift 鍵"
L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."] = "確定要刪除 %s？這將刪除該巨集和其所有版本。本操作將無法被撤銷。"
L["Arena"] = "競技場"
L["Arena setting changed to Default."] = "競技場設置更改為默認."
--[[Translation missing --]]
L["As GSE is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gse cleanorphans"] = "As GSE is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gse cleanorphans"
--[[Translation missing --]]
L["Auras included in GSE Macros"] = "Auras included in GSE Macros"
L["Author"] = "作者"
L["Author Colour"] = "作者顏色"
L["Auto Create Class Macro Stubs"] = "自動創建職業巨集存根"
L["Auto Create Global Macro Stubs"] = "自動創建全局巨集存根"
L["Automatically Create Macro Icon"] = "自動創建巨集圖標"
L["Available Addons"] = "可用插件"
L["Belt"] = "腰帶"
L["Blizzard Functions Colour"] = "暴雪功能顏色"
--[[Translation missing --]]
L["Block Path"] = "Block Path"
L["Block Type: %s"] = "區塊類型：%s"
--[[Translation missing --]]
L["Boolean Functions"] = "Boolean Functions"
--[[Translation missing --]]
L["Boolean Functions are GSE variables that return either a true or false value."] = "Boolean Functions are GSE variables that return either a true or false value."
--[[Translation missing --]]
L["Boolean not found.  There is a problem with %s not returning true or false."] = "Boolean not found.  There is a problem with %s not returning true or false."
L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = "通過設置巨集的圖標為問號, 使巨集在每次按下時變更圖標."
L["By setting this value the Sequence Editor will show every macro for every class."] = "勾選此項,插件將顯示全部職業的全部巨集."
L["By setting this value the Sequence Editor will show every macro for your class.  Turning this off will only show the class macros for your current specialisation."] = "勾選此項,序列編輯器將顯示職業的全部專精的巨集.否則只顯示當前專精的巨集."
L["Cancel"] = "撤銷/取消"
--[[Translation missing --]]
L["Character"] = "Character"
--[[Translation missing --]]
L["Character Specific Options which override the normal account settings."] = "Character Specific Options which override the normal account settings."
L["CheckMacroCreated"] = "檢測已創建巨集"
--[[Translation missing --]]
L["Checks to see if you have a Heart of Azeroth equipped and if so will insert '/cast Heart Essence' into the macro.  If not your macro will skip this line."] = "Checks to see if you have a Heart of Azeroth equipped and if so will insert '/cast Heart Essence' into the macro.  If not your macro will skip this line."
L["Choose import action:"] = "選擇導入動作:"
L["Choose Language"] = "選擇語言"
L["Classwide Macro"] = "職業通用巨集"
L["Clear"] = "清除"
--[[Translation missing --]]
L["Clear Common Keybindings"] = "Clear Common Keybindings"
L["Clear Errors"] = "清除錯誤"
--[[Translation missing --]]
L["Clear Keybindings"] = "Clear Keybindings"
--[[Translation missing --]]
L["Clear Spell Cache"] = "Clear Spell Cache"
--[[Translation missing --]]
L["Clicks"] = "Clicks"
L["Close"] = "關閉"
L["Close to Maximum Macros.|r  You can have a maximum of "] = "接近最大巨集上限.|r 你最多可以有"
L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = "接近最大角色巨集上限.|r 你最多可以有"
L["Colour"] = "顏色"
L["Colour and Accessibility Options"] = "顏色和輔助功能設置"
L["Combat"] = "戰鬥"
L["Command Colour"] = "命令顏色"
--[[Translation missing --]]
L["Common Solutions to game quirks that seem to affect some people."] = "Common Solutions to game quirks that seem to affect some people."
--[[Translation missing --]]
L["Compile"] = "Compile"
--[[Translation missing --]]
L["Compiled"] = "Compiled"
--[[Translation missing --]]
L["Compiled Template"] = "Compiled Template"
L["Completely New GS Macro."] = "全新的GS巨集."
--[[Translation missing --]]
L["Compress"] = "Compress"
--[[Translation missing --]]
L["Compress Sequence from Forums"] = "Compress Sequence from Forums"
L["Conditionals Colour"] = "條件顏色"
L["Configuration"] = "表面配置"
L["Continue"] = "繼續"
L["Contributed by: "] = "貢獻者: "
L["Control Keys."] = "Ctrl鍵."
--[[Translation missing --]]
L["Convert"] = "Convert"
--[[Translation missing --]]
L["Convert this to a GSE3 Template"] = "Convert this to a GSE3 Template"
L["Copy this link and open it in a Browser."] = "複製此鏈接並在瀏覽器中打開它."
--[[Translation missing --]]
L["Copy this link and paste it into a chat window."] = "Copy this link and paste it into a chat window."
L["Create a new macro."] = "創建一個新的巨集."
L["Create buttons for Global Macros"] = "創建全局巨集的按鈕"
L["Create Icon"] = "創建圖標"
L["Create Macro"] = "創建巨集"
L[ [=[Create or remove a Macro stub in /macro that can be dragged to your action bar so that you can use this macro.
GSE can store an unlimited number of macros however WOW's /macro interface can only store a limited number of macros.]=] ] = "在 /巨集 中創建或刪除可以拖動到操作欄的巨集存根.以便您可以使用此巨集. GSE可以存儲無限數量的巨集，但是WOW /巨集 接口只能存儲有限數量的巨集。"
L["Creating New Sequence."] = "創建新序列."
--[[Translation missing --]]
L["Current GCD"] = "Current GCD"
--[[Translation missing --]]
L["Current GCD: %s"] = "Current GCD: %s"
--[[Translation missing --]]
L["CVar Settings"] = "CVar Settings"
L["Debug"] = "調試"
L["Debug Mode Options"] = "調試模式設置"
L["Debug Output Options"] = "調試輸出設置"
L["Debug Sequence Execution"] = "調試序列執行"
--[[Translation missing --]]
L["Decompress"] = "Decompress"
--[[Translation missing --]]
L["Default Debugger Height"] = "Default Debugger Height"
--[[Translation missing --]]
L["Default Debugger Width"] = "Default Debugger Width"
--[[Translation missing --]]
L["Default Editor Height"] = "Default Editor Height"
--[[Translation missing --]]
L["Default Editor Width"] = "Default Editor Width"
L["Default Import Action"] = "默認導入動作"
--[[Translation missing --]]
L["Default Menu Height"] = "Default Menu Height"
--[[Translation missing --]]
L["Default Menu Width"] = "Default Menu Width"
L["Default Version"] = "默認版本"
--[[Translation missing --]]
L["Del"] = "Del"
L["Delete"] = "刪除"
--[[Translation missing --]]
L["Delete Block"] = "Delete Block"
L["Delete Icon"] = "刪除圖標"
L["Delete Orphaned Macros on Logout"] = "登出時刪除獨立的巨集"
--[[Translation missing --]]
L[ [=[Delete this Block from the sequence.  
WARNING: If this is a loop this will delete all the blocks inside the loop as well.]=] ] = [=[Delete this Block from the sequence.  
WARNING: If this is a loop this will delete all the blocks inside the loop as well.]=]
L["Delete this macro.  This is not able to be undone."] = "刪除此巨集。 這是無法取消的。"
--[[Translation missing --]]
L["Delete this variable from the sequence."] = "Delete this variable from the sequence."
L[ [=[Delete this verion of the macro.  This can be undone by closing this window and not saving the change.  
This is different to the Delete button below which will delete this entire macro.]=] ] = "刪除此版本的巨集. 關閉此窗口而不保存更改可以取消此操作. 這與下面的刪除按鈕不同.刪除按鈕將刪除整個巨集。"
--[[Translation missing --]]
L["Delete this WeakAura from the sequence."] = "Delete this WeakAura from the sequence."
--[[Translation missing --]]
L["Delete Variable"] = "Delete Variable"
L["Delete Version"] = "刪除版本"
--[[Translation missing --]]
L["Delete WeakAura"] = "Delete WeakAura"
L["Different helpTxt"] = "不同的幫助腳本"
L["Disable"] = "禁用"
--[[Translation missing --]]
L["Disable Block"] = "Disable Block"
--[[Translation missing --]]
L["Disable Editor"] = "Disable Editor"
L["Disable Sequence"] = "禁用序列"
--[[Translation missing --]]
L["Disable this block so that it is not executed. If this is a container block, like a loop, all the blocks within it will also be disabled."] = "Disable this block so that it is not executed. If this is a container block, like a loop, all the blocks within it will also be disabled."
L["Display debug messages in Chat Window"] = "在聊天窗口中顯示調試信息"
--[[Translation missing --]]
L["Don't Force"] = "Don't Force"
L["Don't Translate Sequences"] = "不要翻譯序列"
L["Drag this icon to your action bar to use this macro. You can change this icon in the /macro window."] = "將此圖標拖到操作欄以使用此巨集. 您可以在 /巨集 窗口中更改此圖標."
--[[Translation missing --]]
L["Dragonflight has changed how the /click command operates.  As a result all your macro stubs (found in /macro) have been updated to match the value of the CVar ActionButtonUseKeyDown.  This is a one off configuration change that needs to be done for each character.  You can change this configuration in GSE's Options."] = "Dragonflight has changed how the /click command operates.  As a result all your macro stubs (found in /macro) have been updated to match the value of the CVar ActionButtonUseKeyDown.  This is a one off configuration change that needs to be done for each character.  You can change this configuration in GSE's Options."
L["Dungeon"] = "地城版本"
--[[Translation missing --]]
L["Dungeon setting changed to Default."] = "Dungeon setting changed to Default."
L["Edit"] = "編輯"
--[[Translation missing --]]
L["Edit Spell Cache"] = "Edit Spell Cache"
--[[Translation missing --]]
L["Edit this macro directly in Lua. WARNING: This may render the macro unable to operate and can crash your Game Session."] = "Edit this macro directly in Lua. WARNING: This may render the macro unable to operate and can crash your Game Session."
L["Edit this macro.  To delete a macro, choose this edit option and then from inside hit the delete button."] = "編輯此巨集. 要刪除巨集.請選擇此編輯選項.然後從內部點擊刪除按鈕."
L["Editor Colours"] = "編輯器顏色"
L["Emphasis Colour"] = "強調顏色"
L["Enable"] = "開啟"
L["Enable Debug for the following Modules"] = "開啟調試給以下模塊"
L["Enable Mod Debug Mode"] = "開啟模塊調試模式"
L["Enable Sequence"] = "開啟巨集"
L["Enable this option to stop automatically translating sequences from enUS to local language."] = "啟用此選項可以停止自動將序列從enUS (英文版本) 轉換為本地語言."
--[[Translation missing --]]
L["Enable timing functions by using Click refresh speed as a pseudo timer."] = "Enable timing functions by using Click refresh speed as a pseudo timer."
--[[Translation missing --]]
L["Enforce GSE minimum version for this macro"] = "Enforce GSE minimum version for this macro"
L["Error found in version %i of %s."] = "版本 %i 在序列 %s 中被發現錯誤."
--[[Translation missing --]]
L["Error processing Custom Pause Value.  You will need to recheck your macros."] = "Error processing Custom Pause Value.  You will need to recheck your macros."
--[[Translation missing --]]
L["Error: Destination path not found."] = "Error: Destination path not found."
--[[Translation missing --]]
L["Error: Source path not found."] = "Error: Source path not found."
--[[Translation missing --]]
L["Error: You cannot move a container to be a child within itself."] = "Error: You cannot move a container to be a child within itself."
L["Export"] = "導出"
L["Export a Sequence"] = "導出序列"
--[[Translation missing --]]
L["Export Macro Read Only"] = "Export Macro Read Only"
L["Export this Macro."] = "導出這個巨集"
L["Extra Macro Versions of %s has been added."] = "額外巨集版本 %s 已被添加."
L["Filter Macro Selection"] = "巨集過濾選擇器"
L["Finished scanning for errors.  If no other messages then no errors were found."] = "完成錯誤掃描.如果沒有其他提示消息,則沒有發現錯誤."
--[[Translation missing --]]
L["FinishReload"] = "Finish Reload"
--[[Translation missing --]]
L["Fix SetBackdrop Nil"] = "Fix SetBackdrop Nil"
--[[Translation missing --]]
L["Force ActionButtonUseKeyDown State"] = "Force ActionButtonUseKeyDown State"
--[[Translation missing --]]
L["Force CVar State"] = "Force CVar State"
L["Format export for WLM Forums"] = "WLM論壇的格式導出"
L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "你不能刪除此版本的序列.這個版本將被重新加載,因為它包含在"
L["Gameplay Options"] = "遊戲選項"
L["General"] = "常規"
L["General Options"] = "常規設置"
--[[Translation missing --]]
L["Get Help"] = "Get Help"
--[[Translation missing --]]
L["Global"] = "Global"
L["Global Macros are those that are valid for all classes.  GSE2 also imports unknown macros as Global.  This option will create a button for these macros so they can be called for any class.  Having all macros in this space is a performance loss hence having them saved with a the right specialisation is important."] = "全局巨集是對所有職業都有效的巨集.GSE2也導入未知的全局巨集.此選項將創建一個按鈕使它們可以被任何職業調用.所有巨集存在這個空間都會有性能損失.因此最好把它們保存在正確的專精下."
--[[Translation missing --]]
L["Gnome Sequencer: Compress a Sequence String."] = "Gnome Sequencer: Compress a Sequence String."
L["Gnome Sequencer: Export a Sequence String."] = "Gnome Sequencer: 輸出序列字符串."
L["Gnome Sequencer: Record your rotation to a macro."] = "Gnome Sequencer: 記錄你的循環到一個巨集."
L["Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"] = "Gnome Sequencer: 序列調試. 監視你的巨集的執行"
L["Gnome Sequencer: Sequence Editor."] = "Gnome Sequencer: 序列編輯器."
L["GnomeSequencer was originally written by semlar of wowinterface.com."] = "GnomeSequencer最初是由wowinterface.com的semlar編寫的."
L["GnomeSequencer-Enhanced"] = "GnomeSequencer-增強"
L["GSE"] = "GSE"
--[[Translation missing --]]
L["GSE - %s's Macros"] = "GSE - %s's Macros"
L["GSE allows plugins to load Macro Collections as plugins.  You can reload a collection by pressing the button below."] = "GSE允許插件加載巨集整合包作為插件. 你可以按下面的按鈕重新加載整合包."
L["GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."] = "GSE有一個LibDataBroker（LDB）數據源. 當在提示這一組源時,列出其他GSE的用戶的版本."
L["GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."] = "GSE有一個LibDataBroker（LDB）數據源.設置此選項可在提示中顯示序列中的戰鬥外事件."
L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."] = "GSE是這個插件的完整的重寫.這允許你創建一個巨集的序列,在按下按鈕時執行."
--[[Translation missing --]]
L["GSE is out of date. You can download the newest version from https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros."] = "GSE is out of date. You can download the newest version from https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros."
L["GSE Macro"] = "GSE 巨集"
--[[Translation missing --]]
L["GSE Macro Stubs have been reset to KeyDown configuration.  The /click command needs to be `/click TEMPLATENAME LeftButton t` (Note the 't' here is required along with the LeftButton.)"] = "GSE Macro Stubs have been reset to KeyDown configuration.  The /click command needs to be `/click TEMPLATENAME LeftButton t` (Note the 't' here is required along with the LeftButton.)"
--[[Translation missing --]]
L["GSE Macro Stubs have been reset to KeyUp configuration.  The /click command needs to be `/click TEMPLATENAME`"] = "GSE Macro Stubs have been reset to KeyUp configuration.  The /click command needs to be `/click TEMPLATENAME`"
--[[Translation missing --]]
L["GSE Plugins"] = "GSE Plugins"
--[[Translation missing --]]
L["GSE Raw Editor"] = "GSE Raw Editor"
--[[Translation missing --]]
L["GSE stores the base spell and asks WoW to use that ability.  WoW will then choose the current version of the spell.  This toggle switches between showing the Base Spell or the Current Spell."] = "GSE stores the base spell and asks WoW to use that ability.  WoW will then choose the current version of the spell.  This toggle switches between showing the Base Spell or the Current Spell."
L["GSE Users"] = "GSE 用戶"
L["GSE Version: %s"] = "GSE 版本: %s"
L[ [=[GSE was originally forked from GnomeSequencer written by semlar.  It was enhanced by TImothyLuke to include a lot of configuration and boilerplate functionality with a GUI added.  The enhancements pushed the limits of what the original code could handle and was rewritten from scratch into GSE.

GSE itself wouldn't be what it is without the efforts of the people who write macros with it.  Check out https://wowlazymacros.com for the things that make this mod work.  Special thanks to Lutechi for creating this community.]=] ] = "GSE最初是由semlar編寫的GnomeSequencer派生的,TImothyLuke對其進行了增強，包括許多配置和样板功能以及添加的GUI。 這些增強功能突破了原始代碼可以處理的限制，並從頭開始重寫為GSE。 如果沒有用它編寫巨集的人的努力，GSE本身就不會是它。 查看https://wowlazymacros.com了解這個mod的工作原理。 特別感謝Lutechi創建這個社區。"
--[[Translation missing --]]
L["GSE: Advanced Macro Compiler loaded.|r  Type "] = "GSE: Advanced Macro Compiler loaded.|r  Type "
--[[Translation missing --]]
L["GSE: Import a Macro String."] = "GSE: Import a Macro String."
L["GSE: Left Click to open the Sequence Editor"] = "GSE: 左鍵單擊以打開序列編輯器"
L["GSE: Middle Click to open the Transmission Interface"] = "GSE: 中鍵單擊以打開傳輸接口"
L["GSE: Right Click to open the Sequence Debugger"] = "GSE: 右鍵單擊以打開序列調試器"
--[[Translation missing --]]
L["GSE2 Retro Importer available."] = "GSE2 Retro Importer available."
--[[Translation missing --]]
L["GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."] = "GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."
--[[Translation missing --]]
L["GSE2 Retro:"] = "GSE2 Retro:"
L["Head"] = "頭部"
L["Help Colour"] = "幫助顏色"
L["Help Information"] = "幫助信息"
L["Help Link"] = "幫助鏈接"
L["Help URL"] = "幫助網址"
L["Heroic"] = "英雄難度"
--[[Translation missing --]]
L["Heroic setting changed to Default."] = "Heroic setting changed to Default."
L["Hide Login Message"] = "隱藏加載信息"
L["Hide Minimap Icon"] = "隱藏迷你地圖標"
L["Hide Minimap Icon for LibDataBroker (LDB) data text."] = "隱藏LibDataBroker（LDB）資料夾的迷你地圖圖標。"
L["Hides the message that GSE is loaded."] = "隱藏GSE加載的信息."
L["History"] = "歷史"
--[[Translation missing --]]
L["How many macro Clicks to pause for?"] = "How many macro Clicks to pause for?"
--[[Translation missing --]]
L["How many milliseconds to pause for?"] = "How many milliseconds to pause for?"
--[[Translation missing --]]
L["How many pixels high should the Debuger start at.  Defaults to 500"] = "How many pixels high should the Debuger start at.  Defaults to 500"
--[[Translation missing --]]
L["How many pixels high should the Editor start at.  Defaults to 700"] = "How many pixels high should the Editor start at.  Defaults to 700"
--[[Translation missing --]]
L["How many pixels high should the Menu start at.  Defaults to 500"] = "How many pixels high should the Menu start at.  Defaults to 500"
--[[Translation missing --]]
L["How many pixels wide should the Debugger start at.  Defaults to 700"] = "How many pixels wide should the Debugger start at.  Defaults to 700"
--[[Translation missing --]]
L["How many pixels wide should the Editor start at.  Defaults to 700"] = "How many pixels wide should the Editor start at.  Defaults to 700"
--[[Translation missing --]]
L["How many pixels wide should the Menu start at.  Defaults to 700"] = "How many pixels wide should the Menu start at.  Defaults to 700"
--[[Translation missing --]]
L["How many seconds to pause for?"] = "How many seconds to pause for?"
--[[Translation missing --]]
L["How many times does this action repeat"] = "How many times does this action repeat"
L["Icon Colour"] = "圖標顏色"
--[[Translation missing --]]
L["If Blocks require a variable that returns either true or false.  Create the variable first."] = "If Blocks require a variable that returns either true or false.  Create the variable first."
--[[Translation missing --]]
L["If Blocks Require a variable."] = "If Blocks Require a variable."
L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = "如果你加載Gnome Sequencer - Enhanced(侏儒序列器-增強) 和Sequence Editor(序列編輯器) 並希望從頭開始創建新的巨集, 這將啟用一個初始序列模板,你可以加載到編輯器作為起點. 它會啟動一個名為Draik01的巨集作為Hellow World巨集. 你需要輸入/console reloadui 之後使之生效."
L["Ignore"] = "忽略"
L["Import"] = "導入"
L["Import Macro from Forums"] = "從論壇導入宏"
L["Imported new sequence "] = "導入新序列"
L["Incorporate the belt slot into the KeyRelease. This is the equivalent of /use [combat] 5 in a KeyRelease."] = "使用腰部在釋放按鍵時. 這等效於 /use [combat] 5 在釋放按鍵時."
L["Incorporate the first ring slot into the KeyRelease. This is the equivalent of /use [combat] 11 in a KeyRelease."] = "使用第一個戒指在釋放按鍵時. 這等效於 /use [combat] 11 在釋放按鍵時."
L["Incorporate the first trinket slot into the KeyRelease. This is the equivalent of /use [combat] 13 in a KeyRelease."] = "使用第一個飾品在釋放按鍵時. 這等效於 /use [combat] 13 在釋放按鍵時."
L["Incorporate the Head slot into the KeyRelease. This is the equivalent of /use [combat] 1 in a KeyRelease."] = "使用頭部在釋放按鍵時. 這等效於 /use [combat] 1在釋放按鍵時."
L["Incorporate the neck slot into the KeyRelease. This is the equivalent of /use [combat] 2 in a KeyRelease."] = "使用頸部在釋放按鍵時. 這等效於 /use [combat] 2在釋放按鍵時."
L["Incorporate the second ring slot into the KeyRelease. This is the equivalent of /use [combat] 12 in a KeyRelease."] = "使用第二個戒指在釋放按鍵時. 這等效於 /use [combat] 12 在釋放按鍵時."
L["Incorporate the second trinket slot into the KeyRelease. This is the equivalent of /use [combat] 14 in a KeyRelease."] = "使用第二個飾品在釋放按鍵時. 這等效於 /use [combat] 14 在釋放按鍵時."
L["Inner Loop End"] = "內部循環結束"
L["Inner Loop Limit"] = "內部循環限制"
L[ [=[Inner Loop Limit controls how many times the Sequence part of your macro executes 
until it goes onto to the PostMacro and then resets to the PreMacro.]=] ] = "內循環限制控制巨集的序列部分執行的次數，直到使用至巨集最後，然後重置為預設巨集。"
L["Inner Loop Start"] = "內部循環開始"
--[[Translation missing --]]
L["Insert this block again after how many blocks."] = "Insert this block again after how many blocks."
--[[Translation missing --]]
L["Interval"] = "Interval"
--[[Translation missing --]]
L["Invalid value entered into pause block. Needs to be 'GCD' or a Number."] = "Invalid value entered into pause block. Needs to be 'GCD' or a Number."
--[[Translation missing --]]
L["KeyDown"] = "KeyDown"
L["KeyPress"] = "按鍵按下"
L["KeyRelease"] = "按鍵釋放"
--[[Translation missing --]]
L["KeyUp"] = "KeyUp"
L["Language"] = "語言"
L["Language Colour"] = "語言顏色"
L["Left Alt Key"] = "左Alt鍵"
L["Left Control Key"] = "左Ctrl鍵"
L["Left Mouse Button"] = "鼠標左鍵"
L["Left Shift Key"] = "左Shift鍵"
L["Legacy GS/GSE1 Macro"] = "遺留的 GS/GSE1 巨集"
L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = "像一個/castsequence 巨集, 它在按下按鈕時循環執行一系列命令. 然而, 與/castsequence 不同, 它嚴格使用巨集文本作為命令而不是根據法術狀態, 並且它每次按下按鈕時都會前進而不在它不能釋放時停止."
L["Load"] = "讀取"
--[[Translation missing --]]
L["Load or update this WeakAura into WeakAuras."] = "Load or update this WeakAura into WeakAuras."
L["Load Sequence"] = "讀取序列"
--[[Translation missing --]]
L["Load WeakAura"] = "Load WeakAura"
--[[Translation missing --]]
L["Local Function: "] = "Local Function: "
L["Local Macro"] = "本地巨集"
L["Macro Collection to Import."] = "巨集集合導入."
--[[Translation missing --]]
L["Macro Compile Error"] = "Macro Compile Error"
--[[Translation missing --]]
L["Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."] = "Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."
L["Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."] = "巨集被命名為 %sWW%s .重命名此巨集以能使用此巨集.魔獸世界有一個隱藏的名為\"WW\"的按鈕,使用此巨集實際上會點擊該按鈕而不是使用此巨集."
L["Macro Icon"] = "巨集圖標"
L["Macro Import Successful."] = "巨集導入成功."
L["Macro Reset"] = "巨集重置"
L["Macro unable to be imported."] = "無法導入巨集."
--[[Translation missing --]]
L["Macro Variables"] = "Macro Variables"
L["Macro Version %d deleted."] = "巨集版本%d 已刪除."
L["Make Active"] = "使它活動"
L["Manage Versions"] = "管理版本"
L["Matching helpTxt"] = "匹配幫助文本"
--[[Translation missing --]]
L["Measure"] = "Measure"
L["Merge"] = "合併"
L["MergeSequence"] = "合併序列"
L["Middle Mouse Button"] = "鼠標中鍵"
--[[Translation missing --]]
L["Millisecond click settings"] = "Millisecond click settings"
--[[Translation missing --]]
L["Milliseconds"] = "Milliseconds"
L["Mouse Button 4"] = "鼠標鍵4"
L["Mouse Button 5"] = "鼠標鍵5"
L["Mouse Buttons."] = "鼠標鍵."
--[[Translation missing --]]
L["Move Down"] = "Move Down"
--[[Translation missing --]]
L["Move this block down one block."] = "Move this block down one block."
--[[Translation missing --]]
L["Move this block up one block."] = "Move this block up one block."
--[[Translation missing --]]
L["Move Up"] = "Move Up"
L["Moved %s to class %s."] = "移動 %s 到職業 %s ."
--[[Translation missing --]]
L["MS Click Rate"] = "MS Click Rate"
L["Mythic"] = "史詩難度"
--[[Translation missing --]]
L["Mythic setting changed to Default."] = "Mythic setting changed to Default."
L["Mythic+"] = "史詩難度+"
L["Mythic+ setting changed to Default."] = "史詩難度+設置更改為默認."
--[[Translation missing --]]
L["Name"] = "Name"
L["Neck"] = "頸部"
L["New"] = "新的"
L["New Sequence Name"] = "新序列名稱"
L["No"] = "否"
L["No Active Version"] = "無活動版本"
L["No changes were made to "] = "沒有改變被應用到"
L["No Help Information "] = "無幫助信息"
L["No Help Information Available"] = "沒有幫助信息可用"
--[[Translation missing --]]
L["No Sample Macros are available yet for this class."] = "No Sample Macros are available yet for this class."
L["No Sequences present so none displayed in the list."] = "當前沒有序列,因此列表中無內容."
L["Normal Colour"] = "通常顏色"
L["Notes and help on how this macro works.  What things to remember.  This information is shown in the sequence browser."] = "有關此巨集如何工作的註釋和幫助。 要記住什麼。 此信息顯示在序列瀏覽器中。"
--[[Translation missing --]]
L["On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."] = "On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."
L["Only Save Local Macros"] = "僅保存本地巨集"
--[[Translation missing --]]
L["OOC Queue Delay"] = "OOC Queue Delay"
L["Opens the GSE Options window"] = "打開GSE選項窗口"
L["openviewer"] = "打開查看器"
L["Options"] = "設置"
L["Options have been reset to defaults."] = "設置已被重置為默認值."
L["Output"] = "導出"
L["Output the action for each button press to verify StepFunction and spell availability."] = "輸出按鈕按下後的每個的動作以驗證步驟方法和法術的可用性."
--[[Translation missing --]]
L["Party"] = "Party"
--[[Translation missing --]]
L["Party setting changed to Default."] = "Party setting changed to Default."
L["Pause"] = "暫停"
--[[Translation missing --]]
L["Pause for the GCD."] = "Pause for the GCD."
L["Paused"] = "已暫停"
L["Paused - In Combat"] = "已暫停 - 在戰鬥中"
L["Picks a Custom Colour for emphasis."] = "拾取一個顏色給強調."
L["Picks a Custom Colour for the Author."] = "拾取一個顏色給作者."
L["Picks a Custom Colour for the Commands."] = "拾取一個顏色給命令."
L["Picks a Custom Colour for the Mod Names."] = "拾取一個顏色給MOD名稱."
L["Picks a Custom Colour to be used for braces and indents."] = "選擇要使用的自定義顏色給框架和縮進."
L["Picks a Custom Colour to be used for Icons."] = "選擇要使用的自定義顏色給圖標."
L["Picks a Custom Colour to be used for language descriptors"] = "選擇要使用的自定義顏色給語言描述"
L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"] = "選擇要使用的自定義顏色給巨集按鍵條件,如:[mod:shift]"
L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"] = "選擇要使用的自定義顏色給巨集關鍵字,如: /cast 和 /target"
L["Picks a Custom Colour to be used for numbers."] = "選擇要使用的自定義顏色給數字."
L["Picks a Custom Colour to be used for Spells and Abilities."] = "選擇要使用的自定義顏色給法術和技能."
L["Picks a Custom Colour to be used for StepFunctions."] = "選擇要使用的自定義顏色給步驟方法."
L["Picks a Custom Colour to be used for strings."] = "選擇要使用的自定義顏色給字符串."
L["Picks a Custom Colour to be used for unknown terms."] = "選擇要使用的自定義顏色給未知術語."
L["Picks a Custom Colour to be used normally."] = "選擇要使用的自定義顏色給常用顏色."
L["Please wait till you have left combat before using the Sequence Editor."] = "請等待離開戰鬥後再使用序列編輯器."
L["Plugins"] = "插件"
L["PostMacro"] = "巨集主體之後"
L["PreMacro"] = "巨集主體之前"
L["Prevent Sound Errors"] = "防止錯誤音效"
L["Prevent UI Errors"] = "防止UI錯誤提示"
L["Print KeyPress Modifiers on Click"] = "點擊時輸出按鈕"
L["Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."] = "當巨集按鈕按下時,如果同時按下Alt,Shift,Ctrl鍵,則輸出至聊天窗口."
L["Priority List (1 12 123 1234)"] = "優先級列表 (1 12 123 1234)"
L["Prompt Samples"] = "提示樣品"
L["PVP"] = "PVP"
L["PVP setting changed to Default."] = "PVP設置更改為默認值."
L["Raid"] = "Raid"
--[[Translation missing --]]
L["Raid setting changed to Default."] = "Raid setting changed to Default."
L["Random - It will select .... a spell, any spell"] = "隨機 - 它將選擇......一個咒語，任何咒語"
--[[Translation missing --]]
L["Rank"] = "Rank"
--[[Translation missing --]]
L["Raw Edit"] = "Raw Edit"
L["Ready to Send"] = "準備發送"
L["Received Sequence "] = "接收序列"
L["Record"] = "記錄"
L["Record Macro"] = "記錄巨集"
L["Record the spells and items you use into a new macro."] = "將您使用的法術和物品記錄到新的巨集中."
L["Registered Addons"] = "註冊插件"
L["Rename New Macro"] = "重命名新巨集"
--[[Translation missing --]]
L["Repeat"] = "Repeat"
L["Replace"] = "替換"
--[[Translation missing --]]
L["Request Macro"] = "Request Macro"
--[[Translation missing --]]
L["Request that the user sends you a copy of this macro."] = "Request that the user sends you a copy of this macro."
L["Require Target to use"] = "需要使用目標"
L["Reset Macro when out of combat"] = "當離開戰鬥時重置巨集"
L["Reset this macro when you exit combat."] = "退出戰鬥時重置此巨集."
L["Resets"] = "重置"
L["Resets macros back to the initial state when out of combat."] = "在退出戰鬥時巨集重置為初始狀態."
--[[Translation missing --]]
L["Restricted"] = "Restricted"
--[[Translation missing --]]
L["RESTRICTED: Macro specifics disabled by author."] = "RESTRICTED: Macro specifics disabled by author."
L["Resume"] = "恢復"
--[[Translation missing --]]
L["Returns the current Loop Index.  If this is the third action in a loop it will return 3."] = "Returns the current Loop Index.  If this is the third action in a loop it will return 3."
--[[Translation missing --]]
L["Returns your current Global Cooldown value accounting for your haste if that stat is present."] = "Returns your current Global Cooldown value accounting for your haste if that stat is present."
--[[Translation missing --]]
L["Reverse Priority (1 21 321 4321)"] = "Reverse Priority (1 21 321 4321)"
L["Right Alt Key"] = "右Alt鍵"
L["Right Control Key"] = "右Ctrl鍵"
L["Right Mouse Button"] = "鼠標右鍵"
L["Right Shift Key"] = "右Shift鍵"
L["Ring 1"] = "戒指 1"
L["Ring 2"] = "戒指 2"
L["Running"] = "運行"
L["Save"] = "保存"
L["Save the changes made to this macro"] = "保存對此巨集所做的更改"
--[[Translation missing --]]
L["Scenario"] = "Scenario"
--[[Translation missing --]]
L["Scenario setting changed to Default."] = "Scenario setting changed to Default."
--[[Translation missing --]]
L["Seconds"] = "Seconds"
L["Seed Initial Macro"] = "種子初始巨集"
--[[Translation missing --]]
L["Select a Sequence"] = "Select a Sequence"
L["Select Other Version"] = "選擇其他版本"
L["Send"] = "發送"
L["Send this macro to another GSE player who is on the same server as you are."] = "將此巨集發送給與您在同一服務器上的另一個GSE播放器."
L["Send To"] = "發送至"
L["Sequence"] = "序列(巨集主體)"
L["Sequence %s saved."] = "序列 %s 已保存."
L["Sequence Author set to Unknown"] = "序列作者設置為未知"
L["Sequence Compare"] = "序列對比"
L["Sequence Debugger"] = "序列調試器"
L["Sequence Editor"] = "序列編輯器"
--[[Translation missing --]]
L["Sequence Menu"] = "Sequence Menu"
L["Sequence Name"] = "序列名稱"
L["Sequence Name %s is in Use. Please choose a different name."] = "序列名稱 %s 已被使用.請選擇一個不同的名稱."
--[[Translation missing --]]
L["Sequence Named %s was not specifically designed for this version of the game.  It may need adjustments."] = "Sequence Named %s was not specifically designed for this version of the game.  It may need adjustments."
L["Sequence Saved as version "] = "保存序列版本為"
L["Sequence specID set to current spec of "] = "序列天賦ID設置為當前天賦"
--[[Translation missing --]]
L["Sequence to Compress."] = "Sequence to Compress."
L["Sequence Viewer"] = "序列查看器"
L["Sequential (1 2 3 4)"] = "順序 (1 2 3 4)"
L["Set Default Icon QuestionMark"] = "設置默認圖標為問號"
L["Shift Keys."] = "Shift鍵."
L["Show All Macros in Editor"] = "在編輯器顯示全部巨集"
L["Show Class Macros in Editor"] = "在編輯器顯示職業巨集"
--[[Translation missing --]]
L["Show Current Spells"] = "Show Current Spells"
--[[Translation missing --]]
L["Show Full Block Execution"] = "Show Full Block Execution"
L["Show Global Macros in Editor"] = "在編輯器顯示全局巨集"
L["Show GSE Users in LDB"] = "在LDB中顯示GSE用戶"
L["Show OOC Queue in LDB"] = "在LDB中顯示OOC隊列"
--[[Translation missing --]]
L["Show the compiled version of this macro."] = "Show the compiled version of this macro."
--[[Translation missing --]]
L["Show the current value of this variable."] = "Show the current value of this variable."
L["Source Language "] = "語言來源"
--[[Translation missing --]]
L["Specialisation"] = "Specialisation"
L["Specialisation / Class ID"] = "專精 / 職業 ID"
L["Specialization Specific Macro"] = "專精特定巨集"
L["SpecID/ClassID Colour"] = "天賦ID/職業ID 顏色"
--[[Translation missing --]]
L["Spell Cache Editor"] = "Spell Cache Editor"
L["Spell Colour"] = "法術顏色"
--[[Translation missing --]]
L["Spell ID"] = "Spell ID"
--[[Translation missing --]]
L["Spell Name"] = "Spell Name"
--[[Translation missing --]]
L["State"] = "State"
L["Step Function"] = "步驟方法"
L["Step Functions"] = "步驟方式運轉"
L["Stop"] = "停止"
L["Store Debug Messages"] = "儲存調試消息"
L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = "將調試消息的輸出存儲在可由其他mod引用的全局變量中."
L["String Colour"] = "字符串顏色"
--[[Translation missing --]]
L["Support GSE"] = "Support GSE"
L["Supporters"] = "支持者"
--[[Translation missing --]]
L["System Variables"] = "System Variables"
L["Talents"] = "天賦"
L["Target"] = "目標"
L["Target language "] = "目標語言"
L["Target protection is currently %s"] = "目前保護目標是 %s"
--[[Translation missing --]]
L["Test Variable"] = "Test Variable"
L["The author of this macro."] = "這個巨集的作者."
--[[Translation missing --]]
L[ [=[The block path shows the direct location of a block.  This can be edited to move a block to a different position quickly.  Each block is prefixed by its container.
EG 2.3 means that the block is the third block in a container at level 2.  You can move a block into a container block by specifying the parent block.  You need to press the Okay button to move the block.]=] ] = [=[The block path shows the direct location of a block.  This can be edited to move a block to a different position quickly.  Each block is prefixed by its container.
EG 2.3 means that the block is the third block in a container at level 2.  You can move a block into a container block by specifying the parent block.  You need to press the Okay button to move the block.]=]
L["The command "] = "命令"
--[[Translation missing --]]
L["The current result of variable |cff0000ff~~%s~~|r is |cFF00D1FF%s|r"] = "The current result of variable |cff0000ff~~%s~~|r is |cFF00D1FF%s|r"
L["The Custom StepFunction Specified is not recognised and has been ignored."] = "指定的自定義步驟方法無法識別,並已被忽略."
--[[Translation missing --]]
L["The default sizes of each window."] = "The default sizes of each window."
--[[Translation missing --]]
L["The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."] = "The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."
L["The following people donate monthly via Patreon for the ongoing maintenance and development of GSE.  Their support is greatly appreciated."] = "以下人員每月通過Patreon捐贈GSE的持續維護和開發. 非常感謝他們的支持."
L["The GSE Out of Combat queue is %s"] = "GSE插件退出戰鬥序列於 %s"
L["The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."] = "GUI未被加載.請在WoW的插件管理中激活此插件以使用GSE GUI."
--[[Translation missing --]]
L["The GUI is corrupt.  Please ensure that your GSE install is complete."] = "The GUI is corrupt.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI is missing.  Please ensure that your GSE install is complete."] = "The GUI is missing.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI needs updating.  Please ensure that your GSE install is complete."] = "The GUI needs updating.  Please ensure that your GSE install is complete."
L["The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."] = "巨集翻譯器將英語序列翻譯成你的本地語言以供執行. 它也可以用於將序列翻譯成不同的語言. 同時可用於編輯器中基於語法的顏色標記."
L["The main lines of the macro."] = "巨集的主線."
--[[Translation missing --]]
L["The milliseconds being used in key click delay."] = "The milliseconds being used in key click delay."
L[ [=[The name of your macro.  This name has to be unique and can only be used for one object.
You can copy this entire macro by changing the name and choosing Save.]=] ] = "巨集的名稱. 此名稱必須是唯一的，並且只能用於一個對象. 您可以通過更改名稱並選擇保存來複製整個巨集."
L["The Sample Macros have been reloaded."] = "示範巨集已重新加載."
L["The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."] = "序列編輯器可以嘗試實時解析序列,按鍵按下/釋放.這仍然是實驗功能所以可以關閉."
L["The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "] = "序列編輯器是 GnomeSequencer-增強 的插件,允許你在遊戲中查看和編輯序列. 輸入"
L[ [=[The step function determines how your macro executes.  Each time you click your macro GSE will go to the next line.  
The next line it chooses varies.  If Random then it will choose any line.  If Sequential it will go to the next line.  
If Priority it will try some spells more often than others.]=] ] = "步驟功能確定巨集的執行方式. 每次單擊巨集GSE都會轉到下一行. 它選擇的下一行有所不同. 如果是隨機.那麼它將選擇任何一行. 如果順序.它將轉到下一行. 如果優先.它會比其他更頻繁地嘗試一些法術."
L["The version of this macro that will be used when you enter raids."] = "輸入團隊時將使用的此巨集的版本."
L["The version of this macro that will be used where no other version has been configured."] = "此巨集的版本將在最後配置其他版本的情況下使用。"
L["The version of this macro to use in Arenas.  If this is not specified, GSE will look for a PVP version before the default."] = "在Arenas中使用的此巨集的版本. 如果未指定.則GSE將在默認值之前查找PVP版本."
L["The version of this macro to use in heroic dungeons."] = "這個巨集的版本用於英雄地城."
L["The version of this macro to use in Mythic Dungeons."] = "這個巨集的版本在神話地城中使用."
L["The version of this macro to use in Mythic+ Dungeons."] = "這個巨集的版本在神話地城+中使用."
L["The version of this macro to use in normal dungeons."] = "這個巨集的版本在普通地城中使用。"
L["The version of this macro to use in PVP."] = "要在PVP中使用的此巨集的版本."
--[[Translation missing --]]
L["The version of this macro to use in Scenarios."] = "The version of this macro to use in Scenarios."
L["The version of this macro to use when in a party in the world."] = "在全世界中的隊伍中使用的這個巨集的版本。"
L["The version of this macro to use when in time walking dungeons."] = "這個巨集的版本在隨機地城時使用."
L["There are %i events in out of combat queue"] = "離開戰鬥的序列中有 %i 個事件"
L["There are no events in out of combat queue"] = "在離開戰鬥的序列中沒有事件"
L["There are No Macros Loaded for this class.  Would you like to load the Sample Macro?"] = "這個職業沒有任何巨集. 你要加載示例巨集嗎?"
L["There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."] = "序列%s存在錯誤. 它沒有被加載,以防止模組出錯."
--[[Translation missing --]]
L[ [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=] ] = [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=]
L[ [=[These lines are executed before the lines in the Sequence Box.  If an Inner Loop Limit is not set, these are executed only once.  
If an Inner Loop Limit has been set these are executed after the Sequence has been looped through the number of times.  
The Sequence will then go on to the Post Macro if it exists then back to the PreMacro.]=] ] = "這些行在序列框中的行之前執行. 如果未設置內循環限制.則僅執行一次. 如果設置了內循環限制.則在序列循環次數後執行這些限制. 然後.序列將繼續到巨集最後.如果它依然能用.就返回到前面的巨集"
L["These lines are executed every time you click this macro.  They are evaluated by WOW after the line in the Sequence Box."] = "每次單擊此巨集時都會執行這些項目. 它們在序列框中的行之後由WOW評估."
L["These lines are executed every time you click this macro.  They are evaluated by WOW before the line in the Sequence Box."] = "每次單擊此巨集時都會執行這些行. 它們在序列框中的行之前由WOW評估."
L["These options combine to allow you to reset a macro while it is running.  These options are Cumulative ie they add to each other.  Options Like LeftClick and RightClick won't work together very well."] = "這些選項組合允許你在運行巨集時重置巨集.這些選項是累加的.類似同時選擇左鍵單擊和右鍵單擊,無法很好的協作."
L["These tick boxes have three settings for each slot.  Gold = Definately use this item. Blank = Do not use this item automatically.  Silver = Either use or not based on my default settings store in GSE's Options."] = "這些複選框對每個插槽都有三個設置. 黃金=絕對使用此項目. 空白=不要自動使用此項目. 銀色 =根據我在GSE選項中的默認設置存儲使用與否."
--[[Translation missing --]]
L["This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."] = "This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."
L["This change will not come into effect until you save this macro."] = "此更改將不會生效,直到你保存此巨集."
--[[Translation missing --]]
L["This CVAR makes WoW use your abilities when you press the key not when you release it.  To use GSE in its native configuration this needs to be checked."] = "This CVAR makes WoW use your abilities when you press the key not when you release it.  To use GSE in its native configuration this needs to be checked."
--[[Translation missing --]]
L["This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."
--[[Translation missing --]]
L["This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."
--[[Translation missing --]]
L["This function will remove the SHIFT+N, ALT+N and CTRL+N keybindings for this character.  Useful if [mod:shift] etc conditions don't work in game."] = "This function will remove the SHIFT+N, ALT+N and CTRL+N keybindings for this character.  Useful if [mod:shift] etc conditions don't work in game."
L["This function will update macro stubs to support listening to the options below.  This is required to be completed 1 time per character."] = "此功能將更新巨集存根以支持下面的選項.每個角色都需要運行一次."
L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = "這是一個小插件,允許你創建一個巨集序列以便在按下按鈕時執行."
--[[Translation missing --]]
L["This is needed for ConsolePort and BindPad."] = "This is needed for ConsolePort and BindPad."
L["This is the only version of this macro.  Delete the entire macro to delete this version."] = "這是此巨集的唯一版本. 刪除整個巨集以刪除此版本."
--[[Translation missing --]]
L["This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."] = "This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."
L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "該選項會清除遊戲中的錯誤追踪.這等於寫入 /run UIErrorsFrame:Clear() 在按鍵釋放. 打開這個將觸發一個關於運行自定義腳本的欺騙警告."
L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = "此選項將額外的跟踪信息轉儲到聊天窗口,以幫助解決模塊的問題"
L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = [=[顯示更多內容
該選項將隱藏當你使用GS巨集時的"超出範圍了"之類的音效.等於命令 /console Sound_EnableErrorSpeech.打開這個將觸發一個關於運行自定義腳本的欺騙警告.]=]
L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "該選項僵隱藏錯誤文本彈出和對話框和堆棧跟踪.這等於寫入 /script UIErrorsFrame:Hide() 在按鍵釋放. 打開這個將觸發一個關於運行自定義腳本的欺騙警告."
L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = "該選項將禁止你在沒有目標的時候啟動巨集.有助於減少當你的目標死亡時錯誤的針對其他怪物/組."
--[[Translation missing --]]
L["This sequence is Read Only and unable to be edited."] = "This sequence is Read Only and unable to be edited."
L["This Sequence was exported from GSE %s."] = "該序列導出自GSE %s."
--[[Translation missing --]]
L["This setting forces the ActionButtonUseKeyDown setting one way or another.  It also reconfigures GSE's Macro Stubs to operate in the specified mode."] = "This setting forces the ActionButtonUseKeyDown setting one way or another.  It also reconfigures GSE's Macro Stubs to operate in the specified mode."
L["This shows the Global Macros available as well as those for your class."] = "這將顯示你當前職業可用的全局巨集"
L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = "這個版本已經被TimothyLuke修改,使GnomeSequencer的強大功能可以讓不習慣lua編程的人使用."
L["This will display debug messages for the "] = "這將顯示調試消息"
--[[Translation missing --]]
L["This will display debug messages for the GSE Ingame Transmission and transfer"] = "This will display debug messages for the GSE Ingame Transmission and transfer"
L["This will display debug messages in the Chat window."] = "這將在聊天窗口顯示調試消息."
L["Timewalking"] = "時光漫遊"
L["Timewalking setting changed to Default."] = "時光漫遊設置更改為默認."
L["Title Colour"] = "標題顏色"
L["To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"] = "要糾正或刪除版本,可通過GSE編輯器刪除或輸入下面的命令來完全刪除該巨集. %s/run GSE.DeleteSequence (%i, %s)%s"
L["To get started "] = "獲取上手指南"
L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = "要使用巨集,請打開巨集界面,並創建一個與列表中名稱完全相同的巨集. 一個具有兩行的新巨集將被創建,將其放在你的操作欄上."
L["Translate to"] = "翻譯至"
L["Translated Sequence"] = "翻譯序列"
L["Trinket 1"] = "飾品 1"
L["Trinket 2"] = "飾品 2"
--[[Translation missing --]]
L["Troubleshooting"] = "Troubleshooting"
L["Two sequences with unknown sources found."] = "找到兩個未知來源的序列."
--[[Translation missing --]]
L["Unable to interpret sequence."] = "Unable to interpret sequence."
--[[Translation missing --]]
L["Unable to process content.  Fix table and try again."] = "Unable to process content.  Fix table and try again."
L["Unknown Author|r "] = "未知作者|r"
L["Unknown Colour"] = "未知顏色"
--[[Translation missing --]]
L["Unrecognised Import"] = "Unrecognised Import"
--[[Translation missing --]]
L["Up forces GSE into ActionButtonUseKeyDown=0 while Down forces GSE into ActionButtonUseKeyDown=1"] = "Up forces GSE into ActionButtonUseKeyDown=0 while Down forces GSE into ActionButtonUseKeyDown=1"
L["Update"] = "更新"
L["Update Macro Stubs"] = "升級巨集存根"
L["Update Macro Stubs."] = "升級巨集存根"
--[[Translation missing --]]
L["Update Talents"] = "Update Talents"
--[[Translation missing --]]
L["Update the stored talents to match the current chosen talents."] = "Update the stored talents to match the current chosen talents."
L["Updated Macro"] = "更新了巨集"
L["UpdateSequence"] = "更新序列"
L["Updating due to new version."] = "更新至新版本."
L["Use"] = "使用"
L["Use Belt Item in KeyRelease"] = "使用腰部物品在釋放按鍵"
--[[Translation missing --]]
L["Use External MS Timings"] = "Use External MS Timings"
L["Use First Ring in KeyRelease"] = "使用第一個戒指在釋放按鍵"
L["Use First Trinket in KeyRelease"] = "使用第一個飾品在釋放按鍵"
L["Use Global Account Macros"] = "使用帳號全部巨集"
L["Use Head Item in KeyRelease"] = "釋放按鍵時使用頭部物品"
L["Use Macro Translator"] = "使用巨集翻譯器"
L["Use Neck Item in KeyRelease"] = "使用頸部物品在釋放按鍵"
L["Use Realtime Parsing"] = "使用實時解析"
L["Use Second Ring in KeyRelease"] = "使用第二個戒指在釋放按鍵"
L["Use Second Trinket in KeyRelease"] = "使用第二個飾品在釋放按鍵"
--[[Translation missing --]]
L["Use Verbose Export Sequence Format"] = "Use Verbose Export Sequence Format"
L["Use WLM Export Sequence Format"] = "使用WLM導出序列格式"
--[[Translation missing --]]
L["Value"] = "Value"
--[[Translation missing --]]
L["Variables"] = "Variables"
--[[Translation missing --]]
L["Version"] = "Version"
L["Version="] = "版本="
--[[Translation missing --]]
L["Virtual Button Support"] = "Virtual Button Support"
--[[Translation missing --]]
L["WARNING ONLY"] = "WARNING ONLY"
--[[Translation missing --]]
L["was unable to be interpreted."] = "was unable to be interpreted."
--[[Translation missing --]]
L["was unable to be programmed.  This macro will not fire until errors in the macro are corrected."] = "was unable to be programmed.  This macro will not fire until errors in the macro are corrected."
--[[Translation missing --]]
L["WeakAuras"] = "WeakAuras"
--[[Translation missing --]]
L["WeakAuras is a mod that watches for certain conditions and actions and they alerts the player to them occuring.  These are included for convenience and still need to be copied from here and imported to the WeakAuras mod via the command /wa."] = "WeakAuras is a mod that watches for certain conditions and actions and they alerts the player to them occuring.  These are included for convenience and still need to be copied from here and imported to the WeakAuras mod via the command /wa."
--[[Translation missing --]]
L["WeakAuras was not found."] = "WeakAuras was not found."
--[[Translation missing --]]
L["WeakAuras was not found.  Reported error was %s"] = "WeakAuras was not found.  Reported error was %s"
L["Website or forum URL where a player can get more information or ask questions about this macro."] = "網站或論壇網址.玩家可以獲取更多信息或詢問有關此巨集的問題."
L[ [=[What are the preferred talents for this macro?
'1,2,3,1,2,3,1' means First row choose the first talent, Second row choose the second talent etc]=] ] = "這個巨集的首選天賦是什麼？ '1,2,3,1,2,3,1'表示第一排選擇第一天賦，第二排選擇第二天賦等"
L["What class or spec is this macro for?  If it is for all classes choose Global."] = "這個巨集的分類或規格是什麼? 如果適用於所有選項，請選擇全部."
L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = "創建巨集時.如果沒有角色巨集空間.就創建帳號通用的巨集."
--[[Translation missing --]]
L["When debugging the output of a sequence, show the full executed block in the Debugger Output."] = "When debugging the output of a sequence, show the full executed block in the Debugger Output."
L["When exporting a sequence create a stub entry to import for WLM's Website."] = "導出序列時.創建一個存根條目以導入WLM的網站."
--[[Translation missing --]]
L["When exporting a sequence use a human readable verbose form."] = "When exporting a sequence use a human readable verbose form."
L["When GSE imports a macro and it already exists locally and has local edits, what do you want the default action to be.  Merge - Add the new MacroVersions to the existing Macro.  Replace - Replace the existing macro with the new version. Ignore - ignore updates.  This default action will set the default on the Compare screen however if the GUI is not available this will be the action taken."] = "當GSE導入巨集並且已經有本地版本時,如何進行下一步.\"合併\"-將新版本添加到現有版本.\"替換\"-用新版本替換現有版本.\"忽略\"-忽略更新.默認操作將在屏幕上進行比較,但是如果GUI不可用,則會按照此處設定進行下一步."
L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = "加載或創建序列時,如果它是全局巨集或巨集具有未知的天賦ID,則會自動在帳戶巨集中創建巨集存根"
L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = "當加載或創建序列時,如果它是同職業的巨集,則自動創建巨集存根"
L["When you log into a class without any macros, prompt to load the sample macros."] = "當您登錄沒有任何巨集的類時.提示加載示例巨集."
--[[Translation missing --]]
L["Window Sizes"] = "Window Sizes"
L["Yes"] = "是"
L["You cannot delete the Default version of this macro.  Please choose another version to be the Default on the Configuration tab."] = "你不能刪除此巨集的默認版本. 請選擇另一個版本作為配置選項卡上的默認版本."
L["You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "你不能刪除此版本的序列. 此版本將重新加載,因為它包含在"
L["You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"] = "你需要重新加載用戶界面以使步驟方法中的更改生效. 你現在想這樣做嗎?"
L["You need to reload the User Interface to complete this task.  Would you like to do this now?"] = "你需要重新加載用戶界面以完成此任務. 你現在想這樣做嗎?"
L["Your ClassID is "] = "你的 Class ID 是"
L["Your current Specialisation is "] = "你當前的專精是"
--[[Translation missing --]]
L["Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."] = "Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."


