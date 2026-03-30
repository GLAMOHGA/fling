local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/heads/main/Library/Module.lua"))()
local SkelLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()

local window = library:CreateWindow({
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.RightShift,
    InitialHeight = 500,
    InitialWidth = 550
}, gethui())

library:SetWindowName("vomagla Gun Grounds FFA")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Сохраняем оригинальные настройки Lighting
local originalAmbient = Lighting.Ambient
local originalOutdoorAmbient = Lighting.OutdoorAmbient
local originalFogStart = Lighting.FogStart
local originalFogEnd = Lighting.FogEnd
local originalFogColor = Lighting.FogColor

-- Nebula Theme Colors
local NebulaColors = {
    ["Gray"] = Color3.fromRGB(128, 128, 128),
    ["White"] = Color3.fromRGB(255, 255, 255),
    ["Black"] = Color3.fromRGB(30, 30, 30),
    ["Blue"] = Color3.fromRGB(100, 149, 237)
}

-- Запоминаем оригинальную скорость при запуске скрипта
local OriginalWalkSpeed = 16
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
    OriginalWalkSpeed = LocalPlayer.Character.Humanoid.WalkSpeed
end

-- ========== GLOBALS ==========
_G.SilentAimEnabled = false
_G.TargetPart = "Head"
_G.FOVSize = 150
_G.WallCheck = false
_G.AutoShoot = false
_G.EspEnabled = false
_G.ChamsEnabled = false
_G.FlyEnabled = false
_G.FlySpeed = 50
_G.CustomFOV = false
_G.CustomFOVValue = 90
_G.SkyType = "Default"
_G.TimeOfDay = 14

-- Speed
_G.SpeedEnabled = false
_G.SpeedValue = 30

-- Jump Boost
_G.JumpBoostEnabled = false

-- Viewmodel
_G.ViewmodelEnabled = false
_G.ViewmodelZ = 0
_G.ViewmodelY = 0

-- Hitbox (только Box)
_G.HitboxEnabled = false
_G.HitboxSize = 5
_G.HitboxTransparency = 0.7

-- Weapon Chams
_G.WeaponChamsEnabled = false
_G.WeaponChamsMaterial = "Neon"

-- Nebula Theme
_G.NebulaEnabled = false
_G.NebulaColor = "Blue"

local defaultCameraFOV = Camera.FieldOfView
local isFlying = false
local flyBV, flyBG
local target = { enabled = true, position = nil }
local targetInFOV = false
local chamsFolder = Instance.new("Folder", game.CoreGui)
chamsFolder.Name = "ChamsFolder"
local chamsConnections = {}
local chamsHighlights = {}
local originalJumpPower = nil

-- Notification cooldown
local notificationCooldown = false

local ArrowSettings = {
    DistFromCenter = 80,
    Height = 16,
    Width = 16,
    Color = Color3.fromRGB(255, 255, 255)
}

-- ========== NOTIFICATION FUNCTION ==========
local function SendNotification()
    if notificationCooldown then return end
    notificationCooldown = true
    
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Function will work after death",
            Text = "Функция заработает после смерти",
            Duration = 5
        })
    end)
    
    task.delay(1, function()
        notificationCooldown = false
    end)
end

-- ========== WEAPON CHAMS ==========
local function applyWeaponChams(character)
    if not character then return end
    if not _G.WeaponChamsEnabled then return end
    
    local material = Enum.Material.Neon
    if _G.WeaponChamsMaterial == "ForceField" then
        material = Enum.Material.ForceField
    end
    
    local Gun = character:FindFirstChildOfClass("Tool")
    if Gun then
        for _, v in pairs(Gun:GetDescendants()) do
            if v:IsA('MeshPart') then
                v.Material = material
                v.Color = Color3.fromRGB(255, 255, 255)
                pcall(function() v.TextureID = '' end)
            elseif v:IsA('BasePart') then
                v.Material = material
                v.Color = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end

local function setupWeaponChams(character)
    if not character then return end
    
    task.wait(0.1)
    applyWeaponChams(character)
    
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.1)
            applyWeaponChams(character)
        end
    end)
end

