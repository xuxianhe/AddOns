local L = BigWigsAPI:NewLocale("BigWigs", "ptBR")
if not L then return end

--L.tempMessage = "Your bar positions have reset, but you can now Import/Export profiles."

-- Core.lua
L.berserk = "Frenesi"
L.berserk_desc = "Mostra uma barra e um contador para quando o chefe entrar em Frenesi."
L.altpower = "Alterar como o poder é mostrado"
L.altpower_desc = "Mostra a janela alternativa de poder, que mostra o quanto de poder alternativo os membros do grupo têm."
L.infobox = "Caixa de informações"
L.infobox_desc = "Exibe uma caixa com informações relacionadas ao encontro."
L.stages = "Estágios"
L.stages_desc = "Ativar funções relacionadas às várias fases do encontro com o chefe, como alertas de mudança de fase, barras de temporizador de duração da fase, etc."
L.warmup = "Preparar"
L.warmup_desc = "Tempo até o combate com o chefe começar."
L.proximity = "Exibição de proximidade"
L.proximity_desc = "Mostra a janela de proximidade quando for apropriada para este encontro, listando os jogadores que estão muito pertos de você."
L.adds = "Adds"
L.adds_desc = "Ativar funções relacionadas aos vários adds que aparecerão durante o encontro com o chefe."
L.health = "Vida"
L.health_desc = "Ativa funções para exibir várias informações de vida durante o encontro com o chefe."

L.already_registered = "|cffff0000ATENÇÃO:|r |cff00ff00%s|r (|cffffff00%s|r) já existe como um módulo do BigWigs, mas as vezes ele tenta registra-lo novamente. Isso normalmente significa que você tem duas cópias deste módulo na sua pasta de addons devido a alguma falha ao atualizar um addon. É recomendado que você delete todas as pastas do BigWigs existentes e reinstale-o novamente."

-- Loader / Options.lua
L.okay = "Ok"
L.officialRelease = "Você está executando uma versão oficial do BigWigs %s (%s)"
L.alphaRelease = "Você está executando uma versão ALPHA do BigWigs %s (%s)"
L.sourceCheckout = "Você está executando uma cópia de código do BigWigs %s diretamente do repositório."
L.guildRelease = "Você está usando a versão %d do BigWigs feito para sua guilda, baseado na versão %d do addon oficial."
L.getNewRelease = "Seu BigWigs está desatualizado (/bwv) mas você pode facilmente atualizá-lo usando o CurseForge Client. Como alternativa, você pode atualizar manualmente em curseforge.com ou wowinterface.com."
L.warnTwoReleases = "Seu BigWigs está 2 versões desatualizado! Sua versão provavelmente contém bugs, faltam funcionalidades, ou possui contadores incorretos. É extremamente recomendado uma atualização."
L.warnSeveralReleases = "|cffff0000Seu BigWigs está %d versões desatualizado!! Nós recomendamos EXTREMAMENTE a atualização para prevenir problemas de sincronização com outros jogadores!|r"
L.warnOldBase = "Você está usando uma versão de guilda do BigWigs (%d), mas sua versão base (%d) está %d versões desatualizada. Isso pode causar problemas."

L.tooltipHint = "|cffeda55fClique-Direito|r para acessar as opções."
L.activeBossModules = "Módulos de chefes ativos:"

L.oldVersionsInGroup = "Existem pessoas no seu grupo com uma versão antiga ou sem o BigWigs. Você pode ver mais detalhes com /bwv."
L.upToDate = "Atualizado:"
L.outOfDate = "Desatualizado:"
L.dbmUsers = "Usuários do DBM:"
L.noBossMod = "Sem mod de chefes:"
L.offline = "Desconectado"

L.missingAddOn = "O addon |cFF436EEE%s|r está faltando!"
L.disabledAddOn = "Você desabilitou o addOn |cFF436EEE%s|r, contadores não serão exibidos."
L.removeAddOn = "Por favor remova '|cFF436EEE%s|r' porque este foi substituído por '|cFF436EEE%s|r'."
L.alternativeName = "%s (|cFF436EEE%s|r)"

L.expansionNames = {
	"Classic", -- Classic
	"The Burning Crusade", -- The Burning Crusade
	"Wrath of the Lich King", -- Wrath of the Lich King
	"Cataclysm", -- Cataclysm
	"Mists of Pandaria", -- Mists of Pandaria
	"Warlords of Draenor", -- Warlords of Draenor
	"Legion", -- Legion
	"Battle for Azeroth", -- Battle for Azeroth
	"Shadowlands", -- Shadowlands
	"Dragonflight", -- Dragonflight
	"The War Within", -- The War Within
}
L.littleWigsExtras = {
	["LittleWigs_Delves"] = "Delves",
	["LittleWigs_CurrentSeason"] = "Temporada Atual",
}

