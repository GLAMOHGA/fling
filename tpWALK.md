local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local tpwalking = false
local tpwalkSpeed = 4
local savedSpeed = "4"

local function createUI()
    local playerGui = player:WaitForChild("PlayerGui")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TpWalkUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = playerGui

    local Frame = Instance.new("Frame")
    Frame.Name = "MainFrame"
    Frame.Size = UDim2.new(0, 240, 0, 140)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui
    Frame.ClipsDescendants = true
    Frame.Active = true
    Frame.Draggable = true

    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(0, 16)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -40, 0, 30)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "TpWalk"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 3
    Title.Parent = Frame

    local MinBtn = Instance.new("TextButton")
    MinBtn.Name = "MinBtn"
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -35, 0, 0)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 26
    MinBtn.ZIndex = 4
    MinBtn.AutoButtonColor = false
    MinBtn.Parent = Frame

    local Content = Instance.new("Frame")
    Content.Name = "Content"
    Content.Size = UDim2.new(1, 0, 1, -30)
    Content.Position = UDim2.new(0, 0, 0, 30)
    Content.BackgroundTransparency = 1
    Content.BorderSizePixel = 0
    Content.ZIndex = 1
    Content.Parent = Frame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Name = "ToggleButton"
    ToggleBtn.Size = UDim2.new(0.9, 0, 0, 45)
    ToggleBtn.Position = UDim2.new(0.05, 0, 0, 5)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.Text = "Activate"
    ToggleBtn.Font = Enum.Font.GothamSemibold
    ToggleBtn.TextSize = 22
    ToggleBtn.AutoButtonColor = false
    ToggleBtn.Parent = Content

    local btnCorner = Instance.new("UICorner", ToggleBtn)
    btnCorner.CornerRadius = UDim.new(0, 14)

    local SpeedBox = Instance.new("TextBox")
    SpeedBox.Name = "SpeedBox"
    SpeedBox.Size = UDim2.new(0.9, 0, 0, 40)
    SpeedBox.Position = UDim2.new(0.05, 0, 0, 60)
    SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBox.Font = Enum.Font.Gotham
    SpeedBox.TextSize = 20
    SpeedBox.PlaceholderText = "Speed (e.g. 4)"
    SpeedBox.ClearTextOnFocus = false
    SpeedBox.Text = savedSpeed
    SpeedBox.Parent = Content

    local speedCorner = Instance.new("UICorner", SpeedBox)
    speedCorner.CornerRadius = UDim.new(0, 14)

    local MinOverlay = Instance.new("TextButton")
    MinOverlay.Name = "MinOverlay"
    MinOverlay.Size = UDim2.new(1, 0, 1, 0)
    MinOverlay.Position = UDim2.new(0, 0, 0, 0)
    MinOverlay.BackgroundTransparency = 1
    MinOverlay.AutoButtonColor = false
    MinOverlay.Text = ""
    MinOverlay.Visible = false
    MinOverlay.ZIndex = 2
    MinOverlay.Parent = Frame

    MinOverlay.Active = true
    MinOverlay.Draggable = true

    return ScreenGui, Frame, Title, MinBtn, Content, ToggleBtn, SpeedBox, MinOverlay
end

local ScreenGui, Frame, Title, MinBtn, Content, ToggleBtn, SpeedBox, MinOverlay = createUI()

local function startTPWalk(speed)
    tpwalking = true
    tpwalkSpeed = tonumber(speed) or 4
    local char = player.Character
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    if not hum then return end
    task.spawn(function()
        while tpwalking and char and hum and hum.Parent do
            local delta = RunService.Heartbeat:Wait()
            if hum.MoveDirection.Magnitude > 0 then
                pcall(function()
                    char:TranslateBy(hum.MoveDirection * tpwalkSpeed * delta * 10)
                end)
            end
            if not player.Character or player.Character ~= char then
                tpwalking = false
            end
        end
    end)
end

local function stopTPWalk()
    tpwalking = false
end

local function updateButton(state)
    if state then
        ToggleBtn.Text = "Deactivate"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    else
        ToggleBtn.Text = "Activate"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end

ToggleBtn.MouseButton1Click:Connect(function()
    if tpwalking then
        stopTPWalk()
        updateButton(false)
    else
        local speed = tonumber(SpeedBox.Text)
        if speed and speed > 0 then
            startTPWalk(speed)
            savedSpeed = tostring(speed)
            updateButton(true)
        else
            SpeedBox.Text = savedSpeed
            updateButton(false)
        end
    end
end)

SpeedBox.FocusLost:Connect(function()
    local speed = tonumber(SpeedBox.Text)
    if speed and speed > 0 then
        tpwalkSpeed = speed
        savedSpeed = tostring(speed)
    else
        SpeedBox.Text = savedSpeed
    end
end)

player.CharacterAdded:Connect(function()
    stopTPWalk()
    updateButton(false)
    if SpeedBox and SpeedBox.Parent then
        SpeedBox.Text = savedSpeed
    end
end)

local minimized = false
local normalSize = Frame.Size
local miniSize = UDim2.new(0, 160, 0, 40)
local lastTween = nil

local function setMinimized(state)
    if state == nil then minimized = not minimized else minimized = state end
    if minimized then
        MinBtn.Text = "+"
        MinOverlay.Visible = true
        local tween = TweenService:Create(Frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = miniSize})
        lastTween = tween
        tween:Play()
        tween.Completed:Connect(function()
            if lastTween == tween and minimized then
                Content.Visible = false
            end
        end)
    else
        MinBtn.Text = "-"
        Content.Visible = true
        MinOverlay.Visible = false
        local tween = TweenService:Create(Frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = normalSize})
        lastTween = tween
        tween:Play()
    end
end

MinBtn.MouseButton1Click:Connect(function()
    setMinimized()
end)

MinOverlay.MouseButton1Click:Connect(function()
    if minimized then
        setMinimized(false)
    end
end)

SpeedBox.Text = savedSpeed
Content.Visible = true
