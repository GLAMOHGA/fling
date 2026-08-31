local t1 = {
	value1 = game:GetService("Workspace")
}

function t1.value2(p1)
    local v117 = not p1

    if not v117 then
        v117 = not p1:IsDescendantOf(t1.value1)
    end

    if v117 then
        return
    end

    for _, descendant in ipairs(p1:GetDescendants()) do
        if descendant:IsA("BasePart") or (descendant:IsA("Decal") or descendant:IsA("Texture")) then
            descendant.Transparency = 1

            if descendant:IsA("Decal") or descendant:IsA("Texture") then
                descendant:Destroy()
            end
        elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
            descendant.Enabled = false
        end
    end
end
t1.value1.ChildAdded:Connect(function(child)
    if child.Name == "deadbody" then
        t1.value2(child)
        child.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") or (descendant:IsA("Decal") or descendant:IsA("Texture")) then
                descendant.Transparency = 1

                if descendant:IsA("Decal") or descendant:IsA("Texture") then
                    descendant:Destroy()

                    return
                end
            elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                descendant.Enabled = false
            end
        end)
    end
end)

for _, child in ipairs(t1.value1:GetChildren()) do
    if child.Name == "deadbody" then
        t1.value2(child)
    end
end
function t1.value3(p2)
    if p2:IsA("Highlight") and (p2.OutlineColor == Color3.fromRGB(0, 0, 0) and p2.FillTransparency == 1) then
        p2:Destroy()
    end
end
local BloomEffect = Instance.new("BloomEffect")

BloomEffect.Name = "bloom"
BloomEffect.Size = 24
BloomEffect.Intensity = 1
BloomEffect.Threshold = 0.9
BloomEffect.Parent = game.Lighting
for _, descendant in ipairs(game:GetDescendants()) do
    t1.value3(descendant)
end
game.DescendantAdded:Connect(t1.value3)
task.spawn(function()
    while task.wait(10) do
        for _, descendant in ipairs(t1.value1:GetDescendants()) do
            if descendant:IsA("Highlight") then
                t1.value3(descendant)
            end
        end
    end
end)

local QualityLevel = settings().Rendering.QualityLevel
if QualityLevel == Enum.QualityLevel.Level01 or (QualityLevel == Enum.QualityLevel.Level02 or QualityLevel == Enum.QualityLevel.Level03) then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level04
end
local Sound = Instance.new("Sound")

Sound.SoundId = "rbxassetid://83501702295138"
Sound.Volume = 0.3
Sound.Looped = false
Sound.Parent = t1.value1
local v9 = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/FATALITY/refs/heads/main/FATALITYSOURCE.lua"))()
local Play = Sound.Play
local v11 = v9:CreateNotifier()
Play(Sound)
v9:Loader({
	Name = "FATALITY",
	Duration = 4
})
local v12 = "Hello, " .. game.Players.LocalPlayer.DisplayName .. "! Welcome back."
v11:Notify({
	Title = "FATALITY",
	Content = v12,
	Icon = "clipboard"
})

v11:Notify({
    Title = "FATALITY LOADED",
    Content = "By https://t.me/vomagla",
    Icon = "check"
})

local v13 = v9.new({
	Name = "FATALITY",
	Expire = "never"
})
local UserInputService = game:GetService("UserInputService")

t1.value4 = game.CoreGui:WaitForChild("FATALITY"):WaitForChild("FatalFtame")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if input.KeyCode == Enum.KeyCode.H then
        t1.value4.Visible = not t1.value4.Visible
    end
end)
v13:AddConfig():Init("Counter-Strike 2", "Fatality-Win")

local v15 = v13:AddMenu({
	Name = "MAIN",
	Icon = "settings"
})

local vSettings = v13:AddMenu({
	Name = "SETTINGS",
	Icon = "cog"
})

local v16 = v15:AddSection({
	Position = "left",
	Name = "SILENT AIM"
})
local v17 = v15:AddSection({
	Position = "left",
	Name = "VIEW"
})
local v18 = v15:AddSection({
	Position = "center",
	Name = "PLAYER"
})
local v19 = v15:AddSection({
	Position = "center",
	Name = "WORLD"
})
local v20 = v15:AddSection({
	Position = "right",
	Name = "MOVEMENT"
})
local v21 = v15:AddSection({
	Position = "right",
	Name = "MISC"
})

local v22 = v15:AddSection({
	Position = "left",
	Name = "RAGE BOT"
})

t1.value5 = game:GetService("Players")

local RunService = game:GetService("RunService")

t1.value6 = game:GetService("Workspace")
t1.value7 = t1.value6.CurrentCamera
t1.value8 = t1.value5.LocalPlayer

getgenv().RageBotEnabled = false
getgenv().RageTarget = "Head"
getgenv().RageAutoShoot = false
getgenv().SilentAim = getgenv().SilentAim or false
getgenv().SilentAimTarget = getgenv().SilentAimTarget or "Head"
getgenv().SilentAimFOVEnabled = getgenv().SilentAimFOVEnabled or false
getgenv().SilentAimFOV = getgenv().SilentAimFOV or 50
getgenv().TrailEnabled = getgenv().TrailEnabled or false
getgenv().TrailColor = getgenv().TrailColor or Color3.fromRGB(255, 0, 0)
getgenv().TRIGGER_Enabled = false
getgenv().TriggerRadius = 10
getgenv().ShowCircle = false
getgenv().AutoJumpEnabled = false
getgenv().AirStrafeEnabled = false
getgenv().AirStrafeStrength = 20
getgenv().QuickStopEnabled = false

getgenv().RageBotEnabled = false
getgenv().RageBotHitbox = "Head"
getgenv().RageBotAutoFire = false

local cam = t1.value6.CurrentCamera

