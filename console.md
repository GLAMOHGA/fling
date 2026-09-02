local cloneref = cloneref or function(o) return o end

local CoreGui = cloneref(game:GetService("CoreGui"))
local RunService = cloneref(game:GetService("RunService"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local LogService = cloneref(game:GetService("LogService"))
local UserInputService = cloneref(game:GetService("UserInputService"))

pcall(function()
    for _, gui in ipairs(CoreGui:GetChildren()) do
        if gui.Name == "ConsoleToggleGui" then
            gui:Destroy()
        end
    end
end)

pcall(function()
    local master = CoreGui:FindFirstChild("DevConsoleMaster")
    if master then
        local window = master:FindFirstChild("DevConsoleWindow")
        if window then
            for _, child in ipairs(window:GetChildren()) do
                if child.Name == "_ConsoleBtns" or child.Name == "_ConsoleBottomBtns" then
                    child:Destroy()
                end
            end
            local topBar = window:FindFirstChild("TopBar")
            if topBar then
                for _, child in ipairs(topBar:GetChildren()) do
                    if child.Name == "_ConsoleBtns" then child:Destroy() end
                end
            end
        end
    end
end)

local allLogs = {}

LogService.MessageOut:Connect(function(message, messageType)
    if message and message ~= "" then
        table.insert(allLogs, message)
    end
end)

local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "ConsoleToggleGui"
ToggleGui.Parent = CoreGui
ToggleGui.ResetOnSpawn = false
ToggleGui.IgnoreGuiInset = true
ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ToggleGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
OpenBtn.BackgroundTransparency = 0.3
OpenBtn.BorderSizePixel = 0
OpenBtn.Position = UDim2.new(0.5, -40, 0, 5)
OpenBtn.Size = UDim2.new(0, 80, 0, 32)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Text = "Console"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 13
OpenBtn.Active = true
OpenBtn.AutoButtonColor = true

Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 10)

local toggleStroke = Instance.new("UIStroke")
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Thickness = 1.5
toggleStroke.Transparency = 0.3
toggleStroke.Parent = OpenBtn

OpenBtn.MouseButton1Click:Connect(function()
    pcall(function()
        StarterGui:SetCore("DevConsoleVisible", true)
    end)
end)

local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

OpenBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = OpenBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

OpenBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        OpenBtn.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

local function findWindow()
    local m = CoreGui:FindFirstChild("DevConsoleMaster")
    return m and m:FindFirstChild("DevConsoleWindow")
end

local function findTopBar()
    local w = findWindow()
    return w and w:FindFirstChild("TopBar")
end

local function findClientLog()
    local w = findWindow()
    if not w then return nil end
    for _, d in ipairs(w:GetDescendants()) do
        if d.Name == "ClientLog" then return d end
    end
    return nil
end

local function findScroller()
    local cl = findClientLog()
    if not cl then return nil end
    if cl:IsA("ScrollingFrame") then return cl end
    for _, c in ipairs(cl:GetDescendants()) do
        if c:IsA("ScrollingFrame") then return c end
    end
    return nil
end

local function getAllText()
    local sc = findScroller()
    local texts = {}

    if sc then
        for _, d in ipairs(sc:GetDescendants()) do
            if d:IsA("TextLabel") and d.Name ~= "_CBtn" then
                if d.Text and d.Text ~= "" then
                    table.insert(texts, d.Text)
                end
            end
        end
    end

    for _, msg in ipairs(allLogs) do
        table.insert(texts, msg)
    end

    return table.concat(texts, "\n")
end

local function createButtons()
    local window = findWindow()
    if not window then return false end
    if window:FindFirstChild("_ConsoleBtns") then return true end

    local topBar = findTopBar()
    local parent = topBar or window
    local isTopBar = topBar ~= nil

    local container = Instance.new("Frame")
    container.Name = "_ConsoleBtns"
    container.BackgroundTransparency = 1
    container.ZIndex = 100
    container.ClipsDescendants = false
    container.Parent = parent

    if isTopBar then
        container.AnchorPoint = Vector2.new(1, 0.5)
        container.Position = UDim2.new(1, -50, 0.5, 0)
        container.Size = UDim2.new(0, 96, 0, 22)
    else
        container.AnchorPoint = Vector2.new(1, 0)
        container.Position = UDim2.new(1, -44, 0, 2)
        container.Size = UDim2.new(0, 96, 0, 24)
    end

    local copyBtn = Instance.new("TextButton")
    copyBtn.Name = "CopyAllBtn"
    copyBtn.Parent = container
    copyBtn.Size = UDim2.new(0, 88, 0, 20)
    copyBtn.Position = UDim2.new(0, 0, 0.5, -10)
    copyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    copyBtn.BorderSizePixel = 0
    copyBtn.Text = "Copy all Log"
    copyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    copyBtn.Font = Enum.Font.SourceSans
    copyBtn.TextSize = 13
    copyBtn.AutoButtonColor = true
    copyBtn.ZIndex = 101
    Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 4)
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = copyBtn

    copyBtn.MouseButton1Click:Connect(function()
        local txt = getAllText()
        if txt ~= "" then
            pcall(function()
                if setclipboard then setclipboard(txt)
                elseif toclipboard then toclipboard(txt) end
            end)
            copyBtn.Text = "Copied!"
            copyBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
        else
            copyBtn.Text = "Empty"
        end
        task.delay(1.5, function()
            if copyBtn and copyBtn.Parent then
                copyBtn.Text = "Copy all Log"
                copyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end)
    end)

    return true
end

