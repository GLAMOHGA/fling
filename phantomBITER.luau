--удачного пастинга!!!!!!!!
run_on_thread(getactorthreads()[1], [=[
if not LPH_OBFUSCATED then
    LPH_JIT = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_NO_UPVALUES = function(Function, ...)
        local Environment = getrenv()

        return setfenv(
            LPH_NO_VIRTUALIZE(function(...)
                return func(...)
            end),

            setmetatable({ func = Function }, {
                __index = Environment,
                __newindex = Environment
            })
        )
    end
    LPH_CRASH = function(...) return ... end
    LRM_UserNote = "uid - 1"
end

if not getcustomasset then
    getgenv().getcustomasset = function()
        return ""
    end
end

local HookFunction = hookfunction or hookfunc
local CheckCaller, GetInfo = checkcaller, debug.getinfo
local GetUpValue, SetUpValue = debug.getupvalue, debug.setupvalue
local GetStack, SetStack = debug.getstack, debug.setstack
local MouseMoveRel = mousemoverel
local SetThreadIdentity = setthreadidentity or setidentity or set_thread_identity
local IsRBXActive = isrbxactive or iswindowactive or function() return true end
local GetCustomAsset = getcustomasset
local Request = request or http_request or (http and http.request) or (syn and syn.request)
local SetHiddenProperty = sethiddenproperty
local IsFile, ListFiles, ReadFile, WriteFile, LoadFile, DelFile = isfile, listfiles, readfile, writefile, loadfile, delfile
local IsFolder, MakeFolder = isfolder, makefolder

pcall(function()
    for _, v in next, getconnections(game:GetService("ScriptContext").Error) do
        v:Disable()
    end
end)

local API = {
    Instancenew = Instance.new,
    TweenInfonew = TweenInfo.new,
    GetService = game.GetService,
    IsLoaded = game.IsLoaded,
    Clone = game.Clone,
    Destroy = game.Destroy,
    GetChildren = game.GetChildren,
    GetDescendants = game.GetDescendants,
    IsDescendantOf = game.IsDescendantOf,
    IsA = game.IsA,
    FindFirstChild = game.FindFirstChild,
    FindFirstChildOfClass = game.FindFirstChildOfClass,
    HttpGet = game.HttpGet,
    GetPropertyChangedSignal = game.GetPropertyChangedSignal,
    GetAttribute = game.GetAttribute,
    GetPlayers = game:GetService("Players").GetPlayers,
    GetPlayerFromCharacter = game:GetService("Players").GetPlayerFromCharacter,
    GetMouseLocation = game:GetService("UserInputService").GetMouseLocation,
    IsKeyDown = game:GetService("UserInputService").IsKeyDown,
    GetMouse = game:GetService("Players").LocalPlayer.GetMouse,
    Kick = game:GetService("Players").LocalPlayer.Kick,
    CFrameNew = CFrame.new,
    CFrameAngles = CFrame.Angles,
    CFrameLookAt = CFrame.lookAt,
    CFrameLerp = CFrame.new().Lerp,
    CFramePointToObjectSpace = CFrame.new().PointToObjectSpace,
    CFrameToEulerAnglesXYZ = CFrame.new().ToEulerAnglesXYZ,
    CFrameToOrientation = CFrame.new().ToOrientation,
    Vector3New = Vector3.new,
    Vector3Lerp = Vector3.new().Lerp,
    Vector2New = Vector2.new,
    UDim2New = UDim2.new,
    UDim2fromOffset = UDim2.fromOffset,
    UDimNew = UDim.new,
    Color3New = Color3.new,
    Color3FromRGB = Color3.fromRGB,
    Color3FromHSV = Color3.fromHSV,
    Color3ToHSV = Color3.toHSV,
    ToHex = Color3.new().ToHex,
    FromHex = Color3.fromHex,
    ColorSequenceNew = ColorSequence.new,
    ColorSequenceKeypointNew = ColorSequenceKeypoint.new,
    NumberSequenceNew = NumberSequence.new,
    NumberSequenceKeypointNew = NumberSequenceKeypoint.new,
    RayNew = Ray.new,
    RaycastParamsNew = RaycastParams.new,
    Raycast = workspace.Raycast,
    StringFormat = string.format,
    StringUpper = string.upper,
    StringLower = string.lower,
    StringFind = string.find,
    StringLen = string.len,
    StringGsub = string.gsub,
    StringSub = string.sub,
    StringSplit = string.split,
    tostring = tostring,
    TableInsert = table.insert,
    TableRemove = table.remove,
    TableFind = table.find,
    TableConcat = table.concat,
    TableSort = table.sort,
    TableUnpack = table.unpack,
    Select = select,
    MathClamp = math.clamp,
    MathRandom = math.random,
    MathRad = math.rad,
    MathFloor = math.floor,
    MathMax = math.max,
    MathMin = math.min,
    MathSin = math.sin,
    MathCos = math.cos,
    MathDeg = math.deg,
    MathAtan2 = math.atan2,
    Materials = Enum.Material,
    MathLerp = function(a, b, t) return a + (b - a) * t end,
    tonumber = tonumber,
    DebugTraceback = debug.traceback,
    Tick = tick,
    OsDate = os.date,
    OsTime = os.time,
    WorldToViewportPoint = Instance.new("Camera").WorldToViewportPoint,
    WorldToScreenPoint = Instance.new("Camera").WorldToScreenPoint,
    ChangeState = Instance.new("Humanoid").ChangeState,
    Require = require,
    Type = type,
    Typeof = typeof,
    CoroutineWrap = coroutine.wrap,
    TaskWait = task.wait,
    Pcall = pcall,
    Wait = wait,
    TaskSpawn = task.spawn,
}

pcall(function()
    API.GetValue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"].GetValue
end)

local workspaceRaycast = workspace.Raycast

repeat API.TaskWait() until API.IsLoaded(game)
if getgenv().Loaded ~= nil then return end

local version, Build, LoadTick, checkcalled = "1", "0.1", API.Tick(), false


local NewInstance = Instance.new
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local FindFirstChildOfClass = game.FindFirstChildOfClass
local FindFirstChild = game.FindFirstChild
local GetChildren = game.GetChildren
local GetDescendants = game.GetDescendants
local IsDescendantOf = game.IsDescendantOf
local NewDrawing = (Drawing and Drawing.new) or function() return Instance.new("Frame") end
local Clone, Destroy = game.Clone, game.Destroy
local NewVector3, NewVector2, NewCFrame = Vector3.new, Vector2.new, CFrame.new
local NewUDim2, NewUDim = UDim2.new, UDim.new
local NewRGB, NewColor3 = Color3.fromRGB, Color3.new
local NewNumberSequence, NewColorSequence = NumberSequence.new, ColorSequence.new
local NewNumberKeypoint, NewRayParams = NumberSequenceKeypoint.new, RaycastParams.new
local Angles, ToHSV, FromHSV, FromHex = CFrame.Angles, Color3.toHSV, Color3.fromHSV, Color3.fromHex
local ToHex = Color3.new().ToHex
local EmptyVector3, EmptyVector2 = NewVector3(0, 0, 0), NewVector2(0, 0)
local EmptyCFrame, EmptyUDim2, EmptyUDim = NewCFrame(), NewUDim2(0, 0, 0, 0), NewUDim(0, 0)
local PointToObjectSpace, Dot = EmptyCFrame.PointToObjectSpace, EmptyVector3.Dot
local Format, Lower, Split, Match = string.format, string.lower, string.split, string.match
local GSub, StringFind = string.gsub, string.find
local Spawn, Wait, Delay, Cancel = task.spawn, task.wait, task.delay, task.cancel
local Remove, Unpack, Concat, Clear = table.remove, table.unpack, table.concat, table.clear
local Sort, Find, Insert = table.sort, table.find, table.insert
local Random, Round, Clamp = math.random, math.round, math.clamp
local Atan2, Ceil, Acos = math.atan2, math.ceil, math.acos
local Sin, Cos, Abs, Tan = math.sin, math.cos, math.abs, math.tan
local Pi, Floor, Min, Max = math.pi, math.floor, math.min, math.max
local Infinite, ToRad, TwoPi = 1 / 0, Pi / 180, Pi * 2
local Tick, Clock, Date = tick, os.clock, os.date
local HookMetaMethod = hookmetamethod or (debug and debug.hookmetamethod)
local EmptyFunction = function() end
local NewFont = Font.new

local S = {
    HttpService = game:GetService("HttpService"),
    UserInputService = game:GetService("UserInputService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Stats = game:GetService("Stats"),
    TextService = game:GetService("TextService"),
    Teams = game:GetService("Teams"),
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    TweenService = game:GetService("TweenService"),
    Lighting = game:GetService("Lighting"),
    SoundService = game:GetService("SoundService"),
    TeleportService = game:GetService("TeleportService"),
    Workspace = workspace,
    Game = game,
    IsA = game.IsA,
    GetService = game.GetService,
    WaitForChild = game.WaitForChild,
}
S.InputService = S.UserInputService
S.replicatedStorage = S.ReplicatedStorage
S.RenderStepped = S.RunService.RenderStepped
S.Heartbeat = S.RunService.Heartbeat
S.Stepped = S.RunService.Stepped
S.LocalPlayer = S.Players.LocalPlayer
S.CurrentCamera = S.Workspace.CurrentCamera
S.camera = S.CurrentCamera
S.ScreenSize = S.camera.ViewportSize
S.ScreenSize = S.ScreenSize
S.ScreenX = S.ScreenSize.X
S.ScreenY = S.ScreenSize.Y
S.Mouse = API.GetMouse(S.LocalPlayer)
S.Terrain = S.Workspace:FindFirstChildWhichIsA("Terrain") or S.Workspace.Terrain
S.CoreGui = Instance.new("ScreenGui")
S.CoreGui.ResetOnSpawn = false
S.spring = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/5a429e871d54646ba54011c18321e77afa76d657/Modules/Shared/Physics/Spring.lua"))()
S.Signaling = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))()
S.playerSpawned = S.Signaling.new()
S.playerDied = S.Signaling.new()
S.JSONDecode = S.HttpService.JSONDecode
S.JSONEncode = S.HttpService.JSONEncode
S.Map = S.WaitForChild(S.Workspace, "Map", Infinite)
S.MapIgnore = S.WaitForChild(S.Workspace, "Ignore", Infinite)
S.WorkspacePlayers = S.WaitForChild(S.Workspace, "Players", Infinite)
local HttpService, UserInputService = S.HttpService, S.UserInputService
local ReplicatedStorage, Stats = S.ReplicatedStorage, S.Stats
local TextService, Teams, Players, RunService = S.TextService, S.Teams, S.Players, S.RunService
local TweenService, Lighting, SoundService, TeleportService = S.TweenService, S.Lighting, S.SoundService, S.TeleportService
local RenderStepped, Heartbeat, Stepped = S.RenderStepped, S.Heartbeat, S.Stepped
local LocalPlayer, Workspace, Game = S.LocalPlayer, S.Workspace, S.Game
local PlayerAdded, PlayerRemoving, Raycast = Players.PlayerAdded, Players.PlayerRemoving, Workspace.Raycast
local IsA, GetService, CurrentCamera = S.IsA, S.GetService, S.CurrentCamera
local ScreenSize, ScreenX, ScreenY = S.ScreenSize, S.ScreenX, S.ScreenY
local Mouse, Terrain, CoreGui = S.Mouse, S.Terrain, S.CoreGui
local spring, Signaling = S.spring, S.Signaling
local playerSpawned, playerDied = S.playerSpawned, S.playerDied
local WaitForChild, JSONDecode, JSONEncode = S.WaitForChild, S.JSONDecode, S.JSONEncode
local Map, MapIgnore, WorkspacePlayers = S.Map, S.MapIgnore, S.WorkspacePlayers

local Menu = {}
Menu.BasePath = "Iri"
Menu.Folders = {
    Fonts = "Iri/Fonts",
    Images = "Iri/Images",
    Configs = "Iri/Configs",
    Luas = "Iri/Luas",
    Themes = "Iri/Themes",
    Sounds = {
        Path = "Iri/Sounds",
        SubFolders = { "Hitsounds", "Killsounds" }
    }
}
Menu.Fonts = {}
local function __LoadFonts()
    local FontFolder = Menu.Folders.Fonts
    if not isfolder(Menu.BasePath) then makefolder(Menu.BasePath) end
    if not isfolder(FontFolder) then makefolder(FontFolder) end

    local function RegisterFont(Name, FileName, Size, Color)
        local Path = FontFolder .. "/" .. FileName
        local Url = "https://raw.githubusercontent.com/i77lhm/storage/main/fonts/" .. FileName:gsub(" ", "%%20")
        local ok, data = pcall(function()
            if isfile(Path) then return readfile(Path) end
            local bytes = game:HttpGet(Url)
            writefile(Path, bytes)
            return bytes
        end)
        local Face
        if ok and data then
            local MetaPath = FontFolder .. "/" .. Name .. ".font"
            local Asset = getcustomasset(Path)
            local Meta = HttpService:JSONEncode({
                name = Name,
                faces = {{
                    name = "Regular",
                    weight = 400,
                    style = "normal",
                    assetId = Asset,
                }},
            })
            writefile(MetaPath, Meta)
            Face = Font.new(getcustomasset(MetaPath), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        else
            Face = Font.fromEnum(Enum.Font.Code)
        end
        Menu.Fonts[Name] = { Face, Size or 12, Color or Color3.fromRGB(255, 255, 255) }
        return Menu.Fonts[Name]
    end

    RegisterFont("Comfortaa", "Comfortaa-Regular.ttf", 13)
    RegisterFont("HankenGrotesk", "HankenGrotesk-SemiBold.ttf", 13)
    RegisterFont("Inter Medium", "Inter_28pt-Medium.ttf", 13)
    RegisterFont("Inter SemiBold", "Inter_28pt-SemiBold.ttf", 13)
    RegisterFont("Light Modern", "Light Modern.ttf", 13)
    RegisterFont("Minecraftia", "Minecraftia-Regular.ttf", 12)
    RegisterFont("ProggyClean", "ProggyClean.ttf", 13)
    RegisterFont("ProggyTiny", "ProggyTiny.ttf", 11)
    RegisterFont("Rubik", "Rubik-Regular.ttf", 13)
    RegisterFont("Tahoma Modern Bold", "Tahoma-Modern-Bold.ttf", 12)
    RegisterFont("Tahoma Modern", "Tahoma-Modern.ttf", 12)
    RegisterFont("Verdana", "Verdana-Font.ttf", 12)
    RegisterFont("Tahoma 8px", "fs-tahoma-8px.ttf", 11)
    RegisterFont("Open Sans PX", "open-sans-px.ttf", 12)
    RegisterFont("Smallest Pixel-7", "smallest_pixel-7.ttf", 10)
    RegisterFont("Tahoma Bold", "tahoma_bold.ttf", 12)
    Menu.Fonts["Tahoma"] = Menu.Fonts["Tahoma Modern"] or Menu.Fonts["Tahoma 8px"]
    Menu.Fonts["Consolas Bold"] = Menu.Fonts["ProggyClean"] or Menu.Fonts["Smallest Pixel-7"]
end
__LoadFonts()
Menu.GetTextBounds = function(Text, FontEntry)
    local Size = 12
    if type(FontEntry) == "table" then
        Size = FontEntry[2] or 12
    end
    local ok, bounds = pcall(function()
        return TextService:GetTextSize(tostring(Text or ""), Size, Enum.Font.Code, Vector2.new(10000, 10000))
    end)
    if ok and bounds then
        return bounds
    end
    return Vector2.new(#tostring(Text or "") * 7, Size)
end
local M = {
    Shared = {},
    Mathematics = {},
    Tickbase = {},
    Pathfinding = {},
    Raycasting = {},
    Info = {},
    Legitbot = {},
    Esp = {},
    Visuals = {},
    Camera = {},
    Ragebot = {},
    Knifebot = {},
    AntiAim = {},
    SilentAim = {},
    AimAssist = {},
    TriggerBot = {},
    Movement = {},
    Misc = {},
    PeekQueue = {},
    PeekIndex = 1,
    IsPeeking = false,
    ReverseTime = false,
    LastTime = nil,
    StartTick = tick(),
}

local D = {
BodyPartNames = {
    "Head",
    "Torso",
    "Right Arm",
    "Left Arm",
    "Right Leg",
    "Left Leg"
},
BodyPartSizes = {
    ["Head"] = NewVector3(2, 1, 1),
    ["Torso"] = NewVector3(2, 2, 1),
    ["Left Arm"] = NewVector3(1, 2, 1),
    ["Right Arm"] = NewVector3(1, 2, 1),
    ["Left Leg"] = NewVector3(1, 2, 1),
    ["Right Leg"] = NewVector3(1, 2, 1)
},
AttachmentParents = {
    ["HeadCenter"] = "Head",
    ["Neck"] = "Torso",
    ["Waist"] = "Torso",
    ["LeftShoulderAttachment"] = "Left Arm",
    ["LeftGripAttachment"] = "Left Arm",
    ["RightShoulderAttachment"] = "Right Arm",
    ["RightGripAttachment"] = "Right Arm",
    ["LeftThighAttachment"] = "Left Leg",
    ["LeftFootAttachment"] = "Left Leg",
    ["RightThighAttachment"] = "Right Leg",
    ["RightFootAttachment"] = "Right Leg"
},
AttachmentPositions = {
    ["HeadCenter"] = NewVector3(0, 0, 0),
    ["Neck"] = NewVector3(0, 0.8, 0),
    ["Waist"] = NewVector3(0, -0.7, 0),
    ["LeftShoulderAttachment"] = NewVector3(0, 0.5, 0),
    ["LeftGripAttachment"] = NewVector3(0, -0.7, 0),
    ["RightShoulderAttachment"] = NewVector3(0, 0.5, 0),
    ["RightGripAttachment"] = NewVector3(0, -0.7, 0),
    ["LeftThighAttachment"] = NewVector3(0, 0.7, 0),
    ["LeftFootAttachment"] = NewVector3(0, -0.7, 0),
    ["RightThighAttachment"] = NewVector3(0, 0.7, 0),
    ["RightFootAttachment"] = NewVector3(0, -0.7, 0)
},
AttachmentJoints = {
    { "HeadCenter", "Neck" },
    { "Neck", "Waist" },
    { "Neck", "LeftShoulderAttachment" },
    { "Neck", "RightShoulderAttachment" },
    { "Waist", "LeftThighAttachment" },
    { "Waist", "RightThighAttachment" },
    { "LeftShoulderAttachment", "LeftGripAttachment" },
    { "RightShoulderAttachment", "RightGripAttachment" },
    { "LeftThighAttachment", "LeftFootAttachment" },
    { "RightThighAttachment", "RightFootAttachment" }
},
HitsoundIds = {
    ["1"] = "rbxassetid://7349055654",
    ["Bag"] = "rbxassetid://364942410",
    ["Baimware"] = "rbxassetid://6607339542",
    ["Bat"] = "rbxassetid://3333907347",
    ["Beautiful"] = "rbxassetid://5709456554",
    ["Beepo"] = "rbxassetid://3466987025",
    ["Bell"] = "rbxassetid://97724019712141",
    ["Bonk"] = "rbxassetid://3765689841",
    ["Bow"] = "rbxassetid://93158957747276",
    ["Bruh"] = "rbxassetid://535690488",
    ["Cod"] = "rbxassetid://160432334",
    ["CSGO"] = "rbxassetid://7269900245",
    ["Denied"] = "rbxassetid://7356986865",
    ["Electro"] = "rbxassetid://3458224686",
    ["Epic"] = "rbxassetid://7344303740",
    ["Fatality"] = "rbxassetid://115982072912004",
    ["Gamesense"] = "rbxassetid://5633695679",
    ["Godlike"] = "rbxassetid://7463103082",
    ["Headshot"] = "rbxassetid://5764885927",
    ["Killingspree"] = "rbxassetid://937898383",
    ["Laser Beam"] = "rbxassetid://130791043",
    ["Laugh"] = "rbxassetid://9094639541",
    ["Lessgo"] = "rbxassetid://6782594987",
    ["Matchine gun"] = "rbxassetid://17705555617",
    ["MCOOF"] = "rbxassetid://5869422451",
    ["Minecraft"] = "rbxassetid://7273736372",
    ["Minecraft XP"] = "rbxassetid://1053296915",
    ["Neverlose"] = "rbxassetid://6607204501",
    ["Osu"] = "rbxassetid://7149919358",
    ["Osu Mint"] = "rbxassetid://81883450827543",
    ["Overwatch"] = "rbxassetid://18410058858",
    ["Ownage"] = "rbxassetid://6887181639",
    ["Percussion"] = "rbxassetid://3466985670",
    ["Pop"] = "rbxassetid://105543133746827",
    ["Pow"] = "rbxassetid://3516546035",
    ["Quek"] = "rbxassetid://4868633804",
    ["Ray"] = "rbxassetid://131179973",
    ["Retro"] = "rbxassetid://3466984142",
    ["Retro loud"] = "rbxassetid://3976061026",
    ["Rocket"] = "rbxassetid://9087976483",
    ["Rust"] = "rbxassetid://5043539486",
    ["Skeet"] = "rbxassetid://5447626464",
    ["Slap"] = "rbxassetid://4888372697",
    ["Snap"] = "rbxassetid://93172144688075",
    ["Sorry"] = "rbxassetid://7405233417",
    ["Space"] = "rbxassetid://3466982899",
    ["Squash"] = "rbxassetid://3466981613",
    ["Supersmash"] = "rbxassetid://2039907664",
    ["TF2"] = "rbxassetid://3455144981",
    ["TF2 Pan"] = "rbxassetid://3431749479",
    ["Ultra Kill"] = "rbxassetid://937885646",
    ["Ultrakill"] = "rbxassetid://937885646",
    ["Vine Boom"] = "rbxassetid://9088081730",
    ["Vortex"] = "rbxassetid://3466980212",
    ["Win"] = "rbxassetid://341542437"
},
KillsoundIds = {
    ["1"] = "rbxassetid://7349055654",
    ["Bag"] = "rbxassetid://364942410",
    ["Baimware"] = "rbxassetid://6607339542",
    ["Bat"] = "rbxassetid://3333907347",
    ["Beautiful"] = "rbxassetid://5709456554",
    ["Beepo"] = "rbxassetid://3466987025",
    ["Bell"] = "rbxassetid://97724019712141",
    ["Bonk"] = "rbxassetid://3765689841",
    ["Bow"] = "rbxassetid://93158957747276",
    ["Bruh"] = "rbxassetid://535690488",
    ["Cod"] = "rbxassetid://160432334",
    ["CSGO"] = "rbxassetid://7269900245",
    ["Denied"] = "rbxassetid://7356986865",
    ["Electro"] = "rbxassetid://3458224686",
    ["Epic"] = "rbxassetid://7344303740",
    ["Fatality"] = "rbxassetid://115982072912004",
    ["Gamesense"] = "rbxassetid://5633695679",
    ["Godlike"] = "rbxassetid://7463103082",
    ["Headshot"] = "rbxassetid://5764885927",
    ["Killingspree"] = "rbxassetid://937898383",
    ["Laser Beam"] = "rbxassetid://130791043",
    ["Laugh"] = "rbxassetid://9094639541",
    ["Lessgo"] = "rbxassetid://6782594987",
    ["Matchine gun"] = "rbxassetid://17705555617",
    ["MCOOF"] = "rbxassetid://5869422451",
    ["Minecraft"] = "rbxassetid://7273736372",
    ["Minecraft XP"] = "rbxassetid://1053296915",
    ["Neverlose"] = "rbxassetid://6607204501",
    ["Osu"] = "rbxassetid://7149919358",
    ["Osu Mint"] = "rbxassetid://81883450827543",
    ["Overwatch"] = "rbxassetid://18410058858",
    ["Ownage"] = "rbxassetid://6887181639",
    ["Percussion"] = "rbxassetid://3466985670",
    ["Pop"] = "rbxassetid://105543133746827",
    ["Pow"] = "rbxassetid://3516546035",
    ["Quek"] = "rbxassetid://4868633804",
    ["Ray"] = "rbxassetid://131179973",
    ["Retro"] = "rbxassetid://3466984142",
    ["Retro loud"] = "rbxassetid://3976061026",
    ["Rocket"] = "rbxassetid://9087976483",
    ["Rust"] = "rbxassetid://5043539486",
    ["Skeet"] = "rbxassetid://5447626464",
    ["Slap"] = "rbxassetid://4888372697",
    ["Snap"] = "rbxassetid://93172144688075",
    ["Sorry"] = "rbxassetid://7405233417",
    ["Space"] = "rbxassetid://3466982899",
    ["Squash"] = "rbxassetid://3466981613",
    ["Supersmash"] = "rbxassetid://2039907664",
    ["TF2"] = "rbxassetid://3455144981",
    ["TF2 Pan"] = "rbxassetid://3431749479",
    ["Ultra Kill"] = "rbxassetid://937885646",
    ["Ultrakill"] = "rbxassetid://937885646",
    ["Vine Boom"] = "rbxassetid://9088081730",
    ["Vortex"] = "rbxassetid://3466980212",
    ["Win"] = "rbxassetid://341542437"
},
SkyBoxes = {
    ["Default"] = {
        ["SkyboxLf"] = "rbxassetid://148943339",
        ["SkyboxBk"] = "rbxassetid://148943390",
        ["SkyboxDn"] = "rbxassetid://148943362",
        ["SkyboxFt"] = "rbxassetid://148943404",
        ["SkyboxRt"] = "rbxassetid://148943379",
        ["SkyboxUp"] = "rbxassetid://148943410"
    },
    ["Nebula"] = {
        ["SkyboxLf"] = "rbxassetid://159454286",
        ["SkyboxBk"] = "rbxassetid://159454299",
        ["SkyboxDn"] = "rbxassetid://159454296",
        ["SkyboxFt"] = "rbxassetid://159454293",
        ["SkyboxRt"] = "rbxassetid://159454300",
        ["SkyboxUp"] = "rbxassetid://159454288"
    },
    ["Blue Nebula"] = {
        ["SkyboxBk"] = "rbxassetid://79187608916257",
        ["SkyboxDn"] = "rbxassetid://79187608916257",
        ["SkyboxFt"] = "rbxassetid://135345543970829",
        ["SkyboxLf"] = "rbxassetid://130684897818024",
        ["SkyboxRt"] = "rbxassetid://134117814265945",
        ["SkyboxUp"] = "rbxassetid://128019898265074"
    },
    ["Setting Hills"] = {
        ["SkyboxLf"] = "rbxassetid://264909758",
        ["SkyboxBk"] = "rbxassetid://264908339",
        ["SkyboxDn"] = "rbxassetid://264907909",
        ["SkyboxFt"] = "rbxassetid://264909420",
        ["SkyboxRt"] = "rbxassetid://264908886",
        ["SkyboxUp"] = "rbxassetid://264907379"
    },
    ["Blue Aurora"] = {
        ["SkyboxBk"] = "rbxassetid://12064107",
        ["SkyboxDn"] = "rbxassetid://12064152",
        ["SkyboxFt"] = "rbxassetid://12064121",
        ["SkyboxLf"] = "rbxassetid://12063984",
        ["SkyboxRt"] = "rbxassetid://12064115",
        ["SkyboxUp"] = "rbxassetid://12064131"
    },
    ["Red Aurora"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
    ["Pink Vision"] = {
        ["SkyboxBk"] = "rbxassetid://6593929026",
        ["SkyboxDn"] = "rbxassetid://6593930140",
        ["SkyboxFt"] = "rbxassetid://6593931249",
        ["SkyboxLf"] = "rbxassetid://6593932587",
        ["SkyboxRt"] = "rbxassetid://6593933789",
        ["SkyboxUp"] = "rbxassetid://6593935319"
    },
    ["Twillight"] = {
        ["SkyboxBk"] = "rbxassetid://570557514",
        ["SkyboxDn"] = "rbxassetid://570557775",
        ["SkyboxFt"] = "rbxassetid://570557559",
        ["SkyboxLf"] = "rbxassetid://570557620",
        ["SkyboxRt"] = "rbxassetid://570557672",
        ["SkyboxUp"] = "rbxassetid://570557727"
    },
    ["Distopia"] = {
        ["SkyboxBk"] = "rbxassetid://2240134413",
        ["SkyboxDn"] = "rbxassetid://2240136039",
        ["SkyboxFt"] = "rbxassetid://2240130790",
        ["SkyboxLf"] = "rbxassetid://2240133550",
        ["SkyboxRt"] = "rbxassetid://2240132643",
        ["SkyboxUp"] = "rbxassetid://2240135222"
    },
    ["Peaceful"] = {
        ["SkyboxBk"] = "rbxassetid://73252679982122",
        ["SkyboxDn"] = "rbxassetid://101074061181553",
        ["SkyboxFt"] = "rbxassetid://112572775732134",
        ["SkyboxLf"] = "rbxassetid://126931573973019",
        ["SkyboxRt"] = "rbxassetid://135908172504233",
        ["SkyboxUp"] = "rbxassetid://124514468649717"
    }
},
ChamsAnimations = {
    ["Disabled"] = "",
    ["Webbed"] = "rbxassetid://2179243880",
    ["Pixelated"] = "rbxassetid://140652787",
    ["Swirl"] = "rbxassetid://8133639623",
    ["Shield"] = "rbxassetid://361073795",
    ["Bubbles"] = "rbxassetid://1461576423",
    ["Matrix"] = "rbxassetid://10713189068",
    ["Honeycomb"] = "rbxassetid://179898251",
    ["Clouds"] = "rbxassetid://5176277457",
    ["Galaxy"] = "rbxassetid://1120738433",
    ["Stars"] = "rbxassetid://598201818",
    ["Wires"] = "rbxassetid://14127933",
    ["Camo"] = "rbxassetid://3280937154",
    ["Hexagon"] = "rbxassetid://6175083785",
    ["Particles"] = "rbxassetid://1133822388",
    ["Triangular"] = "rbxassetid://4504368932",
    ["Wall"] = "rbxassetid://4271279",
    ["Scanning"] = "rbxassetid://5843010904"
},
TracerProperties = {
    ["Obelus"] = {
        ["Texture"] = "rbxassetid://2382169232",
        ["Brightness"] = 1.5,
        ["Transparency"] = NewNumberSequence(0.45),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 1,
        ["TextureLength"] = 5,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 0,
        ["Width0"] = 0.3,
        ["Width1"] = 0.3,
        ["FaceCamera"] = true
    },
    ["Lightning"] = {
        ["Texture"] = "rbxassetid://7151778302",
        ["Brightness"] = 1.5,
        ["Transparency"] = NewNumberSequence(0.45),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 10,
        ["TextureLength"] = 1,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 1,
        ["Width0"] = 1.2,
        ["Width1"] = 1.2,
        ["FaceCamera"] = true
    },
    ["Lightning Bolt"] = {
        ["Texture"] = "rbxassetid://12781806168",
        ["Brightness"] = 1.5,
        ["Transparency"] = NewNumberSequence(0.45),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 10,
        ["TextureLength"] = 1,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 1,
        ["Width0"] = 1.0,
        ["Width1"] = 1.0,
        ["FaceCamera"] = true
    },
    ["Lightning Bolt2"] = {
        ["Texture"] = "rbxassetid://7151778302",
        ["Brightness"] = 1.5,
        ["Transparency"] = NewNumberSequence(0.45),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 10,
        ["TextureLength"] = 1,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 1.2,
        ["Width0"] = 1.2,
        ["Width1"] = 1.2,
        ["FaceCamera"] = true
    },
    ["Laser"] = {
        ["Texture"] = "rbxassetid://5864341017",
        ["Brightness"] = 2,
        ["Transparency"] = NewNumberSequence(0.3),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 1,
        ["TextureLength"] = 4,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 0,
        ["Width0"] = 0.25,
        ["Width1"] = 0.25,
        ["FaceCamera"] = true
    },
    ["Red Laser"] = {
        ["Texture"] = "rbxassetid://6333823534",
        ["Brightness"] = 2,
        ["Transparency"] = NewNumberSequence(0.3),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 1,
        ["TextureLength"] = 4,
        ["TextureMode"] = Enum.TextureMode.Stretch,
        ["TextureSpeed"] = 0,
        ["Width0"] = 0.25,
        ["Width1"] = 0.25,
        ["FaceCamera"] = true
    },
    ["DNA"] = {
        ["Texture"] = "rbxassetid://6511613786",
        ["Brightness"] = 1.5,
        ["Transparency"] = NewNumberSequence(0.45),
        ["LightEmission"] = 1,
        ["LightInfluence"] = 0,
        ["Segments"] = 1,
        ["TextureLength"] = 12,
        ["TextureMode"] = Enum.TextureMode.Wrap,
        ["TextureSpeed"] = 1,
        ["Width0"] = 0.6,
        ["Width1"] = 0.6,
        ["FaceCamera"] = true
    }
},
}
local Shared, Esp, Visuals, Info, Misc = M.Shared, M.Esp, M.Visuals, M.Info, M.Misc
local Ragebot, Knifebot, AntiAim, Movement = M.Ragebot, M.Knifebot, M.AntiAim, M.Movement
local SilentAim, AimAssist, TriggerBot, Legitbot = M.SilentAim, M.AimAssist, M.TriggerBot, M.Legitbot
local Mathematics, Tickbase, Pathfinding, Raycasting, Camera = M.Mathematics, M.Tickbase, M.Pathfinding, M.Raycasting, M.Camera
local HitsoundIds, KillsoundIds, SkyBoxes = D.HitsoundIds, D.KillsoundIds, D.SkyBoxes
local ChamsAnimations, TracerProperties = D.ChamsAnimations, D.TracerProperties
local BodyPartNames, BodyPartSizes = D.BodyPartNames, D.BodyPartSizes
local AttachmentParents, AttachmentPositions, AttachmentJoints = D.AttachmentParents, D.AttachmentPositions, D.AttachmentJoints



local function PreviewSound(Kind, Name)
    pcall(function()
        local Map = (Kind == "Hit" and HitsoundIds) or KillsoundIds
        if not Map or not Name or Name == "Disabled" then return end
        local Id = Map[Name]
        if not Id or Id == "" then return end
        local Snd = Instance.new("Sound")
        Snd.SoundId = Id
        local VolFlag = Flags[Kind == "Hit" and "Hitsound Volume" or "Killsound Volume"]
        local SpdFlag = Flags[Kind == "Hit" and "Hitsound Speed" or "Killsound Speed"]
        Snd.Volume = (VolFlag and type(VolFlag.Value) == "number" and VolFlag.Value / 100) or 0.5
        Snd.PlaybackSpeed = (SpdFlag and type(SpdFlag.Value) == "number" and SpdFlag.Value) or 1
        Snd.Parent = workspace.CurrentCamera or workspace
        Snd:Play()
        task.delay(3, function()
            pcall(function() Snd:Destroy() end)
        end)
    end)
end

local function MultiToList(Value)
    if type(Value) ~= "table" then
        if type(Value) == "string" and Value ~= "" then
            return { Value }
        end
        return {}
    end
    local List = {}
    for K, V in next, Value do
        if V == true then
            List[#List + 1] = K
        elseif type(V) == "string" then
            List[#List + 1] = V
        end
    end
    return List
end

local function GetSection(Teammate)
    local Prefix = Teammate and "Team " or "Enemy "
    return setmetatable({}, {
        __index = function(_, Key)
            local Flag = Flags[Prefix .. Key]
            if not Flag or Flag.Type == "Missing" then
                Flag = Flags[Key]
            end
            if Flag and Flag.Type ~= "Missing" then
                return Flag
            end
            return { Value = false, Color = Color3.new(1, 1, 1), Transparency = 0, Type = "Missing" }
        end
    })
end




local function __LoadUILibrary()
    local ProtectGui = protectgui or protect_gui or (syn and syn.protect_gui) or (function(p) 

    end);

    local ScreenGui = API.Instancenew('ScreenGui');
    ProtectGui(ScreenGui);
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
    ScreenGui.Parent = CoreGui
    ScreenGui.DisplayOrder = 0x6fffffff
    ScreenGui.ResetOnSpawn = false

    local Toggles = {}
    local Options = {}
    local Flags = setmetatable({},{
        __index = function(self,value)
            if Toggles[value] ~= nil then
                return Toggles[value]
            elseif Options[value] ~= nil then
                return Options[value]
            end
            return {
                Value = nil,
                Color = Color3.new(1, 1, 1),
                Transparency = 0,
                Type = "Missing",
            }
        end
    })    
    getgenv().Toggles = Toggles
    getgenv().Options = Options
    getgenv().Flags = Flags

    local Library = {
        Registry = {};
        RegistryMap = {};
        HudRegistry = {};

        LoadingCFG = false;
        FontColor = API.Color3FromRGB(245, 225, 200);
        MainColor = API.Color3FromRGB(15, 15, 15);
        BackgroundColor = API.Color3FromRGB(13, 13, 13);
        AccentColor = API.Color3FromRGB(255, 140, 0);    
        OutlineColor = API.Color3FromRGB(40, 20, 0);   
        RiskColor = API.Color3FromRGB(255, 36, 36),

        Black = API.Color3New(0, 0, 0);
        Font = Enum.Font.SourceSans,

        OpenedFrames = {};
        DependencyBoxes = {};

        Signals = {};
        ScreenGui = ScreenGui;
    };

    local RainbowStep = 0
    local Hue = 0

    API.TableInsert(Library.Signals, RenderStepped:Connect(function(Delta)
        RainbowStep = RainbowStep + Delta

        if RainbowStep >= (1 / 60) then
            RainbowStep = 0

            Hue = Hue + (1 / 400);

            if Hue > 1 then
                Hue = 0;
            end;

            Library.CurrentRainbowHue = Hue;
            Library.CurrentRainbowColor = API.Color3FromHSV(Hue, 0.8, 1);
        end
    end))

    local httpService = HttpService
    local ThemeManager = {} do
            ThemeManager.Folder = 'Iri'
            ThemeManager.Library = nil
            ThemeManager.BuiltInThemes = {
                ['Midnight Cyan'] = {
                    7,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"00f2ff","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Electric Blue'] = {
                    8,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"3b82f6","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Amethyst Dark'] = {
                    5,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"fc6bff","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Toxic Green'] = {
                    6,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"39ff14","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Crimson Dark'] = {
                    12,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"ff3131","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Gamesense'] = {
                    13,
                    httpService:JSONDecode('{"MainColor":"0c0c0c","AccentColor":"a5d639","OutlineColor":"171717","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Fatality'] = {
                    14,
                    httpService:JSONDecode('{"MainColor":"19142e","AccentColor":"c0155b","OutlineColor":"211c3b","BackgroundColor":"120f21","FontColor":"ffffff"}')
                },
                ['Neverlose'] = {
                    15,
                    httpService:JSONDecode('{"MainColor":"080a10","AccentColor":"00adef","OutlineColor":"121620","BackgroundColor":"0b0e15","FontColor":"ffffff"}')
                },
                ['Vampire Red'] = {
                    16,
                    httpService:JSONDecode('{"MainColor":"0a0a0a","AccentColor":"7e0000","OutlineColor":"1c1c1c","BackgroundColor":"050505","FontColor":"ffffff"}')
                },
                ['Nordic Frost'] = {
                    17,
                    httpService:JSONDecode('{"MainColor":"1e222a","AccentColor":"88c0d0","OutlineColor":"2e3440","BackgroundColor":"1a1e25","FontColor":"d8dee9"}')
                },
                ['Golden Luxury'] = {
                    18,
                    httpService:JSONDecode('{"MainColor":"0f0f0f","AccentColor":"ffb000","OutlineColor":"1e1e1e","BackgroundColor":"111111","FontColor":"ffffff"}')
                },
                ['Rose Gold'] = {
                    19,
                    httpService:JSONDecode('{"MainColor":"121212","AccentColor":"ff9aa2","OutlineColor":"1a1a1a","BackgroundColor":"0f0f0f","FontColor":"ffffff"}')
                }
            }

            function ThemeManager:ApplyTheme(theme)
                local customThemeData = self:GetCustomTheme(theme)
                local data = customThemeData or self.BuiltInThemes[theme]

                if not data then return end

                local scheme = data[2]
                for idx, col in next, customThemeData or scheme do
                    self.Library[idx] = API.FromHex(col)

                    if Options[idx] then
                        Options[idx]:SetValueRGB(API.FromHex(col))
                    end
                end

                self:ThemeUpdate()
            end

            function ThemeManager:ThemeUpdate()
                if Library.UpdateWindowTitle then
                    pcall(Library.UpdateWindowTitle)
                end
                local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor", "RiskColor" }
                for i, field in next, options do
                    if Options and Options[field] then
                        self.Library[field] = Options[field].Value
                    end
                end

                self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
                self.Library.AccentColorLight = self.Library:GetLighterColor(self.Library.AccentColor);
                self.Library.FontColorDark = self.Library:GetDarkerColor(self.Library.FontColor);
                self.Library.MainColorLight = self.Library:GetLighterColor(self.Library.MainColor);
                self.Library:UpdateColorsUsingRegistry()
            end

            function ThemeManager:LoadDefault()		
                local theme = 'Default'
                local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

                local isDefault = true
                if content then
                    if self.BuiltInThemes[content] then
                        theme = content
                    elseif self:GetCustomTheme(content) then
                        theme = content
                        isDefault = false;
                    end
                elseif self.BuiltInThemes[self.DefaultTheme] then
                    theme = self.DefaultTheme
                end

                if isDefault then
                    Options.ThemeManager_ThemeList:SetValue(theme)
                else
                    self:ApplyTheme(theme)
                end
            end

            function ThemeManager:SaveDefault(theme)
                writefile(self.Folder .. '/themes/default.txt', theme)
            end

            function ThemeManager:CreateThemeManager(groupbox)
                groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
                groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
                groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
                groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
                groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });
                groupbox:AddLabel('Risky color'):AddColorPicker('RiskColor', { Default = self.Library.RiskColor or Color3.fromRGB(255, 36, 36) });
                do
                    local FontNames = { "Default" }
                    if Menu.Fonts then
                        for Name, _ in next, Menu.Fonts do
                            table.insert(FontNames, Name)
                        end
                        table.sort(FontNames, function(a, b)
                            if a == "Default" then return true end
                            if b == "Default" then return false end
                            return tostring(a):lower() < tostring(b):lower()
                        end)
                    end
                    groupbox:AddDropdown('UI Font Theme', {
                        Text = 'UI Font',
                        Values = FontNames,
                        Default = 1,
                        Callback = function(Value)
                            if Library.SetUIFont then
                                Library:SetUIFont(Value)
                            end
                            if Options["UI Font"] and Options["UI Font"].SetValue then
                                pcall(function() Options["UI Font"]:SetValue(Value) end)
                            end
                        end
                    })
                end

                local ThemesArray = {}
                for Name, Theme in next, self.BuiltInThemes do
                    API.TableInsert(ThemesArray, Name)
                end

                API.TableSort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

                groupbox:AddDivider()
                groupbox:AddDropdown('ThemeManager_ThemeList', { Text = 'Theme list', Values = ThemesArray, Default = 1 })

                groupbox:AddButton('Set as default', function()
                    self:SaveDefault(Options.ThemeManager_ThemeList.Value)
                    self.Library:Notify(API.StringFormat('Set default theme to %q', Options.ThemeManager_ThemeList.Value))
                end)

                Options.ThemeManager_ThemeList:OnChanged(function()
                    self:ApplyTheme(Options.ThemeManager_ThemeList.Value)
                end)

                groupbox:AddDivider()
                groupbox:AddInput('ThemeManager_CustomThemeName', { Text = 'Custom theme name' })
                groupbox:AddInput('ThemeManager_ImportJSON', { Text = 'Import JSON (paste if clipboard fails)', Placeholder = '{"AccentColor":"..."}', Finished = false })
                groupbox:AddDropdown('ThemeManager_CustomThemeList', { Text = 'Custom themes', Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 })
                groupbox:AddDivider()

                groupbox:AddButton('Save theme', function() 
                    self:SaveCustomTheme(Options.ThemeManager_CustomThemeName.Value)

                    Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
                    Options.ThemeManager_CustomThemeList:SetValue(nil)
                end):AddButton('Load theme', function() 
                    self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value) 
                end)

                local function ReadClipboard()
                    local candidates = {
                        function() if getclipboard then return getclipboard() end end,
                        function() if getgenv and getgenv().getclipboard then return getgenv().getclipboard() end end,
                        function() if syn and syn.get_clipboard then return syn.get_clipboard() end end,
                        function() if syn and syn.getclipboard then return syn.getclipboard() end end,
                        function() if Clipboard and Clipboard.get then return Clipboard.get() end end,
                        function() if Clipboard and Clipboard.Get then return Clipboard.Get() end end,
                        function() if isrbxactive and getexecutorname then return nil end end,
                    }
                    for _, Fn in ipairs(candidates) do
                        local Ok, Res = pcall(Fn)
                        if Ok and type(Res) == "string" and Res ~= "" then
                            return Res
                        end
                    end
                    return nil
                end

                local function WriteClipboard(Text)
                    local candidates = {
                        function() if setclipboard then setclipboard(Text) return true end end,
                        function() if toclipboard then toclipboard(Text) return true end end,
                        function() if syn and syn.write_clipboard then syn.write_clipboard(Text) return true end end,
                        function() if syn and syn.setclipboard then syn.setclipboard(Text) return true end end,
                        function() if Clipboard and Clipboard.set then Clipboard.set(Text) return true end end,
                        function() if Clipboard and Clipboard.Set then Clipboard.Set(Text) return true end end,
                    }
                    for _, Fn in ipairs(candidates) do
                        local Ok, Res = pcall(Fn)
                        if Ok and Res then return true end
                    end
                    return false
                end

                groupbox:AddButton('Export theme', function()
                    local theme = {}
                    local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor", "RiskColor" }
                    for _, field in next, fields do
                        if Options[field] and Options[field].Value then
                            theme[field] = API.ToHex(Options[field].Value)
                        end
                    end
                    local Name = Options.ThemeManager_CustomThemeName.Value
                    if Name and API.StringGsub(tostring(Name), ' ', '') ~= '' then
                        theme.Name = Name
                    end
                    local Payload = httpService:JSONEncode(theme)
                    if WriteClipboard(Payload) then
                        self.Library:Notify('Theme exported to clipboard', 2)
                    else
                        self.Library:Notify(Payload, 8)
                    end
                end):AddButton('Import theme', function()
                    local Name = Options.ThemeManager_CustomThemeName.Value
                    if not Name or API.StringGsub(tostring(Name), ' ', '') == '' then
                        return self.Library:Notify('Enter a name for the imported theme', 3)
                    end
                    Name = API.StringGsub(tostring(Name), '[^%w%-%_ ]', '')
                    if Name == '' then
                        return self.Library:Notify('Invalid theme name', 3)
                    end
                    local Clip = ReadClipboard()
                    if (not Clip or Clip == '') and Options.ThemeManager_ImportJSON then
                        Clip = Options.ThemeManager_ImportJSON.Value
                    end
                    if not Clip or Clip == '' then
                        return self.Library:Notify('Clipboard unavailable — paste JSON in Import JSON box below', 4)
                    end
                    Clip = tostring(Clip):match("^%s*(.-)%s*$") or Clip
                    local Ok, Data = pcall(function()
                        return httpService:JSONDecode(Clip)
                    end)
                    if not Ok or type(Data) ~= 'table' then
                        return self.Library:Notify('Invalid theme JSON on clipboard', 3)
                    end
                    local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor", "RiskColor" }
                    local theme = {}
                    for _, field in next, fields do
                        if type(Data[field]) == "string" and Data[field] ~= "" then
                            theme[field] = Data[field]
                        end
                    end
                    if not theme.AccentColor and not theme.MainColor then
                        return self.Library:Notify('Clipboard theme missing colors', 3)
                    end
                    local FileName = Name .. '.json'
                    writefile(self.Folder .. '/themes/' .. FileName, httpService:JSONEncode(theme))
                    Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
                    Options.ThemeManager_CustomThemeList:SetValue(FileName)
                    self:ApplyTheme(FileName)
                    if Options.ThemeManager_ImportJSON and Options.ThemeManager_ImportJSON.SetValue then
                        Options.ThemeManager_ImportJSON:SetValue('')
                    end
                    self.Library:Notify(API.StringFormat('Imported and saved theme %q', Name), 2)
                end)

                groupbox:AddButton('Refresh list', function()
                    Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
                    Options.ThemeManager_CustomThemeList:SetValue(nil)
                end)

                groupbox:AddButton('Set as default', function()
                    if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
                        self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)
                        self.Library:Notify(API.StringFormat('Set default theme to %q', Options.ThemeManager_CustomThemeList.Value))
                    end
                end)

                ThemeManager:LoadDefault()

                function UpdateTheme()
                    self:ThemeUpdate()
                end

                Options.BackgroundColor:OnChanged(UpdateTheme)
                Options.MainColor:OnChanged(UpdateTheme)
                Options.AccentColor:OnChanged(UpdateTheme)
                Options.OutlineColor:OnChanged(UpdateTheme)
                Options.FontColor:OnChanged(UpdateTheme)
                if Options.RiskColor then
                    Options.RiskColor:OnChanged(function(Value)
                        local Col = Value
                        if typeof(Col) ~= "Color3" and Options.RiskColor then
                            Col = Options.RiskColor.Value
                        end
                        if typeof(Col) == "Color3" then
                            self.Library.RiskColor = Col
                            self:ThemeUpdate()
                        end
                    end)
                end
            end

            function ThemeManager:GetCustomTheme(file)
                local path = self.Folder .. '/themes/' .. file
                if not isfile(path) then
                    return nil
                end

                local data = readfile(path)
                local success, decoded = API.Pcall(httpService.JSONDecode, httpService, data)

                if not success then
                    return nil
                end

                return decoded
            end

            function ThemeManager:SaveCustomTheme(file)
                if API.StringGsub(file, ' ', '') == '' then
                    return self.Library:Notify('Invalid file name for theme (empty)', 3)
                end

                local theme = {}
                local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor", "RiskColor" }

                for _, field in next, fields do
                    if Options[field] and Options[field].Value then
                        theme[field] = API.ToHex(Options[field].Value)
                    end
                end

                writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
            end

            function ThemeManager:ReloadCustomThemes()
                local list = listfiles(self.Folder .. '/themes')

                local out = {}
                for i = 1, #list do
                    local file = list[i]
                    if file:sub(-5) == '.json' then
                        local pos = API.StringFind(file, '.json', 1, true)
                        local char = file:sub(pos, pos)

                        while char ~= '/' and char ~= '\\' and char ~= '' do
                            pos = pos - 1
                            char = file:sub(pos, pos)
                        end

                        if char == '/' or char == '\\' then
                            API.TableInsert(out, file:sub(pos + 1))
                        end
                    end
                end

                return out
            end

            function ThemeManager:SetLibrary(lib)
                self.Library = lib
            end

            function ThemeManager:BuildFolderTree()
                local paths = {}
                local parts = API.StringSplit(self.Folder, '/')
                for idx = 1, #parts do
                    paths[#paths + 1] = API.TableConcat(parts, '/', 1, idx)
                end

                API.TableInsert(paths, self.Folder .. '/themes')
                API.TableInsert(paths, self.Folder .. '/settings')

                for i = 1, #paths do
                    local str = paths[i]
                    if not isfolder(str) then
                        makefolder(str)
                    end
                end
            end

            function ThemeManager:SetFolder(folder)
                self.Folder = folder
                self:BuildFolderTree()
            end

            function ThemeManager:CreateGroupBox(tab)
                assert(self.Library, 'Must set ThemeManager.Library first!')
                return tab:AddLeftGroupbox('Themes')
            end

            function ThemeManager:ApplyToTab(tab)
                assert(self.Library, 'Must set ThemeManager.Library first!')
                local groupbox = self:CreateGroupBox(tab)
                self:CreateThemeManager(groupbox)
            end

            function ThemeManager:ApplyToGroupbox(groupbox)
                assert(self.Library, 'Must set ThemeManager.Library first!')
                self:CreateThemeManager(groupbox)
            end

            ThemeManager:BuildFolderTree()
        end
        getgenv().ThemeManager = ThemeManager

local SaveManager = {} do
            SaveManager.Folder = 'Raven'
            SaveManager.Ignore = {}
            SaveManager.Parser = {
                Toggle = {
                    Save = function(idx, object) 
                        return { type = 'Toggle', idx = idx, value = object.Value } 
                    end,
                    Load = function(idx, data)
                        local Tog = Toggles[idx]
                        if Tog and data.value ~= nil then
                            if type(Tog.SetValue) == "function" then
                                pcall(Tog.SetValue, Tog, data.value)
                            else
                                Tog.Value = data.value
                            end
                        end
                    end,
                },
                Slider = {
                    Save = function(idx, object)
                        return { type = 'Slider', idx = idx, value = API.tostring(object.Value) }
                    end,
                    Load = function(idx, data)
                        local Opt = Options[idx]
                        if not Opt then return end
                        if type(Opt.SetValue) == "function" then
                            pcall(Opt.SetValue, Opt, data.value)
                        elseif data.value ~= nil then
                            Opt.Value = tonumber(data.value) or data.value
                        end
                    end,
                },
                Dropdown = {
                    Save = function(idx, object)
                        return { type = 'Dropdown', idx = idx, value = object.Value, mutli = object.Multi }
                    end,
                    Load = function(idx, data)
                        local Opt = Options[idx]
                        if not Opt then return end
                        if type(Opt.SetValue) == "function" then
                            pcall(Opt.SetValue, Opt, data.value)
                        elseif data.value ~= nil then
                            Opt.Value = data.value
                        end
                    end,
                },
                ColorPicker = {
                    Save = function(idx, object)
                        return { type = 'ColorPicker', idx = idx, value = API.ToHex(object.Value), transparency = object.Transparency }
                    end,
                    Load = function(idx, data)
                        local Opt = Options[idx]
                        if not Opt then return end
                        if type(Opt.SetValueRGB) == "function" then
                            pcall(Opt.SetValueRGB, Opt, API.FromHex(data.value), data.transparency)
                        elseif type(Opt.SetValue) == "function" then
                            pcall(Opt.SetValue, Opt, API.FromHex(data.value), data.transparency)
                        end
                    end,
                },
                KeyPicker = {
                    Save = function(idx, object)
                        return { type = 'KeyPicker', idx = idx, mode = object.Mode, key = object.Value }
                    end,
                    Load = function(idx, data)
                        local Opt = Options[idx]
                        if not Opt then return end
                        if type(Opt.SetValue) == "function" then
                            pcall(Opt.SetValue, Opt, { data.key, data.mode })
                        else
                            if data.key ~= nil then Opt.Value = data.key end
                            if data.mode ~= nil then Opt.Mode = data.mode end
                        end
                    end,
                },

                Input = {
                    Save = function(idx, object)
                        return { type = 'Input', idx = idx, text = object.Value }
                    end,
                    Load = function(idx, data)
                        local Opt = Options[idx]
                        if not Opt or API.Type(data.text) ~= 'string' then return end
                        if type(Opt.SetValue) == "function" then
                            pcall(Opt.SetValue, Opt, data.text)
                        else
                            Opt.Value = data.text
                        end
                    end,
                },
            }

            function SaveManager:SetIgnoreIndexes(list)
                for _, key in next, list do
                    self.Ignore[key] = true
                end
            end

            function SaveManager:SetFolder(folder)
                self.Folder = folder;
                self:BuildFolderTree()
            end

            function SaveManager:Save(name)
                if (not name) then
                    return false, 'no config file is selected'
                end

                local fullPath = self.Folder .. '/settings/' .. name .. '.json'

                local data = {
                    objects = {},
                    skins = getgenv().AppliedSkins or {}
                }

                for idx, toggle in next, Toggles do
                    if self.Ignore[idx] then continue end

                    API.TableInsert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
                end

                for idx, option in next, Options do
                    if not self.Parser[option.Type] then continue end
                    if self.Ignore[idx] then continue end

                    API.TableInsert(data.objects, self.Parser[option.Type].Save(idx, option))
                end 

                local success, encoded = API.Pcall(httpService.JSONEncode, httpService, data)
                if not success then
                    return false, 'failed to encode data'
                end

                writefile(fullPath, encoded)
                return true
            end

            function SaveManager:Load(name)
                if (not name) then
                    return false, 'no config file is selected'
                end

                local file = self.Folder .. '/settings/' .. name .. '.json'
                if not isfile(file) then return false, 'invalid file' end

                local success, decoded = API.Pcall(httpService.JSONDecode, httpService, readfile(file))
                if not success then return false, 'decode error' end

                if decoded.skins then
                    getgenv().AppliedSkins = decoded.skins
                end

                Library.LoadingCFG = true
                for _, option in next, decoded.objects do API.TaskWait()
                    if self.Parser[option.type] then
                        API.TaskSpawn(function()                             
                            self.Parser[option.type].Load(option.idx, option) 
                        end)
                    end
                end

                Library.LoadingCFG = false
                task.defer(function()
                    if ThemeManager and ThemeManager.ThemeUpdate then
                        pcall(function() ThemeManager:ThemeUpdate() end)
                    end
                    if Library and Library.UpdateColorsUsingRegistry then
                        pcall(function() Library:UpdateColorsUsingRegistry() end)
                    end
                    if Options and Options["UI Font"] and Options["UI Font"].Value and Library.SetUIFont then
                        pcall(function() Library:SetUIFont(Options["UI Font"].Value) end)
                    end
                end)
                return true
            end
            function SaveManager:LoadTemp()

                local file = self.Folder .. '/TempLoad.json'
                if not isfile(file) then return false, 'invalid file' end

                local success, decoded = API.Pcall(httpService.JSONDecode, httpService, readfile(file))
                if not success then return false, 'decode error' end

                Library.LoadingCFG = true
                for _, option in next, decoded.objects do API.TaskWait()
                    if self.Parser[option.type] then
                        API.TaskSpawn(function()                             
                            self.Parser[option.type].Load(option.idx, option) 
                        end)
                    end
                end
                delfile(file)
                Library.LoadingCFG = false
                return true
            end
            function SaveManager:SaveTemp()                
                local fullPath = self.Folder .. '/TempLoad.json'                

                local data = {
                    objects = {}
                }

                for idx, toggle in next, Toggles do
                    if self.Ignore[idx] then continue end

                    API.TableInsert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
                end

                for idx, option in next, Options do
                    if not self.Parser[option.Type] then continue end
                    if self.Ignore[idx] then continue end

                    API.TableInsert(data.objects, self.Parser[option.Type].Save(idx, option))
                end 

                local success, encoded = API.Pcall(httpService.JSONEncode, httpService, data)
                if not success then
                    return false, 'failed to encode data'
                end

                writefile(fullPath, encoded)
                return true
            end

            function SaveManager:Remove(name)
                if (not name) then
                    return false, 'no config file is selected'
                end

                local file = self.Folder .. '/settings/' .. name .. '.json'
                if not isfile(file) then return false, 'invalid file' end
                delfile(file)

                return true
            end

            function SaveManager:IgnoreThemeSettings()
                self:SetIgnoreIndexes({
                    "ThemeManager_ThemeList",
                    "ThemeManager_CustomThemeList",
                    "ThemeManager_CustomThemeName",
                    "ThemeManager_ImportJSON",
                    "UI Font Theme",
                })
            end

            function SaveManager:BuildFolderTree()
                local paths = {
                    self.Folder,
                    self.Folder .. '/settings'
                }

                for i = 1, #paths do
                    local str = paths[i]
                    if not isfolder(str) then
                        makefolder(str)
                    end
                end
            end

            function SaveManager:RefreshConfigList()
                local list = listfiles(self.Folder .. '/settings')

                local out = {}
                for i = 1, #list do
                    local file = list[i]
                    if file:sub(-5) == '.json' then
                        local pos = API.StringFind(file, '.json', 1, true)
                        local start = pos

                        local char = file:sub(pos, pos)
                        while char ~= '/' and char ~= '\\' and char ~= '' do
                            pos = pos - 1
                            char = file:sub(pos, pos)
                        end

                        if char == '/' or char == '\\' then
                            API.TableInsert(out, file:sub(pos + 1, start - 1))
                        end
                    end
                end

                return out
            end

            function SaveManager:SetLibrary(library)
                self.Library = library
            end

            function SaveManager:BuildConfigSection(tab)
                assert(self.Library, 'Must set SaveManager.Library')

                local section = tab:AddRightGroupbox('Configuration')

                section:AddInput('SaveManager_ConfigName',    { Text = 'Config name' })
                section:AddDropdown('SaveManager_ConfigList', { Text = 'Config list', Values = self:RefreshConfigList(), AllowNull = true })

                section:AddDivider()

                section:AddButton({Text = "Create config", DoubleClick = true, Func = function()
                    local name = Options.SaveManager_ConfigName.Value

                    if API.StringGsub(name, ' ', '') == '' then 
                        return self.Library:Notify('Invalid config name (empty)', 2)
                    end

                    local success, err = self:Save(name)
                    if not success then
                        return self.Library:Notify('Failed to save config: ' .. err)
                    end

                    self.Library:Notify(API.StringFormat('Created config %q', name))

                    Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
                    Options.SaveManager_ConfigList:SetValue(nil)
                end}):AddButton({Text = "Load config", DoubleClick = true, Func = function()
                    local name = Options.SaveManager_ConfigList.Value

                    local success, err = self:Load(name)
                    if not success then
                        return self.Library:Notify('Failed to load config: ' .. err)
                    end

                    self.Library:Notify(API.StringFormat('Loaded config %q', name))
                end})

                section:AddButton({Text = "Save config", DoubleClick = true, Func = function()
                    local name = Options.SaveManager_ConfigList.Value

                    local success, err = self:Save(name)
                    if not success then
                        return self.Library:Notify('Failed to Save config: ' .. err)
                    end

                    self.Library:Notify(API.StringFormat('Save config %q', name))
                end}):AddButton({Text = "Remove config", DoubleClick = true, Func = function()
                    local name = Options.SaveManager_ConfigList.Value

                    local success, err = self:Remove(name)
                    if not success then
                        return self.Library:Notify('Failed to Remove config: ' .. err)
                    end

                    self.Library:Notify(API.StringFormat('Removed config %q', name))
                    Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
                    Options.SaveManager_ConfigList:SetValue(nil)
                end})
                section:AddButton({Text = "Load Latest Config", DoubleClick = true, Func = function()
                    SaveManager:LoadTemp()
                end})

                section:AddButton('Refresh list', function()
                    Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
                    Options.SaveManager_ConfigList:SetValue(nil)
                end)

                SaveManager:SetIgnoreIndexes({ 'SaveManager_ConfigList', 'SaveManager_ConfigName' })
            end

            SaveManager:BuildFolderTree()
        end
        getgenv().SaveManager = SaveManager

    function GetPlayersString()
        local PlayerList = API.GetPlayers(Players);
        for i = 1, #PlayerList do
            PlayerList[i] = PlayerList[i].Name
        end;

        API.TableSort(PlayerList, function(str1, str2) return str1 < str2 end);

        return PlayerList;
    end;

    function GetTeamsString()
        local TeamList = Teams:GetTeams();

        for i = 1, #TeamList do
            TeamList[i] = TeamList[i].Name;
        end;

        API.TableSort(TeamList, function(str1, str2) return str1 < str2 end);

        return TeamList;
    end;

    function Library:SafeCallback(f, ...)
        if (not f) or type(f) ~= "function" then
            return;
        end;

        if not Library.NotifyOnError then
            local ok, err = pcall(f, ...);
            if not ok then
                warn("[SafeCallback]", err);
            end
            return;
        end;

        local success, event = API.Pcall(f, ...);

        if not success then
            local _, i = API.StringFind(event, ":%d+: ");

            if not i then
                return Library:Notify(event);
            end;

            return Library:Notify(event:sub(i + 1), 3);
        end;
    end;

    function Library:AttemptSave()
        if Library.SaveManager then
            Library.SaveManager:Save();
        end;
    end;

    function Library:Create(Class, Properties)
        local _Instance = Class;

        if API.Type(Class) == 'string' then
            _Instance = API.Instancenew(Class);
        end;

        for Property, Value in next, Properties do
            _Instance[Property] = Value;
        end;

        if Library.FontFace and _Instance then
            local OkType, IsText = pcall(function()
                return _Instance:IsA("TextLabel") or _Instance:IsA("TextButton") or _Instance:IsA("TextBox")
            end)
            if OkType and IsText then
                pcall(function() _Instance.FontFace = Library.FontFace end)
            end
        end

        return _Instance;
    end;

    function Library:ApplyTextStroke(Inst)
        Inst.TextStrokeTransparency = 1;

        Library:Create('UIStroke', {
            Color = API.Color3New(0, 0, 0);
            Thickness = 1;
            LineJoinMode = Enum.LineJoinMode.Miter;
            Parent = Inst;
        });
    end;

    function Library:CreateLabel(Properties, IsHud)
        local _Instance = Library:Create('TextLabel', {
            BackgroundTransparency = 1;
            Font = Library.Font;
            TextColor3 = Library.FontColor;
            TextSize = 16;
            TextStrokeTransparency = 1;
        });

        Library:AddToRegistry(_Instance, {
            TextColor3 = 'FontColor';
        }, IsHud);

        return Library:Create(_Instance, Properties);
    end;


    function Library:SetUIFont(FontName)
        if type(FontName) == "table" then
            for k, v in next, FontName do
                if v then FontName = k break end
            end
        end
        FontName = tostring(FontName or "Default")
        if FontName == "Default" or FontName == "" then
            Library.FontFace = nil
            Library.FontName = "Default"
            Library.Font = Enum.Font.SourceSans
        else
            local Entry = Menu.Fonts and Menu.Fonts[FontName]
            if type(Entry) == "table" and Entry[1] then
                Library.FontFace = Entry[1]
                Library.FontName = FontName
                Library.Font = Enum.Font.Code
            else
                Library:Notify("Font not found: " .. FontName, 2)
                return
            end
        end

        local function Apply(Obj)
            if not Obj then return end
            local ok, isText = pcall(function()
                return Obj:IsA("TextLabel") or Obj:IsA("TextButton") or Obj:IsA("TextBox")
            end)
            if not ok or not isText then return end
            pcall(function()
                if Library.FontFace then
                    Obj.FontFace = Library.FontFace
                else
                    Obj.Font = Library.Font or Enum.Font.SourceSans
                end
            end)
        end

        local roots = {}
        if Library.ScreenGui then table.insert(roots, Library.ScreenGui) end
        if typeof(gethui) == "function" then
            pcall(function() table.insert(roots, gethui()) end)
        end
        for _, Root in ipairs(roots) do
            pcall(function()
                for _, Obj in ipairs(Root:GetDescendants()) do
                    Apply(Obj)
                end
            end)
        end
        if Library.RegistryMap then
            for Obj, _ in next, Library.RegistryMap do
                Apply(Obj)
            end
        end
        if Library.HudRegistry then
            for Obj, _ in next, Library.HudRegistry do
                Apply(Obj)
            end
        end
    end

function Library:MakeDraggable(menuFrame, dragCutoffY, companionFrame)
    menuFrame.Active = true
    local dragging = false
    local dragInput, dragStart, startPos
    local outlineFrame = nil

    local function ensureOutline()
        if outlineFrame and outlineFrame.Parent then
            return outlineFrame
        end
        outlineFrame = Instance.new("Frame")
        outlineFrame.Name = "DragOutline"
        outlineFrame.BackgroundTransparency = 1
        outlineFrame.BorderSizePixel = 0
        outlineFrame.Size = menuFrame.Size
        outlineFrame.Position = menuFrame.Position
        outlineFrame.AnchorPoint = menuFrame.AnchorPoint
        outlineFrame.Visible = false
        outlineFrame.ZIndex = 250
        outlineFrame.Parent = Library.ScreenGui

        local Stroke = Instance.new("UIStroke")
        Stroke.Name = "OutlineStroke"
        Stroke.Thickness = 2
        Stroke.Color = Library.AccentColor or Color3.fromRGB(255, 255, 255)
        Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Stroke.LineJoinMode = Enum.LineJoinMode.Miter
        Stroke.Parent = outlineFrame

        return outlineFrame
    end

    local function update()
        if not dragging or not dragInput then return end
        local delta = dragInput.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        local outline = ensureOutline()
        outline.Position = newPos
        outline.Size = menuFrame.Size
        outline.Visible = true
        local Stroke = outline:FindFirstChild("OutlineStroke")
        if Stroke then
            Stroke.Color = Library.AccentColor or Stroke.Color
        end
    end

    menuFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local relativePosY = input.Position.Y - menuFrame.AbsolutePosition.Y
            if dragCutoffY and relativePosY > dragCutoffY then return end

            dragging = true
            dragStart = input.Position
            startPos = menuFrame.Position

            menuFrame.Visible = false
            if companionFrame then
                companionFrame.Visible = false
            end
            if Library.WindowGlow then
                Library.WindowGlow.Visible = false
            end

            local outline = ensureOutline()
            outline.Position = startPos
            outline.Size = menuFrame.Size
            outline.Visible = true
            local Stroke = outline:FindFirstChild("OutlineStroke")
            if Stroke then
                Stroke.Color = Library.AccentColor or Color3.fromRGB(255, 255, 255)
            end

            local releaseEvent
            releaseEvent = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    if releaseEvent then releaseEvent:Disconnect() end
                    local outline = ensureOutline()
                    local finalPos = outline.Position
                    menuFrame.Position = finalPos
                    if companionFrame then
                        companionFrame.Position = finalPos
                    end
                    outline.Visible = false
                    menuFrame.Visible = true
                    if companionFrame then
                        companionFrame.Visible = true
                    end
                    if Library.WindowGlow and Toggles.UIGlow and Toggles.UIGlow.Value then
                        Library.WindowGlow.Visible = true
                        Library.WindowGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
                    end
                end
            end)
        end
    end)

    menuFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(update)
end

function Library:AddToolTip(InfoStr, HoverInstance)
        local MaxWidth = 200

        local X, Y = Library:GetTextBounds(InfoStr, Library.Font, 15)

        if X > MaxWidth then
            InfoStr = Library:BreakTextIntoLines(InfoStr, MaxWidth, Library.Font, 15)
            X, Y = Library:GetTextBounds(InfoStr, Library.Font, 15)
        end

        local Tooltip = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor,
            BorderColor3 = Library.OutlineColor,
            Size = API.UDim2fromOffset(X + 8, Y + 4),
            ZIndex = 100,
            Parent = Library.ScreenGui,
            Visible = false,
        })

        local Label = Library:CreateLabel({
            Position = API.UDim2fromOffset(3, 1),
            Size = API.UDim2fromOffset(X, Y),
            TextSize = 15,
            Text = InfoStr,
            TextColor3 = Library.FontColor,
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = Tooltip.ZIndex + 1,
            Parent = Tooltip,
        })

        Library:AddToRegistry(Tooltip, {
            BackgroundColor3 = 'MainColor',
            BorderColor3 = 'OutlineColor',
        })

        Library:AddToRegistry(Label, {
            TextColor3 = 'FontColor',
        })

        local IsHovering = false
        local TooltipVisible = false

        HoverInstance.MouseEnter:Connect(function()
            if Library:MouseIsOverOpenedFrame() then
                return
            end

            IsHovering = true

            task.delay(1, function()
                if IsHovering then
                    Tooltip.Position = API.UDim2fromOffset(Mouse.X + 15, Mouse.Y + 12)
                    Tooltip.Visible = true
                    TooltipVisible = true
                end
            end)

            while IsHovering do
                RunService.Heartbeat:Wait()
                Tooltip.Position = API.UDim2fromOffset(Mouse.X + 15, Mouse.Y + 12)
            end
        end)

        HoverInstance.MouseLeave:Connect(function()
            IsHovering = false
            Tooltip.Visible = false
            TooltipVisible = false
        end)
    end

    function Library:BreakTextIntoLines(text, maxWidth, font, textSize)
        local result = ""
        local currentLine = ""

        for word in string.gmatch(text, "%S+") do
            local testLine = currentLine == "" and word or currentLine .. " " .. word
            local lineWidth = Library:GetTextBounds(testLine, font, textSize)

            if lineWidth > maxWidth then
                result = result .. (result == "" and currentLine or "\n" .. currentLine)
                currentLine = word
            else
                currentLine = testLine
            end
        end

        if currentLine ~= "" then
            result = result .. (result == "" and currentLine or "\n" .. currentLine)
        end

        return result
    end

    function Library:OnHighlight(HighlightInstance, Instance, Properties, PropertiesDefault)
        HighlightInstance.MouseEnter:Connect(function()
            local Reg = Library.RegistryMap[Instance];

            for Property, ColorIdx in next, Properties do
                Instance[Property] = Library[ColorIdx] or ColorIdx;

                if Reg and Reg.Properties[Property] then
                    Reg.Properties[Property] = ColorIdx;
                end;
            end;
        end)

        HighlightInstance.MouseLeave:Connect(function()
            local Reg = Library.RegistryMap[Instance];

            for Property, ColorIdx in next, PropertiesDefault do
                Instance[Property] = Library[ColorIdx] or ColorIdx;

                if Reg and Reg.Properties[Property] then
                    Reg.Properties[Property] = ColorIdx;
                end;
            end;
        end)
    end;

    function Library:MouseIsOverOpenedFrame()
        for Frame, _ in next, Library.OpenedFrames do
            local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

            if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
                and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

                return true;
            end;
        end;
    end;

    function Library:IsMouseOverFrame(Frame)
        local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

        if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
            and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

            return true;
        end;
    end;

    function Library:UpdateDependencyBoxes()
        for _, Depbox in next, Library.DependencyBoxes do
            Depbox:Update();
        end;
    end;

    function Library:MapValue(Value, MinA, MaxA, MinB, MaxB)
        if MaxA == MinA then
            return MinB
        end
        local T = (Value - MinA) / (MaxA - MinA)
        if T ~= T then T = 0 end
        if T < 0 then T = 0 elseif T > 1 then T = 1 end
        return MinB + T * (MaxB - MinB)
    end;

    function Library:GetTextBounds(Text, Font, Size, Resolution)
        local Bounds = TextService:GetTextSize(Text, Size, Font, Resolution or API.Vector2New(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y))
        return Bounds.X, Bounds.Y
    end;

    function Library:GetDarkerColor(Color)
        local H, S, V = API.Color3ToHSV(Color);
        return API.Color3FromHSV(H, S, V / 2.5);
    end;

    function Library:GetLighterColor(Color)
        local H, S, V = API.Color3ToHSV(Color);
        V = API.MathClamp(V * 1.5, 0, 1);
        return API.Color3FromHSV(H, S, V);
    end;

    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.AccentColorLight = Library:GetLighterColor(Library.AccentColor);
    Library.FontColorDark = Library:GetDarkerColor(Library.FontColor);
    Library.MainColorLight = Library:GetLighterColor(Library.MainColor);

    function Library:AddToRegistry(Instance, Properties, IsHud)
        local Idx = #Library.Registry + 1;
        local Data = {
            Instance = Instance;
            Properties = Properties;
            Idx = Idx;
        };

        API.TableInsert(Library.Registry, Data);
        Library.RegistryMap[Instance] = Data;

        if IsHud then
            API.TableInsert(Library.HudRegistry, Data);
        end;
    end;

    function Library:RemoveFromRegistry(Instance)
        local Data = Library.RegistryMap[Instance];

        if Data then
            for Idx = #Library.Registry, 1, -1 do
                if Library.Registry[Idx] == Data then
                    API.TableRemove(Library.Registry, Idx);
                end;
            end;

            for Idx = #Library.HudRegistry, 1, -1 do
                if Library.HudRegistry[Idx] == Data then
                    API.TableRemove(Library.HudRegistry, Idx);
                end;
            end;

            Library.RegistryMap[Instance] = nil;
        end;
    end;

    function Library:UpdateColorsUsingRegistry()
        for Idx, Object in next, Library.Registry do
            for Property, ColorIdx in next, Object.Properties do
                if API.Type(ColorIdx) == 'string' then
                    Object.Instance[Property] = Library[ColorIdx];
                elseif API.Type(ColorIdx) == 'function' then
                    Object.Instance[Property] = ColorIdx()
                end
            end;
        end;
    end;

    function Library:GiveSignal(Signal)
        API.TableInsert(Library.Signals, Signal)
    end
    function Library:AddSignal(signal, func)

        local connectedsignal = signal:Connect(func)
        Library:GiveSignal(connectedsignal)
        return connectedsignal
    end
    function Library:Unload()
        for Idx = #Library.Signals, 1, -1 do
            local Connection = API.TableRemove(Library.Signals, Idx)
            Connection:Disconnect()
        end

        if Library.OnUnload then
            Library.OnUnload()
        end

        API.Destroy(ScreenGui)
    end

    function Library:OnUnload(Callback)
        Library.OnUnload = Callback
    end

    Library:GiveSignal(ScreenGui.DescendantRemoving:Connect(function(Instance)
        if Library.RegistryMap[Instance] then
            Library:RemoveFromRegistry(Instance);
        end;
    end))

    local BaseAddons = {};

    do
        local Funcs = {};

        function Funcs:AddColorPicker(Idx, Info)
            local ToggleLabel = self.TextLabel;

            assert(Info.Default, 'AddColorPicker: Missing default value.');

            local ColorPicker = {
                Value = Info.Default;
                Color = Info.Default;
                Transparency = Info.Transparency or 0;
                Type = 'ColorPicker';
                Title = API.Type(Info.Title) == 'string' and Info.Title or 'Color picker',
                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Color) end;
            };

            function ColorPicker:SetHSVFromRGB(Color)
                local H, S, V = API.Color3ToHSV(Color);

                ColorPicker.Hue = H;
                ColorPicker.Sat = S;
                ColorPicker.Vib = V;
            end;

            ColorPicker:SetHSVFromRGB(ColorPicker.Value);

            local DisplayFrame = Library:Create('Frame', {
                BackgroundColor3 = ColorPicker.Value;
                BorderColor3 = Library:GetDarkerColor(ColorPicker.Value);
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(0, 18, 0, 14);
                ZIndex = 6;
                Parent = ToggleLabel;
            });

            local CheckerFrame = Library:Create('ImageLabel', {
                BorderSizePixel = 0;
                Size = API.UDim2New(0, 17, 0, 13);
                ZIndex = 5;
                Image = 'http://www.roblox.com/asset/?id=12977615774';
                Visible = not not Info.Transparency;
                Parent = DisplayFrame;
            });

            local PickerFrameOuter = Library:Create('Frame', {
                Name = 'Color';
                BackgroundColor3 = API.Color3New(1, 1, 1);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Position = API.UDim2fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18),
                Size = API.UDim2fromOffset(230, Info.Transparency and 271 or 253);
                Visible = false;
                ZIndex = 15;
                Parent = ScreenGui,
            });

            API.GetPropertyChangedSignal(DisplayFrame, 'AbsolutePosition'):Connect(function()
                PickerFrameOuter.Position = API.UDim2fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18);
            ColorPicker.DisplayFrame = DisplayFrame
            ColorPicker.PickerFrameOuter = PickerFrameOuter
            pcall(function()
                DisplayFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                    if PickerFrameOuter and PickerFrameOuter.Visible then
                        PickerFrameOuter.Position = API.UDim2fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18);
                    end
                end)
            end)
            end)

            local PickerFrameInner = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 16;
                Parent = PickerFrameOuter;
            });

            local Highlight = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor;
                BorderSizePixel = 0;
                Size = API.UDim2New(1, 0, 0, 2);
                ZIndex = 17;
                Parent = PickerFrameInner;
            });

            local SatVibMapOuter = Library:Create('Frame', {
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Position = API.UDim2New(0, 4, 0, 25);
                Size = API.UDim2New(0, 200, 0, 200);
                ZIndex = 17;
                Parent = PickerFrameInner;
            });

            local SatVibMapInner = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 18;
                Parent = SatVibMapOuter;
            });

            local SatVibMap = Library:Create('ImageLabel', {
                BorderSizePixel = 0;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 18;
                Image = 'rbxassetid://4155801252';
                Parent = SatVibMapInner;
            });

            local CursorOuter = Library:Create('ImageLabel', {
                AnchorPoint = API.Vector2New(0.5, 0.5);
                Size = API.UDim2New(0, 6, 0, 6);
                BackgroundTransparency = 1;
                Image = 'http://www.roblox.com/asset/?id=9619665977';
                ImageColor3 = API.Color3New(0, 0, 0);
                ZIndex = 19;
                Parent = SatVibMap;
            });

            local CursorInner = Library:Create('ImageLabel', {
                Size = API.UDim2New(0, CursorOuter.Size.X.Offset - 2, 0, CursorOuter.Size.Y.Offset - 2);
                Position = API.UDim2New(0, 1, 0, 1);
                BackgroundTransparency = 1;
                Image = 'http://www.roblox.com/asset/?id=9619665977';
                ZIndex = 20;
                Parent = CursorOuter;
            })

            local HueSelectorOuter = Library:Create('Frame', {
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Position = API.UDim2New(0, 208, 0, 25);
                Size = API.UDim2New(0, 15, 0, 200);
                ZIndex = 17;
                Parent = PickerFrameInner;
            });

            local HueSelectorInner = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(1, 1, 1);
                BorderSizePixel = 0;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 18;
                Parent = HueSelectorOuter;
            });

            local HueCursor = Library:Create('Frame', { 
                BackgroundColor3 = API.Color3New(1, 1, 1);
                AnchorPoint = API.Vector2New(0, 0.5);
                BorderColor3 = API.Color3New(0, 0, 0);
                Size = API.UDim2New(1, 0, 0, 1);
                ZIndex = 18;
                Parent = HueSelectorInner;
            });

            local HueBoxOuter = Library:Create('Frame', {
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Position = API.UDim2fromOffset(4, 228),
                Size = API.UDim2New(0.5, -6, 0, 20),
                ZIndex = 18,
                Parent = PickerFrameInner;
            });

            local HueBoxInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 18,
                Parent = HueBoxOuter;
            });

            Library:Create('UIGradient', {
                Color = API.ColorSequenceNew({
                    API.ColorSequenceKeypointNew(0, API.Color3New(1, 1, 1)),
                    API.ColorSequenceKeypointNew(1, API.Color3FromRGB(212, 212, 212))
                });
                Rotation = 90;
                Parent = HueBoxInner;
            });

            local HueBox = Library:Create('TextBox', {
                BackgroundTransparency = 1;
                Position = API.UDim2New(0, 5, 0, 0);
                Size = API.UDim2New(1, -5, 1, 0);
                Font = Library.Font;
                PlaceholderColor3 = API.Color3FromRGB(190, 190, 190);
                PlaceholderText = 'Hex color',
                Text = '#FFFFFF',
                TextColor3 = Library.FontColor;
                TextSize = 15;
                ClearTextOnFocus = false,
                TextStrokeTransparency = 1;
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 20,
                Parent = HueBoxInner;
            });

            local RgbBoxBase = Library:Create(API.Clone(HueBoxOuter), {
                Position = API.UDim2New(0.5, 2, 0, 228),
                Size = API.UDim2New(0.5, -6, 0, 20),
                Parent = PickerFrameInner
            });

            local RgbBox = Library:Create(API.FindFirstChild(RgbBoxBase.Frame,'TextBox'), {
                Text = '255, 255, 255',
                PlaceholderText = 'RGB color',
                ClearTextOnFocus = false,
                TextColor3 = Library.FontColor
            });

            local TransparencyBoxOuter, TransparencyBoxInner, TransparencyCursor;

            if Info.Transparency then 
                TransparencyBoxOuter = Library:Create('Frame', {
                    BorderColor3 = API.Color3New(0, 0, 0);
                    BorderSizePixel = 0;
                    Position = API.UDim2fromOffset(4, 251);
                    Size = API.UDim2New(1, -8, 0, 15);
                    ZIndex = 19;
                    Parent = PickerFrameInner;
                });

                TransparencyBoxInner = Library:Create('Frame', {
                    BackgroundColor3 = ColorPicker.Value;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = API.UDim2New(1, 0, 1, 0);
                    ZIndex = 19;
                    Parent = TransparencyBoxOuter;
                });

                Library:AddToRegistry(TransparencyBoxInner, { BorderColor3 = 'OutlineColor' });

                Library:Create('ImageLabel', {
                    BackgroundTransparency = 1;
                    Size = API.UDim2New(1, 0, 1, 0);
                    Image = 'http://www.roblox.com/asset/?id=12978095818';
                    ZIndex = 20;
                    Parent = TransparencyBoxInner;
                });

                TransparencyCursor = Library:Create('Frame', { 
                    BackgroundColor3 = API.Color3New(1, 1, 1);
                    AnchorPoint = API.Vector2New(0.5, 0);
                    BorderColor3 = API.Color3New(0, 0, 0);
                    Size = API.UDim2New(0, 1, 1, 0);
                    ZIndex = 21;
                    Parent = TransparencyBoxInner;
                });
            end;

            local DisplayLabel = Library:CreateLabel({
                Size = API.UDim2New(1, 0, 0, 14);
                Position = API.UDim2fromOffset(5, 5);
                TextXAlignment = Enum.TextXAlignment.Left;
                TextSize = 15;
                Text = ColorPicker.Title,
                TextWrapped = false;
                ZIndex = 16;
                Parent = PickerFrameInner;
            });

            local ContextMenu = {}
            do
                ContextMenu.Options = {}
                ContextMenu.Container = Library:Create('Frame', {
                    BorderColor3 = API.Color3New(),
                    ZIndex = 14,

                    Visible = false,
                    Parent = ScreenGui
                })

                ContextMenu.Inner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.fromScale(1, 1);
                    ZIndex = 15;
                    Parent = ContextMenu.Container;
                });

                Library:Create('UIListLayout', {
                    Name = 'Layout',
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = ContextMenu.Inner;
                });

                Library:Create('UIPadding', {
                    Name = 'Padding',
                    PaddingLeft = API.UDimNew(0, 4),
                    Parent = ContextMenu.Inner,
                });

                function updateMenuPosition()
                    ContextMenu.Container.Position = API.UDim2fromOffset(
                        (DisplayFrame.AbsolutePosition.X + DisplayFrame.AbsoluteSize.X) + 4,
                        DisplayFrame.AbsolutePosition.Y + 1
                    )
                end

                function updateMenuSize()
                    local menuWidth = 60
                    for i, label in next, API.GetChildren(ContextMenu.Inner) do
                        if API.IsA(label, 'TextLabel') then
                            menuWidth = API.MathMax(menuWidth, label.TextBounds.X)
                        end
                    end

                    ContextMenu.Container.Size = API.UDim2fromOffset(
                        menuWidth + 8,
                        ContextMenu.Inner.Layout.AbsoluteContentSize.Y + 4
                    )
                end

                API.GetPropertyChangedSignal(DisplayFrame, 'AbsolutePosition'):Connect(updateMenuPosition)
                API.GetPropertyChangedSignal(ContextMenu.Inner.Layout, 'AbsoluteContentSize'):Connect(updateMenuSize)

                API.TaskSpawn(updateMenuPosition)
                API.TaskSpawn(updateMenuSize)

                Library:AddToRegistry(ContextMenu.Inner, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                function ContextMenu:Show()
                    self.Container.Visible = true
                end

                function ContextMenu:Hide()
                    self.Container.Visible = false
                end

                function ContextMenu:AddOption(Str, Callback)
                    if API.Type(Callback) ~= 'function' then
                        Callback = function() end
                    end

                    local Button = Library:CreateLabel({
                        Active = false;
                        Size = API.UDim2New(1, 0, 0, 15);
                        TextSize = 14;
                        Text = Str;
                        ZIndex = 16;
                        Parent = self.Inner;
                        TextXAlignment = Enum.TextXAlignment.Left,
                    });

                    Library:OnHighlight(Button, Button, 
                        { TextColor3 = 'AccentColor' },
                        { TextColor3 = 'FontColor' }
                    );

                    Button.InputBegan:Connect(function(Input)
                        if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            return
                        end

                        Callback()
                    end)
                end

                ContextMenu:AddOption('Copy color', function()
                    Library.ColorClipboard = ColorPicker.Value
                    Library:Notify('Copied color!', 2)
                end)

                ContextMenu:AddOption('Paste color', function()
                    if not Library.ColorClipboard then
                        return Library:Notify('You have not copied a color!', 2)
                    end
                    ColorPicker:SetValueRGB(Library.ColorClipboard)
                end)

                ContextMenu:AddOption('Copy HEX', function()
                    API.Pcall(setclipboard, API.ToHex(ColorPicker.Value))
                    Library:Notify('Copied hex code to clipboard!', 2)
                end)

                ContextMenu:AddOption('Copy RGB', function()
                    API.Pcall(setclipboard, API.TableConcat({ API.MathFloor(ColorPicker.Value.R * 255), API.MathFloor(ColorPicker.Value.G * 255), API.MathFloor(ColorPicker.Value.B * 255) }, ', '))
                    Library:Notify('Copied RGB values to clipboard!', 2)
                end)

            end

            Library:AddToRegistry(PickerFrameInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor'; });
            Library:AddToRegistry(Highlight, { BackgroundColor3 = 'AccentColor'; });
            Library:AddToRegistry(SatVibMapInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor'; });

            Library:AddToRegistry(HueBoxInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor'; });
            Library:AddToRegistry(RgbBoxBase.Frame, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor'; });
            Library:AddToRegistry(RgbBox, { TextColor3 = 'FontColor', });
            Library:AddToRegistry(HueBox, { TextColor3 = 'FontColor', });

            local SequenceTable = {};

            for Hue = 0, 1, 0.1 do
                API.TableInsert(SequenceTable, API.ColorSequenceKeypointNew(Hue, API.Color3FromHSV(Hue, 1, 1)));
            end;

            local HueSelectorGradient = Library:Create('UIGradient', {
                Color = API.ColorSequenceNew(SequenceTable);
                Rotation = 90;
                Parent = HueSelectorInner;
            });

            HueBox.FocusLost:Connect(function(enter)
                if enter then
                    local success, result = API.Pcall(API.FromHex, HueBox.Text)
                    if success and typeof(result) == 'Color3' then
                        ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = API.Color3ToHSV(result)
                    end
                end

                ColorPicker:Display()
            end)

            RgbBox.FocusLost:Connect(function(enter)
                if enter then
                    local r, g, b = RgbBox.Text:match('(%d+),%s*(%d+),%s*(%d+)')
                    if r and g and b then
                        ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = API.Color3ToHSV(API.Color3FromRGB(r, g, b))
                    end
                end

                ColorPicker:Display()
            end)

            function ColorPicker:Display()
                ColorPicker.Value = API.Color3FromHSV(ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib);
                ColorPicker.Color = ColorPicker.Value;
                SatVibMap.BackgroundColor3 = API.Color3FromHSV(ColorPicker.Hue, 1, 1);

                Library:Create(DisplayFrame, {
                    BackgroundColor3 = ColorPicker.Value;
                    BackgroundTransparency = ColorPicker.Transparency;
                    BorderColor3 = Library:GetDarkerColor(ColorPicker.Value);
                });

                if TransparencyBoxInner then
                    TransparencyBoxInner.BackgroundColor3 = ColorPicker.Value;
                    TransparencyCursor.Position = API.UDim2New(1 - ColorPicker.Transparency, 0, 0, 0);
                end;

                CursorOuter.Position = API.UDim2New(ColorPicker.Sat, 0, 1 - ColorPicker.Vib, 0);
                HueCursor.Position = API.UDim2New(0, 0, ColorPicker.Hue, 0);

                HueBox.Text = '#' .. (API.ToHex and API.ToHex(ColorPicker.Value) or 'FFFFFF')
                RgbBox.Text = API.TableConcat({ API.MathFloor(ColorPicker.Value.R * 255), API.MathFloor(ColorPicker.Value.G * 255), API.MathFloor(ColorPicker.Value.B * 255) }, ', ')

                if ColorPicker.Callback then
                    Library:SafeCallback(ColorPicker.Callback, ColorPicker.Value);
                end
                if ColorPicker.Changed then
                    Library:SafeCallback(ColorPicker.Changed, ColorPicker.Value);
                end
            end;

            function ColorPicker:OnChanged(Func)
                ColorPicker.Changed = Func;
                if type(Func) == "function" then
                    pcall(Func, ColorPicker.Value)
                end
            end;

            function ColorPicker:Show()
                for Frame, Val in next, Library.OpenedFrames do
                    if Frame.Name == 'Color' then
                        Frame.Visible = false;
                        Library.OpenedFrames[Frame] = nil;
                    end;
                end;

                PickerFrameOuter.Visible = true;
                Library.OpenedFrames[PickerFrameOuter] = true;
            end;

            function ColorPicker:Hide()
                PickerFrameOuter.Visible = false;
                Library.OpenedFrames[PickerFrameOuter] = nil;
            end;

            function ColorPicker:SetValue(HSV, Transparency)
                local Color = API.Color3FromHSV(HSV[1], HSV[2], HSV[3]);

                ColorPicker.Transparency = Transparency or 0;
                ColorPicker:SetHSVFromRGB(Color);
                ColorPicker:Display();
            end;

            function ColorPicker:SetValueRGB(Color, Transparency)
                ColorPicker.Transparency = Transparency or 0;
                ColorPicker:SetHSVFromRGB(Color);
                ColorPicker:Display();
            end;

            SatVibMap.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local MinX = SatVibMap.AbsolutePosition.X;
                        local MaxX = MinX + SatVibMap.AbsoluteSize.X;
                        local MouseX = API.MathClamp(Mouse.X, MinX, MaxX);

                        local MinY = SatVibMap.AbsolutePosition.Y;
                        local MaxY = MinY + SatVibMap.AbsoluteSize.Y;
                        local MouseY = API.MathClamp(Mouse.Y, MinY, MaxY);

                        ColorPicker.Sat = (MouseX - MinX) / (MaxX - MinX);
                        ColorPicker.Vib = 1 - ((MouseY - MinY) / (MaxY - MinY));
                        ColorPicker:Display();

                        RenderStepped:Wait();
                    end;

                    Library:AttemptSave();
                end;
            end);

            HueSelectorInner.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local MinY = HueSelectorInner.AbsolutePosition.Y;
                        local MaxY = MinY + HueSelectorInner.AbsoluteSize.Y;
                        local MouseY = API.MathClamp(Mouse.Y, MinY, MaxY);

                        ColorPicker.Hue = ((MouseY - MinY) / (MaxY - MinY));
                        ColorPicker:Display();

                        RenderStepped:Wait();
                    end;

                    Library:AttemptSave();
                end;
            end);

            DisplayFrame.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                    if PickerFrameOuter.Visible then
                        ColorPicker:Hide()
                    else
                        ContextMenu:Hide()
                        ColorPicker:Show()
                    end;
                elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and not Library:MouseIsOverOpenedFrame() then
                    ContextMenu:Show()
                    ColorPicker:Hide()
                end
            end);

            if TransparencyBoxInner then
                TransparencyBoxInner.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local MinX = TransparencyBoxInner.AbsolutePosition.X;
                            local MaxX = MinX + TransparencyBoxInner.AbsoluteSize.X;
                            local MouseX = API.MathClamp(Mouse.X, MinX, MaxX);

                            ColorPicker.Transparency = 1 - ((MouseX - MinX) / (MaxX - MinX));

                            ColorPicker:Display();

                            RenderStepped:Wait();
                        end;

                        Library:AttemptSave();
                    end;
                end);
            end;

            Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local AbsPos, AbsSize = PickerFrameOuter.AbsolutePosition, PickerFrameOuter.AbsoluteSize;

                    if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                        or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                        ColorPicker:Hide();
                    end;

                    if not Library:IsMouseOverFrame(ContextMenu.Container) then
                        ContextMenu:Hide()
                    end
                end;

                if Input.UserInputType == Enum.UserInputType.MouseButton2 and ContextMenu.Container.Visible then
                    if not Library:IsMouseOverFrame(ContextMenu.Container) and not Library:IsMouseOverFrame(DisplayFrame) then
                        ContextMenu:Hide()
                    end
                end
            end))

            ColorPicker:Display();
            ColorPicker.DisplayFrame = DisplayFrame

            Options[Idx] = ColorPicker;

            return self;
        end;

        function Funcs:AddKeyPicker(Idx, Info)
            local ParentObj = self;
            local ToggleLabel = self.TextLabel;
            local Container = self.Container;

            assert(Info.Default, 'AddKeyPicker: Missing default value.');

            local KeyPicker = {
                Value = Info.Default;
                Toggled = false;
                Mode = Info.Mode or 'Toggle';
                Type = 'KeyPicker';
                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Value) end;
                ChangedCallback = Info.ChangedCallback or function(New) end;
                ConnectedToggles = {};

                SyncToggleState = Info.SyncToggleState or false;
            };

            if KeyPicker.SyncToggleState then
                Info.Modes = Info.Modes or { 'Always', 'Toggle', 'Hold', 'Remove' }
            end

            local PickOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                AnchorPoint = Vector2.new(1, 0.5);
                Position = API.UDim2New(1, 0, 0.5, 0);
                Size = API.UDim2New(0, 32, 0, 15);
                ZIndex = 6;
                Parent = ToggleLabel;
            });

            local PickInner = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 7;
                Parent = PickOuter;
            });

            Library:AddToRegistry(PickInner, {
                BackgroundColor3 = 'BackgroundColor';
                BorderColor3 = 'OutlineColor';
            });

            local DisplayLabel = Library:CreateLabel({
                Size = API.UDim2New(1, 0, 1, 0);
                TextSize = 14;
                Text = Info.Default;
                TextWrapped = true;
                ZIndex = 8;
                Parent = PickInner;
            });

            local ModeSelectOuter = Library:Create('Frame', {
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Position = API.UDim2fromOffset(ToggleLabel.AbsolutePosition.X + ToggleLabel.AbsoluteSize.X + 4, ToggleLabel.AbsolutePosition.Y + 1);
                Size = API.UDim2New(0, 60, 0, 60 + 2);
                Visible = false;
                ZIndex = 14;
                Parent = ScreenGui;
            });

            local function UpdateModePos()
                ModeSelectOuter.Position = API.UDim2fromOffset(ToggleLabel.AbsolutePosition.X + ToggleLabel.AbsoluteSize.X + 4, ToggleLabel.AbsolutePosition.Y + 1);
            end
            KeyPicker.UpdateModePos = UpdateModePos
            UpdateModePos()
            pcall(function()
                ToggleLabel:GetPropertyChangedSignal("AbsolutePosition"):Connect(UpdateModePos)
                ToggleLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateModePos)
            end)

            local ModeSelectInner = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 15;
                Parent = ModeSelectOuter;
            });

            Library:AddToRegistry(ModeSelectInner, {
                BackgroundColor3 = 'BackgroundColor';
                BorderColor3 = 'OutlineColor';
            });

            Library:Create('UIListLayout', {
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = ModeSelectInner;
            });

            local ContainerLabel = Library:CreateLabel({
                TextXAlignment = Enum.TextXAlignment.Left;
                Size = API.UDim2New(1, 0, 0, 18);
                TextSize = 14;
                Visible = false;
                ZIndex = 110;
                Parent = Library.KeybindContainer;
            },  true);

            local Modes = Info.Modes or { 'Always', 'Toggle', 'Hold', "Remove" };
            local ModeButtons = {};

            for Idx, Mode in next, Modes do
                local ModeButton = {};

                local Label = Library:CreateLabel({
                    Active = false;
                    Size = API.UDim2New(1, 0, 0, 15);
                    TextSize = 14;
                    Text = Mode;
                    ZIndex = 16;
                    Parent = ModeSelectInner;
                });

                function ModeButton:Select()
                    if Mode == "Remove" then
                        KeyPicker:SetValue({"...", KeyPicker.Mode})
                    else
                        for _, Button in next, ModeButtons do
                            Button:Deselect()
                        end
                        KeyPicker.Mode = Mode;

                        Label.TextColor3 = Library.AccentColor;
                        Library.RegistryMap[Label].Properties.TextColor3 = 'AccentColor';

                        if KeyPicker.SyncToggleState and ParentObj.Type == 'Toggle' then
                            if Mode == 'Always' then
                                ParentObj:SetValue(true)
                            elseif Mode == 'Hold' then
                            end
                        end
                    end
                    ModeSelectOuter.Visible = false;
                end;

                function ModeButton:Deselect()
                    KeyPicker.Mode = nil;

                    Label.TextColor3 = Library.FontColor;
                    Library.RegistryMap[Label].Properties.TextColor3 = 'FontColor';
                end;

                Label.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        ModeButton:Select();
                        Library:AttemptSave();
                    end;
                end);

                if Mode == KeyPicker.Mode then
                    ModeButton:Select();
                end;

                ModeButtons[Mode] = ModeButton;
            end;

            local OldState = false
            function KeyPicker:Update()
                local State = KeyPicker:GetState();

                if #KeyPicker.ConnectedToggles > 0 and State ~= OldState then
                    for i, v in next, KeyPicker.ConnectedToggles do
                        v:SetValue(State)
                    end
                end

                OldState = State

                if Info.NoUI then
                    return;
                end;

                ContainerLabel.Text = API.StringFormat('[%s] %s : %s', KeyPicker.Value, Info.Text, KeyPicker.Mode);

                if Library.KeybindListMode == 1 then
                    ContainerLabel.Visible = true;
                    ContainerLabel.TextColor3 = State and Library.AccentColor or Library.FontColor;  
                    Library.RegistryMap[ContainerLabel].Properties.TextColor3 = State and 'AccentColor' or 'FontColor';   
                else
                    ContainerLabel.Visible = State;
                    ContainerLabel.TextColor3 = Library.AccentColor;
                    Library.RegistryMap[ContainerLabel].Properties.TextColor3 = 'AccentColor';
                end

                Library.RegistryMap[ContainerLabel].Properties.TextColor3 = State and 'AccentColor' or 'FontColor';

                local YSize = 0
                local XSize = 0

                for _, Label in next, API.GetChildren(Library.KeybindContainer) do
                    if API.IsA(Label, 'TextLabel') and Label.Visible then
                        YSize = YSize + Label.AbsoluteSize.Y + Library.KeyUilistlayout.Padding.Offset
                        if (Label.TextBounds.X > XSize) then
                            XSize = Label.TextBounds.X
                        end
                    end
                end

                if YSize == 0 then
                    Library.KeybindBackground.Size = API.UDim2New(1, 0, 0, 0)
                    Library.KeybindBackground.BackgroundTransparency = 1
                else
                    Library.KeybindBackground.Size = API.UDim2New(0, API.MathMax(XSize + 20, 210), 0, YSize + 30)
                    Library.KeybindBackground.BackgroundTransparency = 0
                end
            end;

            function KeyPicker:GetState()
                if KeyPicker.Mode == 'Always' then
                    return true;
                elseif KeyPicker.Mode == 'Hold' then
                    if KeyPicker.Value == 'None' then
                        return false;
                    end

                    local Key = KeyPicker.Value;

                    if Key == 'MB1' or Key == 'MB2' or Key == "MB3" then
                        return Key == 'MB1' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                            or Key == 'MB2' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) or
                            Key == 'MB3' and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton3);
                    else
                        local succ, call = API.Pcall(function (...)
                            return Enum.KeyCode[KeyPicker.Value]
                        end)
                        if succ then
                            return API.IsKeyDown(UserInputService, Enum.KeyCode[KeyPicker.Value]);     
                        else
                            return false                       
                        end
                    end;
                else
                    return KeyPicker.Toggled;
                end;
            end;

            function KeyPicker:SetValue(Data)
                local Key, Mode = Data[1], Data[2];
                DisplayLabel.Text = Key;
                KeyPicker.Value = Key;
                ModeButtons[Mode]:Select();
                KeyPicker:Update();
            end;

            function KeyPicker:OnClick(Callback)
                KeyPicker.Clicked = Callback
            end

            function KeyPicker:OnChanged(Callback)
                KeyPicker.Changed = Callback
                Callback(KeyPicker.Value)
            end

            if ParentObj.Addons then
                API.TableInsert(ParentObj.Addons, KeyPicker)
            end

            function KeyPicker:DoClick()
                if ParentObj.Type == 'Toggle' and KeyPicker.SyncToggleState then
                    if KeyPicker.Mode == 'Toggle' then
                        ParentObj:SetValue(not ParentObj.Value)
                    elseif KeyPicker.Mode == 'Always' then
                        ParentObj:SetValue(true)
                    elseif KeyPicker.Mode == 'Hold' then
                        ParentObj:SetValue(true)
                    end
                end

                Library:SafeCallback(KeyPicker.Callback, KeyPicker.Toggled)
                Library:SafeCallback(KeyPicker.Clicked, KeyPicker.Toggled)
            end

            local Picking = false;

            PickOuter.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                    Picking = true;

                    DisplayLabel.Text = '';

                    local Break;
                    local Text = '';

                    API.TaskSpawn(function()
                        while (not Break) do
                            if Text == '...' then
                                Text = '';
                            end;

                            Text = Text .. '.';
                            DisplayLabel.Text = Text;

                            API.Wait(0.4);
                        end;
                    end);

                    API.Wait(0.2);

                    local Event;
                    Event = UserInputService.InputBegan:Connect(function(Input)
                        local Key;

                        if Input.UserInputType == Enum.UserInputType.Keyboard then
                            Key = Input.KeyCode.Name;
                        elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            Key = 'MB1';
                        elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
                            Key = 'MB2';
                        elseif Input.UserInputType == Enum.UserInputType.MouseButton3 then
                            Key = 'MB3';
                        end;

                        Break = true;
                        Picking = false;

                        DisplayLabel.Text = Key;
                        KeyPicker.Value = Key;

                        Library:SafeCallback(KeyPicker.ChangedCallback, Input.KeyCode or Input.UserInputType)
                        Library:SafeCallback(KeyPicker.Changed, Input.KeyCode or Input.UserInputType)

                        Library:AttemptSave();

                        Event:Disconnect();
                    end);
                elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and not Library:MouseIsOverOpenedFrame() then
                    ModeSelectOuter.Visible = true;
                end;
            end);

            Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input)
                if (not Picking) then
                    if KeyPicker.Mode == 'Toggle' then
                        local Key = KeyPicker.Value;

                        if Key == 'MB1' or Key == 'MB2' or Key == 'MB3' then
                            if Key == 'MB1' and Input.UserInputType == Enum.UserInputType.MouseButton1
                            or Key == 'MB2' and Input.UserInputType == Enum.UserInputType.MouseButton2
                            or Key == 'MB3' and Input.UserInputType == Enum.UserInputType.MouseButton3 then
                                KeyPicker.Toggled = not KeyPicker.Toggled
                                KeyPicker:DoClick()
                            end;
                        elseif Input.UserInputType == Enum.UserInputType.Keyboard then
                            if Input.KeyCode.Name == Key then
                                KeyPicker.Toggled = not KeyPicker.Toggled;
                                KeyPicker:DoClick()
                            end;
                        end;
                    elseif KeyPicker.Mode == 'Hold' and KeyPicker.SyncToggleState and ParentObj.Type == 'Toggle' then
                        local Key = KeyPicker.Value
                        local Match = false
                        if Key == 'MB1' and Input.UserInputType == Enum.UserInputType.MouseButton1 then Match = true
                        elseif Key == 'MB2' and Input.UserInputType == Enum.UserInputType.MouseButton2 then Match = true
                        elseif Key == 'MB3' and Input.UserInputType == Enum.UserInputType.MouseButton3 then Match = true
                        elseif Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Key then Match = true
                        end
                        if Match then
                            KeyPicker.Toggled = true
                            ParentObj:SetValue(true)
                        end
                    end;

                    KeyPicker:Update();
                end;

                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local AbsPos, AbsSize = ModeSelectOuter.AbsolutePosition, ModeSelectOuter.AbsoluteSize;

                    if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                        or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                        ModeSelectOuter.Visible = false;
                    end;
                end;
            end))

            local function KeyMatchesInput(Input)
                local Key = KeyPicker.Value
                if not Key or Key == 'None' or Key == '...' then return false end
                if Key == 'MB1' then return Input.UserInputType == Enum.UserInputType.MouseButton1 end
                if Key == 'MB2' then return Input.UserInputType == Enum.UserInputType.MouseButton2 end
                if Key == 'MB3' then return Input.UserInputType == Enum.UserInputType.MouseButton3 end
                if Input.UserInputType == Enum.UserInputType.Keyboard then
                    return Input.KeyCode.Name == Key
                end
                return false
            end

            Library:GiveSignal(UserInputService.InputEnded:Connect(function(Input)
                if (not Picking) then
                    if KeyPicker.Mode == 'Hold' and KeyPicker.SyncToggleState and ParentObj.Type == 'Toggle' then
                        if KeyMatchesInput(Input) then
                            KeyPicker.Toggled = false
                            ParentObj:SetValue(false)
                        end
                    end
                    KeyPicker:Update();
                end;
            end))

            KeyPicker:Update();

            Options[Idx] = KeyPicker;

            return self;
        end;

        BaseAddons.__index = Funcs;
        BaseAddons.__namecall = function(Table, Key, ...)
            return Funcs[Key](...);
        end;
    end;

    local BaseGroupbox = {};

    do
        local Funcs = {};

        function Funcs:AddBlank(Size)
            local Groupbox = self;
            local Container = Groupbox.Container;

            Library:Create('Frame', {
                BackgroundTransparency = 1;
                Size = API.UDim2New(1, 0, 0, Size);
                ZIndex = 1;
                Parent = Container;
            });
        end;

        function Funcs:AddLabel(Text, DoesWrap)
            local Label = {};

            local Groupbox = self;
            local Container = Groupbox.Container;

            local TextLabel = Library:CreateLabel({
                Size = API.UDim2New(1, -4, 0, 15);
                TextSize = 15;
                Text = Text;
                TextWrapped = DoesWrap or false,
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 5;
                Parent = Container;
            });

            if DoesWrap then
                local Y = API.Select(2, Library:GetTextBounds(Text, Library.Font, 15, API.Vector2New(TextLabel.AbsoluteSize.X, math.huge)))
                TextLabel.Size = API.UDim2New(1, -4, 0, Y)
            else
                Library:Create('UIListLayout', {
                    Padding = API.UDimNew(0, 4);
                    FillDirection = Enum.FillDirection.Horizontal;
                    HorizontalAlignment = Enum.HorizontalAlignment.Right;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = TextLabel;
                });
            end

            Label.TextLabel = TextLabel;
            Label.Container = Container;

            function Label:SetText(Text)
                TextLabel.Text = Text

                if DoesWrap then
                    local Y = API.Select(2, Library:GetTextBounds(Text, Library.Font, 15, API.Vector2New(TextLabel.AbsoluteSize.X, math.huge)))
                    TextLabel.Size = API.UDim2New(1, -4, 0, Y)
                end

                Groupbox:Resize();
            end

            if (not DoesWrap) then
                setmetatable(Label, BaseAddons);
            end

            Groupbox:AddBlank(5);
            Groupbox:Resize();

            return Label;
        end;

        function Funcs:AddButton(...)
            local Button = {};
            function ProcessButtonParams(Class, Obj, ...)
                local Props = API.Select(1, ...)
                if API.Type(Props) == 'table' then
                    Obj.Text = Props.Text
                    Obj.Func = Props.Func
                    Obj.DoubleClick = Props.DoubleClick
                    Obj.Tooltip = Props.Tooltip
                else
                    Obj.Text = API.Select(1, ...)
                    Obj.Func = API.Select(2, ...)
                end

                assert(API.Type(Obj.Func) == 'function', 'AddButton: `Func` callback is missing.');
            end

            ProcessButtonParams('Button', Button, ...)

            local Groupbox = self;
            local Container = Groupbox.Container;

            function CreateBaseButton(Button)
                local Outer = Library:Create('Frame', {
                    BackgroundColor3 = API.Color3New(0, 0, 0);
                    BorderColor3 = API.Color3New(0, 0, 0);
                    BorderSizePixel = 0;
                    Size = API.UDim2New(1, -4, 0, 20);
                    ZIndex = 5;
                });

                local Inner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = API.UDim2New(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = Outer;
                });

                local Label = Library:CreateLabel({
                    Size = API.UDim2New(1, 0, 1, 0);
                    TextSize = 15;
                    Text = Button.Text;
                    ZIndex = 6;
                    Parent = Inner;
                });

                Library:Create('UIGradient', {
                    Color = API.ColorSequenceNew({
                        API.ColorSequenceKeypointNew(0, API.Color3New(1, 1, 1)),
                        API.ColorSequenceKeypointNew(1, API.Color3FromRGB(212, 212, 212))
                    });
                    Rotation = 90;
                    Parent = Inner;
                });

                Library:AddToRegistry(Outer, {
                    BorderColor3 = 'Black';
                });

                Library:AddToRegistry(Inner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                Library:OnHighlight(Outer, Outer,
                    { BorderColor3 = 'AccentColor', BorderSizePixel = 1 },
                    { BorderColor3 = 'Black', BorderSizePixel = 0 }
                );

                return Outer, Inner, Label
            end

            function InitEvents(Button)
                function WaitForEvent(event, timeout, validator)
                    local bindable = API.Instancenew('BindableEvent')
                    local connection = event:Once(function(...)

                        if API.Type(validator) == 'function' and validator(...) then
                            bindable:Fire(true)
                        else
                            bindable:Fire(false)
                        end
                    end)
                    task.delay(timeout, function()
                        connection:disconnect()
                        bindable:Fire(false)
                    end)
                    return bindable.Event:Wait()
                end

                function ValidateClick(Input)
                    if Library:MouseIsOverOpenedFrame() then
                        return false
                    end

                    if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        return false
                    end

                    return true
                end

                Button.Outer.InputBegan:Connect(function(Input)
                    if not ValidateClick(Input) then return end
                    if Button.Locked then return end

                    if Button.DoubleClick then
                        Library:RemoveFromRegistry(Button.Label)
                        Library:AddToRegistry(Button.Label, { TextColor3 = 'AccentColor' })

                        Button.Label.TextColor3 = Library.AccentColor
                        Button.Label.Text = 'Are you sure?'
                        Button.Locked = true

                        local clicked = WaitForEvent(Button.Outer.InputBegan, 1, ValidateClick)

                        Library:RemoveFromRegistry(Button.Label)
                        Library:AddToRegistry(Button.Label, { TextColor3 = 'FontColor' })

                        Button.Label.TextColor3 = Library.FontColor
                        Button.Label.Text = Button.Text
                        task.defer(rawset, Button, 'Locked', false)

                        if clicked then
                            Library:SafeCallback(Button.Func)
                        end

                        return
                    end

                    Library:SafeCallback(Button.Func);
                end)
            end

            Button.Outer, Button.Inner, Button.Label = CreateBaseButton(Button)
            Button.Outer.Parent = Container

            InitEvents(Button)

            function Button:AddTooltip(tooltip)
                if API.Type(tooltip) == 'string' then
                    Library:AddToolTip(tooltip, self.Outer)
                end
                return self
            end

            function Button:AddButton(...)
                local SubButton = {}

                ProcessButtonParams('SubButton', SubButton, ...)

                self.Outer.Size = API.UDim2New(0.5, -2, 0, 20)

                SubButton.Outer, SubButton.Inner, SubButton.Label = CreateBaseButton(SubButton)

                SubButton.Outer.Position = API.UDim2New(1, 3, 0, 0)
                SubButton.Outer.Size = API.UDim2New(1, 0, 1, 0)
                SubButton.Outer.Parent = self.Outer

                function SubButton:AddTooltip(tooltip)
                    if API.Type(tooltip) == 'string' then
                        Library:AddToolTip(tooltip, self.Outer)
                    end
                    return SubButton
                end

                if API.Type(SubButton.Tooltip) == 'string' then
                    SubButton:AddTooltip(SubButton.Tooltip)
                end

                InitEvents(SubButton)
                return SubButton
            end

            if API.Type(Button.Tooltip) == 'string' then
                Button:AddTooltip(Button.Tooltip)
            end

            Groupbox:AddBlank(5);
            Groupbox:Resize();

            return Button;
        end;

        function Funcs:AddDivider()
            local Groupbox = self;
            local Container = self.Container

            local Divider = {
                Type = 'Divider',
            }

            Groupbox:AddBlank(2);
            local DividerOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Size = API.UDim2New(1, -4, 0, 5);
                ZIndex = 5;
                Parent = Container;
            });

            local DividerInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 6;
                Parent = DividerOuter;
            });

            Library:AddToRegistry(DividerOuter, {
                BorderColor3 = 'Black';
            });

            Library:AddToRegistry(DividerInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            Groupbox:AddBlank(9);
            Groupbox:Resize();
        end

        function Funcs:AddInput(Idx, Info)
            assert(Info.Text, 'AddInput: Missing `Text` string.')

            local Textbox = {
                Value = Info.Default or '';
                Numeric = Info.Numeric or false;
                Finished = Info.Finished or false;
                Type = 'Input';
                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Value) end;
            };

            local Groupbox = self;
            local Container = Groupbox.Container;

            local InputLabel = Library:CreateLabel({
                Size = API.UDim2New(1, 0, 0, 15);
                TextSize = 15;
                Text = Info.Text;
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 5;
                Parent = Container;
            });

            Groupbox:AddBlank(1);

            local TextBoxOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Size = API.UDim2New(1, -4, 0, 18);
                ZIndex = 5;
                Parent = Container;
            });

            local TextBoxInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 6;
                Parent = TextBoxOuter;
            });

            Library:AddToRegistry(TextBoxInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            Library:OnHighlight(TextBoxOuter, TextBoxOuter,
                { BorderColor3 = 'AccentColor' },
                { BorderColor3 = 'Black' }
            );

            if API.Type(Info.Tooltip) == 'string' then
                Library:AddToolTip(Info.Tooltip, TextBoxOuter)
            end

            Library:Create('UIGradient', {
                Color = API.ColorSequenceNew({
                    API.ColorSequenceKeypointNew(0, API.Color3New(1, 1, 1)),
                    API.ColorSequenceKeypointNew(1, API.Color3FromRGB(212, 212, 212))
                });
                Rotation = 90;
                Parent = TextBoxInner;
            });

            local Container = Library:Create('Frame', {
                BackgroundTransparency = 1;
                ClipsDescendants = true;

                Position = API.UDim2New(0, 5, 0, 0);
                Size = API.UDim2New(1, -5, 1, 0);

                ZIndex = 7;
                Parent = TextBoxInner;
            })

            local Box = Library:Create('TextBox', {
                BackgroundTransparency = 1;

                Position = API.UDim2fromOffset(0, 0),
                Size = UDim2.fromScale(5, 1),

                Font = Library.Font;
                PlaceholderColor3 = API.Color3FromRGB(190, 190, 190);
                PlaceholderText = Info.Placeholder or '';

                Text = Info.Default or '';
                TextColor3 = Library.FontColor;
                TextSize = 15;
                TextStrokeTransparency = 1;
                TextXAlignment = Enum.TextXAlignment.Left;

                ZIndex = 7;
                Parent = Container;
            });

            function Textbox:SetValue(Text)
                if Info.MaxLength and #Text > Info.MaxLength then
                    Text = Text:sub(1, Info.MaxLength);
                end;

                if Textbox.Numeric then
                    if (not API.tonumber(Text)) and Text:len() > 0 then
                        Text = Textbox.Value
                    end
                end

                Textbox.Value = Text;
                Box.Text = Text;

                Library:SafeCallback(Textbox.Callback, Textbox.Value);
                Library:SafeCallback(Textbox.Changed, Textbox.Value);
            end;

            if Textbox.Finished then
                Box.FocusLost:Connect(function(enter)
                    if not enter then return end

                    Textbox:SetValue(Box.Text);
                    Library:AttemptSave();
                end)
            else
                API.GetPropertyChangedSignal(Box,'Text'):Connect(function()
                    Textbox:SetValue(Box.Text);
                    Library:AttemptSave();
                end);
            end

            function Update()
                local PADDING = 2
                local reveal = Container.AbsoluteSize.X

                if not Box:IsFocused() or Box.TextBounds.X <= reveal - 2 * PADDING then
                    Box.Position = API.UDim2New(0, PADDING, 0, 0)
                else
                    local cursor = Box.CursorPosition
                    if cursor ~= -1 then
                        local subtext = API.StringSub(Box.Text, 1, cursor-1)
                        local width = TextService:GetTextSize(subtext, Box.TextSize, Box.Font, API.Vector2New(math.huge, math.huge)).X

                        local currentCursorPos = Box.Position.X.Offset + width

                        if currentCursorPos < PADDING then
                            Box.Position = API.UDim2fromOffset(PADDING-width, 0)
                        elseif currentCursorPos > reveal - PADDING - 1 then
                            Box.Position = API.UDim2fromOffset(reveal-width-PADDING-1, 0)
                        end
                    end
                end
            end

            API.TaskSpawn(Update)

            API.GetPropertyChangedSignal(Box, 'Text'):Connect(Update)
            API.GetPropertyChangedSignal(Box, 'CursorPosition'):Connect(Update)
            Box.FocusLost:Connect(Update)
            Box.Focused:Connect(Update)

            Library:AddToRegistry(Box, {
                TextColor3 = 'FontColor';
            });

            function Textbox:OnChanged(Func)
                Textbox.Changed = Func;
                Func(Textbox.Value);
            end;

            Groupbox:AddBlank(5);
            Groupbox:Resize();

            Options[Idx] = Textbox;

            return Textbox;
        end;

        function Funcs:AddToggle(Idx, Info)
            assert(Info.Text, 'AddInput: Missing `Text` string.')

            local Toggle = {
                Value = Info.Default or false;
                Type = 'Toggle';

                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Value) end;
                Addons = {},
                Risky = Info.Risky,
            };

            local Groupbox = self;
            local Container = Groupbox.Container;

            local ToggleOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Size = API.UDim2New(0, 13, 0, 13);
                ZIndex = 5;
                Parent = Container;
            });

            Library:AddToRegistry(ToggleOuter, {
                BorderColor3 = 'Black';
            });

            local ToggleInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 6;
                Parent = ToggleOuter;
            });

            Library:AddToRegistry(ToggleInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            local ToggleLabel = Library:CreateLabel({
                Size = API.UDim2New(0, 216, 1, 0);
                Position = API.UDim2New(1, 6, 0, 0);
                TextSize = 15;
                Text = Info.Text;
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 6;
                Parent = ToggleInner;
            });  

            Library:Create('UIListLayout', {
                Padding = API.UDimNew(0, 4);
                FillDirection = Enum.FillDirection.Horizontal;
                HorizontalAlignment = Enum.HorizontalAlignment.Right;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = ToggleLabel;
            });

            local ToggleRegion = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Size = API.UDim2New(0, 170, 1, 0);
                ZIndex = 8;
                Parent = ToggleOuter;
            });

            Library:OnHighlight(ToggleRegion, ToggleOuter,
                { BorderColor3 = 'AccentColor', BorderSizePixel = 1 },
                { BorderColor3 = 'Black', BorderSizePixel = 0 }
            );

            function Toggle:UpdateColors()
                Toggle:Display();
            end;

            if API.Type(Info.Tooltip) == 'string' then
                Library:AddToolTip(Info.Tooltip, ToggleRegion)
            end

            function Toggle:Display()
                ToggleInner.BackgroundColor3 = Toggle.Value and Library.AccentColor or Library.MainColor;
                ToggleInner.BorderColor3 = Toggle.Value and Library.AccentColorDark or Library.OutlineColor;

                Library.RegistryMap[ToggleInner].Properties.BackgroundColor3 = Toggle.Value and 'AccentColor' or 'MainColor';
                Library.RegistryMap[ToggleInner].Properties.BorderColor3 = Toggle.Value and 'AccentColorDark' or 'OutlineColor';
            end;

            function Toggle:OnChanged(Func)
                Toggle.Changed = Func;
                Func(Toggle.Value);
            end;

            function Toggle:SetValue(Bool)
                Bool = (not not Bool);

                Toggle.Value = Bool;
                Toggle:Display();

                for _, Addon in next, Toggle.Addons do
                    if Addon.Type == 'KeyPicker' and Addon.SyncToggleState then
                        Addon.Toggled = Bool
                        Addon:Update()
                    end
                end

                Library:SafeCallback(Toggle.Callback, Toggle.Value);
                Library:SafeCallback(Toggle.Changed, Toggle.Value);
                Library:UpdateDependencyBoxes();
            end;

            ToggleRegion.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                    Toggle:SetValue(not Toggle.Value)
                    Library:AttemptSave();
                end;
            end);

            if Toggle.Risky then
                Library:RemoveFromRegistry(ToggleLabel)
                Toggle.TextLabel = ToggleLabel
                ToggleLabel.TextColor3 = Library.RiskColor or Color3.fromRGB(255, 36, 36)
                Library:AddToRegistry(ToggleLabel, { TextColor3 = 'RiskColor' })
            end

            Toggle:Display();
            Groupbox:AddBlank(Info.BlankSize or 5 + 2);
            Groupbox:Resize();

            Toggle.TextLabel = ToggleLabel;
            Toggle.Container = Container;
            setmetatable(Toggle, BaseAddons);

            Toggles[Idx] = Toggle;

            Library:UpdateDependencyBoxes();

            return Toggle;
        end;

        function Funcs:AddSlider(Idx, Info)
            assert(Info.Default, 'AddSlider: Missing default value.');
            assert(Info.Text, 'AddSlider: Missing slider text.');
            assert(Info.Min, 'AddSlider: Missing minimum value.');
            assert(Info.Max, 'AddSlider: Missing maximum value.');
            assert(Info.Rounding, 'AddSlider: Missing rounding value.');

            local Rounding = tonumber(Info.Rounding) or 0
            local Increment = tonumber(Info.Increment)
            if not Increment or Increment <= 0 then
                if Rounding <= 0 then
                    Increment = 1
                else
                    Increment = 1 / (10 ^ Rounding)
                end
            end

            local Slider = {
                Value = Info.Default;
                Min = Info.Min;
                Max = Info.Max;
                Rounding = Rounding;
                Increment = Increment;
                MaxSize = 238;
                Type = 'Slider';
                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Value) end;
            };

            local Groupbox = self;
            local Container = Groupbox.Container;

            if not Info.Compact then
                local Label = Library:CreateLabel({
                    Size = API.UDim2New(1, 0, 0, 10);
                    TextSize = 15;
                    Text = Info.Text;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextYAlignment = Enum.TextYAlignment.Bottom;
                    ZIndex = 5;
                    Parent = Container;
                });

                local DisplayLabelPlus = Library:CreateLabel({
                    Size = API.UDim2New(0.05, 0, 0, 10);
                    Position = API.UDim2New(0.92, 0, 0, 0);
                    TextYAlignment = Enum.TextYAlignment.Bottom;
                    TextSize = 14;
                    Text = '+';
                    ZIndex = 10;
                    Parent = Label;
                });
                local DisplayLabelMinus = Library:CreateLabel({
                    Size = API.UDim2New(0.05, 0, 0, 10);
                    Position = API.UDim2New(0.88,0,0,0);
                    TextYAlignment = Enum.TextYAlignment.Bottom;
                    TextSize = 14;
                    Text = '-';
                    ZIndex = 10;
                    Parent = Label;
                });
                Library:AddToRegistry(DisplayLabelPlus, {
                    TextColor3 = 'FontColorDark';
                });
                Library:AddToRegistry(DisplayLabelMinus, {
                    TextColor3 = 'FontColorDark';
                });

                Library:OnHighlight(DisplayLabelPlus, DisplayLabelPlus,
                    { TextColor3 = 'AccentColor' },
                    { TextColor3 = 'FontColorDark' }
                );
                Library:OnHighlight(DisplayLabelMinus, DisplayLabelMinus,
                    { TextColor3 = 'AccentColor' },
                    { TextColor3 = 'FontColorDark' }
                );

                DisplayLabelMinus.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        Slider:SetValue(Slider.Value - Slider.Increment)
                    end
                end)
                DisplayLabelPlus.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        Slider:SetValue(Slider.Value + Slider.Increment)
                    end
                end)

                Groupbox:AddBlank(3);
            end

            local SliderOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Size = API.UDim2New(1, -4, 0, 12);
                ZIndex = 5;
                Parent = Container;
            });

            Library:AddToRegistry(SliderOuter, {
                BorderColor3 = 'Black';
            });

            local SliderInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 6;
                Parent = SliderOuter;
            });

            Library:AddToRegistry(SliderInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            local Fill = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor;
                BorderColor3 = Library.AccentColorDark;
                Size = API.UDim2New(0, 0, 1, 0);
                ZIndex = 7;
                Parent = SliderInner;
            });

            Library:AddToRegistry(Fill, {
                BackgroundColor3 = 'AccentColor';
                BorderColor3 = 'AccentColorDark';
            });

            local HideBorderRight = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor;
                BorderSizePixel = 0;
                Position = API.UDim2New(1, 0, 0, 0);
                Size = API.UDim2New(0, 1, 1, 0);
                ZIndex = 8;
                Parent = Fill;
            });

            Library:AddToRegistry(HideBorderRight, {
                BackgroundColor3 = 'AccentColor';
            });

            local DisplayLabel = Library:CreateLabel({
                Size = API.UDim2New(1, 0, 1, 0);
                TextSize = 13;
                Text = 'Infinite';
                ZIndex = 9;
                Parent = SliderInner;
            });

            Library:OnHighlight(SliderOuter, SliderOuter,
                { BorderColor3 = 'AccentColor', BorderSizePixel = 1 },
                { BorderColor3 = 'Black', BorderSizePixel = 0 }
            );

            if API.Type(Info.Tooltip) == 'string' then
                Library:AddToolTip(Info.Tooltip, SliderOuter)
            end

            function Slider:UpdateColors()
                Fill.BackgroundColor3 = Library.AccentColor;
                Fill.BorderColor3 = Library.AccentColorDark;
            end;

            function Slider:UpdateMaxSize()
                local W = SliderInner.AbsoluteSize.X
                if type(W) == "number" and W > 1 then
                    Slider.MaxSize = math.max(1, math.floor(W + 0.5))
                end
            end

            function Slider:Display()
                Slider:UpdateMaxSize()
                local Suffix = Info.Suffix or '';
                local Decimals = tonumber(Slider.Rounding) or 0
                local ValueText
                if Decimals <= 0 then
                    ValueText = tostring(math.floor(Slider.Value + 0.5))
                else
                    ValueText = string.format('%.' .. tostring(Decimals) .. 'f', Slider.Value)
                end

                if Info.Compact then
                    DisplayLabel.Text = Info.Text .. ': ' .. ValueText .. Suffix
                else
                    DisplayLabel.Text = ValueText .. Suffix
                end

                local MaxS = Slider.MaxSize
                if MaxS < 1 then MaxS = 1 end
                local X = math.floor(Library:MapValue(Slider.Value, Slider.Min, Slider.Max, 0, MaxS) + 0.5);
                if X < 0 then X = 0 end
                if X > MaxS then X = MaxS end
                Fill.Size = API.UDim2New(0, X, 1, 0);

                HideBorderRight.Visible = not (X >= MaxS or X == 0);
            end;

            function Slider:OnChanged(Func)
                Slider.Changed = Func;
                Func(Slider.Value);
            end;

            local function SnapToIncrement(Value)
                local Step = Slider.Increment
                if type(Step) ~= "number" or Step <= 0 then
                    Step = 1
                end
                local Min = Slider.Min
                local Snapped = Min + math.floor(((Value - Min) / Step) + 0.5) * Step
                local Decimals = Slider.Rounding
                if type(Decimals) ~= "number" or Decimals < 0 then
                    Decimals = 0
                end
                if Decimals <= 0 then
                    Snapped = math.floor(Snapped + 0.5)
                else
                    local Mult = 10 ^ Decimals
                    Snapped = math.floor(Snapped * Mult + 0.5) / Mult
                end
                if Snapped < Slider.Min then Snapped = Slider.Min end
                if Snapped > Slider.Max then Snapped = Slider.Max end
                return Snapped
            end

            function Slider:GetStep()
                return Slider.Increment
            end

            function Slider:GetValueFromXOffset(X)
                local Raw = Library:MapValue(X, 0, Slider.MaxSize, Slider.Min, Slider.Max)
                if type(Raw) ~= "number" or Raw ~= Raw then
                    return Slider.Min
                end
                return SnapToIncrement(Raw)
            end

            function Slider:SetValue(Str)
                local Num = type(Str) == "number" and Str or tonumber(Str)
                if type(Num) ~= "number" or Num ~= Num then
                    return
                end
                Num = SnapToIncrement(Num)
                Slider.Value = Num
                Slider:Display()
                Library:SafeCallback(Slider.Callback, Slider.Value)
                Library:SafeCallback(Slider.Changed, Slider.Value)
            end

            pcall(function()
                SliderInner:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    Slider:Display()
                end)
            end)

            SliderInner.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                    Slider:UpdateMaxSize()
                    local mPos = Mouse.X;
                    local gPos = Fill.Size.X.Offset;
                    local Diff = mPos - (Fill.AbsolutePosition.X + gPos);

                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local nMPos = Mouse.X;
                        local nX = API.MathClamp(gPos + (nMPos - mPos) + Diff, 0, Slider.MaxSize);

                        local nValue = Slider:GetValueFromXOffset(nX);
                        if nValue ~= Slider.Value then
                            Slider:SetValue(nValue);
                        else
                            Slider:Display();
                        end

                        RenderStepped:Wait();
                    end;

                    Library:AttemptSave();
                end;
            end);

            Slider:Display();
            Groupbox:AddBlank(Info.BlankSize or 6);
            Groupbox:Resize();

            Options[Idx] = Slider;

            return Slider;
        end;

        function Funcs:AddDropdown(Idx, Info)
            if Info.SpecialType == 'Player' then
                Info.Values = GetPlayersString();
                Info.AllowNull = true;
            elseif Info.SpecialType == 'Team' then
                Info.Values = GetTeamsString();
                Info.AllowNull = true;
            end;

            assert(Info.Values, 'AddDropdown: Missing dropdown value list.');
            assert(Info.AllowNull or Info.Default, 'AddDropdown: Missing default value. Pass `AllowNull` as true if this was intentional.')

            if (not Info.Text) then
                Info.Compact = true;
            end

            local Dropdown = {
                Values = Info.Values;
                Value = Info.Multi and {};
                Multi = Info.Multi;
                Type = 'Dropdown';
                SpecialType = Info.SpecialType;
                Callback = (type(Info.Callback) == "function" and Info.Callback) or function(Value) end;
            };

            local Groupbox = self;
            local Container = Groupbox.Container;

            local RelativeOffset = 0;

            if not Info.Compact then
                local DropdownLabel = Library:CreateLabel({
                    Size = API.UDim2New(1, 0, 0, 10);
                    TextSize = 15;
                    Text = Info.Text;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextYAlignment = Enum.TextYAlignment.Bottom;
                    ZIndex = 5;
                    Parent = Container;
                });

                Groupbox:AddBlank(3);
            end

            for _, Element in next, API.GetChildren(Container) do
                if not API.IsA(Element, 'UIListLayout') then
                    RelativeOffset = RelativeOffset + Element.Size.Y.Offset;
                end;
            end;

            local DropdownOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                Size = API.UDim2New(1, -4, 0, 18);
                ZIndex = 5;
                Parent = Container;
            });

            Library:AddToRegistry(DropdownOuter, {
                BorderColor3 = 'Black';
            });

            local DropdownInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 6;
                Parent = DropdownOuter;
            });

            Library:AddToRegistry(DropdownInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            Library:Create('UIGradient', {
                Color = API.ColorSequenceNew({
                    API.ColorSequenceKeypointNew(0, API.Color3New(1, 1, 1)),
                    API.ColorSequenceKeypointNew(1, API.Color3FromRGB(212, 212, 212))
                });
                Rotation = 90;
                Parent = DropdownInner;
            });

            local DropdownArrow = Library:CreateLabel({
                AnchorPoint = API.Vector2New(0, 0.5);
                BackgroundTransparency = 1;
                Position = API.UDim2New(1, -16, 0.5, 0);
                Size = API.UDim2New(0, 12, 0, 12);
                TextSize = 14;
                Text = "+";
                ZIndex = 8;
                Parent = DropdownInner;
            });

            local ItemList = Library:CreateLabel({
                Position = API.UDim2New(0, 5, 0, 0);
                Size = API.UDim2New(1, -5, 1, 0);
                TextSize = 15;
                Text = '--';
                TextXAlignment = Enum.TextXAlignment.Left;
                TextWrapped = true;
                ZIndex = 7;
                Parent = DropdownInner;
            });

            Library:OnHighlight(DropdownOuter, DropdownOuter,
                { BorderColor3 = 'AccentColor', BorderSizePixel = 1 },
                { BorderColor3 = 'Black', BorderSizePixel = 0 }
            );

            if API.Type(Info.Tooltip) == 'string' then
                Library:AddToolTip(Info.Tooltip, DropdownOuter)
            end

            local MAX_DROPDOWN_ITEMS = 8;

            local ListOuter = Library:Create('Frame', {
                BackgroundColor3 = API.Color3New(0, 0, 0);
                BorderColor3 = API.Color3New(0, 0, 0);
                BorderSizePixel = 0;
                ZIndex = 20;
                Visible = false;
                Parent = ScreenGui;
            });

            function RecalculateListPosition()
                ListOuter.Position = API.UDim2fromOffset(DropdownOuter.AbsolutePosition.X, DropdownOuter.AbsolutePosition.Y + DropdownOuter.Size.Y.Offset + 1);
            end;

            function RecalculateListSize(YSize)
                ListOuter.Size = API.UDim2fromOffset(DropdownOuter.AbsoluteSize.X, YSize or (MAX_DROPDOWN_ITEMS * 20 + 2))
            end;

            RecalculateListPosition();
            RecalculateListSize();

            API.GetPropertyChangedSignal(DropdownOuter, 'AbsolutePosition'):Connect(RecalculateListPosition);

            local ListInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                BorderSizePixel = 0;
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 21;
                Parent = ListOuter;
            });

            Library:AddToRegistry(ListInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            local Scrolling = Library:Create('ScrollingFrame', {
                BackgroundTransparency = 1;
                BorderSizePixel = 0;
                CanvasSize = API.UDim2New(0, 0, 0, 0);
                Size = API.UDim2New(1, 0, 1, 0);
                ZIndex = 21;
                Parent = ListInner;

                TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png',
                BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png',

                ScrollBarThickness = 3,
                ScrollBarImageColor3 = Library.AccentColor,
            });

            Library:AddToRegistry(Scrolling, {
                ScrollBarImageColor3 = 'AccentColor'
            })

            Library:Create('UIListLayout', {
                Padding = API.UDimNew(0, 0);
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                HorizontalAlignment = Enum.HorizontalAlignment.Center;
                Parent = Scrolling;
            });
            function Dropdown:Display()
                local Values = Dropdown.Values;
                local Str = '';

                if Info.Multi then
                    for Idx, Value in next, Values do
                        if Dropdown.Value[Value] then
                            Str = Str .. Value .. ', ';
                        end;
                    end;

                    Str = Str:sub(1, #Str - 2);
                else
                    Str = Dropdown.Value or '';
                end;

                ItemList.Text = (Str == '' and '--' or Str);
            end;

            function Dropdown:GetActiveValues()
                if Info.Multi then
                    local T = {};

                    for Value, Bool in next, Dropdown.Value do
                        API.TableInsert(T, Value);
                    end;

                    return T;
                else
                    return Dropdown.Value and 1 or 0;
                end;
            end;

            function Dropdown:BuildDropdownList()
                local Values = Dropdown.Values;
                local Buttons = {};

                for _, Element in next, API.GetChildren(Scrolling) do
                    if not API.IsA(Element, 'UIListLayout') then
                        API.Destroy(Element);
                    end;
                end;

                local Count = 0;

                for Idx, Value in next, Values do
                    local Table = {};

                    Count = Count + 1;

                    local Button = Library:Create('Frame', {
                        BackgroundColor3 = Library.MainColor;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Middle;
                        Size = API.UDim2New(1, -5, 0, 20);
                        ZIndex = 23;
                        Active = true,
                        Parent = Scrolling;
                    });

                    Library:AddToRegistry(Button, {
                        BackgroundColor3 = 'MainColor';
                        BorderColor3 = 'OutlineColor';
                    });

                    local ButtonLabel = Library:CreateLabel({
                        Active = false;
                        Size = API.UDim2New(1, -6, 1, 0);
                        Position = API.UDim2New(0, 6, 0, 0);
                        TextSize = 15;
                        Text = Value;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        ZIndex = 25;
                        Parent = Button;
                    });

                    Library:OnHighlight(Button, Button,
                        { BorderColor3 = 'AccentColor', ZIndex = 24 },
                        { BorderColor3 = 'OutlineColor', ZIndex = 23 }
                    );

                    local Selected;

                    if Info.Multi then
                        Selected = Dropdown.Value[Value];
                    else
                        Selected = Dropdown.Value == Value;
                    end;

                    function Table:UpdateButton()
                        if Info.Multi then
                            Selected = Dropdown.Value[Value];
                        else
                            Selected = Dropdown.Value == Value;
                        end;

                        ButtonLabel.TextColor3 = Selected and Library.AccentColor or Library.FontColor;
                        Library.RegistryMap[ButtonLabel].Properties.TextColor3 = Selected and 'AccentColor' or 'FontColor';
                    end;

                    ButtonLabel.InputBegan:Connect(function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            local Try = not Selected;

                            if Dropdown:GetActiveValues() == 1 and (not Try) and (not Info.AllowNull) then
                            else
                                if Info.Multi then
                                    Selected = Try;

                                    if Selected then
                                        Dropdown.Value[Value] = true;
                                    else
                                        Dropdown.Value[Value] = nil;
                                    end;
                                else
                                    Selected = Try;

                                    if Selected then
                                        Dropdown.Value = Value;
                                    else
                                        Dropdown.Value = nil;
                                    end;

                                    for _, OtherButton in next, Buttons do
                                        OtherButton:UpdateButton();
                                    end;
                                end;

                                Table:UpdateButton();
                                Dropdown:Display();

                                Library:SafeCallback(Dropdown.Callback, Dropdown.Value);
                                Library:SafeCallback(Dropdown.Changed, Dropdown.Value);

                                Library:AttemptSave();
                            end;
                        end;
                    end);

                    Table:UpdateButton();
                    Dropdown:Display();

                    Buttons[Button] = Table;
                end;

                Scrolling.CanvasSize = API.UDim2fromOffset(0, (Count * 20) + 1);

                local Y = API.MathClamp(Count * 20, 0, MAX_DROPDOWN_ITEMS * 20) + 1;
                RecalculateListSize(Y);
            end;

            function Dropdown:SetValues(NewValues)
                local previous = Dropdown.Value

                if NewValues then
                    Dropdown.Values = NewValues
                end

                Dropdown:BuildDropdownList()

                if Dropdown.Multi then
                    Dropdown:SetValue(previous or {})
                else
                    if previous and API.TableFind(Dropdown.Values, previous) then
                        Dropdown:SetValue(previous)
                    else
                        if Info.AllowNull then
                            Dropdown:SetValue(nil)
                        elseif Dropdown.Values[1] then
                            Dropdown:SetValue(Dropdown.Values[1])
                        end
                    end
                end
            end

            function Dropdown:OpenDropdown()
                ListOuter.Visible = true;
                Library.OpenedFrames[ListOuter] = true;
                DropdownArrow.Text = "-";
            end;

            function Dropdown:CloseDropdown()
                ListOuter.Visible = false;
                Library.OpenedFrames[ListOuter] = nil;
                DropdownArrow.Text = "+";
            end;

            function Dropdown:OnChanged(Func)
                Dropdown.Changed = Func;
                Func(Dropdown.Value);
            end;

            function Dropdown:SetValue(Val)
                if Dropdown.Multi then
                    local nTable = {};

                    for Value, Bool in next, Val do
                        if API.TableFind(Dropdown.Values, Value) then
                            nTable[Value] = true
                        end;
                    end;

                    Dropdown.Value = nTable;
                else
                    if (not Val) then
                        Dropdown.Value = nil;
                    elseif API.TableFind(Dropdown.Values, Val) then
                        Dropdown.Value = Val;
                    end;
                end;

                Dropdown:BuildDropdownList();

                Library:SafeCallback(Dropdown.Callback, Dropdown.Value);
                Library:SafeCallback(Dropdown.Changed, Dropdown.Value);
            end;

            DropdownOuter.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                    if ListOuter.Visible then
                        Dropdown:CloseDropdown();
                    else
                        Dropdown:OpenDropdown();
                    end;
                end;
            end);

            UserInputService.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local AbsPos, AbsSize = ListOuter.AbsolutePosition, ListOuter.AbsoluteSize;

                    if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                        or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                        Dropdown:CloseDropdown();
                    end;
                end;
            end);

            Dropdown:BuildDropdownList();
            Dropdown:Display();

            local Defaults = {}

            if API.Type(Info.Default) == 'string' then
                local Idx = API.TableFind(Dropdown.Values, Info.Default)
                if Idx then
                    API.TableInsert(Defaults, Idx)
                end
            elseif API.Type(Info.Default) == 'table' then
                for _, Value in next, Info.Default do
                    local Idx = API.TableFind(Dropdown.Values, Value)
                    if Idx then
                        API.TableInsert(Defaults, Idx)
                    end
                end
            elseif API.Type(Info.Default) == 'number' and Dropdown.Values[Info.Default] ~= nil then
                API.TableInsert(Defaults, Info.Default)
            end

            if next(Defaults) then
                for i = 1, #Defaults do
                    local Index = Defaults[i]
                    if Info.Multi then
                        Dropdown.Value[Dropdown.Values[Index]] = true
                    else
                        Dropdown.Value = Dropdown.Values[Index];
                    end

                    if (not Info.Multi) then break end
                end

                Dropdown:BuildDropdownList();
                Dropdown:Display();
            end

            Groupbox:AddBlank(Info.BlankSize or 5);
            Groupbox:Resize();

            Options[Idx] = Dropdown;

            return Dropdown;
        end;

        function Funcs:AddDependencyBox()
            local Depbox = {
                Dependencies = {};
            };

            local Groupbox = self;
            local Container = Groupbox.Container;

            local Holder = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Size = API.UDim2New(1, 0, 0, 0);
                Visible = false;
                Parent = Container;
            });

            local Frame = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Size = API.UDim2New(1, 0, 1, 0);
                Visible = true;
                Parent = Holder;
            });

            local Layout = Library:Create('UIListLayout', {
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = Frame;
            });

            function Depbox:Resize()
                Holder.Size = API.UDim2New(1, 0, 0, Layout.AbsoluteContentSize.Y);
                Groupbox:Resize();
            end;

            API.GetPropertyChangedSignal(Layout, 'AbsoluteContentSize'):Connect(function()
                Depbox:Resize();
            end);

            API.GetPropertyChangedSignal(Holder, 'Visible'):Connect(function()
                Depbox:Resize();
            end);

            local IsNotHidden = true
            function Depbox:Update()
                for _, Dependency in next, Depbox.Dependencies do
                    local Elem = Dependency[1];
                    local Value = Dependency[2];

                    if Elem.Type == 'Toggle' and Elem.Value ~= Value then
                        Holder.Visible = false;
                        Depbox:Resize();
                        return;
                    end;
                end;
                if IsNotHidden then
                    Holder.Visible = true;
                    Depbox:Resize();
                end
            end;

            function Depbox:SetupDependencies(Dependencies)
                for _, Dependency in next, Dependencies do
                    assert(API.Type(Dependency) == 'table', 'SetupDependencies: Dependency is not of API.Type `table`.');
                    assert(Dependency[1], 'SetupDependencies: Dependency is missing element argument.');
                    assert(Dependency[2] ~= nil, 'SetupDependencies: Dependency is missing value argument.');
                end;

                Depbox.Dependencies = Dependencies;
                Depbox:Update();
            end;

            function Depbox:Show()
                Holder.Visible = true
                IsNotHidden = true
            end

            function Depbox:Hide()
                Holder.Visible = false
                IsNotHidden = false
            end

            Depbox.Container = Frame;

            setmetatable(Depbox, BaseGroupbox);

            API.TableInsert(Library.DependencyBoxes, Depbox);

            return Depbox;
        end;

        BaseGroupbox.__index = Funcs;
        BaseGroupbox.__namecall = function(Table, Key, ...)
            return Funcs[Key](...);
        end;
    end;

    do
        Library.NotificationArea = Library:Create('Frame', {
            BackgroundTransparency = 1;
            Position = API.UDim2New(0, 0, 0, 40);
            Size = API.UDim2New(0, 300, 0, 200);
            ZIndex = 100;
            Parent = ScreenGui;
        });

        Library:Create('UIListLayout', {
            Padding = API.UDimNew(0, 4);
            FillDirection = Enum.FillDirection.Vertical;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Parent = Library.NotificationArea;
        });

        Library.NotificationAreaCenter = Library:Create('Frame', {
            BackgroundTransparency = 1;
            AnchorPoint = API.Vector2New(0.5,0);
            Position = API.UDim2New(0.5, 0, 0.75, 0);
            Size = API.UDim2New(0, 300, 0, 200);
            ZIndex = 100;
            Parent = ScreenGui;
        });
        Library:Create('UIListLayout', {
            Padding = API.UDimNew(0, 4);
            FillDirection = Enum.FillDirection.Vertical;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Parent = Library.NotificationAreaCenter;
        });

        local WatermarkOuter = Library:Create('Frame', {
            BorderColor3 = API.Color3New(0, 0, 0);
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 10, 0, 10);
            Size = API.UDim2New(0, 213, 0, 21);
            ZIndex = 200;
            Visible = false;
            Parent = ScreenGui;
        });

        local WatermarkInner = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor;
            BorderColor3 = Library.OutlineColor;
            BorderSizePixel = 1;
            Size = API.UDim2New(1, 0, 1, 0);
            ZIndex = 201;
            Parent = WatermarkOuter;
        });

        Library:AddToRegistry(WatermarkInner, {
            BackgroundColor3 = 'MainColor';
            BorderColor3 = 'OutlineColor';
        });

        local InnerFrame = Library:Create('Frame', {
            BackgroundColor3 = API.Color3New(1, 1, 1);
            BorderSizePixel = 0;
            BackgroundTransparency = 1;
            Position = API.UDim2New(0, 1, 0, 1);
            Size = API.UDim2New(1, -2, 1, -2);
            ZIndex = 202;
            Parent = WatermarkInner;
        });

        local FrameLine = Library:Create('Frame', {
            BorderColor3 = Library.AccentColor;
            BackgroundColor3 = Library.AccentColor;
            BorderSizePixel = 0;
            Position = API.UDim2New(0, -1, 1, 0);
            Size = API.UDim2New(1, 1, 0, 2);
            ZIndex = 202;
            Parent = WatermarkInner;
        });

        Library:AddToRegistry(FrameLine, {
            BorderColor3 = 'AccentColor';
            BackgroundColor3 = "AccentColor";
        });

        local WatermarkLabel = Library:CreateLabel({
            Position = API.UDim2New(0, 17, 0, 0);
            Size = API.UDim2New(1, -28, 1, 0);
            TextSize = 15;
            RichText = true;
            TextXAlignment = Enum.TextXAlignment.Left;
            ZIndex = 203;
            Parent = InnerFrame;
        });

        Library.Watermark = WatermarkOuter;
        Library.WatermarkText = WatermarkLabel;
        Library:MakeDraggable(Library.Watermark);

        local KeybindOuter = Library:Create('Frame', {
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 10, 0.5, 0);
            Size = API.UDim2New(0, 210, 0, 20);
            Visible = false;
            ZIndex = 100;
            Parent = ScreenGui;
        });

        local KeybindInner = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor;
            BorderColor3 = Library.OutlineColor;
            BorderMode = Enum.BorderMode.Inset;
            Size = API.UDim2New(1, 0, 1, 7);
            ZIndex = 101;
            Parent = KeybindOuter;
        });

        local KeybindBackground = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor;
            BorderColor3 = Library.OutlineColor;
            BorderMode = Enum.BorderMode.Inset;
            Size = API.UDim2New(1, 0, 0, 0);
            Position = API.UDim2New(0, 0, 0, 0);
            ZIndex = -1;
            Parent = KeybindOuter;
        });

        Library:AddToRegistry(KeybindInner, {
            BackgroundColor3 = 'MainColor';
            BorderColor3 = 'OutlineColor';
        }, true);

        Library:AddToRegistry(KeybindBackground, {
            BorderColor3 = 'OutlineColor';
            BackgroundColor3 = "MainColor";
        });

        local FrameLine2 = Library:Create('Frame', {
            BorderColor3 = Library.AccentColor;
            BackgroundColor3 = Library.AccentColor;
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 0, 0, 24);
            Size = API.UDim2New(1, 0, 0, 2);
            ZIndex = 202;
            Parent = KeybindInner;
        });

        Library:AddToRegistry(FrameLine2, {
            BorderColor3 = 'AccentColor';
            BackgroundColor3 = "AccentColor";
        });

        local KeybindLabel = Library:CreateLabel({
            Size = API.UDim2New(1, 0, 0, 20);
            Position = API.UDim2fromOffset(5, 2),
            TextXAlignment = Enum.TextXAlignment.Center,
            Text = 'Keybinds';
            ZIndex = 104;
            Parent = KeybindInner;
        });

        local KeybindContainer = Library:Create('Frame', {
            BackgroundTransparency = 1;
            Size = API.UDim2New(1, 0, 1, -20);
            Position = API.UDim2New(0, 0, 0, 30);
            ZIndex = 1;
            Parent = KeybindInner;
        });

        local KeyListLayout = Library:Create('UIListLayout', {
            FillDirection = Enum.FillDirection.Vertical;
            HorizontalAlignment = Enum.HorizontalAlignment.Left;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Padding = API.UDimNew(0, 5);
            Parent = KeybindContainer;
        });

        Library:Create('UIPadding', {
            PaddingLeft = API.UDimNew(0, 5),
            Parent = KeybindContainer,
        })

        Library.KeybindListMode = 1
        Library.KeybindBackground = KeybindBackground;
        Library.KeyUilistlayout = KeyListLayout;
        Library.KeybindFrame = KeybindOuter;
        Library.KeybindContainer = KeybindContainer;
        Library:MakeDraggable(KeybindOuter);

local SpecListOuter = Library:Create('Frame', {
			BorderSizePixel = 0;
			Position = API.UDim2New(1, -220, 0.3, 0);
			Size = API.UDim2New(0, 210, 0, 20);
			Visible = false;
			ZIndex = 100;
			Parent = ScreenGui;
		});

		local SpecListInner = Library:Create('Frame', {
			BackgroundColor3 = Library.MainColor;
			BorderColor3 = Library.OutlineColor;
			BorderMode = Enum.BorderMode.Inset;
			Size = API.UDim2New(1, 0, 1, 7);
			ZIndex = 101;
			Parent = SpecListOuter;
		});

		local SpecListBackground = Library:Create('Frame', {
			BackgroundColor3 = Library.MainColor;
			BorderColor3 = Library.OutlineColor;
			BorderMode = Enum.BorderMode.Inset;
			Size = API.UDim2New(1, 0, 0, 0);
			Position = API.UDim2New(0, 0, 0, 0);
			ZIndex = -1;
			Parent = SpecListOuter;
		});

		Library:AddToRegistry(SpecListInner, {
			BackgroundColor3 = 'MainColor';
			BorderColor3 = 'OutlineColor';
		}, true);

		Library:AddToRegistry(SpecListBackground, {
			BorderColor3 = 'OutlineColor';
			BackgroundColor3 = 'MainColor';
		});

		local FrameLine3 = Library:Create('Frame', {
			BorderColor3 = Library.AccentColor;
			BackgroundColor3 = Library.AccentColor;
			BorderSizePixel = 0;
			Position = API.UDim2New(0, 0, 0, 24);
			Size = API.UDim2New(1, 0, 0, 2);
			ZIndex = 202;
			Parent = SpecListInner;
		});

		Library:AddToRegistry(FrameLine3, {
			BorderColor3 = 'AccentColor';
			BackgroundColor3 = "AccentColor";
		});

		local SpecListLabel = Library:CreateLabel({
			Size = API.UDim2New(1, 0, 0, 20);
			Position = API.UDim2fromOffset(5, 2),
			TextXAlignment = Enum.TextXAlignment.Center,
			Text = 'Spectators List';
			ZIndex = 104;
			Parent = SpecListInner;
		});

		local SpecListContainer = Library:Create('Frame', {
			BackgroundTransparency = 1;
			Size = API.UDim2New(1, 0, 1, -20);
			Position = API.UDim2New(0, 0, 0, 30);
			ZIndex = 1;
			Parent = SpecListInner;
		});

		local ListLayout = Library:Create('UIListLayout', {
			FillDirection = Enum.FillDirection.Vertical;
			HorizontalAlignment = Enum.HorizontalAlignment.Left;
			SortOrder = Enum.SortOrder.LayoutOrder;
			Padding = API.UDimNew(0, 5);
			Parent = SpecListContainer;
		});

		Library:Create('UIPadding', {
			PaddingLeft = API.UDimNew(0, 5),
			Parent = SpecListContainer,
		})

		Library.SpecUIlistlayout = ListLayout;
		Library.SpecListBG = SpecListBackground;
		Library.SpecListFrame = SpecListOuter;
		Library.SpecListContainer = SpecListContainer;
		Library:MakeDraggable(SpecListOuter);

		local PlayersContainerLabels = {}

		function Library:UpdateSpecList(Players)
			local YSize = 0
			local XSize = 0

			for i, v in next, PlayersContainerLabels do
				v.Visible = false
				Library.RegistryMap[v].Properties.TextColor3 = 'FontColor'
			end

			for i, v in next, Players do
				if not PlayersContainerLabels[v] then
					PlayersContainerLabels[v] = Library:CreateLabel({
						TextXAlignment = Enum.TextXAlignment.Center;
						Size = API.UDim2New(1, 0, 0, 18);
						TextSize = 14;
						Visible = false;
						ZIndex = 110;
						TextColor3 = Library.FontColor;
						Text = v;
						Parent = Library.SpecListContainer;
					}, true);
					Library.RegistryMap[PlayersContainerLabels[v]].Properties.TextColor3 = 'FontColor'
				end
				PlayersContainerLabels[v].Visible = true
			end

			for _, Label in next, API.GetChildren(Library.SpecListContainer) do
				if API.IsA(Label, 'TextLabel') and Label.Visible then
					YSize = YSize + Label.AbsoluteSize.Y + Library.SpecUIlistlayout.Padding.Offset
					if (Label.TextBounds.X > XSize) then
						XSize = Label.TextBounds.X
					end
				end
			end

			if Toggles.Spectator_List and Toggles.Spectator_List.Value then
				if YSize == 0 then
					Library.SpecListBG.Size = API.UDim2New(1, 0, 0, 0)
					Library.SpecListBG.BackgroundTransparency = 1
					if Toggles.Speclist_dynamic and Toggles.Speclist_dynamic.Value then
						if getgenv().ToggleMenu == true then
							Library.SpecListFrame.Visible = true
						else
							Library.SpecListFrame.Visible = false
						end
					end
				else
					Library.SpecListBG.Size = API.UDim2New(0, API.MathMax(XSize + 20, 210), 0, YSize + 30)
					Library.SpecListBG.BackgroundTransparency = 0
					Library.SpecListFrame.Visible = true
				end
			elseif Library.SpecListFrame then
				Library.SpecListFrame.Visible = false
			end
		end

		function Library:SetSpecListVisibility(Bool)
			Library.SpecListFrame.Visible = Bool;
		end

		local function GetSpectators()
			local camPos = workspace.CurrentCamera.CFrame.Position
			local found = {}
			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				if player ~= game:GetService("Players").LocalPlayer then
					if not player.Character then
						local camCF = player:FindFirstChild("CameraCF")
						if camCF and camCF:IsA("CFrameValue") then
							local dist = (camCF.Value.Position - camPos).Magnitude
							if dist < 20 then
								table.insert(found, player.Name)
							end
						end
					end
				end
			end
			return found
		end

		if Library.SpecListFrame then
			Library.SpecListFrame.Visible = false
		end
    end   
    function Library:SetWatermarkVisibility(Bool)
        Library.Watermark.Visible = Bool;
    end;
    function Library:SetKeyListVisibility(Bool)
        Library.KeybindFrame.Visible = Bool;
    end;

    function removeHtmlTags(str)
        return API.StringGsub(str, "<.->", "")
    end
    function Library:SetWatermark(Text)    
        local X, Y = Library:GetTextBounds(removeHtmlTags(Text), Library.Font, 15);
        Library.Watermark.Size = API.UDim2New(0, X + 18, 0, (Y * 1.5) + 0); 
        Library.WatermarkText.Text = Text; 
    end;

    
    Library.EventLogHistory = {}
    Library.EventLogMax = 150
    Library.EventLogListFrame = nil
    Library.EventLogCategoryMap = {
        ["Bullet Hit"] = "Bullet Hit",
        ["Melee Hit"] = "Melee Hit",
        ["Grenade Hit"] = "Grenade Hit",
        ["Server Correction"] = "Server Corrections",
        ["Server Corrections"] = "Server Corrections",
        ["Server Flags"] = "Server Flags",
        ["Ragebot Collat"] = "Ragebot Collat",
        ["Ragebot Peek"] = "Ragebot Peek",
        ["Fake Position"] = "Fake Position",
        ["Exploiting"] = "Exploiting",
        ["Player Flag"] = "Exploiting",
    }

    function Library:PushEventLog(Category, Message)
        Category = tostring(Category or "Log")
        Message = tostring(Message or "")
        local Mapped = Library.EventLogCategoryMap[Category] or Category
        local CleanMsg = Message:gsub("^%[(.-)%]%s*", "")
        local History = Library.EventLogHistory
        local Top = History[1]
        if Top and Top.Category == Mapped and Top.CleanMessage == CleanMsg then
            Top.Count = (Top.Count or 1) + 1
            Top.Time = os.date("%H:%M:%S")
            Top.Stamp = tick()
            Top.Message = Message
        else
            table.insert(History, 1, {
                Category = Mapped,
                Message = Message,
                CleanMessage = CleanMsg,
                Count = 1,
                Time = os.date("%H:%M:%S"),
                Stamp = tick(),
            })
            while #History > Library.EventLogMax do
                table.remove(History)
            end
        end
        pcall(function()
            if Library.RefreshEventLogList then
                Library:RefreshEventLogList()
            end
        end)
    end

    function Library:RefreshEventLogList()
        local Frame = Library.EventLogListFrame
        if not Frame then return end
        if not Frame.Parent then return end

        for _, Child in ipairs(Frame:GetChildren()) do
            if Child:IsA("TextLabel") or Child:IsA("TextButton") then
                Child:Destroy()
            end
        end

        local Selected = {}
        local Flag = nil
        if Options and Options["Event Logs"] then
            Flag = Options["Event Logs"]
        elseif Flags and Flags["Event Logs"] then
            Flag = Flags["Event Logs"]
        end
        if Flag and type(Flag.Value) == "table" then
            for k, v in next, Flag.Value do
                if v == true then
                    Selected[tostring(k)] = true
                elseif type(k) == "number" and type(v) == "string" then
                    Selected[v] = true
                end
            end
        end
        local HasFilter = next(Selected) ~= nil

        local FrameWidth = Frame.AbsoluteSize.X
        if type(FrameWidth) ~= "number" or FrameWidth < 50 then
            FrameWidth = 200
        end
        local TextWidth = math.max(FrameWidth - 10, 40)
        local Accent = Library.AccentColor or Color3.fromRGB(144, 130, 255)
        local ExploitRed = Color3.fromRGB(255, 50, 50)

        local Y = 2
        local CountShown = 0
        for _, Entry in ipairs(Library.EventLogHistory) do
            local IsExploit = (Entry.Category == "Exploiting")
            if IsExploit or (not HasFilter) or Selected[Entry.Category] then
                local Body = Entry.CleanMessage or Entry.Message or ""
                Body = tostring(Body):gsub("^%[(.-)%]%s*", "")
                local Count = Entry.Count or 1
                local Text
                if Count > 1 then
                    Text = string.format("[%s] [%s] %s (x%d)", Entry.Time or "?", Entry.Category or "?", Body, Count)
                else
                    Text = string.format("[%s] [%s] %s", Entry.Time or "?", Entry.Category or "?", Body)
                end

                local LineHeight = 16
                pcall(function()
                    local Bounds = game:GetService("TextService"):GetTextSize(
                        Text,
                        12,
                        Enum.Font.Code,
                        Vector2.new(TextWidth, 1000)
                    )
                    if Bounds and Bounds.Y then
                        LineHeight = math.max(16, math.ceil(Bounds.Y) + 2)
                    end
                end)

                local Line = Instance.new("TextLabel")
                Line.Name = "EventLogLine"
                Line.BackgroundTransparency = 1
                Line.BorderSizePixel = 0
                Line.Size = UDim2.new(1, -6, 0, LineHeight)
                Line.Position = UDim2.new(0, 3, 0, Y)
                Line.Font = Enum.Font.Code
                Line.TextSize = 12
                Line.TextXAlignment = Enum.TextXAlignment.Left
                Line.TextYAlignment = Enum.TextYAlignment.Top
                Line.TextWrapped = true
                Line.TextColor3 = IsExploit and ExploitRed or Accent
                Line.TextTransparency = 0
                Line.Text = Text
                Line.ZIndex = (Frame.ZIndex or 7) + 1
                Line.Parent = Frame
                pcall(function()
                    if Library.FontFace then
                        Line.FontFace = Library.FontFace
                    end
                end)
                Y = Y + LineHeight
                CountShown = CountShown + 1
                if CountShown >= 100 then break end
            end
        end
        Frame.CanvasSize = UDim2.new(0, 0, 0, math.max(Y + 4, 20))
    end

function Library:Notify(Text, Time, Parent)
        if type(Text) == "table" then
            Time = Text.Time or Time
            Text = Text.Text or Text.Message or tostring(Text)
        end
        Text = tostring(Text or "")
        local Cat = string.match(Text, "^%[(.-)%]")
        if Cat and Library.PushEventLog then
            pcall(function() Library:PushEventLog(Cat, Text) end)
        end
        local XSize, YSize = Library:GetTextBounds(Text, Library.Font, 15);

        YSize = (YSize * 1.5) + 3

        local NotifyOuter = Library:Create('Frame', {
            Position = API.UDim2New(0, 100, 0, 10);
            BorderColor3 = API.Color3New(0,0,0);
            Size = API.UDim2New(0, 0, 0, YSize);
            ClipsDescendants = true;
            ZIndex = 100;
            Parent = Library.NotificationArea;
        });

        if API.StringLower(API.tostring(Parent)) == "center" then
            NotifyOuter.Parent = Library.NotificationAreaCenter
        end

        local NotifyInner = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor;
            BorderColor3 = Library.OutlineColor;
            BorderMode = Enum.BorderMode.Inset;
            Size = API.UDim2New(1, 0, 1, 0);
            ZIndex = 101;
            Parent = NotifyOuter;
        });

        Library:AddToRegistry(NotifyInner, {
            BackgroundColor3 = 'MainColor';
            BorderColor3 = 'OutlineColor';
        }, true);

        local InnerFrame = Library:Create('Frame', {
            BackgroundColor3 = API.Color3New(1, 1, 1);
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 1, 0, 1);
            Size = API.UDim2New(1, -2, 1, -2);
            ZIndex = 102;
            Parent = NotifyInner;
        });

        local Gradient = Library:Create('UIGradient', {
            Color = API.ColorSequenceNew({
                API.ColorSequenceKeypointNew(0, Library:GetDarkerColor(Library.MainColor)),
                API.ColorSequenceKeypointNew(1, Library.MainColor),
            });
            Rotation = -90;
            Parent = InnerFrame;
        });

        Library:AddToRegistry(Gradient, {
            Color = function()
                return API.ColorSequenceNew({
                    API.ColorSequenceKeypointNew(0, Library:GetDarkerColor(Library.MainColor)),
                    API.ColorSequenceKeypointNew(1, Library.MainColor),
                });
            end
        });

        local NotifyLabel = Library:CreateLabel({
            Position = API.UDim2New(0, 3, 0, 1);
            Size = API.UDim2New(1, -4, 1, -1);
            Text = Text;
            TextXAlignment = Enum.TextXAlignment.Left;
            TextSize = 15;
            ZIndex = 103;
            Parent = InnerFrame;
        });

        local TopColor = Library:Create('Frame', {
            BackgroundColor3 = Library.AccentColor;
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 1, 0, 1);
            Size = API.UDim2New(1, -2, 0, 2);
            ZIndex = 104;
            Parent = NotifyOuter;
        });

        Library:AddToRegistry(TopColor, {
            BackgroundColor3 = 'AccentColor';
        }, true);

        API.Pcall(NotifyOuter.TweenSize, NotifyOuter, API.UDim2New(0, XSize + 12, 0, YSize), 'Out', 'Quad', 0.5, true);

        API.TaskSpawn(function()
            API.Wait(Time or 5);

            API.Pcall(NotifyOuter.TweenSize, NotifyOuter, API.UDim2New(0, 0, 0, YSize), 'Out', 'Quad', 0.5, true);

            API.Wait(0.5)

            API.Destroy(NotifyOuter);
        end);
    end;

    function Library:CreateWindow(...)
        local Arguments = { ... }
        local Config = { AnchorPoint = Vector2.zero }

        if API.Type(...) == 'table' then
            Config = ...;
        else
            Config.Title = Arguments[1]
            Config.AutoShow = Arguments[2] or false;
        end

        if API.Type(Config.Title) ~= 'string' then Config.Title = 'No title' end
        if API.Type(Config.TabPadding) ~= 'number' then Config.TabPadding = 0 end
        if API.Type(Config.MenuFadeTime) ~= 'number' then Config.MenuFadeTime = 0.2 end

        if typeof(Config.Position) ~= 'UDim2' then Config.Position = API.UDim2fromOffset(175, 50) end
        if typeof(Config.Size) ~= 'UDim2' then Config.Size = API.UDim2fromOffset(801, 600) end
        if typeof(Config.Color) ~= 'Color3' then Config.Color = Library.FontColor end

        if Config.Center then
            Config.AnchorPoint = API.Vector2New(0.5, 0.5)
            Config.Position = UDim2.fromScale(0.5, 0.5)
        end

        local Window = {
            Tabs = {};
            TabButtons = {};
        };

        local Outer = Library:Create('Frame', {
            AnchorPoint = Config.AnchorPoint,
            BackgroundColor3 = Library.OutlineColor;
            BorderSizePixel = 0;
            BorderMode = Enum.BorderMode.Outline;
            Position = Config.Position,
            Size = Config.Size,
            Visible = false;
            ZIndex = 1;
            Parent = ScreenGui;
        });
        Window.MainFrame = Outer

        local Outer2 = Library:Create('Frame', {
            AnchorPoint = Config.AnchorPoint,
            BackgroundColor3 = Library.MainColor;
            BorderSizePixel = 0;
            BorderMode = Enum.BorderMode.Inset;
            Position = Config.Position,
            Size = Config.Size,
            Visible = false;
            ZIndex = 0;
            Parent = ScreenGui;
        });

        Library:MakeDraggable(Outer, 25, Outer2);

        local Inner = Library:Create('Frame', {
            BackgroundColor3 = Library.BackgroundColor;
            BorderColor3 = Library.OutlineColor;
            BorderSizePixel = 1;
            BorderMode = Enum.BorderMode.Outline;
            Position = API.UDim2New(0, 1, 0, 1);
            Size = API.UDim2New(1, -2, 1, -2);
            ZIndex = 1;
            Parent = Outer;
        });

        local WindowGlow = Library:Create('ImageLabel', {
            ImageColor3 = Library.AccentColor;
            BackgroundTransparency = 1;
            AnchorPoint = API.Vector2New(0.5, 0.5);
            Size = API.UDim2New(0, 849, 0, 650);
            Position = API.UDim2New(0.5, 0, 0.5, 0);
            BorderSizePixel = 0;
            Visible = false;
            ZIndex = -90;
            Image = "rbxassetid://73863974528152";
            ImageTransparency = 0;
            Parent = Outer;
        });
        Library.WindowGlowBaseSize = Vector2.new(849, 650)

        Library:AddToRegistry(Inner, {
            BackgroundColor3 = 'BackgroundColor';
            BorderColor3 = 'OutlineColor';
        });

        Library:AddToRegistry(Outer, {
            BackgroundColor3 = 'OutlineColor';
        });

        Library:AddToRegistry(WindowGlow, {
            ImageColor3 = 'AccentColor';
        });

        Library:AddToRegistry(Outer2, {
            BackgroundColor3 = 'OutlineColor';
        });

        local TitleHolder = Library:Create('Frame', {
            BackgroundTransparency = 1;
            BorderSizePixel = 0;
            Position = API.UDim2New(0.5, 0, 0, 0);
            AnchorPoint = API.Vector2New(0.5, 0);
            Size = API.UDim2New(0, 0, 0, 25);
            AutomaticSize = Enum.AutomaticSize.X;
            ZIndex = 1;
            Parent = Inner;
        });

        local TitleLayout = Library:Create('UIListLayout', {
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            VerticalAlignment = Enum.VerticalAlignment.Center;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Padding = API.UDimNew(0, 4);
            Parent = TitleHolder;
        });

        local CatIds = {
            "rbxassetid://11176073563",
            "rbxassetid://92592677880432",
        }
        local CatImage = Library:Create('ImageLabel', {
            BackgroundTransparency = 1;
            BorderSizePixel = 0;
            Size = API.UDim2New(0, 20, 0, 20);
            Image = CatIds[math.random(1, #CatIds)];
            ScaleType = Enum.ScaleType.Fit;
            LayoutOrder = 1;
            ZIndex = 2;
            Parent = TitleHolder;
        });
        Library.WindowCatImage = CatImage
        Library.WindowCatIds = CatIds

        local WindowLabelLeft = Library:CreateLabel({
            AutomaticSize = Enum.AutomaticSize.X;
            Size = API.UDim2New(0, 0, 0, 25);
            TextColor3 = Config.Color;
            Text = 'Catware.Top';
            TextXAlignment = Enum.TextXAlignment.Left;
            LayoutOrder = 2;
            ZIndex = 2;
            TextSize = 18;
            Parent = TitleHolder;
        });

        local WindowLabel = Library:CreateLabel({
            AutomaticSize = Enum.AutomaticSize.X;
            RichText = true;
            Size = API.UDim2New(0, 0, 0, 25);
            TextColor3 = Config.Color;
            Text = '';
            TextXAlignment = Enum.TextXAlignment.Left;
            LayoutOrder = 3;
            ZIndex = 2;
            TextSize = 18;
            Parent = TitleHolder;
        });

        local function FormatWindowTitle()
            local Acc = Library.AccentColor or Color3.fromRGB(255, 0, 0)
            local R = math.floor(Acc.R * 255 + 0.5)
            local G = math.floor(Acc.G * 255 + 0.5)
            local B = math.floor(Acc.B * 255 + 0.5)
            WindowLabel.Text = string.format('| <font color="rgb(%d,%d,%d)">Phantom Forces</font>', R, G, B)
            if CatImage and Library.WindowCatIds then
            end
        end
        FormatWindowTitle()
        Library.UpdateWindowTitle = FormatWindowTitle

        function Library:RerollWindowCat()
            if not Library.WindowCatImage or not Library.WindowCatIds then return end
            local Ids = Library.WindowCatIds
            Library.WindowCatImage.Image = Ids[math.random(1, #Ids)]
        end

        local MainSectionOuter = Library:Create('Frame', {
            BackgroundColor3 = API.Color3FromRGB(255, 0, 0);
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 8, 0, 25);
            Size = API.UDim2New(1, -16, 1, -33);
            ZIndex = 1;
            Parent = Inner;
        });

        local MainSectionInner = Library:Create('Frame', {
            BackgroundColor3 = API.Color3FromRGB(255, 0, 0);
            BorderSizePixel = 0;
            Position = API.UDim2New(0, 0, 0, 0);
            Size = API.UDim2New(1, 0, 1, 0);
            ZIndex = 1;
            Parent = MainSectionOuter;
        });

        local TabArea = Library:Create('Frame', {
            BackgroundTransparency = 0;
            BorderSizePixel = 1;
            BorderColor3 = Library.OutlineColor;
            BorderMode = Enum.BorderMode.Outline;
            Position = API.UDim2New(0, 0, 0, 0);
            Size = API.UDim2New(1, 0, 0, 28);
            ZIndex = 1;
            Parent = MainSectionInner;
        });

        Library:AddToRegistry(TabArea, {
            BorderColor3 = 'OutlineColor';
        });

        local TabListLayout = Library:Create('UIListLayout', {
            Padding = API.UDimNew(0, Config.TabPadding);
            FillDirection = Enum.FillDirection.Horizontal;
            HorizontalAlignment = Enum.HorizontalAlignment.Center;
            SortOrder = Enum.SortOrder.LayoutOrder;
            Parent = TabArea;
        });

        local TabContainer = Library:Create('Frame', {
            AnchorPoint = API.Vector2New(0.5, 0.5);
            BackgroundColor3 = Library.BackgroundColor;
            BorderColor3 = Library.OutlineColor;
            Position = API.UDim2New(0.5, 0, 0.5, 14);
            Size = API.UDim2New(1, 0, 1, -30);
            ZIndex = 2;
            Parent = MainSectionInner;
        });

        Library:AddToRegistry(TabContainer, {
            BackgroundColor3 = 'MainColor';
            BorderColor3 = 'OutlineColor';
        });

        Library.WindowGlow = WindowGlow

        function Library:SetGlowVis(Bool)
            if Library.WindowGlow then
                Library.WindowGlow.Visible = Bool and true or false
            end
        end

        function Library:UpdateWindowGlow()
            local Glow = Library.WindowGlow
            if not Glow then return end
            local Base = Library.WindowGlowBaseSize or Vector2.new(849, 650)
            local SizeScale = 1
            local Intensity = 1
            if Options and Options["Menu Glow Size"] and type(Options["Menu Glow Size"].Value) == "number" then
                SizeScale = Options["Menu Glow Size"].Value
            elseif Flags and Flags["Menu Glow Size"] and type(Flags["Menu Glow Size"].Value) == "number" then
                SizeScale = Flags["Menu Glow Size"].Value
            end
            if Options and Options["Menu Glow Intensity"] and type(Options["Menu Glow Intensity"].Value) == "number" then
                Intensity = Options["Menu Glow Intensity"].Value
            elseif Flags and Flags["Menu Glow Intensity"] and type(Flags["Menu Glow Intensity"].Value) == "number" then
                Intensity = Flags["Menu Glow Intensity"].Value
            end
            SizeScale = math.clamp(SizeScale, 0.5, 1.03)
            Intensity = math.clamp(Intensity, 0, 100)
            local Win = Library.WindowGlow and Library.WindowGlow.Parent
            local WinSize = Win and Win.AbsoluteSize or Vector2.new(Base.X, Base.Y)
            local Pad = 1.02 + (SizeScale - 1) * 0.25
            Pad = math.clamp(Pad, 1.0, 2.5)
            local GlowW = math.clamp(WinSize.X * Pad * SizeScale, 100, 4000)
            local GlowH = math.clamp(WinSize.Y * Pad * SizeScale, 80, 3000)
            Glow.Size = UDim2.new(0, GlowW, 0, GlowH)
            Glow.ImageTransparency = math.clamp(1 - (Intensity / 100), 0, 1)
            Glow.ImageColor3 = Library.AccentColor
            if Toggles and Toggles.UIGlow and Toggles.UIGlow.Value and Outer and Outer.Visible then
                Glow.Visible = Intensity > 0
            end
        end;

        function Window:SetWindowTitle(Title)
            WindowLabel.Text = Title;
        end;

        function Window:AddTab(Name)
            local Tab = {
                Groupboxes = {};
                Tabboxes = {};
            };

            local TabButton = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                BorderSizePixel = 1;
                Size = API.UDim2New(0, 8, 1, 0);
                ZIndex = 1;
                Parent = TabArea;
            });
            API.TableInsert(Window.TabButtons, TabButton)
            for i, v in next, Window.TabButtons do
                v.Size = API.UDim2New(1/#Window.TabButtons, -Config.TabPadding, 1, 0)
            end

            Library:AddToRegistry(TabButton, {
                BackgroundColor3 = 'BackgroundColor';
                BorderColor3 = 'OutlineColor';
            });

            local TabButtonLabel = Library:CreateLabel({
                Position = API.UDim2New(0, 0, 0, 0);
                Size = API.UDim2New(1, 0, 1, -1);
                Text = Name;
                ZIndex = 1;
                TextSize = 14;

                Parent = TabButton;
            });

            Library:AddToRegistry(TabButtonLabel, {
                TextColor3 = 'FontColorDark';
            });

            local Blocker = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderSizePixel = 0;
                Position = API.UDim2New(0, 0, 1, 0);
                Size = API.UDim2New(1, 0, 0, 2);
                BackgroundTransparency = 1;
                ZIndex = 3;
                Parent = TabButton;
            });

            Library:AddToRegistry(Blocker, {
                BackgroundColor3 = 'MainColor';
            });

            local TabFrame = Library:Create('Frame', {
                Name = 'TabFrame',
                BackgroundTransparency = 1;
                Position = API.UDim2New(0, 0, 0, 0);
                Size = API.UDim2New(1, 0, 1, 0);
                Visible = false;
                ZIndex = 2;
                Parent = TabContainer;
            });
            Tab.MainFrame = TabFrame

            local LeftSide = Library:Create('ScrollingFrame', {
                BackgroundTransparency = 1;
                BorderSizePixel = 0;
                Position = API.UDim2New(0, 8 - 1, 0, 8 - 1);
                Size = API.UDim2New(0.33525, -12 + 2, 0, 507 + 12);
                CanvasSize = API.UDim2New(0, 0, 0, 0);
                BottomImage = '';
                TopImage = '';
                ScrollBarThickness = 0;
                ZIndex = 2;
                Parent = TabFrame;
            });

            local CenterSide = Library:Create('ScrollingFrame', {
                BackgroundTransparency = 1;
                BorderSizePixel = 0;
                Position = API.UDim2New(0.3325, 4 + 1, 0, 8 - 1);
                Size = API.UDim2New(0.33525, -12 + 2, 0, 507 + 12);
                CanvasSize = API.UDim2New(0, 0, 0, 0);
                BottomImage = '';
                TopImage = '';
                ScrollBarThickness = 0;
                ZIndex = 2;
                Parent = TabFrame;
            });

            local RightSide = Library:Create('ScrollingFrame', {
                BackgroundTransparency = 1;
                BorderSizePixel = 0;
                Position = API.UDim2New(0.664, 4 + 1, 0, 8 - 1);
                Size = API.UDim2New(0.33525, -12 + 2, 0, 507 + 12);
                CanvasSize = API.UDim2New(0, 0, 0, 0);
                BottomImage = '';
                TopImage = '';
                ScrollBarThickness = 0;
                ZIndex = 2;
                Parent = TabFrame;
            });

            Library:Create('UIListLayout', {
                Padding = API.UDimNew(0, 8);
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                HorizontalAlignment = Enum.HorizontalAlignment.Center;
                Parent = LeftSide;
            });

            Library:Create('UIListLayout', {
                Padding = API.UDimNew(0, 8);
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                HorizontalAlignment = Enum.HorizontalAlignment.Center;
                Parent = RightSide;
            }); 

            Library:Create('UIListLayout', {
                Padding = API.UDimNew(0, 8);
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                HorizontalAlignment = Enum.HorizontalAlignment.Center;
                Parent = CenterSide;
            }); 

            for _, Side in next, { LeftSide, RightSide, CenterSide } do
                Side.ScrollBarThickness = 3
                Side.ScrollingEnabled = true
                local Layout = Side:WaitForChild('UIListLayout')
                local ScrollPending = false
                API.GetPropertyChangedSignal(Layout, 'AbsoluteContentSize'):Connect(function()
                    if ScrollPending then return end
                    ScrollPending = true
                    task.defer(function()
                        ScrollPending = false
                        local Y = Layout.AbsoluteContentSize.Y
                        if type(Y) == 'number' then
                            Side.CanvasSize = API.UDim2fromOffset(0, Y + 8)
                        end
                    end)
                end)
            end;

            function Tab:ShowTab()
                for _, Tab in next, Window.Tabs do
                    Tab:HideTab();
                end;

                Blocker.BackgroundTransparency = 0;
                TabButton.BackgroundColor3 = Library.MainColor;
                Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'MainColor';
                TabButtonLabel.TextColor3 = Library.AccentColor;
                Library.RegistryMap[TabButtonLabel].Properties.TextColor3 = 'AccentColor';
                TabFrame.Visible = true;
            end;

            function Tab:HideTab()

                Blocker.BackgroundTransparency = 1;
                TabButton.BackgroundColor3 = Library.BackgroundColor;
                Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'BackgroundColor';
                TabButtonLabel.TextColor3 = Library.FontColorDark
                Library.RegistryMap[TabButtonLabel].Properties.TextColor3 = 'FontColorDark';
                TabFrame.Visible = false;
            end;

            function Tab:SetLayoutOrder(Position)
                TabButton.LayoutOrder = Position;
                TabListLayout:ApplyLayout();
            end;

            function Tab:AddGroupbox(Info)
                local Groupbox = {};

                local BoxOuter = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.BorderColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = API.UDim2New(1, 0, 0, 507 + 2);
                    ZIndex = 2;
                    Parent = Info.Side == 1 and LeftSide or Info.Side == 3 and CenterSide or RightSide;
                });

                Library:AddToRegistry(BoxOuter, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                local BoxInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = API.Color3New(0, 0, 0);
                    BorderSizePixel = 0;
                    Size = API.UDim2New(1, -2, 1, -2);
                    Position = API.UDim2New(0, 1, 0, 1);
                    ZIndex = 4;
                    Parent = BoxOuter;
                });

                Library:AddToRegistry(BoxInner, {
                    BackgroundColor3 = 'BackgroundColor';
                });

                local Highlight = Library:Create('Frame', {
                    BackgroundColor3 = API.Color3FromRGB(255,255,255);
                    BackgroundTransparency = 0.9;
                    BorderSizePixel = 0;
                    Position = API.UDim2New(0, 4, 0, 32 - 4);
                    Size = API.UDim2New(0.96, 0, 0, 1);
                    ZIndex = 5;
                    Parent = BoxInner;
                });

                local GroupboxLabel = Library:CreateLabel({
                    Size = API.UDim2New(1, 0, 0, 18);
                    Position = API.UDim2New(0, 6, 0, 5);
                    TextColor3 = Library.AccentColor;
                    TextSize = 14;
                    Text = Info.Name;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 5;
                    Parent = BoxInner;
                });

                Library:AddToRegistry(GroupboxLabel, {
                    TextColor3 = 'AccentColor';
                });

                local Container = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Position = API.UDim2New(0, 4, 0, 40-4);
                    Size = API.UDim2New(1, -4, 2, -40);
                    ZIndex = 1;
                    Parent = BoxInner;
                });

                Library:Create('UIListLayout', {
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = Container;
                });

                function Groupbox:Resize()
                    local Size = 0;

                    for _, Element in next, API.GetChildren(Groupbox.Container) do
                        if (not API.IsA(Element, 'UIListLayout')) and Element.Visible then
                            Size = Size + Element.Size.Y.Offset;
                        end;
                    end;

                    BoxOuter.Size = API.UDim2New(1, 0, 0, 20 + Size + 2 + 22 - 4);
                end;

                Groupbox.Container = Container;
                setmetatable(Groupbox, BaseGroupbox);

                Groupbox:AddBlank(3);
                Groupbox:Resize();

                Tab.Groupboxes[Info.Name] = Groupbox;

                return Groupbox;
            end;

            function Tab:AddLeftGroupbox(Name)
                return Tab:AddGroupbox({ Side = 1; Name = Name; });
            end;

            function Tab:AddCenterGroupbox(Name)
                return Tab:AddGroupbox({ Side = 3; Name = Name; });
            end;

            function Tab:AddRightGroupbox(Name)
                return Tab:AddGroupbox({ Side = 2; Name = Name; });
            end;

            function Tab:AddTabbox(Info)
                local Tabbox = {
                    Tabs = {};
                };

                local BoxOuter = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = API.UDim2New(1, 0, 0, 509);
                    ZIndex = 2;
                    Parent = Info.Side == 1 and LeftSide or Info.Side == 3 and CenterSide or RightSide;
                });

                Library:AddToRegistry(BoxOuter, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                local BoxInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = API.Color3New(0, 0, 0);
                    BorderSizePixel = 0;
                    Size = API.UDim2New(1, -2, 1, -2);
                    Position = API.UDim2New(0, 1, 0, 1);
                    ZIndex = 4;
                    Parent = BoxOuter;
                });

                Library:AddToRegistry(BoxInner, {
                    BackgroundColor3 = 'BackgroundColor';
                });

                local TabboxTitle = Library:CreateLabel({
                    Size = API.UDim2New(1, 0, 0, 18);
                    Position = API.UDim2New(0, 6, 0, 5);
                    TextColor3 = Library.AccentColor;
                    TextSize = 14;
                    Text = Info.Title or "Tabbox Title";
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 5;
                    Parent = BoxInner;
                });

                Library:AddToRegistry(TabboxTitle, {
                    TextColor3 = 'AccentColor';
                });

                local Highlight = Library:Create('Frame', {
                    BackgroundColor3 = API.Color3FromRGB(255,255,255);
                    BackgroundTransparency = 0.9;
                    BorderSizePixel = 0;
                    Position = API.UDim2New(0, 4, 0, 28);
                    Size = API.UDim2New(0.96, 0, 0, 1);
                    ZIndex = 10;
                    Parent = BoxInner;
                });

                local TabboxButtons = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Position = API.UDim2New(0, 0, 0, 35 - 4);
                    Size = API.UDim2New(1, 0, 0, 18);
                    ZIndex = 5;
                    Parent = BoxInner;
                });

                Library:Create('UIListLayout', {
                    FillDirection = Enum.FillDirection.Horizontal;
                    HorizontalAlignment = Enum.HorizontalAlignment.Left;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = TabboxButtons;
                });

                function Tabbox:AddTab(Name)
                    local Tab = {};

                    local TextSizeX, _ = Library:GetTextBounds(Name, Library.Font, 14);

                    local Button = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = API.Color3New(0, 0, 0);
                        BorderSizePixel = 0;
                        Size = API.UDim2New(0, TextSizeX + 10, 1, 0);
                        ZIndex = 6;
                        Parent = TabboxButtons;
                    });

                    Library:AddToRegistry(Button, {
                        BackgroundColor3 = 'BackgroundColor';
                    });

                    local ButtonLabel = Library:CreateLabel({
                        Size = API.UDim2New(1, 0, 1, 0);
                        TextSize = 14;
                        Text = Name;
                        TextXAlignment = Enum.TextXAlignment.Center;
                        ZIndex = 7;
                        Parent = Button;
                    });

                    Library:AddToRegistry(ButtonLabel, {
                        TextColor3 = 'FontColorDark';
                    });

                    local Underline = Library:Create('Frame', {
                        BackgroundColor3 = Library.AccentColor;
                        BorderSizePixel = 0;
                        Position = API.UDim2New(0.5, -TextSizeX / 2, 1, -1);
                        Size = API.UDim2New(0, TextSizeX, 0, 2);
                        Visible = false;
                        ZIndex = 9;
                        Parent = Button;
                    });

                    Library:AddToRegistry(Underline, {
                        BackgroundColor3 = 'AccentColor';
                    });

                    local Container = Library:Create('Frame', {
                        BackgroundTransparency = 1;
                        Position = API.UDim2New(0, 4, 0, 60 - 4);
                        Size = API.UDim2New(1, -4, 1, -40);
                        ZIndex = 1;
                        Visible = false;
                        Parent = BoxInner;
                    });

                    Library:Create('UIListLayout', {
                        FillDirection = Enum.FillDirection.Vertical;
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        Parent = Container;
                    });

                    function Tab:Show()
                        for _, Tab in next, Tabbox.Tabs do
                            Tab:Hide();
                        end;

                        Container.Visible = true;
                        Underline.Visible = true;

                        ButtonLabel.TextColor3 = Library.FontColor
                        Library.RegistryMap[ButtonLabel].Properties.TextColor3 = 'FontColor';

                        Tab:Resize();
                    end;

                    function Tab:Hide()
                        Container.Visible = false;
                        Underline.Visible = false;

                        ButtonLabel.TextColor3 = Library.FontColorDark
                        Library.RegistryMap[ButtonLabel].Properties.TextColor3 = 'FontColorDark';

                    end;

                    function Tab:Resize()
                        local TabCount = 0;

                        if (not Container.Visible) then
                            return;
                        end;

                        local Size = 0;

                        for _, Element in next, API.GetChildren(Tab.Container) do
                            if (not API.IsA(Element, 'UIListLayout')) and Element.Visible then
                                Size = Size + Element.Size.Y.Offset;
                            end;
                        end;

                        BoxOuter.Size = API.UDim2New(1, 0, 0, 20 + Size + 2 + 40 - 4);
                    end;

                    Button.InputBegan:Connect(function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                            Tab:Show();
                            Tab:Resize();
                        end;
                    end);

                    Tab.Container = Container;
                    Tabbox.Tabs[Name] = Tab;

                    setmetatable(Tab, BaseGroupbox);

                    Tab:AddBlank(3);
                    Tab:Resize();

                    if #API.GetChildren(TabboxButtons) == 2 then
                        Tab:Show();
                    end;

                    return Tab;
                end;

                Tab.Tabboxes[Info.Name or ''] = Tabbox;

                return Tabbox;
            end;

            function Tab:AddLeftTabbox(Title)
                return Tab:AddTabbox({ Title = Title, Side = 1; });
            end;

            function Tab:AddCenterTabbox(Title)
                return Tab:AddTabbox({ Title = Title, Side = 3; });
            end;

            function Tab:AddRightTabbox(Title)
                return Tab:AddTabbox({ Title = Title, Side = 2; });
            end;

            TabButton.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Tab:ShowTab();
                end;
            end);

            if #API.GetChildren(TabContainer) == 1 then
                Tab:ShowTab();
            end;

            Window.Tabs[Name] = Tab;
            return Tab;
        end;

        local ModalElement = Library:Create('TextButton', {
            BackgroundTransparency = 1;
            Size = API.UDim2New(0, 0, 0, 0);
            Visible = true;
            Text = '';
            Modal = false;
            Parent = ScreenGui;
        });

        local TransparencyCache = {};
        local ConnectionCache = {};
        local Toggled = false;
        local Fading = false;
        getgenv().ToggleMenu = Toggled

        function Library:Toggle()
            if Fading then
                return;
            end;

            local FadeTime = Config.MenuFadeTime;
            Fading = true;
            Toggled = (not Toggled);
            ModalElement.Modal = Toggled;

            getgenv().ToggleMenu = Toggled

            if Toggled then
                Outer.Visible = true;
                if Outer2 then Outer2.Visible = true end

                API.TaskSpawn(function()
                    local State = UserInputService.MouseIconEnabled;
                    local State2 = UserInputService.MouseBehavior;

                    local Cursor = Drawing.new('Triangle');
                    Cursor.Thickness = 1;
                    Cursor.Filled = true;
                    Cursor.Visible = true;

                    local CursorOutline = Drawing.new('Triangle');
                    CursorOutline.Thickness = 1;
                    CursorOutline.Filled = false;
                    CursorOutline.ZIndex = 2
                    CursorOutline.Color = API.Color3New(0, 0, 0);
                    CursorOutline.Visible = true;

                    local BoxFill = Drawing.new("Square")
                    BoxFill.Thickness = 1;
                    BoxFill.Filled = true;
                    BoxFill.Color = API.Color3New(0, 0, 0);
                    BoxFill.Visible = true;
                    BoxFill.Size = API.Vector2New(6,6)

                    local BoxFill2 = Drawing.new("Square")
                    BoxFill2.Thickness = 1;
                    BoxFill2.Filled = true;
                    BoxFill2.Color = API.Color3New(0, 0, 0);
                    BoxFill2.Visible = true;
                    BoxFill2.Size = API.Vector2New(10,4)

                    local BoxFill3 = Drawing.new("Square")
                    BoxFill3.Thickness = 1;
                    BoxFill3.Filled = true;
                    BoxFill3.Color = API.Color3New(0, 0, 0);
                    BoxFill3.Visible = true;
                    BoxFill3.Size = API.Vector2New(4,5)

                    local BoxFill4 = Drawing.new("Square")
                    BoxFill4.Thickness = 1;
                    BoxFill4.Filled = true;
                    BoxFill4.Color = API.Color3New(0, 0, 0);
                    BoxFill4.Visible = true;
                    BoxFill4.Size = API.Vector2New(4,4)

                    while Toggled and not Library.Unloaded do
                        UserInputService.MouseIconEnabled = false;
                        UserInputService.MouseBehavior = Enum.MouseBehavior.Default

                        local mPos = API.GetMouseLocation(UserInputService);

                        Cursor.Color = Library.AccentColor;

                        BoxFill.Color = Library.AccentColor
                        BoxFill.Position = mPos + API.Vector2New(3,3)

                        BoxFill2.Color = Library.AccentColor
                        BoxFill2.Position = mPos + API.Vector2New(3,5)

                        BoxFill3.Color = Library.AccentColor
                        BoxFill3.Position = mPos + API.Vector2New(5,8)

                        BoxFill4.Color = Library.AccentColor
                        BoxFill4.Position = mPos + API.Vector2New(7,7)

                        local outerA = API.Vector2New(mPos.X, mPos.Y)
                        local outerB = API.Vector2New(mPos.X + 16, mPos.Y + 6)
                        local outerC = API.Vector2New(mPos.X + 6, mPos.Y + 16)

                        CursorOutline.PointA = outerA
                        CursorOutline.PointB = outerB
                        CursorOutline.PointC = outerC

                        local centroid = (outerA + outerB + outerC) / 3

                        Cursor.PointA = (centroid + (outerA - centroid) * 0.7)
                        Cursor.PointB = (centroid + (outerB - centroid) * 0.7) + API.Vector2New(2,1)
                        Cursor.PointC = (centroid + (outerC - centroid) * 0.7) + API.Vector2New(1,2)

                        RenderStepped:Wait();
                    end;

                    UserInputService.MouseIconEnabled = State;
                    UserInputService.MouseBehavior = State2

                    Cursor:Remove();
                    CursorOutline:Remove();
                    BoxFill:Remove()
                    BoxFill2:Remove()
                    BoxFill3:Remove()
                    BoxFill4:Remove()
                end);
            else
                for Frame, Val in next, Library.OpenedFrames do
                    Frame.Visible = false;
                    Library.OpenedFrames[Frame] = nil;
                end;
            end;

            Outer.Visible = Toggled;
            if Outer2 then
                Outer2.Visible = Toggled;
            end
            if Library.ScreenGui then
                local Outline = Library.ScreenGui:FindFirstChild("DragOutline")
                if Outline then
                    Outline.Visible = false
                end
            end
            if not Toggled and Library.WindowGlow then
                Library.WindowGlow.Visible = false
            elseif Toggled and Library.WindowGlow and Toggles.UIGlow and Toggles.UIGlow.Value then
                Library.WindowGlow.Visible = true
                if Library.UpdateWindowGlow then
                    Library:UpdateWindowGlow()
                end
            end

            Fading = false;
        end

        Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input, Processed)
            if API.Type(Library.ToggleKeybind) == 'table' and Library.ToggleKeybind.Type == 'KeyPicker' then
                if Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Library.ToggleKeybind.Value then
                    API.TaskSpawn(Library.Toggle)
                end
            elseif Input.KeyCode == Enum.KeyCode.RightControl or (Input.KeyCode == Enum.KeyCode.RightShift and (not Processed)) then
                API.TaskSpawn(Library.Toggle)
            end
        end))

                if Config.AutoShow then API.TaskSpawn(Library.Toggle) end

        do
            local MinW, MinH = 500, 400
            local MaxW, MaxH = 1400, 1000
            local BaseW, BaseH = Config.Size.X.Offset, Config.Size.Y.Offset
            if BaseW < 1 then BaseW = 801 end
            if BaseH < 1 then BaseH = 600 end

            local ResizeHandle = Library:Create('TextButton', {
                Name = 'ResizeHandle',
                AutoButtonColor = false,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.new(1, -16, 1, -16),
                Text = '',
                ZIndex = 50,
                Parent = Outer,
            })
            local ResizeCorner = ResizeHandle

            local Resizing = false
            local StartMouse = Vector2.zero
            local StartSize = Vector2.new(BaseW, BaseH)

            local function ApplySize(W, H)
                W = math.clamp(math.floor(W + 0.5), MinW, MaxW)
                H = math.clamp(math.floor(H + 0.5), MinH, MaxH)
                Outer.Size = UDim2.fromOffset(W, H)
                if Outer2 then
                    Outer2.Size = UDim2.fromOffset(W, H)
                end
                local ScaleY = H / BaseH
                for _, Tab in next, Window.Tabs do
                    if Tab.MainFrame then
                        for _, Child in next, Tab.MainFrame:GetChildren() do
                            if Child:IsA('ScrollingFrame') then
                                local Base = Child:GetAttribute('BaseHeight')
                                if not Base then
                                    Base = Child.Size.Y.Offset
                                    if Base < 1 then Base = 507 end
                                    Child:SetAttribute('BaseHeight', Base)
                                end
                                Child.Size = UDim2.new(Child.Size.X.Scale, Child.Size.X.Offset, 0, math.floor(Base * ScaleY + 0.5))
                            end
                        end
                    end
                end
                if Library.UpdateWindowGlow then
                    pcall(Library.UpdateWindowGlow)
                end
                if Options then
                    for _, Opt in next, Options do
                        if type(Opt) == "table" then
                            if Opt.Type == "Slider" and Opt.Display then
                                pcall(function() Opt:Display() end)
                            elseif Opt.Type == "ColorPicker" and Opt.DisplayFrame then
                                pcall(function()
                                    if Opt.PickerFrameOuter and Opt.DisplayFrame then
                                        Opt.PickerFrameOuter.Position = UDim2.fromOffset(
                                            Opt.DisplayFrame.AbsolutePosition.X,
                                            Opt.DisplayFrame.AbsolutePosition.Y + 18
                                        )
                                    end
                                end)
                            elseif Opt.Type == "KeyPicker" and Opt.UpdateModePos then
                                pcall(Opt.UpdateModePos)
                            end
                        end
                    end
                end
            end

            local LastResizeApply = 0
            local PendingW, PendingH = nil, nil
            local function ApplySizeThrottled(W, H)
                PendingW, PendingH = W, H
                local Now = os.clock()
                if Now - LastResizeApply < 0.03 then
                    return
                end
                LastResizeApply = Now
                local w, h = PendingW, PendingH
                PendingW, PendingH = nil, nil
                ApplySize(w, h)
            end

            ResizeHandle.InputBegan:Connect(function(Input)
                if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                Resizing = true
                StartMouse = Vector2.new(Input.Position.X, Input.Position.Y)
                StartSize = Vector2.new(Outer.AbsoluteSize.X, Outer.AbsoluteSize.Y)

                local Conn
                Conn = Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Resizing = false
                        if Conn then Conn:Disconnect() end
                    end
                end)
            end)

            ResizeCorner.InputBegan:Connect(function(Input)
                if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                Resizing = true
                StartMouse = Vector2.new(Input.Position.X, Input.Position.Y)
                StartSize = Vector2.new(Outer.AbsoluteSize.X, Outer.AbsoluteSize.Y)
                local Conn
                Conn = Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Resizing = false
                        if Conn then Conn:Disconnect() end
                    end
                end)
            end)

            Library:GiveSignal(UserInputService.InputChanged:Connect(function(Input)
                if not Resizing then return end
                if Input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
                local Delta = Vector2.new(Input.Position.X, Input.Position.Y) - StartMouse
                ApplySizeThrottled(StartSize.X + Delta.X, StartSize.Y + Delta.Y)
            end))

            Library:GiveSignal(UserInputService.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Resizing = false
                    if PendingW and PendingH then
                        ApplySize(PendingW, PendingH)
                        PendingW, PendingH = nil, nil
                    end
                end
            end))
        end

        return Window;
    end;

    function OnPlayerChange()
        local PlayerList = GetPlayersString();

        for _, Value in next, Options do
            if Value.Type == 'Dropdown' and Value.SpecialType == 'Player' then
                Value:SetValues(PlayerList);
            end;
        end;
    end;

    Library:AddSignal(Players.PlayerAdded, OnPlayerChange)
    Library:AddSignal(Players.PlayerRemoving, OnPlayerChange)

    getgenv().Library = Library

    function ConnectKeyPickerToToggle(toggle, keypicker)
        local Toggle = Toggles[toggle]
        local Keypicker = Options[keypicker]
        if Toggle and Keypicker and Keypicker.ConnectedToggles then
            API.TableInsert(Keypicker.ConnectedToggles, Toggle)
        end
    end
    getgenv().ConnectKeyPickerToToggle = ConnectKeyPickerToToggle
end
__LoadUILibrary()

local Library, ThemeManager, SaveManager = getgenv().Library, getgenv().ThemeManager, getgenv().SaveManager
local Toggles, Options, Flags = getgenv().Toggles, getgenv().Options, getgenv().Flags
local Window = Library:CreateWindow({
    Title = 'Catware.Top | Phantom Forces',
    Center = true,
    AutoShow = true,
    TabPadding = 0,
    MenuFadeTime = 0
})
local Watermark = {
    Fps = 1,
    StoredFps = 1,
    Ping = 0,
    Delta = 1,
    RefreshRate = API.Tick(),
}

local function BuildMenuTabs(Window)
    local function SafeEsp()
        if M.Esp.RenderAllChams then M.Esp.RenderAllChams() end
    end
    local function SafeLocalChams()
        if M.Visuals.LocalChams then M.Visuals.LocalChams() end
    end
    local function SafeViewModelChams()
        if M.Visuals.ViewModelChams then M.Visuals.ViewModelChams() end
    end
    local LegitTab = Window:AddTab("Legit")
    local RageTab = Window:AddTab("Rage")
    local VisualsTab = Window:AddTab("Visuals")
    local MiscTab = Window:AddTab("Misc")
    local SettingsTab = Window:AddTab("Settings")

    local AimGroup = LegitTab:AddCenterGroupbox("Aim Assist")
    local SilentGroup = LegitTab:AddLeftGroupbox("Silent Aim")
    local TriggerGroup = LegitTab:AddLeftGroupbox("Trigger Bot")
    local ModsGroup = LegitTab:AddRightTabbox("Mods")
    local GunMods = ModsGroup:AddTab("Gun Mods")
    local KnifeMods = ModsGroup:AddTab("Knife Mods")
    local GrenadeMods = ModsGroup:AddTab("Grenade Mods")

    local MainRage = RageTab:AddLeftTabbox("Rage")
    local Ragebot = MainRage:AddTab("Rage Bot")
    local Knifebot = MainRage:AddTab("Knife Bot")
    local RageExtra = RageTab:AddCenterGroupbox("Extra")
    local AntiAim = RageTab:AddRightGroupbox("Anti-Aim")

    local Esp = VisualsTab:AddLeftTabbox("Visuals")
    local TeamGroup = Esp:AddTab("Team")
	local EnemyGroup = Esp:AddTab("Enemy")
	local World = VisualsTab:AddRightTabbox("World Editor")
    local WorldChanger = World:AddTab("World")
    local Drawing = World:AddTab("Drawing")
	local Chams = VisualsTab:AddCenterTabbox("Chams")
    local LocalTab = Chams:AddTab("Local")
	local ArmsTab = Chams:AddTab("Arms")
	local WeaponsTab = Chams:AddTab("Weapons")
	local SleevesTab = Chams:AddTab("Sleeves")
	local Extra = VisualsTab:AddCenterTabbox("Extra")
	local CameraTab = Extra:AddTab("Camera")
    
	CameraTab:AddToggle("Custom Camera FOV", {Text = "Custom Camera FOV", Default = false})
	local CamFovDep = CameraTab:AddDependencyBox()
	CamFovDep:AddSlider("Camera FOV Value", {Text = "Camera FOV", Min = 40, Max = 120, Default = 80, Rounding = 0})
	CamFovDep:AddToggle("Camera FOV Disable On Aim", {Text = "Disable On Aim", Default = true})
	CamFovDep:SetupDependencies({ { Toggles["Custom Camera FOV"], true } })

	CameraTab:AddToggle("ViewModel Offset", {Text = "ViewModel Offset", Default = false})
	local VmDep = CameraTab:AddDependencyBox()
	VmDep:AddSlider("ViewModel_X", {Text = "Rotation X", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:AddSlider("ViewModel_Y", {Text = "Rotation Y", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:AddSlider("ViewModel_Z", {Text = "Rotation Z", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:AddSlider("ViewModel_X1", {Text = "Position X", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:AddSlider("ViewModel_Y2", {Text = "Position Y", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:AddSlider("ViewModel_Z3", {Text = "Position Z", Min = 0, Max = 360, Default = 180, Rounding = 0})
	VmDep:SetupDependencies({ { Toggles["ViewModel Offset"], true } })

local ViewModelTab = Extra:AddTab("View Model")
	local TracersTab = Extra:AddTab("Bullet Tracers")

	local HitmarkersBox = VisualsTab:AddRightTabbox("Hitmarkers")
	local HitmarkerTab = HitmarkersBox:AddTab("Hitmarker")
	local DamageTab = HitmarkersBox:AddTab("Damage")
	local HitChamsTab = HitmarkersBox:AddTab("Hit Chams")

	HitmarkerTab:AddToggle("Custom Hitmarker", {Text = "Enabled", Default = false})
		:AddColorPicker("Hitmarker Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Body"})
		:AddColorPicker("Hitmarker Head Color", {Default = Color3.fromRGB(255, 50, 50), Title = "Headshot"})
	local HitmarkerDep = HitmarkerTab:AddDependencyBox()
	HitmarkerDep:AddDropdown("Hitmarker Style", {Text = "Style", Values = {"Cross", "X", "Circle", "Dot"}, Default = 1})
	HitmarkerDep:AddSlider("Hitmarker Size", {Text = "Size", Min = 4, Max = 40, Default = 12, Rounding = 0, Suffix = "px"})
	HitmarkerDep:AddSlider("Hitmarker Thickness", {Text = "Thickness", Min = 1, Max = 6, Default = 2, Rounding = 0, Suffix = "px"})
	HitmarkerDep:AddSlider("Hitmarker Duration", {Text = "Duration", Min = 0.05, Max = 1, Default = 0.25, Rounding = 2, Suffix = "s"})
	HitmarkerDep:AddToggle("Hitmarker Gap", {Text = "Center Gap", Default = true})
	HitmarkerDep:AddSlider("Hitmarker Gap Size", {Text = "Gap Size", Min = 0, Max = 20, Default = 4, Rounding = 0, Suffix = "px"})
	HitmarkerDep:AddToggle("Hitmarker Fade", {Text = "Fade Out", Default = true})
	HitmarkerDep:AddToggle("Hitmarker Outline", {Text = "Outline", Default = true})
		:AddColorPicker("Hitmarker Outline Color", {Default = Color3.fromRGB(0, 0, 0), Title = "Outline"})
	HitmarkerDep:AddToggle("Hide Default Hitmarker", {Text = "Hide Default Hitmarker", Default = false})
	HitmarkerDep:AddToggle("Hitmarker On Kill", {Text = "Bigger On Kill", Default = true})
	HitmarkerDep:AddSlider("Hitmarker Kill Scale", {Text = "Kill Scale", Min = 1, Max = 3, Default = 1.5, Rounding = 2, Suffix = "x"})
	HitmarkerDep:SetupDependencies({ { Toggles["Custom Hitmarker"], true } })

	DamageTab:AddToggle("Hitmarker Damage", {Text = "Show Damage", Default = false})
		:AddColorPicker("Hitmarker Damage Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Damage"})
	local DamageDep = DamageTab:AddDependencyBox()
	DamageDep:AddSlider("Hitmarker Damage Size", {Text = "Damage Text Size", Min = 10, Max = 28, Default = 14, Rounding = 0})
	DamageDep:SetupDependencies({ { Toggles["Hitmarker Damage"], true } })

	HitChamsTab:AddToggle("Hit Chams", {Text = "Enabled", Default = false})
		:AddColorPicker("Hit Chams Color", {Default = Color3.fromRGB(255, 80, 80), Title = "Fill", Transparency = 0.35})
		:AddColorPicker("Hit Chams Outline", {Default = Color3.fromRGB(0, 0, 0), Title = "Outline", Transparency = 0})
	local HitChamsDep = HitChamsTab:AddDependencyBox()
	HitChamsDep:AddSlider("Hit Chams Duration", {Text = "Duration", Min = 0.05, Max = 5, Default = 1, Rounding = 2, Suffix = "s"})
	HitChamsDep:SetupDependencies({ { Toggles["Hit Chams"], true } })


    local MainMisc = MiscTab:AddLeftGroupbox("Main")
	MainMisc:AddToggle("Staff Detector", {Text = "Staff Detector", Default = true})
	MainMisc:AddToggle("Remove Fall Damage", {Text = "Remove Fall Damage", Default = false})
	MainMisc:AddToggle("Force Character Rendering", {Text = "Force Character Rendering", Default = false})
	MainMisc:AddToggle("Kill Say Enabled", {Text = "Kill Say", Default = false})


    MainMisc:AddToggle("Spawn Immunity", {Text = "Spawn Immunity", Default = false})
	local SpawnImmDep = MainMisc:AddDependencyBox()
	SpawnImmDep:AddSlider("Spawn Immunity Time", {Text = "Spawn Immunity Time", Min = 0, Max = 20, Default = 4, Rounding = 0, Suffix = "s"})
	SpawnImmDep:SetupDependencies({ { Toggles["Spawn Immunity"], true } })

        local SoundsGroup = MiscTab:AddLeftGroupbox("Sounds")
    SoundsGroup:AddToggle("Hitsound Enabled", {Text = "Hitsound", Default = false})
    local HitSoundDep = SoundsGroup:AddDependencyBox()
    HitSoundDep:AddDropdown("Hitsound", {Text = "Hitsound Type", Values = {"Disabled", "1", "Bag", "Baimware", "Bat", "Beautiful", "Beepo", "Bell", "Bonk", "Bow", "Bruh", "Cod", "CSGO", "Denied", "Electro", "Epic", "Fatality", "Gamesense", "Godlike", "Headshot", "Killingspree", "Laser Beam", "Laugh", "Lessgo", "Matchine gun", "MCOOF", "Minecraft", "Minecraft XP", "Neverlose", "Osu", "Osu Mint", "Overwatch", "Ownage", "Percussion", "Pop", "Pow", "Quek", "Ray", "Retro", "Retro loud", "Rocket", "Rust", "Skeet", "Slap", "Snap", "Sorry", "Space", "Squash", "Supersmash", "TF2", "TF2 Pan", "Ultra Kill", "Ultrakill", "Vine Boom", "Vortex", "Win"}, Default = 1, Callback = function(Value)
        PreviewSound("Hit", Value)
    end})
    HitSoundDep:AddSlider("Hitsound Volume", {Text = "Hitsound Volume", Min = 0, Max = 100, Default = 50, Rounding = 0, Suffix = "%"})
    HitSoundDep:AddSlider("Hitsound Speed", {Text = "Hitsound Speed", Min = 0.1, Max = 2, Default = 1, Rounding = 2})
    HitSoundDep:SetupDependencies({ { Toggles["Hitsound Enabled"], true } })

    SoundsGroup:AddToggle("Killsound Enabled", {Text = "Killsound", Default = false})
    local KillSoundDep = SoundsGroup:AddDependencyBox()
    KillSoundDep:AddDropdown("Killsound", {Text = "Killsound Type", Values = {"Disabled", "1", "Bag", "Baimware", "Bat", "Beautiful", "Beepo", "Bell", "Bonk", "Bow", "Bruh", "Cod", "CSGO", "Denied", "Electro", "Epic", "Fatality", "Gamesense", "Godlike", "Headshot", "Killingspree", "Laser Beam", "Laugh", "Lessgo", "Matchine gun", "MCOOF", "Minecraft", "Minecraft XP", "Neverlose", "Osu", "Osu Mint", "Overwatch", "Ownage", "Percussion", "Pop", "Pow", "Quek", "Ray", "Retro", "Retro loud", "Rocket", "Rust", "Skeet", "Slap", "Snap", "Sorry", "Space", "Squash", "Supersmash", "TF2", "TF2 Pan", "Ultra Kill", "Ultrakill", "Vine Boom", "Vortex", "Win"}, Default = 1, Callback = function(Value)
        PreviewSound("Kill", Value)
    end})
    KillSoundDep:AddSlider("Killsound Volume", {Text = "Killsound Volume", Min = 0, Max = 100, Default = 50, Rounding = 0, Suffix = "%"})
    KillSoundDep:AddSlider("Killsound Speed", {Text = "Killsound Speed", Min = 0.1, Max = 2, Default = 1, Rounding = 2})
    KillSoundDep:SetupDependencies({ { Toggles["Killsound Enabled"], true } })

local MiscExtra = MiscTab:AddCenterGroupbox("Extra")
	WorldChanger:AddToggle("Ambience", {Text = "Ambience", Default = false, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
		:AddColorPicker("Ambience Color 1", {Default = Color3.fromRGB(128, 128, 128), Title = "Ambient", Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
		:AddColorPicker("Ambience Color 2", {Default = Color3.fromRGB(128, 128, 128), Title = "Outdoor", Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	WorldChanger:AddToggle("Exposure", {Text = "Exposure", Default = false, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	local ExposureDep = WorldChanger:AddDependencyBox()
	ExposureDep:AddSlider("Exposure Amount", {Text = "Exposure Amount", Min = -5, Max = 5, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	ExposureDep:SetupDependencies({ { Toggles["Exposure"], true } })
	WorldChanger:AddToggle("Colorshift", {Text = "Color Shift", Default = false, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
		:AddColorPicker("Colorshift Color 1", {Default = Color3.fromRGB(255, 255, 255), Title = "Top", Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
		:AddColorPicker("Colorshift Color 2", {Default = Color3.fromRGB(255, 255, 255), Title = "Bottom", Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	WorldChanger:AddToggle("Bloom", {Text = "Bloom", Default = false, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	local BloomDep = WorldChanger:AddDependencyBox()
	BloomDep:AddSlider("Bloom Intensity", {Text = "Bloom Intensity", Min = 0, Max = 100, Default = 1, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	BloomDep:AddSlider("Bloom Size", {Text = "Bloom Size", Min = 0, Max = 100, Default = 24, Rounding = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	BloomDep:AddSlider("Bloom Threshold", {Text = "Bloom Threshold", Min = 0, Max = 50, Default = 2, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	BloomDep:SetupDependencies({ { Toggles["Bloom"], true } })
	WorldChanger:AddToggle("Time", {Text = "Custom Clock Time", Default = false, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	local TimeDep = WorldChanger:AddDependencyBox()
	TimeDep:AddSlider("Time Factor", {Text = "Clock Time", Min = 0, Max = 24, Default = 14, Rounding = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	TimeDep:SetupDependencies({ { Toggles["Time"], true } })
	WorldChanger:AddDropdown("Custom Skybox", {Text = "Skybox", Values = {"Default", "Nebula", "Blue Nebula", "Setting Hills", "Blue Aurora", "Red Aurora", "Pink Vision", "Twillight", "Distopia", "Peaceful"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.Sky then Visuals.Sky() end
			if Visuals and Visuals.World then Visuals.World() end
		end)
	end})
	MiscExtra:AddToggle("Custom ShootSound", {Text = "Custom Shoot Sound", Default = false})
	local ShootSoundDep = MiscExtra:AddDependencyBox()
	ShootSoundDep:AddInput("ShootSound Custom Id", {Text = "Custom Sound ID", Default = "", Placeholder = "rbxassetid or numbers"})
	ShootSoundDep:AddSlider("ShootSound Volume", {Text = "Shoot Volume", Min = 0, Max = 100, Default = 50, Rounding = 0})
	ShootSoundDep:AddSlider("ShootSound Speed", {Text = "Shoot Speed", Min = 0.1, Max = 2, Default = 1, Rounding = 2})
	ShootSoundDep:AddToggle("ShootSound Play Original", {Text = "Play Original Shoot", Default = false})
	ShootSoundDep:AddSlider("ShootSound Original Volume", {Text = "Original Volume", Min = 0, Max = 100, Default = 100, Rounding = 0})
	ShootSoundDep:SetupDependencies({ { Toggles["Custom ShootSound"], true } })

	MiscExtra:AddToggle("Vote Kick On Death", {Text = "Vote Kick On Death", Default = false})
	MiscExtra:AddToggle("Hop Vote Kick", {Text = "Hop Vote Kick", Default = false})
    MiscExtra:AddToggle("Automatic Vote Kick", {Text = "Automatic Vote Kick", Default = false})
	local AutoVkDep = MiscExtra:AddDependencyBox()
	AutoVkDep:AddDropdown("Vote Kick Mode", {Text = "Vote Kick Mode", Values = {"Yes", "Dismiss", "No"}, Default = 1})
	AutoVkDep:SetupDependencies({ { Toggles["Automatic Vote Kick"], true } })
	MiscExtra:AddButton({
		Text = "Vote Kick Random",
		Func = function()
			pcall(function()
				local LP = game:GetService("Players").LocalPlayer
				local Candidates = {}
				for _, P in ipairs(game:GetService("Players"):GetPlayers()) do
					if P ~= LP and P.Team ~= LP.Team then
						Candidates[#Candidates + 1] = P
					end
				end
				if #Candidates < 1 then
					for _, P in ipairs(game:GetService("Players"):GetPlayers()) do
						if P ~= LP then Candidates[#Candidates + 1] = P end
					end
				end
				if #Candidates < 1 then
					if Library and Library.Notify then Library:Notify("No players to votekick", 2) end
					return
				end
				local Target = Candidates[math.random(1, #Candidates)]
				if Shared and Shared.NetworkClient then
					Shared.NetworkClient:send("modcmd", string.format("/votekick:%s:cheats", Target.Name))
					if Library and Library.Notify then Library:Notify("Votekick: " .. Target.Name, 2) end
				end
			end)
		end
	})  

	local function RefreshTracerCache()
		pcall(function()
			if not Visuals or not Visuals.Cache then return end
			local function Apply(Beam, ColorName)
				if not Beam then return end
				local TextureName = "Obelus"
				if Flags["Tracer Texture"] and type(Flags["Tracer Texture"].Value) == "string" then
					TextureName = Flags["Tracer Texture"].Value
				end
				local Props = TracerProperties and TracerProperties[TextureName]
				if type(Props) == "table" then
					for Index, Value in next, Props do
						pcall(function() Beam[Index] = Value end)
					end
				end
				local CF = Flags[ColorName]
				local Col = CF and (CF.Color or CF.Value)
				if typeof(Col) == "Color3" then
					pcall(function() Beam.Color = ColorSequence.new(Col) end)
				end
			end
			Apply(Visuals.Cache.LocalBeam, "Local Tracer Color")
			Apply(Visuals.Cache.EnemyBeam, "Enemy Tracer Color")
			Apply(Visuals.Cache.TeamBeam, "Team Tracer Color")
			Apply(Visuals.Cache.GrenadeBeam, "Grenade Tracer Color")
		end)
	end

	TracersTab:AddToggle("Local Tracer Enabled", {Text = "Local Tracers", Default = false})
		:AddColorPicker("Local Tracer Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Callback = function()
			RefreshTracerCache()
		end})
	TracersTab:AddToggle("Enemy Tracer Enabled", {Text = "Enemy Tracers", Default = false})
		:AddColorPicker("Enemy Tracer Color", {Default = Color3.fromRGB(255, 0, 0), Title = "Color", Callback = function()
			RefreshTracerCache()
		end})
	TracersTab:AddToggle("Team Tracer Enabled", {Text = "Team Tracers", Default = false})
		:AddColorPicker("Team Tracer Color", {Default = Color3.fromRGB(0, 150, 255), Title = "Color", Callback = function()
			RefreshTracerCache()
		end})
	TracersTab:AddToggle("Grenade Tracer Enabled", {Text = "Grenade Tracers", Default = false})
		:AddColorPicker("Grenade Tracer Color", {Default = Color3.fromRGB(255, 255, 0), Title = "Color", Callback = function()
			RefreshTracerCache()
		end})
	TracersTab:AddSlider("Tracer Time", {Text = "Tracer Lifetime", Min = 0.1, Max = 5, Default = 1, Rounding = 2, Suffix = "s"})
	TracersTab:AddDropdown("Tracer Texture", {Text = "Tracer Texture", Values = {"Obelus", "Lightning", "Lightning Bolt", "Lightning Bolt2", "Laser", "Red Laser", "DNA"}, Default = 1, Callback = function()
		RefreshTracerCache()
	end})
	TracersTab:AddToggle("Bullet Impacts", {Text = "Bullet Impacts", Default = false})
		:AddColorPicker("Bullet Impacts Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})
	MiscExtra:AddSlider("Dropped Weapon Refresh Rate", {Text = "Dropped Weapon Hz", Min = 1, Max = 60, Default = 10, Rounding = 0})

    local MiscMovement = MiscTab:AddRightGroupbox("Movement")
	MiscMovement:AddToggle("WalkSpeed Enabled", {Text = "WalkSpeed", Default = false})
		:AddKeyPicker("WalkSpeed Keybind", {Default = "None", Mode = "Toggle", Text = "WalkSpeed", SyncToggleState = true})
	local WalkDep = MiscMovement:AddDependencyBox()
	WalkDep:AddSlider("WalkSpeed Value", {Text = "WalkSpeed Value", Min = 1, Max = 100, Default = 16, Rounding = 1})
	WalkDep:SetupDependencies({ { Toggles["WalkSpeed Enabled"], true } })

	MiscMovement:AddToggle("Fly Enabled", {Text = "Fly", Default = false})
		:AddKeyPicker("Fly Keybind", {Default = "None", Mode = "Toggle", Text = "Fly", SyncToggleState = true})
	local FlyDep = MiscMovement:AddDependencyBox()
	FlyDep:AddSlider("Fly Speed", {Text = "Fly Speed", Min = 1, Max = 100, Default = 50, Rounding = 1})
	FlyDep:SetupDependencies({ { Toggles["Fly Enabled"], true } })

	MiscMovement:AddToggle("Bunny Hop Enabled", {Text = "Bunny Hop", Default = false})
	MiscMovement:AddToggle("Air Strafe Enabled", {Text = "Air Strafe", Default = false})
	local StrafeDep = MiscMovement:AddDependencyBox()
	StrafeDep:AddSlider("Air Strafe Boost", {Text = "Air Strafe Boost", Min = 1, Max = 100, Default = 20, Rounding = 1})
	StrafeDep:SetupDependencies({ { Toggles["Air Strafe Enabled"], true } })

    MiscMovement:AddToggle("Speed Bypass", {Text = "Speed Bypass", Default = false, Risky = true})
	MiscMovement:AddToggle("Slow Walk Enabled", {Text = "Slow Walk", Default = false})
	local SlowDep = MiscMovement:AddDependencyBox()
	SlowDep:AddSlider("Slow Walk Speed", {Text = "Slow Walk Divider", Min = 1, Max = 10, Default = 2, Rounding = 1})
	SlowDep:SetupDependencies({ { Toggles["Slow Walk Enabled"], true } })


	AimGroup:AddToggle("AimAssist Enabled", {Text = "Enabled", Default = false})
		:AddKeyPicker("Aim Assist Keybind", {Default = "None", Mode = "Hold", Text = "Aim Assist", SyncToggleState = true})

	local AimDep = AimGroup:AddDependencyBox()
	AimDep:AddDropdown("AimAssist Selection", {Text = "Target Selection", Values = {"Adaptive", "Lock"}, Default = 1})
	AimDep:AddToggle("AimAssist Require Mouse", {Text = "Require Mouse Movement", Default = false})
	AimDep:AddToggle("AimAssist VisibleCheck", {Text = "Visible Check", Default = true})
	AimDep:AddToggle("AimAssist Curve Enabled", {Text = "Aim Curve", Default = false, Callback = function(v)
		pcall(function()
			if Legitbot and Legitbot.SetCurveGraphVisible then
				Legitbot.SetCurveGraphVisible(v)
			end
		end)
	end})

	do
		if not Options["AimAssist Curve"] then
			Options["AimAssist Curve"] = { Type = "Slider", Value = 1 }
			Flags["AimAssist Curve"] = Options["AimAssist Curve"]
		end

		local GraphHolder = Library:Create('Frame', {
			BackgroundColor3 = Library.BackgroundColor or Color3.fromRGB(13, 13, 13),
			BorderColor3 = Library.OutlineColor or Color3.fromRGB(40, 40, 40),
			BorderSizePixel = 1,
			Size = UDim2.new(1, -4, 0, 110),
			Visible = false,
			ZIndex = 5,
			Parent = AimDep.Container,
		})
		Library:AddToRegistry(GraphHolder, {
			BackgroundColor3 = 'BackgroundColor',
			BorderColor3 = 'OutlineColor',
		})
		local GraphTitle = Library:CreateLabel({
			Size = UDim2.new(1, -8, 0, 14),
			Position = UDim2.fromOffset(4, 2),
			TextSize = 12,
			Text = "Aim Curve — drag handle",
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 6,
			Parent = GraphHolder,
		})
		local Plot = Library:Create('Frame', {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -12, 1, -22),
			Position = UDim2.fromOffset(6, 18),
			ClipsDescendants = true,
			ZIndex = 6,
			Parent = GraphHolder,
		})
		local BaseLine = Library:Create('Frame', {
			BackgroundColor3 = Color3.fromRGB(50, 50, 55),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, -1),
			ZIndex = 6,
			Parent = Plot,
		})
		local CurveDots = {}
		for n = 1, 28 do
			local D = Library:Create('Frame', {
				Size = UDim2.fromOffset(3, 3),
				BorderSizePixel = 0,
				BackgroundColor3 = Library.AccentColor or Color3.fromRGB(144, 130, 255),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ZIndex = 7,
				Parent = Plot,
			})
			Library:AddToRegistry(D, { BackgroundColor3 = 'AccentColor' })
			CurveDots[n] = D
		end
		local Handle = Library:Create('Frame', {
			Size = UDim2.fromOffset(12, 12),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = 10,
			Parent = Plot,
		})
		local HandleCorner = Library:Create('UICorner', {
			CornerRadius = UDim.new(1, 0),
			Parent = Handle,
		})
		Library:AddToRegistry(Handle, { BackgroundColor3 = 'AccentColor' })

		Legitbot = Legitbot or M.Legitbot
		Legitbot.CurveGraphHolder = GraphHolder
		Legitbot.CurveGraphTitle = GraphTitle
		Legitbot.CurveGraphDots = CurveDots
		Legitbot.CurveGraphPlot = Plot
		Legitbot.CurveHandle = Handle

		Legitbot.CurveHandlePos = { X = 0.5, Y = 0.5 } 

		local function ApplyHandleFromMouse(InputPos)
			local AbsPos = Plot.AbsolutePosition
			local AbsSize = Plot.AbsoluteSize
			local W = AbsSize.X
			local H = AbsSize.Y
			if W < 20 then W = 180 end
			if H < 20 then H = 80 end

			local RelX = InputPos.X - AbsPos.X
			local RelY = InputPos.Y - AbsPos.Y
			RelX = math.clamp(RelX, 0, W)
			RelY = math.clamp(RelY, 0, H)

			Handle.Position = UDim2.fromOffset(RelX, RelY)

			local NX = RelX / W
			local NY = RelY / H 
			Legitbot.CurveHandlePos.X = NX
			Legitbot.CurveHandlePos.Y = NY

			local Curve = 0.1 + (1 - NY) * 2.9
			if Options["AimAssist Curve"] then
				Options["AimAssist Curve"].Value = Curve
			end

			for n = 1, #CurveDots do
				local T = (n - 1) / (#CurveDots - 1)
				local Yv = T ^ Curve
				CurveDots[n].Position = UDim2.fromOffset(T * W, (1 - Yv) * H)
			end
			if GraphTitle then
				GraphTitle.Text = string.format("Aim Curve (%.2f) — drag anywhere", Curve)
			end
		end

		Legitbot.RefreshCurveGraph = function()
			if not GraphHolder.Visible then return end
			local Curve = 1
			if Options["AimAssist Curve"] and type(Options["AimAssist Curve"].Value) == "number" then
				Curve = Options["AimAssist Curve"].Value
			end
			if Curve <= 0 then Curve = 1 end
			local W = Plot.AbsoluteSize.X
			local H = Plot.AbsoluteSize.Y
			if W < 20 then W = 180 end
			if H < 20 then H = 80 end
			for n = 1, #CurveDots do
				local T = (n - 1) / (#CurveDots - 1)
				local Yv = T ^ Curve
				CurveDots[n].Position = UDim2.fromOffset(T * W, (1 - Yv) * H)
			end
			local NX = Legitbot.CurveHandlePos and Legitbot.CurveHandlePos.X or 0.5
			local NY = Legitbot.CurveHandlePos and Legitbot.CurveHandlePos.Y or 0.5
			if not Legitbot.CurveDragged then
				NY = 1 - ((Curve - 0.1) / 2.9)
				NX = 0.5
				Legitbot.CurveHandlePos.X = NX
				Legitbot.CurveHandlePos.Y = NY
			end
			Handle.Position = UDim2.fromOffset(NX * W, NY * H)
			if GraphTitle then
				GraphTitle.Text = string.format("Aim Curve (%.2f) — drag anywhere", Curve)
			end
		end

		Legitbot.SetCurveGraphVisible = function(Visible)
			GraphHolder.Visible = Visible == true
			if AimDep and AimDep.Resize then
				pcall(function() AimDep:Resize() end)
			end
			if AimGroup.Resize then
				pcall(function() AimGroup:Resize() end)
			end
			if Visible then
				task.defer(function()
					if Legitbot.RefreshCurveGraph then
						Legitbot.RefreshCurveGraph()
					end
				end)
			end
		end

		local Dragging = false
		local function BeginDrag(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				Legitbot.CurveDragged = true
				ApplyHandleFromMouse(Input.Position)
			end
		end

		Handle.InputBegan:Connect(BeginDrag)
		Plot.InputBegan:Connect(BeginDrag)
		GraphHolder.InputBegan:Connect(BeginDrag)

		UserInputService.InputChanged:Connect(function(Input)
			if not Dragging then return end
			if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			if not GraphHolder.Visible then return end
			ApplyHandleFromMouse(Input.Position)
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)

		AimDep:AddBlank(4)
		AimDep:Resize()
	end

	AimDep:AddDropdown("AimAssist Hitparts", {Text = "Hitboxes", Values = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, Default = 1, Multi = true})
	AimDep:AddSlider("AimAssist SwitchDelay", {Text = "Switch Delay", Min = 0, Max = 2500, Default = 350, Rounding = 0, Suffix = "ms"})
	AimDep:AddSlider("AimAssist Smoothness", {Text = "Smoothness", Min = 0, Max = 100, Default = 35, Rounding = 0})
	AimDep:AddSlider("AimAssist Fov", {Text = "FOV", Min = 1, Max = 90, Default = 12, Rounding = 1, Suffix = "°"})
	AimDep:AddSlider("AimAssist MaxDistance", {Text = "Max Distance", Min = 1, Max = 2000, Default = 500, Rounding = 0, Suffix = "m"})
	AimDep:SetupDependencies({ { Toggles["AimAssist Enabled"], true } })


	TriggerGroup:AddToggle("TriggerBot Enabled", {Text = "Enabled", Default = false})
		:AddKeyPicker("Triggerbot Keybind", {Default = "None", Mode = "Toggle", Text = "Triggerbot", SyncToggleState = true})

	local TriggerDep = TriggerGroup:AddDependencyBox()
	TriggerDep:AddToggle("TriggerBot AutoWall", {Text = "Use Autowall", Default = false})
	TriggerDep:AddDropdown("TriggerBot Hitpart", {Text = "Hitboxes", Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Closest"}, Default = 1, Multi = true})
	TriggerDep:AddSlider("TriggerBot ShootChance", {Text = "Shoot Chance", Min = 1, Max = 100, Default = 100, Rounding = 0, Suffix = "%"})
	TriggerDep:AddSlider("TriggerBot Reaction Time", {Text = "Reaction Time", Min = 0, Max = 950, Default = 115, Rounding = 0, Suffix = "ms"})
	TriggerDep:AddSlider("TriggerBot FOV", {Text = "FOV", Min = 1, Max = 60, Default = 8, Rounding = 1, Suffix = "°"})
	TriggerDep:AddSlider("TriggerBot MaxDistance", {Text = "Max Distance", Min = 1, Max = 2000, Default = 500, Rounding = 0, Suffix = "m"})
	TriggerDep:SetupDependencies({ { Toggles["TriggerBot Enabled"], true } })

	SilentGroup:AddToggle("SilentAim Enabled", {Text = "Enabled", Default = false})
		:AddKeyPicker("SilentAim Keybind", {Default = "None", Mode = "Toggle", Text = "Silent Aim", SyncToggleState = true})

	local SilentDep = SilentGroup:AddDependencyBox()
	SilentDep:AddToggle("SilentAim AutoWall", {Text = "Use Autowall", Default = false})
	SilentDep:AddDropdown("SilentAim Selection", {Text = "Target Selection", Values = {"Adaptive", "Lock"}, Default = 1})
	SilentDep:AddDropdown("SilentAim Hitpart", {Text = "Hitboxes", Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Closest"}, Default = 1, Multi = true})
	SilentDep:AddSlider("SilentAim Spread Amount", {Text = "Spread Amount", Min = 0, Max = 100, Default = 60, Rounding = 0, Suffix = "%"})
	SilentDep:AddSlider("SilentAim SwitchDelay", {Text = "Switch Delay", Min = 0, Max = 5000, Default = 1250, Rounding = 0, Suffix = "ms"})
	SilentDep:AddSlider("SilentAim Fov", {Text = "FOV", Min = 1, Max = 120, Default = 40, Rounding = 1, Suffix = "°"})
	SilentDep:AddSlider("SilentAim MaxDistance", {Text = "Max Distance", Min = 1, Max = 2000, Default = 500, Rounding = 0, Suffix = "m"})
	SilentDep:AddSlider("SilentAim Hitchance", {Text = "Hit Chance", Min = 1, Max = 100, Default = 45, Rounding = 0, Suffix = "%"})
	SilentDep:SetupDependencies({ { Toggles["SilentAim Enabled"], true } })

	local FovBox = LegitTab:AddCenterTabbox("FOV Circles")
	local AimFovTab = FovBox:AddTab("Aim Assist")
	local SilentFovTab = FovBox:AddTab("Silent Aim")
	local TriggerFovTab = FovBox:AddTab("Trigger Bot")

	AimFovTab:AddToggle("AimAssist Show FOV", {Text = "Show FOV Circle", Default = false})
		:AddColorPicker("AimAssist FOV Outline 1", {Default = Color3.fromRGB(144, 130, 255), Title = "Outline 1"})
		:AddColorPicker("AimAssist FOV Outline 2", {Default = Color3.fromRGB(80, 60, 200), Title = "Outline 2"})
		local AimAssistFovDep = AimFovTab:AddDependencyBox()
	AimAssistFovDep:AddToggle("AimAssist FOV Fill", {Text = "FOV Fill", Default = false})
		:AddColorPicker("AimAssist FOV Fill 1", {Default = Color3.fromRGB(144, 130, 255), Title = "Fill 1", Transparency = 0.7})
		:AddColorPicker("AimAssist FOV Fill 2", {Default = Color3.fromRGB(80, 60, 200), Title = "Fill 2", Transparency = 0.85})
		AimAssistFovDep:AddSlider("AimAssist FOV Thickness", {Text = "Outline Thickness", Min = 1, Max = 6, Default = 2, Rounding = 0})
		AimAssistFovDep:AddSlider("AimAssist FOV Outline Trans", {Text = "Outline Transparency", Min = 0, Max = 1, Default = 0.15, Rounding = 2})
		AimAssistFovDep:AddSlider("AimAssist FOV Fill Trans", {Text = "Fill Transparency", Min = 0, Max = 1, Default = 0.75, Rounding = 2})
		AimAssistFovDep:AddSlider("AimAssist FOV Outline Rot", {Text = "Outline Gradient Rot", Min = 0, Max = 360, Default = 45, Rounding = 0, Suffix = "°"})
		AimAssistFovDep:AddSlider("AimAssist FOV Fill Rot", {Text = "Fill Gradient Rot", Min = 0, Max = 360, Default = 90, Rounding = 0, Suffix = "°"})

		AimAssistFovDep:SetupDependencies({ { Toggles["AimAssist Show FOV"], true } })

	SilentFovTab:AddToggle("SilentAim Show FOV", {Text = "Show FOV Circle", Default = false})
		:AddColorPicker("SilentAim FOV Outline 1", {Default = Color3.fromRGB(0, 255, 180), Title = "Outline 1"})
		:AddColorPicker("SilentAim FOV Outline 2", {Default = Color3.fromRGB(0, 180, 120), Title = "Outline 2"})
	local SilentAimFovDep = SilentFovTab:AddDependencyBox()
	SilentAimFovDep:AddToggle("SilentAim FOV Fill", {Text = "FOV Fill", Default = false})
		:AddColorPicker("SilentAim FOV Fill 1", {Default = Color3.fromRGB(0, 255, 180), Title = "Fill 1", Transparency = 0.7})
		:AddColorPicker("SilentAim FOV Fill 2", {Default = Color3.fromRGB(0, 180, 120), Title = "Fill 2", Transparency = 0.85})
	SilentAimFovDep:AddSlider("SilentAim FOV Thickness", {Text = "Outline Thickness", Min = 1, Max = 6, Default = 2, Rounding = 0})
	SilentAimFovDep:AddSlider("SilentAim FOV Outline Trans", {Text = "Outline Transparency", Min = 0, Max = 1, Default = 0.15, Rounding = 2})
	SilentAimFovDep:AddSlider("SilentAim FOV Fill Trans", {Text = "Fill Transparency", Min = 0, Max = 1, Default = 0.75, Rounding = 2})
	SilentAimFovDep:AddSlider("SilentAim FOV Outline Rot", {Text = "Outline Gradient Rot", Min = 0, Max = 360, Default = 135, Rounding = 0, Suffix = "°"})
	SilentAimFovDep:AddSlider("SilentAim FOV Fill Rot", {Text = "Fill Gradient Rot", Min = 0, Max = 360, Default = 90, Rounding = 0, Suffix = "°"})
	SilentAimFovDep:SetupDependencies({ { Toggles["SilentAim Show FOV"], true } })

	TriggerFovTab:AddToggle("TriggerBot Show FOV", {Text = "Show FOV Circle", Default = false})
		:AddColorPicker("TriggerBot FOV Outline 1", {Default = Color3.fromRGB(255, 80, 80), Title = "Outline 1"})
		:AddColorPicker("TriggerBot FOV Outline 2", {Default = Color3.fromRGB(200, 40, 40), Title = "Outline 2"})
	local TriggerBotFovDep = TriggerFovTab:AddDependencyBox()
	TriggerBotFovDep:AddToggle("TriggerBot FOV Fill", {Text = "FOV Fill", Default = false})
		:AddColorPicker("TriggerBot FOV Fill 1", {Default = Color3.fromRGB(255, 80, 80), Title = "Fill 1", Transparency = 0.7})
		:AddColorPicker("TriggerBot FOV Fill 2", {Default = Color3.fromRGB(200, 40, 40), Title = "Fill 2", Transparency = 0.85})
	TriggerBotFovDep:AddSlider("TriggerBot FOV Thickness", {Text = "Outline Thickness", Min = 1, Max = 6, Default = 2, Rounding = 0})
	TriggerBotFovDep:AddSlider("TriggerBot FOV Outline Trans", {Text = "Outline Transparency", Min = 0, Max = 1, Default = 0.15, Rounding = 2})
	TriggerBotFovDep:AddSlider("TriggerBot FOV Fill Trans", {Text = "Fill Transparency", Min = 0, Max = 1, Default = 0.75, Rounding = 2})
	TriggerBotFovDep:AddSlider("TriggerBot FOV Outline Rot", {Text = "Outline Gradient Rot", Min = 0, Max = 360, Default = 0, Rounding = 0, Suffix = "°"})
	TriggerBotFovDep:AddSlider("TriggerBot FOV Fill Rot", {Text = "Fill Gradient Rot", Min = 0, Max = 360, Default = 90, Rounding = 0, Suffix = "°"})
	TriggerBotFovDep:SetupDependencies({ { Toggles["TriggerBot Show FOV"], true } })

	GunMods:AddToggle("Gun Force Hitbox", {Text = "Force Hitbox", Default = false, Risky = true})
	local GunHitDep = GunMods:AddDependencyBox()
	GunHitDep:AddDropdown("Gun Hitboxes", {Text = "Hitboxes", Values = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, Default = 1, Multi = true})
	GunHitDep:SetupDependencies({ { Toggles["Gun Force Hitbox"], true } })

	GunMods:AddSlider("Camera Recoil Adjustment", {Text = "Camera Recoil Adjustment", Min = 0, Max = 100, Default = 100, Rounding = 0, Suffix = "%"})
	GunMods:AddSlider("Weapon Recoil Adjustment", {Text = "Weapon Recoil Adjustment", Min = 0, Max = 100, Default = 100, Rounding = 0, Suffix = "%"})
	GunMods:AddSlider("Spread Adjustment", {Text = "Spread Adjustment", Min = 0, Max = 100, Default = 100, Rounding = 0, Suffix = "%"})

	GrenadeMods:AddSlider("Grenade Fuse Time", {Text = "Grenade Fuse Time", Min = 0, Max = 15, Default = 5, Rounding = 1, Suffix = "s"})

	GrenadeMods:AddSlider("Grenade Speed Adjustment", {Text = "Grenade Speed Adjustment", Min = 0, Max = 350, Default = 100, Rounding = 0, Suffix = "%"})

	GunMods:AddToggle("No Weapon Sway", {Text = "No Weapon Sway", Default = false})

	GunMods:AddToggle("Instant Equip", {Text = "Instant Equip", Default = false})

	GunMods:AddToggle("Instant UnEquip", {Text = "Instant Unequip", Default = false})

	GunMods:AddToggle("Instant Aim", {Text = "Instant Aim", Default = false})

	GunMods:AddToggle("Instant Reload", {Text = "Instant Reload", Default = false})

	GunMods:AddToggle("Instant Chamber", {Text = "Instant Chamber", Default = false})

	GunMods:AddToggle("No ADS Restrictions", {Text = "No ADS Restrictions", Default = false})

	GunMods:AddToggle("No Scope Overlay", {Text = "No Scope Overlay", Default = false})

	GunMods:AddToggle("No Scope Sway", {Text = "No Scope Sway", Default = false})

	GunMods:AddSlider("Fire Rate Multiplier", {Text = "Fire Rate Multiplier", Min = 0.25, Max = 10, Default = 1, Rounding = 2, Suffix = "x"})

    GunMods:AddToggle("Custom Fire Mode", {Text = "Custom Fire Mode", Default = false})
	local FireModeDep = GunMods:AddDependencyBox()
    FireModeDep:AddDropdown("Fire Mode", {Text = "Fire Mode", Values = {"Semi", "Auto", "Burst", "Binary"}, Default = 2, Multi = false})
	FireModeDep:SetupDependencies({ { Toggles["Custom Fire Mode"], true } })


	KnifeMods:AddToggle("Knife Force Hitbox", {Text = "Force Hitbox", Default = false, Risky = true})

	KnifeMods:AddDropdown("Knife Hitboxes", {Text = "Hitboxes", Values = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, Default = 1, Multi = true})

    Ragebot:AddToggle("Ragebot Enabled", {Text = "Enabled", Default = false, Risky = true})
		:AddKeyPicker("Ragebot Keybind", {Default = "None", Mode = "Toggle", Text = "Ragebot", SyncToggleState = true})

	local RageDep = Ragebot:AddDependencyBox()
    RageDep:AddDropdown("Ragebot Hitscan Point", {
        Text = "Hitbox",
        Values = {"Head", "Torso", "UpperTorso", "LowerTorso", "LeftArm", "RightArm", "LeftLeg", "RightLeg"},
        Default = 1
    })
	RageDep:AddSlider("Ragebot Origin Radius", {Text = "Origin Radius", Min = 2, Max = 100, Default = 10, Rounding = 2, Suffix = "m"})
	RageDep:SetupDependencies({ { Toggles["Ragebot Enabled"], true } })

	Ragebot:AddSlider("Ragebot Origin Points", {Text = "Origin Scans", Min = 2, Max = 40, Default = 3, Rounding = 0, Suffix = "x"})

	Ragebot:AddSlider("Ragebot Point Radius", {Text = "Hit Radius", Min = 2, Max = 9.9, Default = 7, Rounding = 2, Suffix = "m"})

	Ragebot:AddSlider("Ragebot Point Points", {Text = "Hit Scans", Min = 2, Max = 40, Default = 3, Rounding = 0, Suffix = "x"})

	Ragebot:AddSlider("Ragebot Maximum Scans", {Text = "Maximum Autowall Scans", Min = 1, Max = 10000, Default = 10000, Rounding = 0, Suffix = "x"})

	Ragebot:AddToggle("Ragebot Auto Peek", {Text = "Auto Peek", Default = false, Risky = true})

	Ragebot:AddToggle("Ragebot Peek Grounded", {Text = "Force Ground Peek", Default = true})

	Ragebot:AddToggle("Ragebot Peek Up Peek", {Text = "Allow Up Peek", Default = false})

	Ragebot:AddSlider("Ragebot Peek Radius", {Text = "Peek Radius", Min = 5, Max = 500, Default = 50, Rounding = 2, Suffix = "m"})

	Ragebot:AddSlider("Ragebot Peek Points", {Text = "Peek Scans", Min = 1, Max = 40, Default = 2, Rounding = 0, Suffix = "x"})

	Ragebot:AddToggle("Ragebot Fill Peek", {Text = "Randomise Peek Radius", Default = false})

	Ragebot:AddToggle("Ragebot Autopeek Compensate Ping", {Text = "Compensate Ping On Retreat", Default = true})

	RageExtra:AddToggle("Ragebot Prevent Overfire", {Text = "Prevent Overfire", Default = false})

	RageExtra:AddDropdown("Ragebot Scanning Modes", {Text = "Scanning Modes", Values = {"Sphere", "Cardinals", "Random"}, Default = 1, Multi = true})

	RageExtra:AddDropdown("Ragebot Sort Mode", {Text = "Sorting Mode", Values = {"Highest Damage", "Lowest Hit", "Lowest Origin", "Most Accurate"}, Default = 1})

	RageExtra:AddDropdown("Ragebot Backtrack Sorting", {Text = "Backtrack Sorting", Values = {"Chronological", "Reverse Chronological", "Random"}, Default = 2})

	RageExtra:AddSlider("Ragebot Backtrack Amount", {Text = "Backtrack Time", Min = 100, Max = 4950, Default = 3000, Rounding = 0, Suffix = "ms"})

	RageExtra:AddSlider("Ragebot Backtrack Scans", {Text = "Backtrack Scans", Min = 2, Max = 50, Default = 2, Rounding = 0, Suffix = "x"})

	AntiAim:AddToggle("Fake Position Enabled", {Text = "Fake Position", Default = false, Risky = true, Callback = function(Value)
		local LocalInfo = Info.LocalPlayer
		if not Value and LocalInfo then
			LocalInfo.Faked = false
		end
	end}):AddKeyPicker("Fake Position Keybind", {Default = "None", Mode = "Toggle", Text = "Fake Position", SyncToggleState = true})

	AntiAim:AddToggle("Anti Aim Enabled", {Text = "Anti Aim Enabled", Default = false, Risky = true})
		:AddKeyPicker("Anti Aim Keybind", {Default = "None", Mode = "Toggle", Text = "Anti Aim", SyncToggleState = true})

	AntiAim:AddDropdown("Anti Aim Pitch", {Text = "Pitch", Values = {"None", "Full Up", "Normal Up", "Half Up", "Full Down", "Normal Down", "Half Down", "Zero", "Randomise", "Rotate", "Custom"}, Default = 1, Callback = function(Value)
		if Value == "Custom" then
		elseif Value == "Rotate" then
		end
	end})

	AntiAim:AddDropdown("Anti Aim Yaw", {Text = "Yaw", Values = {"None", "Backwards", "Randomise", "Rotate", "Spin", "Tweak", "Cycle", "Custom"}, Default = 1})

	AntiAim:AddSlider("Anti Aim Custom Pitch", {Text = "Custom Pitch", Min = -2, Max = 2, Default = 0, Rounding = 2, Suffix = "°"})

	AntiAim:AddSlider("Anti Aim Custom Yaw", {Text = "Custom Yaw", Min = -180, Max = 180, Default = 0, Rounding = 2, Suffix = "°"})

	AntiAim:AddSlider("Anti Aim Jitter", {Text = "Jitter Amount", Min = 0, Max = 360, Default = 0, Rounding = 2, Suffix = "°"})

	AntiAim:AddSlider("Anti Aim Pitch Speed", {Text = "Pitch Speed", Min = 1, Max = 50, Default = 10, Rounding = 0})

	AntiAim:AddSlider("Anti Aim Yaw Speed", {Text = "Yaw Speed", Min = 1, Max = 50, Default = 10, Rounding = 0})

	AntiAim:AddToggle("Freeze Movements", {Text = "Freeze Movements", Default = false, Risky = true})
		:AddKeyPicker("Freeze Movements Keybind", {Default = "None", Mode = "Toggle", Text = "Freeze Movements", SyncToggleState = true})

	AntiAim:AddToggle("Tilt Neck", {Text = "Tilt Neck", Default = false, Callback = function(Value)
		local LocalInfo = Info.LocalPlayer
		if LocalInfo and LocalInfo.Alive then
			(Shared.NetworkClient or M.Shared.NetworkClient):send("aim", Value)
		end
	end})

	AntiAim:AddToggle("Lower Arms", {Text = "Lower Arms", Default = false, Callback = function(Value)
		local LocalInfo = Info.LocalPlayer
		if LocalInfo and LocalInfo.Alive then
			(Shared.NetworkClient or M.Shared.NetworkClient):send("sprint", Value)
		end
	end})

	AntiAim:AddDropdown("Custom Stance", {Text = "Custom Stance", Values = {"None", "Stand", "Prone", "Crouch"}, Default = 1, Callback = function(Value)
		local LocalInfo = Info.LocalPlayer
		if LocalInfo and LocalInfo.Alive and Value ~= "None" then
			(Shared.NetworkClient or M.Shared.NetworkClient):send("stance", string.lower(Value))
		end
	end})

	Knifebot:AddToggle("Knifebot Enabled", {Text = "Enabled", Default = false, Risky = true})
		:AddKeyPicker("Knifebot Keybind", {Default = "None", Mode = "Toggle", Text = "Knifebot", SyncToggleState = true})

	Knifebot:AddToggle("Knifebot Knife Only", {Text = "On Knife Only", Default = true})

	Knifebot:AddDropdown("Knifebot Hitbox", {Text = "Hitbox", Values = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, Default = 1})

	Knifebot:AddSlider("Knifebot Max Range", {Text = "Max Range", Min = 1, Max = 25, Default = 10, Rounding = 0, Suffix = "m"})

	TeamGroup:AddToggle("Team Esp Enabled", {Text = "Enabled", Default = false})
		:AddKeyPicker("Team Esp Enabled Keybind", {Default = "None", Mode = "Toggle", Text = "ESP Enabled", SyncToggleState = true})

	local TeamDep = TeamGroup:AddDependencyBox()

	TeamDep:AddToggle("Team Esp Name", {Text = "Name", Default = false})
		:AddColorPicker("Team Esp Name Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	TeamDep:AddToggle("Team Esp Skeleton", {Text = "Skeleton", Default = false})
		:AddColorPicker("Team Esp Skeleton Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	TeamDep:AddToggle("Team Esp Weapon", {Text = "Weapon", Default = false})
		:AddColorPicker("Team Esp Weapon Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	TeamDep:AddToggle("Team Esp Distance", {Text = "Distance", Default = false})
		:AddColorPicker("Team Esp Distance Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	TeamDep:AddToggle("Team Esp Box", {Text = "Bounding Box", Default = false})
		:AddColorPicker("Team Esp Box Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})

	local TeamBoxDep = TeamDep:AddDependencyBox()
	TeamBoxDep:AddToggle("Team Esp Box Fill", {Text = "Bounding Box Fill", Default = false})
		:AddColorPicker("Team Esp Box Fill Color 1", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0.5})
		:AddColorPicker("Team Esp Box Fill Color 2", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 1})
	TeamBoxDep:AddToggle("Team Esp Box Glow", {Text = "Bounding Box Glow", Default = false})
	TeamBoxDep:AddToggle("Team Esp Box Fill Spin", {Text = "Spin Box Fill", Default = false})
	TeamBoxDep:SetupDependencies({ { Toggles["Team Esp Box"], true } })

	TeamDep:AddToggle("Team Esp Health Bar", {Text = "Health Bar", Default = false})
		:AddColorPicker("Team Esp Health Color 1", {Default = Color3.fromRGB(0, 255, 42), Title = "Color"})
		:AddColorPicker("Team Esp Health Color 2", {Default = Color3.fromRGB(255, 0, 0), Title = "Color"})
		:AddColorPicker("Team Esp Health Color 3", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local TeamHealthDep = TeamDep:AddDependencyBox()
	TeamHealthDep:AddDropdown("Team Esp Health Bar Type", {Text = "Health Bar Type", Values = {"Static", "Dynamic", "Gradient"}, Default = 1})
	TeamHealthDep:SetupDependencies({ { Toggles["Team Esp Health Bar"], true } })

	TeamDep:AddToggle("Team Esp Exploiting", {Text = "Exploiting", Default = false})
		:AddColorPicker("Team Esp Exploiting Color", {Default = Color3.fromRGB(255, 0, 0), Title = "Color", Transparency = 0})

	TeamDep:AddToggle("Team Esp Priority Only", {Text = "Priority Only", Default = false})

	TeamDep:AddSlider("Team Esp Max Distance", {Text = "Render Distance", Min = 150, Max = 2000, Default = 400, Rounding = 0, Suffix = "m"})

	TeamDep:AddSlider("Team Esp Refresh Rate", {Text = "Refresh Rate", Min = 60, Max = 265, Default = 144, Rounding = 0, Suffix = "hz"})

	TeamDep:AddToggle("Team Esp Oov", {Text = "Out of View", Default = false})
		:AddColorPicker("Team Esp Oov Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local TeamOovDep = TeamDep:AddDependencyBox()
	TeamOovDep:AddDropdown("Team Esp Oov Elements", {Text = "Elements", Values = {"Name", "Health Bar", "Distance", "Weapon"}, Default = 1, Multi = true})
	TeamOovDep:AddDropdown("Team Esp Oov Style", {Text = "Style", Values = {"Normal", "Concave"}, Default = 2})
	TeamOovDep:AddToggle("Team Esp Oov Dynamic Distance", {Text = "Dynamic Distance", Default = false})
	TeamOovDep:AddToggle("Team Esp Oov Dynamic Size", {Text = "Dynamic Size", Default = false})
	TeamOovDep:AddToggle("Team Esp Oov Blink", {Text = "Arrow Blinking", Default = false})
	TeamOovDep:AddSlider("Team Esp Oov Blink Speed", {Text = "Blinking Speed", Min = 1, Max = 4, Default = 1, Rounding = 0})
	TeamOovDep:AddSlider("Team Esp Oov Distance", {Text = "Arrow Distance", Min = 10, Max = 100, Default = 40, Rounding = 0, Suffix = "%"})
	TeamOovDep:AddSlider("Team Esp Oov Size", {Text = "Arrow Size", Min = 10, Max = 50, Default = 13, Rounding = 0, Suffix = "px"})
	TeamOovDep:SetupDependencies({ { Toggles["Team Esp Oov"], true } })

	TeamDep:AddToggle("Team Esp Sound", {Text = "Sound ESP", Default = false})
		:AddColorPicker("Team Esp Sound Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local TeamSoundDep = TeamDep:AddDependencyBox()
	TeamSoundDep:AddToggle("Team Esp Sound Through Walls", {Text = "Through Walls", Default = true})
	TeamSoundDep:AddSlider("Team Esp Sound Duration", {Text = "Duration", Min = 0.3, Max = 1.3, Default = 0.5, Rounding = 2, Suffix = "s"})
	TeamSoundDep:SetupDependencies({ { Toggles["Team Esp Sound"], true } })

	TeamDep:AddToggle("Team Chams Enabled", {Text = "Chams Enabled", Default = false, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
		:AddColorPicker("Team Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Fill", Transparency = 0.5, Callback = function()
			pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
		end})
		:AddColorPicker("Team Outline Color", {Default = Color3.fromRGB(0, 0, 0), Title = "Outline", Transparency = 0, Callback = function()
			pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
		end})

	local TeamChamsDep = TeamDep:AddDependencyBox()
	TeamChamsDep:AddToggle("Team Glows Enabled", {Text = "Glow Enabled", Default = false, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	TeamChamsDep:AddSlider("Team Glows Size", {Text = "Glow Size", Min = 1, Max = 2.5, Default = 1.75, Rounding = 2, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	TeamChamsDep:AddToggle("Team Chams Shading", {Text = "Team Chams Shading", Default = false, Risky = true, Callback = function(Value)
		pcall(function()
			if setfflag then
				setfflag("AdornShadingAPI", Value and "True" or "False")
			end
		end)
	end})
	TeamChamsDep:AddDropdown("Team Inline Shade", {Text = "Team Inline Shade", Values = {"Default", "Shaded", "XRay", "XRayShaded", "AlwaysOnTop"}, Default = 1, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	TeamChamsDep:AddDropdown("Team Outline Shade", {Text = "Team Outline Shade", Values = {"Default", "Shaded", "XRay", "XRayShaded", "AlwaysOnTop"}, Default = 1, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	TeamChamsDep:SetupDependencies({ { Toggles["Team Chams Enabled"], true } })

	TeamDep:SetupDependencies({ { Toggles["Team Esp Enabled"], true } })

	TeamGroup:AddToggle("Disable Teammate Rendering", {Text = "Disable Character Rendering", Default = false})

	EnemyGroup:AddToggle("Enemy Esp Enabled", {Text = "Enabled", Default = false})
		:AddKeyPicker("Enemy Esp Enabled Keybind", {Default = "None", Mode = "Toggle", Text = "ESP Enabled", SyncToggleState = true})

	local EnemyDep = EnemyGroup:AddDependencyBox()

	EnemyDep:AddToggle("Enemy Esp Name", {Text = "Name", Default = false})
		:AddColorPicker("Enemy Esp Name Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	EnemyDep:AddToggle("Enemy Esp Skeleton", {Text = "Skeleton", Default = false})
		:AddColorPicker("Enemy Esp Skeleton Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	EnemyDep:AddToggle("Enemy Esp Weapon", {Text = "Weapon", Default = false})
		:AddColorPicker("Enemy Esp Weapon Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	EnemyDep:AddToggle("Enemy Esp Distance", {Text = "Distance", Default = false})
		:AddColorPicker("Enemy Esp Distance Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	EnemyDep:AddToggle("Enemy Esp Box", {Text = "Bounding Box", Default = false})
		:AddColorPicker("Enemy Esp Box Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})

	local EnemyBoxDep = EnemyDep:AddDependencyBox()
	EnemyBoxDep:AddToggle("Enemy Esp Box Fill", {Text = "Bounding Box Fill", Default = false})
		:AddColorPicker("Enemy Esp Box Fill Color 1", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0.5})
		:AddColorPicker("Enemy Esp Box Fill Color 2", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 1})
	EnemyBoxDep:AddToggle("Enemy Esp Box Glow", {Text = "Bounding Box Glow", Default = false})
	EnemyBoxDep:AddToggle("Enemy Esp Box Fill Spin", {Text = "Spin Box Fill", Default = false})
	EnemyBoxDep:SetupDependencies({ { Toggles["Enemy Esp Box"], true } })

	EnemyDep:AddToggle("Enemy Esp Health Bar", {Text = "Health Bar", Default = false})
		:AddColorPicker("Enemy Esp Health Color 1", {Default = Color3.fromRGB(0, 255, 42), Title = "Color"})
		:AddColorPicker("Enemy Esp Health Color 2", {Default = Color3.fromRGB(255, 0, 0), Title = "Color"})
		:AddColorPicker("Enemy Esp Health Color 3", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local EnemyHealthDep = EnemyDep:AddDependencyBox()
	EnemyHealthDep:AddDropdown("Enemy Esp Health Bar Type", {Text = "Health Bar Type", Values = {"Static", "Dynamic", "Gradient"}, Default = 1})
	EnemyHealthDep:SetupDependencies({ { Toggles["Enemy Esp Health Bar"], true } })

	EnemyDep:AddToggle("Enemy Esp Exploiting", {Text = "Exploiting", Default = false})
		:AddColorPicker("Enemy Esp Exploiting Color", {Default = Color3.fromRGB(255, 0, 0), Title = "Color", Transparency = 0})

	EnemyDep:AddToggle("Enemy Esp Priority Only", {Text = "Priority Only", Default = false})

	EnemyDep:AddSlider("Enemy Esp Max Distance", {Text = "Render Distance", Min = 150, Max = 2000, Default = 400, Rounding = 0, Suffix = "m"})

	EnemyDep:AddSlider("Enemy Esp Refresh Rate", {Text = "Refresh Rate", Min = 60, Max = 265, Default = 144, Rounding = 0, Suffix = "hz"})

	EnemyDep:AddToggle("Enemy Esp Oov", {Text = "Out of View", Default = false})
		:AddColorPicker("Enemy Esp Oov Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local EnemyOovDep = EnemyDep:AddDependencyBox()
	EnemyOovDep:AddDropdown("Enemy Esp Oov Elements", {Text = "Elements", Values = {"Name", "Health Bar", "Distance", "Weapon"}, Default = 1, Multi = true})
	EnemyOovDep:AddDropdown("Enemy Esp Oov Style", {Text = "Style", Values = {"Normal", "Concave"}, Default = 2})
	EnemyOovDep:AddToggle("Enemy Esp Oov Dynamic Distance", {Text = "Dynamic Distance", Default = false})
	EnemyOovDep:AddToggle("Enemy Esp Oov Dynamic Size", {Text = "Dynamic Size", Default = false})
	EnemyOovDep:AddToggle("Enemy Esp Oov Blink", {Text = "Arrow Blinking", Default = false})
	EnemyOovDep:AddSlider("Enemy Esp Oov Blink Speed", {Text = "Blinking Speed", Min = 1, Max = 4, Default = 1, Rounding = 0})
	EnemyOovDep:AddSlider("Enemy Esp Oov Distance", {Text = "Arrow Distance", Min = 10, Max = 100, Default = 40, Rounding = 0, Suffix = "%"})
	EnemyOovDep:AddSlider("Enemy Esp Oov Size", {Text = "Arrow Size", Min = 10, Max = 50, Default = 13, Rounding = 0, Suffix = "px"})
	EnemyOovDep:SetupDependencies({ { Toggles["Enemy Esp Oov"], true } })

	EnemyDep:AddToggle("Enemy Esp Sound", {Text = "Sound ESP", Default = false})
		:AddColorPicker("Enemy Esp Sound Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0})

	local EnemySoundDep = EnemyDep:AddDependencyBox()
	EnemySoundDep:AddToggle("Enemy Esp Sound Through Walls", {Text = "Through Walls", Default = true})
	EnemySoundDep:AddSlider("Enemy Esp Sound Duration", {Text = "Duration", Min = 0.3, Max = 1.3, Default = 0.5, Rounding = 2, Suffix = "s"})
	EnemySoundDep:SetupDependencies({ { Toggles["Enemy Esp Sound"], true } })

	EnemyDep:AddToggle("Enemy Chams Enabled", {Text = "Chams Enabled", Default = false, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
		:AddColorPicker("Enemy Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Fill", Transparency = 0.5, Callback = function()
			pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
		end})
		:AddColorPicker("Enemy Outline Color", {Default = Color3.fromRGB(0, 0, 0), Title = "Outline", Transparency = 0, Callback = function()
			pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
		end})

	local EnemyChamsDep = EnemyDep:AddDependencyBox()
	EnemyChamsDep:AddToggle("Enemy Glows Enabled", {Text = "Glow Enabled", Default = false, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	EnemyChamsDep:AddSlider("Enemy Glows Size", {Text = "Glow Size", Min = 1, Max = 2.5, Default = 1.75, Rounding = 2, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	EnemyChamsDep:AddToggle("Enemy Chams Shading", {Text = "Enemy Chams Shading", Default = false, Risky = true, Callback = function(Value)
		pcall(function()
			if setfflag then
				setfflag("AdornShadingAPI", Value and "True" or "False")
			end
		end)
	end})
	EnemyChamsDep:AddDropdown("Enemy Inline Shade", {Text = "Enemy Inline Shade", Values = {"Default", "Shaded", "XRay", "XRayShaded", "AlwaysOnTop"}, Default = 1, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	EnemyChamsDep:AddDropdown("Enemy Outline Shade", {Text = "Enemy Outline Shade", Values = {"Default", "Shaded", "XRay", "XRayShaded", "AlwaysOnTop"}, Default = 1, Callback = function()
		pcall(function() if Esp and Esp.RenderAllChams then Esp.RenderAllChams() end end)
	end})
	EnemyChamsDep:SetupDependencies({ { Toggles["Enemy Chams Enabled"], true } })

	EnemyDep:AddToggle("Interpolation Resolver", {Text = "Resolve Interpolation", Default = false})

	EnemyDep:SetupDependencies({ { Toggles["Enemy Esp Enabled"], true } })

    LocalTab:AddToggle("Local Chams", {Text = "Local Chams", Default = false, Callback = function()
		pcall(function() if Visuals and Visuals.LocalChams then Visuals.LocalChams() end end)
	end}):AddColorPicker("Local Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0, Callback = function()
		pcall(function()
			if Visuals and Visuals.LocalChams then Visuals.LocalChams() end
		end)
	end})
	local LocalChamsDep = LocalTab:AddDependencyBox()
	LocalChamsDep:AddDropdown("Local Chams Material", {Text = "Material", Values = {"Plastic", "SmoothPlastic", "Neon", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "Rock", "Sandstone", "Basalt", "CrackedLava", "Limestone", "Pavement", "CorrodedMetal", "DiamondPlate", "Foil", "Metal", "Grass", "LeafyGrass", "Sand", "Fabric", "Snow", "Mud", "Ground", "Asphalt", "Salt", "Ice", "Glacier", "Glass", "ForceField", "Cardboard", "Carpet", "Leather", "Plaster", "Rubber"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.LocalChams then Visuals.LocalChams() end
		end)
	end})
	LocalChamsDep:AddDropdown("Local Chams Animation", {Text = "Animation", Values = {"Disabled", "Webbed", "Pixelated", "Swirl", "Shield", "Bubbles", "Matrix", "Honeycomb", "Clouds", "Galaxy", "Stars", "Wires", "Camo", "Hexagon", "Particles", "Triangular", "Wall", "Scanning"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.LocalChams then Visuals.LocalChams() end
		end)
	end})
	LocalChamsDep:AddSlider("Local Chams Reflectance", {Text = "Reflectance", Min = 0, Max = 1, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.LocalChams then Visuals.LocalChams() end
		end)
	end})
	LocalChamsDep:SetupDependencies({ { Toggles["Local Chams"], true } })

	SleevesTab:AddToggle("Sleeve Chams", {Text = "Sleeve Chams", Default = false, Callback = function()
		pcall(function() if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end end)
	end}):AddColorPicker("Sleeve Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

		local SleeveChamsDep = SleevesTab:AddDependencyBox()
SleeveChamsDep:AddDropdown("Sleeve Chams Material", {Text = "Material", Values = {"Plastic", "SmoothPlastic", "Neon", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "Rock", "Sandstone", "Basalt", "CrackedLava", "Limestone", "Pavement", "CorrodedMetal", "DiamondPlate", "Foil", "Metal", "Grass", "LeafyGrass", "Sand", "Fabric", "Snow", "Mud", "Ground", "Asphalt", "Salt", "Ice", "Glacier", "Glass", "ForceField", "Cardboard", "Carpet", "Leather", "Plaster", "Rubber"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	SleeveChamsDep:AddDropdown("Sleeve Chams Animation", {Text = "Animation", Values = {"Disabled", "Webbed", "Pixelated", "Swirl", "Shield", "Bubbles", "Matrix", "Honeycomb", "Clouds", "Galaxy", "Stars", "Wires", "Camo", "Hexagon", "Particles", "Triangular", "Wall", "Scanning"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	SleeveChamsDep:AddSlider("Sleeve Chams Reflectance", {Text = "Reflectance", Min = 0, Max = 1, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	SleeveChamsDep:SetupDependencies({ { Toggles["Sleeve Chams"], true } })


	ArmsTab:AddToggle("Glove Chams", {Text = "Glove Chams", Default = false, Callback = function()
		pcall(function() if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end end)
	end}):AddColorPicker("Glove Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	local GloveDep = ArmsTab:AddDependencyBox()
	GloveDep:AddDropdown("Glove Chams Material", {Text = "Material", Values = {"Plastic", "SmoothPlastic", "Neon", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "Rock", "Sandstone", "Basalt", "CrackedLava", "Limestone", "Pavement", "CorrodedMetal", "DiamondPlate", "Foil", "Metal", "Grass", "LeafyGrass", "Sand", "Fabric", "Snow", "Mud", "Ground", "Asphalt", "Salt", "Ice", "Glacier", "Glass", "ForceField", "Cardboard", "Carpet", "Leather", "Plaster", "Rubber"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	GloveDep:AddDropdown("Glove Chams Animation", {Text = "Animation", Values = {"Disabled", "Webbed", "Pixelated", "Swirl", "Shield", "Bubbles", "Matrix", "Honeycomb", "Clouds", "Galaxy", "Stars", "Wires", "Camo", "Hexagon", "Particles", "Triangular", "Wall", "Scanning"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	GloveDep:AddSlider("Glove Chams Reflectance", {Text = "Reflectance", Min = 0, Max = 1, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	GloveDep:SetupDependencies({ { Toggles["Glove Chams"], true } })

	ArmsTab:AddToggle("Skin Tone Chams", {Text = "Skin Tone Chams", Default = false, Callback = function()
		pcall(function() if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end end)
	end}):AddColorPicker("Skin Tone Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

		local SkinToneChamsDep = ArmsTab:AddDependencyBox()
SkinToneChamsDep:AddDropdown("Skin Tone Chams Material", {Text = "Material", Values = {"Plastic", "SmoothPlastic", "Neon", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "Rock", "Sandstone", "Basalt", "CrackedLava", "Limestone", "Pavement", "CorrodedMetal", "DiamondPlate", "Foil", "Metal", "Grass", "LeafyGrass", "Sand", "Fabric", "Snow", "Mud", "Ground", "Asphalt", "Salt", "Ice", "Glacier", "Glass", "ForceField", "Cardboard", "Carpet", "Leather", "Plaster", "Rubber"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	SkinToneChamsDep:AddDropdown("Skin Tone Chams Animation", {Text = "Animation", Values = {"Disabled", "Webbed", "Pixelated", "Swirl", "Shield", "Bubbles", "Matrix", "Honeycomb", "Clouds", "Galaxy", "Stars", "Wires", "Camo", "Hexagon", "Particles", "Triangular", "Wall", "Scanning"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	SkinToneChamsDep:AddSlider("Skin Tone Chams Reflectance", {Text = "Reflectance", Min = 0, Max = 1, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	SkinToneChamsDep:SetupDependencies({ { Toggles["Skin Tone Chams"], true } })


	WeaponsTab:AddToggle("ViewModel Chams", {Text = "ViewModel Chams", Default = false, Callback = function()
		pcall(function() if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end end)
	end}):AddColorPicker("ViewModel Chams Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color", Transparency = 0, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

		local ViewModelChamsDep = WeaponsTab:AddDependencyBox()
ViewModelChamsDep:AddDropdown("ViewModel Chams Material", {Text = "Material", Values = {"Plastic", "SmoothPlastic", "Neon", "Wood", "WoodPlanks", "Marble", "Slate", "Concrete", "Granite", "Brick", "Pebble", "Cobblestone", "Rock", "Sandstone", "Basalt", "CrackedLava", "Limestone", "Pavement", "CorrodedMetal", "DiamondPlate", "Foil", "Metal", "Grass", "LeafyGrass", "Sand", "Fabric", "Snow", "Mud", "Ground", "Asphalt", "Salt", "Ice", "Glacier", "Glass", "ForceField", "Cardboard", "Carpet", "Leather", "Plaster", "Rubber"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	ViewModelChamsDep:AddDropdown("ViewModel Chams Animation", {Text = "Animation", Values = {"Disabled", "Webbed", "Pixelated", "Swirl", "Shield", "Bubbles", "Matrix", "Honeycomb", "Clouds", "Galaxy", "Stars", "Wires", "Camo", "Hexagon", "Particles", "Triangular", "Wall", "Scanning"}, Default = 1, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})

	ViewModelChamsDep:AddSlider("ViewModel Chams Reflectance", {Text = "Reflectance", Min = 0, Max = 1, Default = 0, Rounding = 2, Callback = function()
		pcall(function()
			if Visuals and Visuals.ViewModelChams then Visuals.ViewModelChams() end
		end)
	end})
	ViewModelChamsDep:SetupDependencies({ { Toggles["ViewModel Chams"], true } })


	ViewModelTab:AddToggle("ViewModel Offsets", {Text = "ViewModel Offsets", Default = false})

	ViewModelTab:AddToggle("ViewModel Disable On Aim", {Text = "Disable On Aim", Default = true})

	ViewModelTab:AddSlider("ViewModel X Offset", {Text = "X", Min = -3, Max = 3, Default = 0, Rounding = 1, Suffix = "m"})

	ViewModelTab:AddSlider("ViewModel Y Offset", {Text = "Y", Min = -3, Max = 3, Default = 0, Rounding = 1, Suffix = "m"})

	ViewModelTab:AddSlider("ViewModel Z Offset", {Text = "Z", Min = -3, Max = 3, Default = 0, Rounding = 1, Suffix = "m"})

	ViewModelTab:AddSlider("ViewModel Pitch", {Text = "Pitch", Min = -180, Max = 180, Default = 0, Rounding = 0, Suffix = "°"})

	ViewModelTab:AddSlider("ViewModel Yaw", {Text = "Yaw", Min = -180, Max = 180, Default = 0, Rounding = 0, Suffix = "°"})

	ViewModelTab:AddSlider("ViewModel Roll", {Text = "Roll", Min = -180, Max = 180, Default = 0, Rounding = 0, Suffix = "°"})

	CameraTab:AddToggle("No Camera Bob", {Text = "No Camera Bob", Default = false})

	CameraTab:AddToggle("No Camera Suppression", {Text = "No Camera Suppression", Default = false})

	CameraTab:AddToggle("Visuals Custom Fov", {Text = "Custom Camera FOV", Default = false, Callback = function()
		if Camera and Camera.UpdateFOV then Camera.UpdateFOV() end
	end})

	CameraTab:AddToggle("Visuals Fov Disable Aim", {Text = "Disable On Aim", Default = true, Callback = function()
		if Camera and Camera.UpdateFOV then Camera.UpdateFOV() end
	end})

	CameraTab:AddSlider("Visuals Custom Fov Factor", {Text = "FOV", Min = 70, Max = 120, Default = 90, Rounding = 0, Suffix = "°", Callback = function()
		if Camera and Camera.UpdateFOV then Camera.UpdateFOV() end
	end})

	CameraTab:AddToggle("Zoom", {Text = "Zoom", Default = false, Callback = function(Value)
		local mult = Flags["Zoom Multiplier"]
		local m = (mult and mult.Value) or 1
		if m == 0 then m = 1 end
		CurrentCamera.FieldOfView = (Value and (20 / m) or 70)
	end}):AddKeyPicker("Zoom Keybind", {Default = "None", Mode = "Hold", Text = "Zoom", SyncToggleState = true})

	CameraTab:AddSlider("Zoom Multiplier", {Text = "Zoom Multiplier", Min = 1, Max = 3, Default = 1, Rounding = 2, Suffix = "x"})

	CameraTab:AddToggle("Third Person Enabled", {Text = "Third Person", Default = false})
		:AddKeyPicker("Third Person Keybind", {Default = "None", Mode = "Toggle", Text = "Third Person", SyncToggleState = true})

	CameraTab:AddToggle("Third Person Weapon", {Text = "Render Weapon", Default = true})

	CameraTab:AddToggle("Third Person Clip", {Text = "Clip Camera", Default = true})

	CameraTab:AddSlider("Third Person Minimum", {Text = "Minimum", Min = 1, Max = 10, Default = 3, Rounding = 1, Suffix = "m"})

	CameraTab:AddSlider("Third Person Maximum", {Text = "Maximum", Min = 1, Max = 20, Default = 8, Rounding = 1, Suffix = "m"})

	Drawing:AddToggle("Dropped Weapon ESP", {Text = "Dropped Weapons", Default = false})
		:AddColorPicker("Dropped Weapon Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})
		:AddColorPicker("Dropped Weapon Bar Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Bar Color"})

	Drawing:AddToggle("Dropped Weapon Distance", {Text = "Distance", Default = false})
		:AddColorPicker("Dropped Weapon Distance Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})

	Drawing:AddSlider("Dropped Weapon Max Distance", {Text = "Render Distance", Min = 20, Max = 2000, Default = 150, Rounding = 0, Suffix = "m"})

	Drawing:AddSlider("Dropped Weapon Refresh Rate", {Text = "Refresh Rate", Min = 60, Max = 265, Default = 100, Rounding = 0, Suffix = "hz"})

	Drawing:AddToggle("FireRate Bar", {Text = "Firerate Bar", Default = false})
		:AddColorPicker("FireRate Bar Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Color"})
	local FireRateDep = Drawing:AddDependencyBox()
	FireRateDep:AddSlider("FireRate Bar X", {Text = "Firerate Bar X Offset", Min = -400, Max = 400, Default = 0, Rounding = 0})
	FireRateDep:AddSlider("FireRate Bar Y", {Text = "Firerate Bar Y Offset", Min = -400, Max = 400, Default = 0, Rounding = 0})
	FireRateDep:SetupDependencies({ { Toggles["FireRate Bar"], true } })

	Drawing:AddToggle("Weapon Info", {Text = "Weapon Info", Default = false})
	local WeaponInfoDep = Drawing:AddDependencyBox()
	WeaponInfoDep:AddSlider("Weapon Info X", {Text = "Panel X Offset", Min = -200, Max = 200, Default = 24, Rounding = 0})
	WeaponInfoDep:AddSlider("Weapon Info Y", {Text = "Panel Y Offset", Min = -200, Max = 200, Default = 18, Rounding = 0})
	WeaponInfoDep:SetupDependencies({ { Toggles["Weapon Info"], true } })

	Drawing:AddToggle("Penetration Crosshair", {Text = "Penetration Crosshair", Default = false, Callback = function(Value)
		local Crosshair = Visuals.Crosshair
		if Crosshair then
			Crosshair.Visible = Value
		end
	end}):AddColorPicker("Penetration Crosshair Color 1", {Default = Color3.fromRGB(255, 0, 0), Title = "Color"})
		:AddColorPicker("Penetration Crosshair Color 2", {Default = Color3.fromRGB(0, 255, 0), Title = "Color"})

	Drawing:AddToggle("Visualise Fake Position", {Text = "Visualise Fake Position", Default = false})
		:AddColorPicker("Visualise Fake Position Bar Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Bar Color"})
		:AddColorPicker("Visualise Fake Position Text Color", {Default = Color3.fromRGB(255, 255, 255), Title = "Text Color"})

    local WatermarkGroup = SettingsTab:AddCenterGroupbox("Watermark")
    WatermarkGroup:AddToggle("Watermark", { Text = "Watermark", Callback = function (v) 
        Library:SetWatermarkVisibility(v)
    end})
    local MenuGroup = SettingsTab:AddCenterGroupbox("Menu")
    MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "End", NoUI = true, Text = "Menu keybind" })
    MenuGroup:AddToggle("UIGlow", { Text = "UI Glow", Callback = function (v)
        Library:SetGlowVis(v)
        if Library.UpdateWindowGlow then Library:UpdateWindowGlow() end
    end});
    MenuGroup:AddSlider("Menu Glow Size", {Text = "Glow Size", Min = 0.5, Max = 1.03, Default = 1, Rounding = 2, Callback = function()
        if Library.UpdateWindowGlow then Library:UpdateWindowGlow() end
    end})
    MenuGroup:AddSlider("Menu Glow Intensity", {Text = "Glow Intensity", Min = 0, Max = 100, Default = 10, Rounding = 0, Callback = function()
        if Library.UpdateWindowGlow then Library:UpdateWindowGlow() end
    end})
    local KeybindListGroup = SettingsTab:AddCenterGroupbox("Keybind List")
    KeybindListGroup:AddToggle("KeyBindList", { Text = "Key Bind List", Callback = function (v)
        Library:SetKeyListVisibility(v)
    end})
    KeybindListGroup:AddDropdown("KeyBindListMode", {Text = "Mode",Values = {"Highlight", "State"},Default = 2,Multi = false, Callback = function(v)
        Library.KeybindListMode = v == "Highlight" and 1 or 2
    end})

    local ServerGroup = SettingsTab:AddCenterGroupbox("Server")
    ServerGroup:AddSlider("Server Max Players", {Text = "Max Players", Min = 1, Max = 32, Default = 32, Rounding = 0})
    ServerGroup:AddButton({
        Text = "Server Hop",
        Func = function()
            pcall(function()
                local PlaceId = game.PlaceId
                local JobId = game.JobId
                local MaxPlayers = Flags["Server Max Players"] and Flags["Server Max Players"].Value or 32
                if type(MaxPlayers) ~= "number" then MaxPlayers = 32 end
                local Cursor = ""
                local Request = (syn and syn.request) or (http and http.request) or http_request or request
                if not Request then
                    Library:Notify("No HTTP request available", 3)
                    return
                end
                for _ = 1, 5 do
                    local Url = "https://games.roblox.com/v1/games/" .. tostring(PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100" .. (Cursor ~= "" and ("&cursor=" .. Cursor) or "")
                    local Res = Request({ Url = Url, Method = "GET" })
                    if not Res or not Res.Body then break end
                    local Ok, Data = pcall(function()
                        return game:GetService("HttpService"):JSONDecode(Res.Body)
                    end)
                    if not Ok or type(Data) ~= "table" or type(Data.data) ~= "table" then break end
                    for _, Server in ipairs(Data.data) do
                        local Playing = Server.playing or 0
                        local Max = Server.maxPlayers or 32
                        local Id = Server.id
                        if Id and Id ~= JobId and Playing < Max and Playing < MaxPlayers then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, Id, game:GetService("Players").LocalPlayer)
                            return
                        end
                    end
                    Cursor = Data.nextPageCursor or ""
                    if Cursor == "" then break end
                end
                Library:Notify("No suitable server found", 3)
            end)
        end
    }):AddButton({
        Text = "Rejoin",
        Func = function()
            pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
            end)
        end
    })
    ServerGroup:AddButton({
        Text = "Copy Join Script",
        Func = function()
            pcall(function()
                local Script = string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s")', tostring(game.PlaceId), tostring(game.JobId))
                if setclipboard then
                    setclipboard(Script)
                    Library:Notify("Join script copied", 2)
                else
                    Library:Notify(Script, 5)
                end
            end)
        end
    })
    ServerGroup:AddButton({
        Text = "Copy Game ID",
        Func = function()
            pcall(function()
                local Text = tostring(game.PlaceId) .. " | " .. tostring(game.JobId)
                if setclipboard then
                    setclipboard(Text)
                    Library:Notify("Place/Job ID copied", 2)
                else
                    Library:Notify(Text, 5)
                end
            end)
        end
    })


    
    Library:SetWatermarkVisibility(false)
    Library:SetKeyListVisibility(false)
    pcall(function() if Library.SetSpecListVisibility then Library:SetSpecListVisibility(false) end end)

    Toggles["Watermark"]:SetValue(true)
    Toggles["UIGlow"]:SetValue(true)

    Library.ToggleKeybind = Options.MenuKeybind
    ThemeManager:SetFolder("iri")
    SaveManager:SetFolder("iri/PhantomForces")
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library) 
    SaveManager:IgnoreThemeSettings()
    SaveManager:BuildConfigSection(SettingsTab)
    ThemeManager:ApplyToTab(SettingsTab)

    local EventLogsGroup = SettingsTab:AddRightGroupbox("Event Logs")
    EventLogsGroup:AddDropdown("Event Logs", {
        Text = "Show Categories",
        Values = {"Bullet Hit", "Melee Hit", "Grenade Hit", "Server Corrections", "Server Flags", "Ragebot Collat", "Ragebot Peek", "Fake Position", "Exploiting"},
        Default = {},
        Multi = true,
        AllowNull = true,
        Callback = function()
            if Library.RefreshEventLogList then
                pcall(Library.RefreshEventLogList)
            end
        end
    })
    EventLogsGroup:AddSlider("Event Logs Time", {Text = "Notify Duration", Min = 1, Max = 10, Default = 3, Rounding = 1, Suffix = "s"})
    EventLogsGroup:AddButton({
        Text = "Clear Logs",
        Func = function()
            Library.EventLogHistory = {}
            if Library.RefreshEventLogList then
                pcall(Library.RefreshEventLogList)
            end
        end
    })
    do
        local Container = EventLogsGroup.Container
        EventLogsGroup:AddBlank(2)
        local ListOuter = Library:Create('Frame', {
            BackgroundColor3 = Library.BackgroundColor or Color3.fromRGB(13, 13, 13),
            BorderColor3 = Library.OutlineColor or Color3.fromRGB(40, 40, 40),
            BorderSizePixel = 1,
            Size = UDim2.new(1, -4, 0, 150),
            ZIndex = 5,
            Parent = Container,
        })
        Library:AddToRegistry(ListOuter, {
            BackgroundColor3 = 'BackgroundColor',
            BorderColor3 = 'OutlineColor',
        })
        local ListScroll = Library:Create('ScrollingFrame', {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.new(0, 2, 0, 2),
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = Library.AccentColor or Color3.fromRGB(180, 180, 180),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.None,
            ZIndex = 6,
            Parent = ListOuter,
        })
        Library:AddToRegistry(ListScroll, {
            ScrollBarImageColor3 = 'AccentColor',
        })
        Library.EventLogListFrame = ListScroll
        EventLogsGroup:AddBlank(6)
        EventLogsGroup:Resize()
        task.defer(function()
            if Library.UpdateColorsUsingRegistry then
                pcall(function() Library:UpdateColorsUsingRegistry() end)
            end
            if Library.RefreshEventLogList then
                pcall(function() Library:RefreshEventLogList() end)
            end
        end)
    end
end
BuildMenuTabs(Window)
do
    Mathematics.GetTrajectory = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3, Acceleration : Vector3, Velocity : Number)
        if typeof(Origin) ~= "Vector3" or typeof(Position) ~= "Vector3" then
            return nil, nil
        end
        if typeof(Acceleration) ~= "Vector3" then
            Acceleration = Shared.Acceleration
            if typeof(Acceleration) ~= "Vector3" then
                Acceleration = NewVector3(0, -196.2, 0)
            end
        end
        if type(Velocity) ~= "number" or Velocity <= 0 then
            return nil, nil
        end

        local Displacement = Position - Origin

        local Time1, Time2 = Mathematics.SolveQuadratic(Dot(Displacement, Displacement), Dot(Displacement, Acceleration) - Velocity * Velocity, Dot(Acceleration, Acceleration) * 0.25)

        if Time1 and Time1 > 0 then
			Time1 = Time1 ^ 0.5

			return Acceleration * 0.5 * Time1 + Displacement / Time1, Time1
		end

		if Time2 and Time2 > 0 then
			Time2 = Time2 ^ 0.5

			return Acceleration * 0.5 * Time2 + Displacement / Time2, Time2
		end

        return nil, nil
    end)

    Mathematics.SolveQuadratic = LPH_JIT_MAX(function(Number1 : Number, Number2 : Number, Number3 : Number)
        local Discriminant = Number2 * Number2 - 4 * Number3 * Number1

		if Discriminant < 0 then
			return
		else
			local Root = Discriminant ^ 0.5

			if Number2 >= 0 then
				return (-Number2 - Root) / (2 * Number3), (2 * Number1) / (-Number2 - Root)
			else
				return (2 * Number1) / (-Number2 + Root), (-Number2 + Root) / (2 * Number3)
			end
		end
    end)
end

do
    local Require

    pcall(function()
        Require = getrenv().shared.require
    end)

    if not Require then
        LocalPlayer:Kick("[Iridescent] Non-Fatal Error: Modules could not be found. This is most likely due to your actors bypass. Please rejoin with the correct actor bypass.")
        return
    end

    Shared.Require = Require
    Shared.NetworkClient = Require("NetworkClient")
    Shared.GameClock = Require("GameClock")
    Shared.ReplicationInterface = Require("ReplicationInterface")
    Shared.ReplicationObject = Require("ReplicationObject")
    Shared.ThirdPersonObject = Require("ThirdPersonObject")
    Shared.PlayerDataClientInterface = Require("PlayerDataClientInterface")
    Shared.ActiveLoadoutUtils = Require("ActiveLoadoutUtils")
    Shared.CharacterEvents = Require("CharacterEvents")
    Shared.CharacterObject = Require("CharacterObject")
    Shared.CharacterInterface = Require("CharacterInterface")
    Shared.PlayerSettingsInterface = Require("PlayerSettingsInterface")
    Shared.HudCrosshairsInterface = Require("HudCrosshairsInterface")
    Shared.HudStatusInterface = Require("HudStatusInterface")
    Shared.HudSpottingInterface = Require("HudSpottingInterface")
    Shared.HudScopeInterface = Require("HudScopeInterface")
    Shared.BulletCheck = Require("BulletCheck")
    Shared.BulletInterface = Require("BulletInterface")
    Shared.BulletObject = Require("BulletObject")
    Shared.FirearmObject = Require("FirearmObject")
    Shared.MeleeObject = Require("MeleeObject")
    Shared.GrenadeObject = Require("GrenadeObject")
    Shared.AudioSystem = Require("AudioSystem")
    Shared.Effects = Require("Effects")
    Shared.MainCameraObject = Require("MainCameraObject")
    Shared.CameraInterface = Require("CameraInterface")
    Shared.RecoilSprings = Require("RecoilSprings")
    Shared.Sway = Require("Sway")
    Shared.PublicSettings = Require("PublicSettings")
    Shared.EnvironmentInterfaceClient = Require("EnvironmentInterfaceClient")
    Shared.RoundSystemClientInterface = Require("RoundSystemClientInterface")
    Shared.WeaponControllerInterface = Require("WeaponControllerInterface")
    Shared.Events = GetUpValue(Shared.NetworkClient.fireReady, 5)
    local Acc = Shared.PublicSettings and Shared.PublicSettings.bulletAcceleration
    if typeof(Acc) ~= "Vector3" then
        Acc = NewVector3(0, -(Workspace.Gravity > 0 and Workspace.Gravity or 196.2), 0)
    end
    Shared.Acceleration = Acc
end

do
    local DataPing = Stats.Network.ServerStatsItem["Data Ping"]
    local Ping = 0

    Tickbase.GetTick = Shared.GameClock.getTime

    Tickbase.GetPing = LPH_JIT_MAX(function(Full : Boolean)
        return Ping / (Full and 500 or 1000)
    end)

    Tickbase.Init = function()
        RenderStepped:Connect(function()
            Ping = DataPing:GetValue()
        end)
    end
end

do
    Pathfinding.CanTraverse = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3)
        local Result

        local Params = NewRayParams()
        Params.IgnoreWater = true

        local IgnoreList = { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }
        local Stop = false

        while not Stop do
            Params.FilterDescendantsInstances = IgnoreList

            Result = Raycast(Workspace, Origin, Position - Origin, Params)

            if not Result then
                return true
            end

            local Object = Result.Instance

            if Object then
                Stop = Object.CanCollide or Object.Transparency == 1

                IgnoreList[#IgnoreList + 1] = Object
            end
        end

        return false
    end)

    Pathfinding.GenerateNodePath = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3, Spacing : Number)
        local Calculated = (Position - Origin)

        local Distance = Calculated.Magnitude

        if Distance <= Spacing then
            return { Position }
        end

        local Direction = Calculated.Unit

        local Nodes = {}

        for i = 0, Floor(Distance / Spacing) do
            Nodes[i + 1] = Origin + (Direction * (i * Spacing))
        end

        local Amount = #Nodes

        if Nodes[Amount] ~= Position then
            Nodes[Amount + 1] = Position
        end

        return Nodes
    end)
end

do
    Raycasting.CheckResult = function(Result : Instance)
        if not Result.CanCollide then
            return true
        elseif Result.Transparency == 1 then
            return true
        end

        return
    end

    Raycasting.RaycastSingleExit = LPH_JIT_MAX(function(Origin : Vector3, Trajectory : Vector3, IgnoreList : Table)
        local Params = NewRayParams()
        Params.FilterType = Enum.RaycastFilterType.Include
        Params.FilterDescendantsInstances = { IgnoreList }
        Params.IgnoreWater = true

        return Raycast(Workspace, Origin + Trajectory, -Trajectory, Params)
    end)

    Raycasting.Raycast = LPH_JIT_MAX(function(Origin : Vector3, Trajectory : Vector3, IgnoreList : Table, Check : Function)
        local Result

        local Params = NewRayParams()
        Params.FilterDescendantsInstances = IgnoreList
        Params.IgnoreWater = true

        local NewResult

        while true do
            NewResult = Raycast(Workspace, Origin, Trajectory, Params)

            if NewResult and Check and Check(NewResult.Instance) then
                IgnoreList[#IgnoreList + 1] = NewResult.Instance

                Params.FilterDescendantsInstances = IgnoreList
            else
                break
            end
        end

        Result = NewResult

        return Result
    end)
end

do
    local NetworkClient = Shared.NetworkClient
    local FirearmObject = Shared.FirearmObject

    Misc.KillSay = {
        Last = "",
        Words = {}
    }

    do
        GetService(Game, "NetworkClient").ChildRemoved:Connect(function(Child)
            if IsA(Child, "ClientReplicator") and Child:GetPlayer() == LocalPlayer then
                Info.OnDied(Info.LocalPlayer)
            end
        end)
    end

    do
        Misc.HopServer = LPH_JIT_MAX(function()
            local OldJobId = Game.JobId
            local PlaceId = Game.PlaceId

            local Response
            local Ok, Err = pcall(function()
                Response = Request({
                    Url = Format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", PlaceId),
                    Method = "GET"
                })
            end)
            if not Ok or not Response or not Response.Body then
                pcall(function() TeleportService:Teleport(PlaceId) end)
                return
            end

            local Decoded
            Ok = pcall(function()
                Decoded = JSONDecode(HttpService, Response.Body)
            end)
            if not Ok or type(Decoded) ~= "table" or type(Decoded.data) ~= "table" then
                pcall(function() TeleportService:Teleport(PlaceId) end)
                return
            end

            local Data = Decoded.data
            local Candidates = {}
            for i = 1, #Data do
                local Server = Data[i]
                if type(Server) == "table" and Server.id and Server.id ~= OldJobId then
                    local Playing = Server.playing or 0
                    local MaxPlayers = Server.maxPlayers or 999
                    if Playing < MaxPlayers then
                        Candidates[#Candidates + 1] = Server.id
                    end
                end
            end

            if #Candidates < 1 then
                pcall(function() TeleportService:Teleport(PlaceId) end)
                return
            end

            local NewJobId = Candidates[Random(1, #Candidates)]
            pcall(function()
                TeleportService:TeleportToPlaceInstance(PlaceId, NewJobId)
            end)
        end)

        Misc.RefreshKillSay = LPH_JIT_MAX(function()
            local Path = Format("%s/%s", Menu.BasePath, "/KillSay.txt")

            if not IsFile(Path) then
                WriteFile(Path, "{victim} died to constant? XD\n{attacker} owns {victim}\nwhy u gettin tapped like that {victim}?\n1 {victim}\nget good get constant\n{victim} stop cheating, thanks :D\n{victim} got ☠️ in their {hitpart}")
            end

            local Contents = ReadFile(Path)

            if Contents then
                Misc.KillSay.Words = Split(Contents, "\n")
            end
        end)

        Misc.RefreshHitsounds = LPH_JIT_MAX(function()
            local Hitsounds = {
                ["1"] = "rbxassetid://7349055654",
                ["Bag"] = "rbxassetid://364942410",
                ["Baimware"] = "rbxassetid://6607339542",
                ["Bat"] = "rbxassetid://3333907347",
                ["Beautiful"] = "rbxassetid://5709456554",
                ["Beepo"] = "rbxassetid://3466987025",
                ["Bell"] = "rbxassetid://97724019712141",
                ["Bonk"] = "rbxassetid://3765689841",
                ["Bow"] = "rbxassetid://93158957747276",
                ["Bruh"] = "rbxassetid://535690488",
                ["Cod"] = "rbxassetid://160432334",
                ["CSGO"] = "rbxassetid://7269900245",
                ["Denied"] = "rbxassetid://7356986865",
                ["Electro"] = "rbxassetid://3458224686",
                ["Epic"] = "rbxassetid://7344303740",
                ["Fatality"] = "rbxassetid://115982072912004",
                ["Gamesense"] = "rbxassetid://5633695679",
                ["Godlike"] = "rbxassetid://7463103082",
                ["Headshot"] = "rbxassetid://5764885927",
                ["Killingspree"] = "rbxassetid://937898383",
                ["Laser Beam"] = "rbxassetid://130791043",
                ["Laugh"] = "rbxassetid://9094639541",
                ["Lessgo"] = "rbxassetid://6782594987",
                ["Matchine gun"] = "rbxassetid://17705555617",
                ["MCOOF"] = "rbxassetid://5869422451",
                ["Minecraft"] = "rbxassetid://7273736372",
                ["Minecraft XP"] = "rbxassetid://1053296915",
                ["Neverlose"] = "rbxassetid://6607204501",
                ["Osu"] = "rbxassetid://7149919358",
                ["Osu Mint"] = "rbxassetid://81883450827543",
                ["Overwatch"] = "rbxassetid://18410058858",
                ["Ownage"] = "rbxassetid://6887181639",
                ["Percussion"] = "rbxassetid://3466985670",
                ["Pop"] = "rbxassetid://105543133746827",
                ["Pow"] = "rbxassetid://3516546035",
                ["Quek"] = "rbxassetid://4868633804",
                ["Ray"] = "rbxassetid://131179973",
                ["Retro"] = "rbxassetid://3466984142",
                ["Retro loud"] = "rbxassetid://3976061026",
                ["Rocket"] = "rbxassetid://9087976483",
                ["Rust"] = "rbxassetid://5043539486",
                ["Skeet"] = "rbxassetid://5447626464",
                ["Slap"] = "rbxassetid://4888372697",
                ["Snap"] = "rbxassetid://93172144688075",
                ["Sorry"] = "rbxassetid://7405233417",
                ["Space"] = "rbxassetid://3466982899",
                ["Squash"] = "rbxassetid://3466981613",
                ["Supersmash"] = "rbxassetid://2039907664",
                ["TF2"] = "rbxassetid://3455144981",
                ["TF2 Pan"] = "rbxassetid://3431749479",
                ["Ultra Kill"] = "rbxassetid://937885646",
                ["Ultrakill"] = "rbxassetid://937885646",
                ["Vine Boom"] = "rbxassetid://9088081730",
                ["Vortex"] = "rbxassetid://3466980212",
                ["Win"] = "rbxassetid://341542437"
            }

            local SoundOptions = {
                "Disabled",
                "1",
                "Bag",
                "Baimware",
                "Bat",
                "Beautiful",
                "Beepo",
                "Bell",
                "Bonk",
                "Bow",
                "Bruh",
                "Cod",
                "CSGO",
                "Denied",
                "Electro",
                "Epic",
                "Fatality",
                "Gamesense",
                "Godlike",
                "Headshot",
                "Killingspree",
                "Laser Beam",
                "Laugh",
                "Lessgo",
                "Matchine gun",
                "MCOOF",
                "Minecraft",
                "Minecraft XP",
                "Neverlose",
                "Osu",
                "Osu Mint",
                "Overwatch",
                "Ownage",
                "Percussion",
                "Pop",
                "Pow",
                "Quek",
                "Ray",
                "Retro",
                "Retro loud",
                "Rocket",
                "Rust",
                "Skeet",
                "Slap",
                "Snap",
                "Sorry",
                "Space",
                "Squash",
                "Supersmash",
                "TF2",
                "TF2 Pan",
                "Ultra Kill",
                "Ultrakill",
                "Vine Boom",
                "Vortex",
                "Win"
            }

            local Folder = Format("%s/%s", Menu.Folders.Sounds.Path, "Hitsounds")
            pcall(function()
                if not IsFolder(Menu.BasePath) then MakeFolder(Menu.BasePath) end
                if not IsFolder(Menu.Folders.Sounds.Path) then MakeFolder(Menu.Folders.Sounds.Path) end
                if not IsFolder(Folder) then MakeFolder(Folder) end
            end)

            local List = {}
            local Files = {}
            pcall(function()
                if ListFiles then
                    local result = ListFiles(Folder)
                    if type(result) == "table" then Files = result end
                end
            end)

            for i = 1, #Files do
                local This = Match(Files[i], "([^/\]+)%.wav$")
                if This then
                    List[#List + 1] = This .. ".wav"
                end
            end

            for i = 1, #List do
                local This = List[i]
                local ok, asset = pcall(GetCustomAsset, Format("%s/%s", Folder, This))
                if ok and asset then
                    Hitsounds[This] = asset
                    SoundOptions[#SoundOptions + 1] = This
                end
            end

            HitsoundIds = Hitsounds
            if D then D.HitsoundIds = Hitsounds end

            local Flag = Flags["Hitsound"]
            if Flag then
                if Flag.SetValues then
                    pcall(function() Flag:SetValues(SoundOptions) end)
                elseif type(Flag) == "table" then
                    Flag.Options = SoundOptions
                    if Flag.Close then pcall(Flag.Close) end
                    if Flag.Set then pcall(Flag.Set, "Disabled", false) end
                end
            end
        end)

        Misc.RefreshKillsounds = LPH_JIT_MAX(function()
            local Killsounds = {
                ["1"] = "rbxassetid://7349055654",
                ["Bag"] = "rbxassetid://364942410",
                ["Baimware"] = "rbxassetid://6607339542",
                ["Bat"] = "rbxassetid://3333907347",
                ["Beautiful"] = "rbxassetid://5709456554",
                ["Beepo"] = "rbxassetid://3466987025",
                ["Bell"] = "rbxassetid://97724019712141",
                ["Bonk"] = "rbxassetid://3765689841",
                ["Bow"] = "rbxassetid://93158957747276",
                ["Bruh"] = "rbxassetid://535690488",
                ["Cod"] = "rbxassetid://160432334",
                ["CSGO"] = "rbxassetid://7269900245",
                ["Denied"] = "rbxassetid://7356986865",
                ["Electro"] = "rbxassetid://3458224686",
                ["Epic"] = "rbxassetid://7344303740",
                ["Fatality"] = "rbxassetid://115982072912004",
                ["Gamesense"] = "rbxassetid://5633695679",
                ["Godlike"] = "rbxassetid://7463103082",
                ["Headshot"] = "rbxassetid://5764885927",
                ["Killingspree"] = "rbxassetid://937898383",
                ["Laser Beam"] = "rbxassetid://130791043",
                ["Laugh"] = "rbxassetid://9094639541",
                ["Lessgo"] = "rbxassetid://6782594987",
                ["Matchine gun"] = "rbxassetid://17705555617",
                ["MCOOF"] = "rbxassetid://5869422451",
                ["Minecraft"] = "rbxassetid://7273736372",
                ["Minecraft XP"] = "rbxassetid://1053296915",
                ["Neverlose"] = "rbxassetid://6607204501",
                ["Osu"] = "rbxassetid://7149919358",
                ["Osu Mint"] = "rbxassetid://81883450827543",
                ["Overwatch"] = "rbxassetid://18410058858",
                ["Ownage"] = "rbxassetid://6887181639",
                ["Percussion"] = "rbxassetid://3466985670",
                ["Pop"] = "rbxassetid://105543133746827",
                ["Pow"] = "rbxassetid://3516546035",
                ["Quek"] = "rbxassetid://4868633804",
                ["Ray"] = "rbxassetid://131179973",
                ["Retro"] = "rbxassetid://3466984142",
                ["Retro loud"] = "rbxassetid://3976061026",
                ["Rocket"] = "rbxassetid://9087976483",
                ["Rust"] = "rbxassetid://5043539486",
                ["Skeet"] = "rbxassetid://5447626464",
                ["Slap"] = "rbxassetid://4888372697",
                ["Snap"] = "rbxassetid://93172144688075",
                ["Sorry"] = "rbxassetid://7405233417",
                ["Space"] = "rbxassetid://3466982899",
                ["Squash"] = "rbxassetid://3466981613",
                ["Supersmash"] = "rbxassetid://2039907664",
                ["TF2"] = "rbxassetid://3455144981",
                ["TF2 Pan"] = "rbxassetid://3431749479",
                ["Ultra Kill"] = "rbxassetid://937885646",
                ["Ultrakill"] = "rbxassetid://937885646",
                ["Vine Boom"] = "rbxassetid://9088081730",
                ["Vortex"] = "rbxassetid://3466980212",
                ["Win"] = "rbxassetid://341542437"
            }

            local SoundOptions = {
                "Disabled",
                "1",
                "Bag",
                "Baimware",
                "Bat",
                "Beautiful",
                "Beepo",
                "Bell",
                "Bonk",
                "Bow",
                "Bruh",
                "Cod",
                "CSGO",
                "Denied",
                "Electro",
                "Epic",
                "Fatality",
                "Gamesense",
                "Godlike",
                "Headshot",
                "Killingspree",
                "Laser Beam",
                "Laugh",
                "Lessgo",
                "Matchine gun",
                "MCOOF",
                "Minecraft",
                "Minecraft XP",
                "Neverlose",
                "Osu",
                "Osu Mint",
                "Overwatch",
                "Ownage",
                "Percussion",
                "Pop",
                "Pow",
                "Quek",
                "Ray",
                "Retro",
                "Retro loud",
                "Rocket",
                "Rust",
                "Skeet",
                "Slap",
                "Snap",
                "Sorry",
                "Space",
                "Squash",
                "Supersmash",
                "TF2",
                "TF2 Pan",
                "Ultra Kill",
                "Ultrakill",
                "Vine Boom",
                "Vortex",
                "Win"
            }

            local Folder = Format("%s/%s", Menu.Folders.Sounds.Path, "Killsounds")
            pcall(function()
                if not IsFolder(Menu.BasePath) then MakeFolder(Menu.BasePath) end
                if not IsFolder(Menu.Folders.Sounds.Path) then MakeFolder(Menu.Folders.Sounds.Path) end
                if not IsFolder(Folder) then MakeFolder(Folder) end
            end)

            local List = {}
            local Files = {}
            pcall(function()
                if ListFiles then
                    local result = ListFiles(Folder)
                    if type(result) == "table" then Files = result end
                end
            end)

            for i = 1, #Files do
                local This = Match(Files[i], "([^/\]+)%.wav$")
                if This then
                    List[#List + 1] = This .. ".wav"
                end
            end

            for i = 1, #List do
                local This = List[i]
                local ok, asset = pcall(GetCustomAsset, Format("%s/%s", Folder, This))
                if ok and asset then
                    Killsounds[This] = asset
                    SoundOptions[#SoundOptions + 1] = This
                end
            end

            KillsoundIds = Killsounds
            if D then D.KillsoundIds = Killsounds end

            local Flag = Flags["Killsound"]
            if Flag then
                if Flag.SetValues then
                    pcall(function() Flag:SetValues(SoundOptions) end)
                elseif type(Flag) == "table" then
                    Flag.Options = SoundOptions
                    if Flag.Close then pcall(Flag.Close) end
                    if Flag.Set then pcall(Flag.Set, "Disabled", false) end
                end
            end
        end)

        Misc.GetKillSay = LPH_JIT_MAX(function(Victim : String, Attacker : String, HitPart : String)
            local KillSay = { Unpack(Misc.KillSay.Words) }
            local Amount = #KillSay

            local ShouldRemove = Amount > 1

            if ShouldRemove then
                Remove(KillSay, Find(KillSay, Misc.KillSay.Last))

                Amount -= 1
            end

            local Message = KillSay[Random(1, Amount > 0 and Amount or 1)]

            if Message then
                Misc.KillSay.Last = Message

                Message = GSub(Message, "{victim}", Victim)
                Message = GSub(Message, "{attacker}", Attacker)
                Message = GSub(Message, "{hitpart}", HitPart)

                return Message
            end
        end)
    end

    do
        local function GetVoteKickTargetName(Player)
            if type(Player) == "string" then
                return Player
            end
            if typeof(Player) == "Instance" and Player:IsA("Player") then
                return Player.Name
            end
            if type(Player) == "table" and type(Player.Name) == "string" then
                return Player.Name
            end
            return tostring(Player)
        end

        local function GetVoteMode()
            local ModeFlag = Flags["Vote Kick Mode"]
            if not ModeFlag then
                return "yes"
            end
            local V = ModeFlag.Value
            if type(V) == "string" then
                return Lower(V)
            end
            return "yes"
        end

        local VoteKick
        if Shared.Events and Shared.Events.startvotekick then
            VoteKick = HookFunction(Shared.Events.startvotekick, LPH_NO_UPVALUES(function(Player, ...)
                local Result = VoteKick(Player, ...)

                local TargetName = GetVoteKickTargetName(Player)
                local IsSelf = TargetName == LocalPlayer.Name

                if IsSelf and Flags["Hop Vote Kick"] and Flags["Hop Vote Kick"].Value then
                    task.defer(function()
                        pcall(Misc.HopServer)
                    end)
                elseif Flags["Automatic Vote Kick"] and Flags["Automatic Vote Kick"].Value then
                    if not IsSelf then
                        local Mode = GetVoteMode()
                        task.delay(0.15, function()
                            pcall(function()
                                NetworkClient:send("votefromUI", Mode)
                            end)
                        end)
                    end
                end

                return Result
            end))
        end

        local GetGrenadeStat; GetGrenadeStat = HookFunction(Shared.GrenadeObject.getWeaponStat, LPH_NO_UPVALUES(function(Self, Index, ...)
            if not CheckCaller() then
                if Index == "throwspeed" then
                    local Value = GetGrenadeStat(Self, Index, ...)

                    return Value * (Flags["Grenade Speed Adjustment"].Value / 100)
                end
            end

            return GetGrenadeStat(Self, Index, ...)
        end))

        local GetWeaponStat; GetWeaponStat = HookFunction(FirearmObject.getWeaponStat, LPH_NO_UPVALUES(function(Self, Index, ...)
            if not CheckCaller() then
                if Index == "shootcooldown" or Index == "cooldown" or Index == "firerate" or Index == "firecap" or Index == "animationfirerate" then
                    local Original = GetWeaponStat(Self, Index, ...)
                    if type(Original) ~= "number" then
                        return Original
                    end
                    local Mult = 1
                    if Flags["Fire Rate Multiplier"] and type(Flags["Fire Rate Multiplier"].Value) == "number" then
                        Mult = Flags["Fire Rate Multiplier"].Value
                    end
                    if Mult <= 0 then Mult = 0.25 end
                    if Index == "shootcooldown" or Index == "cooldown" then
                        return Original / Mult
                    end
                    return Original * Mult
                elseif Index == "firemode" or Index == "firemodes" then
                    if Flags["Custom Fire Mode"].Value then
                        local Mode = Flags["Custom Fire Mode"].Value
                        if Index == "firemodes" then
                            return { Mode }
                        end
                        return Mode
                    end
                elseif Index == "equipspeed" then
                    if Flags["Instant Equip"].Value then
                        return 9e9
                    end
                elseif Index == "unequipspeed" then
                    if Flags["Instant UnEquip"].Value then
                        return 9e9
                    end
                elseif Index == "aimspeed" or Index == "magnifyspeed" or Index == "unaimspeed" or Index == "unmagnifyspeed" then
                    if Flags["Instant Aim"].Value then
                        return 9e9
                    end
                elseif Index == "restrictedads" then
                    if Flags["No ADS Restrictions"].Value then
                        return false
                    end
                else
                    local Name = GetInfo(3).name

                    if (not Name or Name == "") then
                        if Index == "choke" then
                            return true
                        elseif Index == "xbias" or Index == "ybias" then
                            return (GetWeaponStat(Self, Index, ...) or 1) * (Flags["Spread Adjustment"].Value / 100)
                        end
                    end

                    if
                        Name == "impulseSprings" and
                        StringFind(Lower(Index), "spread")
                    then
                        local SpreadSpring = Self._spreadSpring
                        local Adjustment = Flags["Spread Adjustment"].Value / 100

                        local Spread = GetWeaponStat(Self, Index, ...)

                        if SpreadSpring then
                            SpreadSpring._p0 *= Adjustment
                            SpreadSpring._v0 *= Adjustment
                        end

                        if Spread then
                            return Spread * Adjustment
                        else
                            return Spread
                        end
                    end
                end
            end

            return GetWeaponStat(Self, Index, ...)
        end))

        local GetActiveAimStat; GetActiveAimStat = HookFunction(FirearmObject.getActiveAimStat, LPH_NO_UPVALUES(function(Self, Index, ...)
            if not CheckCaller() then
                if Index == "swayamp" then
                    if Flags["No Scope Sway"].Value then
                        return 0
                    end
                end
            end

            return GetActiveAimStat(Self, Index, ...)
        end))
        
        local function ForceChambered(Self)
            if not Self then return end
            pcall(function()
                Self._needRechambering = false
                Self._bolting = false
                Self._boltOpen = false
                Self._singleactionready = true
                Self._canShoot = true

                local Clock = Shared.GameClock
                local Time = (Clock and Clock.getTime and Clock.getTime()) or Tick()

                local Chamber = Self._chamberState
                if Chamber then
                    if Chamber.setState then
                        Chamber:setState("chambered", Time, true)
                    end
                    pcall(function()
                        Chamber._currentState = "chambered"
                        Chamber._state = "chambered"
                    end)
                end

                local BoltName
                pcall(function() BoltName = Self:getWeaponStat("bolt") end)
                if BoltName and type(Self._animData) == "table" and Self._animData[BoltName] then
                    pcall(function()
                        if Self._boltCF then
                            Self._animData[BoltName].weld.C0 = Self._boltCF(0)
                        end
                    end)
                end
            end)
        end

        local function InstantChamberEnabled()
            return Flags["Instant Chamber"] and Flags["Instant Chamber"].Value == true
        end

        local Reload; Reload = HookFunction(FirearmObject.reload, LPH_NO_UPVALUES(function(Self, ...)
            if not CheckCaller() then
                if
                    Self:isEquipping() or
                    Self:isUnequipping() or
                    (Self:isChambering() and not InstantChamberEnabled())
                then
                    return
                end

                if Flags["Instant Reload"] and Flags["Instant Reload"].Value then
                    NetworkClient:send("reload")
                    Self:applyReloadCount(Self:getWeaponStat("magsize"))
                    Self:fireInput("reloadFinish", Tickbase.GetTick())
                    if InstantChamberEnabled() then
                        ForceChambered(Self)
                    end
                    return
                end
            end

            return Reload(Self, ...)
        end))

        if FirearmObject.shoot then
            local Shoot
            Shoot = HookFunction(FirearmObject.shoot, LPH_NO_UPVALUES(function(Self, Down, ...)
                local Result = Shoot(Self, Down, ...)
                if InstantChamberEnabled() then
                    ForceChambered(Self)
                    pcall(function()
                        local Mult = 1
                        if Flags["Fire Rate Multiplier"] and type(Flags["Fire Rate Multiplier"].Value) == "number" then
                            Mult = Flags["Fire Rate Multiplier"].Value
                        end
                        if Mult > 1 and type(Self._nextShot) == "number" then
                            local Now = (Shared.GameClock and Shared.GameClock.getTime and Shared.GameClock.getTime()) or Tick()
                            local Remain = Self._nextShot - Now
                            if Remain > 0 then
                                Self._nextShot = Now + Remain / Mult
                            end
                        end
                    end)
                end
                return Result
            end))
        end

        if FirearmObject.isChambering then
            local IsChambering
            IsChambering = HookFunction(FirearmObject.isChambering, LPH_NO_UPVALUES(function(Self, ...)
                if InstantChamberEnabled() then
                    ForceChambered(Self)
                    return false
                end
                return IsChambering(Self, ...)
            end))
        end

        if FirearmObject.canFire then
            local CanFire
            CanFire = HookFunction(FirearmObject.canFire, LPH_NO_UPVALUES(function(Self, ...)
                if InstantChamberEnabled() then
                    ForceChambered(Self)
                end
                return CanFire(Self, ...)
            end))
        end

        if FirearmObject.isState then
            local IsState
            IsState = HookFunction(FirearmObject.isState, LPH_NO_UPVALUES(function(Self, State, ...)
                if InstantChamberEnabled() and type(State) == "string" then
                    if State == "chambered" then
                        ForceChambered(Self)
                        return true
                    end
                    if State == "unchambered" or State == "chambering" or State == "chamberCancelling" then
                        ForceChambered(Self)
                        return false
                    end
                end
                return IsState(Self, State, ...)
            end))
        end

        if FirearmObject.fireInput then
            local FireInput
            FireInput = HookFunction(FirearmObject.fireInput, LPH_NO_UPVALUES(function(Self, Input, Time, ...)
                local Result = FireInput(Self, Input, Time, ...)
                if InstantChamberEnabled() then
                    ForceChambered(Self)
                end
                return Result
            end))
        end

        if FirearmObject.fireRound then
            local FireRound
            FireRound = HookFunction(FirearmObject.fireRound, LPH_NO_UPVALUES(function(Self, ...)
                local Result = FireRound(Self, ...)
                if InstantChamberEnabled() then
                    ForceChambered(Self)
                end
                return Result
            end))
        end

        if FirearmObject.playAnimation then
            local PlayAnimation
            PlayAnimation = HookFunction(FirearmObject.playAnimation, LPH_NO_UPVALUES(function(Self, Name, ...)
                if InstantChamberEnabled() and type(Name) == "string" then
                    local LowerName = string.lower(Name)
                    if LowerName == "pullbolt" or LowerName == "onfire" or LowerName:find("chamber", 1, true) then
                        ForceChambered(Self)
                        return
                    end
                end
                return PlayAnimation(Self, Name, ...)
            end))
        end

        task.spawn(function()
            while true do
                task.wait(0.05)
                if InstantChamberEnabled() then
                    local LocalInfo = Info and Info.LocalPlayer
                    local Weapon = LocalInfo and LocalInfo.Weapon
                    if Weapon and LocalInfo.WeaponType == "Firearm" then
                        ForceChambered(Weapon)
                    end
                end
            end
        end)

    Misc.RefreshKillSay()
    Misc.RefreshHitsounds()
    Misc.RefreshKillsounds()
end


do
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if not Flags["Custom Camera FOV"] or not Flags["Custom Camera FOV"].Value then return end
            local Cam = workspace.CurrentCamera
            if not Cam then return end
            local DisableAim = Flags["Camera FOV Disable On Aim"] and Flags["Camera FOV Disable On Aim"].Value
            local LocalInfo = Info and Info.LocalPlayer
            local Aiming = LocalInfo and LocalInfo.Weapon and LocalInfo.Weapon._aiming
            if DisableAim and Aiming then return end
            local V = Flags["Camera FOV Value"] and Flags["Camera FOV Value"].Value
            if type(V) == "number" then
                Cam.FieldOfView = V
            end
        end)
    end)
end

local function __LoadEsp()
    local Fonts = Menu.Fonts

    do
        Esp.Render = LPH_JIT_MAX(function(Type : String, Properties : Table, Drawing : Boolean)
            if Drawing == true then
                local Render = NewDrawing(Type)

                if Type == "Triangle" or Type == "Quad" then
                    Render.Thickness = 1
                    Render.Filled = true
                    Render.Color = NewRGB(255, 255, 255)
                elseif Type == "Line" then
                    Render.Thickness = 1
                    Render.Color = NewRGB(255, 255, 255)
                end

                for Index, Value in next, Properties do
                    Render[Index] = Value
                end

                return Render
            end

            local IsText = Type == "TextLabel" or Type == "TextButton" or Type == "TextBox"
            local Render = NewInstance(Type)

            if Type == "Beam" then
                local TextureFlag = Flags["Tracer Texture"]
                local Texture = (TextureFlag and TextureFlag.Value) or "Obelus"
                local Props = TracerProperties and TracerProperties[Texture]
                if Props then
                    for Index, Value in next, Props do
                        Render[Index] = Value
                    end
                end
            elseif Type == "Trail" then
                Render.WidthScale = NewNumberSequence({ NewNumberKeypoint(0, 4, 0), NewNumberKeypoint(1, 4, 0) })
                Render.Brightness = 1.5
                Render.Texture = "rbxassetid://2382169232"
                Render.Transparency = NewNumberSequence(0.45)
                Render.TextureLength = 5
                Render.MinLength = 0.1
                Render.LightEmission = 5
            elseif Type == "UIStroke" then
                Render.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                Render.LineJoinMode = Enum.LineJoinMode.Miter
                Render.Color = NewRGB(0, 0, 0)
                Render.Thickness = 1
            elseif Type == "CylinderHandleAdornment" then
                Render.CFrame = NewCFrame(EmptyVector3, NewVector3(0, 90, 0))
            elseif IsText then
                Render.TextStrokeTransparency = 1
            end

            if Type ~= "UIStroke" and Properties["TextStrokeTransparency"] ~= nil then
                local Stroke = Esp.Render("UIStroke", {
                    Parent = Render,
                    Color = Properties.TextStrokeColor3,
                    LineJoinMode = Properties.LineJoinMode,
                    ApplyStrokeMode = Properties.ApplyStrokeMode,
                    Thickness = Properties.Thickness,
                    Transparency = Properties.TextStrokeTransparency
                })

                if IsText then
                    Render:GetPropertyChangedSignal("TextTransparency"):Connect(function()
                        Stroke.Transparency = Render.TextTransparency
                    end)
                end
            end

            if IsText then
                local Font = Properties.FontFace or Fonts["Smallest Pixel-7"]

                Render.FontFace = Font[1]
                Render.TextSize = Font[2]
                Render.TextColor3 = Font[3]
            end

            for Index, Value in next, Properties do
                if Index == "FontFace" or Index == "TextStrokeTransparency" then continue end

                Render[Index] = Value
            end

            if IsText and Drawing == "Shadow" then
                local Shadow = Esp.Render("TextLabel", Properties)

                Shadow.Position = Render.Position + NewUDim2(0, 1, 0, 1)
                Shadow.TextColor3 = NewRGB(0, 0, 0)
                Shadow.ZIndex = Render.ZIndex - 1

                Render:GetPropertyChangedSignal("Parent"):Connect(function()
                    Shadow.Parent = Render.Parent
                end)

                Render:GetPropertyChangedSignal("Position"):Connect(function()
                    Shadow.Position = Render.Position + NewUDim2(0, 1, 0, 1)
                end)

                Render:GetPropertyChangedSignal("Visible"):Connect(function()
                    Shadow.Visible = Render.Visible
                end)

                Render:GetPropertyChangedSignal("Text"):Connect(function()
                    Shadow.Text = Render.Text
                end)

                Render:GetPropertyChangedSignal("TextTransparency"):Connect(function()
                    Shadow.TextTransparency = Render.TextTransparency
                end)
            end

            return Render
        end)

        Esp.Rotate = LPH_JIT_MAX(function(Vector : Vector2, Radians : Number)
            local Unit = Vector.Unit

            local UnitX = Unit.X
            local UnitY = Unit.Y

            local SinRadians = Sin(Radians)
            local CosRadians = Cos(Radians)

            return NewVector2((CosRadians * UnitX) - (SinRadians * UnitY), (SinRadians * UnitX) + (CosRadians * UnitY)).Unit * Vector.Magnitude
        end)

        Esp.GetBoundingBox = LPH_JIT_MAX(function(Position : Vector3)
            local Scale = (ScreenY * 1.5) / (Position.Z * 2 * Tan((CurrentCamera.FieldOfView * ToRad) / 2))

            local Width = 2.0833 * Scale
            local Height = 3.6364 * Scale

            return NewUDim2(0, Floor(Position.X - (Width / 2)), 0, Floor(Position.Y - (Height / 2.5))), NewUDim2(0, Floor(Width), 0, Floor(Height))
        end)

        Esp.MultiplyColor = LPH_JIT_MAX(function(Color : Color3, Ratio : Number)
            return NewColor3(
                Color.R * Ratio,
                Color.G * Ratio,
                Color.B * Ratio
            )
        end)

        Esp.LerpColor = LPH_JIT_MAX(function(Color1 : Color3, Color2 : Color3, Ratio : Number)
            return NewColor3(
                Esp.Lerp(Color1.R, Color2.R, Ratio, true),
                Esp.Lerp(Color1.G, Color2.G, Ratio, true),
                Esp.Lerp(Color1.B, Color2.B, Ratio, true)
            )
        end)

        Esp.Lerp = LPH_JIT_MAX(function(Current : Number, Goal : Number, Gain : Number, Color : Boolean)
            if Color then
                return Current + (Goal - Current) * Gain
            else
                return (1 - Gain) * Current + Gain * Goal
            end
        end)

        Esp.Parent = LPH_JIT_MAX(function(Renders : Table)
            for Index, Render in next, Renders do
                if
                    Index == "Arrow" or
                    Index == "ArrowOutline" or
                    Index == "Attachments" or
                    Index == "Skeleton" or
                    Index == "Chams" or
                    Index == "Circle"
                then
                    continue
                end

                Render.Parent = nil
            end
        end)
    end

    do
        Esp.GetRenders = LPH_JIT_MAX(function(Player : Player)
            local This = {
                Chams = Esp.GetChams(),

                Attachments = Esp.GetAttachments(),
                Skeleton = Esp.GetSkeleton(),

                Circle = Esp.Render("CylinderHandleAdornment", { Parent = Terrain, Adornee = Terrain, AlwaysOnTop = true, ZIndex = 1, Height = 0.03, CFrame = NewCFrame(EmptyVector3, NewVector3(0, 90, 0)), AdornCullingMode = "Never", Visible = false })
            }

            This.RenderFrame = Esp.Render("Frame", { Visible = false, BackgroundTransparency = 1 })

            This.Name = Esp.Render("TextLabel", { ZIndex = 3, Visible = false, Position = NewUDim2(0.5, 0, 0, -9), Text = Player.Name, TextTransparency = 0, TextStrokeTransparency = 0, BackgroundTransparency = 1 })

            This.Distance = Esp.Render("TextLabel", { ZIndex = 3, Visible = false, Position = NewUDim2(0.5, 0, 1, 14), TextTransparency = 0, TextStrokeTransparency = 0, BackgroundTransparency = 1 })
            This.Weapon = Esp.Render("TextLabel", { ZIndex = 3, Visible = false, Position = NewUDim2(0.5, 0, 1, 6), TextTransparency = 0, TextStrokeTransparency = 0, BackgroundTransparency = 1 })

            This.Box = Esp.Render("Frame", { ZIndex = 1, Visible = false, Position = NewUDim2(0, -1, 0, -1), Size = NewUDim2(1, 2, 1, 2), BackgroundTransparency = 1 })
            This.BoxFill = Esp.Render("Frame", { ZIndex = 2, Visible = false, Position = NewUDim2(0, 1, 0, 1), Size = NewUDim2(1, -2, 1, -2), BackgroundTransparency = 0, BorderSizePixel = 0, BackgroundColor3 = NewRGB(255, 255, 255) })

            This.BoxOutline = Esp.Render("UIStroke", { Thickness = 3 })
            This.BoxInline = Esp.Render("UIStroke", { LineJoinMode = Enum.LineJoinMode.Miter, Thickness = 1, Color = NewRGB(255, 255, 255) })
            This.BoxGradient = Esp.Render("UIGradient", { Enabled = false, Rotation = -90 })
            This.BoxGlow = Esp.Render("ImageLabel", { Position = NewUDim2(0, -24, 0, -24), Size = NewUDim2(1, 47, 1, 47), BackgroundTransparency = 1, ScaleType = "Slice", SliceCenter = Rect.new(NewVector2(21, 21), NewVector2(79, 79)), Image = "http://www.roblox.com/asset/?id=18245826428", ImageTransparency = 0.8 })


            This.Health = Esp.Render("Frame", { ZIndex = 4, Visible = false, Position = NewUDim2(0, -7, 0, -2), Size = NewUDim2(0, 2, 1, 4), BackgroundColor3 = NewRGB(255, 255, 255), BorderSizePixel = 0 })
            This.HealthBack = Esp.Render("Frame", { ZIndex = 3, Visible = false, Position = NewUDim2(0, -7, 0, -2), Size = NewUDim2(0, 2, 1, 4), BorderColor3 = NewRGB(0, 0, 0), BackgroundColor3 = NewRGB(22, 22, 22), BorderSizePixel = 1 })
            This.HealthGradient = Esp.Render("UIGradient", { Enabled = true, Rotation = 90 })
            This.HealthText = Esp.Render("TextLabel", { ZIndex = 5, Visible = false, AnchorPoint = NewVector2(0.5, 0), Position = NewUDim2(0.5, 0, 0, 2), Text = "115", TextTransparency = 0, TextStrokeTransparency = 0, BackgroundTransparency = 1 })

            This.Exploiting = Esp.Render("TextLabel", { ZIndex = 3, Text = "Exploiting [3, 0ms]", Visible = false, Position = NewUDim2(1, 5, 0, 0), TextTransparency = 0, TextStrokeTransparency = 0, BackgroundTransparency = 1, TextXAlignment = "Left" })

            This.Arrow = Esp.Render("Quad", { Visible = false, ZIndex = 3 }, true)
            This.ArrowOutline = Esp.Render("Triangle", { Visible = false, ZIndex = 2, Thickness = 4, Filled = false }, true)

            return This
        end)

        Esp.GetChams = LPH_JIT_MAX(function()
            local This = {}

            local OutlineOffset = NewVector3(0.1, 0.1, 0.1)
            local InlineOffset = NewVector3(-0.1, -0.1, -0.1)

            SetThreadIdentity(7)

            for Name, Value in next, BodyPartSizes do
                local IsHead = (Name == "Head")

                for i = 1, 2 do
                    local IsOutline = (i == 1)
                    local Offset = (IsOutline and 0.3 or 0.4)

                    local Rendered = Esp.Render(IsHead and "CylinderHandleAdornment" or "BoxHandleAdornment", {
                        Parent = Esp.Overlay,
                        AlwaysOnTop = IsOutline and false or true,
                        ZIndex = IsOutline and -1 or 1,
                        Transparency = IsOutline and 0.21 or 0.61,
                        AdornCullingMode = Enum.AdornCullingMode.Never
                    })

                    if IsHead then
                        Rendered.Height = ((Value.Y + 0.4) - Offset)
                        Rendered.Radius = ((Value.X / 2) - Offset)
                    else
                        Rendered.Size = Value + (IsOutline and OutlineOffset or InlineOffset)
                    end

                    This[#This + 1] = {
                        Rendered,
                        Name,
                        IsOutline
                    }
                end
            end

            return This
        end)

        Esp.GetAttachments = LPH_JIT_MAX(function()
            local This = {}

            for Name, Value in next, AttachmentPositions do
                local Attachment = NewInstance("Attachment")

                Attachment.Position = Value

                This[Name] = Attachment
            end

            return This
        end)

        Esp.GetSkeleton = LPH_JIT_MAX(function()
            local This = {}

            for i = 1, #AttachmentJoints do
                This[i] = Esp.Render("Line", { Visible = false, ZIndex = 1 }, true)
            end

            return This
        end)
    end

    do
        Esp.OnSpawn = LPH_JIT_MAX(function(This : Table)
            local AttachmentRenders = This.Renders.Attachments
            local BodyParts = This.BodyParts

            SetThreadIdentity(7)

            for Index, Attachment in next, AttachmentRenders do
                Attachment.Parent = BodyParts[AttachmentParents[Index]]
            end

            Esp.RenderChams(This)
        end)

        Esp.OnDied = LPH_JIT_MAX(function(This : Table)
            local AttachmentRenders = This.Renders.Attachments

            SetThreadIdentity(7)

            for _, Attachment in next, AttachmentRenders do
                Attachment.Parent = Esp.Overlay
            end

            Esp.RenderChams(This)
        end)

        Esp.RenderOnScreen = LPH_JIT_MAX(function(This : Table, Renders : Table, Position : Vector3)
            Renders.Arrow.Visible = false
            Renders.ArrowOutline.Visible = false

            local WeaponObject = This.Weapon

            local Section = GetSection(This.Teammate)

            local RenderFrame = Renders.RenderFrame

            local Box = Renders.Box
            local BoxInline = Renders.BoxInline
            local BoxOutline = Renders.BoxOutline
            local BoxFill = Renders.BoxFill
            local BoxGradient = Renders.BoxGradient
            local BoxGlow = Renders.BoxGlow

            local HealthInline = Renders.Health
            local HealthOutline = Renders.HealthBack
            local HealthText = Renders.HealthText
            local HealthGradient = Renders.HealthGradient

            local Name = Renders.Name

            local Weapon = Renders.Weapon
            local Distance = Renders.Distance

            local Exploiting = Renders.Exploiting

            local SkeletonRenders = Renders.Skeleton
            local AttachmentRenders = Renders.Attachments

            local PriorityColor

            if This.Priority and Flags["Priority Color Enabled"].Value then
                PriorityColor = Flags["Priority Color"].Color
            elseif This.Whitelist and Flags["Whitelist Color Enabled"].Value then
                PriorityColor = Flags["Whitelist Color"].Color
            end

            local BoxPosition, BoxSize = Esp.GetBoundingBox(Position)

            RenderFrame.Position = BoxPosition
            RenderFrame.Size = BoxSize

            RenderFrame.Visible = true
            RenderFrame.Parent = Esp.Overlay

            if Section["Esp Box"].Value then
                local Color = PriorityColor or Section["Esp Box Color"].Color

                Box.Parent = RenderFrame

                BoxInline.Color = Color

                if Section["Esp Box Fill"].Value then
                    BoxFill.Parent = Box

                    local Color1 = Section["Esp Box Fill Color 1"]
                    local Color2 = Section["Esp Box Fill Color 2"]

                    BoxGradient.Parent = BoxFill

                    BoxGradient.Color = NewColorSequence(Color1.Color, Color2.Color)
                    BoxGradient.Transparency = NewNumberSequence({ NewNumberKeypoint(0, Color1.Transparency, 0), NewNumberKeypoint(1, Color2.Transparency, 0) })

                    if Section["Esp Box Fill Spin"].Value then
                        BoxGradient.Rotation += 0.65
                    else
                        BoxGradient.Rotation = -90
                    end

                    BoxGradient.Enabled = true

                    BoxFill.Visible = true
                else
                    BoxFill.Visible = false
                    BoxFill.Parent = nil

                    BoxGradient.Parent = nil
                end

                if Section["Esp Box Glow"].Value then
                    BoxGlow.Parent = RenderFrame

                    BoxGlow.ImageColor3 = Color

                    BoxGlow.Visible = true
                else
                    BoxGlow.Visible = false
                    BoxGlow.Parent = nil
                end

                Box.Visible = true

                BoxInline.Parent = Box
                BoxOutline.Parent = RenderFrame
            else
                Box.Visible = false
                Box.Parent = nil

                BoxInline.Parent = nil
                BoxOutline.Parent = nil

                BoxGlow.Visible = false
                BoxGlow.Parent = nil

                BoxGradient.Parent = nil
            end

            if Section["Esp Health Bar"].Value then
                local Health = Ceil(This.Health)

                local Percent = Health / This.MaxHealth
                local SizeY = Esp.Lerp(HealthInline.Size.Y.Scale, Percent, 0.1, false)

                HealthInline.Parent = HealthOutline
                HealthOutline.Parent = RenderFrame

                HealthInline.Size = NewUDim2(0, 2, SizeY, 0)
                HealthInline.Position = NewUDim2(0, 0, 1 - SizeY, 0)

                HealthOutline.Size = NewUDim2(0, 2, 1, 4)
                HealthOutline.Position = NewUDim2(0, -7, 0, -2)

                HealthInline.BackgroundTransparency = 0
                HealthOutline.BackgroundTransparency = 0

                if PriorityColor then
                    HealthGradient.Enabled = false
                    HealthGradient.Parent = nil

                    HealthInline.BackgroundColor3 = PriorityColor
                else
                    local HealthColor1 = Section["Esp Health Color 1"].Color
                    local HealthColor2 = Section["Esp Health Color 2"].Color

                    local HealthType = Section["Esp Health Bar Type"].Value

                    if HealthType == "Static" then
                        HealthGradient.Enabled = false
                        HealthGradient.Parent = nil

                        HealthInline.BackgroundColor3 = HealthColor1
                    elseif HealthType == "Dynamic" then
                        HealthGradient.Enabled = false
                        HealthGradient.Parent = nil

                        if HealthColor1 == HealthColor2 then
                            HealthInline.BackgroundColor3 = HealthColor1
                        else
                            HealthInline.BackgroundColor3 = Esp.LerpColor(HealthColor2, HealthColor1, Percent)
                        end
                    else
                        HealthGradient.Parent = HealthInline
                        HealthGradient.Enabled = true

                        HealthInline.BackgroundColor3 = NewRGB(255, 255, 255)

                        if HealthColor1 == HealthColor2 then
                            HealthGradient.Color = NewColorSequence(HealthColor1, HealthColor1)
                        else
                            HealthGradient.Color = NewColorSequence(Esp.LerpColor(HealthColor2, HealthColor1, Percent), HealthColor2)
                        end
                    end
                end

                if Percent < 1 then
                    HealthText.Parent = HealthInline

                    HealthText.Text = Health

                    if PriorityColor then
                        HealthText.TextColor3 = PriorityColor
                        HealthText.TextTransparency = 0
                    else
                        local HealthColor3 = Section["Esp Health Color 3"]

                        HealthText.TextColor3 = HealthColor3.Color
                        HealthText.TextTransparency = HealthColor3.Transparency
                    end

                    HealthText.Visible = true
                else
                    HealthText.Visible = false
                    HealthText.Parent = nil
                end

                HealthInline.Visible = true
                HealthOutline.Visible = true
            else
                HealthInline.Visible = false
                HealthOutline.Visible = false

                HealthInline.Parent = nil
                HealthOutline.Parent = nil

                HealthText.Parent = nil
                HealthGradient.Parent = nil
            end

            if Section["Esp Name"].Value then
                local Flag = Section["Esp Name Color"]

                Name.Parent = RenderFrame
                Name.Position = NewUDim2(0.5, 0, 0, -9)

                Name.TextColor3 = PriorityColor or Flag.Color
                Name.TextTransparency = PriorityColor and 0 or Flag.Transparency

                Name.Visible = true
            else
                Name.Visible = false
                Name.Parent = nil
            end

            if Section["Esp Exploiting"].Value and This.Exploiting then
                local Flag = Section["Esp Exploiting Color"]

                Exploiting.Parent = RenderFrame

                Exploiting.TextColor3 = Flag.Color
                Exploiting.TextTransparency = Flag.Transparency

                local ExtendedOrigin = This.ExtendedOrigin
                local Pitch = This.Pitch

                local Data = {}

                if ExtendedOrigin then
                    Data[#Data + 1] = Format("Origin: %sm", Round(ExtendedOrigin))
                end

                if Pitch then
                    Data[#Data + 1] = Format("Pitch: %.2f", Pitch)
                end

                if This.NoSpread then
                    Data[#Data + 1] = "NS"
                end

                Exploiting.Text = Format("Exploiting [%s, %.1fs]", Concat(Data, ", "), Tick() - This.ExploitTick)

                Exploiting.Visible = true
            else
                Exploiting.Visible = false
                Exploiting.Parent = nil
            end

            do
                local OffsetY = 10

                if Section["Esp Weapon"].Value and WeaponObject then
                    local Flag = Section["Esp Weapon Color"]

                    Weapon.Parent = RenderFrame
                    Weapon.Text = WeaponObject
                    Weapon.TextColor3 = PriorityColor or Flag.Color
                    Weapon.TextTransparency = PriorityColor and 0 or Flag.Transparency
                    Weapon.Position = NewUDim2(0.5, 0, 1, OffsetY)
                    Weapon.Visible = true
                    OffsetY += 10
                else
                    Weapon.Visible = false
                    Weapon.Parent = nil
                end

                if Section["Esp Distance"].Value then
                    local Flag = Section["Esp Distance Color"]

                    Distance.Parent = RenderFrame
                    Distance.Text = This.Distance .. "m"
                    Distance.TextColor3 = PriorityColor or Flag.Color
                    Distance.TextTransparency = PriorityColor and 0 or Flag.Transparency
                    Distance.Position = NewUDim2(0.5, 0, 1, OffsetY)
                    Distance.Visible = true
                else
                    Distance.Visible = false
                    Distance.Parent = nil
                end
            end

            for i = 1, #AttachmentJoints do
                local Line = SkeletonRenders[i]

                if not Section["Esp Skeleton"].Value then
                    Line.Visible = false

                    continue
                end

                local JointData = AttachmentJoints[i]

                local From = Camera.WorldToViewportPoint(AttachmentRenders[JointData[1]].WorldCFrame.Position)
                local To = Camera.WorldToViewportPoint(AttachmentRenders[JointData[2]].WorldCFrame.Position)

                Line.From = NewVector2(From.X, From.Y)
                Line.To = NewVector2(To.X, To.Y)

                local Flag = Section["Esp Skeleton Color"]

                Line.Color = PriorityColor or Flag.Color
                Line.Transparency = 1 - (PriorityColor and 0 or Flag.Transparency)

                Line.Visible = true
            end
        end)

        Esp.RenderOffScreen = LPH_JIT_MAX(function(This : Table, Renders : Table, Skeleton : Table, Position : Vector3)
            Renders.RenderFrame.Visible = false

            for i = 1, #Skeleton do
                Skeleton[i].Visible = false
            end

            Esp.Parent(Renders)

            local Arrow = Renders.Arrow
            local ArrowOutline = Renders.ArrowOutline

            local Name = Renders.Name
            local Weapon = Renders.Weapon

            local HealthInline = Renders.Health
            local HealthOutline = Renders.HealthBack

            local DistanceRender = Renders.Distance

            local Section = GetSection(This.Teammate)

            if Section["Esp Oov"].Value then
                local Flag = Section["Esp Oov Color"]

                local Blinking = Section["Esp Oov Blink"].Value

                local Transparency = Blinking and (Sin(Tick() * (4 + Section["Esp Oov Blink Speed"].Value)) + 1) / 2 or Flag.Transparency
                local PriorityColor

                local Overlay = Esp.Overlay

                local WeaponObject = This.Weapon

                local HealthGradient = Renders.HealthGradient
                local HealthText = Renders.HealthText

                local Relative = PointToObjectSpace(CurrentCamera.CFrame, Position)
                local Angle = Atan2(-Relative.Y, Relative.X)

                local Radius
                local Size

                local Direction = NewVector2(Cos(Angle), Sin(Angle))

                do
                    if This.Priority and Flags["Priority Color Enabled"].Value then
                        PriorityColor = Flags["Priority Color"].Color
                    elseif This.Whitelist and Flags["Whitelist Color Enabled"].Value then
                        PriorityColor = Flags["Whitelist Color"].Color
                    end

                    if not Blinking and PriorityColor then
                        Transparency = 0
                    end
                end

                do
                    local Distance = Min((This.RootPosition - CurrentCamera.CFrame.Position).Magnitude, 150)

                    if Section["Esp Oov Dynamic Distance"].Value then
                        Radius = Clamp(10 + (Max(0, Distance) / 150) * 85, 10, 95) / 400
                    else
                        Radius = Section["Esp Oov Distance"].Value / 400
                    end

                    if Section["Esp Oov Dynamic Size"].Value then
                        Size = 40 - Clamp(10 + (Max(0, Distance) / 150) * 20, 10, 30)
                    else
                        Size = Section["Esp Oov Size"].Value
                    end
                end

                local PointA = (Direction * ScreenX * Radius) + (ScreenSize / 2)
                local PointB
                local PointC

                do
                    Arrow.PointA = PointA

                    if Section["Esp Oov Style"].Value == "Concave" then
                        PointB = PointA - Esp.Rotate(Direction, 0.45) * Size
                        PointC = PointA - Esp.Rotate(Direction, -0.45) * Size

                        local PointD = PointA - Esp.Rotate(Direction, 0) * (Size / 1.6)

                        Arrow.PointB = PointB
                        Arrow.PointC = PointD
                        Arrow.PointD = PointC

                        ArrowOutline.Visible = false
                    else
                        PointB = PointA - Esp.Rotate(Direction, 0.5) * Size
                        PointC = PointA - Esp.Rotate(Direction, -0.5) * Size

                        Arrow.PointB = PointB
                        Arrow.PointC = PointB
                        Arrow.PointD = PointC

                        ArrowOutline.Color = Esp.MultiplyColor(PriorityColor or Flag.Color, 0.6)
                        ArrowOutline.Transparency = 1 - Transparency

                        ArrowOutline.PointA = PointA
                        ArrowOutline.PointB = PointB
                        ArrowOutline.PointC = PointC

                        ArrowOutline.Visible = true
                    end

                    Arrow.Color = PriorityColor or Flag.Color
                    Arrow.Transparency = 1 - Transparency

                    Arrow.Visible = true
                end

                do
                    local BoxPosition = (NewVector2((PointA.X + PointB.X + PointC.X) / 3, (PointA.Y + PointB.Y + PointC.Y) / 3)) - NewVector2(Size / 2, Size / 2)

                    local Elements = MultiToList(Section["Esp Oov Elements"].Value)

                    local OffsetY = 6

                    if Find(Elements, "Name") then
                        Name.Parent = Overlay
                        Name.Position = NewUDim2(0, BoxPosition.X + Size / 2, 0, BoxPosition.Y - 14)

                        Name.TextColor3 = PriorityColor or Section["Esp Name Color"].Color
                        Name.TextTransparency = Transparency

                        Name.Visible = true
                    end

                    if Find(Elements, "Health Bar") then
                        local Health = Ceil(This.Health)

                        local Percent = Health / This.MaxHealth
                        local SizeY = Esp.Lerp(HealthInline.Size.Y.Scale, Percent, 0.1, false)

                        HealthInline.Parent = HealthOutline
                        HealthOutline.Parent = Overlay

                        HealthInline.Position = NewUDim2(0, 0, 1 - SizeY, 0)
                        HealthOutline.Position = NewUDim2(0, BoxPosition.X - 7, 0, BoxPosition.Y - 1)

                        HealthInline.Size = NewUDim2(0, 2, SizeY, 0)
                        HealthOutline.Size = NewUDim2(0, 2, 0, Size)

                        HealthInline.BackgroundTransparency = Transparency
                        HealthOutline.BackgroundTransparency = Transparency

                        if PriorityColor then
                            HealthGradient.Enabled = false

                            HealthInline.BackgroundColor3 = PriorityColor
                        else
                            local HealthColor1 = Section["Esp Health Color 1"].Color
                            local HealthColor2 = Section["Esp Health Color 2"].Color

                            local HealthType = Section["Esp Health Bar Type"].Value

                            if HealthType == "Static" then
                                HealthGradient.Enabled = false
                                HealthGradient.Parent = nil

                                HealthInline.BackgroundColor3 = HealthColor1
                            elseif HealthType == "Dynamic" then
                                HealthGradient.Enabled = false
                                HealthGradient.Parent = nil

                                if HealthColor1 == HealthColor2 then
                                    HealthInline.BackgroundColor3 = HealthColor1
                                else
                                    HealthInline.BackgroundColor3 = Esp.LerpColor(HealthColor2, HealthColor1, Percent)
                                end
                            else
                                HealthGradient.Parent = HealthInline
                                HealthGradient.Enabled = true

                                HealthInline.BackgroundColor3 = NewRGB(255, 255, 255)

                                if HealthColor1 == HealthColor2 then
                                    HealthGradient.Color = NewColorSequence(HealthColor1, HealthColor1)
                                else
                                    HealthGradient.Color = NewColorSequence(Esp.LerpColor(HealthColor2, HealthColor1, Percent), HealthColor2)
                                end
                            end
                        end

                        if Percent < 1 then
                            HealthText.Parent = HealthInline

                            HealthText.Text = Health

                            HealthText.TextColor3 = PriorityColor or Section["Esp Health Color 3"].Color
                            HealthText.TextTransparency = Transparency

                            HealthText.Visible = true
                        else
                            HealthText.Visible = false
                        end

                        HealthInline.Visible = true
                        HealthOutline.Visible = true
                    end

                    if Find(Elements, "Weapon") and WeaponObject then
                        Weapon.Parent = Overlay
                        Weapon.Position = NewUDim2(0, BoxPosition.X + Size / 2, 0, BoxPosition.Y + Size + OffsetY)

                        Weapon.Text = WeaponObject

                        Weapon.TextColor3 = PriorityColor or Section["Esp Weapon Color"].Color
                        Weapon.TextTransparency = Transparency

                        Weapon.Visible = true

                        OffsetY += 8
                    end

                    if Find(Elements, "Distance") then
                        DistanceRender.Parent = Overlay
                        DistanceRender.Position = NewUDim2(0, BoxPosition.X + Size / 2, 0, BoxPosition.Y + Size + (OffsetY or 10))

                        DistanceRender.Text = This.Distance .. "m"

                        DistanceRender.TextColor3 = PriorityColor or Section["Esp Distance Color"].Color
                        DistanceRender.TextTransparency = Transparency

                        DistanceRender.Visible = true
                    end
                end
            else
                Arrow.Visible = false
                ArrowOutline.Visible = false

                Name.Visible = false
                Weapon.Visible = false

                HealthInline.Visible = false
                HealthOutline.Visible = false

                DistanceRender.Visible = false
            end
        end)

        Esp.RenderChams = LPH_JIT_MAX(function(This : Table)
            local Renders = This.Renders

            if not Renders then return end

            local Chams = Renders.Chams
            if not Chams then return end

            local BodyParts = This.BodyParts
            local Alive = This.Alive


            local Section = GetSection(This.Teammate)

            local ChamsEnabled = Section["Chams Enabled"].Value == true
            local GlowsEnabled = Section["Glows Enabled"].Value == true

            local GlowSize = Section["Glows Size"].Value
            if type(GlowSize) ~= "number" or GlowSize <= 0 then
                GlowSize = 1.75
            end

            local ChamsFlag = Section["Chams Color"]
            local OutlineFlag = Section["Outline Color"]

            local ChamsColor = ChamsFlag.Color or ChamsFlag.Value or Color3.new(1, 1, 1)
            local OutlineColor = OutlineFlag.Color or OutlineFlag.Value or Color3.new(0, 0, 0)

            local ChamsTransparency = type(ChamsFlag.Transparency) == "number" and ChamsFlag.Transparency or 0.5
            local OutlineTransparency = type(OutlineFlag.Transparency) == "number" and OutlineFlag.Transparency or 0

            local InlineShade = "Default"
            local OutlineShade = "Default"

            if Section["Chams Shading"].Value then
                local InS = Section["Inline Shade"].Value
                local OutS = Section["Outline Shade"].Value
                if type(InS) == "string" then InlineShade = InS end
                if type(OutS) == "string" then OutlineShade = OutS end
            end

            pcall(SetThreadIdentity, 7)

            for i = 1, #Chams do
                local Data = Chams[i]
                if type(Data) ~= "table" then continue end

                local Render, Name, IsOutline = Data[1], Data[2], Data[3]
                if not Render then continue end

                local Part = BodyParts and BodyParts[Name]

                if not Part or not Alive then
                    pcall(function()
                        Render.Adornee = nil
                        Render.Visible = false
                    end)
                    continue
                end

                pcall(function()
                    Render.Adornee = Part
                    Render.Visible = ChamsEnabled

                    if IsOutline then
                        Render.Color3 = OutlineColor
                        local T = OutlineTransparency
                        if GlowsEnabled then
                            T = OutlineTransparency / GlowSize
                        end
                        Render.Transparency = T
                        Render.AlwaysOnTop = GlowsEnabled
                        pcall(function() Render.Shading = OutlineShade end)
                    else
                        Render.Color3 = ChamsColor
                        Render.Transparency = ChamsTransparency
                        pcall(function() Render.Shading = InlineShade end)
                    end
                end)
            end
        end)

        Esp.RenderAllChams = LPH_JIT_MAX(function()
            local InfoPlayers = Info.Players

            for i = 1, #InfoPlayers do
                Esp.RenderChams(InfoPlayers[i])
            end
        end)

        Esp.Step = LPH_JIT_MAX(function()
            local InfoPlayers = Info.Players

            if Flags["Visualise Fov"].Value then
                local Size = Flags["Visualise Fov Amount"].Value / (CurrentCamera.FieldOfView * 2) * ScreenX

                Esp["Circle"].Size = NewUDim2(0, Size, 0, Size)
            end

            for i = 1, #InfoPlayers do
                local This = InfoPlayers[i]

                local Section = GetSection(This.Teammate)

                if This.Alive and Visuals and Visuals.CacheHitChamsPose and Flags["Hit Chams"] and Flags["Hit Chams"].Value then
                    pcall(Visuals.CacheHitChamsPose, This)
                end

                pcall(function()
                    if Esp.RenderChams then
                        Esp.RenderChams(This)
                    end
                end)

                local Rate = Section["Esp Refresh Rate"] and Section["Esp Refresh Rate"].Value or 60
                if type(Rate) ~= "number" or Rate < 1 then Rate = 60 end
                if (Clock() - This.LastRefresh) < (1 / Rate) then continue end

                This.LastRefresh = Clock()

                local Renders = This.Renders
                local Skeleton = Renders.Skeleton

                local RootPart = This.RootPart

                if
                    This.DisableEsp or
                    not This.Alive or
                    not RootPart or
                    (not This.Priority and This.Distance > Section["Esp Max Distance"].Value) or
                    (Section["Esp Priority Only"].Value and not This.Priority)
                then
                    Renders.RenderFrame.Visible = false

                    Renders.Arrow.Visible = false
                    Renders.ArrowOutline.Visible = false

                    for k = 1, #Skeleton do
                        Skeleton[k].Visible = false
                    end

                    Esp.Parent(Renders)

                    continue
                end

                local RootPosition = RootPart.Position

                local Position, OnScreen = Camera.WorldToViewportPoint(RootPosition)

                if OnScreen then
                    if Section["Esp Enabled"].Value then
                        Esp.RenderOnScreen(This, Renders, Position)
                    else
                        Renders.RenderFrame.Visible = false

                        Renders.Arrow.Visible = false
                        Renders.ArrowOutline.Visible = false

                        for k = 1, #Skeleton do
                            Skeleton[k].Visible = false
                        end

                        Esp.Parent(Renders)
                    end
                else
                    Esp.RenderOffScreen(This, Renders, Skeleton, RootPosition)
                end
            end
        end)
    end

    do
        Esp["Overlay"] = Esp.Render("ScreenGui", { Parent = CoreGui, DisplayOrder = 9, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling })
        Esp["Circle"] = Esp.Render("Frame", { ZIndex = 1000, Parent = Esp.Overlay, Visible = false, Position = NewUDim2(0.5, 0, 0.5, 0), AnchorPoint = NewVector2(0.5, 0.5), BackgroundColor3 = NewRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0 })

        Esp.Render("UICorner", { Parent = Esp.Circle, CornerRadius = NewUDim(1, 0) })
        Esp.Render("UIStroke", { Parent = Esp.Circle, Thickness = 1, Color = NewRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Round })
    end

    Esp.Init = function()
        Stepped:Connect(Esp.Step)
    end
end
__LoadEsp()

local function __LoadVisuals()
    local Fonts = Menu.Fonts
    local Events = Shared.Events
    local Acceleration = Shared.Acceleration
    if typeof(Acceleration) ~= "Vector3" then
        Acceleration = NewVector3(0, -196.2, 0)
    end
    local NegativeAcceleration = -Acceleration

    Visuals.InThirdPerson = false

    Visuals.LastRefresh = 0

    Visuals.Cache = {}
    Visuals.Dropped = {}
    Visuals.ViewModels = {}
    Visuals.Characters = {}

    Visuals.Skybox = FindFirstChildWhichIsA(Lighting, "Sky", true)
    Visuals.Bloom = Esp.Render("BloomEffect", { Parent = Lighting, Enabled = false })

    Visuals.Crosshair = Esp.Render("Frame", { Parent = Esp.Overlay, BackgroundColor3 = NewRGB(255, 255, 255), BorderSizePixel = 0, TextStrokeTransparency = 0, AnchorPoint = NewVector2(0.5, 0.5), Position = NewUDim2(0.5, 0, 0.5, -1), Size = NewUDim2(0, 2, 0, 2), Visible = false })

    Visuals.FireOutline = Esp.Render("Frame", { Parent = Esp.Overlay, BackgroundColor3 = NewRGB(0, 0, 0), BorderSizePixel = 0, AnchorPoint = NewVector2(0.5, 0.5), Position = NewUDim2(0.5, 0, 0.5, 8), Size = NewUDim2(0, 60, 0, 4), Visible = false })
    Visuals.FireInline = Esp.Render("Frame", { Parent = Visuals.FireOutline, BackgroundColor3 = NewRGB(255, 255, 255), BorderSizePixel = 0, AnchorPoint = NewVector2(0, 0.5), Position = NewUDim2(0, 1, 0.5, 0), Size = NewUDim2(1, -2, 1, -2) })

    do
        local ParentGui = (Library and Library.ScreenGui) or Esp.Overlay
        local Outer = Library:Create('Frame', {
            BorderSizePixel = 0,
            Position = UDim2.fromOffset(20, 400),
            Size = UDim2.fromOffset(170, 78),
            Visible = false,
            ZIndex = 100,
            Parent = ParentGui,
        })
        Visuals.WeaponInfoOuter = Outer
        Visuals.WeaponInfoPanel = Outer

        local Inner = Library:Create('Frame', {
            BackgroundColor3 = Library.MainColor,
            BorderColor3 = Library.OutlineColor,
            BorderMode = Enum.BorderMode.Inset,
            Size = UDim2.new(1, 0, 1, 0),
            ZIndex = 101,
            Parent = Outer,
        })
        Visuals.WeaponInfoInner = Inner
        Library:AddToRegistry(Inner, {
            BackgroundColor3 = 'MainColor',
            BorderColor3 = 'OutlineColor',
        }, true)

        local AccentLine = Library:Create('Frame', {
            BackgroundColor3 = Library.AccentColor,
            BorderSizePixel = 0,
            Position = UDim2.fromOffset(0, 20),
            Size = UDim2.new(1, 0, 0, 2),
            ZIndex = 102,
            Parent = Inner,
        })
        Library:AddToRegistry(AccentLine, {
            BackgroundColor3 = 'AccentColor',
            BorderColor3 = 'AccentColor',
        })

        local Title = Library:CreateLabel({
            Size = UDim2.new(1, -8, 0, 18),
            Position = UDim2.fromOffset(4, 1),
            Text = 'Weapon Info',
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = 104,
            Parent = Inner,
        })
        Visuals.WeaponInfoTitle = Title

        local Body = Library:Create('Frame', {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, 24),
            Size = UDim2.new(1, 0, 1, -24),
            ZIndex = 103,
            Parent = Inner,
        })

        local NameLbl = Library:CreateLabel({
            Size = UDim2.new(1, -10, 0, 16),
            Position = UDim2.fromOffset(6, 2),
            Text = '—',
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104,
            Parent = Body,
        })
        Visuals.WeaponInfoName = NameLbl

        local AmmoLbl = Library:CreateLabel({
            Size = UDim2.new(1, -10, 0, 16),
            Position = UDim2.fromOffset(6, 18),
            Text = 'Ammo: —',
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104,
            Parent = Body,
        })
        Visuals.WeaponInfoAmmo = AmmoLbl

        local RateLbl = Library:CreateLabel({
            Size = UDim2.new(1, -10, 0, 16),
            Position = UDim2.fromOffset(6, 34),
            Text = 'Firerate: —',
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104,
            Parent = Body,
        })
        Visuals.WeaponInfoRate = RateLbl

        local Line = nil
        pcall(function()
            if Drawing and Drawing.new then
                Line = Drawing.new('Line')
                Line.Thickness = 1
                Line.Visible = false
                Line.ZIndex = 50
            end
        end)
        if not Line then
            Line = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 0.5),
                Size = UDim2.fromOffset(0, 1),
                Visible = false,
                ZIndex = 99,
                Parent = ParentGui,
            })
            Library:AddToRegistry(Line, {
                BackgroundColor3 = 'AccentColor',
            })
        end
        Visuals.WeaponInfoLine = Line
    end

    Visuals.FakeOutline = Esp.Render("Frame", { Parent = Esp.Overlay, Size = NewUDim2(0, 27, 0, 3), BackgroundColor3 = NewRGB(0, 0, 0), BorderSizePixel = 0, Visible = false })
    Visuals.FakeInline = Esp.Render("Frame", { Parent = Visuals.FakeOutline, Position = NewUDim2(0, 1, 0, 1), Size = NewUDim2(1, -2, 1, -2), BackgroundTransparency = 1, BorderSizePixel = 0 })

    Visuals.FakeBackground = Esp.Render("Frame", { Parent = Visuals.FakeInline, Size = NewUDim2(1, 0, 1, 0), BorderSizePixel = 0 })
    Visuals.FakeText = Esp.Render("TextLabel", { Parent = Visuals.FakeOutline, AnchorPoint = NewVector2(0.5, 0), Position = NewUDim2(0.5, 0, 0, -6), BackgroundTransparency = 1, BorderSizePixel = 0, Text = "FAKE", TextStrokeTransparency = 0 })

    do
        Visuals.Cache.Ambient = Lighting.Ambient
        Visuals.Cache.OutdoorAmbient = Lighting.OutdoorAmbient

        Visuals.Cache.Exposure = Lighting.ExposureCompensation

        Visuals.Cache.ColorShiftTop = Lighting.ColorShift_Top
        Visuals.Cache.ColorShiftBottom = Lighting.ColorShift_Bottom

        Visuals.Param = NewRayParams()
        Visuals.Param.FilterType = Enum.RaycastFilterType.Include
        Visuals.Param.IgnoreWater = true
        Visuals.Param.FilterDescendantsInstances = { Map }

        local function FlagColor(Name, Default)
            local Flag = Flags[Name]
            if not Flag or Flag.Type == "Missing" then return Default or Color3.new(1, 1, 1) end
            local C = Flag.Color or Flag.Value
            if typeof(C) ~= "Color3" then return Default or Color3.new(1, 1, 1) end
            return C
        end
        local function FlagValue(Name, Default)
            local Flag = Flags[Name]
            if not Flag or Flag.Type == "Missing" then return Default end
            local V = Flag.Value
            if V == nil then return Default end
            if Default ~= nil and type(V) ~= type(Default) then return Default end
            return V
        end

        Visuals.Cache.LocalBeam = Esp.Render("Beam", { Parent = Terrain, Color = NewColorSequence(FlagColor("Local Tracer Color", Color3.new(1, 1, 1))) })
        Visuals.Cache.EnemyBeam = Esp.Render("Beam", { Parent = Terrain, Color = NewColorSequence(FlagColor("Enemy Tracer Color", Color3.new(1, 1, 1))) })
        Visuals.Cache.TeamBeam = Esp.Render("Beam", { Parent = Terrain, Color = NewColorSequence(FlagColor("Team Tracer Color", Color3.new(1, 1, 1))) })
        Visuals.Cache.GrenadeBeam = Esp.Render("Trail", { Parent = Terrain, Color = NewColorSequence(FlagColor("Grenade Tracer Color", Color3.new(1, 1, 1))), Lifetime = FlagValue("Tracer Time", 1) })

        Visuals.Cache.Impact = Esp.Render("Part", { Parent = Terrain, Material = Enum.Material.ForceField, Color = FlagColor("Bullet Impacts Color", Color3.new(1, 1, 1)), Size = NewVector3(0.35, 0.35, 0.35), Anchored = true, CanCollide = false, CanQuery = false, Transparency = 1 })

        Visuals.Cache.ShootSound = Esp.Render("Sound", { Parent = Terrain, Volume = (FlagValue("ShootSound Volume", 100) / 100), PlaybackSpeed = FlagValue("ShootSound Speed", 1), RollOffMaxDistance = 10000, RollOffMinDistance = 10, RollOffMode = Enum.RollOffMode.Inverse, PlayOnRemove = true })
        local HitId = ""
        local KillId = ""
        pcall(function()
            if HitsoundIds and Flags["Hitsound"] then
                HitId = HitsoundIds[FlagValue("Hitsound", "Disabled")] or ""
            end
            if KillsoundIds and Flags["Killsound"] then
                KillId = KillsoundIds[FlagValue("Killsound", "Disabled")] or ""
            end
        end)
        Visuals.Cache.Hitsound = Esp.Render("Sound", { Parent = Terrain, SoundId = HitId, Volume = (FlagValue("Hitsound Volume", 100) / 100), RollOffMaxDistance = 10000, RollOffMinDistance = 10, RollOffMode = Enum.RollOffMode.Inverse, PlayOnRemove = true })
        Visuals.Cache.Killsound = Esp.Render("Sound", { Parent = Terrain, SoundId = KillId, Volume = (FlagValue("Killsound Volume", 100) / 100), RollOffMaxDistance = 10000, RollOffMinDistance = 10, RollOffMode = Enum.RollOffMode.Inverse, PlayOnRemove = true })
    end

    do

        Visuals.HitmarkerGui = nil
        Visuals.HitmarkerLines = {}
        Visuals.HitmarkerDamageLabel = nil
        Visuals.HitmarkerFlash = nil
        Visuals.LastHitmarkerToken = 0

        Visuals.EnsureHitmarkerGui = function()
            if Visuals.HitmarkerGui and Visuals.HitmarkerGui.Parent then
                return Visuals.HitmarkerGui
            end
            local Gui = NewInstance("ScreenGui")
            Gui.Name = "IriHitmarkers"
            Gui.IgnoreGuiInset = true
            Gui.ResetOnSpawn = false
            Gui.DisplayOrder = 100
            Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            pcall(function()
                Gui.Parent = (gethui and gethui()) or CoreGui
            end)
            if not Gui.Parent then
                Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
            end
            Visuals.HitmarkerGui = Gui

            local Flash = NewInstance("Frame")
            Flash.Name = "Flash"
            Flash.BackgroundColor3 = Color3.new(1, 0, 0)
            Flash.BackgroundTransparency = 1
            Flash.BorderSizePixel = 0
            Flash.Size = UDim2.new(1, 0, 1, 0)
            Flash.ZIndex = 1
            Flash.Parent = Gui
            Visuals.HitmarkerFlash = Flash

            local Damage = NewInstance("TextLabel")
            Damage.Name = "Damage"
            Damage.BackgroundTransparency = 1
            Damage.AnchorPoint = Vector2.new(0.5, 0.5)
            Damage.Position = UDim2.new(0.5, 0, 0.5, -30)
            Damage.Size = UDim2.new(0, 80, 0, 24)
            Damage.Font = Enum.Font.Code
            Damage.TextSize = 14
            Damage.TextColor3 = Color3.new(1, 1, 1)
            Damage.TextStrokeTransparency = 0
            Damage.TextStrokeColor3 = Color3.new(0, 0, 0)
            Damage.Text = ""
            Damage.Visible = false
            Damage.ZIndex = 5
            Damage.Parent = Gui
            Visuals.HitmarkerDamageLabel = Damage

            Visuals.HitmarkerLines = {}
            Visuals.HitmarkerLineOutlines = {}
            for i = 1, 4 do
                local Line = NewInstance("Frame")
                Line.Name = "Line" .. i
                Line.AnchorPoint = Vector2.new(0.5, 0.5)
                Line.BorderSizePixel = 0
                Line.BackgroundColor3 = Color3.new(1, 1, 1)
                Line.Visible = false
                Line.ZIndex = 4
                Line.Parent = Gui
                local Outline = NewInstance("UIStroke")
                Outline.Name = "Outline"
                Outline.Thickness = 1
                Outline.Color = Color3.new(0, 0, 0)
                Outline.Enabled = false
                Outline.Parent = Line
                Visuals.HitmarkerLines[i] = Line
                Visuals.HitmarkerLineOutlines[i] = Outline
            end

            local Dot = NewInstance("Frame")
            Dot.Name = "Dot"
            Dot.AnchorPoint = Vector2.new(0.5, 0.5)
            Dot.Position = UDim2.new(0.5, 0, 0.5, 0)
            Dot.Size = UDim2.new(0, 4, 0, 4)
            Dot.BorderSizePixel = 0
            Dot.BackgroundColor3 = Color3.new(1, 1, 1)
            Dot.Visible = false
            Dot.ZIndex = 4
            Dot.Parent = Gui
            Visuals.HitmarkerDot = Dot

            local Circle = NewInstance("Frame")
            Circle.Name = "Circle"
            Circle.AnchorPoint = Vector2.new(0.5, 0.5)
            Circle.Position = UDim2.new(0.5, 0, 0.5, 0)
            Circle.Size = UDim2.new(0, 16, 0, 16)
            Circle.BackgroundTransparency = 1
            Circle.Visible = false
            Circle.ZIndex = 4
            Circle.Parent = Gui
            local Stroke = NewInstance("UIStroke")
            Stroke.Thickness = 2
            Stroke.Color = Color3.new(1, 1, 1)
            Stroke.Parent = Circle
            local Corner = NewInstance("UICorner")
            Corner.CornerRadius = UDim.new(1, 0)
            Corner.Parent = Circle
            Visuals.HitmarkerCircle = Circle
            Visuals.HitmarkerCircleStroke = Stroke

            return Gui
        end


        Visuals.WorldDamageFolder = nil
        Visuals.ShowWorldDamage = LPH_JIT_MAX(function(WorldPos, DamageAmount, IsHeadshot)
            if not Flags["Hitmarker Damage"].Value then return end
            local Amt = tonumber(DamageAmount)
            if not Amt or Amt <= 0 then return end
            if typeof(WorldPos) ~= "Vector3" then return end

            if not Visuals.WorldDamageFolder or not Visuals.WorldDamageFolder.Parent then
                local Folder = NewInstance("Folder")
                Folder.Name = "IriWorldDamage"
                Folder.Parent = Terrain
                Visuals.WorldDamageFolder = Folder
            end

            local DmgColor = Flags["Hitmarker Damage Color"]
            local Color = (DmgColor and (DmgColor.Color or DmgColor.Value)) or Color3.new(1, 1, 1)
            if IsHeadshot then
                local HeadFlag = Flags["Hitmarker Head Color"]
                if HeadFlag then
                    Color = HeadFlag.Color or HeadFlag.Value or Color
                end
            end
            local DSize = Flags["Hitmarker Damage Size"].Value
            if type(DSize) ~= "number" then DSize = 14 end
            local UseOutline = Flags["Hitmarker Outline"].Value == true
            local OutlineColor = Color3.new(0, 0, 0)
            local OFlag = Flags["Hitmarker Outline Color"]
            if OFlag then OutlineColor = OFlag.Color or OFlag.Value or OutlineColor end

            local Duration = Flags["Hitmarker Duration"].Value
            if type(Duration) ~= "number" then Duration = 0.6 end
            Duration = math.max(Duration, 0.35)

            local Part = NewInstance("Part")
            Part.Name = "Dmg"
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanQuery = false
            Part.CanTouch = false
            Part.Transparency = 1
            Part.Size = NewVector3(0.1, 0.1, 0.1)
            Part.CFrame = NewCFrame(WorldPos + NewVector3(0, 0.5, 0))
            Part.Parent = Visuals.WorldDamageFolder

            local Bill = NewInstance("BillboardGui")
            Bill.Name = "DmgBill"
            Bill.AlwaysOnTop = true
            Bill.Size = UDim2.new(0, 100, 0, 40)
            Bill.StudsOffset = NewVector3(0, 0, 0)
            Bill.Adornee = Part
            Bill.Parent = Part

            local Label = NewInstance("TextLabel")
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.Font = Enum.Font.Code
            Label.TextSize = DSize
            Label.TextColor3 = Color
            Label.TextStrokeTransparency = UseOutline and 0 or 1
            Label.TextStrokeColor3 = OutlineColor
            Label.Text = tostring(math.floor(Amt + 0.5))
            Label.TextTransparency = 0
            Label.Parent = Bill

            local StartPos = WorldPos + NewVector3(0, 0.5, 0)
            local EndOffset = 2.5 + (math.random() * 0.8)
            local SideJitter = (math.random() - 0.5) * 0.6
            local Start = Clock()
            local Token = tostring(Start) .. tostring(math.random())

            task.spawn(function()
                while Part and Part.Parent do
                    local Elapsed = Clock() - Start
                    local Alpha = Elapsed / Duration
                    if Alpha >= 1 then break end
                    local Ease = 1 - (1 - Alpha) * (1 - Alpha)
                    Part.CFrame = NewCFrame(StartPos + NewVector3(SideJitter * Ease, EndOffset * Ease, SideJitter * 0.3 * Ease))
                    Label.TextTransparency = Alpha
                    if UseOutline then
                        Label.TextStrokeTransparency = Alpha
                    end
                    Bill.StudsOffset = NewVector3(0, 0, 0)
                    task.wait()
                end
                pcall(function()
                    if Part then Part:Destroy() end
                end)
            end)
        end)

        Visuals.HitChamsFolder = nil
        Visuals.HitChamsMarked = {}
        Visuals.HitChamsPoseCache = {}
        Visuals.HitChamsLastCache = {}

        Visuals.HitChamsPartNames = {
            "Head", "Torso", "UpperTorso", "LowerTorso",
            "Left Arm", "Right Arm", "LeftArm", "RightArm",
            "LeftUpperArm", "LeftLowerArm", "LeftHand",
            "RightUpperArm", "RightLowerArm", "RightHand",
            "Left Leg", "Right Leg", "LeftLeg", "RightLeg",
            "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
            "RightUpperLeg", "RightLowerLeg", "RightFoot",
        }

        Visuals.HitChamsDefaultSize = {
            Head = Vector3.new(1.2, 1.2, 1.2),
            Torso = Vector3.new(2, 2, 1),
            UpperTorso = Vector3.new(2, 1.6, 1),
            LowerTorso = Vector3.new(2, 0.8, 1),
            ["Left Arm"] = Vector3.new(1, 2, 1),
            ["Right Arm"] = Vector3.new(1, 2, 1),
            LeftArm = Vector3.new(1, 2, 1),
            RightArm = Vector3.new(1, 2, 1),
            LeftUpperArm = Vector3.new(1, 1.2, 1),
            LeftLowerArm = Vector3.new(1, 1.2, 1),
            LeftHand = Vector3.new(0.8, 0.8, 0.8),
            RightUpperArm = Vector3.new(1, 1.2, 1),
            RightLowerArm = Vector3.new(1, 1.2, 1),
            RightHand = Vector3.new(0.8, 0.8, 0.8),
            ["Left Leg"] = Vector3.new(1, 2, 1),
            ["Right Leg"] = Vector3.new(1, 2, 1),
            LeftLeg = Vector3.new(1, 2, 1),
            RightLeg = Vector3.new(1, 2, 1),
            LeftUpperLeg = Vector3.new(1, 1.2, 1),
            LeftLowerLeg = Vector3.new(1, 1.2, 1),
            LeftFoot = Vector3.new(1, 0.5, 1),
            RightUpperLeg = Vector3.new(1, 1.2, 1),
            RightLowerLeg = Vector3.new(1, 1.2, 1),
            RightFoot = Vector3.new(1, 0.5, 1),
        }

        Visuals.ResolveHitChamSize = function(Name, Part)
            if BodyPartSizes and BodyPartSizes[Name] then
                return BodyPartSizes[Name]
            end
            if Visuals.HitChamsDefaultSize[Name] then
                return Visuals.HitChamsDefaultSize[Name]
            end
            if Part then
                local Ok, SZ = pcall(function() return Part.Size end)
                if Ok and typeof(SZ) == "Vector3" and SZ.Magnitude > 0.15 then
                    return SZ
                end
            end
            return Vector3.new(1, 2, 1)
        end

        Visuals.BuildPoseFromParts = function(BodyParts, Character, RootPart)
            local Pose = {}
            local Count = 0
            local Names = Visuals.HitChamsPartNames

            if type(BodyParts) == "table" then
                for i = 1, #Names do
                    local Name = Names[i]
                    local Part = BodyParts[Name]
                    if typeof(Part) == "Instance" then
                        local Ok, IsPart = pcall(function() return Part:IsA("BasePart") end)
                        if Ok and IsPart then
                            local Ok2, CF = pcall(function() return Part.CFrame end)
                            if Ok2 and typeof(CF) == "CFrame" then
                                Pose[Name] = {
                                    CFrame = CF,
                                    Size = Visuals.ResolveHitChamSize(Name, Part),
                                    IsHead = (Name == "Head"),
                                }
                                Count = Count + 1
                            end
                        end
                    end
                end
                if Count == 0 then
                    for Name, Part in next, BodyParts do
                        if typeof(Part) == "Instance" then
                            local Ok, IsPart = pcall(function() return Part:IsA("BasePart") end)
                            if Ok and IsPart then
                                local Ok2, CF = pcall(function() return Part.CFrame end)
                                if Ok2 and typeof(CF) == "CFrame" then
                                    local N = tostring(Name)
                                    Pose[N] = {
                                        CFrame = CF,
                                        Size = Visuals.ResolveHitChamSize(N, Part),
                                        IsHead = (N == "Head" or string.find(string.lower(N), "head") ~= nil),
                                    }
                                    Count = Count + 1
                                end
                            end
                        end
                    end
                end
            end

            if Count == 0 and Character and typeof(Character) == "Instance" then
                for i = 1, #Names do
                    local Name = Names[i]
                    local Part = Character:FindFirstChild(Name, true)
                    if Part and Part:IsA("BasePart") then
                        Pose[Name] = {
                            CFrame = Part.CFrame,
                            Size = Visuals.ResolveHitChamSize(Name, Part),
                            IsHead = (Name == "Head"),
                        }
                        Count = Count + 1
                    end
                end
            end

            if Count == 0 and RootPart and typeof(RootPart) == "Instance" then
                local Ok, CF = pcall(function() return RootPart.CFrame end)
                if Ok and typeof(CF) == "CFrame" then
                    local S = Visuals.HitChamsDefaultSize
                    Pose["Torso"] = { CFrame = CF, Size = S.Torso, IsHead = false }
                    Pose["Head"] = { CFrame = CF * CFrame.new(0, 1.5, 0), Size = S.Head, IsHead = true }
                    Pose["Left Arm"] = { CFrame = CF * CFrame.new(-1.5, 0, 0), Size = S["Left Arm"], IsHead = false }
                    Pose["Right Arm"] = { CFrame = CF * CFrame.new(1.5, 0, 0), Size = S["Right Arm"], IsHead = false }
                    Pose["Left Leg"] = { CFrame = CF * CFrame.new(-0.5, -2, 0), Size = S["Left Leg"], IsHead = false }
                    Pose["Right Leg"] = { CFrame = CF * CFrame.new(0.5, -2, 0), Size = S["Right Leg"], IsHead = false }
                    Count = 6
                end
            end
            return Pose, Count
        end

        Visuals.CacheHitChamsPose = function(This, Force)
            if not This or not This.Player then return 0 end
            local Key = This.Player.Name
            if not Force then
                local Now = tick()
                local Last = Visuals.HitChamsLastCache[Key]
                if Last and (Now - Last) < 0.1 then return 0 end
                Visuals.HitChamsLastCache[Key] = Now
            end
            local Pose, Count = Visuals.BuildPoseFromParts(This.BodyParts, This.Character, This.RootPart)
            if Count > 0 then
                Visuals.HitChamsPoseCache[Key] = Pose
            end
            return Count
        end

        Visuals.MarkHitChams = function(Player)
            if not Player then return end
            local Key = type(Player) == "string" and Player or (typeof(Player) == "Instance" and Player.Name) or tostring(Player)
            Visuals.HitChamsMarked[Key] = tick()
            if Info and Info.Players then
                for i = 1, #Info.Players do
                    local This = Info.Players[i]
                    if This and This.Player and (This.Player == Player or This.Player.Name == Key) then
                        Visuals.CacheHitChamsPose(This, true)
                        break
                    end
                end
            end
        end

        Visuals.SpawnHitChamsFromPose = function(Pose, Dur, FillColor, OutlineColor, FillAlpha, OutlineAlpha)
            if type(Pose) ~= "table" then return end
            if not Visuals.HitChamsFolder or not Visuals.HitChamsFolder.Parent then
                local Folder = Instance.new("Folder")
                Folder.Name = "IriHitChams"
                Folder.Parent = workspace
                Visuals.HitChamsFolder = Folder
            end
            local OutlineOffset = Vector3.new(0.15, 0.15, 0.15)
            local InlineOffset = Vector3.new(-0.05, -0.05, -0.05)
            local Created = {}
            for Name, Data in next, Pose do
                if type(Data) ~= "table" or typeof(Data.CFrame) ~= "CFrame" then continue end
                local Value = Data.Size
                if typeof(Value) ~= "Vector3" or Value.Magnitude < 0.2 then
                    Value = Visuals.ResolveHitChamSize(tostring(Name), nil)
                end
                local WorldCF = Data.CFrame
                local IsHead = Data.IsHead == true or tostring(Name) == "Head"

                local Proxy = Instance.new("Part")
                Proxy.Name = "HitChamProxy"
                Proxy.Anchored = true
                Proxy.CanCollide = false
                Proxy.CanQuery = false
                Proxy.CanTouch = false
                Proxy.CastShadow = false
                Proxy.Transparency = 1
                Proxy.Size = Value
                Proxy.CFrame = WorldCF
                Proxy.Parent = Visuals.HitChamsFolder
                Created[#Created + 1] = Proxy

                for i = 1, 2 do
                    local IsOutline = (i == 1)
                    local Adorn
                    if IsHead then
                        Adorn = Instance.new("CylinderHandleAdornment")
                        Adorn.Height = math.max(0.6, Value.Y * 0.95)
                        Adorn.Radius = math.max(0.4, math.min(Value.X, Value.Z) * 0.5)
                        Adorn.CFrame = CFrame.Angles(0, 0, math.rad(90))
                    else
                        Adorn = Instance.new("BoxHandleAdornment")
                        local Extra = IsOutline and OutlineOffset or InlineOffset
                        Adorn.Size = Vector3.new(
                            math.max(0.4, Value.X + Extra.X),
                            math.max(0.4, Value.Y + Extra.Y),
                            math.max(0.4, Value.Z + Extra.Z)
                        )
                    end
                    Adorn.AlwaysOnTop = true
                    Adorn.ZIndex = IsOutline and 1 or 2
                    Adorn.AdornCullingMode = Enum.AdornCullingMode.Never
                    Adorn.Color3 = IsOutline and OutlineColor or FillColor
                    Adorn.Transparency = IsOutline and OutlineAlpha or FillAlpha
                    Adorn.Visible = true
                    Adorn.Adornee = Proxy
                    Adorn.Parent = Proxy
                    Created[#Created + 1] = Adorn
                end
            end
            if #Created == 0 then return end
            task.delay(Dur, function()
                for i = 1, #Created do
                    local Obj = Created[i]
                    pcall(function()
                        if Obj and Obj.Parent then Obj:Destroy() end
                    end)
                end
            end)
        end

        Visuals.ApplyHitChams = function(Player)
            local Flag = Flags and Flags["Hit Chams"]
            if not (Flag and Flag.Value) then return end
            if not Player then return end
            pcall(function()
                pcall(SetThreadIdentity, 7)
                local Key = type(Player) == "string" and Player or (typeof(Player) == "Instance" and Player.Name) or tostring(Player)
                Visuals.HitChamsMarked[Key] = tick()

                local ColorFlag = Flags["Hit Chams Color"]
                local OutlineFlag = Flags["Hit Chams Outline"]
                local FillColor = (ColorFlag and (ColorFlag.Color or ColorFlag.Value)) or Color3.fromRGB(255, 80, 80)
                local OutlineColor = (OutlineFlag and (OutlineFlag.Color or OutlineFlag.Value)) or Color3.new(0, 0, 0)
                local FillAlpha = (ColorFlag and type(ColorFlag.Transparency) == "number") and ColorFlag.Transparency or 0.35
                local OutlineAlpha = (OutlineFlag and type(OutlineFlag.Transparency) == "number") and OutlineFlag.Transparency or 0
                local Dur = Flags["Hit Chams Duration"] and Flags["Hit Chams Duration"].Value or 1
                if type(Dur) ~= "number" then Dur = 1 end

                local Pose = nil
                local ThisEntry = nil
                if Info then
                    if Info.FindByPlayer and typeof(Player) == "Instance" then
                        ThisEntry = Info.FindByPlayer(Player)
                    end
                    if not ThisEntry and Info.Players then
                        for i = 1, #Info.Players do
                            local This = Info.Players[i]
                            if This and This.Player and (This.Player == Player or This.Player.Name == Key or This.Name == Key) then
                                ThisEntry = This
                                break
                            end
                        end
                    end
                end

                if ThisEntry then
                    local LivePose, LiveCount = Visuals.BuildPoseFromParts(ThisEntry.BodyParts, ThisEntry.Character, ThisEntry.RootPart)
                    if LiveCount > 0 then
                        Pose = LivePose
                        Visuals.HitChamsPoseCache[Key] = LivePose
                    else
                        Visuals.CacheHitChamsPose(ThisEntry, true)
                        Pose = Visuals.HitChamsPoseCache[Key]
                    end
                end
                if type(Pose) ~= "table" then
                    Pose = Visuals.HitChamsPoseCache[Key]
                end
                if type(Pose) ~= "table" then return end

                Visuals.SpawnHitChamsFromPose(Pose, Dur, FillColor, OutlineColor, FillAlpha, OutlineAlpha)
            end)
        end

        Visuals.ShowHitmarker = LPH_JIT_MAX(function(IsHeadshot, DamageAmount, IsKill, WorldPos)
            if not Flags["Custom Hitmarker"].Value then return end
            Visuals.EnsureHitmarkerGui()

            local Style = Flags["Hitmarker Style"].Value
            if type(Style) ~= "string" then Style = "Cross" end
            local Size = Flags["Hitmarker Size"].Value
            if type(Size) ~= "number" then Size = 12 end
            local Thick = Flags["Hitmarker Thickness"].Value
            if type(Thick) ~= "number" then Thick = 2 end
            local Duration = Flags["Hitmarker Duration"].Value
            if type(Duration) ~= "number" then Duration = 0.25 end
            local Gap = 0
            if Flags["Hitmarker Gap"].Value then
                Gap = Flags["Hitmarker Gap Size"].Value
                if type(Gap) ~= "number" then Gap = 4 end
            end
            if IsKill and Flags["Hitmarker On Kill"].Value then
                local Scale = Flags["Hitmarker Kill Scale"].Value
                if type(Scale) == "number" then
                    Size = Size * Scale
                end
            end

            local ColorFlag = IsHeadshot and Flags["Hitmarker Head Color"] or Flags["Hitmarker Color"]
            local Color = (ColorFlag and (ColorFlag.Color or ColorFlag.Value)) or Color3.new(1, 1, 1)

            local Lines = Visuals.HitmarkerLines
            local Dot = Visuals.HitmarkerDot
            local Circle = Visuals.HitmarkerCircle
            local Stroke = Visuals.HitmarkerCircleStroke

            for i = 1, 4 do
                if Lines[i] then Lines[i].Visible = false end
            end
            if Dot then Dot.Visible = false end
            if Circle then Circle.Visible = false end

            if Style == "Cross" or Style == "X" then
                local Arm = Size
                local G = Gap
                local positions
                if Style == "Cross" then
                    positions = {
                        { UDim2.new(0.5, 0, 0.5, -(G + Arm / 2)), UDim2.new(0, Thick, 0, Arm), 0 },
                        { UDim2.new(0.5, 0, 0.5, (G + Arm / 2)), UDim2.new(0, Thick, 0, Arm), 0 },
                        { UDim2.new(0.5, -(G + Arm / 2), 0.5, 0), UDim2.new(0, Arm, 0, Thick), 0 },
                        { UDim2.new(0.5, (G + Arm / 2), 0.5, 0), UDim2.new(0, Arm, 0, Thick), 0 },
                    }
                else
                    positions = {
                        { UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, Arm * 2 + G, 0, Thick), 45 },
                        { UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, Arm * 2 + G, 0, Thick), -45 },
                        { UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 0, 0, 0), 0 },
                        { UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0, 0, 0, 0), 0 },
                    }
                end
                local UseOutline = Flags["Hitmarker Outline"].Value == true
                local OutlineColor = Color3.new(0, 0, 0)
                local OFlag = Flags["Hitmarker Outline Color"]
                if OFlag then OutlineColor = OFlag.Color or OFlag.Value or OutlineColor end
                for i = 1, 4 do
                    local L = Lines[i]
                    if not L then continue end
                    local P = positions[i]
                    L.Position = P[1]
                    L.Size = P[2]
                    L.Rotation = P[3]
                    L.BackgroundColor3 = Color
                    L.BackgroundTransparency = 0
                    L.Visible = P[2].X.Offset > 0 or P[2].Y.Offset > 0
                    local OL = Visuals.HitmarkerLineOutlines and Visuals.HitmarkerLineOutlines[i]
                    if OL then
                        OL.Enabled = UseOutline and L.Visible
                        OL.Color = OutlineColor
                        OL.Thickness = 1
                    end
                end
            elseif Style == "Dot" then
                if Dot then
                    Dot.Size = UDim2.new(0, Size, 0, Size)
                    Dot.BackgroundColor3 = Color
                    Dot.BackgroundTransparency = 0
                    Dot.Visible = true
                end
            elseif Style == "Circle" then
                if Circle and Stroke then
                    Circle.Size = UDim2.new(0, Size * 2, 0, Size * 2)
                    Stroke.Color = Color
                    Stroke.Thickness = Thick
                    Stroke.Transparency = 0
                    Circle.Visible = true
                end
            end

            if Visuals.HitmarkerDamageLabel then
                Visuals.HitmarkerDamageLabel.Visible = false
            end
            if WorldPos then
                pcall(function()
                    Visuals.ShowWorldDamage(WorldPos, DamageAmount, IsHeadshot)
                end)
            elseif DamageAmount then
                pcall(function()
                    local Origin = CurrentCamera and CurrentCamera.CFrame.Position
                    if Origin then
                        Visuals.ShowWorldDamage(Origin + CurrentCamera.CFrame.LookVector * 8, DamageAmount, IsHeadshot)
                    end
                end)
            end

            Visuals.LastHitmarkerToken = Visuals.LastHitmarkerToken + 1
            local Token = Visuals.LastHitmarkerToken
            local Fade = Flags["Hitmarker Fade"].Value

            task.spawn(function()
                local Start = Clock()
                while Token == Visuals.LastHitmarkerToken do
                    local Elapsed = Clock() - Start
                    if Elapsed >= Duration then break end
                    if Fade then
                        local Alpha = Elapsed / Duration
                        local T = Alpha
                        for i = 1, 4 do
                            if Lines[i] and Lines[i].Visible then
                                Lines[i].BackgroundTransparency = T
                            end
                        end
                        if Dot and Dot.Visible then Dot.BackgroundTransparency = T end
                        if Stroke and Circle and Circle.Visible then Stroke.Transparency = T end
                        if Visuals.HitmarkerDamageLabel and Visuals.HitmarkerDamageLabel.Visible then
                            Visuals.HitmarkerDamageLabel.TextTransparency = T
                        end
                    end
                    task.wait()
                end
                if Token == Visuals.LastHitmarkerToken then
                    for i = 1, 4 do
                        if Lines[i] then Lines[i].Visible = false end
                    end
                    if Dot then Dot.Visible = false end
                    if Circle then Circle.Visible = false end
                    if Visuals.HitmarkerDamageLabel then Visuals.HitmarkerDamageLabel.Visible = false end
                end
            end)
        end)

        Visuals.World = LPH_JIT_MAX(function()
            local Bloom = Visuals.Bloom

            if Flags["Ambience"].Value then
                local C1 = Flags["Ambience Color 1"]
                local C2 = Flags["Ambience Color 2"]
                Lighting.Ambient = (C1 and (C1.Color or C1.Value)) or Visuals.Cache.Ambient
                Lighting.OutdoorAmbient = (C2 and (C2.Color or C2.Value)) or Visuals.Cache.OutdoorAmbient
            else
                Lighting.Ambient = Visuals.Cache.Ambient
                Lighting.OutdoorAmbient = Visuals.Cache.OutdoorAmbient
            end

            if Flags["Exposure"].Value then
                local Amt = Flags["Exposure Amount"].Value
                if type(Amt) == "number" then
                    Lighting.ExposureCompensation = Amt
                end
            else
                Lighting.ExposureCompensation = Visuals.Cache.Exposure
            end

            if Flags["Colorshift"].Value then
                local C1 = Flags["Colorshift Color 1"]
                local C2 = Flags["Colorshift Color 2"]
                if C1 then Lighting.ColorShift_Top = C1.Color or C1.Value or Visuals.Cache.ColorShiftTop end
                if C2 then Lighting.ColorShift_Bottom = C2.Color or C2.Value or Visuals.Cache.ColorShiftBottom end
            else
                Lighting.ColorShift_Top = Visuals.Cache.ColorShiftTop
                Lighting.ColorShift_Bottom = Visuals.Cache.ColorShiftBottom
            end

            if Flags["Time"].Value then
                local T = Flags["Time Factor"].Value
                if type(T) == "number" then
                    Lighting.ClockTime = T
                end
            end

            if Bloom then
                if Flags["Bloom"].Value then
                    local Int = Flags["Bloom Intensity"].Value
                    local Sz = Flags["Bloom Size"].Value
                    local Th = Flags["Bloom Threshold"].Value
                    if type(Int) == "number" then Bloom.Intensity = Int * 0.01 end
                    if type(Sz) == "number" then Bloom.Size = Sz * 0.56 end
                    if type(Th) == "number" then Bloom.Threshold = Th * 0.0025 end
                    Bloom.Enabled = true
                else
                    Bloom.Enabled = false
                end
            end
        end)

        Visuals.Sky = LPH_JIT_MAX(function()
            local Sky = Visuals.Skybox

            if not Sky then
                Visuals.Skybox = FindFirstChildWhichIsA(Lighting, "Sky", true)

                Sky = Visuals.Skybox
            end

            if not Sky then
                local SkyBox = NewInstance("Sky", Lighting)

                Sky = SkyBox
                Visuals.Skybox = SkyBox
            end

            local BoxName = Flags["Custom Skybox"].Value
            local Box = (SkyBoxes and BoxName and SkyBoxes[BoxName]) or (SkyBoxes and SkyBoxes["Default"])
            if Box then
                for Index, Value in next, Box do
                    Sky[Index] = Value
                end
            end
        end)

        Visuals.LocalChams = LPH_JIT_MAX(function(ForceHide : Boolean)
            local Object = Visuals.Object.ThirdPersonObject

            if not Object then return end

            local Character = Object._characterModel

            if not Character then return end

            local Cache = Visuals.Characters[Character]

            if not Cache then return end

            local Enabled = false

            local Material = Flags["Local Chams Material"].Value
            local Animation = ""

            if not ForceHide then
                Enabled = Flags["Local Chams"].Value
            end

            if Material == "ForceField" then
                local Choice = Flags["Local Chams Animation"].Value

                if Choice == "Disabled" then
                    Animation = "rbxassetid://0"
                else
                    Animation = ChamsAnimations[Choice]
                end
            end

            local ColorFlag = Flags["Local Chams Color"]
            local Color = (ColorFlag and (ColorFlag.Color or ColorFlag.Value)) or Color3.new(1, 1, 1)
            local Transparency = (ColorFlag and type(ColorFlag.Transparency) == "number" and ColorFlag.Transparency) or 0
            local Reflectance = Flags["Local Chams Reflectance"].Value
            if type(Reflectance) ~= "number" then Reflectance = 0 end
            if type(Material) ~= "string" then Material = "ForceField" end
            if type(Animation) ~= "string" then Animation = "" end

            local VertexColor = NewVector3(Color.R, Color.G, Color.B)

            local Descendants = GetDescendants(Character)

            local Weapon = FindFirstChildWhichIsA(Character, "Model")

            for i = 1, #Descendants do
                local Descendant = Descendants[i]

                if Weapon and IsDescendantOf(Descendant, Weapon) then continue end

                local IsBasePart = IsA(Descendant, "BasePart")
                local IsTexture = IsA(Descendant, "Texture")
                local IsSpecialMesh = IsA(Descendant, "SpecialMesh")
                local IsMeshPart = IsA(Descendant, "MeshPart")
                local IsDecal = IsA(Descendant, "Decal")
                local IsUnionOperator = IsA(Descendant, "UnionOperation")

                if
                    not IsBasePart and
                    not IsSpecialMesh and
                    not IsTexture and
                    not IsMeshPart and
                    not IsDecal and
                    not IsUnionOperator
                then
                    continue
                end

                local Cached = Cache[Descendant]

                if not Cached then continue end

                if IsBasePart then
                    if Enabled then
                        local Mat = Enum.Material[Material] or Enum.Material.ForceField
                        Descendant.Material = Mat
                        Descendant.Color = Color
                        Descendant.Transparency = Transparency
                        Descendant.Reflectance = Reflectance
                    else
                        Descendant.Material = Cached.Material
                        Descendant.Color = Cached.Color
                        Descendant.Transparency = Cached.Transparency
                        Descendant.Reflectance = Cached.Reflectance
                    end
                end

                if IsUnionOperator then
                    if Enabled then
                        Descendant.UsePartColor = true
                    else
                        Descendant.UsePartColor = Cached.UsePartColor
                    end
                elseif IsMeshPart then
                    if Enabled then
                        Descendant.TextureID = Animation
                    else
                        Descendant.TextureID = Cached.TextureID
                    end
                elseif IsTexture then
                    if Enabled then
                        Descendant.Transparency = 1
                    else
                        Descendant.Transparency = Cached.Transparency
                    end
                elseif IsSpecialMesh then
                    if Enabled then
                        Descendant.TextureId = Animation
                        Descendant.VertexColor = VertexColor
                    else
                        Descendant.TextureId = Cached.TextureId
                        Descendant.VertexColor = Cached.VertexColor
                    end
                elseif IsDecal then
                    if Enabled then
                        Descendant.Transparency = 1
                    else
                        Descendant.Transparency = Cached.Transparency
                    end
                end
            end
        end)

        Visuals.ViewModelChams = LPH_JIT_MAX(function()
            for ViewModel, Cache in next, Visuals.ViewModels do
                local IsArm = FindFirstChild(ViewModel, "Sleeves")

                local Descendants = GetDescendants(ViewModel)

                for i = 1, #Descendants do
                    local Descendant = Descendants[i]

                    local IsBasePart = IsA(Descendant, "BasePart")
                    local IsTexture = IsA(Descendant, "Texture")
                    local IsSpecialMesh = IsA(Descendant, "SpecialMesh")
                    local IsMeshPart = IsA(Descendant, "MeshPart")
                    local IsDecal = IsA(Descendant, "Decal")
                    local IsUnionOperator = IsA(Descendant, "UnionOperation")

                    if
                        not IsBasePart and
                        not IsSpecialMesh and
                        not IsTexture and
                        not IsMeshPart and
                        not IsDecal and
                        not IsUnionOperator
                    then
                        continue
                    end

                    local Cached = Cache[Descendant]

                    if not Cached then continue end

                    local Enabled
                    local Material

                    local ColorFlag
                    local Reflectance

                    local Animation = ""

                    if IsArm then
                        if Descendant == IsArm or IsDescendantOf(Descendant, IsArm) then
                            Enabled = Flags["Sleeve Chams"].Value
                            Material = Flags["Sleeve Chams Material"].Value

                            ColorFlag = Flags["Sleeve Chams Color"]
                            Reflectance = Flags["Sleeve Chams Reflectance"].Value

                            if Material == "ForceField" then
                                Animation = ChamsAnimations[Flags["Sleeve Chams Animation"].Value]
                            end
                        elseif Descendant.Name == "SkinTone" then
                            Enabled = Flags["Skin Tone Chams"].Value
                            Material = Flags["Skin Tone Chams Material"].Value

                            ColorFlag = Flags["Skin Tone Chams Color"]
                            Reflectance = Flags["Skin Tone Chams Reflectance"].Value

                            if Material == "ForceField" then
                                Animation = ChamsAnimations[Flags["Skin Tone Chams Animation"].Value]
                            end
                        else
                            Enabled = Flags["Glove Chams"].Value
                            Material = Flags["Glove Chams Material"].Value

                            ColorFlag = Flags["Glove Chams Color"]
                            Reflectance = Flags["Glove Chams Reflectance"].Value

                            if Material == "ForceField" then
                                Animation = ChamsAnimations[Flags["Glove Chams Animation"].Value]
                            end
                        end
                    else
                        Enabled = Flags["ViewModel Chams"].Value
                        Material = Flags["ViewModel Chams Material"].Value

                        ColorFlag = Flags["ViewModel Chams Color"]
                        Reflectance = Flags["ViewModel Chams Reflectance"].Value

                        if Material == "ForceField" then
                            Animation = ChamsAnimations[Flags["ViewModel Chams Animation"].Value]
                        end
                    end

                    local Color = (ColorFlag and (ColorFlag.Color or ColorFlag.Value) or Color3.new(1,1,1))
                    local Transparency = (ColorFlag and type(ColorFlag.Transparency) == "number" and ColorFlag.Transparency or 0)

                    local VertexColor = NewVector3(Color.R, Color.G, Color.B)

                    if IsBasePart then
                        if Enabled then
                            Descendant.Material = (Enum.Material[Material] or Enum.Material.ForceField)
                            Descendant.Color = Color
                            Descendant.Transparency = Cached.Transparency == 1 and 1 or Transparency
                            Descendant.Reflectance = Reflectance
                        else
                            Descendant.Material = Cached.Material
                            Descendant.Color = Cached.Color
                            Descendant.Transparency = Cached.Transparency
                            Descendant.Reflectance = Cached.Reflectance
                        end
                    end

                    if IsUnionOperator then
                        if Enabled then
                            Descendant.UsePartColor = true
                        else
                            Descendant.UsePartColor = Cached.UsePartColor
                        end
                    elseif IsMeshPart then
                        if Enabled then
                            Descendant.TextureID = Animation
                        else
                            Descendant.TextureID = Cached.TextureID
                        end
                    elseif IsTexture then
                        if Enabled then
                            Descendant.Transparency = 1
                        else
                            Descendant.Transparency = Cached.Transparency
                        end
                    elseif IsSpecialMesh then
                        if Enabled then
                            Descendant.TextureId = Animation
                            Descendant.VertexColor = VertexColor
                        else
                            Descendant.TextureId = Cached.TextureId
                            Descendant.VertexColor = Cached.VertexColor
                        end
                    elseif IsDecal then
                        if Enabled then
                            Descendant.Transparency = 1
                        else
                            Descendant.Transparency = Cached.Transparency
                        end
                    end
                end
            end
        end)

        Visuals.Heartbeat = LPH_JIT_MAX(function()
            local LocalInfo = Info.LocalPlayer
            local InThirdPerson = Visuals.InThirdPerson

            local Dropped = Visuals.Dropped

            if (Clock() - Visuals.LastRefresh) >= (1 / Flags["Dropped Weapon Refresh Rate"].Value) then
                Visuals.LastRefresh = Clock()

                for i = #Dropped, 1, -1 do
                    local Drop = Dropped[i]

                    local Model = Drop[1]

                    if not Model or not Model.Parent then
                        Remove(Visuals.Dropped, i)

                        continue
                    end

                    local Renders = Drop[5]

                    local RenderFrame = Renders.RenderFrame

                    local BarOutline = Renders.BarOutline
                    local BarInline = Renders.BarInline

                    local Bar = Renders.BarFill
                    local Label = Renders.Text

                    if Flags["Dropped Weapon ESP"].Value then
                        local Origin = Drop[3]

                        local Distance = Ceil((CurrentCamera.CFrame.Position - Origin).Magnitude)

                        if Distance <= Flags["Dropped Weapon Max Distance"].Value then
                            local Position, OnScreen = CurrentCamera:WorldToScreenPoint(Origin + NewVector3(0, 0.5, 0))

                            if OnScreen then
                                local Text = Drop[4]
                                local Time = Drop[6]
                                local SizeX = Drop[7]

                                RenderFrame.Parent = Esp.Overlay

                                BarOutline.Parent = RenderFrame
                                BarInline.Parent = BarOutline

                                Bar.Parent = BarInline
                                Label.Parent = RenderFrame

                                if Flags["Dropped Weapon Distance"].Value then
                                    Text ..= Menu.ToRichText(Format(' <font color="rgb(#s)">[%sm]</font>', Distance), Flags["Dropped Weapon Distance Color"].Color)
                                end

                                if Label.Text ~= Text or not SizeX then
                                    SizeX = Menu.GetTextBounds(Text, Fonts["Smallest Pixel-7"]).X + 10

                                    RenderFrame.Size = NewUDim2(0, SizeX, 0, 50)

                                    Label.Text = Text

                                    Drop[7] = SizeX
                                end

                                Bar.Size = NewUDim2(Time and ((Time - Tickbase.GetTick()) / 30) or 1, 1, 1, 0)

                                Bar.BackgroundColor3 = Flags["Dropped Weapon Bar Color"].Color
                                Label.TextColor3 = Flags["Dropped Weapon Color"].Color

                                RenderFrame.Position = NewUDim2(0, Position.X - SizeX / 2, 0, Position.Y)

                                RenderFrame.Visible = true

                                continue
                            end
                        end
                    end

                    RenderFrame.Visible = false
                    RenderFrame.Parent = nil

                    BarOutline.Parent = nil
                    BarInline.Parent = nil

                    Bar.Parent = nil
                    Label.Parent = nil
                end
            end

            for ViewModel in next, Visuals.ViewModels do
                if not ViewModel or not ViewModel.Parent then
                    Visuals.ViewModels[ViewModel] = nil

                    continue
                end

                ViewModel.Parent = InThirdPerson and ReplicatedStorage or CurrentCamera
            end

            local FakeOutline = Visuals.FakeOutline
            local FakeBackground = Visuals.FakeBackground

            local FakeText = Visuals.FakeText

            if Flags["Visualise Fake Position"].Value and LocalInfo.Faked then
                local To = Camera.WorldToViewportPoint(LocalInfo.RootPosition, true, 27)

                FakeOutline.Position = NewUDim2(0, To.X, 0, To.Y)

                FakeBackground.Size = NewUDim2(Clamp(1 - ((AntiAim.NextTick - Tick()) / AntiAim.Addition), 0, 1), 0, 1, 0)
                FakeBackground.BackgroundColor3 = Flags["Visualise Fake Position Bar Color"].Color

                FakeText.TextColor3 = Flags["Visualise Fake Position Text Color"].Color

                FakeOutline.Visible = true
            else
                FakeOutline.Visible = false
            end

            local BarOutline = Visuals.FireOutline
            local BarInline = Visuals.FireInline

            if Flags["FireRate Bar"].Value then
                local Weapon = LocalInfo.Weapon

                if LocalInfo.WeaponType == "Firearm" and LocalInfo.Alive then
                    local CurrentTime = Tickbase.GetTick()
                    local NextShot = Weapon._nextShot

                    if NextShot == 0 then
                        NextShot = 1
                    end

                    if CurrentTime > NextShot then
                        CurrentTime = NextShot
                    end

                    local OffX = (Flags["FireRate Bar X"] and Flags["FireRate Bar X"].Value) or 0
                    local OffY = (Flags["FireRate Bar Y"] and Flags["FireRate Bar Y"].Value) or 0
                    if type(OffX) ~= "number" then OffX = 0 end
                    if type(OffY) ~= "number" then OffY = 0 end
                    BarOutline.Position = NewUDim2(0.5, OffX, 0.5, 8 + OffY)

                    BarInline.Size = NewUDim2(1 - Clamp(NextShot - Tickbase.GetTick(), 0, 1), -2, 1, -2)
                    BarInline.BackgroundColor3 = Flags["FireRate Bar Color"].Color

                    if BarInline.AbsoluteSize.X <= 0 then
                        BarInline.Size = NewUDim2(0, 1, 1, -2)
                    end

                    BarOutline.Visible = true
                    BarInline.Visible = true
                else
                    BarOutline.Visible = false
                    BarInline.Visible = false
                end
            else
                BarOutline.Visible = false
                BarInline.Visible = false
            end

            do
                local Panel = Visuals.WeaponInfoPanel or Visuals.WeaponInfoOuter
                local Line = Visuals.WeaponInfoLine
                local Enabled = Flags["Weapon Info"] and Flags["Weapon Info"].Value

                if not Enabled or not LocalInfo.Alive or not LocalInfo.Weapon or LocalInfo.WeaponType ~= "Firearm" or Visuals.InThirdPerson then
                    if Panel then Panel.Visible = false end
                    if Line then
                        pcall(function()
                            if Line.Visible ~= nil then Line.Visible = false end
                        end)
                    end
                else
                    local Weapon = LocalInfo.Weapon
                    local Barrel = Weapon._barrelPart
                    local Cam = CurrentCamera
                    if Barrel and Cam and not Barrel:IsDescendantOf(Cam) then
                        Barrel = nil
                    end
                    if not Barrel then
                        if Panel then Panel.Visible = false end
                        if Line then pcall(function() Line.Visible = false end) end
                    else
                    local OffX = (Flags["Weapon Info X"] and Flags["Weapon Info X"].Value) or 24
                    local OffY = (Flags["Weapon Info Y"] and Flags["Weapon Info Y"].Value) or 18
                    if type(OffX) ~= "number" then OffX = 24 end
                    if type(OffY) ~= "number" then OffY = 18 end

                    local ScreenPos, OnScreen = nil, false
                    if Barrel and Cam then
                        local Ok, SP, OS = pcall(function()
                            local v, o = Cam:WorldToViewportPoint(Barrel.Position)
                            return v, o
                        end)
                        if Ok then
                            ScreenPos, OnScreen = SP, OS
                        end
                    end

                    if ScreenPos and OnScreen and ScreenPos.Z > 0 then
                        local PX = math.floor(ScreenPos.X + OffX)
                        local PY = math.floor(ScreenPos.Y + OffY)
                        Panel.Position = UDim2.fromOffset(PX, PY)
                        Panel.Visible = true

                        local Inner = Visuals.WeaponInfoInner
                        if Inner then
                            Inner.BackgroundColor3 = Library.MainColor
                            Inner.BorderColor3 = Library.OutlineColor
                        end
                        local FC = Library.FontColor or Color3.new(1, 1, 1)
                        local AC = Library.AccentColor or Color3.fromRGB(144, 130, 255)

                        local WName = Weapon.weaponName or "Unknown"
                        pcall(function()
                            if type(WName) ~= "string" or WName == "" then
                                WName = Weapon:getWeaponStat("name") or "Unknown"
                            end
                        end)
                        local Mag = Weapon._magCount
                        local Spare = Weapon._spareCount
                        if type(Mag) ~= "number" then Mag = 0 end
                        if type(Spare) ~= "number" then Spare = 0 end
                        local RPM = 0
                        pcall(function()
                            local FR = Weapon:getWeaponStat("firerate")
                            if type(FR) == "number" then
                                RPM = math.floor(FR + 0.5)
                            end
                        end)

                        if Visuals.WeaponInfoName then
                            Visuals.WeaponInfoName.Text = string.upper(tostring(WName))
                            Visuals.WeaponInfoName.TextColor3 = FC
                        end
                        if Visuals.WeaponInfoAmmo then
                            Visuals.WeaponInfoAmmo.Text = string.format("Ammo: %d / %d", Mag, Spare)
                            Visuals.WeaponInfoAmmo.TextColor3 = FC
                        end
                        if Visuals.WeaponInfoRate then
                            Visuals.WeaponInfoRate.Text = string.format("Firerate: %d RPM", RPM)
                            Visuals.WeaponInfoRate.TextColor3 = FC
                        end
                        if Visuals.WeaponInfoTitle then
                            Visuals.WeaponInfoTitle.TextColor3 = FC
                        end

                        if Line then
                            local ToX = PX
                            local ToY = PY + 39
                            local FromX = ScreenPos.X
                            local FromY = ScreenPos.Y
                            if Line.From ~= nil then
                                Line.From = Vector2.new(FromX, FromY)
                                Line.To = Vector2.new(ToX, ToY)
                                Line.Color = AC
                                Line.Thickness = 1
                                Line.Visible = true
                            else
                                local DX = ToX - FromX
                                local DY = ToY - FromY
                                local Len = math.sqrt(DX * DX + DY * DY)
                                local Ang = math.atan2(DY, DX)
                                Line.Position = UDim2.fromOffset(FromX, FromY)
                                Line.Size = UDim2.fromOffset(math.max(1, math.floor(Len)), 1)
                                Line.Rotation = math.deg(Ang)
                                Line.BackgroundColor3 = AC
                                Line.Visible = true
                            end
                        end
                    else
                        Panel.Visible = false
                        if Line then
                            pcall(function() Line.Visible = false end)
                        end
                    end
                    end
                end
            end

            if Flags["Penetration Crosshair"].Value then
                local Crosshair = Visuals.Crosshair

                if LocalInfo.WeaponType == "Firearm" and LocalInfo.Alive then
                    local CameraCFrame = CurrentCamera.CFrame

                    local Result = Raycast(Workspace, CameraCFrame.Position, CameraCFrame.LookVector * 1000, Visuals.Param)

                    if Result and Result.Instance.CanCollide then
                        local Origin = LocalInfo.RootPosition
                        local HitPosition = Result.Position

                        local Penetrated = Shared.BulletCheck(Origin, HitPosition, Mathematics.GetTrajectory(Origin, HitPosition, NegativeAcceleration, LocalInfo.BulletSpeed), Acceleration, LocalInfo.Penetration)

                        SetThreadIdentity(7)

                        if Penetrated then
                            Crosshair.BackgroundColor3 = Flags["Penetration Crosshair Color 2"].Color

                            return
                        end
                    end
                end

                Crosshair.BackgroundColor3 = Flags["Penetration Crosshair Color 1"].Color
            end
        end)
    end

    do
        Visuals.CacheCharacter = LPH_JIT_MAX(function(Character : Instance)
            if not Character then return end

            local Cache = {}

            local Descendants = GetDescendants(Character)

            for i = 1, #Descendants do
                local Descendant = Descendants[i]

                local IsBasePart = IsA(Descendant, "BasePart")
                local IsTexture = IsA(Descendant, "Texture")
                local IsSpecialMesh = IsA(Descendant, "SpecialMesh")
                local IsMeshPart = IsA(Descendant, "MeshPart")
                local IsDecal = IsA(Descendant, "Decal")
                local IsUnionOperator = IsA(Descendant, "UnionOperation")

                if
                    not IsBasePart and
                    not IsMeshPart and
                    not IsSpecialMesh and
                    not IsTexture and
                    not IsDecal and
                    not IsUnionOperator
                then
                    continue
                end

                if not IsSpecialMesh and Descendant.Transparency == 1 then continue end

                if IsBasePart then
                    Cache[Descendant] = {
                        Material = Descendant.Material,
                        Color = Descendant.Color,
                        Transparency = Descendant.Transparency,
                        Reflectance = Descendant.Reflectance
                    }
                end

                if IsUnionOperator then
                    Cache[Descendant]["UsePartColor"] = Descendant.UsePartColor
                elseif IsMeshPart then
                    Cache[Descendant]["TextureID"] = Descendant.TextureID
                elseif IsTexture then
                    Cache[Descendant] = {
                        Transparency = Descendant.Transparency
                    }
                elseif IsSpecialMesh then
                    Cache[Descendant] = {
                        TextureId = Descendant.TextureId,
                        VertexColor = Descendant.VertexColor
                    }
                elseif IsDecal then
                    Cache[Descendant] = {
                        Transparency = Descendant.Transparency
                    }
                end
            end

            Visuals.Characters[Character] = Cache
        end)

        Visuals.CacheModel = LPH_JIT_MAX(function(Model : Instance)
            if not Model then return end

            local Cache = {}

            local Descendants = GetDescendants(Model)

            for k = 1, #Descendants do
                local Descendant = Descendants[k]

                local IsBasePart = IsA(Descendant, "BasePart")
                local IsTexture = IsA(Descendant, "Texture")
                local IsSpecialMesh = IsA(Descendant, "SpecialMesh")
                local IsMeshPart = IsA(Descendant, "MeshPart")
                local IsDecal = IsA(Descendant, "Decal")
                local IsUnionOperator = IsA(Descendant, "UnionOperation")

                if
                    not IsBasePart and
                    not IsSpecialMesh and
                    not IsTexture and
                    not IsMeshPart and
                    not IsDecal and
                    not IsUnionOperator
                then
                    continue
                end

                if IsBasePart then
                    Cache[Descendant] = {
                        Material = Descendant.Material,
                        Color = Descendant.Color,
                        Transparency = Descendant.Transparency,
                        Reflectance = Descendant.Reflectance
                    }
                end

                if IsUnionOperator then
                    Cache[Descendant]["UsePartColor"] = Descendant.UsePartColor
                elseif IsMeshPart then
                    Cache[Descendant]["TextureID"] = Descendant.TextureID
                elseif IsTexture then
                    Cache[Descendant] = {
                        Transparency = Descendant.Transparency
                    }
                elseif IsSpecialMesh then
                    Cache[Descendant] = {
                        TextureId = Descendant.TextureId,
                        VertexColor = Descendant.VertexColor
                    }
                elseif IsDecal then
                    Cache[Descendant] = {
                        Transparency = Descendant.Transparency
                    }
                end
            end

            Visuals.ViewModels[Model] = Cache
        end)
    end

    do
        Visuals.CreateBeam = LPH_JIT_MAX(function(Origin : Vector3, Position : CFrame, Type : String)
            local Attachment1 = NewInstance("Attachment", Terrain)
            local Attachment2 = NewInstance("Attachment", Terrain)

            local CacheKey = tostring(Type) .. "Beam"
            local Template = Visuals.Cache[CacheKey]
            if not Template then
                Template = Visuals.Cache.LocalBeam or Visuals.Cache.EnemyBeam
            end
            if not Template then
                Destroy(Attachment1)
                Destroy(Attachment2)
                return
            end

            local Beam = Clone(Template)

            local TextureName = "Obelus"
            local TextureFlag = Flags["Tracer Texture"]
            if TextureFlag then
                local V = TextureFlag.Value
                if type(V) == "string" and V ~= "" then
                    TextureName = V
                elseif type(V) == "table" then
                    for Name, On in next, V do
                        if On then TextureName = Name break end
                    end
                end
            end
            local Props = TracerProperties and TracerProperties[TextureName]
            if type(Props) == "table" then
                for Index, Value in next, Props do
                    pcall(function()
                        Beam[Index] = Value
                    end)
                end
            end

            local ColorFlagName = "Local Tracer Color"
            if Type == "Enemy" then
                ColorFlagName = "Enemy Tracer Color"
            elseif Type == "Team" then
                ColorFlagName = "Team Tracer Color"
            elseif Type == "Grenade" then
                ColorFlagName = "Grenade Tracer Color"
            end
            local ColorFlag = Flags[ColorFlagName]
            local Col = nil
            if ColorFlag then
                if typeof(ColorFlag.Color) == "Color3" then
                    Col = ColorFlag.Color
                elseif typeof(ColorFlag.Value) == "Color3" then
                    Col = ColorFlag.Value
                end
            end
            if typeof(Col) == "Color3" then
                pcall(function()
                    Beam.Color = NewColorSequence(Col)
                end)
            end

            Attachment1.WorldCFrame = NewCFrame(Origin)
            Attachment2.WorldCFrame = Position

            Beam.Attachment0 = Attachment1
            Beam.Attachment1 = Attachment2
            Beam.Enabled = true
            Beam.Parent = Terrain

            local Life = 1
            if Flags["Tracer Time"] and type(Flags["Tracer Time"].Value) == "number" then
                Life = Flags["Tracer Time"].Value
            end
            if Life < 0.05 then Life = 0.05 end

            Delay(Life, function()
                pcall(function()
                    for i = 0, 1, 0.05 do
                        if not Beam or not Beam.Parent then break end
                        Beam.Transparency = NewNumberSequence(i)
                        Wait()
                    end
                end)
                pcall(Destroy, Attachment1)
                pcall(Destroy, Attachment2)
                pcall(Destroy, Beam)
            end)
        end)

        Visuals.CreateImpact = LPH_JIT_MAX(function(Position : CFrame)
            local Impact = Clone(Visuals.Cache.Impact)

            Impact.Parent = Terrain
            Impact.CFrame = Position
            Impact.Transparency = 0

            Delay(Flags["Tracer Time"].Value, function()
                for i = 0, 1, 0.03 do
                    Impact.Transparency = i

                    Wait()
                end

                Destroy(Impact)
            end)
        end)

        Visuals.CreateObject = LPH_JIT_MAX(function()
            local This = {}

            local Object = Shared.ReplicationObject.new({
                Name = "永远不会将其作为用户名 XD",
                TeamColor = LocalPlayer.TeamColor,

                GetPropertyChangedSignal = function(_, ...)
                    return LocalPlayer:GetPropertyChangedSignal(...)
                end
            })

            Object._player = LocalPlayer

            do
                This.Spawn = LPH_JIT_MAX(function(Position : Vector3)
                    Object:spawn(Position or EmptyVector3, Shared.ActiveLoadoutUtils.getActiveLoadoutData(Shared.PlayerDataClientInterface.getPlayerData()))

                    local ThirdPersonObject = Object._thirdPersonObject

                    local Stance = Info.LocalPlayer.Stance

                    ThirdPersonObject._stanceSpring.t = (Stance == "stand" and 0 or Stance == "crouch" and 0.5 or 1)

                    This.ThirdPersonObject = ThirdPersonObject

                    ThirdPersonObject:setCharacterRender(true)

                    Visuals.CacheCharacter(ThirdPersonObject._characterModel)

                    Visuals.LocalChams()
                    Visuals.ViewModelChams()
                end)

                This.Despawn = LPH_JIT_MAX(function()
                    local ThirdPersonObject = Object:despawn()

                    if ThirdPersonObject then
                        ThirdPersonObject:popCharacterModel():Destroy()
                        ThirdPersonObject:Destroy()
                    end

                    This.ThirdPersonObject = nil
                end)

                This.Step = LPH_JIT_MAX(function()
                    local LocalInfo = Info.LocalPlayer
                    local RootPosition = LocalInfo.FakePosition

                    local ThirdPersonObject = This.ThirdPersonObject

                    if not RootPosition or not Object or not ThirdPersonObject then return end

                    local InThirdPerson = Visuals.InThirdPerson
                    local PosSpring = Object._posspring

                    if InThirdPerson then
                        local ViewAngles = LocalInfo.ViewAngles
                        local LookSpring = Object._lookangles

                        PosSpring.t = RootPosition
                        PosSpring.p = RootPosition

                        LookSpring.t = ViewAngles
                        LookSpring.p = ViewAngles

                        local Time = Tick()

                        Object._smoothReplication:receive(Clock(), Time, {
                            t = Time,
                            position = RootPosition,
                            velocity = EmptyVector3,
                            angles = ViewAngles,
                            barrelAngles = LocalInfo.BarrelAngles,
                            breakcount = 0
                        }, true)

                        ThirdPersonObject.canRenderWeapon = Flags["Third Person Weapon"].Value
                    else
                        PosSpring.t = NewVector3(0, -10000, 0)
                        PosSpring.p = NewVector3(0, -10000, 0)
                    end

                    Object:step(InThirdPerson)
                end)
            end

            This.Replicated = Object

            return This
        end)

        Visuals.CreateWeapon = LPH_JIT_MAX(function()
            local This = {}

            This.RenderFrame = Esp.Render("Frame", { Size = NewUDim2(0, 0, 0, 50), BackgroundTransparency = 1, Visible = false })

            This.BarOutline = Esp.Render("Frame", { Position = NewUDim2(0, 1, 1, -3), Size = NewUDim2(1, 0, 0, 4), BackgroundColor3 = NewRGB(0, 0, 0), BorderSizePixel = 0 })
            This.BarInline = Esp.Render("Frame", { Position = NewUDim2(0, 1, 0, 1), Size = NewUDim2(1, -2, 1, -2), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true })

            This.BarFill = Esp.Render("Frame", { Position = EmptyUDim2, Size = NewUDim2(1, 1, 1, 0), BorderSizePixel = 0 })

            This.Text = Esp.Render("TextLabel", { BackgroundTransparency = 1, BorderSizePixel = 0, Text = "", TextStrokeTransparency = 0, AnchorPoint = NewVector2(0.5, 0), Position = NewUDim2(0.5, 0, 1, -9), RichText = true })

            return This
        end)

        Visuals.CheckResult = function(Result : Instance)
            if not Result.CanCollide then
                return true
            elseif Result.Transparency == 1 then
                return true
            elseif Result.Name == "Window" then
                return true
            end

            return
        end
    end

    Visuals.Init = function()
        do
            local Skybox = Visuals.Skybox

            local Children = GetChildren(CurrentCamera)

            for i = 1, #Children do
                local Child = Children[i]

                if IsA(Child, "Model") then
                    Visuals.CacheModel(Child)
                    Visuals.ViewModelChams()
                end
            end

            if Skybox then
                if SkyBoxes and SkyBoxes["Default"] then
                    for Index in next, SkyBoxes["Default"] do
                        SkyBoxes["Default"][Index] = Skybox[Index]
                    end
                end
            end

            Visuals.World()
            Visuals.Sky()
        end

        do
            Stepped:Connect(Visuals.Object.Step)
            Heartbeat:Connect(Visuals.Heartbeat)

            Lighting.LightingChanged:Connect(Visuals.World)
            Lighting.ChildRemoved:Connect(Visuals.Sky)

            local LastWorldApply = 0
            Heartbeat:Connect(function()
                local Now = Clock()
                if Now - LastWorldApply < 0.15 then return end
                LastWorldApply = Now
                if Flags["Ambience"].Value or Flags["Exposure"].Value or Flags["Colorshift"].Value or Flags["Bloom"].Value or Flags["Time"].Value then
                    pcall(Visuals.World)
                end
            end)

            CurrentCamera.ChildAdded:Connect(function(Child)
                if IsA(Child, "Model") then
                    Visuals.CacheModel(Child)
                    Visuals.ViewModelChams()
                end
            end)

            WaitForChild(MapIgnore, "Misc", Infinite).ChildAdded:Connect(function(Child)
                if Flags["Grenade Tracer Enabled"].Value then
                    if Child.Name == "Trigger" and FindFirstChild(Child, "Ticking") then
                        local Trail = Clone(Visuals.Cache.GrenadeBeam)

                        Trail.Parent = Terrain

                        Trail.Attachment0 = Child.A1
                        Trail.Attachment1 = Child.A2
                    end
                end
            end)
        end

        do
            local NewIndex; NewIndex = HookMetaMethod(CurrentCamera, "__newindex", LPH_NO_VIRTUALIZE(function(Self, Property, Value)
                if
                    not CheckCaller() and
                    Self == CurrentCamera and
                    Property == "CFrame" and
                    Info.LocalPlayer.Alive
                then
                    local CanThirdPerson = false

                    if Flags["Third Person Enabled"].Value then
                        if Flags["Third Person Clip"].Value then
                            local Distance = Flags["Third Person Maximum"].Value

                            local Result = Raycast(Workspace, Value.Position, -Value.LookVector * Distance, Visuals.Param)

                            if not Result or not Result.Instance.CanCollide or Result.Instance.Transparency == 1 then
                                Value *= NewCFrame(0, 0, Distance)

                                CanThirdPerson = true
                            else
                                local Magnitude = Result and (Result.Position - Value.Position).Magnitude or 0

                                CanThirdPerson = Magnitude >= Flags["Third Person Minimum"].Value

                                if CanThirdPerson then
                                    Value *= NewCFrame(0, 0, Magnitude)
                                end
                            end
                        else
                            Value *= NewCFrame(0, 0, Flags["Third Person Maximum"].Value)

                            CanThirdPerson = true
                        end
                    end

                    Visuals.InThirdPerson = CanThirdPerson
                end

                return NewIndex(Self, Property, Value)
            end))

            local NewBullets; NewBullets = HookFunction(Events.newbullets, LPH_NO_UPVALUES(function(Data, ...)
                NewBullets(Data, ...)

                local Player = Data.player
                local Origin = Data.firepos
                local Bullets = Data.bullets

                if Player ~= LocalPlayer then
                    local This = Info.FindByPlayer(Player)

                    if This then
                        local EnemyTracers = Flags["Enemy Tracer Enabled"].Value
                        local TeamTracers = Flags["Team Tracer Enabled"].Value

                        local IsTeam = This.Teammate

                        local RootPosition = This.RootPosition
                        local LastTrajectory = EmptyVector3

                        local PelletCount = #Bullets

                        local ShouldCheck = PelletCount > 1
                        local EqualCount = 0

                        for i = 1, PelletCount do
                            local Trajectory = Bullets[i].velocity

                            if ShouldCheck and Trajectory == LastTrajectory then
                                LastTrajectory = Trajectory

                                EqualCount += 1
                            end

                            if (IsTeam and TeamTracers) or (not IsTeam and EnemyTracers) then
                                local Direction = Trajectory * 1000

                                local Result = Raycasting.Raycast(Origin, Direction, { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Visuals.CheckResult)

                                Visuals.CreateBeam(Origin, Result and NewCFrame(Result.Position, Result.Position + Result.Normal) or NewCFrame(Origin + Direction), IsTeam and "Team" or "Enemy")
                            end
                        end

                        if RootPosition then
                            local Frames = This.Frames
                            local FramesCount = #Frames

                            local Distance = ((Origin - RootPosition).Magnitude - (FramesCount > 1 and (Frames[FramesCount - 1][1] - RootPosition).Magnitude or 0))

                            if Distance > 5 then
                                local PrevLevel = This.ExploitLevel or 0
                                This.ExploitLevel = Clamp(This.ExploitLevel + 1, 0, 3)

                                This.ExtendedOrigin = Distance

                                This.ExploitTick = Tick()
                                if This.ExploitLevel > PrevLevel and Library and Library.PushEventLog then
                                    local PName = (This.Player and This.Player.Name) or "Unknown"
                                    pcall(function()
                                        Library:PushEventLog("Exploiting", string.format("[Exploiting] %s flagged (extended origin %.1fm, level %d)", PName, Distance, This.ExploitLevel))
                                    end)
                                end
                            end
                        end

                        if ShouldCheck and EqualCount == PelletCount then
                            local PrevLevel = This.ExploitLevel or 0
                            This.ExploitLevel = Clamp(This.ExploitLevel + 1, 0, 3)

                            This.NoSpread = true

                            This.ExploitTick = Tick()
                            if This.ExploitLevel > PrevLevel and Library and Library.PushEventLog then
                                local PName = (This.Player and This.Player.Name) or "Unknown"
                                pcall(function()
                                    Library:PushEventLog("Exploiting", string.format("[Exploiting] %s flagged (no-spread, level %d)", PName, This.ExploitLevel))
                                end)
                            end
                        end
                    end
                end

                return
            end))

            local NewBullet; NewBullet = HookFunction(Shared.BulletObject.new, LPH_NO_UPVALUES(function(Data, ...)
                if Data.extra then
                    if Flags["Bullet Impacts Enabled"].Value then
                        local Ontouch = Data.ontouch

                        Data.ontouch = function(Self, Object, Position, Normal, ...)
                            Visuals.CreateImpact(NewCFrame(Position, Position + Normal))

                            if Ontouch then
                                return Ontouch(Self, Object, Position, Normal, ...)
                            end
                        end
                    end
                end

                return NewBullet(Data, ...)
            end))

            local SwapWeapon; SwapWeapon = HookFunction(Events.swapweapon, LPH_NO_UPVALUES(function(Player, Index, Weapon, ...)
                SwapWeapon(Player, Index, Weapon, ...)

                if Player == LocalPlayer then
                    local Object = Visuals.Object

                    local Replicated = Object.Replicated
                    local ThirdPersonObject = Object.ThirdPersonObject

                    if Replicated and ThirdPersonObject then
                        Replicated._activeWeaponIndex = Index

                        Replicated:swapWeapon(Index, Weapon)

                        ThirdPersonObject:buildWeapon(Index)

                        if Index > 2 then
                            ThirdPersonObject:equipMelee()
                        else
                            ThirdPersonObject:equip(Index)
                        end

                        Visuals.LocalChams(true)

                        Visuals.CacheCharacter(ThirdPersonObject._characterModel)

                        Visuals.LocalChams()
                    end
                end

                return
            end))

            local BulletHit; BulletHit = HookFunction(Events.bulletHitConfirm, LPH_NO_UPVALUES(function(Player, Hitbox, Position, Damage, Headshot, Time, ...)
                local TimeNow = Tickbase.GetTick()

                BulletHit(Player, Hitbox, Position, Damage, Headshot, Time, ...)

                if Flags["Custom Hitmarker"] and Flags["Custom Hitmarker"].Value then
                    local IsHead = Headshot == true or Hitbox == "Head" or Hitbox == "head"
                    pcall(function()
                        Visuals.ShowHitmarker(IsHead, Damage, false, Position)
                    end)
                end
                if Flags["Hit Chams"] and Flags["Hit Chams"].Value then
                    pcall(function()
                        if Visuals.MarkHitChams then Visuals.MarkHitChams(Player) end
                        if Visuals.ApplyHitChams then Visuals.ApplyHitChams(Player) end
                    end)
                end

                if Find(MultiToList(Flags["Event Logs"].Value), "Bullet Hit") then
                    SetThreadIdentity(7)
                    Library:Notify(tostring(Format("[Bullet Hit] Hit %s in the %s for %s hp in %s ms", Player.Name, Hitbox, Round(Damage), Round((TimeNow - Time) * 1000))), Flags["Event Logs Time"].Value)
                end

                return
            end))

            local MeleeHit; MeleeHit = HookFunction(Events.meleeHitConfirm, LPH_NO_UPVALUES(function(Player, Hitbox, Position, Damage, Headshot, ...)
                MeleeHit(Player, Hitbox, Position, Damage, Headshot, ...)

                if Flags["Custom Hitmarker"] and Flags["Custom Hitmarker"].Value then
                    local IsHead = Headshot == true or Hitbox == "Head" or Hitbox == "head"
                    pcall(function()
                        Visuals.ShowHitmarker(IsHead, Damage, false, Position)
                    end)
                end
                if Flags["Hit Chams"] and Flags["Hit Chams"].Value then
                    pcall(function()
                        if Visuals.MarkHitChams then Visuals.MarkHitChams(Player) end
                        if Visuals.ApplyHitChams then Visuals.ApplyHitChams(Player) end
                    end)
                end

                if Find(MultiToList(Flags["Event Logs"].Value), "Melee Hit") then
                    SetThreadIdentity(7)

                    Library:Notify(tostring(Format("[Melee Hit] Hit %s in the %s for %s hp", Player.Name, Hitbox, Round(Damage))), Flags["Event Logs Time"].Value)
                end

                return
            end))

            local GrenadeHit; GrenadeHit = HookFunction(Events.grenadeHitConfirm, LPH_NO_UPVALUES(function(Player, Hitbox, Position, Damage, Headshot, ...)
                GrenadeHit(Player, Hitbox, Position, Damage, Headshot, ...)

                if Flags["Custom Hitmarker"] and Flags["Custom Hitmarker"].Value then
                    local IsHead = Headshot == true or Hitbox == "Head" or Hitbox == "head"
                    pcall(function()
                        Visuals.ShowHitmarker(IsHead, Damage, false, Position)
                    end)
                end
                if Flags["Hit Chams"] and Flags["Hit Chams"].Value then
                    pcall(function()
                        if Visuals.MarkHitChams then Visuals.MarkHitChams(Player) end
                        if Visuals.ApplyHitChams then Visuals.ApplyHitChams(Player) end
                    end)
                end

                if Find(MultiToList(Flags["Event Logs"].Value), "Grenade Hit") then
                    SetThreadIdentity(7)

                    Library:Notify(tostring(Format("[Grenade Hit] Hit %s in the %s for %s hp", Player.Name, Hitbox, Round(Damage))), Flags["Event Logs Time"].Value)
                end

                return
            end))

            local CorrectPosition; CorrectPosition = HookFunction(Events.correctposition, LPH_NO_UPVALUES(function(Position, ...)
                if M.IsPeeking then return end

                local LocalInfo = Info.LocalPlayer

                if LocalInfo.Faked then
                    LocalInfo.RootPosition = Position
                    LocalInfo.FakePosition = Position

                    LocalInfo.Faked = false

                    AntiAim.LastFake = nil
                end

                if Flags["Assist Air Despawns"].Value then
                    local Humanoid = LocalInfo.Humanoid

                    if Humanoid then
                        if Humanoid.FloorMaterial == Enum.Material.Air then
                            local Result = Raycasting.Raycast(LocalInfo.RootPosition, NewVector3(0, -1000, 0), { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Raycasting.CheckResult)

                            if Result then
                                return CorrectPosition(Result.Position + NewVector3(0, 2, 0), ...)
                            end
                        end
                    end
                end

                if Find(MultiToList(Flags["Event Logs"].Value), "Server Corrections") then
                    Spawn(function()
                        SetThreadIdentity(7)

                        Library:Notify(tostring(Format("[Server Correction] Server corrected position to: %s, %s, %s", Floor(Position.X), Floor(Position.Y), Floor(Position.Z))), Flags["Event Logs Time"].Value)
                    end)
                end

                return CorrectPosition(Position, ...)
            end))

            local DropWeapon; DropWeapon = HookFunction(Events.dropweapon, LPH_NO_UPVALUES(function(Data, ...)
                if Data.sourcePlayer == LocalPlayer then
                    local Weapon = Shared.WeaponControllerInterface.getWeaponCache()[Data.weaponIndex]

                    if Weapon then
                        local WeaponModel = Weapon:popWeaponModel()

                        if WeaponModel then
                            local Cache = Visuals.ViewModels[WeaponModel]

                            if Cache then
                                local Descendants = GetDescendants(WeaponModel)

                                for i = 1, #Descendants do
                                    local Descendant = Descendants[i]

                                    local IsBasePart = IsA(Descendant, "BasePart")
                                    local IsTexture = IsA(Descendant, "Texture")
                                    local IsSpecialMesh = IsA(Descendant, "SpecialMesh")
                                    local IsMeshPart = IsA(Descendant, "MeshPart")
                                    local IsDecal = IsA(Descendant, "Decal")
                                    local IsUnionOperator = IsA(Descendant, "UnionOperation")

                                    if
                                        not IsBasePart and
                                        not IsSpecialMesh and
                                        not IsTexture and
                                        not IsMeshPart and
                                        not IsDecal and
                                        not IsUnionOperator
                                    then
                                        continue
                                    end

                                    local Cached = Cache[Descendant]

                                    if not Cached then continue end

                                    if IsBasePart then
                                        Descendant.Material = Cached.Material
                                        Descendant.Color = Cached.Color
                                        Descendant.Transparency = Cached.Transparency
                                        Descendant.Reflectance = Cached.Reflectance
                                    end

                                    if IsUnionOperator then
                                        Descendant.UsePartColor = Cached.UsePartColor
                                    elseif IsMeshPart then
                                        Descendant.TextureID = Cached.TextureID
                                    elseif IsTexture then
                                        Descendant.Transparency = Cached.Transparency
                                    elseif IsSpecialMesh then
                                        Descendant.TextureId = Cached.TextureId
                                        Descendant.VertexColor = Cached.VertexColor
                                    elseif IsDecal then
                                        Descendant.Transparency = Cached.Transparency
                                    end
                                end
                            end
                        end
                    end
                end

                return DropWeapon(Data, ...)
            end))

            local Hitmarker; Hitmarker = HookFunction(Shared.HudCrosshairsInterface.fireHitmarker, LPH_NO_UPVALUES(function(...)
                local Args = { ... }
                local IsHeadshot = Args[1] == true or Args[2] == true
                local DamageAmount = nil
                for i = 1, #Args do
                    if type(Args[i]) == "number" and Args[i] > 0 and Args[i] < 500 then
                        DamageAmount = Args[i]
                        break
                    end
                end

                if not Flags["Hide Default Hitmarker"].Value then
                    Hitmarker(...)
                end

                if Flags["Custom Hitmarker"].Value then
                    pcall(function()
                        Visuals.ShowHitmarker(IsHeadshot, DamageAmount, false)
                    end)
                end

                if Flags["Hitsound Enabled"].Value then
                    local Name = Flags["Hitsound"].Value
                    local Id = (HitsoundIds and HitsoundIds[Name]) or ""
                    if Id ~= "" and Id ~= nil then
                        local Snd = Clone(Visuals.Cache.Hitsound)
                        Snd.SoundId = Id
                        local Vol = Flags["Hitsound Volume"].Value
                        if type(Vol) == "number" then Snd.Volume = Vol / 100 end
                        local Spd = Flags["Hitsound Speed"] and Flags["Hitsound Speed"].Value
                        if type(Spd) == "number" then Snd.PlaybackSpeed = Spd end
                        Snd.Parent = CurrentCamera
                        Destroy(Snd)
                    end
                end

                return
            end))

            local PlaySound; PlaySound = HookFunction(Shared.AudioSystem.playSound, LPH_NO_UPVALUES(function(...)
                PlaySound(...)

                if not CheckCaller() then
                    local Args = { ... }

                    local RootPart = Args[8]

                    if not RootPart then return end

                    local Team = GetSection(true)
                    local Enemy = GetSection(false)

                    local TeamSound = Team["Esp Sound"].Value
                    local EnemySound = Enemy["Esp Sound"].Value

                    if not TeamSound and not EnemySound then return end

                    local This = Info.FindByRoot(RootPart)

                    if
                        not This or
                        This.IsLocalPlayer or
                        This.PlayingSound
                    then
                        return
                    end

                    local Teammate = This.Teammate

                    if
                        (Teammate and not TeamSound) or
                        (not Teammate and not EnemySound)
                    then
                        return
                    end

                    local Section = Teammate and Team or Enemy

                    local Circle = This.Renders.Circle

                    local ColorFlag = Section["Esp Sound Color"]
                    local Duration = Section["Esp Sound Duration"].Value

                    This.PlayingSound = true

                    Circle.CFrame = NewCFrame(RootPart.Position - NewVector3(0, 2, 0)) * Angles(Pi / 2, 0, 0)

                    Circle.InnerRadius = 2
                    Circle.Radius = 1.93

                    Circle.Color3 = ColorFlag.Color
                    Circle.Transparency = ColorFlag.Transparency

                    Circle.AlwaysOnTop = Section["Esp Sound Through Walls"].Value

                    Circle.Visible = true

                    Menu.Tween(Circle, NewTweenInfo(Duration, Enum.EasingStyle.Linear), { InnerRadius = 6, Radius = 5.93 })

                    Delay(Duration - 0.2, function()
                        Menu.Tween(Circle, NewTweenInfo(0.2, Enum.EasingStyle.Linear), { Transparency = 1 })

                        Wait(0.2)

                        Circle.Visible = false

                        Circle.Transparency = 0

                        This.PlayingSound = false
                    end)
                end

                return
            end))

            local PlaySoundId; PlaySoundId = HookFunction(Shared.AudioSystem.playSoundId, LPH_NO_UPVALUES(function(...)
                local Args = { ... }

                if Visuals.InThirdPerson then
                    Args[5] = Info.LocalPlayer.RootPart
                end

                if Flags["Custom ShootSound"] and Flags["Custom ShootSound"].Value then
                    if Flags["ShootSound Play Original"] and Flags["ShootSound Play Original"].Value then
                        local Ov = Flags["ShootSound Original Volume"]
                        local Mult = (Ov and type(Ov.Value) == "number" and Ov.Value / 100) or 1
                        Args[3] = (Args[3] or 1) * Mult
                        PlaySoundId(Unpack(Args))
                    end

                    local ShootSound = Clone(Visuals.Cache.ShootSound)
                    local CustomId = Flags["ShootSound Custom Id"] and Flags["ShootSound Custom Id"].Value
                    if type(CustomId) == "string" and CustomId ~= "" then
                        if not string.find(CustomId, "rbxassetid://", 1, true) then
                            CustomId = "rbxassetid://" .. CustomId:gsub("%D", "")
                        end
                        ShootSound.SoundId = CustomId
                    end
                    local Vol = Flags["ShootSound Volume"]
                    local Spd = Flags["ShootSound Speed"]
                    if Vol and type(Vol.Value) == "number" then
                        ShootSound.Volume = Vol.Value / 100
                    end
                    if Spd and type(Spd.Value) == "number" then
                        ShootSound.PlaybackSpeed = Spd.Value
                    end
                    ShootSound.Parent = CurrentCamera
                    pcall(function() ShootSound:Play() end)
                    task.delay(3, function()
                        pcall(Destroy, ShootSound)
                    end)

                    return
                end

                return PlaySoundId(Unpack(Args))
            end))

            local SetScope; SetScope = HookFunction(Shared.HudScopeInterface.setScope, LPH_NO_UPVALUES(function(Visible, ...)
                if not CheckCaller() then
                    if Visible and (Visuals.InThirdPerson or Flags["No Scope Overlay"].Value) then
                        Visible = false
                    end
                end

                return SetScope(Visible, ...)
            end))

            local GetSwayCFrame; GetSwayCFrame = HookFunction(Shared.Sway.getSwayCFrame, LPH_NO_UPVALUES(function(...)
                if Flags["No Weapon Sway"].Value then
                    return EmptyCFrame
                end

                return GetSwayCFrame(...)
            end))

            local SetCharacterRender; SetCharacterRender = HookFunction(Shared.ThirdPersonObject.setCharacterRender, LPH_NO_UPVALUES(function(Self, Value, ...)
                if not CheckCaller() then
                    if Flags["Disable Teammate Rendering"].Value and not Self._isEnemy then
                        Value = false
                    end
                end

                return SetCharacterRender(Self, Value, ...)
            end))

            local CameraStep; CameraStep = HookFunction(Shared.MainCameraObject.step, LPH_NO_UPVALUES(function(Self, ...)
                if Flags["No Camera Bob"].Value then
                    local Character = Info.LocalPlayer.Character

                    if Character then
                        Character._speed = 0
                    end
                end

                if Flags["No Camera Suppression"].Value then
                    Self._suppressionSpring.p = EmptyVector3
                end

                return CameraStep(Self, ...)
            end))

            local ApplyImpulse; ApplyImpulse = HookFunction(Shared.MainCameraObject.applyImpulse, LPH_NO_UPVALUES(function(Self, Amount, ...)
                if Amount then
                    Amount *= (Flags["Camera Recoil Adjustment"].Value / 100)
                end

                return ApplyImpulse(Self, Amount, ...)
            end))

            local ApplyImpulse2; ApplyImpulse2 = HookFunction(Shared.RecoilSprings.applyImpulse, LPH_NO_UPVALUES(function(Self, Offset, Amount, ...)
                if Amount and GetInfo(3).name ~= "applyImpulse" then
                    Amount *= (Flags["Weapon Recoil Adjustment"].Value / 100)
                end

                return ApplyImpulse2(Self, Offset, Amount, ...)
            end))

            local FirearmWalkSway; FirearmWalkSway = HookFunction(Shared.FirearmObject.computeWalkSway, LPH_NO_UPVALUES(function(...)
                if Flags["No Weapon Sway"].Value then
                    return EmptyCFrame
                end

                return FirearmWalkSway(...)
            end))

            local FirearmGunSway; FirearmGunSway = HookFunction(Shared.FirearmObject.computeGunSway, LPH_NO_UPVALUES(function(Self, ...)
                local Multiplier = Flags["ViewModel Disable On Aim"].Value and 1 - Self._aimArmSpring.p or 1

                local Offset = EmptyCFrame

                if Flags["ViewModel Offsets"].Value then
                    Offset = Angles((Flags["ViewModel Pitch"].Value * ToRad) * Multiplier, (Flags["ViewModel Yaw"].Value * ToRad) * Multiplier, (Flags["ViewModel Roll"].Value * ToRad) * Multiplier)

                    Offset *= NewCFrame(Flags["ViewModel X Offset"].Value * Multiplier, Flags["ViewModel Y Offset"].Value * Multiplier, -Flags["ViewModel Z Offset"].Value * Multiplier)
                end

                if Flags["No Weapon Sway"].Value then
                    return Offset
                end

                if Offset then
                    return FirearmGunSway(Self, ...) * Offset
                else
                    return FirearmGunSway(Self, ...)
                end
            end))

            local GrenadeModelSway; GrenadeModelSway = HookFunction(Shared.GrenadeObject.modelSway, LPH_NO_UPVALUES(function(...)
                if Flags["No Weapon Sway"].Value then
                    return EmptyCFrame
                end

                return GrenadeModelSway(...)
            end))


            local GrenadeWalkSway; GrenadeWalkSway = HookFunction(Shared.GrenadeObject.walkSway, LPH_NO_UPVALUES(function(...)
                if Flags["No Weapon Sway"].Value then
                    return EmptyCFrame
                end

                return GrenadeWalkSway(...)
            end))

            local MeleeSway; MeleeSway = HookFunction(Shared.MeleeObject.meleeSway, LPH_NO_UPVALUES(function(...)
                local Offset = EmptyCFrame

                if Flags["ViewModel Offsets"].Value then
                    Offset = Angles(Flags["ViewModel Pitch"].Value * ToRad, Flags["ViewModel Yaw"].Value * ToRad, Flags["ViewModel Roll"].Value * ToRad)

                    Offset *= NewCFrame(Flags["ViewModel X Offset"].Value, Flags["ViewModel Y Offset"].Value, -Flags["ViewModel Z Offset"].Value)
                end

                if Flags["No Weapon Sway"].Value then
                    return Offset
                end

                if Offset then
                    return MeleeSway(...) * Offset
                else
                    return MeleeSway(...)
                end
            end))

            local MeleeWalkSway; MeleeWalkSway = HookFunction(Shared.MeleeObject.walkSway, LPH_NO_UPVALUES(function(...)
                if Flags["No Weapon Sway"].Value then
                    return EmptyCFrame
                end

                return MeleeWalkSway(...)
            end))
        end
    end
end
__LoadVisuals()

local function __LoadInfo()
    local ReplicationInterface = Shared.ReplicationInterface
    local CharacterInterface = Shared.CharacterInterface

    local NetworkClient = Shared.NetworkClient
    local DataClient = Shared.PlayerDataClientInterface

    local CharacterEvents = Shared.CharacterEvents

    Info.Players = {}
    Info.LocalPlayer = {}

    Info.LastSort = 0

    Info.OnSpawn = LPH_JIT_MAX(function(This : Table, Entry : Table, Position : Vector3)
        if This then
            This.Alive = true
            This.Entry = Entry

            This.Team = This.Player.TeamColor.Name == "Bright orange" and "Ghosts" or "Phantoms"

            if Entry then
                local ThirdPersonObject = Entry._thirdPersonObject

                This.ThirdPersonObject = ThirdPersonObject
                This.Teammate = not Entry._isEnemy

                if ThirdPersonObject then
                    local RootPart = ThirdPersonObject._rootPart

                    This.RootPart = RootPart
                    This.BodyParts = ThirdPersonObject._characterModelHash
                    This.Character = ThirdPersonObject._characterModel

                    Esp.OnSpawn(This)
                end
            end

            if This.IsLocalPlayer then
                local Model = CharacterInterface.getCharacterObject()

                local RootPart = Model._rootPart
                local Humanoid = Model._humanoid

                local Stance = Flags["Custom Stance"].Value

                This.Character = Model

                if RootPart then
                    local RootPosition = RootPart.Position

                    This.RootPart = RootPart

                    This.RootPosition = RootPosition
                    This.FakePosition = RootPosition
                end

                if Humanoid then
                    This.Humanoid = Humanoid
                end

                Visuals.Object.Spawn(This.FakePosition)

                if Stance ~= "None" then
                    NetworkClient:send("stance", Lower(Stance))
                end

                if Flags["Tilt Neck"].Value then
                    NetworkClient:send("aim", true)
                end

                if Flags["Lower Arms"].Value then
                    NetworkClient:send("sprint", true)
                end
            end

            if Position then
                This.Frames[#This.Frames + 1] = {
                    Position,
                    Clock()
                }

                This.RootPosition = Position
            end
        end
    end)

    Info.OnDied = LPH_JIT_MAX(function(This : Table)
        if This then
            This.Alive = false
            This.Faked = false

            This.IsImmune = false
            This.BlockRepUpdates = false

            This.ForceViewAngles = nil
            This.WeaponIndex = nil

            This.CycleFrames = 0

            This.LastRefresh = 0
            This.Cardinal = 1

            This.Health = 0
            This.PredictedDamage = 0
            This.Distance = Infinite

            This.Entry = nil
            This.ThirdPersonObject = nil
            This.Weapon = nil

            This.Humanoid = nil
            This.RootPart = nil
            This.RootPosition = nil

            if not This.IsLocalPlayer and This.Player and Visuals then
                pcall(function()
                    if Visuals.CacheHitChamsPose then
                        Visuals.CacheHitChamsPose(This, true)
                    end
                    local Key = This.Player.Name
                    local Marked = Visuals.HitChamsMarked and Visuals.HitChamsMarked[Key]
                    if Flags["Hit Chams"] and Flags["Hit Chams"].Value and type(Marked) == "number" and (tick() - Marked) <= 8 then
                        if Visuals.ApplyHitChams then
                            Visuals.ApplyHitChams(This.Player)
                        end
                        Visuals.HitChamsMarked[Key] = nil
                    end
                end)
            end

            Clear(This.BodyParts)
            Clear(This.Frames)

            if This.IsLocalPlayer then
                M.IsPeeking = false

                M.PeekQueue = {}
                M.PeekIndex = 1

                M.ReverseTime = false
                M.LastTime = nil

                Knifebot.NextSwing = 0

                for ViewModel in next, Visuals.ViewModels do
                    if not ViewModel or not ViewModel.Parent then continue end

                    Destroy(ViewModel)
                end

                Clear(Visuals.ViewModels)
            else
                Esp.OnDied(This)
            end
        end
    end)

    Info.Add = LPH_JIT_MAX(function(Player : Player)
        local Name = Player.Name
        local IsLocalPlayer = Player == LocalPlayer

        local This = {
            Player = Player,
            Name = Name,

            IsLocalPlayer = IsLocalPlayer,

            Distance = Infinite,
            CycleFrames = 0,

            Priority = false,
            Whitelist = false,

            Stance = "stand",

            Exploiting = false,
            ExploitLevel = 0,
            ExploitTick = 0,

            LastRefresh = 0,
            Cardinal = 1,

            ExtendedOrigin = false,
            NoSpread = false,
            Pitch = false,

            PlayingSound = false,

            RootPosition = EmptyVector3,
            ViewAngles = EmptyVector3,
            BarrelAngles = EmptyVector3,

            BodyParts = {},
            Frames = {},

            Health = 0,
            PredictedDamage = 0,
            Alive = false,

            Team = Player.TeamColor.Name == "Bright orange" and "Ghosts" or "Phantoms",
            Teammate = Player.TeamColor == LocalPlayer.TeamColor,

            IsImmune = false,
            Faked = false,

            Friends = "false",
            Staff = "false"
        }

        if not IsLocalPlayer then
            This.Renders = Esp.GetRenders(Player, This.Teammate)

            Info.Players[#Info.Players + 1] = This

            Spawn(function()
                This.Friends = Player:IsFriendsWith(LocalPlayer.UserId) and "true" or "false"

                local Rank = Player:GetRoleInGroup(1103278)

                if Rank ~= "Guest" and Rank ~= "Supporters" and Rank ~= "Contributors" then
                    This.Staff = Rank
                end

                if Flags["Staff Detector"].Value then
                    Info.CheckStaff(This)
                end
            end)
        else
            Info.LocalPlayer = This
        end

        (Flags["Player List"].Add and Flags["Player List"].Add or function() end)(Name, {
            Name,
            This.Team == "Phantoms" and '<font color="rgb(155, 182, 255)">Phantoms</font>' or '<font color="rgb(231, 183, 88)">Ghosts</font>',
            (This.Whitelist and '<font color="rgb(158, 225, 255)">Whitelist</font>') or (This.Priority and '<font color="rgb(255, 0, 0)">Priority</font>') or "Neutral"
        })
    end)

    Info.Remove = LPH_JIT_MAX(function(Player : Player)
        if Player == LocalPlayer then return end

        local This, Found = Info.FindByPlayer(Player)

        if Found then
            local Renders = This.Renders

            local Skeleton = Renders.Skeleton
            local Attachments = Renders.Attachments
            local Chams = Renders.Chams

            for Index, Render in next, Renders do
                if
                    Index == "Arrow" or
                    Index == "ArrowOutline" or
                    Index == "Attachments" or
                    Index == "Skeleton" or
                    Index == "Chams" or
                    Index == "Circle"
                then
                    continue
                end

                Destroy(Render)
            end

            for i = 1, #Skeleton do
                Skeleton[i]:Remove()
            end

            for i = 1, #Attachments do
                Destroy(Attachments[i])
            end

            for i = 1, #Chams do
                Destroy(Chams[i][1])
            end

            Destroy(Renders.Circle)

            Renders.Arrow:Remove()
            Renders.ArrowOutline:Remove()

            Clear(This)
            Remove(Info.Players, Found)
        end

        (Flags["Player List"].Remove and Flags["Player List"].Remove or function() end)(Player.Name)
    end)

    Info.FindByPlayer = LPH_JIT_MAX(function(Player : Player)
        local InfoPlayers = Info.Players

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]

            if This.Player == Player then
                return This, i
            end
        end
    end)

    Info.FindByRoot = LPH_JIT_MAX(function(Root : Instance)
        local InfoPlayers = Info.Players

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]

            if This.RootPart == Root then
                return This, i
            end
        end
    end)

    Info.FindByName = LPH_JIT_MAX(function(Name : String)
        local InfoPlayers = Info.Players

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]

            if This.Name == Name then
                return This, i
            end
        end
    end)

    Info.CheckStaff = LPH_JIT_MAX(function(This : Table)
        if This.Staff ~= "false" then
            TeleportService:Teleport(292439477)
        end
    end)

    Info.CheckAllStaff = LPH_JIT_MAX(function()
        local InfoPlayers = Info.Players

        for i = 1, #InfoPlayers do
            Info.CheckStaff(InfoPlayers[i])
        end
    end)

    Info.RenderStepped = LPH_JIT_MAX(function()
        local LocalInfo = Info.LocalPlayer
        local InfoPlayers = Info.Players

        local RootPosition = LocalInfo.RootPosition or CurrentCamera.CFrame.Position

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]
            local Entry = This.Entry

            local Team = This.Player.TeamColor.Name == "Bright orange" and "Ghosts" or "Phantoms"

            if Team ~= This.Team then
                (Flags["Player List"].EditValue and Flags["Player List"].EditValue or function() end)(This.Name, {
                    [2] = Team == "Phantoms" and '<font color="rgb(155, 182, 255)">Phantoms</font>' or '<font color="rgb(231, 183, 88)">Ghosts</font>'
                })

                This.Team = Team
            end

            if Entry then
                local ThisRootPosition = This.RootPosition

                local Model = This.ThirdPersonObject
                local HealthState = Entry._healthstate

                local Health = HealthState.health0
                local MaxHealth = HealthState.maxhealth

                local HealRate = HealthState.healrate
                local HealTick = HealthState.healtick0

                local Difference = Tickbase.GetTick() - HealTick

                if Difference < 0 then
                    This.Health, This.MaxHealth = Health, MaxHealth
                else
                    local EndHealth = Health + Difference * Difference * HealRate

                    This.Health, This.MaxHealth = EndHealth < MaxHealth and EndHealth or MaxHealth, MaxHealth
                end

                if Model then
                    This.Weapon = Model._weaponName
                end

                if ThisRootPosition then
                    This.Distance = Ceil((RootPosition - ThisRootPosition).Magnitude)
                end

                local Teammate = This.Teammate
                local NewTeammate = not Entry._isEnemy

                if Teammate ~= NewTeammate then
                    (Flags["Player List"].EditValue and Flags["Player List"].EditValue or function() end)(This.Name, {
                        [2] = Team == "Phantoms" and '<font color="rgb(155, 182, 255)">Phantoms</font>' or '<font color="rgb(231, 183, 88)">Ghosts</font>'
                    })

                    This.Teammate = NewTeammate
                end
            end

            if (Tick() - This.ExploitTick) > 3 then
                This.ExploitLevel = 0

                This.ExtendedOrigin = false
                This.NoSpread = false
                This.Pitch = false
            end

            local WasExploiting = This.Exploiting
            This.Exploiting = This.ExploitLevel > 1

            if This.Exploiting and not WasExploiting and not This.IsLocalPlayer then
                local Section = GetSection(This.Teammate)
                if Section["Esp Exploiting"].Value then
                    pcall(function()
                        SetThreadIdentity(7)
                        local Dur = Flags["Event Logs Time"] and Flags["Event Logs Time"].Value or 3
                        if type(Dur) ~= "number" then Dur = 3 end
                        Library:Notify(Format("[Exploiting] %s flagged (level %s)", This.Name or "Player", tostring(This.ExploitLevel)), Dur)
                    end)
                end
            end
        end

        local Character = LocalInfo.Character

        if Character then
            local Controller = Character._weaponController

            if Controller then
                local Weapon = Controller._activeWeaponRegistry[Controller._activeWeaponIndex]

                LocalInfo.Weapon = Weapon

                if Weapon then
                    local WeaponData = Weapon._weaponData

                    LocalInfo.WeaponData = WeaponData

                    LocalInfo.BulletSpeed = WeaponData["bulletspeed"] or 0
                    LocalInfo.Penetration = WeaponData["penetrationdepth"] or 0
                    LocalInfo.PelletCount = WeaponData["pelletcount"] or 1
                    LocalInfo.DamageGraph = WeaponData["damageGraph"] or {}

                    LocalInfo.WeaponType = Weapon:getWeaponType()

                    local FireRate = WeaponData.firerate

                    if FireRate then
                        if WeaponData.variablefirerate then
                            FireRate = Max(Unpack(WeaponData.firerate))
                        end

                        LocalInfo.FireRate = (60 / FireRate)
                    end
                end
            end
        end

        if (Tick() - Info.LastSort) > 0.5 then
            Sort(Info.Players, function(A, B)
                return (((A.Alive and 0 or 10) - (A.Priority and 1 or 0) - (A.Distance < B.Distance and 1 or 0))) < (((B.Alive and 0 or 10) - (B.Priority and 1 or 0) - (B.Distance < A.Distance and 1 or 0)))
            end)

            Info.LastSort = Tick()
        end
    end)

    Info.Init = function()
        do
            Visuals.Object = Visuals.CreateObject()

            local List = Players:GetPlayers()

            for i = 1, #List do
                Info.Add(List[i])
            end

            ReplicationInterface.operateOnAllEntries(function(Player, Self)
                if Self._alive then
                    Info.OnSpawn(Info.FindByPlayer(Player), Self, Self._receivedPosition)
                end
            end)

            if CharacterInterface.isAlive() then
                Info.OnSpawn(Info.LocalPlayer, ReplicationInterface.getEntry(LocalPlayer))
            end

            PlayerAdded:Connect(Info.Add)
            PlayerRemoving:Connect(Info.Remove)

            RenderStepped:Connect(Info.RenderStepped)
        end

        do
            CharacterEvents.onSpawned:Connect(function()
                Info.OnSpawn(Info.LocalPlayer, ReplicationInterface.getEntry(LocalPlayer))
            end)

            CharacterEvents.onDespawning:Connect(function(This)
                Info.OnDied(Info.LocalPlayer)

                if Flags["Vote Kick On Death"] and Flags["Vote Kick On Death"].Value then
                    local Attacker = This and This.attacker
                    if Attacker and Attacker ~= LocalPlayer then
                        local AttackerName = type(Attacker) == "string" and Attacker or (Attacker.Name or tostring(Attacker))
                        if AttackerName and AttackerName ~= LocalPlayer.Name then
                            pcall(function()
                                NetworkClient:send("modcmd", Format("/votekick:%s:cheats", AttackerName))
                            end)
                        end
                    end
                end

                Visuals.Object.Despawn()
            end)
        end

        do
            local Send; Send = HookFunction(NetworkClient.send, LPH_NO_UPVALUES(function(Self, Command, ...)
                local Args = { ... }

                if Command == "repupdate" then
                    if not CheckCaller() then
                        local LocalInfo = Info.LocalPlayer
                        local BlockUpdates = LocalInfo.IsImmune or LocalInfo.BlockRepUpdates

                        if not BlockUpdates and (M.IsPeeking or Flags["Speed Bypass"].Value) then
                            local NewTime = Args[4]

                            if not M.ReverseTime then
                                M.LastTime = NewTime
                            end

                            if (NewTime - M.LastTime) > (1 / 60) then
                                M.ReverseTime = false
                                M.LastTime = NewTime
                            end

                            M.ReverseTime = not M.ReverseTime
                            Args[4] = M.LastTime
                        end

                        if M.IsPeeking then
                            local Queued = M.PeekQueue[M.PeekIndex]

                            M.PeekIndex += 1

                            if Queued then
                                Args[1] = Queued

                                Send(Self, Command, Unpack(Args))

                                LocalInfo.RootPosition = Queued
                                LocalInfo.FakePosition = Queued

                                LocalInfo.Faked = false
                            end

                            if M.PeekIndex > #M.PeekQueue then
                                M.PeekQueue = {}
                                M.PeekIndex = 1
                            end

                            return
                        end

                        if BlockUpdates then
                            return
                        end

                        local FakePosEnabled = Flags["Fake Position Enabled"].Value
                        local FreezeMovements = Flags["Freeze Movements"].Value
                        local AntiAimEnabled = Flags["Anti Aim Enabled"].Value

                        local OldViewAngles = Args[2]

                        if FreezeMovements then
                            Args[1] = LocalInfo.RootPosition
                        elseif AntiAimEnabled then
                            LocalInfo.CycleFrames += 1

                            Args[2] = AntiAim.GetViewAngles(OldViewAngles, LocalInfo)
                        end

                        local RealPosition = Args[1]
                        local ViewAngles = Args[2]
                        local BarrelAngles = Args[3]

                        LocalInfo.ViewAngles = ViewAngles
                        LocalInfo.BarrelAngles = BarrelAngles

                        if FakePosEnabled then
                            AntiAim.FakePosition(Send, RealPosition, OldViewAngles, BarrelAngles)

                            return
                        end

                        if not FreezeMovements then
                            LocalInfo.RootPosition = RealPosition
                        end

                        LocalInfo.FakePosition = RealPosition

                        return Send(Self, Command, Unpack(Args))
                    end
                elseif Command == "stance" then
                    local LocalInfo = Info.LocalPlayer

                    if LocalInfo.Faked then
                        SetThreadIdentity(7)

                        Library:Notify(tostring("[Fake Position] Choked stance packet due to fake position"), Flags["Event Logs Time"].Value)

                        return
                    end

                    local Object = Visuals.Object.ThirdPersonObject

                    if not CheckCaller() then
                        local CustomStance = Flags["Custom Stance"].Value

                        if CustomStance ~= "None" then
                            Args[1] = Lower(CustomStance)
                        end
                    end

                    local Stance = Args[1]

                    if Object then
                        Object._stanceSpring.t = (Stance == "stand" and 0 or Stance == "crouch" and 0.5 or 1)
                    end

                    LocalInfo.Stance = Stance

                    return Send(Self, Command, Unpack(Args))
                elseif Command == "flaguser" or Command == "debug" then
                    if Find(MultiToList(Flags["Event Logs"].Value), "Server Flags") then
                        SetThreadIdentity(7)

                        Library:Notify(tostring("[Server Flags] Client attempted to send flag to server: Yielded"), Flags["Event Logs Time"].Value)
                    end

                    return
                elseif Command == "newbullets" then
                    Send(Self, Command, ...)

                    local Object = Visuals.Object.ThirdPersonObject

                    if Object then
                        Object:kickWeapon(false, nil, 1, 0)
                    end

                    if Flags["Local Tracer Enabled"].Value then
                        local Data = Args[2]

                        local Origin = Data.firepos
                        local Bullets = Data.bullets

                        for i = 1, #Bullets do
                            local Direction = Bullets[i][1] * 1000

                            local Result = Raycasting.Raycast(Origin, Direction, { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Visuals.CheckResult)

                            Visuals.CreateBeam(Origin, Result and NewCFrame(Result.Position, Result.Position + Result.Normal) or NewCFrame(Origin + Direction), "Local")
                        end
                    end

                    return
                elseif Command == "bullethit" then
                    if not CheckCaller() and Flags["Gun Force Hitbox"].Value then
                        local Hitboxes = MultiToList(Flags["Gun Hitboxes"].Value)
                        if #Hitboxes > 0 then
                            Args[4] = Hitboxes[Random(1, #Hitboxes)]
                            return Send(Self, Command, Unpack(Args))
                        end
                    end
                elseif Command == "knifehit" then
                    if not CheckCaller() and Flags["Knife Force Hitbox"].Value then
                        local Hitboxes = MultiToList(Flags["Knife Hitboxes"].Value)
                        if #Hitboxes > 0 then
                            Args[2] = Hitboxes[Random(1, #Hitboxes)]
                            return Send(Self, Command, Unpack(Args))
                        end
                    end
                elseif Command == "falldamage" then
                    if Flags["Remove Fall Damage"].Value then
                        return
                    end
                elseif Command == "aim" then
                    if Info.LocalPlayer.Faked then
                        SetThreadIdentity(7)

                        Library:Notify(tostring("[Fake Position] Choked aim packet due to fake position"), Flags["Event Logs Time"].Value)

                        return
                    end

                    local Object = Visuals.Object.ThirdPersonObject

                    if not CheckCaller() then
                        if Flags["Tilt Neck"].Value then
                            Args[1] = true
                        end
                    end

                    if Object then
                        Object._aimSpring.t = Args[1] and 0 or 1
                    end

                    return Send(Self, Command, Unpack(Args))
                elseif Command == "sprint" then
                    if Info.LocalPlayer.Faked then
                        SetThreadIdentity(7)

                        Library:Notify(tostring("[Fake Position] Choked sprint packet due to fake position"), Flags["Event Logs Time"].Value)

                        return
                    end

                    local Object = Visuals.Object.ThirdPersonObject

                    if not CheckCaller() then
                        if Flags["Lower Arms"].Value then
                            Args[1] = true
                        end
                    end

                    if Object then
                        Object._sprintSpring.t = Args[1] and 0 or 1
                    end

                    return Send(Self, Command, Unpack(Args))
                elseif Command == "stab" then
                    local Object = Visuals.Object.ThirdPersonObject

                    if Object then
                        Object:stab()
                    end
                elseif Command == "equip" then
                    local Object = Visuals.Object
                    local Index = Args[1]

                    local Replicated = Object.Replicated
                    local ThirdPersonObject = Object.ThirdPersonObject

                    if Replicated and ThirdPersonObject then
                        Replicated._activeWeaponIndex = Index

                        if Index > 2 then
                            ThirdPersonObject:equipMelee()
                        else
                            ThirdPersonObject:equip(Index)
                        end

                        Visuals.LocalChams(true)

                        Visuals.CacheCharacter(ThirdPersonObject._characterModel)

                        Visuals.LocalChams()
                    end

                    Info.LocalPlayer.WeaponIndex = Index
                elseif Command == "forcereset" then
                    local Object = Visuals.Object

                    if Object.ThirdPersonObject then
                        Object.Despawn()
                    end

                    Info.OnDied(Info.LocalPlayer)
                elseif Command == "newgrenade" then
                    if not CheckCaller() then
                        Args[4] = Flags["Grenade Fuse Time"].Value

                        return Send(Self, Command, Unpack(Args))
                    end
                elseif Command == "spawn" then
                    AntiAim.NextTick = 0
                    AntiAim.Addition = 0

                    if Flags["Spawn Immunity"].Value then
                        Info.LocalPlayer.IsImmune = true

                        Delay(Flags["Spawn Immunity Time"].Value, function()
                            Info.LocalPlayer.IsImmune = false
                        end)
                    end
                end

                return Send(Self, Command, ...)
            end))

            local Died; Died = HookFunction(Shared.Events.died, LPH_NO_UPVALUES(function(This, ...)
                local Victim = This.victim

                if Victim ~= LocalPlayer then
                    Info.OnDied(Info.FindByPlayer(Victim))

                    local Attacker = This.attacker

                    if Attacker == LocalPlayer then
                        if Flags["Kill Say Enabled"].Value then
                            Spawn(function()
                                local Message = Misc.GetKillSay(Victim.Name, Attacker.Name, This.hitPart)

                                if Message then
                                    TextChannel:SendAsync(Message)
                                end
                            end)
                        end

                        if Flags["Custom Hitmarker"].Value then
                            pcall(function()
                                Visuals.ShowHitmarker(true, nil, true)
                            end)
                        end

                        if Flags["Killsound Enabled"].Value then
                            local Name = Flags["Killsound"].Value
                            local Id = (KillsoundIds and KillsoundIds[Name]) or ""
                            if Id ~= "" and Id ~= nil then
                                local Snd = Clone(Visuals.Cache.Killsound)
                                Snd.SoundId = Id
                                local Vol = Flags["Killsound Volume"].Value
                                if type(Vol) == "number" then Snd.Volume = Vol / 100 end
                                local Spd = Flags["Killsound Speed"] and Flags["Killsound Speed"].Value
                                if type(Spd) == "number" then Snd.PlaybackSpeed = Spd end
                                Snd.Parent = CurrentCamera
                                Destroy(Snd)
                            end
                        end
                    end
                end

                return Died(This, ...)
            end))

            local ReplicationSpawn; ReplicationSpawn = HookFunction(Shared.ReplicationObject.spawn, LPH_NO_UPVALUES(function(Self, Position, ...)
                ReplicationSpawn(Self, Position, ...)

                local Player = Self._player

                if Player ~= LocalPlayer then
                    Info.OnSpawn(Info.FindByPlayer(Player), Self, Position)
                end

                return
            end))
        end
    end
end
__LoadInfo()

local function __LoadCamera()
    local FrustumY
    local FrustumX
    local FOV

    Camera.UpdateFOV = LPH_JIT_MAX(function()
        if Flags["Zoom"].Value then
            CurrentCamera.FieldOfView = (20 / Flags["Zoom Multiplier"].Value)
        elseif Flags["Visuals Custom Fov"].Value then
            local LocalInfo = Info.LocalPlayer

            if LocalInfo.Alive then
                if LocalInfo.WeaponType ~= "Firearm" or Visuals.InThirdPerson then
                    CurrentCamera.FieldOfView = Flags["Visuals Custom Fov Factor"].Value
                else
                    if Flags["Visuals Fov Disable Aim"].Value then
                        local Weapon = LocalInfo.Weapon

                        if Weapon then
                            local AimSpring = Weapon._aimArmSpring

                            if AimSpring and AimSpring.t ~= 1 then
                                CurrentCamera.FieldOfView = Flags["Visuals Custom Fov Factor"].Value
                            end
                        end
                    end
                end
            end
        end

        FOV = CurrentCamera.FieldOfView * ToRad
        FrustumY = Tan(FOV / 2)
        FrustumX = ScreenX / ScreenY * FrustumY
    end)

    Camera.UpdateSize = LPH_JIT_MAX(function()
        ScreenSize = CurrentCamera.ViewportSize

        ScreenX, ScreenY = ScreenSize.X, ScreenSize.Y
        FrustumX = ScreenX / ScreenY * FrustumY
    end)

    Camera.WorldToViewportPoint = LPH_JIT_MAX(function(Position : Vector3, ToEdges : Boolean, Offset : Number)
        local ObjectSpace = PointToObjectSpace(CurrentCamera.CFrame, Position)

        local NegativeZ = -ObjectSpace.Z
        local DoubleZ = 2 * NegativeZ

        local PositionX = ScreenX * (0.5 + ObjectSpace.X / (DoubleZ * FrustumX))
        local PositionY = ScreenY * (0.5 - ObjectSpace.Y / (DoubleZ * FrustumY))

        local OnScreen = NegativeZ > 0 and PositionX >= 0 and PositionX <= ScreenX and PositionY >= 0 and PositionY <= ScreenY

        if not ToEdges or OnScreen then
            return NewVector3(PositionX, PositionY, NegativeZ), OnScreen
        end

        local HalfOffset = Offset / 2
        local MaxY = ScreenY - HalfOffset

        if NegativeZ < 0 then
            PositionX = ScreenX - PositionX
            PositionY = ScreenY - PositionY

            if (PositionY / ScreenY) < 0.5 then
                PositionY = HalfOffset
            else
                PositionY = MaxY
            end
        end

        return NewVector3(Clamp(PositionX, HalfOffset, ScreenX - (Offset + HalfOffset)), Clamp(PositionY, Offset + 7, MaxY), NegativeZ), false
    end)

    Camera.Init = function()
        CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(Camera.UpdateFOV)
        CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Camera.UpdateSize)

        Camera.UpdateFOV()
        Camera.UpdateSize()
    end
end
__LoadCamera()

local function __LoadLegitbot()

    do
        local FovGui = Instance.new("ScreenGui")
        FovGui.Name = "LegitFOVCircles"
        FovGui.DisplayOrder = 999
        FovGui.ResetOnSpawn = false
        FovGui.IgnoreGuiInset = true
        FovGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        pcall(function()
            FovGui.Parent = (gethui and gethui()) or CoreGui
        end)

        local function BuildFov(Name)
            local Container = Instance.new("Frame")
            Container.Name = Name
            Container.BackgroundTransparency = 1
            Container.BorderSizePixel = 0
            Container.Visible = false
            Container.AnchorPoint = Vector2.new(0.5, 0.5)
            Container.Parent = FovGui

            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new(1, 0, 1, 0)
            Fill.BackgroundColor3 = Color3.new(1, 1, 1)
            Fill.BackgroundTransparency = 0.75
            Fill.BorderSizePixel = 0
            Fill.Visible = false
            Fill.ZIndex = 1
            Fill.Parent = Container

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(1, 0)
            FillCorner.Parent = Fill

            local FillGrad = Instance.new("UIGradient")
            FillGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180)),
            })
            FillGrad.Parent = Fill

            local Outline = Instance.new("Frame")
            Outline.Size = UDim2.new(1, 0, 1, 0)
            Outline.BackgroundTransparency = 1
            Outline.BorderSizePixel = 0
            Outline.ZIndex = 2
            Outline.Parent = Container

            local OutlineCorner = Instance.new("UICorner")
            OutlineCorner.CornerRadius = UDim.new(1, 0)
            OutlineCorner.Parent = Outline

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.new(1, 1, 1)
            Stroke.Thickness = 2
            Stroke.Transparency = 0.15
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Parent = Outline

            local StrokeGrad = Instance.new("UIGradient")
            StrokeGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180)),
            })
            StrokeGrad.Parent = Stroke

            return {
                Container = Container,
                Fill = Fill,
                FillGrad = FillGrad,
                Stroke = Stroke,
                StrokeGrad = StrokeGrad,
            }
        end

        local Circles = {
            Aim = BuildFov("AimAssistFOV"),
            Silent = BuildFov("SilentAimFOV"),
            Trigger = BuildFov("TriggerBotFOV"),
        }
        Legitbot.FOVCircles = Circles

        local function FlagColor(Name, Fallback)
            local F = Flags[Name]
            if F and typeof(F.Color) == "Color3" then return F.Color end
            if F and typeof(F.Value) == "Color3" then return F.Value end
            return Fallback
        end

        local function FlagNum(Name, Fallback)
            local F = Flags[Name]
            if F and type(F.Value) == "number" then return F.Value end
            return Fallback
        end

        local function FlagBool(Name)
            local F = Flags[Name]
            return F and F.Value == true
        end

        local function DegreesToRadius(Degrees)
            local CamFov = CurrentCamera and CurrentCamera.FieldOfView or 70
            if CamFov < 1 then CamFov = 70 end
            local Deg = type(Degrees) == "number" and Degrees or 10
            local Viewport = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(ScreenX, ScreenY)
            return (Deg / CamFov) * (Viewport.Y * 0.5)
        end

        local function UpdateOne(Obj, Prefix, FovFlag)
            if not Obj then return end
            local Show = FlagBool(Prefix .. " Show FOV")
            local Enabled = false
            if Prefix == "AimAssist" then
                Enabled = FlagBool("AimAssist Enabled")
            elseif Prefix == "SilentAim" then
                Enabled = FlagBool("SilentAim Enabled")
            elseif Prefix == "TriggerBot" then
                Enabled = FlagBool("TriggerBot Enabled")
            end
            if not (Show and Enabled) then
                Obj.Container.Visible = false
                return
            end

            local FovDeg = FlagNum(FovFlag, 15)
            local Radius = DegreesToRadius(FovDeg)
            if Radius < 4 then Radius = 4 end

            local MouseLoc = UserInputService:GetMouseLocation()
            Obj.Container.Visible = true
            Obj.Container.Size = UDim2.fromOffset(Radius * 2, Radius * 2)
            Obj.Container.Position = UDim2.fromOffset(MouseLoc.X, MouseLoc.Y)

            local FillOn = FlagBool(Prefix .. " FOV Fill")
            Obj.Fill.Visible = FillOn
            Obj.Fill.BackgroundTransparency = FlagNum(Prefix .. " FOV Fill Trans", 0.75)

            Obj.Stroke.Thickness = FlagNum(Prefix .. " FOV Thickness", 2)
            Obj.Stroke.Transparency = FlagNum(Prefix .. " FOV Outline Trans", 0.15)

            local O1 = FlagColor(Prefix .. " FOV Outline 1", Color3.fromRGB(255, 255, 255))
            local O2 = FlagColor(Prefix .. " FOV Outline 2", Color3.fromRGB(180, 180, 180))
            local F1 = FlagColor(Prefix .. " FOV Fill 1", Color3.fromRGB(255, 255, 255))
            local F2 = FlagColor(Prefix .. " FOV Fill 2", Color3.fromRGB(180, 180, 180))

            pcall(function()
                Obj.StrokeGrad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, O1),
                    ColorSequenceKeypoint.new(1, O2),
                })
                Obj.StrokeGrad.Rotation = FlagNum(Prefix .. " FOV Outline Rot", 45)
                Obj.FillGrad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, F1),
                    ColorSequenceKeypoint.new(1, F2),
                })
                Obj.FillGrad.Rotation = FlagNum(Prefix .. " FOV Fill Rot", 90)
            end)
        end

        Legitbot.UpdateFOVCircles = function()
            UpdateOne(Circles.Aim, "AimAssist", "AimAssist Fov")
            UpdateOne(Circles.Silent, "SilentAim", "SilentAim Fov")
            UpdateOne(Circles.Trigger, "TriggerBot", "TriggerBot FOV")
        end

        RunService.RenderStepped:Connect(function()
            if Legitbot.UpdateFOVCircles then
                pcall(Legitbot.UpdateFOVCircles)
            end
        end)
    end

    local RoundInterface = Shared.RoundSystemClientInterface

    local Acceleration = Shared.Acceleration
    if typeof(Acceleration) ~= "Vector3" then
        Acceleration = NewVector3(0, -196.2, 0)
    end
    local NegativeAcceleration = -Acceleration

    local Gravity = Workspace.Gravity / 2

    do
        Legitbot.Param = NewRayParams()
        Legitbot.Param.FilterType = Enum.RaycastFilterType.Include
        Legitbot.Param.IgnoreWater = true
        Legitbot.Param.FilterDescendantsInstances = { Map }

        Legitbot.Get = LPH_JIT_MAX(function(Options : Table)
            local LocalInfo = Info.LocalPlayer

            if not LocalInfo.Alive then return end

            local Weapon = LocalInfo.Weapon

            if not Weapon then return end

            local BarrelPart = Weapon._barrelPart

            if not BarrelPart then return end

            local Origin = BarrelPart.Position

            local InfoPlayers = Info.Players

            local CameraCFrame = CurrentCamera.CFrame
            local CameraPosition = CameraCFrame.Position
            local CameraLookVector = CameraCFrame.LookVector

            local FovValue = Options.FOV
            local AutoWall = Options.AutoWall

            local MaxDistance = Options.MaxDistance
            local PriorityOnly = Options.PriorityOnly

            local VisibleCheck = Options.Visible
            local RandomiseHitpart = Options.RandomiseHitpart

            local HitpartOption = Options.Hitpart
            local Closest = Find(HitpartOption, "Closest")

            local RadFov = ToRad * FovValue

            local Enemies = {}

            for i = 1, #InfoPlayers do
                local This = InfoPlayers[i]

                if
                    not This.Alive or
                    (PriorityOnly and not This.Priority) or
                    This.Whitelist or
                    This.Teammate or
                    This.Distance > MaxDistance
                then
                    continue
                end

                Enemies[#Enemies + 1] = This
            end

            local EnemiesAmount = #Enemies
            if EnemiesAmount < 1 then return end

            local Targets = {}

            for i = 1, EnemiesAmount do
                local This = Enemies[i]

                local FirstOption
                local Hitpart
                local HitpartPositon

                local SortedHitparts = {}

                for Index, Part in next, This.BodyParts do
                    if not Closest and not Find(HitpartOption, Index) then continue end

                    local HitPosition = Part.Position

                    if VisibleCheck and not Legitbot.IsVisible(Origin, HitPosition, AutoWall) then continue end

                    local NewData = {
                        Part,
                        Acos(Dot(CameraLookVector, (Part.Position - CameraPosition).Unit)) * 2,
                        Index,
                        HitPosition
                    }

                    SortedHitparts[#SortedHitparts + 1] = NewData

                    if not FirstOption then
                        FirstOption = NewData
                    end
                end

                local SortedCount = #SortedHitparts

                if SortedCount < 1 then continue end

                Sort(SortedHitparts, function(A, B)
                    return A[2] < B[2]
                end)

                if not Closest and RandomiseHitpart then
                    local Data = SortedHitparts[Random(1, SortedCount)]

                    Hitpart = Data[1]
                    HitpartPositon = Data[4]
                else
                    local Data = SortedHitparts[Closest and 1 or Find(SortedHitparts, FirstOption)]

                    Hitpart = Data[1]
                    HitpartPositon = Data[4]
                end

                local Angle = Acos(Dot(CameraLookVector, (HitpartPositon - CameraPosition).Unit)) * 2

                if FovValue >= 90 or Angle <= RadFov then
                    Targets[#Targets + 1] = { This, Hitpart, HitpartPositon, Angle }
                end
            end

            local TargetsAmount = #Targets
            if TargetsAmount < 1 then return end

            Sort(Targets, function(A, B)
                return A[4] < B[4]
            end)

            local FinalTarget = Targets[1]
            local ThisTarget = FinalTarget[1]

            local PreviousTarget = Options.PreviousTarget
            local NewTarget = ThisTarget ~= PreviousTarget

            local Switched = NewTarget and true or false

            if Options.Selection == "Lock" then
                if PreviousTarget and NewTarget then
                    local Found

                    for i = 1, TargetsAmount do
                        local Target = Targets[i]

                        if Target[1] == PreviousTarget then
                            Found = Target

                            break
                        end
                    end

                    if Found then
                        FinalTarget = Found
                        ThisTarget = Found[1]

                        Switched = true
                    end
                end
            else
                local SwitchDelay = Options.SwitchDelay

                if
                    SwitchDelay and
                    SwitchDelay ~= 0 and
                    PreviousTarget and
                    NewTarget and
                    (Tick() - (Options.PreviousTime or 0)) < SwitchDelay
                then
                    local Found

                    for i = 1, TargetsAmount do
                        local Target = Targets[i]

                        if Target[1] == PreviousTarget then
                            Found = Target

                            break
                        end
                    end

                    if Found then
                        FinalTarget = Found
                        ThisTarget = Found[1]

                        Switched = true
                    end
                end
            end

            return {
                ThisTarget,
                FinalTarget[2],
                FinalTarget[3],
                Switched
            }
        end)

        Legitbot.IsVisible = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3, AutoWall : Boolean)
            if typeof(Origin) ~= "Vector3" or typeof(Position) ~= "Vector3" then
                return false
            end

            local Delta = Position - Origin
            local Dist = Delta.Magnitude
            if Dist < 0.05 then
                return true
            end

            if AutoWall then
                local LocalInfo = Info.LocalPlayer
                local Penetration = LocalInfo and LocalInfo.Penetration
                local BulletSpeed = LocalInfo and LocalInfo.BulletSpeed

                if type(Penetration) ~= "number" or Penetration <= 0 then
                    AutoWall = false
                elseif type(BulletSpeed) ~= "number" or BulletSpeed <= 0 then
                    AutoWall = false
                end

                if AutoWall then
                    local Acc = Acceleration
                    local NegAcc = NegativeAcceleration
                    if typeof(Acc) ~= "Vector3" then
                        Acc = Shared.Acceleration
                        if typeof(Acc) ~= "Vector3" then
                            Acc = NewVector3(0, -196.2, 0)
                        end
                        NegAcc = -Acc
                    end

                    local Trajectory = Mathematics.GetTrajectory(Origin, Position, NegAcc, BulletSpeed)
                    if typeof(Trajectory) ~= "Vector3" then
                        return false
                    end

                    local Ok, Result = pcall(Shared.BulletCheck, Origin, Position, Trajectory, Acc, Penetration)
                    return Ok and Result == true
                end
            end

            local Direction = Delta.Unit * Dist
            local Params = Legitbot.Param
            local Result
            if Params then
                Result = Raycast(Workspace, Origin, Direction, Params)
            else
                Result = Raycast(Workspace, Origin, Direction)
            end
            return Result == nil
        end)

        Legitbot.Init = function()
            SilentAim.Init()
            AimAssist.Init()
            TriggerBot.Init()
        end
    end

    do
        SilentAim.LastTime = 0

        SilentAim.GetSpread = function(Amount : Number)
            return NewVector3(Random(), Random(), Random()) * Amount
        end

        SilentAim.Predict = function(Origin : Vector3, Position : Vector3, Spread : Vector3, Velocity : Vector3, BulletVelocity : Number)
            local _, TimeHit = Mathematics.GetTrajectory(Origin, Position, NegativeAcceleration, BulletVelocity)

            return (Position + (Velocity * TimeHit) + NewVector3(0, Gravity * TimeHit ^ 2, 0)) + Spread
        end

        SilentAim.Init = function()
            local GetValue; GetValue = HookFunction(Shared.PlayerSettingsInterface.getValue, LPH_NO_UPVALUES(function(...)
                if CheckCaller() then
                    return GetValue(...)
                end

                local FunctionInfo = GetInfo(3)
                local FunctionName = FunctionInfo.name

                if
                    StringFind(FunctionInfo.source, "FirearmObject") and
                    (not FunctionName or FunctionInfo.name == "") and
                    Flags["SilentAim Enabled"].Value and
                    Flags["SilentAim Hitchance"].Value >= Random(1, 100)
                then
                    local BulletVelocity = Info.LocalPlayer.BulletSpeed

                    if not BulletVelocity then
                        return GetValue(...)
                    end

                    local SilentAutoWall = Flags["SilentAim AutoWall"] and Flags["SilentAim AutoWall"].Value == true
                    local Data = Legitbot.Get({
                        Visible = true,
                        AutoWall = SilentAutoWall,
                        PriorityOnly = false,
                        Hitpart = MultiToList(Flags["SilentAim Hitpart"].Value),
                        RandomiseHitpart = true,
                        MaxDistance = Flags["SilentAim MaxDistance"].Value,
                        FOV = Flags["SilentAim Fov"].Value,
                        Selection = (Flags["SilentAim Selection"] and Flags["SilentAim Selection"].Value) or "Adaptive",
                        PreviousTarget = SilentAim.LastTarget,
                        PreviousTime = SilentAim.LastTime,
                        SwitchDelay = Flags["SilentAim SwitchDelay"].Value / 1000
                    })

                    if not Data then
                        return GetValue(...)
                    end

                    local Target = Data[1]
                    local Hitpart = Data[2]

                    if not Target or not Hitpart then
                        return GetValue(...)
                    end

                    if Data[4] then
                        SilentAim.LastTarget = Target
                        SilentAim.LastTime = Tick()
                    end

                    SilentAim.LastTarget = Target
                    SilentAim.LastTime = Tick()

                    local Velocity = Target.Entry._posspring.v

                    local HitPosition = Hitpart.Position

                    local Spread = Flags["SilentAim Spread Amount"].Value / 100

                    for Index, Value in next, GetStack(3) do
                        if typeof(Value) ~= "CFrame" then continue end

                        local Origin = Value.Position

                        SetStack(3, Index, NewCFrame(Origin, SilentAim.Predict(Origin, HitPosition, SilentAim.GetSpread(Spread), Velocity, BulletVelocity)))
                    end
                end

                return GetValue(...)
            end))
        end
    end

    do
        AimAssist.LastTime = 0

        AimAssist.LastVelocity = EmptyVector3

        AimAssist.Predict = function(Hitpart : Instance, Position : Vector3)
            local Velocity = Hitpart.AssemblyLinearVelocity

            AimAssist.LastVelocity = Velocity

            return Position + Velocity * 0.25 + 0.5 * (Velocity - AimAssist.LastVelocity) * 0.25 ^ 2
        end

        AimAssist.RenderStepped = LPH_JIT_MAX(function()
            if
                not Flags["AimAssist Enabled"].Value or
                not Info.LocalPlayer.Alive or
                not IsRBXActive() or
                UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter
            then
                return
            end

            local Data = Legitbot.Get({
                Visible = Flags["AimAssist VisibleCheck"].Value,
                AutoWall = false,
                PriorityOnly = Flags["AimAssist PriorityOnly"].Value,
                Hitpart = MultiToList(Flags["AimAssist Hitparts"].Value),
                RandomiseHitpart = false,
                MaxDistance = Flags["AimAssist MaxDistance"].Value,
                FOV = Flags["AimAssist Fov"].Value,
                Selection = Flags["AimAssist Selection"].Value,
                PreviousTarget = AimAssist.LastTarget,
                PreviousTime = AimAssist.LastTime,
                SwitchDelay = Flags["AimAssist SwitchDelay"].Value / 1000
            })

            if not Data then return end

            local Target = Data[1]
            local Hitpart = Data[2]

            if not Target or not Hitpart then return end

            if Flags["AimAssist Require Mouse"].Value and UserInputService:GetMouseDelta() == EmptyVector2 then return end

            if Data[4] then
                AimAssist.LastTarget = Target
                AimAssist.LastTime = Tick()
            end

            local Position = Camera.WorldToViewportPoint(AimAssist.Predict(Hitpart, Data[3]))

            Position = NewVector2(Position.X - ScreenX / 2, Position.Y - ScreenY / 2)

            local DX, DY = Position.X, Position.Y
            local Mag = math.sqrt(DX * DX + DY * DY)

            if Flags["AimAssist Curve Enabled"] and Flags["AimAssist Curve Enabled"].Value and Mag > 0.5 then
                local Curve = 1
                local CurveOpt = Options["AimAssist Curve"] or Flags["AimAssist Curve"]
                if CurveOpt and type(CurveOpt.Value) == "number" then
                    Curve = CurveOpt.Value
                end
                if type(Curve) ~= "number" or Curve < 0.1 then Curve = 1 end
                local Norm = math.clamp(Mag / 150, 0.01, 1)
                local Factor = Norm ^ (1 / Curve)
                DX, DY = DX * Factor, DY * Factor
            end

            local SmoothPct = 50
            if Flags["AimAssist Smoothness"] and type(Flags["AimAssist Smoothness"].Value) == "number" then
                SmoothPct = Flags["AimAssist Smoothness"].Value
            end
            SmoothPct = math.clamp(SmoothPct, 0, 100)
            local Div = 1 + (SmoothPct / 100) * 24
            DX, DY = DX / Div, DY / Div

            if MouseMoveRel then
                MouseMoveRel(DX, DY)
            end
        end)

        AimAssist.Init = function()
            RenderStepped:Connect(AimAssist.RenderStepped)
        end
    end

    do
        TriggerBot.IsShooting = false
        TriggerBot.Holding = false
        TriggerBot.LastWeapon = nil

        local function TriggerRelease(Weapon)
            if TriggerBot.Holding then
                local W = Weapon or TriggerBot.LastWeapon
                if W then
                    pcall(function()
                        W:shoot(false)
                    end)
                end
                TriggerBot.Holding = false
            end
            TriggerBot.IsShooting = false
        end

        TriggerBot.Step = LPH_JIT_MAX(function()
            local LocalInfo = Info.LocalPlayer
            local Weapon = LocalInfo.Weapon

            local function Abort()
                TriggerRelease(Weapon)
            end

            if
                not Flags["TriggerBot Enabled"] or
                not Flags["TriggerBot Enabled"].Value or
                not Weapon or
                not IsRBXActive() or
                LocalInfo.WeaponType ~= "Firearm" or
                (type(Weapon._magCount) == "number" and Weapon._magCount < 1) or
                RoundInterface.roundLock
            then
                Abort()
                return
            end

            local Key = Options and Options["Triggerbot Keybind"]
            if Key and Key.GetState and not Key:GetState() then
                Abort()
                return
            end

            local TriggerAutoWall = Flags["TriggerBot AutoWall"] and Flags["TriggerBot AutoWall"].Value == true
            local Data = Legitbot.Get({
                Visible = true,
                AutoWall = TriggerAutoWall,
                PriorityOnly = false,
                Hitpart = MultiToList(Flags["TriggerBot Hitpart"].Value),
                RandomiseHitpart = true,
                MaxDistance = Flags["TriggerBot MaxDistance"].Value,
                FOV = Flags["TriggerBot FOV"].Value,
                Selection = "Adaptive"
            })

            local HasTarget = Data and Data[2]

            if not HasTarget then
                Abort()
                return
            end

            if Flags["TriggerBot ShootChance"] and Flags["TriggerBot ShootChance"].Value < Random(1, 100) then
                return
            end

            if Tickbase.GetTick() <= (Weapon._nextShot or 0) then
                return
            end

            if TriggerBot.Holding then
                return
            end

            if TriggerBot.IsShooting then
                return
            end

            TriggerBot.IsShooting = true
            TriggerBot.LastWeapon = Weapon

            local Reaction = 0
            if Flags["TriggerBot Reaction Time"] and type(Flags["TriggerBot Reaction Time"].Value) == "number" then
                Reaction = Flags["TriggerBot Reaction Time"].Value / 1000
            end

            if Reaction > 0 then
                task.wait(Reaction)
            end

            if not Flags["TriggerBot Enabled"].Value then
                Abort()
                return
            end

            Data = Legitbot.Get({
                Visible = true,
                AutoWall = TriggerAutoWall,
                PriorityOnly = false,
                Hitpart = MultiToList(Flags["TriggerBot Hitpart"].Value),
                RandomiseHitpart = true,
                MaxDistance = Flags["TriggerBot MaxDistance"].Value,
                FOV = Flags["TriggerBot FOV"].Value,
                Selection = "Adaptive"
            })

            if not (Data and Data[2]) then
                Abort()
                return
            end

            Weapon = Info.LocalPlayer.Weapon or Weapon
            if not Weapon then
                Abort()
                return
            end

            TriggerBot.LastWeapon = Weapon
            pcall(function()
                Weapon:shoot(true)
            end)
            TriggerBot.Holding = true

            local IsAuto = false
            pcall(function()
                local Mode = Weapon:getWeaponStat("firemode") or Weapon:getWeaponStat("firemodes")
                if type(Mode) == "string" then
                    local LowerMode = string.lower(Mode)
                    IsAuto = LowerMode == "auto" or LowerMode == "automatic" or LowerMode == "fullauto"
                elseif type(Mode) == "table" then
                    for _, M in next, Mode do
                        if type(M) == "string" then
                            local LowerMode = string.lower(M)
                            if LowerMode == "auto" or LowerMode == "automatic" or LowerMode == "fullauto" then
                                IsAuto = true
                                break
                            end
                        end
                    end
                end
            end)

            if not IsAuto then
                task.defer(function()
                    task.wait(0.03)
                    TriggerRelease(Weapon)
                end)
            end
            TriggerBot.IsShooting = false
        end)

        TriggerBot.Init = function()
            Stepped:Connect(TriggerBot.Step)
        end
    end
end
__LoadLegitbot()

local function __LoadRagebot()
    local NetworkClient = Shared.NetworkClient
    local RoundInterface = Shared.RoundSystemClientInterface
    local BulletInterface = Shared.BulletInterface
    local AudioSystem = Shared.AudioSystem
    local Effects = Shared.Effects
    local CameraInterface = Shared.CameraInterface
    local HudSpottingInterface = Shared.HudSpottingInterface
    local HudStatusInterface = Shared.HudStatusInterface
    local HudCrosshairsInterface = Shared.HudCrosshairsInterface
    local Acceleration = Shared.Acceleration
    if typeof(Acceleration) ~= "Vector3" then
        Acceleration = NewVector3(0, -196.2, 0)
    end
    local NegativeAcceleration = -Acceleration
    local BulletLifetime = Shared.PublicSettings.bulletLifeTime

    Ragebot.Cycle = 1

    Ragebot.Cardinals = {
        NewVector3(0, 1, 0),
        NewVector3(0, -1, 0),

        NewVector3(0, 0, 1),
        NewVector3(0, 0, -1),

        NewVector3(1, 0, 0),
        NewVector3(-1, 0, 0)
    }

    Ragebot.GetSpherePositions = LPH_JIT_MAX(function(Positions : Table, Position : Vector3, PointAmount : Number, Radius : Number)
        local PositionX = Position.X
        local PositionY = Position.Y
        local PositionZ = Position.Z

        local StartIndex = #Positions

        for i = 1, PointAmount do
            local Cosine = Random() * 2 - 1
            local SineComponent = Radius * ((1 - Cosine * Cosine) ^ 0.5)
            local Theta = Random() * TwoPi

            Positions[StartIndex + i] = NewVector3(
                PositionX + SineComponent * Cos(Theta),
                PositionY + SineComponent * Sin(Theta),
                PositionZ + Radius * Cosine
            )
        end

        return Positions
    end)

    Ragebot.GetCardinalPositions = LPH_JIT_MAX(function(Positions : Table, Position : Vector3, PointAmount : Number, Radius : Number, Target : Table)
        local Cardinals = Ragebot.Cardinals

        local StartIndex = #Positions

        for i = 1, PointAmount do
            Positions[StartIndex + i] = Position + (Cardinals[Target.Cardinal] * Radius)

            Target.Cardinal = Target.Cardinal % 6 + 1
        end

        return Positions
    end)

    Ragebot.GetRandomPositions = LPH_JIT_MAX(function(Positions : Table, Position : Vector3, PointAmount : Number, Radius : Number)
        local PositionX = Position.X
        local PositionY = Position.Y
        local PositionZ = Position.Z

        local StartIndex = #Positions

        for i = 1, PointAmount do
            local Distance = Radius * (Random() ^ (1 / 3))

            local Cosine = Random() * 2 - 1
            local SineComponent = Distance * ((1 - Cosine * Cosine) ^ 0.5)
            local Theta = Random() * TwoPi

            Positions[StartIndex + i] = NewVector3(
                PositionX + SineComponent * Cos(Theta),
                PositionY + SineComponent * Sin(Theta),
                PositionZ + Distance * Cosine
            )
        end

        return Positions
    end)

    Ragebot.GetPeekPositions = LPH_JIT_MAX(function(Positions : Table, Origin : Vector3, PointAmount : Number, Radius : Number, Fill : Boolean, Grounded : Boolean, AllowUpPeek : Boolean)
        local DistanceY = Min(15, Radius)

        if Grounded then
            for _ = 1, PointAmount do
                local Distance = (Fill and (Radius * (Random() ^ 0.5)) or Radius)
                local Theta = Random() * TwoPi

                local Point = Origin + NewVector3(Cos(Theta) * Distance, AllowUpPeek and DistanceY * (Random() ^ 0.5) or 0, Sin(Theta) * Distance)
                local Direction = (Point - Origin)

                local Result = Raycasting.Raycast(Origin, Direction, { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Raycasting.CheckResult)

                if Result then
                    Point = Origin + (Direction.Unit * ((Result.Position - Origin).Magnitude - 1))
                end

                local DownResult = Raycasting.Raycast(Point, NewVector3(0, -1000, 0), { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Raycasting.CheckResult)

                if DownResult then
                    Point = NewVector3(Point.X, DownResult.Position.Y + 2, Point.Z)
                end

                Positions[#Positions + 1] = {
                    Origin,
                    Point
                }
            end
        else
            for _ = 1, PointAmount do
                local Distance = (Fill and (Radius * (Random() ^ 0.5)) or Radius)
                local Theta = Random() * TwoPi

                local Point = Origin + NewVector3(Cos(Theta) * Distance, AllowUpPeek and DistanceY * (Random() ^ 0.5) or 0, Sin(Theta) * Distance)
                local Direction = (Point - Origin)

                local Result = Raycasting.Raycast(Origin, Direction, { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers }, Raycasting.CheckResult)

                if Result then
                    Point = Origin + (Direction.Unit * ((Result.Position - Origin).Magnitude - 1))
                end

                Positions[#Positions + 1] = {
                    Origin,
                    Point
                }
            end
        end

        return Positions
    end)

    Ragebot.GetPoints = LPH_JIT_MAX(function(Positions : Table, Modes : Table, Position : Vector3, PointAmount : Number, Radius : Number, Target : Table)
        if type(Modes) ~= "table" or #Modes < 1 then Modes = {"Sphere"} end
        PointAmount /= #Modes

        local Cardinals = Clamp(PointAmount, 1, 6)
        local Addition = PointAmount - Cardinals

        if Addition < 1 then
            Addition = 0
        end

        if Find(Modes, "Sphere") then
            Ragebot.GetSpherePositions(Positions, Position, Ceil(PointAmount + Addition), Radius)
        end

        if Find(Modes, "Cardinals") then
            Ragebot.GetCardinalPositions(Positions, Position, Floor(Cardinals), Radius, Target)
        end

        if Find(Modes, "Random") then
            Ragebot.GetRandomPositions(Positions, Position, Floor(Max(PointAmount, 1)), Radius)
        end

        return Positions
    end)

    Ragebot.Resolve = LPH_JIT_MAX(function(Frames : Table, TimeAmount : Number, ScanAmount : Number, SortType : String)
        local Amount = #Frames

        if Amount < 2 then
			return Frames
		end

        TimeAmount -= Tickbase.GetPing(true)

        local LastFrame = Frames[Amount]
        local PreviousFrame

        local ChokePoint
        local RealPoint

        for i = Amount, 1, -1 do
            local Frame = Frames[i]

            if RealPoint and ChokePoint then
                break
            end

            if PreviousFrame then
                local Skip = false

                if
                    not RealPoint and
                    (PreviousFrame[2] - Frame[2]) < 0.5
                then
                    RealPoint = i

                    Skip = true
                end

                if
                    not Skip and
                    not ChokePoint and (PreviousFrame[2] - Frame[2]) > 2 and
                    (PreviousFrame[1] - Frame[1]).Magnitude >= 5
                then
                    ChokePoint = i
                end

                PreviousFrame = Frame
            else
                PreviousFrame = Frame
            end
        end

        if ChokePoint then
            if RealPoint and RealPoint > ChokePoint then
                if RealPoint == Amount then
                    return { Frames[RealPoint] }
                else
                    local RealFrames = {}

                    for i = Amount, 1, -1 do
                        if i >= RealPoint then
                            local Frame = Frames[i]

                            if (Clock() - Frame[2]) <= TimeAmount then
                                RealFrames[#RealFrames + 1] = Frame
                            end
                        end
                    end

                    if #RealFrames < 1 then
                        return { Frames[RealPoint] }
                    end

                    return RealFrames
                end
            end

            return { Frames[ChokePoint] }
        end

        local StartTime = Clock()

        if (StartTime - LastFrame[2]) > 4.95 then
            return { LastFrame }
        end

        local Points = {}
        local Scans = 0

        Points[1] = LastFrame

        ScanAmount -= 1

        if SortType == "Chronological" then
            for i = 1, Amount do
                if Scans > ScanAmount then break end

                local Frame = Frames[i]

                if Frame ~= LastFrame and (StartTime - Frame[2]) <= TimeAmount then
                    Scans += 1

                    Points[Scans] = Frame
                end
            end
        elseif SortType == "Reverse Chronological" then
            for i = Amount, 1, -1 do
                if Scans > ScanAmount then break end

                local Frame = Frames[i]

                if Frame ~= LastFrame and (StartTime - Frame[2]) <= TimeAmount then
                    Scans += 1

                    Points[Scans] = Frame
                end
            end
        elseif SortType == "Random" then
            local ValidFrames = {}

            for i = 1, Amount do
                local Frame = Frames[i]

                if Frame ~= LastFrame and (StartTime - Frame[2]) <= TimeAmount then
                    Scans += 1

                    ValidFrames[Scans] = Frame
                end
            end

            for _ = 1, Min(Scans, ScanAmount) do
                local Index = Random(1, Scans)

                Points[#Points + 1] = ValidFrames[Index]

                Remove(ValidFrames, Index)
            end
        end

        return Points
    end)

    Ragebot.CanShoot = LPH_JIT_MAX(function(Weapon : Table, WeaponData : Table)
        if RoundInterface.roundLock then
            return false
        end

        if Weapon._magCount < 1 then
            local ReloadCount = WeaponData["magsize"]

            if ReloadCount > 0 and Weapon._spareCount > 0 then
                NetworkClient:send("reload")
            end

            if ReloadCount < Weapon._spareCount then
                Weapon._magCount += ReloadCount
                Weapon._spareCount -= ReloadCount
            else
                Weapon._magCount += Weapon._spareCount
                Weapon._spareCount = 0
            end

            return false
        end

        return Tickbase.GetTick() > Weapon._nextShot
    end)

    Ragebot.Visualise = LPH_JIT_MAX(function(Origin : Vector3, Trajectory : Vector3, Weapon : Table, WeaponData : Table, Point : String, PelletCount : Number, LocalInfo : Table)
        local InThirdPerson = Visuals.InThirdPerson

        local BulletColor = WeaponData["bulletcolor"] or NewRGB(255, 94, 94)
        local BulletBrightness = WeaponData["bulletbrightness"] or 400
        local Tracerless = WeaponData["tracerless"]

        local GunType = WeaponData["type"]
        local PenetrationDepth = WeaponData["penetrationdepth"]

        local ShellOffset = WeaponData["shelloffset"]
        local HeatFirerateKick = WeaponData["heatfireratekick"]

        local UniqueId = Weapon.uniqueId

        local Barrel = Weapon._barrelPart
        local BarrelOrigin = InThirdPerson and Origin or Barrel.Position

        local MainCamera = CameraInterface.getActiveCamera("MainCamera")

        for i = PelletCount, 1, -1 do
            BulletInterface.newBullet({
                position = Origin,
                velocity = Trajectory,
                acceleration = Acceleration,
                color = BulletColor,
                size = 0.2,
                bloom = 0.005,
                brightness = BulletBrightness,
                life = BulletLifetime,
                visualorigin = BarrelOrigin,
                physicsignore = { Terrain, MapIgnore, CurrentCamera, WorkspacePlayers },
                dt = Tickbase.GetTick() - Weapon._nextShot,
                penetrationdepth = PenetrationDepth,
                tracerless = Tracerless,
                onplayerhit = EmptyFunction,
                extra = {
                    playersHit = {},
                    bulletTicket = Weapon._fireCount - i,
                    firstHits = {},
                    firearmObject = Weapon,
                    uniqueId = UniqueId
                },
                ontouch = function(Bullet, Part, Position, Point, Normal, Intersection)
                    if Part.Anchored then
                        if Part.Name == "Window" then
                            Effects.breakwindow(Part, Bullet.extra.bulletTicket)
                        end

                        Effects.bullethit(Part, Position, Point, Normal, Intersection, Bullet.velocity, true, true, true)
                    end
                end
            })
        end

        local Recoil = (1 - Weapon._firemodeStability) * (1 - Weapon._characterObject.stability)

        Weapon._chokeSpring.a = WeaponData["variablechoke"] or 0

        if HeatFirerateKick and not Weapon:shouldIgnoreHeatFirerate() then
            Weapon._heatFirerateSpring.a = HeatFirerateKick
        end

        Weapon._translationSprings:applyImpulse(nil, Recoil)
        Weapon._rotationSprings:applyImpulse(nil, Recoil)

        if MainCamera then
            MainCamera:applyImpulse(Recoil)
        end

        Delay(0.4, function()
            if GunType == "SNIPER" then
                AudioSystem.play("metalshell", 12, 0.15, 0.8)
            elseif GunType == "SHOTGUN" then
                Wait(0.3)

                AudioSystem.play("shotgunshell", 12, 0.2)
            else
                if GunType ~= "REVOLVER" and not WeaponData["caselessammo"] then
                    AudioSystem.play("metalshell", 12, 0.1)
                end
            end
        end)

        if ShellOffset then
            if not WeaponData["caselessammo"] then
                Effects.ejectshell(Weapon._mainPart.CFrame, WeaponData["casetype"] or WeaponData["ammotype"], ShellOffset, WeaponData["shelldirection"])
            end

            if Weapon._magCount > 0 then
                Weapon:boltKick(1)
            end
        end

        if WeaponData["sniperbass"] then
            AudioSystem.play("1PsniperBass", 1, 0.75)
            AudioSystem.play("1PsniperEcho", 1, 1)
        end

        if not WeaponData["nomuzzleeffects"] then
            local HideFlash = WeaponData["hideflash"]

            Effects.muzzleflash(Barrel, HideFlash, 0.9)

            if not HideFlash then
                Weapon._characterObject._muzzlespring.a = 50
            end
        end

        if not WeaponData["hideminimap"] then
            HudSpottingInterface.goingLoud()
        end

        if not Weapon._aiming then
            HudCrosshairsInterface.fireImpulse(WeaponData["crossexpansion"])
        end

        AudioSystem.playSoundId(WeaponData["firesoundid"], 2, WeaponData["firevolume"], WeaponData["firepitch"], InThirdPerson and LocalInfo.RootPart or Barrel, nil, 0, 0.05)

        HudCrosshairsInterface.fireHitmarker(Point == "Head")
    end)

    Ragebot.Collat = LPH_JIT_MAX(function(Targets : Table, Position : Vector3, Bullets : Table, Player : Player, Unique : Number, PelletCount : Number, Point : String)
        local TimeAmount = 5 - Tickbase.GetPing(true)
        local Collated = 0

        for i = 1, #Targets do
            Spawn(function()
                local Target = Targets[i]

                local TargetPlayer = Target.Player

                if TargetPlayer == Player then return end

                local Frames = Target.Frames

                local ValidFrames = {}

                for k = 1, #Frames do
                    local Frame = Frames[k]

                    if (Clock() - Frame[2]) < TimeAmount then
                        local Distance = (Frame[1] - Position).Magnitude

                        if Distance <= 9.9 then
                            ValidFrames[#ValidFrames + 1] = {
                                TargetPlayer,
                                Distance
                            }
                        end
                    end
                end

                Sort(ValidFrames, function(A, B)
                    return A[2] < B[2]
                end)

                local BestFrame = ValidFrames[1]

                if not BestFrame then return end

                for k2 = 1, PelletCount do
                    NetworkClient:send("bullethit", Unique, BestFrame[1], Position, Point, Bullets[k2][2], Tickbase.GetTick())
                end

                Collated += 1
            end)
        end

        if Collated > 0 then
            if Find(MultiToList(Flags["Event Logs"].Value), "Ragebot Collat") then
                SetThreadIdentity(7)

                Library:Notify(tostring(Format("[Ragebot Collat] Collated %d player(s)", Collated)), Flags["Event Logs Time"].Value)
            end
        end
    end)

    Ragebot.Shoot = LPH_JIT_MAX(function(Weapon : Table, Player : Player, RootPosition : Vector3, Origin : Vector3, Position : Vector3, Trajectory : Vector3, Point : String, PelletCount : Number, FireRate : Number, Targets : Table, Nodes : Table, WeaponData : Table, LocalInfo : Table)
        if Ragebot.CanShoot(Weapon, WeaponData) then
            local Bullets = {}

            local FireCount = Weapon._fireCount

            for i = 1, PelletCount do
                FireCount += 1

                Bullets[i] = {
                    Trajectory,
                    FireCount
                }
            end

            Weapon._fireCount = FireCount

            local Unique = Weapon.uniqueId

            NetworkClient:send("newbullets", Unique, {
                camerapos = Nodes and Origin or RootPosition,
                firepos = Origin,
                bullets = Bullets
            }, Tickbase.GetTick())

            for i = 1, PelletCount do
                NetworkClient:send("bullethit", Unique, Player, Position, Point, Bullets[i][2], Tickbase.GetTick())
            end

            Weapon._nextShot = (Tickbase.GetTick() + FireRate)
            Weapon._magCount -= 1
            Weapon._nShots += 1

            Spawn(function()
                HudStatusInterface.updateAmmo(Weapon)

                Ragebot.Collat(Targets, Position, Bullets, Player, Unique, PelletCount, Point)
                Ragebot.Visualise(Origin, Trajectory, Weapon, WeaponData, Point, PelletCount, LocalInfo)

                if Nodes then
                    Wait((1 / 60) + (Flags["Ragebot Autopeek Compensate Ping"].Value and Tickbase.GetPing() or 0))

                    if LocalInfo.RootPart then
                        Spawn(function()
                            if Find(MultiToList(Flags["Event Logs"].Value), "Ragebot Peek") then
                                SetThreadIdentity(7)

                                Library:Notify(tostring(Format("[Ragebot Peek] Retreating from peek [target: %s]", Player.Name)), Flags["Event Logs Time"].Value)
                            end
                        end)

                        local FirstNode = Nodes[1]

                        if FirstNode ~= RootPosition then
                            Insert(Nodes, 1, RootPosition)
                        end

                        local ReverseNodes = {}

                        for i = #Nodes, 1, -1 do
                            ReverseNodes[#ReverseNodes + 1] = Nodes[i]
                        end

                        M.PeekQueue = ReverseNodes

                        repeat Wait() until #M.PeekQueue < 1

                        if LocalInfo.RootPart then
                            LocalInfo.RootPart.Position = RootPosition
                        end

                        Wait(1 / 60)

                        M.IsPeeking = false
                        LocalInfo.BlockRepUpdates = false

                        M.ReverseTime = false
                        M.LastTime = nil
                    end
                end
            end)

            return true
        end

        return false
    end)

    Ragebot.PeekTarget = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3, Player : Player, LocalInfo : Table)
        if
            M.IsPeeking or
            LocalInfo.BlockRepUpdates or
            not LocalInfo.RootPart or
            not Pathfinding.CanTraverse(Origin, Position)
        then
            return false
        end

        Spawn(function()
            if Find(MultiToList(Flags["Event Logs"].Value), "Ragebot Peek") then
                SetThreadIdentity(7)

                Library:Notify(tostring(Format("[Ragebot Peek] Attempting to peek [target: %s]", Player.Name)), Flags["Event Logs Time"].Value)
            end
        end)

        local Nodes = Pathfinding.GenerateNodePath(Origin, Position, 9.5)

        M.IsPeeking = true
        LocalInfo.BlockRepUpdates = true

        M.PeekQueue = Nodes

        repeat Wait() until #M.PeekQueue < 1

        Wait(1 / 60)

        if not LocalInfo.RootPart then
            M.PeekQueue = {}
            M.PeekIndex = 1

            M.IsPeeking = false
            LocalInfo.BlockRepUpdates = false

            return false
        end

        return true, Nodes
    end)

    Ragebot.RenderStepped = LPH_JIT_MAX(function()
        local LocalInfo = Info.LocalPlayer

        if
            not Flags["Ragebot Enabled"].Value or
            not LocalInfo.RootPosition or
            not LocalInfo.Alive or
            LocalInfo.WeaponType ~= "Firearm" or
            RoundInterface.roundLock or
            M.IsPeeking
        then
            return
        end

        local Weapon = LocalInfo.Weapon

        local PriorityOnly = Flags["Ragebot Priority Only"].Value
        local PreventOverfire = Flags["Ragebot Prevent Overfire"].Value

        local InfoPlayers = Info.Players
        local Penetration = LocalInfo.Penetration
        local PelletCount = LocalInfo.PelletCount
        local BulletSpeed = LocalInfo.BulletSpeed
        local FireRate = LocalInfo.FireRate

        local WeaponData = LocalInfo.WeaponData
        local DamageGraph = LocalInfo.DamageGraph
        local HeadMultiplier = WeaponData["multhead"]
        local BodyMultiplier = WeaponData["multtorso"]

        local Enemies = {}

        local Cycle = Ragebot.Cycle

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]

            if
                #This.Frames < 1 or
                This.Whitelist or
                This.Teammate or
                (PreventOverfire and This.PredictedDamage >= This.Health) or
                (PriorityOnly and not This.Priority)
            then
                continue
            end

            local Index = #Enemies + 1

            if Ragebot.ForcedCycle == This.Player then
                Cycle = Index

                Ragebot.ForcedCycle = nil
            end

            Enemies[Index] = This
        end

        local EnemiesAmount = #Enemies
        if EnemiesAmount < 1 then return end

        if Cycle > EnemiesAmount then
            Ragebot.Cycle = 1

            Cycle = 1
        end

        local Enemy = Enemies[Cycle]

        Ragebot.Cycle += 1

        if not Enemy then return end

        local Player = Enemy.Player

        local Points = Ragebot.Resolve(Enemy.Frames, Flags["Ragebot Backtrack Amount"].Value / 1000, Flags["Ragebot Backtrack Scans"].Value, Flags["Ragebot Backtrack Sorting"].Value)

        local PointsCount = #Points
        if PointsCount < 1 then return end

        local PointName = Flags["Ragebot Hitscan Point"].Value

        local OriginPoints = Flags["Ragebot Origin Points"].Value
        local PointPoints = Flags["Ragebot Point Points"].Value
        local PeekPoints = Flags["Ragebot Peek Points"].Value

        local OriginRadius = Flags["Ragebot Origin Radius"].Value
        local PointRadius = Flags["Ragebot Point Radius"].Value
        local PeekRadius = Flags["Ragebot Peek Radius"].Value

        local FillPeek = Flags["Ragebot Fill Peek"].Value

        local AutoPeek = Flags["Ragebot Auto Peek"].Value
        local Grounded = Flags["Ragebot Peek Grounded"].Value
        local AllowUpPeek = Flags["Ragebot Peek Up Peek"].Value

        local ScanModes = MultiToList(Flags["Ragebot Scanning Modes"].Value)
        if #ScanModes < 1 then ScanModes = {"Sphere"} end
        local SortMode = Flags["Ragebot Sort Mode"].Value

        local MaximumScans = Flags["Ragebot Maximum Scans"].Value

        if MaximumScans >= 10000 then
            MaximumScans = Infinite
        end

        local OriginPosition = LocalInfo.RootPosition

        local ScannedPoints = {}
        local ScannedPeeks = {}

        local Origins = {}

        Ragebot.GetPoints(Origins, ScanModes, OriginPosition, OriginPoints, OriginRadius, Enemy)

        for i = 1, PointsCount do
            local PointInfo = Points[i]

            local Point, PointTick = PointInfo[1], PointInfo[2]

            local HitPositions = {}

            Ragebot.GetPoints(HitPositions, ScanModes, Point, PointPoints, PointRadius, Enemy)

            local Direction = (Point - OriginPosition).Unit

            for k = 1, #Origins do
                local Origin = Origins[k]

                for k2 = 1, #HitPositions do
                    local HitPosition = HitPositions[k2]

                    local Distance = (Origin - HitPosition).Magnitude

                    local ShouldCheck = Distance > 0

                    if not ShouldCheck then
                        HitPosition += 0.01 * Direction
                    end

                    ScannedPoints[#ScannedPoints + 1] = {
                        Point,
                        OriginPosition,
                        Origin,
                        HitPosition,
                        Distance,
                        PointTick,
                        ShouldCheck
                    }
                end
            end
        end

        if AutoPeek then
            for i = 1, PointsCount do
                local PointInfo = Points[i]

                local Point, PointTick = PointInfo[1], PointInfo[2]

                local HitPositions = {}

                local Direction = (Point - OriginPosition).Unit

                Ragebot.GetPoints(HitPositions, ScanModes, Point, PointPoints, PointRadius, Enemy)

                for k = 1, #HitPositions do
                    local HitPosition = HitPositions[k]

                    local PeekPositions = {}

                    Ragebot.GetPeekPositions(PeekPositions, OriginPosition, PeekPoints, PeekRadius, FillPeek, Grounded, AllowUpPeek)

                    for k2 = 1, #PeekPositions do
                        local PeekPosition = PeekPositions[k2][2]

                        Origins = {}

                        Ragebot.GetPoints(Origins, ScanModes, PeekPosition, OriginPoints, OriginRadius, Enemy)

                        for j = 1, #Origins do
                            local Origin = Origins[j]

                            local Distance = (Origin - HitPosition).Magnitude

                            local ShouldCheck = Distance > 0

                            if not ShouldCheck then
                                HitPosition += 0.01 * Direction
                            end

                            ScannedPeeks[#ScannedPeeks + 1] = {
                                Point,
                                OriginPosition,
                                Origin,
                                HitPosition,
                                Distance,
                                PointTick,
                                ShouldCheck,
                                PeekPosition
                            }
                        end
                    end
                end
            end
        end

        if SortMode == "Highest Damage" then
            Sort(ScannedPoints, function(A, B)
                return A[5] < B[5]
            end)
        elseif SortMode == "Lowest Origin" then
            Sort(ScannedPoints, function(A, B)
                return (A[3] - A[2]).Magnitude < (B[3] - B[2]).Magnitude
            end)
        elseif SortMode == "Lowest Hit" then
            Sort(ScannedPoints, function(A, B)
                return (A[4] - A[1]).Magnitude < (B[4] - B[1]).Magnitude
            end)
        elseif SortMode == "Most Accurate" then
            Sort(ScannedPoints, function(A, B)
                return ((A[3] - A[2]).Magnitude + (A[4] - A[1]).Magnitude) < ((B[3] - B[2]).Magnitude + (B[4] - B[1]).Magnitude)
            end)
        end

        if AutoPeek then
            Sort(ScannedPeeks, function(A, B)
                return (OriginPosition - A[8]).Magnitude < (OriginPosition - B[8]).Magnitude
            end)
        end

        local Scans = 0

        for i = 1, #ScannedPoints do
            if Scans >= MaximumScans then break end

            local Point = ScannedPoints[i]

            if Ragebot.CanShoot(Weapon, WeaponData) then
                local Origin = Point[3]
                local HitPosition = Point[4]

                local Distance = Point[5]
                local ShouldCheck = Point[7]

                local Acc = Acceleration
                local NegAcc = NegativeAcceleration
                if typeof(Acc) ~= "Vector3" then
                    Acc = Shared.Acceleration
                    if typeof(Acc) ~= "Vector3" then Acc = NewVector3(0, -196.2, 0) end
                    NegAcc = -Acc
                end
                local Trajectory, TimeHit = Mathematics.GetTrajectory(Origin, HitPosition, NegAcc, BulletSpeed)

                if ShouldCheck then
                    Scans += 1
                end

                if typeof(Trajectory) ~= "Vector3" then
                    continue
                end

                if not ShouldCheck or Shared.BulletCheck(Origin, HitPosition, Trajectory, Acc, Penetration) then
                    if Ragebot.Shoot(Weapon, Player, OriginPosition, Origin, HitPosition, Trajectory, PointName, PelletCount, FireRate, Enemies, nil, WeaponData, LocalInfo) then
                        local DamagePoints = #DamageGraph
                        local Damage = DamageGraph[DamagePoints].damage or 0

                        for k = 1, DamagePoints do
                            local CurrentPlace = DamageGraph[k]
                            local CurrentDistance = CurrentPlace.distance

                            if Distance < CurrentDistance then
                                local LastPlace = DamageGraph[k - 1]

                                if LastPlace then
                                    local LastDistance = LastPlace.distance
                                    local Displacement = (Distance - LastDistance) / (CurrentDistance - LastDistance)

                                    Damage = (1 - Displacement) * LastPlace.damage + Displacement * CurrentPlace.damage
                                else
                                    Damage = CurrentPlace.damage
                                end

                                break
                            end
                        end

                        Damage *= (PointName == "Head" and HeadMultiplier) or (PointName == "Torso" and BodyMultiplier) or 1
                        Damage *= PelletCount

                        Damage = Floor(Damage)

                        Enemy.PredictedDamage += Damage

                        Delay(Tickbase.GetPing(true) + TimeHit, function()
                            Enemy.PredictedDamage -= Damage
                        end)

                        if Enemy.PredictedDamage < Enemy.Health then
                            Ragebot.ForcedCycle = Player
                        end

                        return
                    end
                end
            end
        end

        Scans = 0

        for i = 1, #ScannedPeeks do
            if Scans >= MaximumScans then break end

            local Point = ScannedPeeks[i]

            if Ragebot.CanShoot(Weapon, WeaponData) then
                local Origin = Point[3]
                local HitPosition = Point[4]

                local Distance = Point[5]
                local ShouldCheck = Point[7]

                local Acc = Acceleration
                local NegAcc = NegativeAcceleration
                if typeof(Acc) ~= "Vector3" then
                    Acc = Shared.Acceleration
                    if typeof(Acc) ~= "Vector3" then Acc = NewVector3(0, -196.2, 0) end
                    NegAcc = -Acc
                end
                local Trajectory, TimeHit = Mathematics.GetTrajectory(Origin, HitPosition, NegAcc, BulletSpeed)

                if ShouldCheck then
                    Scans += 1
                end

                if typeof(Trajectory) ~= "Vector3" then
                    continue
                end

                if not ShouldCheck or Shared.BulletCheck(Origin, HitPosition, Trajectory, Acc, Penetration) then
                    local Peeked, Nodes = Ragebot.PeekTarget(OriginPosition, Point[8], Player, LocalInfo)

                    if not Peeked or not Nodes then
                        continue
                    end

                    if Ragebot.Shoot(Weapon, Player, OriginPosition, Origin, HitPosition, Trajectory, PointName, PelletCount, FireRate, Enemies, Nodes, WeaponData, LocalInfo) then
                        local DamagePoints = #DamageGraph
                        local Damage = DamageGraph[DamagePoints].damage or 0

                        for k = 1, DamagePoints do
                            local CurrentPlace = DamageGraph[k]
                            local CurrentDistance = CurrentPlace.distance

                            if Distance < CurrentDistance then
                                local LastPlace = DamageGraph[k - 1]

                                if LastPlace then
                                    local LastDistance = LastPlace.distance
                                    local Displacement = (Distance - LastDistance) / (CurrentDistance - LastDistance)

                                    Damage = (1 - Displacement) * LastPlace.damage + Displacement * CurrentPlace.damage
                                else
                                    Damage = CurrentPlace.damage
                                end

                                break
                            end
                        end

                        Damage *= (PointName == "Head" and HeadMultiplier) or (PointName == "Torso" and BodyMultiplier) or 1
                        Damage *= PelletCount

                        Damage = Floor(Damage)

                        Enemy.PredictedDamage += Damage

                        Delay(Tickbase.GetPing(true) + TimeHit, function()
                            Enemy.PredictedDamage -= Damage
                        end)

                        if Enemy.PredictedDamage < Enemy.Health then
                            Ragebot.ForcedCycle = Player
                        end

                        return
                    end
                end
            end
        end
    end)

    Ragebot.Init = function()
        RenderStepped:Connect(Ragebot.RenderStepped)
    end
end
__LoadRagebot()

local function __LoadKnifebot()
    local NetworkClient = Shared.NetworkClient
    local RoundInterface = Shared.RoundSystemClientInterface
    local AudioSystem = Shared.AudioSystem

    Knifebot.NextSwing = 0

    Knifebot.CanStab = LPH_JIT_MAX(function()
        return not RoundInterface.roundLock and Tick() > Knifebot.NextSwing
    end)

    Knifebot.Stab = LPH_JIT_MAX(function(Player : Player, Point : String, Position : Vector3, KnifeEquipped : Boolean, LocalInfo : Table)
        if Knifebot.CanStab() then
            local WeaponIndex = LocalInfo.WeaponIndex

            if not WeaponIndex then return end

            if not KnifeEquipped then
                NetworkClient:send("equip", 3, Tickbase.GetTick())
            end

            NetworkClient:send("stab")

            Knifebot.NextSwing = (Tick() + 0.1)

            NetworkClient:send("knifehit", Player, Point, Position, Tickbase.GetTick())

            if not KnifeEquipped then
                NetworkClient:send("equip", WeaponIndex, Tickbase.GetTick())
            end

            AudioSystem.play(LocalInfo.WeaponData["soundClassification"], 1, 0.25)

            return true
        end

        return false
    end)

    Knifebot.Step = LPH_JIT_MAX(function()
        local LocalInfo = Info.LocalPlayer

        if
            not Flags["Knifebot Enabled"].Value or
            not LocalInfo.RootPart or
            not LocalInfo.Weapon or
            RoundInterface.roundLock or
            M.IsPeeking
        then
            return
        end

        local KnifeOnly = Flags["Knifebot Knife Only"].Value
        local KnifeEquipped = LocalInfo.WeaponType == "Melee"

        if KnifeOnly and not KnifeEquipped then
            return
        end

        local PriorityOnly = Flags["Knifebot Priority Only"].Value

        local InfoPlayers = Info.Players

        local Enemies = {}

        for i = 1, #InfoPlayers do
            local This = InfoPlayers[i]

            if
                #This.Frames < 1 or
                This.Whitelist or
                This.Teammate or
                PriorityOnly and not This.Priority
            then
                continue
            end

            Enemies[#Enemies + 1] = This
        end

        local EnemiesCount = #Enemies
        if EnemiesCount < 1 then return end

        local Points = {}

        for i = 1, EnemiesCount do
            local Enemy = Enemies[i]
            local Frames = Enemy.Frames

            Points[i] = {
                Enemy.Player,
                Frames[#Frames][1],
                Enemy
            }
        end

        local PointsCount = #Points
        if PointsCount < 1 then return end

        local OriginPosition = LocalInfo.RootPosition

        local PointName = Flags["Knifebot Hitbox"].Value

        Sort(Points, function(A, B)
            return (OriginPosition - A[2]).Magnitude < (OriginPosition - B[2]).Magnitude
        end)

        local BestPoint = Points[1]

        if BestPoint then
            local PointPosition = BestPoint[2]

            if (OriginPosition - PointPosition).Magnitude <= Flags["Knifebot Max Range"].Value then
                if Knifebot.Stab(BestPoint[1], PointName, PointPosition, KnifeEquipped, LocalInfo) then return end
            end
        end
    end)

    Knifebot.Init = function()
        Stepped:Connect(Knifebot.Step)
    end
end
__LoadKnifebot()

local function __LoadAntiAim()
    local ReplicationObject = Shared.ReplicationObject

    do
        AntiAim.NextTick = 0
        AntiAim.Addition = 0

        AntiAim.FindBestPosition = LPH_JIT_MAX(function(Origin : Vector3, Position : Vector3, Distance : Number)
            local Samples = {}

            for i = 1, 50 do
                local Angle = Random() * TwoPi

                local Point = Origin + NewVector3(Cos(Angle) * Distance, 0, Sin(Angle) * Distance)

                Samples[i] = { Point, (Point - Position).Magnitude }
            end

            Sort(Samples, function(A, B)
                return A[2] > B[2]
            end)

            return Samples[1][1]
        end)

        AntiAim.FakePosition = LPH_JIT_MAX(function(Send : Function, RealPosition : Vector3, ViewAngles : Vector3, BarrelAngles : Vector3)
            if Tick() >= AntiAim.NextTick then
                local Addition = 4.5 + (Random() * 0.2)

                AntiAim.NextTick = Tick() + Addition
                AntiAim.Addition = Addition

                if not AntiAim.LastFake then
                    AntiAim.LastFake = RealPosition
                end

                local FakePosition = AntiAim.FindBestPosition(RealPosition, AntiAim.LastFake, 9.5)

                local Time = Tickbase.GetTick()

                Send(nil, "repupdate", RealPosition, ViewAngles, BarrelAngles, Time)
                Send(nil, "repupdate", FakePosition, ViewAngles, BarrelAngles, Time)

                AntiAim.LastFake = FakePosition

                local LocalInfo = Info.LocalPlayer

                LocalInfo.RootPosition = FakePosition
                LocalInfo.FakePosition = RealPosition

                LocalInfo.Faked = true

                SetThreadIdentity(7)

                Library:Notify(tostring(Format("[Fake Position] Fake Position sent at a magnitude of %.3fm", (RealPosition - FakePosition).Magnitude)), Flags["Event Logs Time"].Value)
            end
        end)

        AntiAim.GetViewAngles = LPH_JIT_MAX(function(ViewAngles : Vector3, LocalInfo : Table)
            local Pitch = ViewAngles.X
            local Yaw = ViewAngles.Y

            local PitchType = Flags["Anti Aim Pitch"].Value
            local YawType = Flags["Anti Aim Yaw"].Value

            local Jitter = ToRad * (Flags["Anti Aim Jitter"].Value / 4)

            if PitchType == "Full Up" then
                Pitch = 2
            elseif PitchType == "Normal Up" then
                Pitch = 1.5609788497524284
            elseif PitchType == "Half Up" then
                Pitch = 1
            elseif PitchType == "Full Down" then
                Pitch = -2
            elseif PitchType == "Normal Down" then
                Pitch = -1.5609788497524284
            elseif PitchType == "Half Down" then
                Pitch = -1
            elseif PitchType == "Zero" then
                Pitch = 0
            elseif PitchType == "Rotate" then
                Pitch = (Sin(Tick() * (Flags["Anti Aim Pitch Speed"].Value / 2))) * 2
            elseif PitchType == "Randomise" then
                Pitch = Random(-2, 2)
            elseif PitchType == "Custom" then
                Pitch = Flags["Anti Aim Custom Pitch"].Value
            end

            if YawType == "Backwards" then
                Yaw += Pi
            elseif YawType == "Rotate" then
                Yaw = (Tick() * (Flags["Anti Aim Yaw Speed"].Value / 2)) % 12
            elseif YawType == "Spin" then
                local Speed = Flags["Anti Aim Yaw Speed"].Value
                if type(Speed) ~= "number" then Speed = 10 end
                Yaw = (Tick() * Speed) % TwoPi
            elseif YawType == "Tweak" then
                Yaw = -20000000
            elseif YawType == "Randomise" then
                Yaw = (Random(-180, 180) * ToRad)
            elseif YawType == "Cycle" then
                local Speed = 76.5 - (Flags["Anti Aim Yaw Speed"].Value * 1.5)

                Yaw = LocalInfo.CycleFrames % Speed >= (Speed / 2) and 2 or -2
            elseif YawType == "Custom" then
                Yaw = (Flags["Anti Aim Custom Yaw"].Value * ToRad)
            end

            if YawType ~= "None" then
                Yaw += Random() * (Random(1, 2) == 1 and 1 or -1) * Jitter
            end

            return NewVector3(Pitch, Yaw, 0)
        end)
    end

    do
        local ReplicationStep; ReplicationStep = HookFunction(ReplicationObject.step, LPH_NO_UPVALUES(function(Self, Visible, ...)
            ReplicationStep(Self, Visible or Flags["Force Character Rendering"].Value, ...)

            if
                Flags["Interpolation Resolver"].Value and
                Self._alive and
                Self._isEnemy
            then
                Self:resetSprings(Self._receivedPosition)
            end
        end))

        local UpdateReplication; UpdateReplication = HookFunction(ReplicationObject.updateReplication, LPH_NO_UPVALUES(function(Self, Frame, Time, Position, ViewAngles, BarrelAngles, ...)
            local Player = Self._player
            local This = Info.FindByPlayer(Player)

            if This then
                This.Frames[#This.Frames + 1] = {
                    Position,
                    Clock()
                }

                This.Entry = Self
                This.RootPosition = Position
                This.ViewAngles = ViewAngles
                This.BarrelAngles = BarrelAngles

                local Pitch = ViewAngles.X

                if (Pitch <= -1.6 or Pitch >= 1.6) then
                    local PrevLevel = This.ExploitLevel or 0
                    This.ExploitLevel = Clamp(This.ExploitLevel + 1, 0, 3)

                    This.Pitch = Pitch

                    This.ExploitTick = Tick()
                    if This.ExploitLevel > PrevLevel and Library and Library.PushEventLog then
                        local PName = (Player and Player.Name) or (This.Player and This.Player.Name) or "Unknown"
                        pcall(function()
                            Library:PushEventLog("Exploiting", string.format("[Exploiting] %s flagged (pitch %.2f, level %d)", PName, Pitch, This.ExploitLevel))
                        end)
                    end
                end

                if Flags["Interpolation Resolver"].Value then
                    local ReceivedFrameTime = Self._receivedFrameTime

                    if ReceivedFrameTime then
                        if Time <= ReceivedFrameTime then
                            warn("Recieved out of order timestamp!", Time, ReceivedFrameTime, Player)

                            return
                        end
                    end

                    local CurrentTime = Tickbase.GetTick()

                    Self._smoothReplication:receive(CurrentTime, CurrentTime, {
                        t = CurrentTime,
                        position = Position,
                        velocity = EmptyVector3,
                        angles = ViewAngles,
                        barrelAngles = BarrelAngles,
                        breakcount = 0
                    }, true)

                    Self._receivedPosition = Position
                    Self._receivedFrameTime = Time
                    Self._lastAngles = ViewAngles
                    Self._lastBarrelAngles = BarrelAngles
                    Self._lastPacketTime = CurrentTime

                    return
                end
            end

            return UpdateReplication(Self, Frame, Time, Position, ViewAngles, BarrelAngles, ...)
        end))
    end
end
__LoadAntiAim()

local function __LoadMovement()
    Movement.Step = LPH_JIT_MAX(function()
        local LocalInfo = Info.LocalPlayer

        local RootPart = LocalInfo.RootPart
        local Humanoid = LocalInfo.Humanoid

        if not RootPart or not Humanoid then return end

        local FloorMaterial = Humanoid.FloorMaterial
        local InAir = (FloorMaterial == Enum.Material.Air)

        if Flags["Fly Enabled"].Value then
            local LookVector = CurrentCamera.CFrame.LookVector
            local Direction = EmptyVector3

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                Direction += LookVector
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                Direction -= LookVector
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                Direction += NewVector3(LookVector.Z, 0, -LookVector.X)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                Direction += NewVector3(-LookVector.Z, 0, LookVector.X)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                Direction += NewVector3(0, 1, 0)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                Direction += NewVector3(0, -1, 0)
            end

            local FinalVector = Direction.Unit * Flags["Fly Speed"].Value

            if Direction == EmptyVector3 then
                FinalVector = EmptyVector3

                RootPart.Anchored = true
            else
                RootPart.Anchored = false
            end

            RootPart.Velocity = FinalVector

            return
        else
            RootPart.Anchored = false
        end

        if Flags["Bunny Hop Enabled"].Value then
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                Humanoid.Jump = true
            end
        end

        if Flags["Air Strafe Enabled"].Value then
            local Climbing = (Humanoid:GetState() == Enum.HumanoidStateType.Climbing)

            if
                (UserInputService:IsKeyDown(Enum.KeyCode.W) or
                UserInputService:IsKeyDown(Enum.KeyCode.A) or
                UserInputService:IsKeyDown(Enum.KeyCode.S) or
                UserInputService:IsKeyDown(Enum.KeyCode.D)) and
                InAir and
                not Climbing
            then
                local Velocity = Humanoid.MoveDirection * Flags["Air Strafe Boost"].Value

                RootPart.Velocity = NewVector3(Velocity.X, RootPart.Velocity.Y, Velocity.Z)
            end
        end

        if Flags["Slow Walk Enabled"].Value then
            local Velocity = RootPart.Velocity
            local Speed = Flags["Slow Walk Speed"].Value

            RootPart.Velocity = NewVector3(Velocity.X / Speed, Velocity.Y, Velocity.Z / Speed)
        end
    end)

    Movement.ApplyWalkSpeed = LPH_JIT_MAX(function()
        if not Flags["WalkSpeed Enabled"] or not Flags["WalkSpeed Enabled"].Value then
            return
        end

        local Speed = Flags["WalkSpeed Value"] and Flags["WalkSpeed Value"].Value
        if type(Speed) ~= "number" then
            return
        end

        local CharacterInterface = Shared.CharacterInterface
        if not CharacterInterface then
            return
        end

        local ok, CharObj = pcall(function()
            return CharacterInterface.getCharacterObject()
        end)
        if not ok or type(CharObj) ~= "table" then
            return
        end

        CharObj._baseWalkSpeed = Speed

        local Mult = CharObj._walkSpeedMult
        if type(Mult) ~= "number" then
            Mult = 1
        end

        local Target = Speed * Mult
        local Spring = CharObj._walkspeedspring
        if type(Spring) == "table" then
            Spring.t = Target
            if type(Spring.p) == "number" and math.abs(Spring.p - Target) > 8 then
                Spring.p = Target
            end
        end

        local Humanoid = CharObj._humanoid
        if Humanoid then
            pcall(function()
                Humanoid.WalkSpeed = Target
            end)
        end
    end)

    Movement.Init = function()
        do
            Stepped:Connect(function()
                Movement.Step()
                pcall(Movement.ApplyWalkSpeed)
            end)
        end

        do
            local CharacterObject = Shared.CharacterObject
            if CharacterObject and CharacterObject.setBaseWalkSpeed then
                local setBaseWalkSpeed
                setBaseWalkSpeed = HookFunction(CharacterObject.setBaseWalkSpeed, LPH_NO_UPVALUES(function(Self, Speed, ...)
                    if Flags["WalkSpeed Enabled"] and Flags["WalkSpeed Enabled"].Value then
                        local Custom = Flags["WalkSpeed Value"] and Flags["WalkSpeed Value"].Value
                        if type(Custom) == "number" then
                            Speed = Custom
                        end
                    end

                    local Result = setBaseWalkSpeed(Self, Speed, ...)

                    if Flags["WalkSpeed Enabled"] and Flags["WalkSpeed Enabled"].Value and type(Self) == "table" then
                        local Custom = Flags["WalkSpeed Value"] and Flags["WalkSpeed Value"].Value
                        if type(Custom) == "number" then
                            Self._baseWalkSpeed = Custom
                            local Mult = type(Self._walkSpeedMult) == "number" and Self._walkSpeedMult or 1
                            local Spring = Self._walkspeedspring
                            if type(Spring) == "table" then
                                Spring.t = Custom * Mult
                            end
                        end
                    end

                    return Result
                end))
            end
        end
    end
end
__LoadMovement()

do
    Tickbase.Init()
    Camera.Init()
    Info.Init()
    Esp.Init()
    Visuals.Init()
    Legitbot.Init()
    Ragebot.Init()
    Knifebot.Init()
    Movement.Init()

    RunService.RenderStepped:Connect(function()
        if (API.Tick() - Watermark["RefreshRate"]) >= 1 then
            Watermark["Fps"] = Watermark["StoredFps"]
            Watermark["StoredFps"] = 0
            Watermark["RefreshRate"] = API.Tick()     
        end 
        Watermark["StoredFps"] = Watermark["StoredFps"] + 1

        API.Pcall(function()
            Watermark["Ping"] = API.MathFloor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
    end)

    RunService.PreRender:Connect(function()
        if Flags["Watermark"] and Flags["Watermark"].Value then
            local accentHex = "#" .. API.StringUpper(API.tostring(API.ToHex(Library.AccentColor)))
            local fps = API.tostring(Watermark["Fps"] or 0)
            local ping = API.tostring(Watermark["Ping"] or 0)
            local ver = API.tostring(version or "1.0")

            local str = '<font color="' .. accentHex .. '">Iridescent </font> <font color="' .. accentHex .. '" size="10">v' .. ver .. '</font>  | ' .. fps .. ' fps 〡 ' .. ping .. ' ms 〡 discord.gg/s2mFECrAD2'

            Library:SetWatermark(str)
        end
    end)
end
end

CoreGui.Parent = gethui() or cloneref(LocalPlayer.PlayerGui)
Library:Notify("Loaded in "..API.tostring(API.Tick() - LoadTick))
getgenv().Loaded = true 

]=]);
