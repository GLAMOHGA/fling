local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

-- Сервисы
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer

-- Переменные для Anti-AFK
local antiAfkEnabled = false
local jumpEnabled = false
local spinEnabled = false
local walkEnabled = false
local imitationEnabled = false

local antiAfkConnection = nil
local loopConnection = nil
local windowActiveConnection = nil

local lastJumpTime = 0
local lastSpinTime = 0
local lastWalkTime = 0
local lastImitationTime = 0

-- Интервалы (настраиваемые)
local jumpInterval = 7
local spinInterval = 30
local walkInterval = 55

local isSpinning = false
local isWalking = false
local isImitating = false

local Window = Library:CreateWindow({
	Title = "anti AFK",
	Footer = "by vomagla",
	Icon = 17735982294,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main", "home"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- =============================================================================
-- ФУНКЦИИ ANTI-AFK
-- =============================================================================

local function doJump()
	local character = LocalPlayer.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > 0 then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

local function doSpin()
	if isSpinning then return end
	
	local character = LocalPlayer.Character
	if not character then return end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end
	
	isSpinning = true
	
	spawn(function()
		local startCFrame = humanoidRootPart.CFrame
		local duration = 3
		local startTime = tick()
		
		while tick() - startTime < duration do
			local alpha = (tick() - startTime) / duration
			local angle = alpha * math.pi * 2
			
			local pos = humanoidRootPart.Position
			local startRotation = startCFrame - startCFrame.Position
			local newCFrame = CFrame.new(pos) * startRotation * CFrame.Angles(0, angle, 0)
			humanoidRootPart.CFrame = newCFrame
			
			RunService.Heartbeat:Wait()
		end
		
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * (startCFrame - startCFrame.Position)
		isSpinning = false
	end)
end

local function doWalk()
	if isWalking then return end
	
	local character = LocalPlayer.Character
	if not character then return end
	
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then return end
	
	isWalking = true
	
	spawn(function()
		local walkDuration = 0.5
		local startTime = tick()
		
		while tick() - startTime < walkDuration do
			humanoid:Move(Vector3.new(0, 0, -1))
			RunService.Heartbeat:Wait()
		end
		
		humanoid:Move(Vector3.new(0, 0, 0))
		wait(0.2)
		
		startTime = tick()
		
		while tick() - startTime < walkDuration do
			humanoid:Move(Vector3.new(0, 0, 1))
			RunService.Heartbeat:Wait()
		end
		
		humanoid:Move(Vector3.new(0, 0, 0))
		isWalking = false
	end)
end

local function doImitation()
	if isImitating then return end
	if not imitationEnabled then return end
	
	isImitating = true
	
	spawn(function()
		VirtualUser:CaptureController()
		
		local actionType = math.random(1, 4)
		
		if actionType == 1 then
			VirtualUser:ClickButton2(Vector2.new(math.random(100, 500), math.random(100, 500)))
			
		elseif actionType == 2 then
			VirtualUser:Button1Down(Vector2.new(math.random(200, 600), math.random(200, 400)))
			wait(0.1)
			VirtualUser:Button1Up(Vector2.new(math.random(200, 600), math.random(200, 400)))
			
		elseif actionType == 3 then
			VirtualUser:MoveMouse(Vector2.new(math.random(-50, 50), math.random(-50, 50)))
			
		elseif actionType == 4 then
			VirtualUser:CaptureController()
			VirtualUser:SetKeyDown("0x00")
			wait(0.05)
			VirtualUser:SetKeyUp("0x00")
		end
		
		wait(0.2)
		isImitating = false
	end)
end

local function startWindowActive()
	if windowActiveConnection then
		windowActiveConnection:Disconnect()
		windowActiveConnection = nil
	end
	
	windowActiveConnection = RunService.Heartbeat:Connect(function()
		if imitationEnabled then
			pcall(function()
				VirtualUser:CaptureController()
			end)
		end
	end)
end

local function stopWindowActive()
	if windowActiveConnection then
		windowActiveConnection:Disconnect()
		windowActiveConnection = nil
	end
end

local function startAntiAfkLoop()
	if loopConnection then
		loopConnection:Disconnect()
	end
	
	lastJumpTime = tick()
	lastSpinTime = tick()
	lastWalkTime = tick()
	lastImitationTime = tick()
	
	loopConnection = RunService.Heartbeat:Connect(function()
		if not antiAfkEnabled then return end
		
		local currentTime = tick()
		
		if jumpEnabled then
			if currentTime - lastJumpTime >= jumpInterval then
				doJump()
				lastJumpTime = currentTime
			end
		end
		
		if spinEnabled and not isSpinning then
			if currentTime - lastSpinTime >= spinInterval then
				doSpin()
				lastSpinTime = currentTime
			end
		end
		
		if walkEnabled and not isWalking then
			if currentTime - lastWalkTime >= walkInterval then
				doWalk()
				lastWalkTime = currentTime
			end
		end
		
		if imitationEnabled and not isImitating then
			if currentTime - lastImitationTime >= math.random(3, 8) then
				doImitation()
				lastImitationTime = currentTime
			end
		end
	end)
end

local function stopAntiAfkLoop()
	if loopConnection then
		loopConnection:Disconnect()
		loopConnection = nil
	end
end

-- =============================================================================
-- MAIN TAB
-- =============================================================================

local MainGroup = Tabs.Main:AddLeftGroupbox("Anti-AFK")

MainGroup:AddToggle("AntiAfkToggle", {
	Text = "Anti-AFK",
	Default = false,
	Callback = function(value)
		antiAfkEnabled = value
		
		if value then
			if antiAfkConnection then
				antiAfkConnection:Disconnect()
			end
			
			antiAfkConnection = LocalPlayer.Idled:Connect(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end)
			
			startAntiAfkLoop()
			
			Library:Notify("Anti-AFK включён!", 3)
		else
			if antiAfkConnection then
				antiAfkConnection:Disconnect()
				antiAfkConnection = nil
			end
			
			stopAntiAfkLoop()
			stopWindowActive()
			
			Library:Notify("Anti-AFK выключён!", 3)
		end
	end,
})

MainGroup:AddDivider()

MainGroup:AddButton("Загрузить Anti-AFK скрипты", function()
	Library:Notify("Загружаю все Anti-AFK скрипты...", 2)
	
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
	end)
	
	pcall(function()
		local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.ClientMain.Replications.Workers.WalkDummy)
		setconstant(Module, 34, function() 
			game:GetService("RunService").Heartbeat:Wait() 
		end)
	end)
	
	pcall(function()
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			game:GetService("VirtualUser"):ClickButton2(Vector2.new())
		end)
	end)
	
	pcall(function()
		local virtualUser = game:service('VirtualUser')
		game:service('Players').LocalPlayer.Idled:connect(function()
			virtualUser:CaptureController()
			virtualUser:ClickButton2(Vector2.new())
		end)
	end)
	
	Library:Notify("Все Anti-AFK скрипты загружены!", 3)
