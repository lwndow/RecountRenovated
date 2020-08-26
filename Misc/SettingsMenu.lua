local LAM = LibAddonMenu2
local LMP = LibMediaProvider

Recount.SettingsMenu = {
	name = "Recount_SettingsMenu",
}

function Recount.SettingsMenu.Initialize()
	local panelData = {
		type = "panel",
		name = Recount.name,
		displayName = Recount.name.." Settings",
		author = "lwndow, Ferather, Shadow-Fighter, and others",
		version = "0.7",
		registerForRefresh = true,
		registerForDefaults = true,
	}
	LAM:RegisterAddonPanel(Recount.SettingsMenu.name, panelData)

	Recount.SettingsMenu:Setup()
end

function Recount.SettingsMenu:Set( setting, value )
	Recount.settings[setting] = value

	if ( setting == 'progressBarHeight' or setting == 'progressBarFont' ) then
		Recount.FitUIElements()
	end
end

function Recount.SettingsMenu:SetColor( setting, r, g, b, a )
	Recount.settings[setting].r = r
	Recount.settings[setting].g = g
	Recount.settings[setting].b = b
	Recount.settings[setting].a = a
	Recount.FitUIElements()
end

function Recount.SettingsMenu:GetFont()
    local str = '%s|%d'
    if ( Recount.settings.progressBarFontOutline ~= 'none' ) then
        str = str .. '|%s'
    end

    return string.format( str, LMP:Fetch( 'font', Recount.settings.progressBarFontFace ), Recount.settings.progressBarFontSize, Recount.settings.progressBarFontOutline )
end

