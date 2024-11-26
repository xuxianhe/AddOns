--[[
	163UI_MANUAL
--]]

local addon, ns = ...;
--
local module = {  };

local TempIcon = [[Interface\Icons\INV_Misc_QuestionMark]];
----

function module:Init(def, contents)
	local Main = CreateFrame('FRAME', nil, UIParent);
	Main:SetFrameStrata("DIALOG");
	Main:SetSize(def.WIDTH, def.HEIGHT);
	Main:SetMouseClickEnabled(true);
	Main:SetMouseMotionEnabled(true);
	Main:SetPoint(unpack(def.POINT));
	Main:Hide();
	Main:SetMovable(true);
	Main:RegisterForDrag("LeftButton");
	Main:SetScript("OnDragStart", Main.StartMoving);
	Main:SetScript("OnDragStop", Main.StopMovingOrSizing);
	local MainBG = Main:CreateTexture(nil, "BACKGROUND");
	MainBG:SetAllPoints();
	MainBG:SetColorTexture(unpack(def.BG_COLOR));
	self:MakeBorder(Main, -def.BORDER_WIDTH, def.BORDER_WIDTH, unpack(def.BORDER_COLOR));

	local Header = CreateFrame('FRAME', nil, Main);
	Header:SetHeight(def.HEADER_HEIGHT);
	Header:SetPoint("TOP", Main, "TOP", 0, -def.HEADER_INT_Y);
	Header:SetPoint("LEFT", Main, "LEFT", def.HEADER_INT_X, 0);
	Header:SetPoint("RIGHT", Main, "RIGHT", -def.HEADER_INT_X, 0);

	local Display = CreateFrame('FRAME', nil, Main);
	Display:SetMouseClickEnabled(false);
	Display:SetMouseMotionEnabled(true);
	Display:SetPoint("BOTTOMLEFT", Main, "BOTTOMLEFT", def.DISPLAY_INT_X, def.FOOTER_INT_Y + def.FOOTER_HEIGHT + def.DISPLAY_INT_Y);
	Display:SetPoint("TOPRIGHT", Main, "TOPRIGHT", -def.SCROLLBAR_INT_X - def.SCROLLBAR_WIDTH - def.DISPLAY_INT_X, -def.HEADER_INT_Y - def.HEADER_HEIGHT - def.DISPLAY_INT_Y);
	Display:SetClipsChildren(true);

	local Footer = CreateFrame('FRAME', nil, Main);
	Footer:SetHeight(def.HEADER_HEIGHT);
	Footer:SetPoint("BOTTOM", Main, "BOTTOM", 0, def.FOOTER_INT_Y);
	Footer:SetPoint("LEFT", Main, "LEFT", def.FOOTER_INT_X, 0);
	Footer:SetPoint("RIGHT", Main, "RIGHT", -def.FOOTER_INT_X, 0);

	local ContentAnchor = CreateFrame('FRAME', nil, Display);
	ContentAnchor:SetSize(1, 1);
	ContentAnchor:SetPoint("TOP", Display, "TOP", 0);

	local Bar = CreateFrame('SLIDER', nil, Main);
	Bar:SetWidth(def.SCROLLBAR_WIDTH);
	Bar:SetMouseClickEnabled(true);
	Bar:SetMouseMotionEnabled(true);
	-- Bar:SetOrientation("VERTICAL");
	Bar:SetPoint("BOTTOMRIGHT", Main, "BOTTOMRIGHT", -def.SCROLLBAR_INT_X, def.FOOTER_INT_Y + def.FOOTER_HEIGHT + def.SCROLLBAR_INT_Y);
	Bar:SetPoint("TOPRIGHT", Main, "TOPRIGHT", -def.SCROLLBAR_INT_X, -def.HEADER_INT_Y - def.HEADER_HEIGHT - def.SCROLLBAR_INT_Y);
	Bar:SetThumbTexture(TempIcon);
	local Thumb = Bar:GetThumbTexture();
	if Thumb ~= nil then
		Thumb:Show();
		Thumb:SetColorTexture(1.0, 1.0, 1.0, 0.25);
		Thumb:SetWidth(def.SCROLLBAR_THUMB_WIDTH);
		Thumb:SetHeight(def.SCROLLBAR_THUMB_HEIGHT);
	end
	local BarBG = Bar:CreateTexture(nil, "BACKGROUND");
	BarBG:SetAllPoints();
	BarBG:SetColorTexture(0.0, 0.0, 0.0, 0.5);

	Display:SetScript("OnMouseWheel", self.Display_OnMouseWheel);
	Bar:SetScript("OnValueChanged", self.Bar_OnValueChanged);
	Bar:SetScript("OnMouseWheel", self.Bar_OnMouseWheel);
	hooksecurefunc(Bar, "SetMinMaxValues", function(self, min, max)
		self.__minVal, self.__maxVal = min, max;
	end);
	hooksecurefunc(Bar, "SetValueStep", function(self, step)
		Bar.__stepSize = step;
	end);
	Bar:SetValueStep(20);

	Main.super = module;
	self.Main = Main;
	self.Header = Header;
	self.Display = Display;
	self.Footer = Footer;
	self.Bar = Bar;
	self.BarThumb = Thumb;
	self.ContentAnchor = ContentAnchor;

	self.__def = def;
	self._tabs = {  };
	self._contents = {  };
	self._nodes = {  };
	self._nodestore = setmetatable(
		{  },
		{
			__index = function(this, type)
				this[type] = {  };
				return this[type];
			end,
		}
	);

	for _, v in next, contents do
		self:AddTab(v.label, v.content);
	end
	self:SetHeaderOrFooter('header', contents.header);
	self:SetHeaderOrFooter('footer', contents.footer);
