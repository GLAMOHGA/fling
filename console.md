--[[
Fixed Console Script (Transparency Fixed)
]]

local cloneref = cloneref or function(o) return o end

local CoreGui = cloneref(game:GetService("CoreGui"))
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

-- 1. Агрессивно удаляем старые версии
pcall(function()
	for _, gui in ipairs(CoreGui:GetChildren()) do
		if gui.Name == "ConsoleToggleGui" or gui.Name == "_ConsoleGui" then
			gui:Destroy()
		end
	end
end)

-- ========================================
-- 2. КНОПКА ОТКРЫТИЯ (Console) - ПРОЗРАЧНАЯ
-- ========================================

local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "ConsoleToggleGui"
ToggleGui.Parent = CoreGui
ToggleGui.ResetOnSpawn = false
ToggleGui.IgnoreGuiInset = true

local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ToggleGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
OpenBtn.BackgroundTransparency = 0.3 -- ПРОЗРАЧНОСТЬ 0.3
OpenBtn.BorderSizePixel = 0
OpenBtn.Position = UDim2.new(0.5, -40, 0, 5)
OpenBtn.Size = UDim2.new(0, 80, 0, 32)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Text = "Console"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 13
OpenBtn.Active = true
OpenBtn.Draggable = true
OpenBtn.AutoButtonColor = true -- Чтобы при нажатии было видно клик

Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 10)

local toggleStroke = Instance.new("UIStroke")
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Thickness = 1.5
toggleStroke.Transparency = 0.3 -- ОБВОДКА ТОЖЕ ПРОЗРАЧНАЯ
toggleStroke.Parent = OpenBtn

-- ТОЛЬКО ОТКРЫВАЕТ
OpenBtn.MouseButton1Click:Connect(function()
	pcall(function()
		StarterGui:SetCore("DevConsoleVisible", true)
	end)
end)

-- ========================================
-- ПОИСК ЭЛЕМЕНТОВ
-- ========================================

local function findWindow()
	local m = CoreGui:FindFirstChild("DevConsoleMaster")
	return m and m:FindFirstChild("DevConsoleWindow")
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
	for _, c in ipairs(cl:GetDescendants()) do
		if c:IsA("ScrollingFrame") then return c end
	end
	if cl:IsA("ScrollingFrame") then return cl end
	return nil
end

local function getAllText()
	local sc = findScroller()
	if not sc then return "" end
	local t = {}
	for _, d in ipairs(sc:GetDescendants()) do
		if d:IsA("TextLabel") and d.Name ~= "_CBtn" and d.Visible then
			if d.Text and d.Text ~= "" then
				table.insert(t, d.Text)
			end
		end
	end
	return table.concat(t, "\n")
end

-- ========================================
-- 3. КНОПКА COPY LOG
-- ========================================

local function createButtons()
	local window = findWindow()
	if not window then return false end
	if window:FindFirstChild("_ConsoleBtns") then return true end

	local container = Instance.new("Frame")
	container.Name = "_ConsoleBtns"
	-- Позиция как ты просил (-175)
	container.Position = UDim2.new(1, -175, 0, 2) 
	container.Size = UDim2.new(0, 100, 0, 28)
	container.BackgroundTransparency = 1
	container.ZIndex = 100
	container.Parent = window

	local copyBtn = Instance.new("TextButton")
	copyBtn.Name = "CopyAllBtn"
	copyBtn.Parent = container
	copyBtn.Size = UDim2.new(1, 0, 0, 24)
	copyBtn.Position = UDim2.new(0, 0, 0.5, -12)
	
	-- Дизайн спокойный
	copyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	copyBtn.BorderSizePixel = 0
	copyBtn.Text = "Copy all Log"
	copyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	copyBtn.Font = Enum.Font.SourceSans -- Обычный шрифт
	copyBtn.TextSize = 14
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
			copyBtn.Text = "Copied"
			copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			copyBtn.Text = "Empty"
		end
		
		task.delay(1, function()
			if copyBtn and copyBtn.Parent then
				copyBtn.Text = "Copy all Log"
				copyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
			end
		end)
	end)

	return true
end

-- ========================================
-- 4. КНОПКА [C] (Шрифт как у текста)
-- ========================================

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
	
	-- Шрифт самой надписи
	btn.Font = label.Font 
	
	btn.TextSize = 12 
	btn.TextTransparency = 0.6
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.ZIndex = label.ZIndex + 1
	btn.AnchorPoint = Vector2.new(0, 0.5)
	btn.Parent = label

	local ok, bounds = pcall(function() return label.TextBounds end)
	if ok and bounds and bounds.X > 0 then
		btn.Position = UDim2.new(0, bounds.X + 4, 0.5, 0)
	else
		btn.Position = UDim2.new(1, 4, 0.5, 0)
	end

	btn.MouseEnter:Connect(function() if btn.Parent then btn.TextTransparency = 0 end end)
	btn.MouseLeave:Connect(function() if btn.Parent then btn.TextTransparency = 0.6 end end)
	
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

-- ========================================
-- ЗАПУСК
-- ========================================

local tracked = {}

local function setup()
	local cl = findClientLog()
	if not cl then return end

	createButtons()

	for _, d in ipairs(cl:GetDescendants()) do
		if d:IsA("TextLabel") and d.Name ~= "_CBtn" then
			pcall(addCopyBtn, d)
		end
	end

	if not tracked[cl] then
		tracked[cl] = true
		cl.DescendantAdded:Connect(function(d)
			if d:IsA("TextLabel") and d.Name ~= "_CBtn" then
				pcall(addCopyBtn, d)
			end
		end)
	end
end

pcall(function()
	local master = CoreGui:FindFirstChild("DevConsoleMaster")
	if master then
		setup()
		master.DescendantAdded:Connect(function() task.defer(setup) end)
	end

	CoreGui.ChildAdded:Connect(function(child)
		if child.Name == "DevConsoleMaster" then
			task.defer(function()
				setup()
				child.DescendantAdded:Connect(function() task.defer(setup) end)
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
