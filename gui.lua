-- gui.lua
local Gui = {}

function Gui:Init(Window, Fluent)
    local Options = Fluent.Options

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    Fluent:Notify({
        Title = "Welcome to RareXploit!",
        Content = "Hub đã được tối ưu cho mobile với kích thước mới!",
        Duration = 3
    })

    Tabs.Main:AddParagraph({
        Title = "Chào mừng bạn!",
        Content = "Hub RareXploit với giao diện chữ nhật vừa màn hình."
    })

    Tabs.Main:AddButton({
        Title = "Test Button",
        Description = "Nhấn để kiểm tra",
        Callback = function()
            Window:Dialog({
                Title = "Thông báo",
                Content = "Bạn vừa nhấn nút!",
                Buttons = {
                    {
                        Title = "OK",
                        Callback = function()
                            print("Đã nhấn OK")
                        end
                    }
                }
            })
        end
    })

    local Toggle = Tabs.Main:AddToggle("MobileToggle", {
        Title = "Bật/Tắt Tính Năng",
        Default = false
    })

    Toggle:OnChanged(function()
        print("Toggle state:", Options.MobileToggle.Value)
    })

    local Slider = Tabs.Main:AddSlider("MobileSlider", {
        Title = "Điều chỉnh giá trị",
        Description = "Kéo để thay đổi",
        Default = 50,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            print("Slider value:", Value)
        end
    })

    Tabs.Settings:AddButton({
        Title = "Reset Settings",
        Description = "Đặt lại tất cả cài đặt",
        Callback = function()
            print("Đã reset cài đặt")
        end
    })

    Tabs.Main:AddParagraph({
        Title = "Lưu ý",
        Content = "Giao diện đã được căn giữa và tối ưu cho màn hình nhỏ."
    })
end

return Gui