end)

MainGroup:AddButton("Anti-LAG", function()
	Library:Notify("НАЖМИТЕ НА ТЕКСТ СНИЗУ: Tap To Remove Page. ЧТОБЫ УБРАТЬ ЧЕРНЫЙ ЭКРАН", 15)
	
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/z4tt483/ItzXery.lua/main/AntiLag-ItzXery.lua"))()
	end)
end)

-- Настройки Anti-AFK
local SettingsGroup = Tabs.Main:AddRightGroupbox("Настройки")

SettingsGroup:AddToggle("JumpToggle", {
	Text = "Прыжок",
	Default = false,
	Callback = function(value)
		jumpEnabled = value
		if value then
			lastJumpTime = tick()
		end
	end,
})

SettingsGroup:AddSlider("JumpSlider", {
	Text = "Интервал прыжка (сек)",
	Default = 7,
	Min = 1,
	Max = 60,
	Rounding = 0,
	Callback = function(value)
		jumpInterval = value
	end,
})

SettingsGroup:AddDivider()

SettingsGroup:AddToggle("SpinToggle", {
	Text = "Кружение (Spin)",
	Default = false,
	Callback = function(value)
		spinEnabled = value
		if value then
			lastSpinTime = tick()
		end
	end,
})

SettingsGroup:AddSlider("SpinSlider", {
	Text = "Интервал кружения (сек)",
	Default = 30,
	Min = 5,
	Max = 120,
	Rounding = 0,
	Callback = function(value)
		spinInterval = value
	end,
})

SettingsGroup:AddDivider()

SettingsGroup:AddToggle("WalkToggle", {
	Text = "Ходьба",
	Default = false,
	Callback = function(value)
		walkEnabled = value
		if value then
			lastWalkTime = tick()
		end
	end,
})

SettingsGroup:AddSlider("WalkSlider", {
	Text = "Интервал ходьбы (сек)",
	Default = 55,
	Min = 5,
	Max = 120,
	Rounding = 0,
	Callback = function(value)
		walkInterval = value
	end,
})

SettingsGroup:AddDivider()

SettingsGroup:AddToggle("ImitationToggle", {
	Text = "Имитация движения",
	Default = false,
	Tooltip = "Имитирует активность игрока: клики мыши, движения курсора. Работает даже когда окно Roblox свёрнуто - поддерживает окно активным для игры.",
	Callback = function(value)
		imitationEnabled = value
		if value then
			lastImitationTime = tick()
			startWindowActive()
			
			Library:Notify("Имитация движения включена!", 3)
		else
			stopWindowActive()
		end
	end,
})

-- =============================================================================
-- UI SETTINGS
-- =============================================================================
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
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

MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	if antiAfkConnection then
		antiAfkConnection:Disconnect()
	end
	stopAntiAfkLoop()
	stopWindowActive()
	Library:Unload()
end)

Library.ToggleKeybind = Library.Options.MenuKeybind 

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("vomagla_scripts")
SaveManager:SetFolder("vomagla_scripts/anti-afk")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()
