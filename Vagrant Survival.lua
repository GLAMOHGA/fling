--open code
-- VOMAGLA | Vagrant Survival 0.9 | merged build v20
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = false
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
if not newcclosure then getgenv().newcclosure = function(f) return f end end
if not checkcaller then getgenv().checkcaller = function() return false end end
if not hookmetamethod then getgenv().hookmetamethod = function() end end
if not getnamecallmethod then getgenv().getnamecallmethod = function() return "" end end
if not hookfunction then getgenv().hookfunction = function(f, hook) return f end end
if not getgc then getgenv().getgc = function() return {} end end
if not islclosure then getgenv().islclosure = function() return false end end
if not debug then debug = { getinfo = function() return nil end } end
local mathFloor = math.floor
local mathClamp = math.clamp
local mathAbs = math.abs
local mathRad = math.rad
local mathCos = math.cos
local mathSin = math.sin
local Vector2New = Vector2.new
local Vector3New = Vector3.new
local tick = tick
local typeof = typeof
local pairs = pairs
local ipairs = ipairs
local pcall = pcall
local next = next
local string_format = string.format
local task_spawn = task.spawn
local task_delay = task.delay
local task_wait = task.wait
local osClock = os.clock
local DrawingOK = pcall(function() local t = Drawing.new("Line"); t:Remove() end)
-- УБИЙСТВО ПРЕДЫДУЩЕГО ЗАПУСКА
do
    local old = getgenv().__VOMAGLA_LOADED
    if old then
        pcall(function() old:Unload() end)
        local deadline = osClock() + 3
        while getgenv().__VOMAGLA_LOADED and osClock() < deadline do
            task_wait(0.1)
        end
    end
end
-- ЗВУК ПРИ ЗАПУСКЕ
do
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://125829188619137"
    s.Volume = 1
    s.Parent = SoundService
    s:Play()
    Debris:AddItem(s, 8)
end
-- ========== LOADING SCREEN ==========
local Loading = Library:CreateLoading({
    Title = "VOMAGLA",
    Icon = 132584846334580,
    TotalSteps = 3,
})
Loading:SetMessage("Initializing...")
Loading:SetDescription("Loading VOMAGLA...")
task_wait(0.4)
Loading:SetCurrentStep(1)
Loading:SetDescription("Waiting for players to load...")
do
    local deadline = osClock() + 15
    while osClock() < deadline do
        local camOk = Workspace.CurrentCamera and Workspace.CurrentCamera.Parent
        local playersOk = true
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and not p.Character then
                playersOk = false
                break
            end
        end
        local selfOk = LocalPlayer.Character ~= nil
        if camOk and playersOk and selfOk then break end
        task_wait(0.25)
    end
end
Loading:SetCurrentStep(2)
Loading:SetDescription("Applying hooks...")
task_wait(0.3)
Loading:SetCurrentStep(3)
Loading:SetDescription("Done!")
task_wait(0.4)
Loading:Continue()
Loading = nil
local playerCache = {}
local function onPAdd(p) if p ~= LocalPlayer then playerCache[p] = true end end
local function onPRem(p) playerCache[p] = nil end
for _, p in ipairs(Players:GetPlayers()) do onPAdd(p) end
Players.PlayerAdded:Connect(onPAdd)
Players.PlayerRemoving:Connect(onPRem)
local cachedChar = LocalPlayer.Character
local cachedHumanoid = cachedChar and cachedChar:FindFirstChildWhichIsA("Humanoid")
local function updateCharCache(c)
    cachedChar = c
    cachedHumanoid = nil
    if c then
        local h = c:FindFirstChildWhichIsA("Humanoid")
        if h then cachedHumanoid = h
        else task_spawn(function()
            local h2 = c:WaitForChild("Humanoid", 15)
            if h2 and cachedChar == c then cachedHumanoid = h2 end
        end) end
    end
end
LocalPlayer.CharacterAdded:Connect(function(c) updateCharCache(c) end)
LocalPlayer.CharacterRemoving:Connect(function() cachedChar = nil; cachedHumanoid = nil end)
if cachedChar then updateCharCache(cachedChar) end
-- ========== VISIBLE CHECK ==========
local function IsVisible(targetPart)
    if not targetPart or not targetPart.Parent then return false end
    local cam = workspace.CurrentCamera
    if not cam then return false end
    local origin = cam.CFrame.Position
    local direction = (targetPart.Position - origin)
    local ray = Ray.new(origin, direction.Unit * direction.Magnitude)
    local list = {}
    local localChar = LocalPlayer.Character
    if localChar then table.insert(list, localChar) end
    table.insert(list, cam)
    for _, folderName in ipairs({"Viewmodel", "ViewModel", "Ignore", "Debris", "BulletTraces", "Effects", "GunEffects", "Arms", "FPSArms", "Particles", "Bullets", "Blood", "Sparks", "Smoke", "Fire", "Explosion", "MuzzleFlash", "Shells", "Casings", "Impacts", "Decals"}) do
        local folder = workspace:FindFirstChild(folderName)
        if folder then table.insert(list, folder) end
    end
    table.insert(list, targetPart.Parent)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, list)
    if not hit then return true end
    if hit == targetPart then return true end
    if hit:IsDescendantOf(targetPart.Parent) then return true end
    return false
end
local function IsCharacterVisible(character)
    if not character then return false end
    local partsToCheck = {
        character:FindFirstChild("HumanoidRootPart"),
        character:FindFirstChild("Head"),
        character:FindFirstChild("UpperTorso"),
        character:FindFirstChild("LowerTorso"),
        character:FindFirstChild("Torso")
    }
    for _, part in ipairs(partsToCheck) do
        if part and IsVisible(part) then return true end
    end
    return false
