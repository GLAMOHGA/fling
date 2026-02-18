local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Settings = {
    InfJump = false,
    TPWalk = false,
    TPSpeed = 1,
    ESP = false,
    NameESP = false,
    HealthESP = false,
    AntiRagdoll = false,
    AntiFallDamage = false
}

local espHighlights = {}
local espNames = {}
local espHealth = {}
local antiRagdollConnection = nil
local antiRagdollStateConnection = nil
local antiFallDamageConnection = nil
local antiFallIsFrozen = false
local currentSky = nil

-- === WINDOW ===
local Window = WindUI:CreateWindow({
    Title = "SOMETHING EVIL WILL HAPPEN",
    Subtitle = "by vomagla",
    Icon = "rbxassetid://117783035423570",
    Transparent = true,
    Theme = "Dark",
    Folder = "SomethingEvilConfig",
    Size = UDim2.new(0, 480, 0, 340),
    ToggleKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:Tab({ Title = "Main", Icon = "home" }),
    Visual = Window:Tab({ Title = "Visual", Icon = "image" }),
    Player = Window:Tab({ Title = "Player", Icon = "user" })
}

-- ==================== UTILITY ====================

local function getChar()
    return LocalPlayer.Character
end

local function getHumanoid(char)
    return char and char:FindFirstChild("Humanoid")
end

local function getRoot(char)
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getHead(char)
    return char and char:FindFirstChild("Head")
end

-- ==================== ESP ====================

local function destroyInstance(tbl, key)
    local obj = tbl[key]
    if obj then
        obj:Destroy()
        tbl[key] = nil
    end
end

local function clearAllESP(player)
    destroyInstance(espHighlights, player)
    destroyInstance(espNames, player)
    destroyInstance(espHealth, player)
end

local function updateESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then
        clearAllESP(player)
        return
    end

    local humanoid = getHumanoid(char)
    local head = getHead(char)
    local root = getRoot(char)
    local adornee = head or root

    if Settings.ESP then
        local hl = espHighlights[player]
        if not hl or not hl.Parent then
            destroyInstance(espHighlights, player)
            hl = Instance.new("Highlight")
            hl.Name = "EvilESP"
            hl.FillColor = Color3.new(1, 1, 1)
            hl.OutlineColor = Color3.new(1, 1, 1)
            hl.FillTransparency = 0.5
            hl.OutlineTransparency = 0
            hl.Adornee = char
            hl.Parent = CoreGui
            espHighlights[player] = hl
        else
            hl.Adornee = char
        end
    else
        destroyInstance(espHighlights, player)
    end

    if Settings.NameESP and adornee then
        local bbg = espNames[player]
        local displayText = player.DisplayName .. " (@" .. player.Name .. ")"
        if not bbg or not bbg.Parent then
            destroyInstance(espNames, player)
            bbg = Instance.new("BillboardGui")
            bbg.Name = "EvilNameESP"
            bbg.Size = UDim2.new(0, 150, 0, 25)
            bbg.StudsOffset = Vector3.new(0, 3.5, 0)
            bbg.AlwaysOnTop = true
            bbg.MaxDistance = 1000
            bbg.Adornee = adornee
            bbg.Parent = CoreGui

            local label = Instance.new("TextLabel")
            label.Name = "L"
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = displayText
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.new(0, 0, 0)
            label.TextScaled = false
            label.TextSize = 13
            label.Font = Enum.Font.GothamBold
            label.Parent = bbg

            espNames[player] = bbg
        else
            bbg.Adornee = adornee
            local label = bbg:FindFirstChild("L")
            if label then label.Text = displayText end
        end
    else
        destroyInstance(espNames, player)
    end

    if Settings.HealthESP and humanoid and adornee then
        local bbg = espHealth[player]
        local hpText = math.floor(humanoid.Health) .. " / " .. math.floor(humanoid.MaxHealth)
        if not bbg or not bbg.Parent then
            destroyInstance(espHealth, player)
            bbg = Instance.new("BillboardGui")
            bbg.Name = "EvilHealthESP"
            bbg.Size = UDim2.new(0, 150, 0, 20)
            bbg.StudsOffset = Vector3.new(0, 2.5, 0)
            bbg.AlwaysOnTop = true
            bbg.MaxDistance = 1000
            bbg.Adornee = adornee
            bbg.Parent = CoreGui

            local label = Instance.new("TextLabel")
            label.Name = "L"
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(0, 1, 0)
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.new(0, 0, 0)
            label.TextScaled = false
            label.TextSize = 12
            label.Font = Enum.Font.GothamBold
            label.Text = hpText
            label.Parent = bbg

            espHealth[player] = bbg
        else
            bbg.Adornee = adornee
            local label = bbg:FindFirstChild("L")
            if label then label.Text = hpText end
        end
    else
        destroyInstance(espHealth, player)
    end
end

-- ==================== ANTI-RAGDOLL ====================

local ragdollStates = {
    Enum.HumanoidStateType.Ragdoll,
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Physics
}

local function setupAntiRagdoll(character)
    if antiRagdollConnection then antiRagdollConnection:Disconnect() end
    if antiRagdollStateConnection then antiRagdollStateConnection:Disconnect() end

    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then return end

    local function disableRagdollStates()
        for _, state in ipairs(ragdollStates) do
            humanoid:SetStateEnabled(state, false)
        end
    end

    disableRagdollStates()

    antiRagdollConnection = RunService.Heartbeat:Connect(function()
        if not Settings.AntiRagdoll then return end
        if not character.Parent or humanoid.Health <= 0 then return end

        local state = humanoid:GetState()
        for _, rs in ipairs(ragdollStates) do
            if state == rs then
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                break
            end
        end

        for _, v in ipairs(character:GetDescendants()) do
            if v:IsA("BallSocketConstraint") and v.Name == "RagdollConstraint" then
                v:Destroy()
            elseif v:IsA("Motor6D") then
                v.Enabled = true
            elseif v:IsA("NoCollisionConstraint") and v.Name == "RagdollCollision" then
                v:Destroy()
            end
        end

        disableRagdollStates()
    end)

    antiRagdollStateConnection = humanoid.StateChanged:Connect(function(_, newState)
        if not Settings.AntiRagdoll then return end
        for _, rs in ipairs(ragdollStates) do
            if newState == rs then
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                return
            end
        end
    end)
end

-- ==================== ANTI FALL DAMAGE ====================

local FALL_SPEED_THRESHOLD = 85
local DISTANCE_THRESHOLD = 7
local FREEZE_DURATION = 0.1

local function freezeCharacter(rootPart)
    if antiFallIsFrozen then return end
    antiFallIsFrozen = true

    rootPart.AssemblyLinearVelocity = Vector3.zero

    local pos = rootPart.Position

    local bp = Instance.new("BodyPosition")
    bp.Position = pos
    bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bp.D = 500
    bp.P = 10000
    bp.Parent = rootPart

    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    bg.D = 500
    bg.P = 10000
    bg.Parent = rootPart

    task.wait(FREEZE_DURATION)
    bp:Destroy()
    bg:Destroy()
    task.wait(0.5)
    antiFallIsFrozen = false
end

local function setupAntiFallDamage()
    if antiFallDamageConnection then antiFallDamageConnection:Disconnect() end

    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    local downRay = Vector3.new(0, -500, 0)

    antiFallDamageConnection = RunService.Heartbeat:Connect(function()
        if not Settings.AntiFallDamage or antiFallIsFrozen then return end

        local char = getChar()
        if not char then return end
        local root = getRoot(char)
        local hum = getHumanoid(char)
        if not root or not hum or hum.Health <= 0 then return end

        local fallSpeed = -root.AssemblyLinearVelocity.Y
        if fallSpeed < FALL_SPEED_THRESHOLD then return end

        rayParams.FilterDescendantsInstances = {char}
        local result = workspace:Raycast(root.Position, downRay, rayParams)
        if result and (root.Position - result.Position).Magnitude <= DISTANCE_THRESHOLD then
            task.spawn(freezeCharacter, root)
        end
    end)
end

-- ==================== SKY ====================

local function applySky(skyData)
    if currentSky then currentSky:Destroy() end
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
    local s = Instance.new("Sky")
    for k, v in pairs(skyData) do
        s["Skybox" .. k] = "rbxassetid://" .. v
    end
    s.Parent = Lighting
    currentSky = s
end

local function removeSky()
    if currentSky then currentSky:Destroy(); currentSky = nil end
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then v:Destroy() end
    end
end

-- ==================== CONNECTIONS ====================

RunService.Heartbeat:Connect(function()
    if not Settings.TPWalk then return end
    local char = getChar()
    if not char then return end
    local hum = getHumanoid(char)
    local root = getRoot(char)
    if not hum or not root then return end
    if hum.MoveDirection.Magnitude == 0 then return end

    local direction = hum.MoveDirection * Settings.TPSpeed
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = {char}

    if not workspace:Raycast(root.Position, direction.Unit * (direction.Magnitude + 3), rayParams) then
        root.CFrame = root.CFrame + direction
    end
    root.Velocity = Vector3.new(0, root.Velocity.Y, 0)
end)

UserInputService.JumpRequest:Connect(function()
    if not Settings.InfJump then return end
    local hum = getHumanoid(getChar())
    if hum then hum:ChangeState("Jumping") end
end)

RunService.RenderStepped:Connect(function()
    if not Settings.ESP and not Settings.NameESP and not Settings.HealthESP then return end
    for _, player in ipairs(Players:GetPlayers()) do
        updateESP(player)
    end
end)

Players.PlayerRemoving:Connect(clearAllESP)

LocalPlayer.CharacterAdded:Connect(function(character)
    antiFallIsFrozen = false
    if Settings.AntiRagdoll then
        setupAntiRagdoll(character)
    end
end)

-- ==================== UI ELEMENTS ====================

-- >> MAIN TAB <<
Tabs.Main:Toggle({
    Title = "Anti-Ragdoll",
    Description = "Prevents your character from ragdolling",
    Callback = function(Value)
        Settings.AntiRagdoll = Value
        if Value then
            local char = getChar()
            if char then setupAntiRagdoll(char) end
        else
            if antiRagdollConnection then antiRagdollConnection:Disconnect(); antiRagdollConnection = nil end
            if antiRagdollStateConnection then antiRagdollStateConnection:Disconnect(); antiRagdollStateConnection = nil end
            local hum = getHumanoid(getChar())
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            end
        end
    end
})

Tabs.Main:Toggle({
    Title = "Anti Fall Damage",
    Description = "Freezes you before hitting the ground at high speed",
    Callback = function(Value)
        Settings.AntiFallDamage = Value
        if Value then
            setupAntiFallDamage()
        else
            if antiFallDamageConnection then antiFallDamageConnection:Disconnect(); antiFallDamageConnection = nil end
            antiFallIsFrozen = false
        end
    end
})

Tabs.Main:Button({
    Title = "Load Script TROLL",
    Description = "Loads NilHub Ragdoll Engine troll script",
    Callback = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/12xQ/NilHub.Lua/refs/heads/main/Ragdoll%20Engine"))()
        end)
    end
})

