local gui = {}

function gui.CreateGUI(RareXploit)
    local Window = RareXploit:CreateWindow({
        Title = "RareXploit 0.1",
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(600, 300), -- Chiều cao giới hạn để gần rìa màn hình
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
        Information = Window:AddTab({ Title = "Information", Icon = "info" })
    }

    local Options = RareXploit.Options

    -- Notification
    RareXploit:Notify({
        Title = "Welcome",
        Content = "RareXploit has loaded successfully!",
        Duration = 5
    })

    -- Main Tab: Core Features
    Tabs.Main:AddParagraph({
        Title = "Welcome to RareXploit",
        Content = "Explore the features and configure your settings."
    })

    -- Toggle to hide/show hub
    local HubToggle = Tabs.Main:AddToggle("HubToggle", {
        Title = "Show/Hide Hub",
        Default = true -- Mặc định là hiển thị
    })
    HubToggle:OnChanged(function()
        local isVisible = Options.HubToggle.Value
        Window:SetVisible(isVisible) -- Giả định thư viện hỗ trợ hàm này
        print("Hub visibility:", isVisible and "Shown" or "Hidden")
    end)

    -- Button
    Tabs.Main:AddButton({
        Title = "Execute Script",
        Description = "Run your custom script",
        Callback = function()
            Window:Dialog({
                Title = "Execute",
                Content = "Are you sure you want to execute the script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Script executed.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Execution cancelled.")
                        end
                    }
                }
            })
        end
    })

    -- Toggle
    local Toggle = Tabs.Main:AddToggle("MyToggle", {
        Title = "Enable Feature",
        Default = false
    })
    Toggle:OnChanged(function()
        print("Feature enabled:", Options.MyToggle.Value)
    end)

    -- Slider
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Speed Adjustment",
        Description = "Adjust feature intensity",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Speed set to:", Value)
        end
    })

    -- Keybind
    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "Quick Toggle",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Keybind activated:", Value)
        end
    })

    -- Information Tab: Features
    Tabs.Information:AddParagraph({
        Title = "Feature Overview",
        Content = "RareXploit offers powerful tools for scripting and automation.\nKey features include:\n- Script Execution\n- Customizable Keybinds\n- Adjustable Settings\n- Real-time Feedback\n\nAdditional Info:\nThis hub is designed to stay compact and scrollable for easy access to all features."
    })

    Tabs.Information:AddButton({
        Title = "Check Version",
        Description = "View current RareXploit version",
        Callback = function()
            Window:Dialog({
                Title = "Version Info",
                Content = "RareXploit Version: 0.1",
                Buttons = {
                    {
                        Title = "OK",
                        Callback = function()
                            print("Version checked.")
                        end
                    }
                }
            })
        end
    })

    -- Đảm bảo tab Main và Information có thể cuộn
    Tabs.Main:SetProperty("ScrollingEnabled", true) -- Giả định thư viện hỗ trợ
    Tabs.Information:SetProperty("ScrollingEnabled", true)

    return Window, Tabs, Options
end

return gui