end

function module.Display_OnMouseWheel(self, delta)
	return module.Bar_OnMouseWheel(module.Bar, delta);
end
function module.Bar_OnValueChanged(self, value)
	value = (value or self:GetValue()) + 0.005;
	value = value - value % 0.01;
	if self.__val ~= value then
		self.__val = value;
		module.ContentAnchor:SetPoint("TOP", module.Display, "TOP", 0, value);
	end
end
function module.Bar_OnMouseWheel(self, delta)
	local _min, _max = self.__minVal, self.__maxVal;
	local _val = self.__val - delta * self.__stepSize;
	if _val > _max then
		_val = _max;
	elseif _val < _min then
		_val = _min;
	end
	self:SetValue(_val);
end
function module.Tab_OnClick(self)
	module:SelTab(self.index);
end
function module.Edit_OnTextChanged(self, user)
	self:SetText(self.__value);
end
function module.Edit_OnEscapePressed(self)
	self:ClearFocus();
end
function module.Edit_OnEnterPressed(self)
	self:ClearFocus();
end

function module:MakeBorder(Target, inset, width, lr, lg, lb, la, rr, rg, rb, ra, tr, tg, tb, ta, br, bg, bb, ba)
	lr = lr or 0.0;
	lg = lg or 0.0;
	lb = lb or 0.0;
	la = la or 0.25;
	local BorderLeft = Target:CreateTexture(nil, "BACKGROUND");
	BorderLeft:SetWidth(width);
	BorderLeft:ClearAllPoints();
	BorderLeft:SetPoint("TOPLEFT", inset, -inset - width);
	BorderLeft:SetPoint("BOTTOMLEFT", inset, inset);
	BorderLeft:Show();
	BorderLeft:SetColorTexture(lr, lg, lb, la);
	Target.BorderLeft = BorderLeft;
	local BorderRight = Target:CreateTexture(nil, "BACKGROUND");
	BorderRight:SetWidth(width);
	BorderRight:ClearAllPoints();
	BorderRight:SetPoint("TOPRIGHT", -inset, -inset);
	BorderRight:SetPoint("BOTTOMRIGHT", -inset, inset + width);
	BorderRight:Show();
	BorderRight:SetColorTexture(rr or lr, rg or lg, rb or lb, ra or la);
	Target.BorderRight = BorderRight;
	local BorderTop = Target:CreateTexture(nil, "BACKGROUND");
	BorderTop:SetHeight(width);
	BorderTop:ClearAllPoints();
	BorderTop:SetPoint("TOPLEFT", inset, -inset);
	BorderTop:SetPoint("TOPRIGHT", -inset - width, -inset);
	BorderTop:Show();
	BorderTop:SetColorTexture(tr or lr, tg or lg, tb or lb, ta or la);
	Target.BorderTop = BorderTop;
	local BorderBottom = Target:CreateTexture(nil, "BACKGROUND");
	BorderBottom:SetHeight(width);
	BorderBottom:ClearAllPoints();
	BorderBottom:SetPoint("BOTTOMLEFT", inset + width, inset);
	BorderBottom:SetPoint("BOTTOMRIGHT", -inset, inset);
	BorderBottom:Show();
	BorderBottom:SetColorTexture(br or lr, bg or lg, bb or lb, ba or la);
	Target.BorderBottom = BorderBottom;
