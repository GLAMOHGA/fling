--[[
    Скрипт модифицирован и улучшен (v5).

    Изменения:
    - УДАЛЕНО: TP Walk.
    - ИЗМЕНЕНО: Множители оружия ограничены до x3.
    - УЛУЧШЕНО: FOV теперь можно "заблокировать". Скрипт будет принудительно
                 удерживать выбранное значение, игнорируя изменения от игры (например, при прицеливании).
]]

local a = { cache = {} }

-- [Модуль A: Основные сервисы и утилиты]
do
	do
		local function __modImpl()
			local b = (cloneref(game:GetService 'Players'))
			local c = (cloneref(game:GetService 'RunService'))
			local d = (cloneref(game:GetService 'ReplicatedStorage'))
			local e = (cloneref(game:GetService 'ReplicatedFirst'))
			local f = {}
			local g = false
			f.getPlayers = function() return b end
			f.getRunService = function() return c end
			f.getReplicatedStorage = function() return d end
			f.getLocalPlayer = function()
				local h = b.LocalPlayer
				if not h then h = b.PlayerAdded:Wait() end
				return h
			end
			f.getWeapons = function() return d:FindFirstChild 'Weapons' end
			f.getMap = function() return (workspace:FindFirstChild 'Map') end
			f.getMapIgnores = function() return (f.getMap() and f.getMap():FindFirstChild 'Ignore') end
			f.getMapBlockBullets = function() return (f.getMapIgnores() and f.getMapIgnores():FindFirstChild 'BlockBullets') end
			f.getMapNoBuild = function() return (f.getMapIgnores() and f.getMapIgnores():FindFirstChild 'NoBuild') end
			f.getMapClips = function() return (f.getMap() and f.getMap():FindFirstChild 'Clips') end
			f.getMapTriggersHurt = function() return (f.getMapIgnores() and f.getMapIgnores():FindFirstChild 'trigger_hurt') end
			f.getMapProjectileClips = function() return (f.getMap() and f.getMap().Geometry and f.getMap().Geometry:FindFirstChild 'ProjectileClips') end
			f.getDoctorChangeTarget = function()
				local h = f.getLocalPlayer().Character
				if not h then return else local i = h:FindFirstChild 'Doctor' if not i then return else local j = (i:FindFirstChild 'ChangeValue') if not j then return else return j end end end
			end
			f.shared_breakedAnticheat = function() return getgenv().tc2_anticheat_breaker == true end
			f.isBypassed = function() return f.shared_breakedAnticheat() or g end
			f.setBypassed = function(h) g = h end
			f.destroyIfExists = function(h) if h then h:Destroy() end end
			f.clearIfExists = function(h) if h then h:ClearAllChildren() end end
			return f
		end
		function a.a()
			local b = a.cache.a
			if not b then b = { c = __modImpl() } a.cache.a = b end
			return b.c
		end
	end
	
	-- [Модуль B: Логика модификации оружия]
	do
		local function __modImpl()
			local b = a.a()
			local c = b.getWeapons()
			if not c then return {} end
			local d = (c:GetChildren())
			local e = {}
			for f, g in d do
				e[g.Name] = {}
				for h, i in g:GetChildren() do if i:IsA 'NumberValue' or i:IsA 'IntValue' or i:IsA 'BoolValue' then e[g.Name][i.Name] = (i).Value end end
			end
			local f = {}
			f.originalValues = e
			local function applyMultiplier(statName, multiplier, isInverse)
				for _, weapon in d do
					local statValue = weapon:FindFirstChild(statName)
					if statValue and e[weapon.Name] and e[weapon.Name][statName] then
						local original = e[weapon.Name][statName]
						if isInverse then statValue.Value = original / multiplier else statValue.Value = original * multiplier end
					end
				end
			end
			f.setFirerate = function(g) applyMultiplier('FireRate', g, true) end
			f.setEquipTime = function(g) applyMultiplier('EquipTime', g, true) end
			f.setReloadTime = function(g) applyMultiplier('ReloadSpeed', g, true) end
			f.setShotCount = function(g) applyMultiplier('Bullets', math.floor(g), false) end
			f.toggleInfiniteAmmo = function(enabled)
				for _, weapon in d do
					local ammo, storedAmmo = weapon:FindFirstChild('Ammo'), weapon:FindFirstChild('StoredAmmo')
					if enabled then
						if ammo then ammo.Value = 999999 end
						if storedAmmo then storedAmmo.Value = 999999 end
					else
						if ammo and e[weapon.Name] and e[weapon.Name]['Ammo'] then ammo.Value = e[weapon.Name]['Ammo'] end
						if storedAmmo and e[weapon.Name] and e[weapon.Name]['StoredAmmo'] then storedAmmo.Value = e[weapon.Name]['StoredAmmo'] end
					end
				end
			end
			return f
		end
		function a.b()
			local b = a.cache.b
			if not b then b = { c = __modImpl() } a.cache.b = b end
			return b.c
		end
	end
	
	-- [Модуль C: UI для модификации оружия (Лимит x3)]
	do
		local function __modImpl()
			local b = a.a()
			local c = a.b()
			local d = {}
			d.load = function(e)
				local f = e:AddRightGroupbox('Gun mods', 'sword')
				if b.isBypassed() then
					f:AddSlider('FirerateSlider', { Text = 'Firerate Multiplier', Min = 1, Max = 3, Default = 1, Suffix = 'x', Precise = true, Callback = function(g) c.setFirerate(g) end })
					f:AddSlider('EquipSpeedSlider', { Text = 'Equip Speed Multiplier', Min = 1, Max = 3, Default = 1, Suffix = 'x', Precise = true, Callback = function(g) c.setEquipTime(g) end })
					f:AddSlider('ReloadSpeedSlider', { Text = 'Reload Speed Multiplier', Min = 1, Max = 3, Default = 1, Suffix = 'x', Precise = true, Callback = function(g) c.setReloadTime(g) end })
					f:AddSlider('ShotCountSlider', { Text = 'Shot Count Multiplier', Min = 1, Max = 3, Default = 1, Suffix = 'x', Precise = true, Callback = function(g) c.setShotCount(g) end })
					f:AddDivider()
					f:AddToggle('InfiniteAmmo', { Text = 'Infinite Ammo', Value = false, Callback = function(g) c.toggleInfiniteAmmo(g) end })
				else
					f:AddLabel [[This tab is disabled cause script couldn't bypass anticheat
(so you wont get banned)]]
				end
			end
			return d
		end
		function a.c()
			local b = a.cache.c
			if not b then b = { c = __modImpl() } a.cache.c = b end
			return b.c
		end
	end

	-- [Модуль D: UI для игрока (Удален TP Walk)]
	do
		local function __modImpl()
			local core = a.a()
			local vipSettings = core.getReplicatedStorage():FindFirstChild 'VIPSettings'
			local noVoiceCooldown = (vipSettings and vipSettings:FindFirstChild 'NoVoiceCooldown')
			local aThirdPersonMode = (vipSettings and vipSettings:FindFirstChild 'AThirdPersonMode')
			local noTeamLimits = (vipSettings and vipSettings:FindFirstChild 'NoTeamLimits')
			
			local ui = {}
			ui.load = function(j)
				local k = j:AddLeftGroupbox('Player', 'user')
				if noVoiceCooldown then k:AddToggle('ToggleNoVCCooldown', { Text = 'No VC commands cooldown', Tooltip = "Allows you to spam voice commands.", Value = false, Callback = function(l) noVoiceCooldown.Value = l end }) end
				if aThirdPersonMode then k:AddToggle('ToggleCameraMode', { Text = 'Enable camera mode changer', Tooltip = 'Allows you to change camera modes by pressing F5.', Value = false, Callback = function(l) aThirdPersonMode.Value = l end }) end
				if noTeamLimits then k:AddToggle('ToggleFullTeams', { Text = 'Allow to join full teams', Tooltip = "Allows you to join equal teams.", Value = false, Callback = function(l) noTeamLimits.Value = l end }) end
				k:AddDivider()
				k:AddLabel 'Heal yourself as Doctor bind':AddKeyPicker('BindDoctorHeal', { Default = 'E', NoUI = true, Text = 'Key', Callback = function()
					local m = core.getDoctorChangeTarget()
					if m then m:FireServer('Target', core.getLocalPlayer().Name) end
				end })
				k:AddDivider()
				k:AddButton('Remove invisible walls', function()
					core.clearIfExists(core.getMapClips())
					core.clearIfExists(core.getMapBlockBullets())
					core.clearIfExists(core.getMapNoBuild())
					core.clearIfExists(core.getMapProjectileClips())
				end)
				k:AddButton('Remove kill parts', function() core.clearIfExists(core.getMapTriggersHurt()) end)
			end
			return ui
		end
		function a.d()
			local b = a.cache.d
			if not b then b = { c = __modImpl() } a.cache.d = b end
			return b.c
		end
	end
	
	-- [Модуль E: Анти-чит]
	do
		local function __modImpl()
			local b = a.a()
			local c = b.getRunService()
			local d = b.getReplicatedStorage()
			local e = b.getLocalPlayer()
			return function()
				repeat c.Heartbeat:Wait() until d:GetAttribute 'sv_setup' and e:GetAttribute 'FillMeIn'
				for f = 1, 20 do c.Heartbeat:Wait() end
				local f, g = false, 0
				for i, j in getreg() do
					if typeof(j) ~= 'thread' then continue end
					local k = debug.info(j, 1, 's')
					if k and (k:match 'NewLoader') then task.cancel(j) g += 1 if g == 3 then f = true break end end
				end
				if g ~= 3 then warn(string.format('expected 3 threads, got %s', g)) warn 'blocking gun mods' f = false end
				getgenv().tc2_anticheat_breaker = f
				return f
			end
		end
		function a.e()
			local b = a.cache.e
			if not b then b = { c = __modImpl() } a.cache.e = b end
			return b.c
		end
	end
	
	-- [Модуль F, G: Визуалы (Улучшен FOV Lock)]
	do
		local function __modImpl()
			local players, runService, localPlayer, lighting, camera = game:GetService("Players"), game:GetService("RunService"), game:GetService("Players").LocalPlayer, game:GetService("Lighting"), workspace.CurrentCamera
			local visuals, espConnection, originalSky = { fovEnabled = false, targetFov = 70 }, nil, lighting:FindFirstChildOfClass("Sky")
			
			-- Постоянный цикл для блокировки FOV
			runService.RenderStepped:Connect(function()
				if visuals.fovEnabled and camera.FieldOfView ~= visuals.targetFov then
					camera.FieldOfView = visuals.targetFov
				end
			end)

			-- ESP
			visuals.toggleEsp = function(enabled)
				if not enabled then
					if espConnection then espConnection:Disconnect() espConnection = nil end
					for _, player in players:GetPlayers() do if player.Character and player.Character:FindFirstChild("ESP_Highlight") then player.Character.ESP_Highlight:Destroy() end end
				else
					if espConnection then return end
					espConnection = runService.RenderStepped:Connect(function()
						for _, player in players:GetPlayers() do
							if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Team ~= localPlayer.Team then
								local highlight = player.Character:FindFirstChild("ESP_Highlight") or Instance.new("Highlight", player.Character)
								highlight.Name, highlight.DepthMode, highlight.OutlineTransparency, highlight.FillTransparency = "ESP_Highlight", Enum.HighlightDepthMode.AlwaysOnTop, 0, 0.5
								highlight.FillColor, highlight.OutlineColor = player.TeamColor.Color, player.TeamColor.Color
							elseif player.Character and player.Character:FindFirstChild("ESP_Highlight") then
								player.Character.ESP_Highlight:Destroy()
							end
						end
					end)
				end
			end
			
			-- Skybox
			visuals.setSkybox = function(skyboxName)
				if lighting:FindFirstChild("CustomSky") then lighting.CustomSky:Destroy() end
				if originalSky then originalSky.Parent = nil end
				if skyboxName == "Default" then if originalSky then originalSky.Parent = lighting end return end
				local sky, ids = Instance.new("Sky"), {}
				sky.Name = "CustomSky"
				if skyboxName == "Purple" then ids = { Bk = 17279854976, Dn = 17279856318, Ft = 17279858447, Lf = 17279860360, Rt = 17279862234, Up = 17279864507 }
				elseif skyboxName == "Space" then ids = { Bk = 12064107, Dn = 12064152, Ft = 12064121, Lf = 12063984, Rt = 12064115, Up = 12064131 }
				elseif skyboxName == "Red" then ids = { Bk = 271042516, Dn = 271077243, Ft = 271042556, Lf = 271042310, Rt = 271042467, Up = 271077958 } end
				for k, v in pairs(ids) do sky["Skybox" .. k] = "rbxassetid://" .. v end
				sky.Parent = lighting
			end

			-- Time of Day
			visuals.setTimeOfDay = function(time) lighting.ClockTime = time end

			-- FOV Changer
			visuals.toggleFovLock = function(enabled)
				visuals.fovEnabled = enabled
				if not enabled then
					camera.FieldOfView = 70 -- Сброс на стандартный FOV при отключении
				end
			end
			visuals.setFov = function(fov)
				visuals.targetFov = fov
			end
			
			return visuals
		end
		function a.f() local b = a.cache.f if not b then b = { c = __modImpl() } a.cache.f = b end return b.c end
	end
	do
		local function __modImpl()
			local visualsLogic = a.f()
			local ui = {}
			ui.load = function(tab)
				local visualsGroup = tab:AddLeftGroupbox("Visual Settings", "eye")
				visualsGroup:AddToggle("TogglePlayerESP", { Text = "Enable Player ESP", Tooltip = "Highlights enemy players.", Value = false, Callback = visualsLogic.toggleEsp })
				visualsGroup:AddDivider()

				visualsGroup:AddLabel("Camera Settings")
				visualsGroup:AddToggle("FovLockToggle", { Text = "Enable & Lock FOV", Tooltip = "Forces the FOV to the value set below.", Value = false, Callback = visualsLogic.toggleFovLock })
				visualsGroup:AddSlider("FovSlider", { Text = "Field of View", Min = 70, Max = 120, Default = 70, Suffix = "°", Callback = visualsLogic.setFov })
				visualsGroup:AddDivider()

				visualsGroup:AddLabel("World Settings")
				visualsGroup:AddDropdown("SkyboxPicker", { Text = "Change Skybox", Values = { "Default", "Purple", "Space", "Red" }, Default = "Default", Callback = visualsLogic.setSkybox })
				visualsGroup:AddSlider("TimeOfDaySlider", { Text = "Time of Day", Min = 0, Max = 24, Default = game:GetService("Lighting").ClockTime, Precise = true, Callback = visualsLogic.setTimeOfDay })
			end
			return ui
		end
		function a.g() local b = a.cache.g if not b then b = { c = __modImpl() } a.cache.g = b end return b.c end
	end