-- ========== NEBULA THEME ==========
local function applyNebulaTheme()
    -- Remove old effects
    for _, name in pairs({"NebulaBloom", "NebulaColorCorrection", "NebulaAtmosphere"}) do
        local obj = Lighting:FindFirstChild(name)
        if obj then obj:Destroy() end
    end
    
    if not _G.NebulaEnabled then
        Lighting.Ambient = originalAmbient
        Lighting.OutdoorAmbient = originalOutdoorAmbient
        Lighting.FogStart = originalFogStart
        Lighting.FogEnd = originalFogEnd
        Lighting.FogColor = originalFogColor
        return
    end
    
    local nebulaColor = NebulaColors[_G.NebulaColor] or NebulaColors["Blue"]
    
    local b = Instance.new("BloomEffect", Lighting)
    b.Intensity = 0.7
    b.Size = 24
    b.Threshold = 1
    b.Name = "NebulaBloom"
    
    local c = Instance.new("ColorCorrectionEffect", Lighting)
    c.Saturation = 0.5
    c.Contrast = 0.2
    c.TintColor = nebulaColor
    c.Name = "NebulaColorCorrection"
    
    local a = Instance.new("Atmosphere", Lighting)
    a.Density = 0.4
    a.Offset = 0.25
    a.Glare = 1
    a.Haze = 2
    a.Color = nebulaColor
    a.Decay = Color3.fromRGB(173, 216, 230)
    a.Name = "NebulaAtmosphere"
    
    Lighting.Ambient = nebulaColor
    Lighting.OutdoorAmbient = nebulaColor
    Lighting.FogStart = 100
    Lighting.FogEnd = 500
    Lighting.FogColor = nebulaColor
end

-- ========== UTILITY FUNCTIONS ==========
local function isVisible(part, character)
    local origin = Camera.CFrame.Position
    local destination = part.Position
    local direction = (destination - origin).Unit * (destination - origin).Magnitude
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(origin, direction, raycastParams)
    return result and result.Instance:IsDescendantOf(character)
end

local function getClosestTarget()
    local closestDist = _G.FOVSize
    local closestPos = nil
    local screenCenter = Camera.ViewportSize / 2
    local foundTarget = false
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then continue end
        local aimPart = char:FindFirstChild(_G.TargetPart) or char:FindFirstChild("HumanoidRootPart")
        if not aimPart then continue end
        if _G.WallCheck and not isVisible(aimPart, char) then continue end
        local screenPos, onScreen = Camera:WorldToViewportPoint(aimPart.Position)
        if not onScreen then continue end
        local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
        if dist < closestDist then
            closestDist = dist
            closestPos = aimPart.Position
            foundTarget = true
        end
    end
    
    targetInFOV = foundTarget
    return closestPos
end

local function GetRelative(pos, char)
    if not char or not char.PrimaryPart then return Vector2.new(0,0) end
    local camP = Camera.CFrame.Position
    local relative = CFrame.new(Vector3.new(char.PrimaryPart.Position.X, camP.Y, char.PrimaryPart.Position.Z), camP):PointToObjectSpace(pos)
    return Vector2.new(relative.X, relative.Z)
end

local function RotateVect(v, a)
    a = math.rad(a)
    return Vector2.new(v.x * math.cos(a) - v.y * math.sin(a), v.x * math.sin(a) + v.y * math.cos(a))
end

-- ========== SILENT AIM HOOK ==========
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod():lower()
    if _G.SilentAimEnabled and target.position and method == "raycast" and self.Name == "Workspace" then
        args[2] = (target.position - args[1]).Unit * 1000
        return oldNamecall(self, table.unpack(args))
    end
    return oldNamecall(self, ...)
end))

-- ========== AUTO SHOOT ==========
local autoShootConnection = nil

local function startAutoShoot()
    if autoShootConnection then return end
    
    autoShootConnection = RunService.RenderStepped:Connect(function()
        if _G.AutoShoot and _G.SilentAimEnabled and targetInFOV then
            mouse1press()
            task.wait(0.05)
            mouse1release()
        end
    end)
end

local function stopAutoShoot()
    if autoShootConnection then
        autoShootConnection:Disconnect()
        autoShootConnection = nil
    end
end

-- ========== CHAMS ==========
local function AddChams(plr)
    if plr == LocalPlayer then return end
    local function applyHighlight(char)
        if not char then return end
        if chamsHighlights[plr] then
            chamsHighlights[plr]:Destroy()
            chamsHighlights[plr] = nil
        end
        if _G.ChamsEnabled then
            local hl = Instance.new("Highlight")
            hl.Name = "VasyaChams"
            hl.Adornee = char
            hl.FillTransparency = 0.8
            hl.OutlineTransparency = 0.1
            hl.FillColor = Color3.fromRGB(255, 0, 0)
            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            hl.Parent = chamsFolder
            chamsHighlights[plr] = hl
        end
    end
    if plr.Character then applyHighlight(plr.Character) end
    local conn = plr.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        applyHighlight(char)
    end)
    chamsConnections[plr] = conn
