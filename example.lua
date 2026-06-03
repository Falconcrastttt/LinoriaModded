-- ============================================================
--  Library Showcase  –  example.lua
--  Demonstrates every component in LinoriaModded Library.
--  Library raw URL:
--    https://github.com/Falconcrastttt/LinoriaModded/blob/main/Library.lua
-- ============================================================

local Library = loadstring(
    game:HttpGet('https://raw.githubusercontent.com/Falconcrastttt/LinoriaModded/main/Library.lua')
)()

-- Optional: save/theme managers can be loaded here if you have them
-- local SaveManager  = ...
-- local ThemeManager = ...

-- ============================================================
--  Watermark
-- ============================================================
Library:SetWatermark('LinoriaModded  |  Example Script  |  v1.0')

-- ============================================================
--  Main Window
-- ============================================================
local Window = Library:CreateWindow({
    Title    = 'LinoriaModded  –  Component Showcase',
    Center   = true,
    AutoShow = true,
    MenuFadeTime = 0.2,
})

-- ============================================================
--  TAB 1  –  Basic Controls
-- ============================================================
local Tab1 = Window:AddTab('Controls')

local LeftBox  = Tab1:AddLeftGroupbox('Toggles & Sliders')
local RightBox = Tab1:AddRightGroupbox('Buttons & Inputs')

-- ----- Toggles -----
LeftBox:AddToggle('MainToggle', {
    Text    = 'Enable Feature',
    Default = true,
    Tooltip = 'Turns the main feature on or off.',
    Callback = function(Value)
        print('[Toggle] MainToggle ->', Value)
    end,
})

LeftBox:AddToggle('RiskyToggle', {
    Text    = 'Risky Option',
    Default = false,
    Risky   = true,
    Tooltip = 'This is dangerous! Shown in red.',
    Callback = function(Value)
        print('[Toggle] RiskyToggle ->', Value)
    end,
})

LeftBox:AddDivider()

-- ----- Sliders -----
LeftBox:AddSlider('SpeedSlider', {
    Text     = 'Walk Speed',
    Default  = 16,
    Min      = 1,
    Max      = 200,
    Rounding = 0,
    Suffix   = ' stud/s',
    Tooltip  = 'Controls the walk speed.',
    Callback = function(Value)
        print('[Slider] SpeedSlider ->', Value)
    end,
})

LeftBox:AddSlider('FovSlider', {
    Text     = 'Field of View',
    Default  = 70,
    Min      = 1,
    Max      = 120,
    Rounding = 1,
    Suffix   = '°',
    HideMax  = true,
    Compact  = false,
    Tooltip  = 'Adjusts field of view.',
    Callback = function(Value)
        print('[Slider] FovSlider ->', Value)
    end,
})

LeftBox:AddSlider('TransSlider', {
    Text     = 'Transparency',
    Default  = 0.5,
    Min      = 0,
    Max      = 1,
    Rounding = 2,
    Compact  = true,   -- label baked into the slider
    Callback = function(Value)
        print('[Slider] TransSlider ->', Value)
    end,
})

-- ----- Buttons -----
RightBox:AddButton({
    Text = 'Click Me!',
    Func = function()
        Library:Notify('Button clicked!', 3)
    end,
    Tooltip = 'A simple single button.',
})

RightBox:AddButton({
    Text        = 'Double-Click Confirm',
    DoubleClick = true,
    Func        = function()
        Library:Notify('Double-click confirmed!', 3)
    end,
    Tooltip = 'Requires a second click within 0.5 s to confirm.',
})

-- Sub-button (two buttons side by side)
local BtnA = RightBox:AddButton({
    Text = 'Option A',
    Func = function()
        Library:Notify('Option A selected', 2)
    end,
})
BtnA:AddButton({
    Text = 'Option B',
    Func = function()
        Library:Notify('Option B selected', 2)
    end,
})

RightBox:AddDivider()

