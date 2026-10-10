local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FreecamGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.ZIndex = 1
panel.Size = UDim2.new(0, 170, 0, 115)
panel.Position = UDim2.new(0, 14, 0, 120)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
panel.Parent = screenGui

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(90, 90, 90)

local corner = Instance.new("UICorner", panel)
corner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", panel)
title.Name = "Title"
title.AnchorPoint = Vector2.new(0, 0)
title.Position = UDim2.new(0, 8, 0, 6)
title.Size = UDim2.new(1, -56, 0, 20)
title.BackgroundTransparency = 1
title.Text = "Freecam (Shift+P)"
title.TextColor3 = Color3.fromRGB(230, 230, 230)
title.TextScaled = false
title.TextSize = 12
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold

local closeBtn = Instance.new("TextButton", panel)
closeBtn.Name = "CloseButton"
closeBtn.AnchorPoint = Vector2.new(1, 0)
closeBtn.Position = UDim2.new(1, -4, 0, 4)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.ZIndex = panel.ZIndex + 3
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = false

local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 6)

local closeStroke = Instance.new("UIStroke", closeBtn)
closeStroke.Thickness = 1
closeStroke.Color = Color3.fromRGB(120, 20, 20)

local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Name = "MinimizeButton"
minimizeBtn.AnchorPoint = Vector2.new(1, 0)
minimizeBtn.Position = UDim2.new(1, -28, 0, 4)
minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
minimizeBtn.ZIndex = panel.ZIndex + 3
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.TextSize = 14
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.AutoButtonColor = false

local minCorner = Instance.new("UICorner", minimizeBtn)
minCorner.CornerRadius = UDim.new(0, 6)

local minStroke = Instance.new("UIStroke", minimizeBtn)
minStroke.Thickness = 1
minStroke.Color = Color3.fromRGB(50, 50, 50)

local toggle = Instance.new("TextButton", panel)
toggle.Name = "Toggle"
toggle.AnchorPoint = Vector2.new(0.5, 1)
toggle.Position = UDim2.new(0.5, 0, 1, -6)
toggle.Size = UDim2.new(0.7, 0, 0, 26)
toggle.ZIndex = panel.ZIndex + 2
toggle.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
toggle.Text = "Off"
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.TextScaled = true
toggle.Font = Enum.Font.GothamBold
toggle.AutoButtonColor = false

local toggleCorner = Instance.new("UICorner", toggle)
toggleCorner.CornerRadius = UDim.new(0, 8)

local speedFrame = Instance.new("Frame", panel)
speedFrame.Name = "SpeedFrame"
speedFrame.ZIndex = panel.ZIndex
speedFrame.AnchorPoint = Vector2.new(0.5, 1)
speedFrame.Position = UDim2.new(0.5, 0, 1, -60)
speedFrame.Size = UDim2.new(0, 140, 0, 26)
speedFrame.BackgroundTransparency = 1
speedFrame.Active = false

local function stylizeBtn(btn)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    local c = Instance.new("UICorner", btn)
    c.CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", btn)
    s.Thickness = 2
    s.Color = Color3.fromRGB(90, 90, 90)
end

local function stylizeBox(box)
    box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.TextScaled = true
    box.Font = Enum.Font.GothamBold
    box.ClearTextOnFocus = false
    local c = Instance.new("UICorner", box)
    c.CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", box)
    s.Thickness = 2
    s.Color = Color3.fromRGB(90, 90, 90)
end

local speedDown = Instance.new("TextButton", speedFrame)
speedDown.Name = "SpeedDown"
speedDown.ZIndex = panel.ZIndex + 1
speedDown.Size = UDim2.new(0, 26, 0, 26)
speedDown.Position = UDim2.new(0, 0, 0, 0)
speedDown.Text = "–"
stylizeBtn(speedDown)

local speedInput = Instance.new("TextBox", speedFrame)
speedInput.Name = "SpeedInput"
speedInput.ZIndex = panel.ZIndex + 1
speedInput.Size = UDim2.new(0, 70, 0, 26)
speedInput.Position = UDim2.new(0, 30, 0, 0)
speedInput.PlaceholderText = "Speed"
speedInput.Text = "20"
stylizeBox(speedInput)

