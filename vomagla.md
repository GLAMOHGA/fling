--by https://t.me/vomagla
--подпищись https://t.me/vomagla

--18.12.2025      0:01

-- env & module loading
getgenv().AirHub = {}

pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xaviersupreme/FemboyHub/refs/heads/main/modules/aimbot.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xaviersupreme/FemboyHub/refs/heads/main/modules/esp.lua"))() end)

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
if not Library then
    return
end

task.wait(0.5)
local Aimbot, WallHack = getgenv().AirHub.Aimbot, getgenv().AirHub.WallHack
if not (Aimbot and WallHack) then
    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")

local Parts = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}
local Fonts = {"UI", "System", "Plex", "Monospace"}
local TracersType = {"Bottom", "Center", "Mouse"}
local HealthBarPos = {"Top", "Bottom", "Left", "Right"}

local IsFlying = false
local FlyBodyGyro, FlyBodyVelocity = nil, nil
local OriginalWalkSpeed = 16
local FlyEnabled = false
local WalkSpeedEnabled = false
local InfiniteJumpEnabled = false
local FlySpeed = 50
local WalkSpeedValue = 32
local FlyKey = Enum.KeyCode.F
local NoclipEnabled = false
local CustomBodyEnabled = false
local CustomBodyColor = Color3.fromRGB(128, 128, 128)
local FOVValue = 90

-- ESP чамсы с текстом
local ESPToggle = false
local ESPTeamCheck = false
local ESPHighlights = {}
local ESPBillboards = {}

-- Настройки текста ESP
local ESPShowName = true
local ESPShowHealth = true
local ESPShowDistance = true
local ESPNameColor = Color3.fromRGB(255, 255, 255)
local ESPHealthColor = Color3.fromRGB(255, 0, 0)
local ESPDistanceColor = Color3.fromRGB(200, 200, 200)

-- Trails
local TrailsEnabled = false
local TrailColor = Color3.fromRGB(0, 255, 255)
local TrailLifetime = 0.5
local TrailTransparency = 0
local trailConnections = {}

-- Время суток
local TimeOfDayValue = 14
local TimeOfDayEnabled = false
local TimeUpdateConnection = nil

-- Оптимизация: кеширование для снижения лагов
local lastESPUpdate = 0
local ESPUpdateInterval = 0.1 -- 10 FPS для ESP

