-- Сначала попробуем загрузить Rayfield
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
end)

if not success then
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end

-- Создаем окно ДО баннера
local Window = Rayfield:CreateWindow({
    Name = "The Floor Is LAVA!🔥",
    LoadingTitle = "The Floor Is LAVA!",
    LoadingSubtitle = "by https://t.me/vomagla",
})

-- Теперь добавляем баннер
local a = game.Players.LocalPlayer
local b = Instance.new("ScreenGui", a.PlayerGui)
b.ResetOnSpawn = false
local c = Instance.new("ImageLabel", b)
c.Image = "http://www.roblox.com/asset/?id=117783035423570"
c.Size = UDim2.new(0, 350, 0, 400)
c.Position = UDim2.new(1, -160, 0, 10)
c.AnchorPoint = Vector2.new(1, 0)
c.BackgroundTransparency = 1

-- Удаляем баннер через 10 секунд
task.spawn(function()
    task.wait(10)
    c:Destroy()
    b:Destroy()
end)

-- Вкладки
local MainTab = Window:CreateTab("Main", "flame")
local PlayerTab = Window:CreateTab("Player", "user")
local TeleportTab = Window:CreateTab("Teleport", "map-pin")
local OtherTab = Window:CreateTab("Other", "settings")

-- Глобальные переменные
_G.SavedWalkSpeed = 16
_G.Noclip = false
_G.InfJump = false
_G.AutoCollect = false
_G.AutoFarm = false
_G.farming = false

-- Вкладка Main
local MainSection = MainTab:CreateSection("Items")

-- Функция Get All Items
local GetAllItemsButton = MainTab:CreateButton({
    Name = "Get All Items",
    Callback = function()
        local Backpack = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
        local alreadyGiven = {}
        local itemsFound = 0
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") and v.Parent.Parent ~= game.Players.LocalPlayer then
                if not alreadyGiven[v.Name] then
                    local success, errorMessage = pcall(function()
                        local clone = v:Clone()
                        clone.Parent = Backpack
                    end)
                    
                    if success then
                        alreadyGiven[v.Name] = true
                        itemsFound = itemsFound + 1
                    end
                end
            end
        end
    end,
})

-- Секция Auto Collect
local AutoCollectSection = MainTab:CreateSection("Auto Functions")

-- Toggle для Auto Collect
local AutoCollectToggle = MainTab:CreateToggle({
    Name = "Auto Collect Coins",
    CurrentValue = false,
    Flag = "AutoCollectToggle",
    Callback = function(value)
        _G.AutoCollect = value
    end,
})

-- Toggle для Auto Farm
local AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(value)
        _G.AutoFarm = value
        if value then
            Rayfield:Notify({
                Title = "Auto Farm",
                Content = "Включите Auto Collect Coins для полного фарма",
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})

-- Функция сбора монет
local function collectCoins()
    if _G.farming then return end
    _G.farming = true
    
    local LP = game:GetService("Players").LocalPlayer
    local char = LP.Character
    if not char then 
        _G.farming = false
        return 
    end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        _G.farming = false
        return 
    end
    
    local map = workspace:FindFirstChild("CurrentMap")
    if not map then 
        _G.farming = false
        return 
    end
    
    if _G.AutoCollect then
        for _, area in pairs(map:GetChildren()) do
            local coins = area:FindFirstChild("Coins")
            if coins then
                for _, coin in pairs(coins:GetChildren()) do
                    if coin:IsA("BasePart") and _G.AutoCollect then
                        firetouchinterest(hrp, coin, 0)
                        firetouchinterest(hrp, coin, 1)
                        task.wait(0.05)
                    end
                end
            end
        end
    end
    
    _G.farming = false
end

-- Функция Auto Farm
local function autoFarm()
    if _G.farming then return end
    _G.farming = true
    
    local LP = game:GetService("Players").LocalPlayer
    local char = LP.Character
    if not char then 
        _G.farming = false
        return 
    end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        _G.farming = false
        return 
    end
    
    -- Телепорт в точку фарма с правильными параметрами
    local farmCFrame = CFrame.new(
        39.3792381, 
        72.0706253, 
        -557.929016,
        -1, 0, 0,
        0, 1, 0,
        0, 0, -1
    )
    
    hrp.CFrame = farmCFrame
    task.wait(0.5)
    
    -- Сбор монет если включено
    if _G.AutoCollect then
        collectCoins()
    end
    
    _G.farming = false
end

-- Цикл сбора монет
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoCollect then
            collectCoins()
        end
    end
end)

-- Цикл Auto Farm
task.spawn(function()
    while task.wait(2) do
        if _G.AutoFarm then
            autoFarm()
        end
    end
end)

