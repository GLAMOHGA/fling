local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Visual by vomagla (Fixed)",
   LoadingTitle = "Visual Menu Combined",
   LoadingSubtitle = "by vomagla",
   KeySystem = false,
   Theme = {
      TextColor = Color3.fromRGB(240, 240, 240),
      Background = Color3.fromRGB(5, 5, 5),
      Topbar = Color3.fromRGB(10, 10, 10),
      Shadow = Color3.fromRGB(0, 0, 0),
      NotificationBackground = Color3.fromRGB(5, 5, 5),
      NotificationActionsBackground = Color3.fromRGB(200, 200, 200),
      TabBackground = Color3.fromRGB(15, 15, 15),
      TabStroke = Color3.fromRGB(80, 80, 80),
      TabBackgroundSelected = Color3.fromRGB(30, 30, 30),
      TabTextColor = Color3.fromRGB(240, 240, 240),
      SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
      ElementBackground = Color3.fromRGB(10, 10, 10),
      ElementBackgroundHover = Color3.fromRGB(20, 20, 20),
      SecondaryElementBackground = Color3.fromRGB(5, 5, 5),
      ElementStroke = Color3.fromRGB(100, 100, 100),
      SecondaryElementStroke = Color3.fromRGB(70, 70, 70),
      SliderBackground = Color3.fromRGB(25, 25, 25),
      SliderProgress = Color3.fromRGB(0, 255, 255),
      SliderStroke = Color3.fromRGB(120, 120, 120),
      ToggleBackground = Color3.fromRGB(15, 15, 15),
      ToggleEnabled = Color3.fromRGB(0, 255, 255),
      ToggleDisabled = Color3.fromRGB(80, 80, 80),
      ToggleEnabledStroke = Color3.fromRGB(0, 255, 255),
      ToggleDisabledStroke = Color3.fromRGB(120, 120, 120),
      ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
      ToggleDisabledOuterStroke = Color3.fromRGB(70, 70, 70),
      DropdownSelected = Color3.fromRGB(25, 25, 25),
      DropdownUnselected = Color3.fromRGB(15, 15, 15),
      InputBackground = Color3.fromRGB(15, 15, 15),
      InputStroke = Color3.fromRGB(80, 80, 80),
      PlaceholderColor = Color3.fromRGB(150, 150, 150)
   }
})

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local defaultLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient = Lighting.Ambient,
    FogStart = Lighting.FogStart,
    FogEnd = Lighting.FogEnd,
    FogColor = Lighting.FogColor
}

local DefaultSky = Lighting:FindFirstChildOfClass("Sky")
local DefaultSkySettings = {}
if DefaultSky then
    DefaultSkySettings.SkyboxBk = DefaultSky.SkyboxBk
    DefaultSkySettings.SkyboxDn = DefaultSky.SkyboxDn
    DefaultSkySettings.SkyboxFt = DefaultSky.SkyboxFt
    DefaultSkySettings.SkyboxLf = DefaultSky.SkyboxLf
    DefaultSkySettings.SkyboxRt = DefaultSky.SkyboxRt
    DefaultSkySettings.SkyboxUp = DefaultSky.SkyboxUp
end

-- Удалена Green Aura, исправлен список
local AuraModels = {
    ['Godly'] = 'rbxassetid://16699750981',
    ['Super Sayien'] = 'rbxassetid://116109508364297',
    ['North Star'] = 'rbxassetid://83945069652732',
    ['Blue Lord'] = 'rbxassetid://10974316799',
    ['Pink Aura'] = 'rbxassetid://115980859615239',
    ['Angel Wing'] = 'rbxassetid://90022969696073',
    ['Sweet Heart'] = 'rbxassetid://91724768175470',
    ['Ethereal Aura'] = 'rbxassetid://97041568674250',
}

