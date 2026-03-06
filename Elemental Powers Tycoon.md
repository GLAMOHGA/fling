-- // Modules
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Esp = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/x114/RobloxScripts/main/OpenSourceEsp"))()

-- // Services
local Players = game:GetService("Players")
local RunService = game:FindService("RunService")
local UserInputService = game:GetService("UserInputService")

-- // Variables
local Player = Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HRP = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:FindFirstChildOfClass("Humanoid")
local ControlPoint = workspace.Control_Point
local ControlPointPart = ControlPoint.Point

local DefaultWalkSpeed = 16

local AutoFarm = {
	StealDollars = false,
	AutoCollect = false,
	AutoBuild = false,
	AutoHillRemoval = false
}

local Trolling = {
	TargetPlayer = nil,
}

local CombatSettings = {
	ESPEnabled = false,
	ChamsEnabled = false,
}

local PlayerSettings = {
	SpeedEnabled = false,
	Speed = 16,
	InfJumpEnabled = false,
	NoclipEnabled = false
}

local Tycoon = workspace.Tycoons:FindFirstChild(Player.Name)
if not Tycoon then
	Rayfield:Notify({
		Title = "Error",
		Content = "Collect Your Tycoon!",
		Duration = 6.5,
		Image = 11745872910,
		Actions = {
			Ignore = {
				Name = "Okay",
				Callback = function() end
			},
		},
	})
end
repeat
	task.wait(1)
	Tycoon = workspace.Tycoons:FindFirstChild(Player.Name)
until Tycoon

local PlayerBalance = Player.leaderstats.Money

-- // Chams Storage
local ChamsObjects = {}

-- // ESP per-player drawing storage
local EspDrawings = {}

-- // Functions

Player.CharacterAdded:Connect(function(NewChar)
	Char = NewChar
	HRP = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:FindFirstChildOfClass("Humanoid")

	if PlayerSettings.SpeedEnabled then
		task.spawn(function()
			task.wait(0.5)
			if Humanoid then
				Humanoid.WalkSpeed = PlayerSettings.Speed
			end
			for i = 1, 20 do
				task.wait(0.5)
				if PlayerSettings.SpeedEnabled and Humanoid then
					Humanoid.WalkSpeed = PlayerSettings.Speed
				end
			end
		end)
	end

	if CombatSettings.ChamsEnabled then
		task.wait(1)
		UpdateAllChams()
	end
end)

-- Постоянная проверка скорости
task.spawn(function()
	while task.wait(0.5) do
		if PlayerSettings.SpeedEnabled then
			local hum = nil
			if Char and Char:FindFirstChildOfClass("Humanoid") then
				hum = Char:FindFirstChildOfClass("Humanoid")
			end
			if hum and hum.WalkSpeed ~= PlayerSettings.Speed then
				hum.WalkSpeed = PlayerSettings.Speed
			end
		end
	end
end)

local function GetTeamColor(plr)
	if plr.Team then
		return plr.TeamColor.Color
	end
	return Color3.fromRGB(255, 255, 255)
end

-- ==================== CHAMS ====================

local function RemoveChams(playerName)
	if ChamsObjects[playerName] then
		ChamsObjects[playerName]:Destroy()
		ChamsObjects[playerName] = nil
	end
end

local function ApplyChams(plr)
	if plr == Player then return end
	if not plr.Character then return end

	RemoveChams(plr.Name)

	local highlight = Instance.new("Highlight")
	highlight.Adornee = plr.Character
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0

	local col = GetTeamColor(plr)
	highlight.FillColor = col
	highlight.OutlineColor = col

	highlight.Parent = plr.Character
	ChamsObjects[plr.Name] = highlight
end

function UpdateAllChams()
	for name, obj in pairs(ChamsObjects) do
		if obj and obj.Parent then
			obj:Destroy()
		end
	end
	ChamsObjects = {}

	if CombatSettings.ChamsEnabled then
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= Player and plr.Character then
				ApplyChams(plr)
			end
		end
	end
end

for _, plr in pairs(Players:GetPlayers()) do
	if plr ~= Player then
		plr.CharacterAdded:Connect(function()
			task.wait(1)
			if CombatSettings.ChamsEnabled then
				ApplyChams(plr)
			end
		end)
	end
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(1)
		if CombatSettings.ChamsEnabled then
			ApplyChams(plr)
		end
	end)
end)

