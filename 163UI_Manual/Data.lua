--[[
	163UI_MANUAL
--]]

local addon, ns = ...;

ns.def = {
	DEFAULT_FONT = GameFontNormal:GetFont(),
	NODE_DEFAULT_FONTSIZE = 16,

	WIDTH = 512,
	HEIGHT = 512,
	BG_COLOR = { 0.0, 0.0, 0.0, 0.75, },
	BORDER_WIDTH = 2,
	BORDER_COLOR = { 1.0, 0.0, 0.0, 1.0, },
	POINT = { "CENTER" },

	TAB_WIDTH = 64,
	TAB_HEIGHT = 28,
	TAB_NORMAL_COLOR = { 0.0, 0.0, 0.0, 0.5, },
	TAB_PUSHED_COLOR = { 0.0, 0.0, 0.0, 0.25, },
	TAB_HIGHLIGHT_COLOR = { 0.0, 0.25, 0.5, 0.5, },
	TAB_BORDER_WIDTH = 2,
	TAB_BORDER_COLOR = { 0.0, 0.0, 0.0, 1.0, },
	TAB_INT_X = 4,
	TAB_INT_Y = 2,
	TAB_FONTSIZE = 16,

	HEADER_HEIGHT = 10,
	HEADER_INT_X = 8,
	HEADER_INT_Y = 1,
	FOOTER_HEIGHT = 5,
	FOOTER_INT_X = 8,
	FOOTER_INT_Y = 10,

	DISPLAY_INT_X = 4,
	DISPLAY_INT_Y = 4,
	SCROLLBAR_WIDTH = 6,
	SCROLLBAR_INT_X = 4,
	SCROLLBAR_INT_Y = 4,
	SCROLLBAR_THUMB_WIDTH = 4,
	SCROLLBAR_THUMB_HEIGHT = 32,

	BUTTON_WIDTH = 64,
	BUTTON_HEIGHT = 22,
	BUTTON_NORMAL_COLOR = { 0.0, 0.0, 0.0, 0.5, },
	BUTTON_PUSHED_COLOR = { 0.0, 0.0, 0.0, 0.25, },
	BUTTON_HIGHLIGHT_COLOR = { 0.0, 0.25, 0.5, 0.5, },
	BUTTON_BORDER_WIDTH = 2,
	BUTTON_BORDER_COLOR = { 0.0, 0.0, 0.0, 1.0, },
};
ns.contents = {
	header = {
		left = {
			type = "text",
			fontsize = 20,
			value = "LEFT",
		},
		center = {
			type = "text",
			fontsize = 20,
			value = "HEADER",
		},
		right = {},
	},
	{
		label = "首页",
		content = {
			{
				type = "text",
				font = GameFontNormal:GetFont(),
				fontsize = 48,
				red = 1.0,
				green = 0.0,
				blue = 0.0,
				value = "|cffff0000网易助手正式服|r",
			},
			{
				type = "text",
				fontsize = 14,
				alignment = "LEFT",
				additional_ofs = 16,
				value = "版本号:A1.0\n"
				.. "常见问题：\n"
				.. "1、如果你要关闭/开启某个插件，请看小地图红心按钮，打开控制台进行操作。\n"
				.. "2、界面的一些小功能被收纳在“额外设置”里，拖动图标功能收纳在“面板移动”功能里。\n"
				.. "3、你自己安装的非“网易有爱”整合包的插件，在单体插件列表里寻找。\n"
				.. "4、你进行过关闭/开启插件或者功能，请点击“重载界面”按钮或者聊天框输入/RL，回车。\n"
			},
		},
	},
	{},
	{
		label = "系统宏",
		content = {
			{
				type = "text",
				alignment = "LEFT",
				value = "系统伤害数字/治疗数字不显示(包括宠物、DOT等伤害不显示)\n"
				.. "/console floatingCombatTextCombatDamage 1\n"
				.. "/console floatingCombatTextCombatHealing 1\n"
				.. "/console floatingcombattextpetmeleedamage 1\n"
				.. "/console floatingcombattextpetspelldamage 1\n"
				.. "\n"
				.. "系统默认伤害黄字大小调整到1.4倍\n"
				.. "/console WorldTextScale 1.4\n"
				.. "\n"
				.. "系统默认伤害数字修改战斗字体跳出的方式\n"
				.. "/console floatingCombatTextCombatDamageDirectionalScale 0或1~5\n"
				.. "\n"
				.. "41码敌方血条\n"
				.. '/script SetCVar("nameplateMaxDistance",41)\n'
				.. "\n"
				.. "怪物血条没了，只剩名字和等级\n"
				.. '/run SetCVar("nameplateShowOnlyNames",0) ReloadUI()\n'
				.. "\n"
				.. "自动装备对比宏\n"
				.. '/run SetCVar("alwaysCompareItems","1")\n'
				.. "\n"
				.. "血量同步宏\n"
				.. "/run SetCVar('predictedHealth',1)\n"
				.. "\n"
				.. "自动追踪任务命令\n"
				.. '/run SetCVar("autoQuestWatch", 1) ReloadUI()\n'
				.. "\n"
				.. "以下的三个阻断宏，使用以后，这台电脑就会从云端断开，不再同步云端设置，防止本地系统设置包括cvar设置被其他上号的人修改出奇怪设置。\n"
				.. "取消界面设置的同步，阻断宏1\n"
				.. '/console synchronizeConfig 0\n'
				.. '取消键位设置的同步，阻断宏2\n'
				.. '/console synchronizeBindings 0\n'
				.. "取消宏的同步，阻断宏3\n"
				.. '/console synchronizeMacros 0\n'
			},
		},
	},
	{
		label = "常用宏",
		content = {
			{
				type = "text",
				alignment = "LEFT",
				value = "当前打断+焦点打断+鼠标指向--打断整合宏（技能名字自行修改）\n"
				.. "#showtooltip 法术反制\n"
				.. "/cast [@mouseover,harm,nodead,exists][@focus,harm,nodead,exists][]法术反制\n"
				.. "\n"
				.. "鼠标指向宏（对敌方）（优先鼠标指向，然后当前目标）技能自行修改\n"
				.. "#showtooltip 寒冰箭\n"
				.. "/cast [@mouseover,harm,nodead,exists][]寒冰箭\n"
				.. "\n"
				.. "鼠标指向加血（技能自行修改）\n"
				.. "#showtooltip 快速治疗\n"
				.. "/cast [@mouseover,help,nodead,exists][help,nodead][]快速治疗\n"
				.. "\n"
				.. "系统默认伤害数字修改战斗字体跳出的方式\n"
				.. "/console floatingCombatTextCombatDamageDirectionalScale 0或1~5\n"
				.. "\n"
				.. "打断当前施法，强制打断（技能自行修改）\n"
				.. '#showtooltip 法术反制\n'
				.. "/stopcasting\n"
				.. "/cast 法术反制\n"
				.. "\n"
				.. '取消某个BUFF宏（技能自行修改）\n'
				.. "#showtooltip 保护祝福\n"
				.. "/cancelaura 保护祝福\n"
				.. "\n"
				.. '顺序施放技能宏，reset后面可以修改时间重置顺序（技能自行修改）\n'
				.. "#showtooltip 神圣之星\n"
				.. "/castsequence reset=15 神圣之星,治疗之环\n"
			},
		},
	},
	{
		label = "问题反馈",
		content = {
			{
				type = "text",
				font = GameFontNormal:GetFont(),
				fontsize = 15,
				red = 1.0,
				green = 0.0,
				blue = 0.0,
				value = "您在游戏里遇到任何问题都可以到网易大神APP--魔兽圈子--有爱插件栏目进行反馈，我们会及时给您回复！"
			},
			{
				111
			},
		},
	},
	{},
	{},
	{
		label = "视频教程",
		content = {
			{
				type = "text",
				alignment = "LEFT",
				value = "视频教程\n"
				.. "1、插件包安装教程详解：\n"
				.. "2、经典版控制台使用教程、关键插件（额外设置，框体移动）的设置教程：\n"
				.. "3、Elvui移动位置演示，WA移动位置演示/调整大小演示：\n"
				.. "4、Elvui导入导出字符串，WA导入导出字符串引导，字体大小修改，头像取消演示：\n"
				.. "5、系统参数，例如画面质量等一些优化设置：\n"
		},
	},
	{},
	},
	footer = {
		right = {
			type = "button",
			fontsize = 15,
			text = "关闭",
			value = function(self, button)
				local namespace = self.namespace;
				namespace.Main:Hide();
			end,
		},
	},
};
