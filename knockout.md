--скрпит я спиздил добавил телепорт и удаление барьера а ты сын шлюзавхсч--

-- https://www.roblox.com/games/136764190843219/Knockout
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local w = lib:Window("Knockout!")

local UserInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local camera = workspace.CurrentCamera

local pushPower = 50

local function pushPlayer()
    local character = plr.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        local look = camera.CFrame.LookVector

        local horizontalDirection = Vector3.new(look.X, 0, look.Z).Unit
        
        hrp.AssemblyLinearVelocity = Vector3.new(
            horizontalDirection.X * pushPower,
            hrp.AssemblyLinearVelocity.Y,
            horizontalDirection.Z * pushPower
        )
    end
end

w:Button("Push", function ()
    pushPlayer()
end)
w:Box("Push Power", function(t)
    local num = tonumber(t)
    if num then
        pushPower = num
    end
end)
w:Label("https://t.me/vomagla", Color3.fromRGB(127, 143, 166))

-- Second window
local w2 = lib:Window("Other")

w2:Button("Teleport end Obby", function()
    local character = plr.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(-0.62, 15.88, 230.72)
    end
end)

w2:Button("Delete Barrier", function()
    for a,b in pairs(workspace.SpawnArea.Barriers:GetChildren()) do
        b:Destroy()
    end
    for a,b in pairs(workspace:GetDescendants()) do
        if b.Name == "SafetyBarrier" and (b.Position - Vector3.new(16, -6.2, -87.75)).Magnitude < 1 then
            b:Destroy()
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
        pushPlayer()
    end
end)


-- ▄▄▄▄▄▄▄   ▄▄▄   ▄▄▄             ▄▄▄▄  ▄▄▄▄   ▄▄▄▄▄   ▄▄▄      ▄▄▄   ▄▄▄▄    ▄▄▄▄▄▄▄  ▄▄▄        ▄▄▄▄   
-- ███▀▀███▄ ███   ███             ▀███  ███▀ ▄███████▄ ████▄  ▄████ ▄██▀▀██▄ ███▀▀▀▀▀  ███      ▄██▀▀██▄ 
-- ███▄▄███▀ ▀███▄███▀              ███  ███  ███   ███ ███▀████▀███ ███  ███ ███       ███      ███  ███ 
-- ███  ███▄   ▀███▀                ███▄▄███  ███▄▄▄███ ███  ▀▀  ███ ███▀▀███ ███  ███▀ ███      ███▀▀███ 
-- ████████▀    ███                  ▀████▀    ▀█████▀  ███      ███ ███  ███ ▀██████▀  ████████ ███  ███ 


--  /$$$$$$$  /$$     /$$                                     /$$    /$$  /$$$$$$  /$$      /$$  /$$$$$$   /$$$$$$  /$$        /$$$$$$ 
-- | $$__  $$|  $$   /$$/                                    | $$   | $$ /$$__  $$| $$$    /$$$ /$$__  $$ /$$__  $$| $$       /$$__  $$
-- | $$  \ $$ \  $$ /$$/                                     | $$   | $$| $$  \ $$| $$$$  /$$$$| $$  \ $$| $$  \__/| $$      | $$  \ $$
-- | $$$$$$$   \  $$$$/                                      |  $$ / $$/| $$  | $$| $$ $$/$$ $$| $$$$$$$$| $$ /$$$$| $$      | $$$$$$$$
-- | $$__  $$   \  $$/                                        \  $$ $$/ | $$  | $$| $$  $$$| $$| $$__  $$| $$|_  $$| $$      | $$__  $$
-- | $$  \ $$    | $$                                          \  $$$/  | $$  | $$| $$\  $ | $$| $$  | $$| $$  \ $$| $$      | $$  | $$
-- | $$$$$$$/    | $$                                           \  $/   |  $$$$$$/| $$ \/  | $$| $$  | $$|  $$$$$$/| $$$$$$$$| $$  | $$
-- |_______/     |__/                                            \_/     \______/ |__/     |__/|__/  |__/ \______/ |________/|__/  |__/
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
