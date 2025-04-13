local Gui = require(script.Parent.gui)

local Window, Fluent = Gui:CreateHub()

local Tabs = {
    Main = Window:AddTab({ Title = "Hacks", Icon = "home" })
}

-- Thêm các control vào tab Main ở đây
-- Ví dụ:
Tabs.Main:AddButton({
    Title = "Test Button",
    Description = "Click me",
    Callback = function()
        print("Button clicked")
    end
})

-- Chọn tab đầu tiên và hiển thị cửa sổ
Window:SelectTab(1)
Window:Show()
