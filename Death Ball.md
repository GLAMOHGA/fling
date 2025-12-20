--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LP = game.Players.LocalPlayer
local BallShadow, RealBall
local WhiteColor = Color3.new(1, 1, 1)
local LastBallPos
local SpeedMulty = 3
local AutoParryEnabled = true

local ParryDistance = 15
local ReactionTime = 0.0001
local SafetyMargin = 1.3

local AutoClickerEnabled = false
local ClickSpeed = 1000
local LastClickTime = 0

local LastParryTime = 0
local ParryCooldown = 0.000001
local IsParrying = false

local SpeedHeightThresholds = {
    {speed = 7.5, maxHeight = 22},
    {speed = 10, maxHeight = 27},
    {speed = math.huge, maxHeight = 30}
}

local Binds = {
    ToggleGUI = Enum.KeyCode.K,
    AutoParry = nil,
    Clicker = Enum.KeyCode.E,
    Target = Enum.KeyCode.H,
    Teleport = Enum.KeyCode.T,
    AutoInter = nil,
    HVH = Enum.KeyCode.G
}

local BindingInProgress = false
local CurrentBindingButton = nil

local TargetEnabled = false
local currentTarget = nil
local currentRadius = 45
local rotationSpeed = 2
local targetLocked = false
local MAX_HEIGHT = 265
local currentAngle = 360
local targetConnection = nil
local noclipEnabled = false
local noclipConnection = nil
local isInGame = false

local HVHEnabled = false
local HVHConnection = nil
local OriginalHVHPosition = nil
local HVHState = "WAITING"
local LastBallColor = WhiteColor
local BallVelocity = Vector3.new(0, 0, 0)
local LastBallPosForVelocity = nil

local AutoIntermissionEnabled = false
local LastIntermissionCheck = 0
local IntermissionCheckCooldown = 1

local PurpleColors = {
    Dark = Color3.fromRGB(40, 20, 80),
    Medium = Color3.fromRGB(60, 30, 120),
    Light = Color3.fromRGB(80, 40, 160),
    Accent = Color3.fromRGB(100, 50, 200),
    Slider = Color3.fromRGB(120, 60, 240),
    Text = Color3.fromRGB(245, 245, 255),
    Button = Color3.fromRGB(70, 35, 140)
}

local buttonInstances = {}
local MainFrame = nil
local ScreenGui = nil
local ToggleButton = nil

local GuiTransparency = 0.1
local OriginalTransparencyValues = {}

local ActiveConnections = {}

local function IsInGame()
    local success, result = pcall(function()
        local healthBar = LP.PlayerGui.HUD.HolderBottom.HealthBar
        return healthBar.Visible == true
    end)
    return success and result
end

local function GetBallColor()
    if not RealBall then return WhiteColor end
    
    local highlight = RealBall:FindFirstChildOfClass("Highlight")
    if highlight then
        return highlight.FillColor
    end
    
    local surfaceGui = RealBall:FindFirstChildOfClass("SurfaceGui")
    if surfaceGui then
        local frame = surfaceGui:FindFirstChild("Frame")
        if frame and frame.BackgroundColor3 then
            return frame.BackgroundColor3
        end
    end
    
    if RealBall:IsA("Part") and RealBall.BrickColor ~= BrickColor.new("White") then
        return RealBall.Color
    end
    
    return WhiteColor
end

local function ShouldParryBasedOnTrail()
    if not RealBall then return false end
    
    local trail = RealBall:FindFirstChildOfClass("Trail") or RealBall:FindFirstChild("Trail")
    if not trail then return false end
    
    if trail.Color then
        local colorSequence = trail.Color
        if colorSequence.Keypoints then
            for _, keypoint in ipairs(colorSequence.Keypoints) do
                local color = keypoint.Value
                if color.r ~= 1 or color.g ~= 1 or color.b ~= 1 then
                    if not (
                        (color.r == 0 and color.g == 1 and color.b == 1) or
                        (color.r == 1 and color.g == 0 and color.b == 1) or
                        (color.r == 1 and color.g == 1 and color.b == 0)
                    ) then
                        return true
                    end
                end
            end
        end
    end
    
    return false
end

local function CalculateBallHeight(shadowSize)
    local baseShadowSize = 5
    local heightMultiplier = 20
    
    local shadowIncrease = math.max(0, shadowSize - baseShadowSize)
    local estimatedHeight = shadowIncrease * heightMultiplier
    
    return math.min(estimatedHeight + 3, 100)
end

local function ExecuteHVH(shadowPosition, shadowSize)
    if not HVHEnabled or not IsInGame() or not shadowPosition then
        HVHState = "WAITING"
        OriginalHVHPosition = nil
        return
    end
    
    local ballColor = WhiteColor
    if RealBall then
        ballColor = GetBallColor()
    end
    
    LastBallColor = ballColor
    
    local ballHeight = CalculateBallHeight(shadowSize)
    local ballYPosition = shadowPosition.Y + ballHeight
    local ballPosition = Vector3.new(shadowPosition.X, ballYPosition, shadowPosition.Z)
    
    local ballSpeed = BallVelocity.Magnitude
    
    if ballColor ~= WhiteColor and ballSpeed < 0.1 then
        HVHState = "WAITING"
        return
    end
    
    if HVHState == "WAITING" then
        if ballColor ~= WhiteColor and ballSpeed > 0.1 then
            if LP.Character and LP.Character.PrimaryPart then
                OriginalHVHPosition = LP.Character.PrimaryPart.Position
                HVHState = "TELEPORTING"
            end
        end
        
    elseif HVHState == "TELEPORTING" then
        VirtualInputManager:SendKeyEvent(true, "F", false, game)
        task.wait(0.000001)
        VirtualInputManager:SendKeyEvent(false, "F", false, game)
        
        task.wait(0.000001)
        
        if LP.Character and LP.Character.PrimaryPart then
            LP.Character.PrimaryPart.CFrame = CFrame.new(ballPosition)
            HVHState = "FOLLOWING"
        end
        
    elseif HVHState == "FOLLOWING" then
        if ballColor == WhiteColor or ballSpeed < 0.1 then
            HVHState = "RETURNING"
            return
        end
        
        if LP.Character and LP.Character.PrimaryPart then
            LP.Character.PrimaryPart.CFrame = CFrame.new(ballPosition)
        end
        
    elseif HVHState == "RETURNING" then
        if OriginalHVHPosition and LP.Character and LP.Character.PrimaryPart then
            LP.Character.PrimaryPart.CFrame = CFrame.new(OriginalHVHPosition)
            
            task.wait(0.000001)
            
            HVHState = "WAITING"
            OriginalHVHPosition = nil
        else
            HVHState = "WAITING"
        end
    end
