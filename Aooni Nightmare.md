

local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/minhdepzai-v/LibraryRobloc/refs/heads/main/RedzLibrary.lua"))()

local Window = RedzLib:MakeWindow({
  Title = "Aooni Nightmare",
  SubTitle = "by vomagla!!!",
  SaveFolder = "AooniStable"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 4) },
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Tabs
local MainTab = Window:MakeTab({"Main", "home"})
local VisualsTab = Window:MakeTab({"Visuals", "eye"})
local PlayerTab = Window:MakeTab({"Player", "user"})

--------------------------------------------------------------------------------
-- VARIABLES & SETTINGS
--------------------------------------------------------------------------------

local AutoInteractEnabled = false
local InteractRange = 10

-- ESP Toggles
local ESP_Monsters_Enabled = false 
local ESP_Items_Enabled = false    
local ESP_Players_Enabled = false  

-- Physics
local FullBrightEnabled = false
local WalkSpeedValue = 16
local JumpForce = 50
local ForceJumpEnabled = false

-- Storage
local ESP_Storage = {} -- Stores {Highlight, Billboard, Type}

-- Lighting Backup (to restore later)
local OriginalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    Ambient = Lighting.Ambient
}

--------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------

-- 1. TELEPORT TO DOLL
local function TeleportToDoll()
    local target = nil
    -- Search specifically for Doll
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name == "Doll" and obj:IsA("BasePart") then
            target = obj
            break
        elseif obj.Name == "Doll" and obj:IsA("Model") and obj.PrimaryPart then
            target = obj.PrimaryPart
            break
        end
    end

    if target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame + Vector3.new(0, 3, 0)
    end
end

-- 2. ROBUST ESP SYSTEM
local function CreateVisuals(obj, type)
    if ESP_Storage[obj] then return end -- Already has ESP

    local color
    if type == "Monster" then color = Color3.new(1, 0, 0) end -- Red
    if type == "Item" then color = Color3.new(0, 0, 1) end    -- Blue (Doll/Item)
    if type == "Player" then color = Color3.new(0, 1, 0) end  -- Green

    -- Highlight
    local hl = Instance.new("Highlight")
    hl.Name = "ESPHighlight"
    hl.FillColor = color
    hl.OutlineColor = color
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 0.1
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = obj
    
    -- Billboard
    local bb = Instance.new("BillboardGui")
    bb.Name = "ESPInfo"
    bb.Adornee = obj
    bb.Size = UDim2.new(0, 200, 0, 50)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = obj

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = color
    txt.TextStrokeTransparency = 0
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 13
    txt.Text = obj.Name
    txt.Parent = bb

    ESP_Storage[obj] = {
        Highlight = hl,
        Billboard = bb,
        TextLabel = txt,
        Type = type,
        BaseName = obj.Name
    }

    -- Cleanup
    obj.AncestryChanged:Connect(function(_, parent)
        if not parent then
            ESP_Storage[obj] = nil
        end
    end)
end

-- Scanner (Runs continuously to catch new items)
task.spawn(function()
    while true do
        -- Scan Workspace
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("Model") then
                -- Monsters
                if obj.Name == "Aooni" or obj.Name == "ColorPart" then
                    CreateVisuals(obj, "Monster")
                end
                -- Items & Dolls
                if obj.Name == "Item" or obj.Name == "Doll" then
                    CreateVisuals(obj, "Item")
                end
            end
        end
        -- Scan Players
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                CreateVisuals(plr.Character, "Player")
            end
        end
        task.wait(2) -- Scans for new objects every 2 seconds
    end
end)

