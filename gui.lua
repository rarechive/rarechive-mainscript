-- gui.lua
local Gui = {}

function Gui:Init(Window, Fluent)
    local Options = Fluent.Options

    -- Tạo các tab
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "伸手" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    -- Thông báo khởi động
    Fluent:Notify({
        Title = "Welcome to RareXploit!",
        Content = "Hub đã được tối ưu cho mobile với kích thước mới!",
        Duration = 3
    })

    -- Tab Main: Thêm các thành phần giao diện
    Tabs.Main:AddParagraph({
        Title = "Chào mừng bạn!",
        Content = "Hub RareXploit với giao diện chữ nhật vừa màn hình."
    })

    -- Button
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
                        }
                    }
                }
            })
        end
    })

    -- Toggle
    local Toggle = Tabs.Main:AddToggle("MobileToggle", {
        Title = "Bật/Tắt Tính Năng",
        Default = false
    })

    Toggle:OnChanged(function()
        print("Toggle state:", Options.MobileToggle.Value)
    })

    -- Slider
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

    -- Tab Settings: Ví dụ cài đặt
    Tabs.Settings:AddButton({
        Title = "Reset Settings",
        Description = "Đặt lại tất cả cài đặt",
        Callback = function()
            print("Đã reset cài đặt")
        end
    })

    -- Tối ưu giao diện cho mobile
    Tabs.Main:AddParagraph({
        Title = "Lưu ý",
        Content = "Giao diện đã được căn giữa và tối ưu cho màn hình nhỏ."
    })
end

return Gui
