-- //
--||  Rost Alpha
-- \\
do
    if not LPH_OBFUSCATED then
        function LPH_NO_VIRTUALIZE(f)return f end
        function LPH_JIT(...)return ... end
        function LPH_JIT_MAX(...)return ... end
        function LPH_NO_UPVALUES(f)return function(...)return f(...)end end
        function LPH_ENCSTR(...)return ... end
        function LPH_ENCNUM(...)return ... end
        function LPH_CRASH()warn(debug.traceback())end
    end

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local httpService = cloneref(game:GetService("HttpService"))
    local gui = Instance.new("ScreenGui")
    gui.Name = httpService:GenerateGUID(false)
    gui.IgnoreGuiInset = true
    gui.Parent = cloneref(gethui())

    getgenv().gethui = newcclosure(function()
        return cloneref(gui)
    end)
end
game:GetService("ScriptContext").Error:Connect(function(m,t,s)if not s then game.Players.LocalPlayer:Kick("Contact Admin\n"..m)end end)
if getgenv().library and getgenv().library.unload_menu then
    pcall(function() getgenv().library:unload_menu() end)
end

--// as chese this is the best code i have ever seen
--\\ as matik this is the worst code i have ever seen

Start       = tick(); --// tiki tiki tiki
Executor    = identifyexecutor()

--// new lib cuz bronik one was broken cooked
local UiUrl = "https://raw.githubusercontent.com/sametexe001/sametlibs/refs/heads/main/Scoot/Library.lua"

function httpGetString(url)
    local req = syn and syn.request or http_request or request
    if req then
        local res = req({
            Url = url,
            Method = "GET"
        })

        if type(res) == "table" then
            return tostring(res.Body or res.body or "")
        end
    end

    return tostring(game:HttpGet(url))
end

pcall(function()
    if isfolder("ArabHub/Assets") then
        for _, file in ipairs({
            "Saturation.png",
            "Value.png",
            "Hue.png",
            "Checkers.png",
            "Monaco.ttf",
            "Monaco.json"
        }) do
            local path = "ArabHub/Assets/" .. file
            if isfile(path) and delfile then
                delfile(path)
            end
        end
    end
end)

local src = httpGetString(UiUrl)

src = src:gsub(
    "game:HttpGet%(",
    "httpGetString("
)

src = src:gsub(
    "if ok and result then writefile",
    "if ok and type(result) == 'string' and #result > 0 then writefile"
)

local Library = loadstring(src)()
--// ogalala librari
Library:ChangeTheme("Accent",          Color3.fromRGB(150, 50, 200))  --// original purple accent
Library:ChangeTheme("Background",      Color3.fromRGB(12,  12,  12))   --// darker bg
Library:ChangeTheme("Inline",          Color3.fromRGB(18,  18,  18))   --// section bg
Library:ChangeTheme("Page Background", Color3.fromRGB(20,  20,  20))   --// tab bg
Library:ChangeTheme("Element",         Color3.fromRGB(26,  26,  26))   --// toggle/slider bg
Library:ChangeTheme("Hovered Element", Color3.fromRGB(35,  35,  35))   --// hover
Library:ChangeTheme("Border",          Color3.fromRGB(10,  10,  10))   --// outer border
Library:ChangeTheme("Outline",         Color3.fromRGB(38,  38,  38))   --// inner outline
Library:ChangeTheme("Text",            Color3.fromRGB(230, 230, 230))  --// text
Library:ChangeTheme("Gradient",        Color3.fromRGB(180, 180, 180))  --// gradient end

--// nooo
local _origGetConfig = Library.GetConfig
Library.GetConfig = function(self)
    local json = _origGetConfig(self)
    --// append our custom positions
    local ok, data = pcall(function() return game:GetService("HttpService"):JSONDecode(json) end)
    if ok and type(data) == "table" then
        --// moderator list position
        if StaffListGui then
            local mf = StaffListGui:FindFirstChildOfClass("Frame")
            if mf then
                data["__modlist_pos_x"] = mf.Position.X.Offset
                data["__modlist_pos_y"] = mf.Position.Y.Offset
            end
        end
        --// armor viewer position
        if ArmorInfoFrame then
            data["__armor_pos_x"] = ArmorInfoFrame.Position.X.Offset
            data["__armor_pos_y"] = ArmorInfoFrame.Position.Y.Offset
        end
        local ok2, newJson = pcall(function() return game:GetService("HttpService"):JSONEncode(data) end)
        if ok2 then return newJson end
    end
    return json
end

local _origLoadConfig = Library.LoadConfig
Library.LoadConfig = function(self, json)
    local result = _origLoadConfig(self, json)
    --// restore our custom positions
    local ok, data = pcall(function() return game:GetService("HttpService"):JSONDecode(json) end)
    if ok and type(data) == "table" then
        if data["__modlist_pos_x"] and StaffListGui then
            local mf = StaffListGui:FindFirstChildOfClass("Frame")
            if mf then
                mf.Position = UDim2.new(0, data["__modlist_pos_x"], 0, data["__modlist_pos_y"] or 0)
            end
        end
        if data["__armor_pos_x"] and ArmorInfoFrame then
            ArmorInfoFrame.Position = UDim2.new(0, data["__armor_pos_x"], 0, data["__armor_pos_y"] or 12)
        end
    end
    return result
end

--// sync "custom uis" with library theme whenever accent changes
local _origChangeTheme = Library.ChangeTheme
Library.ChangeTheme = function(self, theme, color)
    _origChangeTheme(self, theme, color)
    if theme == "Accent" then
        --// update armor viewer accent
        pcall(function()
            for _, v in ipairs(ArmorInfoFrame:GetDescendants()) do
                if v:IsA("Frame") and v.BackgroundColor3 == Library.Theme.Accent then
                    v.BackgroundColor3 = color
                end
            end
        end)
        --// update moderator list accent
        pcall(function()
            if StaffListGui then
                for _, v in ipairs(StaffListGui:GetDescendants()) do
                    if v:IsA("Frame") and v.BackgroundColor3 == Library.Theme.Accent then
                        v.BackgroundColor3 = color
                    end
                end
            end
        end)
    end
end

do --// client bypass // i did not make this tysm to ham or wtv hes name is and i- i i am iron man
    for _, f in getgc() do
        if typeof(f) == "function" and string.find(debug.info(f, "s"), "RayCastHandler") then
            hookfunction(f, function()
                return task.wait(9e9)
            end)
        end
    end
end

local Cheat = { GameName = "Rost Alpha", Modules = {}, Globals = {} }
local flags = {}
local config_flags = {}

function safeRun(func)
    local ok, err = xpcall(func, function(e) return e end)
    if not ok then
        local msg = tostring(err)
        pcall(function() Library:Notification("Error", msg, 5) end)
    end
end
--// Modules
    local Workspace = cloneref(game:GetService("Workspace"))
    local SoundService = game:GetService("SoundService")
    local run_service = cloneref(game:GetService("RunService"))
    local rs = cloneref(game:GetService("ReplicatedStorage"))
    local players = cloneref(game:GetService("Players"))
    local uis = cloneref(game:GetService("UserInputService"))
    local tween_service = cloneref(game:GetService("TweenService"))
    local stats = cloneref(game:GetService("Stats"))
    local get_team = cloneref(game:GetService("Teams"))
    local lighting = cloneref(game:GetService("Lighting"))
    local teams = get_team:GetTeams()
    local camera = Workspace["CurrentCamera"]
    local viewport_size = camera["ViewportSize"]
    local local_player = players["LocalPlayer"]
    local lplayer_name = local_player["Name"]
    local local_char = local_player.Character or local_player.CharacterAdded:Wait()
    Cheat.Globals.ClientCharacter = local_char
    local get_mouse = local_player:GetMouse()
    local sky = lighting:FindFirstChildOfClass("Sky") or cloneref(Instance.new("Sky", lighting))
    local color_correct = lighting:FindFirstChildOfClass("ColorCorrectionEffect")
            or cloneref(Instance.new("ColorCorrectionEffect", lighting))
    local fov_circle, sounds, tracs, snap_lines, skys = {}, {}, {}, {},  {};
    local info_viewer= {};
    local player = players.LocalPlayer
--//

--// cache
    local lighting_cache = {
        ClockTime = lighting.ClockTime,
        FogEnd = lighting.FogEnd,
        Ambient = lighting.Ambient,
        OutdoorAmbient = lighting.OutdoorAmbient
    }

    local atmosphere = lighting:FindFirstChild("Atmosphere")
    if atmosphere then
        lighting_cache.Density = atmosphere.Density
        lighting_cache.Offset = atmosphere.Offset
        lighting_cache.Glare = atmosphere.Glare
        lighting_cache.Haze = atmosphere.Haze
    end

    local player = local_player
    local character = nil
    local hrp = nil
    local humanoid = nil

    function waitForCharacter()
        character = player.Character or player.CharacterAdded:Wait()
        hrp = character:WaitForChild("HumanoidRootPart")
        humanoid = character:WaitForChild("Humanoid")
        Cheat.Globals.ClientCharacter = character
    end
    
    player.CharacterAdded:Connect(function()
        waitForCharacter()
        if Cheat.Globals.RaycastParams then
            Cheat.Globals.RaycastParams.FilterDescendantsInstances = {
                workspace.CurrentCamera,
                Cheat.Globals.ClientCharacter,
            }
        end
    end)
--//
local run = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local localPlayer = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local Character

run.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(Delta)
	Character = localPlayer.Character
	local Root = Character and Character:FindFirstChild("HumanoidRootPart")
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

	local IsFlying = false
	if Humanoid and Root then 
		if flags["FlyEnabled"] and flags["FlyKeybind"] and flags["FlyKeybind"].active then
			IsFlying = true
			task.spawn(function()
				if Humanoid and Humanoid.Health > 0 then
					local speedMult = flags["FlySpeed"] or 1
					local currentDelta = Delta * speedMult * 3
					local MoveVector = Humanoid.MoveDirection

					if uis:IsKeyDown(Enum.KeyCode.E) then
						MoveVector = MoveVector + Vector3.new(0, 1, 0)
					end
					if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
						MoveVector = MoveVector + Vector3.new(0, -1, 0)
					end
					if uis:IsKeyDown(Enum.KeyCode.W) then
						MoveVector = MoveVector + Vector3.new(0, camera.CFrame.LookVector.Y, 0)
					end
					if uis:IsKeyDown(Enum.KeyCode.S) then
						MoveVector = MoveVector + Vector3.new(0, -camera.CFrame.LookVector.Y, 0)
					end

					local MovementDelta = MoveVector * currentDelta
					local Position = Root.CFrame.Position + MovementDelta
					Humanoid.PlatformStand = false
					Root.Velocity = Vector3.zero
					Root.CFrame = CFrame.new(Position, Position + Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z))
				end
			end)
		end

		if flags["FlyEnabled"] and IsFlying then
			local Origin = Root.Position
			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.FilterDescendantsInstances = {Character}
			rayParams.IgnoreWater = true
			
			local Result = workspace:Raycast(Origin, Vector3.new(0, -1000, 0), rayParams)
			if Result and Result.Distance > 12 then
				task.spawn(function()
					local OldVel = Root.Velocity
					for _, Part in ipairs(Character:GetChildren()) do
						if Part:IsA("BasePart") or Part:IsA("MeshPart") then
							Part.Velocity = Vector3.new(0, -9999, 0)
						end
					end
					run.RenderStepped:Wait()
					for _, Part in ipairs(Character:GetChildren()) do
						if Part:IsA("BasePart") or Part:IsA("MeshPart") then
							Part.Velocity = OldVel
						end
					end
				end)
			end
		end
	end
end))
    local chams_textures = {
        ["Scan"] = "rbxassetid://9305457875",
        ["Scanning-hexagon"] = "rbxassetid://89067318",
        ["Hexagon"] = "rbxassetid://2930247814",
        ["Alien"] = "rbxassetid://459487304",
        ["Triangles"] = "rbxassetid://1478668577",
        ["Illusion"] = "rbxassetid://5841714970",
        ["Ground"] = "rbxassetid://11619804506",
        ["Lasers"] = "rbxassetid://398330154",
        ["Player"] = "rbxassetid://4504366173",
        ["Stars"] = "rbxassetid://4952604311",
        ["Lidar"] = "rbxassetid://965496575",
        ["Pixels"] = "rbxassetid://140652787",
        ["Pixels2"] = "rbxassetid://11780157037",
        ["Lidar2"] = "rbxassetid://13173535584",
        ["CityScan"] = "rbxassetid://951824492",
        ["Clouds"] = "rbxassetid://1723973648",
        ["Rainbow"] = "rbxassetid://10037165803",
        ["Scanning"] = "rbxassetid://5843010904",
        ["Groove"] = "rbxassetid://10785404176",
        ["Waves"] = "rbxassetid://6151763633",
        ["Corrupted"] = "rbxassetid://1212976946",
        ["Tiles"] = "rbxassetid://85065287",
        ["Netflix"] = "rbxassetid://8313072955",
        ["Circle"] = "rbxassetid://13996983074",
        ["Web"] = "rbxassetid://301464986",
        ["Swirl"] = "rbxassetid://8133639623",
        ["Scratches"] = "rbxassetid://4952604311",
        ["Webz"] = "rbxassetid://14410238962",
        ["Pixels3"] = "rbxassetid://12561493608",
        ["Outline"] = "rbxassetid://12361388066",
        ["Webz2"] = "rbxassetid://12646281757",
        ["Outline2"] = "rbxassetid://5125811022",
        ["Akatsuki"] = "rbxassetid://10913193650",
        ["America"] = "rbxassetid://936775406",
        ["Shield Forcefield"] = "rbxassetid://361073795",
        ["Water"] = "rbxasset://textures/water/normal_21.dds",
    };

    local targetutil = {entry = nil, closest_part = nil, hasshot = false}

    local skyboxes = {
        ["Blue Sky"] = { "591058823", "591059876", "591058104", "591057861", "591057625", "591059642" },
        ["Vaporwave"] = { "1417494030", "1417494146", "1417494253", "1417494402", "1417494499", "1417494643" },
        ["Redshift"] = { "401664839", "401664862", "401664960", "401664881", "401664901", "401664936" },
        ["Blaze"] = { "150939022", "150939038", "150939047", "150939056", "150939063", "150939082" },
        ["Among Us"] = { "5752463190", "5752463190", "5752463190", "5752463190", "5752463190", "5752463190" },
        ["Dark Night"] = { "6285719338", "6285721078", "6285722964", "6285724682", "6285726335", "6285730635" },
        ["Bright Pink"] = { "271042516", "271077243", "271042556", "271042310", "271042467", "271077958" },
        ["Purple Sky"] = { "570557514", "570557775", "570557559", "570557620", "570557672", "570557727" },
        ["Galaxy"] = { "15125283003", "15125281008", "15125277539", "15125279325", "15125274388", "15125275800" },
        ["Pinky Sky"] = { "11427769401", "11427770685", "11427769401", "11427769401", "11427769401", "11427771954" },
    }

    local hit_sounds = {
        ["Dink"]      = "rbxassetid://988593556";
        ["TF2"]       = "rbxassetid://8255306220";
        ["Gamesense"] = "rbxassetid://4817809188";
        ["Rust"]      = "rbxassetid://1255040462";
        ["Neverlose"] = "rbxassetid://8726881116";
        ["Bubble"]    = "rbxassetid://198598793";
        ["Quake"]     = "rbxassetid://1455817260";
        ["Among-Us"]  = "rbxassetid://7227567562";
        ["Ding"]      = "rbxassetid://2868331684";
        ["Minecraft"] = "rbxassetid://6361963422";
        ["Blackout"]  = "rbxassetid://3748776946";
        ["Osu"]       = "rbxassetid://7151989073";
        ["UWU"]       = "rbxassetid://8679659744";
    };

    local tracers_ids = {
        ["Double Helix"] = "rbxassetid://1134824633", 
        ["Electric"] = "rbxassetid://446111271",
        ["Electric + Glow"] = "rbxassetid://5864341017", 
        ["Fade"] = "rbxassetid://7136858729",
        ["Pulsate"] = "rbxassetid://5889875399", 
        ["Red Lazer"] = "rbxassetid://6333823534", 
        ["Smoke"] = "rbxassetid://3517446796", 
        ["Warp"] = "rbxassetid://7151778302", 
        ["1"] = "rbxassetid://9150663556",
        ["2"] = "rbxassetid://2950987173",
        ["3"] = "rbxassetid://6511613786",
    };

    for name in pairs(tracers_ids) do 
        table.insert(tracs, name) 
    end;


    for v in pairs(skyboxes) do
        table.insert(skys, v)
    end

    for name in pairs(hit_sounds) do 
        table.insert(sounds, name) 
    end;
--//


local freecam = {
    enabled = false,
    pitch = 0,
    yaw = 0,
    keys = {},
    old_type = Enum.CameraType.Custom,
    old_behavior = Enum.MouseBehavior.Default,
}


local entry, closest_part
local target_frame = {
    target = {
        entry = nil,
        part = nil,
        distance = math.huge,
    },
}   
local highlight_player = nil
local player_esp = {
    player_cache = {},
    drawing_cache = {},

    childadded_connections = {},
    childremoved_connections = {},
    functions = {},
}


local platform = Instance.new("Part")
platform.Size = Vector3.new(2, 0.1, 2)
platform.Anchored = true
platform.BrickColor = BrickColor.new("Black")
platform.CanCollide = true
platform.Name = "Platform"
platform.Parent = Workspace
platform.Transparency = 1


local xere = 0.2
local yere = -1
local zere = -2
local rotX = 0
local rotY = 0
local rotZ = 0
local viewenabal = false

local selected_sound = "rbxassetid://8255306220"
local newId = hit_sounds[selected_sound]


function getSoundId(sound)
	if not sound:IsA("Sound") then
		return false
	end

	local name = sound.Name:lower()

	if name:find("headshot") then
		return true
	end

	if name:find("hit") then
		return true
	end

	return false
end


function replaceSounds(root)
	if not root then return end
    if not flags["Hitsounds"] then return end

	for _, inst in ipairs(root:GetDescendants()) do
		if inst:IsA("Sound") then
			local name = inst.Name:lower()
            local should = getSoundId(inst)
			if newId and inst.SoundId ~= newId and should then
				inst.SoundId = newId
			end
		end
	end
end


function onCharacterAdded(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            if flags["Hitsounds"] then
                replaceSounds(child)
            end
        end
    end)
end

if local_player.Character then
    onCharacterAdded(local_player.Character)
end

local_player.CharacterAdded:Connect(onCharacterAdded)

local RunHandler = require(rs.Modules.RunHandler)

RunHandler.CanRun = true

hookfunction(RunHandler.stopRun, function()
	return
end)

--// Sprint speed: disabled in favor of CFrame stepping speed hack method
--// run_service.Heartbeat:Connect(function()
--//     local spd = flags["Sprint Speed"]
--//     if spd and spd ~= 27 then
--//         --// patch the run speed constant in RunHandler.run (index 19 = 20.8 default)
--//         pcall(function() setconstant(RunHandler.run, 19, spd) end)
--//     end
--// end)


run_service.RenderStepped:Connect(function()
	if flags["OmniSprint"] then
		RunHandler.Running = true
	else
		RunHandler.Running = false
	end

	if flags["NoJumpi"] then
		if not jumpScript or not jumpScript.Parent then
			jumpScript = local_player.PlayerGui:FindFirstChild("JumpCooldown")
		end
		if jumpScript and not jumpScript.Disabled then
			jumpScript.Disabled = true
		end
	elseif jumpScript then
		jumpScript.Disabled = false
		jumpScript = nil
	end
end)

--// reset jumpScript on respawn so it gets re-found in PlayerGui
local_player.CharacterAdded:Connect(function()
    jumpScript = nil
end)


local RecoilModule = rs
	:WaitForChild("Gun")
	:WaitForChild("Scripts")
	:WaitForChild("RecoilHandler")

local Recoil = require(RecoilModule)

local originalNextStep = Recoil.nextStep
local hooky = false

function applyRecoilHook()
	if hooky then return end
	hooky = true

	Recoil.nextStep = function(self, ...)
		if flags["NoRecoil"] then
			return
		else
            return originalNextStep(self, ...)
        end
	end
end

function removeRecoilHook()
	if not hooky then return end
	hooky = false
	Recoil.nextStep = originalNextStep
end



local hooksEnabled = false

local FAKE_PITCH_ENABLED = false

local GunClient = require(rs.Gun.Scripts.GunClient)
local ToolClient = require(rs.Tool.Scripts.ToolClient)

local originalGunUpdate = GunClient.updateServerCharacterRotation
local originalToolUpdate = ToolClient.updateServerCharacterRotation