-- Media.lua (These are the names of the sounds in the dropdown list in the "sounds" section)
L.Beware = "Cuidado (Algalon)"
L.FlagTaken = "Bandeira capturada (JvJ)"
L.Destruction = "Destruição (Kil'jaeden)"
L.RunAway = "Corra, garotinha! (Lobo Mau)"
L.spell_on_you = "BigWigs: Feitiço em você"
L.spell_under_you = "BigWigs: Feitiço debaixo de você"

-- Options.lua
L.options = "Opções"
L.optionsKey = "ID: %s" -- The ID that messages/bars/options use
L.raidBosses = "Chefes de Raide"
L.dungeonBosses = "Chefes de Masmorra"
L.introduction = "Bem-vindo ao BigWigs, onde os encontros com chefes vagam. Por favor, aperte seu cinto, prepare um lanchinho e desfrute do passeio. Não iremos acabar com todos os problemas, mas vamos ajudar a se preparar para todos esses novos encontros de chefe como um jantar chique para todo o seu grupo de raide."
L.sound = "Som"
L.minimapIcon = "Ícone do minimapa"
L.minimapToggle = "Altera mostrar/ocultar o ícone do minimapa."
L.compartmentMenu = "Sem icone de compartimento"
L.compartmentMenu_desc = "Desativar esta opção fará com que BigWigs apareça no menu do compartimento de Addons. Recomendamos deixar esta opção habilitada."
L.configure = "Configurar"
L.resetPositions = "Resetar posições"
L.colors = "Cores"
L.selectEncounter = "Selecionar Encontro"
--L.privateAuraSounds = "Private Aura Sounds"
--L.privateAuraSounds_desc = "Private auras can't be tracked normally, but you can set a sound to be played when you are targeted with the ability."
L.listAbilities = "Listar habilidades no bate-papo do grupo"

L.dbmFaker = "Faz de conta que eu estou usando DBM"
L.dbmFakerDesc = "Se um usuário do DBM tem uma versão que verifica quem está usando DBM, ele irá vê-lo na lista. Útil para guildas que forçam usar o DBM."
L.zoneMessages = "Mostrar mensagens da zona atual"
L.zoneMessagesDesc = "Desativar isso irá parar de mostrar mensagens quando você entra em uma zona que BigWigs possui contadores, mas você não o instalou. Nós recomendamos que você deixe ligado, pois é a única notificação que você vai receber se nós criarmos contadores para uma nova zona que você ache útil."
L.englishSayMessages = "Mensagens de 'Diz' apenas em inglês"
L.englishSayMessagesDesc = "Todas as mensagens 'Diz' e 'Grita' que você enviar no bate-papo durante um encontro com o chefe serão sempre em inglês. Pode ser útil se você estiver com um grupo de jogadores de idiomas mistos."

L.slashDescTitle = "|cFFFED000Comandos com barra:|r"
L.slashDescPull = "|cFFFED000/pull:|r Envia uma contagem regressiva do pull para a raide."
L.slashDescBreak = "|cFFFED000/break:|r Envia uma pausa dos contadores para a raide."
L.slashDescRaidBar = "|cFFFED000/raidbar:|r Envia uma barra personalizada para a raide."
L.slashDescLocalBar = "|cFFFED000/localbar:|r Cria uma barra personalizada que apenas você pode ver."
L.slashDescRange = "|cFFFED000/range:|r Abre o indicador de distância."
L.slashDescVersion = "|cFFFED000/bwv:|r Realiza uma verificação da versão do BigWigs."
L.slashDescConfig = "|cFFFED000/bw:|r Abre a configuração do BigWigs."

L.gitHubDesc = "|cFF33FF99BigWigs é um software de código aberto hospedado no GitHub. Nós sempre estamos procurando por novas pessoas para ajudar e todos são bem-vindos para dar uma olhada no nosso código, fazer contribuições e reportar erros. BigWigs é incrível como é hoje, na maioria das vezes, devido a toda comunidade do WoW que nos ajuda.|r"