end


function module:OnUpdate(elasped)
	local mul = self.UpdateTimer - self.UpdateTimer % 0.5;
	self.UpdateTimer = self.UpdateTimer - elasped;
	if self.UpdateTimer > mul then
		return;
	end
	if self.UpdateTimer < 0.0 then
		self.UpdateTimer = 0.0;
		self:SetScript("OnUpdate", nil);
	end
	local module = self.super;
	local len = 4;
	for i = 1, #module._nodes do
		len = len + module._nodes[i]:GetHeight();
	end
	len = len + 4;
	local h = module.Display:GetHeight();
	if len > h then
		local range = len + 4 + module.Bar.__stepSize;
		module.Bar:SetMinMaxValues(0, range - h);
		module.Bar:Show();
		local thumbsize = max(module.Bar:GetHeight() * h / range, module.__def.SCROLLBAR_THUMB_HEIGHT);
		module.BarThumb:SetHeight(thumbsize);
	else
		module.Bar:SetMinMaxValues(0, 0);
		module.Bar:Hide();
	end
end
function module:GetNode(desc, parent)
	if desc.type == nil then
		return;
	end
	parent = parent or self.Display;
	local rawtype = desc.type;
	local keytype = tostring(parent) .. rawtype;
	local t = self._nodestore[keytype];
	local n = #t;
	if n > 0 then
		local v = t[n];
		t[n] = nil;
		v:Show();
		if rawtype == 'text' then
			v:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE, "");
			v:SetTextColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			v:SetJustifyH(desc.alignment or "LEFT");
			v:SetText(desc.value or "");
			v.__value = desc.value or "";
		elseif rawtype == 'button' then
			v.Button:SetScript("OnClick", desc.value);
			v.Text:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			v.Text:SetPoint("CENTER", b, "CENTER", 0, 0);
			v.Text:SetText(desc.text);
			v.Prefix:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE);
			v.Prefix:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			v.Prefix:SetText(desc.prefix);
			v.Suffix:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE);
			v.Suffix:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			v.Suffix:SetText(desc.suffix);
			v.Button:SetPoint("LEFT", v.Prefix, "RIGHT", 0, 0);
			v:SetSize(self.__def.BUTTON_WIDTH + v.Prefix:GetWidth() + v.Suffix:GetWidth(), self.__def.BUTTON_HEIGHT);
		end
		return v;
	else
		if rawtype == 'text' then
			local v = CreateFrame('EDITBOX', nil, parent);
			-- local v = parent:CreateFontString(nil, "ARTWORK");
			v:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE, "");
			v:SetTextColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			v:SetJustifyH(desc.alignment or "LEFT");
			v:SetPoint("LEFT", parent, "LEFT", 0, 0);
			v:SetMultiLine(true);
			v:SetAutoFocus(false);
			v:SetScript("OnChar", nil);
			v:SetScript("OnTextChanged", self.Edit_OnTextChanged);
			v:SetScript("OnEscapePressed", self.Edit_OnEscapePressed);
			v:SetScript("OnEnterPressed", self.Edit_OnEnterPressed);
			if desc.value then
				v:SetText(desc.value);
			end
			v.rawtype = rawtype;
			v.type = keytype;
			v.__value = desc.value or "";
			return v;
		elseif rawtype == 'button' then
			local v = CreateFrame('FRAME', nil, parent or parent);

			local b = CreateFrame('BUTTON', nil, v);
			b:SetSize(self.__def.BUTTON_WIDTH, self.__def.BUTTON_HEIGHT);
			b:SetNormalTexture(TempIcon);
			b:GetNormalTexture():SetColorTexture(unpack(self.__def.BUTTON_NORMAL_COLOR));
			b:SetPushedTexture(TempIcon);
			b:GetPushedTexture():SetColorTexture(unpack(self.__def.BUTTON_PUSHED_COLOR));
			b:SetHighlightTexture(TempIcon);
			b:GetHighlightTexture():SetColorTexture(unpack(self.__def.BUTTON_HIGHLIGHT_COLOR));
			self:MakeBorder(b, -self.__def.BUTTON_BORDER_WIDTH, self.__def.BUTTON_BORDER_WIDTH, unpack(self.__def.BUTTON_BORDER_COLOR));
			b.namespace = module;
			if desc.value then
				b:SetScript("OnClick", desc.value);
			end
			local t = b:CreateFontString(nil, "ARTWORK");
			t:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE);
			t:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			t:SetPoint("CENTER", b, "CENTER", 0, 0);
			if desc.text then
				t:SetText(desc.text);
			end
			local p = v:CreateFontString(nil, "ARTWORK");
			p:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE);
			p:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			p:SetPoint("LEFT", v, "LEFT", 0, 0);
			if desc.prefix then
				p:SetText(desc.prefix);
			end
			local s = v:CreateFontString(nil, "ARTWORK");
			s:SetFont(desc.font or self.__def.DEFAULT_FONT, desc.fontsize or self.__def.NODE_DEFAULT_FONTSIZE);
			s:SetVertexColor(desc.red or 1.0, desc.green or 1.0, desc.blue or 1.0, 1.0);
			s:SetPoint("RIGHT", v, "RIGHT", 0, 0);
			if desc.suffix then
				s:SetText(desc.suffix);
			end

			b:SetPoint("LEFT", p, "RIGHT", 0, 0);
			v:SetSize(self.__def.BUTTON_WIDTH + p:GetWidth() + s:GetWidth(), self.__def.BUTTON_HEIGHT);
			v.Button = b;
			v.Text = t;
			v.Prefix = p;
			v.Suffix = s;
			v.rawtype = rawtype;
			v.type = keytype;
			v.__value = desc.value;
			return v;
		end
	end
