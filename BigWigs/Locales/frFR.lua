local L = BigWigsAPI:NewLocale("BigWigs", "frFR")
if not L then return end

L.tempMessage = "Les positions de votre bar ont été réinitialisées, mais vous pouvez maintenant Importer et Exporter des profils."

-- Core.lua
L.berserk = "Berserk"
L.berserk_desc = "Prévient quand le boss devient fou furieux."
L.altpower = "Affichage de la ressource alternative"
L.altpower_desc = "Affiche la fenêtre de ressource alternative, qui montre la quantité de ressource alternative des membres de votre groupe."
L.infobox = "Boîte d'information"
L.infobox_desc = "Affiche une boîte d'information concernant la rencontre."
L.stages = "Phases"
L.stages_desc = "Active les fonctions relatives aux différentes phases lors d'un combat de boss tels quel les avertissements de changement de phase, les bars de durée de phase, etc."
L.warmup = "Préparation"
L.warmup_desc = "Temps avant que le combat face au boss ne commence."
L.proximity = "Affichage de proximité"
L.proximity_desc = "Affiche la fenêtre de proximité quand cela est approprié pour cette rencontre, indiquant la liste des joueurs qui se trouvent trop près de vous."
L.adds = "Adds"
L.adds_desc = "Active les fonctions relatives aux adds qui apparaissent durant le combat de boss."
L.health = "Vie"
L.health_desc = "Active les fonctions afin d'afficher diverses informations sur la vie durant le combat de boss."

L.already_registered = "|cffff0000ATTENTION :|r |cff00ff00%s|r (|cffffff00%s|r) existe déjà en tant que module dans BigWigs, mais quelque chose essaye de l'enregistrer à nouveau. Cela signifie souvent que vous avez deux copies de ce module dans votre répertoire AddOns suite à une mauvaise mise à jour d'un gestionnaire d'addons. Il est recommandé de supprimer tous les répertoires de BigWigs et de le réinstaller complètement."

-- Loader / Options.lua
L.okay = "OK"
L.officialRelease = "Vous utilisez une version FINALISÉE de BigWigs %s (%s)."
L.alphaRelease = "Vous utilisez une version ALPHA de BigWigs %s (%s)."
L.sourceCheckout = "Vous utilisez une version du dépôt de BigWigs %s."
L.guildRelease = "Vous utilisez la version %d de BigWigs spécialement conçue pour votre guilde, basée sur la version %d de l'addon officiel."
L.getNewRelease = "Votre BigWigs est ancien (/bwv), mais vous pouvez facilement le mettre à jour en utilisant le client CurseForge. Vous pouvez également le mettre à jour à partir de curseforge.com ou wowinterface.com."
L.warnTwoReleases = "Votre BigWigs est obsolète de 2 versions ! Votre version risque de contenir des bugs, des fonctionnalités manquantes, voire même des délais totalement incorrects. Il est recommandé de faire la mise à jour."
L.warnSeveralReleases = "|cffff0000Votre BigWigs est %d versions derrière la plus récente !! Il est VIVEMENT recommandé d'effectuer la mise à jour afin d'éviter tout problème de synchronisation avec les autres joueurs !|r"
L.warnOldBase = "Vous utilisez une version guilde de BigWigs (%d), mais votre version de base (%d) est %d releases en retard. Cela peut poser problèmes."

L.tooltipHint = "|cffeda55fClic droit|r pour accéder aux options."
L.activeBossModules = "Modules de boss actifs :"

L.oldVersionsInGroup = "Certains joueurs de votre groupe ont d'anciennes versions ou n'ont pas BigWigs. Tapez /bwv pour plus de détails."
L.upToDate = "À jour :"
L.outOfDate = "Périmé :"
L.dbmUsers = "Utilisateurs de DBM :"
L.noBossMod = "Pas de boss mod :"
L.offline = "Hors ligne"

