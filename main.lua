-- main.lua
local screenSize = workspace.CurrentCamera.ViewportSize
local windowWidth = math.min(400, screenSize.X * 0.8)
local windowHeight = math.min(300, screenSize.Y * 0.8)

-- Tải thư viện Fluent
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Fluent.lua"))()

-- Tạo cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "RareXploit",
    SubTitle = "by Rarechive",
    TabWidth = 160,
    Size = UDim2.new(0, windowWidth, 0, windowHeight),
    Acrylic = true,
    Theme = "Dark",
})

-- Căn giữa cửa sổ
Window.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Window.Frame.Position = UDim2.new(0.5, 0, 0.5, 0)

-- Tải và thực thi gui.lua (nếu cần)
local gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/main/gui.lua"))()
gui(Window)
