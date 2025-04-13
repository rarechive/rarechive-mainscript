-- main.lua

-- Tải thư viện Fluent với URL mới
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Tạo hub
local Hub = Fluent:CreateHub({
    Title = "Dawid Hub",
    Description = "Hub Fluent cho Dawid",
    TabWidth = 120,
    Acrylic = true,
    Theme = "Dark"
})

-- Tải file gui
loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))()"))()(Hub)
