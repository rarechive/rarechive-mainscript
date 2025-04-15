-- Load RareXploit and Addons
local RareXploit = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Load GUI from gui.lua
local gui_success, gui = pcall(loadstring, game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))
if not gui_success then
    warn("Failed to load gui.lua: " .. tostring(gui))
    RareXploit:Notify({
        Title = "Error",
        Content = "Failed to load GUI. Check GitHub URL or network.",
        Duration = 10
    })
    return -- Stop execution if GUI fails to load
end

-- Load NoClip logic from logicnoclip with error handling
local noclip_success, noclip_result = pcall(loadstring, game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/logicnoclip"))
if not noclip_success then
    warn("Failed to load logicnoclip: " .. tostring(noclip_result))
    RareXploit:Notify({
        Title = "Error",
        Content = "Failed to load NoClip functionality. Check GitHub URL or network.",
        Duration = 10
    })
else
    -- Verify toggleNoclip is set
    if _G.toggleNoclip then
        RareXploit:Notify({
            Title = "Success",
            Content = "NoClip functionality loaded successfully.",
            Duration = 5
        })
    else
        warn("toggleNoclip not set in global scope")
        RareXploit:Notify({
            Title = "Warning",
            Content = "NoClip function not properly initialized.",
            Duration = 10
        })
    end
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