local SkyboxAssets = {
    ["Black Storm"] = {
        Bk = "rbxassetid://15502511288", Dn = "rbxassetid://15502508460",
        Ft = "rbxassetid://15502510289", Lf = "rbxassetid://15502507918",
        Rt = "rbxassetid://15502509398", Up = "rbxassetid://15502511911"
    },
    ["HD"] = {
        Bk = "http://www.roblox.com/asset/?id=16553658937", Dn = "http://www.roblox.com/asset/?id=16553660713",
        Ft = "http://www.roblox.com/asset/?id=16553662144", Lf = "http://www.roblox.com/asset/?id=16553664042",
        Rt = "http://www.roblox.com/asset/?id=16553665766", Up = "http://www.roblox.com/asset/?id=16553667750"
    },
    ["Snow"] = {
        Bk = "http://www.roblox.com/asset/?id=155657655", Dn = "http://www.roblox.com/asset/?id=155674246",
        Ft = "http://www.roblox.com/asset/?id=155657609", Lf = "http://www.roblox.com/asset/?id=155657671",
        Rt = "http://www.roblox.com/asset/?id=155657619", Up = "http://www.roblox.com/asset/?id=155674931"
    },
    ["Blue Space"] = {
        Bk = "rbxassetid://15536110634", Dn = "rbxassetid://15536112543",
        Ft = "rbxassetid://15536116141", Lf = "rbxassetid://15536114370",
        Rt = "rbxassetid://15536118762", Up = "rbxassetid://15536117282"
    },
    ["Realistic"] = {
        Bk = "rbxassetid://653719502", Dn = "rbxassetid://653718790",
        Ft = "rbxassetid://653719067", Lf = "rbxassetid://653719190",
        Rt = "rbxassetid://653718931", Up = "rbxassetid://653719321"
    },
    ["Stormy"] = {
        Bk = "http://www.roblox.com/asset/?id=18703245834", Dn = "http://www.roblox.com/asset/?id=18703243349",
        Ft = "http://www.roblox.com/asset/?id=18703240532", Lf = "http://www.roblox.com/asset/?id=18703237556",
        Rt = "http://www.roblox.com/asset/?id=18703235430", Up = "http://www.roblox.com/asset/?id=18703232671"
    },
    ["Pink"] = {
        Bk = "rbxassetid://12216109205", Dn = "rbxassetid://12216109875",
        Ft = "rbxassetid://12216109489", Lf = "rbxassetid://12216110170",
        Rt = "rbxassetid://12216110471", Up = "rbxassetid://12216108877"
    },
    ["Sunset"] = {
        Bk = "rbxassetid://600830446", Dn = "rbxassetid://600831635",
        Ft = "rbxassetid://600832720", Lf = "rbxassetid://600886090",
        Rt = "rbxassetid://600833862", Up = "rbxassetid://600835177"
    },
    ["Arctic"] = {
        Bk = "http://www.roblox.com/asset/?id=225469390", Dn = "http://www.roblox.com/asset/?id=225469395",
        Ft = "http://www.roblox.com/asset/?id=225469403", Lf = "http://www.roblox.com/asset/?id=225469450",
        Rt = "http://www.roblox.com/asset/?id=225469471", Up = "http://www.roblox.com/asset/?id=225469481"
    },
    ["Space"] = {
        Bk = "http://www.roblox.com/asset/?id=166509999", Dn = "http://www.roblox.com/asset/?id=166510057",
        Ft = "http://www.roblox.com/asset/?id=166510116", Lf = "http://www.roblox.com/asset/?id=166510092",
        Rt = "http://www.roblox.com/asset/?id=166510131", Up = "http://www.roblox.com/asset/?id=166510114"
    },
    ["Roblox Default"] = {
        Bk = "rbxasset://textures/sky/sky512_bk.tex", Dn = "rbxasset://textures/sky/sky512_dn.tex",
        Ft = "rbxasset://textures/sky/sky512_ft.tex", Lf = "rbxasset://textures/sky/sky512_lf.tex",
        Rt = "rbxasset://textures/sky/sky512_rt.tex", Up = "rbxasset://textures/sky/sky512_up.tex"
    },
    ["Red Night"] = {
        Bk = "http://www.roblox.com/asset/?id=401664839", Dn = "http://www.roblox.com/asset/?id=401664862",
        Ft = "http://www.roblox.com/asset/?id=401664960", Lf = "http://www.roblox.com/asset/?id=401664881",
        Rt = "http://www.roblox.com/asset/?id=401664901", Up = "http://www.roblox.com/asset/?id=401664936"
    },
    ["Deep Space 1"] = {
        Bk = "http://www.roblox.com/asset/?id=149397692", Dn = "http://www.roblox.com/asset/?id=149397686",
        Ft = "http://www.roblox.com/asset/?id=149397697", Lf = "http://www.roblox.com/asset/?id=149397684",
        Rt = "http://www.roblox.com/asset/?id=149397688", Up = "http://www.roblox.com/asset/?id=149397702"
    },
    ["Pink Skies"] = {
        Bk = "http://www.roblox.com/asset/?id=151165214", Dn = "http://www.roblox.com/asset/?id=151165197",
        Ft = "http://www.roblox.com/asset/?id=151165224", Lf = "http://www.roblox.com/asset/?id=151165191",
        Rt = "http://www.roblox.com/asset/?id=151165206", Up = "http://www.roblox.com/asset/?id=151165227"
    },
    ["Purple Sunset"] = {
        Bk = "rbxassetid://264908339", Dn = "rbxassetid://264907909",
        Ft = "rbxassetid://264909420", Lf = "rbxassetid://264909758",
        Rt = "rbxassetid://264908886", Up = "rbxassetid://264907379"
    },
    ["Blue Night"] = {
        Bk = "http://www.roblox.com/asset/?id=12064107", Dn = "http://www.roblox.com/asset/?id=12064152",
        Ft = "http://www.roblox.com/asset/?id=12064121", Lf = "http://www.roblox.com/asset/?id=12063984",
        Rt = "http://www.roblox.com/asset/?id=12064115", Up = "http://www.roblox.com/asset/?id=12064131"
    },
    ["Blossom Daylight"] = {
        Bk = "http://www.roblox.com/asset/?id=271042516", Dn = "http://www.roblox.com/asset/?id=271077243",
        Ft = "http://www.roblox.com/asset/?id=271042556", Lf = "http://www.roblox.com/asset/?id=271042310",
        Rt = "http://www.roblox.com/asset/?id=271042467", Up = "http://www.roblox.com/asset/?id=271077958"
    },
    ["Blue Nebula"] = {
        Bk = "http://www.roblox.com/asset?id=135207744", Dn = "http://www.roblox.com/asset?id=135207662",
        Ft = "http://www.roblox.com/asset?id=135207770", Lf = "http://www.roblox.com/asset?id=135207615",
        Rt = "http://www.roblox.com/asset?id=135207695", Up = "http://www.roblox.com/asset?id=135207794"
    },
    ["Blue Planet"] = {
        Bk = "rbxassetid://218955819", Dn = "rbxassetid://218953419",
        Ft = "rbxassetid://218954524", Lf = "rbxassetid://218958493",
        Rt = "rbxassetid://218957134", Up = "rbxassetid://218950090"
    },
    ["Deep Space 2"] = {
        Bk = "http://www.roblox.com/asset/?id=159248188", Dn = "http://www.roblox.com/asset/?id=159248183",
        Ft = "http://www.roblox.com/asset/?id=159248187", Lf = "http://www.roblox.com/asset/?id=159248173",
        Rt = "http://www.roblox.com/asset/?id=159248192", Up = "http://www.roblox.com/asset/?id=159248176"
    },
    ["Summer"] = {
        Bk = "rbxassetid://16648590964", Dn = "rbxassetid://16648617436",
        Ft = "rbxassetid://16648595424", Lf = "rbxassetid://16648566370",
        Rt = "rbxassetid://16648577071", Up = "rbxassetid://16648598180"
    },
    ["Galaxy"] = {
        Bk = "rbxassetid://15983968922", Dn = "rbxassetid://15983966825",
        Ft = "rbxassetid://15983965025", Lf = "rbxassetid://15983967420",
        Rt = "rbxassetid://15983966246", Up = "rbxassetid://15983964246"
    },
    ["Stylized"] = {
        Bk = "rbxassetid://18351376859", Dn = "rbxassetid://18351374919",
        Ft = "rbxassetid://18351376800", Lf = "rbxassetid://18351376469",
        Rt = "rbxassetid://18351376457", Up = "rbxassetid://18351377189"
    },
    ["Minecraft"] = {
        Bk = "rbxassetid://8735166756", Dn = "http://www.roblox.com/asset/?id=8735166707",
        Ft = "http://www.roblox.com/asset/?id=8735231668", Lf = "http://www.roblox.com/asset/?id=8735166755",
        Rt = "http://www.roblox.com/asset/?id=8735166751", Up = "http://www.roblox.com/asset/?id=8735166729"
    },
    ["Sunset 2"] = {
        Bk = "http://www.roblox.com/asset/?id=151165214", Dn = "http://www.roblox.com/asset/?id=151165197",
        Ft = "http://www.roblox.com/asset/?id=151165224", Lf = "http://www.roblox.com/asset/?id=151165191",
        Rt = "http://www.roblox.com/asset/?id=151165206", Up = "http://www.roblox.com/asset/?id=151165227"
    },
    ["Cloudy Rain"] = {
        Bk = "http://www.roblox.com/asset/?id=4498828382", Dn = "http://www.roblox.com/asset/?id=4498828812",
        Ft = "http://www.roblox.com/asset/?id=4498829917", Lf = "http://www.roblox.com/asset/?id=4498830911",
        Rt = "http://www.roblox.com/asset/?id=4498830417", Up = "http://www.roblox.com/asset/?id=4498831746"
    },
    ["Black Cloudy Rain"] = {
        Bk = "http://www.roblox.com/asset/?id=149679669", Dn = "http://www.roblox.com/asset/?id=149681979",
        Ft = "http://www.roblox.com/asset/?id=149679690", Lf = "http://www.roblox.com/asset/?id=149679709",
        Rt = "http://www.roblox.com/asset/?id=149679722", Up = "http://www.roblox.com/asset/?id=149680199"
    }
}