L.missingAddOn = "L'addon |cFF436EEE%s|r est manquant !"
L.disabledAddOn = "L'addon |cFF436EEE%s|r est désactivé, les délais ne seront pas affichés."
L.removeAddOn = "Veuillez enlever '|cFF436EEE%s|r' étant donné qu'il a été remplacé par '|cFF436EEE%s|r'."
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
	["LittleWigs_CurrentSeason"] = "Current Season",
}

-- Media.lua (These are the names of the sounds in the dropdown list in the "sounds" section)
L.Beware = "Attention (Algalon)"
L.FlagTaken = "Drapeau pris (JcJ)"
L.Destruction = "Destruction (Kil'jaeden)"
L.RunAway = "Cours petite fille, cours (Le Grand Méchant Loup)"
L.spell_on_you = "BigWigs : sort sur vous"
L.spell_under_you = "BigWigs : sort en dessous de vous"

-- Options.lua
L.options = "Options"
L.optionsKey = "ID : %s" -- The ID that messages/bars/options use
L.raidBosses = "Boss de raid"
L.dungeonBosses = "Boss de donjon"
L.introduction = "Bienvenue sur BigWigs, votre compagnon des rencontres de boss. Attachez votre ceinture, gavez-vous de cacahouètes et profitez du voyage. Il ne fera pas de mal à vos enfants, mais vous aidera à préparer cette nouvelle rencontre de boss pour votre groupe de raid."
L.sound = "Son"
L.minimapIcon = "Icône de la minicarte"
L.minimapToggle = "Affiche ou non l'icône de la minicarte."
L.compartmentMenu = "Aucun icône de compartiment"
L.compartmentMenu_desc = "Désactiver cette option rendra Bigwigs visible dans le menu compartiment addon. Nous recommendons de laisser cette option activée."
L.configure = "Configuration"
L.resetPositions = "Réinitialiser les positions"
L.colors = "Couleurs"
L.selectEncounter = "Sélectionnez une rencontre"
L.privateAuraSounds = "Sons privés d'aura"
L.privateAuraSounds_desc = "Les auras privées ne peuvent être trackées normalement, mais vous pouvez enregistrer un son qui sera joué lorsque vous serez ciblé par la compétence."
L.listAbilities = "Lister les techniques dans la discussion de groupe"

L.dbmFaker = "Prétendre d'utiliser DBM"
L.dbmFakerDesc = "Si un utilisateur de DBM effectue une vérification des versions pour voir qui utilise DBM, il vous verra sur la liste. Utile pour les guildes qui forcent l'utilisation de DBM."
L.zoneMessages = "Afficher les messages de zone"
L.zoneMessagesDesc = "La désactivation de ceci enlevera les messages qui s'affichent quand vous entrez dans une zone pour laquelle BigWigs a un module de délais que vous n'avez pas installé. Nous vous recommendons de laisser ceci activé, étant donné qu'il s'agit de la seule notification que vous recevrez si nous ajoutons un module que vous n'avez pas pour une nouvelle zone qui vous intéresse."
L.englishSayMessages = "Messages dans le chat en anglais"
L.englishSayMessagesDesc = "Tous les messages envoyés durant les combats de boss dans les discussions 'dire' et 'crier' seront toujours en anglais. Cette option peut être utile lorsque votre groupe est multilingue."

L.slashDescTitle = "|cFFFED000Commandes :|r"
L.slashDescPull = "|cFFFED000/pull :|r envoie un compte à rebours de pull à votre raid."
L.slashDescBreak = "|cFFFED000/break :|r envoie un temps de pause à votre raid."
L.slashDescRaidBar = "|cFFFED000/raidbar :|r envoie une barre personnalisée à votre raid."
L.slashDescLocalBar = "|cFFFED000/localbar :|r créée une barre personnalisée que seul vous pouvez voir."
L.slashDescRange = "|cFFFED000/range :|r ouvre l'indicateur de portée."
L.slashDescVersion = "|cFFFED000/bwv :|r effectue une vérification des versions de BigWigs."
L.slashDescConfig = "|cFFFED000/bw :|r ouvre la fenêtre de configuration de BigWigs."