local speedUp = speedDown:Clone()
speedUp.Name = "SpeedUp"
speedUp.ZIndex = panel.ZIndex + 1
speedUp.Position = UDim2.new(1, -26, 0, 0)
speedUp.Text = "+"
speedUp.Parent = speedFrame
stylizeBtn(speedUp)

local function makeCluster(name, size, anchor, pos)
    local f = Instance.new("Frame", screenGui)
    f.Name = name
    f.Size = size
    f.AnchorPoint = anchor
    f.Position = pos
    f.BackgroundTransparency = 1
    f.Visible = false
    return f
end

local moveArrows = makeCluster("MoveArrows", UDim2.new(0, 170, 0, 170), Vector2.new(0, 1), UDim2.new(0, 20, 1, -20))
local rotateArrows = makeCluster("RotateArrows", UDim2.new(0, 170, 0, 170), Vector2.new(1, 1), UDim2.new(1, -20, 1, -20))

local function makeArrow(parent, name, text, pos)
    local btn = Instance.new("TextButton", parent)
    btn.Name = name
    btn.Size = UDim2.new(0, 54, 0, 54)
    btn.Position = pos
    btn.Text = text
    stylizeBtn(btn)
    return btn
end

local btnW = makeArrow(moveArrows, "W", "W", UDim2.new(0.5, -27, 0, 0))
local btnA = makeArrow(moveArrows, "A", "A", UDim2.new(0, 0, 0.5, -27))
local btnS = makeArrow(moveArrows, "S", "S", UDim2.new(0.5, -27, 1, -54))
local btnD = makeArrow(moveArrows, "D", "D", UDim2.new(1, -54, 0.5, -27))

local btnYawL = makeArrow(rotateArrows, "YawL", "←", UDim2.new(0, 0, 0.5, -27))
local btnYawR = makeArrow(rotateArrows, "YawR", "→", UDim2.new(1, -54, 0.5, -27))
local btnPitchU = makeArrow(rotateArrows, "PitchU", "↑", UDim2.new(0.5, -27, 0, 0))
local btnPitchD = makeArrow(rotateArrows, "PitchD", "↓", UDim2.new(0.5, -27, 1, -54))

local freecamEnabled = false
local yaw, pitch = 0, 0
local mouseSensitivity = 0.002
local rotSpeed = math.rad(90)
local moveSpeed = 20
local keysDown = {W = false, A = false, S = false, D = false, Q = false, E = false}
local rotFlags = {Left = false, Right = false, Up = false, Down = false}
local mouseWheelMove = 0

local savedCamData
local originalCFrame

local characterConnections = {}
local humanoidDiedConn = nil

local minimized = false
local savedPanelSize = panel.Size
local savedPanelPos = panel.Position

local function setMinimized(state)
    minimized = state
    if minimized then
        savedPanelSize = panel.Size
        savedPanelPos = panel.Position
        panel.Size = UDim2.new(0, 170, 0, 32)
        toggle.Visible = false
        speedFrame.Visible = false
        minimizeBtn.Text = "+"
    else
        panel.Size = savedPanelSize
        panel.Position = savedPanelPos
        toggle.Visible = true
        speedFrame.Visible = true
        minimizeBtn.Text = "-"
    end
end

local function setToggleVisual(on)
    toggle.BackgroundColor3 = on and Color3.fromRGB(50, 170, 80) or Color3.fromRGB(170, 50, 50)
    toggle.Text = on and "On" or "Off"
end

local function freezeHumanoid()
    local char = player.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then
        h.WalkSpeed = 0
        h.JumpPower = 0
    end
end

local function unfreezeHumanoid()
    local char = player.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then
        h.WalkSpeed = 16
        h.JumpPower = 50
    end
end

local function saveCamera()
    return {
        CameraType = cam.CameraType,
        CameraSubject = cam.CameraSubject,
        CFrame = cam.CFrame,
    }
end