-- >> PLAYER TAB <<
Tabs.Player:Toggle({
    Title = "Infinite Jump",
    Callback = function(Value)
        Settings.InfJump = Value
    end
})

Tabs.Player:Toggle({
    Title = "Enable TPWalk",
    Callback = function(Value)
        Settings.TPWalk = Value
    end
})

Tabs.Player:Slider({
    Title = "TPWalk Speed",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Decimals = 1,
    Callback = function(Value)
        Settings.TPSpeed = Value
    end
})

-- >> VISUAL TAB <<
Tabs.Visual:Toggle({
    Title = "Player Chams (White)",
    Callback = function(Value)
        Settings.ESP = Value
        if not Value then
            for p in pairs(espHighlights) do destroyInstance(espHighlights, p) end
        end
    end
})

Tabs.Visual:Toggle({
    Title = "Name ESP",
    Callback = function(Value)
        Settings.NameESP = Value
        if not Value then
            for p in pairs(espNames) do destroyInstance(espNames, p) end
        end
    end
})

Tabs.Visual:Toggle({
    Title = "Health ESP",
    Callback = function(Value)
        Settings.HealthESP = Value
        if not Value then
            for p in pairs(espHealth) do destroyInstance(espHealth, p) end
        end
    end
})

Tabs.Visual:Button({
    Title = "Set Day",
    Callback = function()
        Lighting.ClockTime = 14
    end
})

Tabs.Visual:Button({
    Title = "Set Night",
    Callback = function()
        Lighting.ClockTime = 0
    end
})

Tabs.Visual:Dropdown({
    Title = "Custom Skybox",
    Values = {"None", "Galaxy", "Sunset", "Space"},
    Value = "None",
    Callback = function(Value)
        if Value == "None" then
            removeSky()
        elseif Value == "Galaxy" then
            applySky({Bk = 271042516, Dn = 271077243, Ft = 271042556, Lf = 271042310, Rt = 271042467, Up = 271077958})
        elseif Value == "Sunset" then
            applySky({Bk = 17279854976, Dn = 17279856318, Ft = 17279858447, Lf = 17279860360, Rt = 17279862234, Up = 17279864507})
        elseif Value == "Space" then
            applySky({Bk = 12064107, Dn = 12064152, Ft = 12064121, Lf = 12063984, Rt = 12064115, Up = 12064131})
        end
    end
})