local function UpdateESP()
    if not ESPToggle then return end
    
    local currentTime = tick()
    if currentTime - lastESPUpdate < ESPUpdateInterval then return end
    lastESPUpdate = currentTime
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and humanoid.Health > 0 and rootPart then
                if ESPTeamCheck and player.TeamColor == LocalPlayer.TeamColor then
                    if ESPHighlights[player] then
                        ESPHighlights[player]:Destroy()
                        ESPHighlights[player] = nil
                    end
                    if ESPBillboards[player] then
                        ESPBillboards[player]:Destroy()
                        ESPBillboards[player] = nil
                    end
                else
                    -- Highlight
                    if not ESPHighlights[player] then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Name = "vomaglaESP"
                        highlight.Adornee = player.Character
                        highlight.Enabled = true
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = player.TeamColor.Color
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineTransparency = 0
                        ESPHighlights[player] = highlight
                        
                        -- Удаляем highlight при удалении персонажа
                        player.CharacterRemoving:Connect(function()
                            if ESPHighlights[player] then
                                ESPHighlights[player]:Destroy()
                                ESPHighlights[player] = nil
                            end
                        end)
                    end
                    
                    -- Billboard с информацией
                    if not ESPBillboards[player] then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Parent = player.Character
                        billboard.Name = "vomaglaESPInfo"
                        billboard.Adornee = player.Character:FindFirstChild("Head") or rootPart
                        billboard.Size = UDim2.new(0, 200, 0, 60)
                        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Enabled = true
                        
                        -- HP (самый верхний)
                        local healthLabel = Instance.new("TextLabel")
                        healthLabel.Parent = billboard
                        healthLabel.Name = "Health"
                        healthLabel.Size = UDim2.new(1, 0, 0.33, 0)
                        healthLabel.Position = UDim2.new(0, 0, 0, 0)
                        healthLabel.BackgroundTransparency = 1
                        healthLabel.TextColor3 = ESPHealthColor
                        healthLabel.TextSize = 14
                        healthLabel.Font = Enum.Font.SourceSans
                        healthLabel.Visible = ESPShowHealth
                        
                        -- Имя (посередине)
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Parent = billboard
                        nameLabel.Name = "Name"
                        nameLabel.Size = UDim2.new(1, 0, 0.33, 0)
                        nameLabel.Position = UDim2.new(0, 0, 0.33, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextColor3 = ESPNameColor
                        nameLabel.TextSize = 16
                        nameLabel.Font = Enum.Font.SourceSansBold
                        nameLabel.Visible = ESPShowName
                        
                        -- Дистанция (внизу)
                        local distanceLabel = Instance.new("TextLabel")
                        distanceLabel.Parent = billboard
                        distanceLabel.Name = "Distance"
                        distanceLabel.Size = UDim2.new(1, 0, 0.33, 0)
                        distanceLabel.Position = UDim2.new(0, 0, 0.66, 0)
                        distanceLabel.BackgroundTransparency = 1
                        distanceLabel.TextColor3 = ESPDistanceColor
                        distanceLabel.TextSize = 14
                        distanceLabel.Font = Enum.Font.SourceSans
                        distanceLabel.Visible = ESPShowDistance
                        
                        ESPBillboards[player] = billboard
                        
                        -- Удаляем billboard при удалении персонажа
                        player.CharacterRemoving:Connect(function()
                            if ESPBillboards[player] then
                                ESPBillboards[player]:Destroy()
                                ESPBillboards[player] = nil
                            end
                        end)
                    end
                    
                    -- Обновляем текст (только если изменилось)
                    if ESPBillboards[player] and ESPBillboards[player].Parent then
                        local healthText = "HP: " .. math.floor(humanoid.Health)
                        local distanceText = "N/A"
                        
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local localRoot = LocalPlayer.Character.HumanoidRootPart
                            local playerRoot = player.Character:FindFirstChild("HumanoidRootPart")
                            if playerRoot then
                                distanceText = "Dist: " .. math.floor((localRoot.Position - playerRoot.Position).Magnitude)
                            end
                        end
                        
                        local healthLabel = ESPBillboards[player]:FindFirstChild("Health")
                        local nameLabel = ESPBillboards[player]:FindFirstChild("Name")
                        local distanceLabel = ESPBillboards[player]:FindFirstChild("Distance")
                        
                        if healthLabel then
                            if healthLabel.Text ~= healthText then
                                healthLabel.Text = healthText
                            end
                            healthLabel.Visible = ESPShowHealth
                        end
                        if nameLabel then
                            nameLabel.Visible = ESPShowName
                        end
                        if distanceLabel then
                            if distanceLabel.Text ~= distanceText then
                                distanceLabel.Text = distanceText
                            end
                            distanceLabel.Visible = ESPShowDistance
                        end
                    end
                end
            else
                if ESPHighlights[player] then
                    ESPHighlights[player]:Destroy()
                    ESPHighlights[player] = nil
                end
                if ESPBillboards[player] then
                    ESPBillboards[player]:Destroy()
                    ESPBillboards[player] = nil
                end
            end
        end
    end
end

local function UpdateESPColors()
    for player, billboard in pairs(ESPBillboards) do
        if billboard and billboard.Parent then
            local nameLabel = billboard:FindFirstChild("Name")
            local healthLabel = billboard:FindFirstChild("Health")
            local distanceLabel = billboard:FindFirstChild("Distance")
            
            if nameLabel then nameLabel.TextColor3 = ESPNameColor end
            if healthLabel then healthLabel.TextColor3 = ESPHealthColor end
            if distanceLabel then distanceLabel.TextColor3 = ESPDistanceColor end
        end
    end
end

local function UpdateESPVisibility()
    for player, billboard in pairs(ESPBillboards) do
        if billboard and billboard.Parent then
            local nameLabel = billboard:FindFirstChild("Name")
            local healthLabel = billboard:FindFirstChild("Health")
            local distanceLabel = billboard:FindFirstChild("Distance")
            
            if nameLabel then nameLabel.Visible = ESPShowName end
            if healthLabel then healthLabel.Visible = ESPShowHealth end
            if distanceLabel then distanceLabel.Visible = ESPShowDistance end
        end
    end
end

local function ClearESP()
    for player, highlight in pairs(ESPHighlights) do
        if highlight then highlight:Destroy() end
    end
    for player, billboard in pairs(ESPBillboards) do
        if billboard then billboard:Destroy() end
    end
    ESPHighlights = {}
    ESPBillboards = {}
end

-- Улучшенная функция для трейлов с большим размером
local function UpdateTrails()
    if TrailsEnabled then
        local character = LocalPlayer.Character
        if not character then return end
        
        -- Проверяем, есть ли уже трейл
        if trailConnections[character] then return end
        
        local torso = character:WaitForChild("HumanoidRootPart")
        
        -- Создаем более крупные трейлы
        local attachment0 = Instance.new("Attachment")
        attachment0.Position = Vector3.new(0, 2, 0)  -- Выше
        attachment0.Parent = torso
        attachment0.Name = "vomaglaTrailAttachment0"
        
        local attachment1 = Instance.new("Attachment")
        attachment1.Position = Vector3.new(0, -2, 0)  -- Ниже
        attachment1.Parent = torso
        attachment1.Name = "vomaglaTrailAttachment1"
        
        local trail = Instance.new("Trail")
        trail.Attachment0 = attachment0
        trail.Attachment1 = attachment1
        trail.Lifetime = TrailLifetime
        trail.Transparency = NumberSequence.new(TrailTransparency, 1)
        trail.Color = ColorSequence.new(TrailColor)
        trail.LightEmission = 0.7
        trail.Enabled = true
        trail.Parent = character
        trail.Name = "vomaglaTrail"
        
        -- Увеличиваем ширину трейла
        trail.WidthScale = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),  -- Начальная ширина
            NumberSequenceKeypoint.new(1, 0.5) -- Конечная ширина
        })
        
        -- Сохраняем соединение для отслеживания
        trailConnections[character] = {
            trail = trail,
            attachments = {attachment0, attachment1}
        }
        
        -- Добавляем обработчик удаления персонажа
        local connection
        connection = character.AncestryChanged:Connect(function()
            if not character.Parent then
                if trailConnections[character] then
                    if trailConnections[character].trail then
                        trailConnections[character].trail:Destroy()
                    end
                    for _, attachment in pairs(trailConnections[character].attachments or {}) do
                        if attachment then attachment:Destroy() end
                    end
                    trailConnections[character] = nil
                end
                if connection then connection:Disconnect() end
            end
        end)
    else
        -- Удаляем все трейлы
        for character, data in pairs(trailConnections) do
            if data.trail then
                data.trail:Destroy()
            end
            for _, attachment in pairs(data.attachments or {}) do
                if attachment then attachment:Destroy() end
            end
        end
        trailConnections = {}
    end