end
-- ========== ESP STATE ==========
local ESP = {
    Enabled = false,
    Color = Color3.fromRGB(0, 180, 255),
    Boxes = true,
    Name = true,
    Distance = true,
    HealthText = true,
    Chams = false,
}
-- ============================================================
--  ESP ENGINE — DECAY corner-box, FIXED (не застывает)
-- ============================================================
do
    local vec2, vec3 = Vector2.new, Vector3.new
    local dim2, dim = UDim2.new, UDim.new
    local rect = Rect.new
    local dim_offset = UDim2.fromOffset
    local rgb, rgbseq, rgbkey = Color3.fromRGB, ColorSequence.new, ColorSequenceKeypoint.new
    local Esp = {
        Players = {},
        Connections = {},
        ScreenGui = Instance.new("ScreenGui"),
    }
    Esp.ScreenGui.IgnoreGuiInset = true
    Esp.ScreenGui.Name = "VOMAGLA_EspObject"
    Esp.ScreenGui.DisplayOrder = 997
    pcall(function() Esp.ScreenGui.Parent = CoreGui end)
    if not Esp.ScreenGui.Parent then Esp.ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    local Fonts = {}
    pcall(function()
        local FontNames = {
            ["Rubik"] = "Rubik-Regular.ttf",
            ["Tahoma"] = "fs-tahoma-8px.ttf",
        }
        local function RegisterFont(Name, Weight, Style, Asset)
            if not isfile(Asset.Id) then writefile(Asset.Id, Asset.Font) end
            if isfile(Name .. ".font") then delfile(Name .. ".font") end
            local Data = {name = Name, faces = {{name = "Normal", weight = Weight, style = Style, assetId = getcustomasset(Asset.Id)}}}
            writefile(Name .. ".font", HttpService:JSONEncode(Data))
            return getcustomasset(Name .. ".font")
        end
        for name, suffix in pairs(FontNames) do
            local Weight = (name == "Rubik") and 900 or 400
            Fonts[name] = Font.new(RegisterFont(name, Weight, "Normal", {
                Id = suffix,
                Font = game:HttpGet("https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/" .. suffix),
            }), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        end
    end)
    local NAME_FONT = Fonts.Rubik or Enum.Font.GothamBold
    local NAME_SIZE = 13
    local SMALL_FONT = Fonts.Tahoma or Enum.Font.Gotham
    local SMALL_SIZE = 12
    local ESP_GREEN = Color3.fromRGB(60, 255, 60)
    local function darken(c, k)
        return Color3.new(c.R * k, c.G * k, c.B * k)
    end
    local function EspCreate(instance, options)
        local Ins = Instance.new(instance)
        for prop, value in pairs(options) do Ins[prop] = value end
        return Ins
    end
    local function isTeammate(plr)
        if plr == LocalPlayer then return true end
        if plr.Team and plr.Team == LocalPlayer.Team then return true end
        return false
    end
    local function BoxSolve(camera, rootPart)
        local vpTop, topVis = camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
        local vpBot, botVis = camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))
        if vpTop.Z < 0 and vpBot.Z < 0 then return nil end
        local Distance = (rootPart.Position - camera.CFrame.Position).Magnitude
        local Width = math.max(mathFloor(mathAbs(vpTop.X - vpBot.X)), 8)
        local Height = math.max(mathFloor(math.max(mathAbs(vpBot.Y - vpTop.Y), Width / 2)), 12)
        local BoxSize = Vector2New(mathFloor(math.max(Height / 1.5, Width)), Height)
        local BoxPosition = Vector2New(mathFloor((vpTop.X + vpBot.X) * 0.5 - BoxSize.X * 0.5), mathFloor(math.min(vpTop.Y, vpBot.Y)))
        return BoxSize, BoxPosition, (topVis or botVis), Distance
    end
    local function applyBoxColor(gradient, color)
        gradient.Color = rgbseq{rgbkey(0, color), rgbkey(1, darken(color, 0.5))}
    end
    local function EspCreateObject(plr)
        if plr == LocalPlayer then return end
        if Esp.Players[plr.Name] then return Esp.Players[plr.Name] end
        local Data = {Items = {}, Info = {Character = nil, Humanoid = nil}, BoxGradients = {}, LastTeammate = nil, Highlight = nil, PlayerRef = plr}
        local Items = Data.Items
        Items.Holder = EspCreate("Frame", {Parent = Esp.ScreenGui, Visible = false, BackgroundTransparency = 1, Position = dim2(0.43, 0, 0.32, 0), Size = dim2(0, 211, 0, 240), BorderSizePixel = 0})
        Items.Top = EspCreate("Frame", {Parent = Items.Holder, Size = dim2(1, 0, 0, 0), BackgroundTransparency = 1, Position = dim2(0, 0, 0, -1), ZIndex = 2, BorderSizePixel = 0})
        EspCreate("UIListLayout", {VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center, HorizontalFlex = Enum.UIFlexAlignment.Fill, Parent = Items.Top, Padding = dim(0, 1)})
        Items.TopTexts = EspCreate("Frame", {LayoutOrder = -100, Parent = Items.Top, BackgroundTransparency = 1, BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.XY})
        EspCreate("UIListLayout", {Parent = Items.TopTexts, Padding = dim(0, 1), SortOrder = Enum.SortOrder.LayoutOrder})
        Items.Bottom = EspCreate("Frame", {Parent = Items.Holder, Size = dim2(1, 0, 0, 0), BackgroundTransparency = 1, Position = dim2(0, 0, 1, 1), ZIndex = 2, BorderSizePixel = 0})
        EspCreate("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center, HorizontalFlex = Enum.UIFlexAlignment.Fill, Parent = Items.Bottom, Padding = dim(0, 1)})
        Items.BottomTexts = EspCreate("Frame", {LayoutOrder = 1, Parent = Items.Bottom, BackgroundTransparency = 1, BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.XY})
        EspCreate("UIListLayout", {Parent = Items.BottomTexts, Padding = dim(0, 1), SortOrder = Enum.SortOrder.LayoutOrder})
        Items.Corners = EspCreate("Frame", {Parent = Items.Holder, BackgroundTransparency = 1, Size = dim2(1, 0, 1, 0), BorderSizePixel = 0})
        Items.BottomLeftX = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0.4, 0, 0, 3), AnchorPoint = vec2(0, 1), Image = "rbxassetid://83548615999411", BackgroundTransparency = 1, Position = dim2(0, 0, 1, 0), ZIndex = 2, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 1), vec2(99, 2))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.BottomLeftX}))
        Items.BottomLeftY = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0, 3, 0.25, 0), AnchorPoint = vec2(0, 1), Image = "rbxassetid://101715268403902", BackgroundTransparency = 1, Position = dim2(0, 0, 1, -2), ZIndex = 500, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 0), vec2(2, 96))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Rotation = -90, Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.BottomLeftY}))
        Items.BottomRightX = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0.4, 0, 0, 3), AnchorPoint = vec2(1, 1), Image = "rbxassetid://83548615999411", BackgroundTransparency = 1, Position = dim2(1, 0, 1, 0), ZIndex = 2, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 1), vec2(99, 2))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.BottomRightX}))
        Items.BottomRightY = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0, 3, 0.25, 0), AnchorPoint = vec2(1, 1), Image = "rbxassetid://101715268403902", BackgroundTransparency = 1, Position = dim2(1, 0, 1, -2), ZIndex = 500, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 0), vec2(2, 96))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Rotation = 90, Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.BottomRightY}))
        Items.TopLeftY = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0, 3, 0.25, 0), Image = "rbxassetid://102467475629368", BackgroundTransparency = 1, Position = dim2(0, 0, 0, 2), ZIndex = 500, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 0), vec2(2, 98))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Rotation = 90, Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.TopLeftY}))
        Items.TopRightY = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0, 3, 0.25, 0), AnchorPoint = vec2(1, 0), Image = "rbxassetid://102467475629368", BackgroundTransparency = 1, Position = dim2(1, 0, 0, 2), ZIndex = 500, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 0), vec2(2, 98))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Rotation = -90, Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.TopRightY}))
        Items.TopRightX = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Size = dim2(0.4, 0, 0, 3), AnchorPoint = vec2(1, 0), Image = "rbxassetid://83548615999411", BackgroundTransparency = 1, Position = dim2(1, 0, 0, 0), ZIndex = 2, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 1), vec2(99, 2))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.TopRightX}))
        Items.TopLeftX = EspCreate("ImageLabel", {ScaleType = Enum.ScaleType.Slice, Parent = Items.Corners, Image = "rbxassetid://83548615999411", BackgroundTransparency = 1, Size = dim2(0.4, 0, 0, 3), ZIndex = 2, BorderSizePixel = 0, SliceCenter = rect(vec2(1, 1), vec2(99, 2))})
        table.insert(Data.BoxGradients, EspCreate("UIGradient", {Color = rgbseq{rgbkey(0, ESP.Color), rgbkey(1, darken(ESP.Color, 0.5))}, Parent = Items.TopLeftX}))
        Items.HealthbarText = EspCreate("TextLabel", {
            FontFace = SMALL_FONT,
            TextColor3 = rgb(255, 255, 255),
            Parent = Items.Holder,
            AnchorPoint = vec2(1, 0.5),
            Position = dim2(0, -11, 0.5, 0),
            BackgroundTransparency = 1,
            Size = dim2(0, 0, 0, 0),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = SMALL_SIZE,
            Text = "",
        })
        EspCreate("UIStroke", {Parent = Items.HealthbarText, LineJoinMode = Enum.LineJoinMode.Miter, Thickness = 1})
        Items.Text = EspCreate("TextLabel", {
            FontFace = NAME_FONT, TextColor3 = rgb(255, 255, 255), Parent = Items.TopTexts,
            Text = plr.DisplayName, BackgroundTransparency = 1, Size = dim2(1, 0, 0, 0),
            BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.XY, TextSize = NAME_SIZE,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        EspCreate("UIStroke", {Parent = Items.Text, LineJoinMode = Enum.LineJoinMode.Miter, Thickness = 1.2})
        Items.Distance = EspCreate("TextLabel", {
            FontFace = SMALL_FONT, TextColor3 = rgb(255, 255, 255), Parent = Items.BottomTexts,
            BackgroundTransparency = 1, Size = dim2(1, 0, 0, 0), BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY, TextSize = SMALL_SIZE,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        EspCreate("UIStroke", {Parent = Items.Distance, LineJoinMode = Enum.LineJoinMode.Miter, Thickness = 1})
        function Data.HealthChanged(Value)
            local Humanoid = Data.Info.Humanoid
            if not Humanoid then return end
            local MaxHealth = Humanoid.MaxHealth
            if MaxHealth == 0 then MaxHealth = 100 end
            local Multiplier = mathClamp(Value / MaxHealth, 0, 1)
            local Color = rgb(255, 0, 0):Lerp(rgb(255, 193, 0), Multiplier)
            local Color2 = Color:Lerp(rgb(0, 255, 0), Multiplier)
            Items.HealthbarText.Text = mathFloor(Value)
            Items.HealthbarText.TextColor3 = Color2
        end
        function Data.Recolor()
            local tm = isTeammate(plr)
            if tm == Data.LastTeammate then return end
            Data.LastTeammate = tm
            local col = tm and ESP_GREEN or ESP.Color
            for _, g in ipairs(Data.BoxGradients) do
                applyBoxColor(g, col)
            end
            Items.Text.TextColor3 = col
            if Data.Highlight then
                if tm then
                    Data.Highlight.FillColor = ESP_GREEN
                    Data.Highlight.OutlineColor = ESP_GREEN
                else
                    Data.Highlight.FillColor = col
                    Data.Highlight.OutlineColor = col
                end
            end
        end
        function Data.EnsureChams()
            local Character = Data.Info.Character
            if not Character then return end
            if not Data.Highlight then
                Data.Highlight = EspCreate("Highlight", {
                    FillColor = ESP.Color,
                    OutlineColor = ESP.Color,
                    FillTransparency = 0.75,
                    OutlineTransparency = 0,
                    Adornee = Character,
                    Enabled = false,
                    Parent = CoreGui,
                })
            else
                Data.Highlight.Adornee = Character
            end
        end
        function Data.RefreshDescendants()
            local Character = plr.Character
            if not Character then
                local conn
                conn = plr.CharacterAdded:Connect(function(char)
                    conn:Disconnect()
                    Data.RefreshDescendants()
                end)
                return
            end
            local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid", 5)
            if not Humanoid then return end
            Data.Info.Character = Character
            Data.Info.Humanoid = Humanoid
            Esp.Connections[#Esp.Connections + 1] = Humanoid.HealthChanged:Connect(function(v) Data.HealthChanged(v) end)
            Data.HealthChanged(Humanoid.Health)
            Data.EnsureChams()
            Data.LastTeammate = nil
            Data.Recolor()
        end
        function Data.Destroy()
            if Items.Holder then Items.Holder:Destroy() end
            if Data.Highlight then Data.Highlight:Destroy() end
            Esp.Players[plr.Name] = nil
        end
        Data.LastTeammate = nil
        Data.RefreshDescendants()
        Esp.Connections[#Esp.Connections + 1] = plr.CharacterAdded:Connect(function() Data.RefreshDescendants() end)
        Esp.Players[plr.Name] = Data
        return Data
    end
    local function EspRemovePlayer(plr)
        local Path = Esp.Players[plr.Name]
        if Path then Path.Destroy() end
    end
    local function EspUpdate()
        local Camera = Workspace.CurrentCamera
        if not Camera or not Camera.Parent then return end
        for _, Data in pairs(Esp.Players) do
            local plr = Data.PlayerRef
            if not plr or not plr.Parent then
                Data.Destroy()
                continue
            end
            local Holder = Data.Items.Holder
            local active = ESP.Enabled
            if active then Data.Recolor() end
            if Data.Highlight then
                Data.Highlight.Enabled = (active and ESP.Chams) and true or false
            end
            Data.Items.Corners.Visible = ESP.Boxes
            Data.Items.Distance.Visible = ESP.Distance
            Data.Items.HealthbarText.Visible = ESP.HealthText
            Data.Items.Text.Visible = ESP.Name
            local Character = plr.Character
            if not active or not Character or not Character.Parent then
                if Holder.Visible then Holder.Visible = false end
                continue
            end
            local Humanoid = Character:FindFirstChild("Humanoid")
            if not Humanoid or Humanoid.Health <= 0 then
                if Holder.Visible then Holder.Visible = false end
                continue
            end
            local RootPart = Humanoid.RootPart or Character:FindFirstChild("HumanoidRootPart")
            if not RootPart or not RootPart.Parent then
                if Holder.Visible then Holder.Visible = false end
                continue
            end
            local BoxSize, BoxPos, OnScreen, Distance = BoxSolve(Camera, RootPart)
            if not BoxSize or not OnScreen then
                if Holder.Visible then Holder.Visible = false end
                continue
            end
            Holder.Visible = true
            Holder.Position = dim_offset(BoxPos.X, BoxPos.Y)
            Holder.Size = dim2(0, BoxSize.X, 0, BoxSize.Y)
            local DistanceLabel = Data.Items.Distance
            local Text = tostring(math.round(Distance)) .. "m"
            if DistanceLabel.Text ~= Text then DistanceLabel.Text = Text end
        end
    end
    RunService:BindToRenderStep("VOMAGLA_EspLoop", Enum.RenderPriority.Camera.Value + 1, EspUpdate)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then EspCreateObject(plr) end
    end
    Players.PlayerAdded:Connect(function(plr)
        if plr ~= LocalPlayer then EspCreateObject(plr) end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        EspRemovePlayer(plr)
    end)
    getgenv().__VOMAGLA_ESP_RefreshColors = function()
        for _, Data in pairs(Esp.Players) do
            Data.LastTeammate = nil
            Data.Recolor()
        end
    end
end
local function ESP_RefreshColors()
    if getgenv().__VOMAGLA_ESP_RefreshColors then getgenv().__VOMAGLA_ESP_RefreshColors() end
end
-- ========== SILENT AIM ==========
local SilentAim = {}
SilentAim.__index = SilentAim
SilentAim.Options = {
    Enabled = false,
    UseFOV = false,
    WallCheck = false,
    Priority = "Crosshair",
    Snapline = false,
    TargetHUD = false,
    FOVAnchor = "Screen Center",
}
SilentAim.Settings = {
    TargetPart = "HumanoidRootPart",
    FOVRadius = 150,
    FOVRadiusSq = 22500,
    MaxDistance = 500,
    MaxDistanceSq = 250000,
    SnaplineThickness = 2,
    FOVThickness = 1.5,
    Predict = 0.15,
}
SilentAim.Colors = {
    FOVColorNoTarget = Color3.fromRGB(255, 255, 255),
    FOVColorOnTarget = Color3.fromRGB(255, 0, 0),
    SnaplineColor = Color3.fromRGB(255, 255, 255),
}
local CurrentAimTarget = nil
local lastTargetPlayer = nil
local lastTargetTick = 0
local LibraryUnloaded = false
local screenCenter = Vector2New(0, 0)
local function getAnchorPosition()
    local cam = Workspace.CurrentCamera
    if not cam then return Vector2New(0, 0) end
    local vp = cam.ViewportSize
    screenCenter = Vector2New(vp.X * 0.5, vp.Y * 0.5)
    if SilentAim.Options.FOVAnchor == "Cursor" then
        local ok, m = pcall(function() return UserInputService:GetMouseLocation() end)
        if ok and m then return Vector2New(m.X, m.Y) end
    end
    return screenCenter
end
local function getPositionOnScreen(pos)
    local cam = Workspace.CurrentCamera
    if not cam then return Vector2New(0, 0), false end
    local p, v = cam:WorldToViewportPoint(pos)
    return Vector2New(p.X, p.Y), v
end
local function distSq2D(a, b)
    local dx, dy = a.X - b.X, a.Y - b.Y
    return dx * dx + dy * dy
end
local function distSq3D(a, b)
    local dx, dy, dz = a.X - b.X, a.Y - b.Y, a.Z - b.Z
    return dx * dx + dy * dy + dz * dz
end
local function getPredictedPosition(part)
    local pos = part.Position
    pcall(function()
        local vel = part.AssemblyLinearVelocity
        if vel.Magnitude > 1 then
            pos = pos + vel * SilentAim.Settings.Predict
        end
    end)
    return pos
end
local function getClosestPlayer()
    local cam = Workspace.CurrentCamera
    if not cam then return nil end
    local myRoot = cachedChar and cachedChar:FindFirstChild("HumanoidRootPart")
    local myPos = myRoot and myRoot.Position
    local anchorPos = getAnchorPosition()
    local best, bestD = nil, nil
    for plr in next, playerCache do
        local ch = plr.Character
        if not ch then continue end
        local part = ch:FindFirstChild(SilentAim.Settings.TargetPart) or ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Head")
        if not part or not part.Parent then continue end
        local hum = ch:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        local pp = part.Position
        if myPos and distSq3D(myPos, pp) > SilentAim.Settings.MaxDistanceSq then continue end
        local sp, vis = getPositionOnScreen(pp)
        if not vis then continue end
        local sd = distSq2D(anchorPos, sp)
        if SilentAim.Options.UseFOV and sd > SilentAim.Settings.FOVRadiusSq then continue end
        if SilentAim.Options.WallCheck and not IsVisible(part) then continue end
        local cd = (SilentAim.Options.Priority == "Distance" and myPos) and distSq3D(myPos, pp) or sd
        if not bestD or cd < bestD then
            best = part
            bestD = cd
        end
    end
    return best
end
-- ========== FOV CIRCLE ==========
local updateFOVCircle
do
    local fovScreenGui = Instance.new("ScreenGui")
    fovScreenGui.Name = "FOVCircleUI"
    fovScreenGui.Parent = CoreGui
    fovScreenGui.ResetOnSpawn = false
    fovScreenGui.IgnoreGuiInset = true
    fovScreenGui.DisplayOrder = 999
    local fovFill = Instance.new("Frame")
    fovFill.AnchorPoint = Vector2.new(0.5, 0.5)
    fovFill.Position = UDim2.new(0.5, 0, 0.5, 0)
    fovFill.BackgroundColor3 = SilentAim.Colors.FOVColorNoTarget
    fovFill.BackgroundTransparency = 0.93
    fovFill.BorderSizePixel = 0
    fovFill.Visible = false
    fovFill.Parent = fovScreenGui
    local fovCorner = Instance.new("UICorner")
    fovCorner.CornerRadius = UDim.new(0.5, 0)
    fovCorner.Parent = fovFill
    local fovStroke = Instance.new("UIStroke")
    fovStroke.Color = SilentAim.Colors.FOVColorNoTarget
    fovStroke.Thickness = SilentAim.Settings.FOVThickness
    fovStroke.Transparency = 0.25
    fovStroke.Parent = fovFill
    updateFOVCircle = function()
        if LibraryUnloaded then
            fovFill.Visible = false
            return
        end
        if SilentAim.Options.Enabled and SilentAim.Options.UseFOV then
            local anchor = getAnchorPosition()
            local col = CurrentAimTarget and SilentAim.Colors.FOVColorOnTarget or SilentAim.Colors.FOVColorNoTarget
            fovFill.Visible = true
            fovFill.Position = UDim2.new(0, anchor.X, 0, anchor.Y)
            fovFill.Size = UDim2.new(0, SilentAim.Settings.FOVRadius * 2, 0, SilentAim.Settings.FOVRadius * 2)
            fovStroke.Thickness = SilentAim.Settings.FOVThickness
            fovFill.BackgroundColor3 = col
            fovStroke.Color = col
        else
            fovFill.Visible = false
        end
    end
end
local snapline = nil
if DrawingOK then
    snapline = Drawing.new("Line")
    snapline.Visible = false
    snapline.Thickness = 2
    snapline.Color = Color3.new(1, 1, 1)
    snapline.ZIndex = 2
    snapline.Transparency = 1
end
-- ========== TARGET HUD ==========
local THUD_Update, THUD_Hide
do
    local HG = Instance.new("ScreenGui")
    HG.Name = "STHUD"
    HG.Parent = CoreGui
    HG.Enabled = false
    HG.ResetOnSpawn = false
    HG.IgnoreGuiInset = true
    local MF = Instance.new("Frame")
    MF.Size = UDim2.new(0, 320, 0, 90)
    MF.AnchorPoint = Vector2.new(0.5, 0.5)
    MF.Position = UDim2.new(0.5, 0, 0.85, 0)
    MF.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MF.BackgroundTransparency = 0.1
    MF.BorderSizePixel = 0
    MF.Parent = HG
    local AI = Instance.new("ImageLabel")
    AI.Size = UDim2.new(0, 60, 0, 60)
    AI.Position = UDim2.new(0, 15, 0, 15)
    AI.BackgroundTransparency = 1
    AI.Parent = MF
    local TC = Instance.new("Frame")
    TC.BackgroundTransparency = 1
    TC.Position = UDim2.new(0, 85, 0, 10)
    TC.Size = UDim2.new(1, -95, 0, 50)
    TC.Parent = MF
    local NL = Instance.new("TextLabel")
    NL.Size = UDim2.new(1, 0, 0, 25)
    NL.BackgroundTransparency = 1
    NL.Text = ""
    NL.Font = Enum.Font.GothamBold
    NL.TextSize = 20
    NL.TextColor3 = Color3.new(1, 1, 1)
    NL.TextXAlignment = Enum.TextXAlignment.Left
    NL.Parent = TC
    local DL = Instance.new("TextLabel")
    DL.Size = UDim2.new(1, 0, 0, 20)
    DL.Position = UDim2.new(0, 0, 0, 25)
    DL.BackgroundTransparency = 1
    DL.Text = ""
    DL.Font = Enum.Font.Gotham
    DL.TextSize = 16
    DL.TextColor3 = Color3.fromRGB(200, 200, 200)
    DL.TextXAlignment = Enum.TextXAlignment.Left
    DL.Parent = TC
    local HBG2 = Instance.new("Frame")
    HBG2.Size = UDim2.new(1, -30, 0, 12)
    HBG2.Position = UDim2.new(0, 15, 1, -20)
    HBG2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    HBG2.BorderSizePixel = 0
    HBG2.Parent = MF
    local HBF2 = Instance.new("Frame")
    HBF2.Size = UDim2.new(1, 0, 1, 0)
    HBF2.BackgroundColor3 = Color3.new(1, 1, 1)
    HBF2.BorderSizePixel = 0
    HBF2.Parent = HBG2
    Instance.new("UIGradient", HBF2).Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 230, 50))
    }
    local lastTH = 0
    THUD_Update = function(now)
        if not SilentAim.Options.TargetHUD or not SilentAim.Options.Enabled or LibraryUnloaded then
            HG.Enabled = false
            return
        end
        if now - lastTH < 0.15 then return end
        lastTH = now
        local ch = CurrentAimTarget and CurrentAimTarget.Parent
        if ch and ch:FindFirstChild("Humanoid") and ch:FindFirstChild("HumanoidRootPart") and ch.Humanoid.Health > 0 then
            HG.Enabled = true
            local pl = Players:GetPlayerFromCharacter(ch)
            if pl then
                NL.Text = pl.DisplayName
                pcall(function()
                    AI.Image = Players:GetUserThumbnailAsync(pl.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
                end)
            else
                NL.Text = ch.Name
                AI.Image = ""
            end
            local mr = cachedChar and cachedChar:FindFirstChild("HumanoidRootPart")
            if mr then
                DL.Text = "Distance: " .. string_format("%.1f", (mr.Position - ch.HumanoidRootPart.Position).Magnitude) .. "m"
            end
            TweenService:Create(HBF2, TweenInfo.new(0.15), {
                Size = UDim2.new(mathClamp(ch.Humanoid.Health / ch.Humanoid.MaxHealth, 0, 1), 0, 1, 0)
            }):Play()
        else
            HG.Enabled = false
        end
    end
    THUD_Hide = function() HG.Enabled = false end
end
-- ========== HIT SOUND ==========
local HIT_SOUNDS = {
    Bameware = "rbxassetid://3124331820",
    Bell = "rbxassetid://6534947240",
    Bubble = "rbxassetid://6534947588",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Sans = "rbxassetid://3188795283",
    Fart = "rbxassetid://130833677",
    Big = "rbxassetid://5332005053",
    Vine = "rbxassetid://5332680810",
    Bruh = "rbxassetid://4578740568",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Fatality = "rbxassetid://6534947869",
    Bonk = "rbxassetid://5766898159",
    Minecraft = "rbxassetid://4018616850",
}
local HIT_SOUND_NAMES = {}
for name in pairs(HIT_SOUNDS) do table.insert(HIT_SOUND_NAMES, name) end
table.sort(HIT_SOUND_NAMES)
local HS = {
    Enabled = false,
    Sound = "Bameware",
    Volume = 1,
}
local hitSound = Instance.new("Sound")
hitSound.SoundId = HIT_SOUNDS[HS.Sound]
hitSound.Volume = HS.Volume
hitSound.Parent = SoundService
-- ========== KILL SOUND ==========
local KS = {
    Enabled = false,
    Volume = 1,
}
local KILL_SOUNDS = {"6350854289", "132050044560917", "125662494668382", "130940311850179"}
local DOUBLE_KILL_SOUND = "116907610084760"
local killTimes = {}
local lastDoublePlay = 0
local function playKillSound()
    if not KS.Enabled or LibraryUnloaded then return end
    local now = osClock()
    table.insert(killTimes, now)
    for i = #killTimes, 1, -1 do
        if now - killTimes[i] > 10 then
            table.remove(killTimes, i)
        end
    end
    local s = Instance.new("Sound")
    s.Volume = KS.Volume
    s.Parent = SoundService
    if #killTimes >= 2 and now - lastDoublePlay > 1 then
        s.SoundId = "rbxassetid://" .. DOUBLE_KILL_SOUND
        lastDoublePlay = now
    else
        s.SoundId = "rbxassetid://" .. KILL_SOUNDS[math.random(#KILL_SOUNDS)]
    end
    s:Play()
    Debris:AddItem(s, 6)
end
-- ========== БУФЕР ВЫСТРЕЛОВ ==========
local myShots = {}
local function recordShot(origin, dir)
    table.insert(myShots, { time = osClock(), origin = origin, dir = dir })
    if #myShots > 25 then table.remove(myShots, 1) end
end
local function isOnOurShot(rootPos)
    local now = osClock()
    for i = #myShots, 1, -1 do
        local shot = myShots[i]
        if now - shot.time > 1.5 then
            table.remove(myShots, i)
        else
            local toTarget = rootPos - shot.origin
            local along = toTarget:Dot(shot.dir)
            if along > 0 then
                local perp = (toTarget - shot.dir * along).Magnitude
                if perp <= 6 then
                    return true
                end
            end
        end
    end
    return false
end
-- ========== 3D HITMARKER ==========
local HM = {
    Enabled = false,
    Color = Color3.new(1, 1, 1),
    KillColor = Color3.fromRGB(220, 80, 80),
    Size = 12,
    Thickness = 2,
    Duration = 3.0,
}
local spawnHitMarker
do
    local hmQueue = {}
    local HM_DIRS = { {1,1}, {-1,1}, {1,-1}, {-1,-1} }
    spawnHitMarker = function(worldPos, isKill)
        if not DrawingOK then return end
        local lines = {}
        for i = 1, 4 do
            local l = Drawing.new("Line")
            l.Visible = false
            l.Thickness = HM.Thickness
            l.ZIndex = 5
            lines[i] = l
        end
        hmQueue[#hmQueue + 1] = { pos = worldPos, born = osClock(), isKill = isKill, lines = lines }
    end
    local hmRenderConn = RunService.RenderStepped:Connect(function()
        if not DrawingOK then return end
        local cam = Workspace.CurrentCamera
        local now = osClock()
        for i = #hmQueue, 1, -1 do
            local m = hmQueue[i]
            local age = now - m.born
            if age > HM.Duration then
                for _, l in ipairs(m.lines) do pcall(function() l:Remove() end) end
                table.remove(hmQueue, i)
            else
                if not HM.Enabled then
                    for _, l in ipairs(m.lines) do l.Visible = false end
                    continue
                end
                if cam and m.pos then
                    local sp, vis = cam:WorldToViewportPoint(m.pos)
                    local alpha = 1 - (age / HM.Duration)
                    local col = m.isKill and HM.KillColor or HM.Color
                    local cx, cy = sp.X, sp.Y
                    for j = 1, 4 do
                        local l = m.lines[j]
                        local d = HM_DIRS[j]
                        l.Visible = vis
                        l.Transparency = alpha
                        l.Color = col
                        l.Thickness = HM.Thickness
                        l.From = Vector2New(cx + d[1] * HM.Size * 0.3, cy + d[2] * HM.Size * 0.3)
                        l.To = Vector2New(cx + d[1] * HM.Size, cy + d[2] * HM.Size)
                    end
                end
            end
        end
    end)
end
-- ========== ФРОСТ-ХИТЛОГИ ==========
local HL = {
    Enabled = false,
    Color = Color3.fromRGB(176, 176, 209),
    Position = "Center",
    Duration = 5,
}
local showHitLog, updateHitLogPosition, buildHitLogText
do
    local hitLogsGui = Instance.new("ScreenGui")
    hitLogsGui.Name = "VOMAGLA_HitLogs"
    hitLogsGui.ResetOnSpawn = false
    hitLogsGui.IgnoreGuiInset = true
    hitLogsGui.DisplayOrder = 9998
    hitLogsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() hitLogsGui.Parent = CoreGui end)
    if not hitLogsGui.Parent then
        hitLogsGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    local hitLogsHolder = Instance.new("Frame")
    hitLogsHolder.Name = "Holder"
    hitLogsHolder.BackgroundTransparency = 1
    hitLogsHolder.BorderSizePixel = 0
    hitLogsHolder.AutomaticSize = Enum.AutomaticSize.XY
    hitLogsHolder.Size = UDim2.fromOffset(0, 0)
    hitLogsHolder.AnchorPoint = Vector2.new(0.5, 0)
    hitLogsHolder.Position = UDim2.new(0.5, 0, 0.62, 0)
    hitLogsHolder.Parent = hitLogsGui
    local hitLogsLayout = Instance.new("UIListLayout")
    hitLogsLayout.FillDirection = Enum.FillDirection.Vertical
    hitLogsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    hitLogsLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    hitLogsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    hitLogsLayout.Padding = UDim.new(0, 0)
    hitLogsLayout.Parent = hitLogsHolder
    local activeHitLogs = {}
    local hitlogOrder = 0
    local HITLOG_ROW_HEIGHT = 18
    updateHitLogPosition = function()
        if HL.Position == "Center" then
            hitLogsHolder.AnchorPoint = Vector2.new(0.5, 0)
            hitLogsHolder.Position = UDim2.new(0.5, 0, 0.62, 0)
        elseif HL.Position == "Left" then
            hitLogsHolder.AnchorPoint = Vector2.new(0, 0.5)
            hitLogsHolder.Position = UDim2.new(0, 18, 0.5, 0)
        elseif HL.Position == "Top" then
            hitLogsHolder.AnchorPoint = Vector2.new(0.5, 0)
            hitLogsHolder.Position = UDim2.new(0.5, 0, 0, 78)
        else
            hitLogsHolder.AnchorPoint = Vector2.new(0, 0)
            hitLogsHolder.Position = UDim2.new(0, 18, 0, 78)
        end
    end
    local function richEscape(text)
        return (tostring(text):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"):gsub("'", "&apos;"))
    end
    buildHitLogText = function(playerName, partName, damage, health)
        local r = mathFloor(HL.Color.R * 255)
        local g = mathFloor(HL.Color.G * 255)
        local b = mathFloor(HL.Color.B * 255)
        return string_format(
            '[ <font color="rgb(%d, %d, %d)">VOMAGLA</font> ] Hit %s in the %s for %s damage (%s health remaining)',
            r, g, b,
            richEscape(playerName),
            richEscape(partName),
            richEscape(damage),
            richEscape(health)
        )
    end
    showHitLog = function(text, duration)
        duration = math.max(0.1, tonumber(duration) or 5)
        local label = Instance.new("TextLabel")
        hitlogOrder += 1
        label.Name = "HitLog"
        label.LayoutOrder = -hitlogOrder
        label.Parent = hitLogsHolder
        label.BackgroundTransparency = 1
        label.BorderSizePixel = 0
        label.AutomaticSize = Enum.AutomaticSize.X
        label.Size = UDim2.fromOffset(0, HITLOG_ROW_HEIGHT)
        label.Font = Enum.Font.Code
        label.TextSize = 13
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextStrokeTransparency = 1
        label.TextTransparency = 1
        label.RichText = true
        label.Text = text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextYAlignment = Enum.TextYAlignment.Center
        label.ZIndex = 10
        activeHitLogs[#activeHitLogs + 1] = label
        TweenService:Create(label, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextTransparency = 0,
            TextStrokeTransparency = 0.35,
        }):Play()
        task_delay(duration, function()
            if not label or not label.Parent then return end
            local tw = TweenService:Create(label, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 1, TextStrokeTransparency = 1
            })
            tw:Play()
            tw.Completed:Wait()
            for i, v in ipairs(activeHitLogs) do
                if v == label then
                    table.remove(activeHitLogs, i)
                    break
                end
            end
            pcall(function() label:Destroy() end)
        end)
    end
end
-- ============================================================
--  DAMAGE PARTICLES
-- ============================================================
local DAMAGE_STYLES = {"Balls", "Foam", "Crescents", "Residue", "Electric", "Hit Chams", "Skeleton"}
local DamageFX = {
    Enabled = false,
    Style = "Balls",
    Color = Color3.fromRGB(255, 60, 60),
    Count = 12,
    Speed = 20,
    Size = 0.25,
    Lifetime = 0.8,
    Rainbow = false,
}
local function ballsFX(pos)
    for i = 1, DamageFX.Count do
        local sz = math.max(0.08, DamageFX.Size + math.random() * 0.15)
        local p = Instance.new("Part")
        p.Shape = Enum.PartType.Ball
        p.Size = Vector3.new(sz, sz, sz)
        p.Material = Enum.Material.Neon
        if DamageFX.Rainbow then
            p.Color = Color3.fromHSV(math.random(), 1, 1)
        else
            p.Color = DamageFX.Color
        end
        p.Anchored = false
        p.CanCollide = false
        p.CanQuery = false
        p.CanTouch = false
        p.CastShadow = false
        p.Position = pos + Vector3.new((math.random()-0.5)*1.5, (math.random()-0.5)*1.5+0.5, (math.random()-0.5)*1.5)
        p.Parent = Workspace
        local light
        if math.random() < 0.25 then
            light = Instance.new("PointLight")
            light.Brightness = 1
            light.Range = 3
            light.Color = p.Color
            light.Parent = p
        end
        local dir = Vector3.new((math.random()-0.5)*2, (math.random()-0.5)*2, (math.random()-0.5)*2).Unit
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = dir * (DamageFX.Speed * (0.5 + math.random()*0.8))
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Parent = p
        task_delay(0.08, function()
            if bv and bv.Parent then
                TweenService:Create(bv, TweenInfo.new(0.35), { Velocity = Vector3.new(0, -4, 0) }):Play()
            end
        end)
        local life = math.max(0.2, DamageFX.Lifetime * (0.7 + math.random()*0.6))
        TweenService:Create(p, TweenInfo.new(life, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Transparency = 1, Size = Vector3.new(0.02, 0.02, 0.02)
        }):Play()
        if light then
            TweenService:Create(light, TweenInfo.new(life), { Brightness = 0, Range = 0 }):Play()
        end
        Debris:AddItem(p, life + 0.1)
    end
end
local function hitChamsFX(char)
    if not char or not char.Parent then return end
    pcall(function() char.Archivable = true end)
    local ok, clone = pcall(function() return char:Clone() end)
    if not ok or not clone then return end
    clone.Name = "VOMAGLA_HitChams"
    for _, d in ipairs(clone:GetDescendants()) do
        if d:IsA("BillboardGui") or d:IsA("SurfaceGui") or d:IsA("Script") or d:IsA("LocalScript") then
            d:Destroy()
        end
    end
    for _, child in ipairs(clone:GetChildren()) do
        if child:IsA("BasePart") then
            local isBody = false
            for _, n in ipairs({"Head","UpperTorso","LowerTorso","Torso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"}) do
                if child.Name == n then
                    isBody = true
                    break
                end
            end
            if not isBody then child:Destroy() end
        elseif not child:IsA("Accessory") then
            child:Destroy()
        end
    end
    local hum = clone:FindFirstChildWhichIsA("Humanoid")
    if hum then hum:Destroy() end
    for _, child in ipairs(clone:GetChildren()) do
        if child:IsA("BasePart") then
            child.CanCollide = false
            child.Anchored = true
            child.Transparency = 0.3
            child.Color = DamageFX.Color
            child.Material = Enum.Material.Neon
            local face = child:FindFirstChild("face")
            if face then face:Destroy() end
        end
    end
    clone.Parent = Workspace
    local dur = math.max(0.3, DamageFX.Lifetime)
    for _, child in ipairs(clone:GetChildren()) do
        if child:IsA("BasePart") then
            TweenService:Create(child, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Transparency = 1 }):Play()
        end
    end
    task_delay(dur + 0.5, function()
        if clone and clone.Parent then clone:Destroy() end
    end)
end
local SKELETON_JOINTS = {
    {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
}
local function skeletonFX(char)
    if not char or not char.Parent then return end
    local folder = Instance.new("Folder")
    folder.Name = "VOMAGLA_Skeleton"
    folder.Parent = Workspace
    for _, joint in ipairs(SKELETON_JOINTS) do
        local a = char:FindFirstChild(joint[1])
        local b = char:FindFirstChild(joint[2])
        if a and b then
            local mag = (a.Position - b.Position).Magnitude
            local mid = (a.Position + b.Position) / 2
            local part = Instance.new("Part")
            part.Anchored = true
            part.CanCollide = false
            part.CanQuery = false
            part.Size = Vector3.new(0.2, 0.2, mag)
            part.CFrame = CFrame.lookAt(mid, b.Position)
            part.Color = DamageFX.Color
            part.Material = Enum.Material.Neon
            part.Transparency = 0.3
            part.Parent = folder
        end
    end
    local dur = math.max(0.3, DamageFX.Lifetime)
    for _, child in ipairs(folder:GetChildren()) do
        TweenService:Create(child, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Transparency = 1 }):Play()
    end
    task_delay(dur + 0.5, function()
        if folder and folder.Parent then folder:Destroy() end
    end)
end
local function makeEmitter(parent, style)
    local em = Instance.new("ParticleEmitter")
    em.Enabled = false
    em.LightInfluence = 0
    local col = ColorSequence.new(DamageFX.Color)
    if style == "Foam" then
        em.Name = "Foam"
        em.LightInfluence = 0.5
        em.Lifetime = NumberRange.new(1, 1)
        em.SpreadAngle = Vector2.new(360, -360)
        em.Squash = NumberSequence.new(1)
        em.Speed = NumberRange.new(20, 20)
        em.Brightness = 2.5
        em.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.1, 0.65, 0.65),
            NumberSequenceKeypoint.new(0.65, 1.42, 0.41),
            NumberSequenceKeypoint.new(1, 0),
        })
        em.Acceleration = Vector3.new(0, -66, 0)
        em.Rate = 100
        em.Texture = "rbxassetid://8297030850"
        em.Rotation = NumberRange.new(-90, -90)
        em.Orientation = Enum.ParticleOrientation.VelocityParallel
        em.Color = col
    elseif style == "Crescents" then
        em.Name = "Crescents"
        em.Lifetime = NumberRange.new(0.19, 0.38)
        em.SpreadAngle = Vector2.new(-360, 360)
        em.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.19, 0),
            NumberSequenceKeypoint.new(0.78, 0),
            NumberSequenceKeypoint.new(1, 1),
        })
        em.LightEmission = 10
        em.Color = col
        em.Speed = NumberRange.new(0.08, 0.08)
        em.Brightness = 4
        em.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.4, 8.8, 2.28),
            NumberSequenceKeypoint.new(1, 11.5, 1.86),
        })
        em.Texture = "rbxassetid://12509373457"
        em.RotSpeed = NumberRange.new(800, 1000)
        em.Rotation = NumberRange.new(-360, 360)
        em.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
    elseif style == "Residue" then
        em.Name = "RESIDUE"
        em.Acceleration = Vector3.new(0, -25, 0)
        em.Color = col
        em.Drag = 2
        em.Lifetime = NumberRange.new(0.25, 0.5)
        em.LightEmission = 1
        em.Orientation = Enum.ParticleOrientation.VelocityParallel
        em.Rate = 100
        em.Rotation = NumberRange.new(90, 90)
        em.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
        em.Speed = NumberRange.new(25, 50)
        em.SpreadAngle = Vector2.new(-90, 90)
        em.Texture = "rbxassetid://4509687978"
        em.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.25, 1), NumberSequenceKeypoint.new(1, 1)})
    elseif style == "Electric" then
        em.Name = "ELECTRIC"
        em.Brightness = 3
        em.Color = col
        em.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
        em.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
        em.Lifetime = NumberRange.new(0.5, 1)
        em.LightEmission = 2
        em.Orientation = Enum.ParticleOrientation.FacingCameraWorldUp
        em.Rate = 12
        em.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 25), NumberSequenceKeypoint.new(1, 0)})
        em.Speed = NumberRange.new(0, 0)
        em.Texture = "rbxassetid://10547286472"
        em.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.25, 1), NumberSequenceKeypoint.new(1, 1)})
    end
    em.Parent = parent
    return em
