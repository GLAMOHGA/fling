local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("2 player battle tycoon")

setclipboard("https://t.me/vomagla")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

getgenv().settings = {
    swing_aura = false,
    max_distance = 10,
    esp_enabled = false,
    speed_val = 0
}

local VisualPart = Instance.new("Part")
VisualPart.Name = "AuraVisualizer"
VisualPart.Shape = Enum.PartType.Cylinder
VisualPart.Material = Enum.Material.ForceField
VisualPart.Color = Color3.fromRGB(255, 0, 0)
VisualPart.Transparency = 0.5
VisualPart.Anchored = true
VisualPart.CanCollide = false
VisualPart.CastShadow = false
VisualPart.Parent = workspace
VisualPart.Position = Vector3.new(0, -1000, 0)

RunService.RenderStepped:Connect(function()
    if getgenv().settings.swing_aura and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        VisualPart.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90))
        VisualPart.Size = Vector3.new(0.5, getgenv().settings.max_distance * 2, getgenv().settings.max_distance * 2)
    else
        VisualPart.Position = Vector3.new(0, -1000, 0)
    end
end)

local CombatSection = PhantomForcesWindow:NewSection("Combat ")
local MovementSection = PhantomForcesWindow:NewSection("Movement ")
local VisualsSection = PhantomForcesWindow:NewSection("Visuals ")

CombatSection:CreateToggle("Enable Sword Aura", function(value)
    getgenv().settings.swing_aura = value
end)

CombatSection:CreateTextbox("Aura Distance", function(text)
    local new_distance = tonumber(text)
    if new_distance then
        getgenv().settings.max_distance = new_distance
    end
end)

task.spawn(function()
    while true do
        if getgenv().settings.swing_aura then
            local targets = {}
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and LocalPlayer.Character and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                    local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetRoot = v.Character:FindFirstChild("HumanoidRootPart")
                    
                    if myRoot and targetRoot then 
                        local distance = (targetRoot.Position - myRoot.Position).Magnitude
                        if distance < getgenv().settings.max_distance then
                            table.insert(targets, v.Character)
                        end
                    end
                end
            end

            for _, target_char in pairs(targets) do
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") and target_char:FindFirstChildWhichIsA("BasePart") then
                    if tool:FindFirstChild("Use") then
                        tool.Use:FireServer()
                    end
                    firetouchinterest(tool.Handle, target_char:FindFirstChildWhichIsA("BasePart"), 0)
                    firetouchinterest(tool.Handle, target_char:FindFirstChildWhichIsA("BasePart"), 1)
                end
            end
        end
        task.wait()
    end
end)

MovementSection:CreateTextbox("Speed Value", function(text)
    local num = tonumber(text)
    if num then
        getgenv().settings.speed_val = num
    end
end)

MovementSection:CreateButton("Fly / Noclip", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/fly.md", true))()
end)

MovementSection:CreateButton("Teleport Flag", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29.08, 48.87, -92.59)
    end
end)

local function UpdateESP()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local highlight = plr.Character:FindFirstChild("FelixHighlight")
            
            if getgenv().settings.esp_enabled then
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "FelixHighlight"
                    highlight.Adornee = plr.Character
                    highlight.Parent = plr.Character
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                end
                
                if plr.TeamColor then
                    highlight.FillColor = plr.TeamColor.Color
                    highlight.OutlineColor = plr.TeamColor.Color
                else
                    highlight.FillColor = Color3.new(1, 1, 1)
                    highlight.OutlineColor = Color3.new(1, 1, 1)
                end
            else
                if highlight then
                    highlight:Destroy()
                end
            end
        end
    end
end

VisualsSection:CreateToggle("ESP Players", function(value)
    getgenv().settings.esp_enabled = value
    UpdateESP()
end)

Players.PlayerAdded:Connect(function()
    task.wait(1)
    UpdateESP()
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().settings.esp_enabled then
            UpdateESP()
        end
    end
end)

RunService.Heartbeat:Connect(function()
    local chr = LocalPlayer.Character
    if chr then 
        local hum = chr:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 and getgenv().settings.speed_val > 0 then
            chr:TranslateBy(hum.MoveDirection * (getgenv().settings.speed_val * 0.2))
        end
    end
end)
