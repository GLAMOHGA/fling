local WindUI

do
    local ok, result = pcall(function()
        return require("./src/init")
    end)

    if ok then
        WindUI = result
    else
        WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    end
end

local Window = WindUI:CreateWindow({
    Title = "Build a tower with your friends",
    Author = "by https://t.me/vomagla",
    Folder = "ftgshub",
    NewElements = true,
    HideSearchBar = false,
    OpenButton = {
        Title = "Open Menu",
        CornerRadius = UDim.new(1,0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Color = ColorSequence.new(Color3.fromHex("#30FF6A"), Color3.fromHex("#e7ff2f")),
    },
    Transparency = 0.5,
    Size = UDim2.new(0, 450, 0, 350),
    MobileEnabled = true,
})

Window:SetToggleKey(Enum.KeyCode.RightShift)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local VirtualInput = game:GetService("VirtualInputManager")

local removePlayersFlag = false
local deletedCharacters = {}

local antiRagdollFlag = false
local nightModeFlag = false

local playerAddedConn
local characterAddedConn = {}

local function restoreDeletedCharacters()
    for plr, charClone in pairs(deletedCharacters) do
        if plr and not plr.Character and charClone then
            charClone.Parent = Workspace
        end
    end
    deletedCharacters = {}
end

local function deletePlayerCharacter(plr)
    if plr ~= LocalPlayer and plr.Character then
        deletedCharacters[plr] = plr.Character:Clone()
        plr.Character:Destroy()
    end
end

local function onCharacterAdded(plr, char)
    if removePlayersFlag then
        wait(0.05)
        if char and char.Parent then
            deletedCharacters[plr] = char:Clone()
            char:Destroy()
        end
    end
end

local function enablePlayerRemoval()
    for _, plr in pairs(Players:GetPlayers()) do
        deletePlayerCharacter(plr)
        if not characterAddedConn[plr] then
            characterAddedConn[plr] = plr.CharacterAdded:Connect(function(char)
                onCharacterAdded(plr, char)
            end)
        end
    end

    playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        deletePlayerCharacter(plr)
        characterAddedConn[plr] = plr.CharacterAdded:Connect(function(char)
            onCharacterAdded(plr, char)
        end)
    end)
end

local function disablePlayerRemoval()
    if playerAddedConn then
        playerAddedConn:Disconnect()
        playerAddedConn = nil
    end
    for plr, conn in pairs(characterAddedConn) do
        if conn then conn:Disconnect() end
    end
    characterAddedConn = {}

    restoreDeletedCharacters()
end

-- Anti Ragdoll fix: force humanoid to Running state and zero velocity to prevent fly up
spawn(function()
    while true do
        RunService.Heartbeat:Wait()
        if antiRagdollFlag then
            local char = LocalPlayer.Character
            if char then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                if humanoid and rootPart then
                    local state = humanoid:GetState()
                    if state == Enum.HumanoidStateType.Physics
                    or state == Enum.HumanoidStateType.FallingDown
                    or state == Enum.HumanoidStateType.Ragdoll
                    or state == Enum.HumanoidStateType.GettingUp then
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        rootPart.Velocity = Vector3.new(0, 0, 0)
                        rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end

if humanoid.WalkSpeed < 16 then
                        humanoid.WalkSpeed = 16
                    end

                    if humanoid.Sit == true then
                        humanoid.Sit = false
                    end
                end
            end
        else
            wait(0.5)
        end
    end
end)

local function teleportCharacterTo(posOrCFrame)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if typeof(posOrCFrame) == "CFrame" then
            char.HumanoidRootPart.CFrame = posOrCFrame
        else
            char.HumanoidRootPart.CFrame = CFrame.new(posOrCFrame)
        end
    end
end

local function findTowerPart()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local s = obj.Size
            if math.abs(s.X - 2.0333337783813477) < 0.01
            and math.abs(s.Y - 5.691134452819824) < 0.01
            and math.abs(s.Z - 5.799999713897705) < 0.01 then
                return obj
            end
        end
    end
    return nil