L.BAR = "Barras"
L.MESSAGE = "Mensagens"
L.ICON = "Ícone"
L.SAY = "Diz"
L.FLASH = "Piscar"
L.EMPHASIZE = "Enfatizar"
L.ME_ONLY = "Apenas quando em mim"
L.ME_ONLY_desc = "Quando você ativar esta opção, mensagens para esta habilidade serão exibidas somente quando afetar você. Por exemplo: 'Bomba: Jogador' só será mostrado se for em você."
L.PULSE = "Pulso"
L.PULSE_desc = "Além de piscar na tela, você também pode ter um ícone relacionado com esta habilidade específica exibido momentaneamente no centro da tela para tentar chamar a sua atenção."
L.MESSAGE_desc = "A maioria das habilidades de encontro vem com uma ou mais mensagens que BigWigs irá mostrar na tela. Se você desativar esta opção, nenhuma das mensagens anexadas a esta opção, se houverem, serão exibidas."
L.BAR_desc = "Quando apropriado, barras são exibidas para algumas habilidades de encontro. Se essa habilidade é acompanhada por uma barra que você deseja ocultar, desabilite esta opção."
L.FLASH_desc = "Algumas habilidades podem ser mais importantes do que outras. Se você quiser que sua tela pisque quando essa habilidade está próxima ou for usada, marque esta opção."
L.ICON_desc = "BigWigs pode marcar os personagens afetados pelas habilidades com um ícone. Isso os torna mais fáceis de detectar."
L.SAY_desc = "Balões de mensagem são fáceis de detectar. BigWigs mostrará uma mensagem de /falar para anunciar as pessoas próximas sobre um efeito em você."
L.EMPHASIZE_desc = "Ativando esta opção, irá enfatizar quaisquer mensagens associadas a esta habilidade, fazendo-a maior e mais visível. Você pode ajustar o tamanho e a fonte da mensagem enfatizada nas opções principais em \"Mensagens\""
L.PROXIMITY = "Exibição de proximidade"
L.PROXIMITY_desc = "Habilidades as vezes requerem que vocês se espalhem. A exibição de proximidade será criada especialmente para essa habilidade, assim você pode ver rapidamente se está seguro ou não."
L.ALTPOWER = "Exibição de poder alternativo"
L.ALTPOWER_desc = "Alguns encontros usarão a mecânica de poder alternativo em jogadores em seu grupo. A exibição de poder alternativo fornece uma visão geral de quem tem o menor/maior poder, podendo ser útil para táticas ou atribuições específicas."
L.TANK = "Apenas Tanques"
L.TANK_desc = "Algumas habilidades são importantes apenas para os tanques. Se você quiser ver avisos para essa habilidade, independentemente do seu papel, desative esta opção."
L.HEALER = "Apenas Curandeiros"
L.HEALER_desc = "Algumas habilidades são importantes apenas para os curandeiros. Se você quiser ver avisos para essa habilidade, independentemente do seu papel, desative esta opção."
L.TANK_HEALER = "Apenas Tanques e Curandeiros"
L.TANK_HEALER_desc = "Algumas habilidades são importantes apenas para os tanques e curandeiros. Se você quiser ver avisos para essa habilidade, independentemente do seu papel, desative esta opção."
L.DISPEL = "Apenas Dissipadores"
L.DISPEL_desc = "Se você quiser ver avisos para essa habilidade, mesmo quando você não pode dissipa-lo, desative esta opção."
L.VOICE = "Voz"
L.VOICE_desc = "Se você tiver um plugin de voz instalado, esta opção lhe permitirá reproduzir um arquivo de som que fala este aviso em voz alta para você."
L.COUNTDOWN = "Contagem Regressiva"
L.COUNTDOWN_desc = "Se ativado, uma contagem regressiva sonora e visual será adicionado para os últimos 5 segundos. Imagine alguém contando regressivamente \"5... 4... 3... 2... 1...\" com um número grande no meio da tela."
L.CASTBAR_COUNTDOWN = "Contagem regressiva (Apenas barras de lançamento)"
L.CASTBAR_COUNTDOWN_desc = "Se ativado, uma contagem regressiva vocal e visual será adicionada nos últimos 5 segundos das barras de lançamento."
L.INFOBOX = L.infobox
L.INFOBOX_desc = L.infobox_desc
L.SOUND = "Som"
L.SOUND_desc = "Habilidades de chefe normalmente tocam sons para lhe ajudar a vê-las. Se você desabilitar esta opção, nenhum dos sons anexados a ele irão tocar."
L.CASTBAR = "Barras de Conjuração"
L.CASTBAR_desc = "Barras de Conjuração são mostradas as vezes em alguns chefes, normalmente para chamar a atenção para uma habilidade crítica. Se essa habilidade vem acompanhada de uma barra de conjuração que você quer esconder, desabilite essa opção."
L.SAY_COUNTDOWN = "Dizer Contagem Regressiva"
L.SAY_COUNTDOWN_desc = "Bolhas de bate-papo são fáceis de ver. BigWigs irá usar o bate-papo dizer para enviar várias mensagens de contagem regressiva para alertar pessoas ao seu redor que uma habilidade está para expirar."
L.ME_ONLY_EMPHASIZE = "Enfatizar (somente a mim)"
L.ME_ONLY_EMPHASIZE_desc = "Habilitar isso irá enfatizar qualquer mensagem associada a essa habilidade SOMENTE se for conjurada em você, fazenda elas mais largas e mais visíveis."
L.NAMEPLATEBAR = "Barras de identificação"
L.NAMEPLATEBAR_desc = "Barras são normalmente anexadas a barras de identificação quando mais de um mob conjura o mesmo feitiço. Se essa habilidade for acompanhada por uma barra de identificação que você quer esconder, desabilite essa opção."
L.PRIVATE = "Aura Privada"
L.PRIVATE_desc = "Auras privadas não podem ser rastreadas normalmente, mas o som \"em você\" (Aviso) pode ser definido na guia Som."

