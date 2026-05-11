-- ts file was generated at discord.gg/25ms

local _LocalPlayer4 = game:GetService('Players').LocalPlayer
local _call8 = game:GetService('UserInputService')
local _call10 = game:GetService('TweenService')

game:GetService('VirtualInputManager')
game:GetService('VirtualUser')
game:GetService('Stats')
game:GetService('Lighting')

local _ = workspace.CurrentCamera
local _call23 = Instance.new('ScreenGui')

_call23.Name = 'DynamicGUI'
_call23.ResetOnSpawn = false
_call23.Parent = _LocalPlayer4:WaitForChild('PlayerGui')

local _call25 = Instance.new('Frame')

_call25.Size = UDim2.new(0, 600, 0, 480)
_call25.AnchorPoint = Vector2.new(0.5, 0.5)
_call25.Position = UDim2.new(0.5, 0, 0.5, 0)
_call25.BackgroundColor3 = Color3.fromRGB(34, 36, 38)
_call25.BorderSizePixel = 0
_call25.BackgroundTransparency = 0
_call25.ClipsDescendants = true
_call25.Parent = _call23

local _call35 = Instance.new('UICorner')

_call35.CornerRadius = UDim.new(0, 10)
_call35.Parent = _call25

local _call39 = Instance.new('Frame')

_call39.Size = UDim2.new(0, 1, 1, 0)
_call39.Position = UDim2.new(0, 200, 0, 0)
_call39.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_call39.BorderSizePixel = 0
_call39.ZIndex = 15
_call39.Parent = _call25

local _call47 = Instance.new('TextButton')

_call47.BackgroundTransparency = 1
_call47.Text = ''
_call47.Modal = true
_call47.Size = UDim2.fromScale(1, 1)
_call47.ZIndex = 0
_call47.Parent = _call25

local _call51 = Instance.new('Frame')

_call51.Size = UDim2.new(1, -186, 0, 50)
_call51.Position = UDim2.new(0, 186, 0, 0)
_call51.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
_call51.BorderSizePixel = 0
_call51.Parent = _call25
_call51.ZIndex = 10

local _call59 = Instance.new('UIPadding')

_call59.PaddingLeft = UDim.new(0, 15)
_call59.PaddingRight = UDim.new(0, 15)
_call59.Parent = _call51

local _call65 = Instance.new('UICorner')

_call65.CornerRadius = UDim.new(0, 10)
_call65.Parent = _call51

local _call69 = Instance.new('TextButton')

_call69.Size = UDim2.new(0, 24, 0, 24)
_call69.Position = UDim2.new(1, -30, 0.5, -12)
_call69.BackgroundTransparency = 1
_call69.Text = ''
_call69.ZIndex = 12
_call69.Parent = _call51

local _call75 = Instance.new('Frame')

_call75.Size = UDim2.new(0, 18, 0, 2)
_call75.Position = UDim2.new(0.5, -9, 0.5, 0)
_call75.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
_call75.BorderSizePixel = 0
_call75.Rotation = 45
_call75.ZIndex = 13
_call75.Parent = _call69

local _call83 = Instance.new('Frame')

_call83.Size = UDim2.new(0, 18, 0, 2)
_call83.Position = UDim2.new(0.5, -9, 0.5, 0)
_call83.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
_call83.BorderSizePixel = 0
_call83.Rotation = -45
_call83.ZIndex = 13
_call83.Parent = _call69

local _call91 = Instance.new('TextLabel')

_call91.Size = UDim2.new(0, 110, 0, 20)
_call91.Position = UDim2.new(1, -160, 0.5, -10)
_call91.BackgroundTransparency = 1
_call91.Text = 'FPS: 0 | Ping: 0ms'
_call91.TextColor3 = Color3.fromRGB(0, 255, 200)
_call91.Font = Enum.Font.SourceSansSemibold
_call91.TextSize = 15
_call91.TextXAlignment = Enum.TextXAlignment.Right
_call91.ZIndex = 11
_call91.Parent = _call51

game:GetService('RunService').RenderStepped:Connect(function(_105, _105_2, _105_3)
    local _ = 0 + _105

    error('line 1: attempt to compare number <= table')
end)

local _call108 = Instance.new('ScrollingFrame')

