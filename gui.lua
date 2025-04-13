local gui = {}

function gui.CreateGUI(RareXploit)
    -- Lấy kích thước màn hình để giới hạn hub
    local screenSize = game:GetService("UserInputService"):GetDisplaySize() or Vector2.new(1920, 1080)
    local maxHeight = screenSize.Y - 100 -- Giới hạn cách rìa dưới 100 pixels

    local Window = RareXploit:CreateWindow({
        Title = "RareXploit 0.1",
        SubTitle = "by Rarechive",
        TabWidth = 160,
        Size = UDim2.fromOffset(600, math.min(500, maxHeight)), -- Kích thước ban đầu, giới hạn chiều cao
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl,
        Scrollable = true -- Bật cuộn khi nội dung dài
    })

    -- Sắp xếp lại thứ tự tab
    local Tabs = {
        Information = Window:AddTab({ Title = "Information", Icon = "info" }),
        Main = Window:AddTab({ Title = "Main", Icon = "home" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    local Options = RareXploit.Options

    -- Notification
    RareXploit:Notify({
        Title = "Welcome",
        Content = "RareXploit has loaded successfully!",
        Duration = 5
    })

    -- Main Tab: Chỉ giữ Welcome
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

    -- Settings Tab: Hiện tại giữ nguyên (trống)
    -- Có thể thêm nội dung sau nếu cần

    -- Tạo nút toggle ẩn/hiện hub
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.fromOffset(50, 50)
    toggleButton.Position = UDim2.fromOffset(10, 10) -- Góc trên trái
    toggleButton.Text = "Toggle"
    toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Parent = game:GetService("CoreGui") -- Đặt ngoài Window để luôn hiển thị

    local isVisible = true
    toggleButton.MouseButton1Click:Connect(function()
        isVisible = not isVisible
        Window.Visible = isVisible
        toggleButton.Text = isVisible and "Hide" or "Show"
    end)

    return Window, Tabs, Options
end

return gui