function getRageBotTarget()
    local closest = nil
    local closestDist = math.huge

    for _, player in ipairs(t1.value5:GetPlayers()) do
        if player ~= t1.value8 and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local char = player.Character
            local targetPart
            local hitbox = getgenv().RageBotHitbox

            if hitbox == "All" then
                for _, name in ipairs({"Head", "UpperTorso", "Torso", "HumanoidRootPart"}) do
                    local p = char:FindFirstChild(name)
                    if p then
                        targetPart = p
                        break
                    end
                end
            else
                targetPart = char:FindFirstChild(hitbox) or char:FindFirstChild("Head")
            end

            if targetPart then
                local origin = cam.CFrame.Position
                local direction = targetPart.Position - origin
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                rayParams.FilterDescendantsInstances = {t1.value8.Character}
                local result = t1.value6:Raycast(origin, direction, rayParams)
                
                local isVisible = not result or result.Instance:IsDescendantOf(char)
                
                if isVisible then
                    local dist = (targetPart.Position - cam.CFrame.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = targetPart
                    end
                end
            end
        end
    end

    return closest
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BulletHandler = require(ReplicatedStorage.ModuleScripts.GunModules:WaitForChild("BulletHandler"))
local SignalManager = require(ReplicatedStorage:WaitForChild("SignalManager"))
local oldFire = BulletHandler.Fire

local function isInFOV(targetPart)
    if not getgenv().SilentAimFOVEnabled then return true end
    
    local cam = t1.value6.CurrentCamera
    local fovRadius = getgenv().SilentAimFOV or 50
    local dir = (targetPart.Position - cam.CFrame.Position).Unit
    local angle = math.acos(math.clamp(cam.CFrame.LookVector:Dot(dir), -1, 1))
    local deg = math.deg(angle)
    return deg <= fovRadius
end

local function getSilentAimTarget()
    if not getgenv().SilentAim then return nil end
    
    local closest = nil
    local closestDist = math.huge
    local cam = t1.value6.CurrentCamera
    local targetPartName = getgenv().SilentAimTarget or "Head"
    
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    if t1.value8.Character then
        rayParams.FilterDescendantsInstances = {t1.value8.Character}
    end
    
    for _, player in ipairs(t1.value5:GetPlayers()) do
        if player ~= t1.value8 and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local targetPart = player.Character:FindFirstChild(targetPartName)
            if targetPart then
                if not isInFOV(targetPart) then
                    continue
                end
                
                local d = (targetPart.Position - cam.CFrame.Position).Magnitude
                if d < closestDist then
                    local dir = (targetPart.Position - cam.CFrame.Position).Unit * d
                    local hit = t1.value6:Raycast(cam.CFrame.Position, dir, rayParams)
                    if not hit or hit.Instance:IsDescendantOf(player.Character) then
                        closestDist = d
                        closest = targetPart
                    end
                end
            end
        end
    end
    return closest
end

BulletHandler.Fire = function(data)
    local shouldChange = false
    local target = nil
    
    if getgenv().SilentAim then
        target = getSilentAimTarget()
        if target then
            shouldChange = true
        end
    end
    
    if not shouldChange and getgenv().RageBotEnabled then
        target = getRageBotTarget()
        if target then
            shouldChange = true
        end
    end
    
    if shouldChange and target and data and data.Origin and data.Misc then
        data.Direction = (target.Position - data.Origin).Unit
        data.Misc.CamCFrame = CFrame.new(data.Misc.CamCFrame.Position, target.Position)
    end
    
    return oldFire(data)
end

task.spawn(function()
    while task.wait(0.05) do
        if getgenv().RageBotEnabled and getgenv().RageBotAutoFire then
            local target = getRageBotTarget()
            if target then
                SignalManager.Fire("FireWeapon", Enum.UserInputState.Begin)
                task.wait(0.05)
                SignalManager.Fire("FireWeapon", Enum.UserInputState.End)
            end
        end
    end
end)

v22:AddToggle({
    Name = "Enable",
    Flag = "RageBot_Enable",
    Default = false,
    Callback = function(p)
        getgenv().RageBotEnabled = p
    end
})

v22:AddToggle({
    Name = "Auto Shoot",
    Flag = "RageBot_AutoShoot",
    Default = false,
    Callback = function(p)
        getgenv().RageBotAutoFire = p
    end
})

v22:AddDropdown({
    Name = "Target",
    Flag = "RageBot_Target",
    Values = {
        "Head",
        "UpperTorso",
        "Torso",
        "HumanoidRootPart",
        "All"
    },
    Default = "Head",
    Callback = function(p)
        getgenv().RageBotHitbox = p
    end
})

v16:AddToggle({
	Name = "Enable",
	Flag = "SilentAimEnabled",
	Default = getgenv().SilentAim,
	Callback = function(p)
    getgenv().SilentAim = p
end
})

v16:AddDropdown({
    Name = "Target",
    Flag = "SilentAimTarget",
    Values = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"},
    Default = getgenv().SilentAimTarget,
    Callback = function(p)
        getgenv().SilentAimTarget = p
    end
})

v16:AddToggle({
    Name = "FOV",
    Flag = "SilentAimFOV",
    Default = getgenv().SilentAimFOVEnabled,
    Callback = function(p)
        getgenv().SilentAimFOVEnabled = p
    end
})

v16:AddSlider({
    Name = "FOV Radius",
    Flag = "SilentAimFOVRadius",
    Min = 1,
    Max = 200,
    Default = getgenv().SilentAimFOV,
    Callback = function(p)
        getgenv().SilentAimFOV = p
    end
})

local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local fovScreenGui = Instance.new("ScreenGui")
fovScreenGui.Name = "SmoothFOVCircle"
fovScreenGui.IgnoreGuiInset = true
fovScreenGui.ResetOnSpawn = false
fovScreenGui.Parent = PlayerGui

local fovCircleFrame = Instance.new("Frame")
fovCircleFrame.Name = "Circle"
local currentFOV = getgenv().SilentAimFOV or 50
fovCircleFrame.Size = UDim2.new(0, currentFOV * 2, 0, currentFOV * 2)
fovCircleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircleFrame.BackgroundTransparency = 1
fovCircleFrame.Parent = fovScreenGui
fovCircleFrame.Visible = getgenv().SilentAimFOVEnabled and getgenv().SilentAim

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = fovCircleFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = fovCircleFrame
uiStroke.Thickness = 1.5
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Color = Color3.new(1, 1, 1)

local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = uiStroke

uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.new(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
    ColorSequenceKeypoint.new(1.0, Color3.new(0, 0, 0))
}

local rotationSpeed = 0.3

local function updateFOVCircle()
    local radius = getgenv().SilentAimFOV or 50
    fovCircleFrame.Size = UDim2.new(0, radius * 2, 0, radius * 2)
    fovCircleFrame.Visible = getgenv().SilentAimFOVEnabled and getgenv().SilentAim
end

RunService.RenderStepped:Connect(function()
    uiGradient.Rotation = uiGradient.Rotation + rotationSpeed
    updateFOVCircle()
end)

t1.value14 = game:GetService("Players")
t1.value15 = game:GetService("RunService")
t1.value16 = t1.value1.CurrentCamera
t1.value17 = game:GetService("Debris")
t1.value18 = game:GetService("UserInputService")
t1.value19 = t1.value14.LocalPlayer
t1.value20 = false
t1.value21 = 1.3
t1.value22 = 1.4
t1.value23 = true
t1.value24 = true
t1.value25 = 600
function t1.value26(p13)
    if not p13 or not p13.Parent then
        return false
    end

    local CFramePosition = t1.value16.CFrame.Position
    local v163 = p13.Position - CFramePosition
    local ray = Ray.new(CFramePosition, v163.Unit * v163.Magnitude)
    local t2 = {
		t1.value19.Character,
		t1.value16
	}
    local PartOnRayWithIgnoreList = t1.value1:FindPartOnRayWithIgnoreList(ray, t2)

    return not PartOnRayWithIgnoreList or (PartOnRayWithIgnoreList == p13 or PartOnRayWithIgnoreList:IsDescendantOf(p13.Parent))
end
t1.value27 = nil
function t1.value27(p14)
    if not t1.value20 then
        return true
    end

    if t1.value19.Team and p14.Team then
        return t1.value19.Team ~= p14.Team
    end

    return true
end

t1.value30 = nil
function t1.value30(p17)
    for _, child in ipairs(p17:GetChildren()) do
        if not (child:IsA("BasePart") and child.Name == "Muz") then
            local v188 = t1.value30(child)

            if not v188 then
                continue
            end

            return v188
        end

        if child:IsDescendantOf(t1.value1) then
            return child
        end
    end

    return nil
end
function t1.value31(p18)
    local v190
    if v190 then
        v190:IsDescendantOf(t1.value1)
    end
    local v191
    repeat
        v191 = t1.value30(p18)
        task.wait(0.3)
    until v191 and v191:IsDescendantOf(t1.value1)

    return v191
end
local function v33(p19)
    task.spawn(function()
        local v479 = t1.value31(p19)
        local u480
        pcall(function()
            u480 = t1.value19:WaitForChild("PlayerGui"):WaitForChild("MobileControls"):WaitForChild("Frame"):WaitForChild("FireButton")
        end)
        if u480 then
            u480.MouseButton1Click:Connect(function()
            end)
        end
        t1.value18.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                t1.value29(v479)
            end
        end)
    end)
end
if t1.value19.Character then
    v33(t1.value19.Character)
end
t1.value19.CharacterAdded:Connect(v33)

t1.value32 = nil
t1.value33 = {}
v21:AddToggle({
	Name = "Custom gun sound",
	Flag = "CustomGunSound",
	Default = false,
	Callback = function(p23)
    local s1 = "rbxassetid://2476571739"
    local function v198(p24)
        if p24:IsA("Sound") and p24.Name == "GunShot" then
            if not t1.value33[p24] then
                t1.value33[p24] = p24.SoundId
            end

            local Model = p24:FindFirstAncestorWhichIsA("Model")

            if p23 then
                if Model and Model.Name == "Revolver" then
                    p24.SoundId = "rbxassetid://18302097184"

                    return
                end

                p24.SoundId = s1

                return
            end

            if t1.value33[p24] then
                p24.SoundId = t1.value33[p24]
            end
        end
    end
    for v201, v202 in pairs(game:GetDescendants()) do

        v198(v202)
    end
    if p23 then
        t1.value32 = game.DescendantAdded:Connect(function(descendant)
            v198(descendant)
        end)

        return
    end
    if t1.value32 then
        t1.value32:Disconnect()
    end
end
})
t1.value34 = game:GetService("Players").LocalPlayer
t1.value35 = {
	Crit = "rbxassetid://138705939667182",
	Bang = "rbxassetid://138705939667182"
}
t1.value36 = {
	Bell = "rbxassetid://123827281575056",
	Metal = "rbxassetid://9125672731",
	Growl = "rbxassetid://136705296952779",
	Brutal = "rbxassetid://82176913611683",
	Money = "rbxassetid://9117067586",
	Sparkle = "rbxassetid://78601008552434",
	["Aray ko"] = "rbxassetid://122864243311961",
	Hehe = "rbxassetid://18381322350"
}
t1.value37 = false
t1.value38 = nil
t1.value39 = "Bell"
t1.value38 = 100
function t1.value40()
    local PlayerGui = t1.value34:FindFirstChild("PlayerGui")

    if not PlayerGui then
        return
    end

    local Effect = PlayerGui:FindFirstChild("Effect")

    if not Effect then
        return
    end

    local Crit = Effect:FindFirstChild("Crit")
    local Bang = Effect:FindFirstChild("Bang")

    if Crit then
        local value37 = t1.value37

        if value37 then
            value37 = t1.value36[t1.value39]
        end

        Crit.SoundId = value37 or t1.value35.Crit
        Crit.Volume = t1.value38
    end

    if Bang then
        Bang.SoundId = t1.value37 and t1.value36[t1.value39] or t1.value35.Bang
        Bang.Volume = t1.value38
    end
