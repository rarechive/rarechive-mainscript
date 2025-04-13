-- gui.lua
return function(Window)
    -- Thêm tab Information
    local Tab1 = Window:AddTab({ Title = "Information", Icon = "info" })
    Tab1:AddParagraph("Chào mừng đến RareXploit", "Hub này được tạo bởi Rarechive.")
    
    -- Thêm tab Settings
    local Tab2 = Window:AddTab({ Title = "Settings", Icon = "settings" })
    Tab2:AddToggle("Toggle1", { Text = "Tùy chọn mẫu", Default = false })
end