_call108.Position = UDim2.new(0, 0, 0, 0)
_call108.Size = UDim2.new(0, 200, 1, 0)
_call108.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
_call108.ScrollBarThickness = 0
_call108.BorderSizePixel = 0
_call108.AutomaticCanvasSize = Enum.AutomaticSize.Y
_call108.CanvasSize = UDim2.new(0, 0, 0, 0)
_call108.ScrollingDirection = Enum.ScrollingDirection.Y
_call108.Parent = _call25

local _call122 = Instance.new('UICorner')

_call122.CornerRadius = UDim.new(0, 10)
_call122.Parent = _call108

local _call126 = Instance.new('Frame')

_call126.Size = UDim2.new(1, 0, 0, 50)
_call126.BackgroundTransparency = 1
_call126.LayoutOrder = -1
_call126.Parent = _call108

local _call130 = Instance.new('TextLabel')

_call130.Size = UDim2.new(1, 0, 0, 24)
_call130.BackgroundTransparency = 1
_call130.Text = 'Blox Loot'
_call130.TextColor3 = Color3.fromRGB(0, 255, 200)
_call130.Font = Enum.Font.GothamBlack
_call130.TextSize = 20
_call130.TextXAlignment = Enum.TextXAlignment.Left
_call130.Parent = _call126

local _call140 = Instance.new('TextLabel')

_call140.Size = UDim2.new(1, 0, 0, 15)
_call140.Position = UDim2.new(0, 0, 0, 22)
_call140.BackgroundTransparency = 1
_call140.Text = 'by Sosiskomras'
_call140.TextColor3 = Color3.fromRGB(200, 200, 200)
_call140.Font = Enum.Font.SourceSans
_call140.TextSize = 12
_call140.TextXAlignment = Enum.TextXAlignment.Left
_call140.Parent = _call126

local _call152 = Instance.new('Frame')

_call152.Size = UDim2.new(1, 20, 0, 1)
_call152.Position = UDim2.new(0, -10, 1, -5)
_call152.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_call152.BorderSizePixel = 0
_call152.Parent = _call126

local _call160 = Instance.new('ScrollingFrame')

_call160.Size = UDim2.new(1, -200, 1, -50)
_call160.Position = UDim2.new(0, 200, 0, 50)
_call160.BackgroundTransparency = 1
_call160.ScrollBarThickness = 2
_call160.BorderSizePixel = 0
_call160.AutomaticCanvasSize = Enum.AutomaticSize.Y
_call160.CanvasSize = UDim2.new(0, 0, 0, 0)
_call160.ScrollingDirection = Enum.ScrollingDirection.Y
_call160.ScrollingEnabled = false
_call160.Parent = _call25

local _call172 = Instance.new('UIPadding')

_call172.PaddingTop = UDim.new(0, 20)
_call172.PaddingBottom = UDim.new(0, 20)
_call172.PaddingLeft = UDim.new(0, 10)
_call172.PaddingRight = UDim.new(0, 10)
_call172.Parent = _call108

local _call182 = Instance.new('UIListLayout')

_call182.FillDirection = Enum.FillDirection.Vertical
_call182.SortOrder = Enum.SortOrder.LayoutOrder
_call182.Padding = UDim.new(0, 7)
_call182.Parent = _call108

_call51.InputBegan:Connect(function(_192, _192_2, _192_3, _192_4, _192_5, _192_6)
    local _ = _192.UserInputType == Enum.UserInputType.MouseButton1
end)
_call8.InputChanged:Connect(function(_200, _200_2) end)
_call8.InputEnded:Connect(function(_204, _204_2)
    local _ = _204.UserInputType == Enum.UserInputType.MouseButton1
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_213, _213_2, _213_3, _213_4)
    _213:WaitForChild('Humanoid')
    _213:WaitForChild('HumanoidRootPart')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_221, _221_2, _221_3, _221_4)
    _221:WaitForChild('Humanoid')
    _221:WaitForChild('HumanoidRootPart')
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_230, _230_2, _230_3, _230_4, _230_5)
    _230:WaitForChild('Humanoid')
    _230:WaitForChild('HumanoidRootPart')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_238, _238_2, _238_3, _238_4, _238_5)
    _238:WaitForChild('Humanoid')
    _238:WaitForChild('HumanoidRootPart')
end)

local _ = Enum.KeyCode.Space
local _ = Enum.KeyCode.LeftShift
local _ = _LocalPlayer4.Character