function Recount.SettingsMenu:Setup()
	local optionsData = {
		{
			type = "header",
			name = "Version "  .. Recount.versionString,
			width = "full",
		},
		{
			type = "checkbox",
			name = "Use Account-Wide Settings [RELOADS UI ON CLICK]",
			tooltip = "Recount will use the same settings for all characters",
			getFunc = function() return RecountSettings.Default[GetDisplayName()]['$AccountWide'].useAccountWide end,
			setFunc = function( value ) RecountSettings.Default[GetDisplayName()]['$AccountWide'].useAccountWide = value ReloadUI() end,
			default = Recount.settings.useAccountWide,
		},
		{
			type = "checkbox",
			name = "Disable All Auto Show/Hide",
			tooltip = "Recount UI does not auto toggle itself, but only through command shortcuts",
			getFunc = function() return Recount.settings.onlyUseKey end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'onlyUseKey', value ) end,
			default = Recount.settingsDefaults.onlyUseKey,
		},
		{
			type = "checkbox",
			name = "Minimize In Combat",
			tooltip = "Minimize the main window while in combat",
			getFunc = function() return Recount.settings.minimizeDuringCombat end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'minimizeDuringCombat', value ) end,
			default = Recount.settingsDefaults.minimizeDuringCombat,
		},
		{
			type = "checkbox",
			name = "Hide While Out Of Combat",
			tooltip = "Hide the main window while out of combat",
			getFunc = function() return Recount.settings.hideOutOfCombat end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'hideOutOfCombat', value ) end,
			default = Recount.settingsDefaults.hideOutOfCombat,
		},
		{
			type = "slider",
			name = "OOC Hide Delay",
			tooltip = "Adjust the time the main window will be hidden when out of combat.",
			min = 1,
			max = 30,
			step = 1,
			getFunc = function() return Recount.settings.hideOutOfCombatDelayInSeconds end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'hideOutOfCombatDelayInSeconds', value ) end,
			default = Recount.settingsDefaults.hideOutOfCombatDelayInSeconds,
		},
		{
			type = "checkbox",
			name = "Autoswitch Mode",
			tooltip = "Autoswitch between log mode and damage overview after combat?",
			getFunc = function() return Recount.settings.autoSwitchMode end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'autoSwitchMode', value ) end,
			default = Recount.settingsDefaults.autoSwitchMode,
		},
		{
			type = "checkbox",
			name = "Suspend Data Collection While Hidden",
			tooltip = "Do not continue to collect data while the main window is hidden",
			getFunc = function() return Recount.settings.suspendDataCollectionWhileHidden end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'suspendDataCollectionWhileHidden', value ) end,
			default = Recount.settingsDefaults.suspendDataCollectionWhileHidden,
		},
		{
			type = "checkbox",
			name = "Count Deflected Damage",
			tooltip = "Consider deflected (parried, immune, reflected) damage as normal damage done?",
			getFunc = function() return Recount.settings.countDeflectedDmg end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'countDeflectedDmg', value ) end,
			default = Recount.settingsDefaults.countDeflectedDmg,
		},
		{
			type = "checkbox",
			name = "Show Skills Details",
			tooltip = "Show hit number and critical strike statistics in the skill bar",
			getFunc = function() return Recount.settings.showSkillDetails end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'showSkillDetails', value ) end,
			default = Recount.settingsDefaults.showSkillDetails,
		},
		{
			type = "slider",
			name = "Damage Bar Height",
			tooltip = "Height of the damage bars.",
			min = 10,
			max = 40,
			step = 1,
			getFunc = function() return Recount.settings.progressBarHeight end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'progressBarHeight', value ) end,
			default = Recount.settingsDefaults.progressBarHeight,
		},
		{
			type = "fontblock",
			name = "Damage Bar Font",
			tooltip = "Damage bar font (color is currently ignored).",
			getFace = function() return Recount.settings.progressBarFontFace end,
			getSize = function() return Recount.settings.progressBarFontSize end,
			getOutline = function() return Recount.settings.progressBarFontOutline end,
			getColor = function() return Recount.settings.progressBarFontColor.r, Recount.settings.progressBarFontColor.g, Recount.settings.progressBarFontColor.b, Recount.settings.progressBarFontColor.a end,
			setFace = function( value ) Recount.SettingsMenu:Set( 'progressBarFontFace', value ); Recount.FitUIElements() end,
			setSize = function( value ) Recount.SettingsMenu:Set( 'progressBarFontSize', value ); Recount.FitUIElements() end,
			setOutline = function( value ) Recount.SettingsMenu:Set( 'progressBarFontOutline', value ); Recount.FitUIElements() end,
			setColor = function( r, g, b, a ) Recount.SettingsMenu:SetColor( 'progressBarFontColor', r, g, b, a ); Recount.FitUIElements() end,
			default = {
				face = Recount.settingsDefaults.progressBarFontFace,
				size = Recount.settingsDefaults.progressBarFontSize,
				outline = Recount.settingsDefaults.progressBarFontOutline,
				color = Recount.settingsDefaults.progressBarFontColor,
			},
		},
		{
			type = "colorpicker",
			name = "Damage Bar Color",
			tooltip = "Damage bar color.",
			getFunc = function() return Recount.settings.progressBarColor.r, Recount.settings.progressBarColor.g, Recount.settings.progressBarColor.b, Recount.settings.progressBarColor.a end,
			setFunc = function( r, g, b, a ) Recount.SettingsMenu:SetColor( 'progressBarColor', r, g, b, a ) end,
			default = {r = Recount.settingsDefaults.progressBarColor.r, g = Recount.settingsDefaults.progressBarColor.g, b = Recount.settingsDefaults.progressBarColor.b, a = Recount.settingsDefaults.progressBarColor.a},
		},
		{
			type = "editbox",
			name = "Periodic Tick Tag",
			tooltip = "How periodic ticks are shown in the combat log",
			getFunc = function() return Recount.settings.dotTag end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'dotTag', value ) end,
			isMultiline = false,
			default = Recount.settingsDefaults.dotTag,
		},
		{
			type = "editbox",
			name = "Critical Strike Tag",
			tooltip = "How critical strikes are shown in the combat log",
			getFunc = function() return Recount.settings.critTag end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'critTag', value ) end,
			isMultiline = false,
			default = Recount.settingsDefaults.critTag,
		},
		{
			type = "editbox",
			name = "Minimum Damage Value for Log",
			tooltip = "Damage >= value will *NOT* show up in the log, but will count as DPS in total",
			getFunc = function() return Recount.settings.minDPSLogValue end,
			setFunc = function( value ) Recount.SettingsMenu:Set( 'minDPSLogValue', tonumber(value) ) end,
			isMultiline = false,
			default = Recount.settingsDefaults.minDPSLogValue,
		},
		{
			type = "editbox",
			name = "Minimum Healing Value for Log",
			tooltip = "Heals >= value will *NOT* show up in the log, but will count as HPS in total",
			getFunc = function() return Recount.settings.minHPSLogValue end,
			setFunc = function( value ) Recount.SettingMenu:Set( 'minHPSLogValue', tonumber(value) ) end,
			isMultiline = false,
			default = Recount.settingsDefaults.minHPSLogValue,
		},
	}

	LAM:RegisterOptionControls(Recount.SettingsMenu.name, optionsData)
end
