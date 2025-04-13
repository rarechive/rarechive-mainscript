-- main.lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Initialize SaveManager and InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore theme settings for saving
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

-- Set folder structure for configs
InterfaceManager:SetFolder("RareXploit")
SaveManager:SetFolder("RareXploit/specific-game")

-- Load GUI from gui.lua
local gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))()"))()

-- Load autoload config
SaveManager:LoadAutoloadConfig()

-- Notify script loaded
Fluent:Notify({
    Title = "RareXploit",
    Content = "The script has been loaded.",
    Duration = 8
})