-- ----- Input (text box) -----
RightBox:AddInput('PlayerInput', {
    Text        = 'Target Player',
    Default     = '',
    Placeholder = 'Enter a name…',
    Numeric     = false,
    Finished    = true,   -- fires only on Enter/focus-lost
    Tooltip     = 'Type a player name and press Enter.',
    Callback    = function(Value)
        print('[Input] PlayerInput ->', Value)
    end,
})

RightBox:AddInput('NumericInput', {
    Text        = 'Damage Value',
    Default     = '100',
    Placeholder = '0 – 9999',
    Numeric     = true,
    Finished    = false,  -- fires on every keystroke
    MaxLength   = 6,
    Tooltip     = 'Only accepts numbers.',
    Callback    = function(Value)
        print('[Input] NumericInput ->', Value)
    end,
})

-- ============================================================
--  TAB 2  –  Dropdowns & Colors
-- ============================================================
local Tab2 = Window:AddTab('Dropdowns & Colors')

local DropLeft  = Tab2:AddLeftGroupbox('Dropdowns')
local ColorRight = Tab2:AddRightGroupbox('Color Pickers')

-- ----- Dropdowns -----
DropLeft:AddDropdown('WeaponDD', {
    Text    = 'Weapon Type',
    Values  = { 'Pistol', 'Rifle', 'Shotgun', 'Sniper', 'Melee' },
    Default = 'Rifle',
    Tooltip = 'Pick a weapon category.',
    Callback = function(Value)
        print('[Dropdown] WeaponDD ->', Value)
    end,
})

DropLeft:AddDropdown('MultiDD', {
    Text    = 'Active Mods',
    Values  = { 'Aim Assist', 'Esp', 'Tracers', 'Wallhack', 'Speed' },
    Default = { 'Aim Assist', 'Esp' },
    Multi   = true,
    Tooltip = 'Multi-select dropdown.',
    Callback = function(Value)
        print('[Dropdown] MultiDD (multi) ->', Value)
    end,
})

DropLeft:AddDropdown('PlayerDD', {
    Text        = 'Player Target',
    SpecialType = 'Player',   -- auto-populates from Players service
    AllowNull   = true,
    Tooltip     = 'Auto-populated player list.',
    Callback    = function(Value)
        print('[Dropdown] PlayerDD ->', Value)
    end,
})

-- ----- Color Pickers -----
-- Color pickers must be attached to a toggle or label object.
-- We create labels first then attach pickers.

local ColorLabel1 = ColorRight:AddLabel('ESP Color')
ColorLabel1:AddColorPicker('EspColor', {
    Default  = Color3.fromRGB(255, 0, 0),
    Title    = 'ESP Highlight Color',
    Callback = function(Value)
        print('[ColorPicker] EspColor ->', Value)
    end,
})

local ColorLabel2 = ColorRight:AddLabel('Chams Color (with transparency)')
ColorLabel2:AddColorPicker('ChamsColor', {
    Default      = Color3.fromRGB(0, 200, 255),
    Transparency = 0.3,
    Title        = 'Chams Color',
    Callback     = function(Value)
        print('[ColorPicker] ChamsColor ->', Value)
    end,
})

-- ============================================================
--  TAB 3  –  Keybinds & Dependency Boxes
-- ============================================================
local Tab3 = Window:AddTab('Keybinds & Deps')

local KbLeft  = Tab3:AddLeftGroupbox('Keybinds')
local DepRight = Tab3:AddRightGroupbox('Dependency Boxes')

-- ----- KeyPicker attached to a Toggle -----
local SprintToggle = KbLeft:AddToggle('SprintToggle', {
    Text    = 'Sprint',
    Default = false,
    Tooltip = 'Toggle sprint on/off.',
    Callback = function(Value)
        print('[Toggle] SprintToggle ->', Value)
    end,
})

SprintToggle:AddKeyPicker('SprintKey', {
    Default          = 'LeftShift',
    Text             = 'Sprint',
    Mode             = 'Hold',
    Modes            = { 'Toggle', 'Hold', 'Always' },
    SyncToggleState  = false,
    Callback         = function(Value)
        print('[KeyPicker] SprintKey active ->', Value)
    end,
    ChangedCallback  = function(New)
        print('[KeyPicker] SprintKey changed to', New)
    end,
})