-- Вкладка Player
local PlayerSection = PlayerTab:CreateSection("Player Modifications")

local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 5,
    Suffix = "studs",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        _G.SavedWalkSpeed = Value
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local NoclipToggle = PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        _G.Noclip = Value
    end,
})

game:GetService('RunService').Stepped:Connect(function()
    if _G.Noclip and game.Players.LocalPlayer.Character then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA('BasePart') then
                v.CanCollide = false
            end
        end
    end
end)

local InfJumpToggle = PlayerTab:CreateToggle({
    Name = "Inf Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle",
    Callback = function(Value)
        _G.InfJump = Value
        
        if _G.InfJumpConnection then
            _G.InfJumpConnection:Disconnect()
            _G.InfJumpConnection = nil
        end
        
        if Value then
            local UIS = game:GetService("UserInputService")
            local Player = game.Players.LocalPlayer
            
            _G.InfJumpConnection = UIS.InputBegan:Connect(function(input, gameProcessed)
                if _G.InfJump and not gameProcessed and input.KeyCode == Enum.KeyCode.Space then
                    local character = Player.Character
                    if character and character:FindFirstChild("Humanoid") then
                        character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        end
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.1)
    
    if _G.SavedWalkSpeed then
        character.Humanoid.WalkSpeed = _G.SavedWalkSpeed
    end
end)

if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SavedWalkSpeed
end

-- Вкладка Teleport
local TeleportSection = TeleportTab:CreateSection("Teleport Locations")

local TPSpawnButton = TeleportTab:CreateButton({
    Name = "TP Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(-0.66, 60.88, -241.30)
            end
        end
    end,
})

local TPUnknownButton = TeleportTab:CreateButton({
    Name = "TP ???",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(-5.99, 109.30, -308.37)
            end
        end
    end,
})

local TPMapButton = TeleportTab:CreateButton({
    Name = "TP Map",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(4.58, 4.03, 6.92)
            end
        end
    end,
})

local TPFarmButton = TeleportTab:CreateButton({
    Name = "TP obby end",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local farmCFrame = CFrame.new(
                    39.3792381, 
                    72.0706253, 
                    -557.929016,
                    -1, 0, 0,
                    0, 1, 0,
                    0, 0, -1
                )
                humanoidRootPart.CFrame = farmCFrame
            end
        end
    end,
})

-- Вкладка Other
local OtherSection = OtherTab:CreateSection("VIP Door Removal")

local DeleteVIPButton = OtherTab:CreateButton({
    Name = "Delete VIP Door",
    Callback = function()
        local targetSize = Vector3.new(3.1777453422546387, 15.533637046813965, 21.19416618347168)
        local targetTransparency = 0.75
        
        local foundDoors = {}
        local deletedCount = 0
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Part") then
                local sizeMatch = false
                local transparencyMatch = false
                
                if math.abs(obj.Size.X - targetSize.X) < 0.5 and
                   math.abs(obj.Size.Y - targetSize.Y) < 0.5 and
                   math.abs(obj.Size.Z - targetSize.Z) < 0.5 then
                    sizeMatch = true
                end
                
                if math.abs(obj.Transparency - targetTransparency) < 0.1 then
                    transparencyMatch = true
                end
                
                if (sizeMatch and transparencyMatch) or 
                   (sizeMatch and obj.Transparency > 0.5) or
                   (transparencyMatch and 
                    math.abs(obj.Size.X - targetSize.X) < 2 and
                    math.abs(obj.Size.Y - targetSize.Y) < 2 and
                    math.abs(obj.Size.Z - targetSize.Z) < 2) then
                    
                    if obj.Size.Y > obj.Size.X and obj.Size.Y > obj.Size.Z then
                        table.insert(foundDoors, obj)
                    end
                end
            end
        end
        
        if #foundDoors == 0 then
            for _, obj in pairs(workspace:GetDescendants()) do
                local name = string.lower(obj.Name)
                if string.find(name, "vip") or string.find(name, "door") or 
                   string.find(name, "gate") or string.find(name, "entrance") then
                    
                    if obj:IsA("Part") or obj:IsA("Model") then
                        table.insert(foundDoors, obj)
                    end
                end
            end
        end
        
        for _, obj in pairs(foundDoors) do
            local success = pcall(function()
                if obj:IsA("Model") then
                    obj:Destroy()
                else
                    obj:Destroy()
                end
                deletedCount = deletedCount + 1
            end)
            
            if not success then
                pcall(function()
                    obj.Parent = nil
                    deletedCount = deletedCount + 1
                end)
            end
        end
    end,
})