end
v21:AddToggle({
	Name = "Custom hit sound",
	Flag = "HitSoundEnabled",
	Default = false,
	Callback = function(p25)
    t1.value37 = p25
    t1.value40()
end
})
v21:AddDropdown({
	Name = "Hit sound",
	Flag = "HitSoundType",
	Values = {
		"Bell",
		"Metal",
		"Brutal",
		"Growl",
		"Money",
		"Sparkle",
		"Aray ko",
		"Hehe"
	},
	Default = "Bell",
	Callback = function(p26)
    t1.value39 = p26
    t1.value40()
end
})
v21:AddSlider({
	Name = "Volume",
	Flag = "HitSoundVolume",
	Min = 1,
	Max = 100,
	Default = 100,
	Callback = function(p27)
    t1.value38 = p27 / 100
    t1.value40()
end
})
t1.value34.CharacterAdded:Connect(function()
    task.wait(1)
    t1.value40()
end)

t1.value41 = game:GetService("Players").LocalPlayer
t1.value42 = false
t1.value43 = false
t1.value44 = "None"
t1.value45 = "None"
t1.value46 = Color3.fromRGB(140, 140, 245)
t1.value47 = Color3.fromRGB(140, 140, 245)
t1.value48 = nil
function t1.value48(p28, p29)
    local v213 = p29 and t1.value43 or t1.value42
    local v214 = p29

    if p29 then
        v214 = t1.value45
    end

    local v215 = v214 or t1.value44
    local v216 = p29 and t1.value47 or t1.value46

    if not v213 then
        return
    end

    if not p28:IsA("BasePart") and (not p28:IsA("MeshPart") and not p28:IsA("UnionOperation")) then
        return
    end

    if p28.Transparency >= 1 then
        return
    end

    if p28.Name == "LeftArm" or p28.Name == "RightArm" then
        return
    end

    if not p29 then
        local v217 = t1.value41.Character and t1.value41.Character:FindFirstChildOfClass("Tool")

        if v217 then
            local Charm = v217:FindFirstChild("Charm", true)

            if Charm and p28 == Charm or Charm:IsAncestorOf(p28) then
                return
            end
        end
    elseif p28.Name ~= "Charm" and (not p28.Parent and p28.Parent.Name == "Charm") then
        return
    end

    if v215 == "Latex" then
        p28.Transparency = 0.55
        p28.Color = v216
        p28.Material = Enum.Material.Neon
        p28.Reflectance = 0
    elseif v215 == "Metal" then
        p28.Transparency = 0
        p28.Color = v216
        p28.Material = Enum.Material.Glass
        p28.Reflectance = 1
    elseif v215 == "Lava" then
        p28.Transparency = 0
        p28.Color = v216
        p28.Material = Enum.Material.CrackedLava
        p28.Reflectance = 0
    elseif v215 == "Glow" then
        p28.Transparency = 0
        p28.Color = v216
        p28.Material = Enum.Material.Neon
        p28.Reflectance = 0
    elseif v215 == "None" then
        p28.Material = Enum.Material.Plastic
        p28.Reflectance = 0
    end

    if p28:IsA("UnionOperation") then
        p28.UsePartColor = true
    end
end
function t1.value49(p30)
    for _, descendant in ipairs(p30:GetDescendants()) do
        t1.value48(descendant, false)
        t1.value48(descendant, true)
    end

    p30.DescendantAdded:Connect(function(descendant)
        task.wait(0.05)
        t1.value48(descendant, false)
        t1.value48(descendant, true)
    end)
end
local function v42(p31)
    local GetChildren = p31.GetChildren

    for _, v in ipairs(GetChildren(p31)) do
        if v:IsA("Tool") then
            t1.value49(v)
        end
    end

    p31.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            t1.value49(child)
        end
    end)
end
if t1.value41.Character then
    v42(t1.value41.Character)
end
t1.value41.CharacterAdded:Connect(v42)

