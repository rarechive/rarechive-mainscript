-- main.lua
-- Khởi tạo Fluent UI Library từ GitHub
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Load file gui.lua
local Gui = loadstring(game:HttpGet("URL_CUA_GUI_LUA"))() -- Thay bằng URL thực tế của gui.lua trên GitHub

-- Cấu hình cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by YourName",
    TabWidth = 120, -- Giữ nguyên để phù hợp mobile
    Size = UDim2.fromOffset(300, 450), -- Hình chữ nhật, rộng vừa trung tâm, cao hơn một chút
    Acrylic = false, -- Tắt blur để tăng hiệu suất trên mobile
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Gọi hàm khởi tạo giao diện từ gui.lua
Gui:Init(Window, Fluent)
