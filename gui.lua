-- RareXploit GUI Configuration by Rarechive
local HttpService = game:GetService("HttpService")

-- Load Fluent with error handling
local Fluent
local success, err = pcall(function()
    Fluent = loadstring(HttpService:GetAsync("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success or not Fluent then
    warn("Failed to load Fluent UI in gui.lua: " .. tostring(err))
    return
end

-- GUI Setup
Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive",
    Theme = "Dark",
    Acrylic = true,
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Load Main Script
local successMain, errMain = pcall(function()
    loadstring(HttpService:GetAsync("https://raw.githubusercontent.com/rarechive/rarechive-mainScript/main/main.lua"))()
end)

if not successMain then
    warn("Failed to load main.lua: " .. tostring(errMain))
end