local v43 = v18:AddToggle({
	Name = "Weapon",
	Flag = "WeaponLatex",
	Option = true,
	Default = false,
	Callback = function(p32)
    t1.value42 = p32

    if t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
v43.Option:AddDropdown({
	Name = "Style",
	Flag = "WeaponStyle",
	Values = {
		"None",
		"Latex",
		"Lava",
		"Metal",
		"Glow"
	},
	Default = "Latex",
	Callback = function(p33)
    t1.value44 = p33

    if t1.value42 and t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
local Option = v43.Option
local color3 = Color3.fromRGB(140, 140, 245)

Option:AddColorPicker({
	Name = "Color",
	Flag = "WeaponColor",
	Default = color3,
	Callback = function(p34)
    t1.value46 = p34

    if t1.value42 and t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
local v46 = v18:AddToggle({
	Name = "Charm",
	Flag = "CharmLatex",
	Option = true,
	Default = false,
	Callback = function(p35)
    t1.value43 = p35

    if t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
v46.Option:AddDropdown({
	Name = "Style",
	Flag = "CharmStyle",
	Values = {
		"None",
		"Latex",
		"Metal",
		"Lava",
		"Glow"
	},
	Default = "Latex",
	Callback = function(p36)
    t1.value45 = p36

    if t1.value43 and t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
local Option2 = v46.Option
local color3_2 = Color3.fromRGB(140, 140, 245)

Option2:AddColorPicker({
	Name = "Color",
	Flag = "CharmColor",
	Default = color3_2,
	Callback = function(p37)
    t1.value47 = p37

    if t1.value43 and t1.value41.Character then
        v42(t1.value41.Character)
    end
end
})
local Lighting = game:GetService("Lighting")

t1.value50 = nil
t1.value50 = Lighting
function t1.value51(p38, p39)
    t1.value50.ClockTime = 13
    t1.value50.Brightness = 0

    local NightBloom = t1.value50:FindFirstChild("NightBloom")

    if NightBloom then
        NightBloom:Destroy()
    end

    local BloomEffect2 = Instance.new("BloomEffect")

    BloomEffect2.Name = "NightBloom"
    BloomEffect2.Size = p38 or 24
    BloomEffect2.Intensity = p39 or 1
    BloomEffect2.Threshold = 0.9
    BloomEffect2.Parent = t1.value50
end
t1.value52 = v19:AddToggle({
	Name = "Night mode",
	Option = true,
	Flag = "NightModee",
	Default = false,
	Callback = function(p40)
    if p40 then
        t1.value51(10, 1)

        return
    end

    t1.value50.ClockTime = 12
    t1.value50.Brightness = 2

    local NightBloom = t1.value50:FindFirstChild("NightBloom")

    if NightBloom then
        NightBloom:Destroy()
    end
end
})
t1.value52.Option:AddSlider({
	Name = "Bloom Size",
	Flag = "NightBloomSize",
	Min = 1,
	Max = 100,
	Default = 20,
	Callback = function(p41)
    if t1.value52.Value then
        local v239 = t1.value50:FindFirstChild("NightBloom") and t1.value50.NightBloom.Intensity or 1

        t1.value51(p41, v239)
    end
end
})
t1.value52.Option:AddSlider({
	Name = "Bloom Intensity",
	Flag = "NightBloomIntensity",
	Min = 0,
	Max = 5,
	Default = 1,
	Callback = function(p42)
    if t1.value52.Value then
        local v241 = t1.value50:FindFirstChild("NightBloom") and t1.value50.NightBloom.Size or 24

        t1.value51(v241, p42)
    end
end
})
local Players = game:GetService("Players")

game:GetService("Lighting")
t1.value53 = game:GetService("RunService")

local _ = Players.LocalPlayer
t1.value54 = t1.value1.CurrentCamera
t1.value55 = {}
t1.value56 = {}
local color3_3 = Color3.fromRGB(180, 180, 255)

t1.value57 = {
	Density = 250,
	Speed = 100,
	Color = color3_3
}
local color3_4 = Color3.fromRGB(255, 255, 255)

t1.value58 = {
	Density = 150,
	Speed = 10,
	Size = 0.2,
	Color = color3_4
}
t1.value59 = {
	Type = "None"
}
t1.value60 = Instance.new("Sound")
t1.value60.Looped = true
t1.value60.Volume = 0.8
t1.value60.Parent = t1.value1
local v54 = v19:AddDropdown({
	Name = "Weather",
	Flag = "WeatherDropdown",
	Option = true,
	Default = "None",
	Values = {
		"None",
		"Rain",
		"Snow"
	},
	Callback = function(p43)
    t1.value59.Type = p43
    for v245, v246 in pairs(t1.value55) do

        v246:Destroy()
    end
    for v249, v250 in pairs(t1.value56) do

        v250:Destroy()
    end
    t1.value55 = {}
    t1.value56 = {}
    if p43 == "Rain" then
        t1.value60.SoundId = "rbxassetid://9064263922"
        t1.value60:Play()

        return
    end
    if p43 == "Snow" then
        t1.value60.SoundId = "rbxassetid://238895410"
        t1.value60:Play()

        return
    end
    t1.value60:Stop()
end
})
v54.Option:AddSlider({
	Name = "Rain Density",
	Flag = "RainDensity",
	Min = 50,
	Max = 2000,
	Default = 600,
	Callback = function(p44)
    t1.value57.Density = p44
end
})
v54.Option:AddSlider({
	Name = "Rain Speed",
	Flag = "RainSpeed",
	Min = 50,
	Max = 300,
	Default = 150,
	Callback = function(p45)
    t1.value57.Speed = p45
end
})
local Option3 = v54.Option
local AddColorPicker2 = Option3.AddColorPicker
local color3_5 = Color3.fromRGB(255, 255, 255)

AddColorPicker2(Option3, {
	Name = "Rain Color",
	Flag = "RainColor",
	Default = color3_5,
	Callback = function(p46)
    t1.value57.Color = p46
end
})
v54.Option:AddSlider({
	Name = "Snow Density",
	Flag = "SnowDensity",
	Min = 50,
	Max = 400,
	Default = 250,
	Callback = function(p47)
    t1.value58.Density = p47
end
})
v54.Option:AddSlider({
	Name = "Snow Speed",
	Flag = "SnowSpeed",
	Min = 10,
	Max = 100,
	Default = 30,
	Callback = function(p48)
    t1.value58.Speed = p48
end
})
local Option4 = v54.Option
local color3_6 = Color3.fromRGB(255, 255, 255)

Option4:AddColorPicker({
	Name = "Snow Color",
	Flag = "SnowColor",
	Default = color3_6,
	Callback = function(p49)
    t1.value58.Color = p49
end
})
t1.value53.RenderStepped:Connect(function()
    if t1.value59.Type == "Rain" then
        if #t1.value55 < t1.value57.Density then
            local Part = Instance.new("Part")

            Part.Anchored = true
            Part.CanCollide = false
            Part.Color = t1.value57.Color
            Part.Material = Enum.Material.Glass
            Part.Size = Vector3.new(0.05, 1, 0.05)
            Part.Transparency = 0.1
            Part.Parent = t1.value1
            table.insert(t1.value55, Part)
        end

        for _, v in pairs(t1.value55) do
            if v and v.Parent then
                if v.Position.Y < t1.value54.CFrame.Position.Y - 50 then
                    v.Position = t1.value54.CFrame.Position + Vector3.new(math.random(-50, 50), 50, math.random(-50, 50))
                else
                    local s2 = "Position"
                    local vector3 = Vector3.new(0, t1.value57.Speed * t1.value53.RenderStepped:Wait(), 0)

                    v[s2] = v[s2] - vector3
                end
            end
        end
    end

    if t1.value59.Type == "Snow" then
        if #t1.value56 < t1.value58.Density then
            local Part = Instance.new("Part")

            Part.Anchored = true
            Part.CanCollide = false
            Part.Shape = Enum.PartType.Ball
            Part.Color = t1.value58.Color
            Part.Material = Enum.Material.Neon
            Part.Size = Vector3.new(t1.value58.Size, t1.value58.Size, t1.value58.Size)
            Part.Transparency = 0.2
            Part.Parent = t1.value1
            table.insert(t1.value56, Part)
        end

        for _, v in pairs(t1.value56) do
            if v and v.Parent then
                if v.Position.Y < t1.value54.CFrame.Position.Y - 30 then
                    v.Position = t1.value54.CFrame.Position + Vector3.new(math.random(-60, 60), 60, math.random(-60, 60))
                else
                    local s3 = "Position"
                    local vector3 = Vector3.new(0, t1.value58.Speed * t1.value53.RenderStepped:Wait(), 0)

                    v[s3] = v[s3] - vector3
                end
            end
        end
    end
end)
t1.value61 = game:GetService("Lighting")

local t3 = {
	SkyboxLf = "rbxassetid://12173273102",
	SkyboxUp = "rbxassetid://12173274627",
	SkyboxDn = "rbxassetid://12173271252",
	SkyboxBk = "rbxassetid://12173268397",
	SkyboxRt = "rbxassetid://12173273903",
	SkyboxFt = "rbxassetid://12173272214"
}
local t4 = {
	SkyboxLf = "rbxassetid://17124365127",
	SkyboxUp = "rbxassetid://17124369657",
	SkyboxDn = "rbxassetid://17124359797",
	SkyboxBk = "rbxassetid://17124357467",
	SkyboxRt = "rbxassetid://17124367200",
	SkyboxFt = "rbxassetid://17124362093"
}
local t5 = {
	SkyboxLf = "rbxassetid://154184943",
	SkyboxUp = "rbxassetid://154185031",
	SkyboxDn = "rbxassetid://154184960",
	SkyboxBk = "rbxassetid://154185004",
	SkyboxRt = "rbxassetid://154184972",
	SkyboxFt = "rbxassetid://154185021"
}
local t6 = {
	["Two moon"] = t3,
	Aurora = t4,
	Night = t5,
	Default = nil
}
t1.value62 = nil
t1.value62 = t6
function t1.value63(p50)
    local CustomSky = t1.value61:FindFirstChild("CustomSky")

    if CustomSky then
        CustomSky:Destroy()
    end

    local v269 = t1.value62[p50]

    if v269 then
        local Sky = Instance.new("Sky")

        Sky.Name = "CustomSky"

        for k, v in pairs(v269) do
            Sky[k] = v
        end

        Sky.Parent = t1.value61
    end
end
v19:AddDropdown({
	Name = "Skybox",
	Flag = "Skybox",
	Values = {
		"Default",
		"Two moon",
		"Aurora",
		"Night"
	},
	Default = "Default",
	Callback = function(p51)
    t1.value63(p51)
end
})
game:GetService("RunService").RenderStepped:Connect(function()
    local CustomSky = t1.value61:FindFirstChild("CustomSky")

    if CustomSky then
        CustomSky.Parent = t1.value61
    end
end)
t1.value64 = game:GetService("Lighting")

local RunService2 = game:GetService("RunService")

t1.value65 = 3000
t1.value66 = 3000
v19:AddSlider({
	Name = "FogStart",
	Flag = "FogStart",
	Min = 1,
	Max = 3000,
	Default = 3000,
	Callback = function(p52)
    t1.value65 = p52
    t1.value64.FogStart = p52
end
})
v19:AddSlider({
	Name = "FogEnd",
	Flag = "FogEnd",
	Min = 1,
	Max = 3000,
	Default = 3000,
	Callback = function(p53)
    t1.value66 = p53
    t1.value64.FogEnd = p53
end
})
RunService2.RenderStepped:Connect(function()
    if t1.value64.FogStart ~= t1.value65 then
        t1.value64.FogStart = t1.value65
    end

    if t1.value64.FogEnd ~= t1.value66 then
        t1.value64.FogEnd = t1.value66
    end
end)
t1.value67 = game:GetService("Lighting")
t1.value68 = false
t1.value69 = Color3.fromRGB(170, 170, 255)

local Option5 = v19:AddToggle({
	Name = "World",
	Flag = "World",
	Option = true,
	Default = false,
	Callback = function(p54)
    t1.value68 = p54

    if p54 then
        t1.value67.Ambient = t1.value69
        t1.value67.OutdoorAmbient = t1.value69

        return
    end

    t1.value67.Ambient = Color3.fromRGB(127, 127, 127)
    t1.value67.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
end
}).Option
local color3_7 = Color3.fromRGB(170, 170, 255)

Option5:AddColorPicker({
	Name = "World color",
	Flag = "WorldColors",
	Default = color3_7,
	Callback = function(p55)
    if t1.value68 then
        t1.value67.Ambient = p55
        t1.value67.OutdoorAmbient = p55
    end
end
})
local Players2 = game:GetService("Players")
local RunService3 = game:GetService("RunService")

t1.value71 = t1.value1.CurrentCamera
t1.value72 = Players2.LocalPlayer
t1.value73 = {}
t1.value74 = {}
t1.value75 = {}
local function v69(p57)
    if p57 == t1.value72 then
        return
    end

    if t1.value73[p57] then
        return
    end

    local drawing = Drawing.new("Square")

    drawing.Visible = false
    drawing.Color = Color3.new(1, 1, 1)
    drawing.Thickness = 1
    drawing.Filled = false
    t1.value73[p57] = drawing

    local drawing2 = Drawing.new("Square")

    drawing2.Visible = false
    drawing2.Filled = true
    drawing2.Thickness = 1
    t1.value74[p57] = drawing2

    local drawing3 = Drawing.new("Text")

    drawing3.Visible = false
    drawing3.Color = Color3.new(1, 1, 1)
    drawing3.Size = 8
    drawing3.Center = true
    drawing3.Outline = true
    drawing3.OutlineColor = Color3.new(0, 0, 0)
    t1.value75[p57] = drawing3
end
local GetPlayers = Players2.GetPlayers
Players2.PlayerRemoving:Connect(function(player)
    if t1.value73[player] then
        t1.value73[player]:Remove()
        t1.value73[player] = nil
    end

    if t1.value74[player] then
        t1.value74[player]:Remove()
        t1.value74[player] = nil
    end

    if t1.value75[player] then
        t1.value75[player]:Remove()
        t1.value75[player] = nil
    end
end)

for _, v in ipairs(GetPlayers(Players2)) do
    v69(v)
end
Players2.PlayerAdded:Connect(v69)
RunService3.RenderStepped:Connect(function()
    for k, v in pairs(t1.value73) do
        local v323 = k
        local Character = v323.Character
        local v325 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v326 = Character and Character:FindFirstChild("Humanoid")
        local v327 = v325
        local v328 = t1.value74[v323]
        local v329 = t1.value75[v323]

        if v325 then
            v327 = v326 and v326.Health > 0
        end

        if v327 then
            if _G.ESP_TeamCheck and (v323.Team ~= nil and t1.value72.Team ~= nil) and v323.Team == t1.value72.Team then
                if v then
                    v.Visible = false
                end

                if v328 then
                    v328.Visible = false
                end

                if v329 then
                    v329.Visible = false
                end
            else
                local v330, v331 = t1.value71:WorldToViewportPoint(v325.Position)

                if v331 then
                    local v332 = t1.value71:WorldToViewportPoint(v325.Position + Vector3.new(0, v326.HipHeight * 2 + 3, 0))
                    local v333 = math.abs(t1.value71:WorldToViewportPoint(v325.Position - Vector3.new(0, v326.HipHeight * 2 + 3, 0)).Y - v332.Y)

                    if v333 < 6 then
                        v333 = 6
                    end

                    local v334 = v333 / 2.3

                    if _G.ESP_Box_Enabled then
                        v.Size = Vector2.new(v334, v333)
                        v.Position = Vector2.new(v330.X - v334 / 2, v330.Y - v333 / 2)
                        v.Visible = true
                    else
                        v.Visible = false
                    end

                    if _G.ESP_Health_Enabled then
                        local v335 = math.clamp(v326.Health / v326.MaxHealth, 0, 1)
                        local v336 = 1 - v335

                        v328.Color = Color3.new(v336, v335, 0)

                        local v337 = v333 * v335

                        if v337 < 2 then
                            v337 = 2
                        end

                        local v338 = v330.X - v334 / 2 - 3
                        local v339 = v330.Y - v333 / 2 + (v333 - v337)

                        v328.Size = Vector2.new(2, v337)
                        v328.Position = Vector2.new(v338, v339)
                        v328.Visible = true
                    else
                        v328.Visible = false
                    end

                    if _G.ESP_Name_Enabled then
                        v329.Text = v323.Name
                        v329.Position = Vector2.new(v330.X, v330.Y - v333 / 2 - 15)
                        v329.Visible = true
                    else
                        v329.Visible = false
                    end
                else
                    v.Visible = false
                    v328.Visible = false
                    v329.Visible = false
                end
            end
        else
            v.Visible = false

            if v328 then
                v328.Visible = false
            end

            if v329 then
                v329.Visible = false
            end
        end
    end
end)
v18:AddDropdown({
	Name = "ESP",
	Flag = "Esp",
	Multi = true,
	Values = {
		"Box",
		"Name"
	},
	Callback = function(p58)
    _G.ESP_Box_Enabled = p58.Box or false
    _G.ESP_Name_Enabled = p58.Name or false
end
})
t1.value76 = game:GetService("Players")
t1.value77 = t1.value76.LocalPlayer
t1.value78 = t1.value1.CurrentCamera
local RunService4 = game:GetService("RunService")

t1.value79 = false
t1.value80 = Color3.fromRGB(170, 170, 255)

local color3_34 = Color3.fromRGB(170, 100, 255)

t1.value81 = nil
t1.value82 = nil
t1.value81 = color3_34
t1.value82 = {}
function t1.value83(p59)
    if not p59 then
        return false
    end

    local CFramePosition = t1.value78.CFrame.Position
    local v359 = (p59.Position - CFramePosition).Unit * (p59.Position - CFramePosition).Magnitude
    local ray = Ray.new(CFramePosition, v359)
    local PartOnRayWithIgnoreList = t1.value1:FindPartOnRayWithIgnoreList(ray, { t1.value77.Character })
    local v362 = not PartOnRayWithIgnoreList

    if not v362 then
        v362 = PartOnRayWithIgnoreList:IsDescendantOf(p59.Parent)
    end

    return v362
end
function t1.value84(p60)
    if not p60 or not p60:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not t1.value82[p60] then
        t1.value82[p60] = {}

        local GetDescendants = p60.GetDescendants

        for _, v in pairs(GetDescendants(p60)) do
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                local v345 = t1.value82[p60]
                local vColor = v.Color
                local vMaterial = v.Material
                local vTransparency = v.Transparency

                v345[v] = {
					Color = vColor,
					Material = vMaterial,
					Transparency = vTransparency
				}
            elseif v:IsA("Decal") or v:IsA("Texture") then
                t1.value82[p60][v] = {
					Transparency = v.Transparency
				}
            elseif v:IsA("Shirt") or (v:IsA("Pants") or v:IsA("BodyColors")) then
                t1.value82[p60][v] = {
					Parent = v.Parent
				}
            elseif v:IsA("Accessory") then
                t1.value82[p60][v] = {
					Parent = v.Parent
				}
            end
        end
    end
    for v351, v352 in pairs(p60:GetDescendants()) do

        if v352:IsA("Decal") or v352:IsA("Texture") then
            v352.Transparency = 1
        elseif v352:IsA("Shirt") or (v352:IsA("Pants") or (v352:IsA("BodyColors") or v352:IsA("Accessory"))) then
            v352.Parent = nil
        end
    end
    local GetDescendants = p60.GetDescendants
    for _, v in pairs(GetDescendants(p60)) do
        if v:IsA("BasePart") or v:IsA("MeshPart") and v.Transparency < 1 then
            v.Material = Enum.Material.Neon
            v.Color = t1.value80
            v.Transparency = 0.3
        end
    end
    if not p60:FindFirstChild("ChamsHighlight") then
        local Highlight = Instance.new("Highlight")

        Highlight.Name = "ChamsHighlight"
        Highlight.FillTransparency = 0
        Highlight.OutlineTransparency = 1
        Highlight.Enabled = false
        Highlight.FillColor = t1.value81
        Highlight.Adornee = p60
        Highlight.Parent = p60
    end
end
function t1.value85(p61)
    if not p61 or not t1.value82[p61] then
        return
    end

    for k, v in pairs(t1.value82[p61]) do
        local v370 = k

        if v370:IsA("BasePart") or v370:IsA("MeshPart") and v.Transparency < 1 then
            v370.Color = v.Color
            v370.Material = v.Material
            v370.Transparency = v.Transparency
        elseif v370:IsA("Decal") or v370:IsA("Texture") then
            v370.Transparency = v.Transparency
        else
            v370.Parent = v.Parent
        end
    end

    local ChamsHighlight = p61:FindFirstChild("ChamsHighlight")

    if ChamsHighlight then
        ChamsHighlight:Destroy()
    end

    t1.value82[p61] = nil
end
function t1.value86()
    for _, player in pairs(t1.value76:GetPlayers()) do
        if player ~= t1.value77 and (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
            local v365 = t1.value83(player.Character.HumanoidRootPart)
            local ChamsHighlight = player.Character:FindFirstChild("ChamsHighlight")

            if ChamsHighlight then
                ChamsHighlight.Enabled = not v365
            end
        end
    end
end
local function v75(p62)
    p62.CharacterAdded:Connect(function(character)
        character:WaitForChild("HumanoidRootPart")
        task.wait(0.1)

        if t1.value79 then
            t1.value84(character)
        end
    end)

    if p62.Character and t1.value79 then
        t1.value84(p62.Character)
    end
end
for _, player in pairs(t1.value76:GetPlayers()) do
    if player ~= t1.value77 then
        v75(player)
    end
end
t1.value76.PlayerAdded:Connect(v75)
t1.value76.PlayerRemoving:Connect(function(player)
    if player.Character then
        t1.value85(player.Character)
    end
end)
RunService4.RenderStepped:Connect(function()
    if t1.value79 then
        t1.value86()
    end
end)

local v78 = v18:AddToggle({
	Name = "Chams",
	Flag = "Chams",
	Default = false,
	Option = true,
	Callback = function(p63)
    t1.value79 = p63

    if p63 then
        for _, player in pairs(t1.value76:GetPlayers()) do
            if player ~= t1.value77 and player.Character then
                t1.value84(player.Character)
            end
        end

        return
    end

    for _, player in pairs(t1.value76:GetPlayers()) do
        if player ~= t1.value77 and player.Character then
            t1.value85(player.Character)
        end
    end
end
})
local Option6 = v78.Option
local AddColorPicker3 = Option6.AddColorPicker
local color3_35 = Color3.fromRGB(170, 170, 255)

AddColorPicker3(Option6, {
	Name = "Visible",
	Flag = "ChamsColor",
	Default = color3_35,
	Callback = function(p64)
    t1.value80 = p64
end
})
local Option7 = v78.Option
local AddColorPicker4 = Option7.AddColorPicker
local color3_36 = Color3.fromRGB(170, 100, 255)

AddColorPicker4(Option7, {
	Name = "Invisible",
	Flag = "ThroughwallChamsColor",
	Default = color3_36,
	Callback = function(p65)
    t1.value81 = p65
end
})
local Players3 = game:GetService("Players")

t1.value87 = t1.value1.CurrentCamera
t1.value88 = Players3.LocalPlayer
t1.value89 = false
t1.value90 = 6
t1.value91 = t1.value88.CameraMaxZoomDistance
t1.value92 = t1.value88.CameraMinZoomDistance
t1.value93 = false
t1.value94 = 170
t1.value95 = t1.value87.FieldOfView
function t1.value96()
    if not t1.value88.Character then
        return
    end

    if not t1.value88.Character:FindFirstChildOfClass("Humanoid") then
        return
    end

    if t1.value89 then
        t1.value88.CameraMode = Enum.CameraMode.Classic
        t1.value88.CameraMaxZoomDistance = t1.value90
        t1.value88.CameraMinZoomDistance = t1.value90

        return
    end

    t1.value88.CameraMode = Enum.CameraMode.LockFirstPerson
    t1.value88.CameraMaxZoomDistance = t1.value91
    t1.value88.CameraMinZoomDistance = t1.value92
end
function t1.value97()
    if t1.value93 then
        t1.value87.FieldOfView = t1.value94

        return
    end

    t1.value87.FieldOfView = t1.value95
end
t1.value88.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    character:WaitForChild("HumanoidRootPart")
    task.wait(0.25)
    t1.value96()
    t1.value97()
end)
v17:AddToggle({
	Name = "Thirdperson",
	Flag = "Thirdperson",
	Default = false,
	Option = true,
	Callback = function(p66)
    t1.value89 = p66
    t1.value96()
end
}).Option:AddDropdown({
	Name = "Activation",
	Flag = "ThirdpersonActivation",
	Values = {
		"Always on",
		"K",
		"O",
		"P"
	},
	Default = "Always on",
	Callback = function(p67)
    if t1.value89 then
        if p67 == "Always on" then
            t1.value96()

            return
        end

        t1.value89 = false
        t1.value96()
    end
end
})
v17:AddSlider({
	Name = "Distance",
	Flag = "ThirdpersonDistance",
	Min = 1,
	Max = 6,
	Default = 6,
	Callback = function(p68)
    t1.value90 = p68

    if t1.value89 then
        t1.value96()
    end
end
})
local Players4 = game:GetService("Players")
local RunService5 = game:GetService("RunService")

t1.value98 = game:GetService("Workspace")
t1.value99 = Players4.LocalPlayer
t1.value100 = t1.value98.CurrentCamera
t1.value101 = false
t1.value102 = nil
local function v88()
    t1.value102 = (t1.value99.Character or t1.value99.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
end
v88()
t1.value99.CharacterAdded:Connect(v88)
v17:AddToggle({
	Name = "Yaw",
	Flag = "Spinbot",
	Default = false,
	Callback = function(p69)
    t1.value101 = p69
end
})
function t1.value103()
    if not t1.value102 then
        return nil
    end

    local value102Position = t1.value102.Position
    local raycastParams = RaycastParams.new()

    raycastParams.FilterDescendantsInstances = { t1.value99.Character }
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = t1.value98:Raycast(value102Position, t1.value102.CFrame.RightVector * 7, raycastParams)
    local raycastResult2 = t1.value98:Raycast(value102Position, -t1.value102.CFrame.RightVector * 7, raycastParams)
    local raycastResult3 = t1.value98:Raycast(value102Position, -t1.value102.CFrame.LookVector * 7, raycastParams)

    if raycastResult and not raycastResult2 then
        return "Right"
    end

    if raycastResult2 and not raycastResult then
        return "Left"
    end

    if raycastResult3 then
        return "Back"
    end

    return "None"
end
RunService5.RenderStepped:Connect(function()
    if not t1.value102 or not t1.value101 then
        return
    end

    local LookVector = t1.value100.CFrame.LookVector
    local cFrame = CFrame.new(t1.value102.Position, t1.value102.Position + Vector3.new(LookVector.X, 0, LookVector.Z))
    local v393 = t1.value103()

    if v393 == "Right" then
        t1.value102.CFrame = cFrame * CFrame.Angles(0, 1.5707963267948966, 0)

        return
    end

    if v393 == "Left" then
        t1.value102.CFrame = cFrame * CFrame.Angles(0, -1.5707963267948966, 0)

        return
    end

    if v393 == "Back" then
        t1.value102.CFrame = cFrame * CFrame.Angles(0, 3.141592653589793, 0)

        return
    end

    t1.value102.CFrame = cFrame
end)
t1.value104 = game:GetService("Players").LocalPlayer
t1.value105 = false
v17:AddToggle({
	Name = "Hide head",
	Flag = "Hide head",
	Default = false,
	Callback = function(p70)
    t1.value105 = p70

    local Character = t1.value104.Character

    if Character then
        local Torso = Character:FindFirstChild("Torso")
        local v397 = Torso and Torso:FindFirstChild("Neck")

        if v397 then
            if t1.value105 then
                if not v397:FindFirstChild("OriginalC0") then
                    local CFrameValue = Instance.new("CFrameValue")

                    CFrameValue.Name = "OriginalC0"
                    CFrameValue.Value = v397.C0
                    CFrameValue.Parent = v397
                end

                v397.C0 = v397.C0 * CFrame.Angles(1.5707963267948966, 0, 0)

                return
            end

            local OriginalC0 = v397:FindFirstChild("OriginalC0")

            if OriginalC0 then
                v397.C0 = OriginalC0.Value
                OriginalC0:Destroy()
            end
        end
    end
end
})
t1.value104.CharacterAdded:Connect(function(character)
    if t1.value105 then
        local Neck = character:WaitForChild("Torso"):WaitForChild("Neck")

        if not Neck:FindFirstChild("OriginalC0") then
            local CFrameValue = Instance.new("CFrameValue")

            CFrameValue.Name = "OriginalC0"
            CFrameValue.Value = Neck.C0
            CFrameValue.Parent = Neck
        end

        Neck.C0 = Neck.C0 * CFrame.Angles(1.5707963267948966, 0, 0)
    end
end)

local Players5 = game:GetService("Players")
local RunService6 = game:GetService("RunService")

t1.value106 = Players5.LocalPlayer
t1.value107 = t1.value1.CurrentCamera
t1.value108 = t1.value107.FieldOfView
t1.value109 = t1.value106.CameraMinZoomDistance
t1.value110 = t1.value106.CameraMaxZoomDistance
t1.value111 = false
v17:AddToggle({
	Name = "No scope zoom",
	Flag = "Noscopezoom",
	Default = false,
	Callback = function(p71)
    t1.value111 = p71

    if not p71 then
        t1.value107.FieldOfView = t1.value108
        t1.value106.CameraMinZoomDistance = t1.value109
        t1.value106.CameraMaxZoomDistance = t1.value110
    end
end
})
RunService6.RenderStepped:Connect(function()
    if t1.value111 then
        t1.value106.CameraMinZoomDistance = t1.value109
        t1.value106.CameraMaxZoomDistance = t1.value110

        if t1.value107.FieldOfView ~= t1.value108 then
            t1.value107.FieldOfView = t1.value108
        end
    end
end)
v20:AddToggle({
	Name = "Automatic jump",
	Flag = "AutoJump",
	Default = false,
	Callback = function(p72)
    getgenv().AutoJumpEnabled = p72
end
})
v20:AddToggle({
	Name = "Auto Strafe",
	Flag = "AirStrafe",
	Default = false,
	Callback = function(p73)
    getgenv().AirStrafeEnabled = p73
end
})
v20:AddSlider({
	Name = "Smoothing",
	Flag = "SmoothingStrafe",
	Min = 1,
	Max = 100,
	Default = 20,
	Callback = function(p74)
    getgenv().AirStrafeStrength = p74
end
})
v20:AddToggle({
	Name = "Quick Stop",
	Flag = "QuickStop",
	Default = false,
	Callback = function(p75)
    getgenv().QuickStopEnabled = p75
end
})
local Players6 = game:GetService("Players")

t1.value112 = game:GetService("RunService")

local LocalPlayer = Players6.LocalPlayer
game:GetService("UserInputService")
local function v93(p76)
    local Humanoid = p76:WaitForChild("Humanoid")
    local HumanoidRootPart = p76:WaitForChild("HumanoidRootPart")

    t1.value112.RenderStepped:Connect(function()
        if not p76 or (not Humanoid or not HumanoidRootPart) then
            return
        end

        if getgenv().AutoJumpEnabled and Humanoid.FloorMaterial ~= Enum.Material.Air and tick() - 0 >= 0.15 then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end

        if getgenv().AirStrafeEnabled and Humanoid.FloorMaterial == Enum.Material.Air then
            local MoveDirection = Humanoid.MoveDirection

            if MoveDirection.Magnitude > 0.856 then
                HumanoidRootPart.Velocity = Vector3.new(MoveDirection.X * getgenv().AirStrafeStrength, HumanoidRootPart.Velocity.Y, MoveDirection.Z * getgenv().AirStrafeStrength)
            end
        end

        if getgenv().QuickStopEnabled then
            local HumanoidRootPartVelocity = HumanoidRootPart.Velocity

            if Vector3.new(HumanoidRootPartVelocity.X, 0, HumanoidRootPartVelocity.Z).Magnitude < 0 and Humanoid.MoveDirection.Magnitude == 0.1 then
                HumanoidRootPart.Velocity = Vector3.new(0, HumanoidRootPartVelocity.Y, 0)
            end
        end
    end)
end
v93(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())

local CharacterAdded = LocalPlayer.CharacterAdded
local AddToggle4 = v17.AddToggle
CharacterAdded:Connect(v93)
AddToggle4(v17, {
	Name = "Dynamic camera",
	Flag = "CameraSway",
	Default = false,
	Callback = function(p77)
    local Players7 = game:GetService("Players")
    local RunService7 = game:GetService("RunService")
    local UserInputService2 = game:GetService("UserInputService")
    local LocalPlayer2 = Players7.LocalPlayer
    local Humanoid = (LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()):WaitForChild("Humanoid")
    local CurrentCamera = t1.value1.CurrentCamera
    local n3 = 0

    local function v419(p78, p79, p80)
        return p78 + (p79 - p78) * p80
    end

    RunService7.RenderStepped:Connect(function(dt)
        if not p77 then
            Humanoid.CameraOffset = Vector3.new(0, 0, 0);
            (nil):Disconnect()

            return
        end

        local timestamp = tick()

        if Humanoid.MoveDirection.Magnitude > 0 then
            local v494 = math.cos(timestamp * 5) * 0.25
            local v495 = math.abs((math.sin(timestamp * 5))) * 0.25
            local vector3 = Vector3.new(v494, v495, 0)

            Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp(vector3, 0.25)
        else
            Humanoid.CameraOffset = Humanoid.CameraOffset * 0.75
        end

        local MouseDelta = UserInputService2:GetMouseDelta()

        n3 = v419(n3, math.clamp(MouseDelta.X, -6, 6), 6 * dt)
        CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.Angles(0, 0, (math.rad(n3)))
    end)
end
})
local Option8 = v18:AddToggle({
	Name = "Soul particles",
	Flag = "SoulParticles",
	Option = true,
	Default = false,
	Callback = function(p81)
    local Workspace = game:GetService("Workspace")
    local t8 = {}
    local t9 = {}

    _G.SoulParticleColor = _G.SoulParticleColor or Color3.fromRGB(150, 0, 255)

    local function v424(p82)
        if not p82 or not p82.Parent then
            return
        end
        for v501, v502 in ipairs(p82:GetDescendants()) do

            if v502:IsA("BasePart") then
                v502.Anchored = true
                v502.CanCollide = false
            end
        end
        for _, descendant in ipairs(p82:GetDescendants()) do
            if descendant:IsA("BasePart") then
                local ParticleEmitter = Instance.new("ParticleEmitter")

                ParticleEmitter.Texture = "rbxassetid://833874434"
                ParticleEmitter.LightEmission = 1
                ParticleEmitter.Rate = 350
                ParticleEmitter.Speed = NumberRange.new(1, 3)
                ParticleEmitter.Lifetime = NumberRange.new(2, 3)
                ParticleEmitter.Size = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0.2),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(1, 0.2)
					})
                ParticleEmitter.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 255)),
						ColorSequenceKeypoint.new(0.8, _G.SoulParticleColor),
						ColorSequenceKeypoint.new(1, _G.SoulParticleColor)
					})
                ParticleEmitter.EmissionDirection = Enum.NormalId.Top
                ParticleEmitter.SpreadAngle = Vector2.new(360, 360)
                ParticleEmitter.Parent = descendant
                table.insert(t9, ParticleEmitter)
                task.spawn(function()
                    ParticleEmitter:Emit(350)
                    task.wait(3)
                    ParticleEmitter.Enabled = false
                    task.wait(0.5)
                    ParticleEmitter:Destroy()

                    if p82 and p82.Parent then
                        p82:Destroy()
                    end
                end)
            end
        end
    end

    if p81 then
        table.insert(t8, (Workspace.ChildAdded:Connect(function(child)
            if child.Name:lower() == "deadbody" then
                v424(child)
            end
        end)))
    else

        for v427, v428 in ipairs(t8) do

            if v428.Connected then
                v428:Disconnect()
            end
        end
        for _, v in ipairs(t9) do
            if v and v.Parent then
                v:Destroy()
            end
        end
        t9 = {}
    end

    _G.SoulParticleEmitters = t9
end
}).Option
local color3_37 = Color3.fromRGB(150, 0, 255)

Option8:AddColorPicker({
	Name = "Color",
	Flag = "ColorSoul",
	Default = color3_37,
	Callback = function(p83)
    _G.SoulParticleColor = p83

    if _G.SoulParticleEmitters then
        for _, v in ipairs(_G.SoulParticleEmitters) do
            if v and v.Parent then
                v.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 255)),
						ColorSequenceKeypoint.new(0.8, p83),
						ColorSequenceKeypoint.new(1, p83)
					})
            end
        end
    end
end
})
t1.value113 = game:GetService("Players")

