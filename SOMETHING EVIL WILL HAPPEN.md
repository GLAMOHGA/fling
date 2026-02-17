local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Settings = {
    InfJump = false,
    TPWalk = false,
    TPSpeed = 1,
    ESP = false,
    NameESP = false,
    HealthESP = false,
    AntiRagdoll = false
}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

local Window = WindUI:CreateWindow({
    Title = "SOMETHING EVIL WILL HAPPEN",
    Subtitle = "by vomagla",
    Icon = "rbxassetid://117783035423570",
    Transparent = true,
    Theme = "Dark",
    Folder = "SomethingEvilConfig"
})

local Tabs = {
    Main = Window:Tab({ Title = "Main", Icon = "home" }),
    Visual = Window:Tab({ Title = "Visual", Icon = "image" }),
    Player = Window:Tab({ Title = "Player", Icon = "user" })
}

-- === TPWalk with Raycast ===
RunService.Heartbeat:Connect(function()
    if Settings.TPWalk then
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end
        if hum.MoveDirection.Magnitude > 0 then
            local direction = hum.MoveDirection * Settings.TPSpeed
            local rayParams = RaycastParams.new()
            rayParams.FilterType = Enum.RaycastFilterType.Exclude
            rayParams.FilterDescendantsInstances = {char}
            local rayResult = workspace:Raycast(root.Position, direction.Unit * (direction.Magnitude + 3), rayParams)
            if not rayResult then
                root.CFrame = root.CFrame + direction
            end
            root.Velocity = Vector3.new(0, root.Velocity.Y, 0)
        end
    end
end)

-- === Infinite Jump ===
UserInputService.JumpRequest:Connect(function()
    if Settings.InfJump then
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum:ChangeState("Jumping")
        end
    end
end)

-- === ESP Storage ===
local espHighlights = {}
local espNames = {}
local espHealth = {}

local function clearESP(player)
    if espHighlights[player] then
        espHighlights[player]:Destroy()
        espHighlights[player] = nil
    end
end

local function clearNameESP(player)
    if espNames[player] then
        espNames[player]:Destroy()
        espNames[player] = nil
    end
end

local function clearHealthESP(player)
    if espHealth[player] then
        espHealth[player]:Destroy()
        espHealth[player] = nil
    end
end

local function clearAllESP(player)
    clearESP(player)
    clearNameESP(player)
    clearHealthESP(player)
end

-- === Create ESP for a player ===
local function updateESPForPlayer(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then
        clearAllESP(player)
        return
    end
    local humanoid = char:FindFirstChild("Humanoid")
    local head = char:FindFirstChild("Head")
    local rootPart = char:FindFirstChild("HumanoidRootPart")

    -- CHAMS ESP
    if Settings.ESP then
        if not espHighlights[player] or not espHighlights[player].Parent then
            clearESP(player)
            local highlight = Instance.new("Highlight")
            highlight.Name = "EvilESP"
            highlight.FillColor = Color3.fromRGB(255, 255, 255)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Adornee = char
            highlight.Parent = game:GetService("CoreGui")
            espHighlights[player] = highlight
        else
            espHighlights[player].Adornee = char
        end
    else
        clearESP(player)
    end

    -- NAME ESP
    if Settings.NameESP then
        if not espNames[player] or not espNames[player].Parent then
            clearNameESP(player)
            local bbg = Instance.new("BillboardGui")
            bbg.Name = "EvilNameESP"
            bbg.Size = UDim2.new(0, 200, 0, 40)
            bbg.StudsOffset = Vector3.new(0, 3.5, 0)
            bbg.AlwaysOnTop = true
            bbg.MaxDistance = 1000
            bbg.Adornee = head or rootPart
            bbg.Parent = game:GetService("CoreGui")

            local label = Instance.new("TextLabel")
            label.Name = "NameLabel"
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = player.DisplayName .. " (@" .. player.Name .. ")"
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.TextScaled = true
            label.Font = Enum.Font.GothamBold
            label.Parent = bbg

            espNames[player] = bbg
        else
            espNames[player].Adornee = head or rootPart
            local label = espNames[player]:FindFirstChild("NameLabel")
            if label then
                label.Text = player.DisplayName .. " (@" .. player.Name .. ")"
            end
        end
    else
        clearNameESP(player)
    end

    -- HEALTH ESP
    if Settings.HealthESP and humanoid then
        if not espHealth[player] or not espHealth[player].Parent then
            clearHealthESP(player)
            local bbg = Instance.new("BillboardGui")
            bbg.Name = "EvilHealthESP"
            bbg.Size = UDim2.new(0, 200, 0, 30)
            bbg.StudsOffset = Vector3.new(0, 2.5, 0)
            bbg.AlwaysOnTop = true
            bbg.MaxDistance = 1000
            bbg.Adornee = head or rootPart
            bbg.Parent = game:GetService("CoreGui")

            local hpLabel = Instance.new("TextLabel")
            hpLabel.Name = "HPLabel"
            hpLabel.Size = UDim2.new(1, 0, 1, 0)
            hpLabel.BackgroundTransparency = 1
            hpLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            hpLabel.TextStrokeTransparency = 0
            hpLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            hpLabel.TextScaled = true
            hpLabel.Font = Enum.Font.GothamBold
            hpLabel.Text = math.floor(humanoid.Health) .. " / " .. math.floor(humanoid.MaxHealth)
            hpLabel.Parent = bbg

            espHealth[player] = bbg
        else
            espHealth[player].Adornee = head or rootPart
            local hpLabel = espHealth[player]:FindFirstChild("HPLabel")
            if hpLabel and humanoid then
                hpLabel.Text = math.floor(humanoid.Health) .. " / " .. math.floor(humanoid.MaxHealth)
            end
        end
    else
        clearHealthESP(player)
    end
end

-- === ESP Update Loop ===
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        updateESPForPlayer(player)
    end
end)

