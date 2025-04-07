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
local lastPosition = UDim2.new(0.5, -200, 0.5, -150) -- Lưu vị trí Hub
local lastMinimizePos = UDim2.new(0, 10, 0, 50) -- Lưu vị trí nút +

Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

-- Frame chính: Hub
BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BG.BackgroundTransparency = 0.2 -- Trong suốt nhẹ hơn
BG.BorderSizePixel = 0
BG.Position = UDim2.new(0.5, -200, 0.5, -150)
BG.Size = UDim2.new(0, 400, 0, 300)
BG.Active = true
BG.Draggable = true
BG.ZIndex = 1

-- Thêm bóng đổ (dùng UIStroke để tạo viền sáng)
local Stroke = Instance.new("UIStroke")
Stroke.Name = "Stroke"
Stroke.Parent = BG
Stroke.Color = Color3.fromRGB(0, 120, 215)
Stroke.Thickness = 2
Stroke.Transparency = 0.5

-- Tiêu đề Hub
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
TitleLabel.ZIndex = 2

-- Noclip Button
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
NoclipButton.ZIndex = 2

-- Fullbright Button
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
FullbrightButton.ZIndex = 2

-- Nút thu nhỏ (-)
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
MinimizeButton.ZIndex = 2

-- Nút đóng (x)
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
CloseButton.ZIndex = 2

-- Hiệu ứng hover cho NoclipButton
NoclipButton.MouseEnter:Connect(function()
	NoclipButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- Sáng lên khi hover
end)
NoclipButton.MouseLeave:Connect(function()
	if not Clipon then
		NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Trở về màu gốc
	end
end)

-- Hiệu ứng hover cho FullbrightButton
FullbrightButton.MouseEnter:Connect(function()
	FullbrightButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
FullbrightButton.MouseLeave:Connect(function()
	if not FullbrightOn then
		FullbrightButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
end)

-- Hiệu ứng hover cho MinimizeButton
MinimizeButton.MouseEnter:Connect(function()
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
MinimizeButton.MouseLeave:Connect(function()
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

-- Hiệu ứng hover cho CloseButton
CloseButton.MouseEnter:Connect(function()
	CloseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
CloseButton.MouseLeave:Connect(function()
	CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

-- Logic Noclip
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

-- Logic Fullbright giữ bầu trời tối
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

-- Logic thu nhỏ GUI với hiệu ứng
MinimizeButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		-- Lưu vị trí hiện tại của Hub
		lastPosition = BG.Position
		-- Hiệu ứng ẩn mượt mà
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:Create(BG, tweenInfo, {BackgroundTransparency = 1})
		tween:Play()
		tween.Completed:Connect(function()
			BG.Visible = false
			BG.BackgroundTransparency = 0.2 -- Khôi phục độ trong suốt
		end)
		-- Chuyển MinimizeButton ra ngoài BG
		MinimizeButton.Parent = Noclip
		MinimizeButton.Position = lastMinimizePos -- Sử dụng vị trí đã lưu
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Text = "+"
		MinimizeButton.Draggable = true
	else
		-- Hiện lại Hub với hiệu ứng
		BG.Visible = true
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		local tween = TweenService:Create(BG, tweenInfo, {BackgroundTransparency = 0.2})
		tween:Play()
		-- Đưa MinimizeButton trở lại trong BG
		MinimizeButton.Parent = BG
		MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Text = "-"
		MinimizeButton.Draggable = false
		-- Khôi phục vị trí Hub
		BG.Position = lastPosition
	end
end)

-- Lưu vị trí nút + khi kéo thả
MinimizeButton:GetPropertyChangedSignal("Position"):Connect(function()
	if isMinimized then
		lastMinimizePos = MinimizeButton.Position
	end
end)

-- Logic đóng GUI
CloseButton.MouseButton1Click:Connect(function()
	Noclip:Destroy()
end)