end
local function emitterFX(pos, style)
    local holder = Instance.new("Part")
    holder.Size = Vector3.new(0.2, 0.2, 0.2)
    holder.Transparency = 1
    holder.Anchored = true
    holder.CanCollide = false
    holder.CanQuery = false
    holder.CanTouch = false
    holder.Position = pos + Vector3.new(0, 1, 0)
    holder.Parent = Workspace
    local att = Instance.new("Attachment")
    att.Parent = holder
    local em = makeEmitter(att, style)
    em:Emit(math.max(1, DamageFX.Count))
    task_delay(math.max(1, DamageFX.Lifetime + 1), function()
        if holder and holder.Parent then holder:Destroy() end
    end)
end
local function spawnDamageFX(char, pos)
    local style = DamageFX.Style
    if style == "Balls" then
        ballsFX(pos)
    elseif style == "Hit Chams" then
        hitChamsFX(char)
    elseif style == "Skeleton" then
        skeletonFX(char)
    else
        emitterFX(pos, style)
    end
end
-- ========== KILL PARTICLES (фрост) ==========
local KE = {
    Enabled = false,
    MainColor = Color3.fromRGB(255, 255, 255),
    BrightColor = Color3.fromRGB(255, 255, 255),
    UseBright = false,
    ParticleCount = 40,
    ParticleSpeed = 35,
    ParticleLifetime = 0.7,
    RayCount = 10,
    RayLength = 6,
    SparkleCount = 8,
    StarCount = 20,
}
local function ke_particle(position)
    local sz = 0.15 + math.random() * 0.25
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Size = Vector3.new(sz, sz, sz)
    part.Material = Enum.Material.Neon
    part.Color = math.random() > 0.3 and KE.MainColor or KE.BrightColor
    part.Anchored = false
    part.CanCollide = false
    part.CanQuery = false
    part.CastShadow = false
    part.Position = position + Vector3.new((math.random()-0.5)*2, (math.random()-0.5)*2+1, (math.random()-0.5)*2)
    part.Parent = Workspace
    local light
    if math.random() < 0.3 then
        light = Instance.new("PointLight")
        light.Brightness = 1
        light.Range = 2.5
        light.Color = KE.MainColor
        light.Parent = part
    end
    local dir = Vector3.new((math.random()-0.5)*2, (math.random()-0.5)*2, (math.random()-0.5)*2).Unit
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = dir * (KE.ParticleSpeed * (0.5 + math.random()*0.8))
    bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bv.Parent = part
    task_delay(0.1, function()
        if bv and bv.Parent then
            TweenService:Create(bv, TweenInfo.new(0.4), { Velocity = Vector3.new(0, -5, 0) }):Play()
        end
    end)
    local lt = KE.ParticleLifetime * (0.7 + math.random()*0.6)
    TweenService:Create(part, TweenInfo.new(lt, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Transparency = 1, Size = Vector3.new(0.02, 0.02, 0.02)
    }):Play()
    if light then
        TweenService:Create(light, TweenInfo.new(lt), { Brightness = 0, Range = 0 }):Play()
    end
    task_delay(lt + 0.05, function() if part then part:Destroy() end end)
