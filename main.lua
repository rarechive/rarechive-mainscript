-- main.lua
-- Khởi tạo Fluent UI Library từ GitHub
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Load file gui.lua
local Gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))() -- Thay bằng URL thực tế của gui.lua trên GitHub

-- Cấu hình cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "Mobile Hub",
    SubTitle = "by YourName",
    TabWidth = 120, -- Thu nhỏ để phù hợp màn hình điện thoại
    Size = UDim2.fromOffset(360, 400), -- Kích thước tối ưu cho mobile
    Acrylic = false, -- Tắt blur để tăng hiệu suất trên mobile
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Gọi hàm khởi tạo giao diện từ gui.lua
Gui:Init(Window, Fluent)