end

-- AutoMine code variables to avoid multiple executions
local AutoMineExecuted = false
local a = false

local function pressRKey()
    VirtualInput:SendKeyEvent(true, Enum.KeyCode.R, false, game)
    wait(0.1)
    VirtualInput:SendKeyEvent(false, Enum.KeyCode.R, false, game)
end

function c()
    task.spawn(function()
        while a do
            game.ReplicatedStorage:WaitForChild("KickStone"):InvokeServer(true)
            task.wait(0.05)
        end
        a = false
        game.ReplicatedStorage:WaitForChild("KickStone"):InvokeServer(false)
    end)
end

-- Hook original keypress handler (just to be safe)
UserInputService.InputBegan:Connect(function(b,d)
    if not d and b.KeyCode == Enum.KeyCode.R then
        a = not a
        if a then c() end
    end
end)

-- ----- Автофарм с телепортом и направлением взгляда -----

local autoFarmFlag = false
local autoFarmCoroutine = nil

local bricksPosition = Vector3.new(86, 2, 94)  -- Новая позиция телепорта для автофарма
local bricksLookAt = Vector3.new(86, 2, 93)   -- Новое направление взгляда

local walkPositions = {
    Vector3.new(40, 3, -26),
    Vector3.new(40, 3, -31), 
    Vector3.new(40, 3, -36)
}

local function checkText(text)
    if not LocalPlayer.PlayerGui then return false end
    for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if (gui:IsA("TextLabel") or gui:IsA("TextButton")) and gui.Text then
            if string.find(gui.Text:lower(), text:lower()) then
                return true
            end
        end
    end
    return false
end

local function pressE()
    VirtualInput:SendKeyEvent(true, "E", false, game)
    wait(0.05)
    VirtualInput:SendKeyEvent(false, "E", false, game)
end

local function holdF()
    VirtualInput:SendKeyEvent(true, "F", false, game)
end

local function releaseF()
    VirtualInput:SendKeyEvent(false, "F", false, game)
end

local function teleport(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos, bricksLookAt)
    end
end

local function getDesks()
    local desks = {}
    local floors = Workspace:FindFirstChild("Floors")
    if floors then
        local base = floors:FindFirstChild("Base")
        if base then
            local example = base:FindFirstChild("Example")
            if example then
                for _, obj in pairs(example:GetDescendants()) do
                    if obj:IsA("Part") then
                        table.insert(desks, obj)
                    end
                end
            end
        end
    end
    return desks
end

local function autoFarmLoop()
    while autoFarmFlag do
        if not AutoMineExecuted then
            AutoMineExecuted = true
            a = true
            c()
            pressRKey()
        end
        removePlayersFlag = true
        enablePlayerRemoval()

        teleport(bricksPosition)

if checkText("your backpack is full") then
            for _, pos in ipairs(walkPositions) do
                teleport(pos)
                pressE()
                wait(0.3)
            end
        elseif checkText("first get the stone") then
            holdF()
            local desks = getDesks()
            for _, desk in pairs(desks) do
                teleport(desk.Position)
            end
            releaseF()
        elseif checkText("don't have any bricks") then
            teleport(bricksPosition)
        end

        wait(0.1)
    end

    a = false
    AutoMineExecuted = false
    disablePlayerRemoval()
end

-- Основные вкладки и элементы UI

local MainTab = Window:Tab({Title = "Main", Icon = "home"})

MainTab:Button({
    Title = "Авто работа кирки",
    Callback = function()
        if AutoMineExecuted then
            WindUI:Notify({Title = "Авто кирка", Content = "Уже запущена"})
            return
        end
        AutoMineExecuted = true
        warn("[NilWare AutoMine]: Already executed.")
        print("[NilWare AutoMine]: Loaded | Version: v2.0.1 STABLE")
        a = true
        c()
        pressRKey()
        WindUI:Notify({Title = "Авто кирка", Content = "Скрипт активирован"})
    end
})

