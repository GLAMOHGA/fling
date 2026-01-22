--чо тут делаешь--

-- да я сделал этот скрипт с ии зато все работает и это самый лучший скрипт которые есть на эту игру--

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Ждем загрузки игры
repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- Глобальные настройки
getgenv().Settings = {
    AutoSwing = false,
    AutoEquip = false,
    WhiteScreen = false,
    WalkSpeed = 16,
    JumpPower = 50,
    Gravity = 196.2,
    Freeze = false
}

getgenv().Hitbox = {
    Enabled = false,
    Size = 30,
    Transparency = 0.5,
    Color = Color3.new(1,1,1)
}

getgenv().ESP = {
    Enabled = false
}

getgenv().Charms = {
    Enabled = false,
    TeamColor = false,
    Color = Color3.new(1,1,1),
    Outline = Color3.new(0,0,0)
}

-- Безопасная зона (БЕЗ радуги)
local SafePart = nil
local freezeConnection = nil
pcall(function()
    SafePart = Instance.new("Part")
    SafePart.Parent = Workspace
    SafePart.Anchored = true
    SafePart.Size = Vector3.new(150, 5, 150)
    SafePart.CFrame = CFrame.new(9999 + math.random(-500,500), 50, 9999 + math.random(-500,500))
    SafePart.Material = Enum.Material.ForceField
    SafePart.CanCollide = true
    SafePart.BrickColor = BrickColor.new("Bright green")
    SafePart.Color = Color3.fromRGB(0, 255, 0) -- Фиксированный зеленый цвет
    
    local bodyPosition = Instance.new("BodyPosition")
    bodyPosition.MaxForce = Vector3.new(0, math.huge, 0)
    bodyPosition.Position = SafePart.Position
    bodyPosition.Parent = SafePart
end)

-- Создание GUI
local Window = Rayfield:CreateWindow({
    Name = "Op Ninja Simulator",
    LoadingTitle = "здарова спс что подписан на канал vomagla",
    LoadingSubtitle = "by vomagla",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "OpNinja",
        FileName = "Config"
    }
})

-- Вкладки
local MainTab = Window:CreateTab("Main")
local PlayerTab = Window:CreateTab("Player")
local VisualTab = Window:CreateTab("Visual")
local MiscTab = Window:CreateTab("Misc")

-- Главная вкладка
local MainSec = MainTab:CreateSection("Automation")

-- Функция поиска катаны
local function getKatana()
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and not table.find({"Shuriken", "InvisibilityTool", "ShadowCloneTool", "TeleportTool"}, tool.Name) then
            return tool
        end
    end
    if LocalPlayer.Character then
        for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and not table.find({"Shuriken", "InvisibilityTool", "ShadowCloneTool", "TeleportTool"}, tool.Name) then
                return tool
            end
        end
    end
    return nil
end

-- Auto Equip Katana
MainTab:CreateToggle({
    Name = "Auto Equip Katana (авто взятие катаны)",
    CurrentValue = false,
    Flag = "AutoEquip",
    Callback = function(Value)
        getgenv().Settings.AutoEquip = Value
        if Value then
            task.spawn(function()
                repeat
                    task.wait(1)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local katana = getKatana()
                        if katana and katana.Parent == LocalPlayer.Backpack then
                            LocalPlayer.Character.Humanoid:EquipTool(katana)
                        end
                    end
                until not getgenv().Settings.AutoEquip
            end)
        end
    end
})

-- УЛУЧШЕННЫЙ Auto Swing
MainTab:CreateToggle({
    Name = "Auto Swing Katana (авто атака фарм катаны)",
    CurrentValue = false,
    Flag = "AutoSwing",
    Callback = function(Value)
        getgenv().Settings.AutoSwing = Value
        if Value then
            task.spawn(function()
                repeat
                    task.wait()
                    local character = LocalPlayer.Character
                    if character then
                        for _, tool in ipairs(character:GetDescendants()) do
                            if tool:IsA("Tool") then
                                tool.Enabled = true
                                pcall(function()
                                    tool:Activate()
                                end)
                            end
                        end
                    end
                until not getgenv().Settings.AutoSwing
            end)
        end
    end
})

