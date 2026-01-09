local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Visual by vomagla",
   LoadingTitle = "Visual Menu",
   LoadingSubtitle = "by vomagla",
   KeySystem = false
})

-- Main Tab (первая вкладка)
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateParagraph({
   Title = "Важная информация",
   Content = "ВСЕ ФУНКЦИИ ВЕЗУАЛЬНЫ. их некто не видит кроме вас."
})

-- Chinese Hat Tab
local ChineseTab = Window:CreateTab("Chinese Hat", 4483362458)
local player = game.Players.LocalPlayer
local hatParts = {}
local hatEnabled = false
local hatTransparency = 0.3
local hatColor = Color3.fromRGB(0, 255, 255)

local function addHat(char)
    task.wait(0.1)
    local head = char:WaitForChild("Head")
    local hat = Instance.new("Part")
    hat.Name = "Hat"
    hat.Transparency = hatTransparency
    hat.Color = hatColor
    hat.Material = Enum.Material.Neon
    
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = "rbxassetid://1033714"
    mesh.Scale = Vector3.new(2.4, 1.6, 2.4)
    mesh.Parent = hat
    
    local weld = Instance.new("Weld")
    weld.Part0 = head
    weld.Part1 = hat
    weld.C0 = CFrame.new(0, 1.1, 0)
    hat.Parent = char
    weld.Parent = hat
    
    hatParts[char] = hat
end

local function updateHats()
    for char, hat in pairs(hatParts) do
        if hat and hat.Parent then
            hat.Transparency = hatTransparency
            hat.Color = hatColor
        end
    end
end

ChineseTab:CreateToggle({
   Name = "Enable Chinese Hat",
   CurrentValue = false,
   Flag = "HatToggle",
   Callback = function(value)
      hatEnabled = value
      if value and player.Character then
         addHat(player.Character)
      end
   end
})

ChineseTab:CreateSlider({
   Name = "Transparency",
   Range = {0, 1},
   Increment = 0.01,
   CurrentValue = 0.3,
   Flag = "HatTransparency",
   Callback = function(value)
      hatTransparency = value
      updateHats()
   end
})

ChineseTab:CreateColorPicker({
   Name = "Hat Color",
   Color = Color3.fromRGB(0, 255, 255),
   Flag = "HatColor",
   Callback = function(color)
      hatColor = color
      updateHats()
   end
})

-- Trail Tab
local TrailTab = Window:CreateTab("Trail", 4483362458)
local trailParts = {}
local trailEnabled = false
local trailLifetime = 0.5
local trailTransparencyStart = 0
local trailColor = ColorSequence.new(Color3.fromRGB(0, 255, 255))

local function addTrail(character)
    local torso = character:WaitForChild("HumanoidRootPart")
    
    local attachment0 = Instance.new("Attachment")
    attachment0.Position = Vector3.new(0, 2, 0)
    attachment0.Parent = torso
    
    local attachment1 = Instance.new("Attachment")
    attachment1.Position = Vector3.new(0, -2, 0)
    attachment1.Parent = torso
    
    local trail = Instance.new("Trail")
    trail.Attachment0 = attachment0
    trail.Attachment1 = attachment1
    trail.Lifetime = trailLifetime
    trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, trailTransparencyStart),
        NumberSequenceKeypoint.new(1, 1)
    })
    trail.Color = trailColor
    trail.LightEmission = 0.7
    trail.Enabled = true
    trail.Parent = character
    
    trailParts[character] = trail
end

TrailTab:CreateToggle({
   Name = "Enable Trail",
   CurrentValue = false,
   Flag = "TrailToggle",
   Callback = function(value)
      trailEnabled = value
      if value and player.Character then
         addTrail(player.Character)
      end
   end
})

TrailTab:CreateSlider({
   Name = "Trail Lifetime",
   Range = {0.1, 3},
   Increment = 0.1,
   CurrentValue = 0.5,
   Flag = "TrailLifetime",
   Callback = function(value)
      trailLifetime = value
      for _, trail in pairs(trailParts) do
         if trail then trail.Lifetime = value end
      end
   end
})