L.advanced = "Opções Avançadas"
L.back = "<< Voltar"

L.tank = "|cFFFF0000Alertas para Tanques apenas.|r "
L.healer = "|cFFFF0000Alertas para Curandeiros apenas.|r "
L.tankhealer = "|cFFFF0000Alertas para Tanques e Curandeiros.|r "
L.dispeller = "|cFFFF0000Alerta para Dissipadores apenas.|r "

-- Sharing.lua
--L.import = "Import"
--L.import_info = "After entering a string you can select what settings you would like to import.\nIf settings are not available in the import string they will not be selectable.\n\nThis import will only affect the general settings and does not affect boss specific settings."
--L.import_info_active = "Choose what parts you would like to import and then click the import button."
--L.import_info_none = "|cFFFF0000The import string is incompatible or out of date.|r"
--L.export = "Export"
--L.export_info = "Select which settings you would like to export and share with others.\n\nYou can only share general settings and these have no effect on boss specific settings."
--L.export_string = "Export String"
--L.export_string_desc = "Copy this BigWigs string if you want to share your settings."
--L.import_string = "Import String"
--L.import_string_desc = "Paste the BigWigs string you want to import here."
--L.position = "Position"
--L.settings = "Settings"
--L.position_import_bars_desc = "Import the position (anchors) of the bars."
--L.position_import_messages_desc = "Import the position (anchors) of the messages."
--L.position_import_countdown_desc = "Import the position (anchors) of the countdown."
--L.position_export_bars_desc = "Export the position (anchors) of the bars."
--L.position_export_messages_desc = "Export the position (anchors) of the messages."
--L.position_export_countdown_desc = "Export the position (anchors) of the countdown."
--L.settings_import_bars_desc = "Import the general bar settings such as size, font, etc."
--L.settings_import_messages_desc = "Import the general message settings such as size, font, etc."
--L.settings_import_countdown_desc = "Import the general countdown settings such as voice, size, font, etc."
--L.settings_export_bars_desc = "Export the general bar settings such as size, font, etc."
--L.settings_export_messages_desc = "Export the general message settings such as size, font, etc."
--L.settings_export_countdown_desc = "Export the general countdown settings such as voice, size, font, etc."
--L.colors_import_bars_desc = "Import the colors of the bars."
--L.colors_import_messages_desc = "Import the colors of the messages."
--L.color_import_countdown_desc = "Import the color of the countdown."
--L.colors_export_bars_desc = "Export the colors of the bars."
--L.colors_export_messages_desc = "Export the colors of the messages."
--L.color_export_countdown_desc = "Export the color of the countdown."
--L.confirm_import = "The selected settings you are about to import will overwrite the settings in your currently selected profile:\n\n|cFF33FF99\"%s\"|r\n\nAre you sure you want to do this?"
--L.confirm_import_addon = "The addon |cFF436EEE\"%s\"|r wants to automatically import new BigWigs settings that will overwrite the settings in your currently selected BigWigs profile:\n\n|cFF33FF99\"%s\"|r\n\nAre you sure you want to do this?"
--L.confirm_import_addon_new_profile = "The addon |cFF436EEE\"%s\"|r wants to automatically create a new BigWigs profile called:\n\n|cFF33FF99\"%s\"|r\n\nAccepting this new profile will also swap to it."
--L.confirm_import_addon_edit_profile = "The addon |cFF436EEE\"%s\"|r wants to automatically edit one of your BigWigs profiles called:\n\n|cFF33FF99\"%s\"|r\n\nAccepting these changes will also swap to it."
--L.no_string_available = "No import string stored to import. First import a string."
--L.no_import_message = "No settings were imported."
--L.import_success = "Imported: %s" -- Imported: Bar Anchors, Message Colors
--L.imported_bar_positions = "Bar Positions"
--L.imported_bar_settings = "Bar Settings"
--L.imported_bar_colors = "Bar Colors"
--L.imported_message_positions = "Message Positions"
--L.imported_message_settings = "Message Settings"
--L.imported_message_colors = "Message Colors"
--L.imported_countdown_position = "Countdown Position"
--L.imported_countdown_settings = "Countdown Settings"
--L.imported_countdown_color = "Countdown Color"

-- Statistics
L.statistics = "Estatísticas"
L.LFR = "LDR"
L.normal = "Normal"
L.heroic = "Heroico"
L.mythic = "Mítico"
L.wipes = "Derrotas:"
L.kills = "Mortes:"
L.best = "Melhor:"