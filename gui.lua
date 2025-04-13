-- RareXploit GUI Script
-- Created by Rarechive
-- Uses Fluent Library by dawid

local Gui = {}

function Gui:Setup(Window, Fluent)
    -- Tạo các tab
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Scripts = Window:AddTab({ Title = "Scripts", Icon = "code" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    -- Tab Main
    Tabs.Main:AddParagraph({
        Title = "Welcome to RareXploit!",
        Content = "Created by Rarechive. This script hub is designed for Delta Executor."
    })

    Tabs.Main:AddButton({
        Title = "Test Notification",
        Description = "Send a test notification",
        Callback = function()
            Fluent:Notify({
                Title = "Test",
                Content = "This is a test notification from RareXploit!",
                Duration = 3
            })
        end
    })

    -- Tab Scripts
    local scriptInput = Tabs.Scripts:AddTextbox({
        Title = "Execute Custom Script",
        Default = "",
        Placeholder = "Paste your script here...",
        Callback = function(value)
            if Gui.OnExecute then
                Gui.OnExecute(value)
            else
                Fluent:Notify({
                    Title = "Error",
                    Content = "Executor not initialized!",
                    Duration = 5
                })
            end
        end
    })

    Tabs.Scripts:AddButton({
        Title = "Sample Script",
        Description = "Run a sample ESP script",
        Callback = function()
            local sampleScript = [[
                -- Sample ESP Script
                local Players = game:GetService("Players")
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    end
                end
            ]]
            if Gui.OnExecute then
                Gui.OnExecute(sampleScript)
            end
        end
    })

    -- Tab Settings
    local themeToggle = Tabs.Settings:AddToggle({
        Title = "Acrylic Effect",
        Default = true,
        Callback = function(value)
            Fluent.Options.Acrylic = value
            Fluent:UpdateAcrylic()
        end
    })

    Tabs.Settings:AddButton({
        Title = "Destroy GUI",
        Description = "Close the script hub",
        Callback = function()
            Window:Destroy()
        end
    })

    -- Chọn tab mặc định
    Window:SelectTab(1)
end

return Gui