local function getJitterPitch()
    local values = {
        math.rad(-89),
        math.rad(89),
        math.rad(-70),
        math.rad(70),
        math.rad(-45),
        math.rad(45)
    }
    return values[math.random(1, #values)]
end

local HARD_PITCHES = {
    -89, 
     89, 
    -70,
     70,
    -45,
     45
}

local Remotes = rs.Tool.Remotes


local function gunHook(self, ...)
    if not FAKE_PITCH_ENABLED then
        return originalGunUpdate(self, ...)
    end

    local realCFrame = camera.CFrame

    local fakeCFrame =
        CFrame.new(realCFrame.Position)
        * CFrame.Angles(getJitterPitch(), 0, 0)

    camera.CFrame = fakeCFrame
    local result = originalGunUpdate(self, ...)
    camera.CFrame = realCFrame

    return result
end

local function toolHook(self)
    if not FAKE_PITCH_ENABLED or not self or not self.Id then
        return originalToolUpdate(self)
    end

    local fakePitch = math.rad(HARD_PITCHES[math.random(1, #HARD_PITCHES)])

    local buf = buffer.create(8)
    buffer.writeu32(buf, 0, self.Id)
    buffer.writef32(buf, 4, fakePitch)

    Remotes.UpdateCharacterRotation:FireServer(buf)
end

function EnableFakePitch()
    if hooksEnabled then return end
    hooksEnabled = true
    FAKE_PITCH_ENABLED = true

    GunClient.updateServerCharacterRotation = gunHook
    ToolClient.updateServerCharacterRotation = toolHook
end

function DisableFakePitch()
    if not hooksEnabled then return end
    hooksEnabled = false
    FAKE_PITCH_ENABLED = false

    GunClient.updateServerCharacterRotation = originalGunUpdate
    ToolClient.updateServerCharacterRotation = originalToolUpdate
end




GunBase = require(rs.Gun.Scripts.GunBase)

originalcanFire = GunBase.canFire
originalfire = GunBase.fire

hooked = false

--////// RELOAD INDICATOR
do
    local _reloadGui = Instance.new("ScreenGui")
    _reloadGui.Name = "ReloadIndicator"
    _reloadGui.ResetOnSpawn = false
    _reloadGui.IgnoreGuiInset = true
    _reloadGui.DisplayOrder = 998
    _reloadGui.Parent = gethui and gethui() or game:GetService("CoreGui")

    local _reloadHolder = Instance.new("Frame")
    _reloadHolder.Name = "ReloadHolder"
    _reloadHolder.AnchorPoint = Vector2.new(0.5, 1)
    _reloadHolder.Position = UDim2.new(0.5, 0, 1, -80)
    _reloadHolder.Size = UDim2.new(0, 160, 0, 16)
    _reloadHolder.BackgroundTransparency = 1
    _reloadHolder.Visible = false
    _reloadHolder.Parent = _reloadGui

    --//// background track
    local _reloadBg = Instance.new("Frame")
    _reloadBg.Size = UDim2.new(1, 0, 0, 6)
    _reloadBg.Position = UDim2.new(0, 0, 0.5, -3)
    _reloadBg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _reloadBg.BorderSizePixel = 0
    _reloadBg.Parent = _reloadHolder
    local _bgCorner = Instance.new("UICorner"); _bgCorner.CornerRadius = UDim.new(1,0); _bgCorner.Parent = _reloadBg
    local _bgStroke = Instance.new("UIStroke"); _bgStroke.Color = Color3.fromRGB(0,0,0); _bgStroke.Thickness = 1; _bgStroke.Parent = _reloadBg

    --//// fill bar
    local _reloadFill = Instance.new("Frame")
    _reloadFill.Size = UDim2.new(0, 0, 1, 0)
    _reloadFill.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
    _reloadFill.BorderSizePixel = 0
    _reloadFill.Parent = _reloadBg
    local _fillCorner = Instance.new("UICorner"); _fillCorner.CornerRadius = UDim.new(1,0); _fillCorner.Parent = _reloadFill

    --//// label removed, bar only

    --//// state
    local _reloadStart = 0
    local _reloadDuration = 0
    local _isReloading = false
    local _lastReloadEnd = 0
    local _hookedTriggered = false  --//// true if the hook fired this reload (blocks fallback poll)

    --//// hook GunBase reload methods
    local function _hookReload(base)
        local origReload = base.reload or base.Reload or base.startReload or base.beginReload
        if not origReload then return end
        local hooked_name = base.reload and "reload" or base.Reload and "Reload" or base.startReload and "startReload" or "beginReload"
        local orig = base[hooked_name]
        base[hooked_name] = function(self, ...)
            --//// try to read reload time from self
            local dur = rawget(self, "ReloadTime") or rawget(self, "ReloadDuration")
                     or rawget(self, "reload_time") or rawget(self, "reloadTime") or 2
            _reloadStart    = tick()
            _reloadDuration = dur
            _isReloading    = true
            _hookedTriggered = true
            local result = orig(self, ...)
            return result
        end
    end
    pcall(_hookReload, GunBase)

    --// render on heartbeat
    run_service.Heartbeat:Connect(function()
        if not flags["ReloadIndicator"] then
            _reloadHolder.Visible = false
            return
        end

        if _isReloading then
            local elapsed = tick() - _reloadStart
            local progress = math.clamp(elapsed / math.max(_reloadDuration, 0.01), 0, 1)

            --// auto-stop when done
            if progress >= 1 then
                _isReloading = false
                _hookedTriggered = false
                _lastReloadEnd = tick()
                _reloadHolder.Visible = false
                return
            end

            _reloadHolder.Visible = true
            _reloadFill.Size = UDim2.new(progress, 0, 1, 0)

            --// color shifts yellow -> green as it fills
            _reloadFill.BackgroundColor3 = Color3.fromRGB(
                math.floor(255 * (1 - progress) + 0.5),
                math.floor(180 + 75 * progress + 0.5),
                50
            )
        else
            _reloadHolder.Visible = false
        end
    end)

    --// expose _gunCache reference for the fallback poll above
    --// (set after gun cache do-block runs, so we use a late-bind via getgenv)
    getgenv()._reloadGetCache = function() return _gunCache end
end

function applyHooks()
	if hooked then return end
	hooked = true
	GunBase.canFire = function(self)
		if flags["ForceShoot"] then
			return true
		end
		return originalcanFire(self)
	end
end

function removeHooks()
	if not hooked then return end
	hooked = false
	GunBase.canFire = originalcanFire
end

--// Gun Mods: rapid fire / full auto
local function _buildCaches()
    if _isScanning then return end
    _isScanning = true
    
    task.spawn(function()
        _gunCache = {}
        _meleeCache = {}
        
        -- Single getgc loop for both to prevent game freezing
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                if rawget(v, "FireDelay") ~= nil and rawget(v, "FiringOnCooldown") ~= nil and rawget(v, "OwnerPlayer") ~= nil then
                    table.insert(_gunCache, v)
                end
                
                if rawget(v, "UseDelay") ~= nil and rawget(v, "Range") ~= nil and rawget(v, "UsingOnCooldown") ~= nil and rawget(v, "Destroyed") ~= true then
                    table.insert(_meleeCache, v)
                end
            end
        end
        
        _cachesBuilt = true
        _isScanning = false
    end)
end

local function _applyMods()
    if not _cachesBuilt then return end
    
    if flags["gun firerate"] == true or flags["gun auto"] == true then
        local spd = flags["rapid fire speed"] or 0.02
        for _, v in ipairs(_gunCache) do
            pcall(function()
                if flags["gun firerate"] == true then
                    rawset(v, "FireDelay", spd)
                    if rawget(v, "FireRate") ~= nil then
                        rawset(v, "FireRate", math.floor(1 / spd))
                    end
                    rawset(v, "FiringOnCooldown", false)
                end
                if flags["gun auto"] == true then
                    if rawget(v, "FiringType") ~= nil then rawset(v, "FiringType", 2) end
                    if rawget(v, "FireMode") ~= nil then rawset(v, "FireMode", "Auto") end
                    if rawget(v, "Auto") ~= nil then rawset(v, "Auto", true) end
                end
            end)
        end
    end

    if flags["MeleeMods"] then
        local spd = flags["MeleeSwingSpeed"] or 0.05
        local rng = flags["MeleeSwingRange"] or 5
        for _, v in ipairs(_meleeCache) do
            pcall(function()
                if rawget(v, "Destroyed") == true then return end
                rawset(v, "UseDelay", spd)
                rawset(v, "UseTime", spd)
                rawset(v, "Range", rng)
                rawset(v, "CharacterRange", rng)
                rawset(v, "UsingOnCooldown", false)
            end)
        end
    end
end

local function _setupTriggers(char)
    -- Trigger on Equip
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            task.wait(0.1)
            _buildCaches()
        end
    end)
end

-- Trigger on Rejoin
if local_player.Character then
    _setupTriggers(local_player.Character)
    _buildCaches()
end

-- Trigger on Die and Respawn
local_player.CharacterAdded:Connect(function(char)
    _cachesBuilt = false
    _setupTriggers(char)
    _buildCaches()
end)

-- Trigger on Teleport
local_player.OnTeleport:Connect(function()
   _cachesBuilt = false 
end)

-- Apply on Heartbeat
run_service.Heartbeat:Connect(_applyMods)

getgenv()._reloadGetCache = function() return _gunCache end

--// GunBase.fire hook: ForceShoot + silent aim distance bypass via Raycast redirect
do
    local _origFireBase = GunBase.fire

    GunBase.fire = function(self, ...)
        if flags["ForceShoot"] then
            self.FiringOnCooldown = false
        end

        if getgenv().silent and closest_part then
            local args = {...}
            local patched = false

            for i, v in ipairs(args) do
                if typeof(v) == "Vector3" and not patched then
                    local pos =
                        Cheat.Globals.ManipulationPosition
                        or (closest_part.Position + Vector3.new(0, 1.5, 0))

                    args[i] = pos
                    patched = true

                elseif typeof(v) == "buffer" and not patched then
                    local pos =
                        Cheat.Globals.ManipulationPosition
                        or (closest_part.Position + Vector3.new(0, 1.5, 0))

                    pcall(function()
                        buffer.writef32(v, 4,  pos.X)
                        buffer.writef32(v, 8,  pos.Y)
                        buffer.writef32(v, 12, pos.Z)
                    end)

                    patched = true
                end
            end

            if patched then
                return _origFireBase(self, table.unpack(args))
            end
        end

        return _origFireBase(self, ...)
    end
end

--// manipulation hook (merged into the unified namecall hook at the bottom)
--[[
do
    local oldNamecall

    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if not checkcaller()
        and flags["Manipulation"]
        and Cheat.Globals.ManipulationPosition then

            local manipPos = Cheat.Globals.ManipulationPosition

            --// workspace:Raycast
            if self == workspace and method == "Raycast" then
                if typeof(args[1]) == "Vector3" then
                    args[1] = manipPos
                end

                return oldNamecall(self, unpack(args))
            end

            --// old ray methods
            if self == workspace and (
                method == "FindPartOnRay"
                or method == "FindPartOnRayWithIgnoreList"
                or method == "FindPartOnRayWithWhitelist"
            ) then

                local ray = args[1]

                if typeof(ray) == "Ray" then
                    args[1] = Ray.new(
                        manipPos,
                        ray.Direction
                    )
                end

                return oldNamecall(self, unpack(args))
            end
        end

        return oldNamecall(self, ...)
    end))
end
--//]]

Settings = {
    Hemp = {
        Enabled = false,
        Color = Color3.fromRGB(0, 255, 0),
        MaxDistance = 300
    },

    iron = {
        Enabled = false,
        Color = Color3.fromRGB(200, 200, 200),
        MaxDistance = 500
    },

    stone = {
        Enabled = false,
        Color = Color3.fromRGB(150, 150, 150),
        MaxDistance = 450
    },

    sulfur = {
        Enabled = false,
        Color = Color3.fromRGB(255, 200, 0),
        MaxDistance = 400
    }
}

local Configuration = {
    Visuals = {
        PlayerArmorInfoWindow = false
    }
}

--//// STAFF LIST MODULE

local StaffListFrame = nil --// exposed for toggle

do
    local _players = game:GetService("Players")
    local _lp = _players.LocalPlayer

    local GROUP_ID = 15631191
    local HIGH_ROLES = { Admin = true, ["Admin+"] = true, Bob = true }
    local detected = {}
    local staffLabels = {}

    local StaffList = Instance.new("Frame")
    StaffList.Name = "StaffList"
    StaffList.Parent = Library.Holder.Instance
    StaffList.AnchorPoint = Vector2.new(0, 0.5)
    StaffList.Position = UDim2.new(0, 12, 0.5, 105) 
    StaffList.Size = UDim2.new(0, 116, 0, 32)
    StaffList.BackgroundColor3 = Library.Theme.Background
    StaffList.BorderColor3 = Library.Theme.Border
    StaffList.BorderSizePixel = 2
    StaffList.Visible = false  --// hidden by default, toggled via UI
    StaffListFrame = StaffList
    
    local dragging = false
    local dragstart, startPos
    
    StaffList.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragstart = input.Position
            startPos = StaffList.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragstart
            StaffList.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    local outlineStroke = Instance.new("UIStroke")
    outlineStroke.Color = Library.Theme.Outline
    outlineStroke.Thickness = 1
    outlineStroke.LineJoinMode = Enum.LineJoinMode.Miter
    outlineStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    outlineStroke.Parent = StaffList
    
    local Title = Instance.new("TextLabel")
    Title.Parent = StaffList
    Title.FontFace = Library.Font
    Title.TextColor3 = Library.Theme.Text
    Title.Text = "Staff Online"
    Title.Size = UDim2.new(0, 0, 0, 20)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, -4)
    Title.BorderSizePixel = 0
    Title.AutomaticSize = Enum.AutomaticSize.X
    Title.TextSize = 9
    
    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Library.Theme["Text Stroke"]
    titleStroke.Thickness = 1
    titleStroke.Transparency = 0.6
    titleStroke.LineJoinMode = Enum.LineJoinMode.Miter
    titleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    titleStroke.Parent = Title
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.Parent = StaffList
    
    local Liner = Instance.new("Frame")
    Liner.Parent = StaffList
    Liner.Position = UDim2.new(0, 0, 0, 15)
    Liner.BackgroundColor3 = Library.Theme.Accent
    Liner.BorderSizePixel = 0
    Liner.Size = UDim2.new(1, 0, 0, 1)
    
    local Content = Instance.new("Frame")
    Content.Parent = StaffList
    Content.BackgroundTransparency = 1
    Content.Position = UDim2.new(0, 0, 0, 32)
    Content.Size = UDim2.new(1, 0, 0, 0)
    Content.AutomaticSize = Enum.AutomaticSize.Y
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 2)
    contentLayout.Parent = Content
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = Content
    StatusLabel.FontFace = Library.Font
    StatusLabel.TextColor3 = Library.Theme.Text
    StatusLabel.Text = "0 staff online"
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Size = UDim2.new(0, 0, 0, 15)
    StatusLabel.AutomaticSize = Enum.AutomaticSize.X
    StatusLabel.TextSize = 9
    StatusLabel.TextTransparency = 0
    
    local statusStroke = Instance.new("UIStroke")
    statusStroke.Color = Library.Theme["Text Stroke"]
    statusStroke.Thickness = 1
    statusStroke.Transparency = 0.6
    statusStroke.LineJoinMode = Enum.LineJoinMode.Miter
    statusStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    statusStroke.Parent = StatusLabel
    
    local function create(player, role)
        local label = Instance.new("TextLabel")
        label.Parent = Content
        label.FontFace = Library.Font
        label.TextColor3 = Library.Theme.Accent
        label.Text = player.Name .. " [" .. role .. "]"
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(0, 0, 0, 15)
        label.AutomaticSize = Enum.AutomaticSize.X
        label.TextSize = 9
        label.TextTransparency = 0
        
        local labelStroke = Instance.new("UIStroke")
        labelStroke.Color = Library.Theme["Text Stroke"]
        labelStroke.Thickness = 1
        labelStroke.Transparency = 0.6
        labelStroke.LineJoinMode = Enum.LineJoinMode.Miter
        labelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
        labelStroke.Parent = label
        
        return label
    end
    
    local function update()
        local count = 0
        for _ in pairs(detected) do count = count + 1 end
        
        StatusLabel.Visible = (count == 0)
        
        if count == 0 then
            StaffList.Size = UDim2.new(0, 116, 0, 32)
        else
            local contentHeight = (count * 17) + 32
            StaffList.Size = UDim2.new(0, 116, 0, math.max(32, contentHeight))
        end
    end
    
    local function checkPlayer(p)
        if p == _lp then return end
        local success, role = pcall(function() return p:GetRoleInGroup(GROUP_ID) end)
        if success and HIGH_ROLES[role] then
            if not detected[p] then
                detected[p] = role
                local label = create(p, role)
                staffLabels[p] = label
                update()
            end
        end
    end
    
    local function removePlayer(p)
        if detected[p] then
            detected[p] = nil
            if staffLabels[p] then
                staffLabels[p]:Destroy()
                staffLabels[p] = nil
            end
            update()
        end
    end
    
    for _, p in ipairs(_players:GetPlayers()) do
        task.spawn(checkPlayer, p)
    end
    
    _players.PlayerAdded:Connect(checkPlayer)
    _players.PlayerRemoving:Connect(removePlayer)
    
    update()
end

gigaesp = false

ESP_FOLDER = Instance.new("Folder")
ESP_FOLDER.Name = "ExplosionESP"
ESP_FOLDER.Parent = game:GetService("CoreGui")

explosion_cache = {}

LIFETIME = 20

function createESP(explosion)
	if explosion_cache[explosion] then return end
    if not flags["BoomNigar"] then return end
	local anchor = Instance.new("Part")
	anchor.Size = Vector3.new(0.1, 0.1, 0.1)
	anchor.Anchored = true
	anchor.CanCollide = false
	anchor.Transparency = 1
	anchor.Name = "ExplosionAnchor"
	anchor.CFrame = CFrame.new(explosion.Position)
	anchor.Parent = workspace

	local billboard = Instance.new("BillboardGui")
	billboard.AlwaysOnTop = true
	billboard.Size = UDim2.fromOffset(120, 40)
	billboard.Adornee = anchor
	billboard.Parent = ESP_FOLDER

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextStrokeTransparency = 0
	label.Font = Enum.Font.SourceSansBold
	label.TextScaled = true
	label.TextColor3 = flags["giganigacolar"].Color
	label.Parent = billboard

	local start_time = tick()

	local conn
	conn = run_service.RenderStepped:Connect(function()
		if tick() - start_time >= LIFETIME then
			conn:Disconnect()
			billboard:Destroy()
			anchor:Destroy()
			explosion_cache[explosion] = nil
			return
		end

		local char = local_player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			label.Text = ("Explosion\n%dm"):format(
				(hrp.Position - anchor.Position).Magnitude
			)
		end
	end)

	explosion_cache[explosion] = true
end

workspace.DescendantAdded:Connect(function(inst)
	if inst:IsA("Explosion") then
		createESP(inst)
	end
end)

for _, inst in ipairs(workspace:GetDescendants()) do
	if inst:IsA("Explosion") then
		createESP(inst)
	end
end


HIT_RANGE = 25
HIT_DELAY = 0.01
Remotes2 = {
	Hit = game.ReplicatedStorage.Tool.Remotes:FindFirstChild("Hit")
}

function getEquippedTool()
	local char = local_player.Character
	if not char then return end

	for _, v in ipairs(char:GetChildren()) do
		if v:IsA("Tool") then
			return v
		end
	end
end
--// no footsteps ass
local NoFootsteps = {
    Enabled = false,
    OldVolumes = setmetatable({}, { __mode = "k" })
}

function NoFootsteps:MuteSound(sound)
    if not self.Enabled then return end
    if not sound:IsA("Sound") then return end

    if self.OldVolumes[sound] == nil then
        self.OldVolumes[sound] = sound.Volume
    end

    sound.Volume = 0
    sound:Stop()
end

function NoFootsteps:MuteFootstepFolder()
    if not self.Enabled then return end

    local folder = SoundService:FindFirstChild("FootstepSounds")
    if not folder then return end

    for _, obj in ipairs(folder:GetDescendants()) do
        if obj:IsA("Sound") then
            self:MuteSound(obj)
        end
    end
end

function NoFootsteps:MuteCharacter(char)
    if not self.Enabled then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    for _, obj in ipairs(root:GetChildren()) do
        if obj:IsA("Sound") then
            self:MuteSound(obj)
        end
    end
end

function NoFootsteps:Set(state)
    self.Enabled = state == true

    if self.Enabled then
        self:MuteFootstepFolder()

        if local_player.Character then
            self:MuteCharacter(local_player.Character)
        end
    else
        for sound, oldVolume in pairs(self.OldVolumes) do
            if sound and sound.Parent and sound:IsA("Sound") then
                sound.Volume = oldVolume
            end
        end

        table.clear(self.OldVolumes)
    end
end

run_service.Heartbeat:Connect(function()
    if not NoFootsteps.Enabled then return end

    NoFootsteps:MuteFootstepFolder()

    if local_player.Character then
        NoFootsteps:MuteCharacter(local_player.Character)
    end
end)

local_player.CharacterAdded:Connect(function(char)
    task.wait(1)
    NoFootsteps:MuteCharacter(char)
end)
function getClosestTarget()
	local char = local_player.Character
	if not char then return end

	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local closestPart, closestDist, closestName

	for _, plr in ipairs(players:GetPlayers()) do
		if plr ~= local_player and plr.Character then
			local hum = plr.Character:FindFirstChildOfClass("Humanoid")
			local thrp = plr.Character:FindFirstChild("HumanoidRootPart")

			if hum and thrp and hum.Health > 0 then
				local d = (thrp.Position - hrp.Position).Magnitude
				if d <= HIT_RANGE and (not closestDist or d < closestDist) then
					closestDist = d
					closestPart = thrp
					closestName = plr.Name
                    nigarzzz = plr
				end
			end
		end
	end

	return closestPart, closestName, closestDist
end

function getFarmingTarget()
    local hrp = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        return nil, nil
    end

    local bestPart, bestDist
    local function checkObject(obj)
        if not obj then
            return
        end

        local targetPart
        if obj:IsA("BasePart") then
            targetPart = obj
        elseif obj:IsA("Model") then
            targetPart = obj:FindFirstChild("cross", true) or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
        else
            targetPart = obj:FindFirstChild("cross", true) or obj:FindFirstChildWhichIsA("BasePart", true)
        end

        if not targetPart and obj.Parent then
            targetPart = obj.Parent:FindFirstChild("cross", true) or obj.Parent:FindFirstChildWhichIsA("BasePart", true)
        end

        if not targetPart then
            return
        end

        local dist = (targetPart.Position - hrp.Position).Magnitude
        if dist <= HIT_RANGE and (not bestDist or dist < bestDist) then
            bestDist = dist
            bestPart = targetPart
        end
    end

    local treesFolder = Workspace:FindFirstChild("trees")
    if treesFolder then
        local tree = treesFolder:GetChildren()[59]
        if tree then
            checkObject(tree)
        end
    end

    local hempFolder = Workspace:FindFirstChild("Hemp")
    if hempFolder then
        for _, obj in ipairs(hempFolder:GetChildren()) do
            checkObject(obj)
        end
    end

    local oresFolder = Workspace:FindFirstChild("ores")
    if oresFolder then
        for _, obj in ipairs(oresFolder:GetChildren()) do
            checkObject(obj)
        end
    end

    return bestPart, bestDist
end

angle = 0
lastHit = 0

dodido = false

nigarzzz = nil

run_service.Heartbeat:Connect(function(dt)
	if not flags["Melee"] then
		return
	end

	local char = local_player.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end

	local tool = getEquippedTool()
	local targetPart, targetName, dist = getClosestTarget()

	if tool and targetPart and Remotes2.Hit then
        dodido = true
		--// hitler
		if dist and dist <= HIT_RANGE then
			if os.clock() - lastHit >= HIT_DELAY then
				lastHit = os.clock()

				Remotes2.Hit:FireServer(
					tool,
					targetPart,
					targetPart.Position,
					targetPart.Name == "Head" --// isHeadshot bool
				)
			end
		end
		--// no no no you not predicting this
		if flags["Strafe"] and type(flags["StrafeBind"]) == "table" and flags["StrafeBind"].active and flags["StrafeMode"] == "Spin" then
			local speedJitter = 1 + (math.random() - 0.5) * flags["Strafe Random"]
			local radiusJitter = flags["Strafe Dist"] + (math.random() - 0.5) * 0.6
			local yJitter = math.sin(os.clock() * 6) * 0.25

			angle += dt * flags["Strafe Speed"] * speedJitter

			local offset = Vector3.new(
				math.cos(angle) * radiusJitter,
				yJitter,
				math.sin(angle) * radiusJitter
			)

			hrp.CFrame = CFrame.new(
				targetPart.Position + offset,
				targetPart.Position
			)
		end
		
		if flags["Strafe"] and type(flags["StrafeBind"]) == "table" and flags["StrafeBind"].active and flags["StrafeMode"] == "Spine" then
			local targetCF = targetPart.CFrame
			local look = targetCF.LookVector


			local backDir = -Vector3.new(look.X, 0, look.Z).Unit

			local baseRadius = 5


			local side = Vector3.new(-backDir.Z, 0, backDir.X)

			local sideJitter =
				side * math.sin(os.clock() * 18 + math.random()) * math.random(2,4)

			local yJitter =
				math.sin(os.clock() * 12) * math.random(0.5,1.2)

			local forwardBackJitter =
				backDir * math.sin(os.clock() * 9) * math.random(0.8,1.5)

			--// итоговая позиция
			local ragePos =
				targetPart.Position
				+ backDir * baseRadius
				+ sideJitter
				+ forwardBackJitter
				+ Vector3.new(0, yJitter, 0)

			--// МГНОВЕННЫЙ TP
			hrp.CFrame = CFrame.new(
				ragePos,
				targetPart.Position + Vector3.new(0, math.random(-1,1), 0)
			)
		end
    else
        dodido = false
	end
end)

--// ZonePlus hookmetamethod
--[[
local _zoneHook
_zoneHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "Fire" and typeof(self) == "Instance" and self:IsA("BindableEvent") then
        if flags["norad"] then
            local evtName = self.Name
            --// ZonePlus события входа в зону
            if evtName == "localPlayerAdded" or evtName == "playerAdded"
            or evtName == "localPlayerEntered" or evtName == "playerEntered" then

                --// Проверяем родителя — это объект Zone в ZonePlus
                --// Ищем имя зоны поднимаясь по иерархии
                local zoneObj = self.Parent
                local zoneName = zoneObj and zoneObj.Name or ""

                --// Блокируем только если в имени зоны есть "radiation"
                --// Пропускаем safe, spawn, lobby, base и т.д.
                local lname = zoneName:lower()
                local isRadiation = lname:find("radiation") or lname:find("rad")
                local isSafe = lname:find("safe") or lname:find("spawn")
                    or lname:find("lobby") or lname:find("base")
                    or lname:find("shop") or lname:find("town")

                if isRadiation and not isSafe then
                    return --// блокируем только radiation зону
                end
            end
        end
    end

    return _zoneHook(self, ...)
end))--//]]

--// ESP START
local espLibrary = {
    instances = {},
    espCache = {},
    chamsCache = {},
    objectCache = {},
    conns = {},
    whitelist = {}, 
    blacklist = {}, 
    options = {
        enabled = false,
        minScaleFactorX = 1,
        maxScaleFactorX = 10,
        minScaleFactorY = 1,
        maxScaleFactorY = 10,
        scaleFactorX = 5,
        scaleFactorY = 6,
        boundingBox = false, 
        boundingBoxDescending = false,
        excludedPartNames = {},
        font = 2,
        fontSize = 13,
        limitDistance = false,
        maxDistance = 1000,
        visibleOnly = false,
        teamCheck = false,
        teamColor = false,
        useCustomTeamColor = false,
        customteamColor = Color3.new(1,1,1),
        fillColor = nil,
        whitelistColor = Color3.new(1, 0, 0),
        outOfViewArrows = false,
        outOfViewArrowsFilled = false,
        outOfViewArrowsSize = 25,
        outOfViewArrowsRadius = 100,
        outOfViewArrowsColor = Color3.new(1, 1, 1),
        outOfViewArrowsTransparency = 0.5,
        outOfViewArrowsOutline = false,
        outOfViewArrowsOutlineFilled = false,
        outOfViewArrowsOutlineColor = Color3.new(1, 1, 1),
        outOfViewArrowsOutlineTransparency = 1,
        names = false,
        nameTransparency = 1,
        nameColor = Color3.new(1, 1, 1),
        boxes = false,
        boxesTransparency = 1,
        boxesColor = Color3.new(1, 0, 0),
        boxFill = false,
        boxFillTransparency = 0.5,
        boxFillColor = Color3.new(1, 0, 0),
        healthBars = false,
        healthBarsSize = 1,
        healthBarsTransparency = 1,
        healthBarsColor = Color3.new(0, 1, 0),
        healthText = false,
        healthTextTransparency = 1,
        healthTextSuffix = "%",
        healthTextColor = Color3.new(1, 1, 1),
        distance = false,
        distanceTransparency = 1,
        distanceSuffix = "m",
        distanceColor = Color3.new(1, 1, 1),
        tool = false,
        toolTransparency = 1,
        toolColor = Color3.new(1,1,1),
        tracers = false,
        tracerTransparency = 1,
        tracerColor = Color3.new(1, 1, 1),
        tracerOrigin = "Bottom", 
        chams = false,
        chamsFillColor = Color3.new(1, 0, 0),
        chamsFillTransparency = 0.5,
        chamsOutlineColor = Color3.new(),
        chamsOutlineTransparency = 0,
    },
};
espLibrary.__index = espLibrary;

local getService = game.GetService;
local instanceNew = Instance.new;
local drawingNew = Drawing.new;
local vector2New = Vector2.new;
local vector3New = Vector3.new;
local cframeNew = CFrame.new;
local color3New = Color3.new;
local raycastParamsNew = RaycastParams.new;
local abs = math.abs;
local tan = math.tan;
local rad = math.rad;
local clamp = math.clamp;
local floor = math.floor;
local find = table.find;
local insert = table.insert;
local findFirstChild = game.FindFirstChild;
local findFirstChildOfClass = game.FindFirstChildOfClass;
local getChildren = game.GetChildren;
local getDescendants = game.GetDescendants;
local isA = workspace.IsA;
local raycast = workspace.Raycast;
local emptyCFrame = cframeNew();
local pointToObjectSpace = emptyCFrame.PointToObjectSpace;
local getComponents = emptyCFrame.GetComponents;
local cross = vector3New().Cross;
local inf = 1 / 0;

local workspace = getService(game, "Workspace");
local runService = getService(game, "RunService");
local players = getService(game, "Players");
local coreGui = getService(game, "CoreGui");
userInputService = getService(game, "UserInputService");

currentCamera = workspace.CurrentCamera;
localPlayer = players.LocalPlayer;
screenGui = instanceNew("ScreenGui", coreGui);
local lastFov, lastScale;

local wtvp = currentCamera.WorldToViewportPoint;

function isDrawing(type)
    return type == "Square" or type == "Text" or type == "Triangle" or type == "Image" or type == "Line" or type == "Circle";
end

function create(type, properties)
    local drawing = isDrawing(type);
    local object = drawing and drawingNew(type) or instanceNew(type);

    if (properties) then
        for i,v in next, properties do
            object[i] = v;
        end
    end

    if (not drawing) then
        insert(espLibrary.instances, object);
    end

    return object;
end

function worldToViewportPoint(position)
    local screenPosition, onScreen = wtvp(currentCamera, position);
    return vector2New(screenPosition.X, screenPosition.Y), onScreen, screenPosition.Z;
end

function round(number)
    return typeof(number) == "Vector2" and vector2New(round(number.X), round(number.Y)) or floor(number);
end

function espLibrary.getTeam(player)
    local team = player.Team;
    return team, player.TeamColor.Color;
end

function espLibrary.getCharacter(player)
    local character = player.Character
    if not character then return nil, nil end
    
    local torso = character:FindFirstChild("HumanoidRootPart")
    
    if not torso then
        torso = character:FindFirstChild("UpperTorso")
    end
    
    if not torso then
        torso = character:FindFirstChild("Torso")
    end
    
    return character, torso
end

function espLibrary.getTool(player)
    local character = player.Character;
    if not character then return "None" end
    
    local tool = findFirstChildOfClass(character, "Tool")
    return tool and tostring(tool) or "None"
end

function espLibrary.getBoundingBox(character, torso)
    if (espLibrary.options.boundingBox) then
        local minX, minY, minZ = inf, inf, inf;
        local maxX, maxY, maxZ = -inf, -inf, -inf;

        for _, part in next, espLibrary.options.boundingBoxDescending and getDescendants(character) or getChildren(character) do
            if (isA(part, "BasePart") and not find(espLibrary.options.excludedPartNames, part.Name)) then
                local size = part.Size;
                local sizeX, sizeY, sizeZ = size.X, size.Y, size.Z;

                local x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22 = getComponents(part.CFrame);

                local wiseX = 0.5 * (abs(r00) * sizeX + abs(r01) * sizeY + abs(r02) * sizeZ);
                local wiseY = 0.5 * (abs(r10) * sizeX + abs(r11) * sizeY + abs(r12) * sizeZ);
                local wiseZ = 0.5 * (abs(r20) * sizeX + abs(r21) * sizeY + abs(r22) * sizeZ);

                minX = minX > x - wiseX and x - wiseX or minX;
                minY = minY > y - wiseY and y - wiseY or minY;
                minZ = minZ > z - wiseZ and z - wiseZ or minZ;

                maxX = maxX < x + wiseX and x + wiseX or maxX;
                maxY = maxY < y + wiseY and y + wiseY or maxY;
                maxZ = maxZ < z + wiseZ and z + wiseZ or maxZ;
            end
        end

        local oMin, oMax = vector3New(minX, minY, minZ), vector3New(maxX, maxY, maxZ);
        return (oMax + oMin) * 0.5, oMax - oMin;
    else
        return torso.Position, vector2New(espLibrary.options.scaleFactorX, espLibrary.options.scaleFactorY);
    end
end

function espLibrary.getScaleFactor(fov, depth)
    if (fov ~= lastFov) then
        lastScale = tan(rad(fov * 0.5)) * 2;
        lastFov = fov;
    end

    return 1 / (depth * lastScale) * 1000;
end

function espLibrary.getBoxData(position, size)
    local torsoPosition, onScreen, depth = worldToViewportPoint(position);
    local scaleFactor = espLibrary.getScaleFactor(currentCamera.FieldOfView, depth);

    local clampX = clamp(size.X, espLibrary.options.minScaleFactorX, espLibrary.options.maxScaleFactorX);
    local clampY = clamp(size.Y, espLibrary.options.minScaleFactorY, espLibrary.options.maxScaleFactorY);
    local size = round(vector2New(clampX * scaleFactor, clampY * scaleFactor));

    return onScreen, size, round(vector2New(torsoPosition.X - (size.X * 0.5), torsoPosition.Y - (size.Y * 0.5))), torsoPosition;
end

function espLibrary.getHealth(player, character)
    local humanoid = findFirstChild(character, "Humanoid");

    if (humanoid) then
        return math.floor(humanoid.Health), humanoid.MaxHealth;
    end

    return 100, 100;
end

local _esp_vis_params = nil
function espLibrary.visibleCheck(character, position)
    if not _esp_vis_params then
        _esp_vis_params = raycastParamsNew()
        _esp_vis_params.FilterType = Enum.RaycastFilterType.Blacklist
        _esp_vis_params.IgnoreWater = true
    end

    local localChar = espLibrary.getCharacter(localPlayer)
    _esp_vis_params.FilterDescendantsInstances = { localChar, currentCamera, character }

    local origin = currentCamera.CFrame.Position
    return (not raycast(workspace, origin, position - origin, _esp_vis_params))
end

function espLibrary.addEsp(player)
    if (player == localPlayer) then
        return
    end

    local objects = {
        arrow = create("Triangle", {
            Thickness = 1,
        }),
        arrowOutline = create("Triangle", {
            Thickness = 1,
        }),
        distanceText = create("Text", {
            Center = true,
            Size = 13,
            Outline = true,
            OutlineColor = color3New(),
            Font = 2,
        }),
        tool = create("Text", {
            Center = true,
            Size = 13,
            Outline = true,
            OutlineColor = color3New(),
            Font = 2,
        }),
        top = create("Text", {
            Center = true,
            Size = 13,
            Outline = true,
            OutlineColor = color3New(),
            Font = 2,
        }),
        healthText = create("Text", {
            Size = 13,
            Outline = true,
            OutlineColor = color3New(),
            Font = 2,
        }),
        boxFill = create("Square", {
            Thickness = 1,
            Filled = true,
        }),
        boxOutline = create("Square", {
            Thickness = 3,
            Color = color3New()
        }),
        box = create("Square", {
            Thickness = 1
        }),
        healthBarOutline = create("Square", {
            Thickness = 1,
            Color = color3New(),
            Filled = true
        }),
        healthBar = create("Square", {
            Thickness = 1,
            Filled = true
        }),
        lineoutline = create("Line", {Thickness = 3}),
        line = create("Line", {Thickness = 1}),
    };

    espLibrary.espCache[player] = objects;

    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                for _, object in next, objects do
                    object.Visible = false
                end
            end)
        end
    end

    player.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Died:Connect(function()
                for _, object in next, objects do
                    object.Visible = false
                end
            end)
        end
    end)
