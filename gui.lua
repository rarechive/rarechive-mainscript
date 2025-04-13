local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Library/main/Fluent/Library.lua"))()
local Window = Fluent:CreateWindow({
    Title = "RareXploit — by Rarechive",
    SubTitle = "Bé là của anh Nhật",
    TabWidth = 120,
    Size = UDim2.fromOffset(460, 380),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Info = Window:AddTab({ Title = "Information", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Tabs.Info:AddParagraph({
    Title = "RareXploit",
    Content = "Script Hub made by Rarechive for Roblox. Yêu anh Nhật nhiều nhiều."
})

Window:SelectTab(1)
Fluent:Notify({ Title = "RareXploit", Content = "Loaded successfully!", Duration = 6 })