end

local function RemoveChams(plr)
    if chamsHighlights[plr] then
        chamsHighlights[plr]:Destroy()
        chamsHighlights[plr] = nil
    end
    if chamsConnections[plr] then
        chamsConnections[plr]:Disconnect()
        chamsConnections[plr] = nil
    end
end

local function RefreshAllChams()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            RemoveChams(plr)
            AddChams(plr)
        end
    end
end

Players.PlayerRemoving:Connect(function(plr)
    RemoveChams(plr)
end)

-- ========== ESP ==========
local function MainESP(plr)
    local Lib = {
        TL1 = Drawing.new("Line"), TL2 = Drawing.new("Line"),
        TR1 = Drawing.new("Line"), TR2 = Drawing.new("Line"),
        BL1 = Drawing.new("Line"), BL2 = Drawing.new("Line"),
        BR1 = Drawing.new("Line"), BR2 = Drawing.new("Line")
    }
    local NameTag = Drawing.new("Text")
    NameTag.Center = true NameTag.Outline = true NameTag.Size = 13 NameTag.Font = 2

    local Arrow = Drawing.new("Triangle")
    Arrow.Filled = true Arrow.Transparency = 1 Arrow.Thickness = 1

    local skel = SkelLib:NewSkeleton(plr, true)
    local oripart = Instance.new("Part")
    oripart.Transparency = 1 oripart.CanCollide = false oripart.Parent = workspace

    local con
    con = RunService.RenderStepped:Connect(function()
        if _G.EspEnabled and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local root = plr.Character.HumanoidRootPart
            local hum = plr.Character.Humanoid
            local screenPos, vis = Camera:WorldToViewportPoint(root.Position)

            skel:SetVisible(true)
            local rainbow = Color3.fromHSV(tick() % 5 / 5, 0.7, 1)

            if vis then
                Arrow.Visible = false
                oripart.Size = Vector3.new(root.Size.X, root.Size.Y * 1.5, root.Size.Z)
                oripart.CFrame = CFrame.new(root.CFrame.Position, Camera.CFrame.Position)

                local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(oripart.Size.X, oripart.Size.Y, 0)).p)
                local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-oripart.Size.X, oripart.Size.Y, 0)).p)
                local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(oripart.Size.X, -oripart.Size.Y, 0)).p)
                local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-oripart.Size.X, -oripart.Size.Y, 0)).p)

                local offset = math.clamp(1/(Camera.CFrame.p - root.Position).magnitude * 750, 2, 300)

                for _, line in pairs(Lib) do line.Visible = true line.Color = rainbow line.Thickness = 2 end
                Lib.TL1.From = Vector2.new(TL.X, TL.Y) Lib.TL1.To = Vector2.new(TL.X + offset, TL.Y)
                Lib.TL2.From = Vector2.new(TL.X, TL.Y) Lib.TL2.To = Vector2.new(TL.X, TL.Y + offset)
                Lib.TR1.From = Vector2.new(TR.X, TR.Y) Lib.TR1.To = Vector2.new(TR.X - offset, TR.Y)
                Lib.TR2.From = Vector2.new(TR.X, TR.Y) Lib.TR2.To = Vector2.new(TR.X, TR.Y + offset)
                Lib.BL1.From = Vector2.new(BL.X, BL.Y) Lib.BL1.To = Vector2.new(BL.X + offset, BL.Y)
                Lib.BL2.From = Vector2.new(BL.X, BL.Y) Lib.BL2.To = Vector2.new(BL.X, BL.Y - offset)
                Lib.BR1.From = Vector2.new(BR.X, BR.Y) Lib.BR1.To = Vector2.new(BR.X - offset, BR.Y)
                Lib.BR2.From = Vector2.new(BR.X, BR.Y) Lib.BR2.To = Vector2.new(BR.X, BR.Y - offset)

                NameTag.Visible = true
                NameTag.Position = Vector2.new(TL.X + (TR.X - TL.X)/2, TL.Y - 20)
                NameTag.Text = string.format("%s [%d HP]", plr.Name, math.floor(hum.Health))
                NameTag.Color = Color3.fromHSV(math.clamp(hum.Health/hum.MaxHealth, 0, 1) * 0.35, 0.9, 1)
            else
                for _, v in pairs(Lib) do v.Visible = false end
                NameTag.Visible = false

                if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
                    local rel = GetRelative(root.Position, LocalPlayer.Character)
                    local direction = rel.unit
                    local base = direction * ArrowSettings.DistFromCenter
                    local tip = direction * (ArrowSettings.DistFromCenter + ArrowSettings.Height)
                    local sideL = base + RotateVect(direction, 90) * (ArrowSettings.Width/2)
                    local sideR = base + RotateVect(direction, -90) * (ArrowSettings.Width/2)

                    local center = Camera.ViewportSize/2
                    Arrow.PointA = center - sideL
                    Arrow.PointB = center - sideR
                    Arrow.PointC = center - tip
                    Arrow.Color = rainbow
                    Arrow.Visible = true
                else
                    Arrow.Visible = false
                end
            end
        else
            skel:SetVisible(false)
            Arrow.Visible = false
            NameTag.Visible = false
            for _, v in pairs(Lib) do v.Visible = false end
            if not Players:FindFirstChild(plr.Name) then
                for _, v in pairs(Lib) do v:Remove() end
                NameTag:Remove() Arrow:Remove() oripart:Destroy() con:Disconnect()
            end
        end
    end)