end
local function ke_star(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.3, 0.3, 0.3)
    part.Transparency = 1
    part.Anchored = true
    part.CanCollide = false
    part.CastShadow = false
    part.Position = position + Vector3.new(0, 1, 0)
    part.Parent = Workspace
    local att = Instance.new("Attachment")
    att.Parent = part
    local em = Instance.new("ParticleEmitter")
    em.Texture = "rbxassetid://2273224484"
    em.Color = ColorSequence.new(KE.MainColor)
    em.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.2, 0.6), NumberSequenceKeypoint.new(0.7, 0.4), NumberSequenceKeypoint.new(1, 0)})
    em.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)})
    em.Lifetime = NumberRange.new(0.7, 1.2)
    em.Rate = 0
    em.Speed = NumberRange.new(10, 22)
    em.SpreadAngle = Vector2.new(180, 180)
    em.Rotation = NumberRange.new(0, 360)
    em.RotSpeed = NumberRange.new(-100, 100)
    em.LightEmission = 1
    em.LightInfluence = 0
    em.Acceleration = Vector3.new(0, -10, 0)
    em.Orientation = Enum.ParticleOrientation.FacingCamera
    em.Parent = att
    em:Emit(KE.StarCount)
    local l = Instance.new("PointLight")
    l.Brightness = 2
    l.Range = 6
    l.Color = KE.MainColor
    l.Parent = part
    TweenService:Create(l, TweenInfo.new(0.8), { Brightness = 0, Range = 0 }):Play()
    task_delay(1.5, function() if part then part:Destroy() end end)
end
local function ke_sparkle(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.2, 0.2, 0.2)
    part.Anchored = true
    part.CanCollide = false
    part.CastShadow = false
    part.Transparency = 1
    part.Position = position + Vector3.new((math.random()-0.5)*8, (math.random()-0.5)*6+1, (math.random()-0.5)*8)
    part.Parent = Workspace
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 0, 0, 0)
    bb.AlwaysOnTop = false
    bb.LightInfluence = 0
    bb.Parent = part
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, 0, 1, 0)
    img.BackgroundTransparency = 1
    pcall(function() img.Image = "rbxassetid://241876428" end)
    pcall(function() img.ImageColor3 = KE.BrightColor end)
    img.Parent = bb
    local ts = 80 + math.random(0, 60)
    TweenService:Create(bb, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, ts, 0, ts) }):Play()
    task_delay(0.2, function()
        TweenService:Create(bb, TweenInfo.new(0.4), { Size = UDim2.new(0, 0, 0, 0) }):Play()
        TweenService:Create(img, TweenInfo.new(0.4), { ImageTransparency = 1 }):Play()
        task_delay(0.45, function() if part then part:Destroy() end end)
    end)
end
local function ke_ray(position, angle)
    local length = KE.RayLength * (0.7 + math.random()*0.6)
    local ray = Instance.new("Part")
    ray.Size = Vector3.new(0.1, 0.1, 0.5)
    ray.Material = Enum.Material.Neon
    ray.Color = KE.BrightColor
    ray.Anchored = true
    ray.CanCollide = false
    ray.CanQuery = false
    ray.CastShadow = false
    ray.Transparency = 0.1
    local dir = Vector3.new(
        math.cos(angle) * math.cos(math.random()*math.pi - math.pi/2),
        math.sin(math.random()*math.pi - math.pi/2),
        math.sin(angle) * math.cos(math.random()*math.pi - math.pi/2)
    ).Unit
    ray.CFrame = CFrame.lookAt(position, position + dir) * CFrame.new(0, 0, -length/2)
    ray.Size = Vector3.new(0.1, 0.1, length)
    ray.Parent = Workspace
    TweenService:Create(ray, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = Vector3.new(0.01, 0.01, length*1.5), Transparency = 1
    }):Play()
    task_delay(0.4, function() if ray then ray:Destroy() end end)
end
local function ke_createEffect(position)
    if not KE.Enabled or LibraryUnloaded then return end
    for i = 1, KE.ParticleCount do task_spawn(ke_particle, position) end
    if KE.StarCount > 0 then ke_star(position) end
    for i = 1, KE.SparkleCount do
        task_spawn(function()
            task_wait(math.random() * 0.2)
            ke_sparkle(position)
        end)
    end
    for i = 1, KE.RayCount do
        task_spawn(function()
            ke_ray(position, (i / KE.RayCount) * math.pi * 2 + math.random() * 0.3)
        end)
    end
end
-- ========== DEATH EFFECT (фрост) ==========
local DE = {
    Enabled = false,
    MainColor = Color3.fromRGB(255, 100, 200),
    BrightColor = Color3.fromRGB(255, 200, 230),
    UseBright = false,
    AffectSelf = true,
    AffectOthers = true,
    ParticleCount = 40,
    ParticleSpeed = 35,
    ParticleLifetime = 0.7,
    RayCount = 10,
    RayLength = 6,
    SparkleCount = 8,
    StarCount = 20,
}
local function de_particle(position)
    local sz = 0.15 + math.random() * 0.25
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Size = Vector3.new(sz, sz, sz)
    part.Material = Enum.Material.Neon
    part.Color = math.random() > 0.3 and DE.MainColor or DE.BrightColor
    part.Anchored = false
    part.CanCollide = false
    part.CanQuery = false
    part.CastShadow = false
    part.Position = position + Vector3.new((math.random()-0.5)*2, (math.random()-0.5)*2+1, (math.random()-0.5)*2)
    part.Parent = Workspace
    local light
    if math.random() < 0.3 then
        light = Instance.new("PointLight")
        light.Brightness = 1
        light.Range = 2.5
        light.Color = DE.MainColor
        light.Parent = part
    end
    local dir = Vector3.new((math.random()-0.5)*2, (math.random()-0.5)*2, (math.random()-0.5)*2).Unit
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = dir * (DE.ParticleSpeed * (0.5 + math.random()*0.8))
    bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bv.Parent = part
    task_delay(0.1, function()
        if bv and bv.Parent then
            TweenService:Create(bv, TweenInfo.new(0.4), { Velocity = Vector3.new(0, -5, 0) }):Play()
        end
    end)
    local lt = DE.ParticleLifetime * (0.7 + math.random()*0.6)
    TweenService:Create(part, TweenInfo.new(lt, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Transparency = 1, Size = Vector3.new(0.02, 0.02, 0.02)
    }):Play()
    if light then
        TweenService:Create(light, TweenInfo.new(lt), { Brightness = 0, Range = 0 }):Play()
    end
    task_delay(lt + 0.05, function() if part then part:Destroy() end end)
end
local function de_star(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.3, 0.3, 0.3)
    part.Transparency = 1
    part.Anchored = true
    part.CanCollide = false
    part.CastShadow = false
    part.Position = position + Vector3.new(0, 1, 0)
    part.Parent = Workspace
    local att = Instance.new("Attachment")
    att.Parent = part
    local em = Instance.new("ParticleEmitter")
    em.Texture = "rbxassetid://2273224484"
    em.Color = ColorSequence.new(DE.MainColor)
    em.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.2, 0.6), NumberSequenceKeypoint.new(0.7, 0.4), NumberSequenceKeypoint.new(1, 0)})
    em.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)})
    em.Lifetime = NumberRange.new(0.7, 1.2)
    em.Rate = 0
    em.Speed = NumberRange.new(10, 22)
    em.SpreadAngle = Vector2.new(180, 180)
    em.Rotation = NumberRange.new(0, 360)
    em.RotSpeed = NumberRange.new(-100, 100)
    em.LightEmission = 1
    em.LightInfluence = 0
    em.Acceleration = Vector3.new(0, -10, 0)
    em.Orientation = Enum.ParticleOrientation.FacingCamera
    em.Parent = att
    em:Emit(DE.StarCount)
    local l = Instance.new("PointLight")
    l.Brightness = 2
    l.Range = 6
    l.Color = DE.MainColor
    l.Parent = part
    TweenService:Create(l, TweenInfo.new(0.8), { Brightness = 0, Range = 0 }):Play()
    task_delay(1.5, function() if part then part:Destroy() end end)
end
local function de_sparkle(position)
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.2, 0.2, 0.2)
    part.Anchored = true
    part.CanCollide = false
    part.CastShadow = false
    part.Transparency = 1
    part.Position = position + Vector3.new((math.random()-0.5)*8, (math.random()-0.5)*6+1, (math.random()-0.5)*8)
    part.Parent = Workspace
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 0, 0, 0)
    bb.AlwaysOnTop = false
    bb.LightInfluence = 0
    bb.Parent = part
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, 0, 1, 0)
    img.BackgroundTransparency = 1
    pcall(function() img.Image = "rbxassetid://241876428" end)
    pcall(function() img.ImageColor3 = DE.BrightColor end)
    img.Parent = bb
    local ts = 80 + math.random(0, 60)
    TweenService:Create(bb, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, ts, 0, ts) }):Play()
    task_delay(0.2, function()
        TweenService:Create(bb, TweenInfo.new(0.4), { Size = UDim2.new(0, 0, 0, 0) }):Play()
        TweenService:Create(img, TweenInfo.new(0.4), { ImageTransparency = 1 }):Play()
        task_delay(0.45, function() if part then part:Destroy() end end)
    end)