task.spawn(function(_251, _251_2)
    _251:WaitForChild('HumanoidRootPart')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_257, _257_2)
    _257:WaitForChild('HumanoidRootPart')
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_264, _264_2, _264_3, _264_4)
    for _267, _267_2 in ipairs(_264:GetDescendants())do
        _267_2:IsA('BasePart')

        local _ = _267_2.CanCollide
    end

    _264.DescendantAdded:Connect(function(_274, _274_2, _274_3, _274_4, _274_5)
        _274:IsA('BasePart')

        local _ = _274.CanCollide
    end)
    _264.DescendantRemoving:Connect(function(_281, _281_2, _281_3, _281_4, _281_5)
        _281:IsA('BasePart')

        local _284 = table.find({
            [1] = _267_2,
            [2] = _274,
        }, _281)

        table.remove({
            [1] = _267_2,
            [2] = _274,
        }, _284)
    end)
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_289, _289_2, _289_3, _289_4)
    for _292, _292_2 in ipairs(_289:GetDescendants())do
        _292_2:IsA('BasePart')

        local _ = _292_2.CanCollide
    end

    _call273:Disconnect()
    _call280:Disconnect()
    _289.DescendantAdded:Connect(function(_303, _303_2, _303_3, _303_4, _303_5)
        _303:IsA('BasePart')

        local _ = _303.CanCollide
    end)
    _289.DescendantRemoving:Connect(function(_310, _310_2, _310_3, _310_4, _310_5)
        _310:IsA('BasePart')

        local _313 = table.find({
            [1] = _292_2,
            [2] = _303,
        }, _310)

        table.remove({
            [1] = _292_2,
            [2] = _303,
        }, _313)
    end)
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_319, _319_2, _319_3, _319_4, _319_5)
    _319:WaitForChild('Humanoid')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_325, _325_2, _325_3, _325_4, _325_5)
    _325:WaitForChild('Humanoid')
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_332, _332_2)
    _332:WaitForChild('Humanoid')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_338, _338_2)
    _338:WaitForChild('Humanoid')
end)

local _ = _LocalPlayer4.Character

task.spawn(function(_345, _345_2, _345_3)
    _345:WaitForChild('Humanoid')
    _345:WaitForChild('HumanoidRootPart')
end, _LocalPlayer4.Character)
_LocalPlayer4.CharacterAdded:Connect(function(_353, _353_2, _353_3)
    _353:WaitForChild('Humanoid')
    _353:WaitForChild('HumanoidRootPart')
end)

local _call359 = Instance.new('TextButton')

_call359.Size = UDim2.new(1, 0, 0, 38)
_call359.BackgroundColor3 = Color3.fromRGB(24, 28, 30)
_call359.Text = ''
_call359.AutoButtonColor = false
_call359.BorderSizePixel = 0
_call359.LayoutOrder = 1
_call359.Parent = _call108

local _call365 = Instance.new('UICorner')

_call365.CornerRadius = UDim.new(0, 8)
_call365.Parent = _call359

local _call369 = Instance.new('UIStroke')

_call369.Name = 'Stroke'
_call369.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call369.Color = Color3.fromRGB(45, 58, 56)
_call369.Thickness = 1
_call369.Transparency = 0
_call369.Parent = _call359

local _call375 = Instance.new('Frame')

_call375.Size = UDim2.new(0, 3, 1, -10)
_call375.Position = UDim2.new(0, 6, 0, 5)
_call375.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
_call375.BorderSizePixel = 0
_call375.BackgroundTransparency = 1
_call375.Name = 'ActiveLine'
_call375.Parent = _call359

local _call383 = Instance.new('UICorner')

_call383.CornerRadius = UDim.new(1, 0)
_call383.Parent = _call375

local _call387 = Instance.new('ImageLabel')

_call387.Name = 'Icon'
_call387.Size = UDim2.new(0, 18, 0, 18)
_call387.Position = UDim2.new(0, 16, 0.5, -9)
_call387.BackgroundTransparency = 1
_call387.Image = 'rbxassetid://101988819289766'
_call387.ImageColor3 = Color3.fromRGB(170, 190, 185)
_call387.Parent = _call359

local _call395 = Instance.new('TextLabel')

_call395.Name = 'Label'
_call395.Size = UDim2.new(1, -44, 1, 0)
_call395.Position = UDim2.new(0, 42, 0, 0)
_call395.BackgroundTransparency = 1
_call395.Text = 'Main'
_call395.TextColor3 = Color3.fromRGB(170, 190, 185)
_call395.Font = Enum.Font.GothamMedium
_call395.TextSize = 14
_call395.TextXAlignment = Enum.TextXAlignment.Left
_call395.Parent = _call359