local RunService8 = game:GetService("RunService")

t1.value114 = game:GetService("Workspace")
t1.value115 = t1.value114.CurrentCamera
t1.value116 = t1.value113.LocalPlayer
t1.value117 = Drawing.new("Circle")
t1.value117.Visible = false
t1.value117.Color = Color3.fromRGB(255, 255, 255)
t1.value117.Thickness = 1.5
t1.value117.Transparency = 0.6
t1.value117.Filled = false
t1.value117.NumSides = 48
t1.value117.Radius = getgenv().TriggerRadius

function t1.value118(p84)
    local Character = p84.Character

    if not Character then
        return false
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    return Humanoid and (Character:FindFirstChild("Head") and Humanoid.Health > 0)
end
t1.value119 = nil
function t1.value119(p85)
    local CFramePosition = t1.value115.CFrame.Position
    local v440 = p85.Position - CFramePosition
    local raycastParams = RaycastParams.new()

    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {
		t1.value116.Character,
		t1.value115
	}

    local raycastResult = t1.value114:Raycast(CFramePosition, v440, raycastParams)

    if not raycastResult then
        return true
    end

    return raycastResult.Instance:IsDescendantOf(p85.Parent)
end
function t1.value120(p86)
    if not t1.value115 then
        return false
    end

    local vector2 = Vector2.new(t1.value115.ViewportSize.X / 2, t1.value115.ViewportSize.Y / 2)

    for _, v in ipairs({
		"Head",
		"UpperTorso",
		"Torso",
		"HumanoidRootPart"
	}) do
        local v3 = p86:FindFirstChild(v)

        if not v3 then
            continue
        end

        local v448, v449 = t1.value115:WorldToViewportPoint(v3.Position)

        if v449 and v448.Z > 0 and ((Vector2.new(v448.X, v448.Y) - vector2).Magnitude <= getgenv().TriggerRadius and t1.value119(v3)) then
            return true
        end
    end

    return false