-- KeyPicker on a label (standalone keybind)
local FlightLabel = KbLeft:AddLabel('Flight Key')
FlightLabel:AddKeyPicker('FlightKey', {
    Default = 'F',
    Text    = 'Flight',
    Mode    = 'Toggle',
    NoUI    = false,
    Callback = function(Value)
        print('[KeyPicker] FlightKey toggled ->', Value)
    end,
})

KbLeft:AddDivider()

KbLeft:AddLabel('Right-click keybind boxes to\nchange mode (Toggle / Hold / Always)', true)

-- ----- Dependency Box -----
local MasterToggle = DepRight:AddToggle('MasterToggle', {
    Text    = 'Enable Module',
    Default = false,
    Tooltip = 'Controls whether the sub-options below are visible.',
})

local Depbox = DepRight:AddDependencyBox()
Depbox:SetupDependencies({ { Toggles.MasterToggle, true } })

Depbox:AddSlider('SubSlider', {
    Text     = 'Sub-option Intensity',
    Default  = 50,
    Min      = 0,
    Max      = 100,
    Rounding = 0,
    Suffix   = '%',
    Callback = function(Value)
        print('[DepSlider] SubSlider ->', Value)
    end,
})

Depbox:AddToggle('SubToggle', {
    Text    = 'Sub-option Toggle',
    Default = false,
    Callback = function(Value)
        print('[DepToggle] SubToggle ->', Value)
    end,
})

-- ============================================================
--  TAB 4  –  Labels & Misc
-- ============================================================
local Tab4 = Window:AddTab('Labels & Misc')

local MiscLeft  = Tab4:AddLeftGroupbox('Labels')
local MiscRight = Tab4:AddRightGroupbox('Tabbox Example')

-- ----- Labels -----
MiscLeft:AddLabel('This is a plain label.')
MiscLeft:AddLabel('This is a wrapping label that contains more text than fits on one line, so it wraps automatically to the next.', true)

local DynLabel = MiscLeft:AddLabel('Dynamic label: 0')
task.spawn(function()
    local n = 0
    while true do
        wait(1)
        n = n + 1
        DynLabel:SetText('Dynamic label: ' .. n)
    end
end)

MiscLeft:AddDivider()
MiscLeft:AddBlank(5)

MiscLeft:AddButton({
    Text = 'Send Notification',
    Func = function()
        Library:Notify('Hello from the showcase!\nThis is a multi-line notification.', 4)
    end,
    Tooltip = 'Fires a notification at the top-left corner.',
})

-- ----- Tabbox (nested tabs inside a groupbox column) -----
local TbBox = Tab4:AddRightTabbox()

local TbA = TbBox:AddTab('Tab A')
TbA:AddLabel('Content inside Tab A')
TbA:AddToggle('TabAToggle', {
    Text    = 'Tab A Option',
    Default = true,
    Callback = function(v) print('[TabA] option ->', v) end,
})

local TbB = TbBox:AddTab('Tab B')
TbB:AddLabel('Content inside Tab B')
TbB:AddSlider('TabBSlider', {
    Text     = 'Tab B Slider',
    Default  = 5,
    Min      = 1,
    Max      = 10,
    Rounding = 0,
    Callback = function(v) print('[TabB] slider ->', v) end,
})

local TbC = TbBox:AddTab('Tab C')
TbC:AddLabel('Content inside Tab C')
TbC:AddDropdown('TabCDD', {
    Values  = { 'Red', 'Green', 'Blue' },
    Default = 'Green',
    Callback = function(v) print('[TabC] dropdown ->', v) end,
})

-- ============================================================
--  Toggle keybind  (RightControl or RightShift – library default)
-- ============================================================
-- You can also point Library.ToggleKeybind at a KeyPicker:
--   Library.ToggleKeybind = Options.SomeKeyPicker

print('[Example] Showcase loaded! Press RightControl or RightShift to toggle the menu.')
