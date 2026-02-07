local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Ждем загрузки игры
repeat wait() until game:IsLoaded()

-- СЕРВИСЫ
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

-- Глобальные настройки
getgenv().Settings = {
    AutoSwing = false,
    AutoEquip = false,
    AutoSpawn = false,
    
    -- Новые настройки
    AutoOpenMenu = false,
    AutoUpgradeSword = false,
    AutoUpgradeShuriken = false,
    AutoUpgradeClass = false,
    AutoUpgradeAscend = false,
    
    WhiteScreen = false,
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteJump = false,
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

-- Рандомные безопасные позиции для фриза
local RandomSafePositions = {
    CFrame.new(9977.63, 53.59, 10140.89),
    CFrame.new(9921.72, 186.20, 10175.55),
    CFrame.new(9874.35, 53.77, 10249.00),
    CFrame.new(9965.47, 63.13, 10236.10),
    CFrame.new(9894.93, 57.52, 10187.69)
}

-- НОВАЯ ПОЗИЦИЯ СПАВНА
local SpawnPosition = CFrame.new(133.63, 157.32, -23.07)

local currentSafePosition = nil
local freezeConnection = nil

-- ==================================================================
-- ИСПРАВЛЕННАЯ ФУНКЦИЯ КЛИКА (ДЛЯ ТЕЛЕФОНОВ)
-- ==================================================================
local function ClickGuiObject(obj)
    if obj and obj.Visible then
        -- Проверка: не скрыта ли кнопка в родительских папках
        local current = obj
        while current.Parent and current.Parent ~= game do
            if current.Parent:IsA("GuiObject") and not current.Parent.Visible then return end
            if current.Parent:IsA("ScreenGui") and not current.Parent.Enabled then return end
            current = current.Parent
        end

        -- СПОСОБ 1: Прямая активация (Работает идеально на Delta/Arceus/Fluxus)
        -- Это заставляет игру думать, что кнопка нажата, даже не кликая мышкой
        local success, _ = pcall(function()
            if getconnections then
                for _, conn in pairs(getconnections(obj.MouseButton1Click)) do conn:Fire() end
                for _, conn in pairs(getconnections(obj.Activated)) do conn:Fire() end
                return true
            end
        end)
        
        -- Если способ 1 сработал, выходим. Если нет - пробуем кликнуть физически.
        if success then 
            task.wait(0.1) -- Маленькая задержка
        end

        -- СПОСОБ 2: Физический клик (Исправлено для МОБАЙЛА)
        -- На телефонах координаты AbsolutePosition обычно верные БЕЗ GuiInset
        local pos = obj.AbsolutePosition + (obj.AbsoluteSize / 2)
        
        VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
        
        -- СПОСОБ 3: Если это ПК (клавиатура/мышь), пробуем кликнуть с учетом полоски меню
        if not UserInputService.TouchEnabled then
            local inset = GuiService:GetGuiInset()
            local posWithInset = pos + inset
            VirtualInputManager:SendMouseButtonEvent(posWithInset.X, posWithInset.Y, 0, true, game, 1)
            task.wait(0.05)
            VirtualInputManager:SendMouseButtonEvent(posWithInset.X, posWithInset.Y, 0, false, game, 1)
        end
    end
end
-- ==================================================================

-- Логика Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if getgenv().Settings.InfiniteJump then
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState("Jumping") end
        end
    end
end)

-- Создание GUI
local Window = Rayfield:CreateWindow({
    Name = "Op Ninja Simulator",
    LoadingTitle = "здарова спс что подписан на канал vomagla",
    LoadingSubtitle = "by vomagla",
    ConfigurationSaving = { Enabled = true, FolderName = "OpNinja", FileName = "Config" }
})

-- Вкладки
local MainTab = Window:CreateTab("Main")
local AutoTab = Window:CreateTab("Auto")
local PlayerTab = Window:CreateTab("Player")
local VisualTab = Window:CreateTab("Visual")
local MiscTab = Window:CreateTab("Misc")

-- ==========================================
-- MAIN TAB
-- ==========================================
local MainSec = MainTab:CreateSection("Automation")

local function getKatana()
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and not table.find({"Shuriken", "InvisibilityTool", "ShadowCloneTool", "TeleportTool"}, tool.Name) then return tool end
    end
    if LocalPlayer.Character then
        for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
            if tool:IsA("Tool") and not table.find({"Shuriken", "InvisibilityTool", "ShadowCloneTool", "TeleportTool"}, tool.Name) then return tool end
        end
    end
    return nil
end