end

-- ========== FLY ==========
local function StartFly()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if isFlying then return end
    isFlying = true

    if char:FindFirstChild("Humanoid") then
        char.Humanoid.PlatformStand = true
    end

    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = root

    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyBG.P = 15000
    flyBG.D = 500
    flyBG.Parent = root
end

local function StopFly()
    if not isFlying then return end
    isFlying = false

    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end

    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.PlatformStand = false
    end
end

local function ToggleFly()
    if isFlying then
        StopFly()
    else
        StartFly()
    end
end

-- ========== SKY ==========
local SkyPresets = {
    ["Default"] = nil,
    ["Sunset"] = {Bk=17279854976, Dn=17279856318, Ft=17279858447, Lf=17279860360, Rt=17279862234, Up=17279864507},
    ["Galaxy"] = {Bk=271042516, Dn=271077243, Ft=271042556, Lf=271042310, Rt=271042467, Up=271077958},
    ["Night"] = {Bk=12064107, Dn=12064152, Ft=12064121, Lf=12063984, Rt=12064115, Up=12064131},
    ["Clouds"] = {Bk=171410628, Dn=171410649, Ft=171410620, Lf=171410666, Rt=171410657, Up=171410636}
}

local currentSky = nil

local function ApplySky(presetName)
    if currentSky then
        currentSky:Destroy()
        currentSky = nil
    end
    if presetName == "Default" then return end
    local preset = SkyPresets[presetName]
    if not preset then return end
    local s = Instance.new("Sky")
    for k, v in pairs(preset) do
        s["Skybox" .. k] = "rbxassetid://" .. v
    end
    s.Name = "VasyaSky"
    s.Parent = Lighting
    currentSky = s
end

-- ========== HITBOX (ТОЛЬКО BOX) ==========
local function ResetHitboxes()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
                hrp.CanCollide = true
            end
        end
    end
end

-- ========== VIEWMODEL ==========
local function RunViewmodel()
    while _G.ViewmodelEnabled do
        if LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
            if tool and tool:FindFirstChild("Configuration") then
                for _, child in ipairs(tool.Configuration:GetChildren()) do
                    if child.Name == "ViewModelOffset" and _G.ViewmodelEnabled then
                        child.Value = Vector3.new(0, _G.ViewmodelY, _G.ViewmodelZ)
                    end
                end
            end
        end
        task.wait()
    end
end

-- ========== FOV CIRCLE ==========
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.Color = Color3.new(1, 1, 1)
fov_circle.Filled = false
fov_circle.Transparency = 1
fov_circle.Visible = false