end

local function ToggleFly(state)
    if IsFlying == state then return end
    
    IsFlying = state
    FlyEnabled = state
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if not (root and humanoid) then return end
    
    if IsFlying then
        -- Удаляем старые объекты если они есть
        if FlyBodyGyro then 
            FlyBodyGyro:Destroy()
            FlyBodyGyro = nil
        end
        if FlyBodyVelocity then 
            FlyBodyVelocity:Destroy()
            FlyBodyVelocity = nil
        end
        
        -- Создаем новые объекты
        FlyBodyGyro = Instance.new("BodyGyro")
        FlyBodyGyro.Parent = root
        FlyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        FlyBodyGyro.P = 20000
        
        FlyBodyVelocity = Instance.new("BodyVelocity")
        FlyBodyVelocity.Parent = root
        FlyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        FlyBodyVelocity.P = 10000
        
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        -- Плавно отключаем полет
        if FlyBodyGyro then
            FlyBodyGyro:Destroy()
            FlyBodyGyro = nil
        end
        if FlyBodyVelocity then
            FlyBodyVelocity:Destroy()
            FlyBodyVelocity = nil
        end
        
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end
end

local function UpdateCharacterStats()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if WalkSpeedEnabled then
        humanoid.WalkSpeed = WalkSpeedValue
    else
        humanoid.WalkSpeed = OriginalWalkSpeed
    end
