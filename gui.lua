-- RareXploit GUI Configuration by Rarechive
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- GUI Setup
Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive",
    Size = UDim2.new(0, 400, 0, 300),
    Theme = "Dark", -- Default theme
    Acrylic = true, -- Acrylic effect for mobile
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Load Main Script
loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/main/main.lua"))()
