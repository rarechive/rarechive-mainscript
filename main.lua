-- RareXploit Hub by Rarechive
-- Main logic for the hub

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Initialize the window
local Window = Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 320), -- Optimized for mobile (80% width, 70% height)
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Center the window on mobile screen
Window:GetPropertyChangedSignal("Size"):Connect(function()
    local screenSize = game:GetService("GuiService"):GetScreenResolution()
    Window.Position = UDim2.new(0.5, -Window.Size.X.Offset / 2, 0.5, -Window.Size.Y.Offset / 2)
end)

-- Example tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Example button in Main tab
Tabs.Main:AddButton({
    Title = "Test Button",
    Description = "This is a test button for RareXploit",
    Callback = function()
        Fluent:Notify({
            Title = "RareXploit",
            Content = "Button clicked! Hub by Rarechive.",
            Duration = 3
        })
    end
})

-- Initialize SaveManager and InterfaceManager
SaveManager:Initialize({
    FolderName = "RareXploitConfig",
    FileName = "Settings"
})

InterfaceManager:Initialize()
SaveManager:BuildInterface(Tabs.Settings)

-- Notify hub loaded
Fluent:Notify({
    Title = "RareXploit",
    Content = "Hub loaded successfully! Created by Rarechive.",
    Duration = 5
})
