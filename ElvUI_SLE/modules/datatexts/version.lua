﻿--Version datatext. Only in Russian for now.
local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local displayString = '';
local lastPanel;
local self = lastPanel
E.version = GetAddOnMetadata("ElvUI", "Version");

local function OnEvent(self, event, ...)
	self.text:SetFormattedText(displayString, 'ElvUI v', E.version);
end

local function Click()
	ElvConfigToggle:Click();
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	GameTooltip:AddDoubleLine("ElvUI "..L["Version"]..format(": |cff99ff33%s|r",E.version))
	GameTooltip:AddLine(L["SLE_AUTHOR_INFO"])
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L['SLE_CONTACTS'])
	
	GameTooltip:Show()
end

local function ValueColorUpdate(hex, r, g, b)
	displayString = string.join("", "%s", hex, "%.2f|r", " : Shadow & Light Edit")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

DT:RegisterDatatext("Version", {'PLAYER_ENTERING_WORLD'}, OnEvent, Update, Click, OnEnter)