local function restoreCamera(data)
    if data then
        cam.CameraType = data.CameraType or Enum.CameraType.Custom
        cam.CameraSubject = data.CameraSubject or player.Character
        if data.CFrame then
            cam.CFrame = data.CFrame
        end
    end
end

local function seedOrientation(cf)
    local pos = cf.Position
    local look = cf.LookVector
    yaw = math.atan2(-look.X, -look.Z)
    pitch = math.clamp(math.asin(look.Y), math.rad(-85), math.rad(85))
    return pos
end

local function keyboardMoveVector()
    local x = (keysDown.D and 1 or 0) - (keysDown.A and 1 or 0)
    local z = (keysDown.S and 1 or 0) - (keysDown.W and 1 or 0)
    local y = (keysDown.E and 1 or 0) - (keysDown.Q and 1 or 0)
    local v = Vector3.new(x, y, z)
    if v.Magnitude > 1 then v = v.Unit end
    return v
end

local function cleanupCharacterConnections()
    for _, conn in pairs(characterConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    characterConnections = {}

    if humanoidDiedConn then
        humanoidDiedConn:Disconnect()
        humanoidDiedConn = nil
    end
end

local function onHumanoidDied()
    if freecamEnabled then
        stopFreecam()
        setToggleVisual(false)
    end
end

local function setupCharacter(char)
    cleanupCharacterConnections()

    if char then
        local humanoid = char:WaitForChild("Humanoid")
        humanoidDiedConn = humanoid.Died:Connect(onHumanoidDied)
        characterConnections["HumanoidDied"] = humanoidDiedConn
    end
end

local renderConn
local camPos

local function startFreecam()
    if freecamEnabled then return end

    savedCamData = saveCamera()
    originalCFrame = cam.CFrame
    freezeHumanoid()
    cam.CameraType = Enum.CameraType.Scriptable
    camPos = seedOrientation(cam.CFrame)

    if not UserInputService.TouchEnabled then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
    else
        moveArrows.Visible = true
        rotateArrows.Visible = true
    end

    freecamEnabled = true
    setToggleVisual(true)

    renderConn = RunService.RenderStepped:Connect(function(dt)
        if not freecamEnabled then return end

        if rotFlags.Left then yaw = yaw + rotSpeed * dt end
        if rotFlags.Right then yaw = yaw - rotSpeed * dt end
        if rotFlags.Up then pitch = math.clamp(pitch + rotSpeed * dt, math.rad(-85), math.rad(85)) end
        if rotFlags.Down then pitch = math.clamp(pitch - rotSpeed * dt, math.rad(-85), math.rad(85)) end

        local rot = CFrame.Angles(0, yaw, 0) * CFrame.Angles(pitch, 0, 0)
        local mv = keyboardMoveVector()
        local delta = (rot.RightVector * mv.X + Vector3.yAxis * mv.Y + rot.LookVector * -mv.Z) * moveSpeed * dt

        if mouseWheelMove ~= 0 then
            delta = delta + rot.LookVector * -mouseWheelMove * moveSpeed * 2 * dt
            mouseWheelMove = 0
        end

        camPos = camPos + delta
        cam.CFrame = CFrame.new(camPos) * rot
    end)
end

local function stopFreecam()
    if not freecamEnabled then return end

    freecamEnabled = false
    setToggleVisual(false)

    if renderConn then
        renderConn:Disconnect()
        renderConn = nil
    end

    moveArrows.Visible = false
    rotateArrows.Visible = false

    if originalCFrame then
        cam.CFrame = originalCFrame
    end

    if savedCamData then
        restoreCamera(savedCamData)
    end

    if not UserInputService.TouchEnabled then
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end

    unfreezeHumanoid()
    keysDown = {W = false, A = false, S = false, D = false, Q = false, E = false}
    rotFlags = {Left = false, Right = false, Up = false, Down = false}
    mouseWheelMove = 0

    savedCamData = nil
    originalCFrame = nil
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.P and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            if freecamEnabled then
                stopFreecam()
            else
                startFreecam()
            end
        end

        if freecamEnabled then
            local kc = input.KeyCode
            if kc == Enum.KeyCode.W then keysDown.W = true end
            if kc == Enum.KeyCode.A then keysDown.A = true end
            if kc == Enum.KeyCode.S then keysDown.S = true end
            if kc == Enum.KeyCode.D then keysDown.D = true end
            if kc == Enum.KeyCode.Q then keysDown.Q = true end
            if kc == Enum.KeyCode.E then keysDown.E = true end
        end
    end

    if input.UserInputType == Enum.UserInputType.MouseWheel and freecamEnabled then
        mouseWheelMove = input.Position.Z
    end
end)

