-- main.lua
-- Khởi tạo Fluent UI Library từ GitHub
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Load file gui.lua
local Gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))() -- Thay bằng URL thực tế của gui.lua trên GitHub

-- Cấu hình cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive",
    TabWidth = 120,
    Size = UDim2.fromOffset(360, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Gọi hàm khởi tạo giao diện từ gui.lua
Gui:Init(Window, Fluent)
