-- RareXploit Main Script by Rarechive
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Load Fluent with error handling
local Fluent
local success, err = pcall(function()
    Fluent = loadstring(HttpService:GetAsync("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success or not Fluent then
    warn("Failed to load Fluent UI: " .. tostring(err))
    return
end

-- Initialize Window
local Window = Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive"
})

-- Tabs
local Tabs = {
    Information = Window:AddTab({ Title = "Information", Icon = "info" }),
    Setting = Window:AddTab({ Title = "Setting", Icon = "settings" })
}

-- Information Tab
Tabs.Information:AddParagraph({
    Title = "Welcome to RareXploit!",
    Content = "Created by Rarechive. This hub is designed for efficiency and ease of use on mobile devices."
})

Tabs.Information:AddButton({
    Title = "Join Discord",
    Description = "Join our community for updates!",
    Callback = function()
        setclipboard("https://discord.gg/your-discord")
        Fluent:Notify({ Title = "Copied!", Content = "Discord link copied to clipboard." })
    end
})

-- Setting Tab
Tabs.Setting:AddToggle({
    Title = "Auto Save Config",
    Default = true,
    Callback = function(value)
        Fluent.Options.AutoSaveConfig = value
    end
})

Tabs.Setting:AddButton({
    Title = "Destroy UI",
    Callback = function()
        Fluent:Destroy()
    end
})

-- Center UI and set size manually
local ScreenGui = Player.PlayerGui:FindFirstChild("FluentGui") or Fluent.ScreenGui
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local Frame = ScreenGui:FindFirstChild("Main") or ScreenGui.Frame
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)

-- Notify on Load
Fluent:Notify({
    Title = "RareXploit Loaded",
    Content = "Hub is ready! Enjoy exploiting.",
    Duration = 5
})