_call359.MouseEnter:Connect(function()
    local _call415 = _call10:Create(_call359, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(30, 36, 38),
    })

    _call415:Play()

    local _call423 = _call10:Create(_call387, TweenInfo.new(0.15), {
        ImageColor3 = Color3.fromRGB(210, 230, 225),
    })

    _call423:Play()

    local _call431 = _call10:Create(_call395, TweenInfo.new(0.15), {
        TextColor3 = Color3.fromRGB(210, 230, 225),
    })

    _call431:Play()

    local _ = TweenInfo.new

    error('internal 579: <25ms: infinitelooperror>')
end)
_call359.MouseLeave:Connect(function(_439, _439_2, _439_3)
    TweenInfo.new(0.15)
    error('internal 579: <25ms: infinitelooperror>')
end)
_call359.MouseButton1Click:Connect(function(_446)
    _call160.ScrollingEnabled = false

    error('internal 579: <25ms: infinitelooperror>')
end)

local _call449 = Instance.new('Frame')

_call449.Size = UDim2.new(1, 0, 1, 0)
_call449.BackgroundTransparency = 1
_call449.Visible = false
_call449.Parent = _call160

local _call453 = Instance.new('Frame')

_call453.Size = UDim2.new(1, 0, 0, 0)
_call453.BackgroundTransparency = 1
_call453.AutomaticSize = Enum.AutomaticSize.Y
_call453.Parent = _call449

local _call459 = Instance.new('UIPadding')

_call459.PaddingTop = UDim.new(0, 10)
_call459.PaddingBottom = UDim.new(0, 20)
_call459.PaddingLeft = UDim.new(0, 15)
_call459.PaddingRight = UDim.new(0, 15)
_call459.Parent = _call453

local _call469 = Instance.new('UIListLayout')

_call469.FillDirection = Enum.FillDirection.Vertical
_call469.SortOrder = Enum.SortOrder.LayoutOrder
_call469.Padding = UDim.new(0, 10)
_call469.Parent = _call453

_call469:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function(_480, _480_2, _480_3, _480_4, _480_5) end)

_call449.Visible = true

local _484 = ((_call469.AbsoluteContentSize.Y + 10) + 20)
local _ = _call160.AbsoluteSize.Y < _484

_call160.ScrollingEnabled = true
_call160.CanvasSize = UDim2.new(0, 0, 0, _484)

local _call491 = Instance.new('Frame')

_call491.Name = 'Section_Block'
_call491.Size = UDim2.new(1, 0, 0, 0)
_call491.BackgroundColor3 = Color3.fromRGB(28, 30, 32)
_call491.BorderSizePixel = 0
_call491.AutomaticSize = Enum.AutomaticSize.Y
_call491.LayoutOrder = 1
_call491.Parent = _call453

local _call499 = Instance.new('UICorner')

_call499.CornerRadius = UDim.new(0, 8)
_call499.Parent = _call491

local _call503 = Instance.new('UIStroke')

_call503.Color = Color3.fromRGB(45, 45, 45)
_call503.Thickness = 1
_call503.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call503.Parent = _call491

local _call509 = Instance.new('UIPadding')

_call509.PaddingTop = UDim.new(0, 12)
_call509.PaddingBottom = UDim.new(0, 12)
_call509.PaddingLeft = UDim.new(0, 12)
_call509.PaddingRight = UDim.new(0, 12)
_call509.Parent = _call491

local _call519 = Instance.new('UIListLayout')

_call519.SortOrder = Enum.SortOrder.LayoutOrder
_call519.Padding = UDim.new(0, 8)
_call519.Parent = _call491

local _call525 = Instance.new('TextLabel')

_call525.Size = UDim2.new(1, 0, 0, 0)
_call525.BackgroundTransparency = 1
_call525.Text = "If it\u{2019}s not working, make sure you have only one weapon in your hotbar when turning it on. Once it's enabled, you can put your other weapons back!"
_call525.TextColor3 = Color3.fromRGB(255, 255, 255)
_call525.Font = Enum.Font.SourceSansSemibold
_call525.TextSize = 17
_call525.TextXAlignment = Enum.TextXAlignment.Left
_call525.TextWrapped = true
_call525.AutomaticSize = Enum.AutomaticSize.Y
_call525.LayoutOrder = 2
_call525.Parent = _call491