-- Hat
local hatEnabled = false
local hatTransparency = 0.3
local hatRainbow = false
local hatColor = Color3.fromRGB(0, 255, 255)

-- Trail
local trailEnabled = false
local trailIsGradient = false
local trailLifetime = 0.5
local trailTransparencyStart = 0
local trailRainbow = false
local trailColorStatic = Color3.fromRGB(0, 255, 255)
local trailGradient1 = Color3.fromRGB(0, 86, 255)
local trailGradient2 = Color3.fromRGB(255, 0, 0)

-- Skin Trail
local skinTrailEnabled = false
local skinTrailColor = Color3.fromRGB(255, 0, 0)
local skinTrailLife = 0.5

-- World
local ffEnabled = false
local screenEnabled = false
local animeImageEnabled = false
local fpsPingEnabled = false
local fpsPingEnabled2 = false

-- Lighting
local worldTimeEnabled = false
local worldTimeValue = 12
local fullBrightEnabled = false

-- Nebula
local nebulaEnabled = false
local nebulaThemeColor = Color3.fromRGB(173, 216, 230)

-- Skybox
local currentSkybox = "HD"
local customSkyEnabled = false
local SkyboxToggleRef -- Reference for updating toggle UI if needed

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
MainTab:CreateParagraph({
   Title = "Visual Menu by vomagla",
   Content = "Fixed: Removed Green Aura, optimized Skybox. Nebula theme, 30+ skyboxes, Skin trail, Hat, ForceField, Auras and more."
})

