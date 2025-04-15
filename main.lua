-- Load RareXploit and Addons
local RareXploit = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Load GUI from gui.lua
local gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))()

-- Load NoClip logic from logicnoclip with error handling
local success, noclip = pcall(loadstring, game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/logicnoclip"))
if not success then
    warn("Failed to load logicnoclip: " .. tostring(noclip))
    RareXploit:Notify({
        Title = "Error",
        Content = "Failed to load NoClip functionality. Check GitHub URL or network.",
        Duration = 10
    })
end

-- Create the GUI
local Window, Tabs, Options = gui.CreateGUI(RareXploit)

-- Setup SaveManager and InterfaceManager
SaveManager:SetLibrary(RareXploit)
InterfaceManager:SetLibrary(RareXploit)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("RareXploitHub")
SaveManager:SetFolder("RareXploitHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Select the first tab
Window:SelectTab(1)

-- Notify that the script has loaded
RareXploit:Notify({
    Title = "RareXploit",
    Content = "The script has been loaded.",
    Duration = 8
})

-- Load autoload config
SaveManager:LoadAutoloadConfig()
