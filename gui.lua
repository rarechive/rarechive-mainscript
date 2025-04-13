-- RareXploit GUI Configuration
-- Handles GUI-specific settings for RareXploit by Rarechive

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Function to adjust GUI for mobile
local function adjustGuiForMobile(window)
    -- Set rectangular size suitable for mobile
    window.Size = UDim2.fromOffset(480, 320) -- 80% width, 70% height for most mobile screens
    
    -- Center the GUI
    window.Position = UDim2.new(0.5, -240, 0.5, -160) -- Offset by half the size to center
    
    -- Ensure GUI doesn't touch top/bottom edges
    local safeArea = game:GetService("GuiService"):GetGuiInset()
    local topInset, bottomInset = safeArea.Y, safeArea.Y
    window.Position = UDim2.new(
        0.5, -240,
        0, math.clamp(window.Position.Y.Offset, topInset, 320 - bottomInset)
    )
end

-- Apply mobile adjustments when GUI is created
local Window = Fluent:GetWindow()
if Window then
    adjustGuiForMobile(Window)
end
