if GetLocale() ~= "ruRU" then
    return
end

local L = LibStub("AceLocale-3.0"):NewLocale("GSE", "ruRU")

-- Options translation
L["  The Alternative ClassID is "] = "Альтернативный ClassID"
L[" Deleted Orphaned Macro "] = "Удаленный Осиротевший Макрос"
L[" from "] = "от"
L[" has been added as a new version and set to active.  Please review if this is as expected."] = "Была добавлена ​​как новая версия и активирована.  Проверьте, соответствует ли это требованиям."
L[" is not available.  Unable to translate sequence "] = "недоступно. Невозможно перевести последовательность"
L[" macros per Account.  You currently have "] = "макросов на Учетной записи.  В настоящее время у вас есть"
L[" macros per character.  You currently have "] = "макросов на персонаже.  В настоящее время у вас есть"
L[" saved as version "] = "сохранено как версия"
L[" sent"] = "послать"
L[" tried to overwrite the version already loaded from "] = "попытался перезаписать версию, уже загруженную из"
L[" was imported as a new macro."] = "был импортирован как новый макрос."
L[" was imported with the following errors."] = "был импортирован со следующими ошибками."
L[" was updated to new version."] = "был обновлен до новой версии."
L["%s macro may cause a 'RestrictedExecution.lua:431' error as it has %s actions when compiled.  This get interesting when you go past 255 actions.  You may need to simplify this macro."] = "Макрос %s может вызвать ошибку 'RestrictedExecution.lua:431', так как при компиляции он имеет действия %s. Это становится интересным, когда вы проходите мимо 255 действий. Возможно, вам придется упростить этот макрос."
L["%sMACRO VALIDATION ERROR|r - PostMacro found with invalid LoopLimit.  PostMacro will not be saved for version %s"] = "%sMACRO VALIDATION ERROR|r — PostMacro найден с недопустимым LoopLimit. PostMacro не будет сохранен для версии %s"
L[". This version was not loaded."] = ". Эта версия не была загружена."
L["/gse checkmacrosforerrors|r will loop through your macros and check for corrupt macro versions.  This will then show how to correct these issues."] = "/gse checkmacrosforerrors|r прокрутит ваши макросы и проверит наличие поврежденных версий макросов. Затем будет показано, как исправить эти проблемы."
L["/gse cleanorphans|r will loop through your macros and delete any left over GSE macros that no longer have a sequence to match them."] = "/gse cleanorphans|r прокрутит ваши макросы и удалит все оставшиеся макросы GSE, которые больше не имеют последовательности, соответствующей им."
L["/gse help|r to get started."] = "/gse help|r для начала работы."
L["/gse showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = "/gse showspec|r покажет вашу текущую специализацию и SPECID, необходимый для пометки любых существующих макросов."
L["/gse|r again."] = "/gse|r еще раз."
L["/gse|r to get started."] = "/gse Запустить GSE"
L["/gse|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = "/gse|r выведет список всех макросов, доступных для вашей спецификации. Это также добавит все макросы, доступные для вашей текущей спецификации, в интерфейс макросов."
L[":|r To get started "] = ":|r Начало работы"
L[":|r You cannot delete the only copy of a sequence."] = ":|r Нельзя удалить единственную копию последовательности."
L[":|r Your current Specialisation is "] = ":|r Ваша текущая специализация"
L["|r Incomplete Sequence Definition - This sequence has no further information "] = "|r Неполное определение последовательности — эта последовательность не содержит дополнительной информации"
L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = "|р. В результате этот макрос не был создан. Пожалуйста, удалите некоторые макросы и введите их заново"
L["|r.  You can also have a  maximum of "] = "|р. Вы также можете иметь максимум"
L["<DEBUG> |r "] = "<DEBUG> |r "
L["<SEQUENCEDEBUG> |r "] = "<SEQUENCEDEBUG> |r"
L[ [=[A pause can be measured in either clicks or seconds.  It will either wait 5 clicks or 1.5 seconds.
If using seconds, you can also wait for the GCD by entering ~~GCD~~ into the box.]=] ] = "Пауза может измеряться как щелчками, так и секундами. Он будет ждать либо 5 кликов, либо 1,5 секунды. Если вы используете секунды, вы также можете дождаться GCD, введя ~~GCD~~ в поле."
L["A sequence collision has occured. "] = "Произошла коллизия последовательностей."
L["A sequence collision has occured.  Extra versions of this macro have been loaded.  Manage the sequence to determine how to use them "] = "Произошло столкновение последовательностей. Загружены дополнительные версии этого макроса. Управляйте последовательностью, чтобы определить, как их использовать"
L["A sequence collision has occured.  Your local version of "] = "Произошло столкновение последовательностей. Ваша локальная версия"
--[[Translation missing --]]
L["About"] = "About"
L["About GSE"] = "О GSE"
--[[Translation missing --]]
L["ActionButtonUseKeyDown"] = "ActionButtonUseKeyDown"
L["Actions"] = "Действия"
L["Active Version: "] = "Активная версия:"
L["Add a Loop Block."] = "Добавьте блок цикла."
L["Add a Pause Block."] = "Добавьте блок паузы."
L["Add a Repeat Block."] = "Добавьте повторяющийся блок."
L["Add a substitution variable for this macro.  This can either be a straight string swap or can be a function.  If a lua function the function needs to return a value."] = "Добавьте подстановочную переменную для этого макроса. Это может быть либо прямая замена строк, либо функция. Если функция lua, функция должна возвращать значение."
L["Add Action"] = "Добавить действие"
L["Add an Action Block."] = "Добавьте блок действий."
L["Add an If Block.  If Blocks allow you to shoose between blocks based on the result of a variable that returns a true or false value."] = "Добавьте блок if. Если блоки позволяют переключаться между блоками на основе результата переменной, возвращающей истинное или ложное значение."
L["Add If"] = "Добавить Если"
L["Add Loop"] = "Добавить цикл"
L["Add Pause"] = "Добавить паузу"
L["Add Repeat"] = "Добавить повтор"
L["Add Variable"] = "Добавить переменную"
L["Add WeakAura"] = "Добавить WeakAura"
L["Addin Version %s contained versions for the following macros:"] = "%s — это переменная, которая будет заменена при выполнении именем макроса. Он должен оставаться на месте."
L["All macros are now stored as upper case names.  You may need to re-add your old macros to your action bars."] = "Все макросы теперь хранятся в верхнем регистре. Возможно, вам придется повторно добавить старые макросы на панели действий."
--[[Translation missing --]]
L["Allow Variable Editor"] = "Allow Variable Editor"
L["Alt Keys."] = "Клавиши Alt."
--[[Translation missing --]]
L["Alwaus use the highest rank of spell available.  This is useful for levelling."] = "Alwaus use the highest rank of spell available.  This is useful for levelling."
--[[Translation missing --]]
L["Always use Max Rank"] = "Always use Max Rank"
L["Any Alt Key"] = "Любая Клавиша Alt"
L["Any Control Key"] = "Любая Клавиша Ctrl "
L["Any Shift Key"] = "Любая Клавиша Shift"
L["Are you sure you want to delete %s?  This will delete the macro and all versions.  This action cannot be undone."] = "Вы действительно хотите удалить %s? Это приведет к удалению макроса и всех его версий. Это действие нельзя отменить."
L["Arena"] = "Арена"
--[[Translation missing --]]
L["Arena setting changed to Default."] = "Arena setting changed to Default."
L["As GSE is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gse cleanorphans"] = "По мере обновления GSE могут остаться макросы, которые больше не относятся к последовательностям. Это автоматически проверит их при выходе из системы. Кроме того, эта проверка может быть выполнена через /gse cleanorphans"
L["Auras included in GSE Macros"] = "Ауры, включенные в макросы GSE"
L["Author"] = "Автор"
L["Author Colour"] = "Цвет Автора"
L["Auto Create Class Macro Stubs"] = "Автоматическое создание заглушек макросов классов"
L["Auto Create Global Macro Stubs"] = "Автоматическое создание глобальных заглушек макросов"
L["Automatically Create Macro Icon"] = "Автоматически создавать иконку макроса"
L["Available Addons"] = "Доступные Модификации"
L["Belt"] = "Пояс"
--[[Translation missing --]]
L["Blizzard Functions Colour"] = "Blizzard Functions Colour"
L["Block Path"] = "Путь к блоку"
L["Block Type: %s"] = "Тип блока: %s"
L["Boolean Functions"] = "Логические функции"
L["Boolean Functions are GSE variables that return either a true or false value."] = "Логические функции — это переменные GSE, которые возвращают либо истинное, либо ложное значение."
--[[Translation missing --]]
L["Boolean not found.  There is a problem with %s not returning true or false."] = "Boolean not found.  There is a problem with %s not returning true or false."
L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = "Иконка макроса на панели действий будет изменяться после каждого нажатия клавиши, по умолчанию для всех макросов установлен значок QuestionMark."
L["By setting this value the Sequence Editor will show every macro for every class."] = "Установив это значение, Sequence Editor покажет каждый макрос для каждого класса."
L["By setting this value the Sequence Editor will show every macro for your class.  Turning this off will only show the class macros for your current specialisation."] = "Установив это значение, Sequence Editor отобразит каждый макрос для вашего класса. Если вы отключите это, будут отображаться только макросы класса для вашей текущей специализации."
L["Cancel"] = "Отменить"
--[[Translation missing --]]
L["Character"] = "Character"
--[[Translation missing --]]
L["Character Specific Options which override the normal account settings."] = "Character Specific Options which override the normal account settings."
--[[Translation missing --]]
L["CheckMacroCreated"] = "Check Macro Created"
L["Checks to see if you have a Heart of Azeroth equipped and if so will insert '/cast Heart Essence' into the macro.  If not your macro will skip this line."] = "Проверяет, есть ли у вас Сердце Азерот, и если да, вставляет '/cast Сущность Сердца' в макрос. В противном случае ваш макрос пропустит эту строку."
--[[Translation missing --]]
L["Choose import action:"] = "Choose import action:"
L["Choose Language"] = "Выберите Язык"
--[[Translation missing --]]
L["Classwide Macro"] = "Classwide Macro"
L["Clear"] = "Очистить"
--[[Translation missing --]]
L["Clear Common Keybindings"] = "Clear Common Keybindings"
L["Clear Errors"] = "Очистить Ошибки"
--[[Translation missing --]]
L["Clear Keybindings"] = "Clear Keybindings"
--[[Translation missing --]]
L["Clear Spell Cache"] = "Clear Spell Cache"
--[[Translation missing --]]
L["Clicks"] = "Clicks"
L["Close"] = "Закрыть"
--[[Translation missing --]]
L["Close to Maximum Macros.|r  You can have a maximum of "] = "Close to Maximum Macros.|r  You can have a maximum of "
--[[Translation missing --]]
L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = "Close to Maximum Personal Macros.|r  You can have a maximum of "
L["Colour"] = "Цвет"
L["Colour and Accessibility Options"] = "Параметры цвета и специальных возможностей"
L["Combat"] = "Бой"
--[[Translation missing --]]
L["Command Colour"] = "Command Colour"
--[[Translation missing --]]
L["Common Solutions to game quirks that seem to affect some people."] = "Common Solutions to game quirks that seem to affect some people."
L["Compile"] = "Компиляция"
L["Compiled"] = "Скомпилировано"
L["Compiled Template"] = "Скомпилированный шаблон"
--[[Translation missing --]]
L["Completely New GS Macro."] = "Completely New GS Macro."
--[[Translation missing --]]
L["Compress"] = "Compress"
--[[Translation missing --]]
L["Compress Sequence from Forums"] = "Compress Sequence from Forums"
--[[Translation missing --]]
L["Conditionals Colour"] = "Conditionals Colour"
L["Configuration"] = "Конфигурации"
--[[Translation missing --]]
L["Continue"] = "Continue"
--[[Translation missing --]]
L["Contributed by: "] = "Contributed by: "
L["Control Keys."] = "Клавиши Control."
--[[Translation missing --]]
L["Convert"] = "Convert"
--[[Translation missing --]]
L["Convert this to a GSE3 Template"] = "Convert this to a GSE3 Template"
--[[Translation missing --]]
L["Copy this link and open it in a Browser."] = "Copy this link and open it in a Browser."
--[[Translation missing --]]
L["Copy this link and paste it into a chat window."] = "Copy this link and paste it into a chat window."
L["Create a new macro."] = "Создайте новый макрос."
--[[Translation missing --]]
L["Create buttons for Global Macros"] = "Create buttons for Global Macros"
L["Create Icon"] = "Создать иконку"
L["Create Macro"] = "Создать Макрос"
L[ [=[Create or remove a Macro stub in /macro that can be dragged to your action bar so that you can use this macro.
GSE can store an unlimited number of macros however WOW's /macro interface can only store a limited number of macros.]=] ] = [=[Создайте или удалите иконку макроса в /macro, которую можно перетащить на панель действий, чтобы использовать этот макрос. 
GSE может хранить неограниченное количество макросов, однако интерфейс WOW /macro может хранить только ограниченное количество макросов.]=]
--[[Translation missing --]]
L["Creating New Sequence."] = "Creating New Sequence."
--[[Translation missing --]]
L["Current GCD"] = "Current GCD"
--[[Translation missing --]]
L["Current GCD: %s"] = "Current GCD: %s"
--[[Translation missing --]]
L["CVar Settings"] = "CVar Settings"
L["Debug"] = "Отладка"
L["Debug Mode Options"] = "Параметры Режима Отладки"
--[[Translation missing --]]
L["Debug Output Options"] = "Debug Output Options"
--[[Translation missing --]]
L["Debug Sequence Execution"] = "Debug Sequence Execution"
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
--[[Translation missing --]]
L["Default Import Action"] = "Default Import Action"
--[[Translation missing --]]
L["Default Menu Height"] = "Default Menu Height"
--[[Translation missing --]]
L["Default Menu Width"] = "Default Menu Width"
L["Default Version"] = "По Умолчанию"
L["Del"] = "Удалить"
L["Delete"] = "Удалить"
--[[Translation missing --]]
L["Delete Block"] = "Delete Block"
L["Delete Icon"] = "Удалить иконку"
--[[Translation missing --]]
L["Delete Orphaned Macros on Logout"] = "Delete Orphaned Macros on Logout"
--[[Translation missing --]]
L[ [=[Delete this Block from the sequence.  
WARNING: If this is a loop this will delete all the blocks inside the loop as well.]=] ] = [=[Delete this Block from the sequence.  
WARNING: If this is a loop this will delete all the blocks inside the loop as well.]=]
L["Delete this macro.  This is not able to be undone."] = "Удалить этот макрос. Это не может быть отменено."
L["Delete this variable from the sequence."] = "Удалите эту переменную из последовательности."
--[[Translation missing --]]
L[ [=[Delete this verion of the macro.  This can be undone by closing this window and not saving the change.  
This is different to the Delete button below which will delete this entire macro.]=] ] = [=[Delete this verion of the macro.  This can be undone by closing this window and not saving the change.  
This is different to the Delete button below which will delete this entire macro.]=]
--[[Translation missing --]]
L["Delete this WeakAura from the sequence."] = "Delete this WeakAura from the sequence."
--[[Translation missing --]]
L["Delete Variable"] = "Delete Variable"
L["Delete Version"] = "Удалить версию"
--[[Translation missing --]]
L["Delete WeakAura"] = "Delete WeakAura"
--[[Translation missing --]]
L["Different helpTxt"] = "Different helpTxt"
L["Disable"] = "Отключить"
--[[Translation missing --]]
L["Disable Block"] = "Disable Block"
--[[Translation missing --]]
L["Disable Editor"] = "Disable Editor"
--[[Translation missing --]]
L["Disable Sequence"] = "Disable Sequence"
--[[Translation missing --]]
L["Disable this block so that it is not executed. If this is a container block, like a loop, all the blocks within it will also be disabled."] = "Disable this block so that it is not executed. If this is a container block, like a loop, all the blocks within it will also be disabled."
L["Display debug messages in Chat Window"] = "Отображение отладочных сообщений в окне чата"
--[[Translation missing --]]
L["Don't Force"] = "Don't Force"
--[[Translation missing --]]
L["Don't Translate Sequences"] = "Don't Translate Sequences"
L["Drag this icon to your action bar to use this macro. You can change this icon in the /macro window."] = "Перетащите эту иконку на панель действий, чтобы использовать этот макрос. Вы можете изменить эту иконку в окне /macro."
--[[Translation missing --]]
L["Dragonflight has changed how the /click command operates.  As a result all your macro stubs (found in /macro) have been updated to match the value of the CVar ActionButtonUseKeyDown.  This is a one off configuration change that needs to be done for each character.  You can change this configuration in GSE's Options."] = "Dragonflight has changed how the /click command operates.  As a result all your macro stubs (found in /macro) have been updated to match the value of the CVar ActionButtonUseKeyDown.  This is a one off configuration change that needs to be done for each character.  You can change this configuration in GSE's Options."
L["Dungeon"] = "Обычный режим"
--[[Translation missing --]]
L["Dungeon setting changed to Default."] = "Dungeon setting changed to Default."
L["Edit"] = "Редактировать"
--[[Translation missing --]]
L["Edit Spell Cache"] = "Edit Spell Cache"
--[[Translation missing --]]
L["Edit this macro directly in Lua. WARNING: This may render the macro unable to operate and can crash your Game Session."] = "Edit this macro directly in Lua. WARNING: This may render the macro unable to operate and can crash your Game Session."
L["Edit this macro.  To delete a macro, choose this edit option and then from inside hit the delete button."] = [=[Отредактируйте этот макрос. 
Чтобы удалить макрос, выберите этот параметр редактирования, а затем нажмите кнопку Удалить.]=]
L["Editor Colours"] = "Цвета Редактора"
--[[Translation missing --]]
L["Emphasis Colour"] = "Emphasis Colour"
L["Enable"] = "Включить"
L["Enable Debug for the following Modules"] = "Включить отладку по следующим модулям"
L["Enable Mod Debug Mode"] = "Включите Режим Отладки"
--[[Translation missing --]]
L["Enable Sequence"] = "Enable Sequence"
--[[Translation missing --]]
L["Enable this option to stop automatically translating sequences from enUS to local language."] = "Enable this option to stop automatically translating sequences from enUS to local language."
--[[Translation missing --]]
L["Enable timing functions by using Click refresh speed as a pseudo timer."] = "Enable timing functions by using Click refresh speed as a pseudo timer."
--[[Translation missing --]]
L["Enforce GSE minimum version for this macro"] = "Enforce GSE minimum version for this macro"
--[[Translation missing --]]
L["Error found in version %i of %s."] = "Error found in version %i of %s."
--[[Translation missing --]]
L["Error processing Custom Pause Value.  You will need to recheck your macros."] = "Error processing Custom Pause Value.  You will need to recheck your macros."
--[[Translation missing --]]
L["Error: Destination path not found."] = "Error: Destination path not found."
--[[Translation missing --]]
L["Error: Source path not found."] = "Error: Source path not found."
--[[Translation missing --]]
L["Error: You cannot move a container to be a child within itself."] = "Error: You cannot move a container to be a child within itself."
L["Export"] = "Экспорт"
L["Export a Sequence"] = "Экспорт последовательности"
--[[Translation missing --]]
L["Export Macro Read Only"] = "Export Macro Read Only"
L["Export this Macro."] = "Экспортировать этот макрос."
--[[Translation missing --]]
L["Extra Macro Versions of %s has been added."] = "Extra Macro Versions of %s has been added."
--[[Translation missing --]]
L["Filter Macro Selection"] = "Filter Macro Selection"
--[[Translation missing --]]
L["Finished scanning for errors.  If no other messages then no errors were found."] = "Finished scanning for errors.  If no other messages then no errors were found."
--[[Translation missing --]]
L["FinishReload"] = "Finish Reload"
--[[Translation missing --]]
L["Fix SetBackdrop Nil"] = "Fix SetBackdrop Nil"
--[[Translation missing --]]
L["Force ActionButtonUseKeyDown State"] = "Force ActionButtonUseKeyDown State"
--[[Translation missing --]]
L["Force CVar State"] = "Force CVar State"
--[[Translation missing --]]
L["Format export for WLM Forums"] = "Format export for WLM Forums"
--[[Translation missing --]]
L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "
L["Gameplay Options"] = "Игровые Параметры"
L["General"] = "Общие"
L["General Options"] = "Общие Параметры"
--[[Translation missing --]]
L["Get Help"] = "Get Help"
--[[Translation missing --]]
L["Global"] = "Global"
--[[Translation missing --]]
L["Global Macros are those that are valid for all classes.  GSE2 also imports unknown macros as Global.  This option will create a button for these macros so they can be called for any class.  Having all macros in this space is a performance loss hence having them saved with a the right specialisation is important."] = "Global Macros are those that are valid for all classes.  GSE2 also imports unknown macros as Global.  This option will create a button for these macros so they can be called for any class.  Having all macros in this space is a performance loss hence having them saved with a the right specialisation is important."
--[[Translation missing --]]
L["Gnome Sequencer: Compress a Sequence String."] = "Gnome Sequencer: Compress a Sequence String."
--[[Translation missing --]]
L["Gnome Sequencer: Export a Sequence String."] = "Gnome Sequencer: Export a Sequence String."
--[[Translation missing --]]
L["Gnome Sequencer: Record your rotation to a macro."] = "Gnome Sequencer: Record your rotation to a macro."
--[[Translation missing --]]
L["Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"] = "Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"
--[[Translation missing --]]
L["Gnome Sequencer: Sequence Editor."] = "Gnome Sequencer: Sequence Editor."
--[[Translation missing --]]
L["GnomeSequencer was originally written by semlar of wowinterface.com."] = "GnomeSequencer was originally written by semlar of wowinterface.com."
--[[Translation missing --]]
L["GnomeSequencer-Enhanced"] = "GnomeSequencer-Enhanced"
L["GSE"] = "GSE"
--[[Translation missing --]]
L["GSE - %s's Macros"] = "GSE - %s's Macros"
L["GSE allows plugins to load Macro Collections as plugins.  You can reload a collection by pressing the button below."] = "GSE позволяет загружать коллекции макросов как дополнения. Вы можете перезагрузить коллекцию, нажав кнопку ниже."
--[[Translation missing --]]
L["GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."] = "GSE has a LibDataBroker (LDB) data feed.  List Other GSE Users and their version when in a group on the tooltip to this feed."
--[[Translation missing --]]
L["GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."] = "GSE has a LibDataBroker (LDB) data feed.  Set this option to show queued Out of Combat events in the tooltip."
L["GSE is a complete rewrite of that addon that allows you create a sequence of macros to be executed at the push of a button."] = "GSE - это полная перезапись этой модификации, которая позволяет вам создать последовательность макросов выполняющаяся одним нажатием кнопки."
--[[Translation missing --]]
L["GSE is out of date. You can download the newest version from https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros."] = "GSE is out of date. You can download the newest version from https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros."
--[[Translation missing --]]
L["GSE Macro"] = "GSE Macro"
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
--[[Translation missing --]]
L["GSE Users"] = "GSE Users"
--[[Translation missing --]]
L["GSE Version: %s"] = "GSE Version: %s"
--[[Translation missing --]]
L[ [=[GSE was originally forked from GnomeSequencer written by semlar.  It was enhanced by TImothyLuke to include a lot of configuration and boilerplate functionality with a GUI added.  The enhancements pushed the limits of what the original code could handle and was rewritten from scratch into GSE.

GSE itself wouldn't be what it is without the efforts of the people who write macros with it.  Check out https://wowlazymacros.com for the things that make this mod work.  Special thanks to Lutechi for creating this community.]=] ] = [=[GSE was originally forked from GnomeSequencer written by semlar.  It was enhanced by TImothyLuke to include a lot of configuration and boilerplate functionality with a GUI added.  The enhancements pushed the limits of what the original code could handle and was rewritten from scratch into GSE.

GSE itself wouldn't be what it is without the efforts of the people who write macros with it.  Check out https://wowlazymacros.com for the things that make this mod work.  Special thanks to Lutechi for creating this community.]=]
--[[Translation missing --]]
L["GSE: Advanced Macro Compiler loaded.|r  Type "] = "GSE: Advanced Macro Compiler loaded.|r  Type "
--[[Translation missing --]]
L["GSE: Import a Macro String."] = "GSE: Import a Macro String."
L["GSE: Left Click to open the Sequence Editor"] = "GSE: ЛКМ для открытия Редактора Последовательности"
L["GSE: Middle Click to open the Transmission Interface"] = "GSE: СКМ для открытия интерфейса передачи"
L["GSE: Right Click to open the Sequence Debugger"] = "GSE: ПКМ для открытия окна отладки"
--[[Translation missing --]]
L["GSE2 Retro Importer available."] = "GSE2 Retro Importer available."
--[[Translation missing --]]
L["GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."] = "GSE2 Retro interface loaded.  Type `%s/gse2 import%s` to import an old GSE2 string or `%s/gse2 edit%s` to mock up a new template using the GSE2 editor."
--[[Translation missing --]]
L["GSE2 Retro:"] = "GSE2 Retro:"
L["Head"] = "Голова"
--[[Translation missing --]]
L["Help Colour"] = "Help Colour"
L["Help Information"] = "Справочная информация"
L["Help Link"] = "Ссылка для справки"
L["Help URL"] = "URL справка"
L["Heroic"] = "Героический режим"
--[[Translation missing --]]
L["Heroic setting changed to Default."] = "Heroic setting changed to Default."
L["Hide Login Message"] = "Скрыть Сообщение Входа"
L["Hide Minimap Icon"] = "Скрыть иконку у миникарты"
--[[Translation missing --]]
L["Hide Minimap Icon for LibDataBroker (LDB) data text."] = "Hide Minimap Icon for LibDataBroker (LDB) data text."
L["Hides the message that GSE is loaded."] = "Скрывает сообщение, что GSE загрузился."
--[[Translation missing --]]
L["History"] = "History"
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
--[[Translation missing --]]
L["Icon Colour"] = "Icon Colour"
--[[Translation missing --]]
L["If Blocks require a variable that returns either true or false.  Create the variable first."] = "If Blocks require a variable that returns either true or false.  Create the variable first."
--[[Translation missing --]]
L["If Blocks Require a variable."] = "If Blocks Require a variable."
--[[Translation missing --]]
L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = "If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."
--[[Translation missing --]]
L["Ignore"] = "Ignore"
L["Import"] = "Импорт"
L["Import Macro from Forums"] = "Импорт макроса с форумов"
--[[Translation missing --]]
L["Imported new sequence "] = "Imported new sequence "
--[[Translation missing --]]
L["Incorporate the belt slot into the KeyRelease. This is the equivalent of /use [combat] 5 in a KeyRelease."] = "Incorporate the belt slot into the KeyRelease. This is the equivalent of /use [combat] 5 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the first ring slot into the KeyRelease. This is the equivalent of /use [combat] 11 in a KeyRelease."] = "Incorporate the first ring slot into the KeyRelease. This is the equivalent of /use [combat] 11 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the first trinket slot into the KeyRelease. This is the equivalent of /use [combat] 13 in a KeyRelease."] = "Incorporate the first trinket slot into the KeyRelease. This is the equivalent of /use [combat] 13 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the Head slot into the KeyRelease. This is the equivalent of /use [combat] 1 in a KeyRelease."] = "Incorporate the Head slot into the KeyRelease. This is the equivalent of /use [combat] 1 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the neck slot into the KeyRelease. This is the equivalent of /use [combat] 2 in a KeyRelease."] = "Incorporate the neck slot into the KeyRelease. This is the equivalent of /use [combat] 2 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the second ring slot into the KeyRelease. This is the equivalent of /use [combat] 12 in a KeyRelease."] = "Incorporate the second ring slot into the KeyRelease. This is the equivalent of /use [combat] 12 in a KeyRelease."
--[[Translation missing --]]
L["Incorporate the second trinket slot into the KeyRelease. This is the equivalent of /use [combat] 14 in a KeyRelease."] = "Incorporate the second trinket slot into the KeyRelease. This is the equivalent of /use [combat] 14 in a KeyRelease."
--[[Translation missing --]]
L["Inner Loop End"] = "Inner Loop End"
--[[Translation missing --]]
L["Inner Loop Limit"] = "Inner Loop Limit"
--[[Translation missing --]]
L[ [=[Inner Loop Limit controls how many times the Sequence part of your macro executes 
until it goes onto to the PostMacro and then resets to the PreMacro.]=] ] = [=[Inner Loop Limit controls how many times the Sequence part of your macro executes 
until it goes onto to the PostMacro and then resets to the PreMacro.]=]
--[[Translation missing --]]
L["Inner Loop Start"] = "Inner Loop Start"
--[[Translation missing --]]
L["Insert this block again after how many blocks."] = "Insert this block again after how many blocks."
--[[Translation missing --]]
L["Interval"] = "Interval"
--[[Translation missing --]]
L["Invalid value entered into pause block. Needs to be 'GCD' or a Number."] = "Invalid value entered into pause block. Needs to be 'GCD' or a Number."
--[[Translation missing --]]
L["KeyDown"] = "KeyDown"
L["KeyPress"] = "Нажатие клавиши"
--[[Translation missing --]]
L["KeyRelease"] = "KeyRelease"
--[[Translation missing --]]
L["KeyUp"] = "KeyUp"
L["Language"] = "Язык"
--[[Translation missing --]]
L["Language Colour"] = "Language Colour"
L["Left Alt Key"] = "Левая клавиша Alt "
L["Left Control Key"] = "Левая клавиша Control"
L["Left Mouse Button"] = "Левая кнопка мыши"
L["Left Shift Key"] = "Левая клавиша Shift "
--[[Translation missing --]]
L["Legacy GS/GSE1 Macro"] = "Legacy GS/GSE1 Macro"
--[[Translation missing --]]
L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = "Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."
L["Load"] = "Загрузить"
--[[Translation missing --]]
L["Load or update this WeakAura into WeakAuras."] = "Load or update this WeakAura into WeakAuras."
--[[Translation missing --]]
L["Load Sequence"] = "Load Sequence"
--[[Translation missing --]]
L["Load WeakAura"] = "Load WeakAura"
--[[Translation missing --]]
L["Local Function: "] = "Local Function: "
--[[Translation missing --]]
L["Local Macro"] = "Local Macro"
--[[Translation missing --]]
L["Macro Collection to Import."] = "Macro Collection to Import."
--[[Translation missing --]]
L["Macro Compile Error"] = "Macro Compile Error"
--[[Translation missing --]]
L["Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."] = "Macro found by the name %sPVP%s. Rename this macro to a different name to be able to use it.  WOW has a global object called PVP that is referenced instead of this macro."
--[[Translation missing --]]
L["Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."] = "Macro found by the name %sWW%s. Rename this macro to a different name to be able to use it.  WOW has a hidden button called WW that is executed instead of this macro."
--[[Translation missing --]]
L["Macro Icon"] = "Macro Icon"
L["Macro Import Successful."] = "Успешное импортирование макроса."
L["Macro Reset"] = "Сброс Макро"
--[[Translation missing --]]
L["Macro unable to be imported."] = "Macro unable to be imported."
L["Macro Variables"] = "Макро-переменные"
--[[Translation missing --]]
L["Macro Version %d deleted."] = "Macro Version %d deleted."
--[[Translation missing --]]
L["Make Active"] = "Make Active"
--[[Translation missing --]]
L["Manage Versions"] = "Manage Versions"
--[[Translation missing --]]
L["Matching helpTxt"] = "Matching helpTxt"
--[[Translation missing --]]
L["Measure"] = "Measure"
--[[Translation missing --]]
L["Merge"] = "Merge"
--[[Translation missing --]]
L["MergeSequence"] = "MergeSequence"
L["Middle Mouse Button"] = "Средняя кнопка мыши"
--[[Translation missing --]]
L["Millisecond click settings"] = "Millisecond click settings"
--[[Translation missing --]]
L["Milliseconds"] = "Milliseconds"
L["Mouse Button 4"] = "Кнопка мыши 4"
L["Mouse Button 5"] = "Кнопка мыши 5"
L["Mouse Buttons."] = "Кнопки мыши."
--[[Translation missing --]]
L["Move Down"] = "Move Down"
--[[Translation missing --]]
L["Move this block down one block."] = "Move this block down one block."
--[[Translation missing --]]
L["Move this block up one block."] = "Move this block up one block."
--[[Translation missing --]]
L["Move Up"] = "Move Up"
--[[Translation missing --]]
L["Moved %s to class %s."] = "Moved %s to class %s."
--[[Translation missing --]]
L["MS Click Rate"] = "MS Click Rate"
L["Mythic"] = "Эпохальный режим"
--[[Translation missing --]]
L["Mythic setting changed to Default."] = "Mythic setting changed to Default."
L["Mythic+"] = "Эпохальный ключ"
--[[Translation missing --]]
L["Mythic+ setting changed to Default."] = "Mythic+ setting changed to Default."
L["Name"] = "Имя"
L["Neck"] = "Шея"
L["New"] = "Новый"
--[[Translation missing --]]
L["New Sequence Name"] = "New Sequence Name"
L["No"] = "Нет"
--[[Translation missing --]]
L["No Active Version"] = "No Active Version"
--[[Translation missing --]]
L["No changes were made to "] = "No changes were made to "
--[[Translation missing --]]
L["No Help Information "] = "No Help Information "
--[[Translation missing --]]
L["No Help Information Available"] = "No Help Information Available"
--[[Translation missing --]]
L["No Sample Macros are available yet for this class."] = "No Sample Macros are available yet for this class."
--[[Translation missing --]]
L["No Sequences present so none displayed in the list."] = "No Sequences present so none displayed in the list."
--[[Translation missing --]]
L["Normal Colour"] = "Normal Colour"
L["Notes and help on how this macro works.  What things to remember.  This information is shown in the sequence browser."] = [=[Примечания и справка о том, как работает этот макрос. Какие вещи нужно помнить. 
Эта информация отображается в обозревателе последовательностей.]=]
--[[Translation missing --]]
L["On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."] = "On some clients the Editor will throw an error relating to setBackdrop. Turning this on will prevent those errors."
--[[Translation missing --]]
L["Only Save Local Macros"] = "Only Save Local Macros"
--[[Translation missing --]]
L["OOC Queue Delay"] = "OOC Queue Delay"
L["Opens the GSE Options window"] = "Открывает окно параметров GSE"
--[[Translation missing --]]
L["openviewer"] = "Open Viewer"
L["Options"] = "Параметры"
--[[Translation missing --]]
L["Options have been reset to defaults."] = "Options have been reset to defaults."
--[[Translation missing --]]
L["Output"] = "Output"
--[[Translation missing --]]
L["Output the action for each button press to verify StepFunction and spell availability."] = "Output the action for each button press to verify StepFunction and spell availability."
L["Party"] = "Группа"
--[[Translation missing --]]
L["Party setting changed to Default."] = "Party setting changed to Default."
L["Pause"] = "Пауза"
--[[Translation missing --]]
L["Pause for the GCD."] = "Pause for the GCD."
--[[Translation missing --]]
L["Paused"] = "Paused"
--[[Translation missing --]]
L["Paused - In Combat"] = "Paused - In Combat"
--[[Translation missing --]]
L["Picks a Custom Colour for emphasis."] = "Picks a Custom Colour for emphasis."
--[[Translation missing --]]
L["Picks a Custom Colour for the Author."] = "Picks a Custom Colour for the Author."
--[[Translation missing --]]
L["Picks a Custom Colour for the Commands."] = "Picks a Custom Colour for the Commands."
--[[Translation missing --]]
L["Picks a Custom Colour for the Mod Names."] = "Picks a Custom Colour for the Mod Names."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for braces and indents."] = "Picks a Custom Colour to be used for braces and indents."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for Icons."] = "Picks a Custom Colour to be used for Icons."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for language descriptors"] = "Picks a Custom Colour to be used for language descriptors"
--[[Translation missing --]]
L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"] = "Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"
--[[Translation missing --]]
L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"] = "Picks a Custom Colour to be used for Macro Keywords like /cast and /target"
--[[Translation missing --]]
L["Picks a Custom Colour to be used for numbers."] = "Picks a Custom Colour to be used for numbers."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for Spells and Abilities."] = "Picks a Custom Colour to be used for Spells and Abilities."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for StepFunctions."] = "Picks a Custom Colour to be used for StepFunctions."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for strings."] = "Picks a Custom Colour to be used for strings."
--[[Translation missing --]]
L["Picks a Custom Colour to be used for unknown terms."] = "Picks a Custom Colour to be used for unknown terms."
--[[Translation missing --]]
L["Picks a Custom Colour to be used normally."] = "Picks a Custom Colour to be used normally."
--[[Translation missing --]]
L["Please wait till you have left combat before using the Sequence Editor."] = "Please wait till you have left combat before using the Sequence Editor."
L["Plugins"] = "Плагины"
--[[Translation missing --]]
L["PostMacro"] = "PostMacro"
--[[Translation missing --]]
L["PreMacro"] = "PreMacro"
--[[Translation missing --]]
L["Prevent Sound Errors"] = "Prevent Sound Errors"
--[[Translation missing --]]
L["Prevent UI Errors"] = "Prevent UI Errors"
--[[Translation missing --]]
L["Print KeyPress Modifiers on Click"] = "Print KeyPress Modifiers on Click"
--[[Translation missing --]]
L["Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."] = "Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."
L["Priority List (1 12 123 1234)"] = "Приоритетный Список (1 12 123 1234)"
--[[Translation missing --]]
L["Prompt Samples"] = "Prompt Samples"
--[[Translation missing --]]
L["PVP"] = "PVP"
--[[Translation missing --]]
L["PVP setting changed to Default."] = "PVP setting changed to Default."
L["Raid"] = "Рейд"
--[[Translation missing --]]
L["Raid setting changed to Default."] = "Raid setting changed to Default."
--[[Translation missing --]]
L["Random - It will select .... a spell, any spell"] = "Random - It will select .... a spell, any spell"
--[[Translation missing --]]
L["Rank"] = "Rank"
--[[Translation missing --]]
L["Raw Edit"] = "Raw Edit"
--[[Translation missing --]]
L["Ready to Send"] = "Ready to Send"
--[[Translation missing --]]
L["Received Sequence "] = "Received Sequence "
L["Record"] = "Запись"
L["Record Macro"] = "Запись Макроса"
L["Record the spells and items you use into a new macro."] = "Запишите умения и предметы, которые вы используете, в новый макрос."
L["Registered Addons"] = "Зарегистрированные дополнения"
--[[Translation missing --]]
L["Rename New Macro"] = "Rename New Macro"
--[[Translation missing --]]
L["Repeat"] = "Repeat"
--[[Translation missing --]]
L["Replace"] = "Replace"
--[[Translation missing --]]
L["Request Macro"] = "Request Macro"
--[[Translation missing --]]
L["Request that the user sends you a copy of this macro."] = "Request that the user sends you a copy of this macro."
--[[Translation missing --]]
L["Require Target to use"] = "Require Target to use"
L["Reset Macro when out of combat"] = "Сбросить Макрос при выходе из боя"
--[[Translation missing --]]
L["Reset this macro when you exit combat."] = "Reset this macro when you exit combat."
L["Resets"] = "Сбросы"
L["Resets macros back to the initial state when out of combat."] = "Сбрасывает макросы обратно в исходное состояние, когда они находятся вне боя."
--[[Translation missing --]]
L["Restricted"] = "Restricted"
--[[Translation missing --]]
L["RESTRICTED: Macro specifics disabled by author."] = "RESTRICTED: Macro specifics disabled by author."
L["Resume"] = "Продолжить"
--[[Translation missing --]]
L["Returns the current Loop Index.  If this is the third action in a loop it will return 3."] = "Returns the current Loop Index.  If this is the third action in a loop it will return 3."
L["Returns your current Global Cooldown value accounting for your haste if that stat is present."] = "Возвращает ваше текущее глобальное значение перезарядки, учитывающее вашу скорость, если этот показатель присутствует."
--[[Translation missing --]]
L["Reverse Priority (1 21 321 4321)"] = "Reverse Priority (1 21 321 4321)"
L["Right Alt Key"] = "Правая клавиша Alt"
L["Right Control Key"] = "Правая клавиша Control"
L["Right Mouse Button"] = "Правая кнопка мыши"
L["Right Shift Key"] = "Правая клавиша Shift"
L["Ring 1"] = "Кольцо1"
L["Ring 2"] = "Кольцо2"
--[[Translation missing --]]
L["Running"] = "Running"
L["Save"] = "Сохранить"
L["Save the changes made to this macro"] = "Сохраните изменения, внесенные в этот макрос"
L["Scenario"] = "Сценарий"
--[[Translation missing --]]
L["Scenario setting changed to Default."] = "Scenario setting changed to Default."
--[[Translation missing --]]
L["Seconds"] = "Seconds"
--[[Translation missing --]]
L["Seed Initial Macro"] = "Seed Initial Macro"
--[[Translation missing --]]
L["Select a Sequence"] = "Select a Sequence"
--[[Translation missing --]]
L["Select Other Version"] = "Select Other Version"
L["Send"] = "Отправить"
L["Send this macro to another GSE player who is on the same server as you are."] = "Отправьте этот макрос другому игроку GSE, который находится на том же сервере, что и вы."
--[[Translation missing --]]
L["Send To"] = "Send To"
L["Sequence"] = "Последовательность"
L["Sequence %s saved."] = "Последовательность %s сохранена."
--[[Translation missing --]]
L["Sequence Author set to Unknown"] = "Sequence Author set to Unknown"
--[[Translation missing --]]
L["Sequence Compare"] = "Sequence Compare"
--[[Translation missing --]]
L["Sequence Debugger"] = "Sequence Debugger"
--[[Translation missing --]]
L["Sequence Editor"] = "Sequence Editor"
--[[Translation missing --]]
L["Sequence Menu"] = "Sequence Menu"
L["Sequence Name"] = "Имя Последовательности"
--[[Translation missing --]]
L["Sequence Name %s is in Use. Please choose a different name."] = "Sequence Name %s is in Use. Please choose a different name."
--[[Translation missing --]]
L["Sequence Named %s was not specifically designed for this version of the game.  It may need adjustments."] = "Sequence Named %s was not specifically designed for this version of the game.  It may need adjustments."
--[[Translation missing --]]
L["Sequence Saved as version "] = "Sequence Saved as version "
--[[Translation missing --]]
L["Sequence specID set to current spec of "] = "Sequence specID set to current spec of "
--[[Translation missing --]]
L["Sequence to Compress."] = "Sequence to Compress."
--[[Translation missing --]]
L["Sequence Viewer"] = "Sequence Viewer"
L["Sequential (1 2 3 4)"] = "Последовательно (1 2 3 4)"
--[[Translation missing --]]
L["Set Default Icon QuestionMark"] = "Set Default Icon QuestionMark"
L["Shift Keys."] = "Клавиши Shift."
L["Show All Macros in Editor"] = "Показать Все макросы в редакторе"
L["Show Class Macros in Editor"] = "Показать макросы класса в редакторе"
--[[Translation missing --]]
L["Show Current Spells"] = "Show Current Spells"
--[[Translation missing --]]
L["Show Full Block Execution"] = "Show Full Block Execution"
--[[Translation missing --]]
L["Show Global Macros in Editor"] = "Show Global Macros in Editor"
--[[Translation missing --]]
L["Show GSE Users in LDB"] = "Show GSE Users in LDB"
--[[Translation missing --]]
L["Show OOC Queue in LDB"] = "Show OOC Queue in LDB"
--[[Translation missing --]]
L["Show the compiled version of this macro."] = "Show the compiled version of this macro."
--[[Translation missing --]]
L["Show the current value of this variable."] = "Show the current value of this variable."
--[[Translation missing --]]
L["Source Language "] = "Source Language "
--[[Translation missing --]]
L["Specialisation"] = "Specialisation"
L["Specialisation / Class ID"] = "Специализация / ID класса"
--[[Translation missing --]]
L["Specialization Specific Macro"] = "Specialization Specific Macro"
--[[Translation missing --]]
L["SpecID/ClassID Colour"] = "SpecID/ClassID Colour"
--[[Translation missing --]]
L["Spell Cache Editor"] = "Spell Cache Editor"
--[[Translation missing --]]
L["Spell Colour"] = "Spell Colour"
--[[Translation missing --]]
L["Spell ID"] = "Spell ID"
--[[Translation missing --]]
L["Spell Name"] = "Spell Name"
--[[Translation missing --]]
L["State"] = "State"
--[[Translation missing --]]
L["Step Function"] = "Step Function"
--[[Translation missing --]]
L["Step Functions"] = "Step Functions"
L["Stop"] = "Стоп"
--[[Translation missing --]]
L["Store Debug Messages"] = "Store Debug Messages"
--[[Translation missing --]]
L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = "Store output of debug messages in a Global Variable that can be referrenced by other mods."
--[[Translation missing --]]
L["String Colour"] = "String Colour"
--[[Translation missing --]]
L["Support GSE"] = "Support GSE"
--[[Translation missing --]]
L["Supporters"] = "Supporters"
L["System Variables"] = "Системные переменные"
L["Talents"] = "Таланты"
L["Target"] = "Цель"
--[[Translation missing --]]
L["Target language "] = "Target language "
--[[Translation missing --]]
L["Target protection is currently %s"] = "Target protection is currently %s"
--[[Translation missing --]]
L["Test Variable"] = "Test Variable"
--[[Translation missing --]]
L["The author of this macro."] = "The author of this macro."
--[[Translation missing --]]
L[ [=[The block path shows the direct location of a block.  This can be edited to move a block to a different position quickly.  Each block is prefixed by its container.
EG 2.3 means that the block is the third block in a container at level 2.  You can move a block into a container block by specifying the parent block.  You need to press the Okay button to move the block.]=] ] = [=[The block path shows the direct location of a block.  This can be edited to move a block to a different position quickly.  Each block is prefixed by its container.
EG 2.3 means that the block is the third block in a container at level 2.  You can move a block into a container block by specifying the parent block.  You need to press the Okay button to move the block.]=]
--[[Translation missing --]]
L["The command "] = "The command "
--[[Translation missing --]]
L["The current result of variable |cff0000ff~~%s~~|r is |cFF00D1FF%s|r"] = "The current result of variable |cff0000ff~~%s~~|r is |cFF00D1FF%s|r"
--[[Translation missing --]]
L["The Custom StepFunction Specified is not recognised and has been ignored."] = "The Custom StepFunction Specified is not recognised and has been ignored."
--[[Translation missing --]]
L["The default sizes of each window."] = "The default sizes of each window."
--[[Translation missing --]]
L["The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."] = "The delay in seconds between Out of Combat Queue Polls.  The Out of Combat Queue saves changes and updates macros.  When you hit save or change zones, these actions enter a queue which checks that first you are not in combat before proceeding to complete their task.  After checking the queue it goes to sleep for x seconds before rechecking what is in the queue."
--[[Translation missing --]]
L["The following people donate monthly via Patreon for the ongoing maintenance and development of GSE.  Their support is greatly appreciated."] = "The following people donate monthly via Patreon for the ongoing maintenance and development of GSE.  Their support is greatly appreciated."
--[[Translation missing --]]
L["The GSE Out of Combat queue is %s"] = "The GSE Out of Combat queue is %s"
--[[Translation missing --]]
L["The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."] = "The GUI has not been loaded.  Please activate this plugin amongst WoW's addons to use the GSE GUI."
--[[Translation missing --]]
L["The GUI is corrupt.  Please ensure that your GSE install is complete."] = "The GUI is corrupt.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI is missing.  Please ensure that your GSE install is complete."] = "The GUI is missing.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The GUI needs updating.  Please ensure that your GSE install is complete."] = "The GUI needs updating.  Please ensure that your GSE install is complete."
--[[Translation missing --]]
L["The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."] = "The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."
--[[Translation missing --]]
L["The main lines of the macro."] = "The main lines of the macro."
--[[Translation missing --]]
L["The milliseconds being used in key click delay."] = "The milliseconds being used in key click delay."
L[ [=[The name of your macro.  This name has to be unique and can only be used for one object.
You can copy this entire macro by changing the name and choosing Save.]=] ] = "Имя вашего макроса. Это имя должно быть уникальным и может использоваться только для одного объекта. Вы можете скопировать весь этот макрос, изменив его имя и выбрав сохранить."
--[[Translation missing --]]
L["The Sample Macros have been reloaded."] = "The Sample Macros have been reloaded."
--[[Translation missing --]]
L["The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."] = "The Sequence Editor can attempt to parse the Sequences, KeyPress and KeyRelease in realtime.  This is still experimental so can be turned off."
--[[Translation missing --]]
L["The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "] = "The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "
--[[Translation missing --]]
L[ [=[The step function determines how your macro executes.  Each time you click your macro GSE will go to the next line.  
The next line it chooses varies.  If Random then it will choose any line.  If Sequential it will go to the next line.  
If Priority it will try some spells more often than others.]=] ] = [=[The step function determines how your macro executes.  Each time you click your macro GSE will go to the next line.  
The next line it chooses varies.  If Random then it will choose any line.  If Sequential it will go to the next line.  
If Priority it will try some spells more often than others.]=]
L["The version of this macro that will be used when you enter raids."] = "Версия этого макроса, которая будет использоваться при входе в рейды."
L["The version of this macro that will be used where no other version has been configured."] = "Версия этого макроса, которая будет использоваться там, где не была настроена никакая другая версия."
L["The version of this macro to use in Arenas.  If this is not specified, GSE will look for a PVP version before the default."] = [=[Версия этого макроса для использования на Аренах. 
Если это не указано, GSE будет искать PVP-версию до установки по умолчанию.]=]
L["The version of this macro to use in heroic dungeons."] = "Версия этого макроса для использования в героических подземельях."
L["The version of this macro to use in Mythic Dungeons."] = "Версия этого макроса для использования в подземельях (эпохальный режим)"
L["The version of this macro to use in Mythic+ Dungeons."] = "Версия этого макроса для использования в подземельях (эпохальный ключ)"
L["The version of this macro to use in normal dungeons."] = "Версия этого макроса для использования в обычных подземельях."
L["The version of this macro to use in PVP."] = "Версия этого макроса для использования в PVP."
L["The version of this macro to use in Scenarios."] = "Версия этого макроса для использования в Сценариях."
L["The version of this macro to use when in a party in the world."] = "Версия этого макроса для использования в группе в мире."
L["The version of this macro to use when in time walking dungeons."] = "Версия этого макроса для использования в подземельях путешествие во времени."
--[[Translation missing --]]
L["There are %i events in out of combat queue"] = "There are %i events in out of combat queue"
--[[Translation missing --]]
L["There are no events in out of combat queue"] = "There are no events in out of combat queue"
L["There are No Macros Loaded for this class.  Would you like to load the Sample Macro?"] = [=[Для этого класса макросы не загружены. 
Хотите загрузить образец макросов (Sample Macro)?]=]
--[[Translation missing --]]
L["There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."] = "There is an issue with sequence %s.  It has not been loaded to prevent the mod from failing."
--[[Translation missing --]]
L[ [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=] ] = [=[These lines are executed after the lines in the Sequence Box have been repeated Inner Loop Limit number of times.
The Sequence will then go on to the PreMacro if it exists then back to the Sequence.]=]
--[[Translation missing --]]
L[ [=[These lines are executed before the lines in the Sequence Box.  If an Inner Loop Limit is not set, these are executed only once.  
If an Inner Loop Limit has been set these are executed after the Sequence has been looped through the number of times.  
The Sequence will then go on to the Post Macro if it exists then back to the PreMacro.]=] ] = [=[These lines are executed before the lines in the Sequence Box.  If an Inner Loop Limit is not set, these are executed only once.  
If an Inner Loop Limit has been set these are executed after the Sequence has been looped through the number of times.  
The Sequence will then go on to the Post Macro if it exists then back to the PreMacro.]=]
--[[Translation missing --]]
L["These lines are executed every time you click this macro.  They are evaluated by WOW after the line in the Sequence Box."] = "These lines are executed every time you click this macro.  They are evaluated by WOW after the line in the Sequence Box."
--[[Translation missing --]]
L["These lines are executed every time you click this macro.  They are evaluated by WOW before the line in the Sequence Box."] = "These lines are executed every time you click this macro.  They are evaluated by WOW before the line in the Sequence Box."
L["These options combine to allow you to reset a macro while it is running.  These options are Cumulative ie they add to each other.  Options Like LeftClick and RightClick won't work together very well."] = "Эти параметры в совокупности позволяют сбросить макроса во время его выполнения. Эти параметры являются накопительными, т. е. они дополняют друг друга. Такие варианты, как \"правый клик\" и \"левый клик\" вместе успешно работать не будут."
--[[Translation missing --]]
L["These tick boxes have three settings for each slot.  Gold = Definately use this item. Blank = Do not use this item automatically.  Silver = Either use or not based on my default settings store in GSE's Options."] = "These tick boxes have three settings for each slot.  Gold = Definately use this item. Blank = Do not use this item automatically.  Silver = Either use or not based on my default settings store in GSE's Options."
--[[Translation missing --]]
L["This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."] = "This box is disabled as no Inner Loop Limit has been set.  It will never be called without it."
--[[Translation missing --]]
L["This change will not come into effect until you save this macro."] = "This change will not come into effect until you save this macro."
--[[Translation missing --]]
L["This CVAR makes WoW use your abilities when you press the key not when you release it.  To use GSE in its native configuration this needs to be checked."] = "This CVAR makes WoW use your abilities when you press the key not when you release it.  To use GSE in its native configuration this needs to be checked."
--[[Translation missing --]]
L["This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will clear the spell cache and any mappings between individual spellIDs and spellnames.."
--[[Translation missing --]]
L["This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."] = "This function will open a window enabling you to edit the spell cache and any mappings between individual spellIDs and spellnames.."
L["This function will remove the SHIFT+N, ALT+N and CTRL+N keybindings for this character.  Useful if [mod:shift] etc conditions don't work in game."] = "Эта функция удалит привязки клавиш SHIFT+N, ALT+N и CTRL+N для этого персонажа. Полезно, если условия [mod:shift] и т.д. не работают в игре."
L["This function will update macro stubs to support listening to the options below.  This is required to be completed 1 time per character."] = "Эта функция обновит заглушки макросов для поддержки прослушивания приведенных ниже параметров. Это требуется выполнить 1 раз для каждого персонажа."
L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = "Это небольшой аддон, который позволяет создавать последовательность макросов, которые будут выполняться одним нажатием кнопки."
--[[Translation missing --]]
L["This is needed for ConsolePort and BindPad."] = "This is needed for ConsolePort and BindPad."
L["This is the only version of this macro.  Delete the entire macro to delete this version."] = "Это единственная версия этого макроса. Удалите весь макрос, чтобы удалить эту версию."
--[[Translation missing --]]
L["This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."] = "This macro uses features that are not available in this version. You need to update GSE to %s in order to use this macro."
--[[Translation missing --]]
L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."
L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = "Этот параметр выводит дополнительную информацию трассировки в окне чата, чтобы помочь устранить проблемы"
--[[Translation missing --]]
L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = "This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."
--[[Translation missing --]]
L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."] = "This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a KeyRelease.  Turning this on will trigger a Scam warning about running custom scripts."
L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = "Этот параметр предотвращает запуск макросов, если у вас нет цели. Помогает уменьшить ошибочное нацеливание на других мобов/групп, когда ваша цель умирает."
--[[Translation missing --]]
L["This sequence is Read Only and unable to be edited."] = "This sequence is Read Only and unable to be edited."
L["This Sequence was exported from GSE %s."] = "Эта последовательность была экспортирована из GSE %s."
--[[Translation missing --]]
L["This setting forces the ActionButtonUseKeyDown setting one way or another.  It also reconfigures GSE's Macro Stubs to operate in the specified mode."] = "This setting forces the ActionButtonUseKeyDown setting one way or another.  It also reconfigures GSE's Macro Stubs to operate in the specified mode."
--[[Translation missing --]]
L["This shows the Global Macros available as well as those for your class."] = "This shows the Global Macros available as well as those for your class."
--[[Translation missing --]]
L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = "This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."
--[[Translation missing --]]
L["This will display debug messages for the "] = "This will display debug messages for the "
--[[Translation missing --]]
L["This will display debug messages for the GSE Ingame Transmission and transfer"] = "This will display debug messages for the GSE Ingame Transmission and transfer"
--[[Translation missing --]]
L["This will display debug messages in the Chat window."] = "This will display debug messages in the Chat window."
L["Timewalking"] = "Путешествие во времени"
--[[Translation missing --]]
L["Timewalking setting changed to Default."] = "Timewalking setting changed to Default."
--[[Translation missing --]]
L["Title Colour"] = "Title Colour"
--[[Translation missing --]]
L["To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"] = "To correct this either delete the version via the GSE Editor or enter the following command to delete this macro totally.  %s/run GSE.DeleteSequence (%i, %s)%s"
--[[Translation missing --]]
L["To get started "] = "To get started "
--[[Translation missing --]]
L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = "To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."
--[[Translation missing --]]
L["Translate to"] = "Translate to"
--[[Translation missing --]]
L["Translated Sequence"] = "Translated Sequence"
L["Trinket 1"] = "Аксессуар 1"
L["Trinket 2"] = "Аксессуар 2"
--[[Translation missing --]]
L["Troubleshooting"] = "Troubleshooting"
--[[Translation missing --]]
L["Two sequences with unknown sources found."] = "Two sequences with unknown sources found."
--[[Translation missing --]]
L["Unable to interpret sequence."] = "Unable to interpret sequence."
--[[Translation missing --]]
L["Unable to process content.  Fix table and try again."] = "Unable to process content.  Fix table and try again."
--[[Translation missing --]]
L["Unknown Author|r "] = "Unknown Author|r "
--[[Translation missing --]]
L["Unknown Colour"] = "Unknown Colour"
--[[Translation missing --]]
L["Unrecognised Import"] = "Unrecognised Import"
--[[Translation missing --]]
L["Up forces GSE into ActionButtonUseKeyDown=0 while Down forces GSE into ActionButtonUseKeyDown=1"] = "Up forces GSE into ActionButtonUseKeyDown=0 while Down forces GSE into ActionButtonUseKeyDown=1"
L["Update"] = "Обновить"
--[[Translation missing --]]
L["Update Macro Stubs"] = "Update Macro Stubs"
--[[Translation missing --]]
L["Update Macro Stubs."] = "Update Macro Stubs."
--[[Translation missing --]]
L["Update Talents"] = "Update Talents"
--[[Translation missing --]]
L["Update the stored talents to match the current chosen talents."] = "Update the stored talents to match the current chosen talents."
--[[Translation missing --]]
L["Updated Macro"] = "Updated Macro"
--[[Translation missing --]]
L["UpdateSequence"] = "Update Sequence"
L["Updating due to new version."] = "Обновление в связи с новой версией."
L["Use"] = "Использовать"
--[[Translation missing --]]
L["Use Belt Item in KeyRelease"] = "Use Belt Item in KeyRelease"
--[[Translation missing --]]
L["Use External MS Timings"] = "Use External MS Timings"
--[[Translation missing --]]
L["Use First Ring in KeyRelease"] = "Use First Ring in KeyRelease"
--[[Translation missing --]]
L["Use First Trinket in KeyRelease"] = "Use First Trinket in KeyRelease"
--[[Translation missing --]]
L["Use Global Account Macros"] = "Use Global Account Macros"
--[[Translation missing --]]
L["Use Head Item in KeyRelease"] = "Use Head Item in KeyRelease"
--[[Translation missing --]]
L["Use Macro Translator"] = "Use Macro Translator"
--[[Translation missing --]]
L["Use Neck Item in KeyRelease"] = "Use Neck Item in KeyRelease"
--[[Translation missing --]]
L["Use Realtime Parsing"] = "Use Realtime Parsing"
--[[Translation missing --]]
L["Use Second Ring in KeyRelease"] = "Use Second Ring in KeyRelease"
--[[Translation missing --]]
L["Use Second Trinket in KeyRelease"] = "Use Second Trinket in KeyRelease"
--[[Translation missing --]]
L["Use Verbose Export Sequence Format"] = "Use Verbose Export Sequence Format"
--[[Translation missing --]]
L["Use WLM Export Sequence Format"] = "Use WLM Export Sequence Format"
L["Value"] = "Значение"
L["Variables"] = "Переменные"
--[[Translation missing --]]
L["Version"] = "Version"
--[[Translation missing --]]
L["Version="] = "Version="
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
L["Website or forum URL where a player can get more information or ask questions about this macro."] = "URL-адрес веб-сайта или форума, где игрок может получить дополнительную информацию или задать вопросы об этом макросе."
L[ [=[What are the preferred talents for this macro?
'1,2,3,1,2,3,1' means First row choose the first talent, Second row choose the second talent etc]=] ] = [=[Какие таланты предпочтительны для этого макроса? 
«1,2,3,1,2,3,1» означает, что первая строка выбирает первый талант, вторая строка выбирает второй талант и т. д.]=]
L["What class or spec is this macro for?  If it is for all classes choose Global."] = [=[Для какого класса или специализации предназначен этот макрос? 
Если это для всех классов, выберите Global.]=]
--[[Translation missing --]]
L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = "When creating a macro, if there is not a personal character macro space, create an account wide macro."
--[[Translation missing --]]
L["When debugging the output of a sequence, show the full executed block in the Debugger Output."] = "When debugging the output of a sequence, show the full executed block in the Debugger Output."
--[[Translation missing --]]
L["When exporting a sequence create a stub entry to import for WLM's Website."] = "When exporting a sequence create a stub entry to import for WLM's Website."
--[[Translation missing --]]
L["When exporting a sequence use a human readable verbose form."] = "When exporting a sequence use a human readable verbose form."
--[[Translation missing --]]
L["When GSE imports a macro and it already exists locally and has local edits, what do you want the default action to be.  Merge - Add the new MacroVersions to the existing Macro.  Replace - Replace the existing macro with the new version. Ignore - ignore updates.  This default action will set the default on the Compare screen however if the GUI is not available this will be the action taken."] = "When GSE imports a macro and it already exists locally and has local edits, what do you want the default action to be.  Merge - Add the new MacroVersions to the existing Macro.  Replace - Replace the existing macro with the new version. Ignore - ignore updates.  This default action will set the default on the Compare screen however if the GUI is not available this will be the action taken."
--[[Translation missing --]]
L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = "When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"
--[[Translation missing --]]
L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = "When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"
--[[Translation missing --]]
L["When you log into a class without any macros, prompt to load the sample macros."] = "When you log into a class without any macros, prompt to load the sample macros."
--[[Translation missing --]]
L["Window Sizes"] = "Window Sizes"
L["Yes"] = "Да"
--[[Translation missing --]]
L["You cannot delete the Default version of this macro.  Please choose another version to be the Default on the Configuration tab."] = "You cannot delete the Default version of this macro.  Please choose another version to be the Default on the Configuration tab."
--[[Translation missing --]]
L["You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = "You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "
--[[Translation missing --]]
L["You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"] = "You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"
--[[Translation missing --]]
L["You need to reload the User Interface to complete this task.  Would you like to do this now?"] = "You need to reload the User Interface to complete this task.  Would you like to do this now?"
--[[Translation missing --]]
L["Your ClassID is "] = "Your ClassID is "
--[[Translation missing --]]
L["Your current Specialisation is "] = "Your current Specialisation is "
--[[Translation missing --]]
L["Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."] = "Your sequence name was longer than 27 characters.  It has been shortened from %s to %s so that your macro will work."


