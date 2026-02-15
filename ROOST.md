local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local v13 = {
    Enabled = false,
    TargetPart = "HumanoidRootPart",
    UseFOV = true,
    FOVRadius = 150,
    FOVColor = Color3.fromRGB(255, 255, 255),
    FOVColorNoTarget = Color3.fromRGB(255, 0, 0),
    FOVColorOnTarget = Color3.fromRGB(0, 255, 0),
    Snapline = false,
    SnaplineColor = Color3.fromRGB(255, 255, 255),
    SnaplineThickness = 2,
    WallCheck = false
}

local ESPOptions = {
    Enabled = false,
    Box = false,
    BoxStyle = "Default",
    BoxFill = false,
    BoxFillColor = Color3.fromRGB(255, 0, 0),
    BoxFillTrans = 0.5,
    Name = false,
    HealthBar = false,
    HealthText = false,
    Distance = false,
    Weapon = false,
    TeamCheck = false,
    Chams = false,
    ChamsColor = Color3.fromRGB(255, 0, 0),
    ChamsOutline = Color3.fromRGB(255, 255, 255),
    TargetHUD = false
}

local ESPColors = {
    Box1 = Color3.fromRGB(255, 255, 255),
    Name = Color3.fromRGB(255, 255, 255),
    Distance = Color3.fromRGB(255, 255, 255),
    Weapon = Color3.fromRGB(255, 255, 255)
}

local TraceSettings = {
    Enabled = false,
    Color = Color3.fromRGB(255, 255, 255),
    Mode = "Default",
    LifeTime = 1,
    Transparency = 0.5
}

local XRaySettings = {
    Enabled = false,
    Transparency = 0.5
}

local CrosshairSettings = {
    Enabled = false,
    Type = "Cross",
    Color = Color3.fromRGB(255, 0, 0),
    Size = 12,
    SpreadEnabled = true,
    Spread = 4,
    Animate = false,
    AnimateSpeed = 2,
    Rainbow = false,
    Thickness = 1,
    Position = "Mouse",
    YOffset = 0
}

local KillNotify = false
local CurrentAimTarget = nil
local LibraryUnloaded = false

local StellarHubMenu = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/uimenu/main/StellarhubMenu"))()
local Settings = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNotFatBitch/uimenu/main/StellarhubSettings"))()