end

function espLibrary.removeEsp(player)
    local espCache = espLibrary.espCache[player];

    if (espCache) then
        espLibrary.espCache[player] = nil;

        for index, object in next, espCache do
            espCache[index] = nil;
            object:Remove();
        end
    end
end

function espLibrary.addChams(player)
    if (player == localPlayer) then
        return
    end

    espLibrary.chamsCache[player] = create("Highlight", {
        Parent = screenGui,
    });
end

function espLibrary.removeChams(player)
    local highlight = espLibrary.chamsCache[player];

    if (highlight) then
        espLibrary.chamsCache[player] = nil;
        highlight:Destroy();
    end
end

function espLibrary.addObject(object, options)
    espLibrary.objectCache[object] = {
        options = options,
        text = create("Text", {
            Center = true,
            Size = 13,
            Outline = true,
            OutlineColor = color3New(),
            Font = 2,
        })
    };
end

function espLibrary.removeObject(object)
    local cache = espLibrary.objectCache[object];

    if (cache) then
        espLibrary.objectCache[object] = nil;
        cache.text:Remove();
    end
end

function espLibrary:AddObjectEsp(object, defaultOptions)
    assert(object and object.Parent, "invalid object passed");

    local options = defaultOptions or {};

    options.enabled = options.enabled or true;
    options.limitDistance = options.limitDistance or false;
    options.maxDistance = options.maxDistance or false;
    options.visibleOnly = options.visibleOnly or false;
    options.color = options.color or color3New(1, 1, 1);
    options.transparency = options.transparency or 1;
    options.text = options.text or object.Name;
    options.font = options.font or 2;
    options.fontSize = options.fontSize or 13;

    self.addObject(object, options);

    insert(self.conns, object.Parent.ChildRemoved:Connect(function(child)
        if (child == object) then
            self.removeObject(child);
        end
    end));

    return options;
end

function espLibrary:Unload()
    for _, connection in next, self.conns do
        connection:Disconnect();
    end

    for _, player in next, players:GetPlayers() do
        self.removeEsp(player);
        self.removeChams(player);
    end

    for object, _ in next, self.objectCache do
        self.removeObject(object);
    end

    for _, object in next, self.instances do
        object:Destroy();
    end

    screenGui:Destroy();
    runService:UnbindFromRenderStep("esp_rendering");
end

function espLibrary:Load(renderValue)
    insert(self.conns, players.PlayerAdded:Connect(function(player)
        self.addEsp(player);
        self.addChams(player);
    end));

    insert(self.conns, players.PlayerRemoving:Connect(function(player)
        self.removeEsp(player);
        self.removeChams(player);
    end));

    for _, player in next, players:GetPlayers() do
        self.addEsp(player);
        self.addChams(player);
    end

    runService:BindToRenderStep("esp_rendering", renderValue or (Enum.RenderPriority.Camera.Value + 1), function()
        for player, objects in next, self.espCache do
            local character, torso = self.getCharacter(player);

            if (character and torso) then
                local humanoid = character:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then
                    for _, object in next, objects do
                        object.Visible = false
                    end
                    continue
                end

                local onScreen, size, position, torsoPosition = self.getBoxData(torso.Position, Vector3.new(5, 6.5));
                local distanceInStuds = (currentCamera.CFrame.Position - torso.Position).Magnitude;
                local distanceInMeters = distanceInStuds / 3.28084;
                local canShow, enabled = onScreen and (size and position), self.options.enabled;
                local team, teamColor = self.getTeam(player);
                local color = self.options.teamColor and teamColor or nil;
                local tool = self.getTool(player)

                if self.options.useCustomTeamColor and self.options.teamColor then
                    color = self.options.customteamColor
                end

                if (self.options.fillColor ~= nil) then
                    color = self.options.fillColor;
                end

                if (find(self.whitelist, player.Name)) then
                    color = self.options.whitelistColor;
                end

                if (find(self.blacklist, player.Name)) then
                    enabled = false;
                end

                if (self.options.limitDistance and distanceInStuds > self.options.maxDistance) then
                    enabled = false;
                end

                if (self.options.visibleOnly and not self.visibleCheck(character, torso.Position)) then
                    enabled = false;
                end

                if (self.options.teamCheck and (team == self.getTeam(localPlayer))) then
                    enabled = false;
                end

                local viewportSize = currentCamera.ViewportSize;

                local screenCenter = vector2New(viewportSize.X / 2, viewportSize.Y / 2);
                local objectSpacePoint = (pointToObjectSpace(currentCamera.CFrame, torso.Position) * vector3New(1, 0, 1)).Unit;
                local crossVector = cross(objectSpacePoint, vector3New(0, 1, 1));
                local rightVector = vector2New(crossVector.X, crossVector.Z);

                local arrowRadius, arrowSize = self.options.outOfViewArrowsRadius, self.options.outOfViewArrowsSize;
                local arrowPosition = screenCenter + vector2New(objectSpacePoint.X, objectSpacePoint.Z) * arrowRadius;
                local arrowDirection = (arrowPosition - screenCenter).Unit;

                local pointA, pointB, pointC = arrowPosition, screenCenter + arrowDirection * (arrowRadius - arrowSize) + rightVector * arrowSize, screenCenter + arrowDirection * (arrowRadius - arrowSize) + -rightVector * arrowSize;

                local health, maxHealth = self.getHealth(player, character);
                local healthBarSize = round(vector2New(self.options.healthBarsSize, -(size.Y * (health / maxHealth))));
                local healthBarPosition = round(vector2New(position.X - (3 + healthBarSize.X), position.Y + size.Y));

                local origin = self.options.tracerOrigin;
                local show = canShow and enabled;

                objects.arrow.Visible = (not canShow and enabled) and self.options.outOfViewArrows;
                objects.arrow.Filled = self.options.outOfViewArrowsFilled;
                objects.arrow.Transparency = self.options.outOfViewArrowsTransparency;
                objects.arrow.Color = color or self.options.outOfViewArrowsColor;
                objects.arrow.PointA = pointA;
                objects.arrow.PointB = pointB;
                objects.arrow.PointC = pointC;

                objects.arrowOutline.Visible = (not canShow and enabled) and self.options.outOfViewArrowsOutline;
                objects.arrowOutline.Filled = self.options.outOfViewArrowsOutlineFilled;
                objects.arrowOutline.Transparency = self.options.outOfViewArrowsOutlineTransparency;
                objects.arrowOutline.Color = color or self.options.outOfViewArrowsOutlineColor;
                objects.arrowOutline.PointA = pointA;
                objects.arrowOutline.PointB = pointB;
                objects.arrowOutline.PointC = pointC;

                local currentYOffset = 0
                
                if show and self.options.names then
                    objects.top.Visible = true
                    objects.top.Font = self.options.font;
                    objects.top.Size = self.options.fontSize;
                    objects.top.Transparency = self.options.nameTransparency;
                    objects.top.Color = color or self.options.nameColor;
                    objects.top.Text = player.Name;
                    objects.top.Position = round(position + vector2New(size.X * 0.5, -(objects.top.TextBounds.Y + 2)));
                    currentYOffset = objects.top.TextBounds.Y + 2
                else
                    objects.top.Visible = false
                end

                objects.healthText.Visible = show and self.options.healthText;
                if objects.healthText.Visible then
                    objects.healthText.Font = self.options.font;
                    objects.healthText.Size = self.options.fontSize;
                    objects.healthText.Transparency = self.options.healthTextTransparency;
                    objects.healthText.Color = color or self.options.healthTextColor;
                    objects.healthText.Text = health .. self.options.healthTextSuffix;
                    --// Position on the right side of the box
                    objects.healthText.Position = round(position + vector2New(size.X + 3, -3));
                end

                local hasTool = self.options.tool and tool ~= "None"
                objects.tool.Visible = show and hasTool;
                if objects.tool.Visible then
                    objects.tool.Font = self.options.font;
                    objects.tool.Size = self.options.fontSize;
                    objects.tool.Transparency = self.options.toolTransparency;
                    objects.tool.Color = color or self.options.toolColor;
                    objects.tool.Text = tostring(tool);
                    objects.tool.Position = round(position + vector2New(size.X * 0.5, size.Y + 1));
                end

                objects.distanceText.Visible = show and self.options.distance;
                if objects.distanceText.Visible then
                    objects.distanceText.Font = self.options.font;
                    objects.distanceText.Size = self.options.fontSize;
                    objects.distanceText.Transparency = self.options.distanceTransparency;
                    objects.distanceText.Color = color or self.options.distanceColor;
                    local formattedDistance = string.format("%.1f", distanceInMeters)
                    objects.distanceText.Text = formattedDistance .. self.options.distanceSuffix;
                    
                    local yOffset
                    if hasTool and objects.tool.Visible then
                        local toolBoundsY = objects.tool.TextBounds.Y
                        if toolBoundsY == 0 then toolBoundsY = self.options.fontSize + 2 end
                        yOffset = size.Y + 1 + toolBoundsY + 4
                    else
                        yOffset = size.Y + 4
                    end
                    objects.distanceText.Position = round(position + vector2New(size.X * 0.5, yOffset));
                end

                objects.box.Visible = show and self.options.boxes;
                objects.box.Color = color or self.options.boxesColor;
                objects.box.Transparency = self.options.boxesTransparency;
                objects.box.Size = size;
                objects.box.Position = position;

                objects.boxOutline.Visible = show and self.options.boxes;
                objects.boxOutline.Transparency = self.options.boxesTransparency;
                objects.boxOutline.Size = size;
                objects.boxOutline.Position = position;

                objects.boxFill.Visible = show and self.options.boxFill;
                objects.boxFill.Color = color or self.options.boxFillColor;
                objects.boxFill.Transparency = self.options.boxFillTransparency;
                objects.boxFill.Size = size;
                objects.boxFill.Position = position;

                objects.healthBar.Visible = show and self.options.healthBars;
                objects.healthBar.Color = self.options.healthBarsColor;
                objects.healthBar.Transparency = self.options.healthBarsTransparency;
                objects.healthBar.Size = healthBarSize;
                objects.healthBar.Position = healthBarPosition;

                objects.healthBarOutline.Visible = show and self.options.healthBars;
                objects.healthBarOutline.Transparency = self.options.healthBarsTransparency;
                objects.healthBarOutline.Size = round(vector2New(healthBarSize.X, -size.Y) + vector2New(2, -2));
                objects.healthBarOutline.Position = healthBarPosition - vector2New(1, -1);

                objects.line.Visible = show and self.options.tracers;
                objects.line.Color = color or self.options.tracerColor;
                objects.line.Transparency = self.options.tracerTransparency;
                objects.line.From =
                    origin == "Mouse" and userInputService:GetMouseLocation() or
                    origin == "Top" and vector2New(viewportSize.X * 0.5, 0) or
                    origin == "Bottom" and vector2New(viewportSize.X * 0.5, viewportSize.Y);
                objects.line.To = torsoPosition;
                objects.lineoutline.Visible = show and self.options.tracers;
                objects.lineoutline.Color = Color3.new(0,0,0)
                objects.lineoutline.Transparency = self.options.tracerTransparency;
                objects.lineoutline.From =
                    origin == "Mouse" and userInputService:GetMouseLocation() or
                    origin == "Top" and vector2New(viewportSize.X * 0.5, 0) or
                    origin == "Bottom" and vector2New(viewportSize.X * 0.5, viewportSize.Y);
                    objects.lineoutline.To = torsoPosition;
            else
                local objects = objects
                for objectName, object in next, objects do
                    object.Visible = false
                end
            end
        end

        for player, highlight in next, self.chamsCache do
            local character, torso = self.getCharacter(player);

            if (character and torso) then
                local distance = (currentCamera.CFrame.Position - torso.Position).Magnitude;
                local canShow = self.options.enabled and self.options.chams;
                local team, teamColor = self.getTeam(player);
                local color = self.options.teamColor and teamColor or nil;

                if self.options.useCustomTeamColor and self.options.teamColor then
                    color = self.options.customteamColor
                end

                if (self.options.fillColor ~= nil) then
                    color = self.options.fillColor;
                end

                if (find(self.whitelist, player.Name)) then
                    color = self.options.whitelistColor;
                end

                if (find(self.blacklist, player.Name)) then
                    canShow = false;
                end

                if (self.options.limitDistance and distance > self.options.maxDistance) then
                    canShow = false;
                end

                if (self.options.teamCheck and (team == self.getTeam(localPlayer))) then
                    canShow = false;
                end

                highlight.Enabled = canShow;
                highlight.DepthMode = self.options.visibleOnly and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop;
                highlight.Adornee = character;
                highlight.FillColor = color or self.options.chamsFillColor;
                highlight.FillTransparency = self.options.chamsFillTransparency;
                highlight.OutlineColor = color or self.options.chamsOutlineColor;
                highlight.OutlineTransparency = self.options.chamsOutlineTransparency;
            end
        end

        for object, cache in next, self.objectCache do
            local partPosition = vector3New();

            if (object:IsA("BasePart")) then
                partPosition = object.Position;
            elseif (object:IsA("Model")) then
                partPosition = self.getBoundingBox(object);
            end

            local distance = (currentCamera.CFrame.Position - partPosition).Magnitude;
            local screenPosition, onScreen = worldToViewportPoint(partPosition);
            local canShow = cache.options.enabled and onScreen;

            if (self.options.limitDistance and distance > self.options.maxDistance) then
                canShow = false;
            end

            if (self.options.visibleOnly and not self.visibleCheck(object, partPosition)) then
                canShow = false;
            end

            cache.text.Visible = canShow;
            cache.text.Font = cache.options.font;
            cache.text.Size = cache.options.fontSize;
            cache.text.Transparency = cache.options.transparency;
            cache.text.Color = cache.options.color;
            cache.text.Text = cache.options.text;
            cache.text.Position = round(screenPosition);
        end
    end);