-- ===================== CHINESE HAT =====================
local ChineseTab = Window:CreateTab("Chinese Hat", 4483362458)
local hatParts = {}
local hatConnection

local function removeHat(char)
   if hatParts[char] then hatParts[char]:Destroy(); hatParts[char] = nil end
end

local function addHat(char)
   task.wait(0.1)
   local head = char:WaitForChild("Head", 5)
   if not head then return end
   removeHat(char)

   local hat = Instance.new("Part")
   hat.Name = "Hat"
   hat.Transparency = hatTransparency
   hat.Color = hatColor
   hat.Material = Enum.Material.Neon
   hat.CanCollide = false

   local mesh = Instance.new("SpecialMesh")
   mesh.MeshId = "rbxassetid://1033714"
   mesh.Scale = Vector3.new(2.4, 1.6, 2.4)
   mesh.Parent = hat

   local weld = Instance.new("WeldConstraint")
   weld.Part0 = head
   weld.Part1 = hat
   weld.Parent = hat

   hat.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
   hat.Parent = char
   hatParts[char] = hat
end

local function updateHats()
   for char, hat in pairs(hatParts) do
      if hat and hat.Parent and char == player.Character then
         hat.Transparency = hatTransparency
         if hatRainbow then
            hat.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
         else
            hat.Color = hatColor
         end
      end
   end
end

ChineseTab:CreateSection("Hat Settings")

ChineseTab:CreateToggle({
   Name = "Enable Chinese Hat", CurrentValue = false, Flag = "HatToggle",
   Callback = function(value)
      hatEnabled = value
      if value and player.Character then
         addHat(player.Character)
         if hatConnection then hatConnection:Disconnect() end
         hatConnection = RunService.Heartbeat:Connect(updateHats)
      else
         if player.Character then removeHat(player.Character) end
         if hatConnection then hatConnection:Disconnect(); hatConnection = nil end
      end
   end
})

ChineseTab:CreateToggle({
   Name = "Rainbow Hat", CurrentValue = false, Flag = "HatRainbow",
   Callback = function(value) hatRainbow = value; updateHats() end
})

ChineseTab:CreateSlider({
   Name = "Transparency", Range = {0, 1}, Increment = 0.01, CurrentValue = 0.3, Flag = "HatTransparency",
   Callback = function(value) hatTransparency = value; updateHats() end
})

ChineseTab:CreateColorPicker({
   Name = "Hat Color", Color = Color3.fromRGB(0, 255, 255), Flag = "HatColor",
   Callback = function(color) hatColor = color; updateHats() end
})

-- ===================== TRAIL =====================
local TrailTab = Window:CreateTab("Trail", 4483362458)
local trailParts = {}
local trailConnection

local function removeTrail(char)
   if trailParts[char] then trailParts[char]:Destroy(); trailParts[char] = nil end
   if char and char:FindFirstChild("HumanoidRootPart") then
      local torso = char.HumanoidRootPart
      if torso:FindFirstChild("TrailAttach0") then torso.TrailAttach0:Destroy() end
      if torso:FindFirstChild("TrailAttach1") then torso.TrailAttach1:Destroy() end
   end
end

local function addTrail(character)
   local torso = character:WaitForChild("HumanoidRootPart", 5)
   if not torso then return end
   removeTrail(character)

   local a0 = Instance.new("Attachment"); a0.Name = "TrailAttach0"; a0.Position = Vector3.new(0, 2, 0); a0.Parent = torso
   local a1 = Instance.new("Attachment"); a1.Name = "TrailAttach1"; a1.Position = Vector3.new(0, -2, 0); a1.Parent = torso

   local trail = Instance.new("Trail")
   trail.Attachment0 = a0; trail.Attachment1 = a1
   trail.Lifetime = trailLifetime
   trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, trailTransparencyStart), NumberSequenceKeypoint.new(1, 1)})
   if trailIsGradient then
       trail.Color = ColorSequence.new(trailGradient1, trailGradient2)
   else
       trail.Color = ColorSequence.new(trailColorStatic)
   end
   trail.LightEmission = 0.2; trail.Enabled = true; trail.Parent = character
   trailParts[character] = trail