end

local function UpdateCustomBody()
    local character = LocalPlayer.Character
    if not character then return end
    
    if CustomBodyEnabled then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Color = CustomBodyColor
                part.Material = Enum.Material.ForceField
            end
        end
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Color = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end

-- Функция для изменения времени суток
local function UpdateTimeOfDay()
    if TimeOfDayEnabled and Lighting then
        Lighting.ClockTime = TimeOfDayValue
    end
end

-- Функция для настройки времени суток
local function SetupTimeOfDay()
    if TimeUpdateConnection then
        TimeUpdateConnection:Disconnect()
        TimeUpdateConnection = nil
    end
    
    if TimeOfDayEnabled then
        -- Включаем постоянное обновление времени
        TimeUpdateConnection = RunService.Heartbeat:Connect(function()
            UpdateTimeOfDay()
        end)
        -- Применяем время сразу
        UpdateTimeOfDay()
    end
end

local WhiteTheme = [[{"__Designer.Colors.topGradient":"FFFFFF","__Designer.Colors.section":"FFFFFF","__Designer.Colors.hoveredOptionBottom":"DDDDDD","__Designer.Background.ImageAssetID":"","__Designer.Colors.selectedOption":"FFFFFF","__Designer.Colors.unselectedOption":"EEEEEE","__Designer.Files.WorkspaceFile":"FemboyHub","__Designer.Colors.unhoveredOptionTop":"F5F5F5","__Designer.Colors.outerBorder":"CCCCCC","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"000000","__Designer.Colors.elementBorder":"DDDDDD","__Designer.Background.ImageTransparency":100,"__Designer.Colors.background":"F5F5F5","__Designer.Colors.innerBorder":"FFFFFF","__Designer.Colors.bottomGradient":"FFFFFF","__Designer.Colors.sectionBackground":"FFFFFF","__Designer.Colors.hoveredOptionTop":"DDDDDD","__Designer.Colors.otherElementText":"000000","__Designer.Colors.main":"FFFFFF","__Designer.Colors.elementText":"000000","__Designer.Colors.unhoveredOptionBottom":"EEEEEE","__Designer.Background.UseBackgroundImage":false}]]

local MainFrame = Library:CreateWindow({
    Name = "vomagla Hub",
    Theme = WhiteTheme
})

local AimbotTab = MainFrame:CreateTab({ Name = "Aimbot" })
local ESPTab = MainFrame:CreateTab({ Name = "ESP" })
local VisualsTab = MainFrame:CreateTab({ Name = "Visuals" })
local PlayerTab = MainFrame:CreateTab({ Name = "Player" })

local Values = AimbotTab:CreateSection({ Name = "Values" })
local Checks = AimbotTab:CreateSection({ Name = "Checks" })
local FOV_Values = AimbotTab:CreateSection({ Name = "Field Of View", Side = "Right" })
local FOV_Appearance = AimbotTab:CreateSection({ Name = "FOV Circle Appearance", Side = "Right" })

Values:AddToggle({ Name = "Enabled", Value = Aimbot.Settings.Enabled, Callback = function(New) Aimbot.Settings.Enabled = New end })
Values:AddToggle({ Name = "Toggle", Value = Aimbot.Settings.Toggle, Callback = function(New) Aimbot.Settings.Toggle = New end })
Values:AddDropdown({ Name = "Lock Part", Value = Aimbot.Settings.LockPart, Callback = function(New) Aimbot.Settings.LockPart = New end, List = Parts, Nothing = "Head" })
Values:AddTextbox({ Name = "Hotkey", Value = Aimbot.Settings.TriggerKey, Callback = function(New) Aimbot.Settings.TriggerKey = New end })

Checks:AddToggle({ Name = "Team Check", Value = Aimbot.Settings.TeamCheck, Callback = function(New) Aimbot.Settings.TeamCheck = New end })
Checks:AddToggle({ Name = "Wall Check", Value = Aimbot.Settings.WallCheck, Callback = function(New) Aimbot.Settings.WallCheck = New end })
Checks:AddToggle({ Name = "Alive Check", Value = Aimbot.Settings.AliveCheck, Callback = function(New) Aimbot.Settings.AliveCheck = New end })

FOV_Values:AddToggle({ Name = "Enabled", Value = Aimbot.FOVSettings.Enabled, Callback = function(New) Aimbot.FOVSettings.Enabled = New end })
FOV_Values:AddToggle({ Name = "Visible", Value = Aimbot.FOVSettings.Visible, Callback = function(New) Aimbot.FOVSettings.Visible = New end })
FOV_Values:AddSlider({ Name = "Amount", Value = Aimbot.FOVSettings.Amount, Callback = function(New) Aimbot.FOVSettings.Amount = New end, Min = 10, Max = 300 })

FOV_Appearance:AddToggle({ Name = "Filled", Value = Aimbot.FOVSettings.Filled, Callback = function(New) Aimbot.FOVSettings.Filled = New end })
FOV_Appearance:AddSlider({ Name = "Transparency", Value = Aimbot.FOVSettings.Transparency, Callback = function(New) Aimbot.FOVSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
FOV_Appearance:AddSlider({ Name = "Sides", Value = Aimbot.FOVSettings.Sides, Callback = function(New) Aimbot.FOVSettings.Sides = New end, Min = 3, Max = 60 })
FOV_Appearance:AddSlider({ Name = "Thickness", Value = Aimbot.FOVSettings.Thickness, Callback = function(New) Aimbot.FOVSettings.Thickness = New end, Min = 1, Max = 50 })
FOV_Appearance:AddColorpicker({ Name = "Color", Value = Aimbot.FOVSettings.Color, Callback = function(New) Aimbot.FOVSettings.Color = New end })

local WallHackChecks = ESPTab:CreateSection({ Name = "Checks" })
local ChamsSettings = ESPTab:CreateSection({ Name = "Chams Settings" })
local TextSettings = ESPTab:CreateSection({ Name = "Text Settings", Side = "Right" })
local TextColors = ESPTab:CreateSection({ Name = "Text Colors", Side = "Right" })

WallHackChecks:AddToggle({ Name = "Enabled", Value = false, Callback = function(New) 
    ESPToggle = New
    if not New then
        ClearESP()
    end
end })

WallHackChecks:AddToggle({ Name = "Team Check", Value = false, Callback = function(New) 
    ESPTeamCheck = New
end })

ChamsSettings:AddSlider({ Name = "Transparency", Value = 0.5, Callback = function(New) 
    for _, highlight in pairs(ESPHighlights) do
        if highlight then highlight.FillTransparency = New end
    end
end, Min = 0, Max = 1, Decimals = 2 })

ChamsSettings:AddColorpicker({ Name = "Color", Value = Color3.fromRGB(255, 0, 0), Callback = function(New) 
    for _, highlight in pairs(ESPHighlights) do
        if highlight and not ESPTeamCheck then
            highlight.FillColor = New
        end
    end
end })

TextSettings:AddToggle({ Name = "Show Name", Value = true, Callback = function(New) 
    ESPShowName = New
    UpdateESPVisibility()
end })

TextSettings:AddToggle({ Name = "Show Health", Value = true, Callback = function(New) 
    ESPShowHealth = New
    UpdateESPVisibility()
end })

TextSettings:AddToggle({ Name = "Show Distance", Value = true, Callback = function(New) 
    ESPShowDistance = New
    UpdateESPVisibility()
end })

TextColors:AddColorpicker({ Name = "Name Color", Value = Color3.fromRGB(255, 255, 255), Callback = function(New) 
    ESPNameColor = New
    UpdateESPColors()
end })

TextColors:AddColorpicker({ Name = "Health Color", Value = Color3.fromRGB(255, 0, 0), Callback = function(New) 
    ESPHealthColor = New
    UpdateESPColors()
end })

TextColors:AddColorpicker({ Name = "Distance Color", Value = Color3.fromRGB(200, 200, 200), Callback = function(New) 
    ESPDistanceColor = New
    UpdateESPColors()
end })

local CustomBodySection = VisualsTab:CreateSection({ Name = "Custom Body" })
local FOVSettings = VisualsTab:CreateSection({ Name = "Camera FOV" })
local TimeOfDaySection = VisualsTab:CreateSection({ Name = "Time of Day" })
local TrailsSection = VisualsTab:CreateSection({ Name = "Trails", Side = "Right" })

FOVSettings:AddSlider({ Name = "Field of View", Value = 90, Callback = function(New) 
    FOVValue = New
    Camera.FieldOfView = FOVValue
end, Min = 60, Max = 120 })

TimeOfDaySection:AddSlider({ 
    Name = "Time", 
    Value = 14, 
    Callback = function(New) 
        TimeOfDayValue = New
        if TimeOfDayEnabled then
            UpdateTimeOfDay()
        end
    end, 
    Min = 0, 
    Max = 24, 
    Decimals = 1 
})

-- Добавляем тоггл для включения/выключения изменения времени
local TimeToggle = TimeOfDaySection:AddToggle({ 
    Name = "Enabled", 
    Value = false, 
    Callback = function(New) 
        TimeOfDayEnabled = New
        SetupTimeOfDay()
    end 
})

TimeOfDaySection:AddButton({
    Name = "Morning (6:00)",
    Callback = function()
        TimeOfDayValue = 6
        if TimeOfDayEnabled then
            UpdateTimeOfDay()
        end
    end
})

TimeOfDaySection:AddButton({
    Name = "Day (14:00)",
    Callback = function()
        TimeOfDayValue = 14
        if TimeOfDayEnabled then
            UpdateTimeOfDay()
        end
    end
})

TimeOfDaySection:AddButton({
    Name = "Evening (18:00)",
    Callback = function()
        TimeOfDayValue = 18
        if TimeOfDayEnabled then
            UpdateTimeOfDay()
        end
    end
})

TimeOfDaySection:AddButton({
    Name = "Night (0:00)",
    Callback = function()
        TimeOfDayValue = 0
        if TimeOfDayEnabled then
            UpdateTimeOfDay()
        end
    end
})

TrailsSection:AddToggle({ 
    Name = "Enabled", 
    Value = false, 
    Callback = function(New) 
        TrailsEnabled = New
        UpdateTrails()
    end 
})

TrailsSection:AddColorpicker({ 
    Name = "Color", 
    Value = Color3.fromRGB(0, 255, 255), 
    Callback = function(New) 
        TrailColor = New
        for character, data in pairs(trailConnections) do
            if data.trail then
                data.trail.Color = ColorSequence.new(TrailColor)
            end
        end
    end 
})

TrailsSection:AddSlider({ 
    Name = "Lifetime", 
    Value = 0.5, 
    Callback = function(New) 
        TrailLifetime = New
        for character, data in pairs(trailConnections) do
            if data.trail then
                data.trail.Lifetime = TrailLifetime
            end
        end
    end, 
    Min = 0.1, 
    Max = 2, 
    Decimals = 1 
})

TrailsSection:AddSlider({ 
    Name = "Width", 
    Value = 1, 
    Callback = function(New) 
        for character, data in pairs(trailConnections) do
            if data.trail then
                data.trail.WidthScale = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, New),
                    NumberSequenceKeypoint.new(1, New * 0.5)
                })
            end
        end
    end, 
    Min = 0.5, 
    Max = 3, 
    Decimals = 1 
})

CustomBodySection:AddToggle({ 
    Name = "Enabled", 
    Value = false, 
    Callback = function(New) 
        CustomBodyEnabled = New
        UpdateCustomBody()
    end 
})

CustomBodySection:AddColorpicker({ 
    Name = "Color", 
    Value = Color3.fromRGB(128, 128, 128), 
    Callback = function(New) 
        CustomBodyColor = New
        if CustomBodyEnabled then
            UpdateCustomBody()
        end
    end 
})

local FlySection = PlayerTab:CreateSection({ Name = "Fly" })
local MovementSection = PlayerTab:CreateSection({ Name = "Movement" })
local OtherSection = PlayerTab:CreateSection({ Name = "Other", Side = "Right" })

-- Сохраняем ссылку на тоггл для внешнего доступа
local flyToggleRef

local FlyToggle = FlySection:AddToggle({
    Name = "Enabled", 
    Value = false, 
    Callback = function(state)
        ToggleFly(state)
        flyToggleRef = FlyToggle
    end
})

FlySection:AddSlider({
    Name = "Speed", 
    Value = 50, 
    Min = 10, 
    Max = 200, 
    Callback = function(v)
        FlySpeed = v
    end
})

FlySection:AddTextbox({
    Name = "Hotkey",
    Value = "F",
    Callback = function(New)
        local key = Enum.KeyCode[New]
        if key then
            FlyKey = key
        end
    end
})

local WalkSpeedToggle = MovementSection:AddToggle({
    Name = "WalkSpeed", 
    Value = false, 
    Callback = function(v)
        WalkSpeedEnabled = v
        UpdateCharacterStats()
    end
})

MovementSection:AddSlider({
    Name = "Speed", 
    Value = 32, 
    Min = 16, 
    Max = 200, 
    Callback = function(v)
        WalkSpeedValue = v
        if WalkSpeedEnabled then
            UpdateCharacterStats()
        end
    end
})

local InfiniteJumpToggle = MovementSection:AddToggle({
    Name = "Infinite Jump", 
    Value = false, 
    Callback = function(v)
        InfiniteJumpEnabled = v
    end
})

local NoclipToggle = OtherSection:AddToggle({
    Name = "Noclip",
    Value = false,
    Callback = function(state)
        NoclipEnabled = state
    end
})

-- Оптимизированные соединения
local ESPLoop
local FlyConnection
local InfiniteJumpConnection
local NoclipConnection

local function SetupConnections()
    -- Останавливаем старые соединения если они есть
    if ESPLoop then ESPLoop:Disconnect() end
    if FlyConnection then FlyConnection:Disconnect() end
    if InfiniteJumpConnection then InfiniteJumpConnection:Disconnect() end
    if NoclipConnection then NoclipConnection:Disconnect() end
    
    -- ESP соединение с интервалом для оптимизации
    ESPLoop = RunService.RenderStepped:Connect(function()
        UpdateESP()
    end)
    
    -- Fly соединение
    FlyConnection = RunService.RenderStepped:Connect(function()
        pcall(function()
            if IsFlying and FlyBodyGyro and FlyBodyVelocity then
                local camCF = Camera.CFrame
                local moveVector = Vector3.new()
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + camCF.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - camCF.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - camCF.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + camCF.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveVector = moveVector + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    moveVector = moveVector - Vector3.new(0, 1, 0)
                end
                
                FlyBodyGyro.CFrame = camCF
                if moveVector.Magnitude > 0 then
                    FlyBodyVelocity.Velocity = moveVector.Unit * FlySpeed
                else
                    FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    end)
    
    -- Infinite Jump соединение
    InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    -- Noclip соединение
    NoclipConnection = RunService.Stepped:Connect(function()
        if NoclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- Настраиваем соединения
SetupConnections()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == FlyKey then
        if flyToggleRef then
            flyToggleRef:Set(not FlyEnabled)
        else
            FlyToggle:Set(not FlyEnabled)
        end
    end
end)

-- Обработчик добавления персонажа
local function CharacterAdded(character)
    task.wait(0.5)
    
    -- Сбрасываем состояние полета при респавне
    if FlyEnabled then
        IsFlying = false
        FlyEnabled = false
        
        if flyToggleRef then
            flyToggleRef:Set(false)
        else
            FlyToggle:Set(false)
        end
        
        if FlyBodyGyro then
            FlyBodyGyro:Destroy()
            FlyBodyGyro = nil
        end
        if FlyBodyVelocity then
            FlyBodyVelocity:Destroy()
            FlyBodyVelocity = nil
        end
    end
    
    local humanoid = character:WaitForChild("Humanoid")
    if humanoid then
        OriginalWalkSpeed = humanoid.WalkSpeed
        UpdateCharacterStats()
    end
    
    if CustomBodyEnabled then
        UpdateCustomBody()
    end
    
    Camera.FieldOfView = FOVValue
    
    if TrailsEnabled then
        UpdateTrails()
    end
end

LocalPlayer.CharacterAdded:Connect(CharacterAdded)

-- Обработчик удаления персонажа для очистки
LocalPlayer.CharacterRemoving:Connect(function(character)
    -- Очищаем трейлы при удалении персонажа
    if trailConnections[character] then
        if trailConnections[character].trail then
            trailConnections[character].trail:Destroy()
        end
        for _, attachment in pairs(trailConnections[character].attachments or {}) do
            if attachment then attachment:Destroy() end
        end
        trailConnections[character] = nil
    end
    
    -- Очищаем объекты полета
    if FlyBodyGyro then
        FlyBodyGyro:Destroy()
        FlyBodyGyro = nil
    end
    if FlyBodyVelocity then
        FlyBodyVelocity:Destroy()
        FlyBodyVelocity = nil
    end
end)

-- Инициализация при запуске
if LocalPlayer.Character then
    CharacterAdded(LocalPlayer.Character)
else
    Camera.FieldOfView = FOVValue
end

-- Функция для обновления времени при изменении
game:GetService("RunService").RenderStepped:Connect(function()
    if TimeOfDayEnabled then
        UpdateTimeOfDay()
    end
end)

-- Обработчик выхода из игры для очистки
game:GetService("Players").PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        -- Очищаем все при выходе
        ClearESP()
        
        if FlyBodyGyro then FlyBodyGyro:Destroy() end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
        
        for character, data in pairs(trailConnections) do
            if data.trail then data.trail:Destroy() end
            for _, attachment in pairs(data.attachments or {}) do
                if attachment then attachment:Destroy() end
            end
        end
        
        if ESPLoop then ESPLoop:Disconnect() end
        if FlyConnection then FlyConnection:Disconnect() end
        if InfiniteJumpConnection then InfiniteJumpConnection:Disconnect() end
        if NoclipConnection then NoclipConnection:Disconnect() end
        if TimeUpdateConnection then TimeUpdateConnection:Disconnect() end
    end
end)

-- Принудительное применение времени при старте (если включено)
task.spawn(function()
    task.wait(1)
    if TimeOfDayEnabled then
        UpdateTimeOfDay()
    end
end)
