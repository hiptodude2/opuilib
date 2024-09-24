-- Roblox UI Library for Scripts
-- WARNING: This code is for EDUCATIONAL PURPOSES ONLY. Use responsibly.

local UILibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function UILibrary.new(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ScriptUI"
    ScreenGui.Parent = game.CoreGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 600, 0, 700)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -350)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 15)
    Corner.Parent = MainFrame
    
    local TitleBar = Instance.new("TextLabel")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 60)
    TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 28
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.Text = title or "Enhanced Script UI"
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 15)
    TitleCorner.Parent = TitleBar
    
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -40, 1, -80)
    ContentFrame.Position = UDim2.new(0, 20, 0, 70)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ScrollBarThickness = 8
    ContentFrame.Parent = MainFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 15)
    UIListLayout.Parent = ContentFrame
    
    local library = {}
    
    function library:AddButton(text, callback)
        local Button = Instance.new("TextButton")
        Button.Name = text
        Button.Size = UDim2.new(1, 0, 0, 50)
        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 22
        Button.Font = Enum.Font.GothamSemibold
        Button.Text = text
        Button.Parent = ContentFrame
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 10)
        ButtonCorner.Parent = Button
        
        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 65)}):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        end)
        
        Button.MouseButton1Click:Connect(callback)
        
        return Button
    end
    
    function library:AddToggle(text, default, callback)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Name = text
        ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
        ToggleFrame.BackgroundTransparency = 1
        ToggleFrame.Parent = ContentFrame
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Name = "ToggleButton"
        ToggleButton.Size = UDim2.new(0, 40, 0, 40)
        ToggleButton.Position = UDim2.new(0, 5, 0.5, -20)
        ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
        ToggleButton.Parent = ToggleFrame
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 8)
        ToggleCorner.Parent = ToggleButton
        
        local ToggleText = Instance.new("TextLabel")
        ToggleText.Name = "ToggleText"
        ToggleText.Size = UDim2.new(1, -50, 1, 0)
        ToggleText.Position = UDim2.new(0, 50, 0, 0)
        ToggleText.BackgroundTransparency = 1
        ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleText.TextSize = 22
        ToggleText.Font = Enum.Font.GothamSemibold
        ToggleText.Text = text
        ToggleText.TextXAlignment = Enum.TextXAlignment.Left
        ToggleText.Parent = ToggleFrame
        
        local toggled = default
        ToggleButton.MouseButton1Click:Connect(function()
            toggled = not toggled
            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)}):Play()
            callback(toggled)
        end)
        
        return ToggleFrame
    end
    
    function library:AddSlider(text, min, max, default, callback)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Name = text
        SliderFrame.Size = UDim2.new(1, 0, 0, 70)
        SliderFrame.BackgroundTransparency = 1
        SliderFrame.Parent = ContentFrame
        
        local SliderText = Instance.new("TextLabel")
        SliderText.Name = "SliderText"
        SliderText.Size = UDim2.new(1, 0, 0, 30)
        SliderText.BackgroundTransparency = 1
        SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderText.TextSize = 22
        SliderText.Font = Enum.Font.GothamSemibold
        SliderText.Text = text .. ": " .. default
        SliderText.Parent = SliderFrame
        
        local SliderBack = Instance.new("Frame")
        SliderBack.Name = "SliderBack"
        SliderBack.Size = UDim2.new(1, 0, 0, 10)
        SliderBack.Position = UDim2.new(0, 0, 0, 40)
        SliderBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        SliderBack.Parent = SliderFrame
        
        local SliderBackCorner = Instance.new("UICorner")
        SliderBackCorner.CornerRadius = UDim.new(0, 5)
        SliderBackCorner.Parent = SliderBack
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Name = "SliderFill"
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
        SliderFill.Parent = SliderBack
        
        local SliderFillCorner = Instance.new("UICorner")
        SliderFillCorner.CornerRadius = UDim.new(0, 5)
        SliderFillCorner.Parent = SliderFill
        
        local SliderButton = Instance.new("TextButton")
        SliderButton.Name = "SliderButton"
        SliderButton.Size = UDim2.new(0, 20, 0, 20)
        SliderButton.Position = UDim2.new((default - min) / (max - min), -10, 0, -5)
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderButton.Text = ""
        SliderButton.Parent = SliderBack
        
        local SliderButtonCorner = Instance.new("UICorner")
        SliderButtonCorner.CornerRadius = UDim.new(1, 0)
        SliderButtonCorner.Parent = SliderButton
        
        local dragging = false
        SliderButton.MouseButton1Down:Connect(function() dragging = true end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = UserInputService:GetMouseLocation()
                local relativePos = mousePos.X - SliderBack.AbsolutePosition.X
                local percentage = math.clamp(relativePos / SliderBack.AbsoluteSize.X, 0, 1)
                local value = math.floor(min + (max - min) * percentage)
                
                TweenService:Create(SliderFill, TweenInfo.new(0.1), {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
                TweenService:Create(SliderButton, TweenInfo.new(0.1), {Position = UDim2.new(percentage, -10, 0, -5)}):Play()
                SliderText.Text = text .. ": " .. value
                
                callback(value)
            end
        end)
        
        return SliderFrame
    end
    
    function library:AddDropdown(text, options, callback)
        local DropdownFrame = Instance.new("Frame")
        DropdownFrame.Name = text
        DropdownFrame.Size = UDim2.new(1, 0, 0, 50)
        DropdownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        DropdownFrame.Parent = ContentFrame
        
        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 10)
        DropdownCorner.Parent = DropdownFrame
        
        local DropdownText = Instance.new("TextLabel")
        DropdownText.Name = "DropdownText"
        DropdownText.Size = UDim2.new(1, -50, 1, 0)
        DropdownText.BackgroundTransparency = 1
        DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownText.TextSize = 22
        DropdownText.Font = Enum.Font.GothamSemibold
        DropdownText.Text = text
        DropdownText.TextXAlignment = Enum.TextXAlignment.Left
        DropdownText.Parent = DropdownFrame
        
        local DropdownButton = Instance.new("TextButton")
        DropdownButton.Name = "DropdownButton"
        DropdownButton.Size = UDim2.new(0, 40, 0, 40)
        DropdownButton.Position = UDim2.new(1, -45, 0.5, -20)
        DropdownButton.BackgroundTransparency = 1
        DropdownButton.Text = "▼"
        DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownButton.TextSize = 24
        DropdownButton.Font = Enum.Font.GothamBold
        DropdownButton.Parent = DropdownFrame
        
        local OptionsFrame = Instance.new("Frame")
        OptionsFrame.Name = "OptionsFrame"
        OptionsFrame.Size = UDim2.new(1, 0, 0, #options * 40)
        OptionsFrame.Position = UDim2.new(0, 0, 1, 5)
        OptionsFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        OptionsFrame.Visible = false
        OptionsFrame.Parent = DropdownFrame
        
        local OptionsCorner = Instance.new("UICorner")
        OptionsCorner.CornerRadius = UDim.new(0, 10)
        OptionsCorner.Parent = OptionsFrame
        
        for i, option in ipairs(options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Name = option
            OptionButton.Size = UDim2.new(1, 0, 0, 40)
            OptionButton.Position = UDim2.new(0, 0, 0, (i-1) * 40)
            OptionButton.BackgroundTransparency = 1
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.TextSize = 20
            OptionButton.Font = Enum.Font.GothamSemibold
            OptionButton.Text = option
            OptionButton.Parent = OptionsFrame
            
            OptionButton.MouseButton1Click:Connect(function()
                DropdownText.Text = text .. ": " .. option
                OptionsFrame.Visible = false
                callback(option)
            end)
        end
        
        DropdownButton.MouseButton1Click:Connect(function()
            OptionsFrame.Visible = not OptionsFrame.Visible
        end)
        
        return DropdownFrame
    end
    
    function library:AddColorPicker(text, default, callback)
        local ColorPickerFrame = Instance.new("Frame")
        ColorPickerFrame.Name = text
        ColorPickerFrame.Size = UDim2.new(1, 0, 0, 70)
        ColorPickerFrame.BackgroundTransparency = 1
        ColorPickerFrame.Parent = ContentFrame
        
        local ColorPickerText = Instance.new("TextLabel")
        ColorPickerText.Name = "ColorPickerText"
        ColorPickerText.Size = UDim2.new(1, -60, 1, 0)
        ColorPickerText.BackgroundTransparency = 1
        ColorPickerText.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorPickerText.TextSize = 22
        ColorPickerText.Font = Enum.Font.GothamSemibold
        ColorPickerText.Text = text
        ColorPickerText.TextXAlignment = Enum.TextXAlignment.Left
        ColorPickerText.Parent = ColorPickerFrame
        
        local ColorDisplay = Instance.new("Frame")
        ColorDisplay.Name = "ColorDisplay"
        ColorDisplay.Size = UDim2.new(0, 50, 0, 50)
        ColorDisplay.Position = UDim2.new(1, -55, 0.5, -25)
        ColorDisplay.BackgroundColor3 = default
        ColorDisplay.Parent = ColorPickerFrame
        
        local ColorDisplayCorner = Instance.new("UICorner")
        ColorDisplayCorner.CornerRadius = UDim.new(0, 8)
        ColorDisplayCorner.Parent = ColorDisplay
        
        ColorDisplay.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local ColorPicker = Instance.new("ColorPicker")
                ColorPicker.Color = default
                ColorPicker.Parent = ColorPickerFrame
                
                ColorPicker:GetPropertyChangedSignal("Color"):Connect(function()
                    ColorDisplay.BackgroundColor3 = ColorPicker.Color
                    callback(ColorPicker.Color)
                end)
                
                ColorPicker.Closed:Connect(function()
                    ColorPicker:Destroy()
                end)
            end
        end)
        
        return ColorPickerFrame
    end
    
    function library:AddKeybind(text, default, callback)
        local KeybindFrame = Instance.new("Frame")
        KeybindFrame.Name = text
        KeybindFrame.Size = UDim2.new(1, 0, 0, 50)
        KeybindFrame.BackgroundTransparency = 1
        KeybindFrame.Parent = ContentFrame
        
        local KeybindText = Instance.new("TextLabel")
        KeybindText.Name = "KeybindText"
        KeybindText.Size = UDim2.new(1, -60, 1, 0)
        KeybindText.BackgroundTransparency = 1
        KeybindText.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeybindText.TextSize = 22
        KeybindText.Font = Enum.Font.GothamSemibold
        KeybindText.Text = text
        KeybindText.TextXAlignment = Enum.TextXAlignment.Left
        KeybindText.Parent = KeybindFrame
        
        local KeybindButton = Instance.new("TextButton")
        KeybindButton.Name = "KeybindButton"
        KeybindButton.Size = UDim2.new(0, 50, 0, 40)
        KeybindButton.Position = UDim2.new(1, -55, 0.5, -20)
        KeybindButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeybindButton.TextSize = 18
        KeybindButton.Font = Enum.Font.GothamSemibold
        KeybindButton.Text = default.Name
        KeybindButton.Parent = KeybindFrame
        
        local KeybindCorner = Instance.new("UICorner")
        KeybindCorner.CornerRadius = UDim.new(0, 8)
        KeybindCorner.Parent = KeybindButton
        
        local currentKey = default
        
        KeybindButton.MouseButton1Click:Connect(function()
            KeybindButton.Text = "..."
            
            local inputConnection
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    KeybindButton.Text = currentKey.Name
                    callback(currentKey)
                    inputConnection:Disconnect()
                end
            end)
        end)
        
        return KeybindFrame
    end
    
    return library
end

return UILibrary