end

local function ToggleHVHContinuous()
    if HVHConnection then
        HVHConnection:Disconnect()
        HVHConnection = nil
    end
    
    if HVHEnabled then
        HVHState = "WAITING"
        OriginalHVHPosition = nil
        LastBallColor = WhiteColor
        
        HVHConnection = RunService.Heartbeat:Connect(function()
            if BallShadow then
                ExecuteHVH(BallShadow.Position, BallShadow.Size.X)
            else
                if HVHState ~= "WAITING" then
                    HVHState = "WAITING"
                    OriginalHVHPosition = nil
                end
            end
        end)
        table.insert(ActiveConnections, HVHConnection)
    else
        HVHState = "WAITING"
        OriginalHVHPosition = nil
        LastBallColor = WhiteColor
    end
end

local function GetMaxHeightBySpeed(speedStuds)
    for _, threshold in ipairs(SpeedHeightThresholds) do
        if speedStuds <= threshold.speed then
            return threshold.maxHeight
        end
    end
    return 30
end

local function GetKeyName(keyCode)
    if not keyCode then return "NONE" end
    local keyName = tostring(keyCode):gsub("Enum.KeyCode.", "")
    if keyName == "LeftControl" then return "LCTRL"
    elseif keyName == "RightControl" then return "RCTRL"
    elseif keyName == "LeftShift" then return "LSHIFT"
    elseif keyName == "RightShift" then return "RSHIFT"
    elseif keyName == "LeftAlt" then return "LALT"
    elseif keyName == "RightAlt" then return "RALT"
    else return keyName end
end

local function UpdateButtonText(button, baseText, bindKey)
    if bindKey then
        button.Text = baseText .. " [" .. GetKeyName(bindKey) .. "]"
    else
        button.Text = baseText
    end
end

local function StartBinding(button, bindType, baseText)
    if BindingInProgress then return end
    
    BindingInProgress = true
    CurrentBindingButton = button
    
    local originalText = button.Text
    button.Text = "Press any key..."
    button.BackgroundColor3 = PurpleColors.Accent
    button.TextColor3 = PurpleColors.Text
    
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.UserInputType == Enum.UserInputType.Keyboard then
            Binds[bindType] = input.KeyCode
            
            UpdateButtonText(button, baseText, input.KeyCode)
            
            if bindType == "AutoParry" then
                button.BackgroundColor3 = AutoParryEnabled and PurpleColors.Slider or PurpleColors.Button
            elseif bindType == "Clicker" then
                button.BackgroundColor3 = AutoClickerEnabled and PurpleColors.Slider or PurpleColors.Button
            elseif bindType == "Target" then
                button.BackgroundColor3 = TargetEnabled and PurpleColors.Slider or PurpleColors.Button
            elseif bindType == "HVH" then
                button.BackgroundColor3 = HVHEnabled and PurpleColors.Slider or PurpleColors.Button
            elseif bindType == "AutoInter" then
                button.BackgroundColor3 = AutoIntermissionEnabled and PurpleColors.Slider or PurpleColors.Button
            else
                button.BackgroundColor3 = PurpleColors.Button
            end
            
            button.TextColor3 = PurpleColors.Text
            BindingInProgress = false
            CurrentBindingButton = nil
            connection:Disconnect()
        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
            Binds[bindType] = nil
            UpdateButtonText(button, baseText, nil)
            
            button.BackgroundColor3 = PurpleColors.Button
            button.TextColor3 = PurpleColors.Text
            
            BindingInProgress = false
            CurrentBindingButton = nil
            connection:Disconnect()
        end
    end)
end

