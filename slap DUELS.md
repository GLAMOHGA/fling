local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Slap duel",
    LoadingTitle = "By https://t.me/vomagla",
    LoadingSubtitle = "by vomagla",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SlapDuelConfig",
        FileName = "VomaglaHub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true 
    },
    KeySystem = false,
})

-- Сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- ==================== ПЕРЕМЕННЫЕ ====================

-- TPWalk
local TPWalkEnabled = false
local TPWalkSpeed = 1

-- Infinite Jump
local InfJumpEnabled = false

-- Auto Floor (Anti-Void)
local AutoFloorEnabled = false
local PartSize = Vector3.new(30, 1, 30)
local CheckDistance = 10000 
local PartColor = Color3.fromRGB(0, 255, 127)

-- Логика задержки
local IsInVoid = false
local VoidStartTime = 0
local DelayTime = 0.35 -- ЗАДЕРЖКА ТЕПЕРЬ 0.35 СЕКУНДЫ

-- Создаем "Спасательный Плот"
local RescuePart = Instance.new("Part")
RescuePart.Name = "Auto_Floor"
RescuePart.Size = PartSize
RescuePart.Anchored = true 
RescuePart.CanCollide = true
RescuePart.Transparency = 0.5
RescuePart.Material = Enum.Material.Neon
RescuePart.Color = PartColor
RescuePart.Parent = Workspace
RescuePart.Position = Vector3.new(0, -10000, 0) -- Прячем далеко

-- Параметры луча
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude

-- ==================== ФУНКЦИИ ====================

-- Функция Телепорта (ВЫСОТА УВЕЛИЧЕНА)
local function FindAndTeleport(partName)
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end

    local HRP = Character.HumanoidRootPart
    
    local FoundPart = Workspace:FindFirstChild(partName, true)

    if FoundPart and FoundPart:IsA("BasePart") then
        -- (FoundPart.Size.Y / 2) = верхняя поверхность
        -- + 6 = высота над поверхностью (было 3, стало выше)
        local TargetPosition = FoundPart.Position + Vector3.new(0, (FoundPart.Size.Y / 2) + 6, 0)
        
        -- ТП
        HRP.CFrame = CFrame.new(TargetPosition)
        HRP.Velocity = Vector3.new(0,0,0)
    end
end

-- Логика TPWalk
RunService.Heartbeat:Connect(function()
    if TPWalkEnabled then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("HumanoidRootPart") then
            local Humanoid = Character.Humanoid
            local HRP = Character.HumanoidRootPart
            if Humanoid.MoveDirection.Magnitude > 0 then
                HRP.CFrame = HRP.CFrame + (Humanoid.MoveDirection * TPWalkSpeed)
                HRP.Velocity = Vector3.new(0,0,0)
            end
        end
    end
end)

-- Логика Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("Humanoid") then
            Character.Humanoid:ChangeState("Jumping")
        end
    end
end)

-- Логика Auto Floor
RunService.Heartbeat:Connect(function()
    if not AutoFloorEnabled then
        RescuePart.Position = Vector3.new(0, -10000, 0)
        return
    end

    local char = LocalPlayer.Character
    if char then
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if rootPart then
            raycastParams.FilterDescendantsInstances = {char, RescuePart}

            local origin = rootPart.Position
            local direction = Vector3.new(0, -CheckDistance, 0)
            local result = Workspace:Raycast(origin, direction, raycastParams)

            if not result then
                -- === ПУСТОТА ===
                if not IsInVoid then
                    IsInVoid = true
                    VoidStartTime = tick()
                end

                -- Ждем 0.35 сек
                if (tick() - VoidStartTime) >= DelayTime then
                    -- Ставим платформу
                    local targetPos = Vector3.new(rootPart.Position.X, rootPart.Position.Y - 3.5, rootPart.Position.Z)
                    RescuePart.Position = targetPos
                    
                    -- Смягчаем удар при приземлении
                    if rootPart.Velocity.Y < -10 then
                         rootPart.Velocity = Vector3.new(rootPart.Velocity.X, 0, rootPart.Velocity.Z)
                    end
                else
                    -- Пока ждем, платформы нет
                    RescuePart.Position = Vector3.new(0, -10000, 0)
                end

            else
                -- === ЗЕМЛЯ ===
                IsInVoid = false
                RescuePart.Position = Vector3.new(0, -10000, 0)
            end
        end
    end
end)

RescuePart.AncestryChanged:Connect(function()
    if RescuePart.Parent ~= Workspace then
        RescuePart.Parent = Workspace
    end
end)

-- ==================== ИНТЕРФЕЙС ====================

local MainTab = Window:CreateTab("Main", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- ----- Main Tab -----
MainTab:CreateSection("Teleports")

MainTab:CreateButton({
    Name = "Teleport 🔵",
    Callback = function()
        FindAndTeleport("StartPart")
    end,
})

MainTab:CreateButton({
    Name = "Teleport 🔴",
    Callback = function()
        FindAndTeleport("EndPart")
    end,
})

-- ----- Player Tab -----
PlayerTab:CreateSection("Movement")

PlayerTab:CreateToggle({
    Name = "TPWalk",
    CurrentValue = false,
    Flag = "TPWalkToggle", 
    Callback = function(Value)
        TPWalkEnabled = Value
    end,
})

PlayerTab:CreateSlider({
    Name = "TPWalk Speed",
    Range = {0, 5},
    Increment = 0.1,
    Suffix = "Studs",
    CurrentValue = 1,
    Flag = "TPWalkSlider", 
    Callback = function(Value)
        TPWalkSpeed = Value
    end,
})

PlayerTab:CreateSection("Abilities")

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle",
    Callback = function(Value)
        InfJumpEnabled = Value
    end,
})

PlayerTab:CreateToggle({
    Name = "Anti-Void (анти падение)",
    CurrentValue = false,
    Flag = "AutoFloorToggle",
    Callback = function(Value)
        AutoFloorEnabled = Value
        if not Value then
            RescuePart.Position = Vector3.new(0, -10000, 0)
        end
    end,
})
