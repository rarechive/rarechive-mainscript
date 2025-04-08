local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Sidebar = Instance.new("Frame") -- Thanh sidebar bên trái
local TitleLabel = Instance.new("TextLabel")
local ContentFrame = Instance.new("Frame") -- Khung chứa nội dung bên phải
local NoclipButton = Instance.new("TextButton")
local FullbrightButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

local Plr = Players.LocalPlayer
local Clipon = false
local FullbrightOn = false
local isMinimized = false
local lastPosition = UDim2.new(0.5, -200, 0.5, -150)
local minimizePosition = UDim2.new(0, 10, 0, 50)

Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

-- Khung chính (BG)
BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BG.BackgroundTransparency = 0
BG.BorderSizePixel = 0
BG.Position = UDim2.new(0.5, -250, 0.5, -150) -- Điều chỉnh vị trí để căn giữa
BG.Size = UDim2.new(0, 500, 0, 350) -- Kích thước lớn hơn một chút để giống ảnh
BG.Active = true
BG.Draggable = true

-- Thanh Sidebar bên trái
Sidebar.Name = "Sidebar"
Sidebar.Parent = BG
Sidebar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Sidebar.BorderSizePixel = 0
Sidebar.Size = UDim2.new(0, 150, 1, 0) -- Chiều rộng 150, chiếm toàn bộ chiều cao
Sidebar.Position = UDim2.new(0, 0, 0, 0)

-- Tiêu đề trên Sidebar
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = Sidebar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 10)
TitleLabel.Size = UDim2.new(0, 130, 0, 30)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "Rarechivedepzaibodoiqua"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.TextWrapped = true

-- Khung nội dung bên phải
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = BG
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ContentFrame.BackgroundTransparency = 0
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 150, 0, 0) -- Bên phải của Sidebar
ContentFrame.Size = UDim2.new(1, -150, 1, 0) -- Chiếm phần còn lại của BG

-- Nút Noclip
NoclipButton.Name = "NoclipButton"
NoclipButton.Parent = ContentFrame
NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NoclipButton.BackgroundTransparency = 0
NoclipButton.BorderSizePixel = 0
NoclipButton.Position = UDim2.new(0.05, 0, 0.1, 0)
NoclipButton.Size = UDim2.new(0, 150, 0, 40)
NoclipButton.Font = Enum.Font.SourceSansBold
NoclipButton.Text = "Noclip: Off"
NoclipButton.TextColor3 = Color3.fromRGB(200, 200, 200)
NoclipButton.TextSize = 20

-- Nút Fullbright
FullbrightButton.Name = "FullbrightButton"
FullbrightButton.Parent = ContentFrame
FullbrightButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FullbrightButton.BackgroundTransparency = 0
FullbrightButton.BorderSizePixel = 0
FullbrightButton.Position = UDim2.new(0.05, 0, 0.25, 0)
FullbrightButton.Size = UDim2.new(0, 150, 0, 40)
FullbrightButton.Font = Enum.Font.SourceSansBold
FullbrightButton.Text = "Fullbright: Off"
FullbrightButton.TextColor3 = Color3.fromRGB(200, 200, 200)
FullbrightButton.TextSize = 20

-- Nút Minimize
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = BG
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.BackgroundTransparency = 0
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.TextSize = 18

-- Nút Close
CloseButton.Name = "CloseButton"
CloseButton.Parent = BG
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.BackgroundTransparency = 0
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 18

-- Logic Noclip (giữ nguyên)
NoclipButton.MouseButton1Click:Connect(function()
    if not Clipon then
        Clipon = true
        NoclipButton.Text = "Noclip: On"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if Clipon and Plr.Character then
                for _, v in pairs(Plr.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    else
        Clipon = false
        NoclipButton.Text = "Noclip: Off"
        NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

-- Logic Fullbright (giữ nguyên)
FullbrightButton.MouseButton1Click:Connect(function()
    if not FullbrightOn then
        FullbrightOn = true
        FullbrightButton.Text = "Fullbright: On"
        FullbrightButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        Lighting.Brightness = 3
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(150, 150, 150)
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
        FullbrightOn = false
        FullbrightButton.Text = "Fullbright: Off"
        FullbrightButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Lighting.Brightness = 1
        Lighting.FogEnd = 10000
        Lighting.GlobalShadows = true
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
    end
end)

-- Logic thu nhỏ GUI với animation từ dấu +/-
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        lastPosition = BG.Position
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local tween = TweenService:Create(BG, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = minimizePosition
        })
        tween:Play()
        tween.Completed:Wait()
        BG.Visible = false
        MinimizeButton.Parent = Noclip
        MinimizeButton.Position = minimizePosition
        MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
        MinimizeButton.Text = "+"
        MinimizeButton.Draggable = true
    else
        BG.Visible = true
        BG.Position = minimizePosition
        BG.Size = UDim2.new(0, 0, 0, 0)
        MinimizeButton.Parent = BG
        MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
        MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
        MinimizeButton.Text = "-"
        MinimizeButton.Draggable = false
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(BG, tweenInfo, {
            Size = UDim2.new(0, 500, 0, 350),
            Position = lastPosition
        })
        tween:Play()
    end
end)

-- Logic đóng GUI và destroy hoàn toàn
CloseButton.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local tween = TweenService:Create(BG, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = minimizePosition
    })
    tween:Play()
    tween.Completed:Connect(function()
        Noclip:Destroy()
    end)
end)