end
local function de_ray(position, angle)
    local length = DE.RayLength * (0.7 + math.random()*0.6)
    local ray = Instance.new("Part")
    ray.Size = Vector3.new(0.1, 0.1, 0.5)
    ray.Material = Enum.Material.Neon
    ray.Color = DE.BrightColor
    ray.Anchored = true
    ray.CanCollide = false
    ray.CanQuery = false
    ray.CastShadow = false
    ray.Transparency = 0.1
    local dir = Vector3.new(
        math.cos(angle) * math.cos(math.random()*math.pi - math.pi/2),
        math.sin(math.random()*math.pi - math.pi/2),
        math.sin(angle) * math.cos(math.random()*math.pi - math.pi/2)
    ).Unit
    ray.CFrame = CFrame.lookAt(position, position + dir) * CFrame.new(0, 0, -length/2)
    ray.Size = Vector3.new(0.1, 0.1, length)
    ray.Parent = Workspace
    TweenService:Create(ray, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = Vector3.new(0.01, 0.01, length*1.5), Transparency = 1
    }):Play()
    task_delay(0.4, function() if ray then ray:Destroy() end end)
end
local function de_createEffect(position)
    if not DE.Enabled or LibraryUnloaded then return end
    for i = 1, DE.ParticleCount do task_spawn(de_particle, position) end
    if DE.StarCount > 0 then de_star(position) end
    for i = 1, DE.SparkleCount do
        task_spawn(function()
            task_wait(math.random() * 0.2)
            de_sparkle(position)
        end)
    end
    for i = 1, DE.RayCount do
        task_spawn(function()
            de_ray(position, (i / DE.RayCount) * math.pi * 2 + math.random() * 0.3)
        end)
    end
end
do
    local function de_connectCharacter(character, isLocal)
        local hum = character:WaitForChild("Humanoid", 5)
        if not hum then return end
        hum.Died:Connect(function()
            if LibraryUnloaded then return end
            local root = character:FindFirstChild("HumanoidRootPart")
                or character:FindFirstChild("Torso")
                or character:FindFirstChild("UpperTorso")
                or character:FindFirstChild("Head")
            if not root or not root.Parent then return end
            if (isLocal and DE.AffectSelf) or (not isLocal and DE.AffectOthers) then
                de_createEffect(root.Position)
            end
        end)
    end
    local function de_connectPlayer(player)
        local isLocal = player == LocalPlayer
        if player.Character then task_spawn(de_connectCharacter, player.Character, isLocal) end
        player.CharacterAdded:Connect(function(char)
            de_connectCharacter(char, isLocal)
        end)
    end
    for _, p in ipairs(Players:GetPlayers()) do task_spawn(de_connectPlayer, p) end
    Players.PlayerAdded:Connect(de_connectPlayer)
end
-- ========== ЕДИНЫЙ ОБРАБОТЧИК УРОНА ==========
local watched = {}
local function watchPlayer(plr)
    if plr == LocalPlayer then return end
    local function connectChar(char)
        local hum = char:WaitForChild("Humanoid", 10)
        if not hum or watched[hum] then return end
        local lastHealth = hum.Health
        watched[hum] = hum.HealthChanged:Connect(function(newHealth)
            if newHealth >= lastHealth then return end
            local dmg = mathFloor(lastHealth - newHealth)
            local killed = newHealth <= 0
            local root = char:FindFirstChild("HumanoidRootPart")
                or char:FindFirstChild("Head")
                or char:FindFirstChild("UpperTorso")
                or char:FindFirstChild("Torso")
            if root and root.Parent then
                if HM.Enabled then
                    spawnHitMarker(root.Position, killed)
                end
                if DamageFX.Enabled then
                    spawnDamageFX(char, root.Position)
                end
                if killed and KE.Enabled then
                    ke_createEffect(root.Position + Vector3.new(0, 2, 0))
                end
            end
            local isOurHit = false
            if CurrentAimTarget and CurrentAimTarget.Parent == char then
                isOurHit = true
            elseif lastTargetPlayer == plr and (osClock() - lastTargetTick) < 2 then
                isOurHit = true
            elseif root then
                if isOnOurShot(root.Position) then isOurHit = true end
            end
            if isOurHit then
                if HL.Enabled then
                    showHitLog(buildHitLogText(plr.DisplayName, SilentAim.Settings.TargetPart, dmg, mathFloor(math.max(newHealth, 0))), HL.Duration)
                end
                if HS.Enabled then hitSound:Play() end
                if killed then
                    playKillSound()
                end
            end
            lastHealth = newHealth
        end)
        hum.AncestryChanged:Connect(function()
            if not hum.Parent and watched[hum] then
                watched[hum]:Disconnect()
                watched[hum] = nil
            end
        end)
    end
    if plr.Character then connectChar(plr.Character) end
    plr.CharacterAdded:Connect(connectChar)
end
for _, plr in ipairs(Players:GetPlayers()) do watchPlayer(plr) end
Players.PlayerAdded:Connect(watchPlayer)
-- ========== ХИТРЕГ-ХУК ==========
local function setupHitHook()
    if not hookmetamethod or not getnamecallmethod then return end
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if self == Workspace and (method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList") then
            if checkcaller() then return oldNamecall(self, ...) end
            local args = {...}
            local origin, dirVec
            if method == "Raycast" then
                origin = args[1]
                dirVec = args[2]
            else
                local ray = args[1]
                if typeof(ray) == "Ray" then
                    origin = ray.Origin
                    dirVec = ray.Direction
                end
            end
            if typeof(origin) == "Vector3" and typeof(dirVec) == "Vector3" then
                local cam = Workspace.CurrentCamera
                local camPos = cam and cam.CFrame.Position
                if camPos and (origin - camPos).Magnitude <= 5 and dirVec.Magnitude > 30 then
                    local shootDir = dirVec.Unit
                    if SilentAim.Options.Enabled and CurrentAimTarget and CurrentAimTarget.Parent then
                        local aimPos = getPredictedPosition(CurrentAimTarget)
                        shootDir = (aimPos - origin).Unit
                        local newDir = shootDir * dirVec.Magnitude
                        recordShot(origin, shootDir)
                        if method == "Raycast" then
                            return oldNamecall(self, origin, newDir, select(3, ...))
                        else
                            return oldNamecall(self, Ray.new(origin, newDir), select(2, ...))
                        end
                    end
                    recordShot(origin, shootDir)
                end
            end
        elseif method == "FireServer" then
            local args = {...}
            local data = args[1]
            if type(data) == "table" and data.CameraOrigin and data.CameraDirection then
                pcall(function()
                    recordShot(data.CameraOrigin, data.CameraDirection.Unit)
                end)
                local target = CurrentAimTarget
                if SilentAim.Options.Enabled and target and target.Parent then
                    pcall(function()
                        local aimPos = getPredictedPosition(target)
                        local dir = (aimPos - data.CameraOrigin).Unit
                        data.CameraDirection = dir
                        if data.MuzzleOrigin then
                            data.MuzzleOrigin = data.CameraOrigin + dir * 1.5
                        end
                    end)
                end
            end
        end
        return oldNamecall(self, ...)
    end))
end
setupHitHook()
-- ========== CUSTOM CROSSHAIR ==========
local Crosshair = {
    Enabled = false,
    Color = Color3.fromRGB(255, 255, 255),
    Rainbow = false,
    Length = 8,
    Gap = 4,
    Thickness = 1.5,
    Dot = false,
    RotationSpeed = 0,
    Pulse = false,
    PulseSpeed = 3,
    FollowTarget = false,
    FollowSmooth = 8,
}
local chLines = {}
local chDot = nil
if DrawingOK then
    for i = 1, 4 do
        local l = Drawing.new("Line")
        l.Visible = false
        l.Thickness = Crosshair.Thickness
        l.Color = Crosshair.Color
        l.ZIndex = 3
        chLines[i] = l
    end
    chDot = Drawing.new("Square")
    chDot.Visible = false
    chDot.Filled = true
    chDot.Thickness = 1
    chDot.Size = Vector2New(2, 2)
    chDot.Color = Crosshair.Color
    chDot.ZIndex = 3
end
local chRot = 0
local chCenter = nil
local chTime = 0
local function updateCrosshair(dt)
    if not DrawingOK then return end
    if not Crosshair.Enabled or LibraryUnloaded then
        for _, l in ipairs(chLines) do l.Visible = false end
        if chDot then chDot.Visible = false end
        return
    end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local vp = cam.ViewportSize
    local desired = Vector2New(vp.X * 0.5, vp.Y * 0.5)
    if Crosshair.FollowTarget and CurrentAimTarget and CurrentAimTarget.Parent then
        local p, vis = getPositionOnScreen(CurrentAimTarget.Position)
        if vis then desired = p end
    end
    if chCenter == nil then chCenter = desired end
    local smooth = mathClamp(Crosshair.FollowSmooth, 1, 20)
    local alpha = 1 - math.exp(-dt * smooth)
    chCenter = Vector2New(
        chCenter.X + (desired.X - chCenter.X) * alpha,
        chCenter.Y + (desired.Y - chCenter.Y) * alpha
    )
    chTime = chTime + dt
    chRot = (chRot + dt * Crosshair.RotationSpeed) % 360
    local col = Crosshair.Color
    if Crosshair.Rainbow then
        col = Color3.fromHSV((chTime * 0.5) % 1, 1, 1)
    end
    local gap = Crosshair.Gap
    if Crosshair.Pulse then
        gap = gap + mathSin(chTime * Crosshair.PulseSpeed) * math.max(Crosshair.Gap * 0.4, 2)
    end
    local len = Crosshair.Length
    for i = 0, 3 do
        local l = chLines[i + 1]
        local ang = mathRad(chRot + i * 90)
        local dirX = mathCos(ang)
        local dirY = mathSin(ang)
        l.Visible = true
        l.Thickness = Crosshair.Thickness
        l.Color = col
        l.From = Vector2New(chCenter.X + dirX * gap, chCenter.Y + dirY * gap)
        l.To = Vector2New(chCenter.X + dirX * (gap + len), chCenter.Y + dirY * (gap + len))
    end
    if chDot then
        chDot.Visible = Crosshair.Dot
        chDot.Color = col
        chDot.Position = Vector2New(chCenter.X - 1, chCenter.Y - 1)
    end
end
local chConnection = RunService.RenderStepped:Connect(updateCrosshair)
-- ========== SILENT AIM LOOP ==========
local function updateSnapline()
    if not snapline then return end
    if SilentAim.Options.Enabled and SilentAim.Options.Snapline and CurrentAimTarget then
        local cam = Workspace.CurrentCamera
        if not cam then
            snapline.Visible = false
            return
        end
        local p, vis = cam:WorldToViewportPoint(CurrentAimTarget.Position)
        if vis then
            snapline.Visible = true
            snapline.From = getAnchorPosition()
            snapline.To = Vector2New(p.X, p.Y)
            snapline.Color = SilentAim.Colors.SnaplineColor
            snapline.Thickness = SilentAim.Settings.SnaplineThickness
        else
            snapline.Visible = false
        end
    else
        snapline.Visible = false
    end
end
local function silentAimUpdate()
    if LibraryUnloaded then return end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local now = tick()
    if SilentAim.Options.Enabled then
        CurrentAimTarget = getClosestPlayer()
    else
        CurrentAimTarget = nil
    end
    if CurrentAimTarget and CurrentAimTarget.Parent then
        local pl = Players:GetPlayerFromCharacter(CurrentAimTarget.Parent)
        if pl then
            lastTargetPlayer = pl
            lastTargetTick = osClock()
        end
    end
    updateFOVCircle()
    updateSnapline()
    THUD_Update(now)
end
local silentAimRunning = false
local silentAimConnection = nil
function SilentAim:Start()
    if silentAimRunning then return end
    silentAimRunning = true
    silentAimConnection = RunService.RenderStepped:Connect(silentAimUpdate)
end
function SilentAim:Stop()
    silentAimRunning = false
    if silentAimConnection then
        silentAimConnection:Disconnect()
        silentAimConnection = nil
    end
    CurrentAimTarget = nil
    updateFOVCircle()
    if snapline then snapline.Visible = false end
    THUD_Hide()
end
-- ========== CUSTOM AVATAR ==========
local CUSTOM = {
    BodyEnabled = false,
    BodyMaterial = "ForceField",
    BodyColor = Color3.fromRGB(120, 180, 255),
}
local MATERIALS = {
    ForceField = Enum.Material.ForceField,
    Glass = Enum.Material.Glass,
    Neon = Enum.Material.Neon,
    Plastic = Enum.Material.Plastic,
    SmoothPlastic = Enum.Material.SmoothPlastic,
    Metal = Enum.Material.Metal,
    Wood = Enum.Material.Wood,
    Slate = Enum.Material.Slate,
    Concrete = Enum.Material.Concrete,
    Ice = Enum.Material.Ice,
}
local customAccum = 0
local customConnection = RunService.RenderStepped:Connect(function(dt)
    if LibraryUnloaded then return end
    if not CUSTOM.BodyEnabled then return end
    customAccum = customAccum + dt
    if customAccum < 0.2 then return end
    customAccum = 0
    if cachedChar then
        for _, p in ipairs(cachedChar:GetDescendants()) do
            if p:IsA("BasePart") then
                pcall(function()
                    p.Material = MATERIALS[CUSTOM.BodyMaterial]
                    p.Color = CUSTOM.BodyColor
                end)
            end
        end
        local cam = Workspace.CurrentCamera
        if cam then
            for _, m in ipairs(cam:GetChildren()) do
                if m:IsA("Model") or m:IsA("Folder") then
                    for _, p in ipairs(m:GetDescendants()) do
                        if p:IsA("BasePart") then
                            pcall(function()
                                p.Material = MATERIALS[CUSTOM.BodyMaterial]
                                p.Color = CUSTOM.BodyColor
                            end)
                        end
                    end
                end
            end
        end
    end
end)
-- ========== MOVEMENT ==========
local MV = {
    SpeedEnabled = false,
    SpeedValue = 16,
    JumpEnabled = false,
    JumpValue = 50,
    NoFall = false,
    FastInteract = false,
}
local mvConnection = RunService.Heartbeat:Connect(function(dt)
    if LibraryUnloaded then return end
    local hum = cachedHumanoid
    if not hum then return end
    if MV.SpeedEnabled then
        local root = cachedChar and cachedChar:FindFirstChild("HumanoidRootPart")
        local dir = hum.MoveDirection
        if root and dir.Magnitude > 0 then
            root.CFrame = root.CFrame + dir * MV.SpeedValue * dt
        end
    end
    if MV.JumpEnabled then
        hum.UseJumpPower = true
        if hum.JumpPower ~= MV.JumpValue then hum.JumpPower = MV.JumpValue end
    end
    if MV.NoFall then
        local root = cachedChar and cachedChar:FindFirstChild("HumanoidRootPart")
        if root and hum.FloorMaterial == Enum.Material.Air then
            local v = root.AssemblyLinearVelocity
            if v.Y < -35 then
                root.AssemblyLinearVelocity = Vector3.new(v.X, -35, v.Z)
            end
        end
    end
end)
local promptConns = {}
local function hookPrompt(prompt)
    if promptConns[prompt] then return end
    prompt.HoldDuration = 0
    promptConns[prompt] = prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
        if MV.FastInteract and prompt.HoldDuration ~= 0 then
            prompt.HoldDuration = 0
        end
    end)
    prompt.AncestryChanged:Connect(function()
        if not prompt.Parent and promptConns[prompt] then
            promptConns[prompt]:Disconnect()
            promptConns[prompt] = nil
        end
    end)
end
local function scanPrompts()
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v.ClassName == "ProximityPrompt" then
            hookPrompt(v)
        end
    end
