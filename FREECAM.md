--[[
LocalScript: Freecam toggle with draggable UI + mobile arrow controls + speed input
Place in: StarterPlayerScripts
]]

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Player and camera
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera

--=====================================================
-- UI: Panel, title, toggle, speed controls
--=====================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FreecamGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

-- Main panel
local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.ZIndex = 1
panel.Size = UDim2.new(0, 200, 0, 170) -- Increased height for new button
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

-- Title
local title = Instance.new("TextLabel", panel)
title.Name = "Title"
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.new(0.5, 0, 0, 6)
title.Size = UDim2.new(0.9, 0, 0, 28)
title.BackgroundTransparency = 1
title.Text = "Freecam (Shift+P)"
title.TextColor3 = Color3.fromRGB(230, 230, 230)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- Toggle button
local toggle = Instance.new("TextButton", panel)
toggle.Name = "Toggle"
toggle.AnchorPoint = Vector2.new(0.5, 1)
toggle.Position = UDim2.new(0.5, 0, 1, -8)
toggle.Size = UDim2.new(0.7, 0, 0, 30)
toggle.ZIndex = panel.ZIndex + 2
toggle.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
toggle.Text = "Off"
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.TextScaled = true
toggle.Font = Enum.Font.GothamBold
toggle.AutoButtonColor = false

local toggleCorner = Instance.new("UICorner", toggle)
toggleCorner.CornerRadius = UDim.new(0, 8)

-- Hide GUI button
local hideGuiBtn = Instance.new("TextButton", panel)
hideGuiBtn.Name = "HideGUI"
hideGuiBtn.AnchorPoint = Vector2.new(0.5, 1)
hideGuiBtn.Position = UDim2.new(0.5, 0, 1, -46) -- Adjusted position
hideGuiBtn.Size = UDim2.new(0.7, 0, 0, 30)
hideGuiBtn.ZIndex = panel.ZIndex + 2
hideGuiBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
hideGuiBtn.Text = "Hide Other GUIs"
hideGuiBtn.TextColor3 = Color3.new(1, 1, 1)
hideGuiBtn.TextScaled = true
hideGuiBtn.Font = Enum.Font.GothamBold
hideGuiBtn.AutoButtonColor = false

local hideGuiCorner = Instance.new("UICorner", hideGuiBtn)
hideGuiCorner.CornerRadius = UDim.new(0, 8)

local hideGuiStroke = Instance.new("UIStroke", hideGuiBtn)
hideGuiStroke.Thickness = 2
hideGuiStroke.Color = Color3.fromRGB(90, 90, 90)

-- Speed controls
local speedFrame = Instance.new("Frame", panel)
speedFrame.Name = "SpeedFrame"
speedFrame.ZIndex = panel.ZIndex
speedFrame.AnchorPoint = Vector2.new(0.5, 1)
speedFrame.Position = UDim2.new(0.5, 0, 1, -84) -- Adjusted position
speedFrame.Size = UDim2.new(0, 160, 0, 30)
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

-- Minus button
local speedDown = Instance.new("TextButton", speedFrame)
speedDown.Name = "SpeedDown"
speedDown.ZIndex = panel.ZIndex + 1
speedDown.Size = UDim2.new(0, 30, 0, 30)
speedDown.Position = UDim2.new(0, 0, 0, 0)
speedDown.Text = "–"
stylizeBtn(speedDown)

-- Editable textbox
local speedInput = Instance.new("TextBox", speedFrame)
speedInput.Name = "SpeedInput"
speedInput.ZIndex = panel.ZIndex + 1
speedInput.Size = UDim2.new(0, 80, 0, 30)
speedInput.Position = UDim2.new(0, 35, 0, 0)
speedInput.PlaceholderText = "Speed"
speedInput.Text = "20"
stylizeBox(speedInput)

-- Plus button
local speedUp = speedDown:Clone()
speedUp.Name = "SpeedUp"
speedUp.ZIndex = panel.ZIndex + 1
speedUp.Position = UDim2.new(1, -30, 0, 0)
speedUp.Text = "+"
speedUp.Parent = speedFrame
stylizeBtn(speedUp)

--==========================================
-- Mobile arrow clusters (hidden by default)
--==========================================
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

-- Movement arrows (WASD)
local btnW = makeArrow(moveArrows, "W", "W", UDim2.new(0.5, -27, 0, 0))
local btnA = makeArrow(moveArrows, "A", "A", UDim2.new(0, 0, 0.5, -27))
local btnS = makeArrow(moveArrows, "S", "S", UDim2.new(0.5, -27, 1, -54))
local btnD = makeArrow(moveArrows, "D", "D", UDim2.new(1, -54, 0.5, -27))

-- Rotation arrows
local btnYawL = makeArrow(rotateArrows, "YawL", "←", UDim2.new(0, 0, 0.5, -27))
local btnYawR = makeArrow(rotateArrows, "YawR", "→", UDim2.new(1, -54, 0.5, -27))
local btnPitchU = makeArrow(rotateArrows, "PitchU", "↑", UDim2.new(0.5, -27, 0, 0))
local btnPitchD = makeArrow(rotateArrows, "PitchD", "↓", UDim2.new(0.5, -27, 1, -54))