-- Main Render Loop (Updates Visibility & Fullbright)
RunService.RenderStepped:Connect(function()
    
    -- [[ FULLBRIGHT ENFORCEMENT ]]
    if FullBrightEnabled then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(170, 170, 170)
        Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 170)
    end

    -- [[ ESP UPDATER ]]
    local myPos = Vector3.new(0,0,0)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        myPos = LocalPlayer.Character.HumanoidRootPart.Position
    end

    for obj, data in pairs(ESP_Storage) do
        if obj.Parent then
            local isVisible = false
            
            -- Check Toggles
            if data.Type == "Monster" and ESP_Monsters_Enabled then isVisible = true end
            if data.Type == "Item" and ESP_Items_Enabled then isVisible = true end
            if data.Type == "Player" and ESP_Players_Enabled then isVisible = true end

            data.Highlight.Enabled = isVisible
            data.Billboard.Enabled = isVisible

            -- Update Distance Text
            if isVisible then
                local objPos = (obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position) or (obj:IsA("BasePart") and obj.Position)
                if objPos then
                    local dist = (myPos - objPos).Magnitude
                    data.TextLabel.Text = string.format("%s\n[%.0f m]", data.BaseName, dist)
                end
            end
        else
            ESP_Storage[obj] = nil -- Garbage collect
        end
    end
end)


-- 3. AUTO INTERACT
task.spawn(function()
    while true do
        if AutoInteractEnabled then
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local root = LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(Workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Parent and v.Parent:IsA("BasePart") then
                            if (v.Parent.Position - root.Position).Magnitude <= InteractRange then
                                fireproximityprompt(v)
                            end
                        end
                    end
                end
            end)
        end
        task.wait(0.25)
    end
end)

-- 4. PLAYER MOVEMENT
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            -- Speed
            if hum.WalkSpeed ~= WalkSpeedValue then
                hum.WalkSpeed = WalkSpeedValue
            end
            -- Jump
            if ForceJumpEnabled then
                if not hum.UseJumpPower then hum.UseJumpPower = true end
                if hum.JumpPower < JumpForce then hum.JumpPower = JumpForce end
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if ForceJumpEnabled and input.KeyCode == Enum.KeyCode.Space and not gp then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
             LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

--------------------------------------------------------------------------------
-- UI CONSTRUCTION
--------------------------------------------------------------------------------

local InteractSection = MainTab:AddSection({"Interaction"})

MainTab:AddToggle({
    Name = "Auto Interact",
    Default = false,
    Callback = function(v)
        AutoInteractEnabled = v
    end
})

MainTab:AddSlider({
    Name = "Interact Range",
    Min = 1,
    Max = 50,
    Increase = 1,
    Default = 10,
    Callback = function(v)
        InteractRange = v
    end
})

local TpSection = MainTab:AddSection({"Teleport"})

MainTab:AddButton({"Teleport to Doll", function()
    TeleportToDoll()
end})

local LightSection = MainTab:AddSection({"Lighting"})

MainTab:AddToggle({
    Name = "Fullbright (Loop)",
    Default = false,
    Callback = function(v)
        FullBrightEnabled = v
        if not v then
            -- Restore defaults when disabled
            Lighting.Brightness = OriginalLighting.Brightness
            Lighting.ClockTime = OriginalLighting.ClockTime
            Lighting.FogEnd = OriginalLighting.FogEnd
            Lighting.Ambient = OriginalLighting.Ambient
        end
    end
})

-- VISUALS TAB
local EspSection = VisualsTab:AddSection({"ESP Settings"})

VisualsTab:AddToggle({
    Name = "ESP Monsters (Red)",
    Default = false,
    Callback = function(v)
        ESP_Monsters_Enabled = v
    end
})

VisualsTab:AddToggle({
    Name = "ESP Items & Dolls (Blue)",
    Default = false,
    Callback = function(v)
        ESP_Items_Enabled = v
    end
})

VisualsTab:AddToggle({
    Name = "ESP Players (Green)",
    Default = false,
    Callback = function(v)
        ESP_Players_Enabled = v
    end
})

-- PLAYER TAB
local PlayerSection = PlayerTab:AddSection({"Stats"})

PlayerTab:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 100,
    Increase = 1,
    Default = 16,
    Callback = function(v)
        WalkSpeedValue = v
    end
})

PlayerTab:AddToggle({
    Name = "Force Jump",
    Default = false,
    Callback = function(v)
        ForceJumpEnabled = v
    end
})
