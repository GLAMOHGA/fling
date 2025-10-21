local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

setclipboard("https://t.me/vomagla")

local Window = Rayfield:CreateWindow({
    Name = "Moscow rp",
    LoadingTitle = "Загрузка...",
    LoadingSubtitle = "by https://t.me/vomagla",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Moscow RP"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Moscow RP",
        Subtitle = "by https://t.me/vomagla",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

local NoClipButton = MainTab:CreateButton({
    Name = "Сделать ноуклип столбы (неработает)",
    Callback = function()
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local lightFolder = mapFolder:FindFirstChild("Light")
            if lightFolder then
                for _, obj in pairs(lightFolder:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        obj.CanCollide = false
                    end
                end
                Rayfield:Notify({
                    Title = "NoClip",
                    Content = "Ноуклип активирован для объектов в папке 'Light'",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                Rayfield:Notify({
                    Title = "Ошибка",
                    Content = "Папка 'Light' не найдена в Map",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Папка Map не найдена в Workspace",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- Player Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)

local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Скорость",
    Range = {16, 100},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = Value
        end
    end
})

-- Отскок от воды
local waterBounceConnection = nil

local WaterBounceToggle = PlayerTab:CreateToggle({
    Name = "Отскок от воды",
    CurrentValue = false,
    Flag = "WaterBounce",
    Callback = function(Value)
        if Value then
            waterBounceConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = character.HumanoidRootPart
                    local position = rootPart.Position
                    
                    -- Проверяем, находится ли игрок в воде (Y координата меньше определенного значения)
                    if position.Y < 0 then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            rootPart.Velocity = Vector3.new(rootPart.Velocity.X, 170, rootPart.Velocity.Z)
                        end
                    end
                end
            end)
            Rayfield:Notify({
                Title = "Отскок от воды",
                Content = "Функция активирована!",
                Duration = 3,
                Image = 4483362458
            })
        else
            if waterBounceConnection then
                waterBounceConnection:Disconnect()
                waterBounceConnection = nil
            end
            Rayfield:Notify({
                Title = "Отскок от воды",
                Content = "Функция отключена!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

local jumpNoDelayConnection = nil

local JumpNoDelayToggle = PlayerTab:CreateToggle({
    Name = "Убрать задержку от прыжка",
    CurrentValue = false,
    Flag = "JumpNoDelay",
    Callback = function(Value)
        if Value then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")
            local player = Players.LocalPlayer

            local function setupCharacter()
                local character = player.Character
                if not character then return end
                
                local humanoid = character:WaitForChild("Humanoid")
                humanoid.AutoJumpEnabled = false
                
                if jumpNoDelayConnection then
                    jumpNoDelayConnection:Disconnect()
                end
                
                jumpNoDelayConnection = RunService.Heartbeat:Connect(function()
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        if humanoid.FloorMaterial ~= Enum.Material.Air and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end)
            end

            player.CharacterAdded:Connect(setupCharacter)
            if player.Character then
                setupCharacter()
            end
            
            Rayfield:Notify({
                Title = "Убрать задержку от прыжка",
                Content = "Функция активирована!",
                Duration = 3,
                Image = 4483362458
            })
        else
            if jumpNoDelayConnection then
                jumpNoDelayConnection:Disconnect()
                jumpNoDelayConnection = nil
            end
            Rayfield:Notify({
                Title = "Убрать задержку от прыжка",
                Content = "Функция отключена!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

local FlyButton = PlayerTab:CreateButton({
    Name = "Fly Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        Rayfield:Notify({
            Title = "Fly Mobile",
            Content = "Fly активирован!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Teleport Tab
local TeleportTab = Window:CreateTab("Teleport", 4483362458)

local function getPlayers()
    local playerList = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function teleportToPlayer(playerName)
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if not targetPlayer then
        Rayfield:Notify({
            Title = "Ошибка",
            Content = "Игрок не найден",
            Duration = 3,
            Image = 4483362458
        })
        return
    end

    local targetCharacter = targetPlayer.Character
    local localCharacter = game.Players.LocalPlayer.Character

    if not targetCharacter or not localCharacter then
        Rayfield:Notify({
            Title = "Ошибка",
            Content = "Персонаж не найден",
            Duration = 3,
            Image = 4483362458
        })
        return
    end

    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart") or targetCharacter:FindFirstChild("Torso")
    local localRoot = localCharacter:FindFirstChild("HumanoidRootPart") or localCharacter:FindFirstChild("Torso")

    if not targetRoot or not localRoot then
        Rayfield:Notify({
            Title = "Ошибка",
            Content = "Не найден корневой парт",
            Duration = 3,
            Image = 4483362458
        })
        return
    end

    localRoot.CFrame = targetRoot.CFrame

    Rayfield:Notify({
        Title = "Телепорт",
        Content = "Телепортирован к " .. playerName,
        Duration = 3,
        Image = 4483362458
    })
end

local PlayerDropdown = TeleportTab:CreateDropdown({
    Name = "Выберите игрока",
    Options = getPlayers(),
    CurrentOption = "",
    Flag = "PlayerSelect",
    Callback = function(Option)
        if Option and Option ~= "" then
            teleportToPlayer(Option)
        end
    end
})

game.Players.PlayerAdded:Connect(function()
    wait(0.5)
    PlayerDropdown:Set(getPlayers())
end)

game.Players.PlayerRemoving:Connect(function()
    wait(0.5)
    PlayerDropdown:Set(getPlayers())
end)

local function teleportToCoordinates(cframeData)
    local character = game.Players.LocalPlayer.Character
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
    if not humanoidRootPart then return end

    local x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33 = unpack(cframeData)
    local cf = CFrame.new(x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33)
    humanoidRootPart.CFrame = cf
end

local SpawnButton = TeleportTab:CreateButton({
    Name = "Спавн (гражданин)",
    Callback = function()
        teleportToCoordinates({-454.86734, 2.76890016, 374.989655, -1, 0, 0, 0, 1, 0, 0, 0, -1})
        Rayfield:Notify({
            Title = "Телепорт",
            Content = "Телепортирован на спавн гражданина",
            Duration = 3,
            Image = 4483362458
        })
    end
})

local TruckerButton = TeleportTab:CreateButton({
    Name = "Дальнобойщик-Грузчик",
    Callback = function()
        teleportToCoordinates({-1093.13525, 2.76900005, -610.236877, -1, 0, 0, 0, 1, 0, 0, 0, -1})
        Rayfield:Notify({
            Title = "Телепорт",
            Content = "Телепортирован к дальнобойщику-грузчику",
            Duration = 3,
            Image = 4483362458
        })
    end
})

local DeliveryButton = TeleportTab:CreateButton({
    Name = "Телепорт работа Доставщик",
    Callback = function()
        teleportToCoordinates({-191.00296, 2.76900005, -681.72644, -1, 0, 0, 0, 1, 0, 0, 0, -1})
        Rayfield:Notify({
            Title = "Телепорт",
            Content = "Телепортирован к работе доставщика",
            Duration = 3,
            Image = 4483362458
        })
    end
})

local PoliceButton = TeleportTab:CreateButton({
    Name = "Работа МВД",
    Callback = function()
        teleportToCoordinates({-778.224182, -72.6444931, -587.907593, 0, 0, 1, 0, 1, -0, -1, 0, 0})
        Rayfield:Notify({
            Title = "Телепорт",
            Content = "Телепортирован к работе МВД",
            Duration = 3,
            Image = 4483362458
        })
    end
})

local CarSaleButton = TeleportTab:CreateButton({
    Name = "Продажа автомобилей аук",
    Callback = function()
        teleportToCoordinates({-644.728577, 5.1250782, 288.64502, 0.740214169, 0.00123527437, 0.672370136, -5.30570615e-05, 0.999998391, -0.00177878083, -0.672371209, 0.00128100452, 0.740213096})
        Rayfield:Notify({
            Title = "Телепорт",
            Content = "Телепортирован к продаже автомобилей",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Visual Tab
local VisualTab = Window:CreateTab("Visual", 4483362458)

-- ESP для игроков
local ESP = {
    Enabled = {},
    Highlights = {},
    Connections = {}
}

local TeamColors = {
    ["Бандит"] = Color3.fromRGB(184, 15, 10),
    ["Гражданин"] = Color3.fromRGB(13, 105, 172),
    ["Грузчик"] = Color3.fromRGB(255, 140, 0),
    ["Дальнобойщик"] = Color3.fromRGB(46, 204, 113),
    ["Доставщик"] = Color3.fromRGB(155, 89, 182),
    ["МВД"] = Color3.fromRGB(52, 152, 219),
    ["ОПГ"] = Color3.fromRGB(231, 76, 60),
    ["Шахтёр"] = Color3.fromRGB(241, 196, 15)
}

local TeamEmojis = {
    ["Бандит"] = "🔴",
    ["Гражданин"] = "🔵", 
    ["Грузчик"] = "🟠",
    ["Дальнобойщик"] = "🟢",
    ["Доставщик"] = "🟣",
    ["МВД"] = "🔵",
    ["ОПГ"] = "🔴",
    ["Шахтёр"] = "🟡"
}

local function createESP(player, teamName)
    if not player or not player.Character then return end
    
    if ESP.Highlights[player] then
        ESP.Highlights[player]:Destroy()
        ESP.Highlights[player] = nil
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_" .. player.Name
    highlight.Adornee = player.Character
    highlight.Parent = game.CoreGui
    
    local color = TeamColors[teamName] or Color3.fromRGB(255, 255, 255)
    highlight.FillColor = color
    highlight.OutlineColor = color
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    ESP.Highlights[player] = highlight
    
    local function onCharacterAdded(character)
        wait(1)
        if ESP.Enabled[teamName] and ESP.Highlights[player] then
            ESP.Highlights[player].Adornee = character
        end
    end
    
    player.CharacterAdded:Connect(onCharacterAdded)
end

local function removeESP(player)
    if ESP.Highlights[player] then
        ESP.Highlights[player]:Destroy()
        ESP.Highlights[player] = nil
    end
end

local function toggleTeamESP(teamName, state)
    ESP.Enabled[teamName] = state
    
    if state then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Team and player.Team.Name == teamName then
                createESP(player, teamName)
            end
        end
        
        ESP.Connections[teamName] = game.Players.PlayerAdded:Connect(function(player)
            player:WaitForChild("Team")
            wait(1)
            if player.Team and player.Team.Name == teamName then
                createESP(player, teamName)
            end
        end)
        
    else
        for player, highlight in pairs(ESP.Highlights) do
            if player.Team and player.Team.Name == teamName then
                removeESP(player)
            end
        end
        
        if ESP.Connections[teamName] then
            ESP.Connections[teamName]:Disconnect()
            ESP.Connections[teamName] = nil
        end
    end
end

local teams = {"Бандит", "Гражданин", "Грузчик", "Дальнобойщик", "Доставщик", "МВД", "ОПГ", "Шахтёр"}

for _, teamName in pairs(teams) do
    local emoji = TeamEmojis[teamName] or "⚪"
    local ESPToggle = VisualTab:CreateToggle({
        Name = "ESP " .. teamName .. " " .. emoji,
        CurrentValue = false,
        Flag = "ESP_" .. teamName,
        Callback = function(Value)
            toggleTeamESP(teamName, Value)
        end
    })
end

-- ESP для машин
local carESPEnabled = false
local carHighlights = {}

local function toggleCarESP(state)
    carESPEnabled = state
    
    if state then
        local carsFolder = workspace:FindFirstChild("Cars")
        if carsFolder then
            for _, car in pairs(carsFolder:GetChildren()) do
                if car:IsA("Model") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "CarESP_" .. car.Name
                    highlight.Adornee = car
                    highlight.Parent = game.CoreGui
                    highlight.FillColor = Color3.fromRGB(128, 128, 128)
                    highlight.OutlineColor = Color3.fromRGB(128, 128, 128)
                    highlight.FillTransparency = 0.7
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    
                    carHighlights[car] = highlight
                end
            end
        end
        Rayfield:Notify({
            Title = "ESP Cars",
            Content = "ESP для машин активирован!",
            Duration = 3,
            Image = 4483362458
        })
    else
        for car, highlight in pairs(carHighlights) do
            highlight:Destroy()
        end
        carHighlights = {}
        Rayfield:Notify({
            Title = "ESP Cars",
            Content = "ESP для машин отключен!",
            Duration = 3,
            Image = 4483362458
        })
    end
end

local CarESPToggle = VisualTab:CreateToggle({
    Name = "ESP Cars 🚗",
    CurrentValue = false,
    Flag = "CarESP",
    Callback = function(Value)
        toggleCarESP(Value)
    end
})

local CreditLabel = VisualTab:CreateLabel("by https://t.me/vomagla")

Rayfield:Notify({
    Title = "Moscow RP загружен",
    Content = "Скрипт активирован! Ссылка скопирована: https://t.me/vomagla",
    Duration = 5,
    Image = 4483362458
})