Players.PlayerRemoving:Connect(function(plr)
	RemoveChams(plr.Name)
end)

task.spawn(function()
	while task.wait(2) do
		if CombatSettings.ChamsEnabled then
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Player and ChamsObjects[plr.Name] then
					local col = GetTeamColor(plr)
					ChamsObjects[plr.Name].FillColor = col
					ChamsObjects[plr.Name].OutlineColor = col
				end
			end
		end
	end
end)

-- ==================== CUSTOM ESP (per-player team color) ====================

local Camera = workspace.CurrentCamera

local function CreateESPForPlayer(plr)
	if plr == Player then return end

	local drawings = {}

	-- Box lines
	drawings.TopLine = Drawing.new("Line")
	drawings.BottomLine = Drawing.new("Line")
	drawings.LeftLine = Drawing.new("Line")
	drawings.RightLine = Drawing.new("Line")

	-- Name
	drawings.NameTag = Drawing.new("Text")
	drawings.NameTag.Center = true
	drawings.NameTag.Outline = true
	drawings.NameTag.Size = 13
	drawings.NameTag.Font = 2

	for _, line in pairs({drawings.TopLine, drawings.BottomLine, drawings.LeftLine, drawings.RightLine}) do
		line.Thickness = 1
		line.Visible = false
	end
	drawings.NameTag.Visible = false

	EspDrawings[plr.Name] = drawings
end

local function RemoveESPForPlayer(playerName)
	if EspDrawings[playerName] then
		for _, d in pairs(EspDrawings[playerName]) do
			d:Remove()
		end
		EspDrawings[playerName] = nil
	end
end

local function UpdateESPDrawings()
	if not CombatSettings.ESPEnabled then
		for name, drawings in pairs(EspDrawings) do
			for _, d in pairs(drawings) do
				d.Visible = false
			end
		end
		return
	end

	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then
			if not EspDrawings[plr.Name] then
				CreateESPForPlayer(plr)
			end

			local drawings = EspDrawings[plr.Name]
			local character = plr.Character
			if not character then
				for _, d in pairs(drawings) do d.Visible = false end
				continue
			end

			local hrp = character:FindFirstChild("HumanoidRootPart")
			local hum = character:FindFirstChildOfClass("Humanoid")
			if not hrp or not hum then
				for _, d in pairs(drawings) do d.Visible = false end
				continue
			end

			local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
			if not onScreen then
				for _, d in pairs(drawings) do d.Visible = false end
				continue
			end

			local teamColor = GetTeamColor(plr)

			-- Calculate box size based on distance
			local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
			local boxHeight = (1 / distance) * 3500
			local boxWidth = boxHeight * 0.6

			local topLeft = Vector2.new(pos.X - boxWidth / 2, pos.Y - boxHeight / 2)
			local topRight = Vector2.new(pos.X + boxWidth / 2, pos.Y - boxHeight / 2)
			local bottomLeft = Vector2.new(pos.X - boxWidth / 2, pos.Y + boxHeight / 2)
			local bottomRight = Vector2.new(pos.X + boxWidth / 2, pos.Y + boxHeight / 2)

			-- Top line
			drawings.TopLine.From = topLeft
			drawings.TopLine.To = topRight
			drawings.TopLine.Color = teamColor
			drawings.TopLine.Visible = true

			-- Bottom line
			drawings.BottomLine.From = bottomLeft
			drawings.BottomLine.To = bottomRight
			drawings.BottomLine.Color = teamColor
			drawings.BottomLine.Visible = true

			-- Left line
			drawings.LeftLine.From = topLeft
			drawings.LeftLine.To = bottomLeft
			drawings.LeftLine.Color = teamColor
			drawings.LeftLine.Visible = true

			-- Right line
			drawings.RightLine.From = topRight
			drawings.RightLine.To = bottomRight
			drawings.RightLine.Color = teamColor
			drawings.RightLine.Visible = true

			-- Name
			drawings.NameTag.Position = Vector2.new(pos.X, pos.Y - boxHeight / 2 - 15)
			drawings.NameTag.Text = plr.DisplayName .. " [" .. plr.Name .. "]"
			drawings.NameTag.Color = teamColor
			drawings.NameTag.Visible = true
		end
	end
end

-- ESP render loop
RunService.RenderStepped:Connect(function()
	UpdateESPDrawings()
end)

-- Cleanup ESP when player leaves
Players.PlayerRemoving:Connect(function(plr)
	RemoveESPForPlayer(plr.Name)
end)

