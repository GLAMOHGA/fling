local function forEachYield(iterator, state, control)
    local yield = coroutine.yield
    yield()
    local ok = true
    for key, value in iterator, state, control do
        yield(ok, key, value)
    end
end
local tbl
local connection, UserInputService2, TweenService2, localPlayer
local fn, fn2
local jerkOn, spinOn, spinSpeed, friendOn, fn3, fn4, fn5, fn6, walkFlingOn, aspectRatioOn, connection2, disableAspectRatio, enableAspectRatio, fn7, fn8, fn9, fn10
local player, connection3, Players2, fn11, fn12, fn13, fn14, fn15
local customGunModelEnabled, selectedGunModelName, fn16, tbl2, fn17, fn18
local fn19, fn20, fn21, fn22, fn23, disableVoteDupe, fn24, enabled, gunESP, trapESP, autoShoot, shootOff, autoGetGun, gunPickupMethod, silentAimEnabled, forceShotEnabled, offset, enabled2, disableAntiAim, enableAntiAim, disableAntiCoin, enableAntiCoin, fn25, fn26, fn27, fn28, disableKillAura, enableKillAura, fn29, fn30, fn31, fn32, disableAutoKnife, enableAutoKnife
local ctrlTP, number, blinkOn, blinkSpeed, antiflingOn, fn33, disableFly, fn34, fn35, fn36, fn37
local value, text
if getgenv().Library then
    getgenv().Library:Unload()
end
do
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    game:GetService("RunService")
    local getCoreGui
    local CoreGui = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
    local v1 = gethui
    if v1 then
        getCoreGui = v1
    else
        getCoreGui = function()
            return CoreGui
        end
    end
    gethui = getCoreGui
    local localPlayer2 = Players.LocalPlayer
    local currentCamera = Workspace.CurrentCamera
    local mouse = localPlayer2:GetMouse()
    local fromRGB = Color3.fromRGB
    local fromHSV = Color3.fromHSV
    local fromHex = Color3.fromHex
    local newColorSequence = ColorSequence.new
    local newColorSequenceKeypoint = ColorSequenceKeypoint.new
    local newNumberSequence = NumberSequence.new
    local newNumberSequenceKeypoint = NumberSequenceKeypoint.new
    local newUDim2 = UDim2.new
    local newUDim = UDim.new
    local newVector2 = Vector2.new
    local newInstance = Instance.new
    local clamp = math.clamp
    local floor = math.floor
    local abs = math.abs
    local sin = math.sin
    local insert = table.insert
    local find = table.find
    local remove = table.remove
    local concat = table.concat
    local clone = table.clone
    local unpack = table.unpack
    local format = string.format
    local find2 = string.find
    local gsub = string.gsub
    local lower = string.lower
    local newRect = Rect.new
    connection = {}
    connection.Flags = {}
    connection.MenuKeybind = tostring(Enum.KeyCode.Z)
    connection.Tween = {Time = 0.25, Style = Enum.EasingStyle.Quad, Direction = Enum.EasingDirection.Out}
    connection.Folders = {Directory = "zoophack", Configs = "zoophack/Configs", Assets = "zoophack/Assets", Themes = "zoophack/Themes"}
    connection.Images = {
        Saturation = {"Saturation.png", "https://github.com/sametexe001/images/blob/main/saturation.png?raw=true"},
        Value = {"Value.png", "https://github.com/sametexe001/images/blob/main/value.png?raw=true"},
        Hue = {"Hue.png", "https://github.com/sametexe001/images/blob/main/horizontalhue.png?raw=true"},
        Checkers = {"Checkers.png", "https://github.com/sametexe001/images/blob/main/checkers.png?raw=true"},
        Scrollbar = {"Scrollbar.png", "https://github.com/sametexe001/images/blob/main/scrollbar.png?raw=true"},
    }
    connection.Pages = {}
    connection.Sections = {}
    connection.Connections = {}
    connection.Threads = {}
    connection.ThemeMap = {}
    connection.ThemeItems = {}
    connection.Themes = {}
    connection.CurrentFrames = {}
    connection.ThemeColorpickers = {}
    connection.SetFlags = {}
    connection.UnnamedConnections = 0
    connection.UnnamedFlags = 0
    connection.Holder = nil
    connection.UnusedHolder = nil
    connection.NotifHolder = nil
    connection.Font = nil
    connection.BoldFont = nil
    connection.IconFont = nil
    local tbl3 = {
        Unknown = "Unknown",
        Backspace = "Back",
        Tab = "Tab",
        Clear = "Clear",
        Return = "Return",
        Pause = "Pause",
        Escape = "Escape",
        Space = "Space",
        QuotedDouble = '"',
        Hash = "#",
        Dollar = "$",
        Percent = "%",
        Ampersand = "&",
        Quote = "'",
        LeftParenthesis = "(",
        RightParenthesis = " )",
        Asterisk = "*",
        Plus = "+",
        Comma = ",",
        Minus = "-",
        Period = ".",
        Slash = "`",
        Three = "3",
        Seven = "7",
        Eight = "8",
        Colon = ":",
        Semicolon = ";",
        LessThan = "<",
        GreaterThan = ">",
        Question = "?",
        Equals = "=",
        At = "@",
        LeftBracket = "LeftBracket",
        RightBracket = "RightBracked",
        BackSlash = "BackSlash",
        Caret = "^",
        Underscore = "_",
        Backquote = "`",
        LeftCurly = "{",
        Pipe = "|",
        RightCurly = "}",
        Tilde = "~",
        Delete = "Delete",
        End = "End",
        KeypadZero = "Keypad0",
        KeypadOne = "Keypad1",
        KeypadTwo = "Keypad2",
        KeypadThree = "Keypad3",
        KeypadFour = "Keypad4",
        KeypadFive = "Keypad5",
        KeypadSix = "Keypad6",
        KeypadSeven = "Keypad7",
        KeypadEight = "Keypad8",
        KeypadNine = "Keypad9",
        KeypadPeriod = "KeypadP",
        KeypadDivide = "KeypadD",
        KeypadMultiply = "KeypadM",
        KeypadMinus = "KeypadM",
        KeypadPlus = "KeypadP",
        KeypadEnter = "KeypadE",
        KeypadEquals = "KeypadE",
        Insert = "Insert",
        Home = "Home",
        PageUp = "PageUp",
        PageDown = "PageDown",
        RightShift = "RightShift",
        LeftShift = "LeftShift",
        RightControl = "RightControl",
        LeftControl = "LeftControl",
        LeftAlt = "LeftAlt",
        RightAlt = "RightAlt",
    }
    connection.__index = connection
    connection.Pages.__index = connection.Pages
    connection.Sections.__index = connection.Sections
    local folders = connection.Folders
    local v2 = nil
    local v3 = nil
    for _, value2 in folders, v2, v3 do
        if not isfolder(value2) then
            makefolder(value2)
        end
    end
    local images = connection.Images
    local v4 = nil
    local v5 = nil
    for _, value2 in images, v4, v5 do
        if not isfile(connection.Folders.Assets .. "/" .. value2[1]) then
            local v6 = game
            writefile(connection.Folders.Assets .. "/" .. value2[1], v6:HttpGet(value2[2]))
        end
    end
    local themes = {}
    local default = {}
    default.Background = fromRGB(10, 9, 8)
    default.Inline = fromRGB(15, 13, 11)
    default.Text = fromRGB(245, 242, 238)
    default.Element = fromRGB(15, 13, 11)
    default.Image = fromRGB(245, 242, 238)
    default.Accent = fromRGB(224, 116, 24)
    default["Light Accent"] = fromRGB(255, 170, 54)
    default.Border = fromRGB(50, 34, 23)
    themes.Default = default
    local white = {}
    white.Background = fromRGB(18, 18, 20)
    white.Inline = fromRGB(28, 28, 31)
    white.Text = fromRGB(248, 248, 250)
    white.Element = fromRGB(35, 35, 39)
    white.Image = fromRGB(248, 248, 250)
    white.Accent = fromRGB(235, 235, 240)
    white["Light Accent"] = fromRGB(255, 255, 255)
    white.Border = fromRGB(105, 105, 115)
    themes.White = white
    local blue = {}
    blue.Background = fromRGB(7, 14, 25)
    blue.Inline = fromRGB(11, 24, 42)
    blue.Text = fromRGB(232, 244, 255)
    blue.Element = fromRGB(14, 32, 55)
    blue.Image = fromRGB(225, 242, 255)
    blue.Accent = fromRGB(43, 153, 255)
    blue["Light Accent"] = fromRGB(118, 202, 255)
    blue.Border = fromRGB(25, 77, 125)
    themes.Blue = blue
    local pink = {}
    pink.Background = fromRGB(25, 10, 20)
    pink.Inline = fromRGB(42, 16, 34)
    pink.Text = fromRGB(255, 239, 248)
    pink.Element = fromRGB(54, 20, 44)
    pink.Image = fromRGB(255, 232, 246)
    pink.Accent = fromRGB(244, 78, 164)
    pink["Light Accent"] = fromRGB(255, 145, 204)
    pink.Border = fromRGB(119, 35, 83)
    themes.Pink = pink
    local purple = {}
    purple.Background = fromRGB(15, 10, 28)
    purple.Inline = fromRGB(27, 17, 49)
    purple.Text = fromRGB(242, 235, 255)
    purple.Element = fromRGB(37, 23, 65)
    purple.Image = fromRGB(239, 230, 255)
    purple.Accent = fromRGB(154, 91, 255)
    purple["Light Accent"] = fromRGB(202, 157, 255)
    purple.Border = fromRGB(78, 42, 135)
    themes.Purple = purple
    local green = {}
    green.Background = fromRGB(8, 20, 16)
    green.Inline = fromRGB(13, 35, 27)
    green.Text = fromRGB(232, 255, 242)
    green.Element = fromRGB(17, 47, 36)
    green.Image = fromRGB(225, 255, 237)
    green.Accent = fromRGB(38, 199, 126)
    green["Light Accent"] = fromRGB(113, 239, 175)
    green.Border = fromRGB(24, 102, 70)
    themes.Green = green
    connection.Theme = clone(themes.Default)
    connection.Themes = themes
    local tbl4 = {}
    tbl4.__index = tbl4
    function tbl4.Create(_, element, tweenInfo, v6, instance)
        if instance then
            instance = element
        end
        if not instance then
            instance = element.Instance
        end
        if not tweenInfo then
            tweenInfo = TweenInfo.new(connection.Tween.Time, connection.Tween.Style, connection.Tween.Direction)
        end
        local tbl5 = {Tween = TweenService:Create(instance, tweenInfo, v6), Info = tweenInfo, Goal = v6, Item = instance}
        tbl5.Tween:Play()
        setmetatable(tbl5, tbl4)
        return tbl5
    end
    function tbl4:Get()
        if self.Tween then
            return self.Tween, self.Info, self.Goal
        end
    end
    function tbl4:Pause()
        if self.Tween then
            self.Tween:Pause()
        end
    end
    function tbl4:Play()
        if self.Tween then
            self.Tween:Play()
        end
    end
    function tbl4:Clean()
        if self.Tween then
            tbl4:Pause()
        end
    end
    local tbl5 = {}
    tbl5.__index = tbl5
    function tbl5.Create(_, v6, v7)
        local element = {Instance = newInstance(v6), Properties = v7, Class = v6}
        setmetatable(element, tbl5)
        for key, value2 in element.Properties do
            element.Instance[key] = value2
        end
        return element
    end
    function tbl5:AddToTheme(v6)
        if self.Instance then
            connection:AddToTheme(self, v6)
        end
    end
    function tbl5:ChangeItemTheme(v6)
        if self.Instance then
            connection:ChangeItemTheme(self, v6)
        end
    end
    function tbl5:Connect(v6, v7, v8)
        if self.Instance then
            if self.Instance[v6] then
                return connection:Connect(self.Instance[v6], v7, v8)
            end
        end
    end
    function tbl5:Tween(v6, v7)
        if self.Instance then
            return tbl4:Create(self, v6, v7)
        end
    end
    function tbl5:Disconnect(v6)
        if self.Instance then
            return connection:Disconnect(v6)
        end
    end
    function tbl5:Clean()
        if self.Instance then
            self.Instance:Destroy()
        end
    end
    function tbl5:MakeDraggable()
        if self.Instance then
            local instance = self.Instance
            local enabled3 = false
            local position = nil
            local position2 = nil
            local function fn38(v6)
                local value2 = v6.Position - position
                self:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = newUDim2(position2.X.Scale, position2.X.Offset + value2.X, position2.Y.Scale, position2.Y.Offset + value2.Y),
                })
            end
            self:Connect("InputBegan", function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    enabled3 = true
                    position = input.Position
                    position2 = instance.Position
                    self.Debounce = true
                end
            end)
            self:Connect("InputEnded", function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    enabled3 = false
                    self.Debounce = false
                end
            end)
            connection:Connect(UserInputService.InputChanged, function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    if enabled3 then
                        self.Debounce = true
                        fn38(input)
                    end
                end
            end)
            return enabled3
        end
    end
    function tbl5:MakeResizeable(v6, v7)
        if self.Instance then
            local instance = self.Instance
            local enabled3 = false
            local value2 = newUDim2()
            local value3 = newUDim2()
            local value4 = instance.Parent.AbsoluteSize - instance.AbsoluteSize
            local v8 = tbl5:Create("TextButton", {
                Parent = instance,
                AnchorPoint = Vector2.new(1, 1),
                BorderColor3 = fromRGB(0, 0, 0),
                Size = newUDim2(0, 8, 0, 8),
                Position = newUDim2(1, 0, 1, 0),
                Name = "\000",
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                AutoButtonColor = false,
                ZIndex = 2000,
                Visible = true,
                Text = "",
            })
            v8:Connect("InputBegan", function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    enabled3 = true
                    value2 = instance.Size - newUDim2(0, input.Position.X, 0, input.Position.Y)
                end
            end)
            v8:Connect("InputEnded", function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    enabled3 = false
                end
            end)
            connection:Connect(UserInputService.InputChanged, function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and enabled3 and not self.Debounce then
                    local value5 = v7
                    if not v7 then
                        value5 = instance.Parent.AbsoluteSize - instance.AbsoluteSize
                    end
                    value4 = value5
                    value3 = value2 + newUDim2(0, input.Position.X, 0, input.Position.Y)
                    local value6 = math.clamp(value3.X.Offset, v6.X, value4.X)
                    local v9 = table.pack(math.clamp(value3.Y.Offset, v6.Y, value4.Y))
                    local n = v9.n
                    v9.n = 4 + n - 1
                    table.move(v9, 1, n, 4, v9)
                    v9[1], v9[2], v9[3] = 0, value6, 0
                    value3 = newUDim2(table.unpack(v9, 1, v9.n))
                    local tbl6 = {Size = value3}
                    tbl4:Create(instance, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), tbl6, true)
                end
            end)
            return enabled3
        end
    end
    function tbl5.OnHover(element, v6)
        if element.Instance then
            return connection:Connect(element.Instance.MouseEnter, v6)
        end
    end
    function tbl5.OnHoverLeave(element, v6)
        if element.Instance then
            return connection:Connect(element.Instance.MouseLeave, v6)
        end
    end
    local tbl6 = {
        New = function(_, v6, v7, v8, v9)
            if isfile(connection.Folders.Assets .. "/" .. v6 .. ".json") then
                local v10 = getcustomasset
                return Font.new(v10(connection.Folders.Assets .. "/" .. v6 .. ".json"))
            else
                if not isfile(connection.Folders.Assets .. "/" .. v6 .. ".ttf") then
                    local v10 = game
                    writefile(connection.Folders.Assets .. "/" .. v6 .. ".ttf", v10:HttpGet(v9.Url))
                end
                local tbl6 = {name = v6}
                tbl6.faces = {
                    {
                        name = "Regular",
                        weight = v7,
                        style = v8,
                        assetId = getcustomasset(connection.Folders.Assets .. "/" .. v6 .. ".ttf"),
                    },
                }
                writefile(connection.Folders.Assets .. "/" .. v6 .. ".json", HttpService:JSONEncode(tbl6))
                local v10 = getcustomasset
                return Font.new(v10(connection.Folders.Assets .. "/" .. v6 .. ".json"))
            end
        end,
        Get = function(_, v6)
            if isfile(connection.Folders.Assets .. "/" .. v6 .. ".json") then
                local v7 = getcustomasset
                return Font.new(v7(connection.Folders.Assets .. "/" .. v6 .. ".json"))
            end
        end,
    }
    tbl6:New("Inter", 200, "Regular", {Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/Inter.ttf"})
    tbl6:New("InterBold", 200, "Bold", {Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/InterBold.ttf"})
    connection.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    connection.BoldFont = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    connection.IconFont = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    connection.Holder = tbl5:Create("ScreenGui", {Parent = gethui(), Name = "\000", ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true})
    connection.UnusedHolder = tbl5:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\000",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        IgnoreGuiInset = true,
        Enabled = false,
    })
    connection.NotifHolder = tbl5:Create("Frame", {
        Parent = connection.Holder.Instance,
        BorderColor3 = fromRGB(0, 0, 0),
        Name = "\000",
        BackgroundTransparency = 1,
        Position = newUDim2(0, 15, 0, 55),
        Size = newUDim2(0, 0, 1, -55),
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = fromRGB(245, 242, 238),
    })
    tbl5:Create("UIListLayout", {Parent = connection.NotifHolder.Instance, Padding = newUDim(0, 14), SortOrder = Enum.SortOrder.LayoutOrder})
    function connection:GetImage(v6)
        local v7 = self.Images[v6]
        if v7 then
            return getcustomasset(self.Folders.Assets .. "/" .. v7[1])
        end
    end
    function connection.Round(_, v6, v7)
        local v8 = 10 ^ math.max(0, math.floor(tonumber(v7) or 0))
        return floor(v6 * v8 + 0.5) / v8
    end
    function connection.IsMouseOverFrame(_, element)
        local instance = element.Instance or element
        local absolutePosition = instance.AbsolutePosition
        local absoluteSize = instance.AbsoluteSize
        if mouse.X >= absolutePosition.X and mouse.X <= absolutePosition.X + absoluteSize.X and mouse.Y >= absolutePosition.Y and mouse.Y <= absolutePosition.Y + absoluteSize.Y then
            return true
        else
            return false
        end
    end
    function connection:Unload()
        local connections = self.Connections
        local v6 = nil
        local v7 = nil
        for _, value2 in connections, v6, v7 do
            value2.Connection:Disconnect()
        end
        local threads = self.Threads
        local v8 = nil
        local v9 = nil
        for _, value2 in threads, v8, v9 do
            coroutine.close(value2)
        end
        if self.Holder then
            self.Holder:Clean()
        end
        getgenv().Library = nil
        connection = nil
    end
    function connection:Thread(v6)
        local thread = coroutine.create(v6)
        coroutine.wrap(function()
            coroutine.resume(thread)
        end)()
        insert(self.Threads, thread)
        return thread
    end
    function connection.SafeCall(...)
        local tbl7 = {...}
        local _, v6 = tbl7[1], tbl7[2]
        local v7, v8 = pcall(v6, unpack({select(3, ...)}))
        local v9 = v7
        if not v7 then
            connection:Notification("Error!", "Error caught in function, report this to the devs:\n" .. v8, 5)
            return false
        else
            return v9
        end
    end
    function connection:Connect(v6, v7, v8)
        local v9
        if v8 then
            v9 = v8
        else
            local value2 = self.UnnamedConnections + 1
            local v10 = table.pack(HttpService:GenerateGUID(false))
            local n = v10.n
            v10.n = 3 + n - 1
            table.move(v10, 1, n, 3, v10)
            v10[1], v10[2] = "Connection_%s_%s", value2
            v9 = format(table.unpack(v10, 1, v10.n))
        end
        local tbl7 = {Event = v6, Callback = v7, Name = v9, Connection = nil}
        connection:Thread(function()
            tbl7.Connection = v6:Connect(v7)
        end)
        insert(self.Connections, tbl7)
        return tbl7
    end
    function connection:Disconnect(v6)
        local connections = self.Connections
        local v7 = nil
        local enabled3 = false
        for _, value2 in connections, nil, v7 do
            v7 = value2
            if value2.Name == v6 then
                enabled3 = true
                break
            else
                continue
            end
            return
        end
        if not enabled3 then
            return
        end
        v7.Connection:Disconnect()
    end
    function connection.NextFlag(...)
        local value2 = ({...})[1].UnnamedFlags + 1
        local v6 = table.pack(HttpService:GenerateGUID(false))
        local n = v6.n
        v6.n = 3 + n - 1
        table.move(v6, 1, n, 3, v6)
        v6[1], v6[2] = "Flag Number %s %s", value2
        return format(table.unpack(v6, 1, v6.n))
    end
    function connection:AddToTheme(element, v6)
        local instance = element.Instance or element
        local tbl7 = {Item = instance, Properties = v6}
        local properties = tbl7.Properties
        local v7 = nil
        local v8 = nil
        for key, value2 in properties, v7, v8 do
            local v9 = value2
            if type(value2) == "string" then
                instance[key] = self.Theme[v9]
            else
                instance[key] = v9
            end
        end
        insert(self.ThemeItems, tbl7)
        self.ThemeMap[instance] = tbl7
    end
    function connection:GetConfig()
        local tbl7 = {}
        self:SafeCall(function()
            local flags = self.Flags
            local v6 = nil
            local v7 = nil
            for key, value2 in flags, v6, v7 do
                local v8 = value2
                if type(value2) == "table" and value2.Key then
                    tbl7[key] = {Key = tostring(v8.Key), Mode = v8.Mode}
                elseif type(v8) == "table" and v8.Color then
                    tbl7[key] = {Color = v8.HexValue, Alpha = v8.Alpha}
                else
                    tbl7[key] = v8
                end
            end
        end)
        return HttpService:JSONEncode(tbl7)
    end
    function connection.LoadConfig(v6, v7)
        local v8 = HttpService:JSONDecode(v7)
        v6:SafeCall(function()
            local v9 = nil
            local v10 = nil
            for key, value2 in v8, v9, v10 do
                local v11 = v6.SetFlags[key]
                if v11 then
                    if type(value2) == "table" and value2.Key then
                        v11(value2)
                    elseif type(value2) == "table" and value2.Color then
                        v11(value2.Color, value2.Alpha)
                    else
                        v11(value2)
                    end
                end
            end
        end)
    end
    function connection.DeleteConfig(v6, v7)
        if isfile(v6.Folders.Configs .. "/" .. v7) then
            delfile(v6.Folders.Configs .. "/" .. v7)
            v6:Notification("Success", "Deleted config " .. v7, 5)
        end
    end
    function connection.SaveConfig(v6, v7)
        if isfile(v6.Folders.Configs .. "/" .. v7) then
            writefile(v6.Folders.Configs .. "/" .. v7, v6:GetConfig())
            v6:Notification("Success", "Saved config " .. v7, 5)
        end
    end
    function connection.RefreshConfigsList(v6, v7)
        local tbl7 = {}
        local list = {}
        local v8 = gsub(v6.Folders.Configs, v6.Folders.Directory .. "/", "")
        for key, value2 in listfiles(v6.Folders.Configs) do
            list[key] = gsub(value2, v6.Folders.Directory .. "\\" .. v8 .. "\\", "")
        end
        if #list == tbl7 then
            local count = #list
            for i = 1, count + 0 do
                if list[i] ~= tbl7[i] then
                    break
                else
                    continue
                end
                return
            end
        else
            v7:Refresh(list)
        end
    end
    function connection:ChangeItemTheme(element, properties)
        local instance = element.Instance or element
        if self.ThemeMap[instance] then
            self.ThemeMap[instance].Properties = properties
            self.ThemeMap[instance] = self.ThemeMap[instance]
        end
    end
    function connection:ChangeTheme(v6, v7)
        self.Theme[v6] = v7
        local themeItems = self.ThemeItems
        local v8 = nil
        for _, value2 in themeItems do
            v8 = value2
            local properties = value2.Properties
            local v9 = nil
            local v10 = nil
            for key, value3 in properties, v9, v10 do
                if type(value3) == "string" and value3 == v6 then
                    v8.Item[key] = v7
                end
            end
        end
    end
    function connection:ApplyTheme(v6)
        self.Themes = self.Themes or themes
        local default2 = self.Themes[v6] or self.Themes.Default or themes.Default
        self.Theme = self.Theme or clone(default2)
        local v7 = self.Themes[v6]
        if not v7 then
            v6 = v7
        end
        self.CurrentTheme = v6 or "Default"
        for key, value2 in pairs(default2) do
            self:ChangeTheme(key, value2)
        end
        local theme = self.Theme or default2
        local hudFrame = T and T.hudFrame
        if hudFrame then
            hudFrame = hudFrame.Parent
        end
        if hudFrame then
            if T.hudStroke then
                T.hudStroke.Color = theme.Accent
            end
            if T.hudGlow then
                T.hudGlow.BackgroundColor3 = theme.Accent
            end
            if T.hudLogo then
                T.hudLogo.ImageColor3 = theme.Accent
            end
            if T.hudIconStroke then
                T.hudIconStroke.Color = theme.Accent
            end
            if T.hudName then
                T.hudName.TextColor3 = theme.Text
            end
            if T.hudRoleLbl then
                T.hudRoleLbl.TextColor3 = theme["Light Accent"]
            end
            if T.hudHpText then
                T.hudHpText.TextColor3 = theme.Text
            end
            if T.hudBarBack then
                T.hudBarBack.BackgroundColor3 = theme.Element
            end
            if T.hudBarStroke then
                T.hudBarStroke.Color = theme.Border
            end
            if T.hudBar then
                T.hudBar.BackgroundColor3 = theme.Accent
            end
            if T.hudStrokeGrad then
                T.hudStrokeGrad.Color = ColorSequence.new(theme.Accent, theme["Light Accent"])
            end
            if T.hudShimmerGradient then
                T.hudShimmerGradient.Color = ColorSequence.new(theme.Accent, theme["Light Accent"])
            end
        end
        local themeObjects = self.ThemeObjects or {}
        for _, value2 in ipairs(themeObjects) do
            local object = value2.Object
            if object and object.Parent and theme[value2.Key] ~= nil then
                pcall(function()
                    if object:IsA("UIGradient") and value2.Property == "Color" then
                        object[value2.Property] = ColorSequence.new(theme.Accent, theme["Light Accent"])
                    else
                        object[value2.Property] = theme[value2.Key]
                    end
                end)
            end
        end
        local instance = self.Holder and self.Holder.Instance
        if instance then
            for _, descendant in ipairs(instance:GetDescendants()) do
                if descendant.Name == "ResizeHandleHorizontal" or descendant.Name == "ResizeHandleVertical" then
                    descendant.BackgroundColor3 = theme.Accent
                elseif descendant:IsA("ScrollingFrame") and descendant.Name == "PlayerCards" then
                    descendant.ScrollBarImageColor3 = theme.Accent
                elseif descendant:IsA("UIStroke") and descendant.Parent then
                    local name = descendant.Parent.Name
                    if name:match("^Player_") or name:match("^VoteCard") then
                        descendant.Color = theme.Accent
                    end
                elseif descendant:IsA("GuiObject") and descendant.Name:match("^Player_") then
                    descendant.BorderColor3 = theme.Accent
                end
            end
        end
    end
    function connection.GetTransparencyPropertyFromItem(_, instance)
        if instance:IsA("Frame") then
            return {"BackgroundTransparency"}
        elseif instance:IsA("TextLabel") or instance:IsA("TextButton") then
            return {"TextTransparency", "BackgroundTransparency"}
        elseif instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
            return {"BackgroundTransparency", "ImageTransparency"}
        elseif instance:IsA("ScrollingFrame") then
            return {"BackgroundTransparency", "ScrollBarImageTransparency"}
        elseif instance:IsA("TextBox") then
            return {"TextTransparency", "BackgroundTransparency"}
        elseif instance:IsA("UIStroke") then
            return {"Transparency"}
        end
    end
    function connection.FadeItem(_, v6, v7, v8, time)
        local v9 = v6[v7]
        v6[v7] = v8 and 1 or v9
        local create = tbl4.Create
        local newTweenInfo = TweenInfo.new
        if not time then
            time = connection.Tween.Time
        end
        local v10 = newTweenInfo(time, connection.Tween.Style, connection.Tween.Direction)
        local tbl7 = {}
        tbl7[v7] = v8 and v9 or 1
        local v11 = create(tbl4, v6, v10, tbl7, true)
        connection:Connect(v11.Tween.Completed, function()
            if not v8 then
                task.wait()
                v6[v7] = v9
            end
        end)
        return v11
    end
    function connection.Notification(_, v6, v7, v8)
        local tbl7 = {}
        tbl7.Notification = tbl5:Create("Frame", {
            Parent = connection.NotifHolder.Instance,
            Name = "\000",
            BorderColor3 = fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        tbl7.Notification:AddToTheme({BackgroundColor3 = "Inline"})
        tbl5:Create("UICorner", {Parent = tbl7.Notification.Instance, CornerRadius = newUDim(0, 4)})
        tbl7.Title = tbl5:Create("TextLabel", {
            Parent = tbl7.Notification.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = v6,
            Name = "\000",
            Size = newUDim2(0, 0, 0, 15),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Title:AddToTheme({BackgroundColor3 = "Text"})
        tbl5:Create("UIPadding", {
            Parent = tbl7.Notification.Instance,
            PaddingTop = newUDim(0, 5),
            PaddingBottom = newUDim(0, 8),
            PaddingRight = newUDim(0, 8),
            PaddingLeft = newUDim(0, 8),
        })
        tbl7.Description = tbl5:Create("TextLabel", {
            Parent = tbl7.Notification.Instance,
            TextWrapped = true,
            Name = "====sa0dSA=DSAJGjmsaM",
            TextColor3 = fromRGB(245, 242, 238),
            TextTransparency = 0.5,
            Text = v7,
            Size = newUDim2(0, 0, 0, 15),
            Position = newUDim2(0, 0, 0, 18),
            BorderSizePixel = 0,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            FontFace = connection.Font,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Description:AddToTheme({TextColor3 = "Text"})
        tbl7.Notification.Instance.BackgroundTransparency = 1
        local absoluteSize = tbl7.Notification.Instance.AbsoluteSize
        tbl7.Notification.Instance.Size = newUDim2(0, 0, 0, 0)
        for _, descendant in tbl7.Notification.Instance:GetDescendants() do
            if descendant:IsA("UIStroke") then
                descendant.Transparency = 1
            elseif descendant:IsA("TextLabel") then
                descendant.TextTransparency = 1
            elseif descendant:IsA("Frame") then
                descendant.BackgroundTransparency = 1
            end
        end
        connection:Thread(function()
            tbl7.Notification:Tween(nil, {BackgroundTransparency = 0, Size = newUDim2(0, absoluteSize.X, 0, absoluteSize.Y)})
            task.wait(0.06)
            for _, descendant in tbl7.Notification.Instance:GetDescendants() do
                if descendant:IsA("UIStroke") then
                    tbl4:Create(descendant, nil, {Transparency = 0}, true)
                elseif descendant:IsA("TextLabel") then
                    if descendant.Name ~= "====sa0dSA=DSAJGjmsaM" then
                        tbl4:Create(descendant, nil, {TextTransparency = 0}, true)
                    else
                        tbl4:Create(descendant, nil, {TextTransparency = 0.5}, true)
                    end
                elseif descendant:IsA("Frame") then
                    tbl4:Create(descendant, nil, {BackgroundTransparency = 0}, true)
                end
            end
            task.delay(v8 + 0.1, function()
                for _, descendant in tbl7.Notification.Instance:GetDescendants() do
                    if descendant:IsA("UIStroke") then
                        tbl4:Create(descendant, nil, {Transparency = 1}, true)
                    elseif descendant:IsA("TextLabel") then
                        tbl4:Create(descendant, nil, {TextTransparency = 1}, true)
                    elseif descendant:IsA("Frame") then
                        tbl4:Create(descendant, nil, {BackgroundTransparency = 1}, true)
                    end
                end
                task.wait(0.06)
                tbl7.Notification:Tween(nil, {BackgroundTransparency = 1, Size = newUDim2(0, 0, 0, 0)})
                task.wait(0.5)
                tbl7.Notification:Clean()
            end)
        end)
    end
    function connection.CreateColorpicker(...)
        local instance
        getfenv()
        local tbl7 = {...}
        local v6
        v6, instance = tbl7[1], tbl7[2]
        if not instance then
            instance = {}
        end
        OpenColorpickers = OpenColorpickers or {}
        local item = {}
        item.Window = instance.Window
        item.Tab = instance.Tab
        item.Section = instance.Section
        item.Flag = instance.Flag
        item.Hue = 0
        item.Saturation = 0
        item.Value = 0
        item.Alpha = 0
        item.Color = fromRGB(0, 0, 0)
        item.HexValue = ""
        item.IsOpen = false
        OpenColorpickers[item] = true
        connection.Flags[item.Flag] = {}
        local item2 = {}
        item2.ColorpickerButton = tbl5:Create("TextButton", {
            Parent = instance.Parent.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            AutoButtonColor = false,
            AnchorPoint = Vector2.new(1, 0.5),
            BorderSizePixel = 0,
            Name = "\000",
            Position = newUDim2(1, 0, 0.5, 0),
            Size = newUDim2(0, 15, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(0, 181, 6),
        })
        tbl5:Create("UICorner", {Parent = item2.ColorpickerButton.Instance, CornerRadius = newUDim(0, 10)})
        tbl5:Create("UIStroke", {
            Parent = item2.ColorpickerButton.Instance,
            Color = fromRGB(50, 34, 23),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }):AddToTheme({Color = "Border"});
        (function(v7)
            local v8 = v7 % 5
            local absoluteSize = item2.ColorpickerButton.Instance.AbsoluteSize
            local value2 = (absoluteSize.X + 4) * v8 - 4 - absoluteSize.X
            item2.ColorpickerButton.Instance.Position = newUDim2(1, instance.IsToggle and -value2 - 20 or -value2, 0.5, 0)
        end)(instance.Count)
        item2.ColorpickerWindow = tbl5:Create("Frame", {
            Parent = connection.Holder.Instance,
            Name = "\000",
            Position = newUDim2(0, item2.ColorpickerButton.Instance.AbsolutePosition.X + 25, 0, item2.ColorpickerButton.Instance.AbsolutePosition.Y),
            BorderColor3 = fromRGB(0, 0, 0),
            Size = newUDim2(0, 243, 0, 213),
            Visible = false,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(10, 9, 8),
        })
        item2.ColorpickerWindow:AddToTheme({BackgroundColor3 = "Background"})
        item2.Shadow = tbl5:Create("ImageLabel", {
            Parent = item2.ColorpickerWindow.Instance,
            ImageColor3 = fromRGB(0, 0, 0),
            ImageTransparency = 0.5799999833106995,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = -1,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            Name = "\000",
            Size = newUDim2(1, 55, 1, 55),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Palette = tbl5:Create("TextButton", {
            Parent = item2.ColorpickerWindow.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            AutoButtonColor = false,
            Name = "\000",
            Size = newUDim2(1, 0, 1, -60),
            BorderSizePixel = 0,
            TextSize = 14,
            BackgroundColor3 = fromRGB(0, 181, 6),
        })
        item2.Saturation = tbl5:Create("ImageLabel", {
            Parent = item2.Palette.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Image = connection:GetImage("Saturation"),
            BackgroundTransparency = 1,
            Name = "\000",
            Size = newUDim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Value = tbl5:Create("ImageLabel", {
            Parent = item2.Palette.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Image = connection:GetImage("Value"),
            BackgroundTransparency = 1,
            Name = "\000",
            Size = newUDim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.PaletteDragger = tbl5:Create("Frame", {
            Parent = item2.Palette.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 10, 0, 10),
            Size = newUDim2(0, 8, 0, 8),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl5:Create("UIStroke", {
            Parent = item2.PaletteDragger.Instance,
            Color = fromRGB(245, 242, 238),
            Thickness = 2.4,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })
        tbl5:Create("UICorner", {Parent = item2.PaletteDragger.Instance, CornerRadius = newUDim(1, 0)})
        item2.Alpha = tbl5:Create("TextButton", {
            Parent = item2.ColorpickerWindow.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            Name = "\000",
            Position = newUDim2(0, 0, 1, -35),
            AutoButtonColor = false,
            Size = newUDim2(1, 0, 0, 14),
            BorderSizePixel = 0,
            TextSize = 14,
            BackgroundColor3 = fromRGB(0, 181, 6),
        })
        item2.Checkers = tbl5:Create("ImageLabel", {
            Parent = item2.Alpha.Instance,
            ScaleType = Enum.ScaleType.Tile,
            BorderColor3 = fromRGB(0, 0, 0),
            Image = connection:GetImage("Checkers"),
            TileSize = newUDim2(0, 6, 0, 6),
            Name = "\000",
            Size = newUDim2(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        local create = tbl5.Create
        local tbl8 = {Parent = item2.Checkers.Instance}
        local tbl9 = {}
        local v7 = newNumberSequenceKeypoint(0, 1)
        local v8 = table.pack(newNumberSequenceKeypoint(1, 0))
        tbl9[1] = v7
        table.move(v8, 1, v8.n, 2, tbl9)
        tbl8.Transparency = newNumberSequence(tbl9)
        create(tbl5, "UIGradient", tbl8)
        tbl5:Create("UICorner", {Parent = item2.Checkers.Instance, CornerRadius = newUDim(0, 6)})
        item2.AlphaDragger = tbl5:Create("Frame", {
            Parent = item2.Alpha.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 1, 0, 2),
            Size = newUDim2(0, 10, 0, 10),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl5:Create("UIStroke", {
            Parent = item2.AlphaDragger.Instance,
            Color = fromRGB(245, 242, 238),
            Thickness = 2.4,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })
        tbl5:Create("UICorner", {Parent = item2.AlphaDragger.Instance, CornerRadius = newUDim(1, 0)})
        item2.Hue = tbl5:Create("ImageButton", {
            Parent = item2.ColorpickerWindow.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            AutoButtonColor = false,
            AnchorPoint = Vector2.new(0, 1),
            Name = "\000",
            Position = newUDim2(0, 0, 1, -40),
            Size = newUDim2(1, 0, 0, 14),
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        local create2 = tbl5.Create
        local tbl10 = {Parent = item2.Hue.Instance}
        local tbl11 = {}
        local v9 = table.pack(fromRGB(255, 0, 0))
        local n = v9.n
        v9.n = 2 + n - 1
        table.move(v9, 1, n, 2, v9)
        v9[1] = 0
        local v10 = newColorSequenceKeypoint(table.unpack(v9, 1, v9.n))
        local v11 = newColorSequenceKeypoint(0.17, fromRGB(255, 255, 0))
        local v12 = newColorSequenceKeypoint(0.33, fromRGB(0, 255, 0))
        local v13 = newColorSequenceKeypoint(0.5, fromRGB(0, 255, 255))
        local v14 = newColorSequenceKeypoint(0.67, fromRGB(0, 0, 255))
        local v15 = newColorSequenceKeypoint(0.83, fromRGB(255, 0, 255))
        local v16 = table.pack(newColorSequenceKeypoint(1, fromRGB(255, 0, 0)))
        tbl11[1], tbl11[2], tbl11[3], tbl11[4], tbl11[5], tbl11[6] = v10, v11, v12, v13, v14, v15
        table.move(v16, 1, v16.n, 7, tbl11)
        tbl10.Color = newColorSequence(tbl11)
        create2(tbl5, "UIGradient", tbl10)
        tbl5:Create("UICorner", {Parent = item2.Hue.Instance, CornerRadius = newUDim(0, 4)})
        tbl5:Create("UIStroke", {Parent = item2.Hue.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}):AddToTheme({Color = "Border"})
        item2.HueDragger = tbl5:Create("Frame", {
            Parent = item2.Hue.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 15, 0, 2),
            Size = newUDim2(0, 10, 0, 10),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl5:Create("UIStroke", {
            Parent = item2.HueDragger.Instance,
            Color = fromRGB(245, 242, 238),
            Thickness = 2.4,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })
        tbl5:Create("UICorner", {Parent = item2.HueDragger.Instance, CornerRadius = newUDim(1, 0)})
        tbl5:Create("UIPadding", {
            Parent = item2.ColorpickerWindow.Instance,
            PaddingTop = newUDim(0, 8),
            PaddingBottom = newUDim(0, 8),
            PaddingRight = newUDim(0, 8),
            PaddingLeft = newUDim(0, 8),
        })
        item2.RainbowToggle = tbl5:Create("TextButton", {
            Parent = item2.ColorpickerWindow.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            Name = "\000",
            AutoButtonColor = false,
            AnchorPoint = Vector2.new(0, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = newUDim2(0, 0, 1, 0),
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Text = tbl5:Create("TextLabel", {
            Parent = item2.RainbowToggle.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            TextTransparency = 0.5,
            Text = "Rainbow",
            Name = "\000",
            BorderColor3 = fromRGB(0, 0, 0),
            Size = newUDim2(1, 0, 0, 15),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            BorderSizePixel = 0,
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Text:AddToTheme({TextColor3 = "Text"})
        item2.Indicator = tbl5:Create("Frame", {
            Parent = item2.RainbowToggle.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            Name = "\000",
            Position = newUDim2(1, 0, 0.5, 0),
            Size = newUDim2(0, 15, 0, 15),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        item2.Indicator:AddToTheme({BackgroundColor3 = "Element"})
        item2.UIStroke = tbl5:Create("UIStroke", {
            Parent = item2.Indicator.Instance,
            Color = fromRGB(50, 34, 23),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        })
        item2.UIStroke:AddToTheme({Color = "Border"})
        tbl5:Create("UICorner", {Parent = item2.Indicator.Instance, CornerRadius = newUDim(0, 10)})
        item2.Check = tbl5:Create("TextLabel", {
            Parent = item2.Indicator.Instance,
            FontFace = connection.IconFont,
            Text = "check",
            TextColor3 = fromRGB(0, 0, 0),
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(1, -1, 1, -3),
            Visible = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, -1, 0.5, 0),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Shadow = tbl5:Create("ImageLabel", {
            Parent = item2.Indicator.Instance,
            ImageTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = 4,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            ImageColor3 = fromRGB(224, 116, 24),
            Size = newUDim2(1, 15, 1, 15),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item2.Shadow:AddToTheme({ImageColor3 = "Accent"})
        local enabled3 = false
        local enabled4 = false
        local enabled5 = false
        local enabled6 = false
        local fn38 = nil
        local isRainbow = false
        local function fn39(v17)
            isRainbow = v17
            item.IsRainbow = isRainbow
            if fn38 then
                fn38(isRainbow)
            end
            connection.Flags[instance.Flag .. "RainbowToggle"] = isRainbow
            if isRainbow then
                item2.Indicator:ChangeItemTheme({BackgroundColor3 = "Accent"})
                item2.UIStroke:ChangeItemTheme({Color = "Light Accent"})
                item2.Indicator:Tween(nil, {BackgroundColor3 = connection.Theme.Accent})
                item2.Text:Tween(nil, {TextTransparency = 0})
                item2.Check.Instance.Visible = true
                item2.Shadow:Tween(nil, {ImageTransparency = 0.5})
                item2.UIStroke:Tween(nil, {Color = connection.Theme["Light Accent"]})
            else
                item2.Indicator:ChangeItemTheme({BackgroundColor3 = "Element"})
                item2.UIStroke:ChangeItemTheme({Color = "Border"})
                item2.Indicator:Tween(nil, {BackgroundColor3 = connection.Theme.Element})
                item2.Text:Tween(nil, {TextTransparency = 0.5})
                item2.Check.Instance.Visible = false
                item2.Shadow:Tween(nil, {ImageTransparency = 1})
                item2.UIStroke:Tween(nil, {Color = connection.Theme.Border})
            end
        end
        function item.SetRainbow(_, v17)
            fn39(v17 == true)
        end
        item2.RainbowToggle:Connect("MouseButton1Down", function()
            fn39(not isRainbow)
        end)
        connection.SetFlags[instance.Flag .. "RainbowToggle"] = fn39
        function item:SlidePalette(v17)
            if not (not v17 or not enabled3) then
                local saturation = clamp(1 - (v17.Position.X - item2.Palette.Instance.AbsolutePosition.X) / item2.Palette.Instance.AbsoluteSize.X, 0, 1)
                local value2 = clamp(1 - (v17.Position.Y - item2.Palette.Instance.AbsolutePosition.Y) / item2.Palette.Instance.AbsoluteSize.Y, 0, 1)
                self.Saturation = saturation
                self.Value = value2
                local v18 = clamp((v17.Position.X - item2.Palette.Instance.AbsolutePosition.X) / item2.Palette.Instance.AbsoluteSize.X, 0, 0.95)
                local v19 = clamp((v17.Position.Y - item2.Palette.Instance.AbsolutePosition.Y) / item2.Palette.Instance.AbsoluteSize.Y, 0, 0.91)
                item2.PaletteDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v18, 0, v19, 0)})
                self:Update()
            end
        end
        function item:SlideHue(v17)
            if not (not v17 or not enabled4) then
                self.Hue = clamp((v17.Position.X - item2.Hue.Instance.AbsolutePosition.X) / item2.Hue.Instance.AbsoluteSize.X, 0, 1)
                local v18 = clamp((v17.Position.X - item2.Hue.Instance.AbsolutePosition.X) / item2.Hue.Instance.AbsoluteSize.X, 0, 0.95)
                item2.HueDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v18, 0, 0, 2)})
                self:Update()
            end
        end
        function item:SlideAlpha(v17)
            if not (not v17 or not enabled5) then
                self.Alpha = clamp((v17.Position.X - item2.Alpha.Instance.AbsolutePosition.X) / item2.Alpha.Instance.AbsoluteSize.X, 0, 1)
                local v18 = clamp((v17.Position.X - item2.Alpha.Instance.AbsolutePosition.X) / item2.Alpha.Instance.AbsoluteSize.X, 0, 0.95)
                item2.AlphaDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v18, 0, 0, 2)})
                self:Update(true)
            end
        end
        function item:Update(v17)
            self.Color = fromHSV(self.Hue, self.Saturation, self.Value)
            self.HexValue = self.Color:ToHex()
            connection.Flags[instance.Flag] = {Color = self.Color, HexValue = self.HexValue, Alpha = self.Alpha}
            item2.ColorpickerButton:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = self.Color})
            item2.Palette:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = fromHSV(self.Hue, 1, 1)})
            if not v17 then
                item2.Alpha:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = self.Color})
            end
            if instance.Callback then
                connection:SafeCall(instance.Callback, self.Color, self.Alpha)
            end
        end
        function item:Set(v17, v18)
            local v19, alpha
            if type(v17) == "table" then
                v19 = fromRGB(v17[1], v17[2], v17[3])
                alpha = v19[4]
            elseif type(v17) == "string" then
                v19 = fromHex(v17)
                alpha = v18
            else
                v19 = v17
                alpha = v18
            end
            local hue, saturation, value2 = v19:ToHSV()
            self.Hue = hue
            self.Saturation = saturation
            self.Value = value2
            if not alpha then
                alpha = 0
            end
            self.Alpha = alpha
            local v20 = clamp(1 - self.Saturation, 0, 0.95)
            local v21 = clamp(1 - self.Value, 0, 0.91)
            item2.PaletteDragger:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v20, 0, v21, 0)})
            local v22 = clamp(self.Hue, 0, 0.95)
            item2.HueDragger:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v22, 0, 0, 2)})
            local v23 = clamp(self.Alpha, 0, 0.95)
            item2.AlphaDragger:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = newUDim2(v23, 0, 0, 2)})
            self:Update()
        end
        function item.Get()
            return item.Color, item.Alpha
        end
        function item.SetVisibility(_, visible)
            item2.ColorpickerButton.Instance.Visible = visible
        end
        function item.SetOpen(_, isOpen)
            if not enabled6 then
                item.IsOpen = isOpen
                enabled6 = true
                if isOpen then
                    item2.ColorpickerWindow.Instance.Visible = true
                    item2.ColorpickerWindow.Instance.Position = newUDim2(0, item2.ColorpickerButton.Instance.AbsolutePosition.X + 25, 0, item2.ColorpickerButton.Instance.AbsolutePosition.Y + 15)
                end
                local descendants = item2.ColorpickerWindow.Instance:GetDescendants()
                insert(descendants, item2.ColorpickerWindow.Instance)
                local v17 = nil
                local v18 = nil
                local v19 = nil
                for _, value2 in descendants, v17, v18 do
                    local transparencyPropertyFromItem = connection:GetTransparencyPropertyFromItem(value2)
                    if transparencyPropertyFromItem then
                        if item.IsOpen then
                            if not find2(value2.ClassName, "UI") then
                                value2.ZIndex = 1001
                            end
                        elseif not find2(value2.ClassName, "UI") then
                            value2.ZIndex = 1
                        end
                        if type(transparencyPropertyFromItem) == "table" then
                            local v20 = nil
                            local v21 = nil
                            for _, value3 in transparencyPropertyFromItem, v20, v21 do
                                v19 = connection:FadeItem(value2, value3, isOpen, item.Window.FadeSpeed)
                            end
                        else
                            v19 = connection:FadeItem(value2, transparencyPropertyFromItem, isOpen, item.Window.FadeSpeed)
                        end
                    end
                end
                connection:Connect(v19.Tween.Completed, function()
                    enabled6 = false
                    item2.ColorpickerWindow.Instance.Visible = isOpen
                end)
            end
        end
        local color = item.Color
        fn38 = function(...)
            if ({...})[1] then
                color = item.Color
                connection:Thread(function()
                    while true do
                        if task.wait() then
                            item:Set((fromHSV(abs(sin(tick() * 0.32)), 1, 1)), item.Alpha)
                            if not isRainbow then
                                break
                            else
                                continue
                            end
                        end
                        return
                    end
                    item:Set(color, item.Alpha)
                end)
            end
        end
        item2.Palette:Connect("InputBegan", function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                enabled3 = true
                item:SlidePalette(input)
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        enabled3 = false
                    end
                end)
            end
        end)
        item2.Hue:Connect("InputBegan", function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                enabled4 = true
                item:SlideHue(input)
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        enabled4 = false
                    end
                end)
            end
        end)
        item2.Alpha:Connect("InputBegan", function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                enabled5 = true
                item:SlideAlpha(input)
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        enabled5 = false
                    end
                end)
            end
        end)
        item2.ColorpickerButton:Connect("MouseButton1Down", function()
            item:SetOpen(not item.IsOpen)
        end)
        connection:Connect(UserInputService.InputChanged, function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if enabled3 then
                    item:SlidePalette(input)
                elseif enabled4 then
                    item:SlideHue(input)
                elseif enabled5 then
                    item:SlideAlpha(input)
                end
            end
        end)
        connection:Connect(UserInputService.InputBegan, function(input)
            local isOpen = input.UserInputType == Enum.UserInputType.MouseButton1 and item.IsOpen and not enabled6
            if isOpen then
                isOpen = not connection:IsMouseOverFrame(item2.ColorpickerWindow)
            end
            if isOpen then
                item:SetOpen(false)
            end
        end)
        if instance.Default then
            item:Set(instance.Default, instance.Alpha)
        end
        connection.SetFlags[instance.Flag] = function(v17, v18)
            item:Set(v17, v18)
        end
        return item
    end
    function connection.Window(_, v6)
        local tbl7 = v6 or {}
        local tbl8 = {}
        tbl8.Logo = tbl7.Logo or tbl7.logo or "123748867365417"
        tbl8.Size = tbl7.Size or tbl7.size or newUDim2(0, 760, 0, 540)
        tbl8.FadeSpeed = tbl7.FadeSpeed or tbl7.fadespeed or 0.2
        tbl8.PagePadding = tbl7.PagePadding or tbl7.pagepadding or 19
        tbl8.Pages = {}
        tbl8.SubPages = {}
        tbl8.Items = {}
        tbl8.IsOpen = false
        local items = {}
        items.MainFrame = tbl5:Create("CanvasGroup", {
            Parent = connection.Holder.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0, 0),
            Name = "\000",
            Position = newUDim2(0, currentCamera.ViewportSize.X / 3.5, 0, currentCamera.ViewportSize.Y / 3.5),
            Size = tbl8.Size,
            Visible = false,
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(10, 9, 8),
        })
        items.MainFrame:AddToTheme({BackgroundColor3 = "Background"})
        items.ProportionalScale = tbl5:Create("UIScale", {Parent = items.MainFrame.Instance, Scale = 1})
        items.OpenScale = tbl5:Create("UIScale", {Parent = items.MainFrame.Instance, Scale = 1})
        items.MainFrame:MakeDraggable()
        items.MainFrame:MakeResizeable(newVector2(tbl8.Size.X.Offset, tbl8.Size.Y.Offset), (Vector2.new(9999, 9999)))
        items.Shadow = tbl5:Create("ImageLabel", {
            Parent = items.MainFrame.Instance,
            ImageColor3 = fromRGB(0, 0, 0),
            ImageTransparency = 0.5799999833106995,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = -1,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            Name = "\000",
            Size = newUDim2(1, 55, 1, 55),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Sidebar = tbl5:Create("Frame", {
            Parent = items.MainFrame.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(0, 78, 1, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Logo = tbl5:Create("ImageLabel", {
            Parent = items.Sidebar.Instance,
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(0, 45, 0, 45),
            AnchorPoint = Vector2.new(0.5, 0),
            Image = "rbxassetid://" .. tbl8.Logo,
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0, 12),
            ZIndex = 3,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Logo:AddToTheme({ImageColor3 = "Image"})
        items.Shadow2 = tbl5:Create("ImageLabel", {
            Parent = items.Logo.Instance,
            ScaleType = Enum.ScaleType.Slice,
            Name = "\000",
            ImageTransparency = 0.62,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundColor3 = fromRGB(245, 242, 238),
            Size = newUDim2(1, 5, 1, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.8999999761581421,
            ZIndex = 2,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
        })
        items.Shadow2:AddToTheme({ImageColor3 = "Image"})
        tbl5:Create("Frame", {
            Parent = items.Sidebar.Instance,
            Size = newUDim2(0, 1, 1, 0),
            Name = "\000",
            Position = newUDim2(1, 0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(50, 34, 23),
        }):AddToTheme({BackgroundColor3 = "Border"})
        items.Pages = tbl5:Create("ScrollingFrame", {
            Parent = items.Sidebar.Instance,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarThickness = 2,
            ScrollBarImageTransparency = 0,
            CanvasSize = newUDim2(0, 0, 0, 0),
            ScrollBarImageColor3 = connection.Theme.Accent,
            MidImage = connection:GetImage("Scrollbar"),
            TopImage = connection:GetImage("Scrollbar"),
            BottomImage = connection:GetImage("Scrollbar"),
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 0, 0, 104),
            Size = newUDim2(1, 0, 1, -130),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Pages:AddToTheme({ScrollBarImageColor3 = "Accent"})
        tbl5:Create("UIListLayout", {
            Parent = items.Pages.Instance,
            Padding = newUDim(0, tbl8.PagePadding),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        })
        tbl5:Create("UICorner", {Parent = items.MainFrame.Instance, CornerRadius = newUDim(0, 10)})
        items.Avatar = tbl5:Create("ImageLabel", {
            Parent = items.Sidebar.Instance,
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(0, 34, 0, 34),
            AnchorPoint = Vector2.new(0.5, 1),
            Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 1, -18),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Avatar.Instance.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        tbl5:Create("UICorner", {Parent = items.Avatar.Instance, CornerRadius = newUDim(1, 0)})
        tbl5:Create("UIStroke", {Parent = items.Avatar.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}):AddToTheme({Color = "Border"})
        items.Inline = tbl5:Create("Frame", {
            Parent = items.MainFrame.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 79, 0, 0),
            Size = newUDim2(1, -79, 1, 0),
            ZIndex = 2,
            ClipsDescendants = true,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        local enabled3 = false
        function tbl8.SetOpen(_, isOpen)
            local v7 = enabled3
            local v8
            if enabled3 then
                v8 = v7
            else
                v8 = tbl8.IsOpen == isOpen
            end
            if not v8 then
                tbl8.IsOpen = isOpen
                enabled3 = true
                local instance = items.MainFrame.Instance
                local instance2 = items.OpenScale and items.OpenScale.Instance
                if not isOpen and OpenColorpickers then
                    local list = OpenColorpickers
                    for key, _ in pairs(list) do
                        local isOpen2
                        if key then
                            isOpen2 = key.IsOpen
                        else
                            isOpen2 = key
                        end
                        if isOpen2 then
                            pcall(function()
                                key:SetOpen(false)
                            end)
                        end
                    end
                end
                local tweenInfo = TweenInfo.new(isOpen and 0.34 or 0.26, Enum.EasingStyle.Quint, isOpen and Enum.EasingDirection.Out or Enum.EasingDirection.In)
                if isOpen then
                    instance.Visible = true
                    instance.GroupTransparency = 1
                    if instance2 then
                        instance2.Scale = 0.965
                    end
                    local tween = TweenService:Create(instance, tweenInfo, {GroupTransparency = 0})
                    local v9 = instance2 and TweenService:Create(instance2, tweenInfo, {Scale = 1}) or nil
                    tween:Play()
                    if v9 then
                        v9:Play()
                    end
                    connection:Connect(tween.Completed, function()
                        if tbl8.IsOpen then
                            instance.GroupTransparency = 0
                            if instance2 then
                                instance2.Scale = 1
                            end
                        end
                        enabled3 = false
                    end)
                else
                    instance.GroupTransparency = 0
                    local tween = TweenService:Create(instance, tweenInfo, {GroupTransparency = 1})
                    local v9 = instance2 and TweenService:Create(instance2, tweenInfo, {Scale = 0.965}) or nil
                    tween:Play()
                    if v9 then
                        v9:Play()
                    end
                    connection:Connect(tween.Completed, function()
                        if not tbl8.IsOpen then
                            instance.Visible = false
                            instance.GroupTransparency = 0
                            if instance2 then
                                instance2.Scale = 1
                            end
                        end
                        enabled3 = false
                    end)
                end
            end
        end
        connection:Connect(UserInputService.InputBegan, function(input, v7)
            if not v7 then
                if tostring(input.KeyCode) == connection.MenuKeybind then
                    tbl8:SetOpen(not tbl8.IsOpen)
                end
            end
        end)
        tbl8.Items = items
        tbl8:SetOpen(true)
        return setmetatable(tbl8, connection)
    end
    function connection.Seperator(v6)
        return tbl5:Create("Frame", {
            Parent = v6.Items.Pages.Instance,
            Name = "\000",
            Size = newUDim2(0, 40, 0, 1),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(50, 34, 23),
        }):AddToTheme({BackgroundColor3 = "Border"})
    end
    function connection.Page(v6, tbl7)
        if not tbl7 then
            tbl7 = {}
        end
        local icon = tbl7.Icon or tbl7.icon or "house"
        if tonumber(icon) then
            icon = "settings"
        end
        local sidebar = tbl7.Sidebar == true or tbl7.sidebar == true
        local tbl8 = {Window = v6, Icon = icon}
        tbl8.LayoutOrder = tbl7.LayoutOrder or tbl7.layoutOrder or 0
        tbl8.Sidebar = sidebar
        tbl8.Search = tbl7.Search or tbl7.search or false
        tbl8.Items = {}
        tbl8.Active = false
        local items = {}
        items.Inactive = tbl5:Create("TextButton", {
            Parent = sidebar and tbl8.Window.Items.Sidebar.Instance or tbl8.Window.Items.Pages.Instance,
            FontFace = connection.IconFont,
            Text = tbl8.Icon,
            TextColor3 = fromRGB(245, 242, 238),
            TextTransparency = 0.5,
            TextSize = 20,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            BorderColor3 = fromRGB(0, 0, 0),
            AutoButtonColor = false,
            Name = "\000",
            LayoutOrder = tbl8.LayoutOrder,
            AnchorPoint = sidebar and Vector2.new(0.5, 0) or Vector2.new(0, 0),
            Position = sidebar and newUDim2(0.5, 0, 0, 68) or newUDim2(),
            BackgroundTransparency = 1,
            Size = newUDim2(0, 25, 0, 25),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Inactive:AddToTheme({TextColor3 = "Image"})
        items.PageContent = tbl5:Create("Frame", {
            Parent = tbl8.Window.Items.Inline.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 1, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            Visible = false,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.SubPages = tbl5:Create("Frame", {
            Parent = items.PageContent.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 15, 0, 15),
            Size = newUDim2(1, -30, 0, 24),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl5:Create("UIListLayout", {
            Parent = items.SubPages.Instance,
            Padding = newUDim(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
        })
        items.Columns = tbl5:Create("Frame", {
            Parent = items.PageContent.Instance,
            Size = newUDim2(1, 0, 1, -55),
            Name = "\000",
            Position = newUDim2(0, 0, 0, 55),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
            BackgroundTransparency = 1,
        })
        items.Columns:AddToTheme({BackgroundColor3 = "Inline"})
        tbl5:Create("Frame", {
            Parent = items.PageContent.Instance,
            Size = newUDim2(1, 0, 0, 1),
            Name = "\000",
            Position = tbl8.Search and newUDim2(0, 0, 0, 99) or newUDim2(0, 0, 0, 54),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(50, 34, 23),
        }):AddToTheme({BackgroundColor3 = "Border"})
        if tbl8.Search then
            items.SubPages.Instance.Position = newUDim2(0, 15, 0, 60)
            items.Columns.Instance.Position = newUDim2(0, 0, 0, 100)
            items.Columns.Instance.Size = newUDim2(1, 0, 1, -100)
            items.Search = tbl5:Create("TextBox", {
                Parent = items.PageContent.Instance,
                FontFace = connection.Font,
                Active = false,
                Selectable = false,
                PlaceholderColor3 = fromRGB(175, 175, 175),
                ZIndex = 2,
                TextSize = 14,
                Size = newUDim2(0, 313, 0, 30),
                TextColor3 = fromRGB(245, 242, 238),
                BorderColor3 = fromRGB(0, 0, 0),
                Text = "",
                Name = "\000",
                PlaceholderText = "Search",
                Position = newUDim2(0, 15, 0, 15),
                TextXAlignment = Enum.TextXAlignment.Left,
                CursorPosition = -1,
                BorderSizePixel = 0,
                BackgroundColor3 = fromRGB(10, 9, 8),
            })
            items.Search:AddToTheme({BackgroundColor3 = "Background", TextColor3 = "Text"})
            tbl5:Create("UICorner", {Parent = items.Search.Instance, CornerRadius = newUDim(0, 4)})
            tbl5:Create("UIStroke", {Parent = items.Search.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}):AddToTheme({Color = "Border"})
            tbl5:Create("UIPadding", {Parent = items.Search.Instance, PaddingLeft = newUDim(0, 8)})
        end
        local enabled3 = false
        function tbl8.Turn(_, visible)
            if not enabled3 then
                tbl8.Active = true
                enabled3 = true
                if visible then
                    items.PageContent.Instance.Visible = true
                    items.PageContent.Instance.Parent = tbl8.Window.Items.Inline.Instance
                    items.Inactive:Tween(nil, {TextTransparency = 0})
                else
                    items.Inactive:Tween(nil, {TextTransparency = 0.5})
                end
                if SubPage and SubPage.NoFade then
                    items.PageContent.Instance.Visible = visible
                    enabled3 = false
                else
                    local descendants = items.PageContent.Instance:GetDescendants()
                    insert(descendants, items.PageContent.Instance)
                    local v7 = nil
                    local v8 = nil
                    local v9 = nil
                    for _, value2 in descendants, v7, v8 do
                        local transparencyPropertyFromItem = connection:GetTransparencyPropertyFromItem(value2)
                        if transparencyPropertyFromItem then
                            if type(transparencyPropertyFromItem) == "table" then
                                local v10 = nil
                                local v11 = nil
                                for _, value3 in transparencyPropertyFromItem, v10, v11 do
                                    v9 = connection:FadeItem(value2, value3, visible, tbl8.Window.FadeSpeed)
                                end
                            else
                                v9 = connection:FadeItem(value2, transparencyPropertyFromItem, visible, tbl8.Window.FadeSpeed)
                            end
                        end
                    end
                    connection:Connect(v9.Tween.Completed, function()
                        enabled3 = false
                        items.PageContent.Instance.Visible = visible
                        local instance = items.PageContent.Instance
                        local parent = visible
                        if visible then
                            parent = tbl8.Window.Items.Inline.Instance
                        end
                        if not parent then
                            parent = connection.UnusedHolder.Instance
                        end
                        instance.Parent = parent
                        if tbl8.Search then
                            local columns = items.Columns
                            local tween = columns.Tween
                            local tbl9 = {}
                            local position = visible
                            if visible then
                                position = newUDim2(0, 0, 0, 100)
                            end
                            if not position then
                                position = newUDim2(0, 0, 1, 0)
                            end
                            tbl9.Position = position
                            tween(columns, nil, tbl9)
                        else
                            local columns = items.Columns
                            local tween = columns.Tween
                            local tbl9 = {}
                            local position = visible
                            if visible then
                                position = newUDim2(0, 0, 0, 55)
                            end
                            if not position then
                                position = newUDim2(0, 0, 1, 0)
                            end
                            tbl9.Position = position
                            tween(columns, nil, tbl9)
                        end
                    end)
                end
            end
        end
        items.Inactive:Connect("MouseButton1Down", function()
            local pages = tbl8.Window.Pages
            local v7 = nil
            local v8 = nil
            for _, value2 in pages, v7, v8 do
                value2:Turn(value2 == tbl8)
            end
        end)
        if #tbl8.Window.Pages == 0 then
            tbl8:Turn(true)
        end
        tbl8.Items = items
        insert(tbl8.Window.Pages, tbl8)
        return setmetatable(tbl8, connection.Pages)
    end
    function connection.Pages:SubPage(item)
        if not item then
            item = {}
        end
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self
        item2.Name = item.Name or item.name or "SubPage"
        item2.Items = {}
        item2.SearchItems = {}
        item2.Active = false
        local items = {}
        items.Inactive = tbl5:Create("TextButton", {
            Parent = item2.Page.Items.SubPages.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            TextTransparency = 0.5,
            Text = item2.Name,
            AutoButtonColor = false,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(0, 100, 1, 0),
            BorderSizePixel = 0,
            ZIndex = 3,
            TextSize = 14,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        items.Inactive:AddToTheme({TextColor3 = "Text", BackgroundColor3 = "Inline"})
        tbl5:Create("UICorner", {Parent = items.Inactive.Instance, CornerRadius = newUDim(1, 0)})
        items.UIStroke = tbl5:Create("UIStroke", {Parent = items.Inactive.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
        items.UIStroke:AddToTheme({Color = "Border"})
        items.Shadow = tbl5:Create("ImageLabel", {
            Parent = items.Inactive.Instance,
            Visible = true,
            ImageTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = 2,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            ImageColor3 = fromRGB(224, 116, 24),
            Size = newUDim2(1, 30, 1, 30),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Shadow:AddToTheme({ImageColor3 = "Accent"})
        items.PageContent = tbl5:Create("Frame", {
            Parent = item2.Page.Items.Columns.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 1, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            Visible = false,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Right = tbl5:Create("ScrollingFrame", {
            Parent = items.PageContent.Instance,
            Active = true,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            AnchorPoint = Vector2.new(1, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            CanvasSize = newUDim2(0, 0, 0, 0),
            ScrollBarImageColor3 = fromRGB(224, 116, 24),
            MidImage = connection:GetImage("Scrollbar"),
            BorderColor3 = fromRGB(0, 0, 0),
            ScrollBarThickness = 2,
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(1, -2, 0, 2),
            Size = newUDim2(0.5, -4, 1, -6),
            BottomImage = connection:GetImage("Scrollbar"),
            TopImage = connection:GetImage("Scrollbar"),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Right:AddToTheme({ScrollBarImageColor3 = "Accent"})
        tbl5:Create("UIPadding", {
            Parent = items.Right.Instance,
            PaddingTop = newUDim(0, 12),
            PaddingBottom = newUDim(0, 14),
            PaddingRight = newUDim(0, 14),
            PaddingLeft = newUDim(0, 7),
        })
        tbl5:Create("UIListLayout", {Parent = items.Right.Instance, Padding = newUDim(0, 14), SortOrder = Enum.SortOrder.LayoutOrder})
        items.Left = tbl5:Create("ScrollingFrame", {
            Parent = items.PageContent.Instance,
            Active = true,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 2,
            BorderSizePixel = 0,
            CanvasSize = newUDim2(0, 0, 0, 0),
            ScrollBarImageColor3 = fromRGB(224, 116, 24),
            MidImage = connection:GetImage("Scrollbar"),
            BorderColor3 = fromRGB(0, 0, 0),
            ScrollBarThickness = 2,
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 0, 0, 2),
            Size = newUDim2(0.5, -4, 1, -6),
            BottomImage = connection:GetImage("Scrollbar"),
            TopImage = connection:GetImage("Scrollbar"),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Left:AddToTheme({ScrollBarImageColor3 = "Accent"})
        tbl5:Create("UIPadding", {
            Parent = items.Left.Instance,
            PaddingTop = newUDim(0, 12),
            PaddingBottom = newUDim(0, 14),
            PaddingRight = newUDim(0, 7),
            PaddingLeft = newUDim(0, 14),
        })
        tbl5:Create("UIListLayout", {Parent = items.Left.Instance, Padding = newUDim(0, 14), SortOrder = Enum.SortOrder.LayoutOrder})
        local enabled3 = false
        function item2.Turn(_, visible)
            if not enabled3 then
                item2.Active = true
                enabled3 = true
                if visible then
                    items.PageContent.Instance.Visible = true
                    items.Inactive:ChangeItemTheme({TextColor3 = "Text", BackgroundColor3 = "Accent"})
                    items.UIStroke:ChangeItemTheme({Color = "Light Accent"})
                    items.Inactive:Tween(nil, {TextTransparency = 0, BackgroundColor3 = connection.Theme.Accent})
                    items.Shadow:Tween(nil, {ImageTransparency = 0.6})
                    items.UIStroke:Tween(nil, {Color = connection.Theme["Light Accent"]})
                else
                    items.Inactive:ChangeItemTheme({TextColor3 = "Text", BackgroundColor3 = "Inline"})
                    items.UIStroke:ChangeItemTheme({Color = "Border"})
                    items.Inactive:Tween(nil, {TextTransparency = 0.5, BackgroundColor3 = connection.Theme.Inline})
                    items.Shadow:Tween(nil, {ImageTransparency = 1})
                    items.UIStroke:Tween(nil, {Color = connection.Theme.Border})
                end
                local descendants = items.PageContent.Instance:GetDescendants()
                insert(descendants, items.PageContent.Instance)
                local v6 = nil
                local v7 = nil
                local v8 = nil
                for _, value2 in descendants, v6, v7 do
                    local transparencyPropertyFromItem = connection:GetTransparencyPropertyFromItem(value2)
                    if transparencyPropertyFromItem then
                        if type(transparencyPropertyFromItem) == "table" then
                            local v9 = nil
                            local v10 = nil
                            for _, value3 in transparencyPropertyFromItem, v9, v10 do
                                v8 = connection:FadeItem(value2, value3, visible, item2.Window.FadeSpeed)
                            end
                        else
                            v8 = connection:FadeItem(value2, transparencyPropertyFromItem, visible, item2.Window.FadeSpeed)
                        end
                    end
                end
                connection:Connect(v8.Tween.Completed, function()
                    enabled3 = false
                    items.PageContent.Instance.Visible = visible
                end)
            end
        end
        if item2.Page.Search then
            local function fn38()
                local v6 = lower(item2.Page.Items.Search.Instance.Text or "")
                local tbl7 = {}
                local searchItems = item2.SearchItems
                local v7 = nil
                local v8 = nil
                for _, value2 in searchItems, v7, v8 do
                    local element = value2.Element
                    local section = value2.Section
                    local v9 = lower(tostring(element.Instance.Text or ""))
                    if v6 == "" or find2(v9, v6, 1, true) ~= nil then
                        tbl7[section] = true
                    end
                end
                local tbl8 = {}
                local searchItems2 = item2.SearchItems
                local v9 = nil
                local v10 = nil
                for _, value2 in searchItems2, v9, v10 do
                    local section = value2.Section
                    if not tbl8[section] then
                        tbl8[section] = true
                        section:SetVisibility(v6 == "" or tbl7[section] == true)
                    end
                end
            end
            connection:Connect(item2.Page.Items.Search.Instance:GetPropertyChangedSignal("Text"), fn38)
            fn38()
        end
        items.Inactive:Connect("MouseButton1Down", function()
            local subPages = item2.Window.SubPages
            local v6 = nil
            local v7 = nil
            for _, value2 in subPages, v6, v7 do
                value2:Turn(value2 == item2)
            end
        end)
        if #item2.Window.Pages == 0 then
            item2:Turn(true)
        end
        item2.Items = items
        insert(item2.Window.SubPages, item2)
        return setmetatable(item2, connection.Pages)
    end
    function connection.Pages:Section(item)
        if not item then
            item = {}
        end
        local item2 = {
            Window = self.Window,
            Page = self,
            Name = item.Name or item.name or "Section",
            Side = item.Side or item.side or "Left",
            Items = {},
        }
        local items = {}
        items.Section = tbl5:Create("Frame", {
            Parent = item2.Side:lower() == "left" and item2.Page.Items.Left.Instance or item2.Page.Items.Right.Instance,
            BorderSizePixel = 0,
            Name = "\000",
            Size = newUDim2(1, 0, 0, 45),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 0.45,
            BackgroundColor3 = fromRGB(10, 9, 8),
        })
        items.Section:AddToTheme({BackgroundColor3 = "Background"})
        tbl5:Create("UIStroke", {Parent = items.Section.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}):AddToTheme({Color = "Border"})
        items.Text = tbl5:Create("TextLabel", {
            Parent = items.Section.Instance,
            FontFace = connection.BoldFont,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            Name = "\000",
            BorderSizePixel = 0,
            Size = newUDim2(1, 0, 0, 15),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Position = newUDim2(0, 7, 0, 6),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        items.Text:AddToTheme({TextColor3 = "Text"})
        tbl5:Create("Frame", {
            Parent = items.Section.Instance,
            Size = newUDim2(1, 0, 0, 1),
            Name = "\000",
            Position = newUDim2(0, 0, 0, 27),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(50, 34, 23),
        }):AddToTheme({BackgroundColor3 = "Border"})
        items.Content = tbl5:Create("Frame", {
            Parent = items.Section.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 10, 0, 38),
            Size = newUDim2(1, -20, 0, 0),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl5:Create("UIListLayout", {Parent = items.Content.Instance, Padding = newUDim(0, 7), SortOrder = Enum.SortOrder.LayoutOrder})
        tbl5:Create("UIPadding", {Parent = items.Section.Instance, PaddingBottom = newUDim(0, 12)})
        tbl5:Create("UICorner", {Parent = items.Section.Instance, CornerRadius = newUDim(0, 10)})
        function item2.SetVisibility(_, visible)
            items.Section.Instance.Visible = visible
        end
        item2.Items = items
        return setmetatable(item2, connection.Sections)
    end
    function connection.Sections:Toggle(v6)
        local item = v6 or {}
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Toggle"
        item2.Flag = item.Flag or item.flag or connection:NextFlag()
        item2.Default = item.Default or item.default or false
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        item2.Value = false
        item2.Count = 0
        local tbl7 = {}
        tbl7.Toggle = tbl5:Create("TextButton", {
            Parent = item2.Section.Items.Content.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            AutoButtonColor = false,
            Name = "\000",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Indicator = tbl5:Create("Frame", {
            Parent = tbl7.Toggle.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            Name = "\000",
            Position = newUDim2(1, 0, 0.5, 0),
            Size = newUDim2(0, 30, 0, 16),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        tbl7.Indicator:AddToTheme({BackgroundColor3 = "Element"})
        tbl7.Knob = tbl5:Create("Frame", {
            Parent = tbl7.Indicator.Instance,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = newUDim2(0, 2, 0.5, 0),
            Size = newUDim2(0, 12, 0, 12),
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
            BackgroundTransparency = 0,
            ZIndex = 7,
        })
        tbl5:Create("UICorner", {Parent = tbl7.Knob.Instance, CornerRadius = newUDim(0, 10)})
        tbl7.UIStroke = tbl5:Create("UIStroke", {Parent = tbl7.Indicator.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
        tbl7.UIStroke:AddToTheme({Color = "Border"})
        tbl5:Create("UICorner", {Parent = tbl7.Indicator.Instance, CornerRadius = newUDim(0, 10)})
        tbl7.Check = tbl5:Create("TextLabel", {
            Parent = tbl7.Indicator.Instance,
            FontFace = connection.IconFont,
            Text = "check",
            TextColor3 = fromRGB(0, 0, 0),
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(1, -3, 1, -3),
            Visible = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, -1, 0.5, -1),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Shadow = tbl5:Create("ImageLabel", {
            Parent = tbl7.Indicator.Instance,
            Visible = true,
            ImageTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = 4,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            ImageColor3 = fromRGB(224, 116, 24),
            Size = newUDim2(1, 15, 1, 15),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Shadow:AddToTheme({ImageColor3 = "Accent"})
        tbl7.Text = tbl5:Create("TextLabel", {
            Parent = tbl7.Toggle.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            TextTransparency = 0.5,
            Text = item2.Name,
            Name = "\000",
            BorderColor3 = fromRGB(0, 0, 0),
            Size = newUDim2(1, 0, 0, 15),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            BorderSizePixel = 0,
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Text:AddToTheme({TextColor3 = "Text"})
        function item2.Get()
            return item2.Value
        end
        function item2.Set(_, toggled, v7, v8)
            if v7 then
                toggled = v7.Toggled
                item2.Value = toggled
            else
                item2.Value = toggled
            end
            connection.Flags[item2.Flag] = toggled
            if toggled then
                tbl7.Indicator:ChangeItemTheme({BackgroundColor3 = "Accent"})
                tbl7.UIStroke:ChangeItemTheme({Color = "Light Accent"})
                tbl7.Indicator:Tween(nil, {BackgroundColor3 = connection.Theme.Accent})
                tbl7.Knob:Tween(nil, {Position = newUDim2(1, -14, 0.5, 0)})
                tbl7.Text:Tween(nil, {TextTransparency = 0})
                tbl7.Check.Instance.Visible = false
                tbl7.Shadow:Tween(nil, {ImageTransparency = 0.5})
                tbl7.UIStroke:Tween(nil, {Color = connection.Theme["Light Accent"]})
            else
                tbl7.Indicator:ChangeItemTheme({BackgroundColor3 = "Element"})
                tbl7.UIStroke:ChangeItemTheme({Color = "Border"})
                tbl7.Indicator:Tween(nil, {BackgroundColor3 = connection.Theme.Element})
                tbl7.Knob:Tween(nil, {Position = newUDim2(0, 2, 0.5, 0)})
                tbl7.Text:Tween(nil, {TextTransparency = 0.5})
                tbl7.Check.Instance.Visible = false
                tbl7.Shadow:Tween(nil, {ImageTransparency = 1})
                tbl7.UIStroke:Tween(nil, {Color = connection.Theme.Border})
            end
            if item2.Callback and not v8 then
                connection:SafeCall(item2.Callback, toggled)
            end
        end
        function item2.SetVisiblity(_, visible)
            tbl7.Toggle.Instance.Visible = visible
        end
        function item2.Colorpicker(self2, item3)
            if not item3 then
                item3 = {}
            end
            local instance = {
                Window = self2.Window,
                Page = self2.Page,
                Section = self2,
                Name = item3.Name or item3.name or "Colorpicker",
                Flag = item3.Flag or item3.flag or connection:NextFlag(),
                Default = item3.Default or item3.default or Color3.new(1, 1, 1),
            }
            local callback2 = item3.Callback or item3.callback or (function() end)
            instance.Callback = callback2
            instance.Alpha = item3.Alpha or item3.alpha or 0
            instance.Parent = tbl7.Toggle
            instance.Count = item2.Count
            instance.IsToggle = true
            item2.Count = item2.Count + 1
            instance.Count = item2.Count
            local tbl8 = {Name = item2.Name, Element = tbl7.Text, Section = instance.Section}
            insert(instance.Page.SearchItems, tbl8)
            return (connection:CreateColorpicker(instance))
        end
        function item2.Keybind(section, item3)
            if not item3 then
                item3 = {}
            end
            local item4 = {}
            item4.Window = section.Window
            item4.Page = section.Page
            item4.Section = section
            item4.Name = item3.Name or item3.name or "Keybind"
            item4.Flag = item3.Flag or item3.flag or connection:NextFlag()
            item4.Default = item3.Default or item3.default or Enum.KeyCode.RightShift
            item4.Mode = item3.Mode or item3.mode or "Toggle"
            local callback2 = item3.Callback or item3.callback or (function() end)
            item4.Callback = callback2
            item4.Key = nil
            item4.Picking = false
            item4.Value = ""
            item4.Toggled = false
            item4.Count = item2.Count
            item2.Count = item2.Count + 1
            item4.Count = item2.Count
            local tbl8 = {}
            tbl8.KeyButton = tbl5:Create("TextButton", {
                Parent = tbl7.Toggle.Instance,
                FontFace = connection.Font,
                TextColor3 = fromRGB(245, 242, 238),
                TextTransparency = 0,
                Text = "None",
                Name = "\000",
                BorderColor3 = fromRGB(0, 0, 0),
                Size = newUDim2(0, 0, 0, 15),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(1, 0.5),
                ZIndex = 4,
                TextSize = 14,
                BackgroundColor3 = fromRGB(245, 242, 238),
            })
            tbl8.KeyButton:AddToTheme({TextColor3 = "Text"});
            (function(v7)
                local v8 = v7 % 5
                local absoluteSize = tbl8.KeyButton.Instance.AbsoluteSize
                local value2 = (absoluteSize.X + 4) * v8 - 4 - absoluteSize.X
                tbl8.KeyButton.Instance.Position = newUDim2(1, v7 == 1 and -value2 - 24 or -value2, 0.5, 0)
            end)(item4.Count)
            function item4.Get()
                return item4.Toggled, item4.Key
            end
            function item4.SetVisibility(_, visible)
                tbl8.KeyButton.Instance.Visible = visible
            end
            function item4.Set(_, mode)
                if find2(tostring(mode), "Enum") then
                    item4.Key = tostring(mode)
                    local name = mode.Name == "Backspace" and "None" or mode.Name
                    local value2 = gsub(gsub(tbl3[item4.Key] or gsub(name, "Enum.", "") or "None", "KeyCode.", ""), "UserInputType.", "") or "None"
                    item4.Value = value2
                    tbl8.KeyButton.Instance.Text = value2
                    connection.Flags[item4.Flag] = {Mode = item4.Mode, Key = item4.Key, Toggled = item4.Toggled}
                    if item4.Callback then
                        connection:SafeCall(item4.Callback, item4.Toggled)
                    end
                elseif find({"Hold", "Toggle", "Always"}, mode) then
                    item4.Mode = mode
                    item4:SetMode(item4.Mode)
                    if item4.Callback then
                        connection:SafeCall(item4.Callback, item4.Toggled)
                    end
                elseif type(mode) == "table" then
                    local key = mode.Key == "Backspace" and "None" or mode.Key
                    item4.Key = tostring(mode.Key)
                    if mode.Mode then
                        item4.Mode = mode.Mode
                        item4:SetMode(mode.Mode)
                    else
                        item4.Mode = "Toggle"
                        item4:SetMode("Toggle")
                    end
                    local v7 = tbl3[item4.Key] or gsub(tostring(key), "Enum.", "")
                    if v7 then
                        key = v7
                    end
                    if key then
                        gsub(gsub(key, "KeyCode.", ""), "UserInputType.", "")
                    end
                    local value2 = gsub(gsub(key, "KeyCode.", ""), "UserInputType.", "")
                    item4.Value = value2
                    tbl8.KeyButton.Instance.Text = value2
                    if item4.Callback then
                        connection:SafeCall(item4.Callback, item4.Toggled)
                    end
                end
                item4.Picking = false
                tbl8.KeyButton:ChangeItemTheme({TextColor3 = "Text"})
                tbl8.KeyButton:Tween(nil, {TextColor3 = connection.Theme.Text})
            end
            function item4.SetMode()
                if item4.Mode == "Always" then
                    item4.Toggled = true
                else
                    item4.Toggled = false
                end
                connection.Flags[item4.Flag] = {Mode = item4.Mode, Key = item4.Key, Toggled = item4.Toggled}
                if item4.Callback then
                    connection:SafeCall(item4.Callback, item4.Toggled)
                end
            end
            function item4.Press(_, toggled)
                if item4.Mode == "Toggle" then
                    item4.Toggled = not item4.Toggled
                elseif item4.Mode == "Hold" then
                    item4.Toggled = toggled
                elseif item4.Mode == "Always" then
                    item4.Toggled = true
                end
                item2:Set(nil, item4)
                connection.Flags[item4.Flag] = {Mode = item4.Mode, Key = item4.Key, Toggled = item4.Toggled}
                if item4.Callback then
                    connection:SafeCall(item4.Callback, item4.Toggled)
                end
            end
            tbl8.KeyButton:Connect("MouseButton1Click", function()
                if not item4.Picking then
                    item4.Picking = true
                    tbl8.KeyButton:ChangeItemTheme({TextColor3 = "Accent"})
                    tbl8.KeyButton:Tween(nil, {TextColor3 = connection.Theme.Accent})
                    local connection4 = nil
                    connection4 = UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            item4:Set(input.KeyCode)
                        else
                            item4:Set(input.UserInputType)
                        end
                        connection4:Disconnect()
                        connection4 = nil
                    end)
                end
            end)
            connection:Connect(UserInputService.InputBegan, function(input)
                if tostring(input.KeyCode) == item4.Key or tostring(input.UserInputType) == item4.Key then
                    if item4.Value ~= "None" then
                        if item4.Mode == "Toggle" then
                            item4:Press()
                        elseif item4.Mode == "Hold" then
                            item4:Press(true)
                        end
                    end
                end
            end)
            connection:Connect(UserInputService.InputEnded, function(input)
                if tostring(input.KeyCode) == item4.Key or tostring(input.UserInputType) == item4.Key then
                    if item4.Value ~= "None" then
                        if item4.Mode == "Hold" then
                            item4:Press(false)
                        end
                    end
                end
            end)
            if item4.Default then
                item4:Set({Key = item4.Default, Mode = item4.Mode or "Toggle"})
            end
            connection.SetFlags[item4.Flag] = function(v7)
                item4:Set(v7)
            end
            return item4
        end
        local tbl8 = {Name = item2.Name, Element = tbl7.Text, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl8)
        tbl7.Toggle:Connect("MouseButton1Down", function()
            item2:Set(not item2.Value)
        end)
        if item2.Default then
            item2:Set(item2.Default)
        end
        connection.SetFlags[item2.Flag] = function(v7)
            item2:Set(v7)
        end
        return item2
    end
    function connection.Sections:Button(item)
        if not item then
            item = {}
        end
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Button"
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        local tbl7 = {}
        tbl7.Button = tbl5:Create("TextButton", {
            Parent = item2.Section.Items.Content.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            AutoButtonColor = false,
            Name = "\000",
            BorderSizePixel = 0,
            Size = newUDim2(1, 0, 0, 20),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        tbl7.Button:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})
        tbl5:Create("UICorner", {Parent = tbl7.Button.Instance, CornerRadius = newUDim(0, 10)})
        tbl7.UIStroke = tbl5:Create("UIStroke", {Parent = tbl7.Button.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
        tbl7.UIStroke:AddToTheme({Color = "Border"})
        function item2.Press()
            tbl7.Button:ChangeItemTheme({BackgroundColor3 = "Accent"})
            tbl7.UIStroke:ChangeItemTheme({Color = "Light Accent"})
            tbl7.Button:Tween(nil, {BackgroundColor3 = connection.Theme.Accent})
            tbl7.UIStroke:Tween(nil, {Color = connection.Theme["Light Accent"]})
            task.wait(0.1)
            tbl7.Button:ChangeItemTheme({BackgroundColor3 = "Element"})
            tbl7.UIStroke:ChangeItemTheme({Color = "Border"})
            tbl7.Button:Tween(nil, {BackgroundColor3 = connection.Theme.Element})
            tbl7.UIStroke:Tween(nil, {Color = connection.Theme.Border})
            connection:SafeCall(item2.Callback)
        end
        function item2.SetText(self2, v6)
            self2.Name = tostring(v6 or "")
            if tbl7.Button and tbl7.Button.Instance then
                tbl7.Button.Instance.Text = self2.Name
            end
        end
        function item2.SetVisibility(_, visible)
            tbl7.Button.Instance.Visible = visible
        end
        function item2.SubButton(section, item3)
            local item4 = {}
            item4.Window = section.Window
            item4.Page = section.Page
            item4.Section = section
            item4.Name = item3.Name or item3.name or "Button"
            local callback2 = item3.Callback or item3.callback or (function() end)
            item4.Callback = callback2
            local element = tbl5:Create("Frame", {
                Parent = item2.Section.Items.Content.Instance,
                BackgroundTransparency = 1,
                Name = "\000",
                BorderColor3 = fromRGB(0, 0, 0),
                Size = newUDim2(1, 0, 0, 20),
                BorderSizePixel = 0,
                BackgroundColor3 = fromRGB(245, 242, 238),
            })
            tbl7.Button.Instance.Parent = element.Instance
            tbl7.Button.Instance.Size = newUDim2(0.48, 1, 0, 20)
            local tbl8 = {}
            tbl8.SubButton = tbl5:Create("TextButton", {
                Parent = element.Instance,
                FontFace = connection.Font,
                TextColor3 = fromRGB(245, 242, 238),
                BorderColor3 = fromRGB(0, 0, 0),
                Text = item4.Name,
                AutoButtonColor = false,
                AnchorPoint = Vector2.new(1, 0),
                BorderSizePixel = 0,
                Name = "\000",
                Position = newUDim2(1, 0, 0, 0),
                Size = newUDim2(0.48, 1, 0, 20),
                ZIndex = 4,
                TextSize = 14,
                BackgroundColor3 = fromRGB(15, 13, 11),
            })
            tbl8.SubButton:AddToTheme({BackgroundColor3 = "Element", TextColor3 = "Text"})
            tbl5:Create("UICorner", {Parent = tbl8.SubButton.Instance, CornerRadius = newUDim(0, 10)})
            tbl8.UIStroke = tbl5:Create("UIStroke", {Parent = tbl8.SubButton.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
            function item4.Press()
                tbl8.SubButton:ChangeItemTheme({BackgroundColor3 = "Accent"})
                tbl8.UIStroke:ChangeItemTheme({Color = "Light Accent"})
                tbl8.SubButton:Tween(nil, {BackgroundColor3 = connection.Theme.Accent})
                tbl8.UIStroke:Tween(nil, {Color = connection.Theme["Light Accent"]})
                task.wait(0.1)
                tbl8.SubButton:ChangeItemTheme({BackgroundColor3 = "Element"})
                tbl8.UIStroke:ChangeItemTheme({Color = "Border"})
                tbl8.SubButton:Tween(nil, {BackgroundColor3 = connection.Theme.Element})
                tbl8.UIStroke:Tween(nil, {Color = connection.Theme.Border})
                connection:SafeCall(item4.Callback)
            end
            function item4.SetVisibility(_, visible)
                tbl8.SubButton.Instance.Visible = visible
            end
            local tbl9 = {Name = item4.Name, Element = tbl8.SubButton, Section = item4.Section}
            insert(item4.Page.SearchItems, tbl9)
            tbl8.SubButton:Connect("MouseButton1Down", function()
                item4:Press()
            end)
            return item4
        end
        local tbl8 = {Name = item2.Name, Element = tbl7.Button, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl8)
        tbl7.Button:Connect("MouseButton1Down", function()
            item2:Press()
        end)
        return item2
    end
    function connection.Sections:Slider(v6)
        local item = v6 or {}
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Slider"
        item2.Flag = item.Flag or item.flag or connection:NextFlag()
        item2.Min = item.Min or item.min or 0
        item2.Default = item.Default or item.default or 0
        item2.Max = item.Max or item.max or 100
        item2.Suffix = item.Suffix or item.suffix or ""
        item2.Decimals = item.Decimals or item.decimals or 1
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        item2.Value = 0
        item2.Sliding = false
        local item3 = {}
        item3.Slider = tbl5:Create("Frame", {
            Parent = item2.Section.Items.Content.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 0, 28),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text = tbl5:Create("TextLabel", {
            Parent = item3.Slider.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text:AddToTheme({TextColor3 = "Text"})
        item3.Value = tbl5:Create("TextLabel", {
            Parent = item3.Slider.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "0.873",
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Right,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Value:AddToTheme({TextColor3 = "Text"})
        item3.RealSlider = tbl5:Create("Frame", {
            Parent = item3.Slider.Instance,
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0, 1),
            Name = "\000",
            Position = newUDim2(0, 0, 1, 0),
            Size = newUDim2(1, 0, 0, 2),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        item3.RealSlider:AddToTheme({BackgroundColor3 = "Element"})
        item3.Accent = tbl5:Create("Frame", {
            Parent = item3.RealSlider.Instance,
            Name = "\000",
            Size = newUDim2(0.6729999780654907, 0, 1, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 5,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(224, 116, 24),
        })
        item3.Accent:AddToTheme({BackgroundColor3 = "Accent"})
        item3.Shadow = tbl5:Create("ImageLabel", {
            Parent = item3.Accent.Instance,
            ImageColor3 = fromRGB(224, 116, 24),
            ImageTransparency = 0.6800000071525574,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = 4,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            Name = "\000",
            Size = newUDim2(1, 15, 1, 15),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Shadow:AddToTheme({ImageColor3 = "Accent"})
        item3.Drag = tbl5:Create("TextButton", {
            Parent = item3.Accent.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(0, 0, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            AutoButtonColor = false,
            AnchorPoint = Vector2.new(0, 0.5),
            BorderSizePixel = 0,
            Name = "\000",
            Position = newUDim2(1, -8, 0.5, 0),
            Size = newUDim2(0, 15, 0, 15),
            ZIndex = 5,
            TextSize = 14,
            BackgroundColor3 = fromRGB(224, 116, 24),
        })
        item3.Drag:AddToTheme({BackgroundColor3 = "Accent"})
        item3.Shadow2 = tbl5:Create("ImageLabel", {
            Parent = item3.Drag.Instance,
            ImageColor3 = fromRGB(224, 116, 24),
            ImageTransparency = 0.6800000071525574,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = "rbxassetid://112971167999062",
            ZIndex = 4,
            BorderSizePixel = 0,
            SliceCenter = newRect(Vector2.new(112, 112), (Vector2.new(147, 147))),
            ScaleType = Enum.ScaleType.Slice,
            BorderColor3 = fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = newUDim2(0.5, 0, 0.5, 0),
            SliceScale = 0.6000000238418579,
            Name = "\000",
            Size = newUDim2(1, 15, 1, 15),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Shadow2:AddToTheme({ImageColor3 = "Accent"})
        tbl5:Create("UICorner", {Parent = item3.Drag.Instance, CornerRadius = newUDim(1, 0)})
        function item2.Get()
            return item2.Value
        end
        function item2.Set(_, v7)
            item2.Value = clamp(connection:Round(v7, item2.Decimals), item2.Min, item2.Max)
            connection.Flags[item2.Flag] = item2.Value
            item3.Accent:Tween(TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = newUDim2((item2.Value - item2.Min) / (item2.Max - item2.Min), 0, 1, 0)})
            item3.Value.Instance.Text = format("%s%s", tostring(item2.Value), item2.Suffix)
            if item2.Callback then
                connection:SafeCall(item2.Callback, item2.Value)
            end
        end
        function item2.SetVisibility(_, visible)
            item3.Slider.Instance.Visible = visible
        end
        local tbl7 = {Name = item2.Name, Element = item3.Text, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl7)
        item3.Drag:Connect("MouseButton1Down", function()
            item2.Sliding = true
            local value2 = (UserInputService:GetMouseLocation().X - 15 - item3.RealSlider.Instance.AbsolutePosition.X) / item3.RealSlider.Instance.AbsoluteSize.X
            item2:Set(clamp(connection:Round((item2.Max - item2.Min) * value2 + item2.Min, item2.Decimals), item2.Min, item2.Max))
        end)
        item3.Drag:Connect("InputEnded", function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                item2.Sliding = false
            end
        end)
        connection:Connect(UserInputService.InputChanged, function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and item2.Sliding then
                local value2 = (input.Position.X - 1 - item3.RealSlider.Instance.AbsolutePosition.X) / item3.RealSlider.Instance.AbsoluteSize.X
                item2:Set(clamp(connection:Round((item2.Max - item2.Min) * value2 + item2.Min, item2.Decimals), item2.Min, item2.Max))
            end
        end)
        if item2.Default then
            item2:Set(item2.Default)
        end
        connection.SetFlags[item2.Flag] = function(v7)
            item2:Set(v7)
        end
        return item2
    end
    function connection.Sections:Dropdown(item)
        if not item then
            item = {}
        end
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Dropdown"
        item2.Flag = item.Flag or item.flag or connection:NextFlag()
        item2.Items = item.Items or item.items or {"One", "Two", "Three"}
        item2.Default = item.Default or item.default or nil
        item2.MaxSize = item.MaxSize or item.maxsize or 75
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        item2.Multi = item.Multi or item.multi or false
        item2.Value = {}
        item2.IsOpen = false
        item2.Options = {}
        local item3 = {}
        item3.Dropdown = tbl5:Create("Frame", {
            Parent = item2.Section.Items.Content.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 0, 42),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text = tbl5:Create("TextLabel", {
            Parent = item3.Dropdown.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text:AddToTheme({TextColor3 = "Text"})
        item3.OptionHolder = tbl5:Create("TextButton", {
            Parent = item3.Dropdown.Instance,
            AutoButtonColor = false,
            Visible = false,
            Text = "",
            Size = newUDim2(1, 0, 0, item2.MaxSize),
            Name = "\000",
            Position = newUDim2(0, 0, 1, 0),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 25,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        item3.OptionHolder:AddToTheme({BackgroundColor3 = "Inline"})
        tbl5:Create("UIStroke", {
            Parent = item3.OptionHolder.Instance,
            Color = fromRGB(50, 34, 23),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }):AddToTheme({Color = "Border"})
        item3.Holder = tbl5:Create("ScrollingFrame", {
            Parent = item3.OptionHolder.Instance,
            Active = true,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 25,
            BorderSizePixel = 0,
            CanvasSize = newUDim2(0, 0, 0, 0),
            ScrollBarImageColor3 = fromRGB(224, 116, 24),
            MidImage = connection:GetImage("Scrollbar"),
            BorderColor3 = fromRGB(0, 0, 0),
            ScrollBarThickness = 2,
            Name = "\000",
            BackgroundTransparency = 1,
            Position = newUDim2(0, 5, 0, 5),
            Size = newUDim2(1, -10, 1, -10),
            BottomImage = connection:GetImage("Scrollbar"),
            TopImage = connection:GetImage("Scrollbar"),
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Holder:AddToTheme({ScrollBarImageColor3 = "Accent"})
        tbl5:Create("UIListLayout", {Parent = item3.Holder.Instance, Padding = newUDim(0, 10), SortOrder = Enum.SortOrder.LayoutOrder})
        item3.RealDropdown = tbl5:Create("TextButton", {
            Parent = item3.Dropdown.Instance,
            AutoButtonColor = false,
            Text = "",
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0, 1),
            Name = "\000",
            Position = newUDim2(0, 0, 1, 0),
            Size = newUDim2(1, 0, 0, 21),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        item3.RealDropdown:AddToTheme({BackgroundColor3 = "Element"})
        tbl5:Create("UIStroke", {
            Parent = item3.RealDropdown.Instance,
            Color = fromRGB(50, 34, 23),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }):AddToTheme({Color = "Border"})
        tbl5:Create("UICorner", {Parent = item3.RealDropdown.Instance, CornerRadius = newUDim(0, 10)})
        item3.Value = tbl5:Create("TextLabel", {
            Parent = item3.RealDropdown.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(245, 242, 238),
            Text = "--",
            Name = "\000",
            TextTruncate = Enum.TextTruncate.AtEnd,
            Size = newUDim2(1, -35, 1, 0),
            Position = newUDim2(0, 4, 0, 1),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            BorderSizePixel = 0,
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Value:AddToTheme({TextColor3 = "Text"})
        item3.OpenIcon = tbl5:Create("ImageLabel", {
            Parent = item3.RealDropdown.Instance,
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = fromRGB(0, 0, 0),
            Name = "\000",
            Size = newUDim2(0, 10, 0, 10),
            AnchorPoint = Vector2.new(1, 0.5),
            Image = "rbxassetid://86523506890491",
            BackgroundTransparency = 1,
            Position = newUDim2(1, -6, 0.5, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.OpenIcon:AddToTheme({ImageColor3 = "Image"})
        local enabled3 = false
        function item2.Set(_, value2, v6)
            if item.Multi then
                if type(value2) ~= "table" then
                    return
                else
                    item2.Value = value2
                    connection.Flags[item2.Flag] = item2.Value
                    local v7 = nil
                    local v8 = nil
                    for _, value3 in value2, v7, v8 do
                        local v9 = item2.Options[value3]
                        if not v9 then
                            return
                        else
                            v9.Selected = true
                            v9:Toggle("Active")
                        end
                    end
                    item3.Value.Instance.Text = concat(value2, ", ")
                end
            else
                local item4 = item2.Options[value2]
                if not item4 then
                    return
                else
                    item4.Selected = true
                    item4:Toggle("Active")
                    item2.Value = item4.Name
                    connection.Flags[item2.Flag] = item2.Value
                    local options = item2.Options
                    local v7 = nil
                    local v8 = nil
                    for _, value3 in options, v7, v8 do
                        if value3 ~= item4 then
                            value3.Selected = false
                            value3:Toggle("Inactive")
                        end
                    end
                    item3.Value.Instance.Text = item2.Value
                end
            end
            if item2.Flag == "InterfaceLanguage" then
                KITI_InterfaceLanguage = item2.Value == "Russian" and "Russian" or "English"
            end
            if item.Callback and not v6 then
                connection:SafeCall(item.Callback, item2.Value)
            end
        end
        function item2.SetOpen(_, isOpen)
            if not enabled3 then
                item2.IsOpen = isOpen
                enabled3 = true
                if isOpen then
                    item3.OptionHolder.Instance.Visible = true
                end
                local descendants = item3.OptionHolder.Instance:GetDescendants()
                insert(descendants, item3.OptionHolder.Instance)
                local v6 = nil
                local v7 = nil
                local v8 = nil
                for _, value2 in descendants, v6, v7 do
                    local transparencyPropertyFromItem = connection:GetTransparencyPropertyFromItem(value2)
                    if transparencyPropertyFromItem then
                        if type(transparencyPropertyFromItem) == "table" then
                            local v9 = nil
                            local v10 = nil
                            for _, value3 in transparencyPropertyFromItem, v9, v10 do
                                v8 = connection:FadeItem(value2, value3, isOpen, item2.Window.FadeSpeed)
                            end
                        else
                            v8 = connection:FadeItem(value2, transparencyPropertyFromItem, isOpen, item2.Window.FadeSpeed)
                        end
                    end
                end
                connection:Connect(v8.Tween.Completed, function()
                    enabled3 = false
                    item3.OptionHolder.Instance.Visible = isOpen
                end)
            end
        end
        function item2.Remove(_, v6)
            if item2.Options[v6] then
                item2.Options[v6].Button:Clean()
            end
            item2.Options[v6] = nil
        end
        function item2.Refresh(_, v6)
            local options = item2.Options
            local v7 = nil
            local v8 = nil
            for _, value2 in options, v7, v8 do
                item2:Remove(value2.Name)
            end
            local v9 = nil
            local v10 = nil
            for _, value2 in v6, v9, v10 do
                item2:Add(value2)
            end
        end
        function item2.Add(_, v6)
            local element = tbl5:Create("TextButton", {
                Parent = item3.Holder.Instance,
                FontFace = connection.Font,
                TextColor3 = fromRGB(245, 242, 238),
                TextTransparency = 0.5,
                Text = v6,
                Name = "\000",
                AutoButtonColor = false,
                BorderColor3 = fromRGB(0, 0, 0),
                Size = newUDim2(1, -5, 0, 20),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                ZIndex = 25,
                TextSize = 14,
                BackgroundColor3 = fromRGB(10, 9, 8),
            })
            element:AddToTheme({TextColor3 = "Text", BackgroundColor3 = "Background"})
            tbl5:Create("UICorner", {Parent = element.Instance, CornerRadius = newUDim(0, 4)})
            local v7 = tbl5:Create("UIPadding", {Parent = element.Instance, PaddingLeft = newUDim(0, 7)})
            local item4 = {Name = v6, Button = element, Padding = v7, Selected = false}
            function item4.Toggle(_, v8)
                if v8 == "Active" then
                    item4.Button:ChangeItemTheme({TextColor3 = "Accent"})
                    item4.Button:Tween(nil, {TextColor3 = connection.Theme.Accent, BackgroundTransparency = 0, TextTransparency = 0})
                    v7:Tween(nil, {PaddingLeft = newUDim(0, 12)})
                else
                    item4.Button:ChangeItemTheme({TextColor3 = "Text"})
                    item4.Button:Tween(nil, {TextColor3 = connection.Theme.Text, BackgroundTransparency = 1, TextTransparency = 0.5})
                    v7:Tween(nil, {PaddingLeft = newUDim(0, 7)})
                end
            end
            function item4.Set()
                item4.Selected = not item4.Selected
                if item2.Multi then
                    local v8 = find(item2.Value, item4.Name)
                    if v8 then
                        remove(item2.Value, v8)
                    else
                        insert(item2.Value, item4.Name)
                    end
                    connection.Flags[item2.Flag] = item2.Value
                    item4:Toggle(v8 and "Inactive" or "Active")
                    local text2 = #item2.Value > 0 and concat(item2.Value, ", ") or "--"
                    item3.Value.Instance.Text = text2
                elseif item4.Selected then
                    item2.Value = item4.Name
                    item4:Toggle("Active")
                    item3.Value.Instance.Text = item4.Name
                    connection.Flags[item2.Flag] = item2.Value
                    local options = item2.Options
                    local v8 = nil
                    local v9 = nil
                    for _, value2 in options, v8, v9 do
                        if value2 ~= item4 then
                            value2.Selected = false
                            value2:Toggle("Inactive")
                        end
                    end
                else
                    item2.Value = nil
                    item4:Toggle("Inactive")
                    item3.Value.Instance.Text = "--"
                    connection.Flags[item2.Flag] = item2.Value
                end
                if item.Callback then
                    connection:SafeCall(item.Callback, item2.Value)
                end
            end
            item4.Button:Connect("MouseButton1Down", function()
                item4:Set()
            end)
            item2.Options[v6] = item4
            return item4
        end
        function item2.SetVisibility(_, visible)
            item3.Dropdown.Instance.Visible = visible
        end
        local tbl7 = {Name = item2.Name, Element = item3.Text, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl7)
        item3.RealDropdown:Connect("MouseButton1Down", function()
            item2:SetOpen(not item2.IsOpen)
        end)
        connection:Connect(UserInputService.InputBegan, function(input)
            local isOpen = input.UserInputType == Enum.UserInputType.MouseButton1 and item2.IsOpen and not enabled3
            local v6
            if isOpen then
                v6 = not connection:IsMouseOverFrame(item3.OptionHolder)
            else
                v6 = isOpen
            end
            if v6 then
                item2:SetOpen(false)
            end
        end)
        local items = item2.Items
        local v6 = nil
        local v7 = nil
        for _, value2 in items, v6, v7 do
            item2:Add(value2)
        end
        if item2.Default then
            item2:Set(item2.Default)
        end
        connection.SetFlags[item2.Flag] = function(v8)
            item2:Set(v8)
        end
        return item2
    end
    function connection.Sections:Label(v6, alignment)
        local item = {}
        item.Window = self.Window
        item.Page = self.Page
        item.Section = self
        item.Name = v6 or "Label"
        if not alignment then
            alignment = "Left"
        end
        item.Alignment = alignment
        item.Count = 0
        local tbl7 = {}
        tbl7.Label = tbl5:Create("Frame", {
            Parent = item.Section.Items.Content.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 0, 15),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Text = tbl5:Create("TextLabel", {
            Parent = tbl7.Label.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item.Name,
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment[item.Alignment],
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Text:AddToTheme({TextColor3 = "Text"})
        function item.Colorpicker(self2, item2)
            if not item2 then
                item2 = {}
            end
            local instance = {
                Window = self2.Window,
                Page = self2.Page,
                Section = self2,
                Name = item2.Name or item2.name or "Colorpicker",
                Flag = item2.Flag or item2.flag or connection:NextFlag(),
                Default = item2.Default or item2.default or Color3.new(1, 1, 1),
            }
            local callback = item2.Callback or item2.callback or (function() end)
            instance.Callback = callback
            instance.Alpha = item2.Alpha or item2.alpha or 0
            instance.Parent = tbl7.Label
            instance.Count = item.Count
            item.Count = item.Count + 1
            instance.Count = item.Count
            local tbl8 = {Name = item.Name, Element = tbl7.Text, Section = instance.Section}
            insert(instance.Page.SearchItems, tbl8)
            return (connection:CreateColorpicker(instance))
        end
        function item.SetText(self2, text2)
            if not text2 then
                text2 = ""
            end
            self2.Name = tostring(text2)
            if tbl7.Text and tbl7.Text.Instance then
                tbl7.Text.Instance.Text = self2.Name
            end
        end
        function item.GetText(item2)
            return item2.Name
        end
        return item
    end
    function connection.Sections:Keybind(item)
        if not item then
            item = {}
        end
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Keybind"
        item2.Flag = item.Flag or item.flag or connection:NextFlag()
        item2.Default = item.Default or item.default or Enum.KeyCode.RightShift
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        item2.Mode = item.Mode or item.mode or "Toggle"
        item2.Key = nil
        item2.Value = ""
        item2.Toggled = false
        item2.Picking = false
        connection.Flags[item2.Flag] = {}
        local item3 = {}
        item3.Keybind = tbl5:Create("Frame", {
            Parent = item2.Section.Items.Content.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 0, 42),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text = tbl5:Create("TextLabel", {
            Parent = item3.Keybind.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Text:AddToTheme({TextColor3 = "Text"})
        item3.RealKeybind = tbl5:Create("TextButton", {
            Parent = item3.Keybind.Instance,
            AutoButtonColor = false,
            Text = "",
            BorderColor3 = fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0, 1),
            Name = "\000",
            Position = newUDim2(0, 0, 1, 0),
            Size = newUDim2(1, 0, 0, 21),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        item3.RealKeybind:AddToTheme({BackgroundColor3 = "Element"})
        tbl5:Create("UIStroke", {
            Parent = item3.RealKeybind.Instance,
            Color = fromRGB(50, 34, 23),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }):AddToTheme({Color = "Border"})
        tbl5:Create("UICorner", {Parent = item3.RealKeybind.Instance, CornerRadius = newUDim(0, 10)})
        item3.Value = tbl5:Create("TextLabel", {
            Parent = item3.RealKeybind.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(245, 242, 238),
            Text = "None",
            Name = "\000",
            BorderSizePixel = 0,
            Size = newUDim2(1, -16, 1, 0),
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Position = newUDim2(0, 4, 0, 1),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        item3.Value:AddToTheme({TextColor3 = "Text"})
        function item2.Get()
            return item2.Toggled, item2.Key
        end
        function item2.SetVisibility(_, visible)
            item3.Keybind.Instance.Visible = visible
        end
        function item2.Set(_, mode)
            if find2(tostring(mode), "Enum") then
                item2.Key = tostring(mode)
                local name = mode.Name == "Backspace" and "None" or mode.Name
                local value2 = gsub(gsub(tbl3[item2.Key] or gsub(name, "Enum.", "") or "None", "KeyCode.", ""), "UserInputType.", "") or "None"
                item2.Value = value2
                item3.Value.Instance.Text = value2
                connection.Flags[item2.Flag] = {Mode = item2.Mode, Key = item2.Key, Toggled = item2.Toggled}
                if item2.Callback then
                    connection:SafeCall(item2.Callback, item2.Toggled)
                end
            elseif find({"Hold", "Toggle", "Always"}, mode) then
                item2.Mode = mode
                item2:SetMode(item2.Mode)
                if item2.Callback then
                    connection:SafeCall(item2.Callback, item2.Toggled)
                end
            elseif type(mode) == "table" then
                local key = mode.Key == "Backspace" and "None" or mode.Key
                item2.Key = tostring(mode.Key)
                if mode.Mode then
                    item2.Mode = mode.Mode
                    item2:SetMode(mode.Mode)
                else
                    item2.Mode = "Toggle"
                    item2:SetMode("Toggle")
                end
                local v6 = tbl3[item2.Key] or gsub(tostring(key), "Enum.", "") or key
                if v6 then
                    gsub(gsub(v6, "KeyCode.", ""), "UserInputType.", "")
                end
                local value2 = gsub(gsub(v6, "KeyCode.", ""), "UserInputType.", "")
                item2.Value = value2
                item3.Value.Instance.Text = value2
                if item2.Callback then
                    connection:SafeCall(item2.Callback, item2.Toggled)
                end
            end
            item2.Picking = false
            item3.Value:ChangeItemTheme({TextColor3 = "Text"})
            item3.Value:Tween(nil, {TextColor3 = connection.Theme.Text})
        end
        function item2.SetMode()
            if item2.Mode == "Always" then
                item2.Toggled = true
            else
                item2.Toggled = false
            end
            connection.Flags[item2.Flag] = {Mode = item2.Mode, Key = item2.Key, Toggled = item2.Toggled}
            if item2.Callback then
                connection:SafeCall(item2.Callback, item2.Toggled)
            end
        end
        function item2.Press(_, toggled)
            if item2.Mode == "Toggle" then
                item2.Toggled = not item2.Toggled
            elseif item2.Mode == "Hold" then
                item2.Toggled = toggled
            elseif item2.Mode == "Always" then
                item2.Toggled = true
            end
            connection.Flags[item2.Flag] = {Mode = item2.Mode, Key = item2.Key, Toggled = item2.Toggled}
            if item2.Callback then
                connection:SafeCall(item2.Callback, item2.Toggled)
            end
        end
        local tbl7 = {Name = item2.Name, Element = item3.Text, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl7)
        item3.RealKeybind:Connect("MouseButton1Click", function()
            if not item2.Picking then
                item2.Picking = true
                item3.Value:ChangeItemTheme({TextColor3 = "Accent"})
                item3.Value:Tween(nil, {TextColor3 = connection.Theme.Accent})
                local connection4 = nil
                connection4 = UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        item2:Set(input.KeyCode)
                    else
                        item2:Set(input.UserInputType)
                    end
                    connection4:Disconnect()
                    connection4 = nil
                end)
            end
        end)
        connection:Connect(UserInputService.InputBegan, function(input)
            if tostring(input.KeyCode) == item2.Key or tostring(input.UserInputType) == item2.Key then
                if item2.Value ~= "None" then
                    if item2.Mode == "Toggle" then
                        item2:Press()
                    elseif item2.Mode == "Hold" then
                        item2:Press(true)
                    end
                end
            end
        end)
        connection:Connect(UserInputService.InputEnded, function(input)
            if tostring(input.KeyCode) == item2.Key or tostring(input.UserInputType) == item2.Key then
                if item2.Value ~= "None" then
                    if item2.Mode == "Hold" then
                        item2:Press(false)
                    end
                end
            end
        end)
        if item2.Default then
            item2:Set({Key = item2.Default, Mode = item2.Mode or "Toggle"})
        end
        connection.SetFlags[item2.Flag] = function(v6)
            item2:Set(v6)
        end
        return item2
    end
    function connection.Sections:Textbox(item)
        if not item then
            item = {}
        end
        local item2 = {}
        item2.Window = self.Window
        item2.Page = self.Page
        item2.Section = self
        item2.Name = item.Name or item.name or "Textbox"
        item2.Flag = item.Flag or item.flag or connection:NextFlag()
        item2.Default = item.Default or item.default or ""
        local callback = item.Callback or item.callback or (function() end)
        item2.Callback = callback
        item2.Placeholder = item.Placeholder or item.placeholder or "Placeholder"
        item2.Value = ""
        local tbl7 = {}
        tbl7.Textbox = tbl5:Create("Frame", {
            Parent = item2.Section.Items.Content.Instance,
            Name = "\000",
            BackgroundTransparency = 1,
            Size = newUDim2(1, 0, 0, 42),
            BorderColor3 = fromRGB(0, 0, 0),
            ZIndex = 4,
            BorderSizePixel = 0,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Text = tbl5:Create("TextLabel", {
            Parent = tbl7.Textbox.Instance,
            FontFace = connection.Font,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = item2.Name,
            Name = "\000",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = newUDim2(1, 0, 0, 15),
            ZIndex = 4,
            TextSize = 14,
            BackgroundColor3 = fromRGB(245, 242, 238),
        })
        tbl7.Text:AddToTheme({TextColor3 = "Text"})
        tbl7.Input = tbl5:Create("TextBox", {
            Parent = tbl7.Textbox.Instance,
            FontFace = connection.Font,
            BorderSizePixel = 0,
            TextColor3 = fromRGB(245, 242, 238),
            BorderColor3 = fromRGB(0, 0, 0),
            Text = "",
            ZIndex = 4,
            Size = newUDim2(1, 0, 0, 21),
            AnchorPoint = Vector2.new(0, 1),
            Position = newUDim2(0, 0, 1, 0),
            Name = "\000",
            PlaceholderColor3 = fromRGB(175, 175, 175),
            TextXAlignment = Enum.TextXAlignment.Left,
            PlaceholderText = item2.Placeholder,
            TextSize = 14,
            BackgroundColor3 = fromRGB(15, 13, 11),
        })
        tbl7.Input:AddToTheme({TextColor3 = "Text", BackgroundColor3 = "Element"})
        tbl5:Create("UICorner", {Parent = tbl7.Input.Instance, CornerRadius = newUDim(0, 10)})
        tbl5:Create("UIStroke", {Parent = tbl7.Input.Instance, Color = fromRGB(50, 34, 23), ApplyStrokeMode = Enum.ApplyStrokeMode.Border}):AddToTheme({Color = "Border"})
        tbl5:Create("UIPadding", {Parent = tbl7.Input.Instance, PaddingTop = newUDim(0, 1), PaddingLeft = newUDim(0, 4)})
        function item2.Get()
            return item2.Value
        end
        function item2.Set(_, text2)
            tbl7.Input.Instance.Text = text2
            item2.Value = text2
            connection.Flags[item2.Flag] = text2
            if item2.Callback then
                connection:SafeCall(item2.Callback, item2.Value)
            end
        end
        function item2.SetVisibility(_, visible)
            tbl7.Textbox.Instance.Visible = visible
        end
        local tbl8 = {Name = item2.Name, Element = tbl7.Text, Section = item2.Section}
        insert(item2.Page.SearchItems, tbl8)
        tbl7.Input:Connect("FocusLost", function()
            item2:Set(tbl7.Input.Instance.Text)
        end)
        if item2.Default then
            item2:Set(item2.Default)
        end
        connection.SetFlags[item2.Flag] = function(v6)
            item2:Set(v6)
        end
        return item2
    end
end
if getgenv().Library then
    pcall(function()
        getgenv().Library:Unload()
    end)
end
connection.MenuKeybind = "Enum.KeyCode.G"
local fontFace = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local tbl3 = {new = function() end}
local TweenService3 = game:GetService("TweenService")
local tbl4 = {}
tbl4.Tween = TweenService3:Create(Instance.new("Frame"), TweenInfo.new(0), {BackgroundTransparency = 1})
local n = 0
function connection.FadeItem(_, v1, v2)
    local v3 = tick()
    if v3 - n > 0.05 then
        local tbl5 = {}
        local create = TweenService3.Create
        local tweenInfo = TweenInfo.new(0)
        local tbl6 = {}
        tbl6[v2] = 1
        tbl5.Tween = create(TweenService3, v1, tweenInfo, tbl6)
        tbl4 = tbl5
        tbl4.Tween:Play()
        n = v3
    end
    return tbl4
end
local function fn38(v1)
    if v1 == nil or v1 == "None" then
        return nil
    elseif typeof(v1) == "EnumItem" then
        return v1
    elseif type(v1) ~= "string" then
        return Enum.KeyCode.Unknown
    elseif v1 == "M1B" then
        return Enum.UserInputType.MouseButton1
    elseif v1 == "M2B" then
        return Enum.UserInputType.MouseButton2
    else
        return Enum.KeyCode[v1] or Enum.KeyCode.Unknown
    end
end
local function fn39(item)
    if typeof(item) == "EnumItem" then
        if item.EnumType == Enum.KeyCode then
            return item.Name
        elseif item == Enum.UserInputType.MouseButton1 then
            return "M1B"
        elseif item == Enum.UserInputType.MouseButton2 then
            return "M2B"
        else
            return item.Name
        end
    else
        local v1 = tostring(item or "None"):gsub("Enum%.KeyCode%.", ""):gsub("Enum%.UserInputType%.", "")
        if v1 == "MouseButton1" then
            return "M1B"
        elseif v1 == "MouseButton2" then
            return "M2B"
        elseif v1 == "Unknown" then
            return "None"
        else
            return v1
        end
    end
end
local function fn40(v1)
    if not v1 then
        return v1
    else
        function v1:SetValue(v2, v3)
            return self:Set(v2, nil, v3)
        end
        function v1:GetValue()
            return self:Get()
        end
        return v1
    end
end
local function fn41(v1)
    if not v1 then
        return v1
    else
        function v1:SetValue(v2)
            return self:Set(v2)
        end
        function v1:SetValues(v2)
            return self:Refresh(v2 or {})
        end
        function v1:GetValue()
            return self.Value
        end
        return v1
    end
end
local function fn42(v1)
    if not v1 then
        return v1
    else
        function v1:SetValue(v2)
            return self:Set(tostring(v2 or ""))
        end
        function v1:GetValue()
            return self:Get()
        end
        return v1
    end
end
local function fn43(v1)
    if not v1 then
        return v1
    else
        function v1:SetValue(v2, v3)
            return self:Set(v2, v3)
        end
        function v1:GetValue()
            return self:Get()
        end
        return v1
    end
end
local function fn44(v1)
    if not v1 then
        return v1
    else
        function v1:SetValue(v2)
            self:Set(fn38(v2))
        end
        function v1:GetValue()
            local _, v2 = self:Get()
            return fn39(v2)
        end
        return v1
    end
end
local function fn45(v1, min)
    if not v1 then
        return v1
    else
        if not v1.Decimals or v1.Decimals <= 0 then
            v1.Decimals = 1
        end
        local set = v1.Set
        function v1:Set(v2)
            local number2 = tonumber(v2)
            if not number2 or number2 ~= number2 or number2 == 1 / 0 or number2 == -1 / 0 then
                number2 = tonumber(self.Value) or tonumber(self.Min) or 0
            end
            return set(self, number2)
        end
        function v1:SetValue(v2)
            return self:Set(v2)
        end
        function v1:GetValue()
            return self:Get()
        end
        if min == nil then
            min = v1.Min or 0
        end
        v1:Set(min)
        return v1
    end
end
local function fn46(list, v1)
    if v1 ~= nil then
        return v1
    else
        local n2 = 0
        if type(list) == "table" then
            n2 = 0
            for _, _ in pairs(list) do
                n2 = n2 + 1
            end
        end
        return math.clamp(n2 * 30 + 10, 50, 220)
    end
end
local fn47 = nil
fn47 = function(v1, v2)
    local item = {Section = v1}
    item.Name = v2 or "Label"
    function item.AddToggle(_, item2)
        if not item2 then
            item2 = {}
        end
        item2.Name = item2.Name or item.Name
        return fn40(v1:Toggle(item2))
    end
    function item.AddKeybind(_, v3)
        local item2 = v3 or {}
        item2.Name = item2.Name or item.Name
        local callback = item2.Callback or (function() end)
        local v4 = nil
        if item2.Default == nil or item2.Default == "None" then
            item2.Default = "None"
        else
            item2.Default = fn38(item2.Default)
        end
        function item2.Callback()
            if v4 then
                local _, v5 = v4:Get()
                pcall(callback, fn39(v5))
            end
        end
        v4 = v1:Keybind(item2)
        return fn44(v4, callback)
    end
    function item.AddTextInput(_, item2)
        if not item2 then
            item2 = {}
        end
        item2.Name = item2.Name or item.Name
        return fn42(v1:Textbox(item2))
    end
    function item.AddDropdown(_, item2)
        if not item2 then
            item2 = {}
        end
        item2.Name = item2.Name or item.Name
        item2.Items = item2.Values or item2.Items or {}
        item2.MaxSize = fn46(item2.Items, item2.MaxSize)
        return fn41(v1:Dropdown(item2))
    end
    function item.AddSlider(_, v3)
        local item2 = v3 or {}
        item2.Name = item2.Name or item.Name
        return fn45(v1:Slider(item2), item2.Default)
    end
    function item.AddColorPicker(_, v3)
        local item2 = v3 or {}
        item2.Name = item2.Name or item.Name
        return fn43(v1:Label(item.Name, "Left"):Colorpicker(item2))
    end
    function item.AddOption()
        return item
    end
    function item.AddLabel(_, v3)
        return fn47(v1, v3)
    end
    function item.AddButton(_, v3)
        return v1:Button(v3 or {})
    end
    return item
end
local function fn48(v1, v2)
    return {
        Page = v1,
        Section = v2,
        AddLabel = function(_, v3)
            return fn47(v2, v3)
        end,
        AddToggle = function(_, v3)
            return fn40(v2:Toggle(v3 or {}))
        end,
        AddKeybind = function(_, v3)
            local tbl5 = v3 or {}
            local callback = tbl5.Callback or (function() end)
            local v4 = nil
            if tbl5.Default == nil or tbl5.Default == "None" then
                tbl5.Default = "None"
            else
                tbl5.Default = fn38(tbl5.Default)
            end
            function tbl5.Callback()
                if v4 then
                    local _, v5 = v4:Get()
                    pcall(callback, fn39(v5))
                end
            end
            v4 = v2:Keybind(tbl5)
            return fn44(v4, callback)
        end,
        AddButton = function(_, v3)
            return v2:Button(v3 or {})
        end,
        AddDropdown = function(_, item)
            if not item then
                item = {}
            end
            item.Name = item.Name or "Dropdown"
            item.Items = item.Values or item.Items or {}
            item.MaxSize = fn46(item.Items, item.MaxSize)
            return fn41(v2:Dropdown(item))
        end,
        AddSlider = function(_, v3)
            local item = v3 or {}
            item.Name = item.Name or "Slider"
            return fn45(v2:Slider(item), item.Default)
        end,
        AddTextInput = function(_, v3)
            return fn42(v2:Textbox(v3 or {}))
        end,
        AddColorPicker = function(_, v3)
            local item = v3 or {}
            return fn43(v2:Label(item.Name or "Color", "Left"):Colorpicker(item))
        end,
    }
end
local fn49 = nil
fn49 = function(v1, v2, v3)
    local tbl5 = {
        Window = v1,
        Page = v2,
        _direct = v3,
        _ensureSubPage = function(self)
            if self._direct then
                return v2
            else
                if not self._defaultSubPage then
                    self._defaultSubPage = v2:SubPage({Name = "Settings"})
                end
                return self._defaultSubPage
            end
        end,
        AddSubPage = function(_, item)
            if not item then
                item = {}
            end
            return fn49(v1, (v2.Items and v2.Items.SubPages and v2 or v2.Page or v2):SubPage({Name = item.Name or item.name or "SubPage"}), true)
        end,
    }
    function tbl5:AddSection(item)
        if not item then
            item = {}
        end
        local side = item.Position or item.Side or "Left"
        local text2 = side:sub(1, 1):upper() .. side:sub(2):lower()
        return fn48(tbl5, (self:_ensureSubPage()):Section({Name = item.Name or "Section", Side = text2}))
    end
    function tbl5:AddLabel(v4)
        if not tbl5._defaultSection then
            tbl5._defaultSection = fn48(tbl5, self:_ensureSubPage():Section({Name = "Settings", Side = "Left"}))
        end
        return tbl5._defaultSection:AddLabel(v4)
    end
    return tbl5
end
if not game:IsLoaded() then
    game.Loaded:Wait()
end
Players = game:GetService("Players")
TweenService = game:GetService("TweenService")
UserInputService = game:GetService("UserInputService")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
TeleportService = game:GetService("TeleportService")
SoundService = game:GetService("SoundService")
HttpService = game:GetService("HttpService")
ContentProvider = game:GetService("ContentProvider")
Lighting = game:GetService("Lighting")
Stats = game:GetService("Stats")
pcall(function()
    local RunService = game:GetService("RunService")
    local function fn50()
        if not fogActive then
            pcall(function()
                Lighting.FogStart = 9000000000
            end)
            pcall(function()
                Lighting.FogEnd = 9000000000
            end)
            pcall(function()
                Lighting.FogColor = Color3.new(1, 1, 1)
            end)
            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA("Atmosphere") then
                    pcall(function()
                        child.Density = 0
                    end)
                    pcall(function()
                        child.Offset = 0
                    end)
                end
            end
        end
    end
    fn50()
    Lighting.ChildAdded:Connect(function(child)
        if child:IsA("Atmosphere") and not fogActive then
            pcall(function()
                child.Density = 0
            end)
        end
    end)
    RunService.Heartbeat:Connect(fn50)
end)
VirtualInputManager = game:GetService("VirtualInputManager")
LP = Players.LocalPlayer
soundIds = {
    ["Enable 1"] = "rbxassetid://100772509583336",
    Sparkle = "rbxassetid://110241936966089",
    ["Laser Click"] = "rbxassetid://18913006341",
    ["Enable 2"] = "rbxassetid://84626036868067",
    Notify = "rbxassetid://103421304020039",
}
customGameSounds = {
    ["Rust Headshot"] = "138750331387064",
    Neverlose = "110168723447153",
    Bubble = "6534947588",
    Steve = "4965083997",
    ["Call of Duty"] = "5952120301",
    Bat = "3333907347",
    ["TF2 Critical"] = "296102734",
    Saber = "8415678813",
    Bameware = "3124331820",
    Money = "13956013041",
    Notif = "6696469190",
    Shutter = "10066921516",
    RIFK7 = "9102080552",
    LazerBeam = "130791043",
    WindowsXPError = "160715357",
    TF2Hitsound = "3455144981",
    TF2Bat = "3333907347",
    BowHit = "1053296915",
    Bow = "3442683707",
    OSU = "7147454322",
    OneNN = "7349055654",
    TF2Pan = "3431749479",
    Mario = "5709456554",
    Bell = "6534947240",
    Pick = "1347140027",
    Fart = "130833677",
    Big = "5332005053",
    Vine = "5332680810",
    Bruh = "4578740568",
    Skeet = "5633695679",
    Fatality = "6534947869",
    Bonk = "5766898159",
    Minecraft = "5869422451",
    Gamesense = "4817809188",
    Bamboo = "3769434519",
    Weeb = "6442965016",
    Beep = "8177256015",
    Bambi = "8437203821",
    Stone = "3581383408",
    ["Old Fatality"] = "6607142036",
    Click = "8053704437",
    Ding = "7149516994",
    Snow = "6455527632",
    Osu = "7149255551",
    TF2 = "2868331684",
    Slime = "6916371803",
    ["Among Us"] = "5700183626",
    One = "7380502345",
    BulletDeflect = "1657157666",
    ["Default Sound"] = "330595293",
    UwU = "8679659744",
    Cod = "160432334",
    ["Blood SFX"] = "8164951181",
    ["Blood Burst"] = "3781479909",
}
customGameSoundNames = {"Default"}
local list = customGameSounds
for key, _ in pairs(list) do
    local v1 = customGameSoundNames
    table.insert(v1, key)
end
local v1 = customGameSoundNames
table.sort(v1, function(str, str2)
    if str == str2 then
        return false
    elseif str == "Default" then
        return true
    elseif str2 == "Default" then
        return false
    else
        return str:lower() < str2:lower()
    end
end)
do
    local function fn50()
        local tbl5 = {Default = nil}
        local list2 = customGameSounds
        for key, value2 in pairs(list2) do
            tbl5[key] = "rbxassetid://" .. value2
        end
        return tbl5
    end
    gunKillSounds = fn50()
    gunshotSounds = fn50()
    knifeKillSounds = fn50()
end
task.spawn(function()
    local tbl5 = {}
    local list2 = soundIds
    for _, value2 in pairs(list2) do
        table.insert(tbl5, value2)
    end
    local list3 = customGameSounds
    for _, value2 in pairs(list3) do
        table.insert(tbl5, "rbxassetid://" .. value2)
    end
    pcall(function()
        ContentProvider:PreloadAsync(tbl5)
    end)
end)
selectedEnableSound = "Enable 1"
selectedDisableSound = "Enable 1"
soundsEnabled = true
selectedGunKill = "Default"
selectedGunshot = "Default"
selectedKnifeKill = "Default"
shutupReload = false
votePadsCF = {
    ["Pad 1"] = CFrame.new(-0.187438965, -64.8124008, -96.2501221, -1, 0, -0, 0, 0, -1, 0, -1, -0),
    ["Pad 2"] = CFrame.new(-10.187439, -64.8124008, -95.0001221, 0.25886941, -0.965912342, -1.719594e-05, 1.719594e-05, 2.24113464e-05, -1, 0.965912342, 0.25886941, 2.24113464e-05),
    ["Pad 3"] = CFrame.new(9.81256104, -64.8124008, -95.0001221, -0.25886941, -0.965912342, 1.719594e-05, 1.719594e-05, -2.24113464e-05, -1, 0.965912342, -0.25886941, 2.24113464e-05),
}
selectedPad = "Pad 2"
voteMapName = ""
selectedVotePad = nil
local voteDupeEnabled = false
DELAY_ON_PAD = 0.38
do
    local v2 = nil
    local n2 = 0
    local enabled3 = false
    local function fn50(instance)
        if not instance then
            return ""
        else
            local v3 = instance:IsA("TextLabel") or instance:IsA("TextButton")
            if not v3 then
                v3 = instance:IsA("TextBox")
            end
            if v3 then
                return tostring(instance.Text or "")
            else
                return ""
            end
        end
    end
    fn19 = function(voteInfoGui)
        if voteInfoGui then
            voteInfoGui = voteInfoGui:FindFirstChild("VoteInfoGui", true)
        end
        if voteInfoGui then
            voteInfoGui = voteInfoGui:FindFirstChild("MapName", true)
        end
        return fn50(voteInfoGui)
    end
    fn20 = function(voteInfoGui)
        if voteInfoGui then
            voteInfoGui = voteInfoGui:FindFirstChild("VoteInfoGui", true)
        end
        if voteInfoGui then
            voteInfoGui = voteInfoGui:FindFirstChild("Votes", true)
        end
        return fn50(voteInfoGui)
    end
    fn21 = function(mapInfoGui)
        if mapInfoGui then
            mapInfoGui = mapInfoGui:FindFirstChild("MapInfoGui", true)
        end
        local mapIcon = mapInfoGui and mapInfoGui:FindFirstChild("MapIcon", true)
        if not mapIcon then
            return ""
        else
            local text2 = ""
            pcall(function()
                text2 = tostring(mapIcon.Image or "")
            end)
            return text2
        end
    end
    fn22 = function()
        local lobby = workspace:FindFirstChild("RegularLobby") or workspace:FindFirstChild("SummerLobby") or workspace:FindFirstChild("Lobby")
        if not lobby then
            return {}
        else
            local list2 = {}
            local list3 = {"VotePad1", "VotePad2", "VotePad3"}
            for _, value2 in ipairs(list3) do
                local instance = lobby:FindFirstChild(value2)
                if instance and instance:FindFirstChild("Pad", true) and instance:FindFirstChild("MapInfoGui", true) and instance:FindFirstChild("VoteInfoGui", true) then
                    table.insert(list2, instance)
                end
            end
            if #list2 == 0 then
                local votePads = lobby:FindFirstChild("VotePads")
                if votePads then
                    for _, child in ipairs(votePads:GetChildren()) do
                        if child:FindFirstChild("Pad", true) and child:FindFirstChild("MapInfoGui", true) and child:FindFirstChild("VoteInfoGui", true) then
                            table.insert(list2, child)
                        end
                    end
                end
            end
            return list2
        end
    end
    local function fn51()
        if selectedVotePad and selectedVotePad.Parent then
            return selectedVotePad
        end
    end
    local function fn52()
        local pad = fn51()
        if pad then
            pad = pad:FindFirstChild("Pad", true)
        end
        local v3
        if pad then
            v3 = pad:IsA("BasePart")
        else
            v3 = pad
        end
        if v3 then
            return pad.CFrame
        end
    end
    local function getVoteInfoGui()
        local voteInfoGui = fn51()
        if voteInfoGui then
            voteInfoGui = voteInfoGui:FindFirstChild("VoteInfoGui", true)
        end
        return voteInfoGui
    end
    local function fn53()
        local voteInfoGui = getVoteInfoGui()
        if not voteInfoGui then
            return false
        else
            local enabled4 = false
            pcall(function()
                if voteInfoGui:IsA("LayerCollector") then
                    enabled4 = voteInfoGui.Enabled == true
                elseif voteInfoGui:IsA("GuiObject") then
                    enabled4 = voteInfoGui.Visible == true
                else
                    enabled4 = voteInfoGui.Enabled == true
                end
            end)
            return enabled4
        end
    end
    fn23 = function()
        if not v2 then
            n2 = n2 + 1
            local v3 = n2
            local thread = task.spawn(function()
                while true do
                    local v4 = voteDupeEnabled
                    if voteDupeEnabled then
                        v4 = n2 == v3
                    end
                    if v4 then
                        if not fn53() then
                            while true do
                                task.wait(0.5)
                                if not (fn53() or not voteDupeEnabled or n2 ~= v3) then
                                    continue
                                end
                                break
                            end
                        end
                        if not (not voteDupeEnabled or n2 ~= v3) then
                            local character = LP.Character
                            while true do
                                if not character and voteDupeEnabled and n2 == v3 then
                                    task.wait(0.1)
                                    character = LP.Character
                                    continue
                                end
                                break
                            end
                            if not (not character or not voteDupeEnabled or n2 ~= v3) then
                                local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
                                local humanoid = character:WaitForChild("Humanoid", 5)
                                local v5 = voteDupeEnabled
                                if voteDupeEnabled then
                                    v5 = n2 == v3
                                end
                                if v5 then
                                    v5 = fn53()
                                end
                                if v5 then
                                    v5 = humanoidRootPart
                                end
                                if v5 then
                                    v5 = humanoid
                                end
                                if v5 then
                                    v5 = humanoid.Health > 0
                                end
                                if v5 then
                                    local v6 = fn52()
                                    if v6 then
                                        if not pcall(function()
                                            character:PivotTo(v6 * CFrame.new(0, 1.5, 0))
                                        end) then
                                            humanoidRootPart.CFrame = v6 * CFrame.new(0, 1.5, 0)
                                        end
                                    end
                                    local v7 = DELAY_ON_PAD
                                    task.wait(v7)
                                    local v8 = voteDupeEnabled
                                    if voteDupeEnabled then
                                        v8 = n2 == v3
                                    end
                                    if v8 and fn53() and humanoid and humanoid.Health > 0 then
                                        humanoid.Health = 0
                                        character:BreakJoints()
                                        while true do
                                            task.wait(0.1)
                                            if not (LP.Character or not voteDupeEnabled or n2 ~= v3) then
                                                continue
                                            end
                                            break
                                        end
                                        task.wait(0.05)
                                    end
                                else
                                    task.wait(0.2)
                                end
                                continue
                            end
                            break
                        end
                        break
                    end
                    break
                end
                if n2 == v3 then
                    v2 = nil
                    if voteDupeEnabled then
                        voteDupeEnabled = false
                        pcall(function()
                            local voteDuper = uiRefs and uiRefs.VoteDuper
                            if voteDuper and voteDuper.SetValue then
                                voteDuper:SetValue(false, true)
                            end
                        end)
                    end
                end
            end)
            v2 = thread
        end
    end
    disableVoteDupe = function()
        voteDupeEnabled = false
        n2 = n2 + 1
        enabled3 = false
        local v3 = v2
        v2 = nil
        if v3 then
            pcall(task.cancel, v3)
        end
        pcall(function()
            local voteDuper = uiRefs and uiRefs.VoteDuper
            if voteDuper and voteDuper.SetValue then
                voteDuper:SetValue(false, true)
            end
        end)
    end
    fn24 = function()
        if not enabled3 then
            enabled3 = true
            task.spawn(function()
                while true do
                    if enabled3 then
                        task.wait(0.25)
                        local v3 = voteDupeEnabled
                        if voteDupeEnabled then
                            v3 = not v2
                        end
                        if v3 then
                            voteDupeEnabled = false
                            n2 = n2 + 1
                            pcall(function()
                                local voteDuper = uiRefs and uiRefs.VoteDuper
                                if voteDuper and voteDuper.SetValue and voteDuper:GetValue() ~= false then
                                    voteDuper:SetValue(false, true)
                                end
                            end)
                            continue
                        end
                        continue
                    end
                    break
                end
            end)
        end
    end
end
local function fn50(soundId)
    if not (not soundsEnabled or not soundId) then
        pcall(function()
            local sound = Instance.new("Sound")
            sound.SoundId = soundId
            sound.Volume = 1
            sound.Parent = SoundService
            sound.TimePosition = 0
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 5)
        end)
    end
end
local function fn51()
    fn50(soundIds[selectedEnableSound])
end
local function fn52()
    fn50(soundIds[selectedDisableSound])
end
do
    local tbl5 = {}
    local function fn53(instance)
        if not (not instance:IsA("Sound") or tbl5[instance]) then
            tbl5[instance] = true
            instance.Played:Connect(function()
                if instance.Name == "GunKill" and selectedGunKill ~= "Default" and gunKillSounds[selectedGunKill] then
                    if instance.SoundId ~= gunKillSounds[selectedGunKill] then
                        instance.SoundId = gunKillSounds[selectedGunKill]
                        instance.TimePosition = 0
                        instance:Play()
                    end
                elseif instance.Name == "Gunshot" and selectedGunshot ~= "Default" and gunshotSounds[selectedGunshot] then
                    if instance.SoundId ~= gunshotSounds[selectedGunshot] then
                        instance.SoundId = gunshotSounds[selectedGunshot]
                        instance.TimePosition = 0
                        instance:Play()
                    end
                elseif instance.Name == "Kill" and selectedKnifeKill ~= "Default" and knifeKillSounds[selectedKnifeKill] then
                    if instance.SoundId ~= knifeKillSounds[selectedKnifeKill] then
                        instance.SoundId = knifeKillSounds[selectedKnifeKill]
                        instance.TimePosition = 0
                        instance:Play()
                    end
                elseif instance.Name == "Reload" and shutupReload then
                    instance.Volume = 0
                    instance:Stop()
                end
            end)
        end
    end
    workspace.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("Sound") and (descendant.Name == "GunKill" or descendant.Name == "Gunshot" or descendant.Name == "Kill" or descendant.Name == "Reload") then
            fn53(descendant)
        end
    end)
    local v2 = table.pack(workspace:GetDescendants())
    local n2 = v2.n
    v2.n = 1 + n2 - 1
    table.move(v2, 1, n2, 1, v2)
    for _, value2 in ipairs(table.unpack(v2, 1, v2.n)) do
        if value2:IsA("Sound") and (value2.Name == "GunKill" or value2.Name == "Gunshot" or value2.Name == "Kill" or value2.Name == "Reload") then
            fn53(value2)
        end
    end
end
offDamageWater = false
disabledConnections = {}
modifiedWaterParts = {}
local function fn53(instance)
    if not instance then
        return false
    else
        local str = instance.Name:lower()
        local v2 = str:find("water") or str:find("river")
        if not v2 then
            v2 = str:find("ocean")
        end
        if v2 then
            return true
        else
            local splash = instance:FindFirstChild("Splash")
            if not splash then
                splash = instance:FindFirstChild("HitWater")
            end
            if splash then
                return true
            else
                return false
            end
        end
    end
end
local function fn54(instance)
    if not (not instance or not instance:IsA("BasePart")) then
        if not modifiedWaterParts[instance] then
            modifiedWaterParts[instance] = instance.CanTouch
        end
        instance.CanTouch = false
        if getconnections then
            pcall(function()
                for _, value2 in ipairs(getconnections(instance.Touched)) do
                    value2:Disable()
                    local v2 = disabledConnections
                    table.insert(v2, value2)
                end
            end)
        end
    end
end
local function fn55()
    local n2 = 0
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("BasePart") then
            local parent = descendant
            local enabled3
            while true do
                enabled3 = false
                if parent and parent ~= workspace then
                    if fn53(parent) then
                        enabled3 = true
                    else
                        parent = parent.Parent
                        continue
                    end
                else
                    break
                end
                if enabled3 then
                    fn54(descendant)
                    n2 = 1
                    break
                end
                n2 = 1
                break
            end
            if n2 > 0 then
                n2 = n2 - 1
                if n2 == 0 then
                    continue
                else
                    break
                end
            elseif n2 < 0 then
                local _ = n2 + 1
                break
            end
            if enabled3 then
                fn54(descendant)
            end
        end
    end
end
local function fn56()
    local list2 = modifiedWaterParts
    for key, value2 in pairs(list2) do
        local canTouch = value2
        local parent
        if key then
            parent = key.Parent
        else
            parent = key
        end
        if parent then
            pcall(function()
                key.CanTouch = canTouch
            end)
        end
    end
    local v2 = modifiedWaterParts
    table.clear(v2)
    local list3 = disabledConnections
    for _, value2 in ipairs(list3) do
        pcall(function()
            value2:Enable()
        end)
    end
    local v3 = disabledConnections
    table.clear(v3)
end
workspace.DescendantAdded:Connect(function(descendant)
    if offDamageWater then
        if descendant:IsA("BasePart") then
            task.wait()
            local parent = descendant
            while true do
                local enabled3 = false
                if parent and parent ~= workspace then
                    if fn53(parent) then
                        break
                    else
                        parent = parent.Parent
                        continue
                    end
                end
                if enabled3 then
                    fn54(descendant)
                end
                return
            end
            if true then
                fn54(descendant)
            end
        end
    end
end)
trailsEnabled = false
trailStyle = "Solid"
trailColor = Color3.fromRGB(170, 90, 255)
trailObj = nil
trailAtt0 = nil
trailAtt1 = nil
magicAuraEnabled = false
magicAuraParts = {}
do
    local tbl5 = {}
    local color = Color3.fromRGB(170, 90, 255)
    local color2 = Color3.fromRGB(255, 90, 130)
    local color3 = Color3.fromRGB(90, 255, 130)
    local color4 = Color3.fromRGB(255, 255, 90)
    local color5 = Color3.fromRGB(255, 130, 255)
    local v2 = table.pack(Color3.fromRGB(130, 255, 255))
    tbl5[1], tbl5[2], tbl5[3], tbl5[4], tbl5[5] = color, color2, color3, color4, color5
    table.move(v2, 1, v2.n, 6, tbl5)
    magicAuraColors = tbl5
end
rtxEnabled = false
rtxApplied = false
rtxSaved = {}
rtxAddedFx = {}
rtxSavedChildren = {}
rtxVignetteGui = nil
timeLockEnabled = false
timeLockVal = 14
timeLockMode = "Off"
timeLockModes = {Off = nil, Dawn = 6, Day = 12, Sunset = 18, Night = 21, Midnight = 0, Custom = "custom"}
weatherEnabled = false
weatherType = "Fog"
weatherPart = nil
weatherEmitter = nil
origFog = {}
fogActive = false
do
    KITI_SkyboxEnabled = KITI_SkyboxEnabled or false
end
do
    KITI_SkyboxId = KITI_SkyboxId or nil
end
do
    KITI_SkyboxName = KITI_SkyboxName or nil
end
local function fn57(v2, v3)
    task.spawn(function()
        local v4, list2 = pcall(function()
            return game:GetObjects("rbxassetid://" .. tostring(v2))
        end)
        if not v4 or not list2 or #list2 == 0 then
            local newFn = tbl3.new
            local tbl5 = {Title = "Skybox"}
            local text2
            if v3 then
                text2 = v3
            else
                text2 = tostring(v2)
            end
            tbl5.Content = "Failed to load " .. text2
            tbl5.Duration = 3
            newFn(tbl5)
        else
            local instance = list2[1]
            local sky = instance:IsA("Sky") and instance or instance:FindFirstChildOfClass("Sky")
            if not sky then
                pcall(function()
                    instance:Destroy()
                end)
                tbl3.new({Title = "Skybox", Content = "Sky not found in model", Duration = 3})
            else
                local sky2 = Lighting:FindFirstChildOfClass("Sky")
                if sky2 then
                    sky2:Destroy()
                end
                Lighting.ClockTime = 14
                Lighting.Brightness = 0.5
                sky.Parent = Lighting
                if instance ~= sky then
                    pcall(function()
                        instance:Destroy()
                    end)
                end
                KITI_SkyboxEnabled = true
                KITI_SkyboxId = tonumber(v2) or v2
                local text2 = v3
                if not v3 then
                    text2 = "Skybox"
                end
                KITI_SkyboxName = text2
                local newFn = tbl3.new
                local tbl5 = {Title = "Skybox"}
                local text3 = v3
                if not v3 then
                    text3 = "Skybox"
                end
                tbl5.Content = text3 .. " applied!"
                tbl5.Duration = 2
                newFn(tbl5)
            end
        end
    end)
end
local function disableKITI_Skybox()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then
        sky:Destroy()
    end
    KITI_SkyboxEnabled = false
    KITI_SkyboxId = nil
    KITI_SkyboxName = nil
    tbl3.new({Title = "Skybox", Content = "Sky removed!", Duration = 2})
end
do
    local function fn58(instance)
        if trailObj then
            trailObj:Destroy()
        end
        if trailAtt0 then
            trailAtt0:Destroy()
        end
        if trailAtt1 then
            trailAtt1:Destroy()
        end
        local humanoidRootPart = instance:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            trailAtt0 = Instance.new("Attachment", humanoidRootPart)
            local v2 = trailAtt0
            v2.Position = Vector3.new(0, 1, 0)
            trailAtt1 = Instance.new("Attachment", humanoidRootPart)
            local v3 = trailAtt1
            v3.Position = Vector3.new(0, -1, 0)
            trailObj = Instance.new("Trail")
            trailObj.Attachment0 = trailAtt0
            trailObj.Attachment1 = trailAtt1
            trailObj.Lifetime = 0.8
            trailObj.LightEmission = 0.5
            trailObj.MinLength = 0.05
            trailObj.Parent = humanoidRootPart
        end
    end
    local function fn59()
        if trailObj then
            if trailStyle == "Solid" then
                local v2 = trailColor
                trailObj.Color = ColorSequence.new(v2)
                trailObj.Transparency = NumberSequence.new(0, 0.8)
            elseif trailStyle == "Fade" then
                local v2 = trailColor
                trailObj.Color = ColorSequence.new(v2)
                trailObj.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.5), NumberSequenceKeypoint.new(1, 1)})
            elseif trailStyle == "Rainbow" then
                trailObj.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 165, 0)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211)),
                })
                trailObj.Transparency = NumberSequence.new(0, 0.6)
            elseif trailStyle == "Dotted" then
                local v2 = trailColor
                trailObj.Color = ColorSequence.new(v2)
                trailObj.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.1, 1),
                    NumberSequenceKeypoint.new(0.2, 0),
                    NumberSequenceKeypoint.new(0.3, 1),
                    NumberSequenceKeypoint.new(0.4, 0),
                    NumberSequenceKeypoint.new(0.5, 1),
                    NumberSequenceKeypoint.new(0.6, 0),
                    NumberSequenceKeypoint.new(0.7, 1),
                    NumberSequenceKeypoint.new(0.8, 0),
                    NumberSequenceKeypoint.new(0.9, 1),
                    NumberSequenceKeypoint.new(1, 0),
                })
            end
        end
    end
    RunService.RenderStepped:Connect(function()
        local character = LP.Character
        if character then
            if trailsEnabled then
                if not trailObj or not trailObj.Parent then
                    fn58(character)
                end
                fn59()
                if trailObj then
                    trailObj.Enabled = true
                end
            elseif trailObj then
                trailObj.Enabled = false
            end
        end
    end)
end
RunService.RenderStepped:Connect(function()
    local character = LP.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            if magicAuraEnabled then
                while true do
                    if #magicAuraParts < 6 then
                        local part = Instance.new("Part")
                        part.Name = "AuraSphere"
                        part.Anchored = true
                        part.CanCollide = false
                        part.Material = Enum.Material.Neon
                        part.Shape = Enum.PartType.Ball
                        part.Size = Vector3.new(0.6000000238418579, 0.6000000238418579, 0.6000000238418579)
                        part.Transparency = 0.3
                        part.Parent = workspace
                        local v2 = magicAuraParts
                        table.insert(v2, part)
                        continue
                    end
                    break
                end
                local v2 = tick()
                local list2 = magicAuraParts
                for i, value2 in ipairs(list2) do
                    local value3 = (i - 1) * 1.0471975511965976
                    local value4 = math.sin(v2 * 2 + value3) * 1
                    local value5 = v2 * 1.5 + value3
                    local value6 = math.cos(value5) * 3
                    local value7 = math.sin(value5) * 3
                    value2.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(value6, value4, value7))
                    value2.Color = magicAuraColors[i] or Color3.fromRGB(170, 90, 255)
                    value2.Transparency = 0.3
                end
            else
                local list2 = magicAuraParts
                for _, value2 in ipairs(list2) do
                    pcall(function()
                        value2:Destroy()
                    end)
                end
                magicAuraParts = {}
            end
        end
    end
end)
local function fn58()
    if not rtxApplied then
        rtxApplied = true
        rtxEnabled = true
        local list2 = {
            "Ambient",
            "Brightness",
            "ColorShift_Bottom",
            "ColorShift_Top",
            "EnvironmentDiffuseScale",
            "EnvironmentSpecularScale",
            "GlobalShadows",
            "OutdoorAmbient",
            "ShadowSoftness",
            "ClockTime",
            "GeographicLatitude",
            "ExposureCompensation",
        }
        for _, value2 in ipairs(list2) do
            pcall(function()
                rtxSaved[value2] = Lighting[value2]
            end)
        end
        rtxSavedChildren = {}
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("PostEffect") or child:IsA("Sky") or child:IsA("Atmosphere") then
                child.Parent = nil
                local v2 = rtxSavedChildren
                table.insert(v2, child)
            end
        end
        local bloomEffect = Instance.new("BloomEffect")
        bloomEffect.Intensity = 0.35
        bloomEffect.Size = 20
        bloomEffect.Threshold = 0.85
        local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        colorCorrectionEffect.Brightness = 0.05
        colorCorrectionEffect.Contrast = 0.25
        colorCorrectionEffect.Saturation = 0.15
        colorCorrectionEffect.TintColor = Color3.fromRGB(255, 245, 230)
        local sunRaysEffect = Instance.new("SunRaysEffect")
        sunRaysEffect.Intensity = 0.12
        sunRaysEffect.Spread = 0.8
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "http://www.roblox.com/asset/?id=151165214"
        sky.SkyboxDn = "http://www.roblox.com/asset/?id=151165197"
        sky.SkyboxFt = "http://www.roblox.com/asset/?id=151165224"
        sky.SkyboxLf = "http://www.roblox.com/asset/?id=151165191"
        sky.SkyboxRt = "http://www.roblox.com/asset/?id=151165206"
        sky.SkyboxUp = "http://www.roblox.com/asset/?id=151165227"
        sky.SunAngularSize = 11
        local atmosphere = Instance.new("Atmosphere")
        atmosphere.Density = 0.3
        atmosphere.Offset = 0.25
        atmosphere.Color = Color3.fromRGB(199, 175, 166)
        atmosphere.Decay = Color3.fromRGB(44, 39, 33)
        atmosphere.Glare = 0.35
        atmosphere.Haze = 1.2
        rtxAddedFx = {bloomEffect, colorCorrectionEffect, sunRaysEffect, sky, atmosphere}
        local list3 = rtxAddedFx
        for _, value2 in ipairs(list3) do
            value2.Parent = Lighting
        end
        pcall(function()
            Lighting.Technology = Enum.Technology.Future
        end)
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        Lighting.Brightness = 2
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.EnvironmentDiffuseScale = 1
        Lighting.EnvironmentSpecularScale = 1
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
        Lighting.ShadowSoftness = 0.15
        Lighting.ClockTime = 14
        Lighting.GeographicLatitude = 45
        Lighting.ExposureCompensation = 0.1
        rtxVignetteGui = Instance.new("ScreenGui")
        rtxVignetteGui.Name = "_AirflowVignette"
        rtxVignetteGui.IgnoreGuiInset = true
        rtxVignetteGui.ResetOnSpawn = false
        rtxVignetteGui.Parent = LP:WaitForChild("PlayerGui")
        local v2 = rtxVignetteGui
        local imageLabel = Instance.new("ImageLabel", v2)
        imageLabel.AnchorPoint = Vector2.new(0.5, 1)
        imageLabel.Position = UDim2.new(0.5, 0, 1, 0)
        imageLabel.Size = UDim2.new(1, 0, 1.05, 0)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = "rbxassetid://4576475446"
        imageLabel.ImageTransparency = 0.35
        imageLabel.ZIndex = 10
    end
end
local function fn59()
    if rtxApplied then
        rtxApplied = false
        rtxEnabled = false
        local list2 = rtxAddedFx
        for _, value2 in ipairs(list2) do
            pcall(function()
                value2:Destroy()
            end)
        end
        rtxAddedFx = {}
        local list3 = rtxSavedChildren
        for _, value2 in ipairs(list3) do
            pcall(function()
                value2.Parent = Lighting
            end)
        end
        rtxSavedChildren = {}
        local list4 = rtxSaved
        for key, value2 in pairs(list4) do
            local v2 = value2
            pcall(function()
                Lighting[key] = v2
            end)
        end
        rtxSaved = {}
        if rtxVignetteGui then
            pcall(function()
                rtxVignetteGui:Destroy()
            end)
            rtxVignetteGui = nil
        end
    end
end
RunService.Heartbeat:Connect(function()
    if timeLockEnabled and timeLockMode ~= "Off" then
        local v2 = timeLockModes[timeLockMode]
        local v3 = v2 == "custom" and timeLockVal
        if v3 then
            v2 = v3
        end
        if type(v2) == "number" then
            local clockTime = v2
            pcall(function()
                Lighting.ClockTime = clockTime
            end)
        end
    end
end)
do
    local function fn60()
        if weatherEmitter then
            pcall(function()
                weatherEmitter:Destroy()
            end)
            weatherEmitter = nil
        end
        if weatherPart then
            pcall(function()
                weatherPart:Destroy()
            end)
            weatherPart = nil
        end
    end
    local function fn61(v2)
        if v2 and not fogActive then
            origFog.FogEnd = Lighting.FogEnd
            origFog.FogStart = Lighting.FogStart
            origFog.FogColor = Lighting.FogColor
            fogActive = true
            pcall(function()
                Lighting.FogStart = 0
                Lighting.FogEnd = 80
                Lighting.FogColor = Color3.fromRGB(180, 180, 190)
            end)
        elseif not v2 and fogActive then
            fogActive = false
            pcall(function()
                Lighting.FogStart = origFog.FogStart or 0
                Lighting.FogEnd = origFog.FogEnd or 100000
                local v3 = Lighting
                local fogColor = origFog.FogColor
                local color
                if fogColor then
                    color = fogColor
                else
                    color = Color3.fromRGB(192, 192, 192)
                end
                v3.FogColor = color
            end)
        end
    end
    local function fn62(v2)
        fn60()
        weatherPart = Instance.new("Part")
        weatherPart.Name = "_AirflowWeather"
        local v3 = weatherPart
        v3.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
        weatherPart.Anchored = true
        weatherPart.CanCollide = false
        weatherPart.Transparency = 1
        weatherPart.Parent = workspace
        local v4 = weatherPart
        weatherEmitter = Instance.new("ParticleEmitter", v4)
        weatherEmitter.LockedToPart = false
        weatherEmitter.Speed = NumberRange.new(0)
        if v2 == "Rain" then
            weatherEmitter.Texture = "rbxassetid://241876428"
            weatherEmitter.Lifetime = NumberRange.new(0.6, 0.9)
            weatherEmitter.Rate = 600
            weatherEmitter.Speed = NumberRange.new(120, 140)
            local v5 = weatherEmitter
            v5.SpreadAngle = Vector2.new(2, 2)
            local v6 = weatherEmitter
            v6.Acceleration = Vector3.new(0, -10, 0)
            weatherEmitter.Size = NumberSequence.new(0.4)
            weatherEmitter.Transparency = NumberSequence.new(0.3)
            weatherEmitter.Color = ColorSequence.new(Color3.fromRGB(180, 200, 240))
            weatherEmitter.Orientation = Enum.ParticleOrientation.VelocityParallel
        elseif v2 == "Snow" then
            weatherEmitter.Texture = "rbxassetid://241876428"
            weatherEmitter.Lifetime = NumberRange.new(3, 5)
            weatherEmitter.Rate = 250
            weatherEmitter.Speed = NumberRange.new(8, 14)
            local v5 = weatherEmitter
            v5.SpreadAngle = Vector2.new(20, 20)
            local v6 = weatherEmitter
            v6.Acceleration = Vector3.new(0, -2, 0)
            weatherEmitter.RotSpeed = NumberRange.new(-30, 30)
            weatherEmitter.Size = NumberSequence.new(0.3)
            weatherEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0.6)})
            weatherEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        end
        weatherEmitter.EmissionDirection = Enum.NormalId.Bottom
    end
    local function fn63()
        if not weatherEnabled or weatherType == "Off" then
            fn60()
            fn61(false)
        elseif weatherType == "Fog" then
            fn60()
            fn61(true)
        else
            fn61(false)
            fn62(weatherType)
        end
    end
    RunService.RenderStepped:Connect(function()
        if not (not weatherEnabled or not weatherPart or not weatherPart.Parent) then
            local currentCamera = workspace.CurrentCamera
            if currentCamera then
                local position = currentCamera.CFrame.Position
                weatherPart.CFrame = CFrame.new(position.X, position.Y + 60, position.Z)
            end
        end
    end)
    customGunModelEnabled = false
    selectedGunModelName = "AWP"
    local tbl5 = {}
    do
        local awp = {id = "4531395275"}
        local angles = CFrame.Angles
        awp.rot = angles(0, 0, 0)
        awp.pos = CFrame.new(0, 0, -0.5)
        tbl5.AWP = awp
    end
    local pistol = {id = "5102714039"}
    local angles = CFrame.Angles
    pistol.rot = angles(0, 3.141592653589793, 0)
    pistol.pos = CFrame.new(0, 0, 0.5)
    tbl5.Pistol = pistol
    do
        local shotgun = {id = "5294131243"}
        local angles2 = CFrame.Angles
        shotgun.rot = angles2(0, 3.141592653589793, 0)
        shotgun.pos = CFrame.new(0, 0, 0.8)
        tbl5.Shotgun = shotgun
    end
    local rayGun = {id = "542699703"}
    local angles2 = CFrame.Angles
    rayGun.rot = angles2(0, 3.141592653589793, 0)
    rayGun.pos = CFrame.new(0, 0, 0.2)
    tbl5.RayGun = rayGun
    do
        local ak47 = {id = "127200798279812"}
        local angles3 = CFrame.Angles
        ak47.rot = angles3(1.5707963267948966, 0, -1.5707963267948966)
        ak47.pos = CFrame.new(0, -0.3, 0.3)
        tbl5["AK-47"] = ak47
    end
    do
        local pinkGun = {id = "18610978709"}
        local angles3 = CFrame.Angles
        pinkGun.rot = angles3(0, 0, 0)
        pinkGun.pos = CFrame.new(0, 0, -0.3)
        tbl5.PinkGun = pinkGun
    end
    do
        local flameGun = {id = "10656806096"}
        local angles3 = CFrame.Angles
        flameGun.rot = angles3(-1.5707963267948966, 1.5707963267948966, 1.5707963267948966)
        flameGun.pos = CFrame.new(2.1, 0, -0.3)
        tbl5.FlameGun = flameGun
    end
    do
        local miniBlackGun = {id = "62932622"}
        local angles3 = CFrame.Angles
        miniBlackGun.rot = angles3(1.5707963267948966, 0, 0)
        miniBlackGun.pos = CFrame.new(0, 0, 0)
        tbl5.MiniBlackGun = miniBlackGun
    end
    do
        local blueGun = {id = "87594143804300"}
        local angles3 = CFrame.Angles
        blueGun.rot = angles3(-1.5707963267948966, 1.5707963267948966, 1.5707963267948966)
        blueGun.pos = CFrame.new(0, -0.3, 0.5)
        tbl5.BlueGun = blueGun
    end
    do
        local bigUSPS = {id = "12899296613"}
        local angles3 = CFrame.Angles
        bigUSPS.rot = angles3(0, 0, 0)
        bigUSPS.pos = CFrame.new(0, 0, -1.3)
        tbl5["BigUSP-S"] = bigUSPS
    end
    do
        local greenGun = {id = "1297856838"}
        local angles3 = CFrame.Angles
        greenGun.rot = angles3(1.5707963267948966, 0, 0)
        greenGun.pos = CFrame.new(0, -0.3, 0)
        tbl5.GreenGun = greenGun
    end
    gunModelCache = {}
    local function fn64(v2)
        local text2 = tostring(v2)
        if gunModelCache[text2] then
            return gunModelCache[text2]:Clone()
        else
            local v3, list2 = pcall(function()
                return game:GetObjects("rbxassetid://" .. text2)
            end)
            if v3 then
                v3 = list2
            end
            if v3 then
                v3 = #list2 > 0
            end
            if v3 then
                gunModelCache[text2] = list2[1]
                return list2[1]:Clone()
            else
                return nil
            end
        end
    end
    local function fn65(instance)
        if not (not instance or not instance:IsA("Tool") or instance.Name ~= "Gun") then
            local customGunModel = instance:FindFirstChild("CustomGunModel")
            if customGunModel then
                customGunModel:Destroy()
            end
            for _, descendant in ipairs(instance:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Transparency = 0
                elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
                    descendant.Transparency = 0
                end
            end
        end
    end
    local function fn66(parent)
        if not (not parent or not parent:IsA("Tool") or parent.Name ~= "Gun") then
            if not customGunModelEnabled then
                fn65(parent)
            else
                local v2 = tbl5[selectedGunModelName]
                if v2 then
                    local character = LP.Character
                    if not (not character or parent.Parent ~= character) then
                        local rightArm = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
                        if rightArm then
                            local customGunModel = parent:FindFirstChild("CustomGunModel")
                            if customGunModel then
                                customGunModel:Destroy()
                            end
                            local instance = fn64(v2.id)
                            if instance then
                                instance.Name = "CustomGunModel"
                                for _, descendant in ipairs(parent:GetDescendants()) do
                                    if descendant:IsA("BasePart") and not descendant:IsDescendantOf(instance) then
                                        descendant.Transparency = 1
                                    elseif (descendant:IsA("Decal") or descendant:IsA("Texture")) and not descendant:IsDescendantOf(instance) then
                                        descendant.Transparency = 1
                                    end
                                end
                                local basePart = instance:IsA("BasePart") and instance or instance.PrimaryPart or instance:FindFirstChild("Handle") or instance:FindFirstChildWhichIsA("BasePart", true)
                                if not basePart then
                                    instance:Destroy()
                                else
                                    for _, descendant in ipairs(instance:GetDescendants()) do
                                        if descendant:IsA("BasePart") then
                                            descendant.CanCollide = false
                                            descendant.Anchored = false
                                            descendant.Massless = true
                                        end
                                    end
                                    local value2 = character:FindFirstChild("UpperTorso") ~= nil
                                    if value2 then
                                        local cframe = CFrame.new(0, -0.25, -0.1)
                                        local angles3 = CFrame.Angles
                                        value2 = cframe * angles3(-1.5707963267948966, 0, 0)
                                    end
                                    if not value2 then
                                        local cframe = CFrame.new(0, -1, -0.1)
                                        local angles3 = CFrame.Angles
                                        value2 = cframe * angles3(-1.5707963267948966, 0, 0)
                                    end
                                    local cFrame = rightArm.CFrame * value2 * v2.rot * v2.pos
                                    if instance:IsA("Model") then
                                        instance:PivotTo(cFrame)
                                    elseif instance:IsA("BasePart") then
                                        instance.CFrame = cFrame
                                    end
                                    local weldConstraint = Instance.new("WeldConstraint")
                                    weldConstraint.Part0 = rightArm
                                    weldConstraint.Part1 = basePart
                                    weldConstraint.Parent = basePart
                                    for _, part1 in ipairs(instance:GetDescendants()) do
                                        if part1:IsA("BasePart") and part1 ~= basePart then
                                            local weldConstraint2 = Instance.new("WeldConstraint")
                                            weldConstraint2.Part0 = basePart
                                            weldConstraint2.Part1 = part1
                                            weldConstraint2.Parent = part1
                                        end
                                    end
                                    instance.Parent = parent
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    fn16 = function()
        local backpack = LP:FindFirstChild("Backpack")
        if backpack then
            local gun = backpack:FindFirstChild("Gun")
            if gun then
                if customGunModelEnabled then
                    fn66(gun)
                else
                    fn65(gun)
                end
            end
        end
        if LP.Character then
            local gun = LP.Character:FindFirstChild("Gun")
            if gun then
                if customGunModelEnabled then
                    fn66(gun)
                else
                    fn65(gun)
                end
            end
        end
    end
    local fn67 = function(instance)
        if instance then
            local function fn67(instance2)
                instance2.Equipped:Connect(function()
                    if customGunModelEnabled then
                        task.wait(0.02)
                        fn66(instance2)
                    end
                end)
                instance2.Unequipped:Connect(function()
                    local customGunModel = instance2:FindFirstChild("CustomGunModel")
                    if customGunModel then
                        customGunModel:Destroy()
                    end
                end)
                local v2 = customGunModelEnabled
                if customGunModelEnabled then
                    v2 = instance2.Parent == LP.Character
                end
                if v2 then
                    fn66(instance2)
                end
            end
            instance.ChildAdded:Connect(function(child)
                if child:IsA("Tool") and child.Name == "Gun" then
                    task.wait(0.05)
                    fn67(child)
                end
            end)
            local gun = instance:FindFirstChild("Gun")
            if gun then
                fn67(gun)
            end
        end
    end;
    (function()
        fn67((LP:WaitForChild("Backpack")))
        if LP.Character then
            fn67(LP.Character)
        end
        LP.CharacterAdded:Connect(function(character)
            fn67(character)
        end)
    end)()
    tbl2 = {BeamType = "Default"}
    tbl2.BeamColor = Color3.fromRGB(0, 240, 255)
    do
        local function fn68(v2, v3, v4, color)
            local magnitude = (v3 - v2).Magnitude
            if not (magnitude < 1) then
                local part = Instance.new("Part")
                part.Anchored = true
                part.CanCollide = false
                part.Material = Enum.Material.Neon
                if not color then
                    color = tbl2.BeamColor
                end
                part.Color = color
                part.Shape = Enum.PartType.Cylinder
                part.Size = Vector3.new(magnitude, v4, v4)
                local value2 = CFrame.lookAt(v2, v3) * CFrame.new(0, 0, -magnitude / 2)
                local angles3 = CFrame.Angles
                part.CFrame = value2 * angles3(0, 1.5707963267948966, 0)
                part.Parent = workspace.Terrain
                TweenService:Create(part, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(magnitude, 0, 0), Transparency = 1}):Play()
                task.delay(0.25, function()
                    part:Destroy()
                end)
            end
        end
        local function fn69(position, v2, color)
            local part = Instance.new("Part")
            part.Shape = Enum.PartType.Ball
            part.Material = Enum.Material.Neon
            part.Color = color
            part.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
            part.Position = position
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace.Terrain
            local part2 = Instance.new("Part")
            part2.Shape = Enum.PartType.Cylinder
            part2.Material = Enum.Material.Neon
            part2.Color = Color3.fromRGB(255, 255, 255)
            part2.Size = Vector3.new(0.10000000149011612, 0.4000000059604645, 0.4000000059604645)
            local cframe = CFrame.lookAt(position, position + v2)
            local angles3 = CFrame.Angles
            part2.CFrame = cframe * angles3(0, 1.5707963267948966, 0)
            part2.Anchored = true
            part2.CanCollide = false
            part2.Parent = workspace.Terrain
            local pointLight = Instance.new("PointLight")
            pointLight.Color = color
            pointLight.Range = 16
            pointLight.Brightness = 3.5
            pointLight.Parent = part
            local tweenInfo = TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
            local v3 = TweenService
            local create = v3.Create
            local tbl6 = {}
            tbl6.Size = Vector3.new(8, 8, 8)
            tbl6.Transparency = 1
            create(v3, part, tweenInfo, tbl6):Play()
            local v4 = TweenService
            local create2 = v4.Create
            local tbl7 = {}
            tbl7.Size = Vector3.new(0.10000000149011612, 15, 15)
            tbl7.Transparency = 1
            create2(v4, part2, tweenInfo, tbl7):Play()
            TweenService:Create(pointLight, tweenInfo, {Brightness = 0, Range = 0}):Play()
            task.delay(1.2000000000000002, function()
                part:Destroy()
                part2:Destroy()
            end)
        end
        local function fn70(v2, v3, color)
            local magnitude = (v3 - v2).Magnitude
            local value2 = math.clamp(math.floor(magnitude / 6), 4, 12)
            local n2 = 1
            local v4 = v2
            for i = 1, value2 + 0, n2 + 0 do
                local v5 = v2:Lerp(v3, i / value2)
                if i < value2 then
                    n2 = v5 + Vector3.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2))
                else
                    n2 = v5
                end
                local magnitude2 = (n2 - v4).Magnitude
                local part = Instance.new("Part")
                part.Material = Enum.Material.Neon
                part.Color = color
                part.Shape = Enum.PartType.Cylinder
                part.Size = Vector3.new(magnitude2, 0.4, 0.4)
                local value3 = CFrame.lookAt(v4, n2) * CFrame.new(0, 0, -magnitude2 / 2)
                local angles3 = CFrame.Angles
                part.CFrame = value3 * angles3(0, 1.5707963267948966, 0)
                part.Anchored = true
                part.CanCollide = false
                part.Parent = workspace.Terrain
                TweenService:Create(part, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Vector3.new(magnitude2, 0, 0), Transparency = 1}):Play()
                task.delay(0.28, function()
                    part:Destroy()
                end)
                v4 = n2
            end
        end
        local function fn71(v2, color)
            local value2 = v2 + Vector3.new(0, 100, 0)
            local part = Instance.new("Part")
            part.Shape = Enum.PartType.Cylinder
            part.Material = Enum.Material.Neon
            part.Color = color
            part.Size = Vector3.new(100, 2.5, 2.5)
            local value3 = CFrame.lookAt(value2, v2) * CFrame.new(0, 0, -50)
            local angles3 = CFrame.Angles
            part.CFrame = value3 * angles3(0, 1.5707963267948966, 0)
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace.Terrain
            local pointLight = Instance.new("PointLight")
            pointLight.Color = color
            pointLight.Range = 25
            pointLight.Brightness = 5
            pointLight.Parent = part
            local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local v3 = TweenService
            local create = v3.Create
            local tbl6 = {}
            tbl6.Size = Vector3.new(100, 0, 0)
            tbl6.Transparency = 1
            create(v3, part, tweenInfo, tbl6):Play()
            TweenService:Create(pointLight, tweenInfo, {Brightness = 0, Range = 0}):Play()
            task.delay(0.42, function()
                part:Destroy()
            end)
        end
        local function fn72(position)
            local part = Instance.new("Part")
            part.Shape = Enum.PartType.Ball
            part.Material = Enum.Material.SmoothPlastic
            part.Color = Color3.fromRGB(10, 10, 15)
            part.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
            part.Position = position
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace.Terrain
            local parent = Instance.new("Part")
            parent.Shape = Enum.PartType.Ball
            parent.Material = Enum.Material.Neon
            parent.Color = tbl2.BeamColor
            parent.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
            parent.Position = position
            parent.Anchored = true
            parent.CanCollide = false
            parent.Parent = workspace.Terrain
            local pointLight = Instance.new("PointLight")
            pointLight.Color = tbl2.BeamColor
            pointLight.Range = 14
            pointLight.Brightness = 3
            pointLight.Parent = parent
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            local v2 = TweenService
            local create = v2.Create
            local tbl6 = {}
            tbl6.Size = Vector3.new(4, 4, 4)
            create(v2, part, tweenInfo, tbl6):Play()
            local v3 = TweenService
            local create2 = v3.Create
            local tbl7 = {}
            tbl7.Size = Vector3.new(5.5, 5.5, 5.5)
            create2(v3, parent, tweenInfo, tbl7):Play()
            task.delay(0.3, function()
                local v4 = TweenService
                local create3 = v4.Create
                local tbl8 = {}
                tbl8.Size = Vector3.new(0, 0, 0)
                tbl8.Transparency = 1
                create3(v4, part, tweenInfo2, tbl8):Play()
                local v5 = TweenService
                local create4 = v5.Create
                local tbl9 = {}
                tbl9.Size = Vector3.new(0, 0, 0)
                tbl9.Transparency = 1
                create4(v5, parent, tweenInfo2, tbl9):Play()
                TweenService:Create(pointLight, tweenInfo2, {Brightness = 0, Range = 0}):Play()
                task.delay(0.52, function()
                    part:Destroy()
                    parent:Destroy()
                end)
            end)
        end
        local function fn73(instance)
            if instance:IsA("Beam") then
                if tbl2.BeamType ~= "Default" then
                    local worldPosition = nil
                    local v2 = nil
                    if instance.Attachment0 and instance.Attachment1 then
                        local worldPosition2 = instance.Attachment0.WorldPosition
                        worldPosition = instance.Attachment1.WorldPosition
                        v2 = worldPosition2
                    end
                    if not (not v2 or not worldPosition) then
                        local unit = (worldPosition - v2).Unit
                        if tbl2.BeamType == "Neon Fat" then
                            instance.Width0 = 1.8
                            instance.Width1 = 1.2
                            instance.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(0.2, tbl2.BeamColor),
                                ColorSequenceKeypoint.new(1, tbl2.BeamColor),
                            })
                            fn68(v2, worldPosition, 1)
                        elseif tbl2.BeamType == "Nuke" then
                            instance.Width0 = 1.4
                            instance.Width1 = 0.8
                            instance.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(0.1, tbl2.BeamColor),
                                ColorSequenceKeypoint.new(1, tbl2.BeamColor),
                            })
                            fn68(v2, worldPosition, 0.8)
                            fn69(worldPosition, unit, tbl2.BeamColor)
                        elseif tbl2.BeamType == "Zigzag Light" then
                            instance.Width0 = 0.1
                            instance.Width1 = 0.1
                            fn70(v2, worldPosition, tbl2.BeamColor)
                        elseif tbl2.BeamType == "Orbital Strike" then
                            instance.Width0 = 1.5
                            instance.Width1 = 0.8
                            instance.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(0.2, tbl2.BeamColor),
                                ColorSequenceKeypoint.new(1, tbl2.BeamColor),
                            })
                            fn68(v2, worldPosition, 0.8)
                            fn71(worldPosition, tbl2.BeamColor)
                        elseif tbl2.BeamType == "Black Hole" then
                            instance.Width0 = 1.2
                            instance.Width1 = 0.6
                            instance.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(0.2, tbl2.BeamColor),
                                ColorSequenceKeypoint.new(1, tbl2.BeamColor),
                            })
                            fn68(v2, worldPosition, 0.7)
                            fn72(worldPosition, unit)
                        elseif tbl2.BeamType == "Rainbow RGB" then
                            instance.Width0 = 1.8
                            instance.Width1 = 1.2
                            instance.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                                ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 0)),
                                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
                                ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 255, 255)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255)),
                            })
                            fn68(v2, worldPosition, 1, Color3.fromRGB(255, 255, 255))
                        end
                    end
                end
            end
        end
        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("Beam") and tbl2.BeamType ~= "Default" then
                task.wait()
                pcall(fn73, descendant)
            end
        end)
        local v2 = table.pack(workspace:GetDescendants())
        local n2 = v2.n
        v2.n = 1 + n2 - 1
        table.move(v2, 1, n2, 1, v2)
        for _, value2 in ipairs(table.unpack(v2, 1, v2.n)) do
            if value2:IsA("Beam") and tbl2.BeamType ~= "Default" then
                task.wait()
                pcall(fn73, value2)
            end
        end
    end
    activeAura = nil
    activeAuraName = nil
    pendingAura = nil
    fn17 = function()
        if activeAura then
            local list2 = activeAura
            for _, value2 in ipairs(list2) do
                local parent
                if value2 then
                    parent = value2.Parent
                else
                    parent = value2
                end
                if parent then
                    pcall(function()
                        value2:Destroy()
                    end)
                end
            end
            activeAura = nil
            activeAuraName = nil
        end
    end
    fn18 = function(v2, v3)
        if activeAuraName == v3 then
            fn17()
            pendingAura = nil
            fn52()
            tbl3.new({Title = "Auras", Content = v3 .. " disabled.", Duration = 2})
        else
            fn17()
            local v4, list2 = pcall(function()
                return game:GetObjects("rbxassetid://" .. v2)
            end)
            if not v4 or #list2 == 0 then
                tbl3.new({Title = "Auras", Content = "Failed to load " .. v3, Duration = 3})
            else
                local character = list2[1]
                for _, descendant in ipairs(character:GetDescendants()) do
                    if descendant:IsA("PointLight") or descendant:IsA("SpotLight") or descendant:IsA("SurfaceLight") then
                        descendant:Destroy()
                    elseif descendant:IsA("ParticleEmitter") then
                        descendant.LightEmission = 1
                        descendant.Rate = math.clamp(descendant.Rate * 0.35, 1, 40)
                        pcall(function()
                            local tbl6 = {}
                            for _, keypoint in ipairs(descendant.Transparency.Keypoints) do
                                local value2 = math.clamp(keypoint.Value + (1 - keypoint.Value) * 0.45, 0.3, 1)
                                table.insert(tbl6, NumberSequenceKeypoint.new(keypoint.Time, value2, keypoint.Envelope))
                            end
                            descendant.Transparency = NumberSequence.new(tbl6)
                        end)
                    elseif descendant:IsA("Beam") then
                        descendant.LightEmission = 1
                        pcall(function()
                            local tbl6 = {}
                            for _, keypoint in ipairs(descendant.Transparency.Keypoints) do
                                local value2 = math.clamp(keypoint.Value + (1 - keypoint.Value) * 0.4, 0.25, 1)
                                table.insert(tbl6, NumberSequenceKeypoint.new(keypoint.Time, value2, keypoint.Envelope))
                            end
                            descendant.Transparency = NumberSequence.new(tbl6)
                        end)
                    elseif descendant:IsA("BasePart") then
                        if descendant.Material == Enum.Material.Neon then
                            descendant.Transparency = math.max(descendant.Transparency, 0.5)
                        end
                    end
                end
                local parent = LP.Character
                if not parent then
                    tbl3.new({Title = "Auras", Content = "Character not ready!", Duration = 3})
                else
                    local torso = parent:FindFirstChild("UpperTorso") or parent:FindFirstChild("Torso")
                    local head = parent:FindFirstChild("Head")
                    if not torso or not head then
                        tbl3.new({Title = "Auras", Content = "Character parts not found!", Duration = 3})
                    else
                        local tbl6 = {
                            Torso = torso.Name,
                            Head = "Head",
                            ["Left Arm"] = "LeftUpperArm",
                            ["Right Arm"] = "RightUpperArm",
                            ["Left Leg"] = "LeftUpperLeg",
                            ["Right Leg"] = "RightUpperLeg",
                        }
                        local tbl7 = {}
                        local n2 = v3 == "Red Shield" and 4 or 1
                        for _, descendant in ipairs(character:GetDescendants()) do
                            local enabled3
                            if descendant:IsA("BasePart") then
                                enabled3 = false
                            else
                                continue
                            end
                            if not enabled3 then
                                for _, descendant2 in ipairs(character:GetDescendants()) do
                                    if descendant2:IsA("BasePart") then
                                        descendant2.Anchored = false
                                        descendant2.CanCollide = false
                                    elseif descendant2:IsA("Weld") or descendant2:IsA("WeldConstraint") or descendant2:IsA("Motor6D") or descendant2:IsA("Snap") then
                                        descendant2:Destroy()
                                    end
                                end
                                local aura = character:FindFirstChild("Aura")
                                if aura and aura:IsA("BasePart") then
                                    aura.Parent = parent
                                    if character:FindFirstChild("Torso") then
                                        local value2 = character.Torso.CFrame:Inverse() * aura.CFrame
                                        aura.CFrame = torso.CFrame * value2 * CFrame.new(0, 0.5, 0)
                                    else
                                        aura.CFrame = torso.CFrame * CFrame.new(0, 0.5, 0)
                                    end
                                    local weldConstraint = Instance.new("WeldConstraint")
                                    weldConstraint.Part0 = torso
                                    weldConstraint.Part1 = aura
                                    weldConstraint.Parent = aura
                                    table.insert(tbl7, weldConstraint)
                                    table.insert(tbl7, aura)
                                    for _, child in ipairs(aura:GetChildren()) do
                                        if child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("Highlight") then
                                            local instance = child:Clone()
                                            if instance:IsA("ParticleEmitter") then
                                                local lifetime = instance.Lifetime
                                                instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                            end
                                            instance.Parent = torso
                                            table.insert(tbl7, instance)
                                        end
                                    end
                                end
                                for _, child in ipairs(character:GetChildren()) do
                                    if child:IsA("BasePart") and child.Name ~= "Aura" then
                                        local parent2 = parent:FindFirstChild(tbl6[child.Name] or child.Name)
                                        if parent2 then
                                            for _, child2 in ipairs(child:GetChildren()) do
                                                if child2:IsA("ParticleEmitter") or child2:IsA("Attachment") or child2:IsA("Highlight") then
                                                    local instance = child2:Clone()
                                                    if instance:IsA("ParticleEmitter") then
                                                        local lifetime = instance.Lifetime
                                                        instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                                    end
                                                    instance.Parent = parent2
                                                    table.insert(tbl7, instance)
                                                end
                                            end
                                        end
                                    end
                                end
                                local crownBase = character:FindFirstChild("Crown Base")
                                if crownBase and v3 == "Crimson King" then
                                    crownBase.Parent = parent
                                    local cframe = CFrame.new(0, 1.5, 0)
                                    if character:FindFirstChild("Head") then
                                        cframe = character.Head.CFrame:Inverse() * crownBase.CFrame
                                    end
                                    crownBase.CFrame = head.CFrame * cframe
                                    local weldConstraint = Instance.new("WeldConstraint")
                                    weldConstraint.Part0 = head
                                    weldConstraint.Part1 = crownBase
                                    weldConstraint.Parent = crownBase
                                    table.insert(tbl7, weldConstraint)
                                    table.insert(tbl7, crownBase)
                                    local crownBeams = crownBase:FindFirstChild("Crown Beams")
                                    if crownBeams then
                                        for _, descendant2 in ipairs(crownBeams:GetDescendants()) do
                                            if descendant2:IsA("Beam") then
                                                local instance = descendant2:Clone()
                                                if instance.Attachment0 and crownBase:FindFirstChild(instance.Attachment0.Name) then
                                                    instance.Attachment0 = crownBase[instance.Attachment0.Name]
                                                end
                                                if instance.Attachment1 and crownBase:FindFirstChild(instance.Attachment1.Name) then
                                                    instance.Attachment1 = crownBase[instance.Attachment1.Name]
                                                end
                                                instance.Parent = torso
                                                table.insert(tbl7, instance)
                                            end
                                        end
                                    end
                                end
                                if character:FindFirstChild("Torso") then
                                    for _, child in ipairs(character.Torso:GetChildren()) do
                                        if child:IsA("Beam") then
                                            local instance = child:Clone()
                                            if instance.Attachment0 and torso:FindFirstChild(instance.Attachment0.Name) then
                                                instance.Attachment0 = torso[instance.Attachment0.Name]
                                            end
                                            if instance.Attachment1 and torso:FindFirstChild(instance.Attachment1.Name) then
                                                instance.Attachment1 = torso[instance.Attachment1.Name]
                                            end
                                            if instance.Attachment0 and instance.Attachment1 then
                                                instance.Parent = torso
                                                table.insert(tbl7, instance)
                                            end
                                        end
                                    end
                                end
                                if v3 == "Red Shield" then
                                    for _, descendant2 in ipairs(character:GetDescendants()) do
                                        if descendant2:IsA("BasePart") then
                                            descendant2.Massless = true
                                        end
                                        if descendant2:IsA("ParticleEmitter") then
                                            local lifetime = descendant2.Lifetime
                                            descendant2.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                            descendant2.LockedToPart = true
                                        end
                                    end
                                else
                                    for _, descendant2 in ipairs(character:GetDescendants()) do
                                        if descendant2:IsA("ParticleEmitter") then
                                            local lifetime = descendant2.Lifetime
                                            descendant2.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                        end
                                    end
                                end
                            end
                            for _, descendant2 in ipairs(character:GetDescendants()) do
                                if descendant2:IsA("ParticleEmitter") or descendant2:IsA("Highlight") or descendant2:IsA("Beam") or descendant2:IsA("Attachment") then
                                    local instance = descendant2:Clone()
                                    if instance:IsA("Beam") then
                                        if instance.Attachment0 and torso:FindFirstChild(instance.Attachment0.Name) then
                                            instance.Attachment0 = torso[instance.Attachment0.Name]
                                        end
                                        if instance.Attachment1 and torso:FindFirstChild(instance.Attachment1.Name) then
                                            instance.Attachment1 = torso[instance.Attachment1.Name]
                                        end
                                    end
                                    if instance:IsA("ParticleEmitter") then
                                        local lifetime = instance.Lifetime
                                        instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                        if v3 == "Red Shield" then
                                            instance.LockedToPart = true
                                        end
                                    end
                                    instance.Parent = torso
                                    table.insert(tbl7, instance)
                                end
                            end
                            character:Destroy()
                            activeAura = tbl7
                            activeAuraName = v3
                            pendingAura = {assetId = v2, name = v3}
                            fn51()
                            tbl3.new({Title = "Auras", Content = v3 .. " enabled!", Duration = 2})
                            return
                        end
                        local _
                        if not true then
                            for _, descendant in ipairs(character:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    descendant.Anchored = false
                                    descendant.CanCollide = false
                                elseif descendant:IsA("Weld") or descendant:IsA("WeldConstraint") or descendant:IsA("Motor6D") or descendant:IsA("Snap") then
                                    descendant:Destroy()
                                end
                            end
                            local aura = character:FindFirstChild("Aura")
                            if aura and aura:IsA("BasePart") then
                                aura.Parent = parent
                                if character:FindFirstChild("Torso") then
                                    local value2 = character.Torso.CFrame:Inverse() * aura.CFrame
                                    aura.CFrame = torso.CFrame * value2 * CFrame.new(0, 0.5, 0)
                                else
                                    aura.CFrame = torso.CFrame * CFrame.new(0, 0.5, 0)
                                end
                                local weldConstraint = Instance.new("WeldConstraint")
                                weldConstraint.Part0 = torso
                                weldConstraint.Part1 = aura
                                weldConstraint.Parent = aura
                                table.insert(tbl7, weldConstraint)
                                table.insert(tbl7, aura)
                                for _, child in ipairs(aura:GetChildren()) do
                                    if child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("Highlight") then
                                        local instance = child:Clone()
                                        if instance:IsA("ParticleEmitter") then
                                            local lifetime = instance.Lifetime
                                            instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                        end
                                        instance.Parent = torso
                                        table.insert(tbl7, instance)
                                    end
                                end
                            end
                            for _, child in ipairs(character:GetChildren()) do
                                if child:IsA("BasePart") and child.Name ~= "Aura" then
                                    local parent2 = parent:FindFirstChild(tbl6[child.Name] or child.Name)
                                    if parent2 then
                                        for _, child2 in ipairs(child:GetChildren()) do
                                            if child2:IsA("ParticleEmitter") or child2:IsA("Attachment") or child2:IsA("Highlight") then
                                                local instance = child2:Clone()
                                                if instance:IsA("ParticleEmitter") then
                                                    local lifetime = instance.Lifetime
                                                    instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                                end
                                                instance.Parent = parent2
                                                table.insert(tbl7, instance)
                                            end
                                        end
                                    end
                                end
                            end
                            local crownBase = character:FindFirstChild("Crown Base")
                            if crownBase and v3 == "Crimson King" then
                                crownBase.Parent = parent
                                local cframe = CFrame.new(0, 1.5, 0)
                                if character:FindFirstChild("Head") then
                                    cframe = character.Head.CFrame:Inverse() * crownBase.CFrame
                                end
                                crownBase.CFrame = head.CFrame * cframe
                                local weldConstraint = Instance.new("WeldConstraint")
                                weldConstraint.Part0 = head
                                weldConstraint.Part1 = crownBase
                                weldConstraint.Parent = crownBase
                                table.insert(tbl7, weldConstraint)
                                table.insert(tbl7, crownBase)
                                local crownBeams = crownBase:FindFirstChild("Crown Beams")
                                if crownBeams then
                                    for _, descendant in ipairs(crownBeams:GetDescendants()) do
                                        if descendant:IsA("Beam") then
                                            local instance = descendant:Clone()
                                            if instance.Attachment0 and crownBase:FindFirstChild(instance.Attachment0.Name) then
                                                instance.Attachment0 = crownBase[instance.Attachment0.Name]
                                            end
                                            if instance.Attachment1 and crownBase:FindFirstChild(instance.Attachment1.Name) then
                                                instance.Attachment1 = crownBase[instance.Attachment1.Name]
                                            end
                                            instance.Parent = torso
                                            table.insert(tbl7, instance)
                                        end
                                    end
                                end
                            end
                            if character:FindFirstChild("Torso") then
                                for _, child in ipairs(character.Torso:GetChildren()) do
                                    if child:IsA("Beam") then
                                        local instance = child:Clone()
                                        if instance.Attachment0 and torso:FindFirstChild(instance.Attachment0.Name) then
                                            instance.Attachment0 = torso[instance.Attachment0.Name]
                                        end
                                        if instance.Attachment1 and torso:FindFirstChild(instance.Attachment1.Name) then
                                            instance.Attachment1 = torso[instance.Attachment1.Name]
                                        end
                                        if instance.Attachment0 and instance.Attachment1 then
                                            instance.Parent = torso
                                            table.insert(tbl7, instance)
                                        end
                                    end
                                end
                            end
                            if v3 == "Red Shield" then
                                for _, descendant in ipairs(character:GetDescendants()) do
                                    if descendant:IsA("BasePart") then
                                        descendant.Massless = true
                                    end
                                    if descendant:IsA("ParticleEmitter") then
                                        local lifetime = descendant.Lifetime
                                        descendant.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                        descendant.LockedToPart = true
                                    end
                                end
                            else
                                for _, descendant in ipairs(character:GetDescendants()) do
                                    if descendant:IsA("ParticleEmitter") then
                                        local lifetime = descendant.Lifetime
                                        descendant.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                    end
                                end
                            end
                        end
                        for _, descendant in ipairs(character:GetDescendants()) do
                            if descendant:IsA("ParticleEmitter") or descendant:IsA("Highlight") or descendant:IsA("Beam") or descendant:IsA("Attachment") then
                                local instance = descendant:Clone()
                                if instance:IsA("Beam") then
                                    if instance.Attachment0 and torso:FindFirstChild(instance.Attachment0.Name) then
                                        instance.Attachment0 = torso[instance.Attachment0.Name]
                                    end
                                    if instance.Attachment1 and torso:FindFirstChild(instance.Attachment1.Name) then
                                        instance.Attachment1 = torso[instance.Attachment1.Name]
                                    end
                                end
                                if instance:IsA("ParticleEmitter") then
                                    local lifetime = instance.Lifetime
                                    instance.Lifetime = NumberRange.new(lifetime.Min * n2, lifetime.Max * n2)
                                    if v3 == "Red Shield" then
                                        instance.LockedToPart = true
                                    end
                                end
                                instance.Parent = torso
                                table.insert(tbl7, instance)
                            end
                        end
                        character:Destroy()
                        activeAura = tbl7
                        activeAuraName = v3
                        pendingAura = {assetId = v2, name = v3}
                        fn51()
                        tbl3.new({Title = "Auras", Content = v3 .. " enabled!", Duration = 2})
                    end
                end
            end
        end
    end
    ws_v = 16
    fov_v = 70
    ctrlTP = false
    local flyOn = false
    local noclipOn, silentShootKey, autoKnife, antiAimOn, antiCoinOn
    local v2
    local connection4
    local instance
    local connection5
    local connection6
    do
        local bodyVelocity = nil
        local bodyGyro = nil
        local connection7 = nil
        number = 50
        noclipOn = false
        connection6 = nil
        player = nil
        connection3 = nil
        blinkOn = false
        blinkSpeed = 32
        enabled = false
        gunESP = false
        trapESP = false
        tbl = {
            roleRefresh = 0,
            espDamageTime = 0,
            hudDamageTime = 0,
            ghostOn = false,
            hitPartOn = false,
            hitSoundOn = false,
            hitSoundMode = 1,
        }
        silentShootKey = "E"
        UserInputService2 = game:GetService("UserInputService")
        TweenService2 = game:GetService("TweenService")
        Players2 = game:GetService("Players")
        localPlayer = Players2.LocalPlayer
        tbl.kb = {}
        tbl.kbCustom = {}
        tbl.kbOptionUI = tbl.kbOptionUI or {}
        tbl.screenBtns = {}
        tbl.screenBtnsPos = {}
        tbl.screenButtonUI = {}
        local function fn68(instance2, v3)
            for _, child in ipairs(instance2:GetChildren()) do
                if child:IsA("TextButton") then
                    local textLabel = child:FindFirstChildOfClass("TextLabel")
                    if textLabel then
                        textLabel = textLabel.Text == v3
                    end
                    if textLabel then
                        return child
                    end
                end
            end
        end
        function tbl.toggleScreenBtn(v3)
            local v4 = tbl.kb[v3]
            if v4 then
                local display = v4.display or v3
                if tbl.screenBtns[v3] then
                    pcall(function()
                        tbl.screenBtns[v3]:Destroy()
                    end)
                    tbl.screenBtns[v3] = nil
                    if tbl.screenButtonUI[v3] then
                        pcall(function()
                            tbl.screenButtonUI[v3].SetText("Create Button")
                        end)
                    end
                    if tbl3 then
                        tbl3.new({Title = "Button Deleted", Content = display, Duration = 2})
                    end
                    return false
                else
                    local screenGui = Instance.new("ScreenGui")
                    screenGui.Name = "KITI_Btn_" .. v3
                    screenGui.IgnoreGuiInset = true
                    screenGui.ResetOnSpawn = false
                    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    if gethui then
                        screenGui.Parent = gethui()
                    elseif syn and syn.protect_gui then
                        syn.protect_gui(screenGui)
                        screenGui.Parent = game:GetService("CoreGui")
                    else
                        pcall(function()
                            screenGui.Parent = game:GetService("CoreGui")
                        end)
                        if not screenGui.Parent then
                            screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
                        end
                    end
                    local n2 = 0
                    for _, _ in pairs(tbl.screenBtns) do
                        n2 = n2 + 1
                    end
                    local frame = Instance.new("Frame", screenGui)
                    frame.Size = UDim2.new(0, 130, 0, 32)
                    local v5 = tbl.screenBtnsPos[v3]
                    local position
                    if v5 then
                        position = v5
                    else
                        local newUDim2 = UDim2.new
                        local value2 = 40 * n2
                        local value3 = -16 + value2
                        position = newUDim2(0.5, -65, 0.5, value3)
                    end
                    frame.Position = position
                    frame.BackgroundColor3 = Color3.fromRGB(16, 12, 9)
                    frame.BackgroundTransparency = 0.2
                    frame.BorderSizePixel = 0
                    frame.ClipsDescendants = true
                    frame.ZIndex = 3
                    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
                    local stroke = Instance.new("UIStroke", frame)
                    stroke.Thickness = 1.2
                    stroke.Transparency = 0.35
                    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke.Color = Color3.fromRGB(62, 40, 22)
                    local gradient = Instance.new("UIGradient", stroke)
                    gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(224, 116, 24)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(62, 40, 22)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 116, 24)),
                    })
                    local imageLabel = Instance.new("ImageLabel", frame)
                    imageLabel.Size = UDim2.new(0, 14, 0, 14)
                    imageLabel.Position = UDim2.new(0, 10, 0.5, -7)
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Image = "rbxassetid://10734966248"
                    imageLabel.ImageColor3 = Color3.fromRGB(224, 116, 24)
                    imageLabel.ZIndex = 4
                    local textLabel = Instance.new("TextLabel", frame)
                    textLabel.Size = UDim2.new(1, -32, 1, 0)
                    textLabel.Position = UDim2.new(0, 28, 0, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Font = Enum.Font.GothamBold
                    textLabel.Text = display
                    textLabel.TextColor3 = Color3.fromRGB(242, 236, 230)
                    textLabel.TextSize = 13
                    textLabel.TextXAlignment = Enum.TextXAlignment.Left
                    textLabel.ZIndex = 4
                    task.defer(function()
                        local v6 = textLabel
                        if textLabel then
                            v6 = textLabel.TextBounds.X > 0
                        end
                        if v6 then
                            frame.Size = UDim2.new(0, textLabel.TextBounds.X + 38, 0, 32)
                        end
                    end)
                    local frame2 = Instance.new("Frame", frame)
                    frame2.Size = UDim2.new(1, 0, 1, 0)
                    frame2.BackgroundTransparency = 1
                    frame2.BorderSizePixel = 0
                    frame2.ZIndex = 5
                    local gradient2 = Instance.new("UIGradient", frame2)
                    gradient2.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(224, 116, 24)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 170, 54)),
                    })
                    gradient2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.8), NumberSequenceKeypoint.new(1, 1)})
                    gradient2.Rotation = 90
                    gradient2.Offset = Vector2.new(-1, 0)
                    local textButton = Instance.new("TextButton", frame)
                    textButton.Size = UDim2.new(1, 0, 1, 0)
                    textButton.BackgroundTransparency = 1
                    textButton.Text = ""
                    textButton.BorderSizePixel = 0
                    textButton.ZIndex = 6
                    local enabled3 = false
                    local enabled4 = false
                    local v6 = nil
                    local position2 = nil
                    local position3 = nil
                    textButton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            enabled3 = true
                            enabled4 = false
                            position2 = input.Position
                            position3 = frame.Position
                            input.Changed:Connect(function()
                                if input.UserInputState == Enum.UserInputState.End then
                                    enabled3 = false
                                end
                            end)
                        end
                    end)
                    textButton.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                            v6 = input
                        end
                    end)
                    UserInputService2.InputChanged:Connect(function(input)
                        if input == v6 and enabled3 then
                            local vec = input.Position - position2
                            if 5 < vec.Magnitude then
                                enabled4 = true
                            end
                            frame.Position = UDim2.new(position3.X.Scale, position3.X.Offset + vec.X, position3.Y.Scale, position3.Y.Offset + vec.Y)
                            tbl.screenBtnsPos[v3] = frame.Position
                        end
                    end)
                    if v4.fireOnPress then
                        textButton.MouseButton1Down:Connect(function()
                            if not enabled4 then
                                pcall(v4.action)
                            end
                        end)
                    else
                        textButton.MouseButton1Click:Connect(function()
                            if not enabled4 then
                                pcall(v4.action)
                            end
                        end)
                    end
                    task.spawn(function()
                        while true do
                            local parent = screenGui
                            if screenGui then
                                parent = screenGui.Parent
                            end
                            if parent then
                                gradient.Rotation = (gradient.Rotation + 1) % 360
                                task.wait(0.03)
                                continue
                            end
                            break
                        end
                    end)
                    task.spawn(function()
                        while true do
                            local parent = screenGui
                            if screenGui then
                                parent = screenGui.Parent
                            end
                            if parent then
                                local v7 = TweenService2
                                local create = v7.Create
                                local tweenInfo = TweenInfo.new(1.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                                local tbl6 = {}
                                tbl6.Offset = Vector2.new(2, 0)
                                local tween = create(v7, gradient2, tweenInfo, tbl6)
                                tween:Play()
                                tween.Completed:Wait()
                                task.wait(1.5)
                                gradient2.Offset = Vector2.new(-1, 0)
                                continue
                            end
                            break
                        end
                    end)
                    tbl.screenBtns[v3] = screenGui
                    if tbl.screenButtonUI[v3] then
                        pcall(function()
                            tbl.screenButtonUI[v3].SetText("Delete Button")
                        end)
                    end
                    if tbl3 then
                        tbl3.new({Title = "Button Created", Content = display, Duration = 2})
                    end
                    return true
                end
            end
        end
        function tbl.kbTgl(v3, v4)
            tbl.kb[v3] = {
                key = "None",
                action = function()
                    v4:SetValue(not v4:GetValue())
                end,
            }
        end
        function tbl.kbBtn(v3, v4)
            tbl.kb[v3] = {key = "None", action = v4}
        end
        function tbl.kbBind(v3, item, v4)
            local option = v3:AddOption()
            tbl.kbUI = tbl.kbUI or {}
            local keybind = option:AddLabel("Бинд клавиши"):AddKeybind({
                Callback = function(key)
                    tbl.kb[v4].key = key
                end,
            })
            tbl.kbUI[v4] = keybind
            local list2 = {keybind}
            local list3 = tbl.kbCustom[v4]
            if list3 then
                for _, value2 in ipairs(list3) do
                    if value2.type == "keybind" then
                        local keybind2 = (option:AddLabel(value2.label)):AddKeybind({
                            Default = value2.getDefault and value2.getDefault() or value2.default or "None",
                            Callback = function(value3)
                                value2.setter(value3)
                            end,
                        })
                        table.insert(list2, keybind2)
                    elseif value2.type == "button" then
                        local button = option:AddButton({
                            Name = value2.label,
                            Icon = value2.icon or "circle-play",
                            Callback = function()
                                pcall(value2.func)
                            end,
                        })
                        table.insert(list2, button)
                    elseif value2.type == "colorpicker" then
                        local colorPicker = (option:AddLabel(value2.label)):AddColorPicker({
                            Default = value2.getDefault and value2.getDefault() or value2.default,
                            Callback = function(value3)
                                value2.setter(value3)
                            end,
                        })
                        if value2.key then
                            tbl.kbOptionUI[value2.key] = colorPicker
                        end
                        table.insert(list2, colorPicker)
                    elseif value2.type == "slider" then
                        local slider = (option:AddLabel(value2.label)):AddSlider({
                            Min = value2.min,
                            Max = value2.max,
                            Default = value2.getDefault and value2.getDefault() or value2.default,
                            Decimals = value2.decimals or 1,
                            Suffix = value2.suffix or "",
                            Callback = function(value3)
                                value2.setter(value3)
                            end,
                        })
                        table.insert(list2, slider)
                    end
                end
            else
                local createButtonButton = nil
                local function fn69(text2)
                    pcall(function()
                        local v5, v6, v7 = ipairs(createButtonButton.Section.Items.Content.Instance:GetChildren())
                        for _, value2 in v5, v6, v7 do
                            v7 = value2
                            if value2:IsA("TextButton") and (value2.Text == "Create Button" or value2.Text == "Delete Button") then
                                v7.Text = text2
                            else
                                continue
                            end
                            return
                        end
                    end)
                end
                createButtonButton = option:AddButton({
                    Name = "Create Button",
                    Icon = "play-small",
                    Callback = function()
                        local enabled3 = false
                        pcall(function()
                            enabled3 = tbl.toggleScreenBtn(v4) == true
                        end)
                        fn69(enabled3 and "Delete Button" or "Create Button")
                    end,
                })
                local tbl6 = {SetText = fn69}
                tbl.screenButtonUI[v4] = tbl6
                if tbl.screenBtns[v4] then
                    fn69("Delete Button")
                end
                table.insert(list2, createButtonButton)
            end
            for _, value2 in ipairs(list2) do
                pcall(value2.SetVisibility, value2, false)
            end
            local enabled3 = false
            local function fn69()
                enabled3 = not enabled3
                for _, value2 in ipairs(list2) do
                    pcall(value2.SetVisibility, value2, enabled3)
                end
            end
            local enabled4 = false
            if item and item.Section and item.Section.Items then
                pcall(function()
                    local parent = fn68(item.Section.Items.Content.Instance, item.Name)
                    if parent then
                        local textButton = Instance.new("TextButton")
                        textButton.Name = "\000"
                        textButton.BackgroundTransparency = 1
                        textButton.BorderSizePixel = 0
                        textButton.AutoButtonColor = false
                        textButton.Text = "gear"
                        textButton.TextColor3 = Color3.fromRGB(190, 190, 190)
                        textButton.TextSize = 18
                        textButton.FontFace = fontFace
                        textButton.Size = UDim2.new(0, 21, 0, 21)
                        textButton.Position = UDim2.new(1, -38, 0.5, 0)
                        textButton.AnchorPoint = Vector2.new(1, 0.5)
                        textButton.ZIndex = 6
                        textButton.Parent = parent
                        textButton.MouseButton1Down:Connect(fn69)
                        enabled4 = true
                    end
                end)
            end
            if not enabled4 then
                option:AddButton({Name = "Настроить", Icon = "gear", Callback = fn69})
            end
        end
        function tbl.kbTglRow(v3, v4, v5, v6)
            local display = tbl.L and tbl.L(v4, v5) or v5
            local label = v3:AddLabel(display)
            local toggle = label:AddToggle(v6)
            tbl.kbTgl(v4, toggle)
            if tbl.kb[v4] then
                tbl.kb[v4].display = display
            end
            if tbl.RegisterLocalization then
                tbl.RegisterLocalization(v4, function()
                    local setText = label
                    if label then
                        setText = label.SetText
                    end
                    if setText then
                        label:SetText(tbl.L(v4, v5))
                    end
                    if tbl.kb[v4] then
                        tbl.kb[v4].display = tbl.L(v4, v5)
                    end
                end)
            end
            tbl.kbBind(label, toggle, v4)
            return toggle
        end
        function tbl.kbBtnRow(v3, v4, v5)
            local item = v5 or {}
            local name = item.Name or v4
            item.Name = tbl.L and tbl.L(v4, name) or name
            local button = v3:AddButton(item)
            tbl.kbBtn(v4, item.Callback)
            if tbl.RegisterLocalization then
                tbl.RegisterLocalization(v4, function()
                    local setText = button
                    if button then
                        setText = button.SetText
                    end
                    if setText then
                        button:SetText(tbl.L(v4, name))
                    end
                end)
            end
            return button
        end
        UserInputService2.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed then
                local userInputType = input.UserInputType
                local name = input.KeyCode.Name
                local v3, v4, v5 = pairs(tbl.kb)
                for _, value2 in v3, v4, v5 do
                    v5 = value2
                    local key = value2.key
                    if key and key ~= "None" then
                        if key == "M1B" and userInputType == Enum.UserInputType.MouseButton1 or key == "M2B" and userInputType == Enum.UserInputType.MouseButton2 or key == name then
                            pcall(v5.action)
                        end
                    end
                end
            end
        end)
        tbl.kbCustom.SilentAim = {
            {
                type = "keybind",
                label = "Shoot Key",
                getDefault = function()
                    return silentShootKey
                end,
                setter = function(v3)
                    silentShootKey = v3
                end,
            },
            {
                type = "button",
                label = "Shoot Button",
                icon = "crosshairs",
                func = function()
                    tbl.toggleScreenBtn("SilentShoot")
                end,
            },
        }
        autoShoot = false
        shootOff = 1
        autoGetGun = false
        gunPickupMethod = "Remote"
        silentAimEnabled = false
        forceShotEnabled = false
        connection4 = nil
        offset = 2.8
        local v3 = nil
        local v4 = nil
        local v5 = nil
        roles = {}
        connection5 = nil
        antiflingOn = false
        jerkOn = false
        instance = nil
        spinOn = false
        do
            local connection8 = nil
            spinSpeed = 10
            friendOn = false
            local instance2 = nil
            local connection9 = nil
            local connection10 = nil
            uiRefs = {}
            autoKnife = false
            v2 = nil
            fn3 = function()
                if connection9 then
                    connection9:Disconnect()
                    connection9 = nil
                end
                if connection10 then
                    connection10:Disconnect()
                    connection10 = nil
                end
                if instance2 then
                    pcall(function()
                        instance2:Destroy()
                    end)
                    instance2 = nil
                end
            end
            fn4 = function()
                fn3()
                local character = localPlayer.Character
                if not (not character or not character:FindFirstChild("HumanoidRootPart")) then
                    local v6, list2 = pcall(function()
                        return game:GetObjects("rbxassetid://10740710463")
                    end)
                    if not (not v6 or not list2 or #list2 == 0) then
                        local parent = list2[1]
                        instance2 = parent
                        local list3 = {17106982150, 7175904988, 14474050865}
                        local v7 = list3[math.random(1, #list3)]
                        local v8, list4 = pcall(function()
                            return game:GetObjects("rbxassetid://" .. tostring(v7))
                        end)
                        local instance3 = v8
                        if v8 then
                            instance3 = list4
                        end
                        if instance3 then
                            instance3 = #list4 > 0
                        end
                        if instance3 then
                            instance3 = list4[1]
                        end
                        if not instance3 then
                            instance3 = nil
                        end
                        parent.Parent = workspace
                        parent:PivotTo(character:GetPivot() * CFrame.new(5, 0, -5))
                        local color = Color3.fromRGB(255, 224, 189)
                        local bodyColors = parent:FindFirstChildWhichIsA("BodyColors")
                        if bodyColors then
                            bodyColors:Destroy()
                        end
                        for _, descendant in ipairs(parent:GetDescendants()) do
                            if descendant:IsA("BasePart") and not (instance3 and descendant:IsDescendantOf(instance3)) then
                                descendant.Color = color
                            end
                        end
                        for _, child in ipairs(parent:GetChildren()) do
                            if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") or child:IsA("Clothing") then
                                child:Destroy()
                            end
                        end
                        pcall(function()
                            local instance4 = game:GetObjects("rbxassetid://14877850833")[1]
                            if instance4 then
                                if instance4:IsA("Shirt") then
                                    instance4.Parent = parent
                                elseif instance4:FindFirstChildWhichIsA("Shirt") then
                                    instance4:FindFirstChildWhichIsA("Shirt").Parent = parent
                                end
                            end
                        end)
                        pcall(function()
                            local instance4 = game:GetObjects("rbxassetid://14119146662")[1]
                            if instance4 then
                                if instance4:IsA("Pants") then
                                    instance4.Parent = parent
                                elseif instance4:FindFirstChildWhichIsA("Pants") then
                                    instance4:FindFirstChildWhichIsA("Pants").Parent = parent
                                end
                            end
                        end)
                        local head = parent:FindFirstChild("Head")
                        if head then
                            local decal = head:FindFirstChild("face") or Instance.new("Decal", head)
                            decal.Name = "face"
                            decal.Texture = "rbxassetid://11654084813"
                            if instance3 then
                                instance3.Parent = parent
                                local basePart = instance3:FindFirstChild("Handle") or instance3:FindFirstChildWhichIsA("BasePart")
                                if basePart then
                                    basePart.Anchored = false
                                    basePart.CFrame = head.CFrame * CFrame.new(0, -0.6, 0)
                                    local weldConstraint = Instance.new("WeldConstraint", basePart)
                                    weldConstraint.Part0 = head
                                    weldConstraint.Part1 = basePart
                                end
                            end
                        end
                        local humanoid = parent:FindFirstChildWhichIsA("Humanoid")
                        local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
                        if not (not humanoid or not humanoidRootPart) then
                            local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
                            local animationId = humanoid.RigType == Enum.HumanoidRigType.R6
                            local animationId2 = animationId and "rbxassetid://180426354" or "rbxassetid://913376220"
                            if animationId then
                                animationId = "rbxassetid://180435571"
                            end
                            if not animationId then
                                animationId = "rbxassetid://507766388"
                            end
                            local animation = Instance.new("Animation")
                            animation.AnimationId = animationId2
                            local v9 = animator:LoadAnimation(animation)
                            local animation2 = Instance.new("Animation")
                            animation2.AnimationId = animationId
                            local v10 = animator:LoadAnimation(animation2)
                            v10:Play()
                            v10.Looped = true
                            local n2 = 6
                            local n3 = 0
                            local connection11 = RunService.Heartbeat:Connect(function()
                                local character2 = localPlayer.Character
                                if character2 and character2:FindFirstChild("HumanoidRootPart") and parent and parent.Parent and humanoidRootPart and humanoid then
                                    local position = character2.HumanoidRootPart.Position
                                    local magnitude = (humanoidRootPart.Position - position).Magnitude
                                    if magnitude > 200 or position.Y < -100 then
                                        parent:PivotTo(character2:GetPivot() * CFrame.new(5, 0, -5))
                                    elseif n2 < magnitude then
                                        if 0.25 < os.clock() - n3 then
                                            humanoid:MoveTo(position)
                                            n3 = os.clock()
                                        end
                                        if not v9.IsPlaying then
                                            v10:Stop()
                                            v9:Play()
                                            v9.Looped = true
                                        end
                                    else
                                        humanoid:MoveTo(humanoidRootPart.Position)
                                        if not v10.IsPlaying then
                                            v9:Stop()
                                            v10:Play()
                                            v10.Looped = true
                                        end
                                    end
                                end
                            end)
                            connection9 = connection11
                            local billboardGui = Instance.new("BillboardGui", head)
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                            billboardGui.AlwaysOnTop = true
                            local textLabel = Instance.new("TextLabel", billboardGui)
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 192, 203)
                            textLabel.TextStrokeTransparency = 0
                            textLabel.Font = Enum.Font.GothamSemibold
                            textLabel.TextScaled = true
                            textLabel.Text = ""
                            local function fn69()
                                local sound = Instance.new("Sound")
                                sound.SoundId = "rbxassetid://5855422149"
                                sound.Volume = 0.5
                                sound.PlayOnRemove = true
                                sound.Parent = SoundService
                                sound:Destroy()
                            end
                            local tween = nil
                            local enabled3 = false
                            local function fn70(list5)
                                if not enabled3 then
                                    enabled3 = true
                                    if tween then
                                        tween:Cancel()
                                    end
                                    textLabel.TextTransparency = 0
                                    textLabel.TextStrokeTransparency = 0
                                    textLabel.Text = ""
                                    local count = #list5
                                    for i = 1, count + 0 do
                                        textLabel.Text = string.sub(list5, 1, i)
                                        fn69()
                                        task.wait(0.03)
                                    end
                                    task.wait(2)
                                    tween = TweenService2:Create(textLabel, TweenInfo.new(1), {TextTransparency = 1, TextStrokeTransparency = 1})
                                    tween:Play()
                                    tween.Completed:Connect(function()
                                        textLabel.Text = ""
                                        textLabel.TextTransparency = 0
                                        textLabel.TextStrokeTransparency = 0
                                        enabled3 = false
                                    end)
                                end
                            end
                            local clickDetector = Instance.new("ClickDetector")
                            clickDetector.MaxActivationDistance = 32
                            clickDetector.Parent = parent
                            local list5 = {"Yeah?", "Hmm?", "Hey", "I'm listening", "Yo"}
                            local connection12 = clickDetector.MouseClick:Connect(function()
                                local random, n4, count = math.random, 1, #list5
                                fn70(list5[random(n4, count)])
                            end)
                            connection10 = connection12
                        end
                    end
                end
            end
            fn5 = function()
                if connection8 then
                    connection8:Disconnect()
                    connection8 = nil
                end
            end
            fn6 = function()
                fn5()
                local connection11 = RunService.RenderStepped:Connect(function()
                    local character = localPlayer.Character
                    if character then
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local cFrame = humanoidRootPart.CFrame
                            local angles3, n2, value2, n3 = CFrame.Angles, 0, math.rad(spinSpeed), 0
                            humanoidRootPart.CFrame = cFrame * angles3(n2, value2, n3)
                        end
                    end
                end)
                connection8 = connection11
            end
        end
        walkFlingOn = false
        do
            local connection8 = nil
            antiAimOn = false
            local connection9 = nil
            local connection10 = nil
            local n2 = 0
            enabled2 = false
            local list2 = {}
            aspectRatioOn = false
            connection2 = nil
            aspectRatioScale = 0.65
            disableAspectRatio = function()
                aspectRatioOn = false
                if connection2 then
                    connection2:Disconnect()
                    connection2 = nil
                end
            end
            enableAspectRatio = function()
                disableAspectRatio()
                aspectRatioOn = true
                local resolution = aspectRatioScale
                getgenv().Resolution = resolution
                local connection11 = RunService.RenderStepped:Connect(function()
                    local currentCamera = workspace.CurrentCamera
                    if currentCamera and aspectRatioOn then
                        local resolution2 = getgenv().Resolution or aspectRatioScale
                        currentCamera.CFrame = currentCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, resolution2, 0, 0, 0, 1)
                    end
                end)
                connection2 = connection11
            end
            fn7 = function()
                if connection8 then
                    connection8:Disconnect()
                    connection8 = nil
                end
            end
            fn8 = function()
                fn7()
                local connection11 = RunService.Stepped:Connect(function()
                    local character = localPlayer.Character
                    if character then
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if not (not humanoidRootPart or not humanoid) then
                            if 0 < humanoid.MoveDirection.Magnitude then
                                humanoidRootPart.Velocity = humanoidRootPart.CFrame.LookVector * (humanoid.WalkSpeed * 5) + Vector3.new(0, humanoidRootPart.Velocity.Y, 0)
                            end
                        end
                    end
                end)
                connection8 = connection11
            end
            local function fn69(instance2)
                if not instance2 then
                    return nil
                else
                    local humanoid = instance2:FindFirstChildWhichIsA("Humanoid")
                    local rootPart = humanoid and humanoid.RootPart
                    if not rootPart then
                        rootPart = instance2:FindFirstChild("HumanoidRootPart")
                    end
                    if not rootPart then
                        rootPart = instance2:FindFirstChild("Torso")
                    end
                    if not rootPart then
                        rootPart = instance2:FindFirstChild("UpperTorso")
                    end
                    return rootPart
                end
            end
            disableAntiAim = function()
                antiAimOn = false
                n2 = n2 + 1
                if connection9 then
                    connection9:Disconnect()
                    connection9 = nil
                end
                if connection10 then
                    connection10:Disconnect()
                    connection10 = nil
                end
                local character = localPlayer.Character
                if character then
                    for key, value2 in pairs(list2) do
                        local canCollide = value2
                        local parent
                        if key then
                            parent = key.Parent
                        else
                            parent = key
                        end
                        if parent then
                            pcall(function()
                                key.CanCollide = canCollide
                            end)
                        end
                    end
                    local instance2 = fn69(character)
                    if instance2 and instance2.Parent then
                        pcall(function()
                            instance2.Velocity = Vector3.new(0, 0, 0)
                            instance2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            instance2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        end)
                    end
                end
                table.clear(list2)
            end
            enableAntiAim = function()
                disableAntiAim()
                antiAimOn = true
                n2 = n2 + 1
                local v6 = n2
                local character = localPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local connection11 = humanoid.Died:Connect(function()
                        if n2 == v6 then
                            enabled2 = true
                            disableAntiAim()
                            pcall(function()
                                local antiAim = uiRefs and uiRefs.AntiAim
                                if antiAim and antiAim.SetValue then
                                    antiAim:SetValue(false, true)
                                end
                            end)
                            local currentCamera = workspace.CurrentCamera
                            if currentCamera then
                                currentCamera.CameraType = Enum.CameraType.Custom
                            end
                        end
                    end)
                    connection10 = connection11
                end
                local connection11 = RunService.Stepped:Connect(function()
                    if not (not antiAimOn or n2 ~= v6) then
                        local character2 = localPlayer.Character
                        local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
                        if not character2 or not character2.Parent or not humanoid2 or humanoid2.Health <= 0 then
                            disableAntiAim()
                        else
                            for _, descendant in ipairs(character2:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    if list2[descendant] == nil then
                                        list2[descendant] = descendant.CanCollide
                                    end
                                    descendant.CanCollide = false
                                end
                            end
                        end
                    end
                end)
                connection9 = connection11
                task.spawn(function()
                    local n3 = 0.1
                    while true do
                        local v7 = antiAimOn
                        if antiAimOn then
                            v7 = n2 == v6
                        end
                        if v7 then
                            RunService.Heartbeat:Wait()
                            if not (not antiAimOn or n2 ~= v6) then
                                local character2 = localPlayer.Character
                                local humanoid2
                                if character2 then
                                    humanoid2 = character2:FindFirstChildOfClass("Humanoid")
                                else
                                    humanoid2 = character2
                                end
                                local instance2 = fn69(character2)
                                if character2 and character2.Parent and humanoid2 and humanoid2.Health > 0 and instance2 and instance2.Parent then
                                    local velocity = instance2.Velocity
                                    local value2 = velocity * 10000
                                    instance2.Velocity = value2 + Vector3.new(0, 10000, 0)
                                    RunService.RenderStepped:Wait()
                                    local v8 = antiAimOn
                                    if antiAimOn then
                                        v8 = n2 == v6
                                    end
                                    if v8 and character2.Parent and humanoid2.Health > 0 and instance2.Parent then
                                        instance2.Velocity = velocity
                                    end
                                    RunService.Stepped:Wait()
                                    local parent = antiAimOn
                                    if antiAimOn then
                                        parent = n2 == v6
                                    end
                                    if parent then
                                        parent = character2.Parent
                                    end
                                    if parent then
                                        parent = humanoid2.Health > 0
                                    end
                                    if parent then
                                        parent = instance2.Parent
                                    end
                                    if parent then
                                        instance2.Velocity = velocity + Vector3.new(0, n3, 0)
                                        n3 = n3 * -1
                                        continue
                                    end
                                    continue
                                end
                                continue
                            end
                        else
                            break
                        end
                        return
                    end
                end)
            end
        end
        antiCoinOn = false
        local list2 = {}
        local function fn69(v6)
            if not list2[v6] then
                list2[v6] = {Touch = v6.CanTouch, Collide = v6.CanCollide, Trans = v6.Transparency}
            end
            v6.CanTouch = false
            v6.CanCollide = false
            v6.Transparency = 1
        end
        local function fn70()
            local mansion2 = workspace:FindFirstChild("Mansion2")
            if mansion2 then
                mansion2 = mansion2:FindFirstChild("CoinContainer")
            end
            if not mansion2 then
                for _, descendant in ipairs(workspace:GetDescendants()) do
                    if descendant:IsA("Model") and descendant.Name:lower():find("coin") then
                        for _, descendant2 in ipairs(descendant:GetDescendants()) do
                            if descendant2:IsA("BasePart") then
                                fn69(descendant2)
                            end
                        end
                    end
                end
            else
                for _, descendant in ipairs(mansion2:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        fn69(descendant)
                    end
                end
            end
        end
        local function fn71()
            for key, value2 in pairs(list2) do
                local v6 = value2
                local parent
                if key then
                    parent = key.Parent
                else
                    parent = key
                end
                if parent then
                    key.CanTouch = v6.Touch
                    key.CanCollide = v6.Collide
                    key.Transparency = v6.Trans
                end
            end
            table.clear(list2)
        end
        disableAntiCoin = function()
            antiCoinOn = false
            fn71()
        end
        enableAntiCoin = function()
            disableAntiCoin()
            antiCoinOn = true
            task.spawn(function()
                while true do
                    if antiCoinOn then
                        pcall(fn70)
                        task.wait(0.5)
                        continue
                    end
                    break
                end
            end)
        end
        fn33 = function(...)
            local list3 = ({...})[1]:lower()
            local v6, v7, player2 = ipairs(Players2:GetPlayers())
            local enabled3 = false
            for _, value2 in v6, v7, player2 do
                player2 = value2
                local v8 = (value2.Name:lower()):sub(1, #list3) == list3
                local v9
                if v8 then
                    v9 = v8
                else
                    v9 = (player2.DisplayName:lower()):sub(1, #list3) == list3
                end
                if v9 then
                    enabled3 = true
                    break
                end
            end
            if not enabled3 then
                return
            end
            return player2
        end
        fn11 = function()
            for _, player2 in ipairs(Players2:GetPlayers()) do
                if player2.Backpack:FindFirstChild("Knife") or player2.Character and player2.Character:FindFirstChild("Knife") then
                    return player2
                end
            end
            if v3 then
                return Players2:FindFirstChild(v3)
            end
        end
        fn12 = function()
            for _, player2 in ipairs(Players2:GetPlayers()) do
                if player2.Backpack:FindFirstChild("Gun") or player2.Character and player2.Character:FindFirstChild("Gun") then
                    return player2
                end
            end
            if v4 then
                return Players2:FindFirstChild(v4)
            end
        end
        fn25 = function()
            if fn11() == localPlayer then
                return true
            else
                local knife = localPlayer.Backpack:FindFirstChild("Knife")
                if not knife then
                    knife = localPlayer.Character
                    if knife then
                        knife = localPlayer.Character:FindFirstChild("Knife")
                    end
                end
                if knife then
                    return true
                else
                    return false
                end
            end
        end
        fn13 = function()
            local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local v6, v7, v8 = ipairs(Players2:GetPlayers())
                local value2 = 1 / 0
                local v9 = nil
                for _, value3 in v6, v7, v8 do
                    if value3 ~= localPlayer then
                        local humanoidRootPart2 = value3.Character and value3.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart2 then
                            local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude
                            if magnitude < value2 then
                                value2 = magnitude
                                v9 = value3
                            end
                        end
                    end
                end
                return v9
            end
        end
        BULLET_SPEED = 300
        GRAVITY = workspace.Gravity
        fn26 = function(player2, n2)
            if not player2 or not player2.Character then
                return Vector3.new(0, 0, 0)
            else
                local character = localPlayer.Character
                local upperTorso = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso"))
                local humanoidRootPart = player2.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    humanoidRootPart = player2.Character:FindFirstChild("UpperTorso")
                end
                local humanoid = player2.Character:FindFirstChildOfClass("Humanoid")
                if not humanoidRootPart or not upperTorso then
                    return Vector3.new(0, 0, 0)
                else
                    local position = humanoidRootPart.Position
                    local magnitude = (position - upperTorso.Position).Magnitude
                    local networkPing = localPlayer:GetNetworkPing()
                    local value2 = magnitude / BULLET_SPEED + networkPing
                    if not n2 then
                        n2 = 1
                    end
                    local value3 = value2 + n2 * 0.01
                    local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
                    local value4 = position.X + assemblyLinearVelocity.X * value3
                    local value5 = position.Z + assemblyLinearVelocity.Z * value3
                    local y = position.Y
                    if humanoid then
                        local state = humanoid:GetState()
                        if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping then
                            y = position.Y + assemblyLinearVelocity.Y * value3 - 0.5 * GRAVITY * value3 ^ 2
                        else
                            y = position.Y + assemblyLinearVelocity.Y * 0.05
                        end
                    end
                    return Vector3.new(value4, y, value5)
                end
            end
        end
        fn27 = function()
            local v6, v7, v8 = ipairs(workspace:GetChildren())
            local enabled3 = false
            for _, value2 in v6, v7, v8 do
                v8 = value2
                if value2:FindFirstChild("CoinContainer") and value2:FindFirstChild("Spawns") then
                    enabled3 = true
                    break
                end
            end
            if not enabled3 then
                return
            end
            return v8
        end
        fn14 = function(player2)
            if not player2 or not player2.Character then
                tbl3.new({Title = "Fling", Content = "No valid character.", Duration = 3})
            else
                local character = Players2.LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                local parent = humanoid and humanoid.RootPart
                if not (not character or not humanoid or not parent) then
                    local character2 = player2.Character
                    local cameraSubject = character2:FindFirstChildOfClass("Humanoid")
                    local rootPart = cameraSubject and cameraSubject.RootPart
                    local head = character2:FindFirstChild("Head")
                    local accessory = character2:FindFirstChildOfClass("Accessory")
                    local handle = accessory and accessory:FindFirstChild("Handle")
                    if cameraSubject then
                        if parent.Velocity.Magnitude < 50 then
                            getgenv().YARHMFling_OldPos = parent.CFrame
                        end
                        if head then
                            workspace.CurrentCamera.CameraSubject = head
                        elseif handle then
                            workspace.CurrentCamera.CameraSubject = handle
                        elseif cameraSubject and rootPart then
                            workspace.CurrentCamera.CameraSubject = cameraSubject
                        end
                        if character2:FindFirstChildWhichIsA("BasePart") then
                            local function fn72(v6, v7, v8)
                                parent.CFrame = CFrame.new(v6.Position) * v7 * v8
                                character:SetPrimaryPartCFrame(CFrame.new(v6.Position) * v7 * v8)
                                parent.Velocity = Vector3.new(90000000, 900000000, 90000000)
                                parent.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                            end
                            local function fn73(instance2)
                                local v6 = tick()
                                local n2 = 0
                                while true do
                                    local v7 = parent
                                    if parent then
                                        v7 = cameraSubject
                                    end
                                    if v7 then
                                        if instance2.Velocity.Magnitude < 50 then
                                            n2 = n2 + 100
                                            fn72(instance2, CFrame.new(0, 1.5, 0) + cameraSubject.MoveDirection * instance2.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(0, -1.5, 0) + cameraSubject.MoveDirection * instance2.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(2.25, 1.5, -2.25) + cameraSubject.MoveDirection * instance2.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(-2.25, -1.5, 2.25) + cameraSubject.MoveDirection * instance2.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(0, 1.5, 0) + cameraSubject.MoveDirection, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(0, -1.5, 0) + cameraSubject.MoveDirection, CFrame.Angles(math.rad(n2), 0, 0))
                                            task.wait()
                                        else
                                            local cframe = CFrame.new(0, 1.5, cameraSubject.WalkSpeed)
                                            local angles3 = CFrame.Angles
                                            fn72(instance2, cframe, angles3(1.5707963267948966, 0, 0))
                                            task.wait()
                                            local newCFrame = CFrame.new
                                            local v8 = -cameraSubject.WalkSpeed
                                            fn72(instance2, newCFrame(0, -1.5, v8), CFrame.Angles(0, 0, 0))
                                            task.wait()
                                            local cframe2 = CFrame.new(0, 1.5, cameraSubject.WalkSpeed)
                                            local angles4 = CFrame.Angles
                                            fn72(instance2, cframe2, angles4(1.5707963267948966, 0, 0))
                                            task.wait()
                                            local cframe3 = CFrame.new(0, 1.5, rootPart.Velocity.Magnitude / 1.25)
                                            local angles5 = CFrame.Angles
                                            fn72(instance2, cframe3, angles5(1.5707963267948966, 0, 0))
                                            task.wait()
                                            local newCFrame2 = CFrame.new
                                            local value2 = -rootPart.Velocity.Magnitude / 1.25
                                            fn72(instance2, newCFrame2(0, -1.5, value2), CFrame.Angles(0, 0, 0))
                                            task.wait()
                                            local cframe4 = CFrame.new(0, 1.5, rootPart.Velocity.Magnitude / 1.25)
                                            local angles6 = CFrame.Angles
                                            fn72(instance2, cframe4, angles6(1.5707963267948966, 0, 0))
                                            task.wait()
                                            local cframe5 = CFrame.new(0, -1.5, 0)
                                            local angles7 = CFrame.Angles
                                            fn72(instance2, cframe5, angles7(1.5707963267948966, 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                            task.wait()
                                            local cframe6 = CFrame.new(0, -1.5, 0)
                                            local angles8 = CFrame.Angles
                                            fn72(instance2, cframe6, angles8(-1.5707963267948966, 0, 0))
                                            task.wait()
                                            fn72(instance2, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                            task.wait()
                                        end
                                        if instance2.Velocity.Magnitude > 500 or instance2.Parent ~= player2.Character or player2.Parent ~= Players2 or player2.Character ~= character2 or cameraSubject.Sit or humanoid.Health <= 0 or tick() > v6 + 2 then
                                            break
                                        else
                                            continue
                                        end
                                    end
                                    return
                                end
                            end
                            workspace.FallenPartsDestroyHeight = 0 / 0
                            local bodyVelocity2 = Instance.new("BodyVelocity")
                            bodyVelocity2.Name = "YARHMFlingVel"
                            bodyVelocity2.Parent = parent
                            bodyVelocity2.Velocity = Vector3.new(900000000, 900000000, 900000000)
                            bodyVelocity2.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                            if rootPart and head then
                                if 5 < (rootPart.CFrame.p - head.CFrame.p).Magnitude then
                                    fn73(head)
                                else
                                    fn73(rootPart)
                                end
                            elseif rootPart and not head then
                                fn73(rootPart)
                            elseif not rootPart and head then
                                fn73(head)
                            else
                                local v6 = not rootPart and not head
                                if not v6 then
                                    accessory = v6
                                end
                                if accessory then
                                    accessory = handle
                                end
                                if accessory then
                                    fn73(handle)
                                else
                                    tbl3.new({Title = "Fling", Content = "Can't find a proper part.", Duration = 3})
                                end
                            end
                            bodyVelocity2:Destroy()
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                            workspace.CurrentCamera.CameraSubject = humanoid
                            local yarhmFling_OldPos = getgenv().YARHMFling_OldPos
                            if yarhmFling_OldPos then
                                while true do
                                    parent.CFrame = yarhmFling_OldPos * CFrame.new(0, 0.5, 0)
                                    character:SetPrimaryPartCFrame(yarhmFling_OldPos * CFrame.new(0, 0.5, 0))
                                    humanoid:ChangeState("GettingUp")
                                    for _, child in ipairs(character:GetChildren()) do
                                        if child:IsA("BasePart") then
                                            child.Velocity = Vector3.new(0, 0, 0)
                                            child.RotVelocity = Vector3.new(0, 0, 0)
                                        end
                                    end
                                    task.wait()
                                    if not ((parent.Position - yarhmFling_OldPos.p).Magnitude < 25) then
                                        continue
                                    end
                                    break
                                end
                            end
                            workspace.FallenPartsDestroyHeight = getgenv().FPDH or -500
                        end
                    end
                end
            end
        end
        local function fn72(item)
            local v6, v7, v8 = pairs(roles)
            local enabled3 = false
            for key, value2 in v6, v7, v8 do
                v8 = value2
                if item.Name == key then
                    enabled3 = true
                    break
                end
            end
            if not enabled3 then
                return false
            end
            return not (v8.Killed or v8.Dead)
        end
        local function fn73()
            for _, child in pairs(Players2:GetChildren()) do
                if child ~= localPlayer and child.Character and not child.Character:FindFirstChild("Highlight") then
                    Instance.new("Highlight", child.Character)
                end
            end
        end
        local function fn74()
            for _, child in pairs(Players2:GetChildren()) do
                if child ~= localPlayer and child.Character then
                    local highlight = child.Character:FindFirstChild("Highlight")
                    if highlight then
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        local role = roles[child.Name]
                        if role then
                            role = role.Role
                        end
                        if role == "Murderer" and fn72(child) then
                            highlight.FillColor = Color3.fromRGB(225, 0, 0)
                            highlight.OutlineColor = Color3.fromRGB(225, 0, 0)
                        elseif role == "Sheriff" and fn72(child) then
                            highlight.FillColor = Color3.fromRGB(0, 0, 225)
                            highlight.OutlineColor = Color3.fromRGB(0, 0, 225)
                        elseif role == "Hero" and fn72(child) then
                            highlight.FillColor = Color3.fromRGB(255, 250, 0)
                            highlight.OutlineColor = Color3.fromRGB(255, 250, 0)
                        else
                            highlight.FillColor = Color3.fromRGB(0, 225, 0)
                            highlight.OutlineColor = Color3.fromRGB(0, 225, 0)
                        end
                        highlight.Enabled = enabled
                    end
                end
            end
        end
        fn28 = function()
            local v6, v7, player2 = pairs(Players2:GetChildren())
            for _, value2 in v6, v7, player2 do
                player2 = value2
                if value2.Character then
                    local highlight = player2.Character:FindFirstChild("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
        function tbl.refreshRoles()
            v3 = nil
            v4 = nil
            v5 = nil
            pcall(function()
                local getPlayerData = ReplicatedStorage:FindFirstChild("GetPlayerData", true)
                if getPlayerData then
                    local v6, v7 = pcall(function()
                        return getPlayerData:InvokeServer()
                    end)
                    if v6 then
                        v6 = v7
                    end
                    if v6 then
                        roles = v7
                        local list3 = roles
                        for key, value2 in pairs(list3) do
                            local v8 = value2
                            if value2.Role == "Murderer" then
                                v3 = key
                            elseif v8.Role == "Sheriff" then
                                v4 = key
                            elseif v8.Role == "Hero" then
                                v5 = key
                            end
                        end
                    end
                end
            end)
        end
        RunService.RenderStepped:Connect(function()
            if enabled then
                tbl.refreshRoles()
                fn73()
                fn74()
            end
        end)
        function tbl.createEspGui()
            if not tbl.espGui then
                tbl.espGui = Instance.new("ScreenGui")
                tbl.espGui.Name = "KITI_TargetESP"
                tbl.espGui.ResetOnSpawn = false
                tbl.espGui.IgnoreGuiInset = true
                pcall(function()
                    tbl.espGui.Parent = game:GetService("CoreGui")
                end)
                if not tbl.espGui.Parent then
                    tbl.espGui.Parent = localPlayer:WaitForChild("PlayerGui")
                end
                local frame = Instance.new("Frame", tbl.espGui)
                frame.BackgroundTransparency = 1
                frame.AnchorPoint = Vector2.new(0.5, 0.5)
                frame.Visible = false
                local function fn75(position)
                    local frame2 = Instance.new("Frame", frame)
                    frame2.Size = UDim2.new(0.3, 0, 0.3, 0)
                    frame2.Position = position
                    frame2.BackgroundTransparency = 1
                    local frame3 = Instance.new("Frame", frame2)
                    frame3.BorderSizePixel = 0
                    frame3.ZIndex = 6
                    frame3.Size = UDim2.new(1, 0, 0, 0)
                    frame3.Position = position.Y.Scale > 0 and UDim2.new(0, 0, 1, 0) or UDim2.new(0, 0, 0, 0)
                    local frame4 = Instance.new("Frame", frame2)
                    frame4.BorderSizePixel = 0
                    frame4.ZIndex = 6
                    frame4.Size = UDim2.new(0, 0, 1, 0)
                    frame4.Position = position.X.Scale > 0 and UDim2.new(1, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
                    local stroke = Instance.new("UIStroke", frame3)
                    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    local stroke2 = Instance.new("UIStroke", frame4)
                    stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    local frame5 = Instance.new("Frame", frame2)
                    frame5.BorderSizePixel = 0
                    frame5.ZIndex = 5
                    frame5.Size = UDim2.new(1, 0, 0, 0)
                    frame5.Position = frame3.Position
                    local frame6 = Instance.new("Frame", frame2)
                    frame6.BorderSizePixel = 0
                    frame6.ZIndex = 5
                    frame6.Size = UDim2.new(0, 0, 1, 0)
                    frame6.Position = frame4.Position
                    local stroke3 = Instance.new("UIStroke", frame5)
                    stroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke3.Transparency = 0.55
                    local stroke4 = Instance.new("UIStroke", frame6)
                    stroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke4.Transparency = 0.55
                    local frame7 = Instance.new("Frame", frame2)
                    frame7.BorderSizePixel = 0
                    frame7.ZIndex = 4
                    frame7.Size = UDim2.new(1, 0, 0, 0)
                    frame7.Position = frame3.Position
                    local frame8 = Instance.new("Frame", frame2)
                    frame8.BorderSizePixel = 0
                    frame8.ZIndex = 4
                    frame8.Size = UDim2.new(0, 0, 1, 0)
                    frame8.Position = frame4.Position
                    local stroke5 = Instance.new("UIStroke", frame7)
                    stroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke5.Transparency = 0.8
                    local stroke6 = Instance.new("UIStroke", frame8)
                    stroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke6.Transparency = 0.8
                    return {stroke, stroke2, stroke3, stroke4, stroke5, stroke6}
                end
                tbl.espCorners = {
                    fn75(UDim2.new(0, 0, 0, 0)),
                    fn75(UDim2.new(0.7, 0, 0, 0)),
                    fn75(UDim2.new(0, 0, 0.7, 0)),
                    (fn75(UDim2.new(0.7, 0, 0.7, 0))),
                }
                tbl.espFrame = frame
            end
        end
        function tbl.createHudGui()
            if not tbl.hudGui then
                tbl.hudGui = Instance.new("ScreenGui")
                tbl.hudGui.Name = "KITI_TargetHUD"
                tbl.hudGui.ResetOnSpawn = false
                tbl.hudGui.IgnoreGuiInset = true
                pcall(function()
                    tbl.hudGui.Parent = game:GetService("CoreGui")
                end)
                if not tbl.hudGui.Parent then
                    tbl.hudGui.Parent = localPlayer:WaitForChild("PlayerGui")
                end
                local frame = Instance.new("Frame", tbl.hudGui)
                frame.Size = UDim2.new(0, 235, 0, 75)
                frame.Position = UDim2.new(0.5, 50, 0.5, 50)
                frame.BackgroundColor3 = Color3.fromRGB(16, 12, 9)
                frame.BackgroundTransparency = 0.15
                frame.BorderSizePixel = 0
                frame.Visible = false
                frame.Active = true
                frame.Draggable = true
                frame.ClipsDescendants = false
                Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
                local stroke = Instance.new("UIStroke", frame)
                stroke.Color = Color3.fromRGB(224, 116, 24)
                stroke.Thickness = 1.2
                stroke.Transparency = 0.2
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                local gradient = Instance.new("UIGradient", stroke)
                gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(224, 116, 24)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 90, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 116, 24)),
                })
                local hudGlow = Instance.new("Frame", frame)
                hudGlow.Size = UDim2.new(1, 6, 1, 6)
                hudGlow.Position = UDim2.new(0, -3, 0, -3)
                hudGlow.BackgroundColor3 = Color3.fromRGB(224, 116, 24)
                hudGlow.BackgroundTransparency = 0.92
                hudGlow.ZIndex = frame.ZIndex - 1
                Instance.new("UICorner", hudGlow).CornerRadius = UDim.new(0, 12)
                local imageLabel = Instance.new("ImageLabel", frame)
                imageLabel.Name = "KitiLogo"
                imageLabel.Size = UDim2.new(0, 18, 0, 18)
                imageLabel.Position = UDim2.new(1, -24, 0, 6)
                imageLabel.BackgroundTransparency = 1
                imageLabel.Image = "rbxassetid://90791694090379"
                imageLabel.ZIndex = 5
                local frame2 = Instance.new("Frame", frame)
                frame2.Size = UDim2.new(0, 56, 0, 56)
                frame2.Position = UDim2.new(0, 9, 0, 9)
                frame2.BackgroundColor3 = Color3.fromRGB(15, 17, 24)
                frame2.BackgroundTransparency = 0.2
                frame2.BorderSizePixel = 0
                frame2.ClipsDescendants = true
                Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 8)
                local hudIconStroke = Instance.new("UIStroke", frame2)
                hudIconStroke.Color = Color3.fromRGB(224, 116, 24)
                hudIconStroke.Thickness = 1
                hudIconStroke.Transparency = 0.6
                local hudIcon = Instance.new("ImageLabel", frame2)
                hudIcon.Size = UDim2.new(1.1, 0, 1.1, 0)
                hudIcon.Position = UDim2.new(-0.05, 0, -0.05, 0)
                hudIcon.BackgroundTransparency = 1
                hudIcon.ScaleType = Enum.ScaleType.Crop
                local textLabel = Instance.new("TextLabel", frame)
                textLabel.Size = UDim2.new(1, -100, 0, 18)
                textLabel.Position = UDim2.new(0, 72, 0, 8)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(240, 242, 248)
                textLabel.Font = Enum.Font.GothamBold
                textLabel.TextSize = 13
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.TextTruncate = Enum.TextTruncate.AtEnd
                local hudRoleLbl = Instance.new("TextLabel", frame)
                hudRoleLbl.Name = "RoleLbl"
                hudRoleLbl.Size = UDim2.new(1, -110, 0, 14)
                hudRoleLbl.Position = UDim2.new(0, 72, 0, 27)
                hudRoleLbl.BackgroundTransparency = 1
                hudRoleLbl.TextColor3 = Color3.fromRGB(170, 175, 190)
                hudRoleLbl.Font = Enum.Font.GothamBold
                hudRoleLbl.TextSize = 11
                hudRoleLbl.TextXAlignment = Enum.TextXAlignment.Left
                local hudHpText = Instance.new("TextLabel", frame)
                hudHpText.Size = UDim2.new(0, 50, 0, 14)
                hudHpText.Position = UDim2.new(1, -58, 0, 27)
                hudHpText.BackgroundTransparency = 1
                hudHpText.TextColor3 = Color3.fromRGB(200, 205, 215)
                hudHpText.Font = Enum.Font.GothamBold
                hudHpText.TextSize = 11
                hudHpText.TextXAlignment = Enum.TextXAlignment.Right
                local hudBarBack = Instance.new("Frame", frame)
                hudBarBack.Size = UDim2.new(1, -80, 0, 8)
                hudBarBack.Position = UDim2.new(0, 72, 0, 48)
                hudBarBack.BackgroundColor3 = Color3.fromRGB(15, 17, 24)
                hudBarBack.BorderSizePixel = 0
                Instance.new("UICorner", hudBarBack).CornerRadius = UDim.new(0, 4)
                local hudBarStroke = Instance.new("UIStroke", hudBarBack)
                hudBarStroke.Color = Color3.fromRGB(62, 40, 22)
                hudBarStroke.Thickness = 1
                hudBarStroke.Transparency = 0.5
                local hudBar = Instance.new("Frame", hudBarBack)
                hudBar.Size = UDim2.new(1, 0, 1, 0)
                hudBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                hudBar.BorderSizePixel = 0
                Instance.new("UICorner", hudBar).CornerRadius = UDim.new(0, 4)
                local hudBarGrad = Instance.new("UIGradient", hudBar)
                local frame3 = Instance.new("Frame", frame)
                frame3.Size = UDim2.new(1, 0, 1, 0)
                frame3.BackgroundTransparency = 1
                frame3.BorderSizePixel = 0
                frame3.ClipsDescendants = true
                frame3.ZIndex = 4
                local hudShimmerGradient = Instance.new("UIGradient", frame3)
                hudShimmerGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(224, 116, 24)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 90, 255)),
                })
                hudShimmerGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.85), NumberSequenceKeypoint.new(1, 1)})
                hudShimmerGradient.Rotation = 90
                hudShimmerGradient.Offset = Vector2.new(-1, 0)
                task.spawn(function()
                    while true do
                        if tbl.hudGui and tbl.hudGui.Parent then
                            gradient.Rotation = (gradient.Rotation + 1) % 360
                            task.wait(0.03)
                            continue
                        end
                        break
                    end
                end)
                task.spawn(function()
                    while true do
                        if tbl.hudGui and tbl.hudGui.Parent then
                            local v6 = TweenService2
                            local create = v6.Create
                            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                            local tbl6 = {}
                            tbl6.Offset = Vector2.new(2, 0)
                            local tween = create(v6, hudShimmerGradient, tweenInfo, tbl6)
                            tween:Play()
                            tween.Completed:Wait()
                            task.wait(2)
                            hudShimmerGradient.Offset = Vector2.new(-1, 0)
                            continue
                        end
                        break
                    end
                end)
                tbl.hudFrame = frame
                tbl.hudStroke = stroke
                tbl.hudStrokeGrad = gradient
                tbl.hudGlow = hudGlow
                tbl.hudLogo = imageLabel
                tbl.hudIcon = hudIcon
                tbl.hudIconStroke = hudIconStroke
                tbl.hudName = textLabel
                tbl.hudRoleLbl = hudRoleLbl
                tbl.hudHpText = hudHpText
                tbl.hudBarBack = hudBarBack
                tbl.hudBarStroke = hudBarStroke
                tbl.hudBar = hudBar
                tbl.hudBarGrad = hudBarGrad
                tbl.hudShimmerGradient = hudShimmerGradient
                if connection.ApplyTheme then
                    connection:ApplyTheme(connection.CurrentTheme or "Default")
                end
            end
        end
        function tbl.getTarget()
            local character = localPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then
                return nil
            else
                local function fn75(player2)
                    if not player2 or player2 == localPlayer or not player2.Character then
                        return false
                    else
                        local humanoid = player2.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid = humanoid.Health > 0
                        end
                        return humanoid and player2.Character:FindFirstChild("HumanoidRootPart") ~= nil
                    end
                end
                local function fn76(v6)
                    if not v6 then
                        return true
                    else
                        local v7 = roles[v6]
                        if not v7 then
                            return false
                        else
                            return v7.Killed or v7.Dead
                        end
                    end
                end
                if fn25() then
                    if v4 then
                        local v6 = Players2:FindFirstChild(v4)
                        if v6 and fn75(v6) and not fn76(v4) then
                            return v6
                        end
                    end
                    if v5 then
                        local v6 = Players2:FindFirstChild(v5)
                        if v6 and fn75(v6) and not fn76(v5) then
                            return v6
                        end
                    end
                else
                    if v3 then
                        local v6 = Players2:FindFirstChild(v3)
                        if v6 and fn75(v6) and not fn76(v3) then
                            return v6
                        end
                    end
                    murd = fn11()
                    if murd and murd ~= localPlayer and fn75(murd) then
                        return murd
                    end
                end
                local position = character.HumanoidRootPart.Position
                local v6, v7, v8 = ipairs(Players2:GetPlayers())
                local value2 = 1 / 0
                local v9 = nil
                for _, value3 in v6, v7, v8 do
                    if value3 ~= localPlayer and value3.Character then
                        local humanoidRootPart = value3.Character:FindFirstChild("HumanoidRootPart")
                        local humanoid = value3.Character:FindFirstChildOfClass("Humanoid")
                        if humanoidRootPart and humanoid and humanoid.Health > 0 then
                            local magnitude = (position - humanoidRootPart.Position).Magnitude
                            if magnitude < value2 then
                                value2 = magnitude
                                v9 = value3
                            end
                        end
                    end
                end
                return v9
            end
        end
        function tbl.updateEsp(player2)
            if tbl.espFrame then
                local currentCamera = workspace.CurrentCamera
                if not currentCamera then
                    tbl.espFrame.Visible = false
                elseif not player2 or not player2.Character or not player2.Character:FindFirstChild("HumanoidRootPart") then
                    tbl.espFrame.Visible = false
                    tbl.lastEspPlayer = nil
                else
                    local humanoid = player2.Character:FindFirstChildOfClass("Humanoid")
                    if not humanoid or humanoid.Health <= 0 then
                        tbl.espFrame.Visible = false
                        tbl.lastEspPlayer = nil
                    else
                        if tbl.lastEspPlayer ~= player2.UserId then
                            tbl.lastEspPlayer = player2.UserId
                            tbl.lastEspHp = humanoid.Health
                            tbl.espDamageTime = 0
                        end
                        if tbl.lastEspHp and humanoid.Health < tbl.lastEspHp then
                            tbl.espDamageTime = tick()
                        end
                        tbl.lastEspHp = humanoid.Health
                        local v6, v7 = currentCamera:WorldToViewportPoint(player2.Character.HumanoidRootPart.Position)
                        if not v7 then
                            tbl.espFrame.Visible = false
                        else
                            if not tbl.espFrame.Visible then
                                tbl.espFrame.Visible = true
                            end
                            local color = Color3.fromRGB(255, 0, 0)
                            local value2 = tick() - tbl.espDamageTime
                            local color2
                            if not (value2 < 0.6) then
                                color2 = color
                            else
                                color2 = (Color3.fromRGB(255, 255, 255)):Lerp(color, value2 / 0.6)
                            end
                            tbl.espFrame.Position = UDim2.new(0, v6.X, 0, v6.Y)
                            tbl.espFrame.Size = UDim2.new(0, 45, 0, 45)
                            tbl.espFrame.Rotation = tick() * 60 % 360
                            for _, espCorner in pairs(tbl.espCorners) do
                                espCorner[1].Thickness = 2.5
                                espCorner[2].Thickness = 2.5
                                espCorner[3].Thickness = 4.5
                                espCorner[4].Thickness = 4.5
                                espCorner[5].Thickness = 7.5
                                espCorner[6].Thickness = 7.5
                                espCorner[1].Color = color2
                                espCorner[2].Color = color2
                                espCorner[3].Color = color2
                                espCorner[4].Color = color2
                                espCorner[5].Color = color2
                                espCorner[6].Color = color2
                            end
                        end
                    end
                end
            end
        end
        function tbl.updateHud(player2)
            if tbl.hudFrame then
                if not player2 or not player2.Character then
                    if tbl.hudFrame.Visible then
                        tbl.hudFrame.Visible = false
                        tbl.lastHudPlayer = nil
                    end
                else
                    local humanoid = player2.Character:FindFirstChildOfClass("Humanoid")
                    if not humanoid then
                        if tbl.hudFrame.Visible then
                            tbl.hudFrame.Visible = false
                            tbl.lastHudPlayer = nil
                        end
                    else
                        if not tbl.hudFrame.Visible then
                            tbl.hudFrame.Visible = true
                        end
                        if tbl.lastHudPlayer ~= player2.UserId then
                            tbl.lastHudPlayer = player2.UserId
                            tbl.hudName.Text = player2.DisplayName
                            tbl.hudIcon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. player2.UserId .. "&w=150&h=150"
                            tbl.hudBar.Size = UDim2.new(math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1), 0, 1, 0)
                            tbl.hudIcon.ImageColor3 = Color3.new(1, 1, 1)
                        end
                        local textColor3 = Color3.fromRGB(0, 225, 100)
                        local v6 = roles[player2.Name]
                        local text2 = "Innocent"
                        if v6 and v6.Role then
                            if v6.Role == "Murderer" then
                                textColor3 = Color3.fromRGB(255, 50, 50)
                                text2 = "Murderer"
                            elseif v6.Role == "Sheriff" then
                                textColor3 = Color3.fromRGB(50, 150, 255)
                                text2 = "Sheriff"
                            else
                                text2 = "Innocent"
                                if v6.Role == "Hero" then
                                    textColor3 = Color3.fromRGB(255, 215, 0)
                                    text2 = "Hero"
                                end
                            end
                        end
                        if tbl.hudRoleLbl then
                            tbl.hudRoleLbl.Text = text2
                            tbl.hudRoleLbl.TextColor3 = textColor3
                        end
                        if tbl.lastHudHp and humanoid.Health < tbl.lastHudHp then
                            tbl.hudDamageTime = tick()
                            tbl.hudIcon.ImageColor3 = Color3.fromRGB(255, 100, 100)
                            TweenService2:Create(tbl.hudIcon, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.new(1, 1, 1)}):Play()
                        end
                        tbl.lastHudHp = humanoid.Health
                        local value2 = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                        local value3 = tick() - (tbl.hudDamageTime or 0)
                        local v7
                        if not (value3 < 0.3) then
                            v7 = textColor3
                        else
                            v7 = (Color3.fromRGB(255, 255, 255)):Lerp(textColor3, value3 / 0.3)
                        end
                        tbl.hudBarGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, v7:Lerp(Color3.fromRGB(0, 0, 0), 0.2)), ColorSequenceKeypoint.new(1, v7)})
                        if tbl.hudTween then
                            tbl.hudTween:Cancel()
                        end
                        tbl.hudTween = TweenService2:Create(tbl.hudBar, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(value2, 0, 1, 0)})
                        tbl.hudTween:Play()
                        tbl.hudHpText.Text = string.format("%.0f HP", humanoid.Health)
                    end
                end
            end
        end
        RunService.RenderStepped:Connect(function()
            if not tbl.esp and not tbl.hud then
                if tbl.espFrame then
                    tbl.espFrame.Visible = false
                end
                if tbl.hudFrame then
                    tbl.hudFrame.Visible = false
                end
            else
                local v6 = tick()
                if tbl.roleRefresh <= v6 then
                    tbl.roleRefresh = tick() + 0.5
                    tbl.refreshRoles()
                end
                local v7 = tbl.getTarget()
                if tbl.hud then
                    tbl.createHudGui()
                    tbl.updateHud(v7)
                end
                if tbl.esp then
                    tbl.createEspGui()
                    tbl.updateEsp(v7)
                end
            end
        end)
        workspace.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "GunDrop" then
                if gunESP then
                    local highlight = Instance.new("Highlight", descendant)
                    highlight.FillColor = Color3.fromRGB(255, 255, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    tbl3.new({Title = "ESP", Content = "Gun dropped!", Duration = 3})
                end
                if autoGetGun then
                    task.spawn(function()
                        if not fn25() then
                            local character = localPlayer.Character
                            if character then
                                if gunPickupMethod == "Remote" then
                                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                                    local basePart = descendant:IsA("BasePart") and descendant or descendant:FindFirstChildWhichIsA("BasePart", true)
                                    for i = 1, 20 do
                                        if not basePart then
                                            task.wait(0.05)
                                            local v6 = descendant:IsA("BasePart") and descendant
                                            if v6 then
                                                basePart = v6
                                                continue
                                            else
                                                basePart = descendant:FindFirstChildWhichIsA("BasePart", true)
                                                continue
                                            end
                                            continue
                                        end
                                        if humanoidRootPart and basePart and humanoidRootPart:IsDescendantOf(workspace) and basePart:IsDescendantOf(workspace) and firetouchinterest then
                                            task.wait(0.2)
                                            pcall(function()
                                                firetouchinterest(humanoidRootPart, basePart, 0)
                                                task.wait(0.05)
                                                firetouchinterest(humanoidRootPart, basePart, 1)
                                            end)
                                        end
                                        localPlayer.Backpack.ChildAdded:Wait()
                                        tbl3.new({Title = "Auto-gun", Content = "Picked up gun (Remote).", Duration = 3})
                                        return
                                    end
                                    if humanoidRootPart and basePart and humanoidRootPart:IsDescendantOf(workspace) and basePart:IsDescendantOf(workspace) and firetouchinterest then
                                        task.wait(0.2)
                                        pcall(function()
                                            firetouchinterest(humanoidRootPart, basePart, 0)
                                            task.wait(0.05)
                                            firetouchinterest(humanoidRootPart, basePart, 1)
                                        end)
                                    end
                                    localPlayer.Backpack.ChildAdded:Wait()
                                    tbl3.new({Title = "Auto-gun", Content = "Picked up gun (Remote).", Duration = 3})
                                else
                                    local pivot = character:GetPivot()
                                    character:PivotTo(descendant:GetPivot())
                                    localPlayer.Backpack.ChildAdded:Wait()
                                    character:PivotTo(pivot)
                                    tbl3.new({Title = "Auto-gun", Content = "Picked up gun, returned.", Duration = 3})
                                end
                            end
                        end
                    end)
                end
            end
            local parent = trapESP
            if trapESP then
                parent = descendant.Name == "Trap"
            end
            if parent then
                parent = descendant.Parent
            end
            if parent then
                parent = descendant.Parent:IsA("Folder")
            end
            if parent then
                descendant.Transparency = 0
                local highlight = Instance.new("Highlight", descendant)
                highlight.FillColor = Color3.fromRGB(255, 100, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 100, 0)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                tbl3.new({Title = "ESP", Content = "Trap placed!", Duration = 3})
            end
        end)
        UserInputService2.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed then
                local v6 = ctrlTP
                if ctrlTP then
                    v6 = UserInputService2:IsKeyDown(Enum.KeyCode.LeftControl)
                end
                if v6 then
                    v6 = input.UserInputType == Enum.UserInputType.MouseButton1
                end
                if v6 then
                    local mouse = localPlayer:GetMouse()
                    local origin = workspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y).Origin
                    local direction = workspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y).Direction
                    local v7 = workspace
                    local raycast, v8, v9, value2 = v7.Raycast, v7, origin, direction * 1000
                    local v10 = raycast(v8, v9, value2)
                    if v10 then
                        local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            local newCFrame = CFrame.new
                            local position = v10.Position
                            humanoidRootPart.CFrame = newCFrame(position + Vector3.new(0, 3, 0))
                        end
                    end
                end
            end
        end)
        disableFly = function()
            flyOn = false
            if connection7 then
                connection7:Disconnect()
            end
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
            if bodyGyro then
                bodyGyro:Destroy()
            end
            local character = localPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                end
            end
        end
        fn34 = function()
            disableFly()
            local character = localPlayer.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not (not humanoidRootPart or not humanoid) then
                    flyOn = true
                    humanoid.PlatformStand = true
                    bodyVelocity = Instance.new("BodyVelocity")
                    local v6 = bodyVelocity
                    v6.MaxForce = Vector3.new(100000, 100000, 100000)
                    bodyVelocity.Parent = humanoidRootPart
                    bodyGyro = Instance.new("BodyGyro")
                    local v7 = bodyGyro
                    v7.MaxTorque = Vector3.new(100000, 100000, 100000)
                    bodyGyro.P = 10000
                    bodyGyro.Parent = humanoidRootPart
                    local connection8 = RunService.Heartbeat:Connect(function()
                        if flyOn then
                            local currentCamera = workspace.CurrentCamera
                            local v8 = UserInputService2:IsKeyDown(Enum.KeyCode.W)
                            local vector = Vector3.new(0, 0, 0)
                            if v8 then
                                local lookVector = currentCamera.CFrame.LookVector
                                vector = Vector3.new(0, 0, 0) + lookVector
                            end
                            if UserInputService2:IsKeyDown(Enum.KeyCode.S) then
                                vector = vector - currentCamera.CFrame.LookVector
                            end
                            if UserInputService2:IsKeyDown(Enum.KeyCode.A) then
                                vector = vector - currentCamera.CFrame.RightVector
                            end
                            if UserInputService2:IsKeyDown(Enum.KeyCode.D) then
                                vector = vector + currentCamera.CFrame.RightVector
                            end
                            if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then
                                vector = vector + Vector3.new(0, 1, 0)
                            end
                            local vec
                            if UserInputService2:IsKeyDown(Enum.KeyCode.LeftShift) then
                                vec = vector - Vector3.new(0, 1, 0)
                            else
                                vec = vector
                            end
                            bodyVelocity.Velocity = vec.Magnitude > 0 and vec.Unit * number or Vector3.new(0, 0, 0)
                            bodyGyro.CFrame = currentCamera.CFrame
                        end
                    end)
                    connection7 = connection8
                end
            end
        end
    end
    RunService.RenderStepped:Connect(function(dt)
        if blinkOn then
            local character = localPlayer.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Anchored = true
                    local cFrame = workspace.CurrentCamera and workspace.CurrentCamera.CFrame
                    if cFrame then
                        local lookVector = cFrame.LookVector
                        local unit = lookVector * Vector3.new(1, 0, 1)
                        if 0 < unit.Magnitude then
                            unit = unit.Unit
                        end
                        local rightVector = cFrame.RightVector
                        local value2 = rightVector * Vector3.new(1, 0, 1)
                        if 0 < value2.Magnitude then
                            value2 = value2.Unit
                        end
                        local v3 = UserInputService2:IsKeyDown(Enum.KeyCode.W)
                        local vector = Vector3.new(0, 0, 0)
                        if v3 then
                            vector = Vector3.new(0, 0, 0) + unit
                        end
                        if UserInputService2:IsKeyDown(Enum.KeyCode.S) then
                            vector = vector - unit
                        end
                        if UserInputService2:IsKeyDown(Enum.KeyCode.D) then
                            vector = vector + value2
                        end
                        if UserInputService2:IsKeyDown(Enum.KeyCode.A) then
                            vector = vector - value2
                        end
                        if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then
                            vector = vector + Vector3.new(0, 1, 0)
                        end
                        local unit2
                        if UserInputService2:IsKeyDown(Enum.KeyCode.LeftShift) then
                            unit2 = vector - Vector3.new(0, 1, 0)
                        else
                            unit2 = vector
                        end
                        if unit2.Magnitude > 0 then
                            unit2 = unit2.Unit
                        end
                        humanoidRootPart.CFrame = humanoidRootPart.CFrame + unit2 * blinkSpeed * dt
                    end
                end
            end
        end
    end)
    fn35 = function(v3)
        noclipOn = v3
        if v3 then
            local connection7 = RunService.Stepped:Connect(function()
                local character = localPlayer.Character
                if character then
                    for _, descendant in ipairs(character:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.CanCollide = false
                        end
                    end
                end
            end)
            connection6 = connection7
        elseif connection6 then
            connection6:Disconnect()
        end
    end
    fn36 = function()
        if connection5 then
            connection5:Disconnect()
        end
        local connection7 = RunService.Stepped:Connect(function()
            for _, player2 in pairs(Players2:GetPlayers()) do
                if player2 ~= localPlayer and player2.Character then
                    for _, descendant in pairs(player2.Character:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.CanCollide = false
                        end
                    end
                end
            end
        end)
        connection5 = connection7
    end
    fn37 = function()
        if connection5 then
            connection5:Disconnect()
            connection5 = nil
        end
    end
    fn9 = function()
        if instance then
            pcall(function()
                instance:Destroy()
            end)
            instance = nil
        end
    end
    fn10 = function()
        fn9()
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local backpack = localPlayer:FindFirstChildWhichIsA("Backpack")
                if backpack then
                    if instance then
                        pcall(function()
                            instance:Destroy()
                        end)
                    end
                    local tool = Instance.new("Tool")
                    tool.Name = "Jerk Off"
                    tool.ToolTip = "jorking it."
                    tool.RequiresHandle = false
                    tool.Parent = backpack
                    instance = tool
                    local enabled3 = false
                    local v3 = nil
                    local function fn68()
                        enabled3 = false
                        if v3 then
                            v3:Stop()
                            v3 = nil
                        end
                    end
                    tool.Equipped:Connect(function()
                        enabled3 = true
                    end)
                    tool.Unequipped:Connect(fn68)
                    humanoid.Died:Connect(fn68)
                    task.spawn(function()
                        while true do
                            local parent = jerkOn
                            if jerkOn then
                                parent = tool.Parent
                            end
                            if parent then
                                task.wait()
                                if enabled3 then
                                    local v4 = character:FindFirstChild("UpperTorso") ~= nil
                                    if not v3 then
                                        local animation = Instance.new("Animation")
                                        animation.AnimationId = not v4 and "rbxassetid://72042024" or "rbxassetid://698251653"
                                        v3 = humanoid:LoadAnimation(animation)
                                    end
                                    v3:Play()
                                    v3:AdjustSpeed(v4 and 0.7 or 0.65)
                                    v3.TimePosition = 0.6
                                    task.wait(0.1)
                                    while true do
                                        local v5 = v3
                                        if v3 then
                                            v5 = v3.TimePosition < (not v4 and 0.65 or 0.7)
                                        end
                                        if v5 then
                                            task.wait(0.1)
                                            continue
                                        end
                                        break
                                    end
                                    if v3 then
                                        v3:Stop()
                                        v3 = nil
                                        continue
                                    end
                                    continue
                                end
                                continue
                            end
                            break
                        end
                    end)
                end
            end
        end
    end
    local fn68 = function()
        local character = localPlayer.Character
        if not character then
            return nil
        else
            local function fn68(instance2)
                if instance2:FindFirstChild("KnifeScriptR15") or instance2:FindFirstChild("KnifeScriptR6") then
                    return {true, false}
                elseif instance2:FindFirstChild("KnifeServer") then
                    return {true, true}
                else
                    return {false, false}
                end
            end
            for _, child in ipairs(character:GetChildren()) do
                if child:IsA("Tool") then
                    local v3 = fn68(child)
                    if v3[1] then
                        return {child, v3[2]}
                    end
                end
            end
            local backpack = localPlayer:FindFirstChild("Backpack")
            if backpack then
                for _, child in ipairs(backpack:GetChildren()) do
                    if child:IsA("Tool") then
                        local v3 = fn68(child)
                        if v3[1] then
                            return {child, v3[2]}
                        end
                    end
                end
            end
            return nil
        end
    end
    local function fn69(player2)
        if not player2 or not player2.Character then
            return false
        else
            local character = player2.Character
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
                return false
            else
                local v3 = fn68()
                if not v3 then
                    return false
                else
                    local instance2 = v3[1]
                    local v4 = v3[2]
                    local handle = instance2:FindFirstChild("Handle")
                    local character2 = localPlayer.Character
                    if not handle or not character2 then
                        return false
                    else
                        pcall(function()
                            if instance2.Parent ~= character2 then
                                local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
                                if humanoid2 then
                                    humanoid2:EquipTool(instance2)
                                end
                                task.wait(0.05)
                            end
                            if v4 then
                                instance2:Activate()
                            else
                                local stab = instance2:FindFirstChild("Stab")
                                if stab then
                                    stab = instance2:FindFirstChild("Stab"):IsA("RemoteEvent")
                                end
                                if stab then
                                    instance2.Stab:FireServer("Slash")
                                else
                                    instance2:Activate()
                                end
                            end
                            firetouchinterest(handle, humanoidRootPart, 0)
                            task.wait()
                            firetouchinterest(handle, humanoidRootPart, 1)
                        end)
                        return true
                    end
                end
            end
        end
    end
    killAuraOn = false
    killAuraCons = {}
    killAuraLastKnife = nil
    local function fn70()
        if killAuraOn then
            local parent = localPlayer.Character
            if parent then
                local humanoid = parent:FindFirstChildOfClass("Humanoid")
                local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
                if not (not humanoid or humanoid.Health <= 0 or not humanoidRootPart) then
                    local v3 = fn68()
                    if v3 then
                        local instance2 = v3[1]
                        local v4 = v3[2]
                        local handle = instance2:FindFirstChild("Handle")
                        if handle then
                            local v5, v6, v7 = ipairs(Players2:GetPlayers())
                            local value2 = 1 / 0
                            local player2 = nil
                            for _, value3 in v5, v6, v7 do
                                if value3 ~= localPlayer then
                                    local character = value3.Character
                                    local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
                                    if character then
                                        character = character:FindFirstChildOfClass("Humanoid")
                                    end
                                    if humanoidRootPart2 and character and character.Health > 0 then
                                        local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude
                                        if magnitude < value2 then
                                            value2 = magnitude
                                            player2 = value3
                                        end
                                    end
                                end
                            end
                            if player2 then
                                local humanoidRootPart2 = player2.Character:FindFirstChild("HumanoidRootPart")
                                pcall(function()
                                    instance2.Parent = parent
                                    if v4 then
                                        instance2:Activate()
                                    else
                                        local stab = instance2:FindFirstChild("Stab")
                                        if stab then
                                            stab = instance2:FindFirstChild("Stab"):IsA("RemoteEvent")
                                        end
                                        if stab then
                                            instance2.Stab:FireServer("Slash")
                                        else
                                            instance2:Activate()
                                        end
                                    end
                                    firetouchinterest(handle, humanoidRootPart2, 0)
                                    task.wait()
                                    firetouchinterest(handle, humanoidRootPart2, 1)
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
    local function fn71(v3)
        if v3.Activated then
            v3.Activated:Connect(function()
                if killAuraOn then
                    task.spawn(fn70)
                end
            end)
        end
    end
    disableKillAura = function()
        killAuraOn = false
        local list2 = killAuraCons
        for i, value2 in ipairs(list2) do
            pcall(function()
                value2:Disconnect()
            end)
            killAuraCons[i] = nil
        end
        local v3 = killAuraCons
        table.clear(v3)
        killAuraLastKnife = nil
    end
    enableKillAura = function()
        disableKillAura()
        killAuraOn = true
        local function fn72()
            if killAuraOn then
                if localPlayer.Character then
                    local v3 = fn68()
                    if v3 then
                        v3 = v3[1]
                    end
                    if v3 and v3 ~= killAuraLastKnife then
                        fn71(v3)
                        killAuraLastKnife = v3
                    end
                end
            end
        end
        task.spawn(function()
            while true do
                task.wait(0.1)
                if not (fn68() or not killAuraOn) then
                    continue
                end
                break
            end
            fn72()
            while true do
                if killAuraOn then
                    task.wait(0.2)
                    fn72()
                    continue
                end
                break
            end
        end)
    end
    fn29 = function()
        local parent = localPlayer.Character
        if parent then
            local v3 = fn68()
            if not v3 then
                tbl3.new({Title = "Error", Content = "You don't have the knife!", Duration = 3})
            else
                local instance2 = v3[1]
                local v4 = v3[2]
                local handle = instance2:FindFirstChild("Handle")
                if not handle then
                    tbl3.new({Title = "Error", Content = "Knife has no handle!", Duration = 3})
                else
                    for _, player2 in ipairs(Players2:GetPlayers()) do
                        if player2 ~= localPlayer then
                            local character = player2.Character
                            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                            if character then
                                character = character:FindFirstChildOfClass("Humanoid")
                            end
                            if humanoidRootPart and character and character.Health > 0 then
                                pcall(function()
                                    instance2.Parent = parent
                                    if v4 then
                                        instance2:Activate()
                                    else
                                        local stab = instance2:FindFirstChild("Stab")
                                        if stab then
                                            stab = instance2:FindFirstChild("Stab"):IsA("RemoteEvent")
                                        end
                                        if stab then
                                            instance2.Stab:FireServer("Slash")
                                        else
                                            instance2:Activate()
                                        end
                                    end
                                    firetouchinterest(handle, humanoidRootPart, 0)
                                    task.wait()
                                    firetouchinterest(handle, humanoidRootPart, 1)
                                end)
                            end
                        end
                    end
                    tbl3.new({Title = "Done", Content = "Kill executed.", Duration = 3})
                end
            end
        end
    end
    fn15 = function(v3)
        if v3 then
            fn69(v3)
        else
            local player2 = fn13()
            if not player2 or not player2.Character then
                tbl3.new({Title = "Error", Content = "Can't find a player!", Duration = 3})
            else
                fn69(player2)
                tbl3.new({Title = "Knife", Content = "Slashed " .. player2.Name, Duration = 3})
            end
        end
    end
    fn30 = function()
        if fn12() == localPlayer then
            local player2 = fn11()
            if not (not player2 or not player2.Character) then
                local character = localPlayer.Character
                if character then
                    if not character:FindFirstChild("Gun") then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if localPlayer.Backpack:FindFirstChild("Gun") then
                            humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Gun"))
                        else
                            return
                        end
                    end
                    local humanoidRootPart = player2.Character:FindFirstChild("HumanoidRootPart")
                    local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
                    if not (not humanoidRootPart or not humanoidRootPart2) then
                        local gun = character:FindFirstChild("Gun")
                        if gun then
                            local v3 = fn26(player2, shootOff)
                            local rayParams = RaycastParams.new()
                            rayParams.FilterType = Enum.RaycastFilterType.Exclude
                            rayParams.FilterDescendantsInstances = {character}
                            local element = workspace:Raycast(humanoidRootPart2.Position, humanoidRootPart.Position - humanoidRootPart2.Position, rayParams)
                            local v4 = not element
                            if not v4 then
                                v4 = element.Instance:IsDescendantOf(player2.Character)
                            end
                            if v4 then
                                pcall(function()
                                    gun.Shoot:FireServer(CFrame.new(character:FindFirstChild("RightHand") and character.RightHand.Position or humanoidRootPart2.Position), CFrame.new(v3))
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
    local function fn72()
        for _, player2 in ipairs(Players2:GetPlayers()) do
            if player2 ~= localPlayer then
                local character = player2.Character
                if character then
                    character = character:FindFirstChild("Knife") or player2.Backpack:FindFirstChild("Knife")
                end
                if character then
                    return player2
                end
            end
        end
        return nil
    end
    local function fn73(player2)
        local character = player2.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        if character then
            character = character:FindFirstChildOfClass("Humanoid")
        end
        if not humanoidRootPart or not character then
            return nil
        else
            local position = humanoidRootPart.Position
            local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
            return position + assemblyLinearVelocity * Vector3.new(0.75, 0.5, 0.75) * (offset / 15) + character.MoveDirection * offset
        end
    end
    local function fn74(instance2)
        if instance2:FindFirstChild("Gun") then
            return true
        else
            local gun = localPlayer.Backpack:FindFirstChild("Gun")
            local humanoid = instance2:FindFirstChildOfClass("Humanoid")
            if gun and humanoid then
                humanoid:EquipTool(gun)
                task.wait(0.1)
                return true
            else
                return false
            end
        end
    end
    local function fn75(instance2, v3, v4)
        local shoot = instance2:FindFirstChild("Shoot") or instance2:FindFirstChild("Events") and instance2.Events:FindFirstChild("Shoot")
        if shoot then
            shoot:FireServer(CFrame.new(v3), CFrame.new(v4))
        else
            local knifeLocal = instance2:FindFirstChild("KnifeLocal")
            if knifeLocal then
                knifeLocal = knifeLocal:FindFirstChild("CreateBeam")
            end
            if knifeLocal then
                knifeLocal:InvokeServer(1, v4, "AH2")
            end
        end
    end
    fn31 = function()
        local character = localPlayer.Character
        if character then
            local player2 = fn72()
            if player2 then
                local humanoidRootPart = player2.Character and player2.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    task.spawn(function()
                        if fn74(character) then
                            local gun = character:FindFirstChild("Gun")
                            if gun then
                                if forceShotEnabled then
                                    ForceShootAttempt(player2, character, gun)
                                else
                                    local rightHand = character:FindFirstChild("RightHand")
                                    if rightHand then
                                        local position = fn73(player2) or humanoidRootPart.Position
                                        fn75(gun, rightHand.Position, position)
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end
    end
    fn32 = function()
        if connection4 then
            connection4:Disconnect()
            connection4 = nil
        end
        local character = localPlayer.Character
        local gun = character and character:FindFirstChild("Gun") or localPlayer.Backpack:FindFirstChild("Gun")
        if gun then
            local connection7 = gun.Activated:Connect(function()
                if forceShotEnabled then
                    fn31()
                end
            end)
            connection4 = connection7
        end
    end;
    (function()
        local tbl6 = {
            SNAP_CAP = 20,
            FIT_WINDOW = 0.13,
            STAB_WINDOW = 0.35,
            LEAD_CAP = 0.34,
            OFF_CAP = 48,
            AIR_OFF_CAP = 1.6,
            AIR_VEL_CAP = 80,
            MAX_HSPEED = 34,
            MAX_VSPEED = 170,
            FORCE_BACK = 3.4,
            FORCE_AHEAD = 7,
            FORCE_BACK_CAP = 16,
            FORCE_AHEAD_CAP = 40,
            FORCE_MIN_BACK = 2,
        }
        local sNAP_CAP = tbl6.SNAP_CAP
        local fIT_WINDOW = tbl6.FIT_WINDOW
        FS_SNAP_CAP = sNAP_CAP
        FS_FIT_WINDOW = fIT_WINDOW
        FS_STAB_WINDOW = tbl6.STAB_WINDOW
        FS_LEAD_CAP = tbl6.LEAD_CAP
        FS_OFF_CAP = tbl6.OFF_CAP
        FS_AIR_OFF_CAP = tbl6.AIR_OFF_CAP
        FS_AIR_VEL_CAP = tbl6.AIR_VEL_CAP
        FS_MAX_HSPEED = tbl6.MAX_HSPEED
        FS_MAX_VSPEED = tbl6.MAX_VSPEED
        FS_FORCE_BACK = tbl6.FORCE_BACK
        FS_FORCE_AHEAD = tbl6.FORCE_AHEAD
        FS_FORCE_BACK_CAP = tbl6.FORCE_BACK_CAP
        FS_FORCE_AHEAD_CAP = tbl6.FORCE_AHEAD_CAP
        FS_FORCE_MIN_BACK = tbl6.FORCE_MIN_BACK
        fsTarget = nil
        fsTrackPart = nil
        fsTrackPos = nil
        fsTrackTime = 0
        fsTrackVel = Vector3.new(0, 0, 0)
        fsTrackGap = 0.05
        fsTrackJitter = 0
        fsTrackReady = false
        fsTrackStab = 1
        fsRestGap = 3
        fsRestReady = false
        local gravity = workspace.Gravity
        fsSnapT = {}
        fsSnapP = {}
        fsSnapN = 0
        fsSnapI = 0
        fsLeadPing = 0
        fsPingJitter = 0
        fsPingSeen = false
        fsPredOff = Vector3.new(0, 0, 0)
        fsPredStamp = 0
        fsPredFloor = nil
        fsForceAtt = nil
        fsForceSaved = nil
        fsForceStamp = 0
        fsGrav = gravity
        fsForceDirs = {}
        local function fn76(vec)
            local x = vec.X
            local z = vec.Z
            local value2 = math.sqrt(x * x + z * z)
            local value3, v3
            if value2 > FS_MAX_HSPEED then
                local value4 = FS_MAX_HSPEED / value2
                local value5 = x * value4
                value3 = z * value4
                v3 = value5
            else
                value3 = z
                v3 = x
            end
            return Vector3.new(v3, math.clamp(vec.Y, -FS_MAX_VSPEED, FS_MAX_VSPEED), value3)
        end
        local function fn77(v3)
            local v4, v5 = pcall(function()
                return v3.AssemblyLinearVelocity
            end)
            if v4 and typeof(v5) == "Vector3" then
                return fn76(v5)
            else
                return Vector3.new(0, 0, 0)
            end
        end
        local function fn78()
            fsSnapN = 0
            fsSnapI = 0
        end
        local function fn79(v3, v4)
            fsSnapI = fsSnapI % FS_SNAP_CAP + 1
            fsSnapT[fsSnapI] = v3
            fsSnapP[fsSnapI] = v4
            if fsSnapN < FS_SNAP_CAP then
                fsSnapN = fsSnapN + 1
            end
        end
        local v3 = function(v3)
            local value2 = (fsSnapI - v3 - 1) % FS_SNAP_CAP + 1
            return fsSnapT[value2], fsSnapP[value2]
        end
        local v4 = function()
            if fsSnapN < 3 then
                return nil
            else
                local v4 = v3(0)
                local value2 = fsSnapN - 1
                local n2 = 0
                local n3 = 0
                local n4 = 0
                local value3, value4 = 1 + 0, value2 + 0
                local value5 = n2 - value3
                while true do
                    value5 += value3
                    local v5 = if value3 <= 0 then value5 >= value4 else value5 <= value4
                    if v5 then
                        n2 = value5
                    end
                    if v5 then
                        local v6 = v3(n2)
                        if FS_FIT_WINDOW < v4 - v6 then
                            break
                        else
                            n3 = n3 + 1
                            n2 = v6 - v4
                            n4 = n4 + n2
                            continue
                        end
                    end
                    if n3 < 3 then
                        return nil
                    else
                        local value6 = n4 / n3
                        local value7 = n3 - 1
                        local vector = Vector3.new(0, 0, 0)
                        local n5 = 0
                        for i = 0, value7 + 0 do
                            local v6, v7 = v3(i)
                            local value8 = v6 - v4 - value6
                            vector = vector + v7 * value8
                            n5 = n5 + value8 * value8
                        end
                        if n5 < 1e-08 then
                            return nil
                        else
                            return vector / n5, -value6
                        end
                    end
                end
                if n3 < 3 then
                    return nil
                else
                    local value6 = n4 / n3
                    local value7 = n3 - 1
                    local vector = Vector3.new(0, 0, 0)
                    local n5 = 0
                    for i = 0, value7 + 0 do
                        local v5, v6 = v3(i)
                        local value8 = v5 - v4 - value6
                        vector = vector + v6 * value8
                        n5 = n5 + value8 * value8
                    end
                    if n5 < 1e-08 then
                        return nil
                    else
                        return vector / n5, -value6
                    end
                end
            end
        end
        local v5 = function()
            if fsSnapN < 4 then
                return 1
            else
                local v5, v6 = v3(0)
                local value2 = fsSnapN - 1
                local n2 = 0
                local n3 = 0
                local value3, value4 = 1 + 0, value2 + 0
                local value5 = 1 - value3
                local v7 = v6
                local v8 = v6
                while true do
                    value5 += value3
                    local v9 = if value3 <= 0 then value5 >= value4 else value5 <= value4
                    if v9 then
                        value2 = value5
                    end
                    if v9 then
                        local v10
                        v10, value2 = v3(value2)
                        if v5 - v10 > FS_STAB_WINDOW then
                            break
                        else
                            local value6 = v7 - value2
                            n2 = n2 + Vector3.new(value6.X, 0, value6.Z).Magnitude
                            n3 = n3 + 1
                            v7 = value2
                            v8 = value2
                            continue
                        end
                    end
                    if n3 < 3 or n2 < 1 then
                        return 1
                    else
                        local value6 = v6 - v8
                        return math.clamp(Vector3.new(value6.X, 0, value6.Z).Magnitude / n2, 0, 1)
                    end
                end
                if n3 < 3 or n2 < 1 then
                    return 1
                else
                    local value6 = v6 - v8
                    return math.clamp(Vector3.new(value6.X, 0, value6.Z).Magnitude / n2, 0, 1)
                end
            end
        end
        local v6 = function(v6, v7, vec)
            if not v6 then
                return vec
            else
                local vec2 = fn76(v6)
                local vector = Vector3.new(vec2.X, 0, vec2.Z)
                local vector2 = Vector3.new(vec.X, 0, vec.Z)
                local magnitude = vector.Magnitude
                local magnitude2 = vector2.Magnitude
                if magnitude < 1 and magnitude2 < 1 then
                    vector = Vector3.new(0, 0, 0)
                elseif not (magnitude2 < 1) then
                    if magnitude < 1 then
                        vector = vector2
                    elseif not (vector.Unit:Dot(vector2.Unit) < 0.25) then
                        vector = vector2 * 0.75 + vector * 0.25
                    end
                end
                local y
                if 0.5 < math.abs(vec.Y) then
                    y = vec.Y
                elseif math.abs(vec2.Y) > 1 then
                    local v8 = fsGrav
                    y = math.clamp(vec2.Y - v8 * (v7 or 0), -FS_MAX_VSPEED, FS_MAX_VSPEED)
                else
                    y = 0
                end
                return Vector3.new(vector.X, y, vector.Z)
            end
        end
        fsGroundParams = RaycastParams.new()
        fsGroundParams.FilterType = Enum.RaycastFilterType.Exclude
        fsGroundParams.IgnoreWater = true
        fsGroundFilter = {}
        local v7 = function(v7, v8)
            table.clear(fsGroundFilter)
            local character = fsTarget and fsTarget.Character
            local n2 = 0
            if character then
                fsGroundFilter[1] = character
                n2 = 1
            end
            if localPlayer.Character then
                fsGroundFilter[n2 + 1] = localPlayer.Character
            end
            fsGroundParams.FilterDescendantsInstances = fsGroundFilter
            local v9 = workspace
            local raycast = v9.Raycast
            local value2 = v7 + Vector3.new(0, 2, 0)
            local newVector3, n3, v10, n4 = Vector3.new, 0, -(v8 + 2), 0
            local v11 = raycast(v9, value2, newVector3(n3, v10, n4), fsGroundParams)
            if v11 then
                return v11.Position.Y
            else
                return nil
            end
        end
        local function disableFsTrackReady()
            fsTrackPart = nil
            fsTrackPos = nil
            fsTrackVel = Vector3.new(0, 0, 0)
            fsTrackGap = 0.05
            fsTrackJitter = 0
            fsTrackReady = false
            fsTrackStab = 1
            fsRestReady = false
            fn78()
        end
        local v8 = function(v8, v9, v10)
            fsTrackPart = v8
            fsTrackPos = v9
            fsTrackTime = v10
            fsTrackVel = Vector3.new(0, 0, 0)
            fsTrackGap = 0.05
            fsTrackJitter = 0
            fsTrackReady = false
            fsTrackStab = 1
            fn78()
            fn79(v10, v9)
        end
        local v9 = function(v9)
            local instance2 = fsTrackPart
            if not instance2 or not instance2.Parent then
                if fsTrackPart then
                    disableFsTrackReady()
                end
            else
                local position = instance2.Position
                if instance2 ~= fsTrackPart or not fsTrackPos then
                    v8(instance2, position, v9)
                else
                    local value2 = v9 - fsTrackTime
                    if 0.75 < value2 then
                        v8(instance2, position, v9)
                    elseif 140 < (position - fsTrackPos).Magnitude then
                        v8(instance2, position, v9)
                    elseif (position - fsTrackPos).Magnitude < 0.004 or value2 <= 0 then
                        if fsTrackReady and value2 > 0.12 and fn77(instance2).Magnitude < 1 then
                            fsTrackVel = fsTrackVel * 0.6
                        end
                    else
                        local v10 = fsTrackGap
                        fsTrackGap = math.clamp(v10 * 0.8 + value2 * 0.2, 0.012, 0.25)
                        fsTrackJitter = math.clamp(fsTrackJitter * 0.8 + math.abs(value2 - v10) * 0.2, 0, 0.15)
                        fn79(v9, position)
                        fsTrackPos = position
                        fsTrackTime = v9
                        local v11, v12 = v4()
                        local vec = v6(v11, v12, fn77(instance2))
                        if fsTrackReady then
                            local vector = Vector3.new(fsTrackVel.X, 0, fsTrackVel.Z)
                            local vector2 = Vector3.new(vec.X, 0, vec.Z)
                            local v13 = vector.Magnitude > 1 and vector2.Magnitude > 1
                            if v13 then
                                v13 = vector.Unit:Dot(vector2.Unit) < 0.5
                            end
                            local n2 = 0.45
                            if v13 then
                                n2 = 0.85
                            end
                            local value3 = fsTrackVel.X + (vec.X - fsTrackVel.X) * n2
                            local value4 = fsTrackVel.Z + (vec.Z - fsTrackVel.Z) * n2
                            local y
                            if 3 < math.abs(vec.Y) then
                                y = vec.Y
                            else
                                y = fsTrackVel.Y + (vec.Y - fsTrackVel.Y) * 0.6
                            end
                            fsTrackVel = Vector3.new(value3, y, value4)
                        else
                            fsTrackVel = vec
                            fsTrackReady = true
                        end
                        fsTrackStab = v5()
                        if math.abs(vec.Y) < 3 then
                            local v13 = v7(position, 12)
                            if v13 then
                                local value3 = position.Y - v13
                                if value3 > 0.5 and value3 < 8 then
                                    if fsRestReady then
                                        fsRestGap = fsRestGap * 0.85 + value3 * 0.15
                                    else
                                        fsRestGap = value3
                                        fsRestReady = true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        local v10 = function()
            local v10, v11 = pcall(function()
                return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            end)
            if v10 then
                v10 = type(v11) == "number"
            end
            local n2 = 0
            if not v10 then
                v11 = n2
            end
            local value2 = math.clamp(v11 / 1000, 0, 1)
            if fsPingSeen then
                fsPingJitter = math.clamp(fsPingJitter * 0.8 + math.abs(value2 - fsLeadPing) * 0.2, 0, 0.2)
                fsLeadPing = fsLeadPing * 0.85 + value2 * 0.15
            else
                fsLeadPing = value2
                fsPingSeen = true
            end
        end
        local function v11()
            return math.clamp(fsLeadPing * 2, 0, FS_LEAD_CAP)
        end
        local v12 = function(v12)
            if not fsTrackReady then
                return Vector3.new(0, 0, 0), nil
            else
                local v13 = v11()
                if v13 <= 0 then
                    return Vector3.new(0, 0, 0), nil
                else
                    local vec = fsTrackVel
                    local v14 = fsTrackStab
                    local value2 = math.clamp(v14, 0.3, 1) * v13
                    local value3 = vec.X * value2
                    local value4 = vec.Z * value2
                    local y = vec.Y
                    local value5 = math.max(24, math.abs(y) * v13 + fsRestGap + 12)
                    local v15, value6, v16 = v7, v12 + Vector3.new(value3, 0, value4), value5
                    local v17 = v15(value6, v16)
                    local value7 = nil
                    if v17 then
                        value7 = v17 + fsRestGap
                        local v18 = nil
                        if not (value7 <= v12.Y + 0.5) then
                            value7 = v18
                        end
                    end
                    local v18 = math.abs(y) < 3
                    if v18 and value7 then
                        v18 = v12.Y - value7 <= 1.5
                    end
                    local n2 = 0
                    if not v18 and math.abs(y) < FS_AIR_VEL_CAP then
                        local value8 = v13 * 0.35
                        n2 = math.clamp(y * value8 - 0.5 * fsGrav * value8 * value8, -FS_AIR_OFF_CAP, FS_AIR_OFF_CAP)
                    end
                    local vector = Vector3.new(value3, n2, value4)
                    if FS_OFF_CAP < vector.Magnitude then
                        return Vector3.new(0, 0, 0), nil
                    else
                        return vector, value7
                    end
                end
            end
        end
        local v13 = function()
            local instance2 = fsTrackPart
            if not instance2 or not instance2.Parent then
                return Vector3.new(0, 0, 0)
            else
                local position = instance2.Position
                local v13 = os.clock()
                if 0.004 < v13 - fsPredStamp then
                    fsPredStamp = v13
                    local v14, v15 = v12(position)
                    fsPredOff = v14
                    fsPredFloor = v15
                end
                local vec = fsPredOff
                local v14 = fsPredFloor
                if v14 and position.Y + vec.Y < v14 then
                    return Vector3.new(vec.X, v14 - position.Y, vec.Z)
                else
                    return vec
                end
            end
        end
        fsRay = RaycastParams.new()
        fsRay.FilterType = Enum.RaycastFilterType.Exclude
        fsRay.IgnoreWater = false
        fsIgnoreBase = {}
        fsIgnoreWork = {}
        fsIgnoreTime = 0
        local v14 = function()
            local v14 = os.clock()
            if not (#fsIgnoreBase > 0 and v14 - fsIgnoreTime < 0.5) then
                fsIgnoreTime = v14
                local v15 = fsIgnoreBase
                table.clear(v15)
                local character = localPlayer.Character
                if character then
                    fsIgnoreBase[1] = character
                end
                local v16, list2 = pcall(function()
                    return game:GetService("CollectionService"):GetTagged("WeaponPassthrough")
                end)
                if v16 and type(list2) == "table" then
                    local count = #list2
                    for i = 1, count + 0 do
                        fsIgnoreBase[#fsIgnoreBase + 1] = list2[i]
                    end
                end
            end
        end
        local v15 = function(v15, v16)
            v14()
            local v17 = fsIgnoreWork
            table.clear(v17)
            local count = #fsIgnoreBase
            local n2 = 1
            local n3 = 1
            local _
            for i = n2, count + 0, n3 + 0 do
                fsIgnoreWork[i] = fsIgnoreBase[i]
            end
            local element = nil
            for i = 1, 6 do
                fsRay.FilterDescendantsInstances = fsIgnoreWork
                element = workspace:Raycast(v15, v16, fsRay)
                if element then
                    local instance2 = element.Instance
                    if not instance2 then
                        break
                    else
                        local v18, v19 = pcall(function()
                            return instance2.Transparency
                        end)
                        if not (not v18 or v19 ~= 1) then
                            fsIgnoreWork[#fsIgnoreWork + 1] = instance2
                            continue
                        end
                    end
                end
                return element
            end
            return element
        end
        local function v16()
            local character = localPlayer.Character
            local humanoidRootPart
            if character then
                humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            else
                humanoidRootPart = character
            end
            if not humanoidRootPart then
                return nil, nil
            else
                return humanoidRootPart:FindFirstChild("GunRaycastAttachment"), humanoidRootPart
            end
        end
        local v17 = function()
            local v17, v18 = v16()
            if v17 then
                return v17.WorldCFrame
            elseif v18 then
                return v18.CFrame
            else
                return nil
            end
        end
        local v18 = function(v18, vec, v19)
            local v20 = fsForceDirs
            table.clear(v20)
            local n2 = 0
            if v18 then
                fsForceDirs[1] = v18
                n2 = 1
            end
            if vec.Magnitude > 3 then
                local unit = vec.Unit
                if not v18 or unit:Dot(v18) < 0.95 then
                    n2 = n2 + 1
                    fsForceDirs[n2] = unit
                end
                n2 = n2 + 1
                fsForceDirs[n2] = -unit
            end
            if v19 then
                n2 = n2 + 1
                fsForceDirs[n2] = v19
            end
            local value2 = n2 + 1
            local v21 = fsForceDirs
            v21[value2] = Vector3.new(0, -1, 0)
            for i = 0, 5 do
                local value3 = i * 1.0471975511965976
                value2 = value2 + 1
                local v22 = fsForceDirs
                local newVector3 = Vector3.new
                local value4 = math.cos(value3)
                local v23 = table.pack(math.sin(value3))
                local v24 = -0.25
                local n3 = v23.n
                v23.n = 3 + n3 - 1
                table.move(v23, 1, n3, 3, v23)
                v23[1], v23[2] = value4, v24
                v22[value2] = newVector3(table.unpack(v23, 1, v23.n)).Unit
            end
            local value3 = value2 + 1
            local v22 = fsForceDirs
            v22[value3] = Vector3.new(0, 1, 0)
            return value3
        end
        local v19 = function(instance2)
            local character = fsTarget and fsTarget.Character
            if not instance2 or not character then
                return false
            else
                local v19 = instance2 == character
                local v20
                if v19 then
                    v20 = v19
                else
                    v20 = instance2:IsDescendantOf(character)
                end
                return v20
            end
        end
        local v20 = function(v20, v21)
            local element = v15(v20, v21 - v20)
            if not element then
                return false
            else
                return v19(element.Instance)
            end
        end
        local v21 = function()
            if fsTrackReady and fsTrackVel.Magnitude > 0.5 then
                return fsTrackVel
            else
                local v21 = fsTrackPart
                if v21 then
                    return fn77(v21)
                else
                    return Vector3.new(0, 0, 0)
                end
            end
        end
        local function v22()
            local instance2 = fsForceAtt
            if instance2 then
                local cFrame = fsForceSaved
                fsForceAtt = nil
                fsForceSaved = nil
                if cFrame then
                    pcall(function()
                        if instance2.Parent then
                            instance2.CFrame = cFrame
                        end
                    end)
                end
            end
        end
        local v23 = function(worldCFrame)
            local v23 = v16()
            if not v23 then
                return false
            else
                if fsForceAtt and fsForceAtt ~= v23 then
                    v22()
                end
                if not fsForceAtt then
                    local v24, v25 = pcall(function()
                        return v23.CFrame
                    end)
                    if not v24 or typeof(v25) ~= "CFrame" then
                        return false
                    else
                        fsForceAtt = v23
                        fsForceSaved = v25
                    end
                end
                fsForceStamp = os.clock()
                if not pcall(function()
                    v23.WorldCFrame = worldCFrame
                end) then
                    v22()
                    return false
                else
                    task.defer(v22)
                    return true
                end
            end
        end
        local v24 = function()
            local n2 = 0
            local instance2 = fsTrackPart
            if not instance2 or not instance2.Parent then
                return nil
            else
                local position = instance2.Position
                local vec = v13()
                local vec2 = v21()
                local v24 = v17()
                local unit = nil
                if v24 then
                    local vec3 = position - v24.Position
                    unit = nil
                    if 2 < vec3.Magnitude then
                        unit = vec3.Unit
                    end
                end
                local magnitude = vec.Magnitude
                local vector = magnitude > 0.75 and vec.Unit or nil
                local v25 = fsTrackJitter
                local value2 = math.clamp(vec2.Magnitude * (fsTrackGap + v25 + fsPingJitter + 0.02), 0, 14)
                local v26 = v18(vector, vec2, unit)
                local n3 = 1
                local tbl7 = {[5] = nil, [9] = nil, [6] = nil, [7] = nil}
                local value3, value4 = 1 + 0, v26 + 0
                local value5 = n3 - value3
                while true do
                    value5 += value3
                    local v27 = if value3 <= 0 then value5 >= value4 else value5 <= value4
                    if v27 then
                        n3 = value5
                    end
                    if v27 then
                        n3 = fsForceDirs[n3]
                        local value6 = math.abs(n3.Y)
                        local value7 = math.max(0, vec:Dot(n3))
                        local v28 = FS_FORCE_BACK
                        local v29 = FS_FORCE_BACK_CAP
                        local value8 = math.clamp(FS_FORCE_BACK + value2 + value6 * 2.5, v28, v29)
                        local v30 = FS_FORCE_AHEAD
                        local v31 = FS_FORCE_AHEAD_CAP
                        local value9 = math.clamp(FS_FORCE_AHEAD + value7 + value2 * 1.4 + value6 * 3, v30, v31)
                        tbl7 = {[5] = tbl7, [9] = value3, [6] = value4, [7] = value5}
                        value3, value4 = 1 + 0, 3 + 0
                        value5 = 1 - value3
                        while true do
                            value5 += value3
                            if if value3 <= 0 then value5 >= value4 else value5 <= value4 then
                                local value10 = position - n3 * value8
                                local value11 = position + n3 * value9
                                if v20(value10, value11) then
                                    return CFrame.new(value10, value11), CFrame.new(value11)
                                else
                                    value8 = value8 * 0.55
                                    if value8 < FS_FORCE_MIN_BACK then
                                        break
                                    else
                                        continue
                                    end
                                    n2 = 1
                                    break
                                end
                                n2 = 1
                                break
                            else
                                break
                            end
                            n2 = 1
                            break
                        end
                        if n2 > 0 then
                            n2 = n2 - 1
                            if n2 == 0 then
                                continue
                            else
                                break
                            end
                        elseif n2 < 0 then
                            local _ = n2 + 1
                            break
                        end
                        value5, value4, value3, tbl7 = tbl7[7], tbl7[6], tbl7[9], tbl7[5]
                    else
                        break
                    end
                end
                if not vector then
                    vector = unit
                end
                if not vector then
                    vector = Vector3.new(0, -1, 0)
                end
                return CFrame.new(position - vector * 2.6, position + vector * math.max(6, magnitude + 6)), CFrame.new(position + vector * math.max(6, magnitude + 6))
            end
        end
        ForceShootAttempt = function(player2, _, instance2)
            if not player2 or not player2.Character then
                return false
            else
                local character = player2.Character
                local torso = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not torso or not humanoid or humanoid.Health <= 0 then
                    return false
                else
                    fsTarget = player2
                    fsTrackPart = torso
                    v9(os.clock())
                    local shoot = instance2:FindFirstChild("Shoot") or instance2:FindFirstChild("Events") and instance2.Events:FindFirstChild("Shoot")
                    if not shoot then
                        return false
                    else
                        local v25, v26 = v24()
                        if not v25 then
                            return false
                        else
                            v23(v25)
                            local cantShoot = instance2:FindFirstChild("CantShoot")
                            if cantShoot then
                                pcall(function()
                                    if cantShoot:IsA("BoolValue") then
                                        cantShoot.Value = false
                                    else
                                        cantShoot.Enabled = false
                                    end
                                end)
                            end
                            shoot:FireServer(v25, v26)
                            return true
                        end
                    end
                end
            end
        end
        fsForceStop = function()
            v22()
            fsTarget = nil
            disableFsTrackReady()
        end
        fsNextRole = 0
        fsNextPing = 0
        RunService.Heartbeat:Connect(function()
            if forceShotEnabled then
                local v25 = os.clock()
                if fsNextRole <= v25 then
                    fsNextRole = v25 + 0.2
                    local player2 = fn72()
                    if player2 then
                        if player2 ~= fsTarget then
                            fsTarget = player2
                            disableFsTrackReady()
                        end
                        local character = player2.Character
                        if character then
                            local humanoidRootPart = player2.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                character = humanoidRootPart
                            else
                                character = player2.Character:FindFirstChild("UpperTorso")
                            end
                            if not character then
                                character = player2.Character:FindFirstChild("Torso")
                            end
                        end
                        if character then
                            fsTrackPart = character
                        end
                    end
                end
                if fsNextPing <= v25 then
                    fsNextPing = v25 + 0.25
                    v10()
                end
                v9(v25)
            end
        end)
    end)()
    UserInputService2.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            local v3 = silentAimEnabled
            if silentAimEnabled then
                v3 = silentShootKey
            end
            if v3 then
                v3 = silentShootKey ~= "None"
            end
            if v3 then
                if silentShootKey == "M1B" and input.UserInputType == Enum.UserInputType.MouseButton1 or silentShootKey == "M2B" and input.UserInputType == Enum.UserInputType.MouseButton2 or silentShootKey == input.KeyCode.Name then
                    local character = localPlayer.Character
                    if character then
                        character = character:FindFirstChildOfClass("Humanoid")
                    end
                    if character then
                        character = character.Health > 0
                    end
                    if character then
                        fn31()
                    end
                end
            end
        end
    end)
    task.spawn(function()
        while true do
            task.wait(0.05)
            if autoShoot then
                fn30()
            end
        end
    end)
    localPlayer.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        local currentCamera = workspace.CurrentCamera
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if currentCamera and humanoid then
            currentCamera.CameraType = Enum.CameraType.Custom
            currentCamera.CameraSubject = humanoid
        end
        blinkOn = false
        if enabled2 then
            task.spawn(function()
                task.wait(2)
                local v3 = enabled2
                if enabled2 then
                    v3 = localPlayer.Character == character
                end
                if v3 then
                    local humanoid2 = character:FindFirstChildOfClass("Humanoid")
                    if humanoid2 then
                        humanoid2 = humanoid2.Health > 0
                    end
                    if humanoid2 then
                        enabled2 = false
                        enableAntiAim()
                        pcall(function()
                            local antiAim = uiRefs and uiRefs.AntiAim
                            if antiAim and antiAim.SetValue then
                                antiAim:SetValue(true, true)
                            end
                        end)
                    end
                end
            end)
        elseif antiAimOn then
            disableAntiAim()
            enableAntiAim()
        end
        if pendingAura then
            fn17()
            fn18(pendingAura.assetId, pendingAura.name)
        end
        if antiflingOn then
            fn36()
        end
        if jerkOn then
            fn10()
        end
        if spinOn then
            fn5()
            fn6()
        end
        if walkFlingOn then
            fn7()
            fn8()
        end
        if customGunModelEnabled then
            fn16()
        end
        if friendOn then
            fn4()
        end
        if offDamageWater then
            fn55()
        end
        fn32()
    end)
    task.spawn(function()
        task.wait(1)
        if pendingAura then
            fn18(pendingAura.assetId, pendingAura.name)
        end
    end)
    disableAutoKnife = function()
        autoKnife = false
        if v2 then
            task.cancel(v2)
            v2 = nil
        end
    end
    enableAutoKnife = function()
        disableAutoKnife()
        autoKnife = true
        local thread = task.spawn(function()
            while true do
                if autoKnife then
                    task.wait(1.4)
                    pcall(function()
                        if fn11() == localPlayer then
                            local character = localPlayer.Character
                            if not (not character or not character:FindFirstChild("Knife")) then
                                local player2 = fn13()
                                if not (not player2 or not player2.Character) then
                                    local v3 = fn26
                                    character.Knife.Events.KnifeThrown:FireServer(CFrame.new(character.RightHand.Position), CFrame.new(v3(player2, shootOff + 1)))
                                end
                            end
                        end
                    end)
                    continue
                end
                break
            end
        end)
        v2 = thread
    end
    configFolder = "KITI"
    ConfigData = {}
    value = 35
    text = "Default"
    colorToConfig = function(v3)
        if typeof(v3) == "Color3" then
            return {math.floor(v3.R * 255 + 0.5), math.floor(v3.G * 255 + 0.5), math.floor(v3.B * 255 + 0.5)}
        else
            return nil
        end
    end
    colorFromConfig = function(v3, v4)
        if type(v3) == "table" then
            return Color3.fromRGB(math.clamp(tonumber(v3[1]) or 255, 0, 255), math.clamp(tonumber(v3[2]) or 105, 0, 255), math.clamp(tonumber(v3[3]) or 180, 0, 255))
        else
            return v4
        end
    end
    FavoriteEmotes = FavoriteEmotes or {}
    FavoriteAnimations = FavoriteAnimations or {}
    KITI_InterfaceLanguage = KITI_InterfaceLanguage == "Russian" and "Russian" or "English"
    favoritesFile = configFolder .. "/Favorites.json"
    copyFavoriteSet = function(list2)
        local tbl6 = {}
        if type(list2) == "table" then
            for key, value2 in pairs(list2) do
                local v3 = value2
                if type(key) == "number" and type(value2) == "string" then
                    tbl6[v3] = true
                else
                    local v4 = type(key) == "string"
                    if not v4 then
                        v3 = v4
                    end
                    if v3 then
                        tbl6[key] = true
                    end
                end
            end
        end
        return tbl6
    end
    SaveFavoriteStore = function()
        if writefile then
            local v3 = makefolder and isfolder
            if v3 then
                v3 = not isfolder(configFolder)
            end
            if v3 then
                pcall(makefolder, configFolder)
            end
            pcall(writefile, favoritesFile, HttpService:JSONEncode({Emotes = FavoriteEmotes, Animations = FavoriteAnimations, InterfaceLanguage = KITI_InterfaceLanguage}))
        end
    end
    LoadFavoriteStore = function()
        local v3 = not readfile or not isfile
        local v4
        if v3 then
            v4 = v3
        else
            v4 = not isfile(favoritesFile)
        end
        if not v4 then
            local v5, v6 = pcall(readfile, favoritesFile)
            if v5 then
                local v7, v8 = pcall(function()
                    return HttpService:JSONDecode(v6)
                end)
                if not (not v7 or type(v8) ~= "table") then
                    FavoriteEmotes = copyFavoriteSet(v8.Emotes)
                    FavoriteAnimations = copyFavoriteSet(v8.Animations)
                    if v8.InterfaceLanguage == "Russian" or v8.InterfaceLanguage == "English" then
                        KITI_InterfaceLanguage = v8.InterfaceLanguage
                    end
                end
            end
        end
    end
    LoadFavoriteStore()
    fn = function(str)
        if not writefile then
            tbl3.new({Title = "Config", Content = "Your executor doesn't support file saving!", Duration = 3})
        else
            if not str or str == "" then
                str = "default"
            end
            local v3 = str:gsub("%.json$", "")
            ConfigData = {
                ws_v = ws_v,
                fov_v = fov_v,
                flySpd = number,
                menuTransparency = value,
                themeName = text,
                meowChoice = meowChoice,
                ctrlTP = ctrlTP,
                playerESP = enabled,
                gunESP = gunESP,
                trapESP = trapESP,
                targetESP = tbl.esp,
                targetHUD = tbl.hud,
                ghostOn = tbl.ghostOn,
                hitPartOn = tbl.hitPartOn,
                hitSoundOn = tbl.hitSoundOn,
                hitSoundMode = tbl.hitSoundMode,
                autoShoot = autoShoot,
                shootOff = shootOff,
                silentAimEnabled = silentAimEnabled,
                silentShootKey = silentShootKey,
                forceShotEnabled = forceShotEnabled,
                Offset = offset,
                autoGetGun = autoGetGun,
                gunPickupMethod = gunPickupMethod,
                offDamageWater = offDamageWater,
                antiflingOn = antiflingOn,
                spinSpeed = spinSpeed,
                soundsEnabled = soundsEnabled,
                selectedEnableSound = selectedEnableSound,
                selectedDisableSound = selectedDisableSound,
                selectedGunKill = selectedGunKill,
                selectedGunshot = selectedGunshot,
                selectedKnifeKill = selectedKnifeKill,
                shutupReload = shutupReload,
                customGunModelEnabled = customGunModelEnabled,
                selectedGunModelName = selectedGunModelName,
                trailsEnabled = trailsEnabled,
                trailStyle = trailStyle,
                magicAuraEnabled = magicAuraEnabled,
                rtxEnabled = rtxEnabled,
                timeLockEnabled = timeLockEnabled,
                timeLockVal = timeLockVal,
                timeLockMode = timeLockMode,
                weatherEnabled = weatherEnabled,
                weatherType = weatherType,
                aspectRatioOn = aspectRatioOn,
                aspectRatioScale = aspectRatioScale,
                flyOn = flyOn,
                noclipOn = noclipOn,
                blinkOn = blinkOn,
                blinkSpeed = blinkSpeed,
                spinOn = spinOn,
                jerkOn = jerkOn,
                walkFlingOn = walkFlingOn,
                antiAimOn = antiAimOn,
                antiCoinOn = antiCoinOn,
                boxEspEnabled = boxEspEnabled,
                friendOn = friendOn,
                autoKnife = autoKnife,
                killAuraOn = killAuraOn,
                pendingAura = pendingAura,
                voteDupeEnabled = voteDupeEnabled,
                voteMapName = voteMapName,
                beamType = tbl2.BeamType,
                beamColor = {math.floor(tbl2.BeamColor.R * 255), math.floor(tbl2.BeamColor.G * 255), math.floor(tbl2.BeamColor.B * 255)},
                kb = (function()
                    local tbl6 = {}
                    for key, value2 in pairs(tbl.kb) do
                        tbl6[key] = value2.key
                    end
                    return tbl6
                end)(),
                screenBtns = (function()
                    local tbl6 = {}
                    for key, _ in pairs(tbl.screenBtns) do
                        tbl6[key] = true
                    end
                    return tbl6
                end)(),
                screenBtnsPos = (function()
                    local tbl6 = {}
                    for key, screenBtnsPo in pairs(tbl.screenBtnsPos) do
                        tbl6[key] = {screenBtnsPo.X.Scale, screenBtnsPo.X.Offset, screenBtnsPo.Y.Scale, screenBtnsPo.Y.Offset}
                    end
                    return tbl6
                end)(),
                LastEmoteAction = LastEmoteAction,
                FavoriteEmotes = FavoriteEmotes,
                FavoriteAnimations = FavoriteAnimations,
                InterfaceLanguage = KITI_InterfaceLanguage,
                SkyboxSettings = {enabled = KITI_SkyboxEnabled == true, id = KITI_SkyboxId, name = KITI_SkyboxName},
                ChinaHatSettings = (function()
                    local chinaHatSettings = getgenv().ChinaHatSettings or {}
                    local hatRainbow = tbl.kbOptionUI and tbl.kbOptionUI.ChinaHatColor
                    local tbl6 = {enabled = chinaHatSettings.enabled == true, hatColor = colorToConfig(chinaHatSettings.hatColor)}
                    if hatRainbow then
                        hatRainbow = hatRainbow.IsRainbow == true
                    end
                    if not hatRainbow then
                        hatRainbow = false
                    end
                    tbl6.hatRainbow = hatRainbow
                    return tbl6
                end)(),
                JumpCircleSettings = (function()
                    local jumpCircleSettings = getgenv().JumpCircleSettings or {}
                    local rainbow = tbl.kbOptionUI and tbl.kbOptionUI.JumpCircleColor
                    local tbl6 = {enabled = jumpCircleSettings.enabled == true, color = colorToConfig(jumpCircleSettings.color)}
                    if rainbow then
                        rainbow = rainbow.IsRainbow == true
                    end
                    if not rainbow then
                        rainbow = false
                    end
                    tbl6.rainbow = rainbow
                    return tbl6
                end)(),
            }
            local text2 = configFolder .. "/" .. v3 .. ".json"
            local v4 = makefolder and isfolder
            if v4 then
                v4 = not isfolder(configFolder)
            end
            if v4 then
                pcall(makefolder, configFolder)
            end
            local v5, v6 = pcall(function()
                return HttpService:JSONEncode(ConfigData)
            end)
            if not v5 then
                tbl3.new({Title = "Config", Content = "Failed to save config!", Duration = 3})
            else
                local v7 = pcall(writefile, text2, v6)
                if not v7 and makefolder then
                    pcall(makefolder, configFolder)
                    v7 = pcall(writefile, text2, v6)
                end
                if v7 then
                    tbl3.new({Title = "Config", Content = "Saved config: " .. v3, Duration = 2})
                else
                    tbl3.new({Title = "Config", Content = "Failed to save config!", Duration = 3})
                end
            end
        end
    end
    local function disableSounds()
        local v3 = soundsEnabled
        local new = tbl3.new
        soundsEnabled = false
        function tbl3.new()
        end
        local function fn76(v4, v5)
            if not (not v4 or v5 == nil) then
                if v4.SetValue then
                    pcall(v4.SetValue, v4, v5)
                elseif v4.setValue then
                    pcall(v4.setValue, v4, v5)
                end
            end
        end
        local function fn77(v4, v5)
            if not (not v4 or not v5) then
                if v4.SetValue then
                    pcall(v4.SetValue, v4, v5)
                elseif v4.setValue then
                    pcall(v4.setValue, v4, v5)
                end
            end
        end
        local function fn78(v4, v5)
            if not (not v4 or v5 == nil) then
                if v4.SetValue then
                    pcall(v4.SetValue, v4, v5)
                elseif v4.setValue then
                    pcall(v4.setValue, v4, v5)
                elseif v4.Set then
                    pcall(v4.Set, v4, tonumber(v5) or v5)
                end
            end
        end
        fn78(uiRefs.FlySpeed, tostring(number))
        fn78(uiRefs.MenuTransparency, value)
        fn77(uiRefs.Theme, text)
        local v4 = meowChoice
        fn77(uiRefs.Meow, v4)
        fn76(uiRefs.OPFly, flyOn)
        fn76(uiRefs.Noclip, noclipOn)
        fn76(uiRefs.Blink, blinkOn)
        fn76(uiRefs.CtrlTP, ctrlTP)
        fn76(uiRefs.AntiFling, antiflingOn)
        fn76(uiRefs.PlayersESP, enabled)
        fn76(uiRefs.GunESP, gunESP)
        fn76(uiRefs.TrapsESP, trapESP)
        fn76(uiRefs.TargetESP, tbl.esp)
        fn76(uiRefs.TargetHUD, tbl.hud)
        fn76(uiRefs.ClientGhost, tbl.ghostOn)
        fn76(uiRefs.HitParticles, tbl.hitPartOn)
        fn76(uiRefs.HitSound, tbl.hitSoundOn)
        fn76(uiRefs.AutoShoot, autoShoot)
        fn76(uiRefs.SilentAim, silentAimEnabled)
        fn76(uiRefs.ForceShoot, forceShotEnabled)
        fn76(uiRefs.AutoGetGun, autoGetGun)
        fn77(uiRefs.GunPickupMethod, gunPickupMethod)
        local v5 = offDamageWater
        fn76(uiRefs.OffDamageWater, v5)
        fn76(uiRefs.AutoKnife, autoKnife)
        local v6 = killAuraOn
        fn76(uiRefs.KillAura, v6)
        fn76(uiRefs.CustomModel, customGunModelEnabled)
        local v7 = trailsEnabled
        fn76(uiRefs.Trails, v7)
        local v8 = magicAuraEnabled
        fn76(uiRefs.MagicAura, v8)
        local v9 = rtxEnabled
        fn76(uiRefs.RTX, v9)
        local v10 = timeLockMode
        fn77(uiRefs.TimeLock, v10)
        fn76(uiRefs.Friend, friendOn)
        fn76(uiRefs.AspectRatio, aspectRatioOn)
        fn76(uiRefs.Spin, spinOn)
        fn76(uiRefs.Jerk, jerkOn)
        fn76(uiRefs.WalkFling, walkFlingOn)
        fn76(uiRefs.AntiAim, antiAimOn)
        fn76(uiRefs.AntiCoin, antiCoinOn)
        local v11 = boxEspEnabled
        fn76(uiRefs.BoxEsp, v11)
        local v12 = shutupReload
        fn76(uiRefs.ShutupReload, v12)
        fn76(uiRefs.VoteDuper, voteDupeEnabled)
        fn76(uiRefs.ChinaHat, (getgenv().ChinaHatSettings or {}).enabled)
        fn76(uiRefs.JumpCircle, (getgenv().JumpCircleSettings or {}).enabled)
        soundsEnabled = v3
        local v13 = soundsEnabled
        fn76(uiRefs.SoundsEnabled, v13)
        fn77(uiRefs.GunModelDropdown, selectedGunModelName)
        local v14 = trailStyle
        fn77(uiRefs.TrailStyle, v14)
        local v15 = selectedEnableSound
        fn77(uiRefs.EnableSound, v15)
        local v16 = selectedDisableSound
        fn77(uiRefs.DisableSound, v16)
        local v17 = selectedGunKill
        fn77(uiRefs.GunKill, v17)
        local v18 = selectedGunshot
        fn77(uiRefs.Gunshot, v18)
        local v19 = selectedKnifeKill
        fn77(uiRefs.KnifeKill, v19)
        fn77(uiRefs.HitSoundMode, tostring(tbl.hitSoundMode or 1))
        if uiRefs.VoteMapName and uiRefs.VoteMapName.SetValue then
            local text2 = voteMapName or ""
            uiRefs.VoteMapName:SetValue(text2)
        end
        fn77(uiRefs.BeamType, tbl2.BeamType)
        pcall(function()
            if uiRefs.BeamColor then
                if uiRefs.BeamColor.SetValue then
                    uiRefs.BeamColor:SetValue(tbl2.BeamColor)
                elseif uiRefs.BeamColor.setValue then
                    uiRefs.BeamColor:setValue(tbl2.BeamColor)
                end
            end
        end)
        tbl3.new = new
    end
    fn2 = function(str)
        if not readfile then
            tbl3.new({Title = "Config", Content = "Your executor doesn't support reading files!", Duration = 3})
        else
            if not str or str == "" then
                str = "default"
            end
            local v3 = str:gsub("%.json$", "")
            local text2 = configFolder .. "/" .. v3 .. ".json"
            tbl3.new({Title = "Config", Content = "Loading: " .. v3 .. "...", Duration = 3})
            local v4, v5 = pcall(readfile, text2)
            local v6 = v5
            if not v4 or not v6 or v6 == "" then
                tbl3.new({Title = "Config", Content = "Config file not found!", Duration = 3})
            else
                local v7, v8 = pcall(function()
                    return HttpService:JSONDecode(v6)
                end)
                local v9 = v8
                if v7 then
                    v7 = v9
                end
                if v7 then
                    ConfigData = v9
                    if v9.FavoriteEmotes ~= nil then
                        FavoriteEmotes = copyFavoriteSet(v9.FavoriteEmotes)
                    end
                    if v9.FavoriteAnimations ~= nil then
                        FavoriteAnimations = copyFavoriteSet(v9.FavoriteAnimations)
                    end
                    if v9.InterfaceLanguage == "Russian" or v9.InterfaceLanguage == "English" then
                        KITI_InterfaceLanguage = v9.InterfaceLanguage
                        if uiRefs and uiRefs.Language and uiRefs.Language.SetValue then
                            local v10 = KITI_InterfaceLanguage
                            pcall(uiRefs.Language.SetValue, uiRefs.Language, v10)
                        else
                            local applyLanguage = tbl
                            if tbl then
                                applyLanguage = tbl.ApplyLanguage
                            end
                            if applyLanguage then
                                local v10 = KITI_InterfaceLanguage
                                tbl.ApplyLanguage(v10)
                            end
                        end
                    end
                    if type(v9.SkyboxSettings) == "table" then
                        if v9.SkyboxSettings.enabled == true and v9.SkyboxSettings.id then
                            KITI_SkyboxEnabled = true
                            KITI_SkyboxId = tonumber(v9.SkyboxSettings.id) or v9.SkyboxSettings.id
                            KITI_SkyboxName = v9.SkyboxSettings.name or "Skybox"
                            task.defer(function()
                                fn57(KITI_SkyboxId, KITI_SkyboxName)
                            end)
                        elseif v9.SkyboxSettings.enabled == false then
                            disableKITI_Skybox()
                        end
                    end
                    local chinaHatSettings = getgenv().ChinaHatSettings or {}
                    if type(v9.ChinaHatSettings) == "table" then
                        chinaHatSettings.enabled = v9.ChinaHatSettings.enabled == true
                        chinaHatSettings.hatColor = colorFromConfig(v9.ChinaHatSettings.hatColor, chinaHatSettings.hatColor or Color3.fromRGB(255, 105, 180))
                    end
                    getgenv().ChinaHatSettings = chinaHatSettings
                    local jumpCircleSettings = getgenv().JumpCircleSettings or {}
                    if type(v9.JumpCircleSettings) == "table" then
                        jumpCircleSettings.enabled = v9.JumpCircleSettings.enabled == true
                        jumpCircleSettings.color = colorFromConfig(v9.JumpCircleSettings.color, jumpCircleSettings.color or Color3.fromRGB(255, 105, 180))
                    end
                    getgenv().JumpCircleSettings = jumpCircleSettings
                    SaveFavoriteStore()
                    if refreshFavoriteViews then
                        refreshFavoriteViews()
                    end
                    if v9.ws_v ~= nil then
                        ws_v = v9.ws_v
                    end
                    if v9.fov_v ~= nil then
                        fov_v = v9.fov_v
                    end
                    if v9.flySpd ~= nil then
                        number = tonumber(v9.flySpd) or 50
                    end
                    if v9.menuTransparency ~= nil then
                        value = math.clamp(tonumber(v9.menuTransparency) or 0, 0, 80)
                    end
                    local v10 = v9.themeName ~= nil
                    if v10 then
                        v10 = connection.Themes[tostring(v9.themeName)]
                    end
                    if v10 then
                        text = tostring(v9.themeName)
                        connection:ApplyTheme(text)
                    end
                    if v9.meowChoice == "Mimi" or v9.meowChoice == "Furry" or v9.meowChoice == "Koti" or v9.meowChoice == "Protogen Bongo" then
                        meowChoice = v9.meowChoice
                    else
                        meowChoice = "None"
                    end
                    if v9.ctrlTP ~= nil then
                        ctrlTP = v9.ctrlTP
                    end
                    if v9.playerESP ~= nil then
                        enabled = v9.playerESP
                        if not enabled then
                            fn28()
                        end
                    end
                    if v9.gunESP ~= nil then
                        gunESP = v9.gunESP
                    end
                    if v9.trapESP ~= nil then
                        trapESP = v9.trapESP
                    end
                    if v9.targetESP ~= nil then
                        tbl.esp = v9.targetESP
                    end
                    if v9.targetHUD ~= nil then
                        tbl.hud = v9.targetHUD
                    end
                    if v9.ghostOn ~= nil then
                        tbl.ghostOn = v9.ghostOn
                    end
                    if v9.hitPartOn ~= nil then
                        tbl.hitPartOn = v9.hitPartOn
                    end
                    if v9.hitSoundOn ~= nil then
                        tbl.hitSoundOn = v9.hitSoundOn
                    end
                    if v9.hitSoundMode ~= nil then
                        tbl.hitSoundMode = v9.hitSoundMode
                    end
                    if v9.autoShoot ~= nil then
                        autoShoot = v9.autoShoot
                    end
                    if v9.shootOff ~= nil then
                        shootOff = v9.shootOff
                    end
                    if v9.silentAimEnabled ~= nil then
                        silentAimEnabled = v9.silentAimEnabled
                    end
                    if v9.silentShootKey ~= nil then
                        silentShootKey = v9.silentShootKey
                    end
                    if v9.forceShotEnabled ~= nil then
                        forceShotEnabled = v9.forceShotEnabled
                        if forceShotEnabled then
                            fn32()
                        else
                            fsForceStop()
                        end
                    end
                    if v9.Offset ~= nil then
                        offset = v9.Offset
                    end
                    if v9.autoGetGun ~= nil then
                        autoGetGun = v9.autoGetGun
                    end
                    if v9.gunPickupMethod ~= nil then
                        gunPickupMethod = v9.gunPickupMethod
                    end
                    if v9.offDamageWater ~= nil then
                        offDamageWater = v9.offDamageWater
                        if offDamageWater then
                            fn55()
                        else
                            fn56()
                        end
                    end
                    if v9.antiflingOn ~= nil then
                        antiflingOn = v9.antiflingOn
                        if antiflingOn then
                            fn36()
                        else
                            fn37()
                        end
                    end
                    if v9.spinSpeed ~= nil then
                        spinSpeed = v9.spinSpeed
                    end
                    if v9.soundsEnabled ~= nil then
                        soundsEnabled = v9.soundsEnabled
                    end
                    if v9.selectedEnableSound ~= nil then
                        selectedEnableSound = v9.selectedEnableSound
                    end
                    if v9.selectedDisableSound ~= nil then
                        selectedDisableSound = v9.selectedDisableSound
                    end
                    if v9.selectedGunKill ~= nil then
                        selectedGunKill = v9.selectedGunKill
                    end
                    if v9.selectedGunshot ~= nil then
                        selectedGunshot = v9.selectedGunshot
                    end
                    if v9.selectedKnifeKill ~= nil then
                        selectedKnifeKill = v9.selectedKnifeKill
                    end
                    if v9.shutupReload ~= nil then
                        shutupReload = v9.shutupReload
                    end
                    if v9.customGunModelEnabled ~= nil then
                        customGunModelEnabled = v9.customGunModelEnabled
                    end
                    if v9.selectedGunModelName ~= nil then
                        selectedGunModelName = v9.selectedGunModelName
                    end
                    if v9.trailsEnabled ~= nil then
                        trailsEnabled = v9.trailsEnabled
                    end
                    if v9.trailStyle ~= nil then
                        trailStyle = v9.trailStyle
                    end
                    if v9.magicAuraEnabled ~= nil then
                        magicAuraEnabled = v9.magicAuraEnabled
                    end
                    if v9.rtxEnabled ~= nil then
                        rtxEnabled = v9.rtxEnabled
                        if rtxEnabled then
                            fn58()
                        else
                            fn59()
                        end
                    end
                    if v9.timeLockEnabled ~= nil then
                        timeLockEnabled = v9.timeLockEnabled
                    end
                    if v9.timeLockVal ~= nil then
                        timeLockVal = tonumber(v9.timeLockVal) or 14
                    end
                    if type(v9.timeLockMode) == "string" and (timeLockModes[v9.timeLockMode] ~= nil or v9.timeLockMode == "Off" or v9.timeLockMode == "Custom") then
                        timeLockMode = v9.timeLockMode
                    elseif timeLockEnabled then
                        timeLockMode = "Custom"
                    else
                        timeLockMode = "Off"
                    end
                    timeLockEnabled = timeLockMode ~= "Off"
                    if v9.weatherEnabled ~= nil then
                        weatherEnabled = v9.weatherEnabled
                        fn63()
                    end
                    if v9.weatherType ~= nil then
                        weatherType = v9.weatherType
                        fn63()
                    end
                    if v9.aspectRatioOn ~= nil then
                        aspectRatioOn = v9.aspectRatioOn
                        if aspectRatioOn then
                            enableAspectRatio()
                        else
                            disableAspectRatio()
                        end
                    end
                    if v9.aspectRatioScale ~= nil then
                        aspectRatioScale = v9.aspectRatioScale
                    end
                    if v9.flyOn ~= nil then
                        flyOn = v9.flyOn
                    end
                    if v9.noclipOn ~= nil then
                        noclipOn = v9.noclipOn
                    end
                    if v9.blinkOn ~= nil then
                        blinkOn = v9.blinkOn
                    end
                    if v9.blinkSpeed ~= nil then
                        blinkSpeed = v9.blinkSpeed
                    end
                    if v9.spinOn ~= nil then
                        spinOn = v9.spinOn
                    end
                    if v9.jerkOn ~= nil then
                        jerkOn = v9.jerkOn
                    end
                    if v9.walkFlingOn ~= nil then
                        walkFlingOn = v9.walkFlingOn
                    end
                    if v9.antiAimOn ~= nil then
                        antiAimOn = v9.antiAimOn
                    end
                    if v9.antiCoinOn ~= nil then
                        antiCoinOn = v9.antiCoinOn
                        if antiCoinOn then
                            enableAntiCoin()
                        else
                            disableAntiCoin()
                        end
                    end
                    if v9.boxEspEnabled ~= nil then
                        boxEspEnabled = v9.boxEspEnabled
                    end
                    if v9.friendOn ~= nil then
                        friendOn = v9.friendOn
                    end
                    if v9.autoKnife ~= nil then
                        autoKnife = v9.autoKnife
                    end
                    if v9.killAuraOn ~= nil then
                        killAuraOn = v9.killAuraOn
                        if killAuraOn then
                            enableKillAura()
                        else
                            disableKillAura()
                        end
                    end
                    if v9.voteMapName ~= nil then
                        voteMapName = tostring(v9.voteMapName)
                    end
                    if v9.voteDupeEnabled ~= nil then
                        voteDupeEnabled = v9.voteDupeEnabled
                        if voteDupeEnabled then
                            fn23()
                        end
                    end
                    if v9.beamType ~= nil then
                        tbl2.BeamType = v9.beamType
                    end
                    if v9.beamColor ~= nil and type(v9.beamColor) == "table" then
                        pcall(function()
                            tbl2.BeamColor = Color3.fromRGB(math.clamp(v9.beamColor[1] or 0, 0, 255), math.clamp(v9.beamColor[2] or 240, 0, 255), math.clamp(v9.beamColor[3] or 255, 0, 255))
                        end)
                    end
                    if v9.pendingAura and v9.pendingAura.assetId then
                        pendingAura = v9.pendingAura
                        task.spawn(function()
                            task.wait(0.5)
                            if localPlayer.Character then
                                fn17()
                                fn18(pendingAura.assetId, pendingAura.name)
                            end
                        end)
                    end
                    if v9.kb and type(v9.kb) == "table" then
                        for key, value2 in pairs(v9.kb) do
                            local key2 = value2
                            if tbl.kb[key] and key2 then
                                tbl.kb[key].key = key2
                                pcall(function()
                                    local kbUI = tbl.kbUI and tbl.kbUI[key]
                                    if kbUI then
                                        if kbUI.SetValue then
                                            kbUI:SetValue(key2)
                                        elseif kbUI.setValue then
                                            kbUI:setValue(key2)
                                        end
                                    end
                                end)
                            end
                        end
                    end
                    if v9.screenBtnsPos and type(v9.screenBtnsPos) == "table" then
                        for key, screenBtnsPo in pairs(v9.screenBtnsPos) do
                            local v11 = screenBtnsPo
                            if type(screenBtnsPo) == "table" then
                                tbl.screenBtnsPos[key] = UDim2.new(v11[1] or 0, v11[2] or 0, v11[3] or 0, v11[4] or 0)
                            end
                        end
                    end
                    if v9.screenBtns and type(v9.screenBtns) == "table" then
                        for key, _ in pairs(v9.screenBtns) do
                            if tbl.kb[key] and not tbl.screenBtns[key] then
                                pcall(function()
                                    tbl.toggleScreenBtn(key)
                                end)
                            end
                        end
                    end
                    pcall(function()
                        if v9.flyOn then
                            fn34()
                        end
                        if v9.noclipOn then
                            fn35(true)
                        end
                        if v9.blinkOn then
                            local character = localPlayer.Character
                            local humanoidRootPart
                            if character then
                                humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                            else
                                humanoidRootPart = character
                            end
                            if humanoidRootPart then
                                character.HumanoidRootPart.Anchored = true
                            end
                        end
                        if v9.spinOn then
                            fn6()
                        end
                        if v9.jerkOn then
                            fn10()
                        end
                        if v9.walkFlingOn then
                            fn8()
                        end
                        if v9.antiAimOn then
                            enableAntiAim()
                        end
                        if v9.autoKnife then
                            enableAutoKnife()
                        end
                        if v9.friendOn then
                            fn4()
                        end
                    end)
                    if v9.LastEmoteAction and type(v9.LastEmoteAction) == "table" and v9.LastEmoteAction.Name then
                        LastEmoteAction = v9.LastEmoteAction
                        task.spawn(function()
                            task.wait(0.6)
                            local item = LastEmoteAction
                            if not (not item or not item.Name) then
                                if item.Type == "Anim" then
                                    local v11 = Animations and Animations[item.Name]
                                    if v11 then
                                        PlayAnimationBody(v11.Idle, v11.Idle2, v11.Idle3, v11.Walk, v11.Run, v11.Jump, v11.Climb, v11.Fall, v11.Swim, v11.SwimIdle, v11.Weight, v11.Weight2)
                                        RefreshAnims()
                                    end
                                elseif item.Type == "Emote" then
                                    PlayEmote(item.Name)
                                end
                            end
                        end)
                    end
                    pcall(function()
                        local chinaHatSettings2 = v9.ChinaHatSettings
                        local chinaHatColor = tbl.kbOptionUI and tbl.kbOptionUI.ChinaHatColor
                        if chinaHatColor and chinaHatSettings2 then
                            chinaHatColor:Set(colorFromConfig(chinaHatSettings2.hatColor, (getgenv().ChinaHatSettings or {}).hatColor))
                            if chinaHatColor.SetRainbow then
                                chinaHatColor:SetRainbow(chinaHatSettings2.hatRainbow == true)
                            end
                        end
                        local jumpCircleSettings2 = v9.JumpCircleSettings
                        local jumpCircleColor = tbl.kbOptionUI and tbl.kbOptionUI.JumpCircleColor
                        if jumpCircleColor and jumpCircleSettings2 then
                            jumpCircleColor:Set(colorFromConfig(jumpCircleSettings2.color, (getgenv().JumpCircleSettings or {}).color))
                            if jumpCircleColor.SetRainbow then
                                jumpCircleColor:SetRainbow(jumpCircleSettings2.rainbow == true)
                            end
                        end
                    end)
                    fn16()
                    disableSounds()
                    tbl3.new({Title = "Config", Content = "Loaded config: " .. v3, Duration = 2})
                else
                    tbl3.new({Title = "Config", Content = "Corrupted config file!", Duration = 3})
                end
            end
        end
    end
end
local v2 = nil
local function fn60(v3)
    local v4 = v2
    if v2 then
        v4 = not v3
    end
    if v4 then
        return v2
    else
        local list2 = {}
        if listfiles then
            local v5, v6 = pcall(listfiles, configFolder)
            local list3 = v6
            if v5 then
                v5 = type(list3) == "table"
            end
            if v5 then
                for _, value2 in ipairs(list3) do
                    local v7 = value2:match("([^/\\]+)%.json$")
                    if v7 and readfile then
                        local v8, list4 = pcall(readfile, value2)
                        if v8 then
                            v8 = list4
                        end
                        if v8 then
                            v8 = #list4 > 0
                        end
                        if v8 then
                            local v9, v10 = pcall(function()
                                return HttpService:JSONDecode(list4)
                            end)
                            if v9 then
                                v9 = type(v10) == "table"
                            end
                            if v9 then
                                v9 = v10.ws_v ~= nil
                            end
                            if v9 then
                                table.insert(list2, v7)
                            end
                        end
                    end
                end
            end
        end
        if #list2 == 0 then
            table.insert(list2, "default")
        end
        v2 = list2
        return list2
    end
end
local list2 = {
    ["Around Town"] = 3576747102,
    ["TWICE TAKEDOWN DANCE 2"] = 85623000473425,
    Fashionable = 3576745472,
    Swish = 3821527813,
    ["Top Rock"] = 3570535774,
    ["Fancy Feet"] = 3934988903,
    Idol = 4102317848,
    Sneaky = 3576754235,
    ["Elton John - Piano Jump"] = 11453096488,
    ["Cartwheel - George Ezra"] = 10370929905,
    ["Super Charge"] = 10478368365,
    ["Rise Above - The Chainsmokers"] = 13071993910,
    ["Elton John - Elevate"] = 11394056822,
    ["Sturdy Dance - Ice Spice"] = 17746270218,
    ["YUNGBLUD – HIGH KICK"] = 14022978026,
    Robot = 3576721660,
    Louder = 3576751796,
    Twirl = 3716633898,
    Bodybuilder = 3994130516,
    ["NBA Monster Dunk"] = 117511481049460,
    Jacks = 3570649048,
    Shuffle = 4391208058,
    ["Elton John - Still Standing"] = 11435177473,
    ["Elton John - Cat Man"] = 11435175895,
    ["Shrek Roar"] = 18524331128,
    ["Dorky Dance"] = 4212499637,
    ["HOLIDAY Dance - Lil Nas X (LNX)"] = 5938396308,
    ["Old Town Road Dance - Lil Nas X (LNX)"] = 5938394742,
    ["Panini Dance - Lil Nas X (LNX)"] = 5915781665,
    ["Rodeo Dance - Lil Nas X (LNX)"] = 5938397555,
    ["Drum Master - Royal Blood"] = 6531538868,
    ["It Ain't My Fault - Zara Larsson"] = 6797948622,
    ["Flex Walk"] = 15506506103,
    Dizzy = 3934986896,
    ["Uprise - Tommy Hilfiger"] = 10275057230,
    ["Tommy - Archer"] = 13823339506,
    ["Mean Mug - Tommy Hilfiger"] = 10214415687,
    ["Rock Star - Royal Blood"] = 6533100850,
    ["Floor Rock Freeze - Tommy Hilfiger"] = 10214411646,
    ["Saturday Dance - Twenty One Pilots"] = 7422833723,
    ["V Pose - Tommy Hilfiger"] = 10214418283,
    ["Boxing Punch - KSI"] = 7202896732,
    ["Drum Solo - Royal Blood"] = 6532844183,
    ["Frosty Flair - Tommy Hilfiger"] = 10214406616,
    ["Hips Poppin' - Zara Larsson"] = 6797919579,
    ["Drummer Moves - Twenty One Pilots"] = 7422838770,
    ["On The Outside - Twenty One Pilots"] = 7422841700,
    ["Thanos Happy Jump - Squid Game"] = 82217023310738,
    ["Block Partier"] = 6865011755,
    ["Up and Down - Twenty One Pilots"] = 7422843994,
    ["Ay-Yo Dance Move - NCT 127"] = 12804173616,
    ["Young-hee Head Spin - Squid Game"] = 134615135651900,
    T = 3576719440,
    ["Air Dance"] = 4646302011,
    ["TMNT Dance"] = 18665886405,
    ["Take Me Under - Zara Larsson"] = 6797938823,
    ["Sticker Dance Move - NCT 127"] = 12259885838,
    ["Line Dance"] = 4049646104,
    ["NBA WNBA Fadeaway"] = 18526373545,
    ["SpongeBob Imaginaaation 🌈"] = 18443268949,
    ["Chill Vibes - George Ezra"] = 10370918044,
    ["Wake Up Call - KSI"] = 7202900159,
    ["Kick It Dance Move - NCT 127"] = 12259888240,
    ["The Weeknd Starboy Strut"] = 130245358716273,
    ["2 Baddies Dance Move - NCT 127"] = 12259890638,
    ["Rock Guitar - Royal Blood"] = 6532155086,
    ["Show Dem Wrists - KSI"] = 7202898984,
    ["Dancin' Shoes - Twenty One Pilots"] = 7405123844,
    ["Arm Twist"] = 9710992846,
    ["AOK - Tai Verdes"] = 7942960760,
    ["M3GAN's Dance"] = 127271798262177,
    ["High Hands"] = 9710994651,
    ["Cobra Arms - Tai Verdes"] = 7942964447,
    ["Lasso Turn - Tai Verdes"] = 7942972744,
    ["Beauty Touchdown"] = 16303091119,
    ["Sidekicks - George Ezra"] = 10370922566,
    ["Boom Boom Clap - George Ezra"] = 10370934040,
    ["DearALICE - Ariana"] = 133765015173412,
    ["Chappell Roan HOT TO GO!"] = 79312439851071,
    ["Bone Chillin' Bop"] = 15123050663,
    ["Power Blast"] = 4849497510,
    ["Flowing Breeze"] = 7466047578,
    ["Swan Dance"] = 7466048475,
    ["Quiet Waves"] = 7466046574,
    ["Rolling Stones Guitar Strum"] = 18148839527,
    ["Break Dance"] = 5915773992,
    ["KATSEYE - Touch"] = 139021427684680,
    Zombie = 4212496830,
    ["Olivia Rodrigo Head Bop"] = 15554010118,
    ["Rasputin – Boney M."] = 133477296392756,
    ["Tommy K-Pop Mic Drop"] = 14024722653,
    ["TWICE Feel Special"] = 14900153406,
    ["Olivia Rodrigo good 4 u"] = 15554013003,
    ["Olivia Rodrigo Fall Back to Float"] = 15554016057,
    ["Air Guitar"] = 15506499986,
    ["Fashion Klossette - Runway my way"] = 126683684984862,
    ["Elton John - Heart Skip"] = 11309263077,
    ["Baby Dance"] = 4272484885,
    ["Cha Cha"] = 6865013133,
    ["Dolphin Dance"] = 5938365243,
    ["Elton John - Rock Out"] = 11753545334,
    ["ALTÉGO - Couldn’t Care Less"] = 92859581691366,
    ["Fashion Roadkill"] = 73683655527605,
    ["Paris Hilton Sanasa"] = 16126526506,
    ["TWICE I GOT YOU part 1"] = 16215060261,
    ["The Zabb"] = 71389516735424,
    Y = 4391211308,
    ["Wanna play?"] = 16646438742,
    ["TWICE I GOT YOU part 2"] = 16256253954,
    ["Nicki Minaj Starships"] = 15571540519,
    ["Mean Girls Dance Break"] = 15963348695,
    ["TWICE Takedown"] = 94796833553521,
    Samba = 6869813008,
    ["Rock Out - Bebe Rexha"] = 18225077553,
    ["TWICE LIKEY"] = 14900151704,
    ["Sol de Janeiro - Samba"] = 16276506814,
    ["The Weeknd Opening Night"] = 105098895743105,
    ["Paris Hilton - Sliving For The Groove"] = 15392927897,
    ["Paris Hilton - Checking My Angles"] = 15392937495,
    ["Nicki Minaj Boom Boom Boom"] = 15571538346,
    ["Stray Kids Walkin On Water"] = 100773414188482,
    ["Team USA Breaking Emote"] = 18526338976,
    ["Side to Side"] = 3762641826,
    ["Skibidi Toilet - Titan Speakerman Laser Spin"] = 103102322875221,
    ["Paris Hilton - Iconic IT-Grrrl"] = 15392932768,
    ["Dave's Spin Move - Glass Animals"] = 16276501655,
    ["HUGO Let's Drive!"] = 17360720445,
    ["Fast Hands"] = 4272351660,
    Tree = 4049634387,
    Godlike = 3823158750,
    ["Keeping Time"] = 4646306072,
    ["Elton John - Heart Shuffle"] = 17748346932,
    Tantrum = 5104374556,
    ["Rock On"] = 5915782672,
    ["Hero Landing"] = 5104377791,
    Fishing = 3994129128,
    ["Floss Dance"] = 5917570207,
    ["Get Out"] = 3934984583,
    ["Victory Dance"] = 15506503658,
    ["d4vd - Backflip"] = 15694504637,
    Monkey = 3716636630,
    ["Imagine Dragons - “Bones” Dance"] = 15689314578,
    Greatest = 3762654854,
    ["Jawny - Stomp"] = 16392120020,
    ["Jumping Wave"] = 4940602656,
    ["HIPMOTION - Amaarae"] = 16572756230,
    Haha = 4102315500,
    Agree = 4849487550,
    ["Mae Stephens - Piano Hands"] = 16553249658,
    ["Mini Kong"] = 17000058939,
    ["Mae Stephens – Arm Wave"] = 16584496781,
    ["Festive Dance"] = 15679955281,
    ["Jumping Cheer"] = 5895009708,
    Sleep = 4689362868,
    ["ericdoa - dance"] = 15698510244,
    Disagree = 4849495710,
    Happy = 4849499887,
    Bored = 5230661597,
    ["High Wave"] = 5915776835,
    ["Alo Yoga Pose - Warrior II"] = 12507106431,
    Cower = 4940597758,
    ["Wisp - air guitar"] = 17370797454,
    ["Alo Yoga Pose - Triangle"] = 12507120275,
    ["Cuco - Levitate"] = 15698511500,
    ["Rock n Roll"] = 15506496093,
    Shy = 3576717965,
    ["Alo Yoga Pose - Lotus Position"] = 12507097350,
    Curtsy = 4646306583,
    Celebrate = 3994127840,
    ["Yungblud Happier Jump"] = 15610015346,
    ["Baby Queen - Face Frame"] = 14353421343,
    Confused = 4940592718,
    Beckon = 5230615437,
    ["Secret Handshake Dance"] = 120642514156293,
    ["Baby Queen - Air Guitar & Knee Slide"] = 14353417553,
    ["Baby Queen - Bouncy Twirl"] = 14353423348,
    ["Baby Queen - Strut"] = 14353425085,
    ["Baby Queen - Dramatic Bow"] = 14353419229,
    Sad = 4849502101,
    ["Robot M3GAN"] = 90569436057900,
    ["Nicki Minaj Anaconda"] = 15571539403,
    ["Cha-Cha"] = 3696764866,
    ["BURBERRY LOLA ATTITUDE - BLOOM"] = 10147919199,
    ["Skadoosh Emote - Kung Fu Panda 4"] = 16371235025,
    ["Chicken Dance"] = 4849493309,
    ["BLACKPINK Don't know what to do"] = 18855609889,
    ["Man City Scorpion Kick"] = 13694139364,
    ["Gashina - SUNMI"] = 9528294735,
    ["Fashion Spin"] = 130046968468383,
    ["Country Line Dance - Lil Nas X (LNX)"] = 5915780563,
    ["Sandwich Dance"] = 4390121879,
    ["BLACKPINK LISA Money"] = 15679957363,
    ["Nicki Minaj That's That Super Bass Emote"] = 15571536896,
    Salute = 3360689775,
    ["Olympic Dismount"] = 18666650035,
    ["MANIAC - Stray Kids"] = 11309309359,
    ["BLACKPINK JISOO Flower"] = 15439454888,
    ["Man City Bicycle Kick"] = 13422286833,
    ["Man City Backflip"] = 13694140956,
    ["BLACKPINK Pink Venom - Straight to Ya Dome"] = 14548711723,
    ["BLACKPINK Pink Venom - I Bring the Pain Like…"] = 14548710952,
    Stadium = 3360686498,
    ["BLACKPINK ROSÉ On The Ground"] = 15679958535,
    ["Bunny Hop"] = 4646296016,
    ["BLACKPINK Shut Down - Part 1"] = 14901369589,
    ["BLACKPINK Kill This Love"] = 16181843366,
    ["SpongeBob Dance"] = 18443271885,
    ["Borock's Rage"] = 3236848555,
    ["The Conductor - George Ezra"] = 10370926562,
    ["Swag Walk"] = 10478377385,
    ["BLACKPINK Shut Down - Part 2"] = 14901371589,
    ["BLACKPINK Ice Cream"] = 16181840356,
    ["Superhero Reveal"] = 3696759798,
    ["BLACKPINK Pink Venom - Get em Get em Get em"] = 14548709888,
    ["TWICE ABCD by Nayeon"] = 18933761755,
    ["BURBERRY LOLA ATTITUDE - NIMBUS"] = 10147924028,
    ["Ud'zal's Summoning"] = 3307604888,
    ["TWICE Pop by Nayeon"] = 13768975574,
    ["TWICE Set Me Free - Dance 1"] = 12715395038,
    ["TWICE Set Me Free - Dance 2"] = 12715397488,
    ["Hyperfast 5G Dance Move"] = 9408642191,
    ["You can't sit with us - Sunmi"] = 9983549160,
    ["Hype Dance"] = 3696757129,
    ["BLACKPINK - How You Like That"] = 16874596971,
    ["BLACKPINK - Lovesick Girls"] = 16874600526,
    ["TWICE Like Ooh-Ahh"] = 14124050904,
    ["Heisman Pose"] = 3696763549,
    ["BLACKPINK As If It's Your Last"] = 18855603653,
    ["TWICE Moonlight Sunrise"] = 12715393154,
    ["TWICE Fancy"] = 13520623514,
    Point2 = 3576823880,
    ["BURBERRY LOLA ATTITUDE - GEM"] = 10147916560,
    ["Vroom Vroom"] = 18526410572,
    ["Hwaiting (화이팅)"] = 9528291779,
    ["BLACKPINK JENNIE You and Me"] = 15439457146,
    Tilt = 3360692915,
    Applaud = 5915779043,
    ["BLACKPINK DDU-DU DDU-DU"] = 16553262614,
    ["BURBERRY LOLA ATTITUDE - HYDRO"] = 10147926081,
    ["BURBERRY LOLA ATTITUDE - REFLEX"] = 10147921916,
    ["Annyeong (안녕)"] = 9528286240,
    ["BLACKPINK Boombayah Emote"] = 16553259683,
    ["Victory - 24kGoldn"] = 9178397781,
    Hello = 3576686446,
    ["Vans Ollie"] = 18305539673,
    ["TWICE Strategy"] = 106862678450011,
    ["TWICE The Feels"] = 12874468267,
    ["TWICE What Is Love"] = 13344121112,
    Shrug = 3576968026,
    ["PARROT PARTY DANCE"] = 121067808279598,
    ["Dance n' Prance"] = 99031916674986,
    ["R15 Death (Accurate)"] = 114899970878842,
    ["Wally West"] = 133948663586698,
    ["Take The L"] = 123159156696507,
    Xaviersobased = 131763631172236,
    ["Belly Dancing"] = 131939729732240,
    ["RAT DANCE"] = 133461102795137,
    CaramellDansen = 93105950995997,
    ["Biblically Accurate"] = 133596366979822,
    Rambunctious = 134311528115559,
    Ballin = 96293409369770,
    ["Die Lit"] = 121001502815813,
    ["Nyan Nyan!"] = 73796726960568,
    ["Teto Territory"] = 114428584463004,
    Skibidi = 124828909173982,
    Chronoshift = 92600655160976,
    ["Floating on Clouds"] = 111426928948833,
    ["Jersey Joe"] = 134149640725489,
    ["Virtual Insanity"] = 83261816934732,
    ["Doodle Dance"] = 107091254142209,
    ["Subject 3"] = 83732367439808,
    ["Club Penguin"] = 98099211500155,
    Kazotsky = 97629500912487,
    ["Miku Dance"] = 117734400993750,
    ["Deltarune - Tenna Swing"] = 103139492736941,
    ["Hakari Dance"] = 80270168146449,
    ["Addendum Dance [R6]"] = 134442882516163,
    ["Gangnam Style"] = 77205409178702,
    ["Push-Up"] = 117922227854118,
    Split = 98522218962476,
    PROXIMA = 81390693780805,
    HeadBanging = 87447252507832,
    Assumptions = 127507691649322,
    Jumpstyle = 99563839802389,
    ["Flopping Fish"] = 133142324349281,
    ["Kicking Feet Sit"] = 78758922757947,
    ["Fancy Feets"] = 124512151372711,
    ["Cute Sit"] = 90244178386698,
    ["Absolute Cinema"] = 97258018304125,
    ["Bubbly Sit"] = 112758073578333,
    ["Become A Car"] = 131544122623505,
    ["Hiding Human Box"] = 124935873390035,
    ["Magical Pose"] = 135489824748823,
    Griddy = 116065653184749,
    ["Gon Rage"] = 139639173024927,
    ["Become Couch"] = 93335594132613,
    ["Spare Change"] = 126749574427431,
    Paranoid = 123407922818447,
    ["Kawaii Groove"] = 77152953688098,
    ["Ai Cat dance"] = 136593170936320,
    Smeeze = 131683926643291,
    Onion = 113890289455724,
    Thinking = 124584711308900,
    ["Little Obbyist"] = 134584040095037,
    ["Aura Fly"] = 78755795767408,
    Invisible = 109899950448992,
    Slenderman = 81926508907412,
    ["Chill pose"] = 77058107325712,
    house = 93552301087938,
    baby = 82824758023484,
    zenitsu = 92750276568993,
    gun = 73562814360939,
    ["Spy Laugh tf2"] = 137720205462499,
    ["Head Juggling"] = 82224981519682,
    ["Omniman Think"] = 70560694892323,
    ["Ishowspeed Shake Dancing"] = 138386881919239,
    Wait = 106569806588657,
    ["Shinji Pose"] = 97629500912487,
    ["Come At Me [ R6 ]"] = 107758370940834,
    ["Oscillating Fan"] = 71493999860590,
    ["Locked In"] = 110145155419199,
    BirdBrain = 105730788757021,
    ["Hakari (FULL)"] = 71056659089869,
    ["How A Creeper Walk"] = 108714986908463,
    ["Hakari (R6)"] = 127103118569243,
    ["Strongest Stance"] = 80146495484274,
    ["Cat Things"] = 131193808160056,
    ["Doggy Things"] = 105206768873249,
    ["Wally West Edit"] = 72247161810866,
    ["24 Hour Cinderella"] = 122972776209997,
    Mesmerizer = 92707348383277,
    ["Stylish Float"] = 97497383284399,
    ["SpongeBob Shuffle"] = 107899954696611,
    ["Electro Shuffle"] = 96426537876059,
    ["Foreign Shuffle"] = 101507732056031,
    Caipirinha = 100165303717371,
    ["Squidward Yell"] = 109244554368414,
    ["Hakari (Forsaken)"] = 73271793399763,
    ["Teto Dance"] = 93031502567721,
    ["Michael Myers"] = 88229016850146,
    ["Gun Shoot"] = 105055412595333,
    ["Torture Dance"] = 116099356619436,
    ["Yapping Yap Yap Gesture"] = 119870339321091,
    ["Luxurious / Springtrap"] = 132151459316300,
    ["Hand Drill"] = 103882178542598,
    exclamation = 82714556886471,
    ["Mewing / Mogging"] = 135493514352956,
    ["lemon melon cookie - Miku"] = 79874689836683,
    ["Cute Jump"] = 80556794144838,
    ["Billy Bounce"] = 126516908191316,
    ["What U Want / Prince Egypt"] = 133751526608969,
    ["Rabbit Hole - Miku"] = 133481721436918,
    Garou = 86200585395371,
    ["Dio Pose"] = 76736978166708,
    ["Golden Freddy"] = 122463450997235,
    ["Noclip, Speed"] = 137006085779408,
    ["Static [Hatsune Miku]"] = 84534006084837,
    GOALL = 78830825254717,
    ["Lethal Dance"] = 77108921633993,
    ["Plug Walk"] = 100359724990859,
    ["At Ease"] = 76993139936388,
    Conga = 97547955535086,
    Barrel = 84511772437190,
    Helicopter = 84555218084038,
    ["Aura Farm Boat"] = 88042995626011,
    ["Prince Of Egypt"] = 134063402217274,
    ["Jersey Joe2"] = 115782117564871,
    ["Deltarune - Tenna Dance"] = 73715378215546,
    ["California Girl"] = 132074413582912,
    ["Default Dance"] = 80877772569772,
    ["Shocked meme"] = 129501229484294,
    ["Family Guy"] = 78459263478161,
    ["Car Transformation"] = 96887377943085,
    Insanity = 129843344424281,
    ["Honored One"] = 121643381580730,
    Sukuna = 91839607010745,
    Dropper = 130358790702800,
    ["Be Not Afraid"] = 70635223083942,
    Macarena = 91274761264433,
    Helicopter2 = 119431985170060,
    RONALDO = 97547486465713,
    ["Nya Anime Dance"] = 126647057611522,
    ["Do that thang"] = 113772829398170,
    ["Squat?"] = 95441477641149,
    Slickback = 103789826265487,
}
Animations = {
    Stylish = {
        Idle = 616136790,
        Idle2 = 616138447,
        Idle3 = 886888594,
        Walk = 616146177,
        Run = 616140816,
        Jump = 616139451,
        Climb = 616133594,
        Fall = 616134815,
        Swim = 616143378,
        SwimIdle = 616144772,
        Weight = 9,
        Weight2 = 1,
    },
    Zombie = {
        Idle = 616158929,
        Idle2 = 616160636,
        Idle3 = 885545458,
        Walk = 616168032,
        Run = 616163682,
        Jump = 616161997,
        Climb = 616156119,
        Fall = 616157476,
        Swim = 616165109,
        SwimIdle = 616166655,
        Weight = 9,
        Weight2 = 1,
    },
    Robot = {
        Idle = 616088211,
        Idle2 = 616089559,
        Idle3 = 885531463,
        Walk = 616095330,
        Run = 616091570,
        Jump = 616090535,
        Climb = 616086039,
        Fall = 616087089,
        Swim = 616092998,
        SwimIdle = 616094091,
        Weight = 9,
        Weight2 = 1,
    },
    Toy = {
        Idle = 782841498,
        Idle2 = 782845736,
        Idle3 = 980952228,
        Walk = 782843345,
        Run = 782842708,
        Jump = 782847020,
        Climb = 782843869,
        Fall = 782846423,
        Swim = 782844582,
        SwimIdle = 782845186,
        Weight = 9,
        Weight2 = 1,
    },
    Cartoony = {
        Idle = 742637544,
        Idle2 = 742638445,
        Idle3 = 885477856,
        Walk = 742640026,
        Run = 742638842,
        Jump = 742637942,
        Climb = 742636889,
        Fall = 742637151,
        Swim = 742639220,
        SwimIdle = 742639812,
        Weight = 9,
        Weight2 = 1,
    },
    Superhero = {
        Idle = 616111295,
        Idle2 = 616113536,
        Idle3 = 885535855,
        Walk = 616122287,
        Run = 616117076,
        Jump = 616115533,
        Climb = 616104706,
        Fall = 616108001,
        Swim = 616119360,
        SwimIdle = 616120861,
        Weight = 9,
        Weight2 = 1,
    },
    Mage = {
        Idle = 707742142,
        Idle2 = 707855907,
        Idle3 = 885508740,
        Walk = 707897309,
        Run = 707861613,
        Jump = 707853694,
        Climb = 707826056,
        Fall = 707829716,
        Swim = 707876443,
        SwimIdle = 707894699,
        Weight = 9,
        Weight2 = 1,
    },
    Levitation = {
        Idle = 616006778,
        Idle2 = 616008087,
        Idle3 = 886862142,
        Walk = 616013216,
        Run = 616010382,
        Jump = 616008936,
        Climb = 616003713,
        Fall = 616005863,
        Swim = 616011509,
        SwimIdle = 616012453,
        Weight = 9,
        Weight2 = 1,
    },
    Vampire = {
        Idle = 1083445855,
        Idle2 = 1083450166,
        Idle3 = 1088037547,
        Walk = 1083473930,
        Run = 1083462077,
        Jump = 1083455352,
        Climb = 1083439238,
        Fall = 1083443587,
        Swim = 1083464683,
        SwimIdle = 1083467779,
        Weight = 9,
        Weight2 = 1,
    },
    Elder = {
        Idle = 845397899,
        Idle2 = 845400520,
        Idle3 = 901160519,
        Walk = 845403856,
        Run = 845386501,
        Jump = 845398858,
        Climb = 845392038,
        Fall = 845396048,
        Swim = 845401742,
        SwimIdle = 845403127,
        Weight = 9,
        Weight2 = 1,
    },
    Werewolf = {
        Idle = 1083195517,
        Idle2 = 1083214717,
        Idle3 = 1099492820,
        Walk = 1083178339,
        Run = 1083216690,
        Jump = 1083218792,
        Climb = 1083182000,
        Fall = 1083189019,
        Swim = 1083222527,
        SwimIdle = 1083225406,
        Weight = 9,
        Weight2 = 1,
    },
    Knight = {
        Idle = 657595757,
        Idle2 = 657568135,
        Idle3 = 885499184,
        Walk = 657552124,
        Run = 657564596,
        Jump = 658409194,
        Climb = 658360781,
        Fall = 657600338,
        Swim = 657560551,
        SwimIdle = 657557095,
        Weight = 9,
        Weight2 = 1,
    },
    Bold = {
        Idle = 16738333868,
        Idle2 = 16738334710,
        Idle3 = 16738335517,
        Walk = 16738340646,
        Run = 16738337225,
        Jump = 16738336650,
        Climb = 16738332169,
        Fall = 16738333171,
        Swim = 16738339158,
        SwimIdle = 16738339817,
        Weight = 9,
        Weight2 = 1,
    },
    Astronaut = {
        Idle = 891621366,
        Idle2 = 891633237,
        Idle3 = 1047759695,
        Walk = 891667138,
        Run = 891636393,
        Jump = 891627522,
        Climb = 891609353,
        Fall = 891617961,
        Swim = 891639666,
        SwimIdle = 891663592,
        Weight = 9,
        Weight2 = 1,
    },
    Bubbly = {
        Idle = 910004836,
        Idle2 = 910009958,
        Idle3 = 1018536639,
        Walk = 910034870,
        Run = 910025107,
        Jump = 910016857,
        Climb = 909997997,
        Fall = 910001910,
        Swim = 910028158,
        SwimIdle = 910030921,
        Weight = 9,
        Weight2 = 1,
    },
    Pirate = {
        Idle = 750781874,
        Idle2 = 750782770,
        Idle3 = 885515365,
        Walk = 750785693,
        Run = 750783738,
        Jump = 750782230,
        Climb = 750779899,
        Fall = 750780242,
        Swim = 750784579,
        SwimIdle = 750785176,
        Weight = 9,
        Weight2 = 1,
    },
    Rthro = {
        Idle = 2510196951,
        Idle2 = 2510197257,
        Idle3 = 3711062489,
        Walk = 2510202577,
        Run = 2510198475,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Weight = 9,
        Weight2 = 1,
    },
    Ninja = {
        Idle = 656117400,
        Idle2 = 656118341,
        Idle3 = 886742569,
        Walk = 656121766,
        Run = 656118852,
        Jump = 656117878,
        Climb = 656114359,
        Fall = 656115606,
        Swim = 656119721,
        SwimIdle = 656121397,
        Weight = 9,
        Weight2 = 1,
    },
    Oldschool = {
        Idle = 5319828216,
        Idle2 = 5319831086,
        Idle3 = 5392107832,
        Walk = 5319847204,
        Run = 5319844329,
        Jump = 5319841935,
        Climb = 5319816685,
        Fall = 5319839762,
        Swim = 5319850266,
        SwimIdle = 5319852613,
        Weight = 9,
        Weight2 = 1,
    },
    Realistic = {
        Idle = 17172918855,
        Idle2 = 17173014241,
        Idle3 = 17173014241,
        Walk = 11600249883,
        Run = 11600211410,
        Jump = 11600210487,
        Climb = 11600205519,
        Fall = 11600206437,
        Swim = 11600212676,
        SwimIdle = 11600213505,
        Weight = 9,
        Weight2 = 1,
    },
    ["No Boundaries"] = {
        Idle = 18747067405,
        Idle2 = 18747063918,
        Idle3 = 18747063918,
        Walk = 18747074203,
        Run = 18747070484,
        Jump = 18747069148,
        Climb = 18747060903,
        Fall = 18747062535,
        Swim = 18747073181,
        SwimIdle = 18747071682,
        Weight = 9,
        Weight2 = 1,
    },
    ["NFL Animation"] = {
        Idle = 92080889861410,
        Idle2 = 74451233229259,
        Idle3 = 80884010501210,
        Walk = 110358958299415,
        Run = 117333533048078,
        Jump = 119846112151352,
        Climb = 134630013742019,
        Fall = 129773241321032,
        Swim = 132697394189921,
        SwimIdle = 79090109939093,
        Weight = 9,
        Weight2 = 1,
    },
    ["Adidas Aura"] = {
        Idle = 110211186840347,
        Idle2 = 114191137265065,
        Idle3 = 99129837931148,
        Walk = 83842218823011,
        Run = 118320322718866,
        Jump = 109996626521204,
        Climb = 97824616490448,
        Fall = 95603166884636,
        Swim = 134530128383903,
        SwimIdle = 94922130551805,
        Weight = 9,
        Weight2 = 1,
    },
    ["Adidas Sports"] = {
        Idle = 18537376492,
        Idle2 = 18537371272,
        Idle3 = 18537374150,
        Walk = 18537392113,
        Run = 18537384940,
        Jump = 18537380791,
        Climb = 18537363391,
        Fall = 18537367238,
        Swim = 18537389531,
        SwimIdle = 18537387180,
        Weight = 9,
        Weight2 = 1,
    },
    ["Adidas Community "] = {
        Idle = 122257458498464,
        Idle2 = 102357151005774,
        Idle3 = 89262795687364,
        Walk = 122150855457006,
        Run = 82598234841035,
        Jump = 75290611992385,
        Climb = 88763136693023,
        Fall = 98600215928904,
        Swim = 133308483266208,
        SwimIdle = 109346520324160,
        Weight = 9,
        Weight2 = 1,
    },
    ["Wickled Popular"] = {
        Idle = 118832222982049,
        Idle2 = 76049494037641,
        Idle3 = 138255200176080,
        Walk = 92072849924640,
        Run = 72301599441680,
        Jump = 104325245285198,
        Climb = 131326830509784,
        Fall = 121152442762481,
        Swim = 99384245425157,
        SwimIdle = 113199415118199,
        Weight = 9,
        Weight2 = 1,
    },
    ["Catwalk Glam"] = {
        Idle = 133806214992291,
        Idle2 = 94970088341563,
        Idle3 = 87105332133518,
        Walk = 109168724482748,
        Run = 81024476153754,
        Jump = 116936326516985,
        Climb = 119377220967554,
        Fall = 92294537340807,
        Swim = 134591743181628,
        SwimIdle = 98854111361360,
        Weight = 9,
        Weight2 = 1,
    },
    Princess = {
        Idle = 941003647,
        Idle2 = 941013098,
        Idle3 = 1159195712,
        Walk = 941028902,
        Run = 941015281,
        Jump = 941008832,
        Climb = 940996062,
        Fall = 941000007,
        Swim = 941018893,
        SwimIdle = 941025398,
        Weight = 9,
        Weight2 = 1,
    },
    Confident = {
        Idle = 1069977950,
        Idle2 = 1069987858,
        Idle3 = 1116160740,
        Walk = 1070017263,
        Run = 1070001516,
        Jump = 1069984524,
        Climb = 1069946257,
        Fall = 1069973677,
        Swim = 1070009914,
        SwimIdle = 1070012133,
        Weight = 9,
        Weight2 = 1,
    },
    Popstar = {
        Idle = 1212900985,
        Idle2 = 1150842221,
        Idle3 = 1239733474,
        Walk = 1212980338,
        Run = 1212980348,
        Jump = 1212954642,
        Climb = 1213044953,
        Fall = 1212900995,
        Swim = 1212852603,
        SwimIdle = 1070012133,
        Weight = 9,
        Weight2 = 1,
    },
    Patrol = {
        Idle = 1149612882,
        Idle2 = 1150842221,
        Idle3 = 1159573567,
        Walk = 1151231493,
        Run = 1150967949,
        Jump = 1150944216,
        Climb = 1148811837,
        Fall = 1148863382,
        Swim = 1151204998,
        SwimIdle = 1151221899,
        Weight = 9,
        Weight2 = 1,
    },
    Sneaky = {
        Idle = 1132473842,
        Idle2 = 1132477671,
        Idle3 = "None",
        Walk = 1132510133,
        Run = 1132494274,
        Jump = 1132489853,
        Climb = 1132461372,
        Fall = 1132469004,
        Swim = 1132500520,
        SwimIdle = 1132506407,
        Weight = 9,
        Weight2 = 1,
    },
    Cowboy = {
        Idle = 1014390418,
        Idle2 = 1014398616,
        Idle3 = 1159487651,
        Walk = 1014421541,
        Run = 1014401683,
        Jump = 1014394726,
        Climb = 1014380606,
        Fall = 1014384571,
        Swim = 1014406523,
        SwimIdle = 1014411816,
        Weight = 9,
        Weight2 = 1,
    },
    Ghost = {
        Idle = 616006778,
        Idle2 = 616008087,
        Idle3 = 616008087,
        Walk = 616013216,
        Run = 616013216,
        Jump = 616008936,
        Climb = 0,
        Fall = 616005863,
        Swim = 616011509,
        SwimIdle = 616012453,
        Weight = 9,
        Weight2 = 1,
    },
    ["Ghost 2"] = {
        Idle = 1151221899,
        Idle2 = 1151221899,
        Idle3 = "None",
        Walk = 1151221899,
        Run = 1151221899,
        Jump = 1151221899,
        Climb = 0,
        Fall = 1151221899,
        Swim = 16738339158,
        SwimIdle = 1151221899,
        Weight = 9,
        Weight2 = 1,
    },
    ["Mr. Toilet"] = {
        Idle = 4417977954,
        Idle2 = 4417978624,
        Idle3 = 4441285342,
        Walk = 2510202577,
        Run = 4417979645,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Weight = 9,
        Weight2 = 1,
    },
    Udzal = {
        Idle = 3303162274,
        Idle2 = 3303162549,
        Idle3 = 3710161342,
        Walk = 3303162967,
        Run = 3236836670,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510191162,
        Weight = 9,
        Weight2 = 1,
    },
    ["Oinan Thickhoof"] = {
        Idle = 657595757,
        Idle2 = 657568135,
        Idle3 = 885499184,
        Walk = 2510202577,
        Run = 3236836670,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Weight = 9,
        Weight2 = 1,
    },
    Borock = {
        Idle = 3293641938,
        Idle2 = 3293642554,
        Idle3 = 3710131919,
        Walk = 2510202577,
        Run = 3236836670,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Weight = 9,
        Weight2 = 1,
    },
    ["Blocky Mech"] = {
        Idle = 4417977954,
        Idle2 = 4417978624,
        Idle3 = 4441285342,
        Walk = 2510202577,
        Run = 4417979645,
        Jump = 2510197830,
        Climb = 2510192778,
        Fall = 2510195892,
        Swim = 2510199791,
        SwimIdle = 2510201162,
        Weight = 9,
        Weight2 = 1,
    },
    ["Stylized Female"] = {
        Idle = 4708191566,
        Idle2 = 4708192150,
        Idle3 = 121221,
        Walk = 4708193840,
        Run = 4708192705,
        Jump = 4708188025,
        Climb = 4708184253,
        Fall = 4708186162,
        Swim = 4708189360,
        SwimIdle = 4708190607,
        Weight = 9,
        Weight2 = 1,
    },
    R15 = {
        Idle = 4211217646,
        Idle2 = 4211218409,
        Idle3 = "None",
        Walk = 4211223236,
        Run = 4211220381,
        Jump = 4211219390,
        Climb = 4211214992,
        Fall = 4211216152,
        Swim = 4211221314,
        SwimIdle = 4374694239,
        Weight = 9,
        Weight2 = 1,
    },
    Mocap = {
        Idle = 913367814,
        Idle2 = 913373430,
        Idle3 = "None",
        Walk = 913402848,
        Run = 913376220,
        Jump = 913370268,
        Climb = 913362637,
        Fall = 913365531,
        Swim = 913384386,
        SwimIdle = 913389285,
        Weight = 9,
        Weight2 = 1,
    },
    ['Wicked "Dancing Through Life"'] = {
        Idle = 92849173543269,
        Idle2 = 132238900951109,
        Idle3 = 87867222929430,
        Walk = 73718308412641,
        Run = 135515454877967,
        Jump = 78508480717326,
        Climb = 129447497744818,
        Fall = 78147885297412,
        Swim = 110657013921774,
        SwimIdle = 129183123083281,
        Weight = 9,
        Weight2 = 1,
    },
    Unboxed = {
        Idle = 98281136301627,
        Idle2 = 138183121662404,
        Idle3 = 133117300343405,
        Walk = 90478085024465,
        Run = 134824450619865,
        Jump = 121454505477205,
        Climb = 121145883950231,
        Fall = 94788218468396,
        Swim = 105962919001086,
        SwimIdle = 129126268464847,
        Weight = 9,
        Weight2 = 1,
    },
}
AnimationList = {}
for key, _ in pairs(Animations) do
    local v3 = AnimationList
    table.insert(v3, key)
end
local v3 = AnimationList
table.sort(v3, function(str, str2)
    return str:lower() < str2:lower()
end)
AnimURL = "http://www.roblox.com/asset/?id="
local function fn61()
    if not getgenv().KITIOrigAnims then
        local character = localPlayer.Character
        if character then
            local animate = character:FindFirstChild("Animate")
            if animate then
                local kitiOrigAnims = {}
                getgenv().KITIOrigAnims = kitiOrigAnims
                if animate:FindFirstChild("pose") then
                    local animation = animate.pose:FindFirstChildOfClass("Animation")
                    if animation then
                        kitiOrigAnims.pose = animation.AnimationId
                    end
                end
                kitiOrigAnims.idle1 = animate.idle.Animation1.AnimationId
                kitiOrigAnims.idle2 = animate.idle.Animation2.AnimationId
                kitiOrigAnims.walk = animate.walk:FindFirstChildOfClass("Animation").AnimationId
                kitiOrigAnims.run = animate.run:FindFirstChildOfClass("Animation").AnimationId
                kitiOrigAnims.jump = animate.jump:FindFirstChildOfClass("Animation").AnimationId
                kitiOrigAnims.climb = animate.climb:FindFirstChildOfClass("Animation").AnimationId
                kitiOrigAnims.fall = animate.fall:FindFirstChildOfClass("Animation").AnimationId
                if animate:FindFirstChild("swim") then
                    kitiOrigAnims.swim = animate.swim:FindFirstChildOfClass("Animation").AnimationId
                    kitiOrigAnims.swimIdle = animate.swimidle:FindFirstChildOfClass("Animation").AnimationId
                end
            end
        end
    end
end
PlayAnimationBody = function(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    local character = localPlayer.Character
    if character then
        local animate = character:FindFirstChild("Animate")
        if animate then
            if animate:FindFirstChild("idle") then
                animate.idle.Animation1.AnimationId = AnimURL .. v4
                animate.idle.Animation1.Weight.Value = tostring(v14)
                animate.idle.Animation2.Weight.Value = tostring(v15)
                animate.idle.Animation2.AnimationId = AnimURL .. v5
            end
            local pose = v6 and v6 ~= "None" and tonumber(v6) and tonumber(v6) > 0
            if pose then
                pose = animate:FindFirstChild("pose")
            end
            if pose then
                local animation = animate.pose:FindFirstChildOfClass("Animation")
                if animation then
                    animation.AnimationId = AnimURL .. v6
                end
            end
            animate.walk:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v7
            animate.run:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v8
            animate.jump:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v9
            animate.climb:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v10
            animate.fall:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v11
            if animate:FindFirstChild("swim") then
                animate.swim:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v12
                animate.swimidle:FindFirstChildOfClass("Animation").AnimationId = AnimURL .. v13
            end
        end
    end
end
RefreshAnims = function()
    local character = localPlayer.Character
    if character then
        local animate = character:FindFirstChild("Animate")
        if animate then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                animate.Disabled = true
                task.wait()
                for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
                animate.Disabled = false
                local walkSpeed = humanoid.WalkSpeed
                humanoid.WalkSpeed = 0
                task.wait()
                humanoid.WalkSpeed = walkSpeed
            end
        end
    end
end
ResetAnimation = function()
    local character = localPlayer.Character
    if character then
        local animate = character:FindFirstChild("Animate")
        if animate then
            local kitiOrigAnims = getgenv().KITIOrigAnims
            if kitiOrigAnims then
                if kitiOrigAnims.pose and animate:FindFirstChild("pose") then
                    local animation = animate.pose:FindFirstChildOfClass("Animation")
                    if animation then
                        animation.AnimationId = kitiOrigAnims.pose
                    end
                end
                animate.idle.Animation1.AnimationId = kitiOrigAnims.idle1
                animate.idle.Animation2.AnimationId = kitiOrigAnims.idle2
                animate.walk:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.walk
                animate.run:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.run
                animate.jump:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.jump
                animate.climb:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.climb
                animate.fall:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.fall
                local swim = kitiOrigAnims.swim
                if swim then
                    swim = animate:FindFirstChild("swim")
                end
                if swim then
                    animate.swim:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.swim
                    animate.swimidle:FindFirstChildOfClass("Animation").AnimationId = kitiOrigAnims.swimIdle
                end
            end
        end
    end
end
LastEmoteAction = nil
task.spawn(function()
    while true do
        task.wait()
        if not (localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")) then
            continue
        end
        break
    end
    fn61()
end)
localPlayer.CharacterAdded:Connect(function()
    task.spawn(function()
        while true do
            task.wait()
            if not (localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")) then
                continue
            end
            break
        end
        fn61()
        task.wait(0.3)
        local item = LastEmoteAction
        if item then
            if item.Type == "Anim" then
                local v4 = Animations[item.Name]
                if v4 then
                    PlayAnimationBody(v4.Idle, v4.Idle2, v4.Idle3, v4.Walk, v4.Run, v4.Jump, v4.Climb, v4.Fall, v4.Swim, v4.SwimIdle, v4.Weight, v4.Weight2)
                    RefreshAnims()
                end
            elseif item.Type == "Emote" then
                PlayEmote(item.Name)
            end
        end
    end)
end)
EmoteList = {}
for key, _ in pairs(list2) do
    local v4 = EmoteList
    table.insert(v4, key)
end
local v4 = EmoteList
table.sort(v4, function(str, str2)
    return str:lower() < str2:lower()
end)
StopEmotes = function()
    local character = localPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if animator then
                for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
            end
            local animate = character:FindFirstChild("Animate")
            if animate then
                animate.Disabled = false
            end
        end
    end
end
PlayEmote = function(v5)
    local v6 = list2[v5]
    if v6 then
        local character = localPlayer.Character
        if not character then
            tbl3.new({Title = "Emotes", Content = "Character not found!", Duration = 3})
        else
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                StopEmotes()
                local humanoidDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
                if not humanoidDescription then
                    tbl3.new({Title = "Emotes", Content = "No HumanoidDescription!", Duration = 3})
                else
                    pcall(function()
                        humanoid:PlayEmote("")
                    end)
                    local function fn62()
                        return pcall(function()
                            return humanoid:PlayEmoteAndGetAnimTrackById(v6)
                        end)
                    end
                    local v7, instance = fn62()
                    if not v7 or not instance then
                        pcall(function()
                            humanoidDescription:AddEmote(v5, v6)
                        end)
                        v7, instance = fn62()
                    end
                    if v7 then
                        v7 = typeof(instance) == "Instance"
                    end
                    if v7 then
                        v7 = instance:IsA("AnimationTrack")
                    end
                    if v7 then
                        instance.Priority = Enum.AnimationPriority.Idle
                        instance:Play(0)
                    else
                        pcall(function()
                            local animation = Instance.new("Animation")
                            animation.AnimationId = "rbxassetid://" .. v6
                            local v8 = humanoid:LoadAnimation(animation)
                            v8.Priority = Enum.AnimationPriority.Idle
                            v8:Play(0)
                        end)
                    end
                    local animate = character:FindFirstChild("Animate")
                    if animate and not animate.Disabled then
                        animate.Disabled = true
                    end
                    fn51()
                    local tbl5 = {Title = "Emotes", Content = v5, Duration = 2}
                    tbl3.new(tbl5)
                end
            end
        end
    end
end
local window = connection:Window({
    Logo = "90791694090379",
    FadeSpeed = 0,
    PagePadding = 19,
    Size = game:GetService("UserInputService").TouchEnabled and UDim2.new(0, 420, 0, 460) or UDim2.new(0, 760, 0, 520),
})
tbl.Window = window
pcall(function()
    local parent = window.Items.MainFrame and window.Items.MainFrame.Instance
    local instance = window.Items.Inline and window.Items.Inline.Instance
    local instance2 = window.Items.Logo and window.Items.Logo.Instance
    if instance2 then
        instance2.Position = UDim2.new(0.5, 0, 0, 23)
        instance2.Size = UDim2.new(0, 60, 0, 60)
    end
    if parent then
        local corner = parent:FindFirstChildOfClass("UICorner")
        if not corner then
            corner = Instance.new("UICorner")
            corner.Parent = parent
        end
        corner.CornerRadius = UDim.new(0, 20)
        parent.ClipsDescendants = false
    end
    if instance then
        local corner = instance:FindFirstChildOfClass("UICorner")
        if corner then
            corner:Destroy()
        end
        instance.ClipsDescendants = true
    end
    if window.Items.Shadow and window.Items.Shadow.Instance then
        window.Items.Shadow.Instance.Visible = true
        window.Items.Shadow.Instance.ImageTransparency = 0.45
        window.Items.Shadow.Instance.Size = UDim2.new(1, 55, 1, 55)
        window.Items.Shadow.Instance.Position = UDim2.new(0.5, 0, 0.5, 0)
    end
end)
pcall(function()
    local parent = window.Items.MainFrame and window.Items.MainFrame.Instance
    if parent then
        local backgroundColor3 = connection.Theme and connection.Theme.Accent or Color3.fromRGB(255, 128, 0)
        local frame = Instance.new("Frame")
        frame.Name = "ResizeHandleHorizontal"
        frame.AnchorPoint = Vector2.new(1, 1)
        frame.Position = UDim2.new(1, 0, 1, 0)
        frame.Size = UDim2.new(0, 12, 0, 2)
        frame.BackgroundColor3 = backgroundColor3
        frame.BorderSizePixel = 0
        frame.Active = false
        frame.Selectable = false
        frame.ZIndex = 1999
        frame.Parent = parent
        local frame2 = Instance.new("Frame")
        frame2.Name = "ResizeHandleVertical"
        frame2.AnchorPoint = Vector2.new(1, 1)
        frame2.Position = UDim2.new(1, 0, 1, 0)
        frame2.Size = UDim2.new(0, 2, 0, 12)
        frame2.BackgroundColor3 = backgroundColor3
        frame2.BorderSizePixel = 0
        frame2.Active = false
        frame2.Selectable = false
        frame2.ZIndex = 1999
        frame2.Parent = parent
    end
end)
local object = setmetatable({}, {__mode = "k"})
local fn62 = function(v5, instance)
    local instance2 = window.Items.MainFrame and window.Items.MainFrame.Instance
    if instance2 then
        if not instance then
            instance = instance2
        end
        local number2 = tonumber(v5)
        if not number2 or number2 ~= number2 or number2 == 1 / 0 or number2 == -1 / 0 then
            number2 = 0
        end
        local value2 = math.clamp(number2, 0, 80) / 100
        local function fn62(instance3)
            if instance3:IsA("GuiObject") then
                if not (instance3.Name == "ResizeHandleHorizontal" or instance3.Name == "ResizeHandleVertical") then
                    if not (instance3.ZIndex >= 25) then
                        if object[instance3] == nil then
                            object[instance3] = instance3.BackgroundTransparency
                        end
                        local v6 = object[instance3]
                        local backgroundTransparency = v6 >= 1 and 1
                        if not backgroundTransparency then
                            local clamp, value3, n2, n3 = math.clamp, v6 + value2 * (1 - v6), 0, 1
                            backgroundTransparency = clamp(value3, n2, n3)
                        end
                        instance3.BackgroundTransparency = backgroundTransparency
                    end
                end
            end
        end
        fn62(instance)
        for _, descendant in ipairs(instance:GetDescendants()) do
            fn62(descendant)
        end
    end
end
local instance = window.Items.MainFrame and window.Items.MainFrame.Instance
if instance then
    instance.DescendantAdded:Connect(function(descendant)
        if value > 0 then
            task.defer(function()
                pcall(fn62, value, descendant)
            end)
        end
    end)
end
local tbl5 = {Default = 1, Large = 1.2, Small = 0.88}
local n2 = 1
KITI_MeowScale = 1
function window:SetSize(v5)
    local number2 = tonumber(v5) or 1
    local scale = math.clamp(number2, 0.5, 2)
    n2 = scale
    KITI_MeowScale = scale
    self.Size = game:GetService("UserInputService").TouchEnabled and UDim2.new(0, 420, 0, 460) or UDim2.new(0, 760, 0, 540)
    if self.Items and self.Items.MainFrame then
        self.Items.MainFrame.Instance.Size = self.Size
        local instance2 = self.Items.ProportionalScale and self.Items.ProportionalScale.Instance
        if instance2 then
            instance2.Scale = scale
        end
    end
end
function window:AddTab(item)
    if not item then
        item = {}
    end
    local _firstMainPage = self:Page({
        Icon = item.Icon or "gear",
        Search = item.Search ~= false,
        Sidebar = item.Sidebar == true,
        LayoutOrder = item.LayoutOrder or 0,
    })
    local v5 = _firstMainPage:SubPage({Name = item.Name or "Tab"})
    v5.NoFade = item.NoFade == true
    pcall(function()
        v5.Items.Inactive.Instance.Size = UDim2.new(0, 64, 1, 0)
        v5.Items.Inactive.Instance.TextSize = 12
    end)
    _firstMainPage.Items.Inactive.Instance.MouseButton1Down:Connect(function()
        for _, subPage in ipairs(self.SubPages) do
            if subPage.Page == _firstMainPage then
                subPage:Turn(subPage == v5)
            end
        end
    end)
    if not item.NoAutoActivate and not self._firstMainPage then
        self._firstMainPage = _firstMainPage
        for _, page in ipairs(self.Pages) do
            page:Turn(page == _firstMainPage)
        end
        for _, subPage in ipairs(self.SubPages) do
            if subPage.Page == _firstMainPage then
                subPage:Turn(subPage == v5)
            end
        end
        v5:Turn(true)
    elseif item.NoAutoActivate then
        _firstMainPage:Turn(false)
        v5:Turn(false)
    end
    return fn49(self, v5, true)
end
window.Configs = window:AddTab({Name = "Configs", Icon = "folder", LayoutOrder = 9999, NoAutoActivate = true})
window.UserSettings = window.Configs:AddSubPage({Name = "Settings"})
window.UserSettings.Page:Turn(false)
connection.MenuKeybind = "Enum.KeyCode.G"
window._OldSetOpen = window.SetOpen
window._SignalCallbacks = {}
window.Signal = {
    GetValue = function()
        return window.IsOpen
    end,
    Connect = function(_, v5)
        table.insert(window._SignalCallbacks, v5)
        return {
            Disconnect = function()
                local v6, v7, v8 = ipairs(window._SignalCallbacks)
                local enabled3 = false
                for key, value2 in v6, v7, v8 do
                    v7 = key
                    if value2 == v5 then
                        enabled3 = true
                        break
                    else
                        continue
                    end
                    return
                end
                if not enabled3 then
                    return
                end
                table.remove(window._SignalCallbacks, v7)
            end,
        }
    end,
}
function window.SetOpen(v5, v6)
    window._OldSetOpen(v5, v6)
    for _, _SignalCallback in ipairs(window._SignalCallbacks) do
        pcall(_SignalCallback, v6)
    end
end
menuBlurEnabled = false
pcall(function()
    for _, child in ipairs(Lighting:GetChildren()) do
        if child:IsA("BlurEffect") and child.Name == "KITI_MenuBlur" then
            child:Destroy()
        end
    end
end)
menuBlur = Instance.new("BlurEffect")
menuBlur.Name = "KITI_MenuBlur"
menuBlur.Parent = Lighting
menuBlur.Enabled = false
menuBlur.Size = 15
applyMenuBlur = function()
    menuBlur.Enabled = false
end
window.Signal:Connect(function()
    applyMenuBlur()
end)
getgenv().KITI_SetMenuBlur = function(enabled3)
    if enabled3 then
        enabled3 = true
    end
    menuBlurEnabled = enabled3 or false
    applyMenuBlur()
end
mimiEnabled = false
furryEnabled = false
meowChoice = "None"
meowFrameInterval = 0.12
if getgenv().KITI_MeowOverlayGui then
    pcall(function()
        getgenv().KITI_MeowOverlayGui:Destroy()
    end)
end
KITI_MeowOverlayGui = Instance.new("ScreenGui")
KITI_MeowOverlayGui.Name = "KITI_MeowOverlay"
KITI_MeowOverlayGui.IgnoreGuiInset = true
KITI_MeowOverlayGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
KITI_MeowOverlayGui.DisplayOrder = 10000
KITI_MeowOverlayGui.ResetOnSpawn = false
KITI_MeowOverlayGui.Parent = gethui()
local kITI_MeowOverlayGui = KITI_MeowOverlayGui
getgenv().KITI_MeowOverlayGui = kITI_MeowOverlayGui
KITI_MeowOverlay = Instance.new("Frame")
KITI_MeowOverlay.Name = "Characters"
KITI_MeowOverlay.BackgroundTransparency = 1
KITI_MeowOverlay.BorderSizePixel = 0
KITI_MeowOverlay.Size = UDim2.fromScale(1, 1)
KITI_MeowOverlay.ClipsDescendants = false
KITI_MeowOverlay.ZIndex = 10000
KITI_MeowOverlay.Parent = KITI_MeowOverlayGui
KITI_MeowOverlayGui.Enabled = true
KITI_MeowFadeToken = 0
window.Signal:Connect(function(v5)
    KITI_MeowFadeToken = KITI_MeowFadeToken + 1
    local v6 = KITI_MeowFadeToken
    KITI_MeowOverlayGui.Enabled = true
    local tweenInfo = TweenInfo.new(v5 and 0.34 or 0.26, Enum.EasingStyle.Quint, v5 and Enum.EasingDirection.Out or Enum.EasingDirection.In)
    for _, descendant in ipairs(KITI_MeowOverlay:GetDescendants()) do
        if descendant:IsA("ImageLabel") then
            TweenService2:Create(descendant, tweenInfo, {ImageTransparency = v5 and 0 or 1}):Play()
        end
    end
    if not v5 then
        task.delay(0.28, function()
            if v6 == KITI_MeowFadeToken and not window.IsOpen then
                KITI_MeowOverlayGui.Enabled = false
            end
        end)
    end
end)
task.spawn(function()
    local instance2 = (function()
        return window.Items.MainFrame and window.Items.MainFrame.Instance
    end)()
    if instance2 then
        instance2.ClipsDescendants = false
        local image = ""
        local v5, v6 = pcall(function()
            local v5 = game:HttpGet("https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/mimka.png")
            local text2 = "temp_" .. math.random(100000, 999999) .. ".png"
            writefile(text2, v5)
            image = getcustomasset(text2)
            task.delay(0.1, function()
                if isfile and isfile(text2) then
                    delfile(text2)
                end
            end)
        end)
        if not v5 or image == "" then
            warn("[Mimi] Header animation failed to download:", v6)
        else
            local frame = Instance.new("Frame")
            frame.Name = "MimiClip"
            local n3 = KITI_MeowScale or 1
            frame.Size = UDim2.fromOffset(128 * (KITI_MeowScale or 1), 160 * n3)
            frame.BackgroundTransparency = 1
            frame.ClipsDescendants = true
            frame.ZIndex = 10000
            frame.Parent = KITI_MeowOverlay
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "MimiSheet"
            imageLabel.Size = UDim2.new(5, 0, 5, 0)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Image = image
            imageLabel.ZIndex = 10001
            imageLabel.Parent = frame
            local function fn63()
                local tbl6 = {}
                local n4 = 0
                local n5 = 4
                local n6 = 1
                local _
                for i = n4, n5 + 0, n6 + 0 do
                    local value2 = i / 5
                    table.insert(tbl6, NumberSequenceKeypoint.new(value2, 1))
                    table.insert(tbl6, NumberSequenceKeypoint.new(value2 + 0.02, 0))
                    table.insert(tbl6, NumberSequenceKeypoint.new(value2 + 0.18, 0))
                end
                table.insert(tbl6, NumberSequenceKeypoint.new(1, 1))
                return NumberSequence.new(tbl6)
            end
            local gradient = Instance.new("UIGradient", imageLabel)
            gradient.Rotation = 0
            gradient.Transparency = fn63()
            local gradient2 = Instance.new("UIGradient", imageLabel)
            gradient2.Rotation = 90
            gradient2.Transparency = fn63()
            local n4 = 5
            local n5 = 23
            local n6 = 0
            local n7 = 0
            RunService.RenderStepped:Connect(function(dt)
                local parent = frame
                if frame then
                    parent = frame.Parent
                end
                if parent then
                    parent = instance2
                end
                if parent then
                    parent = instance2.Parent
                end
                if parent then
                    parent = meowChoice == "Mimi"
                end
                if parent then
                    local _ = connection.Holder.Instance.AbsoluteSize
                    local x = instance2.AbsoluteSize.X
                    local n8 = KITI_MeowScale or 1
                    frame.Size = UDim2.fromOffset(128 * n8, 160 * n8)
                    frame.Visible = true
                    frame.Position = UDim2.fromOffset(math.floor(instance2.AbsolutePosition.X + x - 120 * n8), math.floor(instance2.AbsolutePosition.Y - 100 * n8))
                    n7 = n7 + dt
                    if meowFrameInterval <= n7 then
                        n7 = 0
                        local v7 = n6 % n4
                        local value2 = math.floor(n6 / n4)
                        imageLabel.Position = UDim2.new(-v7, 0, -value2, -1)
                        n6 = (n6 + 1) % n5
                    end
                else
                    frame.Visible = false
                end
            end)
        end
    end
end)
task.spawn(function()
    local instance2 = window.Items.MainFrame and window.Items.MainFrame.Instance
    if instance2 then
        local image = ""
        local v5, v6 = pcall(function()
            local v5 = game:HttpGet("https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/furryan.png")
            local text2 = "temp_furry_" .. math.random(100000, 999999) .. ".png"
            writefile(text2, v5)
            image = getcustomasset(text2)
            task.delay(0.1, function()
                if isfile and isfile(text2) then
                    delfile(text2)
                end
            end)
        end)
        local v7 = v6
        if not v5 or image == "" then
            warn("[Furry] Animation failed to download:", v7)
        else
            local frame = Instance.new("Frame")
            frame.Name = "FurryClip"
            local n3 = KITI_MeowScale or 1
            frame.Size = UDim2.fromOffset(128 * (KITI_MeowScale or 1), 128 * n3)
            frame.BackgroundTransparency = 1
            frame.ClipsDescendants = true
            frame.ZIndex = 10000
            frame.Parent = KITI_MeowOverlay
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "FurrySheet"
            imageLabel.Size = UDim2.new(5, 0, 4, 0)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Image = image
            imageLabel.ZIndex = 10001
            imageLabel.Parent = frame
            local function fn63(v8)
                local tbl6 = {}
                local value2 = v8 - 1
                local n4 = 0
                local n5 = 1
                local _
                for i = n4, value2 + 0, n5 + 0 do
                    local value3 = i / v8
                    table.insert(tbl6, NumberSequenceKeypoint.new(value3, 1))
                    table.insert(tbl6, NumberSequenceKeypoint.new(value3 + 0.1 / v8, 0))
                    table.insert(tbl6, NumberSequenceKeypoint.new(value3 + 0.9 / v8, 0))
                end
                table.insert(tbl6, NumberSequenceKeypoint.new(1, 1))
                return NumberSequence.new(tbl6)
            end
            Instance.new("UIGradient", imageLabel).Transparency = fn63(5)
            local gradient = Instance.new("UIGradient", imageLabel)
            gradient.Rotation = 90
            gradient.Transparency = fn63(4)
            local n4 = 0
            local n5 = 0
            RunService.RenderStepped:Connect(function(dt)
                local parent = frame
                if frame then
                    parent = frame.Parent
                end
                if parent then
                    parent = instance2
                end
                if parent then
                    parent = instance2.Parent
                end
                if parent then
                    parent = meowChoice == "Furry"
                end
                if parent then
                    local x = instance2.AbsoluteSize.X
                    local n6 = KITI_MeowScale or 1
                    frame.Size = UDim2.fromOffset(128 * n6, 128 * n6)
                    frame.Visible = true
                    frame.Position = UDim2.fromOffset(math.floor(instance2.AbsolutePosition.X + x - 135 * n6), math.floor(instance2.AbsolutePosition.Y - 57 * n6))
                    n5 = n5 + dt
                    if n5 >= meowFrameInterval then
                        n5 = 0
                        local v8 = n4 % 5
                        local value2 = math.floor(n4 / 5)
                        imageLabel.Position = UDim2.new(-v8, 0, -value2, 0)
                        n4 = (n4 + 1) % 18
                    end
                else
                    frame.Visible = false
                end
            end)
        end
    end
end)
kotiClip = nil
kotiWidth = 230
kotiHeight = 230
task.spawn(function()
    local instance2 = window.Items.MainFrame and window.Items.MainFrame.Instance
    if instance2 then
        local image = ""
        local v5, v6 = pcall(function()
            local v5 = game:HttpGet("https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/koti1.png")
            local text2 = "temp_koti_" .. math.random(100000, 999999) .. ".png"
            writefile(text2, v5)
            image = getcustomasset(text2)
            task.delay(0.1, function()
                if isfile and isfile(text2) then
                    delfile(text2)
                end
            end)
        end)
        if not v5 or image == "" then
            warn("[Koti] Image failed to download:", v6)
        else
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "KotiImage"
            local v7 = kotiWidth
            local v8 = kotiHeight
            imageLabel.Size = UDim2.fromOffset(v7, v8)
            imageLabel.BackgroundTransparency = 1
            imageLabel.ScaleType = Enum.ScaleType.Fit
            imageLabel.Image = image
            imageLabel.ZIndex = 10001
            imageLabel.Parent = KITI_MeowOverlay
            kotiClip = imageLabel
            RunService.RenderStepped:Connect(function()
                local parent = imageLabel
                if imageLabel then
                    parent = imageLabel.Parent
                end
                if parent then
                    parent = instance2
                end
                if parent then
                    parent = instance2.Parent
                end
                if parent then
                    parent = meowChoice == "Koti"
                end
                if parent then
                    local _ = instance2.Size.X.Offset
                    imageLabel.Visible = true
                    local n3 = KITI_MeowScale or 1
                    imageLabel.Size = UDim2.fromOffset(kotiWidth * n3, kotiHeight * n3)
                    imageLabel.Position = UDim2.fromOffset(math.floor(instance2.AbsolutePosition.X + instance2.AbsoluteSize.X - 230 * n3), math.floor(instance2.AbsolutePosition.Y - 90 * n3))
                else
                    imageLabel.Visible = false
                end
            end)
        end
    end
end)
task.spawn(function()
    local instance2 = window.Items.MainFrame and window.Items.MainFrame.Instance
    if instance2 then
        local image = ""
        local v5 = not pcall(function()
            local v5 = game:HttpGet("https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/protogen-bongo.png")
            local text2 = "temp_protogen_" .. math.random(100000, 999999) .. ".png"
            writefile(text2, v5)
            image = getcustomasset(text2)
            task.delay(0.1, function()
                if isfile and isfile(text2) then
                    delfile(text2)
                end
            end)
        end) or image == ""
        if not v5 then
            local frame = Instance.new("Frame")
            frame.Name = "ProtogenBongoClip"
            local n3 = KITI_MeowScale or 1
            frame.Size = UDim2.fromOffset(128 * (KITI_MeowScale or 1), 128 * n3)
            frame.BackgroundTransparency = 1
            frame.ClipsDescendants = true
            frame.ZIndex = 10000
            frame.Parent = KITI_MeowOverlay
            local list3 = {}
            for i = 0, 1 do
                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Name = "ProtogenBongoImage" .. tostring(i + 1)
                local n4 = KITI_MeowScale or 1
                imageLabel.Size = UDim2.fromOffset(640 * (KITI_MeowScale or 1), 128 * n4)
                imageLabel.Position = UDim2.fromOffset(-i * 128, 0)
                imageLabel.BackgroundTransparency = 1
                imageLabel.Image = image
                imageLabel.ScaleType = Enum.ScaleType.Stretch
                imageLabel.Visible = i == 0
                imageLabel.ZIndex = 10001
                imageLabel.Parent = frame
                list3[i] = imageLabel
            end
            local n4 = 0
            local n5 = 0
            RunService.RenderStepped:Connect(function(dt)
                if frame.Parent and instance2.Parent and meowChoice == "Protogen Bongo" then
                    local x = instance2.AbsoluteSize.X
                    local n6 = KITI_MeowScale or 1
                    frame.Size = UDim2.fromOffset(128 * n6, 128 * n6)
                    for key, value2 in pairs(list3) do
                        value2.Size = UDim2.fromOffset(640 * n6, 128 * n6)
                        value2.Position = UDim2.fromOffset(-key * 128 * n6, 0)
                    end
                    frame.Visible = true
                    frame.Position = UDim2.fromOffset(math.floor(instance2.AbsolutePosition.X + x - 150 * n6), math.floor(instance2.AbsolutePosition.Y - 23 * n6))
                    list3[0].Visible = n4 == 0
                    list3[1].Visible = n4 == 1
                    n5 = n5 + dt
                    if meowFrameInterval <= n5 then
                        n5 = 0
                        n4 = (n4 + 1) % 2
                    end
                else
                    frame.Visible = false
                end
            end)
        end
    end
end)
uiRefs.Settings = window.UserSettings
tbl.Language = KITI_InterfaceLanguage == "Russian" and "Russian" or "English"
tbl.TextMapRussian = {
    Configs = "Кфг",
    Settings = "Настройки",
    Language = "Язык",
    General = "Общее",
    MM2 = "ММ2",
    Visuals = "Визуал",
    Target = "Цель",
    Fun = "Фан",
    Emotes = "Эмоции",
    Sound = "Звук",
    ["Menu Keybind"] = "Клавиша меню",
    ["Menu Scale"] = "Размер меню",
    ["Menu Transparency"] = "Прозрачность меню",
    ["Custom Player Avatars"] = "Свои аватары игроков",
    Meow = "Мяу",
    Fly = "Полёт",
    ["OP Fly"] = "Полёт",
    ["Fly Speed"] = "Скорость полёта",
    Movement = "Движение",
    Walkspeed = "Скорость ходьбы",
    FOV = "Поле зрения",
    Noclip = "Ноуклип",
    Blink = "Блинк",
    ["Blink Speed"] = "Скорость блинка",
    Teleport = "Телепорт",
    ["Player Name"] = "Имя игрока",
    ["Player..."] = "Игрок...",
    Misc = "Разное",
    ["Client Ghost"] = "Client Ghost",
    ESP = "ЕСП",
    Players = "Игроки",
    ["Players ESP"] = "ЕСП игроков",
    Sheriff = "Шериф",
    Murderer = "Убийца",
    Fling = "Флинг",
    ["Vote Duper"] = "Дюп голосования",
    Tools = "Инструменты",
    ["Pickup Method"] = "Способ подбора",
    AutoFarm = "Автофарм",
    Mode = "Режим",
    ["Tween Speed"] = "Скорость перемещения",
    ["Coin Limit"] = "Лимит монет",
    ["Max Distance"] = "Максимальная дистанция",
    ["Underground Offset"] = "Смещение под землёй",
    ["Gun Model"] = "Модель оружия",
    ["Select Model"] = "Выбрать модель",
    ["Gun Beam"] = "Луч оружия",
    ["Beam Type"] = "Тип луча",
    ["Beam Color"] = "Цвет луча",
    Avatar = "Аватар",
    TradeHelper = "Трейд Хелпер",
    Esp = "Есп",
    Effects = "Эффекты",
    ["Trail Style"] = "Стиль следа",
    Environment = "Окружение",
    ["Time Value"] = "Время",
    ["Weather Type"] = "Тип погоды",
    ["Fog Start"] = "Начало тумана",
    Distance = "Дистанция",
    ["Fog Color"] = "Цвет тумана",
    ["Target ESP/HUD"] = "ЕСП/ХУД цели",
    ["Skybox Manager"] = "Управление небом",
    Auras = "Ауры",
    ["Target Info"] = "Информация о цели",
    Actions = "Действия",
    ["Quick Select"] = "Быстрый выбор",
    Scale = "Масштаб",
    Spin = "Спин",
    ["Spin Speed"] = "Скорость вращения",
    Jerk = "Дрочка",
    IDK = "ХУЙНЯ КАКАЯ-ТО",
    ["Hit Effects"] = "Эффекты попадания",
    ["Hit Sound Mode"] = "Режим звука попадания",
    Animations = "Анимации",
    ["UI Sound Settings"] = "Настройки звуков интерфейса",
    ["Enable Sound"] = "Звук включения",
    ["Disable Sound"] = "Звук выключения",
    ["Custom Sounds"] = "Свои звуки",
    ["GunKill Sound"] = "Звук убийства оружием",
    ["Gunshot Sound"] = "Звук выстрела",
    ["Knife Kill Sound"] = "Звук убийства ножом",
    ["Config Manager"] = "Управление кфг",
    ["Config Name"] = "Название кфг",
    ["Select Config"] = "Выбрать кфг",
    ["Create Button"] = "Создать кнопку",
    ["Delete Button"] = "Удалить кнопку",
    ["Dropped Gun"] = "Выброшенное оружие",
    Traps = "Ловушки",
    ["Shoot Murderer"] = "Застрелить убийцу",
    ["Auto-shoot"] = "Автошут",
    SilentAim = "СайлентАим",
    ForceShoot = "ФорсШут",
    ["Knife Throw to Nearest"] = "Бросить нож в ближайшего",
    ["Auto Knife Throw"] = "Автобросок ножа",
    KillAura = "Аура убийства",
    ["Kill Nearest"] = "Убить ближайшего",
    ["Kill Everyone"] = "Убить всех",
    ["Fling Sheriff"] = "Флинг шерифа",
    ["Fling Murderer"] = "Флинг убийцы",
    ["Fling Target"] = "Флинг цели",
    ["Auto Get Dropped Gun"] = "Автоподбор выброшенного оружия",
    ["Force Shoot"] = "ФорсШут",
    VoteDuper = "Дюп голосования",
    ForceShot = "Принудительный выстрел",
    ["Gun ESP"] = "ЕСП оружия",
    ["Traps ESP"] = "ЕСП ловушек",
    ["Shoot Offset"] = "Смещение выстрела",
    ["S.Aim Offset"] = "Смещение тихого аима",
    AutoGetGun = "Автоподбор оружия",
    PlayersESP = "ЕСП игроков",
    Friend = "Друг",
    AspectRatio = "Растяг",
    WalkFling = "WalkFling",
    HitParts = "Частицы попадания",
    HitSound = "Звук попадания",
    ["Hit Particles"] = "Частицы попадания",
    ["Hit Sound"] = "Звук попадания",
    ["Jerk Off"] = "Дрочка",
    ["UI Sounds Enabled"] = "Звуки интерфейса",
    ["Shutup GunReload"] = "Отключить звук перезарядки",
    ["Infinite Void"] = "Бесконечная пустота",
    ["Teleport To"] = "Телепорт к игроку",
    ["Kill (as Murderer)"] = "Убить (за убийцу)",
    ["Set as Aimlock Target"] = "Назначить целью аимлока",
    ["Select Murderer"] = "Выбрать убийцу",
    ["Select Sheriff"] = "Выбрать шерифа",
    ["Select Nearest"] = "Выбрать ближайшего",
    ["Stop Emote"] = "Остановить эмоцию",
    ["Reset Animation"] = "Сбросить анимацию",
    ["Test UI Sound"] = "Проверить звук интерфейса",
    ["Test GunKill Sound"] = "Проверить звук убийства оружием",
    ["Test Gunshot Sound"] = "Проверить звук выстрела",
    ["Test Knife Kill Sound"] = "Проверить звук убийства ножом",
    ["Save Config"] = "Сохранить кфг",
    ["Load Config"] = "Загрузить кфг",
    ["Delete Config"] = "Удалить кфг",
    ["Refresh List"] = "Обновить список",
    ["Enter name..."] = "Введите название...",
    Search = "Поиск",
    ["Search players..."] = "Поиск игроков...",
    ["No player selected"] = "Игрок не выбран",
    ["Distance: --\\nPosition: --\\nRole: --"] = "Дистанция: --\\nПозиция: --\\nРоль: --",
    ["Searching..."] = "Поиск...",
    ["Votes: --"] = "Голоса: --",
    None = "Нет",
    Default = "По умолчанию",
    Large = "Большой",
    Small = "Маленький",
    White = "Белый",
    Blue = "Синий",
    Pink = "Розовый",
    Purple = "Фиолетовый",
    Green = "Зелёный",
    Theme = "Тема",
    ["Theme: "] = "Тема: ",
    ["Saved config"] = "Кфг сохранён",
    ["Loaded config"] = "Кфг загружен",
    ["Failed to save config!"] = "Не удалось сохранить кфг!",
    ["Config file not found!"] = "Файл кфг не найден!",
    ["Corrupted config file!"] = "Файл кфг повреждён!",
    ["Loading: "] = "Загрузка: ",
    ["Deleting "] = "Удаление ",
    ["Refreshing..."] = "Обновление...",
    ["List refreshed!"] = "Список обновлён!",
    Config = "Кфг",
    Error = "Ошибка",
    Success = "Успешно",
    Done = "Готово",
    Remote = "Удалённо",
    FastTP = "Быстрый ТП",
    Fog = "Туман",
    Solid = "Сплошной",
    Fade = "Затухание",
    Rainbow = "Радуга",
    Dotted = "Точечный",
    Underground = "Под землёй",
    Sit = "Сидеть",
}
function tbl.TranslateRuntimeText(str)
    if type(str) ~= "string" or tbl.Language ~= "Russian" then
        return str
    else
        local v5 = tbl.TextMapRussian[str]
        if v5 then
            return v5
        else
            local list3 = {
                {"Saved config", "Кфг сохранён"},
                {"Loaded config", "Кфг загружен"},
                {"Failed to save config!", "Не удалось сохранить кфг!"},
                {"Config file not found!", "Файл кфг не найден!"},
                {"Corrupted config file!", "Файл кфг повреждён!"},
                {"Loading:", "Загрузка:"},
                {"Deleting", "Удаление"},
                {"Refreshing...", "Обновление..."},
                {"List refreshed!", "Список обновлён!"},
                {"Your executor doesn't support file saving!", "Твой загрузчик не поддерживает сохранение файлов!"},
                {"Your executor doesn't support reading files!", "Твой загрузчик не поддерживает чтение файлов!"},
                {"No player selected", "Игрок не выбран"},
                {"Searching...", "Поиск..."},
                {"Votes:", "Голоса:"},
                {"Distance:", "Дистанция:"},
                {"Position:", "Позиция:"},
                {"Role:", "Роль:"},
            }
            for _, value2 in ipairs(list3) do
                str = str:gsub(value2[1], value2[2])
            end
            return str
        end
    end
end
tbl3._RawNew = tbl3.new
function tbl3.new(list3)
    if tbl.Language == "Russian" and type(list3) == "table" then
        local tbl6 = {}
        for key, value2 in pairs(list3) do
            tbl6[key] = value2
        end
        tbl6.Title = tbl.TranslateRuntimeText(tbl6.Title)
        tbl6.Content = tbl.TranslateRuntimeText(tbl6.Content)
        return tbl3._RawNew(tbl6)
    else
        return tbl3._RawNew(list3)
    end
end
tbl.Languages = {
    English = {
        AutoKnife = "Auto Knife Throw",
        AntiCoin = "Anti Coin",
        ChinaHat = "China Hat",
        JumpCircle = "Jump Circle",
        MagicAura = "Magic Aura",
        Trails = "Trails",
        Weather = "Weather",
        Aimlock = "Aimlock",
        SilentAim = "SilentAim",
        ForceShoot = "ForceShoot",
        AutoGetGun = "Auto Get Gun",
        VoteDuper = "VoteDuper",
        KillAura = "KillAura",
        PlayerESP = "Players",
        BoxESP = "Box ESP",
        FriendNPC = "Friend NPC",
        AspectRatio = "AspectRatio",
        Jerk = "Jerk Off",
        UISounds = "UI Sounds Enabled",
        CfgSave = "Save Config",
        CfgLoad = "Load Config",
        CfgDelete = "Delete Config",
    },
    Russian = {
        Friend = "Друг",
        Noclip = "Ноуклип",
        Fly = "Полёт",
        Aimlock = "Аимлок",
        Void = "Бесконечная пустота",
        TpSel = "Телепорт к игроку",
        FlingSel = "Флинг",
        KillSel = "Убить (за убийцу)",
        AimlockSet = "Назначить целью аимлока",
        SelMurd = "Выбрать убийцу",
        SelSher = "Выбрать шерифа",
        SelNear = "Выбрать ближайшего",
        HitParts = "Частицы попадания",
        HitSound = "Звук попадания",
        Spin = "Спин",
        WalkFling = "WalkFling",
        AntiAim = "AntiAim",
        AntiCoin = "Анти-монеты",
        ForceShoot = "ФорсШут",
        AutoGetGun = "Автоподбор оружия",
        VoteDuper = "VoteDuper",
        KillAura = "Аура убийства",
        PlayerESP = "ESP игроков",
        BoxESP = "Боксы ESP",
        FriendNPC = "Друг-NPC",
        AspectRatio = "Растяг",
        Jerk = "Дрочка",
        JumpCircle = "Круг прыжка",
        ChinaHat = "Китайская шляпа",
        CustomGun = "Изменить оружие",
        MagicAura = "Магическая аура",
        Weather = "Погода",
        Trails = "Следы",
        AutoKnife = "Авто-нож",
        SilentShoot = "Тихая стрельба",
        ShutupReload = "Отключить перезарядку",
        StopEmote = "Остановить эмоцию",
        ResetAnim = "Сбросить анимацию",
        UISounds = "Звуки интерфейса",
        TestSound = "Проверить звук интерфейса",
        TestGunKillSound = "Проверить звук убийства оружием",
        TestGunshotSound = "Проверить звук выстрела",
        TestKnifeKillSound = "Проверить звук убийства ножом",
        CfgSave = "Сохранить кфг",
        CfgLoad = "Загрузить кфг",
        CfgDelete = "Удалить кфг",
    },
}
tbl.LocalizationItems = {}
function tbl.L(v5, v6)
    local english = tbl.Languages[tbl.Language] or tbl.Languages.English
    if english then
        english = english[v5]
    end
    if not english then
        english = v6
    end
    if not english then
        english = v5
    end
    return english
end
function tbl.RegisterLocalization(v5, v6)
    if type(v6) == "function" then
        tbl.LocalizationItems[v5] = tbl.LocalizationItems[v5] or {}
        table.insert(tbl.LocalizationItems[v5], v6)
    end
end
function tbl.ApplyLanguage(...)
    local tbl6, v5
    local n3 = 0
    local language = ({...})[1]
    if not tbl.Languages[language] then
        language = "English"
    end
    local _LanguageRepass = tbl._LanguageRepass == true
    tbl._LanguageRepass = true
    tbl.Language = language
    local list3 = {}
    local instance2 = tbl.Window and tbl.Window.Items and tbl.Window.Items.MainFrame and tbl.Window.Items.MainFrame.Instance
    if instance2 then
        table.insert(list3, instance2)
    end
    if connection.UnusedHolder and connection.UnusedHolder.Instance then
        table.insert(list3, connection.UnusedHolder.Instance)
    end
    for _, value2 in ipairs(list3) do
        local v6, v7, instance3 = ipairs(value2:GetDescendants())
        local v8
        tbl6, v8 = {[5] = tbl6, [9] = nil, [6] = nil, [7] = v5}, coroutine.wrap(forEachYield)
        v8(v6, v7, instance3)
        v5 = v8
        while true do
            local _, v9, _, v10 = 10, v5()
            if v9 then
                instance3 = v10
            end
            if v9 then
                local instance4 = uiRefs and uiRefs.Language and uiRefs.Language.Items and uiRefs.Language.Items.Value and uiRefs.Language.Items.Value.Instance
                if (instance3:IsA("TextLabel") or instance3:IsA("TextButton") or instance3:IsA("TextBox")) and instance3 ~= instance4 then
                    if instance3:GetAttribute("KITI_EnglishText") == nil then
                        local text2 = instance3.Text or ""
                        if tbl.Language == "Russian" then
                            local v11, v12, v13 = pairs(tbl.TextMapRussian)
                            for key, value3 in v11, v12, v13 do
                                v12 = key
                                if value3 == text2 then
                                    text2 = v12
                                else
                                    continue
                                end
                                instance3:SetAttribute("KITI_EnglishText", text2)
                                local attribute = instance3:GetAttribute("KITI_EnglishText") or ""
                                if tbl.Language == "Russian" then
                                    instance3.Text = tbl.TextMapRussian[attribute] or attribute
                                    if instance3:IsA("TextBox") then
                                        local placeholderText = instance3:GetAttribute("KITI_EnglishPlaceholder")
                                        if placeholderText == nil then
                                            text2 = "KITI_EnglishPlaceholder"
                                            instance3:SetAttribute(text2, instance3.PlaceholderText or "")
                                            placeholderText = instance3.PlaceholderText or ""
                                        end
                                        instance3.PlaceholderText = tbl.TextMapRussian[placeholderText] or placeholderText
                                        n3 = 1
                                        break
                                    end
                                    n3 = 1
                                    break
                                else
                                    instance3.Text = attribute
                                    if instance3:IsA("TextBox") then
                                        instance3.PlaceholderText = instance3:GetAttribute("KITI_EnglishPlaceholder") or instance3.PlaceholderText
                                        n3 = 1
                                        break
                                    else
                                        n3 = 1
                                        break
                                    end
                                    n3 = 1
                                    break
                                end
                                n3 = 1
                                break
                            end
                            if n3 > 0 then
                                n3 = n3 - 1
                                if n3 == 0 then
                                    continue
                                else
                                    break
                                end
                            elseif n3 < 0 then
                                n3 = n3 + 1
                                break
                            end
                        end
                        instance3:SetAttribute("KITI_EnglishText", text2)
                    end
                    local attribute = instance3:GetAttribute("KITI_EnglishText") or ""
                    if tbl.Language == "Russian" then
                        instance3.Text = tbl.TextMapRussian[attribute] or attribute
                        if instance3:IsA("TextBox") then
                            local placeholderText = instance3:GetAttribute("KITI_EnglishPlaceholder")
                            if placeholderText == nil then
                                instance3:SetAttribute("KITI_EnglishPlaceholder", instance3.PlaceholderText or "")
                                placeholderText = instance3.PlaceholderText or ""
                            end
                            instance3.PlaceholderText = tbl.TextMapRussian[placeholderText] or placeholderText
                            continue
                        end
                        continue
                    else
                        instance3.Text = attribute
                        if instance3:IsA("TextBox") then
                            instance3.PlaceholderText = instance3:GetAttribute("KITI_EnglishPlaceholder") or instance3.PlaceholderText
                            continue
                        else
                            continue
                        end
                        continue
                    end
                    continue
                end
                continue
            end
            break
        end
        if n3 > 0 then
            n3 = n3 - 1
            if n3 ~= 0 then
                break
            end
        elseif n3 < 0 then
            local _ = n3 + 1
            break
        end
    end
    for _, localizationItem in pairs(tbl.LocalizationItems) do
        for _, value2 in ipairs(localizationItem) do
            pcall(value2)
        end
    end
    if not _LanguageRepass then
        tbl.ApplyLanguage(language)
    end
    if uiRefs and uiRefs.Language then
        pcall(function()
            uiRefs.Language:Set(tbl.Language, true)
        end)
    end
    tbl._LanguageRepass = _LanguageRepass
end;
(function()
    uiRefs.Language = (uiRefs.Settings:AddLabel("Language")):AddDropdown({
        Default = tbl.Language,
        Values = {"English", "Russian"},
        Flag = "InterfaceLanguage",
        Callback = function(value2)
            KITI_InterfaceLanguage = value2 == "Russian" and "Russian" or "English"
            tbl.Language = KITI_InterfaceLanguage
            if uiRefs.Language and uiRefs.Language.Items and uiRefs.Language.Items.Value and uiRefs.Language.Items.Value.Instance then
                local text2 = KITI_InterfaceLanguage
                uiRefs.Language.Items.Value.Instance.Text = text2
            end
            SaveFavoriteStore()
            tbl.ApplyLanguage(KITI_InterfaceLanguage)
        end,
    });
    (uiRefs.Settings:AddLabel("Menu Keybind")):AddKeybind({
        Default = Enum.KeyCode.G,
        Flag = "MenuKeybind",
        Callback = function()
            local menuKeybind = connection.Flags.MenuKeybind
            if menuKeybind and menuKeybind.Key and menuKeybind.Key ~= "None" then
                connection.MenuKeybind = menuKeybind.Key
                tbl3.new({
                    Title = "Settings",
                    Content = "Клавиша меню: " .. string.gsub(tostring(menuKeybind.Key), "Enum%.[%w]+%.", ""),
                    Duration = 3,
                })
            end
        end,
    })
    uiRefs.Settings:AddLabel("Menu Scale"):AddDropdown({
        Default = "Default",
        Values = {"Default", "Large", "Small"},
        Callback = function(value2)
            if tbl5[value2] then
                window:SetSize(tbl5[value2])
                tbl3.new({Title = "Settings", Content = "Размер меню: " .. tostring(value2), Duration = 3})
            end
        end,
    })
    uiRefs.MenuTransparency = uiRefs.Settings:AddLabel("Menu Transparency"):AddSlider({
        Min = 0,
        Max = 80,
        Default = 35,
        Decimals = 0,
        Suffix = "%",
        Flag = "MenuTransparency",
        Callback = function(value2)
            value = math.clamp(tonumber(value2) or 0, 0, 80)
            fn62(value)
        end,
    })
    uiRefs.Theme = uiRefs.Settings:AddLabel("Theme"):AddDropdown({
        Default = "Default",
        Values = {"Default", "White", "Blue", "Pink", "Purple", "Green"},
        Flag = "MenuTheme",
        Callback = function(value2)
            if connection.Themes[value2] then
                text = value2
                connection:ApplyTheme(value2)
                tbl3.new({Title = "Settings", Content = "Theme: " .. value2, Duration = 3})
            end
        end,
    })
    uiRefs.CustomAvatars = uiRefs.Settings:AddLabel("Custom Player Avatars"):AddToggle({
        Default = true,
        Flag = "CustomPlayerAvatars",
        Callback = function(value2)
            customAvatarsEnabled = value2 == true
            if _G.MimkaRefreshAvatars then
                _G.MimkaRefreshAvatars()
            end
            local tbl6 = {
                Title = "Settings",
                Content = customAvatarsEnabled and "Custom PNG avatars enabled" or "Roblox HeadShot avatars enabled",
                Duration = 3,
            }
            tbl3.new(tbl6)
        end,
    })
    uiRefs.Meow = uiRefs.Settings:AddLabel("Meow"):AddDropdown({
        Values = {"None", "Mimi", "Furry", "Koti", "Protogen Bongo"},
        Default = "None",
        Multi = false,
        Flag = "MeowChoice",
        Callback = function(value2)
            meowChoice = (value2 == "Mimi" or value2 == "Furry" or value2 == "Koti" or value2 == "Protogen Bongo") and value2 or "None"
        end,
    })
    fn62(value)
    if connection.ApplyTheme then
        local v5 = connection
        local applyTheme = v5.ApplyTheme
        local v6 = text
        local text2
        if text then
            text2 = v6
        else
            text2 = "Default"
        end
        applyTheme(v5, text2)
    end
end)()
pcall(function()
    uiRefs.Settings.Page:Turn(true)
end)
uiRefs.GenTab = window:AddTab({Name = "General", Icon = "gear"})
pcall(function()
    local page = uiRefs.GenTab.Page and uiRefs.GenTab.Page.Page
    local parent = page and page.Items and page.Items.Inactive and page.Items.Inactive.Instance
    if parent then
        parent.Text = ""
        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "GeneralIcon"
        imageLabel.BackgroundTransparency = 1
        imageLabel.Size = UDim2.new(0, 25, 0, 25)
        imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        imageLabel.Image = "rbxassetid://9562514785"
        imageLabel.ScaleType = Enum.ScaleType.Fit
        imageLabel.ImageColor3 = Color3.fromRGB(245, 242, 238)
        imageLabel.ZIndex = parent.ZIndex + 1
        imageLabel.Parent = parent
    end
end);
(function()
    local flySection = uiRefs.GenTab:AddSection({Name = "Fly", Position = "left"})
    uiRefs.OPFly = tbl.kbTglRow(flySection, "Fly", "OP Fly", {
        Default = false,
        Callback = function(value2)
            if value2 then
                fn34()
                fn51()
            else
                disableFly()
                fn52()
            end
        end,
    })
    uiRefs.FlySpeed = flySection:AddLabel("Fly Speed"):AddTextInput({
        Default = "50",
        Placeholder = "50",
        Callback = function(value2)
            number = tonumber(value2) or 50
            tbl3.new({Title = "Fly", Content = "Speed → " .. number, Duration = 2})
        end,
    })
    local movementSection = uiRefs.GenTab:AddSection({Name = "Movement", Position = "left"})
    movementSection:AddLabel("Walkspeed"):AddTextInput({
        Default = "16",
        Placeholder = "16",
        Callback = function(value2)
            ws_v = tonumber(value2) or 16
            local character = localPlayer.Character
            if character then
                character = character:FindFirstChildOfClass("Humanoid")
            end
            if character then
                character.WalkSpeed = ws_v
            end
            tbl3.new({Title = "Movement", Content = "Walkspeed set.", Duration = 2})
        end,
    })
    local fn63 = function(instance2)
        task.spawn(function()
            local humanoid = instance2:WaitForChild("Humanoid", 10)
            if humanoid then
                local function fn63()
                    if humanoid.Parent and humanoid.Health > 0 then
                        local walkSpeed = tonumber(ws_v) or 16
                        if math.abs(humanoid.WalkSpeed - walkSpeed) > 0.01 then
                            humanoid.WalkSpeed = walkSpeed
                        end
                    end
                end
                fn63()
                humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(fn63)
                task.wait(0.25)
                fn63()
                task.wait(0.75)
                fn63()
            end
        end)
    end
    localPlayer.CharacterAdded:Connect(fn63)
    if localPlayer.Character then
        fn63(localPlayer.Character)
    end
    movementSection:AddLabel("FOV"):AddTextInput({
        Default = "70",
        Placeholder = "70",
        Callback = function(value2)
            fov_v = tonumber(value2) or 70
            local tbl6 = {FieldOfView = fov_v}
            TweenService2:Create(workspace.CurrentCamera, TweenInfo.new(0.5), tbl6):Play()
            tbl3.new({Title = "Movement", Content = "FOV set.", Duration = 2})
        end,
    })
    uiRefs.CtrlTP = tbl.kbTglRow(movementSection, "CtrlTP", "CTRL+Click TP", {
        Default = false,
        Callback = function(value2)
            ctrlTP = value2
        end,
    })
    local noclipSection = uiRefs.GenTab:AddSection({Name = "Noclip", Position = "left"})
    uiRefs.Noclip = tbl.kbTglRow(noclipSection, "Noclip", "Noclip", {
        Default = false,
        Callback = function(value2)
            fn35(value2)
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    local blinkSection = uiRefs.GenTab:AddSection({Name = "Blink", Position = "left"})
    uiRefs.Blink = tbl.kbTglRow(blinkSection, "Blink", "Blink", {
        Default = false,
        Callback = function(anchored)
            blinkOn = anchored
            local character = localPlayer.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Anchored = anchored
                end
            end
            if anchored then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Blink"}
            if anchored then
                anchored = "Enabled."
            end
            tbl6.Content = anchored or "Disabled."
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    blinkSection:AddLabel("Blink Speed"):AddTextInput({
        Default = "32",
        Placeholder = "32",
        Callback = function(value2)
            blinkSpeed = tonumber(value2) or 32
            tbl3.new({Title = "Blink", Content = "Speed → " .. blinkSpeed, Duration = 2})
        end,
    })
    uiRefs.GenTab:AddSection({Name = "Teleport", Position = "right"}):AddLabel("Player Name"):AddTextInput({
        Default = "",
        Placeholder = "Player...",
        Callback = function(value2)
            local player2 = fn33(value2)
            if not player2 or not player2.Character then
                tbl3.new({Title = "Teleport", Content = "Player not found!", Duration = 3})
            else
                local character = localPlayer.Character
                if character then
                    character = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                end
                if character then
                    local cFrame = player2.Character.HumanoidRootPart.CFrame
                    character.CFrame = cFrame + Vector3.new(0, 5, 0)
                end
                tbl3.new({Title = "Teleport", Content = "Teleported to " .. player2.Name, Duration = 3})
            end
        end,
    })
    local miscSection = uiRefs.GenTab:AddSection({Name = "Misc", Position = "right"})
    tbl.kbBtnRow(miscSection, "FpsBoost", {
        Name = "FPS Boost",
        Icon = "lightning-bolt",
        Callback = function()
            local terrain = workspace:FindFirstChildOfClass("Terrain")
            if terrain then
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
                terrain.WaterReflectance = 0
            end
            game.Lighting.GlobalShadows = false
            game.Lighting.FogEnd = 9000000000
            pcall(function()
                settings().Rendering.QualityLevel = 1
            end)
            for _, descendant in pairs(game:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Material = Enum.Material.Plastic
                    descendant.Reflectance = 0
                elseif descendant:IsA("Decal") then
                    descendant.Transparency = 1
                elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                    descendant.Lifetime = NumberRange.new(0)
                end
            end
            for _, descendant in pairs(game.Lighting:GetDescendants()) do
                if descendant:IsA("BlurEffect") or descendant:IsA("SunRaysEffect") or descendant:IsA("ColorCorrectionEffect") or descendant:IsA("BloomEffect") then
                    descendant.Enabled = false
                end
            end
            tbl3.new({Title = "Misc", Content = "FPS Boost applied!", Duration = 3})
        end,
    })
    tbl.kbBtnRow(miscSection, "GetPing", {
        Name = "Get Ping",
        Icon = "chart-line",
        Callback = function()
            tbl3.new({Title = "Ping", Content = math.round(localPlayer:GetNetworkPing() * 1000) .. "ms", Duration = 3})
        end,
    })
    tbl.kbBtnRow(miscSection, "Rejoin", {
        Name = "Rejoin",
        Icon = "arrow-spin-clockwise",
        Callback = function()
            local placeId = game.PlaceId
            local jobId = game.JobId
            tbl3.new({Title = "Rejoin", Content = "Rejoining...", Duration = 3})
            if #Players2:GetPlayers() <= 1 then
                localPlayer:Kick("\nRejoining...")
                task.wait()
                TeleportService:Teleport(placeId, localPlayer)
            else
                TeleportService:TeleportToPlaceInstance(placeId, jobId, localPlayer)
            end
        end,
    })
    uiRefs.AntiFling = tbl.kbTglRow(miscSection, "AntiFling", "AntiFling", {
        Default = false,
        Callback = function(content)
            antiflingOn = content
            if content then
                fn36()
                fn51()
            else
                fn37()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "AntiFling"}
            if content then
                content = "Enabled."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    local clientGhostSection = uiRefs.GenTab:AddSection({Name = "Client Ghost", Position = "right"})
    uiRefs.ClientGhost = tbl.kbTglRow(clientGhostSection, "Ghost", "Client Ghost", {
        Default = false,
        Callback = function(ghostOn)
            tbl.ghostOn = ghostOn
            if ghostOn then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Client Ghost"}
            if ghostOn then
                ghostOn = "Enabled."
            end
            if not ghostOn then
                ghostOn = "Disabled."
            end
            tbl6.Content = ghostOn
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
end)();
(function()
    local folder = workspace:FindFirstChild("ClientVisuals") or Instance.new("Folder", workspace)
    folder.Name = "ClientVisuals"
    local instance2 = nil
    local list3 = {}
    local list4 = {}
    local v5 = nil
    local tbl6 = {Transparency = 50}
    tbl6.Color = Color3.fromRGB(255, 100, 100)
    tbl6.DeleteTexture = false
    local function fn63()
        if instance2 then
            pcall(function()
                instance2:Destroy()
            end)
        end
        instance2 = nil
        list3 = {}
        list4 = {}
        v5 = nil
    end
    local function fn64()
        if instance2 then
            local transparency = tbl6.Transparency / 100
            pcall(function()
                local bodyColors = instance2:FindFirstChildOfClass("BodyColors")
                if bodyColors then
                    bodyColors:Destroy()
                end
            end)
            local count = #list3
            local n3 = 1
            for i = n3, count + 0 do
                local ghost = list3[i].ghost
                pcall(function()
                    if ghost:IsA("BasePart") then
                        ghost.Transparency = transparency
                        ghost.Color = tbl6.Color
                        if tbl6.DeleteTexture then
                            ghost.Material = Enum.Material.SmoothPlastic
                            if ghost:IsA("MeshPart") then
                                ghost.TextureID = ""
                            end
                        end
                    end
                end)
            end
        end
    end
    RunService.RenderStepped:Connect(function()
        if not tbl.ghostOn then
            if instance2 then
                fn63()
            end
        else
            local character = localPlayer.Character
            if not (not character or not character:FindFirstChild("HumanoidRootPart")) then
                if v5 ~= character then
                    fn63()
                    v5 = character
                end
                if not instance2 or instance2.Parent ~= folder then
                    character.Archivable = true
                    instance2 = character:Clone()
                    instance2.Name = "ClientGhost"
                    instance2.Parent = folder
                    list3 = {}
                    local humanoid = instance2:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:Destroy()
                    end
                    local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart:Destroy()
                    end
                    for _, descendant in ipairs(instance2:GetDescendants()) do
                        if descendant:IsA("Script") or descendant:IsA("LocalScript") then
                            descendant:Destroy()
                        end
                        if descendant:IsA("BasePart") then
                            descendant.Anchored = true
                            descendant.CanCollide = false
                            descendant.CanQuery = false
                            descendant.CanTouch = false
                            descendant.Massless = true
                        end
                    end
                    for _, descendant in ipairs(character:GetDescendants()) do
                        if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
                            local instance3
                            if descendant.Parent == character then
                                instance3 = instance2:FindFirstChild(descendant.Name)
                            else
                                instance3 = nil
                                if descendant.Parent:IsA("Accessory") then
                                    local instance4 = instance2:FindFirstChild(descendant.Parent.Name)
                                    instance3 = nil
                                    if instance4 then
                                        instance3 = instance4:FindFirstChild(descendant.Name)
                                    end
                                end
                            end
                            if instance3 and instance3:IsA("BasePart") then
                                local v6 = list3
                                table.insert(v6, {real = descendant, ghost = instance3})
                            end
                        end
                    end
                    fn64()
                end
                local tbl7 = {t = tick(), parts = {}}
                local count = #list3
                local tbl8 = {[5] = nil, [9] = nil, [6] = nil, [7] = nil}
                for i = 1, count + 0 do
                    local v6 = list3[i]
                    tbl7.parts[v6.real] = v6.real.CFrame
                end
                local _, _, _, _ = tbl8[7], tbl8[6], tbl8[9], tbl8[5]
                table.insert(list4, tbl7)
                while true do
                    if #list4 > 0 and tick() - list4[1].t > 2 then
                        table.remove(list4, 1)
                        continue
                    end
                    break
                end
                local n3 = 0
                pcall(function()
                    n3 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
                end)
                local value2 = tick() - math.clamp(n3 / 1000, 0, 2)
                local v6 = list4[#list4]
                local list5 = list4
                local count2 = #list5
                for i = count2, 1, -1 do
                    list5 = i
                    local v7
                    if list4[i].t <= value2 then
                        v7 = list4[list5]
                    else
                        continue
                    end
                    if v7 then
                        local list6 = list3
                        local count3 = #list6
                        for i2 = 1, count3 + 0 do
                            list6 = list3[i2]
                            if v7.parts[list6.real] then
                                list6.ghost.CFrame = v7.parts[list6.real]
                            end
                        end
                    end
                    return
                end
                local _
                if v6 then
                    local list6 = list3
                    local count3 = #list6
                    for i = 1, count3 + 0 do
                        list6 = list3[i]
                        if v6.parts[list6.real] then
                            list6.ghost.CFrame = v6.parts[list6.real]
                        end
                    end
                end
            end
        end
    end)
end)();
(function()
    getgenv().TH = getgenv().TH or {}
    local th = getgenv().TH
    th.TradeValues = th.TradeValues or {}
    th.On = false
    th.LoopThread = nil
    local function fn63(str)
        if not str then
            return ""
        else
            return str:lower():gsub("[%s%_'%.-]", "")
        end
    end
    local function fn64(str, v5)
        if not (not str or not v5) then
            local str2 = str:gsub("<[^>]+>", ""):match("^%s*(.-)%s*$")
            if not (not str2 or #str2 <= 1) then
                th.TradeValues[str2] = v5
                th.TradeValues[fn63(str2)] = v5
                if str2:sub(1, 3) == "C. " then
                    local text2 = "Chroma " .. str2:sub(4)
                    th.TradeValues[text2] = v5
                    th.TradeValues[fn63(text2)] = v5
                elseif str2:sub(1, 7) == "Chroma " then
                    local text2 = "C. " .. str2:sub(8)
                    th.TradeValues[text2] = v5
                    th.TradeValues[fn63(text2)] = v5
                end
            end
        end
    end
    local function fn65(v5)
        local list3 = {
            "https://api.codetabs.com/v1/proxy?quest=" .. v5,
            "https://corsproxy.io/?" .. v5,
            "https://api.allorigins.win/raw?url=" .. v5,
            v5,
        }
        for _, value2 in ipairs(list3) do
            local v6 = nil
            local enabled3 = false
            local v7 = value2
            task.spawn(function()
                local v8, list4 = pcall(function()
                    return game:HttpGet(v7)
                end)
                if v8 and list4 and #list4 > 300 then
                    v6 = list4
                end
                enabled3 = true
            end)
            local v8 = tick()
            while true do
                if not enabled3 and tick() - v8 < 3 then
                    task.wait(0.1)
                    continue
                end
                break
            end
            if v6 then
                return v6
            end
        end
        return nil
    end
    local function fn66(...)
        local v5 = ({...})[1]:gsub("[\r\n]", " ")
        local v6, v7, v8 = v5:gmatch("<div%s+class=stackable>(.-)</div>")
        local v9 = v6
        local v10 = v7
        local v11 = v8
        local n3 = 0
        for key, _ in v9, v10, v11 do
            local str = key:match("Value:%s*([%d,]+)")
            if str then
                local number2 = tonumber((str:gsub(",", "")))
                local v12 = key:match("<b>([^<]+)</b>") or key:match('<span%s+class="[^"]+">([^<]+)</span>') or key:match("<span%s+class=[^>]+>([^<]+)</span>") or key:match("([%w%s%_'%.-]+)%s*<br>%s*Value:")
                if v12 and number2 then
                    fn64(v12, number2)
                    n3 = n3 + 1
                end
            end
        end
        if n3 == 0 then
            for key, value2 in v5:gmatch("<b>([^<]+)</b>.-Value:%s*([%d,]+)") do
                local number2 = tonumber((value2:gsub(",", "")))
                local v12
                if key then
                    v12 = number2
                else
                    v12 = key
                end
                if v12 then
                    fn64(key, number2)
                    n3 = n3 + 1
                end
            end
        end
        return n3
    end
    local function fn67(...)
        local n3 = 0
        for key, value2 in ({...})[1]:gsub("[\r\n]", " "):gmatch('<div%s+class="box"%s+id="([^"]+)".-class="itemvalue">%s*([%d,]+)%s*</span>') do
            local number2 = tonumber((value2:gsub(",", "")))
            local v5
            if key then
                v5 = number2
            else
                v5 = key
            end
            if v5 then
                fn64(key, number2)
                n3 = n3 + 1
            end
        end
        return n3
    end
    local function fn68(v5)
        if not v5 or v5 == 0 then
            return "0"
        elseif 1000000 <= v5 then
            return string.format("%.1fM", v5 / 1000000)
        elseif v5 >= 1000 then
            return string.format("%.1fK", v5 / 1000)
        else
            return tostring(v5)
        end
    end
    local function fn69(v5)
        if v5 >= 100000 then
            return Color3.fromRGB(255, 50, 50)
        elseif 10000 <= v5 then
            return Color3.fromRGB(255, 100, 50)
        elseif v5 >= 1000 then
            return Color3.fromRGB(255, 215, 0)
        elseif 100 <= v5 then
            return Color3.fromRGB(0, 200, 100)
        elseif 10 <= v5 then
            return Color3.fromRGB(100, 200, 255)
        else
            return Color3.fromRGB(180, 180, 180)
        end
    end
    local function fn70(v5)
        if not v5 then
            return 0
        elseif th.TradeValues[v5] then
            return th.TradeValues[v5]
        else
            local v6 = fn63(v5)
            if th.TradeValues[v6] then
                return th.TradeValues[v6]
            else
                return 0
            end
        end
    end
    local function fn71(parent, v5)
        if parent then
            local valueLabel = parent:FindFirstChild("ValueLabel")
            if valueLabel then
                valueLabel:Destroy()
            end
            local v6 = fn70(v5)
            if v6 ~= 0 then
                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "ValueLabel"
                textLabel.Size = UDim2.new(0.96, 0, 0, 16)
                textLabel.Position = UDim2.new(0.02, 0, 1, -18)
                textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                textLabel.BackgroundTransparency = 0.25
                textLabel.Text = "$" .. fn68(v6)
                textLabel.TextColor3 = fn69(v6)
                textLabel.TextScaled = true
                textLabel.Font = Enum.Font.GothamBold
                textLabel.ZIndex = 1000
                textLabel.Parent = parent
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 4)
                corner.Parent = textLabel
            end
        end
    end
    local function fn72(instance2)
        if not (not instance2 or not instance2:IsA("GuiObject")) then
            local container = instance2:FindFirstChild("Container") or instance2
            local itemName = instance2:FindFirstChild("ItemName")
            local name = nil
            if itemName then
                local label = itemName:FindFirstChild("Label")
                name = nil
                if label and label.Text ~= "" and label.Text ~= "Loading..." then
                    name = label.Text
                end
            end
            if not name and fn70(instance2.Name) > 0 then
                name = instance2.Name
            end
            if not name then
                local v5, v6, v7 = ipairs(instance2:GetDescendants())
                for _, value2 in v5, v6, v7 do
                    v7 = value2
                    local text2
                    if value2:IsA("TextLabel") and value2.Name ~= "ValueLabel" and fn70(value2.Text) > 0 then
                        text2 = v7.Text
                    else
                        continue
                    end
                    if text2 then
                        fn71(container, text2)
                    end
                    return
                end
                local _
            end
            if name then
                fn71(container, name)
            end
        end
    end
    local function fn73(instance2)
        if instance2 then
            local container = instance2:FindFirstChild("Container") or instance2
            for _, child in ipairs(container:GetChildren()) do
                if child:IsA("GuiObject") then
                    fn72(child)
                end
            end
        end
    end
    local function fn74()
        local mainGUI = localPlayer:FindFirstChild("PlayerGui") and localPlayer.PlayerGui:FindFirstChild("MainGUI")
        if mainGUI then
            for _, descendant in ipairs(mainGUI:GetDescendants()) do
                if descendant:IsA("GuiObject") and descendant:FindFirstChild("ItemName") and descendant:FindFirstChild("Container") then
                    fn72(descendant)
                end
            end
        end
    end
    local function fn75()
        while true do
            if th.On then
                task.wait(0.5)
                pcall(function()
                    fn74()
                    local playerGui = localPlayer:FindFirstChild("PlayerGui")
                    if playerGui then
                        local list3 = {playerGui:FindFirstChild("TradeGUI"), playerGui:FindFirstChild("TradeGUI_Phone")}
                        for _, value2 in ipairs(list3) do
                            if value2 then
                                local container = value2:FindFirstChild("Container")
                                if container then
                                    local trade = container:FindFirstChild("Trade")
                                    if trade then
                                        fn73(trade:FindFirstChild("YourOffer"))
                                        fn73(trade:FindFirstChild("TheirOffer"))
                                    end
                                end
                            end
                        end
                    end
                end)
                continue
            end
            break
        end
        th.LoopThread = nil
    end
    function th.Start()
        if not th.On then
            th.On = true
            th.LoopThread = task.spawn(fn75)
        end
    end
    function th.Stop()
        th.On = false
        if th.LoopThread then
            task.cancel(th.LoopThread)
            th.LoopThread = nil
        end
    end;
    (function()
        task.spawn(function()
            local list3 = {
                {url = "https://mm2values.com/?p=godly", type = "values"},
                {url = "https://mm2values.com/?p=chroma", type = "values"},
                {url = "https://mm2values.com/?p=ancient", type = "values"},
                {url = "https://mm2values.com/?p=unique", type = "values"},
                {url = "https://mm2values.com/?p=legend", type = "values"},
                {url = "https://mm2values.com/?p=rare", type = "values"},
                {url = "https://mm2values.com/?p=vintage", type = "values"},
                {url = "https://mm2values.com/?p=pets", type = "values"},
                {url = "https://mm2values.com/?p=misc", type = "values"},
                {url = "https://mm2checker.com/godlies.html", type = "checker"},
                {url = "https://mm2checker.com/ancients.html", type = "checker"},
                {url = "https://mm2checker.com/vintages.html", type = "checker"},
                {url = "https://mm2checker.com/legendaries.html", type = "checker"},
                {url = "https://mm2checker.com/pets.html", type = "checker"},
                {url = "https://mm2checker.com/other.html", type = "checker"},
            }
            local n3 = 0
            for _, value2 in ipairs(list3) do
                task.spawn(function()
                    local v5 = fn65(value2.url)
                    if v5 then
                        if value2.type == "values" then
                            fn66(v5)
                        else
                            fn67(v5)
                        end
                    end
                    n3 = n3 + 1
                end)
            end
            local v5 = tick()
            while true do
                if n3 < #list3 and tick() - v5 < 4 then
                    task.wait(0.1)
                    continue
                end
                break
            end
        end)
    end)()
end)();
(function()
    AutoFarmSettings = AutoFarmSettings or {
        AutoFarmEnabled = false,
        FarmMode = "Underground",
        TweenSpeed = 25,
        AutoReset = false,
        AvoidMurder = false,
        UndergroundOffset = 4,
        MaxDistance = 600,
        CoinLimit = 40,
    }
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local localPlayer2 = Players.LocalPlayer
    local v5 = AutoFarmSettings
    local tbl6 = {isFarming = false, isActivelyFlying = false, currentTargetCoin = nil}
    tbl6.ignoredCoins = {}
    tbl6.currentTween = nil
    local function fn63(instance2)
        if not instance2 then
            return nil
        else
            local torso = instance2:FindFirstChild("Torso")
            if not torso then
                torso = instance2:FindFirstChild("LowerTorso")
            end
            if not torso then
                torso = instance2:FindFirstChild("HumanoidRootPart")
            end
            return torso
        end
    end
    local function fn64()
        local number2, v6 = pcall(function()
            local mainGUI = localPlayer2.PlayerGui:FindFirstChild("MainGUI")
            if not mainGUI then
                return 0
            else
                local game2 = mainGUI:FindFirstChild("Game")
                if not game2 then
                    return 0
                else
                    local coinBags = game2:FindFirstChild("CoinBags")
                    if not coinBags then
                        return 0
                    else
                        local container = coinBags:FindFirstChild("Container")
                        if not container then
                            return 0
                        else
                            local coin = container:FindFirstChild("Coin")
                            if not coin then
                                return 0
                            else
                                local currencyFrame = coin:FindFirstChild("CurrencyFrame")
                                if not currencyFrame then
                                    return 0
                                else
                                    local icon = currencyFrame:FindFirstChild("Icon")
                                    if not icon then
                                        return 0
                                    else
                                        local coins = icon:FindFirstChild("Coins")
                                        if not coins then
                                            return 0
                                        else
                                            return coins.Text
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        if number2 then
            number2 = tonumber(v6) or 0
        end
        return number2 or 0
    end
    local function fn65()
        local playerGui = localPlayer2:FindFirstChild("PlayerGui")
        if not playerGui then
            return false
        else
            local victory = playerGui:FindFirstChild("Victory")
            if victory then
                for _, child in pairs(victory:GetChildren()) do
                    if child:IsA("GuiObject") and child.Visible then
                        return true
                    end
                end
            end
            return false
        end
    end
    local function fn66()
        local playerGui = localPlayer2:FindFirstChild("PlayerGui")
        if playerGui then
            local mainGUI = playerGui:FindFirstChild("MainGUI")
            local lobby = mainGUI and mainGUI:FindFirstChild("Lobby")
            local dock
            if lobby then
                dock = mainGUI.Lobby:FindFirstChild("Dock")
            else
                dock = lobby
            end
            if dock then
                local coinBags = mainGUI.Lobby.Dock:FindFirstChild("CoinBags")
                if coinBags then
                    local fullBagNotification = coinBags:FindFirstChild("FullBagNotification")
                    if fullBagNotification then
                        fullBagNotification = fullBagNotification.Visible
                    end
                    if fullBagNotification then
                        return true
                    end
                end
            end
        end
        return false
    end
    local function fn67()
        if not v5.AvoidMurder then
            return false
        else
            local character = localPlayer2.Character
            if not character then
                return false
            else
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    return false
                else
                    for _, player2 in pairs(Players:GetPlayers()) do
                        if player2 ~= localPlayer2 and player2.Character then
                            local humanoidRootPart2 = player2.Character:FindFirstChild("HumanoidRootPart")
                            local backpack = player2:FindFirstChild("Backpack")
                            if humanoidRootPart2 then
                                humanoidRootPart2 = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= 10
                            end
                            if humanoidRootPart2 then
                                if player2.Character:FindFirstChild("Knife") then
                                    return true
                                else
                                    if backpack then
                                        backpack = backpack:FindFirstChild("Knife")
                                    end
                                    if backpack then
                                        return true
                                    end
                                end
                            end
                        end
                    end
                    return false
                end
            end
        end
    end
    local function fn68(v6)
        local v7, v8, item = pairs(workspace:GetDescendants())
        local v9 = coroutine.wrap(forEachYield)
        v9(v7, v8, item)
        while true do
            local instance2 = nil
            local _, v10, _, v11 = 2, v9()
            if v10 then
                item = v11
            end
            if v10 then
                if item.Name == "CoinContainer" then
                    break
                else
                    continue
                end
            end
            if not instance2 then
                return nil
            else
                local v12, v13, v14 = pairs(instance2:GetChildren())
                local value2 = 1 / 0
                local v15 = nil
                for _, value3 in v12, v13, v14 do
                    if value3.Name == "Coin_Server" and value3:IsA("BasePart") and not tbl6.ignoredCoins[value3] then
                        local magnitude = (v6.Position - value3.Position).Magnitude
                        if magnitude < value2 and magnitude <= v5.MaxDistance then
                            value2 = magnitude
                            v15 = value3
                        end
                    end
                end
                return v15
            end
        end
        local instance2 = item
        if not item then
            return nil
        else
            local v10, v11, v12 = pairs(instance2:GetChildren())
            local value2 = 1 / 0
            local v13 = nil
            for _, value3 in v10, v11, v12 do
                if value3.Name == "Coin_Server" and value3:IsA("BasePart") and not tbl6.ignoredCoins[value3] then
                    local magnitude = (v6.Position - value3.Position).Magnitude
                    if magnitude < value2 and magnitude <= v5.MaxDistance then
                        value2 = magnitude
                        v13 = value3
                    end
                end
            end
            return v13
        end
    end
    local function fn69(instance2)
        if instance2 then
            local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then
                return CFrame.Angles(0, 0, 0)
            else
                if not humanoidRootPart:FindFirstChild("FarmBV") then
                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Name = "FarmBV"
                    bodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.Parent = humanoidRootPart
                end
                local farmBG = humanoidRootPart:FindFirstChild("FarmBG")
                if not farmBG then
                    farmBG = Instance.new("BodyGyro")
                    farmBG.Name = "FarmBG"
                    farmBG.MaxTorque = Vector3.new(1 / 0, 1 / 0, 1 / 0)
                    farmBG.P = 50000
                    farmBG.Parent = humanoidRootPart
                    local _, v6 = humanoidRootPart.CFrame:ToOrientation()
                    local value2 = CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0, v6, 0)
                    local angles = CFrame.Angles
                    farmBG.CFrame = value2 * angles(-1.5707963267948966, 0, 0)
                end
                return farmBG.CFrame.Rotation
            end
        end
    end
    local function fn70()
        local character = localPlayer2.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                if humanoidRootPart:FindFirstChild("FarmBV") then
                    humanoidRootPart.FarmBV:Destroy()
                end
                if humanoidRootPart:FindFirstChild("FarmBG") then
                    humanoidRootPart.FarmBG:Destroy()
                end
                if humanoidRootPart.Anchored then
                    humanoidRootPart.Anchored = false
                end
            end
        end
    end
    local function fn71()
        local character = localPlayer2.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
            for _, descendant in pairs(character:GetDescendants()) do
                if descendant:IsA("BasePart") and descendant.CanCollide then
                    descendant.CanCollide = false
                end
            end
        end
    end
    local function fn72(v6, instance2, v7, v8, v9)
        local magnitude = (v8.Position - v6).Magnitude
        local currentTween = TweenService:Create(v7, TweenInfo.new(magnitude / v5.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(v6) * v9})
        tbl6.currentTween = currentTween
        local enabled3 = false
        currentTween:Play()
        local connection4 = nil
        connection4 = RunService.Heartbeat:Connect(function()
            if not tbl6.isFarming or not instance2 or not instance2:IsDescendantOf(workspace) then
                currentTween:Cancel()
                if connection4 then
                    connection4:Disconnect()
                end
            else
                local magnitude2 = (v8.Position - v6).Magnitude
                if firetouchinterest then
                    pcall(function()
                        firetouchinterest(v8, instance2, 0)
                        firetouchinterest(v8, instance2, 1)
                    end)
                end
                if magnitude2 <= 1.5 then
                    enabled3 = true
                    currentTween:Cancel()
                    if connection4 then
                        connection4:Disconnect()
                    end
                end
            end
        end)
        while true do
            if connection4 and connection4.Connected then
                RunService.Heartbeat:Wait()
                continue
            end
            break
        end
        return enabled3
    end
    local function fn73(instance2)
        if not instance2 or not instance2.Parent or not instance2:FindFirstChild("TouchInterest") then
            return false
        else
            local character = localPlayer2.Character
            if not character then
                return false
            else
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoidRootPart or not humanoid then
                    return false
                else
                    local position = instance2.Position
                    local value2 = position + Vector3.new(0, 2, 0)
                    if (humanoidRootPart.Position - value2).Magnitude < 5 then
                        return true
                    else
                        if tbl6.currentTween then
                            pcall(function()
                                tbl6.currentTween:Cancel()
                            end)
                        end
                        tbl6.currentTween = TweenService:Create(humanoidRootPart, TweenInfo.new((humanoidRootPart.Position - value2).Magnitude / v5.TweenSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(value2)})
                        humanoid.Sit = true
                        tbl6.currentTween:Play()
                        local enabled3 = false
                        local connection4 = nil
                        connection4 = tbl6.currentTween.Completed:Connect(function()
                            enabled3 = true
                            if connection4 then
                                connection4:Disconnect()
                            end
                        end)
                        local v6 = tick()
                        while true do
                            if not enabled3 and tbl6.isFarming then
                                task.wait(0.1)
                                if not instance2 or not instance2.Parent or not instance2:FindFirstChild("TouchInterest") then
                                    break
                                elseif tick() - v6 > 30 then
                                    if tbl6.currentTween then
                                        pcall(function()
                                            tbl6.currentTween:Cancel()
                                        end)
                                    end
                                    humanoid.Sit = false
                                    return false
                                end
                            else
                                humanoid.Sit = false
                                return enabled3
                            end
                        end
                        if tbl6.currentTween then
                            pcall(function()
                                tbl6.currentTween:Cancel()
                            end)
                        end
                        humanoid.Sit = false
                        return false
                    end
                end
            end
        end
    end
    local function fn74(instance2)
        if not (not instance2 or not instance2.Parent) then
            local humanoidRootPart = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                pcall(function()
                    firetouchinterest(humanoidRootPart, instance2, 0)
                    task.wait(0.05)
                    firetouchinterest(humanoidRootPart, instance2, 1)
                end)
            end
        end
    end
    local function fn75()
        if not tbl6.isFarming then
            tbl6.isFarming = true
            table.clear(tbl6.ignoredCoins)
            task.spawn(function()
                while true do
                    if tbl6.isFarming then
                        task.wait()
                        if not pcall(function()
                            if fn67() then
                                tbl6.isActivelyFlying = false
                                tbl6.currentTargetCoin = nil
                                fn70()
                                local character = localPlayer2.Character
                                if character then
                                    local humanoid = character:FindFirstChild("Humanoid")
                                    if humanoid then
                                        humanoid.Sit = false
                                    end
                                end
                                task.wait(1)
                            else
                                local character = localPlayer2.Character
                                if character then
                                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                                    local v6 = fn63(character)
                                    local humanoid = character:FindFirstChild("Humanoid")
                                    if not humanoidRootPart or not v6 or not humanoid or humanoid.Health <= 0 then
                                        tbl6.isActivelyFlying = false
                                        tbl6.currentTargetCoin = nil
                                        fn70()
                                        task.wait(1)
                                    elseif fn65() or fn66() then
                                        tbl6.isActivelyFlying = false
                                        tbl6.currentTargetCoin = nil
                                        fn70()
                                        if humanoid then
                                            humanoid.Sit = false
                                        end
                                        task.wait(1)
                                    else
                                        if v5.AutoReset then
                                            local v7 = fn64()
                                            if v5.CoinLimit <= v7 then
                                                humanoid.Health = 0
                                                task.wait(5)
                                                return
                                            end
                                        end
                                        local currentTargetCoin = fn68(v6)
                                        if not currentTargetCoin or not currentTargetCoin:IsDescendantOf(workspace) then
                                            tbl6.isActivelyFlying = false
                                            tbl6.currentTargetCoin = nil
                                            fn70()
                                            if humanoid then
                                                humanoid.Sit = false
                                            end
                                            task.wait(0.5)
                                        else
                                            tbl6.isActivelyFlying = true
                                            tbl6.currentTargetCoin = currentTargetCoin
                                            local isFarming
                                            if v5.FarmMode == "Underground" then
                                                fn71()
                                                local v7 = fn69(character)
                                                isFarming = fn72(currentTargetCoin.Position - Vector3.new(0, v5.UndergroundOffset, 0), currentTargetCoin, humanoidRootPart, v6, v7)
                                            else
                                                isFarming = false
                                                if v5.FarmMode == "Sit" then
                                                    isFarming = fn73(currentTargetCoin)
                                                    if isFarming and tbl6.isFarming and humanoid.Health > 0 then
                                                        fn74(currentTargetCoin)
                                                    end
                                                end
                                            end
                                            if isFarming then
                                                isFarming = tbl6.isFarming
                                            end
                                            if isFarming then
                                                isFarming = humanoid.Health > 0
                                            end
                                            if isFarming then
                                                tbl6.ignoredCoins[currentTargetCoin] = true
                                                task.delay(5, function()
                                                    tbl6.ignoredCoins[currentTargetCoin] = nil
                                                end)
                                                task.wait(0.2)
                                            end
                                            tbl6.currentTargetCoin = nil
                                        end
                                    end
                                end
                            end
                        end) then
                            tbl6.isActivelyFlying = false
                            tbl6.currentTargetCoin = nil
                            fn70()
                            task.wait(1)
                            continue
                        else
                            continue
                        end
                        continue
                    end
                    break
                end
            end)
        end
    end
    local function fn76()
        tbl6.isFarming = false
        tbl6.isActivelyFlying = false
        tbl6.currentTargetCoin = nil
        if tbl6.currentTween then
            pcall(function()
                tbl6.currentTween:Cancel()
            end)
            tbl6.currentTween = nil
        end
        fn70()
        local character = localPlayer2.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
                humanoid.Sit = false
            end
        end
    end
    RunService.Stepped:Connect(function()
        if not (not tbl6.isFarming or not tbl6.isActivelyFlying or v5.FarmMode ~= "Underground") then
            local character = localPlayer2.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = true
                end
                for _, descendant in pairs(character:GetDescendants()) do
                    if descendant:IsA("BasePart") and descendant.CanCollide then
                        descendant.CanCollide = false
                    end
                end
            end
        end
    end)
    getgenv().KITI_SetAutoFarm = function(v6)
        if v6 then
            fn75()
        else
            fn76()
        end
    end
end)();
(function()
    getfenv()
    local mM2Tab = window:AddTab({Name = "MM2", Icon = "crosshairs"})
    local eSPSection = mM2Tab:AddSection({Name = "ESP", Position = "left"})
    uiRefs.PlayersESP = tbl.kbTglRow(eSPSection, "PlayersESP", "Players", {
        Default = false,
        Callback = function(value2)
            enabled = value2
            if not value2 then
                fn28()
            end
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.GunESP = tbl.kbTglRow(eSPSection, "GunESP", "Dropped Gun", {
        Default = false,
        Callback = function(value2)
            gunESP = value2
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.TrapsESP = tbl.kbTglRow(eSPSection, "TrapsESP", "Traps", {
        Default = false,
        Callback = function(value2)
            trapESP = value2
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    local sheriffSection = mM2Tab:AddSection({Name = "Sheriff", Position = "left"})
    tbl.kbBtnRow(sheriffSection, "ShootMurd", {
        Name = "Shoot Murderer",
        Icon = "crosshairs",
        Callback = function()
            if fn12() ~= localPlayer then
                tbl3.new({Title = "Error", Content = "You are not sheriff.", Duration = 3})
            else
                fn30()
                tbl3.new({Title = "Shot", Content = "Fired shot!", Duration = 3})
            end
        end,
    })
    uiRefs.AutoShoot = tbl.kbTglRow(sheriffSection, "AutoShoot", "Auto-shoot", {
        Default = false,
        Callback = function(content)
            autoShoot = content
            if content then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Auto-shoot"}
            if content then
                content = "Enabled."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    uiRefs.SilentAim = tbl.kbTglRow(sheriffSection, "SilentAim", "SilentAim", {
        Default = false,
        Callback = function(content)
            silentAimEnabled = content
            if content then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "SilentAim"}
            if content then
                content = "Enabled."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    tbl.kbBtn("SilentShoot", function()
        fn31()
    end)
    tbl.kb.SilentShoot.display = "Shoot"
    tbl.kb.SilentShoot.fireOnPress = true
    uiRefs.ForceShoot = tbl.kbTglRow(sheriffSection, "ForceShoot", "ForceShoot", {
        Default = false,
        Callback = function(content)
            forceShotEnabled = content
            if content then
                fn32()
                fn51()
            else
                fsForceStop()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "ForceShoot"}
            if content then
                content = "Enabled (shoot on click)."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    sheriffSection:AddLabel("Shoot Offset"):AddTextInput({
        Default = "1",
        Placeholder = "1",
        Callback = function(value2)
            shootOff = tonumber(value2) or 1
            tbl3.new({Title = "Sheriff", Content = "Offset → " .. shootOff, Duration = 2})
        end,
    })
    sheriffSection:AddLabel("S.Aim Offset"):AddTextInput({
        Default = "2.8",
        Placeholder = "2.8",
        Callback = function(value2)
            offset = tonumber(value2) or 2.8
            tbl3.new({Title = "SilentAim", Content = "Offset → " .. offset, Duration = 2})
        end,
    })
    local murdererSection = mM2Tab:AddSection({Name = "Murderer", Position = "right"})
    tbl.kbBtnRow(murdererSection, "KnifeThrow", {
        Name = "Knife Throw to Nearest",
        Icon = "sword",
        Callback = function()
            if fn11() ~= localPlayer then
                tbl3.new({Title = "Error", Content = "You are not murderer.", Duration = 3})
            else
                local character = localPlayer.Character
                if character then
                    if not character:FindFirstChild("Knife") then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if localPlayer.Backpack:FindFirstChild("Knife") then
                            humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Knife"))
                        else
                            tbl3.new({Title = "Error", Content = "You don't have the knife..?", Duration = 3})
                            return
                        end
                    end
                    local player2 = fn13()
                    if not player2 or not player2.Character then
                        tbl3.new({Title = "Error", Content = "Can't find a player!?", Duration = 3})
                    else
                        pcall(function()
                            local v5 = fn26
                            character.Knife.Events.KnifeThrown:FireServer(CFrame.new(character.RightHand.Position), CFrame.new(v5(player2, shootOff + 1)))
                        end)
                        tbl3.new({Title = "Knife", Content = "Thrown at " .. player2.Name, Duration = 3})
                    end
                end
            end
        end,
    })
    uiRefs.AutoKnife = tbl.kbTglRow(murdererSection, "AutoKnife", "Auto Knife Throw", {
        Default = false,
        Callback = function(value2)
            if value2 then
                enableAutoKnife()
                fn51()
            else
                disableAutoKnife()
                fn52()
            end
        end,
    })
    uiRefs.KillAura = tbl.kbTglRow(murdererSection, "KillAura", "KillAura", {
        Default = false,
        Callback = function(value2)
            if value2 then
                enableKillAura()
                fn51()
            else
                disableKillAura()
                fn52()
            end
        end,
    })
    uiRefs.AntiAim = tbl.kbTglRow(murdererSection, "AntiAim", "AntiAim", {
        Default = false,
        Callback = function(value2)
            if value2 then
                enableAntiAim()
                fn51()
            else
                enabled2 = false
                disableAntiAim()
                fn52()
            end
        end,
    })
    tbl.kbBtnRow(murdererSection, "KillNearest", {
        Name = "Kill Nearest",
        Icon = "sword",
        Callback = function()
            if fn11() ~= localPlayer then
                tbl3.new({Title = "Error", Content = "You are not murderer.", Duration = 3})
            else
                fn15()
            end
        end,
    })
    tbl.kbBtnRow(murdererSection, "KillEveryone", {
        Name = "Kill Everyone",
        Icon = "sword",
        Callback = function()
            if fn11() ~= localPlayer then
                tbl3.new({Title = "Error", Content = "You are not murderer.", Duration = 3})
            else
                fn29()
            end
        end,
    })
    local flingSection = mM2Tab:AddSection({Name = "Fling", Position = "right"})
    tbl.kbBtnRow(flingSection, "FlingSher", {
        Name = "Fling Sheriff",
        Icon = "arrow-rotate-right",
        Callback = function()
            local v5 = fn12()
            if not v5 then
                tbl3.new({Title = "Error", Content = "No sheriff.", Duration = 3})
            else
                task.spawn(fn14, v5)
            end
        end,
    })
    tbl.kbBtnRow(flingSection, "FlingMurd", {
        Name = "Fling Murderer",
        Icon = "arrow-rotate-right",
        Callback = function()
            local v5 = fn11()
            if not v5 then
                tbl3.new({Title = "Error", Content = "No murderer.", Duration = 3})
            else
                task.spawn(fn14, v5)
            end
        end,
    })
    local voteDuperSection = mM2Tab:AddSection({Name = "Vote Duper", Position = "left"})
    uiRefs.VoteDuper = tbl.kbTglRow(voteDuperSection, "VoteDuper", "Vote Duper", {
        Default = false,
        Callback = function(content)
            voteDupeEnabled = content
            if content then
                fn24()
                fn23()
                fn51()
            else
                disableVoteDupe()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Vote Duper"}
            if content then
                content = "Enabled."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    local parent = voteDuperSection.Section.Items.Content.Instance
    local frame = Instance.new("Frame")
    frame.Name = "VotePadCards"
    frame.Size = UDim2.new(1, 0, 0, 130)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 6, 0, 0)
    gridLayout.CellSize = UDim2.new(0.333, -4, 0, 126)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = frame
    local list3 = {}
    local tbl6 = {}
    local function fn63(v5, backgroundTransparency)
        local theme = connection.Theme or {}
        local stroke = v5.Stroke
        local color = theme.Accent
        if not color then
            color = Color3.fromRGB(224, 116, 24)
        end
        stroke.Color = color
        v5.Stroke.Enabled = backgroundTransparency
        v5.Stroke.Thickness = backgroundTransparency and 2 or 1
        local card = v5.Card
        local backgroundColor3
        if backgroundTransparency then
            backgroundColor3 = theme.Element
            if not backgroundColor3 then
                backgroundColor3 = Color3.fromRGB(15, 13, 11)
            end
        else
            backgroundColor3 = backgroundTransparency
        end
        if not backgroundColor3 then
            backgroundColor3 = theme.Inline or Color3.fromRGB(15, 13, 11)
        end
        card.BackgroundColor3 = backgroundColor3
        local card2 = v5.Card
        if backgroundTransparency then
            backgroundTransparency = 0.02
        end
        if not backgroundTransparency then
            backgroundTransparency = 0.18
        end
        card2.BackgroundTransparency = backgroundTransparency
    end
    for layoutOrder = 1, 3 do
        local textButton = Instance.new("TextButton")
        textButton.Name = "VoteCard" .. layoutOrder
        textButton.LayoutOrder = layoutOrder
        textButton.AutoButtonColor = false
        textButton.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
        textButton.BackgroundTransparency = 0.18
        textButton.BorderSizePixel = 0
        textButton.Text = ""
        textButton.ZIndex = 5
        textButton.Parent = frame
        Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 7)
        local stroke = Instance.new("UIStroke", textButton)
        stroke.Color = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Thickness = 2
        stroke.Enabled = false
        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "MapIcon"
        imageLabel.Size = UDim2.new(0, 64, 0, 68)
        imageLabel.Position = UDim2.new(0.5, -32, 0, 5)
        imageLabel.BackgroundColor3 = Color3.fromRGB(10, 9, 8)
        imageLabel.BackgroundTransparency = 0.15
        imageLabel.BorderSizePixel = 0
        imageLabel.ScaleType = Enum.ScaleType.Crop
        imageLabel.ZIndex = 6
        imageLabel.Parent = textButton
        Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(0, 5)
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "MapName"
        textLabel.Size = UDim2.new(1, -8, 0, 20)
        textLabel.Position = UDim2.new(0, 4, 0, 76)
        textLabel.BackgroundTransparency = 1
        textLabel.Font = Enum.Font.GothamBold
        textLabel.Text = "Searching..."
        textLabel.TextColor3 = Color3.fromRGB(245, 242, 238)
        textLabel.TextSize = 10
        textLabel.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel.ZIndex = 6
        textLabel.Parent = textButton
        local textLabel2 = Instance.new("TextLabel")
        textLabel2.Name = "Votes"
        textLabel2.Size = UDim2.new(1, -8, 0, 16)
        textLabel2.Position = UDim2.new(0, 4, 0, 99)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Font = Enum.Font.Gotham
        textLabel2.Text = "Votes: --"
        textLabel2.TextColor3 = Color3.fromRGB(190, 185, 180)
        textLabel2.TextSize = 10
        textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel2.ZIndex = 6
        textLabel2.Parent = textButton
        list3[layoutOrder] = {Card = textButton, Stroke = stroke, Icon = imageLabel, Map = textLabel, Votes = textLabel2, Pad = nil}
        local v5 = layoutOrder
        textButton.Activated:Connect(function()
            local instance2 = tbl6[v5]
            if not (not instance2 or not instance2.Parent) then
                selectedVotePad = instance2
                voteMapName = fn19(instance2)
                for _, value2 in ipairs(list3) do
                    local v6 = selectedVotePad
                    fn63(value2, value2.Pad == v6)
                end
                tbl3.new({
                    Title = "Vote Duper",
                    Content = "Selected: " .. (voteMapName ~= "" and voteMapName or "Unknown map"),
                    Duration = 2,
                })
            end
        end)
    end
    local function fn64()
        local list4 = fn22()
        for i, value2 in ipairs(list3) do
            local pad = list4[i]
            tbl6[i] = pad
            value2.Pad = pad
            local visible = pad ~= nil
            value2.Card.Visible = visible
            if pad then
                local v5 = fn19(pad)
                local text2 = fn20(pad)
                value2.Icon.Image = fn21(pad)
                local map = value2.Map
                local v6 = v5 ~= ""
                if not v6 then
                    v5 = v6
                end
                map.Text = v5 or "Unknown map"
                local votes = value2.Votes
                local v7 = text2 ~= ""
                if not v7 then
                    text2 = v7
                end
                if not text2 then
                    text2 = "Votes: --"
                end
                votes.Text = text2
                fn63(value2, pad == selectedVotePad)
            end
        end
        local v5, v6, v7 = ipairs(list4)
        local v8 = coroutine.wrap(forEachYield)
        v8(v5, v6, v7)
        local enabled3
        while true do
            enabled3 = false
            local _, v9, _, v10 = 5, v8()
            if v9 then
                v7 = v10
            end
            local enabled4
            if v9 then
                if v7 == selectedVotePad then
                    enabled4 = true
                else
                    continue
                end
            else
                break
            end
            if selectedVotePad and not enabled4 then
                selectedVotePad = nil
                voteMapName = ""
            end
            return
        end
        if selectedVotePad and not enabled3 then
            selectedVotePad = nil
            voteMapName = ""
        end
    end
    fn64()
    local n3 = 0
    RunService.Heartbeat:Connect(function(dt)
        n3 = n3 + dt
        if n3 >= 0.35 then
            n3 = 0
            fn64()
        end
    end)
    local toolsSection = mM2Tab:AddSection({Name = "Tools", Position = "right"})
    uiRefs.AutoGetGun = tbl.kbTglRow(toolsSection, "AutoGetGun", "Auto-get Dropped Gun", {
        Default = false,
        Callback = function(value2)
            autoGetGun = value2
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.GunPickupMethod = toolsSection:AddLabel("Pickup Method"):AddDropdown({
        Default = "Remote",
        Values = {"Remote", "FastTP"},
        Callback = function(value2)
            gunPickupMethod = value2
            tbl3.new({Title = "Gun Pickup", Content = "Method: " .. value2, Duration = 2})
        end,
    })
    uiRefs.OffDamageWater = tbl.kbTglRow(toolsSection, "WaterProt", "OffDamageWater", {
        Default = false,
        Callback = function(value2)
            offDamageWater = value2
            if value2 then
                fn55()
                fn51()
                tbl3.new({Title = "Water Protection", Content = "Water damage OFF.", Duration = 2})
            else
                fn56()
                fn52()
                tbl3.new({Title = "Water Protection", Content = "Water damage ON.", Duration = 2})
            end
        end,
    })
    local savedFadeGuis = ReplicatedStorage:FindFirstChild("SavedFadeGuis")
    if not savedFadeGuis then
        savedFadeGuis = Instance.new("Folder")
        savedFadeGuis.Name = "SavedFadeGuis"
        savedFadeGuis.Parent = ReplicatedStorage
    end
    local tbl7 = {CameraFade = true, Fade = true, SpawnFade = true}
    local list4 = {}
    local connection4 = nil
    local function fn65(instance2)
        if instance2:IsA("Instance") then
            if not instance2:IsDescendantOf(savedFadeGuis) then
                if tbl7[instance2.Name] then
                    if not list4[instance2] then
                        list4[instance2] = instance2.Parent
                    end
                    instance2.Parent = savedFadeGuis
                end
            end
        end
    end
    local function fn66()
        local playerGui = localPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            for _, descendant in ipairs(playerGui:GetDescendants()) do
                fn65(descendant)
            end
            if not connection4 then
                connection4 = playerGui.DescendantAdded:Connect(fn65)
            end
        end
    end
    local function fn67()
        if connection4 then
            connection4:Disconnect()
            connection4 = nil
        end
        for key, value2 in pairs(list4) do
            local parent2 = value2
            local v5
            if key then
                v5 = key.Parent == savedFadeGuis
            else
                v5 = key
            end
            if v5 then
                if parent2 and parent2:IsDescendantOf(game) then
                    key.Parent = parent2
                elseif localPlayer:FindFirstChild("PlayerGui") then
                    key.Parent = localPlayer.PlayerGui
                end
            end
        end
        table.clear(list4)
    end
    uiRefs.FadeDisabler = tbl.kbTglRow(toolsSection, "FadeDisabler", "FadeDisabler", {
        Default = false,
        Callback = function(value2)
            if value2 then
                fn66()
                fn51()
                tbl3.new({Title = "FadeDisabler", Content = "Fades hidden.", Duration = 2})
            else
                fn67()
                fn52()
                tbl3.new({Title = "FadeDisabler", Content = "Fades restored.", Duration = 2})
            end
        end,
    })
    uiRefs.AntiCoin = tbl.kbTglRow(toolsSection, "AntiCoin", "AntiCoin", {
        Default = false,
        Callback = function(value2)
            if value2 then
                enableAntiCoin()
                fn51()
                tbl3.new({Title = "AntiCoin", Content = "Coins removed.", Duration = 2})
            else
                disableAntiCoin()
                fn52()
                tbl3.new({Title = "AntiCoin", Content = "Coins restored.", Duration = 2})
            end
        end,
    })
    tbl.kbBtnRow(toolsSection, "TpGun", {
        Name = "TP to Dropped Gun",
        Icon = "location-pin",
        Callback = function()
            if fn25() then
                tbl3.new({Title = "Error", Content = "You are murderer!", Duration = 3})
            else
                local v5, v6, instance2 = ipairs(workspace:GetDescendants())
                local basePart = nil
                for _, value2 in v5, v6, instance2 do
                    instance2 = value2
                    if value2.Name ~= "GunDrop" then
                        continue
                    else
                        if instance2:IsA("BasePart") then
                            basePart = instance2
                        elseif instance2:IsA("Model") then
                            basePart = instance2:FindFirstChildWhichIsA("BasePart", true)
                        end
                        if not basePart then
                            continue
                        end
                    end
                    if not basePart then
                        tbl3.new({Title = "Error", Content = "No dropped gun.", Duration = 3})
                        return
                    else
                        if gunPickupMethod == "Remote" then
                            local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart and firetouchinterest then
                                firetouchinterest(humanoidRootPart, basePart, 0)
                                task.wait(0.05)
                                firetouchinterest(humanoidRootPart, basePart, 1)
                            end
                            localPlayer.Backpack.ChildAdded:Wait()
                            tbl3.new({Title = "TP", Content = "Gun picked up (Remote).", Duration = 3})
                        else
                            local character = localPlayer.Character and localPlayer.Character:GetPivot()
                            localPlayer.Character:PivotTo(basePart:GetPivot())
                            localPlayer.Backpack.ChildAdded:Wait()
                            if character then
                                localPlayer.Character:PivotTo(character)
                            end
                            tbl3.new({Title = "TP", Content = "Returned to position.", Duration = 3})
                        end
                        return
                    end
                end
                if not basePart then
                    tbl3.new({Title = "Error", Content = "No dropped gun.", Duration = 3})
                elseif gunPickupMethod == "Remote" then
                    local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart and firetouchinterest then
                        firetouchinterest(humanoidRootPart, basePart, 0)
                        task.wait(0.05)
                        firetouchinterest(humanoidRootPart, basePart, 1)
                    end
                    localPlayer.Backpack.ChildAdded:Wait()
                    tbl3.new({Title = "TP", Content = "Gun picked up (Remote).", Duration = 3})
                else
                    local character = localPlayer.Character and localPlayer.Character:GetPivot()
                    localPlayer.Character:PivotTo(basePart:GetPivot())
                    localPlayer.Backpack.ChildAdded:Wait()
                    if character then
                        localPlayer.Character:PivotTo(character)
                    end
                    tbl3.new({Title = "TP", Content = "Returned to position.", Duration = 3})
                end
            end
        end,
    })
    tbl.kbBtnRow(toolsSection, "TpLobby", {
        Name = "TP to Lobby",
        Icon = "house",
        Callback = function()
            local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(14.4, 504.6, -48.3)
            end
        end,
    })
    tbl.kbBtnRow(toolsSection, "TpSpawn", {
        Name = "TP to Random Spawn",
        Icon = "location-pin",
        Callback = function()
            local instance2 = fn27()
            if not instance2 or not instance2:FindFirstChild("Spawns") then
                tbl3.new({Title = "Error", Content = "No map!", Duration = 3})
            else
                local children = instance2.Spawns:GetChildren()
                if 0 < #children then
                    local character = localPlayer.Character
                    local moveTo = character.MoveTo
                    local random, n4, count = math.random, 1, #children
                    moveTo(character, children[random(n4, count)].Position)
                end
            end
        end,
    })
    tbl.kbBtnRow(toolsSection, "CopyMurd", {
        Name = "Copy Murderer Name",
        Icon = "document-list-heart",
        Callback = function()
            local item = fn11()
            if not item then
                tbl3.new({Title = "Error", Content = "No murderer!", Duration = 3})
            else
                if setclipboard then
                    setclipboard(item.Name)
                end
                tbl3.new({Title = "Copied", Content = item.Name, Duration = 3})
            end
        end,
    })
    tbl.kbBtnRow(toolsSection, "CopySher", {
        Name = "Copy Sheriff Name",
        Icon = "document-list-heart",
        Callback = function()
            local item = fn12()
            if not item then
                tbl3.new({Title = "Error", Content = "No sheriff!", Duration = 3})
            else
                if setclipboard then
                    setclipboard(item.Name)
                end
                tbl3.new({Title = "Copied", Content = item.Name, Duration = 3})
            end
        end,
    })
    local autoFarmSection = mM2Tab:AddSection({Name = "AutoFarm", Position = "left"})
    uiRefs.AutoFarm = tbl.kbTglRow(autoFarmSection, "AutoFarm", "Auto Farm", {
        Default = false,
        Callback = function(autoFarmEnabled)
            AutoFarmSettings.AutoFarmEnabled = autoFarmEnabled
            getgenv().KITI_SetAutoFarm(autoFarmEnabled)
            if autoFarmEnabled then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl8 = {Title = "AutoFarm"}
            if autoFarmEnabled then
                autoFarmEnabled = "Enabled."
            end
            if not autoFarmEnabled then
                autoFarmEnabled = "Disabled."
            end
            tbl8.Content = autoFarmEnabled
            tbl8.Duration = 2
            newFn(tbl8)
        end,
    })
    uiRefs.FarmMode = (autoFarmSection:AddLabel("Mode")):AddDropdown({
        Default = AutoFarmSettings.FarmMode,
        Values = {"Underground", "Sit"},
        Callback = function(farmMode)
            AutoFarmSettings.FarmMode = farmMode
            tbl3.new({Title = "AutoFarm", Content = "Mode: " .. farmMode, Duration = 2})
        end,
    });
    (autoFarmSection:AddLabel("Tween Speed")):AddTextInput({
        Default = tostring(AutoFarmSettings.TweenSpeed),
        Placeholder = "25",
        Callback = function(value2)
            AutoFarmSettings.TweenSpeed = tonumber(value2) or 25
            tbl3.new({Title = "AutoFarm", Content = "Tween Speed → " .. AutoFarmSettings.TweenSpeed, Duration = 2})
        end,
    })
    uiRefs.FarmAutoReset = tbl.kbTglRow(autoFarmSection, "FarmAutoReset", "Auto Reset", {
        Default = AutoFarmSettings.AutoReset,
        Callback = function(autoReset)
            AutoFarmSettings.AutoReset = autoReset
            if autoReset then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.FarmAvoidMurder = tbl.kbTglRow(autoFarmSection, "FarmAvoidMurder", "Avoid Murder", {
        Default = AutoFarmSettings.AvoidMurder,
        Callback = function(avoidMurder)
            AutoFarmSettings.AvoidMurder = avoidMurder
            if avoidMurder then
                fn51()
            else
                fn52()
            end
        end,
    });
    (autoFarmSection:AddLabel("Coin Limit")):AddTextInput({
        Default = tostring(AutoFarmSettings.CoinLimit),
        Placeholder = "40",
        Callback = function(value2)
            AutoFarmSettings.CoinLimit = tonumber(value2) or 40
            tbl3.new({Title = "AutoFarm", Content = "Coin Limit → " .. AutoFarmSettings.CoinLimit, Duration = 2})
        end,
    });
    (autoFarmSection:AddLabel("Max Distance")):AddTextInput({
        Default = tostring(AutoFarmSettings.MaxDistance),
        Placeholder = "600",
        Callback = function(value2)
            AutoFarmSettings.MaxDistance = tonumber(value2) or 600
            tbl3.new({Title = "AutoFarm", Content = "Max Distance → " .. AutoFarmSettings.MaxDistance, Duration = 2})
        end,
    });
    (autoFarmSection:AddLabel("Underground Offset")):AddTextInput({
        Default = tostring(AutoFarmSettings.UndergroundOffset),
        Placeholder = "4",
        Callback = function(value2)
            AutoFarmSettings.UndergroundOffset = tonumber(value2) or 4
            tbl3.new({Title = "AutoFarm", Content = "Underground Offset → " .. AutoFarmSettings.UndergroundOffset, Duration = 2})
        end,
    })
end)();
(function()
    local enabled3 = false
    local folder = ReplicatedStorage:FindFirstChild("HiddenSkins") or Instance.new("Folder")
    folder.Name = "HiddenSkins"
    folder.Parent = ReplicatedStorage
    local list3 = {}
    local function fn63(instance2, v5)
        if enabled3 then
            if instance2.Name == "DisplayRefGun" or instance2.Name == "DisplayRefKnife" then
                task.spawn(function()
                    local value2 = nil
                    if instance2:IsA("ObjectValue") then
                        if not instance2.Value then
                            instance2:GetPropertyChangedSignal("Value"):Wait()
                        end
                        value2 = instance2.Value
                    end
                    list3[instance2] = {object = instance2, objParent = v5, model = value2, modelParent = value2 and value2.Parent or nil}
                    if value2 then
                        value2.Parent = folder
                    end
                    instance2.Parent = folder
                end)
            end
        end
    end
    local function fn64(instance2)
        for _, child in ipairs(instance2:GetChildren()) do
            fn63(child, instance2)
        end
        instance2.ChildAdded:Connect(function(child)
            fn63(child, instance2)
        end)
    end
    local function fn65()
        for _, value2 in pairs(list3) do
            if value2.model and value2.modelParent then
                value2.model.Parent = value2.modelParent
            end
            if value2.object and value2.objParent then
                value2.object.Parent = value2.objParent
            end
        end
        table.clear(list3)
    end
    function _G.HideSkins()
        enabled3 = true
        if localPlayer.Character then
            fn64(localPlayer.Character)
        end
    end
    function _G.RestoreSkins()
        enabled3 = false
        fn65()
    end
    localPlayer.CharacterAdded:Connect(function(character)
        table.clear(list3)
        fn64(character)
    end)
end)();
(function()
    boxEspEnabled = boxEspEnabled or false
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    local tbl6 = {Enabled = false, TeamCheck = true, MaxDistance = 200, FontSize = 11}
    tbl6.FadeOut = {OnDistance = true, OnDeath = false, OnLeave = false}
    tbl6.Options = {
        Teamcheck = false,
        TeamcheckRGB = Color3.fromRGB(0, 255, 0),
        Friendcheck = true,
        FriendcheckRGB = Color3.fromRGB(0, 255, 0),
        Highlight = false,
        HighlightRGB = Color3.fromRGB(255, 0, 0),
    }
    local drawing = {
        Names = {Enabled = true, RGB = Color3.fromRGB(255, 255, 255)},
        Flags = {Enabled = true},
        Distances = {Enabled = true, Position = "Text", RGB = Color3.fromRGB(255, 255, 255)},
        Weapons = {
            Enabled = true,
            WeaponTextRGB = Color3.fromRGB(119, 120, 255),
            Outlined = false,
            Gradient = false,
            GradientRGB1 = Color3.fromRGB(255, 255, 255),
            GradientRGB2 = Color3.fromRGB(119, 120, 255),
        },
        Healthbar = {
            Enabled = false,
            HealthText = false,
            Lerp = false,
            HealthTextRGB = Color3.fromRGB(119, 120, 255),
            Width = 2.5,
            Gradient = true,
            GradientRGB1 = Color3.fromRGB(200, 0, 0),
            GradientRGB2 = Color3.fromRGB(60, 60, 125),
            GradientRGB3 = Color3.fromRGB(119, 120, 255),
        },
    }
    drawing.Boxes = {
        Animate = true,
        RotationSpeed = 300,
        Gradient = false,
        GradientRGB1 = Color3.fromRGB(119, 120, 255),
        GradientRGB2 = Color3.fromRGB(0, 0, 0),
        GradientFill = true,
        GradientFillRGB1 = Color3.fromRGB(119, 120, 255),
        GradientFillRGB2 = Color3.fromRGB(0, 0, 0),
        Filled = {Enabled = true, Transparency = 0.75, RGB = Color3.fromRGB(0, 0, 0)},
        Full = {Enabled = true, RGB = Color3.fromRGB(155, 125, 175)},
        Corner = {Enabled = true, RGB = Color3.fromRGB(155, 125, 175)},
    }
    tbl6.Drawing = drawing
    tbl6.Connections = {RunService = RunService}
    tbl6.Fonts = {}
    local connections = tbl6.Connections
    local localPlayer2 = Players.LocalPlayer
    local currentCamera = Workspace.CurrentCamera
    local rotation = -45
    local v5 = tick()
    local tbl7 = {
        Create = function(_, v6, list3)
            local v7 = typeof(v6) == "string" and Instance.new(v6) or v6
            for key, value2 in pairs(list3) do
                v7[key] = value2
            end
            return v7
        end,
        FadeOutOnDist = function(_, instance2, v6)
            local value2 = math.max(0.1, 1 - v6 / tbl6.MaxDistance)
            if instance2:IsA("TextLabel") then
                instance2.TextTransparency = 1 - value2
            elseif instance2:IsA("ImageLabel") then
                instance2.ImageTransparency = 1 - value2
            elseif instance2:IsA("UIStroke") then
                instance2.Transparency = 1 - value2
            elseif instance2:IsA("Frame") and (instance2 == Healthbar or instance2 == BehindHealthbar) then
                instance2.BackgroundTransparency = 1 - value2
            elseif instance2:IsA("Frame") then
                instance2.BackgroundTransparency = 1 - value2
            elseif instance2:IsA("Highlight") then
                instance2.FillTransparency = 1 - value2
                instance2.OutlineTransparency = 1 - value2
            end
        end,
    }
    local instance2 = tbl7:Create("ScreenGui", {Parent = CoreGui, Name = "ESPHolder"})
    local function fn63(item)
        if instance2:FindFirstChild(item.Name) then
            instance2[item.Name]:Destroy()
        end
    end
    local fn64 = function(player2)
        coroutine.wrap(fn63)(player2)
        local create = tbl7.Create
        local tbl8 = {Parent = instance2, Position = UDim2.new(0.5, 0, 0, -11), Size = UDim2.new(0, 100, 0, 20)}
        tbl8.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl8.BackgroundTransparency = 1
        tbl8.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl8.Font = Enum.Font.Code
        tbl8.TextSize = tbl6.FontSize
        tbl8.TextStrokeTransparency = 0
        tbl8.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        tbl8.RichText = true
        local v6 = create(tbl7, "TextLabel", tbl8)
        local create2 = tbl7.Create
        local tbl9 = {Parent = instance2, Position = UDim2.new(0.5, 0, 0, 11), Size = UDim2.new(0, 100, 0, 20)}
        tbl9.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl9.BackgroundTransparency = 1
        tbl9.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl9.Font = Enum.Font.Code
        tbl9.TextSize = tbl6.FontSize
        tbl9.TextStrokeTransparency = 0
        tbl9.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        tbl9.RichText = true
        local v7 = create2(tbl7, "TextLabel", tbl9)
        local create3 = tbl7.Create
        local tbl10 = {Parent = instance2, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20)}
        tbl10.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl10.BackgroundTransparency = 1
        tbl10.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl10.Font = Enum.Font.Code
        tbl10.TextSize = tbl6.FontSize
        tbl10.TextStrokeTransparency = 0
        tbl10.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        tbl10.RichText = true
        local v8 = create3(tbl7, "TextLabel", tbl10)
        local v9 = tbl7:Create("Frame", {
            Parent = instance2,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
        })
        local v10 = tbl7:Create("UIGradient", {
            Parent = v9,
            Enabled = tbl6.Drawing.Boxes.GradientFill,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, tbl6.Drawing.Boxes.GradientFillRGB1),
                ColorSequenceKeypoint.new(1, tbl6.Drawing.Boxes.GradientFillRGB2),
            }),
        })
        local v11 = tbl7:Create("UIStroke", {
            Parent = v9,
            Enabled = tbl6.Drawing.Boxes.Gradient,
            Transparency = 0,
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Miter,
        })
        local v12 = tbl7:Create("UIGradient", {
            Parent = v11,
            Enabled = tbl6.Drawing.Boxes.Gradient,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, tbl6.Drawing.Boxes.GradientRGB1),
                ColorSequenceKeypoint.new(1, tbl6.Drawing.Boxes.GradientRGB2),
            }),
        })
        local v13 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0})
        local v14 = tbl7:Create("Frame", {Parent = instance2, ZIndex = -1, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0})
        tbl7:Create("UIGradient", {
            Parent = v13,
            Enabled = tbl6.Drawing.Healthbar.Gradient,
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, tbl6.Drawing.Healthbar.GradientRGB1),
                ColorSequenceKeypoint.new(0.5, tbl6.Drawing.Healthbar.GradientRGB2),
                ColorSequenceKeypoint.new(1, tbl6.Drawing.Healthbar.GradientRGB3),
            }),
        })
        local create4 = tbl7.Create
        local tbl11 = {Parent = instance2, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20)}
        tbl11.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl11.BackgroundTransparency = 1
        tbl11.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl11.Font = Enum.Font.Code
        tbl11.TextSize = tbl6.FontSize
        tbl11.TextStrokeTransparency = 0
        tbl11.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        local v15 = create4(tbl7, "TextLabel", tbl11)
        local v16 = tbl7:Create("ImageLabel", {
            Parent = instance2,
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 40, 0, 40),
        })
        tbl7:Create("UIGradient", {
            Parent = v16,
            Rotation = -90,
            Enabled = tbl6.Drawing.Weapons.Gradient,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, tbl6.Drawing.Weapons.GradientRGB1),
                ColorSequenceKeypoint.new(1, tbl6.Drawing.Weapons.GradientRGB2),
            }),
        })
        local v17 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v18 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v19 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v20 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v21 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v22 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v23 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local v24 = tbl7:Create("Frame", {Parent = instance2, BackgroundColor3 = tbl6.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local create5 = tbl7.Create
        local tbl12 = {Parent = instance2, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20)}
        tbl12.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl12.BackgroundTransparency = 1
        tbl12.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl12.Font = Enum.Font.Code
        tbl12.TextSize = tbl6.FontSize
        tbl12.TextStrokeTransparency = 0
        tbl12.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        local v25 = create5(tbl7, "TextLabel", tbl12)
        local create6 = tbl7.Create
        local tbl13 = {Parent = instance2, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20)}
        tbl13.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl13.BackgroundTransparency = 1
        tbl13.TextColor3 = Color3.fromRGB(255, 255, 255)
        tbl13.Font = Enum.Font.Code
        tbl13.TextSize = tbl6.FontSize
        tbl13.TextStrokeTransparency = 0
        tbl13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        local v26 = create6(tbl7, "TextLabel", tbl13)
        coroutine.wrap(function()
            local connection4 = nil
            local function fn64()
                v9.Visible = false
                v6.Visible = false
                v7.Visible = false
                v8.Visible = false
                v13.Visible = false
                v14.Visible = false
                v15.Visible = false
                v16.Visible = false
                v17.Visible = false
                v18.Visible = false
                v21.Visible = false
                v22.Visible = false
                v19.Visible = false
                v20.Visible = false
                v23.Visible = false
                v24.Visible = false
                v25.Visible = false
                v26.Visible = false
                if not player2 then
                    instance2:Destroy()
                    connection4:Disconnect()
                end
            end
            connection4 = connections.RunService.RenderStepped:Connect(function()
                if not boxEspEnabled then
                    fn64()
                elseif player2.Character and player2.Character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = player2.Character.HumanoidRootPart
                    local humanoid = player2.Character:WaitForChild("Humanoid")
                    local vec, v27 = currentCamera:WorldToScreenPoint(humanoidRootPart.Position)
                    local value2 = (currentCamera.CFrame.Position - humanoidRootPart.Position).Magnitude / 3.5714285714
                    if v27 then
                        v27 = value2 <= tbl6.MaxDistance
                    end
                    if v27 then
                        local value3 = humanoidRootPart.Size.Y * currentCamera.ViewportSize.Y / (vec.Z * 2)
                        local value4 = 3 * value3
                        local value5 = 4.5 * value3
                        if tbl6.FadeOut.OnDistance then
                            tbl7:FadeOutOnDist(v9, value2)
                            tbl7:FadeOutOnDist(v11, value2)
                            tbl7:FadeOutOnDist(v6, value2)
                            tbl7:FadeOutOnDist(v7, value2)
                            tbl7:FadeOutOnDist(v8, value2)
                            tbl7:FadeOutOnDist(v13, value2)
                            tbl7:FadeOutOnDist(v14, value2)
                            tbl7:FadeOutOnDist(v15, value2)
                            tbl7:FadeOutOnDist(v16, value2)
                            tbl7:FadeOutOnDist(v17, value2)
                            tbl7:FadeOutOnDist(v18, value2)
                            tbl7:FadeOutOnDist(v21, value2)
                            tbl7:FadeOutOnDist(v22, value2)
                            tbl7:FadeOutOnDist(v19, value2)
                            tbl7:FadeOutOnDist(v20, value2)
                            tbl7:FadeOutOnDist(v23, value2)
                            tbl7:FadeOutOnDist(v24, value2)
                            tbl7:FadeOutOnDist(v25, value2)
                            tbl7:FadeOutOnDist(v26, value2)
                        end
                        local teamCheck = tbl6.TeamCheck and player2 ~= localPlayer2
                        if teamCheck then
                            teamCheck = localPlayer2.Team ~= player2.Team and player2.Team or not localPlayer2.Team and not player2.Team
                        end
                        if teamCheck then
                            teamCheck = player2.Character
                        end
                        if teamCheck then
                            teamCheck = player2.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if teamCheck then
                            teamCheck = player2.Character:FindFirstChild("Humanoid")
                        end
                        if teamCheck then
                            v17.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v17.Position = UDim2.new(0, vec.X - value4 / 2, 0, vec.Y - value5 / 2)
                            v17.Size = UDim2.new(0, value4 / 5, 0, 1)
                            v18.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v18.Position = UDim2.new(0, vec.X - value4 / 2, 0, vec.Y - value5 / 2)
                            v18.Size = UDim2.new(0, 1, 0, value5 / 5)
                            v21.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v21.Position = UDim2.new(0, vec.X - value4 / 2, 0, vec.Y + value5 / 2)
                            v21.Size = UDim2.new(0, 1, 0, value5 / 5)
                            v21.AnchorPoint = Vector2.new(0, 5)
                            v22.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v22.Position = UDim2.new(0, vec.X - value4 / 2, 0, vec.Y + value5 / 2)
                            v22.Size = UDim2.new(0, value4 / 5, 0, 1)
                            v22.AnchorPoint = Vector2.new(0, 1)
                            v19.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v19.Position = UDim2.new(0, vec.X + value4 / 2, 0, vec.Y - value5 / 2)
                            v19.Size = UDim2.new(0, value4 / 5, 0, 1)
                            v19.AnchorPoint = Vector2.new(1, 0)
                            v20.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v20.Position = UDim2.new(0, vec.X + value4 / 2 - 1, 0, vec.Y - value5 / 2)
                            v20.Size = UDim2.new(0, 1, 0, value5 / 5)
                            v20.AnchorPoint = Vector2.new(0, 0)
                            v23.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v23.Position = UDim2.new(0, vec.X + value4 / 2, 0, vec.Y + value5 / 2)
                            v23.Size = UDim2.new(0, 1, 0, value5 / 5)
                            v23.AnchorPoint = Vector2.new(1, 1)
                            v24.Visible = tbl6.Drawing.Boxes.Corner.Enabled
                            v24.Position = UDim2.new(0, vec.X + value4 / 2, 0, vec.Y + value5 / 2)
                            v24.Size = UDim2.new(0, value4 / 5, 0, 1)
                            v24.AnchorPoint = Vector2.new(1, 1)
                            v9.Position = UDim2.new(0, vec.X - value4 / 2, 0, vec.Y - value5 / 2)
                            v9.Size = UDim2.new(0, value4, 0, value5)
                            v9.Visible = tbl6.Drawing.Boxes.Full.Enabled
                            v9.BackgroundTransparency = 1
                            v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v9.BorderSizePixel = 1
                            rotation = rotation + (tick() - v5) * tbl6.Drawing.Boxes.RotationSpeed * math.cos(0.7853981633974483 * tick() - 1.5707963267948966)
                            if tbl6.Drawing.Boxes.Animate then
                                v10.Rotation = rotation
                                v12.Rotation = rotation
                            else
                                v10.Rotation = -45
                                v12.Rotation = -45
                            end
                            v5 = tick()
                            local value6 = humanoid.Health / humanoid.MaxHealth
                            v13.Visible = tbl6.Drawing.Healthbar.Enabled
                            v13.Position = UDim2.new(0, vec.X - value4 / 2 - 6, 0, vec.Y - value5 / 2 + value5 * (1 - value6))
                            v13.Size = UDim2.new(0, tbl6.Drawing.Healthbar.Width, 0, value5 * value6)
                            v14.Visible = tbl6.Drawing.Healthbar.Enabled
                            v14.Position = UDim2.new(0, vec.X - value4 / 2 - 6, 0, vec.Y - value5 / 2)
                            v14.Size = UDim2.new(0, tbl6.Drawing.Healthbar.Width, 0, value5)
                            if tbl6.Drawing.Healthbar.HealthText then
                                local value7 = math.floor(humanoid.Health / humanoid.MaxHealth * 100)
                                v15.Position = UDim2.new(0, vec.X - value4 / 2 - 6, 0, vec.Y - value5 / 2 + value5 * (1 - value7 / 100) + 3)
                                v15.Text = tostring(value7)
                                v15.Visible = humanoid.Health < humanoid.MaxHealth
                                if tbl6.Drawing.Healthbar.Lerp then
                                    v15.TextColor3 = value6 >= 0.75 and Color3.fromRGB(0, 255, 0) or value6 >= 0.5 and Color3.fromRGB(255, 255, 0) or value6 >= 0.25 and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(255, 0, 0)
                                else
                                    v15.TextColor3 = tbl6.Drawing.Healthbar.HealthTextRGB
                                end
                            end
                            v6.Visible = tbl6.Drawing.Names.Enabled
                            v6.Text = player2.Name
                            v6.Position = UDim2.new(0, vec.X, 0, vec.Y - value5 / 2 - 9)
                            if tbl6.Drawing.Distances.Enabled then
                                if tbl6.Drawing.Distances.Position == "Bottom" then
                                    v8.Position = UDim2.new(0, vec.X, 0, vec.Y + value5 / 2 + 18)
                                    v16.Position = UDim2.new(0, vec.X - 21, 0, vec.Y + value5 / 2 + 15)
                                    v7.Position = UDim2.new(0, vec.X, 0, vec.Y + value5 / 2 + 7)
                                    v7.Text = string.format("%d meters", math.floor(value2))
                                    v7.Visible = true
                                elseif tbl6.Drawing.Distances.Position == "Text" then
                                    v8.Position = UDim2.new(0, vec.X, 0, vec.Y + value5 / 2 + 8)
                                    v16.Position = UDim2.new(0, vec.X - 21, 0, vec.Y + value5 / 2 + 5)
                                    v7.Visible = false
                                    v6.Text = player2.Name
                                    v6.Visible = tbl6.Drawing.Names.Enabled
                                end
                            end
                            local value7 = math.floor(value2 * 3.5714285714)
                            v8.Text = string.format("%d studs", value7)
                            v8.Visible = tbl6.Drawing.Weapons.Enabled
                        else
                            fn64()
                        end
                    else
                        fn64()
                    end
                else
                    fn64()
                end
            end)
        end)()
    end
    for _, player2 in pairs(Players:GetPlayers()) do
        if player2.Name ~= localPlayer2.Name then
            coroutine.wrap(fn64)(player2)
        end
    end
    Players.PlayerAdded:Connect(function(player2)
        coroutine.wrap(fn64)(player2)
    end)
end)();
(function()
    korbloxEnabled = false
    local localPlayer2 = game:GetService("Players").LocalPlayer
    getgenv().KorbloxRightLeg = {
        MeshId = "http://www.roblox.com/asset/?id=902942096",
        TextureID = "http://www.roblox.com/asset/?id=902843398",
        HideLowerLeg = true,
        HideFoot = true,
    }
    local list3 = {}
    local function fn63(instance2)
        if not (not instance2 or list3[instance2]) then
            local tbl6 = {Transparency = instance2.Transparency}
            if instance2:IsA("MeshPart") then
                tbl6.MeshId = instance2.MeshId
                tbl6.TextureID = instance2.TextureID
            end
            list3[instance2] = tbl6
        end
    end
    local function fn64(instance2)
        if korbloxEnabled then
            local rightUpperLeg = instance2:FindFirstChild("RightUpperLeg")
            if rightUpperLeg then
                fn63(rightUpperLeg)
                pcall(function()
                    rightUpperLeg.MeshId = getgenv().KorbloxRightLeg.MeshId
                end)
                pcall(function()
                    rightUpperLeg.TextureID = getgenv().KorbloxRightLeg.TextureID
                end)
                local rightLowerLeg = instance2:FindFirstChild("RightLowerLeg")
                local rightFoot = instance2:FindFirstChild("RightFoot")
                if getgenv().KorbloxRightLeg.HideLowerLeg and rightLowerLeg then
                    fn63(rightLowerLeg)
                    rightLowerLeg.Transparency = 1
                end
                if getgenv().KorbloxRightLeg.HideFoot and rightFoot then
                    fn63(rightFoot)
                    rightFoot.Transparency = 1
                end
            end
        end
    end
    local function fn65(v5)
        task.wait(1)
        fn64(v5)
    end
    localPlayer2.CharacterAdded:Connect(function(character)
        fn65(character)
    end)
    local function fn66()
        for key, value2 in pairs(list3) do
            local v5 = value2
            local parent
            if key then
                parent = key.Parent
            else
                parent = key
            end
            if parent then
                if v5.MeshId ~= nil then
                    pcall(function()
                        key.MeshId = v5.MeshId
                    end)
                end
                if v5.TextureID ~= nil then
                    pcall(function()
                        key.TextureID = v5.TextureID
                    end)
                end
                if v5.Transparency ~= nil then
                    pcall(function()
                        key.Transparency = v5.Transparency
                    end)
                end
            end
        end
        table.clear(list3)
    end
    getgenv().KITI_SetKorblox = function(enabled3)
        if enabled3 then
            enabled3 = true
        end
        korbloxEnabled = enabled3 or false
        if korbloxEnabled then
            local character = localPlayer2.Character
            if character then
                fn64(character)
            end
        else
            fn66()
        end
    end
end)();
(function()
    getfenv()
    local chinaHatSettings
    local visualsTab = window:AddTab({Name = "Visuals", Icon = "eye"})
    local chinaHatSettings2 = getgenv().ChinaHatSettings
    if chinaHatSettings2 then
        chinaHatSettings = chinaHatSettings2
    else
        local tbl6 = {
            enabled = false,
            hatColor = Color3.fromRGB(255, 105, 180),
            lightColor = Color3.fromRGB(255, 105, 180),
            lightBrightness = 0,
            lightRange = 12,
        }
        tbl6.scale = Vector3.new(1.7000000476837158, 1.100000023841858, 1.7000000476837158)
        tbl6.yOffset = 0.9
        chinaHatSettings = tbl6
    end
    chinaHatSettings.yOffset = 0.9
    getgenv().ChinaHatSettings = chinaHatSettings
    local function fn63(character)
        if not character then
            character = localPlayer.Character
        end
        if character then
            local kITI_ChinaHat = character:FindFirstChild("KITI_ChinaHat")
            if kITI_ChinaHat then
                kITI_ChinaHat:Destroy()
            end
        end
    end
    local v5 = chinaHatSettings
    local function fn64(parent)
        if not (not v5.enabled or not parent) then
            local head = parent:FindFirstChild("Head")
            if head then
                fn63(parent)
                local part = Instance.new("Part")
                part.Name = "KITI_ChinaHat"
                part.Size = Vector3.new(1, 1, 1)
                part.Material = Enum.Material.Neon
                part.Transparency = 0.2
                part.Anchored = false
                part.CanCollide = false
                part.CanTouch = false
                part.CanQuery = false
                part.Massless = true
                part.Color = v5.hatColor
                local specialMesh = Instance.new("SpecialMesh")
                specialMesh.MeshType = Enum.MeshType.FileMesh
                specialMesh.MeshId = "rbxassetid://1033714"
                specialMesh.Scale = v5.scale
                specialMesh.Parent = part
                local weld = Instance.new("Weld")
                weld.Part0 = head
                weld.Part1 = part
                local newCFrame, n3, value2, n4 = CFrame.new, 0, 0.9 + (tonumber(v5.yOffset) - 0.9), 0
                weld.C0 = newCFrame(n3, value2, n4)
                weld.Parent = part
                local pointLight = Instance.new("PointLight")
                pointLight.Color = v5.lightColor
                pointLight.Brightness = v5.lightBrightness
                pointLight.Range = v5.lightRange
                pointLight.Shadows = true
                pointLight.Parent = part
                part.Parent = parent
            end
        end
    end
    local v6 = chinaHatSettings
    local function fn65()
        local character = localPlayer.Character
        if character then
            if v6.enabled then
                if not character:FindFirstChild("Head") then
                    character:WaitForChild("Head", 5)
                end
                fn64(character)
            else
                fn63(character)
            end
        end
    end
    local jumpCircleSettings = getgenv().JumpCircleSettings or {enabled = false, color = Color3.fromRGB(255, 105, 180)}
    getgenv().JumpCircleSettings = jumpCircleSettings
    local connection4 = nil
    local image = "rbxassetid://133238425773760"
    local function fn66(v7)
        if jumpCircleSettings.enabled then
            local part = Instance.new("Part")
            part.Name = "KITI_JumpCircle"
            part.Anchored = true
            part.CanCollide = false
            part.CanTouch = false
            part.CanQuery = false
            part.CastShadow = false
            part.Size = Vector3.new(0.5, 0.05000000074505806, 0.5)
            local newCFrame = CFrame.new
            part.CFrame = newCFrame(v7 + Vector3.new(0, 0.05000000074505806, 0))
            part.Transparency = 1
            part.Parent = workspace
            local surfaceGui = Instance.new("SurfaceGui")
            surfaceGui.Name = "CircleGui"
            surfaceGui.Face = Enum.NormalId.Top
            surfaceGui.AlwaysOnTop = true
            surfaceGui.LightInfluence = 0
            surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
            surfaceGui.PixelsPerStud = 100
            surfaceGui.Parent = part
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.BackgroundTransparency = 1
            imageLabel.Size = UDim2.fromScale(1, 1)
            imageLabel.Image = image
            imageLabel.ImageColor3 = jumpCircleSettings.color
            imageLabel.ImageTransparency = 0
            imageLabel.Parent = surfaceGui
            local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local v8 = TweenService2
            local create = v8.Create
            local tbl6 = {}
            tbl6.Size = Vector3.new(7, 0.05000000074505806, 7)
            create(v8, part, tweenInfo, tbl6):Play()
            TweenService2:Create(imageLabel, tweenInfo, {ImageTransparency = 1}):Play()
            game:GetService("Debris"):AddItem(part, 0.9)
        end
    end
    local function fn67(instance2)
        if connection4 then
            connection4:Disconnect()
            connection4 = nil
        end
        if instance2 then
            local humanoid = instance2:FindFirstChildOfClass("Humanoid") or instance2:WaitForChild("Humanoid", 5)
            local humanoidRootPart = instance2:FindFirstChild("HumanoidRootPart") or instance2:WaitForChild("HumanoidRootPart", 5)
            if not (not humanoid or not humanoidRootPart) then
                connection4 = humanoid.StateChanged:Connect(function(_, newState)
                    if newState == Enum.HumanoidStateType.Jumping and jumpCircleSettings.enabled then
                        local position = humanoidRootPart.Position
                        fn66(position - Vector3.new(0, 2.799999952316284, 0))
                    end
                end)
            end
        end
    end
    local v7 = chinaHatSettings
    localPlayer.CharacterAdded:Connect(function(character)
        if v7.enabled then
            character:WaitForChild("Head", 10)
            task.wait(0.1)
            fn64(character)
        end
        fn67(character)
    end)
    if localPlayer.Character then
        fn67(localPlayer.Character)
    end
    local gunModelSection = visualsTab:AddSection({Name = "Gun Model", Position = "left"})
    uiRefs.CustomModel = tbl.kbTglRow(gunModelSection, "CustomModel", "Gun Model", {
        Default = false,
        Callback = function(value2)
            customGunModelEnabled = value2
            fn16()
            if value2 then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Gun Model"}
            if value2 then
                value2 = "Custom model enabled: " .. selectedGunModelName
            end
            tbl6.Content = value2 or "Original model restored."
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    uiRefs.GunModelDropdown = gunModelSection:AddLabel("Select Model"):AddDropdown({
        Default = "AWP",
        Values = {"AWP", "Pistol", "Shotgun", "RayGun", "PinkGun", "FlameGun", "BigUSP-S"},
        Callback = function(value2)
            selectedGunModelName = value2
            if customGunModelEnabled then
                fn16()
            end
            tbl3.new({Title = "Gun Model", Content = "Selected: " .. value2, Duration = 2})
        end,
    })
    local gunBeamSection = visualsTab:AddSection({Name = "Gun Beam", Position = "left"})
    uiRefs.BeamType = (gunBeamSection:AddLabel("Beam Type")):AddDropdown({
        Default = tbl2.BeamType,
        Values = {"Default", "Neon Fat", "Nuke", "Zigzag Light", "Orbital Strike", "Black Hole", "Rainbow RGB"},
        Callback = function(beamType)
            tbl2.BeamType = beamType
            fn51()
            tbl3.new({Title = "Gun Beam", Content = "Beam type: " .. beamType, Duration = 2})
        end,
    })
    uiRefs.BeamColor = (gunBeamSection:AddLabel("Beam Color")):AddColorPicker({
        Default = tbl2.BeamColor,
        Callback = function(beamColor)
            tbl2.BeamColor = beamColor
        end,
    })
    local avatarSection = visualsTab:AddSection({Name = "Avatar", Position = "left"})
    local kbCustom = tbl.kbCustom
    local chinaHat = {}
    local tbl6 = {type = "colorpicker", key = "ChinaHatColor", label = "Hat Color"}
    local v8 = chinaHatSettings
    function tbl6.getDefault()
        return v8.hatColor
    end
    local v9 = chinaHatSettings
    function tbl6.setter(hatColor)
        v9.hatColor = hatColor
        local character = localPlayer.Character
        local kITI_ChinaHat
        if character then
            kITI_ChinaHat = localPlayer.Character:FindFirstChild("KITI_ChinaHat")
        else
            kITI_ChinaHat = character
        end
        local v10
        if kITI_ChinaHat then
            v10 = kITI_ChinaHat:IsA("BasePart")
        else
            v10 = kITI_ChinaHat
        end
        if v10 then
            kITI_ChinaHat.Color = hatColor
        end
    end
    local tbl7 = {type = "slider", label = "Height Y", min = -1, max = 2, decimals = 1}
    local v10 = chinaHatSettings
    function tbl7.getDefault()
        return tonumber(v10.yOffset) or 0.9
    end
    local v11 = chinaHatSettings
    function tbl7.setter(v12)
        local clamp, number2, v13, n3 = math.clamp, tonumber(v12) or 0.9, -1, 2
        v11.yOffset = clamp(number2, v13, n3)
        local character = localPlayer.Character
        if character then
            character = localPlayer.Character:FindFirstChild("KITI_ChinaHat")
        end
        if character then
            character = character:FindFirstChildOfClass("Weld")
        end
        if character then
            character.C0 = CFrame.new(0, v11.yOffset, 0)
        end
    end
    chinaHat[1], chinaHat[2] = tbl6, tbl7
    kbCustom.ChinaHat = chinaHat
    local v12 = uiRefs
    local kbTglRow = tbl.kbTglRow
    local tbl8 = {Default = chinaHatSettings.enabled}
    local v13 = chinaHatSettings
    function tbl8.Callback(value2)
        v13.enabled = value2 == true
        fn65()
        if v13.enabled then
            fn51()
        else
            fn52()
        end
        tbl3.new({Title = "Avatar", Content = v13.enabled and "ChinaHat enabled." or "ChinaHat disabled.", Duration = 2})
    end
    v12.ChinaHat = kbTglRow(avatarSection, "ChinaHat", "ChinaHat", tbl8)
    local kbCustom2 = tbl.kbCustom
    local jumpCircle = {}
    local tbl9 = {type = "colorpicker", key = "JumpCircleColor", label = "Circle Color"}
    function tbl9.getDefault()
        return jumpCircleSettings.color
    end
    function tbl9.setter(color)
        jumpCircleSettings.color = color
    end
    jumpCircle[1] = tbl9
    kbCustom2.JumpCircle = jumpCircle
    local v14 = uiRefs
    local kbTglRow2 = tbl.kbTglRow
    local tbl10 = {Default = jumpCircleSettings.enabled}
    function tbl10.Callback(value2)
        jumpCircleSettings.enabled = value2 == true
        if jumpCircleSettings.enabled then
            fn67(localPlayer.Character)
            fn51()
        else
            fn52()
        end
        tbl3.new({
            Title = "Avatar",
            Content = jumpCircleSettings.enabled and "Jump Circle enabled." or "Jump Circle disabled.",
            Duration = 2,
        })
    end
    v14.JumpCircle = kbTglRow2(avatarSection, "JumpCircle", "Jump Circle", tbl10)
    uiRefs.Korblox = tbl.kbTglRow(avatarSection, "Korblox", "Korblox Leg", {
        Default = false,
        Callback = function(value2)
            getgenv().KITI_SetKorblox(value2)
            if value2 then
                fn51()
            else
                fn52()
            end
            tbl3.new({Title = "Avatar", Content = value2 and "Korblox leg enabled." or "Korblox leg disabled.", Duration = 2})
        end,
    })
    uiRefs.HideDisplaySkins = tbl.kbTglRow(avatarSection, "HideDisplaySkins", "Hide Display Skins", {
        Default = false,
        Callback = function(value2)
            if value2 then
                _G.HideSkins()
                fn51()
                tbl3.new({Title = "Avatar", Content = "Skins hidden.", Duration = 2})
            else
                _G.RestoreSkins()
                fn52()
                tbl3.new({Title = "Avatar", Content = "Skins restored.", Duration = 2})
            end
        end,
    })
    local tradeHelperSection = visualsTab:AddSection({Name = "TradeHelper", Position = "left"})
    uiRefs.TradeHelper = tbl.kbTglRow(tradeHelperSection, "TradeHelper", "TradeHelper", {
        Default = false,
        Callback = function(value2)
            if value2 then
                TH.Start()
                fn51()
                tbl3.new({Title = "TradeHelper", Content = "Enabled. Showing item values.", Duration = 2})
            else
                TH.Stop()
                fn52()
                tbl3.new({Title = "TradeHelper", Content = "Disabled.", Duration = 2})
            end
        end,
    })
    local espSection = visualsTab:AddSection({Name = "Esp", Position = "left"})
    uiRefs.BoxEsp = tbl.kbTglRow(espSection, "BoxEsp", "Box ESP", {
        Default = false,
        Callback = function(value2)
            boxEspEnabled = value2
            if value2 then
                fn51()
            else
                fn52()
            end
            tbl3.new({Title = "Esp", Content = value2 and "Box ESP enabled." or "Box ESP disabled.", Duration = 2})
        end,
    })
    local effectsSection = visualsTab:AddSection({Name = "Effects", Position = "left"})
    uiRefs.Trails = tbl.kbTglRow(effectsSection, "Trails", "Trails", {
        Default = false,
        Callback = function(value2)
            trailsEnabled = value2
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.TrailStyle = effectsSection:AddLabel("Trail Style"):AddDropdown({
        Default = "Solid",
        Values = {"Solid", "Fade", "Rainbow", "Dotted"},
        Callback = function(value2)
            trailStyle = value2
        end,
    })
    uiRefs.MagicAura = tbl.kbTglRow(effectsSection, "MagicAura", "Magic Aura", {
        Default = false,
        Callback = function(value2)
            magicAuraEnabled = value2
            if value2 then
                fn51()
            else
                fn52()
            end
        end,
    })
    uiRefs.RTX = tbl.kbTglRow(effectsSection, "RTX", "Shader (RTX)", {
        Default = false,
        Callback = function(value2)
            if value2 then
                fn58()
                fn51()
                tbl3.new({Title = "Shader", Content = "RTX Enabled", Duration = 2})
            else
                fn59()
                fn52()
                tbl3.new({Title = "Shader", Content = "RTX Disabled", Duration = 2})
            end
        end,
    })
    local environmentSection = visualsTab:AddSection({Name = "Environment", Position = "left"})
    local tbl11 = {
        Default = timeLockMode,
        Values = {"Off", "Dawn", "Day", "Sunset", "Night", "Midnight", "Custom"},
        Flag = "TimeLockMode",
        Callback = function(value2)
            if timeLockModes[value2] ~= nil or value2 == "Custom" then
                timeLockMode = value2
            else
                timeLockMode = "Off"
            end
            timeLockEnabled = timeLockMode ~= "Off"
            if timeLockEnabled then
                fn51()
            else
                fn52()
            end
        end,
    }
    uiRefs.TimeLock = environmentSection:AddLabel("Time Lock"):AddDropdown(tbl11)
    environmentSection:AddLabel("Custom Time"):AddSlider({
        Min = 0,
        Max = 24,
        Default = 14,
        Decimals = 1,
        Flag = "TimeLockValue",
        Callback = function(value2)
            timeLockVal = tonumber(value2) or 14
        end,
    })
    local targetESPHUDSection = visualsTab:AddSection({Name = "Target ESP/HUD", Position = "right"})
    uiRefs.TargetESP = tbl.kbTglRow(targetESPHUDSection, "TargetESP", "Target ESP", {
        Default = false,
        Callback = function(esp)
            tbl.esp = esp
            if esp then
                tbl.createEspGui()
                fn51()
            else
                if tbl.espFrame then
                    tbl.espFrame.Visible = false
                end
                fn52()
            end
            local newFn = tbl3.new
            local tbl12 = {Title = "Target ESP"}
            if esp then
                esp = "Enabled (priority by role)."
            end
            tbl12.Content = esp or "Disabled."
            tbl12.Duration = 2
            newFn(tbl12)
        end,
    })
    uiRefs.TargetHUD = tbl.kbTglRow(targetESPHUDSection, "TargetHUD", "Target HUD", {
        Default = false,
        Callback = function(hud)
            tbl.hud = hud
            if hud then
                tbl.createHudGui()
                fn51()
            else
                if tbl.hudFrame then
                    tbl.hudFrame.Visible = false
                end
                fn52()
            end
            local newFn = tbl3.new
            local tbl12 = {Title = "Target HUD"}
            if hud then
                hud = "Enabled (priority by role)."
            end
            if not hud then
                hud = "Disabled."
            end
            tbl12.Content = hud
            tbl12.Duration = 2
            newFn(tbl12)
        end,
    })
    local skyboxManagerSection = visualsTab:AddSection({Name = "Skybox Manager", Position = "right"})
    tbl.kbBtnRow(skyboxManagerSection, "SkyRemove", {
        Name = "Remove Sky",
        Icon = "trash-can",
        Callback = function()
            disableKITI_Skybox()
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkySnow", {
        Name = "Snow Skybox",
        Icon = "cloud",
        Callback = function()
            fn57(4604073339, "Snow Skybox")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkySpace", {
        Name = "Realistic Space",
        Icon = "star",
        Callback = function()
            fn57(136402262, "Realistic Space")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkyPurple", {
        Name = "Purple Nebula",
        Icon = "star",
        Callback = function()
            fn57(83555979203508, "Purple Nebula")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkyBlue", {
        Name = "Blue Nebula",
        Icon = "star",
        Callback = function()
            fn57(130093177270069, "Blue Nebula")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkySponge", {
        Name = "SpongeBob Sky",
        Icon = "sun",
        Callback = function()
            fn57(114523453023009, "SpongeBob Sky")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkyNight", {
        Name = "Night Sky Vibe",
        Icon = "moon",
        Callback = function()
            fn57(78613024128163, "Night Sky Vibe")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkyGeoz", {
        Name = "Geoz Skybox",
        Icon = "cloud",
        Callback = function()
            fn57(97573261671957, "Geoz Skybox")
        end,
    })
    tbl.kbBtnRow(skyboxManagerSection, "SkyAsteroid", {
        Name = "Asteroid Space",
        Icon = "star",
        Callback = function()
            fn57(295604372, "Asteroid Space")
        end,
    })
    local aurasSection = visualsTab:AddSection({Name = "Auras", Position = "right"})
    tbl.kbBtnRow(aurasSection, "AuraMidnight", {
        Name = "Midnight Blues",
        Icon = "star",
        Callback = function()
            fn18("12002206611", "Midnight Blues")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraRainbow", {
        Name = "Rainbow Effect",
        Icon = "star",
        Callback = function()
            fn18("8509695714", "Rainbow Effect")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraRedShield", {
        Name = "Red Shield",
        Icon = "star",
        Callback = function()
            fn18("14598330167", "Red Shield")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraCrimson", {
        Name = "Crimson King",
        Icon = "star",
        Callback = function()
            fn18("11955208820", "Crimson King")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraCards", {
        Name = "Daemon of Cards",
        Icon = "star",
        Callback = function()
            fn18("10373359918", "Daemon of Cards")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraWings", {
        Name = "Angel Wings",
        Icon = "star",
        Callback = function()
            fn18("97658130917593", "Angel Wings")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraStarlight", {
        Name = "Starlight",
        Icon = "star",
        Callback = function()
            fn18("134645216613107", "Starlight")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraHeavenly", {
        Name = "Heavenly",
        Icon = "star",
        Callback = function()
            fn18("139300897520961", "Heavenly")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraRibbon", {
        Name = "Ribbon",
        Icon = "star",
        Callback = function()
            fn18("132069507632161", "Ribbon")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraSakura", {
        Name = "Sakura",
        Icon = "star",
        Callback = function()
            fn18("81755778619404", "Sakura")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraWind", {
        Name = "Wind",
        Icon = "star",
        Callback = function()
            fn18("80694081850877", "Wind")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraFlow", {
        Name = "Flow",
        Icon = "star",
        Callback = function()
            fn18("119913533725648", "Flow")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraStar", {
        Name = "Star",
        Icon = "star",
        Callback = function()
            fn18("73754563740680", "Star")
        end,
    })
    tbl.kbBtnRow(aurasSection, "AuraClear", {
        Name = "Clear Aura",
        Icon = "circle-slash",
        Callback = function()
            fn17()
            pendingAura = nil
            fn52()
            tbl3.new({Title = "Auras", Content = "Aura cleared!", Duration = 2})
        end,
    })
end)();
(function()
    local targetTab = window:AddTab({Name = "Target", Icon = "person"})
    local player2 = nil
    customAvatarsEnabled = true
    local list3 = {
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/1.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/2.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/3.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/4.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/5.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/6.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/7.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/8.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/9.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/10.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/11.png",
        "https://raw.githubusercontent.com/Royal-Script-hub/mimka/main/ava/12.png",
    }
    local list4 = {}
    local tbl6 = {}
    local text2 = "mimka_avatars"
    if makefolder then
        pcall(makefolder, "mimka_avatars")
    end
    local function fn63(v5)
        if tbl6[v5] then
            return tbl6[v5]
        else
            local text3 = text2 .. "/avatar_" .. (table.find(list3, v5) or 1) .. ".png"
            local v6 = getcustomasset or getsynasset
            if v6 and writefile then
                if not (isfile and isfile(text3)) then
                    local v7, list5 = pcall(function()
                        return game:HttpGet(v5)
                    end)
                    if v7 then
                        v7 = list5
                    end
                    if v7 then
                        v7 = #list5 > 0
                    end
                    if v7 then
                        pcall(writefile, text3, list5)
                    end
                end
                local v7, v8 = pcall(v6, text3)
                if v7 and v8 then
                    tbl6[v5] = v8
                    return v8
                end
            end
            return v5
        end
    end
    local function fn64(player3)
        if not customAvatarsEnabled then
            if not player3 then
                return ""
            else
                local v5, v6 = pcall(function()
                    return Players2:GetUserThumbnailAsync(player3.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
                end)
                return v5 and v6 or ""
            end
        elseif not player3 then
            return fn63(list3[math.random(1, #list3)])
        else
            local userId = player3.UserId
            if list4[userId] then
                return fn63(list4[userId])
            else
                local tbl7 = {}
                for _, value2 in pairs(list4) do
                    tbl7[value2] = true
                end
                local list5 = {}
                for _, value2 in ipairs(list3) do
                    if not tbl7[value2] then
                        table.insert(list5, value2)
                    end
                end
                local v5 = #list5 > 0 and list5[math.random(1, #list5)] or list3[math.random(1, #list3)]
                list4[userId] = v5
                return fn63(v5)
            end
        end
    end
    local parent = targetTab:AddSection({Name = "Players", Position = "left"}).Section.Items.Content.Instance
    local list5 = {}
    local frame = Instance.new("Frame")
    frame.Name = "PlayerListPanel"
    frame.Size = UDim2.new(1, 0, 0, 272)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    local textBox = Instance.new("TextBox")
    textBox.Name = "PlayerSearch"
    textBox.Size = UDim2.new(1, 0, 0, 28)
    textBox.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
    textBox.BackgroundTransparency = 0.12
    textBox.BorderSizePixel = 0
    textBox.ClearTextOnFocus = false
    textBox.Font = Enum.Font.Gotham
    textBox.PlaceholderText = "Search players..."
    textBox.PlaceholderColor3 = Color3.fromRGB(155, 150, 145)
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(245, 242, 238)
    textBox.TextSize = 13
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.ZIndex = 5
    textBox.Parent = frame
    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
    Instance.new("UIPadding", textBox).PaddingLeft = UDim.new(0, 9)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "PlayerCards"
    scrollingFrame.Position = UDim2.new(0, 0, 0, 35)
    scrollingFrame.Size = UDim2.new(1, 0, 0, 237)
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(10, 9, 8)
    scrollingFrame.BackgroundTransparency = 0.35
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.ScrollBarImageColor3 = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.CanvasSize = UDim2.new()
    scrollingFrame.ZIndex = 4
    scrollingFrame.Parent = frame
    Instance.new("UICorner", scrollingFrame).CornerRadius = UDim.new(0, 7)
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellPadding = UDim2.new(0, 7, 0, 7)
    gridLayout.CellSize = UDim2.new(0.5, -4, 0, 72)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.Parent = scrollingFrame
    local padding = Instance.new("UIPadding", scrollingFrame)
    padding.PaddingTop = UDim.new(0, 7)
    padding.PaddingLeft = UDim.new(0, 7)
    padding.PaddingRight = UDim.new(0, 7)
    padding.PaddingBottom = UDim.new(0, 7)
    local parent2 = targetTab:AddSection({Name = "Target Info", Position = "right"}).Section.Items.Content.Instance
    local frame2 = Instance.new("Frame")
    frame2.Name = "TargetInfoPanel"
    frame2.Size = UDim2.new(1, 0, 0, 96)
    frame2.BackgroundTransparency = 1
    frame2.Parent = parent2
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.fromOffset(58, 58)
    imageLabel.Position = UDim2.new(0, 2, 0, 4)
    imageLabel.BackgroundColor3 = Color3.fromRGB(10, 9, 8)
    imageLabel.BackgroundTransparency = 0.1
    imageLabel.BorderSizePixel = 0
    imageLabel.ScaleType = Enum.ScaleType.Crop
    imageLabel.Image = ""
    imageLabel.ZIndex = 6
    imageLabel.Parent = frame2
    Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", imageLabel)
    stroke.Color = Color3.fromRGB(50, 34, 23)
    stroke.Thickness = 1
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -70, 0, 22)
    textLabel.Position = UDim2.new(0, 70, 0, 3)
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Text = "No player selected"
    textLabel.TextColor3 = Color3.fromRGB(245, 242, 238)
    textLabel.TextSize = 13
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel.ZIndex = 6
    textLabel.Parent = frame2
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(1, -70, 0, 68)
    textLabel2.Position = UDim2.new(0, 70, 0, 26)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.Text = "Distance: --\nPosition: --\nRole: --"
    textLabel2.TextColor3 = Color3.fromRGB(190, 185, 180)
    textLabel2.TextSize = 11
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.TextYAlignment = Enum.TextYAlignment.Top
    textLabel2.ZIndex = 6
    textLabel2.Parent = frame2
    local function fn65()
        local player3 = player2
        if not player3 or not player3.Parent then
            textLabel.Text = "No player selected"
            textLabel2.Text = "Distance: --\nPosition: --\nRole: --"
            imageLabel.Image = ""
        else
            textLabel.Text = player3.DisplayName ~= player3.Name and player3.DisplayName .. "  @" .. player3.Name or "@" .. player3.Name
            local character = player3.Character
            if character then
                character = player3.Character:FindFirstChild("HumanoidRootPart")
            end
            local humanoidRootPart = localPlayer.Character
            if humanoidRootPart then
                humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local role = roles and roles[player3.Name]
            if role then
                role = role.Role
            end
            if not role then
                role = "Unknown"
            end
            if character then
                local position = character.Position
                if humanoidRootPart then
                    humanoidRootPart = (humanoidRootPart.Position - position).Magnitude
                end
                if not humanoidRootPart then
                    humanoidRootPart = 0
                end
                textLabel2.Text = string.format("Distance: %.1f studs\nPosition: %.1f, %.1f, %.1f\nRole: %s", humanoidRootPart, position.X, position.Y, position.Z, role)
            else
                textLabel2.Text = "Distance: --\nPosition: --\nRole: " .. role
            end
        end
    end
    local function fn66(v5)
        imageLabel.Image = ""
        if v5 then
            task.spawn(function()
                local image = fn64(v5)
                if player2 == v5 and imageLabel.Parent then
                    imageLabel.Image = image
                end
            end)
        end
    end
    local n3 = 0
    RunService.RenderStepped:Connect(function()
        local v5 = player2
        if player2 then
            v5 = os.clock() >= n3
        end
        if v5 then
            n3 = os.clock() + 0.15
            fn65()
        end
    end)
    local function fn67()
        for key, value2 in pairs(list5) do
            local v5 = value2
            local stroke2 = value2:FindFirstChildOfClass("UIStroke")
            if stroke2 then
                local enabled3 = key == player2
                stroke2.Enabled = enabled3
                stroke2.Color = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
                stroke2.Thickness = enabled3 and 2.5 or 1
                stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                v5.BorderSizePixel = enabled3 and 1 or 0
                local theme = connection.Theme or {}
                v5.BorderColor3 = theme.Accent or Color3.fromRGB(224, 116, 24)
                v5.BackgroundColor3 = enabled3 and (theme.Element or Color3.fromRGB(15, 13, 11)) or (theme.Inline or Color3.fromRGB(15, 13, 11))
                v5.BackgroundTransparency = enabled3 and 0.02 or 0.18
            end
        end
    end
    local function fn68(instance2, v5)
        if not (not instance2 or instance2 == localPlayer or not instance2.Parent) then
            player2 = instance2
            fn67()
            fn65()
            fn66(instance2)
            if v5 then
                tbl3.new({Title = "Player Selected", Content = "Selected: " .. instance2.Name, Duration = 2})
            end
        end
    end
    local function fn69(player3, layoutOrder)
        local textButton = Instance.new("TextButton")
        textButton.Name = "Player_" .. player3.Name
        textButton.LayoutOrder = layoutOrder
        textButton.AutoButtonColor = false
        textButton.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
        textButton.BackgroundTransparency = 0.18
        textButton.BorderSizePixel = 0
        textButton.Text = ""
        textButton.ZIndex = 5
        textButton.Parent = scrollingFrame
        Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 7)
        local stroke2 = Instance.new("UIStroke", textButton)
        stroke2.Enabled = false
        stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke2.Color = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
        stroke2.Thickness = 2.5
        local imageLabel2 = Instance.new("ImageLabel")
        imageLabel2.Size = UDim2.fromOffset(42, 42)
        imageLabel2.Position = UDim2.new(0, 7, 0.5, 0)
        imageLabel2.AnchorPoint = Vector2.new(0, 0.5)
        imageLabel2.BackgroundColor3 = Color3.fromRGB(10, 9, 8)
        imageLabel2.BackgroundTransparency = 0.15
        imageLabel2.BorderSizePixel = 0
        imageLabel2.ScaleType = Enum.ScaleType.Crop
        imageLabel2.ZIndex = 6
        imageLabel2.Parent = textButton
        Instance.new("UICorner", imageLabel2).CornerRadius = UDim.new(0, 6)
        local textLabel3 = Instance.new("TextLabel")
        textLabel3.Size = UDim2.new(1, -57, 0, 30)
        textLabel3.Position = UDim2.new(0, 55, 0.5, 0)
        textLabel3.AnchorPoint = Vector2.new(0, 0.5)
        textLabel3.BackgroundTransparency = 1
        textLabel3.Font = Enum.Font.Gotham
        textLabel3.Text = player3.DisplayName ~= player3.Name and player3.DisplayName or player3.Name
        textLabel3.TextColor3 = Color3.fromRGB(245, 242, 238)
        textLabel3.TextSize = 12
        textLabel3.TextWrapped = true
        textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel3.TextXAlignment = Enum.TextXAlignment.Left
        textLabel3.ZIndex = 6
        textLabel3.Parent = textButton
        list5[player3] = textButton
        textButton.Activated:Connect(function()
            fn68(player3, true)
        end)
        imageLabel2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        task.spawn(function()
            local image = fn64(player3)
            if imageLabel2.Parent then
                imageLabel2.Image = image
            end
        end)
    end
    local function fn70()
        for _, value2 in pairs(list5) do
            local parent3
            if value2 then
                parent3 = value2.Parent
            else
                parent3 = value2
            end
            if parent3 then
                value2:Destroy()
            end
        end
        table.clear(list5)
        local text3 = string.lower(textBox.Text or "")
        local n4 = 0
        for _, player3 in ipairs(Players2:GetPlayers()) do
            if player3 ~= localPlayer then
                local text4 = string.lower(player3.DisplayName or "")
                local text5 = string.lower(player3.Name or "")
                if text3 == "" or string.find(text4, text3, 1, true) or string.find(text5, text3, 1, true) then
                    n4 = n4 + 1
                    fn69(player3, n4)
                end
            end
        end
        fn67()
    end
    local tbl7 = {
        SetValue = function(_, v5)
            local v6 = typeof(v5) == "Instance" and v5
            local v7
            if v6 then
                v7 = v6
            else
                v7 = Players2:FindFirstChild(tostring(v5))
            end
            if v7 then
                fn68(v7, false)
            end
        end,
        GetValue = function()
            local name = player2
            if player2 then
                name = player2.Name
            end
            return name or ""
        end,
        SetValues = function()
            fn70()
        end,
    }
    textBox:GetPropertyChangedSignal("Text"):Connect(fn70)
    Players2.PlayerAdded:Connect(fn70)
    Players2.PlayerRemoving:Connect(function(player3)
        local instance2 = list5[player3]
        if instance2 and instance2.Parent then
            instance2:Destroy()
        end
        list5[player3] = nil
        if player2 == player3 then
            player2 = nil
            imageLabel.Image = ""
            fn65()
        end
        list4[player3.UserId] = nil
        fn70()
    end)
    fn70()
    function _G.MimkaRefreshAvatars()
        fn70()
        if player2 then
            fn66(player2)
        else
            imageLabel.Image = ""
        end
    end
    local actionsSection = targetTab:AddSection({Name = "Actions", Position = "right"})
    tbl.kbBtnRow(actionsSection, "TpSel", {
        Name = "Teleport To",
        Icon = "location-pin",
        Callback = function()
            if not player2 or not player2.Character then
                tbl3.new({Title = "Players", Content = "No player selected!", Duration = 3})
            else
                local character = localPlayer.Character
                if character then
                    character = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                end
                if character then
                    local cFrame = player2.Character.HumanoidRootPart.CFrame
                    character.CFrame = cFrame + Vector3.new(0, 5, 0)
                    tbl3.new({Title = "Teleport", Content = "→ " .. player2.Name, Duration = 2})
                end
            end
        end,
    })
    tbl.kbBtnRow(actionsSection, "FlingSel", {
        Name = "Fling",
        Icon = "arrow-rotate-right",
        Callback = function()
            if not player2 then
                tbl3.new({Title = "Players", Content = "No player selected!", Duration = 3})
            else
                local v5 = fn14
                task.spawn(v5, player2)
            end
        end,
    })
    tbl.kbBtnRow(actionsSection, "KillSel", {
        Name = "Kill (as Murderer)",
        Icon = "sword",
        Callback = function()
            if not player2 then
                tbl3.new({Title = "Players", Content = "No player selected!", Duration = 3})
            elseif fn11() ~= localPlayer then
                tbl3.new({Title = "Error", Content = "You are not murderer.", Duration = 3})
            else
                fn15(player2)
            end
        end,
    })
    tbl.kbBtnRow(actionsSection, "AimlockSet", {
        Name = "Set as Aimlock Target",
        Icon = "crosshairs",
        Callback = function()
            if not player2 then
                tbl3.new({Title = "Players", Content = "No player selected!", Duration = 3})
            else
                player = player2
                tbl3.new({Title = "Aimlock", Content = "Target set to " .. player2.Name, Duration = 2})
            end
        end,
    })
    uiRefs.Aimlock = tbl.kbTglRow(actionsSection, "Aimlock", "Aimlock", {
        Default = false,
        Callback = function(...)
            if ({...})[1] then
                if not player then
                    tbl3.new({Title = "Aimlock", Content = "Set a target first!", Duration = 3})
                else
                    if connection3 then
                        connection3:Disconnect()
                    end
                    local connection4 = RunService.RenderStepped:Connect(function()
                        local character = player
                        if player then
                            character = player.Character
                        end
                        if character then
                            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, humanoidRootPart.Position)
                            end
                        end
                    end)
                    connection3 = connection4
                    fn51()
                end
            else
                if connection3 then
                    connection3:Disconnect()
                    connection3 = nil
                end
                fn52()
            end
        end,
    })
    local quickSelectSection = targetTab:AddSection({Name = "Quick Select", Position = "left"})
    tbl.kbBtnRow(quickSelectSection, "SelMurd", {
        Name = "Select Murderer",
        Icon = "sword",
        Callback = function()
            local item = fn11()
            if not item then
                tbl3.new({Title = "Players", Content = "No murderer found!", Duration = 3})
            else
                player2 = item
                tbl7:SetValue(item.Name)
                tbl3.new({Title = "Players", Content = "Selected: " .. item.Name, Duration = 2})
            end
        end,
    })
    tbl.kbBtnRow(quickSelectSection, "SelSher", {
        Name = "Select Sheriff",
        Icon = "crosshairs",
        Callback = function()
            local item = fn12()
            if not item then
                tbl3.new({Title = "Players", Content = "No sheriff found!", Duration = 3})
            else
                player2 = item
                tbl7:SetValue(item.Name)
                tbl3.new({Title = "Players", Content = "Selected: " .. item.Name, Duration = 2})
            end
        end,
    })
    tbl.kbBtnRow(quickSelectSection, "SelNear", {
        Name = "Select Nearest",
        Icon = "person",
        Callback = function()
            local item = fn13()
            if not item then
                tbl3.new({Title = "Players", Content = "No nearby player!", Duration = 3})
            else
                player2 = item
                tbl7:SetValue(item.Name)
                tbl3.new({Title = "Players", Content = "Selected: " .. item.Name, Duration = 2})
            end
        end,
    })
end)();
(function()
    local funTab = window:AddTab({Name = "Fun", Icon = "star"})
    local miscSection = funTab:AddSection({Name = "Misc", Position = "left"})
    uiRefs.Friend = tbl.kbTglRow(miscSection, "Friend", "Friend", {
        Default = false,
        Callback = function(content)
            friendOn = content
            if content then
                fn4()
                fn51()
            else
                fn3()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Friend"}
            if content then
                content = "Enabled."
            end
            if not content then
                content = "Disabled."
            end
            tbl6.Content = content
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    uiRefs.AspectRatio = tbl.kbTglRow(miscSection, "AspectRatio", "AspectRatio", {
        Default = false,
        Callback = function(value2)
            aspectRatioOn = value2
            if value2 then
                enableAspectRatio()
                fn51()
            else
                disableAspectRatio()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "AspectRatio"}
            if value2 then
                value2 = "Enabled (" .. aspectRatioScale .. ")."
            end
            tbl6.Content = value2 or "Disabled."
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    miscSection:AddLabel("Scale"):AddTextInput({
        Default = "0.65",
        Placeholder = "0.65",
        Callback = function(value2)
            local resolution = tonumber(value2)
            if not resolution then
                tbl3.new({Title = "AspectRatio", Content = "Введи число!", Duration = 2})
            else
                aspectRatioScale = resolution
                getgenv().Resolution = resolution
                if connection2 then
                    enableAspectRatio()
                elseif aspectRatioOn then
                    enableAspectRatio()
                end
                tbl3.new({Title = "AspectRatio", Content = "Scale → " .. resolution, Duration = 2})
            end
        end,
    })
    tbl.kbBtnRow(miscSection, "Void", {
        Name = "Infinite Void",
        Icon = "circle-slash",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/InfiniteVoid"))()
            end)
            tbl3.new({Title = "Infinite Void", Content = "Executed script.", Duration = 2})
        end,
    })
    local spinSection = funTab:AddSection({Name = "Spin", Position = "left"})
    uiRefs.Spin = tbl.kbTglRow(spinSection, "Spin", "Spin", {
        Default = false,
        Callback = function(value2)
            spinOn = value2
            if value2 then
                fn6()
                fn51()
            else
                fn5()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Spin"}
            if value2 then
                value2 = "Enabled."
            end
            tbl6.Content = value2 or "Disabled."
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    spinSection:AddLabel("Spin Speed"):AddTextInput({
        Default = "10",
        Placeholder = "10",
        Callback = function(value2)
            spinSpeed = math.clamp(tonumber(value2) or 10, 1, 100)
            tbl3.new({Title = "Spin", Content = "Speed → " .. spinSpeed, Duration = 2})
        end,
    })
    local jerkSection = funTab:AddSection({Name = "Jerk", Position = "right"})
    uiRefs.Jerk = tbl.kbTglRow(jerkSection, "Jerk", "Jerk Off", {
        Default = false,
        Callback = function(value2)
            jerkOn = value2
            if value2 then
                fn10()
                fn51()
                tbl3.new({Title = "Jerk", Content = "Tool added to backpack!", Duration = 2})
            else
                fn9()
                fn52()
                tbl3.new({Title = "Jerk", Content = "Removed.", Duration = 2})
            end
        end,
    })
    local iDKSection = funTab:AddSection({Name = "IDK", Position = "right"})
    uiRefs.WalkFling = tbl.kbTglRow(iDKSection, "WalkFling", "IDK", {
        Default = false,
        Callback = function(value2)
            walkFlingOn = value2
            if value2 then
                fn8()
                fn51()
            else
                fn7()
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "WalkFling"}
            if value2 then
                value2 = "Enabled."
            end
            tbl6.Content = value2 or "Disabled."
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    local hitEffectsSection = funTab:AddSection({Name = "Hit Effects", Position = "right"})
    uiRefs.HitParticles = tbl.kbTglRow(hitEffectsSection, "HitParts", "Hit Particles", {
        Default = false,
        Callback = function(hitPartOn)
            tbl.hitPartOn = hitPartOn
            if hitPartOn then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Hit Effects"}
            if hitPartOn then
                hitPartOn = "Particles enabled."
            end
            if not hitPartOn then
                hitPartOn = "Particles disabled."
            end
            tbl6.Content = hitPartOn
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    uiRefs.HitSound = tbl.kbTglRow(hitEffectsSection, "HitSound", "Hit Sound", {
        Default = false,
        Callback = function(hitSoundOn)
            tbl.hitSoundOn = hitSoundOn
            if hitSoundOn then
                fn51()
            else
                fn52()
            end
            local newFn = tbl3.new
            local tbl6 = {Title = "Hit Effects"}
            if hitSoundOn then
                hitSoundOn = "Sound enabled."
            end
            if not hitSoundOn then
                hitSoundOn = "Sound disabled."
            end
            tbl6.Content = hitSoundOn
            tbl6.Duration = 2
            newFn(tbl6)
        end,
    })
    uiRefs.HitSoundMode = hitEffectsSection:AddLabel("Hit Sound Mode"):AddDropdown({
        Default = "1",
        Values = {"1", "2", "3", "4", "5", "6"},
        Callback = function(value2)
            tbl.hitSoundMode = tonumber(value2) or 1
        end,
    })
    local tbl6 = {
        "rbxassetid://140604838213617",
        "rbxassetid://130201387574815",
        "rbxassetid://135478009117226",
        "rbxassetid://96735711388006",
        "rbxassetid://126048302910782",
        "rbxassetid://7255642553",
    }
    local screenGui = nil
    local function fn63()
        if screenGui then
            return screenGui
        else
            screenGui = Instance.new("ScreenGui")
            screenGui.Name = "KITI_HitParticles"
            screenGui.ResetOnSpawn = false
            screenGui.IgnoreGuiInset = true
            pcall(function()
                screenGui.Parent = game:GetService("CoreGui")
            end)
            if not screenGui.Parent then
                screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
            end
            return screenGui
        end
    end
    local function fn64(position)
        local v5 = fn63()
        local billboardGui = Instance.new("BillboardGui", v5)
        billboardGui.Size = UDim2.new(2, 0, 2, 0)
        billboardGui.AlwaysOnTop = true
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
        part.Transparency = 1
        part.CanCollide = false
        part.Anchored = true
        part.Position = position
        billboardGui.Adornee = part
        local textLabel = Instance.new("TextLabel", billboardGui)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "star"
        textLabel.TextScaled = true
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.FontFace = fontFace
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        local value2 = math.random(-8, 8)
        local value3 = math.random(-1, 1)
        local value4 = math.random(-8, 8)
        TweenService2:Create(part, tweenInfo, {Position = part.Position + Vector3.new(value2, value3, value4)}):Play()
        TweenService2:Create(textLabel, tweenInfo, {TextTransparency = 1, Rotation = math.random(-180, 180)}):Play()
        task.delay(0.6, function()
            part:Destroy()
            billboardGui:Destroy()
        end)
    end
    local function fn65()
        pcall(function()
            local sound = Instance.new("Sound", SoundService)
            sound.SoundId = tbl6[tbl.hitSoundMode] or tbl6[1]
            sound.Volume = 2
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 1)
        end)
    end
    UserInputService2.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if not (not tbl.hitPartOn and not tbl.hitSoundOn) then
                    local currentCamera = workspace.CurrentCamera
                    if currentCamera then
                        local mouseLocation = UserInputService2:GetMouseLocation()
                        local v5 = currentCamera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
                        local element = workspace:Raycast(v5.Origin, v5.Direction * 1000)
                        if element and element.Instance then
                            local model = element.Instance:FindFirstAncestorOfClass("Model")
                            local humanoid
                            if model then
                                humanoid = model:FindFirstChildOfClass("Humanoid")
                            else
                                humanoid = model
                            end
                            if humanoid then
                                humanoid = model ~= localPlayer.Character
                            end
                            if humanoid then
                                if tbl.hitSoundOn then
                                    fn65()
                                end
                                if tbl.hitPartOn then
                                    for i = 1, 8 do
                                        fn64(element.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)();
(function()
    local emotesTab = window:AddTab({Name = "Emotes", Icon = "person-jumping", NoFade = true})
    local emotesSection = emotesTab:AddSection({Name = "Emotes", Position = "left"})
    FavoriteEmotes = FavoriteEmotes or {}
    FavoriteAnimations = FavoriteAnimations or {}
    refreshFavoriteViews = nil
    local fn63 = function(v5, text2, list3, v6, v7, item, v8, v9)
        local parent = v5.Section.Items.Content.Instance
        local textBox = nil
        if not v9 then
            textBox = Instance.new("TextBox")
            textBox.Name = v6 .. "Search"
            textBox.Size = UDim2.new(1, 0, 0, 30)
            textBox.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
            textBox.BackgroundTransparency = 0.1
            textBox.BorderSizePixel = 0
            textBox.ClearTextOnFocus = false
            textBox.Font = Enum.Font.Gotham
            textBox.PlaceholderText = "Search " .. text2 .. "..."
            textBox.PlaceholderColor3 = Color3.fromRGB(150, 145, 140)
            textBox.Text = ""
            textBox.TextColor3 = connection.Theme and connection.Theme.Text or Color3.fromRGB(245, 242, 238)
            textBox.TextSize = 11
            textBox.TextXAlignment = Enum.TextXAlignment.Left
            textBox.ZIndex = 6
            textBox.Parent = parent
            Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
            local padding = Instance.new("UIPadding", textBox)
            padding.PaddingLeft = UDim.new(0, 9)
            padding.PaddingRight = UDim.new(0, 7)
        else
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = v6 .. "FavoritesHeader"
            textLabel.Size = UDim2.new(1, 0, 0, 22)
            textLabel.BackgroundTransparency = 1
            textLabel.Font = Enum.Font.GothamBold
            textLabel.Text = text2
            textLabel.TextColor3 = connection.Theme and connection.Theme["Light Accent"] or Color3.fromRGB(255, 170, 54)
            textLabel.TextSize = 12
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.ZIndex = 6
            textLabel.Parent = parent
        end
        local scrollingFrame = Instance.new("ScrollingFrame")
        scrollingFrame.Name = text2:gsub("%s", "") .. "Cards"
        local n3 = v9 and 130 or 237
        scrollingFrame.Size = UDim2.new(1, 0, 0, n3)
        scrollingFrame.BackgroundColor3 = Color3.fromRGB(10, 9, 8)
        scrollingFrame.BackgroundTransparency = 0.35
        scrollingFrame.BorderSizePixel = 0
        scrollingFrame.ScrollBarThickness = 3
        scrollingFrame.ScrollBarImageColor3 = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
        scrollingFrame.Active = true
        scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
        scrollingFrame:SetAttribute("SkipPageFade", true)
        scrollingFrame.ZIndex = 4
        scrollingFrame.Parent = parent
        Instance.new("UICorner", scrollingFrame).CornerRadius = UDim.new(0, 7)
        local padding = Instance.new("UIPadding", scrollingFrame)
        padding.PaddingTop = UDim.new(0, 7)
        padding.PaddingLeft = UDim.new(0, 7)
        padding.PaddingRight = UDim.new(0, 7)
        padding.PaddingBottom = UDim.new(0, 7)
        local list4 = {}
        local list5 = {}
        local n4 = 72
        local n5 = 7
        local n6 = 2
        local fn63 = nil
        local function fn64(v10, textColor3)
            local theme = connection.Theme or {}
            local stroke = v10.Stroke
            local color = theme.Accent
            if not color then
                color = Color3.fromRGB(224, 116, 24)
            end
            stroke.Color = color
            v10.Stroke.Enabled = textColor3
            v10.Stroke.Thickness = textColor3 and 2 or 1
            local card = v10.Card
            local backgroundColor3 = textColor3 and (theme.Element or Color3.fromRGB(15, 13, 11))
            if not backgroundColor3 then
                backgroundColor3 = theme.Inline
                if not backgroundColor3 then
                    backgroundColor3 = Color3.fromRGB(15, 13, 11)
                end
            end
            card.BackgroundColor3 = backgroundColor3
            v10.Card.BackgroundTransparency = textColor3 and 0.02 or 0.18
            local title = v10.Title
            if textColor3 then
                textColor3 = theme["Light Accent"] or Color3.fromRGB(255, 170, 54)
            end
            if not textColor3 then
                textColor3 = theme.Text or Color3.fromRGB(245, 242, 238)
            end
            title.TextColor3 = textColor3
        end
        local function fn65(v10, v11)
            if v11 then
                v11 = v8[v11] == true
            end
            v10.Star.Text = v11 and "★" or "☆"
            local star = v10.Star
            local textColor3
            if v11 then
                local lightAccent = connection.Theme and connection.Theme["Light Accent"]
                if lightAccent then
                    textColor3 = lightAccent
                else
                    textColor3 = Color3.fromRGB(255, 170, 54)
                end
            else
                textColor3 = v11
            end
            if not textColor3 then
                textColor3 = Color3.fromRGB(150, 145, 140)
            end
            star.TextColor3 = textColor3
        end
        local function fn66(name, v10)
            item.Name = name
            if refreshFavoriteViews then
                refreshFavoriteViews()
            end
            if v7 then
                v7(name, v10)
            end
        end
        local function fn67(v10)
            v8[v10] = not v8[v10] or nil
            SaveFavoriteStore()
            if refreshFavoriteViews then
                refreshFavoriteViews()
            end
            if fn63 then
                fn63()
            end
        end
        local function fn68(item2, name, layoutOrder)
            item2.Name = name
            local value2 = math.floor((layoutOrder - 1) / n6)
            local v10 = (layoutOrder - 1) % n6
            local n7 = v10 == 0 and 0 or 3
            item2.Card.Position = UDim2.new(v10 / n6, n7, 0, value2 * (n4 + n5) + 7)
            item2.Card.Visible = true
            item2.Title.Text = tostring(name)
            item2.Card.LayoutOrder = layoutOrder
            fn65(item2, name)
            fn64(item2, name == item.Name)
        end
        local function fn69()
            local value2 = n4 + n5
            local value3 = math.max(0, math.floor(scrollingFrame.CanvasPosition.Y / value2) - 1) * n6 + 1
            for i, value4 in ipairs(list4) do
                local value5 = value3 + i - 1
                local v10 = list5[value5]
                if v10 then
                    fn68(value4, v10, value5)
                else
                    value4.Name = nil
                    value4.Card.Visible = false
                end
            end
        end
        for i = 1, 16 do
            local textButton = Instance.new("TextButton")
            textButton.Name = v6 .. "VirtualCard" .. i
            textButton.Size = UDim2.new(0.5, -4, 0, 72)
            textButton.AutoButtonColor = false
            textButton.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
            textButton.BackgroundTransparency = 0.18
            textButton.BorderSizePixel = 0
            textButton.Text = ""
            textButton.ZIndex = 5
            textButton.Parent = scrollingFrame
            Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 7)
            local stroke = Instance.new("UIStroke", textButton)
            stroke.Color = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Thickness = 1
            stroke.Enabled = false
            local frame = Instance.new("Frame")
            frame.Name = "TypeMarker"
            frame.Size = UDim2.new(0, 4, 1, -16)
            frame.Position = UDim2.new(0, 7, 0, 8)
            frame.BackgroundColor3 = connection.Theme and connection.Theme.Accent or Color3.fromRGB(224, 116, 24)
            frame.BorderSizePixel = 0
            frame.ZIndex = 6
            frame.Parent = textButton
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 2)
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "Title"
            textLabel.Size = UDim2.new(1, -52, 1, -12)
            textLabel.Position = UDim2.new(0, 18, 0, 6)
            textLabel.BackgroundTransparency = 1
            textLabel.Font = Enum.Font.GothamBold
            textLabel.TextColor3 = connection.Theme and connection.Theme.Text or Color3.fromRGB(245, 242, 238)
            textLabel.TextSize = 11
            textLabel.TextYAlignment = Enum.TextYAlignment.Center
            textLabel.TextXAlignment = Enum.TextXAlignment.Center
            textLabel.TextWrapped = true
            textLabel.TextTruncate = Enum.TextTruncate.None
            textLabel.ZIndex = 6
            textLabel.Parent = textButton
            local textButton2 = Instance.new("TextButton")
            textButton2.Name = "Favorite"
            textButton2.Size = UDim2.new(0, 24, 0, 24)
            textButton2.Position = UDim2.new(1, -29, 0, 5)
            textButton2.BackgroundTransparency = 1
            textButton2.BorderSizePixel = 0
            textButton2.AutoButtonColor = false
            textButton2.Font = Enum.Font.GothamBold
            textButton2.TextSize = 19
            textButton2.Text = "☆"
            textButton2.ZIndex = 8
            textButton2.Parent = textButton
            local item2 = {Card = textButton, Stroke = stroke, Title = textLabel, Star = textButton2, Name = nil}
            list4[i] = item2
            textButton.Activated:Connect(function()
                if item2.Name then
                    fn66(item2.Name, true)
                end
            end)
            textButton2.Activated:Connect(function()
                if item2.Name then
                    fn67(item2.Name)
                end
            end)
        end
        local function fn70()
            local value2 = math.ceil(#list5 / n6)
            scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, value2 * (n4 + n5) + 14)
            local max, n7, value3 = math.max, 0, scrollingFrame.CanvasSize.Y.Offset - scrollingFrame.AbsoluteSize.Y
            local v10 = max(n7, value3)
            if scrollingFrame.CanvasPosition.Y > v10 then
                scrollingFrame.CanvasPosition = Vector2.new(0, v10)
            end
            fn69()
        end
        fn63 = function()
            table.clear(list5)
            local text3 = textBox
            if textBox then
                text3 = string.lower(textBox.Text or "")
            end
            if not text3 then
                text3 = ""
            end
            for _, value2 in ipairs(list3) do
                if (text3 == "" or string.find(string.lower(value2), text3, 1, true) ~= nil) and (not v9 or v8[value2] == true) then
                    table.insert(list5, value2)
                end
            end
            fn70()
        end
        scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(fn69)
        scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn69)
        if textBox then
            textBox:GetPropertyChangedSignal("Text"):Connect(fn63)
        end
        fn63()
        return {
            Select = function(_, name)
                item.Name = name
                fn63()
            end,
            Refresh = fn63,
            Get = function()
                return item.Name
            end,
        }
    end
    local tbl6 = {Name = nil}
    local tbl7 = {Name = nil}
    local v5 = fn63(emotesSection, "Emotes", EmoteList, "Emote", function(v5, v6)
        StopEmotes()
        LastEmoteAction = {Type = "Emote", Name = v5}
        PlayEmote(v5)
        if v6 then
            fn51()
            tbl3.new({Title = "Emotes", Content = v5, Duration = 2})
        end
    end, tbl6, FavoriteEmotes, false)
    local v6 = fn63(emotesSection, "Favorites Emotes", EmoteList, "FavoriteEmote", function(v6)
        StopEmotes()
        LastEmoteAction = {Type = "Emote", Name = v6}
        PlayEmote(v6)
    end, tbl6, FavoriteEmotes, true)
    tbl.kbBtnRow(emotesSection, "StopEmote", {
        Name = "Stop Emote",
        Icon = "pause",
        Callback = function()
            LastEmoteAction = nil
            StopEmotes()
            v5:Select("")
            fn52()
            tbl3.new({Title = "Emotes", Content = "Stopped.", Duration = 2})
        end,
    })
    local animationsSection = emotesTab:AddSection({Name = "Animations", Position = "right"})
    local v7 = fn63(animationsSection, "Animations", AnimationList, "Animation", function(v7, v8)
        StopEmotes()
        LastEmoteAction = {Type = "Anim", Name = v7}
        local v9 = Animations[v7]
        if v9 then
            PlayAnimationBody(v9.Idle, v9.Idle2, v9.Idle3, v9.Walk, v9.Run, v9.Jump, v9.Climb, v9.Fall, v9.Swim, v9.SwimIdle, v9.Weight, v9.Weight2)
            RefreshAnims()
            if v8 then
                fn51()
                tbl3.new({Title = "Animations", Content = v7, Duration = 2})
            end
        end
    end, tbl7, FavoriteAnimations, false)
    local v8 = fn63(animationsSection, "Favorites Animations", AnimationList, "FavoriteAnimation", function(v8)
        StopEmotes()
        LastEmoteAction = {Type = "Anim", Name = v8}
        local v9 = Animations[v8]
        if v9 then
            PlayAnimationBody(v9.Idle, v9.Idle2, v9.Idle3, v9.Walk, v9.Run, v9.Jump, v9.Climb, v9.Fall, v9.Swim, v9.SwimIdle, v9.Weight, v9.Weight2)
            RefreshAnims()
        end
    end, tbl7, FavoriteAnimations, true)
    refreshFavoriteViews = function()
        if v6 then
            v6:Refresh()
        end
        if v8 then
            v8:Refresh()
        end
        if v5 then
            v5:Refresh()
        end
        if v7 then
            v7:Refresh()
        end
    end
    tbl.kbBtnRow(animationsSection, "ResetAnim", {
        Name = "Reset Animation",
        Icon = "rotate-ccw",
        Callback = function()
            LastEmoteAction = nil
            ResetAnimation()
            RefreshAnims()
            fn52()
            tbl3.new({Title = "Animations", Content = "Reset.", Duration = 2})
        end,
    })
end)();
(function()
    local soundTab = window:AddTab({Name = "Sound", Icon = "speaker"})
    local uISoundSettingsSection = soundTab:AddSection({Name = "UI Sound Settings", Position = "left"})
    uiRefs.SoundsEnabled = tbl.kbTglRow(uISoundSettingsSection, "UISounds", "UI Sounds Enabled", {
        Default = true,
        Callback = function(value2)
            soundsEnabled = value2
            if value2 then
                fn51()
            end
        end,
    })
    uiRefs.EnableSound = uISoundSettingsSection:AddLabel("Enable Sound"):AddDropdown({
        Default = "Enable 1",
        Values = {"Enable 1", "Sparkle", "Laser Click", "Enable 2", "Notify"},
        Callback = function(value2)
            selectedEnableSound = value2
            fn50(soundIds[value2])
        end,
    })
    uiRefs.DisableSound = uISoundSettingsSection:AddLabel("Disable Sound"):AddDropdown({
        Default = "Enable 1",
        Values = {"Enable 1", "Sparkle", "Laser Click", "Enable 2", "Notify"},
        Callback = function(value2)
            selectedDisableSound = value2
            fn50(soundIds[value2])
        end,
    })
    tbl.kbBtnRow(uISoundSettingsSection, "TestSound", {
        Name = "Test UI Sound",
        Icon = "speaker",
        Callback = function()
            fn50(soundIds[selectedEnableSound])
        end,
    })
    local customSoundsSection = soundTab:AddSection({Name = "Custom Sounds", Position = "right"})
    local tbl6 = {
        Default = "Default",
        Values = customGameSoundNames,
        Callback = function(value2)
            selectedGunKill = value2
            tbl3.new({Title = "GunKill Sound", Content = "Set to: " .. value2, Duration = 2})
        end,
    }
    uiRefs.GunKill = customSoundsSection:AddLabel("GunKill Sound"):AddDropdown(tbl6)
    local tbl7 = {
        Default = "Default",
        Values = customGameSoundNames,
        Callback = function(value2)
            selectedGunshot = value2
            tbl3.new({Title = "Gunshot Sound", Content = "Set to: " .. value2, Duration = 2})
        end,
    }
    uiRefs.Gunshot = customSoundsSection:AddLabel("Gunshot Sound"):AddDropdown(tbl7)
    local tbl8 = {
        Default = "Default",
        Values = customGameSoundNames,
        Callback = function(value2)
            selectedKnifeKill = value2
            tbl3.new({Title = "Knife Kill Sound", Content = "Set to: " .. value2, Duration = 2})
        end,
    }
    uiRefs.KnifeKill = customSoundsSection:AddLabel("Knife Kill Sound"):AddDropdown(tbl8)
    local function fn63(v5, v6, v7)
        local v8 = v6[v7]
        if not v8 then
            tbl3.new({Title = v5, Content = "Select a custom sound first.", Duration = 2})
        else
            fn50(v8)
            tbl3.new({Title = v5, Content = "Tested: " .. tostring(v7), Duration = 2})
        end
    end
    tbl.kbBtnRow(customSoundsSection, "TestGunKillSound", {
        Name = "Test GunKill Sound",
        Icon = "speaker",
        Callback = function()
            fn63("GunKill Sound", gunKillSounds, selectedGunKill)
        end,
    })
    tbl.kbBtnRow(customSoundsSection, "TestGunshotSound", {
        Name = "Test Gunshot Sound",
        Icon = "speaker",
        Callback = function()
            fn63("Gunshot Sound", gunshotSounds, selectedGunshot)
        end,
    })
    tbl.kbBtnRow(customSoundsSection, "TestKnifeKillSound", {
        Name = "Test Knife Kill Sound",
        Icon = "speaker",
        Callback = function()
            fn63("Knife Kill Sound", knifeKillSounds, selectedKnifeKill)
        end,
    })
    uiRefs.ShutupReload = tbl.kbTglRow(customSoundsSection, "ShutupReload", "Shutup GunReload", {
        Default = false,
        Callback = function(value2)
            shutupReload = value2
            local newFn = tbl3.new
            local tbl9 = {Title = "GunReload Sound"}
            if value2 then
                value2 = "Muted!"
            end
            tbl9.Content = value2 or "Unmuted!"
            tbl9.Duration = 2
            newFn(tbl9)
        end,
    })
end)();
(function()
    local configManagerSection = window.Configs:AddSection({Name = "Config Manager", Position = "left"})
    local text2 = "default"
    local dropdown = nil
    local function fn63(v5)
        if dropdown then
            dropdown:SetValues(fn60(v5))
        end
    end
    configManagerSection:AddLabel("Config Name"):AddTextInput({
        Default = "default",
        Placeholder = "Enter name...",
        Callback = function(value2)
            if value2 and value2 ~= "" then
                text2 = value2
            end
        end,
    })
    tbl.kbBtnRow(configManagerSection, "CfgSave", {
        Name = "Save Config",
        Icon = "floppy-disk",
        Callback = function()
            fn(text2)
            task.spawn(function()
                task.wait(0.2)
                fn63(true)
            end)
        end,
    })
    dropdown = configManagerSection:AddLabel("Select Config"):AddDropdown({
        Default = "default",
        MaxSize = 360,
        Values = {"default"},
        Callback = function(value2)
            if value2 and value2 ~= "" then
                text2 = value2
            end
        end,
    })
    task.spawn(function()
        task.wait(0.1)
        fn63(true)
    end)
    tbl.kbBtnRow(configManagerSection, "CfgLoad", {
        Name = "Load Config",
        Icon = "arrow-right-from-portrait-rectangle",
        Callback = function()
            fn2(text2)
        end,
    })
    configManagerSection:AddButton({
        Name = "Refresh List",
        Icon = "arrow-spin-clockwise",
        Callback = function()
            tbl3.new({Title = "Configs", Content = "Refreshing...", Duration = 2})
            task.spawn(function()
                fn63(true)
                tbl3.new({Title = "Configs", Content = "List refreshed!", Duration = 2})
            end)
        end,
    })
    tbl.kbBtnRow(configManagerSection, "CfgDelete", {
        Name = "Delete Config",
        Icon = "trash-can",
        Callback = function()
            local text3 = configFolder .. "/" .. text2 .. ".json"
            tbl3.new({Title = "Config", Content = "Deleting " .. text2 .. "...", Duration = 2})
            task.spawn(function()
                local enabled3 = false
                if delfile then
                    enabled3 = pcall(delfile, text3)
                end
                if enabled3 then
                    task.wait(0.2)
                    fn63(true)
                    tbl3.new({Title = "Config", Content = "Deleted " .. text2, Duration = 2})
                else
                    tbl3.new({Title = "Config", Content = "Can't delete file!", Duration = 3})
                end
            end)
        end,
    })
end)()
pcall(function()
    getfenv()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Watermark"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    if gethui then
        screenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(screenGui)
        screenGui.Parent = game:GetService("CoreGui")
    else
        pcall(function()
            screenGui.Parent = game:GetService("CoreGui")
        end)
        if not screenGui.Parent then
            screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
        end
    end
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 0, 0, 32)
    frame.Position = UDim2.new(0.5, 0, 1, -70)
    frame.AnchorPoint = Vector2.new(0.5, 1)
    frame.BackgroundColor3 = Color3.fromRGB(16, 12, 9)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = screenGui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.2
    stroke.Transparency = 0.35
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Color = Color3.fromRGB(62, 40, 22)
    stroke.Parent = frame
    local gradient = Instance.new("UIGradient")
    local newColorSequence = ColorSequence.new
    local tbl6 = {}
    local newColorSequenceKeypoint = ColorSequenceKeypoint.new
    local v5 = table.pack(Color3.fromRGB(224, 116, 24))
    local n3 = v5.n
    v5.n = 2 + n3 - 1
    table.move(v5, 1, n3, 2, v5)
    v5[1] = 0
    local v6 = newColorSequenceKeypoint(table.unpack(v5, 1, v5.n))
    local newColorSequenceKeypoint2 = ColorSequenceKeypoint.new
    local v7 = table.pack(Color3.fromRGB(62, 40, 22))
    local n4 = v7.n
    v7.n = 2 + n4 - 1
    table.move(v7, 1, n4, 2, v7)
    v7[1] = 0.5
    local v8 = newColorSequenceKeypoint2(table.unpack(v7, 1, v7.n))
    local newColorSequenceKeypoint3 = ColorSequenceKeypoint.new
    local v9 = table.pack(Color3.fromRGB(224, 116, 24))
    local n5 = v9.n
    v9.n = 2 + n5 - 1
    table.move(v9, 1, n5, 2, v9)
    v9[1] = 1
    local v10 = table.pack(newColorSequenceKeypoint3(table.unpack(v9, 1, v9.n)))
    tbl6[1], tbl6[2] = v6, v8
    table.move(v10, 1, v10.n, 3, tbl6)
    gradient.Color = newColorSequence(tbl6)
    gradient.Parent = stroke
    local list3 = {}
    connection.ThemeObjects = connection.ThemeObjects or {}
    local function fn63(instance2, v11, v12)
        table.insert(connection.ThemeObjects, {Object = instance2, Property = v11, Key = v12})
        if connection.Theme and connection.Theme[v12] then
            if instance2:IsA("UIGradient") and v11 == "Color" then
                instance2[v11] = ColorSequence.new(connection.Theme.Accent, connection.Theme["Light Accent"])
            else
                instance2[v11] = connection.Theme[v12]
            end
        end
    end
    local function getImageLabel(v11)
        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Size = UDim2.new(0, 16, 0, 16)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = "rbxassetid://" .. v11
        imageLabel.ImageColor3 = Color3.fromRGB(224, 116, 24)
        imageLabel.Parent = frame
        table.insert(list3, imageLabel)
        return imageLabel
    end
    local function getTextLabel(text2, v11)
        local textLabel = Instance.new("TextLabel")
        textLabel.BackgroundTransparency = 1
        textLabel.Font = Enum.Font.GothamBold
        textLabel.Text = text2
        local textColor3
        if v11 then
            textColor3 = v11
        else
            textColor3 = Color3.fromRGB(242, 236, 230)
        end
        textLabel.TextColor3 = textColor3
        textLabel.TextSize = 13
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = frame
        table.insert(list3, textLabel)
        return textLabel
    end
    local imageLabel = getImageLabel(10709752035)
    local textLabel = getTextLabel("")
    local imageLabel2 = getImageLabel(10734961133)
    local textLabel2 = getTextLabel("")
    local imageLabel3 = getImageLabel(101909399146074)
    local v11 = table.pack(Color3.fromRGB(224, 116, 24))
    local n6 = v11.n
    v11.n = 2 + n6 - 1
    table.move(v11, 1, n6, 2, v11)
    v11[1] = "KITI"
    local textLabel3 = getTextLabel(table.unpack(v11, 1, v11.n))
    fn63(frame, "BackgroundColor3", "Background")
    fn63(stroke, "Color", "Border")
    fn63(imageLabel, "ImageColor3", "Accent")
    fn63(imageLabel2, "ImageColor3", "Accent")
    fn63(imageLabel3, "ImageColor3", "Accent")
    fn63(textLabel, "TextColor3", "Text")
    fn63(textLabel2, "TextColor3", "Text")
    fn63(textLabel3, "TextColor3", "Accent")
    local parent = Instance.new("Frame")
    parent.Size = UDim2.new(1, 0, 1, 0)
    parent.BackgroundTransparency = 1
    parent.BorderSizePixel = 0
    parent.ZIndex = 5
    parent.Parent = frame
    local gradient2 = Instance.new("UIGradient")
    local newColorSequence2 = ColorSequence.new
    local tbl7 = {}
    local newColorSequenceKeypoint4 = ColorSequenceKeypoint.new
    local v12 = table.pack(Color3.fromRGB(224, 116, 24))
    local n7 = v12.n
    v12.n = 2 + n7 - 1
    table.move(v12, 1, n7, 2, v12)
    v12[1] = 0
    local v13 = newColorSequenceKeypoint4(table.unpack(v12, 1, v12.n))
    local newColorSequenceKeypoint5 = ColorSequenceKeypoint.new
    local v14 = table.pack(Color3.fromRGB(255, 170, 54))
    local n8 = v14.n
    v14.n = 2 + n8 - 1
    table.move(v14, 1, n8, 2, v14)
    v14[1] = 1
    local v15 = table.pack(newColorSequenceKeypoint5(table.unpack(v14, 1, v14.n)))
    tbl7[1] = v13
    table.move(v15, 1, v15.n, 2, tbl7)
    gradient2.Color = newColorSequence2(tbl7)
    local newNumberSequence = NumberSequence.new
    local tbl8 = {}
    local v16 = NumberSequenceKeypoint.new(0, 1)
    local v17 = NumberSequenceKeypoint.new(0.5, 0.8)
    local v18 = table.pack(NumberSequenceKeypoint.new(1, 1))
    tbl8[1], tbl8[2] = v16, v17
    table.move(v18, 1, v18.n, 3, tbl8)
    gradient2.Transparency = newNumberSequence(tbl8)
    gradient2.Rotation = 90
    gradient2.Offset = Vector2.new(-1, 0)
    gradient2.Parent = parent
    fn63(gradient2, "Color", "Accent")
    if connection.ApplyTheme then
        connection:ApplyTheme(connection.CurrentTheme or "Default")
    end
    local textButton = Instance.new("TextButton")
    textButton.Size = UDim2.new(1, 0, 1, 0)
    textButton.BackgroundTransparency = 1
    textButton.Text = ""
    textButton.BorderSizePixel = 0
    textButton.ZIndex = 10
    textButton.Parent = frame
    local enabled3 = false
    local v19 = nil
    local position = nil
    local position2 = nil
    local enabled4 = false
    textButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            enabled3 = true
            enabled4 = false
            position = input.Position
            position2 = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    enabled3 = false
                end
            end)
        end
    end)
    textButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            v19 = input
        end
    end)
    UserInputService2.InputChanged:Connect(function(input)
        if input == v19 and enabled3 then
            local vec = input.Position - position
            if 5 < vec.Magnitude then
                enabled4 = true
            end
            frame.Position = UDim2.new(position2.X.Scale, position2.X.Offset + vec.X, position2.Y.Scale, position2.Y.Offset + vec.Y)
        end
    end)
    local n9 = 0
    textButton.MouseButton1Click:Connect(function()
        if not enabled4 and tick() - n9 > 0.2 then
            n9 = tick()
            if window then
                if typeof(window.SetOpen) == "function" then
                    window:SetOpen(not window.IsOpen)
                elseif typeof(window.ToggleInterface) == "function" then
                    window:ToggleInterface()
                elseif typeof(window.Toggle) == "function" then
                    window:Toggle()
                end
            end
        end
    end)
    local n10 = 0
    RunService.RenderStepped:Connect(function()
        n10 = n10 + 1
    end)
    local function fn64()
        local n11 = 10
        for _, value2 in ipairs(list3) do
            if value2:IsA("ImageLabel") then
                value2.Position = UDim2.new(0, n11, 0.5, -8)
                n11 = n11 + 16 + 5
            else
                local x = value2.TextBounds.X
                value2.Size = UDim2.new(0, x, 0, 18)
                value2.Position = UDim2.new(0, n11, 0.5, -9)
                n11 = n11 + x + 8
            end
        end
        frame.Size = UDim2.new(0, n11 + 2, 0, 32)
    end
    task.spawn(function()
        while true do
            local v20 = n10
            n10 = 0
            local n11 = 0
            pcall(function()
                local value2 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
                if type(value2) == "number" then
                    n11 = math.round(value2)
                end
            end)
            textLabel.Text = tostring(v20) .. " fps"
            textLabel2.Text = tostring(n11) .. " ms"
            fn64()
            task.wait(1)
        end
    end)
    task.spawn(function()
        while true do
            gradient.Rotation = (gradient.Rotation + 1) % 360
            task.wait(0.03)
        end
    end)
    task.spawn(function()
        while true do
            local v20 = TweenService2
            local create = v20.Create
            local tweenInfo = TweenInfo.new(1.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
            local tbl9 = {}
            tbl9.Offset = Vector2.new(2, 0)
            local tween = create(v20, gradient2, tweenInfo, tbl9)
            tween:Play()
            tween.Completed:Wait()
            task.wait(1.5)
            gradient2.Offset = Vector2.new(-1, 0)
        end
    end)
end)
if window.Items.MainFrame and window.Items.MainFrame.Instance then
    window.Items.MainFrame.Instance.ClipsDescendants = false
end
if window.Items.Shadow and window.Items.Shadow.Instance then
    window.Items.Shadow.Instance.Visible = true
    window.Items.Shadow.Instance.ImageTransparency = 0.45
    window.Items.Shadow.Instance.Size = UDim2.new(1, 55, 1, 55)
    window.Items.Shadow.Instance.Position = UDim2.new(0.5, 0, 0.5, 0)
end
if tbl and tbl.Language == "Russian" then
    task.defer(function()
        local applyLanguage = tbl
        if tbl then
            applyLanguage = tbl.ApplyLanguage
        end
        if applyLanguage then
            tbl.ApplyLanguage("Russian")
        end
    end)
end
return 1
