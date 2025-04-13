local gui = {}

function gui.CreateGUI(RareXploit)
    local Window = RareXploit:CreateWindow({
        Title = "RareXploit 0.1",
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 400),
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

    -- Main Tab: Only Welcome Paragraph
    Tabs.Main:AddParagraph({
        Title = "Welcome to RareXploit",
        Content = "Explore the features and configure your settings."
    })

    -- Create a Scrolling Frame for additional features
    local ScrollingFrame = Tabs.Main:AddScrollingFrame({
        Size = UDim2.new(1, -10, 0.4, 0), -- Adjusted to leave padding and limit height
        Position = UDim2.new(0, 5, 0.3, 0), -- Positioned below Welcome with offset
        ScrollBarThickness = 4,
        CanvasSize = UDim2.new(0, 0, 2, 0), -- Adjustable based on content
        Visible = false, -- Initially hidden
        BottomImage = "", -- Prevents overflow visual
        TopImage = "",
        MidImage = ""
    })

    -- Toggle Button to show/hide Scrolling Frame
    Tabs.Main:AddButton({
        Title = "Show More Features",
        Callback = function()
            ScrollingFrame.Visible = not ScrollingFrame.Visible
        end
    })

    -- Add features to Scrolling Frame
    ScrollingFrame:AddButton({
        Title = "Execute Script",
        Description = "Run your custom script",
        Callback = function()
            Window:Dialog({
                Title = "Execute",
                Content = "Are you sure you want to execute the script?",
                Buttons = {
                    { Title = "Confirm", Callback = function() print("Script executed.") end },
                    { Title = "Cancel", Callback = function() print("Execution cancelled.") end }
                }
            })
        end
    })

    local Toggle = ScrollingFrame:AddToggle("MyToggle", {
        Title = "Enable Feature",
        Default = false
    })
    Toggle:OnChanged(function()
        print("Feature enabled:", Options.MyToggle.Value)
    end)

    local Slider = ScrollingFrame:AddSlider("Slider", {
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

    local Keybind = ScrollingFrame:AddKeybind("Keybind", {
        Title = "Quick Toggle",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Keybind activated:", Value)
        end
    })

    -- Settings Tab: Restored
    Tabs.Settings:AddParagraph({
        Title = "Settings",
        Content = "Configure your RareXploit preferences."
    })

    Tabs.Settings:AddToggle("AutoExecute", {
        Title = "Auto Execute Scripts",
        Default = false,
        Callback = function(Value)
            print("Auto Execute:", Value)
        end
    })

    -- Information Tab: Restored
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
                Content = "RareXploit Version: 0.1",
                Buttons = {
                    { Title = "OK", Callback = function() print("Version checked.") end }
                }
            })
        end
    })

    return Window, Tabs, Options
end

return gui