--=====================
-- Freecam state/data
--=====================
local freecamEnabled = false
local yaw, pitch = 0, 0
local mouseSensitivity = 0.002
local rotSpeed = math.rad(90)
local moveSpeed = 20
local keysDown = {W = false, A = false, S = false, D = false, Q = false, E = false}
local rotFlags = {Left = false, Right = false, Up = false, Down = false}
local mouseWheelMove = 0 -- Для колесика мыши

-- Store original camera state
local savedCamData
local originalCFrame -- Store original camera position for restoration

-- Variables for character tracking
local characterConnections = {}
local humanoidDiedConn = nil

-- Helper to toggle other GUIs visibility
local otherGUIsHidden = false
local hiddenGUIs = {}

local function toggleOtherGUIs()
    if otherGUIsHidden then
        -- Show all hidden GUIs
        for _, gui in ipairs(hiddenGUIs) do
            if gui and gui.Parent then
                gui.Enabled = true
            end
        end
        hiddenGUIs = {}
        hideGuiBtn.Text = "Hide Other GUIs"
        hideGuiBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        otherGUIsHidden = false
    else
        -- Hide all other GUIs except ours
        hiddenGUIs = {}
        for _, gui in ipairs(playerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui ~= screenGui then
                if gui.Enabled then
                    table.insert(hiddenGUIs, gui)
                    gui.Enabled = false
                end
            end
        end
        hideGuiBtn.Text = "Show Other GUIs"
        hideGuiBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 80)
        otherGUIsHidden = true
    end
end

local function setToggleVisual(on)
    toggle.BackgroundColor3 = on and Color3.fromRGB(50, 170, 80) or Color3.fromRGB(170, 50, 50)
    toggle.Text = on and "On" or "Off"
end

-- Jumppower control
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

-- Clean up character connections
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

-- Function to handle character death
local function onHumanoidDied()
    if freecamEnabled then
        -- Automatically stop freecam when character dies
        stopFreecam()
        -- Reset UI to off state
        setToggleVisual(false)
    end
end

-- Setup character tracking
local function setupCharacter(char)
    cleanupCharacterConnections()
    
    if char then
        local humanoid = char:WaitForChild("Humanoid")
        humanoidDiedConn = humanoid.Died:Connect(onHumanoidDied)
        characterConnections["HumanoidDied"] = humanoidDiedConn
    end
end

--=====================
-- Start/Stop Freecam
--=====================
local renderConn
local camPos

local function startFreecam()
    if freecamEnabled then return end -- Prevent double start
    
    savedCamData = saveCamera()
    originalCFrame = cam.CFrame -- Store the current camera position
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
        
        -- Добавляем движение колесиком мыши
        if mouseWheelMove ~= 0 then
            delta = delta + rot.LookVector * -mouseWheelMove * moveSpeed * 2 * dt
            mouseWheelMove = 0
        end
        
        camPos = camPos + delta
        cam.CFrame = CFrame.new(camPos) * rot
    end)
end

local function stopFreecam()
    if not freecamEnabled then return end -- Prevent double stop
    
    freecamEnabled = false
    setToggleVisual(false)
    
    if renderConn then
        renderConn:Disconnect()
        renderConn = nil
    end
    
    moveArrows.Visible = false
    rotateArrows.Visible = false
    
    -- Restore to original position if we have it
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
    
    -- Clear saved data
    savedCamData = nil
    originalCFrame = nil
end

--=====================
-- Input wiring
--=====================
-- Shift+P toggle
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    -- Shift+P toggle
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.P and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            if freecamEnabled then
                stopFreecam()
            else
                startFreecam()
            end
        end
        
        -- Key controls when freecam is enabled
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
    
    -- Mouse wheel for zoom
    if input.UserInputType == Enum.UserInputType.MouseWheel and freecamEnabled then
        mouseWheelMove = input.Position.Z -- Сохраняем движение колесика
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

--=====================
-- Mobile hold semantics
--=====================
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

--=====================
-- Speed controls events
--=====================
speedDown.MouseButton1Click:Connect(function()
    moveSpeed = math.max(1, moveSpeed - 5) -- Изменено на -5
    speedInput.Text = tostring(moveSpeed)
end)

speedUp.MouseButton1Click:Connect(function()
    moveSpeed = moveSpeed + 5 -- Изменено на +5
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

--=====================
-- Character lifecycle
--=====================
-- Initial character setup
if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(function(char)
    setupCharacter(char)
    
    -- Если freecam был включен до смерти, он уже был выключен
    -- и не должен автоматически включаться при респавне
    -- Просто убедимся что UI в правильном состоянии
    if freecamEnabled then
        -- Это на всякий случай, если что-то пошло не так
        stopFreecam()
        setToggleVisual(false)
    end
end)

player.CharacterRemoving:Connect(function()
    cleanupCharacterConnections()
    
    -- Если freecam включен при удалении персонажа, выключаем его
    if freecamEnabled then
        stopFreecam()
        setToggleVisual(false)
    end
end)

--=====================
-- Button events
--=====================
toggle.MouseButton1Click:Connect(function()
    if freecamEnabled then
        stopFreecam()
    else
        startFreecam()
    end
end)

hideGuiBtn.MouseButton1Click:Connect(function()
    toggleOtherGUIs()
end)