local Window = StellarHubMenu:Create({
    Title = 'VeryUp Restore | StellarHub',
    Size = UDim2.new(0, 700, 0, 550),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    ShowOnCreate = true,
    PerformanceMode = false,
    TweenSpeed = 0.3,
    UnloadTotal = true,
    PlayerListEnabled = false, 
    WatermarkEnabled = true,
    WatermarkText = 'VeryUp Free',
    CanChangeTitleWatermark = true,
    ObfuscateConfig = false,
    MobileLogo = 'rbxassetid://14768967526',
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visual = Window:AddTab('Visual'),
    Misc = Window:AddTab('Misc'),
}

local SettingsSections = Settings:InitializeSettingsTab(Window, 'VeryUpFixed', 'Config')

local SilentAimBox = Tabs.Combat:AddLeftGroupbox('Silent Aim')

SilentAimBox:AddToggle('SA_Enabled', {
    Text = 'Silent Aim Enabled',
    Default = false,
    Callback = function(v) v13.Enabled = v end
}):AddKeybind('SA_Key', {
    Default = 'P',
    Mode = 'Toggle',
    Title = 'Keybind'
})

SilentAimBox:AddToggle('SA_WallCheck', {
    Text = 'Wall Check',
    Default = false,
    Callback = function(v) v13.WallCheck = v end
})

SilentAimBox:AddDropdown('SA_TargetPart', {
    Values = {"Head", "HumanoidRootPart"},
    Default = 2,
    Multi = false,
    Text = 'Target Part',
    Callback = function(v) v13.TargetPart = v end
})

SilentAimBox:AddToggle('SA_UseFOV', {
    Text = 'Use FOV',
    Default = true,
    Callback = function(v) v13.UseFOV = v end
}):AddColorPicker('SA_FOVColor', {
    Default = v13.FOVColor,
    Title = 'FOV Color',
    Callback = function(v) v13.FOVColor = v end
})

SilentAimBox:AddSlider('SA_FOVRadius', {
    Text = 'FOV Radius',
    Default = 150,
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Callback = function(v) v13.FOVRadius = v end
})

local CombatMagic = Tabs.Combat:AddRightGroupbox('Magic Bullets (BETA)')
CombatMagic:AddToggle('MagicBullets', {
    Text = 'Magic Bullets',
    Default = false
}):AddKeybind('MagicBulletsKey', {
    Default = 'M',
    Mode = 'Toggle',
    Title = 'Keybind'
})

CombatMagic:AddSlider('MagicBulletsHeight', {
    Text = 'Arc Height',
    Min = 0,
    Max = 1000,
    Default = 20,
    Rounding = 0
})

local CombatMods = Tabs.Combat:AddLeftGroupbox('Gun Mods')

local noRecoilEnabled = false
local recoilModule = nil
function setupNoRecoil(val)
    if val then
        if not recoilModule then
            pcall(function()
                recoilModule = require(ReplicatedStorage:WaitForChild("Gun"):WaitForChild("Scripts"):WaitForChild("RecoilHandler"))
            end)
        end
        if recoilModule then
            if not recoilModule._original_nextStep then recoilModule._original_nextStep = recoilModule.nextStep end
            if not recoilModule._original_setRecoilMultiplier then recoilModule._original_setRecoilMultiplier = recoilModule.setRecoilMultiplier end
            
            recoilModule.nextStep = function() end
            recoilModule.setRecoilMultiplier = function() end
            noRecoilEnabled = true
        end
    elseif recoilModule then
        if recoilModule._original_nextStep then
            recoilModule.nextStep = recoilModule._original_nextStep
            recoilModule._original_nextStep = nil
        end
        if recoilModule._original_setRecoilMultiplier then
            recoilModule.setRecoilMultiplier = recoilModule._original_setRecoilMultiplier
            recoilModule._original_setRecoilMultiplier = nil
        end
        noRecoilEnabled = false
    end
end

CombatMods:AddToggle('NoRecoil', {
    Text = 'No Recoil',
    Default = false,
    Callback = function(v) setupNoRecoil(v) end
})

local spreadPatched = false
local spreadOldFuncs = {}
function setupNoSpread(val)
    local Utils = ReplicatedStorage:FindFirstChild("Utils")
    if Utils and Utils:IsA("ModuleScript") then
        local s, r = pcall(require, Utils)
        if s and type(r) == "table" and r.applySpreadToDirection then
            if val then
                if not spreadPatched then
                    spreadOldFuncs.applySpreadToDirection = r.applySpreadToDirection
                    r.applySpreadToDirection = function(dir, ...) return dir end
                    spreadPatched = true
                end
            elseif spreadPatched and spreadOldFuncs.applySpreadToDirection then
                r.applySpreadToDirection = spreadOldFuncs.applySpreadToDirection
                spreadPatched = false
            end
        end
    end
end

CombatMods:AddToggle('NoSpread', {
    Text = 'No Spread',
    Default = false,
    Callback = function(v) setupNoSpread(v) end
})

local SpinSettings = { Enabled = false, Speed = 20 }
local spinConnection = nil
function setSpinBot(enabled, speed)
    SpinSettings.Enabled = enabled
    SpinSettings.Speed = speed or SpinSettings.Speed
    if spinConnection then spinConnection:Disconnect() spinConnection = nil end
    if enabled then
        spinConnection = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad((tick() * SpinSettings.Speed) % 360), 0)
            end
        end)
    end
end

local AntiAimBox = Tabs.Combat:AddRightGroupbox('Anti-Aim')
AntiAimBox:AddToggle('SpinBotEnabled', {
    Text = 'Spin Bot',
    Default = false,
    Callback = function(v) setSpinBot(v, Options.SpinBotSpeed.Value) end
})
AntiAimBox:AddSlider('SpinBotSpeed', {
    Text = 'Spin Speed',
    Min = -100,
    Max = 100,
    Default = 20,
    Rounding = 0,
    Callback = function(v) 
        if Toggles.SpinBotEnabled.Value then setSpinBot(true, v) end 
    end
})

local ESPBox = Tabs.Visual:AddLeftGroupbox('ESP Settings')

ESPBox:AddToggle('ESPEnabled', {
    Text = 'Master Switch',
    Default = false,
    Callback = function(v) ESPOptions.Enabled = v end
})

ESPBox:AddToggle('ESPBox', {
    Text = 'Box',
    Default = false,
    Callback = function(v) ESPOptions.Box = v end
}):AddColorPicker('BoxColor', {
    Default = ESPColors.Box1,
    Title = 'Color',
    Callback = function(v) ESPColors.Box1 = v end
})

