---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local tooltipOptionsLocales = {
    ["Tooltips"] = {
        ["ptBR"] = "Dicas de ferramentas",
        ["ruRU"] = "Подсказки",
        ["deDE"] = "Tooltip",
        ["koKR"] = "툴팁",
        ["esMX"] = "Tooltips",
        ["enUS"] = true,
        ["zhCN"] = "悬浮窗提示",
        ["zhTW"] = "浮動提示資訊",
        ["esES"] = "Tooltips",
        ["frFR"] = "Infobulle",
    },
    ["Tooltip Options"] = {
        ["ptBR"] = "Opções de dica de ferramenta",
        ["ruRU"] = "Настройки всплывающих подсказок",
        ["deDE"] = "Tooltip-Optionen",
        ["koKR"] = "툴팁 옵션",
        ["esMX"] = "Opciones de tooltip",
        ["enUS"] = true,
        ["zhCN"] = "悬浮窗提示选项",
        ["zhTW"] = "浮動提示資訊選項",
        ["esES"] = "Opciones de tooltip",
        ["frFR"] = "Options des infobulles",
    },
    ["Only show party members"] = {
        ["ptBR"] = "Apenas mostrar membros do grupo",
        ["ruRU"] = "Только от игроков группы",
        ["deDE"] = "Party nur geteilt",
        ["koKR"] = "파티만 공유",
        ["esMX"] = "Mostrar solo miembros del grupo",
        ["enUS"] = true,
        ["zhCN"] = "仅限队伍",
        ["zhTW"] = "只顯示隊友的任務",
        ["esES"] = "Mostrar solo miembros del grupo",
        ["frFR"] = "Partage avec le groupe uniquement",
    },
    ["When this is enabled, shared quest info will only show players in your party."] = {
        ["ptBR"] = "Se ativado, as informações compartilhadas das missões serão mostradas apenas se forem de membros do grupo.",
        ["ruRU"] = "Когда включено, информация о таком же, как у вас, задании будет отображаться только от членов группы",
        ["deDE"] = "Wenn dies aktiviert ist, werden freigegebene Questinformationen nur angezeigt, wenn sie von Gruppenmitgliedern stammen.",
        ["koKR"] = "이 기능을 활성화하면 공유 퀘스트 정보가 파티원의 정보 인 경우에만 표시됩니다.",
        ["esMX"] = "Si está activado, la información de misiones compartidas solo se mostrará si son de miembros del grupo.",
        ["enUS"] = true,
        ["zhCN"] = "启用后，仅当共享任务信息来自队伍其他成员时才会显示。",
        ["zhTW"] = "啟用時，只會分享隊伍中玩家的任務資訊。",
        ["esES"] = "Si está activado, la información de misiones compartidas solo se mostrará si son de miembros del grupo.",
        ["frFR"] = "Limite le partage des progressions avec les membres du groupe uniquement.",
    },
    ["Show quests in NPC tooltips"] = {
        ["ptBR"] = "Mostrar missões nas dicas",
        ["ruRU"] = "Задания в подсказках NPC",
        ["deDE"] = "Quests in NPC Tooltips anzeigen",
        ["koKR"] = "NPC 툴팁에 퀘스트 표시",
        ["esMX"] = "Mostrar misiones en el tooltip",
        ["enUS"] = true,
        ["zhCN"] = "显示任务 NPC",
        ["zhTW"] = "顯示 NPC 相關任務提示",
        ["esES"] = "Mostrar misiones en el tooltip",
        ["frFR"] = "Afficher les quêtes dans les infobulles",
    },
    ["Show quests (available/complete) in the NPC tooltips."] = {
        ["ptBR"] = "Mostra missões (disponíveis/concluídas) nas dicas de ferramentas do NPC.",
        ["ruRU"] = "Показать/скрыть задания (доступные/выполненные) во всплывающих подсказках NPC",
        ["deDE"] = "Zeigt Quests (verfügbar/abgeschlossen) in den NPC Tooltips.",
        ["koKR"] = "NPC 툴팁에 (가능한/완료한) 퀘스트표시",
        ["esMX"] = "Muestra misiones (disponibles/completadas) en el tooltip del PNJ.",
        ["enUS"] = true,
        ["zhCN"] = "启用后，在鼠标提示中显示NPC（可接/完成）任务。",
        ["zhTW"] = "在 NPC 的浮動提示資訊中顯示任務 (可接/完成)。",
        ["esES"] = "Muestra misiones (disponibles/completadas) en el tooltip del PNJ.",
        ["frFR"] = "Affiche les quêtes (disponibles / terminées) dans les infobulles des PNJ.",
    },
    ["Show quest XP at max level"] = {
        ["ptBR"] = "Mostrar EXP no nível máximo",
        ["ruRU"] = "Опыт на макс. уровне",
        ["deDE"] = "Zeige XP auf Max-Level",
        ["koKR"] = "최대 레벨에서 퀘스트 경험치 표시",
        ["esMX"] = "Mostrar EXP al nivel máximo",
        ["enUS"] = true,
        ["zhCN"] = "显示高等级的任务经验值",
        ["zhTW"] = "滿等時顯示任務經驗值",
        ["esES"] = "Mostrar EXP al nivel máximo",
        ["frFR"] = "Afficher le PX au niveau maximum",
    },
    ["Shows the quest XP values on quests even at max level."] = {
        ["ptBR"] = "Mostra os valores de experiência da missão mesmo no nível máximo.",
        ["ruRU"] = "Показывать опыт за задания даже на максимальном уровне персонажа",
        ["deDE"] = "Zeigt die Quest XP auch auf Max-Level an.",
        ["koKR"] = "최대 레벨에서도 퀘스트 경험치 값을 표시합니다.",
        ["esMX"] = "Muestra los valores de experiencia de misiones incluso al nivel máximo.",
        ["enUS"] = true,
        ["zhCN"] = "即使在最高等级,任务也会显示任务经验值。",
        ["zhTW"] = "滿等後也要顯示任務的經驗值。",
        ["esES"] = "Muestra los valores de experiencia de misiones incluso al nivel máximo.",
        ["frFR"] = "Affiche le montant d'expérience des quêtes, même au niveau maximum.",
    },
    ["Next in chain:"] = {
        ["ptBR"] = "Próxima missão:",
        ["ruRU"] = "Следующее в цепочке",
        ["deDE"] = "Folge-Quests in der Reihe:",
        ["koKR"] = "다음 연계 퀘스트",
        ["esMX"] = "Siguiente misión:",
        ["enUS"] = true,
        ["zhCN"] = "下一个任务链中的任务：",
        ["zhTW"] = "後續任務:",
        ["esES"] = "Siguiente misión:",
        ["frFR"] = "Prochaine quête :",
    },
    ["Show next quests in chain"] = {
        ["ptBR"] = "Mostrar próximas missões",
        ["ruRU"] = "Показывать следующие задания в цепочке",
        ["deDE"] = "Zeige nächste Quests der Reihe",
        ["koKR"] = "연계 퀘스트 표시",
        ["esMX"] = "Mostrar siguientes misiones",
        ["enUS"] = true,
        ["zhCN"] = "显示下一个任务链中的任务",
        ["zhTW"] = "顯示後續任務",
        ["esES"] = "Mostrar siguientes misiones",
        ["frFR"] = "Afficher les prochaines quêtes",
    },
    ["When this is checked, the next quests in the chain will show in the expanded map tooltips."] = {
        ["ptBR"] = "Se ativado, as próximas missões na série serão mostradas nas dicas de mapa expandidas.",
        ["ruRU"] = "Когда включено, следующие задания в цепочке будут отображаться в расширенной подсказке на карте",
        ["deDE"] = "Wenn ausgewählt, werden die nächsten Quests der Reihe in den erweiterten Map-Tooltips angezeigt.",
        ["koKR"] = "이 옵션을 선택하면 연계 퀘스트가 확장된 지도 툴팁에 표시됩니다.",
        ["esMX"] = "Si está activado, las siguientes misiones en la serie se mostrarán en los tooltips de mapa expandidos.",
        ["enUS"] = true,
        ["zhCN"] = "开启后，下一个任务链中的任务会在悬浮窗中显示",
        ["zhTW"] = "勾選時，會在展開的地圖浮動提示資訊中顯示任務串中的下一個任務。",
        ["esES"] = "Si está activado, las siguientes misiones en la serie se mostrarán en los tooltips de mapa expandidos.",
        ["frFR"] = "Les prochaines quêtes de la série seront affichées dans les infobulles de carte étendue.",
    },
}

for k, v in pairs(tooltipOptionsLocales) do
    l10n.translations[k] = v
end