end
function t1.value121()
    pcall(function()
        if mouse1click then
            mouse1click()
        end
    end)
    pcall(function()
        if mousebuttonclick then
            mousebuttonclick(1)
        end
    end)
    pcall(function()
        if click then
            click()
        end
    end)
end
task.spawn(function()
    while task.wait(0.016) do
        if getgenv().TRIGGER_Enabled then
            for _, player in ipairs(t1.value113:GetPlayers()) do
                if player ~= t1.value116 and (player.Character and t1.value118(player)) and t1.value120(player.Character) then
                    t1.value121()
                end
            end
        end
    end
end)
t1.value116.CharacterAdded:Connect(function()
    local _ = t1.value116.Character

    repeat
        task.wait()
    until t1.value116.Character
end)

local Players8 = game:GetService("Players")

t1.value122 = game:GetService("RunService")

local LocalPlayer3 = Players8.LocalPlayer
t1.value123 = false
if LocalPlayer3.Character then
    local Character = LocalPlayer3.Character
    local Humanoid = Character:WaitForChild("Humanoid")
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local connection
    connection = t1.value122.RenderStepped:Connect(function()
        if not t1.value123 then
            return
        end

        if Humanoid and HumanoidRootPart then
            local CurrentCamera = t1.value1.CurrentCamera

            if CurrentCamera then
                local vector3 = Vector3.new(CurrentCamera.CFrame.LookVector.X, 0, CurrentCamera.CFrame.LookVector.Z)

                if vector3.Magnitude > 0 then
                    Humanoid:Move(vector3.Unit, false)

                    return
                end
            end
        else
            connection:Disconnect()
        end
    end)