end

local function updateTrails()
   for char, trail in pairs(trailParts) do
      if trail and trail.Parent and char == player.Character then
         trail.Lifetime = trailLifetime
         trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, trailTransparencyStart), NumberSequenceKeypoint.new(1, 1)})
         if trailIsGradient then
             trail.Color = ColorSequence.new(trailGradient1, trailGradient2)
         else
             if trailRainbow then
                trail.Color = ColorSequence.new(Color3.fromHSV(tick() % 5 / 5, 1, 1))
             else
                trail.Color = ColorSequence.new(trailColorStatic)
             end
         end
      end
   end
end

TrailTab:CreateToggle({
   Name = "Enable Trail", CurrentValue = false, Flag = "TrailToggle",
   Callback = function(value)
      trailEnabled = value
      if value and player.Character then
         addTrail(player.Character)
         if trailConnection then trailConnection:Disconnect() end
         trailConnection = RunService.Heartbeat:Connect(updateTrails)
      else
         if player.Character then removeTrail(player.Character) end
         if trailConnection then trailConnection:Disconnect(); trailConnection = nil end
      end
   end
})

TrailTab:CreateSection("Style Settings")

TrailTab:CreateToggle({
   Name = "Use Gradient Mode", CurrentValue = false, Flag = "TrailGradientMode",
   Callback = function(value) trailIsGradient = value; if trailEnabled and player.Character then addTrail(player.Character) end end
})

TrailTab:CreateColorPicker({
   Name = "Gradient Color 1", Color = Color3.fromRGB(0, 86, 255), Flag = "TrailG1",
   Callback = function(color) trailGradient1 = color; updateTrails() end
})

TrailTab:CreateColorPicker({
   Name = "Gradient Color 2", Color = Color3.fromRGB(255, 0, 0), Flag = "TrailG2",
   Callback = function(color) trailGradient2 = color; updateTrails() end
})

TrailTab:CreateSection("Simple Style Settings")

TrailTab:CreateToggle({
   Name = "Rainbow (Simple Mode)", CurrentValue = false, Flag = "TrailRainbow",
   Callback = function(value) trailRainbow = value; updateTrails() end
})

TrailTab:CreateColorPicker({
   Name = "Static Color", Color = Color3.fromRGB(0, 255, 255), Flag = "TrailColor",
   Callback = function(color) trailColorStatic = color; updateTrails() end
})

TrailTab:CreateSection("General Settings")

TrailTab:CreateSlider({
   Name = "Trail Lifetime", Range = {0.1, 3}, Increment = 0.1, CurrentValue = 0.5, Flag = "TrailLifetime",
   Callback = function(value) trailLifetime = value; updateTrails() end
})

TrailTab:CreateSlider({
   Name = "Trail Transparency Start", Range = {0, 1}, Increment = 0.01, CurrentValue = 0, Flag = "TrailTransparency",
   Callback = function(value) trailTransparencyStart = value; updateTrails() end
})

-- ===================== SKIN TAB =====================
local SkinTab = Window:CreateTab("Skin", 4483362458)

SkinTab:CreateSection("ForceField Skin")

local ffColor = Color3.fromRGB(128, 128, 128)
local ffRainbow = false
local originalColors = {}
local ffConnection

local function saveOriginalColors(char)
   originalColors[char] = {}
   for _, part in pairs(char:GetDescendants()) do
      if part:IsA("BasePart") and part.Name ~= "Hat" then
         originalColors[char][part] = {Color = part.Color, Material = part.Material}
      end
   end
end

local function applyForceField(char)
   saveOriginalColors(char)
   for _, part in pairs(char:GetDescendants()) do
      if part:IsA("BasePart") and part.Name ~= "Hat" then
         part.Color = ffColor; part.Material = Enum.Material.ForceField
      end
   end
end

local function updateForceField()
   if player.Character and ffEnabled then
      for _, part in pairs(player.Character:GetDescendants()) do
         if part:IsA("BasePart") and part.Name ~= "Hat" and part.Material == Enum.Material.ForceField then
            if ffRainbow then
               part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            else
               part.Color = ffColor
            end
         end
      end
   end
end

local function removeForceField(char)
   if originalColors[char] then
      for part, data in pairs(originalColors[char]) do
         if part and part.Parent and part:IsA("BasePart") then
            part.Color = data.Color; part.Material = data.Material
         end
      end
      originalColors[char] = {}
   end
end