end
Workspace.DescendantAdded:Connect(function(v)
    if v.ClassName == "ProximityPrompt" and MV.FastInteract then
        hookPrompt(v)
    end
end)
local function setFastInteract(state)
    MV.FastInteract = state
    if state then
        scanPrompts()
    else
        for prompt, conn in pairs(promptConns) do
            pcall(function() conn:Disconnect() end)
            promptConns[prompt] = nil
        end
    end
end
-- ========== CAMERA FOV ==========
local CamFOV = {
    Enabled = false,
    Value = 70,
}
local savedCameraFOV = nil
local camFovConnection = RunService.RenderStepped:Connect(function()
    if LibraryUnloaded then return end
    local cam = Workspace.CurrentCamera
    if not cam then return end
    if CamFOV.Enabled then
        if savedCameraFOV == nil then savedCameraFOV = cam.FieldOfView end
        if cam.FieldOfView ~= CamFOV.Value then cam.FieldOfView = CamFOV.Value end
    else
        if savedCameraFOV ~= nil then
            cam.FieldOfView = savedCameraFOV
            savedCameraFOV = nil
        end
    end
end)
-- ========== WORLD ==========
local World = { NoFog = false, Fullbright = false, Sky = "Default" }
local savedAtmosphere = nil
local skyInstance = nil
local fbCC = Instance.new("ColorCorrectionEffect")
fbCC.Name = "VOMAGLA_FB"
fbCC.Enabled = false
fbCC.Parent = Lighting
local savedLighting = nil
local function setNoFog(state)
    if state then
        local atm = Lighting:FindFirstChildOfClass("Atmosphere")
        if atm then
            savedAtmosphere = atm
            atm.Parent = nil
        end
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
    else
        if savedAtmosphere then
            savedAtmosphere.Parent = Lighting
            savedAtmosphere = nil
        end
        Lighting.FogEnd = 1000
    end
end
Lighting.ChildAdded:Connect(function(child)
    if child:IsA("Atmosphere") and World.NoFog then
        task_wait(0.1)
        if child.Parent == Lighting then child.Parent = nil end
    end
end)
local function setFullbright(state)
    if state then
        if not savedLighting then
            savedLighting = {
                Brightness = Lighting.Brightness,
                Ambient = Lighting.Ambient,
                OutdoorAmbient = Lighting.OutdoorAmbient,
                GlobalShadows = Lighting.GlobalShadows,
                ClockTime = Lighting.ClockTime,
                FogEnd = Lighting.FogEnd,
            }
        end
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.GlobalShadows = false
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        fbCC.Enabled = true
        fbCC.Brightness = 0.1
        fbCC.Contrast = 0.1
        fbCC.Saturation = 0.05
    else
        if savedLighting then
            Lighting.Brightness = savedLighting.Brightness
            Lighting.Ambient = savedLighting.Ambient
            Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
            Lighting.GlobalShadows = savedLighting.GlobalShadows
            Lighting.ClockTime = savedLighting.ClockTime
            Lighting.FogEnd = savedLighting.FogEnd
            savedLighting = nil
        end
        fbCC.Enabled = false
    end
end
local SKYBOX_ASSETS = {
    ["Black Storm"] = {Bk="rbxassetid://15502511288",Dn="rbxassetid://15502508460",Ft="rbxassetid://15502510289",Lf="rbxassetid://15502507918",Rt="rbxassetid://15502509398",Up="rbxassetid://15502511911"},
    ["HD"] = {Bk="http://www.roblox.com/asset/?id=16553658937",Dn="http://www.roblox.com/asset/?id=16553660713",Ft="http://www.roblox.com/asset/?id=16553662144",Lf="http://www.roblox.com/asset/?id=16553664042",Rt="http://www.roblox.com/asset/?id=16553665766",Up="http://www.roblox.com/asset/?id=16553667750"},
    ["Snow"] = {Bk="http://www.roblox.com/asset/?id=155657655",Dn="http://www.roblox.com/asset/?id=155674246",Ft="http://www.roblox.com/asset/?id=155657609",Lf="http://www.roblox.com/asset/?id=155657671",Rt="http://www.roblox.com/asset/?id=155657619",Up="http://www.roblox.com/asset/?id=155674931"},
    ["Blue Space"] = {Bk="rbxassetid://15536110634",Dn="rbxassetid://15536112543",Ft="rbxassetid://15536116141",Lf="rbxassetid://15536114370",Rt="rbxassetid://15536118762",Up="rbxassetid://15536117282"},
    ["Realistic"] = {Bk="rbxassetid://653719502",Dn="rbxassetid://653718790",Ft="rbxassetid://653719067",Lf="rbxassetid://653719190",Rt="rbxassetid://653718931",Up="rbxassetid://653719321"},
    ["Stormy"] = {Bk="http://www.roblox.com/asset/?id=18703245834",Dn="http://www.roblox.com/asset/?id=18703243349",Ft="http://www.roblox.com/asset/?id=18703240532",Lf="http://www.roblox.com/asset/?id=18703237556",Rt="http://www.roblox.com/asset/?id=18703235430",Up="http://www.roblox.com/asset/?id=18703232671"},
    ["Pink"] = {Bk="rbxassetid://12216109205",Dn="rbxassetid://12216109875",Ft="rbxassetid://12216109489",Lf="rbxassetid://12216110170",Rt="rbxassetid://12216110471",Up="rbxassetid://12216108877"},
    ["Sunset"] = {Bk="rbxassetid://600830446",Dn="rbxassetid://600831635",Ft="rbxassetid://600832720",Lf="rbxassetid://600886090",Rt="rbxassetid://600833862",Up="rbxassetid://600835177"},
    ["Arctic"] = {Bk="http://www.roblox.com/asset/?id=225469390",Dn="http://www.roblox.com/asset/?id=225469395",Ft="http://www.roblox.com/asset/?id=225469403",Lf="http://www.roblox.com/asset/?id=225469450",Rt="http://www.roblox.com/asset/?id=225469471",Up="http://www.roblox.com/asset/?id=225469481"},
    ["Space"] = {Bk="http://www.roblox.com/asset/?id=166509999",Dn="http://www.roblox.com/asset/?id=166510057",Ft="http://www.roblox.com/asset/?id=166510116",Lf="http://www.roblox.com/asset/?id=166510092",Rt="http://www.roblox.com/asset/?id=166510131",Up="http://www.roblox.com/asset/?id=166510114"},
    ["Roblox Default"] = {Bk="rbxasset://textures/sky/sky512_bk.tex",Dn="rbxasset://textures/sky/sky512_dn.tex",Ft="rbxasset://textures/sky/sky512_ft.tex",Lf="rbxasset://textures/sky/sky512_lf.tex",Rt="rbxasset://textures/sky/sky512_rt.tex",Up="rbxasset://textures/sky/sky512_up.tex"},
    ["Red Night"] = {Bk="http://www.roblox.com/asset/?id=401664839",Dn="http://www.roblox.com/asset/?id=401664862",Ft="http://www.roblox.com/asset/?id=401664960",Lf="http://www.roblox.com/asset/?id=401664881",Rt="http://www.roblox.com/asset/?id=401664901",Up="http://www.roblox.com/asset/?id=401664936"},
    ["Deep Space 1"] = {Bk="http://www.roblox.com/asset/?id=149397692",Dn="http://www.roblox.com/asset/?id=149397686",Ft="http://www.roblox.com/asset/?id=149397697",Lf="http://www.roblox.com/asset/?id=149397684",Rt="http://www.roblox.com/asset/?id=149397688",Up="http://www.roblox.com/asset/?id=149397702"},
    ["Pink Skies"] = {Bk="http://www.roblox.com/asset/?id=151165214",Dn="http://www.roblox.com/asset/?id=151165197",Ft="http://www.roblox.com/asset/?id=151165224",Lf="http://www.roblox.com/asset/?id=151165191",Rt="http://www.roblox.com/asset/?id=151165206",Up="http://www.roblox.com/asset/?id=151165227"},
    ["Purple Sunset"] = {Bk="rbxassetid://264908339",Dn="rbxassetid://264907909",Ft="rbxassetid://264909420",Lf="rbxassetid://264909758",Rt="rbxassetid://264908886",Up="rbxassetid://264907379"},
    ["Blue Night"] = {Bk="http://www.roblox.com/asset/?id=12064107",Dn="http://www.roblox.com/asset/?id=12064152",Ft="http://www.roblox.com/asset/?id=12064121",Lf="http://www.roblox.com/asset/?id=12063984",Rt="http://www.roblox.com/asset/?id=12064115",Up="http://www.roblox.com/asset/?id=12064131"},
    ["Blossom Daylight"] = {Bk="http://www.roblox.com/asset/?id=271042516",Dn="http://www.roblox.com/asset/?id=271077243",Ft="http://www.roblox.com/asset/?id=271042556",Lf="http://www.roblox.com/asset/?id=271042310",Rt="http://www.roblox.com/asset/?id=271042467",Up="http://www.roblox.com/asset/?id=271077958"},
    ["Blue Nebula"] = {Bk="http://www.roblox.com/asset?id=135207744",Dn="http://www.roblox.com/asset?id=135207662",Ft="http://www.roblox.com/asset?id=135207770",Lf="http://www.roblox.com/asset?id=135207615",Rt="http://www.roblox.com/asset?id=135207695",Up="http://www.roblox.com/asset?id=135207794"},
    ["Blue Planet"] = {Bk="rbxassetid://218955819",Dn="rbxassetid://218953419",Ft="rbxassetid://218954524",Lf="rbxassetid://218958493",Rt="rbxassetid://218957134",Up="rbxassetid://218950090"},
    ["Deep Space 2"] = {Bk="http://www.roblox.com/asset/?id=159248188",Dn="http://www.roblox.com/asset/?id=159248183",Ft="http://www.roblox.com/asset/?id=159248187",Lf="http://www.roblox.com/asset/?id=159248173",Rt="http://www.roblox.com/asset/?id=159248192",Up="http://www.roblox.com/asset/?id=159248176"},
    ["Summer"] = {Bk="rbxassetid://16648590964",Dn="rbxassetid://16648617436",Ft="rbxassetid://16648595424",Lf="rbxassetid://16648566370",Rt="rbxassetid://16648577071",Up="rbxassetid://16648598180"},
    ["Galaxy"] = {Bk="rbxassetid://15983968922",Dn="rbxassetid://15983966825",Ft="rbxassetid://15983965025",Lf="rbxassetid://15983967420",Rt="rbxassetid://15983966246",Up="rbxassetid://15983964246"},
    ["Stylized"] = {Bk="rbxassetid://18351376859",Dn="rbxassetid://18351374919",Ft="rbxassetid://18351376800",Lf="rbxassetid://18351376469",Rt="rbxassetid://18351376457",Up="rbxassetid://18351377189"},
    ["Minecraft"] = {Bk="rbxassetid://8735166756",Dn="http://www.roblox.com/asset/?id=8735166707",Ft="http://www.roblox.com/asset/?id=8735231668",Lf="http://www.roblox.com/asset/?id=8735166755",Rt="http://www.roblox.com/asset/?id=8735166751",Up="http://www.roblox.com/asset/?id=8735166729"},
    ["Cloudy Rain"] = {Bk="http://www.roblox.com/asset/?id=4498828382",Dn="http://www.roblox.com/asset/?id=4498828812",Ft="http://www.roblox.com/asset/?id=4498829917",Lf="http://www.roblox.com/asset/?id=4498830911",Rt="http://www.roblox.com/asset/?id=4498830417",Up="http://www.roblox.com/asset/?id=4498831746"},
    ["Black Cloudy Rain"] = {Bk="http://www.roblox.com/asset/?id=149679669",Dn="http://www.roblox.com/asset/?id=149681979",Ft="http://www.roblox.com/asset/?id=149679690",Lf="http://www.roblox.com/asset/?id=149679709",Rt="http://www.roblox.com/asset/?id=149679722",Up="http://www.roblox.com/asset/?id=149680199"},
}
local SKYBOX_NAMES = {}
for name in pairs(SKYBOX_ASSETS) do table.insert(SKYBOX_NAMES, name) end
table.sort(SKYBOX_NAMES)
table.insert(SKYBOX_NAMES, 1, "Default")
local function setSky(name)
    if skyInstance then
        skyInstance:Destroy()
        skyInstance = nil
    end
    if name == "Default" then return end
    local ids = SKYBOX_ASSETS[name]
    if not ids then return end
    skyInstance = Instance.new("Sky")
    skyInstance.SkyboxBk = ids.Bk
    skyInstance.SkyboxDn = ids.Dn
    skyInstance.SkyboxFt = ids.Ft
    skyInstance.SkyboxLf = ids.Lf
    skyInstance.SkyboxRt = ids.Rt
    skyInstance.SkyboxUp = ids.Up
    skyInstance.Parent = Lighting
end
-- ========== GUN MODS ==========
local GunMods = {}
GunMods.__index = GunMods
GunMods.Options = {
    NoRecoil = false,
}
GunMods.OriginalGunRecoil = nil
GunMods.GunRecoilHooked = false
local function findGunRecoil()
    for a, b in getgc(true) do
        if typeof(b) == "function" and islclosure(b) then
            local c = debug.getinfo(b)
            if c and c.name == "GunRecoil" then return b end
        end
    end
    return nil
end
function GunMods:ApplyNoRecoil()
    if self.Options.NoRecoil then
        if not self.GunRecoilHooked then
            local recoilFunc = findGunRecoil()
            if recoilFunc then
                self.OriginalGunRecoil = recoilFunc
                hookfunction(recoilFunc, function() end)
                self.GunRecoilHooked = true
            end
        end
    end
end
function GunMods:RemoveNoRecoil()
    self.GunRecoilHooked = false
    self.OriginalGunRecoil = nil
end
function GunMods:ToggleNoRecoil(enabled)
    self.Options.NoRecoil = enabled
    if enabled then self:ApplyNoRecoil() else self:RemoveNoRecoil() end
end
-- ========== UI ==========
local Window = Library:CreateWindow({
    Title = "VOMAGLA",
    Footer = "Vagrant Survival 0.9",
    Icon = 132584846334580,
    NotifySide = "Right",
    ShowCustomCursor = false,
    CornerRadius = 10,
    BackgroundImage = "rbxassetid://7429108227",
    Animations = {
        ToggleWindow = false,
        TabSwitch = true,
        Groupbox = true,
        Dropdown = true,
        KeyPicker = true,
    },
    TabTransitionTime = 0.22,
    TabSwipeOffset = 26,
    TabSwipeFrom = "bottom",
})
-- ФИКС: элементы застревают в transparency=1 — безопасный детектор (только наши гуи)
do
    local LibraryGui = nil
    task_spawn(function()
        task_wait(1)
        for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
            if gui:IsA("ScreenGui") then
                local found = false
                for _, d in ipairs(gui:GetDescendants()) do
                    if d:IsA("TextLabel") and d.Text == "VOMAGLA" then
                        found = true
                        break
                    end
                end
                if found then
                    LibraryGui = gui
                    break
                end
            end
        end
    end)
    local fixAcc = 0
    local fixConn = RunService.RenderStepped:Connect(function(dt)
        if LibraryUnloaded then
            if fixConn then fixConn:Disconnect() end
            return
        end
        if not LibraryGui or not LibraryGui.Parent then return end
        if not LibraryGui.Enabled then return end
        fixAcc = fixAcc + dt
        if fixAcc < 0.5 then return end
        fixAcc = 0
        local total, stuck = 0, 0
        for _, d in ipairs(LibraryGui:GetDescendants()) do
            if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
                total = total + 1
                if d.TextTransparency >= 0.99 then
                    stuck = stuck + 1
                end
            elseif d:IsA("Frame") or d:IsA("ScrollingFrame") then
                total = total + 1
                if d.BackgroundTransparency >= 0.99 then
                    stuck = stuck + 1
                end
            end
        end
        if total > 10 and stuck > total * 0.7 then
            pcall(function()
                Window:Toggle(false)
                task_wait(0.1)
                Window:Toggle(true)
            end)
        end
    end)