ESPBox:AddToggle('ESPChams', {
    Text = 'Chams',
    Default = false,
    Callback = function(v) ESPOptions.Chams = v end
}):AddColorPicker('ChamsColor', {
    Default = ESPOptions.ChamsColor,
    Title = 'Fill Color',
    Callback = function(v) ESPOptions.ChamsColor = v end
})
ESPBox:AddLabel('Outline'):AddColorPicker('ChamsOutlineColor', {
    Default = ESPOptions.ChamsOutline,
    Title = 'Outline Color',
    Callback = function(v) ESPOptions.ChamsOutline = v end
})

ESPBox:AddToggle('ESPName', { Text = 'Name', Default = false, Callback = function(v) ESPOptions.Name = v end })
ESPBox:AddToggle('ESPDistance', { Text = 'Distance', Default = false, Callback = function(v) ESPOptions.Distance = v end })
ESPBox:AddToggle('ESPHealthBar', { Text = 'Health Bar', Default = false, Callback = function(v) ESPOptions.HealthBar = v end })
ESPBox:AddToggle('ESPTeamCheck', { Text = 'Team Check', Default = false, Callback = function(v) ESPOptions.TeamCheck = v end })

local VisualOther = Tabs.Visual:AddRightGroupbox('Features')

VisualOther:AddToggle('TargetHUDToggle', {
    Text = 'Target HUD',
    Default = false,
    Callback = function(v) ESPOptions.TargetHUD = v end
})

VisualOther:AddToggle('KillNotify', {
    Text = 'Kill Notifications',
    Default = false,
    Callback = function(v) KillNotify = v end
})

VisualOther:AddToggle('BulletTrace', {
    Text = 'Bullet Tracers',
    Default = false,
    Callback = function(v) TraceSettings.Enabled = v end
}):AddColorPicker('TraceColor', {
    Default = TraceSettings.Color,
    Title = 'Color',
    Callback = function(v) TraceSettings.Color = v end
})

VisualOther:AddSlider('FOVChanger', {
    Text = 'FOV Changer',
    Min = 50,
    Max = 120,
    Default = 70,
    Rounding = 0,
    Callback = function(v) Camera.FieldOfView = v end
})

local whitelistKeywords = {"TwigWall", "SoloTwigFrame", "TrigTwigRoof", "TwigFrame", "TwigWindow", "TwigRoof"}
local xrayTargets = {}
local function isWhitelisted(name)
    for _, kw in ipairs(whitelistKeywords) do if string.find(name, kw) then return true end end
    return false
end
local function registerForXray(obj)
    if xrayTargets[obj] then return end
    if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation") then
        if isWhitelisted(obj.Name) then xrayTargets[obj] = {OriginalTransparency = obj.Transparency} end
    end
end
local function setXrayState(active, trans)
    for part, data in pairs(xrayTargets) do
        if part and part:IsDescendantOf(Workspace) then
            part.Transparency = active and trans or data.OriginalTransparency
        end
    end
end
VisualOther:AddToggle('XRay', {
    Text = 'X-Ray (Base Walls)',
    Default = false,
    Callback = function(v) 
        XRaySettings.Enabled = v
        setXrayState(v, XRaySettings.Transparency)
    end
}):AddKeybind('XRayKey', { Default = 'X', Mode = 'Toggle', Title = 'Key' })

VisualOther:AddSlider('XRayTrans', {
    Text = 'XRay Transparency',
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(v) 
        XRaySettings.Transparency = v
        if Toggles.XRay.Value then setXrayState(true, v) end
    end
})

local CrosshairBox = Tabs.Misc:AddRightGroupbox('Custom Crosshair')

CrosshairBox:AddToggle('CrosshairEnabled', {
    Text = 'Enabled',
    Default = false,
    Callback = function(v) CrosshairSettings.Enabled = v end
}):AddColorPicker('CrosshairColor', {
    Default = CrosshairSettings.Color,
    Title = 'Color',
    Callback = function(v) CrosshairSettings.Color = v end
})

CrosshairBox:AddDropdown('CrosshairType', {
    Values = {"Cross", "Dot"}, 
    Default = 1,
    Text = 'Type',
    Callback = function(v) CrosshairSettings.Type = v end
})

CrosshairBox:AddSlider('CrosshairSize', { Text = 'Size', Default = 12, Min = 1, Max = 50, Rounding = 0, Callback = function(v) CrosshairSettings.Size = v end })
CrosshairBox:AddSlider('CrosshairThickness', { Text = 'Thickness', Default = 1, Min = 1, Max = 10, Rounding = 0, Callback = function(v) CrosshairSettings.Thickness = v end })