end

-- [Основной код запуска]
pcall(function()
	local core, gunModsUi, playerUi, visualsUi = a.a(), a.c(), a.d(), a.g()
	local libBody = request { Url = [[https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua]], Method = 'GET' }.Body
	local loadLib, libErr = loadstring(libBody)
	assert(loadLib, string.format('Obsidian UI Library failed to load: %s', tostring(libErr)))
	local obsidian = (loadLib())

	task.spawn(function()
		local window = obsidian:CreateWindow { Title = 'Tc2 hacks?!', Footer = 'version: 5', Icon = '', NotifySide = 'Right', Center = true, ShowCustomCursor = false }
		local mainTab, visualsTab, settingsTab = window:AddTab('Main', 'user'), window:AddTab('Visuals', 'eye'), window:AddTab('Settings', 'wrench')
		
		local settingsGroup = settingsTab:AddLeftGroupbox('UI Settings', 'wrench')
		settingsGroup:AddLabel 'Menu bind':AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind', ChangedCallback = function(m)
			if m:IsA 'KeyCode' then obsidian.ToggleKeybind = m end
		end })
		settingsGroup:AddButton('Unload', function() 
			workspace.CurrentCamera.FieldOfView = 70
			obsidian:Unload()
		end)
		obsidian.ToggleKeybind = Enum.KeyCode.RightShift
		
		playerUi.load(mainTab)
		
		if not core.shared_breakedAnticheat() then
			obsidian:Notify { Title = 'Bypassing anti hacker...', Description = 'Gun mods will be available after bypass.', Time = 5 }
			core.setBypassed(a.e()())
		end
		
		gunModsUi.load(mainTab)
		visualsUi.load(visualsTab)
	end)
end)