-- === Clean up ESP when player leaves ===
Players.PlayerRemoving:Connect(function(player)
    clearAllESP(player)
end)

-- === Anti-Ragdoll ===
local antiRagdollConnection = nil
local antiRagdollStateConnection = nil

local function setupAntiRagdoll(character)
    if antiRagdollConnection then
        antiRagdollConnection:Disconnect()
        antiRagdollConnection = nil
    end
    if antiRagdollStateConnection then
        antiRagdollStateConnection:Disconnect()
        antiRagdollStateConnection = nil
    end
    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then return end
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    antiRagdollConnection = RunService.Heartbeat:Connect(function()
        if not Settings.AntiRagdoll then return end
        if not character or not character.Parent then return end
        if not humanoid or humanoid.Health <= 0 then return end
        local state = humanoid:GetState()
        if state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Physics then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BallSocketConstraint") and v.Name == "RagdollConstraint" then
                v:Destroy()
            elseif v:IsA("Motor6D") then
                v.Enabled = true
            elseif v:IsA("NoCollisionConstraint") and v.Name == "RagdollCollision" then
                v:Destroy()
            end
        end
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    end)
    antiRagdollStateConnection = humanoid.StateChanged:Connect(function(oldState, newState)
        if not Settings.AntiRagdoll then return end
        if newState == Enum.HumanoidStateType.Ragdoll or newState == Enum.HumanoidStateType.FallingDown or newState == Enum.HumanoidStateType.Physics then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if Settings.AntiRagdoll then
        setupAntiRagdoll(character)
    end
end)

-- === Custom Sky ===
local currentSky = nil

local function applySky(skyData)
    if currentSky then
        currentSky:Destroy()
        currentSky = nil
    end
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end
    local s = Instance.new("Sky")
    for k, v in pairs(skyData) do
        s["Skybox" .. k] = "rbxassetid://" .. v
    end
    s.Parent = Lighting
    currentSky = s
end

local function removeSky()
    if currentSky then
        currentSky:Destroy()
        currentSky = nil
    end
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end
end

-- =============================================
-- === UI ELEMENTS ===
-- =============================================

-- >> MAIN TAB <<
Tabs.Main:Toggle({
    Title = "Anti-Ragdoll",
    Description = "Prevents your character from ragdolling",
    Callback = function(Value)
        Settings.AntiRagdoll = Value
        if Value then
            if LocalPlayer.Character then
                setupAntiRagdoll(LocalPlayer.Character)
            end
        else
            if antiRagdollConnection then
                antiRagdollConnection:Disconnect()
                antiRagdollConnection = nil
            end
            if antiRagdollStateConnection then
                antiRagdollStateConnection:Disconnect()
                antiRagdollStateConnection = nil
            end
            if LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                end
            end
        end
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
            for player, _ in pairs(espHighlights) do
                clearESP(player)
            end
        end
    end
})

Tabs.Visual:Toggle({
    Title = "Name ESP",
    Callback = function(Value)
        Settings.NameESP = Value
        if not Value then
            for player, _ in pairs(espNames) do
                clearNameESP(player)
            end
        end
    end
})

Tabs.Visual:Toggle({
    Title = "Health ESP",
    Callback = function(Value)
        Settings.HealthESP = Value
        if not Value then
            for player, _ in pairs(espHealth) do
                clearHealthESP(player)
            end
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