end
function module:Recyle(node)
	local store = self._nodestore[node.type];
	store[#store + 1] = node;
	node:Hide();
end
function module:AddTab(label, content)
	local i = #self._tabs;
	local Tab = CreateFrame('BUTTON', nil, self.Main);
	Tab:SetMouseClickEnabled(true);
	Tab:SetSize(self.__def.TAB_WIDTH, self.__def.TAB_HEIGHT);
	if i == 0 then
		Tab:SetPoint("TOPRIGHT", self.Main, "TOPLEFT", -self.__def.TAB_INT_X, 0);
	else
		Tab:SetPoint("TOP", self._tabs[i], "BOTTOM", 0, -self.__def.TAB_INT_Y);
	end
	Tab:SetNormalTexture(TempIcon);
	Tab:GetNormalTexture():SetColorTexture(unpack(self.__def.TAB_NORMAL_COLOR));
	Tab:SetPushedTexture(TempIcon);
	Tab:GetPushedTexture():SetColorTexture(unpack(self.__def.TAB_PUSHED_COLOR));
	Tab:SetHighlightTexture(TempIcon);
	Tab:GetHighlightTexture():SetColorTexture(unpack(self.__def.TAB_HIGHLIGHT_COLOR));
	self:MakeBorder(Tab, -self.__def.TAB_BORDER_WIDTH, self.__def.TAB_BORDER_WIDTH, unpack(self.__def.TAB_BORDER_COLOR));
	local Text = Tab:CreateFontString(nil, "ARTWORK");
	Text:SetPoint("CENTER");
	Text:SetFont(self.__def.DEFAULT_FONT, self.__def.TAB_FONTSIZE);
	Text:SetText(label);
	Tab:SetScript("OnClick", self.Tab_OnClick);
	i = i + 1;
	Tab.index = i;
	self._tabs[i] = Tab;
	self._contents[i] = content;
	if label == nil then
		Tab:Hide();
	end
end
function module:SelTab(index)
	if index > #self._tabs or self.selected == index then
		return;
	end
	local Tab = self._tabs[self.selected];
	if Tab then
		Tab:UnlockHighlight();
	end
	self.selected = index;
	local Tab = self._tabs[index];
	Tab:LockHighlight();
	for i = #self._nodes, 1, -1 do
		self:Recyle(self._nodes[i]);
		self._nodes[i] = nil;
	end
	local len = 4;
	local content = self._contents[index];
	if content then
		for i = 1, #content do
			local t = content[i];
			local v = self:GetNode(t);
			if v then
				if i == 1 then
					v:SetPoint("TOP", self.ContentAnchor, "BOTTOM", 0, -4 - (t.additional_ofs or 0));
				else
					v:SetPoint("TOP", self._nodes[i - 1], "BOTTOM", 0, -4 - (t.additional_ofs or 0));
				end
				self._nodes[i] = v;
				len = len + v:GetHeight();
			end
		end
	end
	len = len + 4;
	local h = self.Display:GetHeight();
	if len > h then
		local range = len + 4 + self.Bar.__stepSize;
		self.Bar:SetMinMaxValues(0, range - h);
		self.Bar:Show();
		local thumbsize = max(self.Bar:GetHeight() * h / range, self.__def.SCROLLBAR_THUMB_HEIGHT);
		self.BarThumb:SetHeight(thumbsize);
	else
		self.Bar:SetMinMaxValues(0, 0);
		self.Bar:Hide();
	end
	self.Bar:SetValue(0);
	self.Main:SetScript("OnUpdate", self.OnUpdate);
	self.Main.UpdateTimer = (self.Main.UpdateTimer or 0.0) + 0.4999;
end
function module:SetHeaderOrFooter(which, content)
	local Anchor = which == 'header' and self.Header or self.Footer;
	local nodes = self._nodes[which];
	if nodes then
		for k, v in next, nodes do
			self:Recyle(v);
		end
	else
		nodes = {  };
		self._nodes.nodes = nodes;
	end
	local t = content.left;
	if t then
		local v = self:GetNode(t, Anchor);
		if v then
			v:ClearAllPoints();
			v:SetPoint("LEFT", Anchor, "LEFT", 0, 0);
			nodes.left = v;
		end
	end
	local t = content.center;
	if t then
		local v = self:GetNode(t, Anchor);
		if v then
			v:ClearAllPoints();
			v:SetPoint("CENTER", Anchor, "CENTER", 0, 0);
			nodes.center = v;
		end
	end
	local t = content.right;
	if t then
		local v = self:GetNode(t, Anchor);
		if v then
			v:ClearAllPoints();
			v:SetPoint("RIGHT", Anchor, "RIGHT", 0, 0);
			nodes.right = v;
		end
	end
end

function module:Show()
	if module.Init then
		module:Init(ns.def, ns.contents);
		module.Init = nil;
	end
	if #self._tabs == 0 then
		return;
	end
	if self.selected == nil then
		self:SelTab(1);
	end
	self.Main:Show();
end
function module:Hide()
	self.Main:Hide();
end
function module:Toggle()
	if self.Main and self.Main:IsShown() then
		self:Hide();
	else
		self:Show();
	end
end
function module:OnInitialize()
	GLOBAL_MANUAL_SAVED = GLOBAL_MANUAL_SAVED or {  };
	--
	if LibStub then
		local LDI = LibStub("LibDBIcon-1.0", true);
		if LDI then
			GLOBAL_MANUAL_SAVED.Minimap = GLOBAL_MANUAL_SAVED.Minimap or { minimapPos = 150, };
			LDI:Register(
				"163UI_Manual",
				{
					icon = [[interface\icons\thumbup]],
					OnClick = function(self, button)
						module:Toggle();
					end,
					text = nil,
					OnTooltipShow = function(tt)
						tt:AddLine("|cffa80303有爱|r|cffffffff手册|r");
					end
				},
				GLOBAL_MANUAL_SAVED.Minimap
			);
		end
	end
end


SlashCmdList["163UIMANUALSHELL"] = function(input)
	module:Toggle();
end
_G.SLASH_YASHELL1 = "/ya";


U1CoreAPI.RegisterModule("Manual", module);