L.gitHubDesc = "|cFF33FF99BigWigs est un logiciel open source hébergé sur GitHub. Nous sommes toujours à la recherche de nouvelles personnes pour nous aider et tout le monde est le bienvenu pour inspecter notre code, effectuer des contributions et soumettre des rapports de bogues. BigWigs existe en grande partie grâce à l'aide précieuse de la communauté de WoW.|r"

L.BAR = "Barres"
L.MESSAGE = "Messages"
L.ICON = "Icône"
L.SAY = "Dire"
L.FLASH = "Flash"
L.EMPHASIZE = "Mise en évidence"
L.ME_ONLY = "Si cela m'affecte"
L.ME_ONLY_desc = "Quand vous activez cette option, les messages de cette technique ne seront affichés que si cette dernière vous affecte directement. Par exemple, 'Bombe : Joueur' ne sera affiché que si la bombe est sur vous."
L.PULSE = "Pulse"
L.PULSE_desc = "En plus de faire clignoter l'écran, vous pouvez également avoir une icône relative à cette technique qui s'affiche momentanément au milieu de votre écran pour attirer votre attention."
L.MESSAGE_desc = "La plupart des techniques des rencontres comportent un ou plusieurs messages que BigWigs affichera sur votre écran. Si vous désactivez cette option, aucun des messages attachés à cette option ne sera affiché."
L.BAR_desc = "Des barres sont affichées pour certaines techniques des rencontres quand cela est approprié. Si cette technique est accompagnée par une barre que vous souhaitez cacher, désactivez cette option."
L.FLASH_desc = "Certaines techniques sont plus importantes que d'autres. Si vous souhaitez que votre écran clignote quand cette technique est imminente ou utilisée, cochez cette option."
L.ICON_desc = "BigWigs peut marquer les joueurs affectés par des techniques avec une icône. Cela les rend plus faciles à repérer."
L.SAY_desc = "Les bulles de dialogue sont faciles à repérer. BigWigs fera dire un message à votre personnage pour avertir les joueurs proches qu'un effet vous affecte."
L.EMPHASIZE_desc = "L'activation de cette option mettra en évidence tous les messages associés à cette technique, les rendant plus grands et plus lisibles. Vous pouvez définir la taille et la police des messages mis en évidence dans les options principales sous la catégorie \"Messages\"."
L.PROXIMITY = "Affichage de proximité"
L.PROXIMITY_desc = "Certaines techniques nécessitent que vous vous espaciez. L'affichage de proximité sera paramétré spécifiquement pour cette technique afin que vous puissiez voir d'un coup d'oeil si vous êtes en sécurité."
L.ALTPOWER = "Affichage de la ressource alternative"
L.ALTPOWER_desc = "Certaines rencontres utilisent le mécanisme de ressource alternative sur les joueurs de votre groupe. L'affichage de la ressource alternative fournit un aperçu rapide de qui a le plus/le moins de ressource alternative, ce qui peut être utile pour des stratégies ou des attributions spécifiques."
L.TANK = "Tank uniquement"
L.TANK_desc = "Certaines techniques sont importantes uniquement pour les tanks. Si vous souhaitez voir des alertes pour cette technique quelque soit votre rôle, désactivez cette option"
L.HEALER = "Soigneur uniquement"
L.HEALER_desc = "Certaines techniques sont importantes uniquement pour les soigneurs. Si vous souhaitez voir des alertes pour cette technique quelque soit votre rôle, désactivez cette option"
L.TANK_HEALER = "Tank & soigneur uniquement"
L.TANK_HEALER_desc = "Certaines techniques sont importantes uniquement pour les tanks et les soigneurs. Si vous souhaitez voir des alertes pour cette technique quelque soit votre rôle, désactivez cette option."
L.DISPEL = "Dispeller uniquement"
L.DISPEL_desc = "Certaines techniques sont importantes uniquement pour les dispeller. Si vous souhaitez voir des alertes pour cette technique quelque soit votre rôle, désactivez cette option."
L.VOICE = "Voix"
L.VOICE_desc = "Si vous avez un plugin vocal installé, cette option l'activera afin qu'il puisse jouer un fichier son qui dira cette alerte à voix haute pour vous."
L.COUNTDOWN = "Compte à rebours"
L.COUNTDOWN_desc = "Si activé, un compte à rebours vocal et visuel sera ajouté lors des 5 dernières secondes. Imaginez quelqu'un faisant le décompte \"5... 4... 3... 2... 1...\" en plus d'un gros chiffre au milieu de votre écran."
L.CASTBAR_COUNTDOWN = "Compte à rebours (uniquement pour les barres d'incantation)"
L.CASTBAR_COUNTDOWN_desc = "Si activé, un compte à rebours vocal et visuel sera ajouté lors des 5 dernières secondes de la barre d'incantation."
L.INFOBOX = L.infobox
L.INFOBOX_desc = L.infobox_desc
L.SOUND = "Son"
L.SOUND_desc = "Les techniques des boss sont habituellement accompagnées de sons afin de vous aider à les repérer. Si vous désactivez cette option, aucun des sons qui l'accompagnent ne seront joués."
L.CASTBAR = "Barres d'incantation"
L.CASTBAR_desc = "Les barres d'incantation sont parfois affichées sur certains boss, habituellement pour attirer l'attention sur une technique critique imminente. Si cette technique est accompagnée d'une barre d'incantation que vous souhaitez cacher, désactivez cette option."
L.SAY_COUNTDOWN = "Dire le compte à rebours"
L.SAY_COUNTDOWN_desc = "Les bulles de discussion sont faciles à repérer. BigWigs utilisera plusieurs messages en compte à rebours pour avertir les personnes proches qu'une technique vous affectant est sur le point de disparaitre."
L.ME_ONLY_EMPHASIZE = "Mise en évidence (sur moi)"
L.ME_ONLY_EMPHASIZE_desc = "L'activation de cette option mettra en évidence tous les messages associés à cette technique UNIQUEMENT si vous en êtes la cible, les rendant plus grands et plus visibles."
L.NAMEPLATEBAR = "Barres d'info"
L.NAMEPLATEBAR_desc = "Des barres sont parfois attachées aux barres d'info des unités quand plus d'un monste incantent le même sort. Si cette capacité est accompagnée d'une barre d'info que vous voulez cacher, désactivez cette option."
L.PRIVATE = "Aura personnelle"
L.PRIVATE_desc = "Les auras personnelles ne peuvent pas être suivies, cependant le son \"sur vous\" (Avertissement) peut être activé dans l'onglet Son."