MainTab:CreateToggle({
    Name = "Auto Equip Katana (авто взятие катаны)",
    CurrentValue = false, Flag = "AutoEquip",
    Callback = function(Value)
        getgenv().Settings.AutoEquip = Value
        if Value then
            task.spawn(function()
                repeat task.wait(1)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local katana = getKatana()
                        if katana and katana.Parent == LocalPlayer.Backpack then LocalPlayer.Character.Humanoid:EquipTool(katana) end
                    end
                until not getgenv().Settings.AutoEquip
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Swing Katana (авто атака фарм катаны)",
    CurrentValue = false, Flag = "AutoSwing",
    Callback = function(Value)
        getgenv().Settings.AutoSwing = Value
        if Value then
            task.spawn(function()
                repeat task.wait()
                    local character = LocalPlayer.Character
                    if character then
                        for _, tool in ipairs(character:GetDescendants()) do
                            if tool:IsA("Tool") then tool.Enabled = true; pcall(function() tool:Activate() end) end
                        end
                    end
                until not getgenv().Settings.AutoSwing
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Freeze at Random Safe Zone",
    CurrentValue = false, Flag = "FreezeSafe",
    Callback = function(Value)
        getgenv().Settings.Freeze = Value
        if Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            currentSafePosition = RandomSafePositions[math.random(1, #RandomSafePositions)]
            LocalPlayer.Character.HumanoidRootPart.CFrame = currentSafePosition + Vector3.new(0, 7, 0)
            freezeConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and getgenv().Settings.Freeze then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    hrp.Anchored = true
                    hrp.CFrame = currentSafePosition + Vector3.new(0, 7, 0)
                end
            end)
            Rayfield:Notify({Title = "Frozen!", Content = "Teleported to safe zone", Duration = 3})
        else
            if freezeConnection then freezeConnection:Disconnect() freezeConnection = nil end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Anchored = false
                task.wait(0.5)
                LocalPlayer.Character.HumanoidRootPart.CFrame = SpawnPosition
            end
            Rayfield:Notify({Title = "Spawn!", Content = "Teleported back to spawn", Duration = 3})
        end
    end
})

MainTab:CreateToggle({
    Name = "Hitbox Expander", CurrentValue = false, Flag = "HitboxToggle",
    Callback = function(Value) getgenv().Hitbox.Enabled = Value end
})

MainTab:CreateSlider({
    Name = "Hitbox Size", Range = {3, 100}, Increment = 1, Suffix = "Studs", CurrentValue = 30, Flag = "HitboxSize",
    Callback = function(Value) getgenv().Hitbox.Size = Value end
})

-- ==========================================
-- AUTO TAB
-- ==========================================
local AutoSec = AutoTab:CreateSection("Respawn & Upgrades")

AutoTab:CreateToggle({
    Name = "Auto respawn (Авто нажатие кнопки спавна)",
    CurrentValue = false, Flag = "AutoSpawn",
    Callback = function(Value)
        getgenv().Settings.AutoSpawn = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoSpawn do
                    task.wait(1)
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("SpawnF") and pGui.MainGui.SpawnF:FindFirstChild("RandomSpawnImgBtn")
                    if btn then ClickGuiObject(btn); task.wait(2) end
                end
            end)
        end
    end
})

AutoTab:CreateLabel("______________________")

AutoTab:CreateToggle({
    Name = "Auto Open Menu (Каждые 5 сек)",
    CurrentValue = false, Flag = "AutoOpenMenu",
    Callback = function(Value)
        getgenv().Settings.AutoOpenMenu = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoOpenMenu do
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("OptionsF") and pGui.MainGui.OptionsF:FindFirstChild("UpgradeBtn")
                    if btn then ClickGuiObject(btn) end
                    task.wait(5)
                end
            end)
        end
    end
})

AutoTab:CreateToggle({
    Name = "Auto Upgrade Sword (Каждые 3 сек)",
    CurrentValue = false, Flag = "AutoUpgradeSword",
    Callback = function(Value)
        getgenv().Settings.AutoUpgradeSword = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoUpgradeSword do
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("UpgradeF") and pGui.MainGui.UpgradeF:FindFirstChild("SwordF") and pGui.MainGui.UpgradeF.SwordF:FindFirstChild("SwordImgBtn")
                    if btn then ClickGuiObject(btn) end
                    task.wait(3)
                end
            end)
        end
    end
})

AutoTab:CreateToggle({
    Name = "Auto Upgrade Shuriken (Каждые 9 сек)",
    CurrentValue = false, Flag = "AutoUpgradeShuriken",
    Callback = function(Value)
        getgenv().Settings.AutoUpgradeShuriken = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoUpgradeShuriken do
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("UpgradeF") and pGui.MainGui.UpgradeF:FindFirstChild("ShurikenF") and pGui.MainGui.UpgradeF.ShurikenF:FindFirstChild("ShurikenImgBtn") and pGui.MainGui.UpgradeF.ShurikenF.ShurikenImgBtn:FindFirstChild("UpgradeImg")
                    if btn then ClickGuiObject(btn) end
                    task.wait(9)
                end
            end)
        end
    end
})