end
local menuClosedOnSpawn = false
LocalPlayer.CharacterAdded:Connect(function()
    task_delay(1, function()
        if menuClosedOnSpawn or LibraryUnloaded then return end
        menuClosedOnSpawn = true
        pcall(function()
            Window:Toggle(false)
        end)
    end)
end)
local Tabs = {
    Visual = Window:AddTab("Visual", "eye"),
    Combat = Window:AddTab("Combat", "swords"),
    Movement = Window:AddTab("Movement", "wind"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}
-- ========== VISUAL TAB ==========
do
    local VisualGroup = Tabs.Visual:AddLeftGroupbox("ESP", "eye")
    VisualGroup:AddToggle("ESPEnabled", {
        Text = "Enable ESP",
        Tooltip = "Включить/выключить ESP",
        Default = false,
        Callback = function(Value) ESP.Enabled = Value end,
    })
    local ESPColorToggle = VisualGroup:AddToggle("ESPColorBase", {
        Text = "ESP Color",
        Default = false,
        Callback = function(Value) end,
    })
    ESPColorToggle:AddColorPicker("ESPColor", {
        Default = ESP.Color,
        Title = "ESP Color",
        Callback = function(Value)
            ESP.Color = Value
            ESP_RefreshColors()
        end,
    })
    VisualGroup:AddToggle("ESPBoxes", {
        Text = "Box ESP (corners)",
        Tooltip = "Угловые боксы",
        Default = true,
        Callback = function(Value) ESP.Boxes = Value end,
    })
    VisualGroup:AddToggle("ESPName", {
        Text = "Name ESP",
        Tooltip = "Показывать имена",
        Default = true,
        Callback = function(Value) ESP.Name = Value end,
    })
    VisualGroup:AddToggle("ESPDistance", {
        Text = "Distance ESP",
        Tooltip = "Показывать дистанцию",
        Default = true,
        Callback = function(Value) ESP.Distance = Value end,
    })
    VisualGroup:AddToggle("ESPHealthText", {
        Text = "HP Text",
        Tooltip = "Цифра хп слева от бокса",
        Default = true,
        Callback = function(Value) ESP.HealthText = Value end,
    })
    VisualGroup:AddToggle("ESPChams", {
        Text = "Chams",
        Tooltip = "Подсветка игроков через стены",
        Default = false,
        Callback = function(Value) ESP.Chams = Value end,
    })
    local CrosshairGroup = Tabs.Visual:AddLeftGroupbox("Crosshair", "crosshair")
    CrosshairGroup:AddToggle("CrosshairEnabled", {
        Text = "Enable Crosshair",
        Tooltip = "Кастомный прицел в центре экрана",
        Default = false,
        Callback = function(Value) Crosshair.Enabled = Value end,
    })
    local CrosshairColorToggle = CrosshairGroup:AddToggle("CrosshairColorBase", {
        Text = "Custom Color",
        Default = false,
        Callback = function(Value) end,
    })
    CrosshairColorToggle:AddColorPicker("CrosshairColor", {
        Default = Crosshair.Color,
        Title = "Crosshair Color",
        Callback = function(Value) Crosshair.Color = Value end,
    })
    CrosshairGroup:AddToggle("CrosshairRainbow", {
        Text = "Rainbow",
        Tooltip = "Радужный прицел",
        Default = false,
        Callback = function(Value) Crosshair.Rainbow = Value end,
    })
    CrosshairGroup:AddToggle("CrosshairPulse", {
        Text = "Pulse",
        Tooltip = "Пульсация прицела",
        Default = false,
        Callback = function(Value) Crosshair.Pulse = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairPulseSpeed", {
        Text = "Pulse Speed",
        Default = 3,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) Crosshair.PulseSpeed = Value end,
    })
    CrosshairGroup:AddToggle("CrosshairFollowTarget", {
        Text = "Follow Silent Aim Target",
        Tooltip = "Прицел плавно перекидывается на игрока, по которому таргетится Silent Aim",
        Default = false,
        Callback = function(Value) Crosshair.FollowTarget = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairFollowSmooth", {
        Text = "Follow Smoothness",
        Default = 8,
        Min = 1,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Tooltip = "Чем выше — тем быстрее прицел догоняет таргета",
        Callback = function(Value) Crosshair.FollowSmooth = Value end,
    })
    CrosshairGroup:AddToggle("CrosshairDot", {
        Text = "Dot",
        Tooltip = "Точка в центре прицела",
        Default = false,
        Callback = function(Value) Crosshair.Dot = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairRotationSpeed", {
        Text = "Rotation Speed",
        Default = 0,
        Min = 0,
        Max = 360,
        Rounding = 0,
        Compact = false,
        Tooltip = "0 — статичный, 360 — полный оборот в секунду",
        Callback = function(Value) Crosshair.RotationSpeed = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairLength", {
        Text = "Length",
        Default = 8,
        Min = 2,
        Max = 30,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) Crosshair.Length = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairGap", {
        Text = "Gap",
        Default = 4,
        Min = 0,
        Max = 30,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) Crosshair.Gap = Value end,
    })
    CrosshairGroup:AddSlider("CrosshairThickness", {
        Text = "Thickness",
        Default = 1.5,
        Min = 1,
        Max = 4,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) Crosshair.Thickness = Value end,
    })
    local CustomGroup = Tabs.Visual:AddRightGroupbox("Custom Avatar", "user")
    local BodyToggle = CustomGroup:AddToggle("CustomBody", {
        Text = "Custom Avatar",
        Tooltip = "Кастом материал на весь аватар",
        Default = false,
        Callback = function(Value) CUSTOM.BodyEnabled = Value end,
    })
    BodyToggle:AddColorPicker("BodyColor", {
        Default = CUSTOM.BodyColor,
        Title = "Avatar Color",
        Callback = function(Value) CUSTOM.BodyColor = Value end,
    })
    CustomGroup:AddDropdown("BodyMaterial", {
        Text = "Avatar Material",
        Values = { "ForceField", "Glass", "Neon", "Plastic", "SmoothPlastic", "Metal", "Wood", "Slate", "Concrete", "Ice" },
        Default = "ForceField",
        Callback = function(Value) CUSTOM.BodyMaterial = Value end,
    })
    local CamFovGroup = Tabs.Visual:AddRightGroupbox("Camera FOV", "camera")
    CamFovGroup:AddToggle("CamFovEnabled", {
        Text = "Enable FOV Changer",
        Tooltip = "Менять поле зрения камеры",
        Default = false,
        Callback = function(Value) CamFOV.Enabled = Value end,
    })
    CamFovGroup:AddSlider("CamFovValue", {
        Text = "Camera FOV",
        Default = 70,
        Min = 40,
        Max = 120,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) CamFOV.Value = Value end,
    })
    local WorldGroup = Tabs.Visual:AddRightGroupbox("World", "globe")
    WorldGroup:AddToggle("NoFog", {
        Text = "No Fog",
        Tooltip = "Убрать туман",
        Default = false,
        Callback = function(Value)
            World.NoFog = Value
            setNoFog(Value)
        end,
    })
    WorldGroup:AddToggle("Fullbright", {
        Text = "Fullbright",
        Tooltip = "Полная яркость",
        Default = false,
        Callback = function(Value)
            World.Fullbright = Value
            setFullbright(Value)
        end,
    })
    WorldGroup:AddDropdown("SkyboxChanger", {
        Text = "Skybox",
        Values = SKYBOX_NAMES,
        Default = "Default",
        Callback = function(Value)
            World.Sky = Value
            setSky(Value)
        end,
    })
