-- gui.lua

return function(Hub)
    -- Tạo tab Information
    local InfoTab = Hub:CreateTab("Information", "rbxassetid://1234567890")
    
    -- Thêm các thành phần vào tab Information
    InfoTab:CreateLabel("Welcome to Dawid Hub!")
    InfoTab:CreateParagraph("This is a hub created using Fluent library.")
    InfoTab:CreateButton("Click me!", function()
        print("Button clicked!")
    end)
    
    -- Tạo tab Setting
    local SettingTab = Hub:CreateTab("Setting", "rbxassetid://0987654321")
    
    -- Thêm các thành phần vào tab Setting
    SettingTab:CreateToggle("Toggle something", false, function(state)
        print("Toggle state:", state)
    end)
    SettingTab:CreateSlider("Slider", 0, 100, 50, function(value)
        print("Slider value:", value)
    end)
    SettingTab:CreateDropdown("Dropdown", {"Option 1", "Option 2", "Option 3"}, "Option 1", function(option)
        print("Selected option:", option)
    end)
end