end
espLibrary:Load()
--// ESP END

--// UI
local Window    = Library:Window({ Logo = '71869068175666', FadeTime = 0.2 })
local Watermark = Library:Watermark('Rost Alpha | V2')
local KeybindList = Library:KeybindList()

local CombatPage  = Window:Page({ Name = 'Combat',  SubPages = true })
local EspPage     = Window:Page({ Name = 'ESP',     Columns = 2 })
local VisualsPage = Window:Page({ Name = 'Visuals', Columns = 2 })
local MiscPage    = Window:Page({ Name = 'Misc',    Columns = 2 })
local SettingsPage = Library:CreateSettingsPage(Window, Watermark, KeybindList)

--// Combat
local AimbotSub = CombatPage:SubPage({ Name = 'Aimbot', Columns = 2 })

do --// Aimbot
    local Main = AimbotSub:Section({ Name = 'Main', Side = 1 })
    Main:Toggle({ Name = 'Aimbot', Flag = 'Enable Aimbot', Default = false, Callback = function(s) flags['Enable Aimbot'] = s end }):Keybind({ Flag = 'Aimbot Keybind', Default = Enum.UserInputType.MouseButton2, Mode = 'Hold', Callback = function(s) flags['Aimbot Keybind'] = type(s) == "table" and s or {active = s == true} end })
    Main:Toggle({ Name = 'Silent Aim', Flag = 'Silent Aim', Default = false, Callback = function(s) flags['Silent Aim'] = s; getgenv().silent = s end })
    Main:Toggle({ Name = 'Autoshoot', Flag = 'autoshoot', Default = false, Callback = function(s) flags['autoshoot'] = s; getgenv().autoshoot = s end })
    Main:Toggle({ Name = 'Head Expander', Flag = 'expandar', Default = false }):Colorpicker({ Flag = 'ColarZZ', Default = Color3.fromRGB(255,255,255) })
    Main:Slider({ Name = 'Head Size', Flag = 'sizizi', Min = 1, Max = 20, Default = 5, Decimals = 1, Suffix = '' })
    Main:Dropdown({ Name = 'Head Material', Flag = 'Materialz', Items = { 'Neon', 'Plastic', 'ForceField' }, Default = 'Neon' })
    Main:Slider({ Name = 'Aimbot Speed', Flag = 'Aimbot Speed', Min = 0.05, Max = 1, Default = 0.5, Decimals = 0.01, Suffix = '', Callback = function(s) flags['Aimbot Speed'] = s end })
    Main:Slider({ Name = 'Max Distance', Flag = 'Aimbot Max Distance', Min = 100, Max = 2500, Default = 500, Decimals = 1, Suffix = '', Callback = function(s) flags['Aimbot Max Distance'] = s end })
    Main:Toggle({ Name = 'Manipulation', Flag = 'Manipulation', Default = false })
    Main:Dropdown({ Name = 'Aimbone', Flag = 'Aimbot Bone', Items = { 'Head', 'Torso', 'HumanoidRootPart', 'Closest Bone' }, Default = 'Head', Callback = function(s) flags['Aimbot Bone'] = s end })

    local Draw = AimbotSub:Section({ Name = 'Drawings', Side = 2 })
    Draw:Toggle({ Name = 'Inventory Viewer', Flag = 'Armor Viewer', Default = false, Callback = function(s) flags['Armor Viewer'] = s; Configuration.Visuals.PlayerArmorInfoWindow = s end })
    Draw:Toggle({ Name = 'Staff List', Flag = 'Staff', Default = false, Callback = function(s) flags['Staff'] = s; if StaffListFrame then StaffListFrame.Visible = s end end })
    Draw:Toggle({ Name = 'Team Check', Flag = 'Friendly Check', Default = false, Callback = function(s) flags['Friendly Check'] = s end })
    Draw:Toggle({ Name = 'Visible Check', Flag = 'Visible Check', Default = false, Callback = function(s) flags['Visible Check'] = s end })
    Draw:Toggle({ Name = 'FOV Circle', Flag = 'Enable FOV', Default = false, Callback = function(s) flags['Enable FOV'] = s end }):Colorpicker({ Flag = 'FOV Accent', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['FOV Accent'] = {Color=s, Transparency=0} end })
    Draw:Toggle({ Name = 'FOV Filled', Flag = 'FOV Filled', Default = false, Callback = function(s) flags['FOV Filled'] = s end }):Colorpicker({ Flag = 'FOV Fill Accent', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['FOV Fill Accent'] = {Color=s, Transparency=0} end })
    Draw:Slider({ Name = 'FOV Fill Opacity', Flag = 'FOV Fill Opacity', Min = 0, Max = 100, Default = 50, Decimals = 1, Suffix = '%', Callback = function(s) flags['FOV Fill Opacity'] = s end })
    Draw:Slider({ Name = 'FOV Radius', Flag = 'FOV Radius', Min = 30, Max = 750, Default = 120, Decimals = 1, Suffix = 'px', Callback = function(s) flags['FOV Radius'] = s end })
    Draw:Toggle({ Name = 'Snaplines', Flag = 'Enable Snaplines', Default = false, Callback = function(s) flags['Enable Snaplines'] = s end }):Colorpicker({ Flag = 'Snaplines Accent', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['Snaplines Accent'] = {Color=s, Transparency=0} end })
    Draw:Toggle({ Name = 'Crosshair', Flag = 'Crosshair Enabled', Default = false, Callback = function(s) flags['Crosshair Enabled'] = s end }):Colorpicker({ Flag = 'Crosshair Color', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['Crosshair Color'] = {Color=s, Transparency=0} end })
    Draw:Toggle({ Name = 'Crosshair Spin', Flag = 'Crosshair Spin', Default = false, Callback = function(s) flags['Crosshair Spin'] = s end })
    Draw:Slider({ Name = 'Crosshair Speed', Flag = 'Crosshair Speed', Min = 1, Max = 100, Default = 10, Decimals = 1, Suffix = '', Callback = function(s) flags['Crosshair Speed'] = s end })
    Draw:Slider({ Name = 'Crosshair Length', Flag = 'Crosshair Length', Min = 1, Max = 100, Default = 50, Decimals = 1, Suffix = '', Callback = function(s) flags['Crosshair Length'] = s end })
    Draw:Slider({ Name = 'Crosshair Width', Flag = 'Crosshair Width', Min = 1, Max = 5, Default = 1, Decimals = 1, Suffix = '', Callback = function(s) flags['Crosshair Width'] = s end })
    Draw:Slider({ Name = 'Crosshair Spread', Flag = 'Crosshair Spread', Min = 0, Max = 50, Default = 10, Decimals = 1, Suffix = '', Callback = function(s) flags['Crosshair Spread'] = s end })

    local KillAuraSec = AimbotSub:Section({ Name = 'Kill Aura', Side = 1 })
    KillAuraSec:Toggle({ Name = 'Kill Aura', Flag = 'Melee', Default = false, Callback = function(s) flags['Melee'] = s end })
    KillAuraSec:Slider({ Name = 'Range', Flag = 'MeleeRange', Min = 5, Max = 100, Default = 25, Decimals = 1, Suffix = ' studs', Callback = function(s) flags['MeleeRange'] = s; HIT_RANGE = s end })
    KillAuraSec:Slider({ Name = 'Speed', Flag = 'MeleeDelay', Min = 0.01, Max = 1, Default = 0.01, Decimals = 0.01, Suffix = 's', Callback = function(s) flags['MeleeDelay'] = s; HIT_DELAY = s end })
end

do --// ESP
    local Opt = EspPage:Section({ Name = 'Options', Side = 1 })
	Opt:Toggle({
		Name = "Enable ESP",
		Flag = "ESPEnabled",
		Callback = function(value)
			espLibrary.options.enabled = value
		end
	})

	Opt:Toggle({
		Name = "Player Names",
		Flag = "ESPNames",
		Callback = function(value)
			espLibrary.options.names = value
		end
	}):Colorpicker({
		Name = "Name Color",
		Flag = "ESPNameColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.nameColor = value
		end
	})

	Opt:Toggle({
		Name = "Bounding Boxes",
		Flag = "ESPBoxes",
		Callback = function(value)
			espLibrary.options.boxes = value
		end
	}):Colorpicker({
		Name = "Box Color",
		Flag = "ESPBoxColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.boxesColor = value
		end
	})

	Opt:Toggle({
		Name = "Box Fill",
		Flag = "ESPBoxFill",
		Callback = function(value)
			espLibrary.options.boxFill = value
		end
	}):Colorpicker({
		Name = "Fill Color",
		Flag = "ESPBoxFillColor",
		Default = Color3.new(0.8, 0.8, 0.8),
		Callback = function(value)
			espLibrary.options.boxFillColor = value
		end
	})

	Opt:Toggle({
		Name = "Health Bars",
		Flag = "ESPHealthBars",
		Callback = function(value)
			espLibrary.options.healthBars = value
		end
	}):Colorpicker({
		Name = "Health Bar Color",
		Flag = "ESPHealthBarColor",
		Default = Color3.new(0, 1, 0),
		Callback = function(value)
			espLibrary.options.healthBarsColor = value
		end
	})

	Opt:Toggle({
		Name = "Health Text",
		Flag = "ESPHealthText",
		Callback = function(value)
			espLibrary.options.healthText = value
		end
	}):Colorpicker({
		Name = "Health Text Color",
		Flag = "ESPHealthTextColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.healthTextColor = value
		end
	})

	Opt:Toggle({
		Name = "Distance",
		Flag = "ESPDistance",
		Callback = function(value)
			espLibrary.options.distance = value
		end
	}):Colorpicker({
		Name = "Distance Color",
		Flag = "ESPDistanceColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.distanceColor = value
		end
	})

	Opt:Toggle({
		Name = "Show Tool",
		Flag = "ESPTool",
		Callback = function(value)
			espLibrary.options.tool = value
		end
	}):Colorpicker({
		Name = "Tool Color",
		Flag = "ESPToolColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.toolColor = value
		end
	})

	Opt:Toggle({
		Name = "Tracers",
		Flag = "ESPTracers",
		Callback = function(value)
			espLibrary.options.tracers = value
		end
	}):Colorpicker({
		Name = "Tracer Color",
		Flag = "ESPTracerColor",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			espLibrary.options.tracerColor = value
		end
	})

    local Oth = EspPage:Section({ Name = 'Other', Side = 2 })
	Oth:Toggle({
		Name = "Visible Only",
		Flag = "ESPVisibleOnly",
		Callback = function(value)
			espLibrary.options.visibleOnly = value
		end
	})

	Oth:Toggle({
		Name = "Limit Distance",
		Flag = "ESPLimitDistance",
		Callback = function(value)
			espLibrary.options.limitDistance = value
		end
	})

	Oth:Slider({
		Name = "Max Distance Amount",
		Flag = "ESPMaxDistance",
		Min = 100,
		Max = 5000,
		Default = 1000,
		Callback = function(value)
			espLibrary.options.maxDistance = value
		end
	})

	Oth:Dropdown({
		Name = "Tracer Origin",
		Flag = "ESPTracerOrigin",
		Items = {'Bottom', 'Top', 'Mouse'},
		Callback = function(value)
			espLibrary.options.tracerOrigin = value
		end
	})
end