local MoveBox = Tabs.Misc:AddLeftGroupbox('Movement')

local WaterSpeed = {Enabled = false, Value = 50, Conn = nil}
local function updateWaterSpeed(val)
    if WaterSpeed.Conn then WaterSpeed.Conn:Disconnect() WaterSpeed.Conn = nil end
    local fname = "WaterSwimVelocity"
    if val then
        WaterSpeed.Conn = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if hum and root and hum:GetState() == Enum.HumanoidStateType.Swimming then
                local bv = root:FindFirstChild(fname) or Instance.new("BodyVelocity", root)
                bv.Name = fname
                bv.MaxForce = Vector3.new(100000, 100000, 100000)
                bv.Velocity = hum.MoveDirection * WaterSpeed.Value
            else
                local bv = root and root:FindFirstChild(fname)
                if bv then bv:Destroy() end
            end
        end)
    else
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root and root:FindFirstChild(fname) then root:FindFirstChild(fname):Destroy() end
    end
end

MoveBox:AddToggle('WaterSpeed', {
    Text = 'Swim Speed',
    Default = false,
    Callback = function(v) updateWaterSpeed(v) end
})
MoveBox:AddSlider('SwimSpeedVal', {
    Text = 'Water Speed',
    Min = 20,
    Max = 200,
    Default = 50,
    Rounding = 0,
    Callback = function(v) WaterSpeed.Value = v end
})

local HUD_GUI = Instance.new("ScreenGui")
HUD_GUI.Name = "StellarTargetHUD"
HUD_GUI.Parent = game.CoreGui
HUD_GUI.Enabled = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 90)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.85, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = HUD_GUI

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 60, 0, 60)
AvatarImage.Position = UDim2.new(0, 15, 0, 15)
AvatarImage.BackgroundColor3 = Color3.new(0,0,0)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Parent = MainFrame

local TextContainer = Instance.new("Frame")
TextContainer.BackgroundTransparency = 1
TextContainer.Position = UDim2.new(0, 85, 0, 10)
TextContainer.Size = UDim2.new(1, -95, 0, 50)
TextContainer.Parent = MainFrame

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, 0, 0, 25)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = "Username"
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 20
NameLabel.TextColor3 = Color3.new(1, 1, 1)
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.Parent = TextContainer

local DistLabel = Instance.new("TextLabel")
DistLabel.Size = UDim2.new(1, 0, 0, 20)
DistLabel.Position = UDim2.new(0, 0, 0, 25)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "Distance: 0m"
DistLabel.Font = Enum.Font.Gotham
DistLabel.TextSize = 16
DistLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DistLabel.TextXAlignment = Enum.TextXAlignment.Left
DistLabel.Parent = TextContainer

local HealthBarBG = Instance.new("Frame")
HealthBarBG.Size = UDim2.new(1, -30, 0, 12)
HealthBarBG.Position = UDim2.new(0, 15, 1, -20)
HealthBarBG.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
HealthBarBG.BorderSizePixel = 0
HealthBarBG.Parent = MainFrame

local HealthBarFill = Instance.new("Frame")
HealthBarFill.Size = UDim2.new(1, 0, 1, 0)
HealthBarFill.BackgroundColor3 = Color3.new(1, 1, 1)
HealthBarFill.BorderSizePixel = 0
HealthBarFill.Parent = HealthBarBG

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 230, 50))
}
Gradient.Parent = HealthBarFill

local function UpdateTargetHUD()
    if not ESPOptions.TargetHUD or not v13.Enabled then 
        HUD_GUI.Enabled = false
        return 
    end

    local char = nil
    if CurrentAimTarget and CurrentAimTarget.Parent then
        char = CurrentAimTarget.Parent
    end

    if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") and char.Humanoid.Health > 0 then
        HUD_GUI.Enabled = true
        local hum = char.Humanoid
        local player = Players:GetPlayerFromCharacter(char)
        
        if player then
            NameLabel.Text = player.DisplayName
            local content = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
            AvatarImage.Image = content
        else
            NameLabel.Text = char.Name
            AvatarImage.Image = ""
        end

        local dist = (LocalPlayer.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
        DistLabel.Text = "Distance: " .. string.format("%.1f", dist) .. "m"

        local hpPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
        TweenService:Create(HealthBarFill, TweenInfo.new(0.15), {Size = UDim2.new(hpPercent, 0, 1, 0)}):Play()
    else
        HUD_GUI.Enabled = false
    end
end

local function OnPlayerDied(victim)
    if not KillNotify then return end
    
    local isMyKill = false
    local victimChar = victim.Character
    local hum = victimChar and victimChar:FindFirstChild("Humanoid")

    if hum and hum:FindFirstChild("creator") and hum.creator.Value == LocalPlayer then
        isMyKill = true
    end
    
    if not isMyKill and CurrentAimTarget and CurrentAimTarget.Parent == victimChar then
         isMyKill = true
    end

    if isMyKill then
        Settings:Notify("You killed " .. victim.Name .. "!", 3)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid", 10)
        if hum then
            hum.Died:Connect(function() OnPlayerDied(player) end)
        end
    end)
