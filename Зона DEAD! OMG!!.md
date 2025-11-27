-- ESP Script for Dead by Roblox
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

-- ESP Variables
local espEnabled = false
local totemESPEnabled = false
local generatorESPEnabled = false
local hatchESPEnabled = false
local chestESPEnabled = false
local exitGateESPEnabled = false
local outlineEnabled = true
local playerHighlights = {}
local totemHighlights = {}
local generatorHighlights = {}
local hatchHighlights = {}
local chestHighlights = {}
local exitGateHighlights = {}

-- Speed Variables
local speedEnabled = false
local speedMode = "Normal" -- Small, Normal, Large

-- Function to create player ESP
local function createPlayerESP(player)
    if player == localPlayer then return end
    
    local function addHighlight(character)
        if not character or playerHighlights[player] then return end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "PlayerESP"
        highlight.Adornee = character
        highlight.FillColor = Color3.new(0, 1, 0) -- Green for players
        highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        highlight.FillTransparency = 0.7
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character
        
        playerHighlights[player] = highlight
    end

    if player.Character then
        addHighlight(player.Character)
    end
    
    player.CharacterAdded:Connect(function(character)
        if espEnabled then
            wait(1)
            addHighlight(character)
        end
    end)
end

-- Function to create totem ESP
local function createTotemESP()
    for i = 0, 10 do
        local totemName = i == 0 and "Totem" or "Totem" .. i
        local totem = workspace:FindFirstChild(totemName)
        
        if totem and not totemHighlights[totemName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "TotemESP"
            highlight.Adornee = totem
            highlight.FillColor = Color3.new(1, 1, 0) -- Yellow for totems
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = totem
            
            totemHighlights[totemName] = highlight
        end
    end
end

-- Function to create generator ESP
local function createGeneratorESP()
    for i = 0, 10 do
        local generatorName = i == 0 and "Generator" or "Generator" .. i
        local generator = workspace:FindFirstChild(generatorName)
        
        if generator and not generatorHighlights[generatorName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "GeneratorESP"
            highlight.Adornee = generator
            highlight.FillColor = Color3.new(0.31, 0.02, 0.08) -- Dark red for generators
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = generator
            
            generatorHighlights[generatorName] = highlight
        end
    end
end

-- Function to create hatch ESP
local function createHatchESP()
    for i = 0, 10 do
        local hatchName = i == 0 and "Hatch" or "Hatch" .. i
        local hatch = workspace:FindFirstChild(hatchName)
        
        if hatch and not hatchHighlights[hatchName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "HatchESP"
            highlight.Adornee = hatch
            highlight.FillColor = Color3.new(0, 0, 0) -- Black for hatch
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = hatch
            
            hatchHighlights[hatchName] = highlight
        end
    end
end

-- Function to create chest ESP
local function createChestESP()
    for i = 0, 10 do
        local chestName = i == 0 and "Chest" or "Chest" .. i
        local chest = workspace:FindFirstChild(chestName)
        
        if chest and not chestHighlights[chestName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ChestESP"
            highlight.Adornee = chest
            highlight.FillColor = Color3.new(0.8, 0.52, 0.25) -- Brown for chests
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = chest
            
            chestHighlights[chestName] = highlight
        end
    end
end

-- Function to create exit gate ESP
local function createExitGateESP()
    for i = 0, 10 do
        local exitGateName = i == 0 and "ExitGate" or "ExitGate" .. i
        local exitGate = workspace:FindFirstChild(exitGateName)
        
        if exitGate and not exitGateHighlights[exitGateName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ExitGateESP"
            highlight.Adornee = exitGate
            highlight.FillColor = Color3.new(1, 1, 1) -- White for exit gates
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = exitGate
            
            exitGateHighlights[exitGateName] = highlight
        end
    end
end

-- Function to update all outlines
local function updateOutlines()
    for player, highlight in pairs(playerHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
    
    for totemName, highlight in pairs(totemHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
    
    for generatorName, highlight in pairs(generatorHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
    
    for hatchName, highlight in pairs(hatchHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
    
    for chestName, highlight in pairs(chestHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
    
    for exitGateName, highlight in pairs(exitGateHighlights) do
        if highlight then
            highlight.OutlineColor = outlineEnabled and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
        end
    end
end

-- ESP Enable/Disable Functions
local function enablePlayerESP()
    if espEnabled then return end
    espEnabled = true
    
    for _, player in pairs(Players:GetPlayers()) do
        createPlayerESP(player)
    end
    
    Players.PlayerAdded:Connect(function(player)
        if espEnabled then
            createPlayerESP(player)
        end
    end)
end

local function disablePlayerESP()
    espEnabled = false
    for player, highlight in pairs(playerHighlights) do
        if highlight then highlight:Destroy() end
    end
    playerHighlights = {}
end

local function enableTotemESP()
    if totemESPEnabled then return end
    totemESPEnabled = true
    createTotemESP()
    spawn(function()
        while totemESPEnabled do
            createTotemESP()
            wait(2)
        end
    end)
end

local function disableTotemESP()
    totemESPEnabled = false
    for totemName, highlight in pairs(totemHighlights) do
        if highlight then highlight:Destroy() end
    end
    totemHighlights = {}
end

local function enableGeneratorESP()
    if generatorESPEnabled then return end
    generatorESPEnabled = true
    createGeneratorESP()
    spawn(function()
        while generatorESPEnabled do
            createGeneratorESP()
            wait(2)
        end
    end)
end

local function disableGeneratorESP()
    generatorESPEnabled = false
    for generatorName, highlight in pairs(generatorHighlights) do
        if highlight then highlight:Destroy() end
    end
    generatorHighlights = {}
end

local function enableHatchESP()
    if hatchESPEnabled then return end
    hatchESPEnabled = true
    createHatchESP()
    spawn(function()
        while hatchESPEnabled do
            createHatchESP()
            wait(2)
        end
    end)
end

local function disableHatchESP()
    hatchESPEnabled = false
    for hatchName, highlight in pairs(hatchHighlights) do
        if highlight then highlight:Destroy() end
    end
    hatchHighlights = {}
end

local function enableChestESP()
    if chestESPEnabled then return end
    chestESPEnabled = true
    createChestESP()
    spawn(function()
        while chestESPEnabled do
            createChestESP()
            wait(2)
        end
    end)
end

local function disableChestESP()
    chestESPEnabled = false
    for chestName, highlight in pairs(chestHighlights) do
        if highlight then highlight:Destroy() end
    end
    chestHighlights = {}
end

local function enableExitGateESP()
    if exitGateESPEnabled then return end
    exitGateESPEnabled = true
    createExitGateESP()
    spawn(function()
        while exitGateESPEnabled do
            createExitGateESP()
            wait(2)
        end
    end)
end

local function disableExitGateESP()
    exitGateESPEnabled = false
    for exitGateName, highlight in pairs(exitGateHighlights) do
        if highlight then highlight:Destroy() end
    end
    exitGateHighlights = {}
end

-- Speed Function
local function enableSpeed()
    speedEnabled = true
    local hb = RunService.Heartbeat
    spawn(function()
        while speedEnabled and localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Humanoid") do
            local h = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local d = hb:Wait()
            
            if h.MoveDirection.Magnitude > 0 then
                local speedMultiplier
                if speedMode == "Small" then
                    speedMultiplier = 5
                elseif speedMode == "Normal" then
                    speedMultiplier = 10
                elseif speedMode == "Large" then
                    speedMultiplier = 20
                end
                
                localPlayer.Character:TranslateBy(h.MoveDirection * speedMultiplier * d)
            end
        end
    end)
end

local function disableSpeed()
    speedEnabled = false
end

-- Load library
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Seven7-lua/RedzLibs/refs/heads/main/src/RedzlibV2/source.lua")))()

MakeWindow({
    Hub = {
        Title = "DEAD BY ROBLOX. by https://t.me/vomagla",
        Animation = "by : https://t.me/vomagla"
    },
    Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Running the Script...",
            Incorrectkey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

MinimizeButton({
    Image = "130742397",
    Size = {40, 40},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = true,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

local Main = MakeTab({Name = "Main"})
local PlayerTab = MakeTab({Name = "Player"})

MakeNotifi({
    Title = "DEAD BY ROBLOX HUB",
    Text = "пук пук подпишись на канал телеграм- vomagla там много скриптов лучших!",
    Time = 20
})

-- Main Tab (ESP)
local section = AddSection(Main, {"ESP Settings"})

AddToggle(Main, {
    Name = "Player ESP",
    Default = false,
    Callback = function(Value)
        if Value then enablePlayerESP() else disablePlayerESP() end
    end
})

AddToggle(Main, {
    Name = "Totem ESP",
    Default = false,
    Callback = function(Value)
        if Value then enableTotemESP() else disableTotemESP() end
    end
})

AddToggle(Main, {
    Name = "Generator ESP",
    Default = false,
    Callback = function(Value)
        if Value then enableGeneratorESP() else disableGeneratorESP() end
    end
})

AddToggle(Main, {
    Name = "Hatch ESP",
    Default = false,
    Callback = function(Value)
        if Value then enableHatchESP() else disableHatchESP() end
    end
})

AddToggle(Main, {
    Name = "Chest ESP",
    Default = false,
    Callback = function(Value)
        if Value then enableChestESP() else disableChestESP() end
    end
})

AddToggle(Main, {
    Name = "Exit Gate ESP",
    Default = false,
    Callback = function(Value)
        if Value then enableExitGateESP() else disableExitGateESP() end
    end
})

AddToggle(Main, {
    Name = "White Outline",
    Default = true,
    Callback = function(Value)
        outlineEnabled = Value
        updateOutlines()
    end
})

-- Player Tab
local playerSection = AddSection(PlayerTab, {"Player Modifications"})

AddToggle(PlayerTab, {
    Name = "Speed",
    Default = false,
    Callback = function(Value)
        if Value then enableSpeed() else disableSpeed() end
    end
})

AddDropdown(PlayerTab, {
    Name = "Speed Mode",
    Options = {"Small", "Normal", "Large"},
    Default = "Normal",
    Callback = function(Value)
        speedMode = Value
    end
})

AddTextLabel(Main, "Toggle ESP features on/off")
AddTextLabel(PlayerTab, "Player modifications")
