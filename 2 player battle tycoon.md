local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local MainWindow = Library:NewWindow("2 Player Battle Tycoon")

setclipboard("https://t.me/vomagla")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

getgenv().settings = {
    swing_aura = false,
    max_distance = 10,
    esp_enabled = false,
    speed_val = 0,
    target_kill = false,
    target_name = "",
    target_distance = 1000
}

-- ==================== VISUAL AURA PART ====================
local VisualPart = Instance.new("Part")
VisualPart.Name = "AuraVisualizer"
VisualPart.Shape = Enum.PartType.Cylinder
VisualPart.Material = Enum.Material.ForceField
VisualPart.Color = Color3.fromRGB(255, 0, 0)
VisualPart.Transparency = 0.5
VisualPart.Anchored = true
VisualPart.CanCollide = false
VisualPart.CastShadow = false
VisualPart.Parent = workspace
VisualPart.Position = Vector3.new(0, -1000, 0)

RunService.RenderStepped:Connect(function()
    if getgenv().settings.swing_aura and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        -- Круг всегда горизонтальный, игнорирует наклон персонажа
        VisualPart.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, 0, math.rad(90))
        VisualPart.Size = Vector3.new(0.5, getgenv().settings.max_distance * 2, getgenv().settings.max_distance * 2)
    else
        VisualPart.Position = Vector3.new(0, -1000, 0)
    end
end)

-- ==================== COMBAT SECTION ====================
local CombatSection = MainWindow:NewSection("Combat")

CombatSection:CreateToggle("Enable Sword Aura", function(value)
    getgenv().settings.swing_aura = value
end)

CombatSection:CreateTextbox("Aura Distance", function(text)
    local new_distance = tonumber(text)
    if new_distance then
        getgenv().settings.max_distance = new_distance
    end
end)

task.spawn(function()
    while true do
        if getgenv().settings.swing_aura then
            local targets = {}
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and LocalPlayer.Character and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                    local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetRoot = v.Character:FindFirstChild("HumanoidRootPart")

                    if myRoot and targetRoot then
                        local distance = (targetRoot.Position - myRoot.Position).Magnitude
                        if distance < getgenv().settings.max_distance then
                            table.insert(targets, v.Character)
                        end
                    end
                end
            end

            for _, target_char in pairs(targets) do
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") and target_char:FindFirstChildWhichIsA("BasePart") then
                    if tool:FindFirstChild("Use") then
                        tool.Use:FireServer()
                    end
                    firetouchinterest(tool.Handle, target_char:FindFirstChildWhichIsA("BasePart"), 0)
                    firetouchinterest(tool.Handle, target_char:FindFirstChildWhichIsA("BasePart"), 1)
                end
            end
        end
        task.wait()
    end
end)

-- ==================== TARGET KILL SECTION ====================
local TargetSection = MainWindow:NewSection("Target")

TargetSection:CreateTextbox("Target Name (nick)", function(text)
    getgenv().settings.target_name = text
end)

TargetSection:CreateToggle("auto Target Kill", function(value)
    getgenv().settings.target_kill = value
end)

TargetSection:CreateButton("Teleport to Target", function()
    local tName = getgenv().settings.target_name
    if tName == "" then return end

    local targetPlayer = Players:FindFirstChild(tName)
    if not targetPlayer then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and string.lower(plr.Name):find(string.lower(tName)) then
                targetPlayer = plr
                break
            end
        end
    end

    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 2)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Таргет не найден или мертв",
            Duration = 3
        })
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    local tName = getgenv().settings.target_name
    if tName ~= "" then
        if plr.Name == tName or string.find(string.lower(plr.Name), string.lower(tName)) then
            game.StarterGui:SetCore("SendNotification", {
                Title = plr.Name, 
                Text = "таргет ливнул", 
                Duration = 3 
            })
        end
    end
end)