SkinTab:CreateToggle({
   Name = "Enable ForceField", CurrentValue = false, Flag = "ForceFieldToggle",
   Callback = function(value)
      ffEnabled = value
      if player.Character then
         if value then
            applyForceField(player.Character)
            if ffConnection then ffConnection:Disconnect() end
            ffConnection = RunService.Heartbeat:Connect(updateForceField)
         else
            if ffConnection then ffConnection:Disconnect(); ffConnection = nil end
            removeForceField(player.Character)
         end
      end
   end
})

SkinTab:CreateToggle({
   Name = "Rainbow ForceField", CurrentValue = false, Flag = "FFRainbow",
   Callback = function(value) ffRainbow = value; updateForceField() end
})

SkinTab:CreateColorPicker({
   Name = "ForceField Color", Color = Color3.fromRGB(128, 128, 128), Flag = "FFColor",
   Callback = function(color)
      ffColor = color
      if ffEnabled and not ffRainbow and player.Character then applyForceField(player.Character) end
   end
})

SkinTab:CreateSection("Textured Skin Trail")

local function toggleSkinTrail(enabled)
    local character = player.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, v in pairs(character:GetChildren()) do
        if v:IsA("BasePart") and v ~= hrp then
            if enabled then
                if not v:FindFirstChild("SkinTrail") then
                    local trail = Instance.new("Trail")
                    trail.Name = "SkinTrail"
                    trail.Texture = "rbxassetid://1390780157"
                    trail.Parent = v

                    local p1 = Instance.new("Attachment", v)
                    p1.Name = "SkinPointer1"

                    local p2 = Instance.new("Attachment", hrp)
                    p2.Name = "SkinPointer2"

                    trail.Attachment0 = p1
                    trail.Attachment1 = p2
                    trail.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, skinTrailColor),
                        ColorSequenceKeypoint.new(1, skinTrailColor)
                    })
                    trail.Lifetime = skinTrailLife
                end
            else
                if v:FindFirstChild("SkinTrail") then v.SkinTrail:Destroy() end
                if v:FindFirstChild("SkinPointer1") then v.SkinPointer1:Destroy() end
            end
        end
    end

    if not enabled then
        for _, obj in pairs(hrp:GetChildren()) do
            if obj.Name == "SkinPointer2" then obj:Destroy() end
        end
    end
end

local function updateSkinTrail()
    local character = player.Character
    if not character then return end
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("Trail") and v.Name == "SkinTrail" then
            v.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, skinTrailColor),
                ColorSequenceKeypoint.new(1, skinTrailColor)
            })
            v.Lifetime = skinTrailLife
        end
    end
end

SkinTab:CreateToggle({
   Name = "Enable Skin Trail", CurrentValue = false, Flag = "SkinTrailToggle",
   Callback = function(value)
      skinTrailEnabled = value
      toggleSkinTrail(value)
   end
})

SkinTab:CreateColorPicker({
   Name = "Skin Trail Color", Color = Color3.fromRGB(255, 0, 0), Flag = "SkinTrailColor",
   Callback = function(color) skinTrailColor = color; if skinTrailEnabled then updateSkinTrail() end end
})

SkinTab:CreateSlider({
   Name = "Skin Trail Lifetime", Range = {0.1, 3}, Increment = 0.1, CurrentValue = 0.5, Flag = "SkinTrailLife",
   Callback = function(value) skinTrailLife = value; if skinTrailEnabled then updateSkinTrail() end end
})

-- ===================== AURAS =====================
local AuraTab = Window:CreateTab("Auras", 4483362458)
local auraEnabled = false
local auraType = "Godly" -- Changed default
local customAuraID = ""
local currentAuraModel = nil
local auraEffects = {}

local function loadModel(id)
    local s, r = pcall(function() return game:GetObjects(id)[1] end)
    if not s then return nil end; return r
end

local function disableAura()
    for _, v in pairs(auraEffects) do if v and v.Parent then v:Destroy() end end; auraEffects = {}
end

local function enableAura(char)
    disableAura()
    if not currentAuraModel then return end
    local tempModel = currentAuraModel:Clone()
    for _, obj in pairs(tempModel:GetDescendants()) do
        if not obj:IsA('BasePart') then
            local clone = obj:Clone()
            local parentName = obj.Parent and obj.Parent.Name
            local target = char:FindFirstChild(parentName)
            if not target then target = char:FindFirstChildWhichIsA('BasePart') end
            if target and not target:FindFirstChild(clone.Name) then
                clone.Parent = target; table.insert(auraEffects, clone)
            end
        end
    end
    tempModel:Destroy()
end

local function updateAuraLogic()
    local idToLoad
    if customAuraID ~= "" then
        idToLoad = 'rbxassetid://' .. customAuraID:gsub('%D', '')
    else
        idToLoad = AuraModels[auraType]
    end
    if not idToLoad then return end
    local newModel = loadModel(idToLoad)
    if newModel then
        currentAuraModel = newModel
        if auraEnabled and player.Character then enableAura(player.Character) end
    end