-- ТП с заморозкой
MainTab:CreateToggle({
    Name = "Freeze at Safe Zone (телепорт в безопасную зону)",
    CurrentValue = false,
    Flag = "FreezeSafe",
    Callback = function(Value)
        getgenv().Settings.Freeze = Value
        if Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and SafePart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = SafePart.CFrame + Vector3.new(0, 7, 0)
            freezeConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    hrp.Anchored = true
                    hrp.CFrame = SafePart.CFrame + Vector3.new(0, 7, 0)
                end
            end)
            Rayfield:Notify({
                Title = "Frozen!",
                Content = "Teleported and FREEZED at safe zone",
                Duration = 3
            })
        elseif freezeConnection then
            freezeConnection:Disconnect()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
            Rayfield:Notify({
                Title = "Unfrozen!",
                Content = "Movement restored",
                Duration = 2
            })
        end
    end
})

-- Hitbox
MainTab:CreateToggle({
    Name = "Hitbox Expander",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        getgenv().Hitbox.Enabled = Value
    end
})

MainTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {3, 100},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 30,
    Flag = "HitboxSize",
    Callback = function(Value)
        getgenv().Hitbox.Size = Value
    end
})

-- Player Tab
local PlayerSec = PlayerTab:CreateSection("Movement")
PlayerTab:CreateSlider({
    Name = "WalkSpeed", Range = {16, 500}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "WalkSpeed",
    Callback = function(Value) getgenv().Settings.WalkSpeed = Value end
})
PlayerTab:CreateSlider({
    Name = "Jump Power", Range = {50, 500}, Increment = 1, Suffix = "Power", CurrentValue = 50, Flag = "JumpPower",
    Callback = function(Value) getgenv().Settings.JumpPower = Value end
})
PlayerTab:CreateSlider({
    Name = "Gravity", Range = {0, 196.2}, Increment = 0.1, Suffix = "Gravity", CurrentValue = 196.2, Flag = "Gravity",
    Callback = function(Value) getgenv().Settings.Gravity = Value end
})

-- Visual Tab - ESP
local VisualSec = VisualTab:CreateSection("ESP")
VisualTab:CreateToggle({
    Name = "Player ESP (Highlights)",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        getgenv().ESP.Enabled = Value
        if Value then
            RunService.Heartbeat:Connect(function()
                if not getgenv().ESP.Enabled then return end
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if not player.Character:FindFirstChild("ESPHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ESPHighlight"
                            highlight.Parent = player.Character
                            highlight.FillColor = Color3.fromRGB(0, 255, 0)
                            highlight.FillTransparency = 0.5
                            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
                            highlight.OutlineTransparency = 0
                        end
                    end
                end
            end)
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESPHighlight") then
                    player.Character.ESPHighlight:Destroy()
                end
            end
        end
    end
})

VisualTab:CreateButton({
    Name = "Anti Lag (у вас будет загружаться скрипт 10 секунд. ждите)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/z4tt483/ItzXery.lua/main/AntiLag-ItzXery.lua"))()
        Rayfield:Notify({
            Title = "Anti Lag",
            Content = "Activated! (ItzXery)",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Движение
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and not getgenv().Settings.Freeze then
        local hum = LocalPlayer.Character.Humanoid
        hum.WalkSpeed = getgenv().Settings.WalkSpeed
        hum.JumpPower = getgenv().Settings.JumpPower
        if not hum.UseJumpPower then hum.UseJumpPower = true end
    end
    Workspace.Gravity = getgenv().Settings.Gravity
end)

-- Hitbox
RunService.Stepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            if getgenv().Hitbox.Enabled then
                hrp.Size = Vector3.new(getgenv().Hitbox.Size, getgenv().Hitbox.Size, getgenv().Hitbox.Size)
                hrp.Transparency = getgenv().Hitbox.Transparency
                hrp.Color = getgenv().Hitbox.Color
                hrp.CanCollide = false
                hrp.Material = Enum.Material.ForceField
            else
                hrp.Size = Vector3.new(2,2,1)
                hrp.Transparency = 1
                hrp.CanCollide = false
            end
        end
    end
end)

-- Кредиты
MiscTab:CreateLabel("Script by vomagla")
MiscTab:CreateLabel("скрипт создал создатель канала: https://t.me/vomagla")
MiscTab:CreateLabel("включите авто взятие канаты и авто фарм катана и телепорт в бозопасную зону. для полного авто фарма")

Rayfield:Notify({
    Title = "Loaded! ✅",
    Content = "Op Ninja Simulator by vomagla готово!",
    Duration = 4,
    Image = 4483362458
})
