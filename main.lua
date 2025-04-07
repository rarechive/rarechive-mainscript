local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local NoclipButton = Instance.new("TextButton")
local FullbrightButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

local Plr = Players.LocalPlayer
local Clipon = false
local FullbrightOn = false
local isMinimized = false
local lastPosition = UDim2.new(0.5, -200, 0.5, -150)
local minimizePosition = UDim2.new(0, 10, 0, 50) -- Vị trí mặc định của dấu + khi thu nhỏ

Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BG.BackgroundTransparency = 0.1
BG.BorderSizePixel = 0
BG.Position = UDim2.new(0.5, -200, 0.5, -150)
BG.Size = UDim2.new(0, 400, 0, 300)
BG.Active = true
BG.Draggable = true

local Border = Instance.new("Frame")
Border.Name = "Border"
Border.Parent = BG
Border.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Border.BackgroundTransparency = 0.5
Border.BorderSizePixel = 0
Border.Size = UDim2.new(1, 0, 1, 0)
Border.Position = UDim2.new(0, 0, 0, 0)
Border.ZIndex = 0

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = BG
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 5)
TitleLabel.Size = UDim2.new(0, 300, 0, 30)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "Rarechivedepzaibodoiqua"
TitleLabel.TextColor3 = Color3.fromRGB(0, 120, 215)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

NoclipButton.Name = "NoclipButton"
NoclipButton.Parent = BG
NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NoclipButton.BackgroundTransparency = 0.1
NoclipButton.BorderSizePixel = 0
NoclipButton.Position = UDim2.new(0.05, 0, 0.15, 0)
NoclipButton.Size = UDim2.new(0, 150, 0, 40)
NoclipButton.Font = Enum.Font.SourceSansBold
NoclipButton.Text = "Noclip: Off"
NoclipButton.TextColor3 = Color3.fromRGB(200, 200, 200)
NoclipButton.TextSize = 20

FullbrightButton.Name = "FullbrightButton"
FullbrightButton.Parent = BG
FullbrightButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FullbrightButton.BackgroundTransparency = 0.1
FullbrightButton.BorderSizePixel = 0
FullbrightButton.Position = UDim2.new(0.05, 0, 0.30, 0)
FullbrightButton.Size = UDim2.new(0, 150, 0, 40)
FullbrightButton.Font = Enum.Font.SourceSansBold
FullbrightButton.Text = "Fullbright: Off"
FullbrightButton.TextColor3 = Color3.fromRGB(200, 200, 200)
FullbrightButton.TextSize = 20

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = BG
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.BackgroundTransparency = 0.1
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.TextSize = 20

CloseButton.Name = "CloseButton"
CloseButton.Parent = BG
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.BackgroundTransparency = 0.1
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "x"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 20

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
			Size = UDim2.new(0, 0, 0, 0), -- Thu nhỏ về kích thước 0
			Position = minimizePosition -- Thu về vị trí của dấu +
		})
		tween:Play()
		tween.Completed:Wait()
		BG.Visible = false
		MinimizeButton.Parent = Noclip
		MinimizeButton.Position = minimizePosition
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Text = "+"
		MinimizeButton.Draggable = true
	else
		BG.Visible = true
		BG.Position = minimizePosition -- Bắt đầu từ vị trí dấu +
		BG.Size = UDim2.new(0, 0, 0, 0) -- Kích thước ban đầu là 0
		MinimizeButton.Parent = BG
		MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Text = "-"
		MinimizeButton.Draggable = false
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:Create(BG, tweenInfo, {
			Size = UDim2.new(0, 400, 0, 300), -- Phóng to về kích thước ban đầu
			Position = lastPosition -- Trở lại vị trí trước đó
		})
		tween:Play()
	end
end)

-- Logic đóng GUI với animation từ dấu - về dấu +
CloseButton.MouseButton1Click:Connect(function()
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	local tween = TweenService:Create(BG, tweenInfo, {
		Size = UDim2.new(0, 0, 0, 0), -- Thu nhỏ về kích thước 0
		Position = minimizePosition -- Thu về vị trí của dấu +
	})
	tween:Play()
	tween.Completed:Connect(function()
		BG.Visible = false
		MinimizeButton.Parent = Noclip
		MinimizeButton.Position = minimizePosition
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Text = "+"
		MinimizeButton.Draggable = true
		CloseButton.Visible = false -- Ẩn nút x để chỉ còn dấu +
		isMinimized = true -- Đặt trạng thái thành đã thu nhỏ
	end)
end)