AutoTab:CreateToggle({
    Name = "Auto Upgrade Class (Каждые 14 сек)",
    CurrentValue = false, Flag = "AutoUpgradeClass",
    Callback = function(Value)
        getgenv().Settings.AutoUpgradeClass = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoUpgradeClass do
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("UpgradeF") and pGui.MainGui.UpgradeF:FindFirstChild("ClassF") and pGui.MainGui.UpgradeF.ClassF:FindFirstChild("ClassImgBtn")
                    if btn then ClickGuiObject(btn) end
                    task.wait(14)
                end
            end)
        end
    end
})

AutoTab:CreateToggle({
    Name = "Auto Upgrade Ascend (Каждые 43 сек)",
    CurrentValue = false, Flag = "AutoUpgradeAscend",
    Callback = function(Value)
        getgenv().Settings.AutoUpgradeAscend = Value
        if Value then
            task.spawn(function()
                while getgenv().Settings.AutoUpgradeAscend do
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    local btn = pGui and pGui:FindFirstChild("MainGui") and pGui.MainGui:FindFirstChild("UpgradeF") and pGui.MainGui.UpgradeF:FindFirstChild("AscendF") and pGui.MainGui.UpgradeF.AscendF:FindFirstChild("AscendImgBtn")
                    if btn then ClickGuiObject(btn) end
                    task.wait(43)
                end
            end)
        end
    end
})

-- ==========================================
-- PLAYER TAB
-- ==========================================
local PlayerSec = PlayerTab:CreateSection("Movement")

PlayerTab:CreateButton({
    Name = "Teleport Spawn (133.63, 157.32, -23.07)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = SpawnPosition
            Rayfield:Notify({Title = "Teleported!", Content = "At Spawn", Duration = 3})
        end
    end
})

PlayerTab:CreateButton({
    Name = "Teleport Circle Zone",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(403.72, 95.55, -437.88, 0.60, 0.72, -0.32, -0.75, 0.65, 0.06, 0.25, 0.20, 0.94)
            Rayfield:Notify({Title = "Teleported!", Content = "Circle Zone", Duration = 3})
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump (Бесконечный прыжок)", CurrentValue = false, Flag = "InfJump",
    Callback = function(Value) getgenv().Settings.InfiniteJump = Value end
})

PlayerTab:CreateSlider({
    Name = "WalkSpeed", Range = {16, 500}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "WalkSpeed",
    Callback = function(Value) getgenv().Settings.WalkSpeed = Value end
})
PlayerTab:CreateSlider({
    Name = "Jump Power", Range = {50, 500}, Increment = 1, Suffix = "Power", CurrentValue = 50, Flag = "JumpPower",
    Callback = function(Value) getgenv().Settings.JumpPower = Value end
})

-- ==========================================
-- VISUAL TAB
-- ==========================================
local VisualSec = VisualTab:CreateSection("ESP")
VisualTab:CreateToggle({
    Name = "Player ESP (Highlights)",
    CurrentValue = false, Flag = "ESP",
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
                if player.Character and player.Character:FindFirstChild("ESPHighlight") then player.Character.ESPHighlight:Destroy() end
            end
        end
    end
})

-- НОВАЯ КНОПКА ANTI AFK
VisualTab:CreateButton({
    Name = "anti afk",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/ANTI%20AFK.md"))()
        Rayfield:Notify({Title = "Anti AFK", Content = "Activated! (by vomagla)", Duration = 3})
    end
})

VisualTab:CreateButton({
    Name = "актирировать Anti Lag. у вас будет черный экран нажмите на слово посередине внизу     нажми на эту кнопка чтобы включить анти лаг)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/z4tt483/ItzXery.lua/main/AntiLag-ItzXery.lua"))()
        Rayfield:Notify({Title = "Anti Lag", Content = "Activated! (ItzXery)", Duration = 3})
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
MiscTab:CreateLabel("включите авто взятие катаны и авто фарм катаны и телепорт в рандомную безопасную зону для полного авто фарма")

Rayfield:Notify({
    Title = "АНТИ АФК ВО ВКЛАДКЕ visual✅",
    Content = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1!",
    Duration = 4,
    Image = 4483362458
})

-- 5 СООБЩЕНИЙ ПРИ СТАРТЕ
for i = 1, 5 do
    Rayfield:Notify({
        Title = "ВАЖНО!!!",
        Content = "НЕЗАБУДЬ ВКЛЮЧИТЬ АНТИ АФК!!!!!!!!!!!!!!!!!!!!!",
        Duration = 5,
        Image = 4483362458
    })
    task.wait(0.3)
end