local function createBottomButtons()
    local window = findWindow()
    if not window then return false end
    if window:FindFirstChild("_ConsoleBottomBtns") then return true end

    local container = Instance.new("Frame")
    container.Name = "_ConsoleBottomBtns"
    container.AnchorPoint = Vector2.new(0, 1)
    container.Position = UDim2.new(0, 8, 1, -30)
    container.Size = UDim2.new(0, 28, 0, 50)
    container.BackgroundTransparency = 1
    container.ZIndex = 100
    container.ClipsDescendants = false
    container.Parent = window

    local topBtn = Instance.new("TextButton")
    topBtn.Name = "ScrollTopBtn"
    topBtn.Parent = container
    topBtn.Size = UDim2.new(1, 0, 0, 22)
    topBtn.Position = UDim2.new(0, 0, 0, 0)
    topBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    topBtn.BorderSizePixel = 0
    topBtn.Text = "↑"
    topBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    topBtn.Font = Enum.Font.SourceSans
    topBtn.TextSize = 14
    topBtn.AutoButtonColor = true
    topBtn.ZIndex = 101
    Instance.new("UICorner", topBtn).CornerRadius = UDim.new(0, 4)
    local stroke1 = Instance.new("UIStroke")
    stroke1.Color = Color3.fromRGB(60, 60, 60)
    stroke1.Thickness = 1
    stroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke1.Parent = topBtn

    local bottomBtn = Instance.new("TextButton")
    bottomBtn.Name = "ScrollBottomBtn"
    bottomBtn.Parent = container
    bottomBtn.Size = UDim2.new(1, 0, 0, 22)
    bottomBtn.Position = UDim2.new(0, 0, 0, 26)
    bottomBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    bottomBtn.BorderSizePixel = 0
    bottomBtn.Text = "↓"
    bottomBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    bottomBtn.Font = Enum.Font.SourceSans
    bottomBtn.TextSize = 14
    bottomBtn.AutoButtonColor = true
    bottomBtn.ZIndex = 101
    Instance.new("UICorner", bottomBtn).CornerRadius = UDim.new(0, 4)
    local stroke2 = Instance.new("UIStroke")
    stroke2.Color = Color3.fromRGB(60, 60, 60)
    stroke2.Thickness = 1
    stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke2.Parent = bottomBtn

    topBtn.MouseButton1Click:Connect(function()
        local sc = findScroller()
        if sc then
            sc.CanvasPosition = Vector2.new(0, 0)
        end
    end)

    bottomBtn.MouseButton1Click:Connect(function()
        local sc = findScroller()
        if sc then
            sc.CanvasPosition = Vector2.new(0, 999999)
        end
    end)

    return true
end

local function addCopyBtn(label)
    if not label or not label.Parent then return end
    if label:FindFirstChild("_CBtn") then return end
    if label.Name == "_CBtn" then return end

    local btn = Instance.new("TextButton")
    btn.Name = "_CBtn"
    btn.Size = UDim2.new(0, 22, 0, 14)
    btn.BackgroundTransparency = 1
    btn.Text = "[C]"
    btn.TextColor3 = label.TextColor3
    btn.Font = label.Font
    btn.TextSize = 12
    btn.TextTransparency = 0.6
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = label.ZIndex + 1
    btn.AnchorPoint = Vector2.new(0, 0.5)
    btn.Parent = label

    task.defer(function()
        local ok, bounds = pcall(function() return label.TextBounds end)
        if ok and bounds and bounds.X > 0 then
            btn.Position = UDim2.new(0, bounds.X + 4, 0.5, 0)
        else
            btn.Position = UDim2.new(1, 4, 0.5, 0)
        end
    end)

    btn.MouseEnter:Connect(function()
        if btn.Parent then btn.TextTransparency = 0 end
    end)
    btn.MouseLeave:Connect(function()
        if btn.Parent then btn.TextTransparency = 0.6 end
    end)

    btn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then setclipboard(label.Text)
            elseif toclipboard then toclipboard(label.Text) end
        end)
        btn.Text = "[OK]"
        btn.TextColor3 = Color3.fromRGB(0, 255, 0)
        btn.TextTransparency = 0
        task.delay(0.6, function()
            if btn and btn.Parent then
                btn.Text = "[C]"
                btn.TextColor3 = label.TextColor3
                btn.TextTransparency = 0.6
            end
        end)
    end)
end

local tracked = {}
local lastSetup = 0

local function setup()
    local now = tick()
    if now - lastSetup < 0.5 then return end
    lastSetup = now

    local cl = findClientLog()
    if not cl then return end

    createButtons()
    createBottomButtons()

    for _, d in ipairs(cl:GetDescendants()) do
        if d:IsA("TextLabel") and d.Name ~= "_CBtn" then
            pcall(addCopyBtn, d)
        end
    end

    if not tracked[cl] then
        tracked[cl] = true
        cl.DescendantAdded:Connect(function(d)
            if d:IsA("TextLabel") and d.Name ~= "_CBtn" then
                task.defer(function()
                    pcall(addCopyBtn, d)
                end)
            end
        end)
    end
end

pcall(function()
    local master = CoreGui:FindFirstChild("DevConsoleMaster")
    if master then
        setup()
        master.DescendantAdded:Connect(function()
            task.delay(0.1, setup)
        end)
    end

    CoreGui.ChildAdded:Connect(function(child)
        if child.Name == "DevConsoleMaster" then
            task.delay(0.3, function()
                setup()
                child.DescendantAdded:Connect(function()
                    task.delay(0.1, setup)
                end)
            end)
        end
    end)
end)

local t = 0
RunService.Heartbeat:Connect(function(dt)
    t = t + dt
    if t >= 1 then
        t = 0
        pcall(setup)
    end
end)