-- ========== RENDER STEPPED ==========
RunService.RenderStepped:Connect(function()
    Camera = workspace.CurrentCamera

    -- FOV circle center screen с изменением цвета
    if _G.SilentAimEnabled then
        fov_circle.Visible = true
        fov_circle.Radius = _G.FOVSize
        fov_circle.Position = Camera.ViewportSize / 2
        
        if targetInFOV then
            fov_circle.Color = Color3.fromRGB(255, 0, 0)
        else
            fov_circle.Color = Color3.fromRGB(255, 255, 255)
        end
    else
        fov_circle.Visible = false
    end

    -- Custom FOV camera
    if _G.CustomFOV then
        Camera.FieldOfView = _G.CustomFOVValue
    end

    -- Hitbox updater (ТОЛЬКО BOX)
    if _G.HitboxEnabled then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    pcall(function()
                        hrp.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                        hrp.Transparency = _G.HitboxTransparency
                        hrp.CanCollide = false
                    end)
                end
            end
        end
    end
    
    -- Weapon Chams continuous apply
    if _G.WeaponChamsEnabled and LocalPlayer.Character then
        applyWeaponChams(LocalPlayer.Character)
    end
end)

-- ========== HEARTBEAT ==========
RunService.Heartbeat:Connect(function()
    target.position = _G.SilentAimEnabled and getClosestTarget() or nil

    -- Fly movement
    if isFlying and flyBV and flyBG and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local moveDir = Vector3.zero
        local cf = Camera.CFrame
        if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cf.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cf.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cf.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cf.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
        end

        flyBV.Velocity = moveDir * _G.FlySpeed
        flyBG.CFrame = cf
    end

    -- Speed
    if _G.SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        if hum.WalkSpeed ~= _G.SpeedValue then
            pcall(function()
                for _, conn in pairs(getconnections(hum:GetPropertyChangedSignal("WalkSpeed"))) do
                    conn:Disable()
                end
            end)
            hum.WalkSpeed = _G.SpeedValue
        end
    end
end)

-- ========== INPUT ==========
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.F and _G.FlyEnabled then
        ToggleFly()
    end
end)

-- ========== JUMP BOOST ==========
UIS.JumpRequest:Connect(function()
    if _G.JumpBoostEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        if hum:GetState() ~= Enum.HumanoidStateType.Jumping and hum:GetState() ~= Enum.HumanoidStateType.Freefall then
            if not originalJumpPower then
                originalJumpPower = hum.JumpPower
            end
            hum.JumpPower = 50
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            task.delay(0.1, function()
                if hum then
                    hum.JumpPower = originalJumpPower or 50
                end
            end)
        end
    end
end)