end

AuraTab:CreateToggle({
    Name = "Enable Local Aura", CurrentValue = false, Flag = "AuraToggle",
    Callback = function(value)
        auraEnabled = value
        if value then
            if not currentAuraModel then updateAuraLogic() end
            if player.Character then enableAura(player.Character) end
        else disableAura() end
    end
})

local auraList = {}
for k in pairs(AuraModels) do table.insert(auraList, k) end

AuraTab:CreateDropdown({
    Name = "Aura Type", Options = auraList, CurrentOption = "Godly", Flag = "AuraTypeDropdown",
    Callback = function(Option)
        auraType = Option[1]; customAuraID = ""
        if auraEnabled then updateAuraLogic() end
    end,
})

-- ===================== WORLD =====================
local WorldTab = Window:CreateTab("World", 4483362458)

WorldTab:CreateSection("Skybox Settings")

local skyList = {}
for k in pairs(SkyboxAssets) do table.insert(skyList, k) end
table.sort(skyList)

local function applySkybox(name)
    local sb = SkyboxAssets[name]
    if not sb then return end
    
    -- Optimize: Don't destroy/create unnecessarily to be instant
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if not sky then 
        sky = Instance.new("Sky")
        sky.Name = "Sky" 
        sky.Parent = Lighting
    end
    
    sky.SkyboxBk = sb.Bk
    sky.SkyboxDn = sb.Dn
    sky.SkyboxFt = sb.Ft
    sky.SkyboxLf = sb.Lf
    sky.SkyboxRt = sb.Rt
    sky.SkyboxUp = sb.Up
end

local function restoreDefaultSky()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky and DefaultSkySettings.SkyboxBk then
        sky.SkyboxBk = DefaultSkySettings.SkyboxBk
        sky.SkyboxDn = DefaultSkySettings.SkyboxDn
        sky.SkyboxFt = DefaultSkySettings.SkyboxFt
        sky.SkyboxLf = DefaultSkySettings.SkyboxLf
        sky.SkyboxRt = DefaultSkySettings.SkyboxRt
        sky.SkyboxUp = DefaultSkySettings.SkyboxUp
    elseif sky then
        sky:Destroy()
    end
end

WorldTab:CreateDropdown({
   Name = "Select Skybox", Options = skyList, CurrentOption = "HD", Flag = "SkyboxDropdown",
   Callback = function(Option)
      currentSkybox = Option[1]
      -- Instant Apply: Automatically enable toggle if selecting from list
      if not customSkyEnabled then
          customSkyEnabled = true
          if SkyboxToggleRef then SkyboxToggleRef:Set(true) end -- Update toggle visually
      end
      applySkybox(currentSkybox)
   end
})

SkyboxToggleRef = WorldTab:CreateToggle({
   Name = "Enable Custom Skybox", CurrentValue = false, Flag = "CustomSkyToggle",
   Callback = function(value)
      customSkyEnabled = value
      if value then 
          applySkybox(currentSkybox) 
      else 
          restoreDefaultSky() 
      end
   end
})

WorldTab:CreateSection("Nebula Theme")

WorldTab:CreateToggle({
   Name = "Nebula Theme", CurrentValue = false, Flag = "NebulaTheme",
   Callback = function(value)
      nebulaEnabled = value
      if value then
         local b = Instance.new("BloomEffect", Lighting)
         b.Intensity = 0.7; b.Size = 24; b.Threshold = 1; b.Name = "NebulaBloom"

         local c = Instance.new("ColorCorrectionEffect", Lighting)
         c.Saturation = 0.5; c.Contrast = 0.2; c.TintColor = nebulaThemeColor; c.Name = "NebulaColorCorrection"

         local a = Instance.new("Atmosphere", Lighting)
         a.Density = 0.4; a.Offset = 0.25; a.Glare = 1; a.Haze = 2
         a.Color = nebulaThemeColor; a.Decay = Color3.fromRGB(173, 216, 230); a.Name = "NebulaAtmosphere"

         Lighting.Ambient = nebulaThemeColor
         Lighting.OutdoorAmbient = nebulaThemeColor
         Lighting.FogStart = 100; Lighting.FogEnd = 500; Lighting.FogColor = nebulaThemeColor
      else
         for _, name in pairs({"NebulaBloom", "NebulaColorCorrection", "NebulaAtmosphere"}) do
            local obj = Lighting:FindFirstChild(name)
            if obj then obj:Destroy() end
         end
         Lighting.Ambient = defaultLighting.Ambient
         Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
         Lighting.FogStart = defaultLighting.FogStart
         Lighting.FogEnd = defaultLighting.FogEnd
         Lighting.FogColor = defaultLighting.FogColor
      end
   end
})