end)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.Died:Connect(function() OnPlayerDied(player) end)
        end
    end
end

local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 60
fov_circle.Radius = 100
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.Transparency = 1
fov_circle.Color = Color3.new(1,1,1)

local function getPositionOnScreen(pos)
    local v, onscreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(v.X, v.Y), onscreen
end

local function getClosestPlayer()
    local closest = nil
    local shortestDist = math.huge
    local mousePos = UserInputService:GetMouseLocation()

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild(v13.TargetPart) and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            
            if ESPOptions.TeamCheck and plr.Team == LocalPlayer.Team then
                continue
            end

            local part = plr.Character[v13.TargetPart]
            local pos, onscreen = getPositionOnScreen(part.Position)
            
            if onscreen then
                if v13.WallCheck then
                    local params = RaycastParams.new()
                    params.FilterType = Enum.RaycastFilterType.Blacklist
                    params.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
                    local origin = Camera.CFrame.Position
                    local direction = (part.Position - origin)
                    local ray = Workspace:Raycast(origin, direction, params)
                    
                    if ray and not ray.Instance:IsDescendantOf(plr.Character) then
                        continue 
                    end
                end

                local dist = (mousePos - pos).Magnitude
                if v13.UseFOV then
                    if dist <= v13.FOVRadius and dist < shortestDist then
                        closest = part
                        shortestDist = dist
                    end
                else
                    if dist < shortestDist then
                        closest = part
                        shortestDist = dist
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if LibraryUnloaded then 
        fov_circle.Visible = false 
        HUD_GUI:Destroy()
        return 
    end

    fov_circle.Radius = v13.FOVRadius
    fov_circle.Position = UserInputService:GetMouseLocation()
    fov_circle.Visible = v13.Enabled and v13.UseFOV
    fov_circle.Color = v13.FOVColor

    CurrentAimTarget = getClosestPlayer()
    
    if v13.Enabled and v13.UseFOV and CurrentAimTarget then
        fov_circle.Color = v13.FOVColorOnTarget
    elseif v13.Enabled and v13.UseFOV then
        fov_circle.Color = v13.FOVColorNoTarget
    end

    UpdateTargetHUD()
end)

local crossLines = {}
local crossDot = nil

RunService.RenderStepped:Connect(function()
    for _, l in pairs(crossLines) do l.Visible = false end
    if crossDot then crossDot.Visible = false end

    if not CrosshairSettings.Enabled or LibraryUnloaded then return end

    local center = UserInputService:GetMouseLocation()
    center = Vector2.new(center.X, center.Y + CrosshairSettings.YOffset)

    if CrosshairSettings.Type == "Dot" then
        if not crossDot then crossDot = Drawing.new("Circle") crossDot.Filled = true end
        crossDot.Visible = true
        crossDot.Position = center
        crossDot.Radius = CrosshairSettings.Size / 2
        crossDot.Color = CrosshairSettings.Color
        crossDot.Transparency = 1
    elseif CrosshairSettings.Type == "Cross" then
        for i = 1, 4 do
            if not crossLines[i] then crossLines[i] = Drawing.new("Line") end
            local line = crossLines[i]
            line.Visible = true
            line.Color = CrosshairSettings.Color
            line.Thickness = CrosshairSettings.Thickness
            line.Transparency = 1
            
            local size = CrosshairSettings.Size
            local spread = CrosshairSettings.SpreadEnabled and CrosshairSettings.Spread or 0
            
            if i == 1 then
                line.From = Vector2.new(center.X, center.Y - spread)
                line.To = Vector2.new(center.X, center.Y - spread - size)
            elseif i == 2 then
                line.From = Vector2.new(center.X, center.Y + spread)
                line.To = Vector2.new(center.X, center.Y + spread + size)
            elseif i == 3 then
                line.From = Vector2.new(center.X - spread, center.Y)
                line.To = Vector2.new(center.X - spread - size, center.Y)
            elseif i == 4 then
                line.From = Vector2.new(center.X + spread, center.Y)
                line.To = Vector2.new(center.X + spread + size, center.Y)
            end
        end
    end
end)