end
-- ========== COMBAT TAB ==========
do
    local CombatGroup = Tabs.Combat:AddLeftGroupbox("Silent Aim")
    CombatGroup:AddToggle("SilentAimEnabled", {
        Text = "Enable Silent Aim",
        Tooltip = "Включить/выключить Silent Aim",
        Default = false,
        Callback = function(Value)
            SilentAim.Options.Enabled = Value
            if Value then SilentAim:Start() else SilentAim:Stop() end
        end,
    })
    CombatGroup:AddToggle("SilentAimWallCheck", {
        Text = "Wall Check",
        Tooltip = "Не целиться через стены",
        Default = false,
        Callback = function(Value) SilentAim.Options.WallCheck = Value end,
    })
    CombatGroup:AddDropdown("SilentAimTargetPart", {
        Text = "Target Part",
        Values = { "Head", "HumanoidRootPart" },
        Default = "HumanoidRootPart",
        Callback = function(Value) SilentAim.Settings.TargetPart = Value end,
    })
    CombatGroup:AddDropdown("SilentAimPriority", {
        Text = "Priority",
        Values = { "Crosshair", "Distance" },
        Default = "Crosshair",
        Callback = function(Value) SilentAim.Options.Priority = Value end,
    })
    CombatGroup:AddSlider("SilentAimPredict", {
        Text = "Predict (sec)",
        Default = 0.15,
        Min = 0.1,
        Max = 0.3,
        Rounding = 2,
        Compact = false,
        Tooltip = "Упреждение по скорости цели в секундах",
        Callback = function(Value) SilentAim.Settings.Predict = Value end,
    })
    CombatGroup:AddDropdown("SilentAimFOVAnchor", {
        Text = "FOV Anchor",
        Values = { "Screen Center", "Cursor" },
        Default = "Screen Center",
        Tooltip = "К чему привязан поиск цели и круг FOV",
        Callback = function(Value)
            SilentAim.Options.FOVAnchor = Value
            updateFOVCircle()
        end,
    })
    local UseFOVToggle = CombatGroup:AddToggle("SilentAimUseFOV", {
        Text = "Use FOV",
        Tooltip = "Ограничить радиус действия",
        Default = false,
        Callback = function(Value)
            SilentAim.Options.UseFOV = Value
            updateFOVCircle()
        end,
    })
    UseFOVToggle:AddColorPicker("FOVColorNoTarget", {
        Default = SilentAim.Colors.FOVColorNoTarget,
        Title = "No Target Color",
        Callback = function(Value)
            SilentAim.Colors.FOVColorNoTarget = Value
            updateFOVCircle()
        end,
    })
    UseFOVToggle:AddColorPicker("FOVColorOnTarget", {
        Default = SilentAim.Colors.FOVColorOnTarget,
        Title = "On Target Color",
        Callback = function(Value)
            SilentAim.Colors.FOVColorOnTarget = Value
            updateFOVCircle()
        end,
    })
    CombatGroup:AddSlider("SilentAimFOVRadius", {
        Text = "FOV Radius",
        Default = 150,
        Min = 50,
        Max = 800,
        Rounding = 0,
        Compact = false,
        Callback = function(Value)
            SilentAim.Settings.FOVRadius = Value
            SilentAim.Settings.FOVRadiusSq = Value * Value
            updateFOVCircle()
        end,
    })
    CombatGroup:AddSlider("SilentAimFOVThickness", {
        Text = "FOV Thickness",
        Default = 1.5,
        Min = 1,
        Max = 3,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            SilentAim.Settings.FOVThickness = Value
            updateFOVCircle()
        end,
    })
    CombatGroup:AddSlider("SilentAimMaxDistance", {
        Text = "Max Distance",
        Default = 500,
        Min = 50,
        Max = 5000,
        Rounding = 0,
        Compact = false,
        Callback = function(Value)
            SilentAim.Settings.MaxDistance = Value
            SilentAim.Settings.MaxDistanceSq = Value * Value
        end,
    })
    local SnaplineToggle = CombatGroup:AddToggle("SilentAimSnapline", {
        Text = "Snapline",
        Tooltip = "Линия к цели",
        Default = false,
        Callback = function(Value) SilentAim.Options.Snapline = Value end,
    })
    SnaplineToggle:AddColorPicker("SnaplineColor", {
        Default = SilentAim.Colors.SnaplineColor,
        Title = "Snapline Color",
        Callback = function(Value) SilentAim.Colors.SnaplineColor = Value end,
    })
    CombatGroup:AddSlider("SnaplineThickness", {
        Text = "Snapline Thickness",
        Default = 2,
        Min = 1,
        Max = 2.5,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) SilentAim.Settings.SnaplineThickness = Value end,
    })
    CombatGroup:AddToggle("SilentAimTargetHUD", {
        Text = "Target HUD",
        Tooltip = "Показывать информацию о цели",
        Default = false,
        Callback = function(Value) SilentAim.Options.TargetHUD = Value end,
    })
    local HitSoundGroup = Tabs.Combat:AddRightGroupbox("Hit Sound", "music")
    HitSoundGroup:AddToggle("HitSoundEnabled", {
        Text = "Enable Hit Sound",
        Tooltip = "Звук при попадании по игроку",
        Default = false,
        Callback = function(Value) HS.Enabled = Value end,
    })
    HitSoundGroup:AddDropdown("HitSoundSound", {
        Text = "Sound",
        Values = HIT_SOUND_NAMES,
        Default = "Bameware",
        Callback = function(Value)
            HS.Sound = Value
            pcall(function() hitSound.SoundId = HIT_SOUNDS[Value] end)
        end,
    })
    HitSoundGroup:AddSlider("HitSoundVolume", {
        Text = "Volume",
        Default = 1,
        Min = 0.1,
        Max = 3,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            HS.Volume = Value
            hitSound.Volume = Value
        end,
    })
    local KillSoundGroup = Tabs.Combat:AddRightGroupbox("Kill Sound", "volume-2")
    KillSoundGroup:AddToggle("KillSoundEnabled", {
        Text = "Enable Kill Sound",
        Tooltip = "Рандомный звук из 4 при убийстве. 2+ килла за 10 сек — отдельный звук",
        Default = false,
        Callback = function(Value) KS.Enabled = Value end,
    })
    KillSoundGroup:AddSlider("KillSoundVolume", {
        Text = "Volume",
        Default = 1,
        Min = 0.1,
        Max = 3,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) KS.Volume = Value end,
    })
    local HitMarkerGroup = Tabs.Combat:AddRightGroupbox("Hit Marker (3D)", "crosshair")
    HitMarkerGroup:AddToggle("HitMarkerEnabled", {
        Text = "Enable Hit Marker",
        Tooltip = "3D X-маркер в точке попадания. Любой урон любому игроку",
        Default = false,
        Callback = function(Value) HM.Enabled = Value end,
    })
    local HMColorToggle = HitMarkerGroup:AddToggle("HMColorBase", {
        Text = "Custom Colors",
        Default = false,
        Callback = function(Value) end,
    })
    HMColorToggle:AddColorPicker("HitMarkerColor", {
        Default = HM.Color,
        Title = "Hit Color",
        Callback = function(Value) HM.Color = Value end,
    })
    HMColorToggle:AddColorPicker("HitMarkerKillColor", {
        Default = HM.KillColor,
        Title = "Kill Color",
        Callback = function(Value) HM.KillColor = Value end,
    })
    HitMarkerGroup:AddSlider("HitMarkerSize", {
        Text = "Size",
        Default = 12,
        Min = 5,
        Max = 60,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) HM.Size = Value end,
    })
    HitMarkerGroup:AddSlider("HitMarkerThickness", {
        Text = "Thickness",
        Default = 2,
        Min = 1,
        Max = 6,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) HM.Thickness = Value end,
    })
    HitMarkerGroup:AddSlider("HitMarkerDuration", {
        Text = "Duration (sec)",
        Default = 3,
        Min = 0.3,
        Max = 6,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) HM.Duration = Value end,
    })
    local HitLogsGroup = Tabs.Combat:AddRightGroupbox("Hit Logs", "scroll-text")
    HitLogsGroup:AddToggle("HitLogsEnabled", {
        Text = "Enable Hit Logs",
        Tooltip = "Лог: Hit {имя} in the {часть} for {урон} damage ({hp} health remaining)",
        Default = false,
        Callback = function(Value) HL.Enabled = Value end,
    })
    local HLColorToggle = HitLogsGroup:AddToggle("HLColorBase", {
        Text = "Accent Color",
        Default = false,
        Callback = function(Value) end,
    })
    HLColorToggle:AddColorPicker("HitLogColor", {
        Default = HL.Color,
        Title = "Accent Color",
        Callback = function(Value) HL.Color = Value end,
    })
    HitLogsGroup:AddDropdown("HitLogPosition", {
        Text = "Position",
        Values = { "Center", "Left", "Top", "Top left" },
        Default = "Center",
        Tooltip = "Где показывать хит-логи",
        Callback = function(Value)
            HL.Position = Value
            updateHitLogPosition()
        end,
    })
    HitLogsGroup:AddSlider("HitLogDuration", {
        Text = "Log duration",
        Default = 5,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) HL.Duration = Value end,
    })
    HitLogsGroup:AddButton({
        Text = "Test hitlog",
        Tooltip = "Показать тестовый хит-лог",
        Func = function()
            showHitLog(buildHitLogText("test_player", SilentAim.Settings.TargetPart, 42, 58), HL.Duration)
        end,
    })
    local ParticlesGroup = Tabs.Combat:AddRightGroupbox("Damage Particles", "sparkles")
    ParticlesGroup:AddToggle("ParticlesEnabled", {
        Text = "Enable Particles",
        Tooltip = "Эффект при ЛЮБОМ уроне игроку — тот же триггер что хитмаркер",
        Default = false,
        Callback = function(Value) DamageFX.Enabled = Value end,
    })
    ParticlesGroup:AddDropdown("ParticlesStyle", {
        Text = "Effect Style",
        Values = DAMAGE_STYLES,
        Default = "Balls",
        Tooltip = "Balls / Foam / Crescents / Residue / Electric / Hit Chams / Skeleton",
        Callback = function(Value) DamageFX.Style = Value end,
    })
    local PColorToggle = ParticlesGroup:AddToggle("PColorBase", {
        Text = "Custom Color",
        Default = false,
        Callback = function(Value) end,
    })
    PColorToggle:AddColorPicker("ParticleColor", {
        Default = DamageFX.Color,
        Title = "Particle Color",
        Callback = function(Value) DamageFX.Color = Value end,
    })
    ParticlesGroup:AddToggle("ParticlesRainbow", {
        Text = "Rainbow (Balls)",
        Default = false,
        Callback = function(Value) DamageFX.Rainbow = Value end,
    })
    ParticlesGroup:AddSlider("ParticlesCount", {
        Text = "Count / Emit",
        Default = 12,
        Min = 3,
        Max = 60,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DamageFX.Count = Value end,
    })
    ParticlesGroup:AddSlider("ParticlesSpeed", {
        Text = "Speed (Balls)",
        Default = 20,
        Min = 5,
        Max = 50,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DamageFX.Speed = Value end,
    })
    ParticlesGroup:AddSlider("ParticlesSize", {
        Text = "Size (Balls)",
        Default = 0.25,
        Min = 0.05,
        Max = 0.5,
        Rounding = 2,
        Compact = false,
        Callback = function(Value) DamageFX.Size = Value end,
    })
    ParticlesGroup:AddSlider("ParticlesLifetime", {
        Text = "Lifetime (sec)",
        Default = 0.8,
        Min = 0.3,
        Max = 3,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) DamageFX.Lifetime = Value end,
    })
    local KillGroup = Tabs.Combat:AddRightGroupbox("Kill Particles", "skull")
    KillGroup:AddToggle("KillFXEnabled", {
        Text = "Enable Kill Particles",
        Tooltip = "Взрыв на смерти любого врага: шары + звёзды + блики + лучи",
        Default = false,
        Callback = function(Value) KE.Enabled = Value end,
    })
    local KColorToggle = KillGroup:AddToggle("KColorBase", {
        Text = "Main Color",
        Default = false,
        Callback = function(Value) end,
    })
    KColorToggle:AddColorPicker("KillMainColor", {
        Default = KE.MainColor,
        Title = "Main Color",
        Callback = function(Value) KE.MainColor = Value end,
    })
    local KBrightToggle = KillGroup:AddToggle("KBrightBase", {
        Text = "Secondary Color",
        Tooltip = "30% шаров красятся во второй цвет",
        Default = false,
        Callback = function(Value)
            KE.UseBright = Value
            if not Value then KE.BrightColor = KE.MainColor end
        end,
    })
    KBrightToggle:AddColorPicker("KillBrightColor", {
        Default = KE.BrightColor,
        Title = "Secondary Color",
        Callback = function(Value)
            if KE.UseBright then KE.BrightColor = Value end
        end,
    })
    KillGroup:AddSlider("KillCount", {
        Text = "Ball count",
        Default = 40,
        Min = 5,
        Max = 80,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.ParticleCount = Value end,
    })
    KillGroup:AddSlider("KillSpeed", {
        Text = "Ball speed",
        Default = 35,
        Min = 5,
        Max = 80,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.ParticleSpeed = Value end,
    })
    KillGroup:AddSlider("KillLifetime", {
        Text = "Ball lifetime (sec)",
        Default = 0.7,
        Min = 0.1,
        Max = 2,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) KE.ParticleLifetime = Value end,
    })
    KillGroup:AddSlider("KillRayCount", {
        Text = "Ray count",
        Default = 10,
        Min = 0,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.RayCount = Value end,
    })
    KillGroup:AddSlider("KillRayLength", {
        Text = "Ray length",
        Default = 6,
        Min = 1,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.RayLength = Value end,
    })
    KillGroup:AddSlider("KillSparkleCount", {
        Text = "Sparkle count",
        Default = 8,
        Min = 0,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.SparkleCount = Value end,
    })
    KillGroup:AddSlider("KillStarCount", {
        Text = "Star count",
        Default = 20,
        Min = 0,
        Max = 50,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) KE.StarCount = Value end,
    })
    KillGroup:AddButton({
        Text = "Test kill effect",
        Tooltip = "Взрыв на ближайшем игроке",
        Func = function()
            local closest, dist = nil, math.huge
            local camPos = Workspace.CurrentCamera and Workspace.CurrentCamera.CFrame.Position
            if not camPos then return end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Head")
                    if hrp then
                        local d = (hrp.Position - camPos).Magnitude
                        if d < dist then
                            dist = d
                            closest = plr
                        end
                    end
                end
            end
            if closest and closest.Character then
                local root = closest.Character:FindFirstChild("HumanoidRootPart") or closest.Character:FindFirstChild("Head")
                if root then
                    local was = KE.Enabled
                    KE.Enabled = true
                    ke_createEffect(root.Position + Vector3.new(0, 2, 0))
                    KE.Enabled = was
                    Library:Notify("Kill effect test on " .. closest.DisplayName, 2)
                end
            else
                Library:Notify("No players found", 2)
            end
        end,
    })
    local DeathGroup = Tabs.Combat:AddRightGroupbox("Death Effect", "ghost")
    DeathGroup:AddToggle("DeathFXEnabled", {
        Text = "Enable Death Effect",
        Tooltip = "Взрыв на ЛЮБОЙ смерти, включая свою",
        Default = false,
        Callback = function(Value) DE.Enabled = Value end,
    })
    local DColorToggle = DeathGroup:AddToggle("DColorBase", {
        Text = "Main Color",
        Default = false,
        Callback = function(Value) end,
    })
    DColorToggle:AddColorPicker("DeathMainColor", {
        Default = DE.MainColor,
        Title = "Main Color",
        Callback = function(Value) DE.MainColor = Value end,
    })
    local DBrightToggle = DeathGroup:AddToggle("DBrightBase", {
        Text = "Secondary Color",
        Default = false,
        Callback = function(Value)
            DE.UseBright = Value
            if not Value then DE.BrightColor = DE.MainColor end
        end,
    })
    DBrightToggle:AddColorPicker("DeathBrightColor", {
        Default = DE.BrightColor,
        Title = "Secondary Color",
        Callback = function(Value)
            if DE.UseBright then DE.BrightColor = Value end
        end,
    })
    DeathGroup:AddToggle("DeathAffectSelf", {
        Text = "Affect Self",
        Tooltip = "Эффект на твоей смерти",
        Default = true,
        Callback = function(Value) DE.AffectSelf = Value end,
    })
    DeathGroup:AddToggle("DeathAffectOthers", {
        Text = "Affect Others",
        Tooltip = "Эффект на смертях других игроков",
        Default = true,
        Callback = function(Value) DE.AffectOthers = Value end,
    })
    DeathGroup:AddSlider("DeathCount", {
        Text = "Ball count",
        Default = 40,
        Min = 5,
        Max = 80,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.ParticleCount = Value end,
    })
    DeathGroup:AddSlider("DeathSpeed", {
        Text = "Ball speed",
        Default = 35,
        Min = 5,
        Max = 80,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.ParticleSpeed = Value end,
    })
    DeathGroup:AddSlider("DeathLifetime", {
        Text = "Ball lifetime (sec)",
        Default = 0.7,
        Min = 0.1,
        Max = 2,
        Rounding = 1,
        Compact = false,
        Callback = function(Value) DE.ParticleLifetime = Value end,
    })
    DeathGroup:AddSlider("DeathRayCount", {
        Text = "Ray count",
        Default = 10,
        Min = 0,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.RayCount = Value end,
    })
    DeathGroup:AddSlider("DeathRayLength", {
        Text = "Ray length",
        Default = 6,
        Min = 1,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.RayLength = Value end,
    })
    DeathGroup:AddSlider("DeathSparkleCount", {
        Text = "Sparkle count",
        Default = 8,
        Min = 0,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.SparkleCount = Value end,
    })
    DeathGroup:AddSlider("DeathStarCount", {
        Text = "Star count",
        Default = 20,
        Min = 0,
        Max = 50,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) DE.StarCount = Value end,
    })
    DeathGroup:AddButton({
        Text = "Test death effect",
        Tooltip = "Взрыв на себе",
        Func = function()
            local char = cachedChar
            if char then
                local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("Head")
                if root then
                    local was = DE.Enabled
                    DE.Enabled = true
                    de_createEffect(root.Position)
                    DE.Enabled = was
                end
            end
        end,
    })
    local GunModsGroup = Tabs.Combat:AddRightGroupbox("Gun Mods")
    GunModsGroup:AddToggle("GunModsNoRecoil", {
        Text = "No Recoil",
        Tooltip = "Убрать отдачу",
        Default = false,
        Callback = function(Value) GunMods:ToggleNoRecoil(Value) end,
    })
end
-- ========== MOVEMENT TAB ==========
do
    local SpeedGroup = Tabs.Movement:AddLeftGroupbox("Speed", "wind")
    SpeedGroup:AddToggle("SpeedEnabled", {
        Text = "Enable Speed",
        Tooltip = "Ускорение (Translate, античит-безопасно)",
        Default = false,
        Callback = function(Value) MV.SpeedEnabled = Value end,
    })
    SpeedGroup:AddSlider("SpeedValue", {
        Text = "Speed",
        Default = 16,
        Min = 5,
        Max = 20,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) MV.SpeedValue = Value end,
    })
    local JumpGroup = Tabs.Movement:AddLeftGroupbox("Jump", "arrow-up")
    JumpGroup:AddToggle("JumpEnabled", {
        Text = "Jump Boost",
        Tooltip = "Усиленный прыжок",
        Default = false,
        Callback = function(Value)
            MV.JumpEnabled = Value
            if not Value and cachedHumanoid then
                cachedHumanoid.UseJumpPower = true
                cachedHumanoid.JumpPower = 50
            end
        end,
    })
    JumpGroup:AddSlider("JumpValue", {
        Text = "Jump Power",
        Default = 50,
        Min = 50,
        Max = 78,
        Rounding = 0,
        Compact = false,
        Callback = function(Value) MV.JumpValue = Value end,
    })
    local ProtectGroup = Tabs.Movement:AddRightGroupbox("Utility", "shield")
    ProtectGroup:AddToggle("NoFallDamage", {
        Text = "Anti Fall Damage",
        Tooltip = "Кап скорости падения на -35",
        Default = false,
        Callback = function(Value) MV.NoFall = Value end,
    })
    ProtectGroup:AddToggle("FastInteract", {
        Text = "Fast Interact",
        Tooltip = "Мгновенное взаимодействие — HoldDuration 0 на всех ProximityPrompt",
        Default = false,
        Callback = function(Value) setFastInteract(Value) end,
    })
end
-- ========== UI SETTINGS ==========
do
    local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "Open Keybind Menu",
        Callback = function(value)
            Library.KeybindFrame.Visible = value
        end,
    })
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "Custom Cursor",
        Default = false,
        Callback = function(Value)
            Library.ShowCustomCursor = Value
        end,
    })
    MenuGroup:AddDropdown("NotificationSide", {
        Values = { "Left", "Right" },
        Default = "Right",
        Text = "Notification Side",
        Callback = function(Value)
            Library:SetNotifySide(Value)
        end,
    })
    MenuGroup:AddDropdown("DPIDropdown", {
        Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
        Default = "100%",
        Text = "DPI Scale",
        Callback = function(Value)
            Value = Value:gsub("%%", "")
            local DPI = tonumber(Value)
            Library:SetDPIScale(DPI)
        end,
    })
    MenuGroup:AddDivider()
    MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
        Default = "End",
        NoUI = true,
        Text = "Menu keybind",
    })
    MenuGroup:AddButton("Unload", function()
        Library:Unload()
    end)
    Library.ToggleKeybind = Options.MenuKeybind
end
-- ========== UNLOAD ==========
Library:OnUnload(function()
    getgenv().__VOMAGLA_LOADED = nil
    LibraryUnloaded = true
    SilentAim:Stop()
    pcall(function() RunService:UnbindFromRenderStep("VOMAGLA_EspLoop") end)
    if chConnection then chConnection:Disconnect() end
    if customConnection then customConnection:Disconnect() end
    if mvConnection then mvConnection:Disconnect() end
    if camFovConnection then camFovConnection:Disconnect() end
    local cam = Workspace.CurrentCamera
    if cam and savedCameraFOV then cam.FieldOfView = savedCameraFOV end
    if cachedHumanoid then
        cachedHumanoid.UseJumpPower = true
        cachedHumanoid.JumpPower = 50
    end
    setFastInteract(false)
    setNoFog(false)
    setFullbright(false)
    setSky("Default")
end)
-- ========== ADDONS ==========
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("VOMAGLA")
SaveManager:SetFolder("VOMAGLA/VagrantSurvival")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
-- РЕГИСТРАЦИЯ АКТИВНОГО ЗАПУСКА
getgenv().__VOMAGLA_LOADED = Library