-- ========== CHARACTER RESET HANDLER ==========
LocalPlayer.CharacterAdded:Connect(function(char)
    if isFlying then
        isFlying = false
        flyBV = nil
        flyBG = nil
    end
    
    -- Моментально применяем Weapon Chams после респавна
    if _G.WeaponChamsEnabled then
        setupWeaponChams(char)
    end
    
    -- Запоминаем оригинальную скорость при респавне
    task.wait(0.5)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if not _G.SpeedEnabled then
            OriginalWalkSpeed = LocalPlayer.Character.Humanoid.WalkSpeed
        else
            pcall(function()
                for _, conn in pairs(getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"))) do
                    conn:Disable()
                end
            end)
            LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedValue
        end
    end
end)

-- ========== INIT ESP ==========
for _, v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer then MainESP(v) end end
Players.PlayerAdded:Connect(function(plr)
    MainESP(plr)
    if _G.ChamsEnabled then
        AddChams(plr)
    end
end)

-- ========== TABS ==========
local tabs = {
    combat = window:CreateTab("Combat"),
    visuals = window:CreateTab("Visuals"),
    misc = window:CreateTab("Misc")
}

-- ==================== COMBAT ====================
local combat_sec = tabs.combat:CreateSection("Silent Aim", "left")
combat_sec:CreateToggle("Silent Aim", false, function(v) _G.SilentAimEnabled = v end)
combat_sec:CreateToggle("Wall Check", false, function(v) _G.WallCheck = v end)
combat_sec:CreateToggle("Auto Shoot", false, function(v) 
    _G.AutoShoot = v 
    if v then
        startAutoShoot()
    else
        stopAutoShoot()
    end
end)
combat_sec:CreateDropdown("Target Part", {"Head", "HumanoidRootPart", "UpperTorso"}, function(v) _G.TargetPart = v end, "Head")
combat_sec:CreateSlider("FOV Size", 50, 800, 150, false, function(v) _G.FOVSize = v end)

local hitbox_sec = tabs.combat:CreateSection("Hitbox Changer", "right")
hitbox_sec:CreateToggle("Hitbox Enabled", false, function(v)
    _G.HitboxEnabled = v
    if not v then
        ResetHitboxes()
    end
end)
hitbox_sec:CreateSlider("Hitbox Size", 1, 50, 5, false, function(v) _G.HitboxSize = v end)
hitbox_sec:CreateSlider("Hitbox Transparency", 0, 1, 0.7, true, function(v) _G.HitboxTransparency = v end)

-- ==================== VISUALS ====================
local visual_sec = tabs.visuals:CreateSection("ESP", "left")
visual_sec:CreateToggle("ESP", false, function(v) _G.EspEnabled = v end)
visual_sec:CreateToggle("Chams", false, function(v)
    _G.ChamsEnabled = v
    if v then
        RefreshAllChams()
    else
        for _, plr in pairs(Players:GetPlayers()) do
            RemoveChams(plr)
        end
    end
end)

local weapon_visual_sec = tabs.visuals:CreateSection("Weapon Visual", "left")
weapon_visual_sec:CreateToggle("Weapon Chams", false, function(v)
    _G.WeaponChamsEnabled = v
    if v and LocalPlayer.Character then
        setupWeaponChams(LocalPlayer.Character)
    end
end)
weapon_visual_sec:CreateDropdown("Material", {"Neon", "ForceField"}, function(v) 
    _G.WeaponChamsMaterial = v 
end, "Neon")

local visual_sec2 = tabs.visuals:CreateSection("Camera", "right")
visual_sec2:CreateToggle("Custom FOV", false, function(v)
    _G.CustomFOV = v
    if not v then
        Camera.FieldOfView = defaultCameraFOV
    end
end)
visual_sec2:CreateSlider("FOV Value", 70, 120, 90, false, function(v)
    _G.CustomFOVValue = v
end)

local viewmodel_sec = tabs.visuals:CreateSection("Viewmodel", "right")
viewmodel_sec:CreateToggle("Viewmodel Editor", false, function(v)
    _G.ViewmodelEnabled = v
    if v then
        SendNotification()
        task.spawn(RunViewmodel)
    end
end)
viewmodel_sec:CreateSlider("Viewmodel Z", -10, 3, 0, false, function(v)
    _G.ViewmodelZ = v
    if _G.ViewmodelEnabled then
        SendNotification()
    end
end)
viewmodel_sec:CreateSlider("Viewmodel Y", -5, 5, 0, false, function(v)
    _G.ViewmodelY = v
    if _G.ViewmodelEnabled then
        SendNotification()
    end
end)

local visual_sec3 = tabs.visuals:CreateSection("Sky", "left")
visual_sec3:CreateDropdown("Sky Preset", {"Default", "Sunset", "Galaxy", "Night", "Clouds"}, function(v)
    _G.SkyType = v
    ApplySky(v)
end, "Default")
visual_sec3:CreateSlider("Time of Day", 0, 24, 14, false, function(v)
    _G.TimeOfDay = v
    Lighting.ClockTime = v
end)

local nebula_sec = tabs.visuals:CreateSection("Nebula Theme", "right")
nebula_sec:CreateToggle("Nebula Theme", false, function(v)
    _G.NebulaEnabled = v
    applyNebulaTheme()
end)
nebula_sec:CreateDropdown("Nebula Color", {"Gray", "White", "Black", "Blue"}, function(v)
    _G.NebulaColor = v
    if _G.NebulaEnabled then
        applyNebulaTheme()
    end
end, "Blue")

-- ==================== MISC ====================
local misc_sec = tabs.misc:CreateSection("Movement", "left")
misc_sec:CreateToggle("Fly (Press F)", false, function(v)
    _G.FlyEnabled = v
    if not v and isFlying then
        StopFly()
    end
end)
misc_sec:CreateSlider("Fly Speed", 10, 70, 50, false, function(v) _G.FlySpeed = v end)

misc_sec:CreateToggle("Speed Enabled", false, function(v)
    _G.SpeedEnabled = v
    if not v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            for _, conn in pairs(getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"))) do
                conn:Disable()
            end
        end)
        LocalPlayer.Character.Humanoid.WalkSpeed = OriginalWalkSpeed
    end
end)
misc_sec:CreateSlider("Walk Speed", 30, 37, 30, false, function(v)
    _G.SpeedValue = v
end)

misc_sec:CreateToggle("Jump Boost", false, function(v)
    _G.JumpBoostEnabled = v
end)