local espCache = {}
local chamsCache = {}
local function createDrawing(type, props)
    local d = Drawing.new(type)
    for k,v in pairs(props) do d[k] = v end
    return d
end

local function removeEsp(plr)
    if espCache[plr] then
        for _, d in pairs(espCache[plr]) do d:Remove() end
        espCache[plr] = nil
    end
    if chamsCache[plr] then
        chamsCache[plr]:Destroy()
        chamsCache[plr] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if LibraryUnloaded then return end
    if not ESPOptions.Enabled then 
        for plr, _ in pairs(espCache) do removeEsp(plr) end
        return 
    end

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            if not (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0) then
                removeEsp(plr)
                continue
            end
            
            if ESPOptions.TeamCheck and plr.Team == LocalPlayer.Team then
                removeEsp(plr)
                continue
            end

            if ESPOptions.Chams then
                if not chamsCache[plr] then
                    local hl = Instance.new("Highlight")
                    hl.Parent = plr.Character
                    hl.FillTransparency = 0.5
                    hl.OutlineTransparency = 0
                    chamsCache[plr] = hl
                end
                chamsCache[plr].FillColor = ESPOptions.ChamsColor
                chamsCache[plr].OutlineColor = ESPOptions.ChamsOutline
            else
                if chamsCache[plr] then
                    chamsCache[plr]:Destroy()
                    chamsCache[plr] = nil
                end
            end

            local root = plr.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
            
            if onScreen then
                if not espCache[plr] then
                    espCache[plr] = {
                        Box = createDrawing("Square", {Thickness = 1, Filled = false}),
                        Name = createDrawing("Text", {Size = 13, Center = true, Outline = true, Font = 2}),
                        Dist = createDrawing("Text", {Size = 13, Center = true, Outline = true, Font = 2})
                    }
                end
                
                local cache = espCache[plr]
                local hrpPos = root.Position
                local topPos = hrpPos + Vector3.new(0, 3, 0)
                local botPos = hrpPos - Vector3.new(0, 3.5, 0)
                
                local top, _ = Camera:WorldToViewportPoint(topPos)
                local bot, _ = Camera:WorldToViewportPoint(botPos)
                local height = math.abs(bot.Y - top.Y)
                local width = height / 2

                if ESPOptions.Box then
                    cache.Box.Visible = true
                    cache.Box.Size = Vector2.new(width, height)
                    cache.Box.Position = Vector2.new(pos.X - width/2, pos.Y - height/2)
                    cache.Box.Color = ESPColors.Box1
                else
                    cache.Box.Visible = false
                end

                if ESPOptions.Name then
                    cache.Name.Visible = true
                    cache.Name.Position = Vector2.new(pos.X, pos.Y - height/2 - 15)
                    cache.Name.Text = plr.Name
                    cache.Name.Color = ESPColors.Name
                else
                    cache.Name.Visible = false
                end

                if ESPOptions.Distance then
                    cache.Dist.Visible = true
                    cache.Dist.Position = Vector2.new(pos.X, pos.Y + height/2 + 2)
                    cache.Dist.Text = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - hrpPos).Magnitude) .. "m"
                    cache.Dist.Color = ESPColors.Distance
                else
                    cache.Dist.Visible = false
                end
            else
                removeEsp(plr)
            end
        else
            removeEsp(plr)
        end
    end
end)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if v13.Enabled and CurrentAimTarget and not checkcaller() then
        if method == "Raycast" then
            local origin = args[1]
            if typeof(origin) == "Vector3" then
                args[2] = CurrentAimTarget.Position - origin
                return oldNamecall(self, unpack(args))
            end
        end
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

Settings:Notify('VeryUp Restored Loaded!', 5)

Settings:OnUnload(function()
    LibraryUnloaded = true
    fov_circle:Remove()
    HUD_GUI:Destroy()
    for _, l in pairs(crossLines) do l:Remove() end
    if crossDot then crossDot:Remove() end
    if spinConnection then spinConnection:Disconnect() end
    if WaterSpeed.Conn then WaterSpeed.Conn:Disconnect() end
    for plr, _ in pairs(espCache) do removeEsp(plr) end
    print('Unloaded!')
end)
