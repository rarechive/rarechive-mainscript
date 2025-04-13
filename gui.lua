-- gui.lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "RareXploit " .. Fluent.Version,
    SubTitle = "by Rarechive",
    TabWidth = 140, -- Slightly smaller tab width
    Size = UDim2.fromOffset(500, 400), -- Smaller size to fit most screens
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- GUI Elements
do
    Fluent:Notify({
        Title = "Notification",
        Content = "Welcome to RareXploit!",
        Duration = 5
    })

    Tabs.Main:AddParagraph({
        Title = "Welcome",
        Content = "This is the RareXploit hub.\nEnjoy the features!"
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Click for action",
        Callback = function()
            Window:Dialog({
                Title = "Action",
                Content = "Confirm your action?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Action confirmed.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Action cancelled.")
                        end
                    }
                }
            })
        end
    })

    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })
    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)
    Options.MyToggle:SetValue(false)

    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "Adjust value",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider changed:", Value)
        end
    })
    Slider:SetValue(3)

    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"},
        Multi = false,
        Default = 1,
    })
    Dropdown:SetValue("four")
    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)

    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Multi Dropdown",
        Description = "Select multiple options",
        Values = {"one", "two", "three", "four", "five"},
        Multi = true,
        Default = {"two", "four"},
    })
    MultiDropdown:SetValue({three = true, five = true})
    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("MultiDropdown changed:", table.concat(Values, ", "))
    end)

    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })
    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Transparency Colorpicker",
        Description = "Adjust color and transparency",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })
    TColorpicker:OnChanged(function()
        print("TColorpicker changed:", TColorpicker.Value, "Transparency:", TColorpicker.Transparency)
    end)

    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "Keybind",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)
    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end
            if Fluent.Unloaded then break end
        end
    end)
    Keybind:SetValue("MB2", "Toggle")

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Enter text",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })
    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end

-- Build Settings Tab
SaveManager:BuildConfigSection(Tabs.Settings)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

-- Select Main Tab
Window:SelectTab(1)

return Fluent
