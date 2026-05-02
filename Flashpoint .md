local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local function createMainUI()
    local Window = Library:CreateWindow({
        Title = "Flashpoint World's Collide Script | By Jolly",
        Center = true,
        AutoShow = true,
        TabPadding = 4,
        MenuFadeTime = 0.7,
        Size = UDim2.new(0, 600, 0, 600)
    })

    local Tabs = {
        Main = Window:AddTab("Main"),
        Teleport = Window:AddTab("Teleport"),
        Visual = Window:AddTab("Visual"),
        Misc = Window:AddTab("Misc")
    }

    -- MAIN TAB - STAT BOOSTS
    local MainGroup = Tabs.Main:AddLeftGroupbox("Stat Boosts")

    local OriginalValues = {}
    local function safeBackupStat(statName)
        local success, value = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerData.Upgrades[statName].Value
        end)
        if success then
            OriginalValues[statName] = value
        else
            OriginalValues[statName] = 0
        end
    end

    safeBackupStat("Speed")
    safeBackupStat("Health") 
    safeBackupStat("Flashtime Speed")
    safeBackupStat("Damage")
    safeBackupStat("Boost Speed")
    safeBackupStat("Boost Duration")

    local RebirthOriginalValues = {}
    local function safeBackupRebirthStat(statName)
        local success, value = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades[statName].Value
        end)
        if success then
            RebirthOriginalValues[statName] = value
        else
            RebirthOriginalValues[statName] = 0
        end
    end

    safeBackupRebirthStat("Speed")
    safeBackupRebirthStat("Health") 
    safeBackupRebirthStat("Flashtime Speed")
    safeBackupRebirthStat("Damage")
    safeBackupRebirthStat("Boost Speed")
    safeBackupRebirthStat("Boost Duration")

    -- Переменные для отслеживания состояния
    local StatBoostsEnabled = {
        Speed = false,
        Health = false,
        FlashtimeSpeed = false,
        Damage = false,
        BoostSpeed = false,
        BoostDuration = false
    }

    MainGroup:AddToggle("EnableSpeed", {
        Text = "Enable Speed Boost",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.Speed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Speed.Value = OriginalValues.Speed
                end)
            end
        end
    })

    MainGroup:AddSlider("SpeedSlider", {
        Text = "Speed",
        Default = OriginalValues.Speed or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.Speed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Speed.Value = Value
                end)
            end
        end
    })

    MainGroup:AddToggle("EnableHealth", {
        Text = "Enable Health Boost",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.Health = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Health.Value = OriginalValues.Health
                end)
            end
        end
    })

    MainGroup:AddSlider("HealthSlider", {
        Text = "Health",
        Default = OriginalValues.Health or 0,
        Min = 0.2,
        Max = 50,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.Health then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Health.Value = Value
                end)
            end
        end
    })

    MainGroup:AddToggle("EnableFlashtimeSpeed", {
        Text = "Enable Flashtime Speed",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.FlashtimeSpeed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Flashtime Speed"].Value = OriginalValues["Flashtime Speed"]
                end)
            end
        end
    })

    MainGroup:AddSlider("FlashtimeSpeedSlider", {
        Text = "Flashtime Speed",
        Default = OriginalValues["Flashtime Speed"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.FlashtimeSpeed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Flashtime Speed"].Value = Value
                end)
            end
        end
    })

    MainGroup:AddToggle("EnableDamage", {
        Text = "Enable Damage Boost",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.Damage = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Damage.Value = OriginalValues.Damage
                end)
            end
        end
    })

    MainGroup:AddSlider("DamageSlider", {
        Text = "Damage",
        Default = OriginalValues.Damage or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.Damage then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Damage.Value = Value
                end)
            end
        end
    })

    MainGroup:AddToggle("EnableBoostSpeed", {
        Text = "Enable Boost Speed",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.BoostSpeed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Boost Speed"].Value = OriginalValues["Boost Speed"]
                end)
            end
        end
    })

    MainGroup:AddSlider("BoostSpeedSlider", {
        Text = "Boost Speed",
        Default = OriginalValues["Boost Speed"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.BoostSpeed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Boost Speed"].Value = Value
                end)
            end
        end
    })

    MainGroup:AddToggle("EnableBoostDur", {
        Text = "Enable Boost Duration",
        Default = false,
        Callback = function(State)
            StatBoostsEnabled.BoostDuration = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Boost Duration"].Value = OriginalValues["Boost Duration"]
                end)
            end
        end
    })

    MainGroup:AddSlider("BoostDurSlider", {
        Text = "Boost Duration",
        Default = OriginalValues["Boost Duration"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if StatBoostsEnabled.BoostDuration then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.Upgrades["Boost Duration"].Value = Value
                end)
            end
        end
    })

    -- ABILITIES
    local AbilitiesGroup = Tabs.Main:AddLeftGroupbox("Abilities")

    AbilitiesGroup:AddToggle("ArmTornado", {
        Text = "Arm Tornado",
        Default = false,
        Callback = function(State)
            pcall(function()
                if State then
                    game:GetService("Players").LocalPlayer.PlayerData.Abilities.ArmTornado.Value = 3
                else
                    game:GetService("Players").LocalPlayer.PlayerData.Abilities.ArmTornado.Value = 0
                end
            end)
        end
    })

    AbilitiesGroup:AddToggle("LightningThrow", {
        Text = "Lightning Throw",
        Default = false,
        Callback = function(State)
            pcall(function()
                if State then
                    game:GetService("Players").LocalPlayer.PlayerData.Abilities.LightningThrow.Value = 3
                else
                    game:GetService("Players").LocalPlayer.PlayerData.Abilities.LightningThrow.Value = 0
                end
            end)
        end
    })

    -- REBIRTH UPGRADES
    local RebirthGroup = Tabs.Main:AddRightGroupbox("Rebirth Upgrades")

    local RebirthBoostsEnabled = {
        Speed = false,
        Health = false,
        FlashtimeSpeed = false,
        Damage = false,
        BoostSpeed = false,
        BoostDuration = false
    }

    RebirthGroup:AddToggle("EnableRebirthSpeed", {
        Text = "Enable Rebirth Speed",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.Speed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Speed.Value = RebirthOriginalValues.Speed
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthSpeedSlider", {
        Text = "Rebirth Speed",
        Default = RebirthOriginalValues.Speed or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.Speed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Speed.Value = Value
                end)
            end
        end
    })

    RebirthGroup:AddToggle("EnableRebirthHealth", {
        Text = "Enable Rebirth Health",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.Health = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Health.Value = RebirthOriginalValues.Health
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthHealthSlider", {
        Text = "Rebirth Health",
        Default = RebirthOriginalValues.Health or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.Health then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Health.Value = Value
                end)
            end
        end
    })

    RebirthGroup:AddToggle("EnableRebirthFlashtimeSpeed", {
        Text = "Enable Rebirth Flashtime Speed",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.FlashtimeSpeed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Flashtime Speed"].Value = RebirthOriginalValues["Flashtime Speed"]
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthFlashtimeSpeedSlider", {
        Text = "Rebirth Flashtime Speed",
        Default = RebirthOriginalValues["Flashtime Speed"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.FlashtimeSpeed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Flashtime Speed"].Value = Value
                end)
            end
        end
    })

    RebirthGroup:AddToggle("EnableRebirthDamage", {
        Text = "Enable Rebirth Damage",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.Damage = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Damage.Value = RebirthOriginalValues.Damage
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthDamageSlider", {
        Text = "Rebirth Damage",
        Default = RebirthOriginalValues.Damage or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.Damage then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades.Damage.Value = Value
                end)
            end
        end
    })

    RebirthGroup:AddToggle("EnableRebirthBoostSpeed", {
        Text = "Enable Rebirth Boost Speed",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.BoostSpeed = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Boost Speed"].Value = RebirthOriginalValues["Boost Speed"]
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthBoostSpeedSlider", {
        Text = "Rebirth Boost Speed",
        Default = RebirthOriginalValues["Boost Speed"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.BoostSpeed then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Boost Speed"].Value = Value
                end)
            end
        end
    })

    RebirthGroup:AddToggle("EnableRebirthBoostDur", {
        Text = "Enable Rebirth Boost Duration",
        Default = false,
        Callback = function(State)
            RebirthBoostsEnabled.BoostDuration = State
            if not State then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Boost Duration"].Value = RebirthOriginalValues["Boost Duration"]
                end)
            end
        end
    })

    RebirthGroup:AddSlider("RebirthBoostDurSlider", {
        Text = "Rebirth Boost Duration",
        Default = RebirthOriginalValues["Boost Duration"] or 0,
        Min = 0.2,
        Max = 100000,
        Rounding = 1,
        Callback = function(Value)
            if RebirthBoostsEnabled.BoostDuration then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades["Boost Duration"].Value = Value
                end)
            end
        end
    })

    -- MISC & GAMEPASSES
    local MiscMainGroup = Tabs.Main:AddLeftGroupbox("Misc")

    MiscMainGroup:AddToggle("SuitBypass", {
        Text = "Unlock All",
        Default = false,
        Callback = function(State)
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerData.Misc.SuitBypass.Value = State
            end)
        end
    })

    local GamepassesGroup = Tabs.Main:AddLeftGroupbox("Gamepasses")

    GamepassesGroup:AddToggle("Gamepass2XSkillPoints", {
        Text = "2X SKILLPOINTS",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "2X SKILLPOINTS"
                    intValue.Value = 912780880
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("2X SKILLPOINTS") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["2X SKILLPOINTS"]:Destroy()
                    end
                end)
            end
        end
    })

    GamepassesGroup:AddToggle("GamepassTrailCustomization", {
        Text = "Trail Customization",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "Trail Customization"
                    intValue.Value = 943911201
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("Trail Customization") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["Trail Customization"]:Destroy()
                    end
                end)
            end
        end
    })

    GamepassesGroup:AddToggle("Gamepass2XEXP", {
        Text = "2X EXP",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "2X EXP"
                    intValue.Value = 910843611
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("2X EXP") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["2X EXP"]:Destroy()
                    end
                end)
            end
        end
    })

    GamepassesGroup:AddToggle("Gamepass2XCash", {
        Text = "2X CASH",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "2X CASH"
                    intValue.Value = 912593565
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("2X CASH") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["2X CASH"]:Destroy()
                    end
                end)
            end
        end
    })

    GamepassesGroup:AddToggle("GamepassInstantSpin", {
        Text = "Instant Spin",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "Instant Spin"
                    intValue.Value = 1420990597
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("Instant Spin") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["Instant Spin"]:Destroy()
                    end
                end)
            end
        end
    })

    GamepassesGroup:AddToggle("GamepassMissionSelector", {
        Text = "Mission Selector",
        Default = false,
        Callback = function(State)
            if State then
                pcall(function()
                    local intValue = Instance.new("IntValue")
                    intValue.Name = "Mission Selector"
                    intValue.Value = 1412163280
                    intValue.Parent = game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought
                end)
            else
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought:FindFirstChild("Mission Selector") then
                        game:GetService("Players").LocalPlayer.PlayerData.GamepassesBought["Mission Selector"]:Destroy()
                    end
                end)
            end
        end
    })

    local RightGroup = Tabs.Main:AddRightGroupbox("Controls")
    RightGroup:AddLabel("UI Toggle: RightShift")

    -- AUTO WIN RACE (ИСПРАВЛЕНО - ТОЛЬКО НЕПРОЗРАЧНЫЕ ОБЪЕКТЫ)
    local AutoWinGroup = Tabs.Main:AddRightGroupbox("Auto Race Win")
    local AutoWinSpeed = 1.2
    local isAutoWinRunning = false
    local stopAutoWin = false
    local autoWinConnection = nil

    AutoWinGroup:AddSlider("RaceFlyTime", {
        Text = "Flight Speed (seconds)",
        Default = 1.2,
        Min = 0.8,
        Max = 2,
        Rounding = 1,
        Callback = function(Value)
            AutoWinSpeed = Value
        end
    })

    AutoWinGroup:AddToggle("AutoWinToggle", {
        Text = "Auto Race Win",
        Default = false,
        Callback = function(State)
            if State then
                if isAutoWinRunning then
                    Library:Notify("Auto Win already running!", 3)
                    return
                end
                
                isAutoWinRunning = true
                stopAutoWin = false
                
                local tween_s = game:GetService('TweenService')
                local lp = game.Players.LocalPlayer
                
                -- ИСПРАВЛЕННАЯ ФУНКЦИЯ - ТОЛЬКО НЕПРОЗРАЧНЫЕ ОБЪЕКТЫ
                local function teleportToInner(obj)
                    if stopAutoWin then return false end
                    if not obj:IsA("BasePart") then return true end
                    
                    -- ВАЖНО: Проверяем прозрачность ПЕРЕД телепортом
                    if obj.Transparency >= 0.99 then 
                        print("Skipping transparent object:", obj:GetFullName(), "Transparency:", obj.Transparency)
                        return true -- Пропускаем прозрачные объекты
                    end
                    
                    local char = lp.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    
                    if hrp then
                        print("Teleporting to:", obj:GetFullName(), "Transparency:", obj.Transparency)
                        local tweeninfo = TweenInfo.new(AutoWinSpeed, Enum.EasingStyle.Linear)
                        local tween = tween_s:Create(hrp, tweeninfo, {CFrame = obj.CFrame})
                        tween:Play()
                        tween.Completed:Wait()
                        task.wait(0.05)
                    end
                    return true
                end
                
                task.spawn(function()
                    task.wait(0.3)
                    
                    local processed = {}
                    
                    -- УЛУЧШЕННАЯ ФУНКЦИЯ ПОИСКА
                    local function processAllInners()
                        if stopAutoWin then return end
                        
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if stopAutoWin then break end
                            
                            if obj.Name == "inner" and obj:IsA("BasePart") and not processed[obj] then
                                -- Проверяем прозрачность В РЕАЛЬНОМ ВРЕМЕНИ
                                if obj.Transparency < 0.99 then
                                    processed[obj] = true
                                    if not teleportToInner(obj) then
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    -- Первый проход
                    processAllInners()
                    
                    -- Отслеживание новых объектов И изменений прозрачности
                    local connection
                    connection = workspace.DescendantAdded:Connect(function(obj)
                        if stopAutoWin then
                            connection:Disconnect()
                            return
                        end
                        
                        if obj.Name == "inner" and obj:IsA("BasePart") and not processed[obj] then
                            task.wait(0.1) -- Небольшая задержка для инициализации объекта
                            if obj.Transparency < 0.99 then
                                processed[obj] = true
                                teleportToInner(obj)
                            end
                        end
                    end)
                    
                    -- Отслеживание изменений свойств существующих объектов
                    local propertyConnections = {}
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj.Name == "inner" and obj:IsA("BasePart") then
                            local conn = obj:GetPropertyChangedSignal("Transparency"):Connect(function()
                                if not stopAutoWin and not processed[obj] and obj.Transparency < 0.99 then
                                    processed[obj] = true
                                    print("Object became visible:", obj:GetFullName())
                                    teleportToInner(obj)
                                end
                            end)
                            table.insert(propertyConnections, conn)
                        end
                    end
                    
                    -- Периодическая проверка
                    while not stopAutoWin do
                        task.wait(0.3)
                        processAllInners()
                    end
                    
                    -- Очистка подключений
                    if connection then
                        connection:Disconnect()
                    end
                    for _, conn in ipairs(propertyConnections) do
                        conn:Disconnect()
                    end
                    isAutoWinRunning = false
                end)
                
                Library:Notify("Auto Win started! Only teleporting to VISIBLE objects...", 3)
            else
                stopAutoWin = true
                isAutoWinRunning = false
                Library:Notify("Auto Win stopped", 3)
            end
        end
    })

    -- TELEPORT TAB
    local TeleportGroup = Tabs.Teleport:AddLeftGroupbox("Locations")

    TeleportGroup:AddButton("Jitters TP", function()
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Teleports["Jitters TP"]["City into Jitters"]["City into Jitters"]["Exit 1"].CFrame
        end)
    end)

    TeleportGroup:AddButton("Star Labs TP", function()
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Teleports["Star Labs TP"]["City into StarLabs"]["StarLabs into City"]["Entrance 2"].CFrame
        end)
    end)

    TeleportGroup:AddButton("GCPD TP", function()
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Teleports["GCPD TP"]["City into GCPD"]["Exit 1"].CFrame
        end)
    end)

    TeleportGroup:AddButton("Barry's Apartment TP", function()
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Teleports["Barry's Apartment TP"]["Apartment into City"]["Entrance 2"].CFrame
        end)
    end)

    TeleportGroup:AddButton("Spawn", function()
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame
        end)
    end)

    -- VISUAL TAB - ANTI LAG
    local AntiLagGroup = Tabs.Visual:AddLeftGroupbox("Anti-Lag")
    
    local antiLagEnabled = false
    local antiLagConnection = nil
    
    AntiLagGroup:AddToggle("EnableAntiLag", {
        Text = "Enable Anti-Lag",
        Default = false,
        Callback = function(State)
            antiLagEnabled = State
            if State then
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                
                local function removeEffects(obj)
                    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or 
                       obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("PointLight") or 
                       obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                        obj:Destroy()
                    end
                    
                    if obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or
                       obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") then
                        obj:Destroy()
                    end
                    
                    if obj:IsA("Atmosphere") or obj:IsA("Sky") or obj:IsA("Clouds") then
                        obj:Destroy()
                    end
                    
                    if obj:IsA("Decal") or obj:IsA("Texture") then
                        obj:Destroy()
                    end
                    
                    if obj:IsA("Terrain") then
                        obj.WaterWaveSize = 0
                        obj.WaterReflectance = 0
                        obj.WaterTransparency = 1
                    end
                end
                
                for _, v in ipairs(workspace:GetDescendants()) do
                    removeEffects(v)
                end
                
                if antiLagConnection then
                    antiLagConnection:Disconnect()
                end
                
                antiLagConnection = workspace.DescendantAdded:Connect(function(v)
                    task.wait(0.05)
                    if antiLagEnabled then
                        removeEffects(v)
                    end
                end)
                
                local lighting = game:GetService("Lighting")
                lighting.GlobalShadows = false
                lighting.FogEnd = 1000
                lighting.Brightness = 1
                
                local player = game.Players.LocalPlayer
                player.CharacterAdded:Connect(function(char)
                    task.wait(0.5)
                    if antiLagEnabled then
                        for _, v in ipairs(char:GetDescendants()) do
                            if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") then
                                v:Destroy()
                            end
                        end
                    end
                end)
            else
                if antiLagConnection then
                    antiLagConnection:Disconnect()
                    antiLagConnection = nil
                end
            end
        end
    })

    -- VISUAL TAB - ESP
    local ESPGroup = Tabs.Visual:AddRightGroupbox("ESP Settings")
    
    local espEnabled = false
    local chamsEnabled = false
    local namesEnabled = false
    local healthEnabled = false
    local distanceEnabled = false
    local espLoop = nil
    
    local function stopESP()
        if espLoop then
            espLoop = false
        end
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character then
                if v.Character:FindFirstChild("JollyHighlight") then
                    v.Character:FindFirstChild("JollyHighlight"):Destroy()
                end
                if v.Character:FindFirstChild("JollyESP") then
                    v.Character:FindFirstChild("JollyESP"):Destroy()
                end
            end
        end
    end
    
    local function startESP()
        stopESP()
        espLoop = true
        
        spawn(function()
            while espLoop do
                task.wait(0.1)
                pcall(function()
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local char = v.Character
                            
                            -- Chams
                            if espEnabled and chamsEnabled then
                                local highlight = char:FindFirstChild("JollyHighlight")
                                if not highlight then
                                    highlight = Instance.new("Highlight", char)
                                    highlight.Name = "JollyHighlight"
                                end
                                highlight.Enabled = true
                                highlight.FillColor = v.TeamColor.Color
                                highlight.FillTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.OutlineTransparency = 0
                                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            elseif char:FindFirstChild("JollyHighlight") then
                                char.JollyHighlight.Enabled = false
                            end
                            
                            -- Billboard
                            if espEnabled and (namesEnabled or healthEnabled or distanceEnabled) then
                                local billboard = char:FindFirstChild("JollyESP")
                                if not billboard then
                                    billboard = Instance.new("BillboardGui", char)
                                    billboard.Name = "JollyESP"
                                    billboard.AlwaysOnTop = true
                                    billboard.Size = UDim2.new(0, 200, 0, 50)
                                    billboard.ExtentsOffset = Vector3.new(0, 3, 0)
                                    local label = Instance.new("TextLabel", billboard)
                                    label.Name = "Text"
                                    label.BackgroundTransparency = 1
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Font = Enum.Font.SourceSansBold
                                    label.TextSize = 14
                                    label.TextColor3 = Color3.new(1, 1, 1)
                                    label.TextStrokeTransparency = 0
                                end
                                
                                local info = ""
                                if namesEnabled then
                                    info = info .. v.DisplayName .. "\n"
                                end
                                if healthEnabled and char:FindFirstChild("Humanoid") then
                                    info = info .. "HP: " .. math.floor(char.Humanoid.Health) .. " "
                                end
                                if distanceEnabled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    local dist = math.floor((char.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                                    info = info .. "Dist: " .. dist
                                end
                                billboard.Text.Text = info
                                billboard.Enabled = true
                            elseif char:FindFirstChild("JollyESP") then
                                char.JollyESP.Enabled = false
                            end
                        end
                    end
                end)
            end
        end)
    end
    
    ESPGroup:AddToggle("EnableESP", {
        Text = "Enable ESP",
        Default = false,
        Callback = function(State)
            espEnabled = State
            if State then
                startESP()
            else
                stopESP()
            end
        end
    })
    
    ESPGroup:AddDivider()
    
    ESPGroup:AddToggle("ChamsToggle", {
        Text = "Show Chams",
        Default = false,
        Callback = function(State)
            chamsEnabled = State
        end
    })
    
    ESPGroup:AddToggle("NamesToggle", {
        Text = "Show Names",
        Default = false,
        Callback = function(State)
            namesEnabled = State
        end
    })
    
    ESPGroup:AddToggle("HealthToggle", {
        Text = "Show Health",
        Default = false,
        Callback = function(State)
            healthEnabled = State
        end
    })
    
    ESPGroup:AddToggle("DistanceToggle", {
        Text = "Show Distance",
        Default = false,
        Callback = function(State)
            distanceEnabled = State
        end
    })

    -- MISC TAB
    local MiscGroup = Tabs.Misc:AddLeftGroupbox("Miscellaneous")

    local SelectedPlayer = nil
    local CameraLocked = false
    local Camera = workspace.CurrentCamera
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")

    local PlayerDropdown = MiscGroup:AddDropdown("PlayerSelect", {
        Title = "Select Player",
        Values = {},
        Default = "None",
        Callback = function(Value)
            if Value ~= "None" then
                SelectedPlayer = game:GetService("Players"):FindFirstChild(Value)
            else
                SelectedPlayer = nil
            end
        end
    })

    MiscGroup:AddToggle("CameraLock", {
        Text = "Lock Camera",
        Default = false,
        Callback = function(State)
            CameraLocked = State
            if State then
                if SelectedPlayer and SelectedPlayer.Character then
                    Library:Notify("Camera locked on " .. SelectedPlayer.Name, 3)
                else
                    Library:Notify("Please select a player first!", 3)
                    CameraLocked = false
                end
            else
                Camera.CameraSubject = LocalPlayer.Character
                Library:Notify("Camera unlocked", 3)
            end
        end
    })

    local function UpdatePlayerList()
        local Players = game:GetService("Players"):GetPlayers()
        local PlayerNames = {"None"}
        
        for _, Player in ipairs(Players) do
            if Player ~= LocalPlayer then
                table.insert(PlayerNames, Player.Name)
            end
        end
        
        PlayerDropdown:SetValues(PlayerNames)
    end

    local LastUpdateTime = 0
    local TargetFPS = 60

    RunService.Heartbeat:Connect(function()
        if CameraLocked and SelectedPlayer and SelectedPlayer.Character then
            local targetPart = SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if targetPart then
                local currentCameraSubject = Camera.CameraSubject
                if currentCameraSubject ~= SelectedPlayer.Character then
                    Camera.CameraSubject = SelectedPlayer.Character
                end
                
                local currentTime = tick()
                local deltaTime = currentTime - LastUpdateTime
                local targetDeltaTime = 1 / TargetFPS
                
                if deltaTime >= targetDeltaTime then
                    local offsetDistance = 5 
                    local cameraOffset = targetPart.CFrame:ToWorldSpace(CFrame.new(0, 0, -offsetDistance).Position)
                    
                    Camera.CFrame = CFrame.new(cameraOffset, targetPart.Position)
                    LastUpdateTime = currentTime
                end
            end
        end
    end)

    game:GetService("Players").PlayerAdded:Connect(function()
        UpdatePlayerList()
    end)

    game:GetService("Players").PlayerRemoving:Connect(function()
        UpdatePlayerList()
        if SelectedPlayer and not game:GetService("Players"):FindFirstChild(SelectedPlayer.Name) then
            SelectedPlayer = nil
            CameraLocked = false
            Camera.CameraSubject = LocalPlayer.Character
        end
    end)

    UpdatePlayerList()

    local function restoreAllValues()
        local regularStats = {"Speed", "Health", "Flashtime Speed", "Damage", "Boost Speed", "Boost Duration"}
        for _, statName in ipairs(regularStats) do
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerData.Upgrades[statName].Value = OriginalValues[statName] or 0
            end)
        end
        
        local rebirthStats = {"Speed", "Health", "Flashtime Speed", "Damage", "Boost Speed", "Boost Duration"}
        for _, statName in ipairs(rebirthStats) do
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerData.RebirthUpgrades[statName].Value = RebirthOriginalValues[statName] or 0
            end)
        end
        
        pcall(function()
            game:GetService("Players").LocalPlayer.PlayerData.Abilities.ArmTornado.Value = 0
            game:GetService("Players").LocalPlayer.PlayerData.Abilities.LightningThrow.Value = 0
        end)
    end

    local MiscRight = Tabs.Misc:AddRightGroupbox("Info")

    MiscRight:AddLabel("Version: 2.2.0 FIXED")
    MiscRight:AddLabel("Library: Linoria")
    MiscRight:AddDivider()
    MiscRight:AddButton("Unload Script", function()
        restoreAllValues()
        stopESP()
        stopAutoWin = true
        Library:Notify("All values restored! Unloading script...", 3)
        wait(1)
        Library:Unload()
    end)

    -- Theme Manager Setup
    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("MyScriptName")
    ThemeManager:ApplyToGroupbox(Tabs.Misc:AddLeftGroupbox("Themes"))
end

createMainUI()
