-- RareXploit Main Script
-- Created by Rarechive
-- Compatible with Delta Executor

-- Kiểm tra nếu đang chạy trên Delta Executor
if not getgenv().Delta then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "RareXploit",
        Text = "This script is designed for Delta Executor!",
        Duration = 5
    })
    return
end

-- Tải thư viện Fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Tải giao diện từ gui.lua
local Gui = loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/rarechive/rarechive-mainscript/refs/heads/main/gui.lua"))()"))() -- Thay URL_TO_YOUR_GUI_LUA_FILE bằng URL của file gui.lua trên GitHub hoặc server của bạn

-- Khởi tạo cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "RareXploit | Created by Rarechive",
    SubTitle = "Delta Executor Compatible",
    TabWidth = 160,
    Size = UDim2.new(0, 580, 0, 350),
    Theme = "Dark",
    Acrylic = true,
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Gọi hàm khởi tạo giao diện từ gui.lua
Gui:Setup(Window, Fluent)

-- Thông báo khởi động thành công
Fluent:Notify({
    Title = "RareXploit",
    Content = "Script hub loaded successfully! Enjoy exploiting.",
    Duration = 5
})

-- Ví dụ hàm executor (có thể mở rộng)
local function executeScript(script)
    local success, err = pcall(function()
        loadstring(script)()
    end)
    if not success then
        Fluent:Notify({
            Title = "Execution Error",
            Content = "Error: " .. tostring(err),
            Duration = 8
        })
    end
end

-- Xử lý logic chính nếu cần
-- Ví dụ: Kết nối các sự kiện từ giao diện
Gui.OnExecute = executeScript