do --// Visuals
    local Self = VisualsPage:Section({ Name = 'Self', Side = 1 })
    Self:Toggle({ Name = 'Gun Chams', Flag = 'Chamsi', Default = false, Callback = function(s) flags['Chamsi'] = s end }):Colorpicker({ Flag = 'Colarss', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['Colarss'] = {Color=s,Transparency=0} end })
    Self:Toggle({ Name = 'Arm Chams', Flag = 'GunNiger', Default = false, Callback = function(s) flags['GunNiger'] = s end }):Colorpicker({ Flag = 'Colarss2', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['Colarss2'] = {Color=s,Transparency=0} end })
    Self:Dropdown({ Name = 'Gun Chams Material', Flag = 'gunChamsMaterial', Items = { 'Neon', 'ForceField', 'Glass', 'SmoothPlastic' }, Default = 'Neon', Callback = function(s) flags['gunChamsMaterial'] = s end })
    Self:Dropdown({ Name = 'Arm Chams Material', Flag = 'gaymaterial', Items = { 'Neon', 'ForceField', 'Glass', 'SmoothPlastic' }, Default = 'Neon', Callback = function(s) flags['gaymaterial'] = s end })
    Self:Toggle({ Name = 'No Viewmodel Bob', Flag = 'No Viewmodel Bob', Default = false, Callback = function(s) flags['No Viewmodel Bob'] = s end })
    Self:Toggle({ Name = 'Viewmodel Position', Flag = 'Viewmodel Position', Default = false, Callback = function(s) flags['Viewmodel Position'] = s; viewenabal = s end })
    Self:Slider({ Name = 'X pos', Flag = 'Viewmodel Position X', Min = -3, Max = 3, Default = 0, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Viewmodel Position X'] = s; xere = s end })
    Self:Slider({ Name = 'Y pos', Flag = 'Viewmodel Position Y', Min = -3, Max = 3, Default = 0, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Viewmodel Position Y'] = s; yere = s end })
    Self:Slider({ Name = 'Z pos', Flag = 'Viewmodel Position Z', Min = -3, Max = 3, Default = 0, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Viewmodel Position Z'] = s; zere = s end })
    Self:Slider({ Name = 'X rot', Flag = 'Rotatin X', Min = -180, Max = 180, Default = 0, Decimals = 1, Suffix = '', Callback = function(s) flags['Rotatin X'] = s; rotX = s end })
    Self:Slider({ Name = 'Y rot', Flag = 'Rotatin Position Y', Min = -180, Max = 180, Default = 0, Decimals = 1, Suffix = '', Callback = function(s) flags['Rotatin Position Y'] = s; rotY = s end })
    Self:Slider({ Name = 'Z rot', Flag = 'Rotatin Position Z', Min = -180, Max = 180, Default = 0, Decimals = 1, Suffix = '', Callback = function(s) flags['Rotatin Position Z'] = s; rotZ = s end })
    Self:Toggle({ Name = 'Bullet Tracers', Flag = 'Bullet Tracers', Default = false, Callback = function(s) flags['Bullet Tracers'] = s; trac = s end }):Colorpicker({ Flag = 'Tracer Color', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['Tracer Color'] = {Color=s,Transparency=0} end })
    Self:Dropdown({ Name = 'Tracer Type', Flag = 'Bulat Type', Items = tracs, Default = tracs[1], Callback = function(s) flags['Bulat Type'] = s end })
    Self:Toggle({ Name = 'Hitmarkers', Flag = 'Hitmarkers', Default = false, Callback = function(s) flags['Hitmarkers'] = s; mark = s end }):Colorpicker({ Flag = 'HitmarkerColor', Default = Color3.fromRGB(255, 255, 255), Callback = function(s) flags['HitmarkerColor'] = {Color=s,Transparency=0} end })
    Self:Toggle({ Name = 'Hitlogs', Flag = 'Hitlogs', Default = false, Callback = function(s) flags['Hitlogs'] = s; niger = s end })
    Self:Toggle({ Name = 'Hitsounds', Flag = 'Hitsounds', Default = false, Callback = function(s) flags['Hitsounds'] = s end })
    Self:Dropdown({ Name = 'Sound Type', Flag = 'Hitsound Type', Items = sounds, Default = sounds[1], Callback = function(s) flags['Hitsound Type'] = s; selected_sound = s; newId = hit_sounds[s]; replaceSounds(rs); replaceSounds(local_player.Character) end })
    Self:Toggle({ Name = 'Reload Indicator', Flag = 'ReloadIndicator', Default = false, Callback = function(s) flags['ReloadIndicator'] = s end })

    local World = VisualsPage:Section({ Name = 'World', Side = 2 })
    World:Toggle({ Name = 'No Grass', Flag = 'No Grass', Default = false, Callback = function(s) flags['No Grass'] = s; sethiddenproperty(Workspace:FindFirstChildOfClass('Terrain'), 'Decoration', not s) end })
    World:Toggle({ Name = 'No Fog', Flag = 'Enable No Fog', Default = false, Callback = function(s) flags['Enable No Fog'] = s end })
    World:Slider({ Name = 'Brightness', Flag = 'Lighting Brightness', Min = 0, Max = 12, Default = 2, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Lighting Brightness'] = s; game:GetService('Lighting').Brightness = s end })
    World:Toggle({ Name = 'Fullbright', Flag = 'Enable Fullbright', Default = false, Callback = function(s) flags['Enable Fullbright'] = s; lighting.GlobalShadows = not s end })
    World:Toggle({ Name = 'Ambient', Flag = 'Enable Ambient', Default = false, Callback = function(s) flags['Enable Ambient'] = s end }):Colorpicker({ Flag = 'Ambient Accent', Default = Color3.fromRGB(128,128,128), Callback = function(s) flags['Ambient Accent'] = {Color=s,Transparency=0} end })
    World:Toggle({ Name = 'Outdoor Ambient', Flag = 'Enable Outdoor Ambient', Default = false, Callback = function(s) flags['Enable Outdoor Ambient'] = s end }):Colorpicker({ Flag = 'Outdoor Ambient Accent', Default = Color3.fromRGB(128,128,128), Callback = function(s) flags['Outdoor Ambient Accent'] = {Color=s,Transparency=0} end })
    World:Dropdown({ Name = 'Skybox', Flag = 'Skyboxes', Items = skys, Default = skys[1], Callback = function(s) flags['Skyboxes'] = s; if skyboxes[s] then sky.SkyboxBk='rbxassetid://'..skyboxes[s][1]; sky.SkyboxDn='rbxassetid://'..skyboxes[s][2]; sky.SkyboxFt='rbxassetid://'..skyboxes[s][3]; sky.SkyboxLf='rbxassetid://'..skyboxes[s][4]; sky.SkyboxRt='rbxassetid://'..skyboxes[s][5]; sky.SkyboxUp='rbxassetid://'..skyboxes[s][6] end end })

    local Items = VisualsPage:Section({ Name = 'Items ESP', Side = 2 })
    Items:Toggle({ Name = 'World ESP', Flag = 'word', Default = false, Callback = function(s) flags['word'] = s end })
    Items:Toggle({ Name = 'Hemp', Flag = 'Hemp', Default = false, Callback = function(s) flags['Hemp'] = s; Settings.Hemp.Enabled = s end })
    Items:Slider({ Name = 'Hemp Distance', Flag = 'Disti', Min = 100, Max = 1000, Default = 300, Decimals = 1, Suffix = '', Callback = function(s) flags['Disti'] = s; Settings.Hemp.MaxDistance = s end })
    Items:Toggle({ Name = 'Stone', Flag = 'Stone', Default = false, Callback = function(s) flags['Stone'] = s; Settings.stone.Enabled = s end })
    Items:Slider({ Name = 'Stone Distance', Flag = 'StoneDist', Min = 100, Max = 1000, Default = 450, Decimals = 1, Suffix = '', Callback = function(s) flags['StoneDist'] = s; Settings.stone.MaxDistance = s end })
    Items:Toggle({ Name = 'Sulfur', Flag = 'Sulfur', Default = false, Callback = function(s) flags['Sulfur'] = s; Settings.sulfur.Enabled = s end })
    Items:Slider({ Name = 'Sulfur Distance', Flag = 'SulfurDist', Min = 100, Max = 1000, Default = 400, Decimals = 1, Suffix = '', Callback = function(s) flags['SulfurDist'] = s; Settings.sulfur.MaxDistance = s end })
    Items:Toggle({ Name = 'Iron', Flag = 'Iron', Default = false, Callback = function(s) flags['Iron'] = s; Settings.iron.Enabled = s end })
    Items:Slider({ Name = 'Iron Distance', Flag = 'IronDist', Min = 100, Max = 1000, Default = 500, Decimals = 1, Suffix = '', Callback = function(s) flags['IronDist'] = s; Settings.iron.MaxDistance = s end })
    Items:Toggle({ Name = 'Raid ESP', Flag = 'BoomNigar', Default = false, Callback = function(s) flags['BoomNigar'] = s end }):Colorpicker({ Flag = 'giganigacolar', Default = Color3.fromRGB(255,255,255), Callback = function(s) flags['giganigacolar'] = {Color=s,Transparency=0} end })
    Items:Slider({ Name = 'Raid Lifetime', Flag = 'lifelife', Min = 1, Max = 40, Default = 15, Decimals = 1, Suffix = '', Callback = function(s) flags['lifelife'] = s; LIFETIME = s end })
end

do --// Misc: Movement
    local Mov = MiscPage:Section({ Name = 'Movement', Side = 1 })
    Mov:Toggle({ Name = 'Always Grounded', Flag = 'Always Grounded', Default = false, Callback = function(s) flags['Always Grounded'] = s end })
    Mov:Toggle({ Name = 'No Jump Cooldown', Flag = 'NoJumpi', Default = false, Callback = function(s) flags['NoJumpi'] = s end })
    Mov:Toggle({ Name = 'Omni Sprint', Flag = 'OmniSprint', Default = false, Callback = function(s) flags['OmniSprint'] = s end })
    Mov:Toggle({ Name = 'Always Sprint', Flag = 'Always Sprint', Default = false, Callback = function(s) flags['Always Sprint'] = s end })
    Mov:Slider({ Name = 'Sprint Speed', Flag = 'Sprint Speed', Min = 0, Max = 37, Default = 27, Decimals = 0.01, Suffix = '', Callback = function(s) flags['Sprint Speed'] = s end })
    Mov:Toggle({ Name = 'Fly (BUGGY)', Flag = 'FlyEnabled', Default = false, Callback = function(s) flags['FlyEnabled'] = s end }):Keybind({ Flag = 'FlyKeybind', Default = Enum.KeyCode.V, Mode = 'Toggle', Callback = function(s) flags['FlyKeybind'] = type(s) == "table" and s or {active = s == true} end })
    Mov:Slider({ Name = 'Fly Speed', Flag = 'FlySpeed', Min = 5, Max = 60, Default = 30, Decimals = 1, Suffix = '', Callback = function(s) flags['FlySpeed'] = s end })
    Mov:Toggle({ Name = 'No Fall Damage', Flag = 'NoFallDamage', Default = false, Callback = function(s)
        flags['NoFallDamage'] = s
    end })
    Mov:Toggle({ Name = 'No Footsteps', Flag = 'nofoot', Default = false, Callback = function(s)
        flags['nofoot'] = s
        NoFootsteps:Set(s)
    end })
    Mov:Toggle({ Name = 'Knife Strafe', Flag = 'Strafe', Default = false, Callback = function(s) flags['Strafe'] = s end }):Keybind({ Flag = 'StrafeBind', Default = Enum.KeyCode.U, Mode = 'Toggle', Callback = function(s) flags['StrafeBind'] = type(s) == "table" and s or {active = s == true} end })
    Mov:Slider({ Name = 'Strafe Distance', Flag = 'Strafe Dist', Min = 1, Max = 20, Default = 5, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Strafe Dist'] = s end })
    Mov:Slider({ Name = 'Strafe Speed', Flag = 'Strafe Speed', Min = 6, Max = 40, Default = 16, Decimals = 0.5, Suffix = '', Callback = function(s) flags['Strafe Speed'] = s end })
    Mov:Slider({ Name = 'Strafe Randomness', Flag = 'Strafe Random', Min = 0, Max = 10, Default = 4, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Strafe Random'] = s end })
    Mov:Dropdown({ Name = 'Strafe Type', Flag = 'StrafeMode', Items = {'Spin','Spine'}, Default = 'Spin', Callback = function(s) flags['StrafeMode'] = s end })
    Mov:Toggle({ Name = 'Anti Aim', Flag = 'Anti Aim', Default = false, Callback = function(s) flags['Anti Aim'] = s end })
    Mov:Toggle({ Name = 'Head Jitter', Flag = 'Jittar', Default = false, Callback = function(s) flags['Jittar'] = s; if s then EnableFakePitch() else DisableFakePitch() end end }):Keybind({ Flag = 'Spinar', Default = Enum.KeyCode.N, Mode = 'Toggle', Callback = function(s) flags['Spinar'] = type(s) == "table" and s or {active = s == true} end })
    Mov:Slider({ Name = 'Anti Aim Speed', Flag = 'Anti Aim Speed', Min = 1, Max = 200, Default = 50, Decimals = 1, Suffix = '', Callback = function(s) flags['Anti Aim Speed'] = s end })
    Mov:Toggle({ Name = 'Underground AA', Flag = 'Underground AA', Default = false, Callback = function(state)
        if state then
            if not _G.undergroundConnection then
                _G.dysenc = {}
                local animation = Instance.new('Animation')
                animation.AnimationId = 'rbxassetid://13435049596'
                local lp2 = game:GetService('Players').LocalPlayer
                _G.undergroundConnection = run_service.Heartbeat:Connect(function()
                    if flags['Underground AA Keybind'] and type(flags['Underground AA Keybind']) == "table" and flags['Underground AA Keybind'].active then
                        if not _G.animationTrack or not _G.animationTrack.IsPlaying then
                            pcall(function()
                                local c2 = lp2.Character
                                if c2 then local h2 = c2:FindFirstChildWhichIsA('Humanoid'); if h2 then _G.animationTrack = h2:LoadAnimation(animation); _G.animationTrack.Looped = true; _G.animationTrack:Play() end end
                            end)
                        end
                        if lp2.Character and lp2.Character.PrimaryPart then
                            _G.dysenc[1] = lp2.Character.PrimaryPart.CFrame
                            _G.dysenc[2] = lp2.Character.PrimaryPart.AssemblyLinearVelocity
                            lp2.Character.PrimaryPart.CFrame = (_G.dysenc[1] + Vector3.new(0,-1.9,0)) * CFrame.Angles(0,0,0)
                            task.wait()
                            if lp2.Character and lp2.Character.PrimaryPart then lp2.Character.PrimaryPart.CFrame = _G.dysenc[1]; lp2.Character.PrimaryPart.AssemblyLinearVelocity = _G.dysenc[2] end
                        end
                    else
                        if _G.animationTrack and _G.animationTrack.IsPlaying then pcall(function() _G.animationTrack:Stop() end) end
                    end
                end)
            end
        else
            if _G.undergroundConnection then _G.undergroundConnection:Disconnect(); _G.undergroundConnection = nil end
            if _G.animationTrack then pcall(function() _G.animationTrack:Stop(); _G.animationTrack:Destroy() end); _G.animationTrack = nil end
        end
    end }):Keybind({ Flag = 'Underground AA Keybind', Default = Enum.KeyCode.X, Mode = 'Toggle', Callback = function(s) flags['Underground AA Keybind'] = type(s) == "table" and s or {active = s == true} end })
end

do --// Misc: Camera + Copter
    local Cam = MiscPage:Section({ Name = 'Camera', Side = 2 })
    Cam:Toggle({ Name = 'Camera FOV', Flag = 'FOV', Default = false, Callback = function(s) flags['FOV'] = s end })
    Cam:Slider({ Name = 'FOV Amount', Flag = 'FOV Ammount', Min = 30, Max = 120, Default = 70, Decimals = 1, Suffix = 'x', Callback = function(s) flags['FOV Ammount'] = s end })

    local Copter = MiscPage:Section({ Name = 'Minicopter', Side = 2 })
    Copter:Toggle({ Name = 'Mini Fly', Flag = 'CopterFly', Default = true, Callback = function(s) flags['CopterFly'] = s end })
    Copter:Slider({ Name = 'Fly Speed', Flag = 'CopterSpeed', Min = 10, Max = 100, Default = 80, Decimals = 1, Suffix = '', Callback = function(s) flags['CopterSpeed'] = s end })
    Cam:Toggle({ Name = 'Zoom', Flag = 'Zoom', Default = false, Callback = function(s) flags['Zoom'] = s end }):Keybind({ Flag = 'Zoom Keybind', Default = Enum.KeyCode.Z, Mode = 'Hold', Callback = function(s) flags['Zoom Keybind'] = type(s) == "table" and s or {active = s == true} end })
    Cam:Slider({ Name = 'Zoom Amount', Flag = 'Zoom Ammount', Min = 5, Max = 70, Default = 30, Decimals = 1, Suffix = 'x', Callback = function(s) flags['Zoom Ammount'] = s end })
    Cam:Toggle({ Name = 'Freecam', Flag = 'Enable Freecam', Default = false, Callback = function(s) flags['Enable Freecam'] = s end }):Keybind({ Flag = 'Freecam Keybind', Default = Enum.KeyCode.K, Mode = 'Toggle', Callback = function(s) flags['Freecam Keybind'] = type(s) == "table" and s or {active = s == true} end })
    Cam:Slider({ Name = 'Freecam Speed', Flag = 'Freecam Speed', Min = 0.5, Max = 10, Default = 2, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Freecam Speed'] = s end })
    Cam:Slider({ Name = 'Freecam Sensitivity', Flag = 'Freecam Sensitivity', Min = 0.1, Max = 1, Default = 0.3, Decimals = 0.01, Suffix = '', Callback = function(s) flags['Freecam Sensitivity'] = s end })
    Cam:Toggle({ Name = 'Third Person', Flag = 'Third Person', Default = false, Callback = function(s) flags['Third Person'] = s end }):Keybind({ Flag = 'Third Person Key', Default = Enum.KeyCode.J, Mode = 'Toggle', Callback = function(s) flags['Third Person Key'] = type(s) == "table" and s or {active = s == true} end })
    Cam:Slider({ Name = 'Third Person Distance', Flag = 'Third Person Distance', Min = 1, Max = 30, Default = 5, Decimals = 0.1, Suffix = '', Callback = function(s) flags['Third Person Distance'] = s end })
end

do --// Misc: Gun Mods + Melee Mods
    local Guns = MiscPage:Section({ Name = 'Gun Mods', Side = 1 })
    Guns:Toggle({ Name = 'No Recoil', Flag = 'NoRecoil', Default = false, Callback = function(s) flags['NoRecoil'] = s; if s then applyRecoilHook() else removeRecoilHook() end end })
    Guns:Toggle({ Name = 'ForceShoot', Flag = 'ForceShoot', Default = false, Callback = function(s) flags['ForceShoot'] = s; if s then applyHooks() else removeHooks() end end })
    Guns:Toggle({ Name = 'No Spread', Flag = 'No Spread', Default = false, Callback = function(s) flags['No Spread'] = s end })
    Guns:Toggle({ Name = 'No Gun Effects', Flag = 'No Gun Effects', Default = false, Callback = function(s) flags['No Gun Effects'] = s end })
    Guns:Toggle({ Name = 'Rapid Fire', Flag = 'gun firerate', Default = false, Callback = function(s)
        flags['gun firerate'] = s
    end })
    Guns:Slider({ Name = 'Rapid Fire Speed', Flag = 'rapid fire speed', Min = 0.01, Max = 0.25, Default = 0.02, Decimals = 0.01, Suffix = 's', Callback = function(s) flags['rapid fire speed'] = s end })
    Guns:Toggle({ Name = 'Full Auto', Flag = 'gun auto', Default = false, Callback = function(s)
        flags['gun auto'] = s
    end })

    local MeleeMods = MiscPage:Section({ Name = 'Melee Mods', Side = 1 })
    MeleeMods:Toggle({ Name = 'Melee Mods', Flag = 'MeleeMods', Default = false, Callback = function(s) flags['MeleeMods'] = s end })

    MeleeMods:Slider({ Name = 'Swing Speed', Flag = 'MeleeSwingSpeed', Min = 0.01, Max = 0.5, Default = 0.05, Decimals = 0.01, Suffix = 's', Callback = function(s) flags['MeleeSwingSpeed'] = s end })
    MeleeMods:Slider({ Name = 'Swing Range', Flag = 'MeleeSwingRange', Min = 2, Max = 20, Default = 5, Decimals = 0.5, Suffix = '', Callback = function(s) flags['MeleeSwingRange'] = s end })
end

do --// Misc: World + FPS
    local WorldMisc = MiscPage:Section({ Name = 'World', Side = 2 })
    WorldMisc:Toggle({ Name = 'No Spike Damage', Flag = 'NoSpikeDmg', Default = false, Callback = function(s)
        flags['NoSpikeDmg'] = s
    end })

    local Fps = MiscPage:Section({ Name = 'FPS', Side = 2 })
    Fps:Toggle({
        Name = 'Potato Mode',
        Flag = 'potato_mode',
        Default = false,
        Callback = function(state)
            if state then
                local _Lighting = game:GetService("Lighting")
                local _Terrain = Workspace.Terrain
                --// terrain
                _Terrain.WaterWaveSize = 0
                _Terrain.WaterWaveSpeed = 0
                _Terrain.WaterReflectance = 0
                _Terrain.WaterTransparency = 0
                pcall(function() sethiddenproperty(_Terrain, "Decoration", false) end)
                --// lighting
                _Lighting.GlobalShadows = false
                _Lighting.FogEnd = 9999
                _Lighting.FogStart = 9999
                _Lighting.Brightness = 0
                _Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
                --// disable post effects
                for _, v in ipairs(_Lighting:GetChildren()) do
                    pcall(function()
                        if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect")
                        or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then
                            v.Enabled = false
                        end
                    end)
                end
                --// simplify world
                for _, v in ipairs(Workspace:GetDescendants()) do
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.Material = Enum.Material.Plastic
                            v.Reflectance = 0
                            v.CastShadow = false
                        elseif v:IsA("Decal") or v:IsA("Texture") then
                            v.Transparency = 1
                        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke")
                        or v:IsA("Fire") or v:IsA("Sparkles") then
                            v.Enabled = false
                        elseif v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                            v.Enabled = false
                        elseif v:IsA("SurfaceAppearance") then
                            v:Destroy()
                        end
                    end)
                end
                --// fflags
                pcall(function()
                    setfflag("DFIntDebugFRMQualityLevelOverride",   "1")
                    setfflag("DFFlagTextureQualityOverrideEnabled", "true")
                    setfflag("DFIntTextureQualityOverride",         "0")
                    setfflag("FFlagFixGraphicsQuality",             "true")
                    setfflag("FFlagCommitToGraphicsQualityFix",     "true")
                    setfflag("FIntRenderShadowIntensity",           "0")
                    setfflag("DFIntRenderCloudDensity",             "0")
                    setfflag("FIntDebugForceMSAASamples",           "0")
                    setfflag("DFIntTaskSchedulerTargetFps",         "9999")
                    setfflag("DFIntCullFactorPixelThresholdShadowMapHighQuality", "2048")
                    setfflag("DFIntCullFactorPixelThresholdShadowMapLowQuality",  "2048")
                end)
                --// disable shadows on new parts
                Workspace.DescendantAdded:Connect(function(v)
                    if v:IsA("BasePart") then
                        pcall(function() v.CastShadow = false end)
                    end
                end)
                pcall(function() Library:Notification('FPS', 'Potato Mode enabled!', 3) end)
            end
        end,
    })
end

Library:Notification('Arab Hub', 'Rost Alpha Loaded!', 5)

do
    local _copterConn = nil
    local _copterActive = false
    local COPTER_SPEED = 80  --// studs/sec, within MaxSpeed 103

    local function _isInCopter()
        local char = local_player.Character
        if not char then return false, nil end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or not hum.SeatPart then return false, nil end
        local seat = hum.SeatPart
        local vehicle = seat.Parent
        if not vehicle then return false, nil end
        --// check it's a Minicopter
        if vehicle.Name ~= "Minicopter" then return false, nil end
        local base = vehicle:FindFirstChild("Base")
        if not base then return false, nil end
        return true, base
    end

    local function _startCopter(base)
        if _copterActive then return end
        _copterActive = true

        _copterConn = run_service.RenderStepped:Connect(function(dt)
            local inCopter, b = _isInCopter()
            if not inCopter then
                _copterActive = false
                _copterConn:Disconnect()
                _copterConn = nil
                getgenv()._flyActive = false
                return
            end

            --// respect the UI toggle
            if not flags["CopterFly"] then
                getgenv()._flyActive = false
                return
            end
            getgenv()._flyActive = true

            local cam = workspace.CurrentCamera
            local cf = b.CFrame
            local move = Vector3.zero

            --// use full camera look (including pitch) for direction
            local look = cam.CFrame.LookVector
            local right = cam.CFrame.RightVector

            --// yaw = horizontal camera angle, pitch = vertical tilt
            local yaw   = math.atan2(-look.X, -look.Z)
            local pitch = math.asin(math.clamp(look.Y, -1, 1))

            --// W/S uses full look vector so looking up/down moves up/down naturally
            if uis:IsKeyDown(Enum.KeyCode.W) then move += look end
            if uis:IsKeyDown(Enum.KeyCode.S) then move -= look end
            if uis:IsKeyDown(Enum.KeyCode.A) then move -= right end
            if uis:IsKeyDown(Enum.KeyCode.D) then move += right end

            --// Shift/Ctrl for pure vertical when not pressing W/S
            if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
                move += Vector3.new(0, 1, 0)
            end
            if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
                move -= Vector3.new(0, 1, 0)
            end

            if move.Magnitude > 0 then
                local speed = flags["CopterSpeed"] or 80
                local newPos = cf.Position + move.Unit * speed * dt
                --// rotate helicopter to match camera yaw + pitch tilt
                b.CFrame = CFrame.new(newPos)
                    * CFrame.Angles(0, yaw, 0)
                    * CFrame.Angles(pitch * 0.5, 0, 0)  --// tilt nose up/down at half pitch
                b.AssemblyLinearVelocity = Vector3.zero
                b.AssemblyAngularVelocity = Vector3.zero
            else
                --// when idle, keep current yaw but level out pitch gradually
                b.CFrame = CFrame.new(cf.Position)
                    * CFrame.Angles(0, yaw, 0)
                b.AssemblyLinearVelocity = Vector3.zero
                b.AssemblyAngularVelocity = Vector3.zero
            end
        end)
    end

    --// watch for player entering a Minicopter
    local function _checkSeat()
        local inCopter, base = _isInCopter()
        if inCopter and not _copterActive then
            _startCopter(base)
        end
    end

    --// poll every 0.5s for seat changes
    task.spawn(function()
        while true do
            task.wait(0.5)
            _checkSeat()
        end
    end)

    --// also hook CharacterAdded to reset
    local_player.CharacterAdded:Connect(function()
        _copterActive = false
        if _copterConn then
            pcall(function() _copterConn:Disconnect() end)
            _copterConn = nil
        end
    end)
end
--// Sync all remaining flags that don't have explicit callbacks
task.spawn(function()
    task.wait(0.5) --// wait for UI to fully initialize
    local defaultFlags = {
        --// ESP
        --// Visuals
        ['Chamsi'] = false, ['Colarss'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        ['GunNiger'] = false, ['Colarss2'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        ['gaymaterial'] = 'Neon', ['gunChamsMaterial'] = 'Neon', ['Viewmodel Position'] = false,
        ['No Viewmodel Bob'] = false, ['No Gun Effects'] = false,
        ['Viewmodel Position X'] = 0, ['Viewmodel Position Y'] = 0, ['Viewmodel Position Z'] = 0,
        ['Rotatin X'] = 0, ['Rotatin Position Y'] = 0, ['Rotatin Position Z'] = 0,
        ['Bullet Tracers'] = false, ['Tracer Color'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        ['Hitmarkers'] = false, ['Hitlogs'] = false, ['Hitsounds'] = false,
        ['HitmarkerColor'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        ['No Grass'] = false, ['Enable No Fog'] = false, ['Lighting Brightness'] = 2,
        ['Enable Fullbright'] = false, ['Enable Ambient'] = false, ['Enable Outdoor Ambient'] = false,
        ['Outdoor Ambient Accent'] = {Color=Color3.fromRGB(128,128,128),Transparency=0},
        ['Ambient Accent'] = {Color=Color3.fromRGB(128,128,128),Transparency=0},
        ['word'] = false, ['Hemp'] = false, ['Stone'] = false, ['Sulfur'] = false,
        ['Iron'] = false, ['BoomNigar'] = false,
        ['StoneDist'] = 450, ['SulfurDist'] = 400, ['IronDist'] = 500,
        ['giganigacolar'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        --// Misc
        ['Always Grounded'] = false, ['NoJumpi'] = false, ['OmniSprint'] = false,
        ['Always Sprint'] = false, ['Melee'] = false, ['NoFallDamage'] = false, ['NoSpikeDmg'] = false,
        ['FlyEnabled'] = false, ['FlySpeed'] = 40, ['FlyKeybind'] = {active=false,mode='Toggle',key=Enum.KeyCode.V},
        ['Silent Walk'] = false,
        ['MeleeRange'] = 25, ['MeleeDelay'] = 0.01,
        ['Strafe'] = false, ['StrafeBind'] = {active=false,mode='Toggle',key=Enum.KeyCode.U},
        ['Strafe Dist'] = 5, ['Strafe Speed'] = 16, ['Strafe Random'] = 4,
        ['StrafeMode'] = 'Spin', ['Sprint Speed'] = 27,
        ['Anti Aim'] = false, ['Jittar'] = false,
        ['Spinar'] = {active=false,mode='Toggle',key=Enum.KeyCode.N},
        ['Anti Aim Speed'] = 50, ['Underground AA'] = false,
        ['Underground AA Keybind'] = {active=false,mode='Toggle',key=Enum.KeyCode.X},
        ['FOV'] = false, ['FOV Ammount'] = 70, ['Zoom'] = false,
        ['Zoom Keybind'] = {active=false,mode='Hold',key=Enum.KeyCode.Z},
        ['Zoom Ammount'] = 30, ['Enable Freecam'] = false,
        ['Freecam Keybind'] = {active=false,mode='Toggle',key=Enum.KeyCode.K},
        ['Freecam Speed'] = 2, ['Freecam Sensitivity'] = 0.3,
        ['Third Person'] = false,
        ['Third Person Key'] = {active=false,mode='Toggle',key=Enum.KeyCode.J},
        ['Third Person Distance'] = 5,
        ['NoRecoil'] = false, ['ForceShoot'] = false,
        ['No Spread'] = false, ['gun firerate'] = false, ['gun auto'] = false,
        ['rapid fire speed'] = 0.02,
        ['MeleeMods'] = false, ['MeleeSwingSpeed'] = 0.05, ['MeleeSwingRange'] = 5,
        ['CopterFly'] = true, ['CopterSpeed'] = 80,
        --// Traps
        ['expandar'] = false, ['ColarZZ'] = {Color=Color3.fromRGB(255,255,255),Transparency=0},
        ['sizizi'] = 5, ['Materialz'] = 'Neon',
        ['Staff'] = false, ['StaffAll'] = false,
    }
    for k, v in pairs(defaultFlags) do
        if flags[k] == nil then flags[k] = v end
    end
end)

local ESPObjects = {}
local UPDATE_INTERVAL = 0.1
local lastUpdate = 0

local function getObjectPosition(obj)
    if obj:IsA("BasePart") then
        return obj.Position
    elseif obj:IsA("Model") then
        return obj:GetPivot().Position
    end
end

local function createBillboard(adornee, text, color)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ItemESP"
    billboard.Adornee = adornee
    billboard.Size = UDim2.fromOffset(110, 22)
    billboard.StudsOffset = Vector3.new(0, 1.6, 0)
    billboard.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromScale(1, 1)
    label.BackgroundTransparency = 1
    label.TextScaled = false
    label.TextSize = 13  
    label.Font = Enum.Font.SourceSansBold 
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.3
    label.TextStrokeColor3 = Color3.new(0, 0, 0) 
    label.Text = text
    label.Parent = billboard

    billboard.Parent = adornee
    return billboard
end

local function scanObject(obj, config)
    if not flags["word"] or not config.Enabled then 
        if ESPObjects[obj] then
            ESPObjects[obj]:Destroy()
            ESPObjects[obj] = nil
        end
        return
    end
    local gay = local_char:FindFirstChild("HumanoidRootPart")
    if not gay then return end
    local rootPos = gay.Position
    if not rootPos then return end

    local objPos = getObjectPosition(obj)
    if not objPos then return end

    local dist = (objPos - rootPos).Magnitude
    if dist > config.MaxDistance then
        if ESPObjects[obj] then
            ESPObjects[obj]:Destroy()
            ESPObjects[obj] = nil
        end
        return
    end

    local adornee = obj:IsA("Model") and obj.PrimaryPart or obj
    adornee = adornee or obj:FindFirstChildWhichIsA("BasePart")
    if not adornee then return end

    local text = string.format("%s [%.0fm]", obj.Name, dist)

    if not ESPObjects[obj] then
        ESPObjects[obj] = createBillboard(adornee, text, config.Color)
    else
        local label = ESPObjects[obj]:FindFirstChildOfClass("TextLabel")
        if label then
            label.Text = text
        end
    end
end

local function Reso()
    if tick() - lastUpdate < UPDATE_INTERVAL then
        return
    end
    lastUpdate = tick()

    local hempFolder = Workspace:FindFirstChild("Hemp")
    if hempFolder then
        for _, obj in ipairs(hempFolder:GetChildren()) do
            scanObject(obj, Settings.Hemp)
        end
    end

    local oresFolder = Workspace:FindFirstChild("ores")
    if oresFolder then
        for _, obj in ipairs(oresFolder:GetChildren()) do
            local config = Settings[obj.Name]
            if config then
                scanObject(obj, config)
            end
        end
    end
end


local gxentry = {}

function gxentry:Instance(ClassName, Properties)
    local Instance = Instance.new(ClassName)
    for Index, Value in next, Properties do
        Instance[Index] = Value
    end
    return Instance
end

local trac = false
local mark = false





function gxentry:CreateBeam(origin, direction)
    if not flags["Bullet Tracers"] then return end

    if getgenv().silent and closest_part then
        direction = closest_part.Position
    end

    local tracerColor =
        flags["Tracer Color"] and flags["Tracer Color"].Color
        or Color3.new(1, 1, 1)

    local textureId = tracers_ids[flags["Bulat Type"]]
    if not textureId then return end

    local tracer = Instance.new("Model")
    tracer.Parent = workspace

    local part0 = Instance.new("Part")
    part0.Size = Vector3.new(0.001, 0.001, 0.001)
    part0.Transparency = 1
    part0.Anchored = true
    part0.CanCollide = false
    part0.Position = origin
    part0.Parent = tracer

    local part1 = part0:Clone()
    part1.Position = direction
    part1.Parent = tracer

    local att0 = Instance.new("Attachment", part0)
    local att1 = Instance.new("Attachment", part1)

    local beam = Instance.new("Beam")
    beam.Attachment0 = att0
    beam.Attachment1 = att1
    beam.Parent = tracer

    beam.FaceCamera = true
    beam.Segments = 20 
    beam.Width0 = 0.75
    beam.Width1 = 0.75

    beam.Color = ColorSequence.new(tracerColor)
    beam.LightEmission = 1
    beam.LightInfluence = 0

    beam.Texture = textureId
    beam.TextureMode = Enum.TextureMode.Wrap
    beam.TextureLength = 12 
    beam.TextureSpeed = 2   

    task.delay(3, function()
        tracer:Destroy()
    end)

    return tracer
end

        
local needmark = false

function gxentry:CreateHitmarker(Direction)
    if not flags["Hitmarkers"] or not needmark then return end
    needmark = false

    local ProtectedModel = gxentry:Instance("Model", { Parent = workspace })

    local HitmarkerPart = gxentry:Instance("Part", {
        Position = Direction,
        Size = Vector3.new(0.1, 0.1, 0.1),
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = ProtectedModel,
    })

    local HitmarkerGui = gxentry:Instance("BillboardGui", {
        Size = UDim2.new(0, 20, 0, 20),
        AlwaysOnTop = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = HitmarkerPart,
    })

    local HitmarkerData = {
        { UDim2.new(0, 7, 0, 1), UDim2.new(0, 0, 0.35, -6), 45 },
        { UDim2.new(0, 7, 0, 1), UDim2.new(0, 0, 0.35, 4), -45 },
        { UDim2.new(0, 7, 0, 1), UDim2.new(1, -10, 0.35, -6), -45 },
        { UDim2.new(0, 7, 0, 1), UDim2.new(1, -10, 0.35, 4), 45 },
    }

    for _, Data in next, HitmarkerData do
        local Line = gxentry:Instance("Frame", {
            Size = Data[1],
            BackgroundColor3 = type(flags["HitmarkerColor"]) == "table" and flags["HitmarkerColor"].Color or Color3.new(1, 1, 1),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Position = Data[2],
            Rotation = Data[3],
            Parent = HitmarkerGui,
        })
    end
    needmark = false
    task.delay(5, function()
        for Index = 1, 100 do
            for _, Object in pairs(HitmarkerGui:GetChildren()) do
                if Object:IsA("Frame") then
                    Object.BackgroundTransparency = Index / 100
                end
            end

            task.wait()
        end

        HitmarkerGui:Destroy()
        HitmarkerPart:Destroy()
        ProtectedModel:Destroy()
    end)
end



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FireVisuals = require(ReplicatedStorage.Gun.Scripts.FireVisuals)

local oldNew = FireVisuals.new

FireVisuals.new = function(...)
    local self = oldNew(...)

    if self and self.Hit then
        self.Hit.Event:Connect(function(hitResult)
            if not hitResult then return end
            if not hitResult.Position then return end

            if self.IsReplicated then
                return 
            end

            local cam = workspace.CurrentCamera
            if not cam then return end

            local origin = cam.CFrame.Position
            local hitpos = hitResult.Position
            gxentry:CreateHitmarker(hitpos)

            gxentry:CreateBeam(origin, hitpos)
        end)
    end

    return self
end

--// ============================================================
--// CAMERA FOV + ZOOM
--// ============================================================
do
    local _defaultFOV = 70
    local _fovConn = nil

    local function _applyCameraFOV()
        if _fovConn then return end
        _fovConn = run_service.RenderStepped:Connect(function()
            local cam = workspace.CurrentCamera
            if not cam then return end

            --// FOV override
            if flags["FOV"] then
                local fov = flags["FOV Ammount"] or 70
                if cam.FieldOfView ~= fov then
                    getgenv()._scriptFOV = true
                    cam.FieldOfView = fov
                    getgenv()._scriptFOV = false
                end
            end

            --// Zoom (hold keybind)
            if flags["Zoom"] and type(flags["Zoom Keybind"]) == "table" and flags["Zoom Keybind"].active then
                local zoomFOV = flags["Zoom Ammount"] or 30
                if cam.FieldOfView ~= zoomFOV then
                    getgenv()._scriptFOV = true
                    cam.FieldOfView = zoomFOV
                    getgenv()._scriptFOV = false
                end
            elseif not flags["FOV"] then
                --// restore default when neither FOV nor Zoom is active
                if cam.FieldOfView ~= _defaultFOV then
                    getgenv()._scriptFOV = true
                    cam.FieldOfView = _defaultFOV
                    getgenv()._scriptFOV = false
                end
            end
        end)
    end

    _applyCameraFOV()

    local_player.CharacterAdded:Connect(function()
        task.wait(0.5)
        _defaultFOV = workspace.CurrentCamera.FieldOfView
    end)
end


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GunBase = require(ReplicatedStorage.Gun.Scripts.GunBase)

local oldGetSpread = GunBase.getSpread

function GunBase:getSpread(...)
    if not flags["No Spread"] then
        return oldGetSpread(self, ...)
    end

    return 0
end




local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// ============================================================
--// NO VIEWMODEL BOB + NO GUN EFFECTS (zoom/FOV/camera shake)
--// ============================================================
--// _scriptFOV: set to true before any script-intentional FOV change,
--// so the interceptor knows to allow it instead of reverting it.
getgenv()._scriptFOV = false

local function setScriptFOV(fov)
    getgenv()._scriptFOV = true
    camera.FieldOfView = fov
    getgenv()._scriptFOV = false
end

do
    local _defaultFOV = camera.FieldOfView
    local _fovConn = nil

    local function _startNoGunEffects()
        if _fovConn then return end
        _fovConn = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
            if not flags["No Gun Effects"] then return end
            --// allow changes the script itself made
            if getgenv()._scriptFOV then return end
            --// revert game-originated FOV changes
            getgenv()._scriptFOV = true
            camera.FieldOfView = _defaultFOV
            getgenv()._scriptFOV = false
        end)
    end

    local function _stopNoGunEffects()
        if _fovConn then
            pcall(function() _fovConn:Disconnect() end)
            _fovConn = nil
        end
    end

    --// Hook GunClient/ToolClient zoom methods
    pcall(function()
        local GC = require(rs.Gun.Scripts.GunClient)
        for _, name in ipairs({ "zoomIn", "zoomOut", "setZoom", "aimIn", "aimOut", "onAimIn", "onAimOut" }) do
            if type(GC[name]) == "function" then
                local orig = GC[name]
                GC[name] = function(self, ...)
                    if flags["No Gun Effects"] then return end
                    return orig(self, ...)
                end
            end
        end
    end)

    pcall(function()
        local TC = require(rs.Tool.Scripts.ToolClient)
        for _, name in ipairs({ "zoomIn", "zoomOut", "setZoom", "aimIn", "aimOut", "onAimIn", "onAimOut" }) do
            if type(TC[name]) == "function" then
                local orig = TC[name]
                TC[name] = function(self, ...)
                    if flags["No Gun Effects"] then return end
                    return orig(self, ...)
                end
            end
        end
    end)

    --// GC scan for any other tables with zoom methods
    task.spawn(function()
        task.wait(2)
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                for _, name in ipairs({ "zoomIn", "zoomOut", "aimIn", "aimOut", "setFOV", "setZoom" }) do
                    if type(rawget(v, name)) == "function" then
                        local orig = rawget(v, name)
                        rawset(v, name, function(self, ...)
                            if flags["No Gun Effects"] then return end
                            return orig(self, ...)
                        end)
                    end
                end
            end
        end
    end)

    _startNoGunEffects()

    local_player.CharacterAdded:Connect(function()
        _defaultFOV = camera.FieldOfView
        _stopNoGunEffects()
        task.wait(0.5)
        _startNoGunEffects()
    end)
end
--// Autoshoot
    local run_service = game:GetService("RunService")
    local virtual_input_manager = game:GetService("VirtualInputManager")
    local players = game:GetService("Players")
    local workspace = game:GetService("Workspace")
    local local_player = players.LocalPlayer

    local click_delay = 0
    local last_click = 0

    --// Raycast validation function to check line of sight
    local function is_target_visible(target_character, target_part)
        local origin_char = local_player.Character
        local origin_head = origin_char and origin_char:FindFirstChild("Head")
        
        if not origin_head or not target_part then return false end

        local origin = origin_head.Position
        local direction = target_part.Position - origin

        -- Exclude the local player's character from the raycast collision
        local raycast_params = RaycastParams.new()
        raycast_params.FilterDescendantsInstances = {origin_char}
        raycast_params.FilterType = Enum.RaycastFilterType.Exclude

        local raycast_result = workspace:Raycast(origin, direction, raycast_params)

        if raycast_result then
            -- Returns true only if the first solid object hit belongs to the target
            return raycast_result.Instance:IsDescendantOf(target_character)
        end

        return false
    end

    run_service.RenderStepped:Connect(function()
        if not flags["autoshoot"] then return end

        local now = tick()
        if now - last_click < click_delay then return end

        -- Fetch closest target (requires getClosestPlayerInFOV to be defined in your environment)
        local target, part = getClosestPlayerInFOV()
        if not target or not part then return end

        local char = target.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end

        --// Line of Sight Check
        if not is_target_visible(char, part) then return end

        --// Direct Mouse Click Simulation (Independent of tool state)
        virtual_input_manager:SendMouseButtonEvent(0, 0, 0, true, game, 0) -- Left Mouse Down
        task.wait(0.02)
        virtual_input_manager:SendMouseButtonEvent(0, 0, 0, false, game, 0) -- Left Mouse Up

        last_click = now
    end)
--\\

--// smth to do w viewmodel idk
local ViewModelModule = require(ReplicatedStorage.ViewModel.Scripts.ViewModel)

local oldNew = ViewModelModule.new
local hooked = setmetatable({}, { __mode = "k" })

ViewModelModule.new = function(...)
	local vm = oldNew(...)
	if typeof(vm) ~= "table" then
		return vm
	end

	if hooked[vm] then
		return vm
	end
	hooked[vm] = true

	return vm
end

local oldUpdate = ViewModelModule.updateCFrame
ViewModelModule.updateCFrame = function(self, smooth, dt)
	--// No Viewmodel Bob: zero out bob offset before the update runs
	if flags["No Viewmodel Bob"] and self then
		pcall(function()
			if self.bobOffset ~= nil then self.bobOffset = CFrame.new() end
			if self.swayOffset ~= nil then self.swayOffset = CFrame.new() end
			if self.bob ~= nil then self.bob = Vector3.zero end
			if self.sway ~= nil then self.sway = Vector3.zero end
			if self.bobCFrame ~= nil then self.bobCFrame = CFrame.new() end
			if self.swayCFrame ~= nil then self.swayCFrame = CFrame.new() end
		end)
	end

	oldUpdate(self, smooth, dt)

	if not self.viewModel then return end
	if not viewenabal then return end

	local pos = CFrame.new(
		xere or 0,
		yere or 0,
		zere or 0
	)

	local rot = CFrame.Angles(
		math.rad(rotX or 0),
		math.rad(rotY or 0),
		math.rad(rotZ or 0)
	)

	self.viewModel:PivotTo(
		self.viewModel:GetPivot() * pos * rot
	)
end



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ViewModel = require(ReplicatedStorage.ViewModel.Scripts.ViewModel)

local CHAMS_MATERIAL = Enum.Material.Neon

local original = setmetatable({}, { __mode = "k" })

local function saveOriginal(part)
	if original[part] then return end
	original[part] = {
		Color = part.Color,
		Material = part.Material,
		CastShadow = part.CastShadow
	}
end

local function findTool(vm)
	for _, inst in ipairs(vm:GetChildren()) do
		if inst:IsA("Tool") then
			return inst
		end
	end
end

local function applyChams(vm)
	if not vm then return end

	local tool = findTool(vm)
	if not tool then return end

	for _, inst in ipairs(tool:GetDescendants()) do
		if inst:IsA("SurfaceAppearance") then
			inst:Destroy()

		elseif inst:IsA("BasePart") then
			saveOriginal(inst)

			inst.Color = flags["Colarss"].Color
			inst.Material = Enum.Material[flags["gunChamsMaterial"] or "Neon"]
			inst.CastShadow = false
		end
	end
end

local function restoreChams(vm)
	if not vm then return end

	local tool = findTool(vm)
	if not tool then return end

	for _, inst in ipairs(tool:GetDescendants()) do
		local data = original[inst]
		if inst:IsA("BasePart") and data then
			inst.Color = data.Color
			inst.Material = data.Material
			inst.CastShadow = data.CastShadow
		end
	end
end


local function applyArmChams(vm)
	if not vm then return end

    local shirt = local_char:FindFirstChildOfClass("Shirt")
	local pants = local_char:FindFirstChildOfClass("Pants")

	if shirt then shirt:Destroy() end
	if pants then pants:Destroy() end

	for _, inst in ipairs(vm:GetDescendants()) do
		if inst:IsA("SurfaceAppearance") and inst.Parent and inst.Parent:IsA("BasePart") then
			if string.find(inst.Parent.Name:lower(), "arm") then
				inst:Destroy()
			end

		elseif inst:IsA("BasePart") then
			if string.find(inst.Name:lower(), "arm") then
				saveOriginal(inst)

				inst.Color = flags["Colarss2"].Color
				inst.Material = Enum.Material[flags["gaymaterial"]]
				inst.CastShadow = false
			end
		end
	end
end


local function restoreArmChams(vm)
	if not vm then return end

	for _, inst in ipairs(vm:GetDescendants()) do
		local data = original[inst]
		if inst:IsA("BasePart") and data then
			if string.find(inst.Name:lower(), "arm") then
				inst.Color = data.Color
				inst.Material = data.Material
				inst.CastShadow = data.CastShadow
			end
		end
	end
end

local function update(vm)
	if flags["Chamsi"] then
		applyChams(vm)
	else
		restoreChams(vm)
	end
	if flags["GunNiger"] then
		applyArmChams(vm)
	else
		restoreArmChams(vm)
	end
end

--// hook createViewModel to catch new viewmodels
local oldCreate
pcall(function()
    oldCreate = hookfunction(ViewModel.createViewModel, function(self, ...)
        oldCreate(self, ...)
        if self and self.viewModel then
            update(self.viewModel)
        end
    end)
end)

--// drive chams on a throttled heartbeat (not every frame)
local _chamsFrame = 0
run_service.Heartbeat:Connect(function()
    _chamsFrame += 1
    if _chamsFrame % 10 ~= 0 then return end
    if not (flags["Chamsi"] or flags["GunNiger"]) then return end
    pcall(function()
        local cam = workspace.CurrentCamera
        for _, v in ipairs(cam:GetChildren()) do
            if v:IsA("Model") and v ~= local_player.Character then
                update(v)
            end
        end
    end)
end)





--[[local invis_cache = {}

local function isInTool(instance)
    return instance:FindFirstAncestorOfClass("Tool") ~= nil
end

local function setCharacterInvisible(character)
    if not character then return end

    invis_cache[character] = invis_cache[character] or {}

    for _, obj in ipairs(character:GetDescendants()) do
        if obj:IsA("BasePart") and not isInTool(obj) then
            invis_cache[character][obj] = {
                Transparency = obj.Transparency
            }

            obj.Transparency = 1

        elseif (obj:IsA("Decal") or obj:IsA("Texture")) and not isInTool(obj) then
            invis_cache[character][obj] = {
                Transparency = obj.Transparency,
            }

            obj.Transparency = 1
        end
    end
end

local function setCharacterVisible(character)
    if not character then return end
    if not invis_cache[character] then return end

    for obj, data in pairs(invis_cache[character]) do
        if obj and obj.Parent then
            if obj:IsA("BasePart") then
                obj.Transparency = data.Transparency
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = data.Transparency
            end
        end
    end

    invis_cache[character] = nil
end
--//]]


Protected = Instance.new("ScreenGui", gethui())
Protected.IgnoreGuiInset = true

CrosshairHolder = gxentry:Instance("Frame", {BorderColor3 = Color3.fromRGB(0, 0, 0), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 0), Parent = Protected})
CrosshairTop = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(0.5, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
CrosshairRight = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(0, 0.5), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
CrosshairLeft = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(1, 0.5), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
CrosshairBottom = gxentry:Instance("Frame", { AnchorPoint = Vector2.new(0.5, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})

local ArmorInfoGUI
local ArmorInfoFrame

local function CreateArmorGUI()
    if ArmorInfoGUI and ArmorInfoGUI.Parent then
        ArmorInfoGUI:Destroy()
    end

    local players = game:GetService("Players")
    local TextService = game:GetService("TextService")

    ArmorInfoGUI = Instance.new("ScreenGui")
    ArmorInfoGUI.Name = "PlayerArmorInfoGUI"
    ArmorInfoGUI.ResetOnSpawn = false
    ArmorInfoGUI.Enabled = true
    ArmorInfoGUI.Parent = game:GetService("CoreGui")
    ArmorInfoGUI.DisplayOrder = 999

    local Theme = Library and Library.Theme or {
        Background = Color3.fromRGB(14, 17, 15),
        Border = Color3.fromRGB(12, 12, 12),
        Outline = Color3.fromRGB(42, 49, 45),
        Accent = Color3.fromRGB(157, 0, 255),
        Text = Color3.fromRGB(235, 235, 235),
        ["Text Stroke"] = Color3.fromRGB(0, 0, 0),
    }

    local Font = (Library and Library.Font) or Font.new("rbxasset://fonts/families/RobotoMono.json")

    ArmorInfoFrame = Instance.new("Frame")
    ArmorInfoFrame.Name = "ArmorInfo"
    ArmorInfoFrame.Parent = ArmorInfoGUI
    ArmorInfoFrame.AnchorPoint = Vector2.new(0, 0.5)
    ArmorInfoFrame.Position = UDim2.new(0, 12, 0.5, 0)
    ArmorInfoFrame.Size = UDim2.new(0, 160, 0, 32)
    ArmorInfoFrame.AutomaticSize = Enum.AutomaticSize.XY
    ArmorInfoFrame.BackgroundColor3 = Theme.Background
    ArmorInfoFrame.BorderColor3 = Theme.Border
    ArmorInfoFrame.BorderSizePixel = 2

    local dragging = false
    local dragstart, startPos
    local UserInputService = game:GetService("UserInputService")

    ArmorInfoFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragstart = input.Position
            startPos = ArmorInfoFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragstart

            ArmorInfoFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    local outlineStroke = Instance.new("UIStroke")
    outlineStroke.Color = Theme.Outline
    outlineStroke.Thickness = 1
    outlineStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    outlineStroke.Parent = ArmorInfoFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = ArmorInfoFrame
    TitleLabel.FontFace = Font
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Text = "Loadout"
    TitleLabel.Size = UDim2.new(0, 0, 0, 20)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 0, 0, -4)
    TitleLabel.BorderSizePixel = 0
    TitleLabel.AutomaticSize = Enum.AutomaticSize.X
    TitleLabel.TextSize = 9

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Theme["Text Stroke"]
    titleStroke.Thickness = 1
    titleStroke.Transparency = 0.6
    titleStroke.Parent = TitleLabel

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 8)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.Parent = ArmorInfoFrame

    local Liner = Instance.new("Frame")
    Liner.Parent = ArmorInfoFrame
    Liner.Position = UDim2.new(0, 0, 0, 15)
    Liner.BackgroundColor3 = Theme.Accent
    Liner.BorderSizePixel = 0
    Liner.Size = UDim2.new(1, 0, 0, 1)

    local ICON_SIZE = 32  --// px per icon slot

    local Content = Instance.new("Frame")
    Content.Parent = ArmorInfoFrame
    Content.BackgroundTransparency = 1
    Content.Position = UDim2.new(0, 8, 0, 32)
    Content.Size = UDim2.new(0, (ICON_SIZE + 8) * 6 + 4 * 5, 0, 0)
    Content.AutomaticSize = Enum.AutomaticSize.Y
    Content.ClipsDescendants = false

    local contentLayout = Instance.new("UIGridLayout")
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.CellSize = UDim2.new(0, ICON_SIZE + 8, 0, ICON_SIZE + 8)
    contentLayout.CellPadding = UDim2.new(0, 4, 0, 4)
    contentLayout.FillDirection = Enum.FillDirection.Horizontal
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    contentLayout.Parent = Content

    local function getCharacterFromEntry(entry)
        if not entry then
            return nil
        end

        if typeof(entry) == "Instance" and entry:IsA("Model") then
            return entry
        end

        if typeof(entry) == "Instance" and entry:IsA("Player") then
            return entry.Character
        end

        if typeof(entry) == "string" then
            local plr = players:FindFirstChild(entry)

            if plr then
                return plr.Character
            end
        end

        return nil
    end

    local GUN_KEYS = {
        "ak", "m4", "mp5", "pistol", "rifle", "shotgun", "sniper", "smg",
        "gun", "revolver", "crossbow", "bow", "lmg", "carbine", "assault",
        "semi", "burst", "auto", "weapon", "firearm", "musket", "minigun",
        "thompson", "uzi", "vector", "scar", "aug", "p90", "deagle",
    }

    local ARMOR_KEYS = {
        "helmet", "vest", "armor", "armour", "plate", "chest", "jacket",
        "hoodie", "shirt", "pants", "boots", "gloves", "mask", "balaclava",
        "hat", "cap", "hood", "coat", "suit", "gear", "kevlar", "cloth",
        "hazmat", "gasmask", "bandana", "beanie",
    }

    local function isGun(name)
        local n = name:lower()

        for _, k in ipairs(GUN_KEYS) do
            if n:find(k, 1, true) then
                return true
            end
        end

        return false
    end

    local function isArmor(name)
        local n = name:lower()

        for _, k in ipairs(ARMOR_KEYS) do
            if n:find(k, 1, true) then
                return true
            end
        end

        return false
    end

    local function getToolIcon(toolObj)
        --// 1. Tool.TextureId (set by devs directly)
        if toolObj and toolObj.TextureId and toolObj.TextureId ~= "" then
            return toolObj.TextureId
        end
        --// 2. ImageLabel or Decal inside the tool
        if toolObj then
            for _, d in ipairs(toolObj:GetDescendants()) do
                if d:IsA("Decal") and d.Texture ~= "" then
                    return d.Texture
                end
                if d:IsA("ImageLabel") and d.Image ~= "" then
                    return d.Image
                end
            end
        end
        --// 3. Fallback: blank
        return ""
    end

    local function createItemSlot(name, toolObj)
        local icon = getToolIcon(toolObj)

        local slot = Instance.new("Frame")
        slot.Parent = Content
        slot.BackgroundColor3 = Theme.Background
        slot.BorderSizePixel = 0
        slot.Size = UDim2.new(0, ICON_SIZE + 8, 0, ICON_SIZE + 8)
        slot.AutomaticSize = Enum.AutomaticSize.None
        slot.ClipsDescendants = true

        local slotStroke = Instance.new("UIStroke")
        slotStroke.Color = Theme.Outline
        slotStroke.Thickness = 1
        slotStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        slotStroke.Parent = slot

        local slotCorner = Instance.new("UICorner")
        slotCorner.CornerRadius = UDim.new(0, 3)
        slotCorner.Parent = slot

        local img = Instance.new("ImageLabel")
        img.Parent = slot
        img.Size = UDim2.new(1, -4, 1, -4)
        img.Position = UDim2.new(0, 2, 0, 2)
        img.BackgroundTransparency = 1
        img.ScaleType = Enum.ScaleType.Fit
        img.Image = icon ~= "" and icon or "rbxassetid://0"
        img.ImageTransparency = icon == "" and 1 or 0

        --// name tooltip shown on hover via a TextLabel at bottom
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = slot
        nameLabel.Size = UDim2.new(1, 0, 0, 12)
        nameLabel.Position = UDim2.new(0, 0, 1, 0)
        nameLabel.AnchorPoint = Vector2.new(0, 1)
        nameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
        nameLabel.BackgroundTransparency = 0.4
        nameLabel.BorderSizePixel = 0
        nameLabel.Text = name
        nameLabel.FontFace = Font
        nameLabel.TextSize = 7
        nameLabel.TextColor3 = Theme.Text
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.Visible = false  --// show on hover

        slot.MouseEnter:Connect(function() nameLabel.Visible = true end)
        slot.MouseLeave:Connect(function() nameLabel.Visible = false end)

        --// if no icon, show text fallback inside the slot
        if icon == "" then
            img.ImageTransparency = 1
            local fallback = Instance.new("TextLabel")
            fallback.Parent = slot
            fallback.Size = UDim2.new(1, -4, 1, -4)
            fallback.Position = UDim2.new(0, 2, 0, 2)
            fallback.BackgroundTransparency = 1
            fallback.Text = name:sub(1, 4)
            fallback.FontFace = Font
            fallback.TextSize = 8
            fallback.TextColor3 = Theme.Text
            fallback.TextWrapped = true
            fallback.TextScaled = false
        end

        return slot
    end

    local detectedItems = {}
    local itemLabels = {}

    local function updateSize()
        --// AutomaticSize on ArmorInfoFrame handles width/height automatically.
        --// Just add a bottom padding frame so content isn't flush against the edge.
    end

    local function addItem(name, toolObj)
        if detectedItems[name] then return end
        detectedItems[name] = true
        local slot = createItemSlot(name, toolObj)
        itemLabels[name] = slot
        updateSize()
    end

    local function clearItems()
        for _, slot in pairs(itemLabels) do
            slot:Destroy()
        end
        itemLabels = {}
        detectedItems = {}
        updateSize()
    end

    function UpdatePlayerArmor(entry)
        clearItems()

        local character = getCharacterFromEntry(entry)

        if not character or not character.Parent then
            TitleLabel.Text = "No target"
            updateSize()
            return
        end

        local plr = players:GetPlayerFromCharacter(character)
        TitleLabel.Text = (plr and plr.Name or character.Name) .. "'s Loadout"

        for _, obj in ipairs(character:GetChildren()) do
            if obj:IsA("Tool") then
                addItem(obj.Name, obj)
            end
        end

        if plr then
            local backpack = plr:FindFirstChildOfClass("Backpack")
            if backpack then
                for _, obj in ipairs(backpack:GetChildren()) do
                    if obj:IsA("Tool") then
                        addItem(obj.Name, obj)
                    end
                end
            end
        end
    end

    updateSize()

    return {
        GUI = ArmorInfoGUI,
        Frame = ArmorInfoFrame,
        Update = UpdatePlayerArmor,
        SetTarget = UpdatePlayerArmor
    }
end

local ArmorGUI = CreateArmorGUI()
local ArmorInfoGUI = ArmorGUI.GUI

local function _renderArmorViewer()
    if not Configuration.Visuals.PlayerArmorInfoWindow then
        if ArmorInfoGUI then
            ArmorInfoGUI.Enabled = false
        end

        return
    end

    local armorTarget = target_frame and target_frame.target and target_frame.target.entry

    if armorTarget and ArmorGUI then
        ArmorInfoGUI.Enabled = true

        local tid = tostring(armorTarget.UserId or armorTarget)

        if ArmorInfoGUI:GetAttribute("lastTarget") ~= tid then
            ArmorInfoGUI:SetAttribute("lastTarget", tid)
            ArmorGUI:Update(armorTarget)
        end
    else
        if ArmorInfoGUI then
            ArmorInfoGUI.Enabled = false
            ArmorInfoGUI:SetAttribute("lastTarget", "")
        end
    end
end

show_hit_notification = false
hit_target_name = ""
hit_part_name = ""
hit_damage = 0
--// No Fall Damage: cap downward velocity before impact and restore health if dropped by fall
do
    local _nfd_conn = nil
    local _nfd_health_conn = nil
    local FALL_VEL_THRESHOLD = -50
    local SAFE_VEL = -10

    local function _flyActive()
        local fly_keybind = flags["FlyKeybind"]
        return flags["FlyEnabled"] and typeof(fly_keybind) == "table" and fly_keybind.active
    end

    local function _nfdActive()
        return flags["NoFallDamage"] and not _flyActive()
    end

    local function _setupNFD(char)
        if _nfd_conn then pcall(function() _nfd_conn:Disconnect() end) end
        if _nfd_health_conn then pcall(function() _nfd_health_conn:Disconnect() end) end

        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        local hum = char:WaitForChild("Humanoid", 5)
        if not hrp or not hum then return end

        _nfd_conn = run_service.Heartbeat:Connect(function()
            if not _nfdActive() then return end
            if not hrp or not hrp.Parent then return end

            local vel = hrp.AssemblyLinearVelocity

            if vel.Y < FALL_VEL_THRESHOLD then
                hrp.AssemblyLinearVelocity = Vector3.new(vel.X, SAFE_VEL, vel.Z)
            end
        end)

        local lastHealth = hum.Health

        _nfd_health_conn = hum.HealthChanged:Connect(function(newHealth)
            if not _nfdActive() then
                lastHealth = newHealth
                return
            end

            local state = hum:GetState()

            if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Landed then
                local drop = lastHealth - newHealth

                if drop > 0 and drop < hum.MaxHealth * 0.5 then
                    hum.Health = lastHealth
                end
            end

            lastHealth = hum.Health
        end)
    end

    if local_player.Character then
        task.spawn(_setupNFD, local_player.Character)
    end

    local_player.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        _setupNFD(char)
    end)
end
--// No Spike Damage: set CanTouch=false on spike parts so the physics engine
do
    local _spikedParts = {}

    local function _disableSpike(obj)
        if not obj or not obj.Parent then return end
        if _spikedParts[obj] then return end
        _spikedParts[obj] = obj.CanTouch
        pcall(function() obj.CanTouch = false end)
    end

    local function _enableSpike(obj)
        if not _spikedParts[obj] then return end
        pcall(function() obj.CanTouch = _spikedParts[obj] end)
        _spikedParts[obj] = nil
    end

    local function _scanAndApply()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name == "Spikes" and obj:IsA("BasePart") then
                if flags["NoSpikeDmg"] then
                    _disableSpike(obj)
                else
                    _enableSpike(obj)
                end
            end
        end
    end

    Workspace.DescendantAdded:Connect(function(obj)
        if obj.Name == "Spikes" and obj:IsA("BasePart") and flags["NoSpikeDmg"] then
            task.defer(function() _disableSpike(obj) end)
        end
    end)

    Workspace.DescendantRemoving:Connect(function(obj)
        _spikedParts[obj] = nil
    end)

    task.spawn(function()
        while true do
            task.wait(10)  --// reduced from 2s to 10s, events handle new spikes
            if flags["NoSpikeDmg"] then _scanAndApply() end
        end
    end)

    --// initial scan
    task.spawn(function()
        task.wait(2)
        _scanAndApply()
    end)
end

local _manip_ray_params = nil
local _manip_offsets = nil
local _manip_last_max_dist = nil

local function _updateManipulation()
    if not flags["Manipulation"] then
        Cheat.Globals.ManipulationPosition = nil
        return
    end

    local target = target_frame.target.entry
    local bodypart = target_frame.target.part

    if not target or not bodypart then
        Cheat.Globals.ManipulationPosition = nil
        return
    end

    local head = local_char and local_char:FindFirstChild("Head")
    local origin = head and head.Position or camera.CFrame.Position
    local target_pos = bodypart.Position

    if not _manip_ray_params then
        _manip_ray_params = RaycastParams.new()
        _manip_ray_params.FilterType = Enum.RaycastFilterType.Blacklist
        _manip_ray_params.IgnoreWater = true
    end

    _manip_ray_params.FilterDescendantsInstances = {
        local_player.Character,
        camera
    }

    local direction = target_pos - origin
    local wall_hit = workspace:Raycast(origin, direction, _manip_ray_params)

    local behind_wall = wall_hit and wall_hit.Instance and not wall_hit.Instance:IsDescendantOf(target.Character)

    if behind_wall then
        local max_dist = flags["Manipulation Max Distance"] or 11.5
        if not _manip_offsets or _manip_last_max_dist ~= max_dist then
            _manip_last_max_dist = max_dist
            _manip_offsets = { Vector3.new(0, 0, 0) }
            
            --// Left/Right offsets
            for d = 1.5, max_dist, 1.5 do
                table.insert(_manip_offsets, Vector3.new(d, 0, 0))   --// Right
                table.insert(_manip_offsets, Vector3.new(-d, 0, 0))  --// Left
            end
            
            --// Up offsets
            for d = 1.5, max_dist, 1.5 do
                table.insert(_manip_offsets, Vector3.new(0, d, 0))   --// Up
            end
            
            --// Combined diagonals
            for d = 1.5, max_dist / 1.5, 1.5 do
                for u = 1.5, max_dist / 1.5, 1.5 do
                    table.insert(_manip_offsets, Vector3.new(d, u, 0))
                    table.insert(_manip_offsets, Vector3.new(-d, u, 0))
                end
            end
        end

        local bestPos = nil
        local shortest_offset = math.huge
        local cam_cf = camera.CFrame

        for _, offset in ipairs(_manip_offsets) do
            local testPos = origin + cam_cf:VectorToWorldSpace(offset)
            local testDir = target_pos - testPos

            local result = workspace:Raycast(testPos, testDir, _manip_ray_params)
            local visible = not result or (result.Instance and result.Instance:IsDescendantOf(target.Character))

            if visible then
                local offset_len = offset.Magnitude
                if offset_len < shortest_offset then
                    shortest_offset = offset_len
                    bestPos = testPos
                end
            end
        end

        Cheat.Globals.ManipulationPosition = bestPos
    else
        Cheat.Globals.ManipulationPosition = nil
    end
end


function getClosestPlayerInFOV()
    local mouse_position = uis:GetMouseLocation()
    local cam_position   = camera.CFrame.Position
    local fov_radius     = flags["Enable FOV"] and (flags["FOV Radius"] or 120) or math.huge
    local max_dist_3d    = flags["Aimbot Max Distance"] or math.huge

    local best_entry, best_part
    local best_screen_dist = flags["Enable FOV"]
        and (fov_radius / math.tan(math.rad(camera.FieldOfView * 0.5)))
        or math.huge

    for _, plr in ipairs(players:GetPlayers()) do
        if plr == local_player then continue end
        local char = plr.Character
        if not char then continue end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end

        --// team check
        if flags["Friendly Check"] and YallahCheckTeam(plr) then continue end

        local bone = flags["Aimbot Bone"] or "Head"
        local bones = bone == "Closest Bone"
            and {"Head","Torso","UpperTorso","HumanoidRootPart","LeftArm","RightArm","LeftLeg","RightLeg"}
            or {bone}

        for _, bname in ipairs(bones) do
            local part = char:FindFirstChild(bname)
            if not part then continue end

            local screen_pos, on_screen = camera:WorldToViewportPoint(part.Position)
            if not on_screen then continue end

            local dist_3d = (part.Position - cam_position).Magnitude
            if dist_3d > max_dist_3d then continue end

            if flags["Visible Check"] and not player_esp.functions.is_visible(char) then continue end

            local screen_dist = (Vector2.new(screen_pos.X, screen_pos.Y) - mouse_position).Magnitude
            if screen_dist < best_screen_dist then
                best_screen_dist = screen_dist
                best_entry = plr
                best_part  = part
            end
        end
    end

    --// update target_frame
    if best_entry and best_part then
        target_frame.target.entry    = best_entry
        target_frame.target.part     = best_part
        target_frame.target.distance = best_screen_dist
    else
        target_frame.target.entry    = nil
        target_frame.target.part     = nil
        target_frame.target.distance = math.huge
    end

    return best_entry, best_part
end




local _mainFrame = 0
--// Render loop sub-functions (extracted to stay under 200 local limit)
local function _renderCrosshair()
    if flags["Crosshair Enabled"] then
        CrosshairHolder.Rotation = flags["Crosshair Spin"] and CrosshairHolder.Rotation + flags["Crosshair Speed"] / 100 or 0
        CrosshairTop.Position    = UDim2.new(0.5, 0, 0, -flags["Crosshair Spread"] / 2)
        CrosshairRight.Position  = UDim2.new(1,  flags["Crosshair Spread"] / 2, 0.5, 0)
        CrosshairLeft.Position   = UDim2.new(0, -flags["Crosshair Spread"] / 2, 0.5, 0)
        CrosshairBottom.Position = UDim2.new(0.5, 0, 1, flags["Crosshair Spread"] / 2)
        CrosshairTop.Size    = UDim2.new(0, flags["Crosshair Width"], 0, flags["Crosshair Length"])
        CrosshairRight.Size  = UDim2.new(0, flags["Crosshair Length"], 0, flags["Crosshair Width"])
        CrosshairLeft.Size   = UDim2.new(0, flags["Crosshair Length"], 0, flags["Crosshair Width"])
        CrosshairBottom.Size = UDim2.new(0, flags["Crosshair Width"], 0, flags["Crosshair Length"])
        local c = type(flags["Crosshair Color"]) == "table" and flags["Crosshair Color"].Color or Color3.new(1,1,1)
        CrosshairTop.BackgroundColor3 = c; CrosshairRight.BackgroundColor3 = c
        CrosshairLeft.BackgroundColor3 = c; CrosshairBottom.BackgroundColor3 = c
        CrosshairTop.Visible = true; CrosshairRight.Visible = true
        CrosshairLeft.Visible = true; CrosshairBottom.Visible = true
    else
        CrosshairTop.Visible = false; CrosshairRight.Visible = false
        CrosshairLeft.Visible = false; CrosshairBottom.Visible = false
    end
end

local function _renderLighting()
    if flags["Enable Fullbright"] then
        if lighting.ClockTime ~= 12 then lighting.ClockTime = 12 end
    else lighting.ClockTime = lighting_cache.ClockTime end
    if flags["Enable No Fog"] then
        lighting.FogEnd = 100000
        local atm = lighting:FindFirstChild("Atmosphere")
        if atm then atm.Density=0; atm.Offset=0; atm.Glare=0; atm.Haze=0 end
    else
        lighting.FogEnd = lighting_cache.FogEnd
        local atm = lighting:FindFirstChild("Atmosphere")
        if atm then atm.Density=lighting_cache.Density; atm.Offset=lighting_cache.Offset; atm.Glare=lighting_cache.Glare; atm.Haze=lighting_cache.Haze end
    end
    if flags["Enable Ambient"] then
        local a = type(flags["Ambient Accent"]) == "table" and flags["Ambient Accent"].Color or Color3.fromRGB(128,128,128)
        if lighting.Ambient ~= a then lighting.Ambient = a end
    else lighting.Ambient = lighting_cache.Ambient end
    if flags["Enable Outdoor Ambient"] then
        local o = type(flags["Outdoor Ambient Accent"]) == "table" and flags["Outdoor Ambient Accent"].Color or Color3.fromRGB(128,128,128)
        if lighting.OutdoorAmbient ~= o then lighting.OutdoorAmbient = o end
    else lighting.OutdoorAmbient = lighting_cache.OutdoorAmbient end
end

local _fov_state = {
    visible = false,
    size = 0,
    bgTransparency = 1,
    strokeColor = Color3.new(1,1,1),
    fillColor = Color3.new(1,1,1),
    position = Vector2.new(0,0),
}

local _snap_state = {
    visible = false,
    color = Color3.new(1,1,1),
    position = UDim2.new(0,0,0,0),
    rotation = 0,
    size = UDim2.new(0,0,0,1),
}

local function _renderFOV()
    if flags["Enable FOV"] then
        if not _fov_state.visible then
            fov_circle.Frame.Visible = true
            _fov_state.visible = true
        end

        local fovColor = type(flags["FOV Accent"]) == "table" and flags["FOV Accent"].Color or Color3.new(1,1,1)
        if fovColor ~= _fov_state.strokeColor then
            fov_circle.Stroke.Color = fovColor
            _fov_state.strokeColor = fovColor
        end

        if flags["FOV Filled"] then
            local transparency = 1 - ((flags["FOV Fill Opacity"] or 50) / 100)
            if transparency ~= _fov_state.bgTransparency then
                fov_circle.Frame.BackgroundTransparency = transparency
                _fov_state.bgTransparency = transparency
            end

            local fillColor = type(flags["FOV Fill Accent"]) == "table" and flags["FOV Fill Accent"].Color or Color3.new(1,1,1)
            if fillColor ~= _fov_state.fillColor then
                fov_circle.Frame.BackgroundColor3 = fillColor
                _fov_state.fillColor = fillColor
            end
        else
            if _fov_state.bgTransparency ~= 1 then
                fov_circle.Frame.BackgroundTransparency = 1
                _fov_state.bgTransparency = 1
            end
        end

        local size = (flags["FOV Radius"] or 120) * 2 / math.tan(math.rad(camera.FieldOfView / 2))
        if size ~= _fov_state.size then
            fov_circle.Frame.Size = UDim2.new(0, size, 0, size)
            _fov_state.size = size
        end

        local ml = uis:GetMouseLocation()
        if ml ~= _fov_state.position then
            fov_circle.Frame.Position = UDim2.new(0, ml.X, 0, ml.Y)
            _fov_state.position = ml
        end
    else
        if _fov_state.visible then
            fov_circle.Frame.Visible = false
            _fov_state.visible = false
        end
    end
end

function _renderSnaplines()
    local zoomActive = flags["Zoom"] and type(flags["Zoom Keybind"]) == "table" and flags["Zoom Keybind"].active
    local enabled = (flags["Enable Aimbot"] or getgenv().silent or zoomActive) and flags["Enable Snaplines"]
    local line = snap_lines.line

    if enabled and closest_part then
        local sp = camera:WorldToViewportPoint(closest_part.Position)
        local from = Vector2.new(sp.X, sp.Y)
        local to = uis:GetMouseLocation()
        local offset = to - from
        local position = UDim2.new(0, (from + offset * 0.5).X, 0, (from + offset * 0.5).Y)
        local rotation = math.deg(math.atan2(offset.Y, offset.X))
        local size = UDim2.new(0, math.floor(offset.Magnitude + 0.5), 0, 1)
        local color = type(flags["Snaplines Accent"]) == "table" and flags["Snaplines Accent"].Color or Color3.new(1,1,1)

        if position ~= _snap_state.position then
            line.Position = position
            _snap_state.position = position
        end
        if rotation ~= _snap_state.rotation then
            line.Rotation = rotation
            _snap_state.rotation = rotation
        end
        if size ~= _snap_state.size then
            line.Size = size
            _snap_state.size = size
        end
        if color ~= _snap_state.color then
            line.BackgroundColor3 = color
            _snap_state.color = color
        end
        if not _snap_state.visible then
            line.Visible = true
            _snap_state.visible = true
        end
    else
        if _snap_state.visible then
            line.Visible = false
            _snap_state.visible = false
        end
    end
end

function _renderArmorViewer()
    if not Configuration.Visuals.PlayerArmorInfoWindow then ArmorInfoGUI.Enabled = false; return end
    local armorTarget = target_frame.target.entry
    if not armorTarget then
        local mouse = uis:GetMouseLocation()
        local bestDist = math.huge
        for _, plr in ipairs(players:GetPlayers()) do
            if plr == local_player then continue end
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            local sp, onScreen = camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local d = (Vector2.new(sp.X, sp.Y) - mouse).Magnitude
                if d < bestDist then bestDist = d; armorTarget = plr end
            end
        end
    end
    if armorTarget then
        ArmorInfoGUI.Enabled = true
        local tid = tostring(armorTarget.UserId or armorTarget)
        if ArmorInfoGUI:GetAttribute("lastTarget") ~= tid then
            ArmorInfoGUI:SetAttribute("lastTarget", tid)
            pcall(UpdatePlayerArmor, armorTarget)
        end
    else
        ArmorInfoGUI.Enabled = false
        ArmorInfoGUI:SetAttribute("lastTarget", "")
    end
end

function _renderFreecam()
    if flags["Enable Freecam"] and type(flags["Freecam Keybind"]) == "table" and flags["Freecam Keybind"].active then
        if not freecam.enabled then
            freecam.enabled = true
            freecam.old_type = camera.CameraType
            freecam.old_behavior = uis.MouseBehavior
            camera.CameraType = Enum.CameraType.Scriptable
            uis.MouseBehavior = Enum.MouseBehavior.LockCenter
            if local_char and local_char:FindFirstChild("HumanoidRootPart") then
                local_char.HumanoidRootPart.Anchored = true
            end
            _bypass_enabled = false
        end
    else
        if freecam.enabled then
            freecam.enabled = false
            camera.CameraType = freecam.old_type
            uis.MouseBehavior = freecam.old_behavior
            if local_char and local_char:FindFirstChild("HumanoidRootPart") then
                local_char.HumanoidRootPart.Anchored = false
            end
            _bypass_enabled = true
        end
    end
    if freecam.enabled then
        local delta = uis:GetMouseDelta()
        freecam.pitch = math.clamp(freecam.pitch - delta.Y * flags["Freecam Sensitivity"], -80, 80)
        freecam.yaw   = freecam.yaw - delta.X * flags["Freecam Sensitivity"]
        camera.CFrame = CFrame.new(camera.CFrame.Position)
            * CFrame.Angles(0, math.rad(freecam.yaw), 0)
            * CFrame.Angles(math.rad(freecam.pitch), 0, 0)
        local move = Vector3.zero
        if uis:IsKeyDown(Enum.KeyCode.W) then move += Vector3.new(0,0,-1) end
        if uis:IsKeyDown(Enum.KeyCode.A) then move += Vector3.new(-1,0,0) end
        if uis:IsKeyDown(Enum.KeyCode.S) then move += Vector3.new(0,0,1)  end
        if uis:IsKeyDown(Enum.KeyCode.D) then move += Vector3.new(1,0,0)  end
        if uis:IsKeyDown(Enum.KeyCode.Space)     then move += Vector3.new(0,1,0)  end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then move += Vector3.new(0,-1,0) end
        if move.Magnitude > 0 then
            camera.CFrame += (camera.CFrame - camera.CFrame.Position):VectorToWorldSpace(move.Unit * flags["Freecam Speed"])
        end
        if local_char and local_char:FindFirstChild("HumanoidRootPart") then
            local_char.HumanoidRootPart.CFrame = camera.CFrame
        end
    end
end
function _renderAntiAim()
    local hum  = local_char and local_char:FindFirstChild("Humanoid")
    local root = local_char and local_char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end
    if flags["Anti Aim"] and type(flags["Spinar"]) == "table" and flags["Spinar"].active then
        if uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            hum.AutoRotate = true
        else
            hum.AutoRotate = false
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(flags["Anti Aim Speed"] / 5), 0)
        end
    else hum.AutoRotate = true end
end
function StopUndergroundAAAnimation()
    local tp = target_frame.target.entry
    if tp and tp.Character then
        local hum = tp.Character:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0.2 then
            for _, anim in ipairs(hum:GetPlayingAnimationTracks()) do
                if anim.Animation and anim.Animation.AnimationId == "rbxassetid://13435049596" then
                    anim:Stop()
                end
            end
        end
    end
end
_mainFrame = 0
_step_ray_params = nil
run_service.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function(dt)
    _mainFrame += 1

    if show_hit_notification and niger then
        needmark = true
        show_hit_notification = false
        task.spawn(function()
            pcall(function()
                Library:Notification("Hit", string.format("%s | -%d HP (%s)", hit_target_name, hit_damage, hit_part_name), 3)
            end)
        end)
    elseif show_hit_notification then
        show_hit_notification = false
    end

    local zoomActive = flags["Zoom"] and type(flags["Zoom Keybind"]) == "table" and flags["Zoom Keybind"].active
    local shouldUpdateTargets = (_mainFrame % 2 == 0) or flags["Enable Aimbot"] or getgenv().silent or zoomActive

    if shouldUpdateTargets then
        entry, closest_part = getClosestPlayerInFOV()
        _updateManipulation()
    end

    if closest_part and closest_part ~= target_frame.target.part then
        target_frame.target.part     = closest_part
        target_frame.target.entry    = entry
        target_frame.target.distance = (closest_part.Position - camera.CFrame.Position).Magnitude
        StopUndergroundAAAnimation()
    end

    _renderArmorViewer()
    _renderCrosshair()

    highlight_player = dodido and nigarzzz or target_frame.target.entry

    --// aimbot
    if target_frame.target.entry and target_frame.target.part and target_frame.target.entry ~= local_player then
        if flags["Enable Aimbot"] and type(flags["Aimbot Keybind"]) == "table" and flags["Aimbot Keybind"].active then
            local ep = target_frame.target.part.Position
            if flags["Manipulation"] then
                local manipPos = Cheat.Globals.ManipulationPosition
                if manipPos then
                    ep = manipPos
                end
            end
            camera.CFrame = flags["Aimbot Speed"] ~= 1
                and camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position, ep), flags["Aimbot Speed"])
                or  CFrame.lookAt(camera.CFrame.Position, ep)
        end
    end

    _renderAntiAim()

    _renderFreecam()

    --// always sprint (CFrame-stepping speed hack method)
    local fly_keybind = flags["FlyKeybind"]
    local fly_active = flags["FlyEnabled"] and typeof(fly_keybind) == "table" and fly_keybind.active
    if not fly_active and flags["Always Sprint"] and (uis:IsKeyDown(Enum.KeyCode.W) or uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.S) or uis:IsKeyDown(Enum.KeyCode.D)) then
        local root = local_char and local_char:FindFirstChild("HumanoidRootPart")
        local hum = local_char and local_char:FindFirstChildOfClass("Humanoid")
        if root and hum then
            local input_dir = Vector3.zero
            if uis:IsKeyDown(Enum.KeyCode.W) then input_dir += Vector3.new(0, 0, 1) end
            if uis:IsKeyDown(Enum.KeyCode.S) then input_dir -= Vector3.new(0, 0, 1) end
            if uis:IsKeyDown(Enum.KeyCode.A) then input_dir -= Vector3.new(1, 0, 0) end
            if uis:IsKeyDown(Enum.KeyCode.D) then input_dir += Vector3.new(1, 0, 0) end

            if input_dir.Magnitude > 0 then
                local look = camera.CFrame.LookVector
                local right = camera.CFrame.RightVector
                local move_dir = (look * input_dir.Z + right * input_dir.X)
                move_dir = Vector3.new(move_dir.X, 0, move_dir.Z).Unit

                local spd = flags["Sprint Speed"] or 27
                local walk_speed = hum.WalkSpeed or 16
                local extra_speed = spd - walk_speed

                if extra_speed > 0 then
                    local clamped_dt = math.min(dt or 0.016, 0.05)
                    local step_dist = extra_speed * clamped_dt

                    if not _step_ray_params then
                        _step_ray_params = RaycastParams.new()
                        _step_ray_params.FilterType = Enum.RaycastFilterType.Blacklist
                        _step_ray_params.IgnoreWater = true
                    end
                    _step_ray_params.FilterDescendantsInstances = { local_char }

                    local origin = root.Position
                    local result = workspace:Raycast(origin, move_dir * step_dist, _step_ray_params)

                    local target_pos = result and origin or origin + move_dir * step_dist
                    root.CFrame = CFrame.new(
                        Vector3.new(target_pos.X, root.Position.Y, target_pos.Z),
                        Vector3.new(target_pos.X, root.Position.Y, target_pos.Z) + move_dir
                    )
                end
            end
        end
    end

    Reso()

    --// platform
    if flags["Always Grounded"] then
        local root = local_char and local_char:FindFirstChild("HumanoidRootPart")
        platform.Position = root and (root.Position - Vector3.new(0,3.2,0)) or Vector3.zero
    else
        platform.Position = Vector3.zero
    end

    _renderLighting()
    _renderFOV()
    _renderSnaplines()
end))




    do --// functions
        player_esp.functions.create_drawing = function(class, prop, ...)
            local inst = (typeof(class) == "string") and (Instance.new(class)) or (class)
            for property, val in pairs(prop) do
                inst[property] = val
            end
            for _, t in { ... } do
                table.insert(t, inst)
            end
            return inst
        end

        player_esp.functions.get_boundings = function(model)
            local hrp = model:FindFirstChild("HumanoidRootPart")
            if hrp then
                local cframe, size = model:GetBoundingBox()
                size = Vector3.new(math.min(size.X, 4), math.min(size.Y, 6), math.min(size.Z, 5))
                return hrp.CFrame, size, hrp.Position
            end
            return nil
        end

        _vis_ray_params = nil
        player_esp.functions.is_visible = function(character)
            if not character or character == local_player.Character then
                return false
            end

            local part = character.PrimaryPart or character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
            if not part then
                return false
            end

            if not _vis_ray_params then
                _vis_ray_params = RaycastParams.new()
                _vis_ray_params.FilterType = Enum.RaycastFilterType.Blacklist
                _vis_ray_params.IgnoreWater = true
            end

            _vis_ray_params.FilterDescendantsInstances = { local_player.Character, camera }

            local origin = camera.CFrame.Position
            local direction = part.Position - origin
            local RaycastResult = workspace:Raycast(origin, direction, _vis_ray_params)
            
            return RaycastResult == nil or (RaycastResult.Instance and RaycastResult.Instance:IsDescendantOf(character))
        end


        function YallahCheckTeam(plr)
            if not plr or not plr:IsA("Player") then
                return false
            end

            local char = plr.Character
            if not char then
                return false
            end

            local head = char:FindFirstChild("Head")
            if not head then
                return false
            end

            local tg = head:FindFirstChild("TeammateGui")
            if not tg then
                return false
            end

            return tg.Enabled == true
        end

        function getteamcheck()
            if flags["Enable TeamCheck"] then
                return true
            else
                return false
            end
        end


        function cache_character_parts(character)
                return {
                    "Head",
                    "Torso",
                    "LeftArm",
                    "RightArm",
                    "LeftLeg",
                    "RightLeg",
                }
        end

        --// get_player replaced by getClosestPlayerInFOV() above

        --// old nigar

        --[[player_esp.functions.get_tool = function(Character)
            for _, value in pairs(Character:GetChildren()) do
                if
                value.Name ~= "HolsterModel"
                        and value:IsA("Model")
                        and value.Name ~= "Hair"
                        and (value:FindFirstChild("Handle") or value:FindFirstChild(
                        "Attachments"
                ) or value:FindFirstChild("ArrowAttach") or value:FindFirstChild("Attach"))
                        and value.PrimaryPart
                then
                    return value.Name
                end
            end
            return "None"
        end--]]

        player_esp.functions.get_tool = function(character)
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA("Tool") then
                    return obj.Name
                end
            end
            return "None"
        end

    end

;(function() --// FOV circle + snaplines IIFE
        local FieldOfView = player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), IgnoreGuiInset = true })
        local Frame = player_esp.functions.create_drawing("Frame", {
            Visible = false,
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.new(1, 1, 1),
            Size = UDim2.new(0, (flags["FOV Radius"] or 120) * 2, 0, (flags["FOV Radius"] or 120) * 2),
            Position = UDim2.new(0, 0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Parent = FieldOfView,
            ZIndex = 2,
        })
        local UICorner = player_esp.functions.create_drawing("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame })
        local Stroke = player_esp.functions.create_drawing(
                "UIStroke",
                { Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0, Parent = Frame }
        )
        fov_circle.FieldOfView = FieldOfView
        fov_circle.Frame = Frame
        fov_circle.Stroke = Stroke

        local snaplines = player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), IgnoreGuiInset = true })
        local line = player_esp.functions.create_drawing("Frame", {
            BackgroundTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BorderSizePixel = 0,
            ZIndex = 2,
            Parent = snaplines,
        })
        snap_lines.snaplines = snaplines
        snap_lines.line = line
end)()

--// Zoom logic in its own task.spawn to avoid top-level local limit
task.spawn(function()
    local Camera = camera
    local DEFAULT_FOV = 70
    local zoom_state = {
        current_fov = Camera.FieldOfView,
        target_fov  = Camera.FieldOfView,
        animation_speed = 0.15,
        idle = false
    }
    run_service.RenderStepped:Connect(function(dt)
        if uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            zoom_state.current_fov = Camera.FieldOfView
            zoom_state.idle = false
            return
        end
        if not flags["Zoom"] and not flags["FOV"] then
            if not zoom_state.idle then
                zoom_state.current_fov = DEFAULT_FOV
                Camera.FieldOfView = DEFAULT_FOV
                zoom_state.idle = true
            end
            return
        end
        zoom_state.idle = false
        if flags["Zoom"] and type(flags["Zoom Keybind"]) == "table" and flags["Zoom Keybind"].active then
            zoom_state.target_fov = flags["Zoom Ammount"]
        elseif flags["FOV"] then
            zoom_state.target_fov = flags["FOV Ammount"]
        else
            zoom_state.target_fov = DEFAULT_FOV
        end
        zoom_state.current_fov += (zoom_state.target_fov - zoom_state.current_fov)
            * math.clamp(zoom_state.animation_speed * dt * 60, 0, 1)
        Camera.FieldOfView = zoom_state.current_fov
    end)
end)


ExpectedArguments = {Raycast={ArgCountRequired=3,Args={"Instance","Vector3","Vector3","RaycastParams"}}}
function getDirection(Origin, Position)
    return (Position - Origin).Unit * (Origin - Position).Magnitude
end

--// namecall hook in IIFE to avoid top-level local limit
;(function()
function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if (#Args < RayMethod.ArgCountRequired) then
        return false
    end
    for Pos, Argument in next, Args do
        if (typeof(Argument) == RayMethod.Args[Pos]) then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]

    if not checkcaller() then
        --// Fly bypass / block movement packets
        if (Method == "FireServer" or Method == "InvokeServer") and typeof(self) == "Instance" then
            local name = self.Name
            if (name == "ReplicateMovementType" or name == "ChangedMovementType") and getgenv()._flyActive then
                return
            end
        end

        --// Raycast hooks (Silent Aim and Manipulation)
        if self == workspace and Method == "Raycast" then
            if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                local A_Origin = Arguments[2]
                local A_Direction = Arguments[3]

                --// 1. Apply Manipulation Origin if active and available
                if flags["Manipulation"] and Cheat.Globals.ManipulationPosition then
                    A_Origin = Cheat.Globals.ManipulationPosition
                    Arguments[2] = A_Origin
                end

                --// 2. Apply Silent Aim Direction if active
                if getgenv().silent and closest_part then
                    local target_pos = closest_part.Position
                    A_Direction = (target_pos - A_Origin).Unit * (target_pos - A_Origin).Magnitude
                    Arguments[3] = A_Direction
                end

                return oldNamecall(unpack(Arguments))
            end
        end

        --// Legacy FindPartOnRay / FindPartOnRayWithIgnoreList / FindPartOnRayWithWhitelist manipulation hooks
        if flags["Manipulation"] and Cheat.Globals.ManipulationPosition and self == workspace and (
            Method == "FindPartOnRay"
            or Method == "FindPartOnRayWithIgnoreList"
            or Method == "FindPartOnRayWithWhitelist"
        ) then
            local ray = Arguments[2]
            if typeof(ray) == "Ray" then
                Arguments[2] = Ray.new(Cheat.Globals.ManipulationPosition, ray.Direction)
                return oldNamecall(unpack(Arguments))
            end
        end
    end

    return oldNamecall(...)
end))
end)() --// end namecall IIFE

do --// handling
    local_player.CharacterAdded:Connect(function(character)
        local_char = character
    end)
end

niger = false

function getHumanoidFromRaycast(hitResult)
    if not hitResult or not hitResult.Instance then return end

    local part = hitResult.Instance
    local model = part:FindFirstAncestorOfClass("Model")
    if not model then return end

    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    return humanoid, model, part
end

activeHits = {}

oldHit = GunClient.hit

function GunClient:hit(hitResult, ...)
    if oldHit then
        oldHit(self, hitResult, ...)
    end


    local humanoid, character, hitPart = getHumanoidFromRaycast(hitResult)
    if not humanoid then return end

    local player = players:GetPlayerFromCharacter(character)
    if not player or player == local_player then return end

    if activeHits[humanoid] then return end
    activeHits[humanoid] = true

    local oldHealth = humanoid.Health
    local hitType = (hitPart and hitPart.Name == "Head") and "HEADSHOT" or "HIT"

    local connection
    connection = humanoid.HealthChanged:Connect(function(newHealth)
        if newHealth >= oldHealth then return end

        local damage = math.floor(oldHealth - newHealth)

        if damage > 0 then
            hit_target_name = player.Name
            hit_part_name = hitPart.Name
            hit_damage = damage

            show_hit_notification = true
            needmark = true
        end

        connection:Disconnect()
        activeHits[humanoid] = nil
    end)

    task.delay(0.5, function()
        if activeHits[humanoid] then
            activeHits[humanoid] = nil
            if connection then
                connection:Disconnect()
            end
        end
    end)
end


--// Third person via RenderStepped — no metamethod hooks needed
run_service.RenderStepped:Connect(function()
    if not flags["Third Person"] then return end
    if not (type(flags["Third Person Key"]) == "table" and flags["Third Person Key"].active) then return end
    if type(flags["Freecam Keybind"]) == "table" and flags["Freecam Keybind"].active and flags["Enable Freecam"] then return end

    local cam = workspace.CurrentCamera
    if not cam then return end
    local dist = flags["Third Person Distance"] or 5
    cam.CFrame = cam.CFrame + cam.CFrame.LookVector * -dist
end)

--//
;(function() --// head expander IIFE to avoid local limit
local expandActor = Instance.new("Actor")
expandActor.Name = tostring(math.random(100000, 999999))
expandActor.Parent = workspace

--// flags are not available inside Actor, so we pass values through attributes
function syncExpandFlags()
    expandActor:SetAttribute("expandar", flags["expandar"] and true or false)
    expandActor:SetAttribute("sizizi", flags["sizizi"] or 5)
end
syncExpandFlags()

local actorCode = [[
    local Players = game:GetService("Players")
    local actor = script.Parent

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if key == "Size"
            and typeof(self) == "Instance"
            and self:IsA("BasePart")
            and self.Name == "Head" then

            if actor:GetAttribute("expandar") then
                local s = actor:GetAttribute("sizizi") or 5
                return Vector3.new(s, s, s)
            end
        end

        return oldIndex(self, key)
    end))
]]

pcall(function()
	run_on_actor(expandActor, actorCode)
end)

local original = {}

function saveOriginal(head)
	if not original[head] then
		original[head] = {
			Size = head.Size,
			Transparency = head.Transparency,
			CanCollide = head.CanCollide
		}
	end
end

function restore(head)
	local data = original[head]
	if data then
		head.Size = data.Size
		head.Transparency = data.Transparency
		head.CanCollide = data.CanCollide
	end

	local indicator = head:FindFirstChild("SizeIndicator")
	if indicator then
		indicator:Destroy()
	end

	original[head] = nil
end

function apply(head)
	saveOriginal(head)

	local s = flags["sizizi"] or 5
	local size = Vector3.new(s, s, s)

	head.Size = size
	head.CanCollide = false
	head.Massless = true
	head.Transparency = 1

	local indicator = head:FindFirstChild("SizeIndicator")
	if not indicator then
		indicator = Instance.new("Part")
		indicator.Name = "SizeIndicator"
		indicator.Size = size
		indicator.Transparency = 0.7
		indicator.Color = flags["ColarZZ"].Color
		indicator.Material = Enum.Material[flags["Materialz"]]
		indicator.CanCollide = false
		indicator.CanTouch = false
		indicator.CanQuery = false
		indicator.Massless = true
        indicator.CFrame = head.CFrame

		local weld = Instance.new("WeldConstraint")
		weld.Part0 = head
		weld.Part1 = indicator
		weld.Parent = indicator

		indicator.Parent = head
	else
		indicator.Size = size
	end
end


local lastExpandState = nil
local lastExpandSize = nil
local lastExpandMaterial = nil
local lastExpandColor = nil
local processedCharacters = {}

run_service.RenderStepped:Connect(function()
	--// Синкаем флаги в Actor атрибуты
	if expandActor and expandActor.Parent then
		syncExpandFlags()
	end

	local expandar = flags["expandar"]
	local sizizi = flags["sizizi"] or 5
	local materialz = flags["Materialz"] or "Neon"
	local colorz = flags["ColarZZ"] and flags["ColarZZ"].Color

	local stateChanged = (expandar ~= lastExpandState) or (sizizi ~= lastExpandSize) or (materialz ~= lastExpandMaterial) or (colorz ~= lastExpandColor)

	if stateChanged then
		lastExpandState = expandar
		lastExpandSize = sizizi
		lastExpandMaterial = materialz
		lastExpandColor = colorz
		table.clear(processedCharacters)
	end

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= local_player then
			local char = player.Character
			if char then
				local head = char:FindFirstChild("Head")
				if head and head:IsA("BasePart") then
					if not processedCharacters[char] or stateChanged then
						processedCharacters[char] = true
						if expandar then
							apply(head)
						else
							restore(head)
						end
					end
				end
			else
				processedCharacters[player] = nil
			end
		end
	end
end)
end)() --// end head expander IIFE

-- //
--||  A project by Arab Hub
-- \\