local _call537 = Instance.new('Frame')

_call537.Size = UDim2.new(1, 0, 0, 30)
_call537.BackgroundTransparency = 1
_call537.LayoutOrder = 3
_call537.Parent = _call491

local _call541 = Instance.new('TextLabel')

_call541.Size = UDim2.new(1, -60, 1, 0)
_call541.Position = UDim2.new(0, 0, 0, 0)
_call541.BackgroundTransparency = 1
_call541.Text = 'Kill Aura (no cooldown)'
_call541.TextColor3 = Color3.fromRGB(230, 230, 230)
_call541.Font = Enum.Font.SourceSansSemibold
_call541.TextSize = 18
_call541.TextXAlignment = Enum.TextXAlignment.Left
_call541.Parent = _call537

local _call553 = Instance.new('TextButton')

_call553.Size = UDim2.new(0, 50, 0, 24)
_call553.Position = UDim2.new(1, -55, 0.5, -12)
_call553.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
_call553.BorderSizePixel = 0
_call553.Text = ''
_call553.Parent = _call537

local _call561 = Instance.new('UICorner')

_call561.CornerRadius = UDim.new(0.5, 0)
_call561.Parent = _call553

local _call565 = Instance.new('Frame')

_call565.Size = UDim2.new(0, 20, 0, 20)
_call565.Position = UDim2.new(0, 2, 0.5, -10)
_call565.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_call565.Parent = _call553

local _call573 = Instance.new('UICorner')

_call573.CornerRadius = UDim.new(1, 0)
_call573.Parent = _call565

_call553.MouseButton1Click:Connect(function(_579, _579_2, _579_3) end)

local _call587 = _call10:Create(_call553, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
    BackgroundColor3 = Color3.fromRGB(180, 180, 180),
})

_call587:Play()

local _call597 = _call10:Create(_call565, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
    Position = UDim2.new(0, 2, 0.5, -10),
})

_call597:Play()

local _call601 = Instance.new('Frame')

_call601.Name = 'Auto Farm Loot_Block'
_call601.Size = UDim2.new(1, 0, 0, 0)
_call601.BackgroundColor3 = Color3.fromRGB(28, 30, 32)
_call601.BorderSizePixel = 0
_call601.AutomaticSize = Enum.AutomaticSize.Y
_call601.LayoutOrder = 4
_call601.Parent = _call453

local _call609 = Instance.new('UICorner')

_call609.CornerRadius = UDim.new(0, 8)
_call609.Parent = _call601

local _call613 = Instance.new('UIStroke')

_call613.Color = Color3.fromRGB(45, 45, 45)
_call613.Thickness = 1
_call613.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call613.Parent = _call601

local _call619 = Instance.new('UIPadding')

_call619.PaddingTop = UDim.new(0, 12)
_call619.PaddingBottom = UDim.new(0, 12)
_call619.PaddingLeft = UDim.new(0, 12)
_call619.PaddingRight = UDim.new(0, 12)
_call619.Parent = _call601

local _call629 = Instance.new('UIListLayout')

_call629.SortOrder = Enum.SortOrder.LayoutOrder
_call629.Padding = UDim.new(0, 8)
_call629.Parent = _call601

local _call635 = Instance.new('TextLabel')

_call635.Size = UDim2.new(1, 0, 0, 18)
_call635.BackgroundTransparency = 1
_call635.Text = 'AUTO FARM LOOT'
_call635.TextColor3 = Color3.fromRGB(0, 255, 200)
_call635.Font = Enum.Font.GothamBold
_call635.TextSize = 13
_call635.TextXAlignment = Enum.TextXAlignment.Left
_call635.LayoutOrder = -1
_call635.Parent = _call601

local _call645 = Instance.new('Frame')

_call645.Size = UDim2.new(1, 0, 0, 34)
_call645.BackgroundTransparency = 1
_call645.ClipsDescendants = true
_call645.LayoutOrder = 5
_call645.Parent = _call601

local _call649 = Instance.new('Frame')

_call649.Size = UDim2.new(1, 0, 0, 34)
_call649.BackgroundColor3 = Color3.fromRGB(45, 47, 53)
_call649.BorderSizePixel = 0
_call649.Parent = _call645

error('internal 579: <25ms: infinitelooperror>')