local function toggleNoclip(state)
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    if state then
        noclipEnabled = true
        
        if LP.Character then
            for _, part in pairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        noclipConnection = RunService.Stepped:Connect(function()
            if LP.Character and noclipEnabled then
                for _, part in pairs(LP.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        table.insert(ActiveConnections, noclipConnection)
    else
        noclipEnabled = false
        if LP.Character then
            for _, part in pairs(LP.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

local lastPlayerSearch = 0
local playerSearchInterval = 0.5
local cachedPlayers = {}

local function findNearestPlayerBelowHeight()
    if not LP.Character or not LP.Character.PrimaryPart then
        return nil
    end
    
    local currentTime = tick()
    
    if currentTime - lastPlayerSearch >= playerSearchInterval then
        lastPlayerSearch = currentTime
        cachedPlayers = {}
        
        local myPosition = LP.Character.PrimaryPart.Position
        
        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= LP and otherPlayer.Character then
                local otherCharacter = otherPlayer.Character
                local otherHumanoidRootPart = otherCharacter.PrimaryPart
                local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")
                
                if otherHumanoidRootPart and otherHumanoid and otherHumanoid.Health > 0 then
                    local targetPosition = otherHumanoidRootPart.Position
                    
                    if targetPosition.Y < MAX_HEIGHT then
                        local distance = (myPosition - targetPosition).Magnitude
                        table.insert(cachedPlayers, {
                            player = otherPlayer,
                            distance = distance,
                            position = targetPosition
                        })
                    end
                end
            end
        end
        
        table.sort(cachedPlayers, function(a, b)
            return a.distance < b.distance
        end)
    end
    
    if #cachedPlayers > 0 then
        return cachedPlayers[1].player
    end
    
    return nil
end

local function findNearestPlayerAnyHeight()
    if not LP.Character or not LP.Character.PrimaryPart then
        return nil
    end
    
    local myPosition = LP.Character.PrimaryPart.Position
    local nearestPlayer = nil
    local minDistance = math.huge
    
    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= LP and otherPlayer.Character then
            local otherCharacter = otherPlayer.Character
            local otherHumanoidRootPart = otherCharacter.PrimaryPart
            local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")
            
            if otherHumanoidRootPart and otherHumanoid and otherHumanoid.Health > 0 then
                local targetPosition = otherHumanoidRootPart.Position
                local distance = (myPosition - targetPosition).Magnitude
                
                if distance < minDistance then
                    minDistance = distance
                    nearestPlayer = otherPlayer
                end
            end
        end
    end
    
    return nearestPlayer
end

local function checkCurrentTargetHeight()
    if not currentTarget or not currentTarget.Character then
        return false
    end
    
    local targetCharacter = currentTarget.Character
    local targetRoot = targetCharacter.PrimaryPart
    
    if targetRoot then
        local targetHeight = targetRoot.Position.Y
        return targetHeight >= MAX_HEIGHT
    end
    
    return false
end

local function getRotatedPosition(targetPosition, angle, radius)
    local offset = Vector3.new(
        math.cos(angle) * radius,
        0,
        math.sin(angle) * radius
    )
    
    return Vector3.new(
        targetPosition.X + offset.X,
        targetPosition.Y,
        targetPosition.Z + offset.Z
    )
end

local function cleanTargetResources()
    if targetConnection then
        targetConnection:Disconnect()
        targetConnection = nil
    end
    
    toggleNoclip(false)
    currentTarget = nil
    targetLocked = false
end

local function targetFunctionOptimized()
    if targetConnection then
        targetConnection:Disconnect()
        targetConnection = nil
    end
    
    local lastFrameTime = tick()
    local frameCounter = 0
    
    targetConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not TargetEnabled then
            return
        end
        
        frameCounter = frameCounter + 1
        local currentTime = tick()
        
        if currentTime - lastFrameTime < 0.016 then
            return
        end
        
        lastFrameTime = currentTime
        
        if frameCounter % 10 == 0 then
            isInGame = IsInGame()
        end
        
        if not isInGame then
            currentTarget = nil
            targetLocked = false
            return
        end
        
        if currentTarget and targetLocked then
            local isTooHigh = checkCurrentTargetHeight()
            if isTooHigh then
                currentTarget = nil
                targetLocked = false
                task.wait(0.1)
            end
        end
        
        if not targetLocked or not currentTarget or not currentTarget.Character then
            if frameCounter % 3 == 0 then
                currentTarget = findNearestPlayerBelowHeight()
                if currentTarget then
                    targetLocked = true
                    currentAngle = 0
                end
            else
                return
            end
        end
        
        if not currentTarget or not currentTarget.Character then
            return
        end
        
        local targetCharacter = currentTarget.Character
        local targetRoot = targetCharacter.PrimaryPart
        local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
        
        if not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
            currentTarget = nil
            targetLocked = false
            return
        end
        
        local targetPosition = targetRoot.Position
        
        if targetPosition.Y >= MAX_HEIGHT then
            currentTarget = nil
            targetLocked = false
            return
        end
        
        currentAngle = currentAngle + (rotationSpeed * deltaTime)
        if currentAngle > 2 * math.pi then
            currentAngle = currentAngle - (2 * math.pi)
        end
        
        local rotatedPosition = getRotatedPosition(targetPosition, currentAngle, currentRadius)
        
        if LP.Character and LP.Character.PrimaryPart then
            LP.Character.PrimaryPart.CFrame = CFrame.new(rotatedPosition, Vector3.new(targetPosition.X, rotatedPosition.Y, targetPosition.Z))
        end
    end)
    table.insert(ActiveConnections, targetConnection)
end

local function TeleportToNearestPlayer()
    if not LP.Character or not LP.Character.PrimaryPart then
        return false
    end
    
    local nearestPlayer = findNearestPlayerAnyHeight()
    
    if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character.PrimaryPart then
        local targetPosition = nearestPlayer.Character.PrimaryPart.Position
        LP.Character.PrimaryPart.CFrame = CFrame.new(targetPosition)
        return true
    else
        return false
    end
end

local function TeleportToIntermission()
    if not LP.Character or not LP.Character.PrimaryPart then
        return false
    end
    
    local readyZone = workspace:FindFirstChild("New Lobby")
    if readyZone then
        readyZone = readyZone:FindFirstChild("ReadyArea")
        if readyZone then
            readyZone = readyZone:FindFirstChild("ReadyZone")
        end
    end
    
    if readyZone and readyZone:IsA("BasePart") then
        local currentPosition = LP.Character.PrimaryPart.Position
        local targetPosition = readyZone.Position
        
        local distance = (currentPosition - targetPosition).Magnitude
        if distance > 10 then
            LP.Character.PrimaryPart.CFrame = CFrame.new(targetPosition)
            return true
        else
            return false
        end
    else
        local alternativeZones = {
            workspace:FindFirstChild("Lobby"),
            workspace:FindFirstChild("WaitingArea"),
            workspace:FindFirstChild("Spawn")
        }
        
        for _, zone in pairs(alternativeZones) do
            if zone and zone:IsA("BasePart") then
                LP.Character.PrimaryPart.CFrame = CFrame.new(zone.Position)
                return true
            end
        end
        
        return false
    end
end

local function CheckAndTeleportToIntermission()
    if not AutoIntermissionEnabled then return end
    if IsInGame() then return end
    
    local currentTime = tick()
    if currentTime - LastIntermissionCheck >= IntermissionCheckCooldown then
        LastIntermissionCheck = currentTime
        TeleportToIntermission()
    end
end

local function ToggleTarget()
    if not IsInGame() then
        return
    end
    
    TargetEnabled = not TargetEnabled
    
    if TargetEnabled then
        isInGame = IsInGame()
        toggleNoclip(true)
        currentTarget = nil
        targetLocked = false
        currentAngle = 0
        targetFunctionOptimized()
    else
        cleanTargetResources()
    end
end

local function ToggleHVH()
    HVHEnabled = not HVHEnabled
    ToggleHVHContinuous()
end

local function ToggleAutoIntermission()
    AutoIntermissionEnabled = not AutoIntermissionEnabled
end

local function UpdateGUITransparency(displayValue)
    local actualValue = math.clamp(displayValue, 0, 100)
    local realTransparency = (actualValue / 100) * 0.8
    GuiTransparency = realTransparency
    
    if MainFrame then
        MainFrame.BackgroundTransparency = GuiTransparency
    end
    
    for _, frame in pairs({MainSettingsFrame, TitleBar}) do
        if frame and OriginalTransparencyValues[frame] then
            frame.BackgroundTransparency = OriginalTransparencyValues[frame] + (GuiTransparency * 0.3)
        end
    end
    
    return actualValue
end

local function CreateToggleButton()
    ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleMenuButton"
    ToggleButton.Size = UDim2.new(0, 50, 0, 50)
    ToggleButton.Position = UDim2.new(0, 90, 0.5, -25)
    ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
    ToggleButton.BackgroundColor3 = PurpleColors.Medium
    ToggleButton.BackgroundTransparency = 0.3
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = "X"
    ToggleButton.TextColor3 = PurpleColors.Text
    ToggleButton.TextSize = 24
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = ToggleButton
    
    ToggleButton.MouseEnter:Connect(function()
        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end)
    
    ToggleButton.MouseLeave:Connect(function()
        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
    end)
    
    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
end

function InitializeMainScript()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DeathBallGUI"
    ScreenGui.Parent = LP:WaitForChild("PlayerGui")

    CreateToggleButton()

    MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 380, 0, 480)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.BackgroundColor3 = PurpleColors.Medium
    MainFrame.BackgroundTransparency = GuiTransparency
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 16)
    Corner.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = PurpleColors.Dark
    TitleBar.BackgroundTransparency = 0.2
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    OriginalTransparencyValues[TitleBar] = 0.2

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 16)
    TitleCorner.Parent = TitleBar

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0.02, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚡ DEATH BALL https://t.me/vomagla"
    Title.TextColor3 = PurpleColors.Text
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.AnchorPoint = Vector2.new(0, 0)
    CloseButton.BackgroundColor3 = PurpleColors.Dark
    CloseButton.BackgroundTransparency = 0.3
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "×"
    CloseButton.TextColor3 = PurpleColors.Text
    CloseButton.TextSize = 18
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TitleBar

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 12)
    CloseCorner.Parent = CloseButton

    CloseButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
    end)

    local MainSettingsFrame = Instance.new("Frame")
    MainSettingsFrame.Name = "MainSettingsFrame"
    MainSettingsFrame.Size = UDim2.new(0.96, 0, 0, 200)
    MainSettingsFrame.Position = UDim2.new(0.02, 0, 0.1, 0)
    MainSettingsFrame.BackgroundColor3 = PurpleColors.Dark
    MainSettingsFrame.BackgroundTransparency = 0.4
    MainSettingsFrame.BorderSizePixel = 0
    MainSettingsFrame.Parent = MainFrame
    OriginalTransparencyValues[MainSettingsFrame] = 0.4

    local MainSettingsCorner = Instance.new("UICorner")
    MainSettingsCorner.CornerRadius = UDim.new(0, 10)
    MainSettingsCorner.Parent = MainSettingsFrame

    local DistanceFrame = Instance.new("Frame")
    DistanceFrame.Size = UDim2.new(1, -20, 0, 50)
    DistanceFrame.Position = UDim2.new(0, 10, 0, 10)
    DistanceFrame.BackgroundTransparency = 1
    DistanceFrame.Parent = MainSettingsFrame

    local DistanceLabel = Instance.new("TextLabel")
    DistanceLabel.Size = UDim2.new(1, 0, 0, 22)
    DistanceLabel.Position = UDim2.new(0, 0, 0, 0)
    DistanceLabel.BackgroundTransparency = 1
    DistanceLabel.Text = "Parry Distance: 15"
    DistanceLabel.TextColor3 = PurpleColors.Text
    DistanceLabel.TextSize = 14
    DistanceLabel.Font = Enum.Font.Gotham
    DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistanceLabel.Parent = DistanceFrame

    local DistanceSlider = Instance.new("Frame")
    DistanceSlider.Size = UDim2.new(1, 0, 0, 16)
    DistanceSlider.Position = UDim2.new(0, 0, 0, 28)
    DistanceSlider.BackgroundColor3 = PurpleColors.Medium
    DistanceSlider.BorderSizePixel = 0
    DistanceSlider.Parent = DistanceFrame

    local DistanceSliderCorner = Instance.new("UICorner")
    DistanceSliderCorner.CornerRadius = UDim.new(0, 8)
    DistanceSliderCorner.Parent = DistanceSlider

    local DistanceFill = Instance.new("Frame")
    DistanceFill.Size = UDim2.new(0.5, 0, 1, 0)
    DistanceFill.Position = UDim2.new(0, 0, 0, 0)
    DistanceFill.BackgroundColor3 = PurpleColors.Slider
    DistanceFill.BorderSizePixel = 0
    DistanceFill.Parent = DistanceSlider

    local DistanceFillCorner = Instance.new("UICorner")
    DistanceFillCorner.CornerRadius = UDim.new(0, 8)
    DistanceFillCorner.Parent = DistanceFill

    local DistanceThumb = Instance.new("Frame")
    DistanceThumb.Size = UDim2.new(0, 22, 0, 22)
    DistanceThumb.Position = UDim2.new(0.5, -11, -0.1875, 0)
    DistanceThumb.BackgroundColor3 = PurpleColors.Text
    DistanceThumb.BorderSizePixel = 0
    DistanceThumb.Parent = DistanceSlider

    local DistanceThumbCorner = Instance.new("UICorner")
    DistanceThumbCorner.CornerRadius = UDim.new(0, 11)
    DistanceThumbCorner.Parent = DistanceThumb

    local TargetRadiusFrame = Instance.new("Frame")
    TargetRadiusFrame.Size = UDim2.new(1, -20, 0, 50)
    TargetRadiusFrame.Position = UDim2.new(0, 10, 0, 70)
    TargetRadiusFrame.BackgroundTransparency = 1
    TargetRadiusFrame.Parent = MainSettingsFrame

    local TargetRadiusLabel = Instance.new("TextLabel")
    TargetRadiusLabel.Size = UDim2.new(1, 0, 0, 22)
    TargetRadiusLabel.Position = UDim2.new(0, 0, 0, 0)
    TargetRadiusLabel.BackgroundTransparency = 1
    TargetRadiusLabel.Text = "Target Radius: 45"
    TargetRadiusLabel.TextColor3 = PurpleColors.Text
    TargetRadiusLabel.TextSize = 14
    TargetRadiusLabel.Font = Enum.Font.Gotham
    TargetRadiusLabel.TextXAlignment = Enum.TextXAlignment.Left
    TargetRadiusLabel.Parent = TargetRadiusFrame

    local TargetRadiusSlider = Instance.new("Frame")
    TargetRadiusSlider.Size = UDim2.new(1, 0, 0, 16)
    TargetRadiusSlider.Position = UDim2.new(0, 0, 0, 28)
    TargetRadiusSlider.BackgroundColor3 = PurpleColors.Medium
    TargetRadiusSlider.BorderSizePixel = 0
    TargetRadiusSlider.Parent = TargetRadiusFrame

    local TargetRadiusSliderCorner = Instance.new("UICorner")
    TargetRadiusSliderCorner.CornerRadius = UDim.new(0, 8)
    TargetRadiusSliderCorner.Parent = TargetRadiusSlider

    local TargetRadiusFill = Instance.new("Frame")
    TargetRadiusFill.Size = UDim2.new(0.04, 0, 1, 0)
    TargetRadiusFill.Position = UDim2.new(0, 0, 0, 0)
    TargetRadiusFill.BackgroundColor3 = PurpleColors.Slider
    TargetRadiusFill.BorderSizePixel = 0
    TargetRadiusFill.Parent = TargetRadiusSlider

    local TargetRadiusFillCorner = Instance.new("UICorner")
    TargetRadiusFillCorner.CornerRadius = UDim.new(0, 8)
    TargetRadiusFillCorner.Parent = TargetRadiusFill

    local TargetRadiusThumb = Instance.new("Frame")
    TargetRadiusThumb.Size = UDim2.new(0, 22, 0, 22)
    TargetRadiusThumb.Position = UDim2.new(0.04, -11, -0.1875, 0)
    TargetRadiusThumb.BackgroundColor3 = PurpleColors.Text
    TargetRadiusThumb.BorderSizePixel = 0
    TargetRadiusThumb.Parent = TargetRadiusSlider

    local TargetRadiusThumbCorner = Instance.new("UICorner")
    TargetRadiusThumbCorner.CornerRadius = UDim.new(0, 11)
    TargetRadiusThumbCorner.Parent = TargetRadiusThumb

    local TargetSpeedFrame = Instance.new("Frame")
    TargetSpeedFrame.Size = UDim2.new(1, -20, 0, 50)
    TargetSpeedFrame.Position = UDim2.new(0, 10, 0, 130)
    TargetSpeedFrame.BackgroundTransparency = 1
    TargetSpeedFrame.Parent = MainSettingsFrame

    local TargetSpeedLabel = Instance.new("TextLabel")
    TargetSpeedLabel.Size = UDim2.new(1, 0, 0, 22)
    TargetSpeedLabel.Position = UDim2.new(0, 0, 0, 0)
    TargetSpeedLabel.BackgroundTransparency = 1
    TargetSpeedLabel.Text = "Target Speed: 2.0"
    TargetSpeedLabel.TextColor3 = PurpleColors.Text
    TargetSpeedLabel.TextSize = 14
    TargetSpeedLabel.Font = Enum.Font.Gotham
    TargetSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    TargetSpeedLabel.Parent = TargetSpeedFrame

    local TargetSpeedSlider = Instance.new("Frame")
    TargetSpeedSlider.Size = UDim2.new(1, 0, 0, 16)
    TargetSpeedSlider.Position = UDim2.new(0, 0, 0, 28)
    TargetSpeedSlider.BackgroundColor3 = PurpleColors.Medium
    TargetSpeedSlider.BorderSizePixel = 0
    TargetSpeedSlider.Parent = TargetSpeedFrame

    local TargetSpeedSliderCorner = Instance.new("UICorner")
    TargetSpeedSliderCorner.CornerRadius = UDim.new(0, 8)
    TargetSpeedSliderCorner.Parent = TargetSpeedSlider

    local TargetSpeedFill = Instance.new("Frame")
    TargetSpeedFill.Size = UDim2.new(0.03, 0, 1, 0)
    TargetSpeedFill.Position = UDim2.new(0, 0, 0, 0)
    TargetSpeedFill.BackgroundColor3 = PurpleColors.Slider
    TargetSpeedFill.BorderSizePixel = 0
    TargetSpeedFill.Parent = TargetSpeedSlider

    local TargetSpeedFillCorner = Instance.new("UICorner")
    TargetSpeedFillCorner.CornerRadius = UDim.new(0, 8)
    TargetSpeedFillCorner.Parent = TargetSpeedFill

    local TargetSpeedThumb = Instance.new("Frame")
    TargetSpeedThumb.Size = UDim2.new(0, 22, 0, 22)
    TargetSpeedThumb.Position = UDim2.new(0.03, -11, -0.1875, 0)
    TargetSpeedThumb.BackgroundColor3 = PurpleColors.Text
    TargetSpeedThumb.BorderSizePixel = 0
    TargetSpeedThumb.Parent = TargetSpeedSlider

    local TargetSpeedThumbCorner = Instance.new("UICorner")
    TargetSpeedThumbCorner.CornerRadius = UDim.new(0, 11)
    TargetSpeedThumbCorner.Parent = TargetSpeedThumb

    local ButtonGrid = Instance.new("Frame")
    ButtonGrid.Size = UDim2.new(0.96, 0, 0, 180)
    ButtonGrid.Position = UDim2.new(0.02, 0, 0.48, 0)
    ButtonGrid.BackgroundTransparency = 1
    ButtonGrid.Parent = MainFrame

    local buttons = {
        {name = "AutoParry", text = "Auto Parry", row = 0, col = 0, enabled = AutoParryEnabled},
        {name = "Clicker", text = "Auto Clicker", row = 0, col = 1, enabled = AutoClickerEnabled},
        {name = "Target", text = "Target System", row = 1, col = 0, enabled = TargetEnabled},
        {name = "HVH", text = "HVH Mode", row = 1, col = 1, enabled = HVHEnabled},
        {name = "Teleport", text = "Teleport", row = 2, col = 0},
        {name = "AutoInter", text = "Auto Intermission", row = 2, col = 1, enabled = false}
    }

    for _, buttonInfo in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Name = buttonInfo.name
        
        button.Size = UDim2.new(0.48, 0, 0, 40)
        button.Position = UDim2.new(buttonInfo.col * 0.52, 0, buttonInfo.row * 0.33, 0)
        
        if buttonInfo.enabled ~= nil then
            if buttonInfo.name == "AutoInter" then
                button.BackgroundColor3 = AutoIntermissionEnabled and PurpleColors.Slider or PurpleColors.Button
            else
                button.BackgroundColor3 = buttonInfo.enabled and PurpleColors.Slider or PurpleColors.Button
            end
        else
            button.BackgroundColor3 = PurpleColors.Button
        end
        
        button.BorderSizePixel = 0
        button.TextColor3 = PurpleColors.Text
        button.TextSize = 14
        button.Font = Enum.Font.GothamBold
        button.Parent = ButtonGrid
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 10)
        buttonCorner.Parent = button
        
        if buttonInfo.name == "AutoParry" then
            UpdateButtonText(button, buttonInfo.text, Binds.AutoParry)
        elseif buttonInfo.name == "Clicker" then
            UpdateButtonText(button, buttonInfo.text, Binds.Clicker)
        elseif buttonInfo.name == "Target" then
            UpdateButtonText(button, buttonInfo.text, Binds.Target)
        elseif buttonInfo.name == "HVH" then
            UpdateButtonText(button, buttonInfo.text, Binds.HVH)
        elseif buttonInfo.name == "Teleport" then
            UpdateButtonText(button, buttonInfo.text, Binds.Teleport)
        elseif buttonInfo.name == "AutoInter" then
            UpdateButtonText(button, buttonInfo.text, Binds.AutoInter)
        end
        
        buttonInstances[buttonInfo.name] = button
    end

    local TransparencyFrame = Instance.new("Frame")
    TransparencyFrame.Size = UDim2.new(0.96, 0, 0, 50)
    TransparencyFrame.Position = UDim2.new(0.02, 0, 0.88, 0)
    TransparencyFrame.BackgroundTransparency = 1
    TransparencyFrame.Parent = MainFrame

    local TransparencyLabel = Instance.new("TextLabel")
    TransparencyLabel.Size = UDim2.new(1, 0, 0, 22)
    TransparencyLabel.Position = UDim2.new(0, 0, 0, 0)
    TransparencyLabel.BackgroundTransparency = 1
    TransparencyLabel.Text = "GUI Transparency: 10%"
    TransparencyLabel.TextColor3 = PurpleColors.Text
    TransparencyLabel.TextSize = 14
    TransparencyLabel.Font = Enum.Font.Gotham
    TransparencyLabel.TextXAlignment = Enum.TextXAlignment.Left
    TransparencyLabel.Parent = TransparencyFrame

    local TransparencySlider = Instance.new("Frame")
    TransparencySlider.Size = UDim2.new(1, 0, 0, 16)
    TransparencySlider.Position = UDim2.new(0, 0, 0, 28)
    TransparencySlider.BackgroundColor3 = PurpleColors.Medium
    TransparencySlider.BorderSizePixel = 0
    TransparencySlider.Parent = TransparencyFrame

    local TransparencySliderCorner = Instance.new("UICorner")
    TransparencySliderCorner.CornerRadius = UDim.new(0, 8)
    TransparencySliderCorner.Parent = TransparencySlider

    local TransparencyFill = Instance.new("Frame")
    TransparencyFill.Size = UDim2.new(0.125, 0, 1, 0)
    TransparencyFill.Position = UDim2.new(0, 0, 0, 0)
    TransparencyFill.BackgroundColor3 = PurpleColors.Slider
    TransparencyFill.BorderSizePixel = 0
    TransparencyFill.Parent = TransparencySlider

    local TransparencyFillCorner = Instance.new("UICorner")
    TransparencyFillCorner.CornerRadius = UDim.new(0, 8)
    TransparencyFillCorner.Parent = TransparencyFill

    local TransparencyThumb = Instance.new("Frame")
    TransparencyThumb.Size = UDim2.new(0, 22, 0, 22)
    TransparencyThumb.Position = UDim2.new(0.125, -11, -0.1875, 0)
    TransparencyThumb.BackgroundColor3 = PurpleColors.Text
    TransparencyThumb.BorderSizePixel = 0
    TransparencyThumb.Parent = TransparencySlider

    local TransparencyThumbCorner = Instance.new("UICorner")
    TransparencyThumbCorner.CornerRadius = UDim.new(0, 11)
    TransparencyThumbCorner.Parent = TransparencyThumb

    local dragging = false
    local dragStart = nil
    local startPos = nil

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                local delta = input.Position - dragStart
                MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)

    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    buttonInstances.AutoParry.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.AutoParry, "AutoParry", "Auto Parry")
    end)

    buttonInstances.Clicker.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.Clicker, "Clicker", "Auto Clicker")
    end)

    buttonInstances.Target.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.Target, "Target", "Target System")
    end)

    buttonInstances.HVH.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.HVH, "HVH", "HVH Mode")
    end)

    buttonInstances.Teleport.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.Teleport, "Teleport", "Teleport")
    end)

    buttonInstances.AutoInter.MouseButton2Click:Connect(function()
        StartBinding(buttonInstances.AutoInter, "AutoInter", "Auto Intermission")
    end)

    buttonInstances.AutoParry.MouseButton1Click:Connect(function()
        AutoParryEnabled = not AutoParryEnabled
        buttonInstances.AutoParry.BackgroundColor3 = AutoParryEnabled and PurpleColors.Slider or PurpleColors.Button
        UpdateButtonText(buttonInstances.AutoParry, "Auto Parry", Binds.AutoParry)
    end)

    buttonInstances.Clicker.MouseButton1Click:Connect(function()
        AutoClickerEnabled = not AutoClickerEnabled
        buttonInstances.Clicker.BackgroundColor3 = AutoClickerEnabled and PurpleColors.Slider or PurpleColors.Button
        UpdateButtonText(buttonInstances.Clicker, "Auto Clicker", Binds.Clicker)
    end)

    buttonInstances.Target.MouseButton1Click:Connect(function()
        ToggleTarget()
        buttonInstances.Target.BackgroundColor3 = TargetEnabled and PurpleColors.Slider or PurpleColors.Button
        UpdateButtonText(buttonInstances.Target, "Target System", Binds.Target)
    end)

    buttonInstances.HVH.MouseButton1Click:Connect(function()
        ToggleHVH()
        buttonInstances.HVH.BackgroundColor3 = HVHEnabled and PurpleColors.Slider or PurpleColors.Button
        UpdateButtonText(buttonInstances.HVH, "HVH Mode", Binds.HVH)
    end)

    buttonInstances.Teleport.MouseButton1Click:Connect(function()
        TeleportToNearestPlayer()
    end)

    buttonInstances.AutoInter.MouseButton1Click:Connect(function()
        ToggleAutoIntermission()
        buttonInstances.AutoInter.BackgroundColor3 = AutoIntermissionEnabled and PurpleColors.Slider or PurpleColors.Button
        UpdateButtonText(buttonInstances.AutoInter, "Auto Intermission", Binds.AutoInter)
    end)

    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)

    local function SetupSliderDrag(slider, thumb, fill, callback, minValue, maxValue, defaultValue)
        local dragging = false
        
        local function updateFromMouse()
            if not dragging then return end
            
            local mousePos = UserInputService:GetMouseLocation()
            local sliderAbsPos = slider.AbsolutePosition
            local sliderAbsSize = slider.AbsoluteSize
            
            local relativeX = (mousePos.X - sliderAbsPos.X) / sliderAbsSize.X
            relativeX = math.clamp(relativeX, 0, 1)
            
            local value = minValue + (relativeX * (maxValue - minValue))
            callback(value)
        end
        
        thumb.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                thumb.BackgroundColor3 = PurpleColors.Accent
            end
        end)
        
        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                updateFromMouse()
                thumb.BackgroundColor3 = PurpleColors.Accent
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                updateFromMouse()
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                thumb.BackgroundColor3 = PurpleColors.Text
            end
        end)
        
        if defaultValue then
            local relativeValue = (defaultValue - minValue) / (maxValue - minValue)
            callback(defaultValue)
        end
    end

    local function UpdateDistanceSlider(value)
        ParryDistance = math.floor(value)
        local relativeValue = (value - 5) / 20
        DistanceFill.Size = UDim2.new(relativeValue, 0, 1, 0)
        DistanceThumb.Position = UDim2.new(relativeValue, -11, -0.1875, 0)
        DistanceLabel.Text = "Parry Distance: " .. math.floor(value)
    end

    local function UpdateTargetRadiusSlider(value)
        currentRadius = math.floor(value)
        local relativeValue = (value - 40) / 960
        TargetRadiusFill.Size = UDim2.new(relativeValue, 0, 1, 0)
        TargetRadiusThumb.Position = UDim2.new(relativeValue, -11, -0.1875, 0)
        TargetRadiusLabel.Text = "Target Radius: " .. math.floor(value)
    end

    local function UpdateTargetSpeedSlider(value)
        rotationSpeed = math.floor(value * 10) / 10
        local relativeValue = (value - 0.5) / 49.5
        TargetSpeedFill.Size = UDim2.new(relativeValue, 0, 1, 0)
        TargetSpeedThumb.Position = UDim2.new(relativeValue, -11, -0.1875, 0)
        TargetSpeedLabel.Text = "Target Speed: " .. string.format("%.1f", rotationSpeed)
    end

    local function UpdateTransparencySlider(displayValue)
        local actualValue = UpdateGUITransparency(displayValue)
        local relativeValue = actualValue / 100
        TransparencyFill.Size = UDim2.new(relativeValue, 0, 1, 0)
        TransparencyThumb.Position = UDim2.new(relativeValue, -11, -0.1875, 0)
        TransparencyLabel.Text = "GUI Transparency: " .. math.floor(actualValue) .. "%"
    end

    SetupSliderDrag(DistanceSlider, DistanceThumb, DistanceFill, UpdateDistanceSlider, 5, 25, 15)
    SetupSliderDrag(TargetRadiusSlider, TargetRadiusThumb, TargetRadiusFill, UpdateTargetRadiusSlider, 40, 1000, 45)
    SetupSliderDrag(TargetSpeedSlider, TargetSpeedThumb, TargetSpeedFill, UpdateTargetSpeedSlider, 0.5, 50, 2)
    SetupSliderDrag(TransparencySlider, TransparencyThumb, TransparencyFill, UpdateTransparencySlider, 0, 100, 10)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Binds.ToggleGUI then
            MainFrame.Visible = not MainFrame.Visible
        
        elseif input.KeyCode == Binds.Clicker then
            AutoClickerEnabled = not AutoClickerEnabled
            buttonInstances.Clicker.BackgroundColor3 = AutoClickerEnabled and PurpleColors.Slider or PurpleColors.Button
            UpdateButtonText(buttonInstances.Clicker, "Auto Clicker", Binds.Clicker)
        
        elseif input.KeyCode == Binds.Target then
            ToggleTarget()
            buttonInstances.Target.BackgroundColor3 = TargetEnabled and PurpleColors.Slider or PurpleColors.Button
            UpdateButtonText(buttonInstances.Target, "Target System", Binds.Target)
        
        elseif input.KeyCode == Binds.Teleport then
            TeleportToNearestPlayer()
        
        elseif input.KeyCode == Binds.AutoParry then
            AutoParryEnabled = not AutoParryEnabled
            buttonInstances.AutoParry.BackgroundColor3 = AutoParryEnabled and PurpleColors.Slider or PurpleColors.Button
            UpdateButtonText(buttonInstances.AutoParry, "Auto Parry", Binds.AutoParry)
        
        elseif input.KeyCode == Binds.HVH then
            ToggleHVH()
            buttonInstances.HVH.BackgroundColor3 = HVHEnabled and PurpleColors.Slider or PurpleColors.Button
            UpdateButtonText(buttonInstances.HVH, "HVH Mode", Binds.HVH)
        
        elseif input.KeyCode == Binds.AutoInter then
            ToggleAutoIntermission()
            buttonInstances.AutoInter.BackgroundColor3 = AutoIntermissionEnabled and PurpleColors.Slider or PurpleColors.Button
            UpdateButtonText(buttonInstances.AutoInter, "Auto Intermission", Binds.AutoInter)
        end
    end)

    local function UltraAutoClicker()
        if not AutoClickerEnabled then return end
        
        local currentTime = tick()
        local timeBetweenClicks = 1 / ClickSpeed
        
        if currentTime - LastClickTime >= timeBetweenClicks then
            VirtualInputManager:SendKeyEvent(true, "F", false, game)
            task.wait(0.000001)
            VirtualInputManager:SendKeyEvent(false, "F", false, game)
            LastClickTime = currentTime
        end
    end

    local function Parry()
        if IsParrying then return end
        
        IsParrying = true
        local currentTime = tick()
        
        if currentTime - LastParryTime < ParryCooldown then
            IsParrying = false
            return
        end
        
        VirtualInputManager:SendKeyEvent(true, "F", false, game)
        task.wait(0.000001)
        VirtualInputManager:SendKeyEvent(false, "F", false, game)
        
        LastParryTime = currentTime
        IsParrying = false
    end

    local function IsBallComingTowardsPlayer(ballPos, lastPos, playerPos)
        if not lastPos then return true end
        
        local ballToPlayer = (playerPos - ballPos).Unit
        local ballMovement = (ballPos - lastPos).Unit
        
        local dotProduct = ballToPlayer:Dot(ballMovement)
        
        return dotProduct > 0.1
    end

    local function CalculateOptimalParryDistance(speed, horizontalDistance, ballHeight, playerPosY, ballPosY)
        local baseDistance = ParryDistance
        local reactionDistance = speed * ReactionTime * SafetyMargin
        local optimalDistance = baseDistance + reactionDistance
        
        if speed > 20 then
            optimalDistance = optimalDistance * 1.4
        elseif speed > 12 then
            optimalDistance = optimalDistance * 1.3
        elseif speed > 6 then
            optimalDistance = optimalDistance * 1.2
        end
        
        return optimalDistance
    end

    local LastParryCheckTime = 0
    local ParryCheckCooldown = 0.0001

    coroutine.wrap(function()
        while true do
            task.wait()
            
            if AutoClickerEnabled then
                UltraAutoClicker()
            end
            
            CheckAndTeleportToIntermission()
            
            if not BallShadow then
                BallShadow = game.Workspace.FX:FindFirstChild("BallShadow")
            end
            
            if not RealBall then
                RealBall = workspace:FindFirstChild("Ball") or workspace:FindFirstChild("Part")
            end
            
            if BallShadow then
                if not LastBallPos then
                    LastBallPos = BallShadow.Position
                    LastBallPosForVelocity = BallShadow.Position
                end
            end
            
            if BallShadow and (not BallShadow.Parent) then
                BallShadow = nil
                RealBall = nil
            end
            
            if BallShadow and LP.Character and LP.Character.PrimaryPart then
                local BallPos = BallShadow.Position
                local PlayerPos = LP.Character.PrimaryPart.Position
                
                if not LastBallPos then 
                    LastBallPos = BallPos 
                end

                if LastBallPosForVelocity then
                    local deltaTime = RunService.Heartbeat:Wait()
                    BallVelocity = (BallPos - LastBallPosForVelocity) / deltaTime
                end
                LastBallPosForVelocity = BallPos
                
                local currentShadowSize = BallShadow.Size.X
                local ballHeight = CalculateBallHeight(currentShadowSize)
                local ballPosY = BallPos.Y + ballHeight
                
                local moveDir = (LastBallPos - BallPos)
                local rawSpeed = moveDir.Magnitude
                local horizontalSpeed = Vector3.new(moveDir.X, 0, moveDir.Z).Magnitude
                local speedStuds = (horizontalSpeed + 0.25) * SpeedMulty
                
                local horizontalDistance = (Vector3.new(PlayerPos.X, 0, PlayerPos.Z) - Vector3.new(BallPos.X, 0, BallPos.Z)).Magnitude
                
                local ballColor = WhiteColor
                if RealBall then
                    ballColor = GetBallColor()
                end
                local isBallWhite = ballColor == WhiteColor
                
                local shouldParryByTrailColor = ShouldParryBasedOnTrail()
                
                local maxHeightForParry = GetMaxHeightBySpeed(speedStuds)
                
                local isComingTowardsPlayer = IsBallComingTowardsPlayer(BallPos, LastBallPos, PlayerPos)
                local optimalDistance = CalculateOptimalParryDistance(speedStuds, horizontalDistance, ballHeight, PlayerPos.Y, ballPosY)
                
                local currentTime = tick()
                if AutoParryEnabled and currentTime - LastParryCheckTime > ParryCheckCooldown then
                    local shouldParryNow = horizontalDistance <= optimalDistance 
                        and isComingTowardsPlayer 
                        and ballHeight <= maxHeightForParry
                        and (not isBallWhite or shouldParryByTrailColor)
                    
                    if shouldParryNow then
                        Parry()
                    end
                    
                    LastParryCheckTime = currentTime
                end
                
                LastBallPos = BallPos
            end
        end
    end)()
end

InitializeMainScript()