L.advanced = "Options avancées"
L.back = "<< Retour"

L.tank = "|cFFFF0000Alertes pour tank uniquement.|r "
L.healer = "|cFFFF0000Alertes pour soigneur uniquement.|r "
L.tankhealer = "|cFFFF0000Alertes pour tank & soigneur uniquement.|r "
L.dispeller = "|cFFFF0000Alertes pour dispeller uniquement.|r "

-- Sharing.lua
L.import = "Importer"
L.import_info = "Après avoir entré une chaîne, vous pouvez sélectionner quels paramètres vous souhaitez importer.\nSi les paramètres ne sont pas disponibles dans la chaîne d'import, ils ne seront pas sélectionnables.\n\nCet import n'affectera que les paramètres généraux et non les paramètres spécifiques à chaque boss."
L.import_info_active = "Choisissez quelles parties vous souhaitez importer, puis cliquez sur le bouton Importer."
L.import_info_none = "|cFFFF0000La chaîne d'import est incompatible ou périmée.|r"
L.export = "Exporter"
L.export_info = "Sélectionnez quels paramètres vous souhaitez exporter et partager avec les autres.\n\nVous ne pouvez partager que les paramètres généraux et ces derniers n'ont aucun effet sur les paramètres spécifiques de boss."
L.export_string = "Chaîne d'export"
L.export_string_desc = "Copiez cette chaîne de caractères BigWigs si vous voulez partager vos paramètres."
L.import_string = "Chaîne d'import"
L.import_string_desc = "Collez la chaîne de caractères BigWigs que vous souhaitez importer ici."
L.position = "Position"
L.settings = "Paramètres"
L.position_import_bars_desc = "Importer la position (ancres) des barres."
L.position_import_messages_desc = "Importer la position (ancres) des messages."
L.position_import_countdown_desc = "mporter la position (ancres) du compte à rebours."
L.position_export_bars_desc = "Exporter la position (ancres) des barres."
L.position_export_messages_desc = "Exporter la position (ancres) des messages."
L.position_export_countdown_desc = "Exporter la position (ancres) du compte à rebours."
L.settings_import_bars_desc = "Importez les paramètres généraux des barres, tels que la taille, la police, etc."
L.settings_import_messages_desc = "Importez les paramètres généraux des messages, tels que la taille, la police, etc."
L.settings_import_countdown_desc = "Importez les paramètres généraux du compte à rebours, tels que la voix, la taille, la police, etc."
L.settings_export_bars_desc = "Exportez les paramètres généraux des barres, tels que la taille, la police, etc."
L.settings_export_messages_desc = "Exportez les paramètres généraux des messages, tels que la taille, la police, etc."
L.settings_export_countdown_desc = "Exportez les paramètres généraux du compte à rebours, tels que la voix, la taille, la police, etc."
L.colors_import_bars_desc = "Importez la couleur des barres."
L.colors_import_messages_desc = "Importez la couleur des messages."
L.color_import_countdown_desc = "Importez la couleur du compte à rebours."
L.colors_export_bars_desc = "Exportez la couleur des barres."
L.colors_export_messages_desc = "Exportez la couleur des messages."
L.color_export_countdown_desc = "Exportez la couleur du compte à rebours."
L.confirm_import = "Les paramètres sélectionnés que vous êtes sur le point d'importer écraseront les paramètres du profil sélectionné actuellement :\n\n|cFF33FF99\"%s\"|r\n\nÊtes-vous sûr de vouloir continuer ?"
L.confirm_import_addon = "L'addon |cFF436EEE\"%s\"|r souhaite importer automatiquement de nouveaux paramètres BigWigs, qui écraserons les paramètres dans votre profil actuel :\n\n|cFF33FF99\"%s\"|r\n\nÊtes-vous sûr de vouloir continuer ?"
L.confirm_import_addon_new_profile = "L'addon |cFF436EEE\"%s\"|r souhaite créer automatiquement un nouveau profil BigWigs appelé :\n\n|cFF33FF99\"%s\"|r\n\nAccepter ce nouveau profil vous feras basculer sur ce dernier."
L.confirm_import_addon_edit_profile = "L'addon |cFF436EEE\"%s\"|r souhaite automatiquement éditer un de vos profils BigWigs appelé :\n\n|cFF33FF99\"%s\"|r\n\n Accepter ces changements vous fera basculter sur ce dernier."
L.no_string_available = "Aucune chaîne stockée à importer. D'abord, importez une chaîne."
L.no_import_message = "Aucun paramètre n'a été importé."
L.import_success = "Importé : %s" -- Imported: Bar Anchors, Message Colors
L.imported_bar_positions = "Position de la barre"
L.imported_bar_settings = "Paramètres de la barre"
L.imported_bar_colors = "Couleurs de la barre"
L.imported_message_positions = "Positions des messages"
L.imported_message_settings = "Paramètres des messages"
L.imported_message_colors = "Couleurs des messages"
L.imported_countdown_position = "Position du compte à rebours"
L.imported_countdown_settings = "Paramètres du compte à rebours"
L.imported_countdown_color = "Couleur du compte à rebours"

-- Statistics
L.statistics = "Statistiques"
L.LFR = "RdR"
L.normal = "Normal"
L.heroic = "Héroïque"
L.mythic = "Mythique"
L.wipes = "Échecs :"
L.kills = "Victoires :"
L.best = "Meilleur :"