end
LocalPlayer3.CharacterAdded:Connect(function(character)
    local Humanoid = character:WaitForChild("Humanoid")
    local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local connection
    connection = t1.value122.RenderStepped:Connect(function()
        if not t1.value123 then
            return
        end

        if Humanoid and HumanoidRootPart then
            local CurrentCamera = t1.value1.CurrentCamera

            if CurrentCamera then
                local vector3 = Vector3.new(CurrentCamera.CFrame.LookVector.X, 0, CurrentCamera.CFrame.LookVector.Z)

                if vector3.Magnitude > 0 then
                    Humanoid:Move(vector3.Unit, false)

                    return
                end
            end
        else
            connection:Disconnect()
        end
    end)
end)
v20:AddToggle({
	Name = "Auto move",
	Flag = "AutoMove",
	Default = false,
	Callback = function(p90)
    t1.value123 = p90
end
})

getgenv().FastSpawnEnabled = false

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().FastSpawnEnabled then
            local char = t1.value19.Character
            local humanoid = char and char:FindFirstChild("Humanoid")
            
            if (not char or not humanoid or humanoid.Health <= 0) then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.Command:FireServer("Play")
                end)
            end
        end
    end
end)

v21:AddToggle({
    Name = "Fast Spawn",
    Flag = "FastSpawn",
    Default = false,
    Callback = function(p)
        getgenv().FastSpawnEnabled = p
    end
})