TrailTab:CreateSlider({
   Name = "Trail Transparency",
   Range = {0, 1},
   Increment = 0.01,
   CurrentValue = 0,
   Flag = "TrailTransparency",
   Callback = function(value)
      trailTransparencyStart = value
      for _, trail in pairs(trailParts) do
         if trail then 
            trail.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, value),
                NumberSequenceKeypoint.new(1, 1)
            })
         end
      end
   end
})

TrailTab:CreateColorPicker({
   Name = "Trail Color",
   Color = Color3.fromRGB(0, 255, 255),
   Flag = "TrailColor",
   Callback = function(color)
      trailColor = ColorSequence.new(color)
      for _, trail in pairs(trailParts) do
         if trail then trail.Color = trailColor end
      end
   end
})

-- Screen Tab
local ScreenTab = Window:CreateTab("Screen", 4483362458)
local camera = workspace.CurrentCamera
local screenEnabled = false
local screenIntensity = 0
local screenConnection

ScreenTab:CreateToggle({
   Name = "Enable Screen Effect",
   CurrentValue = false,
   Flag = "ScreenToggle",
   Callback = function(value)
      screenEnabled = value
      if value then
         getgenv().gg_scripters = "Aori0001"
         screenConnection = game:GetService("RunService").RenderStepped:Connect(function()
            camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, (0.65 + screenIntensity), 0, 0, 0, 1)
         end)
      else
         if screenConnection then
            screenConnection:Disconnect()
            screenConnection = nil
         end
         getgenv().gg_scripters = nil
      end
   end
})

ScreenTab:CreateSlider({
   Name = "Screen Stretch",
   Range = {0, 0.2},
   Increment = 0.001,
   CurrentValue = 0,
   Flag = "ScreenIntensity",
   Callback = function(value)
      screenIntensity = value
   end
})

-- Sky Tab (ИСПРАВЛЕНО - время меняется всегда)
local SkyTab = Window:CreateTab("Sky", 4483362458)
local Lighting = game:GetService("Lighting")
local currentTime = Lighting.ClockTime

-- Время меняется сразу без toggle
game:GetService("RunService").Heartbeat:Connect(function()
   Lighting.ClockTime = currentTime
end)

SkyTab:CreateSlider({
   Name = "Sky Time (0-24)",
   Range = {0, 24},
   Increment = 0.1,
   CurrentValue = 12,
   Flag = "SkyTime",
   Callback = function(value)
      currentTime = value
   end
})

-- ForceField Tab
local ForceFieldTab = Window:CreateTab("ForceField", 4483362458)
local ffEnabled = false
local ffColor = Color3.fromRGB(128, 128, 128)
local originalColors = {}

local function saveOriginalColors()
    if player.Character then
        originalColors = {}
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "Hat" then
                originalColors[part] = part.Color
            end
        end
    end
end

local function applyForceField()
   if player.Character then
      saveOriginalColors()
      for _, part in pairs(player.Character:GetDescendants()) do
         if part:IsA("BasePart") and part.Name ~= "Hat" then
            part.Color = ffColor
            part.Material = Enum.Material.ForceField
         end
      end
   end
end

local function removeForceField()
   if player.Character then
      for part, color in pairs(originalColors) do
         if part and part.Parent and part:IsA("BasePart") then
            part.Color = color
            part.Material = Enum.Material.Plastic
         end
      end
      originalColors = {}
   end
end

ForceFieldTab:CreateToggle({
   Name = "Enable ForceField",
   CurrentValue = false,
   Flag = "ForceFieldToggle",
   Callback = function(value)
      ffEnabled = value
      if value then
         applyForceField()
      else
         removeForceField()
      end
   end
})

ForceFieldTab:CreateColorPicker({
   Name = "ForceField Color",
   Color = Color3.fromRGB(128, 128, 128),
   Flag = "FFColor",
   Callback = function(color)
      ffColor = color
      if ffEnabled then
         applyForceField()
      end
   end
})

-- Auto respawn
player.CharacterAdded:Connect(function(char)
   task.wait(0.5)
   if hatEnabled then addHat(char) end
   if trailEnabled then addTrail(char) end
   if ffEnabled then applyForceField() end
end)

Rayfield:Notify({
   Title = "Visual by vomagla",
   Content = "Main tab added! Sky time works without toggle",
   Duration = 4,
   Image = 4483362458
})
