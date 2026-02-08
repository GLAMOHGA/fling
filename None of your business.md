local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Основные настройки окна
local Window = Rayfield:CreateWindow({
   Name = "None of your business",
   LoadingTitle = "By vomagla",
   LoadingSubtitle = "Loading Script...",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
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
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Переменные состояния
local _G = getgenv()
_G.Noclip = false
_G.InfJump = false
_G.PlayerESP = false
_G.ItemESP = false
_G.ExitESP = false
_G.FullBright = false
_G.TPWalk = false
_G.TPWalkSpeed = 0.5 -- Скорость по умолчанию

-- Создание вкладок
local MainTab = Window:CreateTab("Main", 4483362458)
local VisualTab = Window:CreateTab("Visual", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local BindTab = Window:CreateTab("Binds", 4483362458)

-- ==========================================
-- ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
-- ==========================================

local function SafeTeleport(targetCFrame)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        
        if hum and hum.SeatPart then hum.Sit = false end
        
        hrp.Anchored = true
        hrp.CFrame = targetCFrame
        
        task.delay(0.1, function()
            if hrp then hrp.Anchored = false end
        end)
    end
end

local function CreateHighlight(object, name, color, transparency)
    if not object then return end
    
    local highlight = object:FindFirstChild(name)
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = name
        highlight.FillColor = color
        highlight.OutlineColor = Color3.new(1,1,1)
        highlight.FillTransparency = transparency
        highlight.OutlineTransparency = 0.5
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = object 
        highlight.Parent = object
    else
        if highlight.FillColor ~= color then
            highlight.FillColor = color
        end
        if highlight.Adornee ~= object then
            highlight.Adornee = object
        end
    end
end

local function RemoveHighlights(name)
    for _, desc in pairs(Workspace:GetDescendants()) do
        if desc.Name == name and desc:IsA("Highlight") then
            desc:Destroy()
        end
    end
end

-- ==========================================
-- ЛОГИКА ТЕЛЕПОРТОВ
-- ==========================================

local function TeleportToKey()
    local found = false
    if Workspace:FindFirstChild("Items") then
        for _, v in pairs(Workspace.Items:GetChildren()) do
            if string.find(string.lower(v.Name), "key") then
                local targetPart = v:IsA("BasePart") and v or (v:IsA("Model") and v.PrimaryPart) or v:FindFirstChildWhichIsA("BasePart")
                if targetPart then
                     SafeTeleport(targetPart.CFrame)
                     found = true
                     Rayfield:Notify({Title = "Teleport", Content = "Teleported to Key!", Duration = 3})
                     break
                end
            end
        end
    end
    if not found then
        Rayfield:Notify({Title = "Not Found", Content = "No key found in Items folder!", Duration = 3})
    end
end

local function TeleportToKiller()
    local foundKiller = false
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if player.Character:FindFirstChild("HomeownerController") then
                if player.Character:FindFirstChild("HumanoidRootPart") then
                    SafeTeleport(player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, -2))
                    foundKiller = true
                    Rayfield:Notify({Title = "Teleport", Content = "Teleported to Killer: " .. player.Name, Duration = 3})
                    break
                end
            end
        end
    end
    if not foundKiller then
        Rayfield:Notify({Title = "Error", Content = "No Killer found currently.", Duration = 3})
    end
end

local function TeleportToLobby()
    local targetCFrame = CFrame.new(-74.94, -858.6, -1567.36)
    SafeTeleport(targetCFrame + Vector3.new(0, 3, 0))
end

local function TeleportToExit()
    local door = Workspace:FindFirstChild("BasementDoor")
    if door then
        local targetPart = door:IsA("BasePart") and door or (door:IsA("Model") and door.PrimaryPart) or door:FindFirstChildWhichIsA("BasePart")
        if targetPart then
            SafeTeleport(targetPart.CFrame + Vector3.new(0, 3, 0))
            Rayfield:Notify({Title = "Teleport", Content = "Teleported to Exit!", Duration = 3})
            return
        end
    end
    Rayfield:Notify({Title = "Error", Content = "BasementDoor not found.", Duration = 3})
end

-- ==========================================
-- Вкладка: PLAYER (TPWALK ИСПРАВЛЕН)
-- ==========================================

RunService.Heartbeat:Connect(function()
    if _G.TPWalk and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        -- Проверка, что мы двигаемся
        if hum and hrp and hum.MoveDirection.Magnitude > 0 then
            -- Вычисляем направление движения
            local moveDir = hum.MoveDirection
            
            -- Сдвигаем CFrame только по X и Z (Горизонталь)
            -- МЫ БОЛЬШЕ НЕ ТРОГАЕМ СКОРОСТЬ (VELOCITY), ЧТОБЫ РАБОТАЛА ГРАВИТАЦИЯ
            hrp.CFrame = hrp.CFrame + Vector3.new(moveDir.X * _G.TPWalkSpeed, 0, moveDir.Z * _G.TPWalkSpeed)
        end
    end
end)

PlayerTab:CreateToggle({Name = "TPWalk (Speed Hack)", CurrentValue = false, Callback = function(V) _G.TPWalk = V end})
PlayerTab:CreateSlider({Name = "TPWalk Speed", Range = {0.1, 4}, Increment = 0.1, CurrentValue = 0.5, Callback = function(V) _G.TPWalkSpeed = V end})

PlayerTab:CreateButton({
   Name = "Instant Interaction",
   Callback = function()
       for i, v in ipairs(Workspace:GetDescendants()) do
           if v:IsA("ProximityPrompt") then v.HoldDuration = 0 end
       end
       Workspace.DescendantAdded:Connect(function(v)
           if v:IsA("ProximityPrompt") then v.HoldDuration = 0 end
       end)
   end,
})

PlayerTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(V) _G.InfJump = V end})
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

PlayerTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(V) _G.Noclip = V end})
RunService.Stepped:Connect(function()
   if _G.Noclip and LocalPlayer.Character then
       for _, part in pairs(LocalPlayer.Character:GetChildren()) do
           if part:IsA("BasePart") and part.CanCollide then 
               part.CanCollide = false 
           end
       end
   end
end)

-- ==========================================
-- Вкладка: VISUAL
-- ==========================================

RunService.RenderStepped:Connect(function()
    if _G.FullBright then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

task.spawn(function()
    while true do
        task.wait(1) 
        
        -- Player ESP
        if _G.PlayerESP then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local color = Color3.fromRGB(0, 255, 0)
                    if player.Character:FindFirstChild("HomeownerController") then
                        color = Color3.fromRGB(255, 0, 0)
                    end
                    CreateHighlight(player.Character, "ESPHighlight", color, 0.5)
                end
            end
        end

        -- Item ESP (УЛУЧШЕННЫЙ ПОИСК)
        if _G.ItemESP then
            local itemsFolder = Workspace:FindFirstChild("Items")
            if itemsFolder then
                -- Используем GetChildren для основных предметов
                for _, v in pairs(itemsFolder:GetChildren()) do
                    -- Подсвечиваем Модели или BaseParts
                    if v:IsA("Model") or v:IsA("BasePart") or v:IsA("MeshPart") then
                         CreateHighlight(v, "ItemESP", Color3.fromRGB(0, 0, 255), 0.5)
                    end
                end
            end
        end

        -- Exit ESP
        if _G.ExitESP then
            local door = Workspace:FindFirstChild("BasementDoor")
            if door then
                CreateHighlight(door, "ExitESP", Color3.fromRGB(255, 255, 0), 0.3)
            end
        end
    end
end)

VisualTab:CreateToggle({Name = "ESP Players/Killer", CurrentValue = false, Callback = function(V) 
    _G.PlayerESP = V 
    if not V then RemoveHighlights("ESPHighlight") end
end})

VisualTab:CreateToggle({Name = "ESP Items (Blue)", CurrentValue = false, Callback = function(V) 
    _G.ItemESP = V 
    if not V then RemoveHighlights("ItemESP") end
end})

VisualTab:CreateToggle({Name = "ESP Exit (Yellow)", CurrentValue = false, Callback = function(V) 
    _G.ExitESP = V 
    if not V then RemoveHighlights("ExitESP") end
end})

VisualTab:CreateToggle({Name = "Fullbright", CurrentValue = false, Callback = function(V) 
    _G.FullBright = V 
    if not V then 
        Lighting.Brightness = 1 
        Lighting.ClockTime = 12 
        Lighting.GlobalShadows = true 
        Lighting.FogEnd = 500
    end
end})

-- ==========================================
-- Вкладка: MAIN
-- ==========================================
MainTab:CreateButton({Name = "Teleport to Key", Callback = TeleportToKey})
MainTab:CreateButton({Name = "Teleport to Lobby", Callback = TeleportToLobby})
MainTab:CreateButton({Name = "Teleport to Door Exit", Callback = TeleportToExit})
MainTab:CreateButton({Name = "Teleport to Killer", Callback = TeleportToKiller})

-- ==========================================
-- Вкладка: BINDS
-- ==========================================
BindTab:CreateKeybind({Name = "TP to Key", CurrentKeybind = "None", HoldToInteract = false, Callback = TeleportToKey})
BindTab:CreateKeybind({Name = "TP to Lobby", CurrentKeybind = "None", HoldToInteract = false, Callback = TeleportToLobby})
BindTab:CreateKeybind({Name = "TP to Exit", CurrentKeybind = "None", HoldToInteract = false, Callback = TeleportToExit})
BindTab:CreateKeybind({Name = "TP to Killer", CurrentKeybind = "None", HoldToInteract = false, Callback = TeleportToKiller})

Rayfield:Notify({Title = "Loaded!", Content = "Gravity & ESP Fixed.", Duration = 5})