UserInputService.InputEnded:Connect(function(input, gp)
    if gp or not freecamEnabled then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        local kc = input.KeyCode
        if kc == Enum.KeyCode.W then keysDown.W = false end
        if kc == Enum.KeyCode.A then keysDown.A = false end
        if kc == Enum.KeyCode.S then keysDown.S = false end
        if kc == Enum.KeyCode.D then keysDown.D = false end
        if kc == Enum.KeyCode.Q then keysDown.Q = false end
        if kc == Enum.KeyCode.E then keysDown.E = false end
    end
end)

UserInputService.InputChanged:Connect(function(input, gp)
    if gp then return end

    if freecamEnabled then
        if not UserInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.MouseMovement then
            yaw = yaw - input.Delta.X * mouseSensitivity
            pitch = pitch - input.Delta.Y * mouseSensitivity
            pitch = math.clamp(pitch, math.rad(-85), math.rad(85))
        elseif UserInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
            local vp = cam.ViewportSize
            if input.Position.X >= vp.X * 0.66 then
                yaw = yaw - input.Delta.X * mouseSensitivity
                pitch = pitch - input.Delta.Y * mouseSensitivity
                pitch = math.clamp(pitch, math.rad(-85), math.rad(85))
            end
        end
    end
end)

local function hold(btn, setter)
    btn.MouseButton1Down:Connect(function()
        if freecamEnabled then
            setter(true)
        end
    end)
    btn.MouseButton1Up:Connect(function()
        setter(false)
    end)
    btn.TouchLongPress:Connect(function(_, s)
        if s == Enum.LongPressState.End then
            setter(false)
        end
    end)
    btn.TouchTap:Connect(function() end)
end

hold(btnW, function(v) keysDown.W = v end)
hold(btnA, function(v) keysDown.A = v end)
hold(btnS, function(v) keysDown.S = v end)
hold(btnD, function(v) keysDown.D = v end)
hold(btnYawL, function(v) rotFlags.Left = v end)
hold(btnYawR, function(v) rotFlags.Right = v end)
hold(btnPitchU, function(v) rotFlags.Up = v end)
hold(btnPitchD, function(v) rotFlags.Down = v end)

speedDown.MouseButton1Click:Connect(function()
    moveSpeed = math.max(1, moveSpeed - 5)
    speedInput.Text = tostring(moveSpeed)
end)

speedUp.MouseButton1Click:Connect(function()
    moveSpeed = moveSpeed + 5
    speedInput.Text = tostring(moveSpeed)
end)

speedInput.FocusLost:Connect(function()
    local n = tonumber(speedInput.Text)
    if n and n >= 1 then
        moveSpeed = n
    else
        speedInput.Text = tostring(moveSpeed)
    end
end)

if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(function(char)
    setupCharacter(char)

    if freecamEnabled then
        stopFreecam()
        setToggleVisual(false)
    end

    if screenGui and screenGui.Parent ~= playerGui then
        screenGui.Parent = playerGui
    end
end)

player.CharacterRemoving:Connect(function()
    cleanupCharacterConnections()

    if freecamEnabled then
        stopFreecam()
        setToggleVisual(false)
    end
end)

toggle.MouseButton1Click:Connect(function()
    if freecamEnabled then
        stopFreecam()
    else
        startFreecam()
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    if freecamEnabled then
        stopFreecam()
    end
    screenGui:Destroy()
end)

minimizeBtn.MouseButton1Click:Connect(function()
    setMinimized(not minimized)
end)
