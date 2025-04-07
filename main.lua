local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local NoclipButton = Instance.new("TextButton")
local FullbrightButton = Instance.new("TextButton")
local ToggleMenu = Instance.new("TextButton")

local Plr = Players.LocalPlayer
local Clipon = false
local FullbrightOn = false

Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
BG.BorderSizePixel = 0
BG.Position = UDim2.new(0.02, 0, 0.5, -50)
BG.Size = UDim2.new(0, 100, 0, 80)
BG.Active = true
BG.Draggable = true

NoclipButton.Name = "NoclipButton"
NoclipButton.Parent = BG
NoclipButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
NoclipButton.BorderSizePixel = 0
NoclipButton.Position = UDim2.new(0.1, 0, 0.15, 0)
NoclipButton.Size = UDim2.new(0, 80, 0, 25)
NoclipButton.Font = Enum.Font.SourceSansBold
NoclipButton.Text = "Noclip: Off"
NoclipButton.TextColor3 = Color3.new(1, 1, 1)
NoclipButton.TextSize = 18

FullbrightButton.Name = "FullbrightButton"
FullbrightButton.Parent = BG
FullbrightButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
FullbrightButton.BorderSizePixel = 0
FullbrightButton.Position = UDim2.new(0.1, 0, 0.55, 0)
FullbrightButton.Size = UDim2.new(0, 80, 0, 25)
FullbrightButton.Font = Enum.Font.SourceSansBold
FullbrightButton.Text = "Fullbright: Off"
FullbrightButton.TextColor3 = Color3.new(1, 1, 1)
FullbrightButton.TextSize = 18

ToggleMenu.Name = "ToggleMenu"
ToggleMenu.Parent = Noclip
ToggleMenu.BackgroundColor3 = Color3.new(0, 0.5, 1)
ToggleMenu.BorderSizePixel = 0
ToggleMenu.Position = UDim2.new(0.02 + 0.1, 5, 0.5, -15)
ToggleMenu.Size = UDim2.new(0, 20, 0, 30)
ToggleMenu.Font = Enum.Font.SourceSansBold
ToggleMenu.Text = ">"
ToggleMenu.TextColor3 = Color3.new(1, 1, 1)
ToggleMenu.TextSize = 20
ToggleMenu.Active = true
ToggleMenu.Draggable = true

-- Logic Noclip
NoclipButton.MouseButton1Click:Connect(function()
	if not Clipon then
		Clipon = true
		NoclipButton.Text = "Noclip: On"
		NoclipButton.BackgroundColor3 = Color3.new(0, 1, 0)
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
		NoclipButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
	end
end)

-- Logic Fullbright giữ bầu trời tối
FullbrightButton.MouseButton1Click:Connect(function()
	if not FullbrightOn then
		FullbrightOn = true
		FullbrightButton.Text = "Fullbright: On"
		FullbrightButton.BackgroundColor3 = Color3.new(0, 1, 0)
		-- Fullbright bật: sáng tối đa, giữ bầu trời tối
		Lighting.Brightness = 3 -- Tối đa độ sáng
		Lighting.FogEnd = 100000 -- Loại bỏ sương mù
		Lighting.GlobalShadows = false -- Tắt bóng
		Lighting.Ambient = Color3.fromRGB(150, 150, 150) -- Ánh sáng môi trường đủ để thấy rõ
		Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0) -- Giữ bầu trời tối
	else
		FullbrightOn = false
		FullbrightButton.Text = "Fullbright: Off"
		FullbrightButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
		-- Fullbright tắt: trở về mặc định
		Lighting.Brightness = 1
		Lighting.FogEnd = 10000
		Lighting.GlobalShadows = true
		Lighting.Ambient = Color3.fromRGB(0, 0, 0)
		Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
	end
end)

-- Logic đóng/mở menu
local menuVisible = true
ToggleMenu.MouseButton1Click:Connect(function()
	menuVisible = not menuVisible
	BG.Visible = menuVisible
	ToggleMenu.Text = menuVisible and ">" or "<"
	ToggleMenu.Position = menuVisible and UDim2.new(0.02 + 0.1, 5, 0.5, -15) or UDim2.new(0.02, 0, 0.5, -15)
end)