local function GetPlayerList()
	local list = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then
			table.insert(list, plr.Name)
		end
	end
	return list
end

-- ==================== FLING ====================

local function DoFling(targetName)
	local a = {targetName}
	local b = Players
	local c = b.LocalPlayer
	local d = false

	local e = function(f)
		f = f:lower()
		if f == "all" or f == "others" then
			d = true
			return
		elseif f == "random" then
			local g = b:GetPlayers()
			if table.find(g, c) then
				table.remove(g, table.find(g, c))
			end
			return g[math.random(#g)]
		elseif f ~= "random" and f ~= "all" and f ~= "others" then
			for h, i in next, b:GetPlayers() do
				if i ~= c then
					if i.Name:lower():match("^" .. f) then
						return i
					elseif i.DisplayName:lower():match("^" .. f) then
						return i
					end
				end
			end
		else
			return
		end
	end

	local j = function(k, l, m)
		game:GetService("StarterGui"):SetCore("SendNotification", {Title = k, Text = l, Duration = m})
	end

	local n = function(o)
		local p = c.Character
		local q = p and p:FindFirstChildOfClass("Humanoid")
		local r = q and q.RootPart
		local s = o.Character
		local t, u, v, w, x

		if s:FindFirstChildOfClass("Humanoid") then t = s:FindFirstChildOfClass("Humanoid") end
		if t and t.RootPart then u = t.RootPart end
		if s:FindFirstChild("Head") then v = s.Head end
		if s:FindFirstChildOfClass("Accessory") then w = s:FindFirstChildOfClass("Accessory") end
		if w and w:FindFirstChild("Handle") then x = w.Handle end

		if p and q and r then
			if r.Velocity.Magnitude < 50 then
				getgenv().OldPos = r.CFrame
			end

			if t and t.Sit and not d then
				return j("Error Occurred", "Targeting is sitting", 5)
			end

			if v then
				workspace.CurrentCamera.CameraSubject = v
			elseif not v and x then
				workspace.CurrentCamera.CameraSubject = x
			elseif t and u then
				workspace.CurrentCamera.CameraSubject = t
			end

			if not s:FindFirstChildWhichIsA("BasePart") then return end

			local y = function(z, A, B)
				r.CFrame = CFrame.new(z.Position) * A * B
				p:SetPrimaryPartCFrame(CFrame.new(z.Position) * A * B)
				r.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				r.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end

			local C = function(z)
				local D = 2
				local m2 = tick()
				local E = 0
				repeat
					if r and t then
						if z.Velocity.Magnitude < 50 then
							E = E + 100
							y(z, CFrame.new(0, 1.5, 0) + t.MoveDirection * z.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0) + t.MoveDirection * z.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
							y(z, CFrame.new(2.25, 1.5, -2.25) + t.MoveDirection * z.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
							y(z, CFrame.new(-2.25, -1.5, 2.25) + t.MoveDirection * z.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
							y(z, CFrame.new(0, 1.5, 0) + t.MoveDirection, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0) + t.MoveDirection, CFrame.Angles(math.rad(E), 0, 0))
							task.wait()
						else
							y(z, CFrame.new(0, 1.5, t.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, -t.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
							y(z, CFrame.new(0, 1.5, t.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, 1.5, u.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, -u.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
							y(z, CFrame.new(0, 1.5, u.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
							y(z, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until z.Velocity.Magnitude > 500 or z.Parent ~= o.Character or o.Parent ~= b or not o.Character == s or t.Sit or q.Health <= 0 or tick() > m2 + D
			end

			workspace.FallenPartsDestroyHeight = 0 / 0
			local F = Instance.new("BodyVelocity")
			F.Name = "EpixVel"
			F.Parent = r
			F.Velocity = Vector3.new(9e8, 9e8, 9e8)
			F.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
			q:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

			if u and v then
				if (u.CFrame.p - v.CFrame.p).Magnitude > 5 then
					C(v)
				else
					C(u)
				end
			elseif u and not v then
				C(u)
			elseif not u and v then
				C(v)
			elseif not u and not v and w and x then
				C(x)
			else
				return j("Error Occurred", "Target is missing everything", 5)
			end

			F:Destroy()
			q:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = q

			repeat
				r.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				p:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				q:ChangeState("GettingUp")
				table.foreach(p:GetChildren(), function(h, i)
					if i:IsA("BasePart") then
						i.Velocity, i.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				task.wait()
			until (r.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
			return j("Error Occurred", "Random error", 5)
		end
	end

	if a[1] then
		for h, i in next, a do
			e(i)
		end
	else
		return
	end

	if d then
		for h, i in next, b:GetPlayers() do
			if i ~= c then
				n(i)
			end
		end
	end

	for h, i in next, a do
		if e(i) and e(i) ~= c then
			if e(i).UserId ~= 1414978355 then
				local G = e(i)
				if G then
					n(G)
				end
			else
				j("Error Occurred", "This user is whitelisted! (Owner)", 5)
			end
		elseif not e(i) and not d then
			j("Error Occurred", "Username Invalid", 5)
		end
	end
end

-- Noclip loop
task.spawn(function()
	RunService.Stepped:Connect(function()
		if PlayerSettings.NoclipEnabled and Char then
			for _, part in pairs(Char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
	if PlayerSettings.InfJumpEnabled then
		local hum = nil
		if Char and Char:FindFirstChildOfClass("Humanoid") then
			hum = Char:FindFirstChildOfClass("Humanoid")
		end
		if hum then
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- Auto farm loop
local BUILD_HEIGHT_OFFSET = Vector3.new(0, 5, 0)
local HILL_HEIGHT_OFFSET = Vector3.new(0, -2, 0)

task.spawn(function()
	while task.wait(3) do
		if AutoFarm.AutoCollect then
			local collectCF = Tycoon.Auxiliary.Collector.Collect.CFrame
			Char:PivotTo(collectCF)
		end

		if AutoFarm.AutoHillRemoval and ControlPoint:GetAttribute("Owner") ~= Player.Name then
			local StartCFrame = HRP.CFrame
			repeat
				task.wait()
				Char:PivotTo(ControlPointPart.CFrame + HILL_HEIGHT_OFFSET)
			until ControlPoint:GetAttribute("Owner") == Player.Name
			Char:PivotTo(StartCFrame)
		end

		if AutoFarm.AutoBuild then
			for _, b in pairs(Tycoon.Buttons:GetChildren()) do
				local ButtonBase = b.Button
				if ButtonBase.Color == Color3.fromRGB(0, 127, 0) then
					Char:PivotTo(ButtonBase.CFrame + BUILD_HEIGHT_OFFSET)
				end
			end
		end
	end
end)

-- Steal Dollars — старая дистанция (без offset)
workspace.ChildAdded:Connect(function(O)
	if O.Name == "Dollar" and AutoFarm.StealDollars then
		for _, o2 in pairs(workspace:GetChildren()) do
			if o2.Name == "Dollar" then
				task.wait()
				local StartCFrame = HRP.CFrame
				Char:PivotTo(o2.CFrame)
				task.wait()
				Char:PivotTo(StartCFrame)
			end
		end
	end
end)

-- // UI

local Window = Rayfield:CreateWindow({
	Name = "Elemental Powers Tycoon",
	LoadingTitle = "Elemental Powers Tycoon",
	LoadingSubtitle = "Loading...",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Star Yield",
		FileName = "StarYield_Elemental_Powers_Tycoon_config"
	},
	Discord = {
		Enabled = false,
	},
	KeySystem = false,
})

-- Tabs
local TabFarm = Window:CreateTab("Farm", 107364918194164)
local TabCombat = Window:CreateTab("Combat", 80964454894155)
local TabTrolling = Window:CreateTab("Trolling", 108044792581952)
local TabPlayer = Window:CreateTab("Player", 4483362458)

-- ==================== FARM TAB ====================

TabFarm:CreateToggle({
	Name = "Steal Dollars",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		AutoFarm.StealDollars = Value
	end,
})

TabFarm:CreateToggle({
	Name = "Auto Collect",
	CurrentValue = false,
	Flag = "Toggle2",
	Callback = function(Value)
		AutoFarm.AutoCollect = Value
	end,
})

TabFarm:CreateToggle({
	Name = "Auto Build",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		AutoFarm.AutoBuild = Value
	end,
})

TabFarm:CreateToggle({
	Name = "Auto Control Point Removal",
	CurrentValue = false,
	Flag = "Toggle_hill",
	Callback = function(Value)
		AutoFarm.AutoHillRemoval = Value
	end,
})

-- ==================== COMBAT TAB ====================

TabCombat:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "Toggle_ESP",
	Callback = function(Value)
		CombatSettings.ESPEnabled = Value
		if not Value then
			-- Скрыть все ESP рисунки
			for name, drawings in pairs(EspDrawings) do
				for _, d in pairs(drawings) do
					d.Visible = false
				end
			end
		end
	end,
})

TabCombat:CreateToggle({
	Name = "Chams",
	CurrentValue = false,
	Flag = "Toggle_Chams",
	Callback = function(Value)
		CombatSettings.ChamsEnabled = Value
		UpdateAllChams()
	end,
})

-- ==================== TROLLING TAB ====================

local TargetDropdown = nil

TabTrolling:CreateSection("Target Selection")

TargetDropdown = TabTrolling:CreateDropdown({
	Name = "Select Target Player",
	Options = GetPlayerList(),
	CurrentOption = {},
	MultipleOptions = false,
	Flag = "TargetDropdown",
	Callback = function(Options)
		local selectedName = Options[1]
		if selectedName then
			local plr = Players:FindFirstChild(selectedName)
			if plr then
				Trolling.TargetPlayer = plr
				Rayfield:Notify({
					Title = "Target Set",
					Content = "Target: " .. plr.Name,
					Duration = 3,
					Image = 4483362458,
				})
			end
		end
	end,
})

TabTrolling:CreateButton({
	Name = "Refresh Player List",
	Callback = function()
		TargetDropdown:Set(GetPlayerList())
		Rayfield:Notify({
			Title = "Refreshed",
			Content = "Player list updated!",
			Duration = 2,
			Image = 4483362458,
		})
	end,
})

TabTrolling:CreateSection("Actions")

TabTrolling:CreateButton({
	Name = "Teleport to Target",
	Callback = function()
		if Trolling.TargetPlayer and Trolling.TargetPlayer.Character and Trolling.TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			Char:PivotTo(Trolling.TargetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "No target or target has no character!",
				Duration = 3,
				Image = 11745872910,
			})
		end
	end,
})

TabTrolling:CreateButton({
	Name = "Fling Target",
	Callback = function()
		if Trolling.TargetPlayer then
			task.spawn(function()
				DoFling(Trolling.TargetPlayer.Name)
			end)
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Select a target player first!",
				Duration = 3,
				Image = 11745872910,
			})
		end
	end,
})

TabTrolling:CreateButton({
	Name = "Fling All",
	Callback = function()
		task.spawn(function()
			DoFling("all")
		end)
	end,
})

-- ==================== PLAYER TAB ====================

TabPlayer:CreateSection("Movement")

TabPlayer:CreateToggle({
	Name = "Custom Walk Speed",
	CurrentValue = false,
	Flag = "Toggle_Speed",
	Callback = function(Value)
		PlayerSettings.SpeedEnabled = Value
		if not Value then
			local hum = nil
			if Char and Char:FindFirstChildOfClass("Humanoid") then
				hum = Char:FindFirstChildOfClass("Humanoid")
			end
			if hum then
				hum.WalkSpeed = DefaultWalkSpeed
			end
		end
	end,
})

TabPlayer:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 500},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "Slider_Speed",
	Callback = function(Value)
		PlayerSettings.Speed = Value
		if PlayerSettings.SpeedEnabled then
			local hum = nil
			if Char and Char:FindFirstChildOfClass("Humanoid") then
				hum = Char:FindFirstChildOfClass("Humanoid")
			end
			if hum then
				hum.WalkSpeed = Value
			end
		end
	end,
})

TabPlayer:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Flag = "Toggle_InfJump",
	Callback = function(Value)
		PlayerSettings.InfJumpEnabled = Value
	end,
})

TabPlayer:CreateSection("Physics")

TabPlayer:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Toggle_Noclip",
	Callback = function(Value)
		PlayerSettings.NoclipEnabled = Value
	end,
})

-- ==================== DONE ====================

Rayfield:Notify({
	Title = "Loaded!",
	Content = "Elemental Powers Tycoon",
	Duration = 4,
	Image = 4483362458,
	Actions = {
		Ignore = {
			Name = "Okay",
			Callback = function() end
		},
	},
})

setclipboard("https://t.me/vomagla")

Rayfield:Notify({
	Title = "Join our Telegram",
	Content = "Link copied to clipboard!",
	Duration = 8,
	Image = 101192191207677,
	Actions = {
		Ignore = {
			Name = "Okay",
			Callback = function() end
		},
	},
})