getgenv().BulletTrailsEnabled = false
getgenv().BulletTrailColor = Color3.fromRGB(205, 50, 255)

local TrailsList = {}

local function CreateBulletTrail(startPos, endPos, color)
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.Neon
    part.Color = color
    part.Size = Vector3.new(0.06, 0.06, (startPos - endPos).Magnitude)
    part.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -part.Size.Z / 2)
    part.Transparency = 0
    part.Parent = t1.value1
    
    table.insert(TrailsList, {Part = part, Life = 1.5})
end

RunService.RenderStepped:Connect(function()
    for i = #TrailsList, 1, -1 do
        local t = TrailsList[i]
        t.Life = t.Life - 0.016
        
        if t.Life <= 0 then
            pcall(function()
                t.Part:Destroy()
            end)
            table.remove(TrailsList, i)
        else
            t.Part.Transparency = 1 - (t.Life / 1.5)
        end
    end
end)

local bulletStorage = t1.value1:FindFirstChild("bulletStorage") or Instance.new("Folder", t1.value1)
bulletStorage.Name = "bulletStorage"

bulletStorage.ChildAdded:Connect(function(child)
    if not getgenv().BulletTrailsEnabled then return end
    if not child:IsA("BasePart") then return end
    
    local startPos = child.Position
    local connection
    
    connection = RunService.RenderStepped:Connect(function()
        if child and child.Parent then
            local endPos = child.Position
            CreateBulletTrail(startPos, endPos, getgenv().BulletTrailColor)
            startPos = endPos
        else
            connection:Disconnect()
        end
    end)
end)

v18:AddToggle({
    Name = "Bullet Trails",
    Flag = "BulletTrails",
    Default = false,
    Callback = function(p)
        getgenv().BulletTrailsEnabled = p
    end
})

v18:AddColorPicker({
    Name = "Trail Color",
    Flag = "BulletTrailColor",
    Default = Color3.fromRGB(205, 50, 255),
    Callback = function(p)
        getgenv().BulletTrailColor = p
    end
})
