local gui = {}

function gui.CreateGUI(RareXploit)
    local Window = RareXploit:CreateWindow({
        Title = "RareXploit " .. RareXploit.Version,
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 400),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
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
        Content = "RareXploit offers powerful tools for scripting and automation.\nKey features include:\n- Script Execution\n- Customizable Keybinds\n- Adjustable Settings\n- Real-time Feedback"
    })

    Tabs.Information:AddButton({
        Title = "Check Version",
        Description = "View current RareXploit version",
        Callback = function()
            Window:Dialog({
                Title = "Version Info",
                Content = "RareXploit Version: " .. RareXploit.Version,
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

    return Window, Tabs, Options
end

return gui