MainTab:Toggle({
    Title = "Авто фарм",
    Default = false,
    Callback = function(state)
        autoFarmFlag = state
        if state then
            WindUI:Notify({Title = "Авто фарм", Content = "Включён"})
            autoFarmCoroutine = coroutine.create(autoFarmLoop)
            coroutine.resume(autoFarmCoroutine)
        else
            WindUI:Notify({Title = "Авто фарм", Content = "Выключен"})
            autoFarmFlag = false
            if autoFarmCoroutine and coroutine.status(autoFarmCoroutine) == "suspended" then
                coroutine.resume(autoFarmCoroutine)
            end
        end
    end
})

local PlayerTab = Window:Tab({Title = "Player", Icon = "user"})

PlayerTab:Toggle({
    Title = "Удалять игроков",
    Default = false,
    Callback = function(state)
        removePlayersFlag = state
        if state then
            enablePlayerRemoval()
            WindUI:Notify({Title = "Удаление игроков", Content = "Включено: все игроки удалены и новые тоже"})
        else
            disablePlayerRemoval()
            WindUI:Notify({Title = "Удаление игроков", Content = "Выключено: все игроки восстановлены"})
        end
    end
})

PlayerTab:Button({
    Title = "Fly Mobile",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

PlayerTab:Button({
    Title = "Скорость 35",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 35
            end
        end
    end
})

PlayerTab:Button({
    Title = "Удалить невидимые стены",
    Callback = function()
        local barrier = Workspace:FindFirstChild("barrier")
        if barrier then
            barrier:Destroy()
            WindUI:Notify({Title = "Невидимые стены", Content = "Папка barrier удалена"})
        else
            WindUI:Notify({Title = "Невидимые стены", Content = "Папка barrier не найдена"})
        end
    end
})

PlayerTab:Toggle({
    Title = "Анти регдолл",
    Default = false,
    Callback = function(state)
        antiRagdollFlag = state
        if state then
            WindUI:Notify({Title = "Анти регдолл", Content = "Включён"})
        else
            WindUI:Notify({Title = "Анти регдолл", Content = "Выключен"})
        end
    end
})

PlayerTab:Toggle({
    Title = "Ночь (везуал)",
    Default = false,
    Callback = function(state)
        nightModeFlag = state
        if state then
            Lighting.TimeOfDay = "00:00:00"
            Lighting.Brightness = 0.2
            Lighting.FogEnd = 100
            WindUI:Notify({Title = "Ночь", Content = "Включена"})
        else
            Lighting.TimeOfDay = "14:00:00"
            Lighting.Brightness = 2
            Lighting.FogEnd = 100000
            WindUI:Notify({Title = "Ночь", Content = "Выключена"})
        end
    end
})

local TeleportTab = Window:Tab({Title = "Teleport", Icon = "navigation"})

TeleportTab:Button({
    Title = "Телепорт спавн",
    Callback = function()
        teleportCharacterTo(Vector3.new(40.2, -0.06, -1.05))
    end
})

TeleportTab:Button({
    Title = "Телепорт башня",
    Callback = function()
        local towerPart = findTowerPart()
        if towerPart then
            teleportCharacterTo(towerPart.Position)
        else
            WindUI:Notify({Title = "Ошибка", Content = "Объект башни не найден"})
        end
    end
})

TeleportTab:Button({
    Title = "Телепорт секретка",
    Callback = function()
        teleportCharacterTo(Vector3.new(-5.15, -41.66, 8.6))
    end
})

TeleportTab:Button({
    Title = "Телепорт секретка пещера",
    Callback = function()
        teleportCharacterTo(CFrame.new(
            79.1361847, 3.01504588, 95.3317947,
            -0.484826207, 0, 0.874610603,
            0, 1, 0,
            -0.874610603, 0, -0.484826207
        ))
    end
})

WindUI:Notify({
    Title = "FTGS Hub",
    Content = "Меню успешно загружено! RightShift для открытия"
})