-- Target Kill Loop
task.spawn(function()
    while true do
        if getgenv().settings.target_kill and getgenv().settings.target_name ~= "" then
            local targetPlayer = nil
            targetPlayer = Players:FindFirstChild(getgenv().settings.target_name)

            if not targetPlayer then
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and string.lower(plr.Name):find(string.lower(getgenv().settings.target_name)) then
                        targetPlayer = plr
                        break
                    end
                end
            end

            if targetPlayer and targetPlayer ~= LocalPlayer and targetPlayer.Character then
                local targetHum = targetPlayer.Character:FindFirstChild("Humanoid")
                local targetPart = targetPlayer.Character:FindFirstChildWhichIsA("BasePart")
                local myChar = LocalPlayer.Character

                if myChar and targetHum and targetHum.Health > 0 and targetPart then
                    local tool = myChar:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Handle") then
                        local originalCFrame = tool.Handle.CFrame
                        tool.Handle.CFrame = targetPart.CFrame
                        
                        if tool:FindFirstChild("Use") then
                            tool.Use:FireServer()
                        end

                        firetouchinterest(tool.Handle, targetPart, 0)
                        firetouchinterest(tool.Handle, targetPart, 1)

                        tool.Handle.CFrame = originalCFrame
                    end
                end
            end
        end
        task.wait()
    end
end)

-- ==================== MOVEMENT SECTION ====================
local MovementSection = MainWindow:NewSection("Movement")

MovementSection:CreateTextbox("Speed (1-10)", function(text)
    local num = tonumber(text)
    if num then
        getgenv().settings.speed_val = num
    end
end)

MovementSection:CreateButton("Fly / Noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/fly.md", true))()
end)

MovementSection:CreateButton("Teleport Flag", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29.08, 48.87, -92.59)
    end
end)

RunService.Heartbeat:Connect(function()
    local chr = LocalPlayer.Character
    if chr then
        local hum = chr:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 and getgenv().settings.speed_val > 0 then
            chr:TranslateBy(hum.MoveDirection * (getgenv().settings.speed_val * 0.2))
        end
    end
end)

-- ==================== VISUALS SECTION ====================
local VisualsSection = MainWindow:NewSection("Visuals")

local function UpdateESP()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            -- 1. Подсветка (Highlight)
            local highlight = plr.Character:FindFirstChild("FelixHighlight")
            -- 2. Текст с ником (BillboardGui)
            local nameTag = plr.Character:FindFirstChild("FelixNameTag")

            if getgenv().settings.esp_enabled then
                -- Создаем Highlight, если нет
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "FelixHighlight"
                    highlight.Adornee = plr.Character
                    highlight.Parent = plr.Character
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                end

                -- Создаем NameTag, если нет
                if not nameTag then
                    nameTag = Instance.new("BillboardGui")
                    nameTag.Name = "FelixNameTag"
                    nameTag.Parent = plr.Character
                    nameTag.Adornee = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("HumanoidRootPart")
                    nameTag.Size = UDim2.new(0, 200, 0, 50)
                    nameTag.StudsOffset = Vector3.new(0, 3, 0)
                    nameTag.AlwaysOnTop = true

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = nameTag
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextStrokeTransparency = 0 -- Черная обводка текста для читаемости
                    textLabel.TextSize = 14
                    textLabel.Font = Enum.Font.SourceSansBold
                end

                -- Обновляем цвета и текст
                local teamColor = Color3.new(1, 1, 1)
                if plr.TeamColor then
                    teamColor = plr.TeamColor.Color
                end

                -- Настройка Highlight
                highlight.FillColor = teamColor
                highlight.OutlineColor = teamColor

                -- Настройка Текста
                local textLabel = nameTag:FindFirstChildOfClass("TextLabel")
                if textLabel then
                    textLabel.Text = plr.Name
                    textLabel.TextColor3 = teamColor
                end
            else
                -- Если ESP выключен, удаляем всё
                if highlight then highlight:Destroy() end
                if nameTag then nameTag:Destroy() end
            end
        end
    end
end

VisualsSection:CreateToggle("ESP Players", function(value)
    getgenv().settings.esp_enabled = value
    UpdateESP()
end)

Players.PlayerAdded:Connect(function()
    task.wait(1)
    UpdateESP()
end)

-- Обновляем ESP каждую секунду, чтобы следить за сменой команд и новыми игроками
task.spawn(function()
    while task.wait(1) do
        if getgenv().settings.esp_enabled then
            UpdateESP()
        end
    end
end)