WorldTab:CreateColorPicker({
   Name = "Nebula Color", Color = Color3.fromRGB(173, 216, 230), Flag = "NebulaColor",
   Callback = function(value)
      nebulaThemeColor = value
      if nebulaEnabled then
         local nc = Lighting:FindFirstChild("NebulaColorCorrection")
         if nc then nc.TintColor = value end
         local na = Lighting:FindFirstChild("NebulaAtmosphere")
         if na then na.Color = value end
         Lighting.Ambient = value; Lighting.OutdoorAmbient = value; Lighting.FogColor = value
      end
   end
})

WorldTab:CreateSection("Lighting & Time")

WorldTab:CreateToggle({
   Name = "Enable Time Changer", CurrentValue = false, Flag = "TimeToggle",
   Callback = function(value) worldTimeEnabled = value end
})

WorldTab:CreateSlider({
   Name = "Time (0-24)", Range = {0, 24}, Increment = 0.1, CurrentValue = 12, Flag = "TimeSlider",
   Callback = function(value) worldTimeValue = value end
})

WorldTab:CreateToggle({
   Name = "Full Bright", CurrentValue = false, Flag = "FullBrightToggle",
   Callback = function(value)
      fullBrightEnabled = value
      if not value then
          Lighting.Brightness = defaultLighting.Brightness
          Lighting.GlobalShadows = defaultLighting.GlobalShadows
          Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
          Lighting.ExposureCompensation = 0
      end
   end
})

RunService.Heartbeat:Connect(function()
    if worldTimeEnabled then Lighting.ClockTime = worldTimeValue end
    if fullBrightEnabled then
        Lighting.Brightness = 3; Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1); Lighting.ExposureCompensation = 0.3
    end
end)

-- ===================== SCREEN =====================
local ScreenTab = Window:CreateTab("Screen", 4483362458)
local screenIntensity = 0
local screenConnection

ScreenTab:CreateToggle({
   Name = "Enable Screen Effect", CurrentValue = false, Flag = "ScreenToggle",
   Callback = function(value)
      screenEnabled = value
      if value then
         getgenv().gg_scripters = "Aori0001"
         screenConnection = RunService.RenderStepped:Connect(function()
            camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, (0.65 + screenIntensity), 0, 0, 0, 1)
         end)
      else
         if screenConnection then screenConnection:Disconnect(); screenConnection = nil end
         getgenv().gg_scripters = nil
      end
   end
})

ScreenTab:CreateSlider({
   Name = "Screen Stretch", Range = {0, 0.2}, Increment = 0.001, CurrentValue = 0, Flag = "ScreenIntensity",
   Callback = function(value) screenIntensity = value end
})

-- ===================== OTHER =====================
local OtherTab = Window:CreateTab("Other", 4483362458)
local animeImageGui = nil

local function toggleAnimeImage(value)
   animeImageEnabled = value
   if value then
      animeImageGui = Instance.new("ScreenGui", player.PlayerGui)
      animeImageGui.Name = "AnimeImageGui"; animeImageGui.ResetOnSpawn = false
      local imageLabel = Instance.new("ImageLabel", animeImageGui)
      imageLabel.Name = "AnimeImage"; imageLabel.Image = "http://www.roblox.com/asset/?id=117783035423570"
      imageLabel.Size = UDim2.new(0, 350, 0, 400); imageLabel.Position = UDim2.new(1, -25, 0, 10)
      imageLabel.AnchorPoint = Vector2.new(1, 0); imageLabel.BackgroundTransparency = 1
   else
      if animeImageGui then animeImageGui:Destroy(); animeImageGui = nil end
   end
end

OtherTab:CreateButton({
   Name = "Activate FPS/Ping Counter",
   Callback = function()
      if not fpsPingEnabled then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/хз%20как%20назвать%20типо%20фпс%20и%20пинг.md"))()
         fpsPingEnabled = true
      end
   end
})

OtherTab:CreateButton({
   Name = "Activate FPS/Ping Counter 2",
   Callback = function()
      if not fpsPingEnabled2 then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/VetrexTheBest/Fps-ping/refs/heads/main/fps%2Bping.txt"))()
         fpsPingEnabled2 = true
      end
   end
})

OtherTab:CreateToggle({
   Name = "Anime Image", CurrentValue = false, Flag = "AnimeImageToggle",
   Callback = toggleAnimeImage
})

-- ===================== AUTO-REAPPLY =====================
local function reapplyVisuals(char)
   task.wait(1)
   if hatEnabled then addHat(char) end
   if trailEnabled then addTrail(char) end
   if ffEnabled then applyForceField(char) end
   if auraEnabled then enableAura(char) end
   if skinTrailEnabled then toggleSkinTrail(true) end
   if animeImageEnabled then toggleAnimeImage(true) end
end

player.CharacterAdded:Connect(reapplyVisuals)
if player.Character then reapplyVisuals(player.Character) end
