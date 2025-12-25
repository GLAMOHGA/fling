--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
if game.CoreGui:FindFirstChild("MAS_UMA") then
    game.CoreGui.MAS_UMA:Destroy()
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MAS_UMA"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,420,0,300) -- Увеличил высоту на 40px
main.Position = UDim2.new(0.5,-210,0.5,-150)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Закругленные углы
local uICorner = Instance.new("UICorner", main)
uICorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,5)
title.BackgroundTransparency = 1
title.Text = "MAS UMA RACING"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(0,170,255)

local function MakeBtn(text,y)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1,-40,0,36)
    b.Position = UDim2.new(0,20,0,y)
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.Text = text
    
    -- Закругленные углы для кнопки
    local btnCorner = Instance.new("UICorner", b)
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    return b
end

local Easy = false
local EasyBtn = MakeBtn("Easy Control : OFF",50)
EasyBtn.MouseButton1Click:Connect(function()
    Easy = not Easy
    EasyBtn.Text = "Easy Control : "..(Easy and "ON" or "OFF")
end)

-- Кнопка для включения/выключения скорости
local SpeedOn = true
local SpeedToggleBtn = MakeBtn("Speed : ON", 95)
SpeedToggleBtn.MouseButton1Click:Connect(function()
    SpeedOn = not SpeedOn
    SpeedToggleBtn.Text = "Speed : "..(SpeedOn and "ON" or "OFF")
end)

local StamBtn = MakeBtn("Infinity Stamina : OFF",140)

local Speed = 1

local speedText = Instance.new("TextLabel", main)
speedText.Size = UDim2.new(1,-40,0,30)
speedText.Position = UDim2.new(0,20,0,185)
speedText.BackgroundTransparency = 1
speedText.Text = "Velocity Multiplier : x1"
speedText.TextColor3 = Color3.fromRGB(200,200,200)
speedText.Font = Enum.Font.GothamBold
speedText.TextScaled = true

local bar = Instance.new("Frame", main)
bar.Size = UDim2.new(1,-40,0,6)
bar.Position = UDim2.new(0,20,0,220)
bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
bar.BorderSizePixel = 0

-- Закругленные углы для полосы
local barCorner = Instance.new("UICorner", bar)
barCorner.CornerRadius = UDim.new(0, 3)

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0.05,0,1,0) -- 1/20 = 0.05 для максимального значения 20
fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
fill.BorderSizePixel = 0

-- Закругленные углы для заполнения
local fillCorner = Instance.new("UICorner", fill)
fillCorner.CornerRadius = UDim.new(0, 3)

bar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local x = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
        Speed = math.clamp(math.floor(x*10)+1,1,20) -- Максимум 20
        fill.Size = UDim2.new(Speed/10,0,1,0) -- Делим на 20
        speedText.Text = "Velocity Multiplier : x"..Speed
    end
end)

local telegramBtn = MakeBtn("Copy Telegram Link",245)
telegramBtn.TextColor3 = Color3.fromRGB(0,170,255)
telegramBtn.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/vomagla")
end)

RunService.RenderStepped:Connect(function()
    if not SpeedOn then return end
    local char = Player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hrp and hum and hum.MoveDirection.Magnitude > 0 then
        local mult = Easy and (20*Speed) or (30*Speed)
        hrp.Velocity = Vector3.new(
            hum.MoveDirection.X * mult,
            hrp.Velocity.Y,
            hum.MoveDirection.Z * mult
        )
    end
end)
