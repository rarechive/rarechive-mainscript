local gui = {}

function gui.CreateGUI(RareXploit)
    local Window = RareXploit:CreateWindow({
        Title = "RareXploit 0.1",
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(490, 345),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Information = Window:AddTab({ Title = "Information", Icon = "info" }),
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Player = Window:AddTab({ Title = "Player", Icon = "person" }), -- New Player tab with person icon
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    local Options = RareXploit.Options

    -- Notification
    RareXploit:Notify({
        Title = "Welcome",
        Content = "RareXploit has loaded successfully!",
        Duration = 5
    })

    -- Main Tab: Only Welcome
    Tabs.Main:AddParagraph({
        Title = "Welcome to RareXploit",
        Content = "Explore the features and configure your settings."
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

    -- Player Tab: Noclip Toggle
    Tabs.Player:AddToggle({
        Title = "Noclip",
        Description = "Enable or disable noclip",
        Callback = function(state)
            -- No logic implemented yet
        end
    })

    -- Automatically select Information tab on start
    Window:SelectTab(Tabs.Information)

    return Window, Tabs, Options
end

return gui
