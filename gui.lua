local gui = {}

function gui.CreateGUI(RareXploit)
    local Window = RareXploit:CreateWindow({
        Title = "RareXploit 0.2",
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 400),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    -- Khởi tạo các tab
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
        Information = Window:AddTab({ Title = "Information", Icon = "info" })
    }

    local Options = RareXploit.Options

    -- Thông báo
    RareXploit:Notify({
        Title = "Welcome",
        Content = "RareXploit đã tải thành công!",
        Duration = 5
    })

    -- Tab Main: Chỉ có Welcome
    Tabs.Main:AddParagraph({
        Title = "Chào mừng đến với RareXploit",
        Content = "Khám phá các tính năng và tùy chỉnh cài đặt của bạn."
    })

    -- Tạo ScrollingFrame cho các tính năng bổ sung
    local ScrollingFrame = Tabs.Main:AddScrollingFrame({
        Size = UDim2.new(0.95, 0, 0.35, 0), -- Giới hạn kích thước, để lại lề
        Position = UDim2.new(0.025, 0, 0.25, 0), -- Đặt dưới Welcome, có lề
        ScrollBarThickness = 4,
        CanvasSize = UDim2.new(0, 0, 1.5, 0), -- Kéo xuống cho nội dung
        Visible = false -- Ẩn mặc định
    })

    -- Nút bật/tắt ScrollingFrame
    Tabs.Main:AddButton({
        Title = "Xem thêm tính năng",
        Callback = function()
            ScrollingFrame.Visible = not ScrollingFrame.Visible
        end
    })

    -- Thêm nội dung vào ScrollingFrame
    ScrollingFrame:AddButton({
        Title = "Thực thi Script",
        Description = "Chạy script tùy chỉnh",
        Callback = function()
            Window:Dialog({
                Title = "Thực thi",
                Content = "Bạn có chắc muốn chạy script không?",
                Buttons = {
                    { Title = "Xác nhận", Callback = function() print("Đã chạy script.") end },
                    { Title = "Hủy", Callback = function() print("Đã hủy.") end }
                }
            })
        end
    })

    local Toggle = ScrollingFrame:AddToggle("MyToggle", {
        Title = "Bật tính năng",
        Default = false
    })
    Toggle:OnChanged(function()
        print("Tính năng bật:", Options.MyToggle.Value)
    end)

    local Slider = ScrollingFrame:AddSlider("Slider", {
        Title = "Điều chỉnh tốc độ",
        Description = "Điều chỉnh cường độ tính năng",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Tốc độ:", Value)
        end
    })

    local Keybind = ScrollingFrame:AddKeybind("Keybind", {
        Title = "Phím tắt",
        Mode = "Toggle",
        Default = "LeftControl",
        Callback = function(Value)
            print("Phím tắt kích hoạt:", Value)
        end
    })

    -- Tab Settings: Khôi phục
    Tabs.Settings:AddParagraph({
        Title = "Cài đặt",
        Content = "Tùy chỉnh các thiết lập cho RareXploit."
    })

    Tabs.Settings:AddToggle("AutoExecute", {
        Title = "Tự động chạy Script",
        Default = false,
        Callback = function(Value)
            print("Tự động chạy:", Value)
        end
    })

    -- Tab Information: Khôi phục
    Tabs.Information:AddParagraph({
        Title = "Tổng quan tính năng",
        Content = "RareXploit cung cấp công cụ mạnh mẽ cho scripting và tự động hóa.\nCác tính năng chính:\n- Thực thi Script\n- Phím tắt tùy chỉnh\n- Cài đặt điều chỉnh\n- Phản hồi thời gian thực"
    })

    Tabs.Information:AddButton({
        Title = "Kiểm tra phiên bản",
        Description = "Xem phiên bản hiện tại của RareXploit",
        Callback = function()
            Window:Dialog({
                Title = "Thông tin phiên bản",
                Content = "Phiên bản RareXploit: 0.1",
                Buttons = {
                    { Title = "OK", Callback = function() print("Đã kiểm tra phiên bản.") end }
                }
            })
        end
    })

    return Window, Tabs, Options
end

return gui
