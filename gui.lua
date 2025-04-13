local Gui = {}

function Gui:CreateHub()
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local Window = Fluent:CreateWindow({
        Title = "My Hack Hub",
        SubTitle = "by rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Theme = "Dark",
        Acrylic = true,
        MinimizeKey = Enum.KeyCode.RightControl
    })
    return Window, Fluent
end

return Gui
