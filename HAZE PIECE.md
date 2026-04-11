-- ts file was generated at discord.gg/25ms

repeat
    wait()
until game:IsLoaded()

local u1 = {}
local _UserInputService = game:GetService('UserInputService')
local _TweenService = game:GetService('TweenService')
local _RunService = game:GetService('RunService')
local u5 = game:GetService('Players').LocalPlayer:GetMouse()
local _HttpService = game:GetService('HttpService')
local u7 = {}

_G.Key = ''
_G.Discord = ''

if game.CoreGui:FindFirstChild(_G.Key .. ',' .. _G.Discord) then
    game.CoreGui:FindFirstChild(_G.Key .. ',' .. _G.Discord):Destroy()
end

local u8 = {}
local u12 = setmetatable({}, {
    __newindex = function(p9, p10, p11)
        rawset(p9, p10, p11)
    end,
})
local u13 = {
    FileName = game.Players.LocalPlayer.Name .. '_HazePiece',
    Folder = 'Hyper',
    AutoSave = true,
}

function u8.Create(_)
    local _FileName = u13.FileName
    local _Folder = u13.Folder

    if not isfolder(_Folder) then
        makefolder(_Folder)
    end
    if isfile(_Folder .. '/' .. _FileName .. '.json') then
        return {
            true,
            'Folder Created.',
        }
    end

    xpcall(function()
        writefile(_Folder .. '/' .. _FileName .. '.json', '{}')
    end, function(p16)
        return {false, p16}
    end)
end
function u8.Loadfile(_)
    local _FileName2 = u13.FileName
    local _Folder2 = u13.Folder

    if not isfolder(_Folder2) then
        u8:Create()
    end
    if not isfile(_Folder2 .. '/' .. _FileName2 .. '.json') then
        u8:Create()

        return {
            false,
            'Somethings error in Line :' .. debug.traceback(),
        }
    end

    xpcall(function()
        local v19 = game:GetService('HttpService'):JSONDecode(readfile(_Folder2 .. '/' .. _FileName2 .. '.json'))

        u12 = v19

        return {true, v19}
    end, function(p20)
        return {false, p20}
    end)
end
function u8.SaveFile(_)
    local _FileName3 = u13.FileName
    local _Folder3 = u13.Folder

    if not isfolder(_Folder3) then
        u8:Create()
    end
    if not isfile(_Folder3 .. '/' .. _FileName3 .. '.json') then
        u8:Create()

        return {
            false,
            'Somethings error in Line :' .. debug.traceback(),
        }
    end

    local v23, v24 = pcall(game.HttpService.JSONEncode, game.HttpService, u12)

    if not v23 then
        return {
            false,
            'Somethings error pls try again.' .. debug.traceback(),
        }
    end

    writefile(_Folder3 .. '/' .. _FileName3 .. '.json', v24)

    return {
        true,
        'Success to readfile',
    }
end

pcall(function()
    u7 = _HttpService:JSONDecode(readfile('Ex.txt'))
end)

local u25 = u7.pfp or 'https://www.roblox.com/headshot-thumbnail/image?userId=' .. game.Players.LocalPlayer.UserId .. '&width=420&height=420&format=png'
local u26 = u7.user or game.Players.LocalPlayer.Name
local u27 = u7.tag or tostring(math.random(1, 10))

local function u29()
    u7.pfp = u25
    u7.user = u26
    u7.tag = u27

    local v28 = _HttpService

    writefile('Ex.txt', v28:JSONEncode(u7))
end
local function u44(p30, p31)
    local u32 = nil
    local u33 = nil
    local u34 = nil
    local u35 = nil

    local function u40(p36)
        local v37 = p36.Position - u32
        local v38 = _TweenService
        local v39 = {
            Position = UDim2.new(u33.X.Scale, u33.X.Offset + v37.X, u33.Y.Scale, u33.Y.Offset + v37.Y),
        }

        v38:Create(p31, TweenInfo.new(0.2), v39):Play()
    end

    p30.InputBegan:Connect(function(p41)
        if p41.UserInputType == Enum.UserInputType.MouseButton1 or p41.UserInputType == Enum.UserInputType.Touch then
            u34 = true
            u32 = p41.Position
            u33 = p31.Position

            p41.Changed:Connect(function()
                if p41.UserInputState == Enum.UserInputState.End then
                    u34 = false
                end
            end)
        end
    end)
    p30.InputChanged:Connect(function(p42)
        if p42.UserInputType == Enum.UserInputType.MouseMovement or p42.UserInputType == Enum.UserInputType.Touch then
            u35 = p42
        end
    end)
    _UserInputService.InputChanged:Connect(function(p43)
        if p43 == u35 and u34 then
            u40(p43)
        end
    end)
end

local _ScreenGui = Instance.new('ScreenGui')

_ScreenGui.Name = _G.Key .. ',' .. _G.Discord
_ScreenGui.Parent = game.CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

game:GetService('UserInputService').InputBegan:connect(function(p46, _)
    if p46.KeyCode == Enum.KeyCode.L then
        wait()

        _ScreenGui.Enabled = not _ScreenGui.Enabled
    end
end)

function u1.Window(_, p47, _)
    local u48 = ''
    local u49 = false
    local u50 = false
    local u51 = false
    local _Frame = Instance.new('Frame')
    local _Frame2 = Instance.new('Frame')
    local _TextLabel = Instance.new('TextLabel')
    local _TextButton = Instance.new('TextButton')
    local _ImageLabel = Instance.new('ImageLabel')
    local _TextButton2 = Instance.new('TextButton')
    local _ImageLabel2 = Instance.new('ImageLabel')
    local _Folder4 = Instance.new('Folder')
    local _Frame3 = Instance.new('Frame')
    local _Frame4 = Instance.new('Frame')
    local _UICorner = Instance.new('UICorner')
    local _UICorner2 = Instance.new('UICorner')
    local _ImageLabel3 = Instance.new('ImageLabel')
    local _ImageLabel4 = Instance.new('ImageLabel')
    local _TextLabel2 = Instance.new('TextLabel')
    local _TextLabel3 = Instance.new('TextLabel')
    local _Frame5 = Instance.new('Frame')
    local _ScrollingFrame = Instance.new('ScrollingFrame')
    local _UIListLayout = Instance.new('UIListLayout')
    local _UIPadding = Instance.new('UIPadding')
    local _Frame6 = Instance.new('Frame')
    local _Frame7 = Instance.new('Frame')

    _Frame.Name = 'MainFrame'
    _Frame.Parent = _ScreenGui
    _Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
    _Frame.BackgroundTransparency = 1
    _Frame.BorderSizePixel = 0
    _Frame.ClipsDescendants = true
    _Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    _Frame.Size = UDim2.new(0, 611, 0, 396)
    _UICorner2.CornerRadius = UDim.new(0, 7)
    _UICorner2.Name = 'UserIconCorner'
    _UICorner2.Parent = _Frame
    _Frame2.Name = 'TopFrame'
    _Frame2.Parent = _Frame
    _Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame2.BackgroundTransparency = 1
    _Frame2.BorderSizePixel = 0
    _Frame2.Position = UDim2.new(-0.000658480625, 0, 0, 0)
    _Frame2.Size = UDim2.new(0, 681, 0, 22)
    _Frame7.Name = 'TopFramess'
    _Frame7.Parent = _Frame2
    _Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame7.BackgroundTransparency = 1
    _Frame7.BorderSizePixel = 0
    _Frame7.ZIndex = 99
    _Frame7.Position = UDim2.new(-0.2, 0, 1.3, 0)
    _Frame7.Size = UDim2.new(0, 681, 0, 22)
    _Frame6.Name = 'TopFrameHolder'
    _Frame6.Parent = _Frame2
    _Frame6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame6.BackgroundTransparency = 1
    _Frame6.BorderSizePixel = 0
    _Frame6.Position = UDim2.new(-0.000658480625, 0, 0, 0)
    _Frame6.Size = UDim2.new(0, 20, 0, 22)
    _TextLabel.Name = 'Title'
    _TextLabel.Parent = _Frame2
    _TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.Position = UDim2.new(0.0102790017, 0, 0, 0)
    _TextLabel.Size = UDim2.new(0, 192, 0, 23)
    _TextLabel.Font = Enum.Font.GothamBold
    _TextLabel.Text = p47
    _TextLabel.TextTransparency = 0
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextSize = 13
    _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    _TextButton.Name = 'CloseBtn'
    _TextButton.Parent = _Frame2
    _TextButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _TextButton.BackgroundTransparency = 1
    _TextButton.Position = UDim2.new(0.85, 0, 1.3, 0)
    _TextButton.Size = UDim2.new(0, 28, 0, 22)
    _TextButton.Font = Enum.Font.Gotham
    _TextButton.Text = ''
    _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextButton.TextSize = 14
    _TextButton.BorderSizePixel = 0
    _TextButton.AutoButtonColor = false
    _ImageLabel.Name = 'CloseIcon'
    _ImageLabel.Parent = _TextButton
    _ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel.BackgroundTransparency = 1
    _ImageLabel.Position = UDim2.new(0.2, 0, 0.128935531, 0)
    _ImageLabel.Size = UDim2.new(0, 17, 0, 17)
    _ImageLabel.Image = 'http://www.roblox.com/asset/?id=6035047409'
    _ImageLabel.ImageColor3 = Color3.fromRGB(220, 221, 222)
    _TextButton2.Name = 'MinimizeButton'
    _TextButton2.Parent = _Frame2
    _TextButton2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _TextButton2.BackgroundTransparency = 1
    _TextButton2.Position = UDim2.new(0.8, 0, 1.3, 0)
    _TextButton2.Size = UDim2.new(0, 28, 0, 22)
    _TextButton2.Font = Enum.Font.Gotham
    _TextButton2.Text = ''
    _TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextButton2.TextSize = 14
    _TextButton2.BorderSizePixel = 0
    _TextButton2.AutoButtonColor = false
    _ImageLabel2.Name = 'MinimizeLabel'
    _ImageLabel2.Parent = _TextButton2
    _ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.Position = UDim2.new(0.2, 0, 0.128935531, 0)
    _ImageLabel2.Size = UDim2.new(0, 17, 0, 17)
    _ImageLabel2.Image = 'http://www.roblox.com/asset/?id=6035067836'
    _ImageLabel2.ImageColor3 = Color3.fromRGB(220, 221, 222)
    _Folder4.Name = 'ServersHolder'
    _Folder4.Parent = _Frame6
    _Frame3.Name = 'Userpad'
    _Frame3.Parent = _Frame6
    _Frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame3.BorderSizePixel = 0
    _Frame3.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
    _Frame3.Size = UDim2.new(0, 179, 0, 43)
    _Frame4.Name = 'UserIcon'
    _Frame4.Parent = _Frame3
    _Frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _Frame4.BorderSizePixel = 0
    _Frame4.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
    _Frame4.Size = UDim2.new(0, 32, 0, 32)
    _UICorner.CornerRadius = UDim.new(1, 8)
    _UICorner.Name = 'UserIconCorner'
    _UICorner.Parent = _Frame4
    _ImageLabel3.Name = 'UserImage'
    _ImageLabel3.Parent = _Frame4
    _ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel3.BackgroundTransparency = 1
    _ImageLabel3.Size = UDim2.new(0, 32, 0, 32)
    _ImageLabel3.Image = ''
    _ImageLabel4.Name = 'UserImage'
    _ImageLabel4.Parent = _ImageLabel3
    _ImageLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel4.BackgroundTransparency = 1
    _ImageLabel4.Size = UDim2.new(0, 32, 0, 32)
    _ImageLabel4.Image = 'rbxassetid://4031889928'
    _ImageLabel4.ImageColor3 = Color3.fromRGB(20, 20, 20)
    _TextLabel2.Name = 'UserName'
    _TextLabel2.Parent = _Frame3
    _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.BorderSizePixel = 0
    _TextLabel2.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
    _TextLabel2.Size = UDim2.new(0, 98, 0, 17)
    _TextLabel2.Font = Enum.Font.GothamSemibold
    _TextLabel2.TextSize = 13
    _TextLabel2.TextTransparency = 1
    _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.ClipsDescendants = true
    _TextLabel3.Name = 'UserTag'
    _TextLabel3.Parent = _Frame3
    _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.BackgroundTransparency = 1
    _TextLabel3.BorderSizePixel = 0
    _TextLabel3.Position = UDim2.new(0.230000004, 0, 0.275000013, 0)
    _TextLabel3.Size = UDim2.new(0, 95, 0, 17)
    _TextLabel3.Font = Enum.Font.GothamBold
    _TextLabel3.TextColor3 = Color3.fromRGB(231, 23, 55)
    _TextLabel3.TextSize = 13
    _TextLabel3.TextTransparency = 0
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.Text = 'Hyper'
    _TextLabel3.Text = ''
    _Frame5.Name = 'ServersHoldFrame'
    _Frame5.Parent = _Frame
    _Frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame5.BackgroundTransparency = 1
    _Frame5.BorderColor3 = Color3.fromRGB(20, 20, 20)
    _Frame5.Size = UDim2.new(0, 71, 0, 396)
    _ScrollingFrame.Name = 'ServersHold'
    _ScrollingFrame.Parent = _Frame5
    _ScrollingFrame.Active = true
    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame.BackgroundTransparency = 1
    _ScrollingFrame.BorderSizePixel = 0
    _ScrollingFrame.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
    _ScrollingFrame.Size = UDim2.new(0, 71, 0, 373)
    _ScrollingFrame.ScrollBarThickness = 1
    _ScrollingFrame.ScrollBarImageTransparency = 1
    _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    _UIListLayout.Name = 'ServersHoldLayout'
    _UIListLayout.Parent = _ScrollingFrame
    _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    _UIListLayout.Padding = UDim.new(0, 7)
    _UIPadding.Name = 'ServersHoldPadding'
    _UIPadding.Parent = _ScrollingFrame

    _TextButton.MouseButton1Click:Connect(function()
        _Frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
    end)
    _TextButton.MouseEnter:Connect(function()
        _TextButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    end)
    _TextButton.MouseLeave:Connect(function()
        _TextButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    end)
    _TextButton2.MouseEnter:Connect(function()
        _TextButton2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    end)
    _TextButton2.MouseLeave:Connect(function()
        _TextButton2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    end)
    _TextButton2.MouseButton1Click:Connect(function()
        if u49 ~= false then
            _Frame:TweenSize(UDim2.new(0, 611, 0, 396), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        else
            _Frame:TweenSize(UDim2.new(0, 611, 0, 64), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        end

        u49 = not u49
    end)

    local _TextButton3 = Instance.new('TextButton')
    local _ImageLabel5 = Instance.new('ImageLabel')

    _TextButton3.Name = 'SettingsOpenBtn'
    _TextButton3.Parent = _Frame3
    _TextButton3.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
    _TextButton3.BackgroundTransparency = 1
    _TextButton3.Position = UDim2.new(0.849161983, 0, 0.279069781, 0)
    _TextButton3.Size = UDim2.new(0, 0, 0, 0)
    _TextButton3.Font = Enum.Font.SourceSans
    _TextButton3.Text = ''
    _TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
    _TextButton3.TextSize = 14
    _ImageLabel5.Name = 'SettingsOpenBtnIco'
    _ImageLabel5.Parent = _TextButton3
    _ImageLabel5.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    _ImageLabel5.BackgroundTransparency = 1
    _ImageLabel5.Size = UDim2.new(0, 0, 0, 0)
    _ImageLabel5.ImageTransparency = 1
    _ImageLabel5.Image = 'http://www.roblox.com/asset/?id=6031280882'
    _ImageLabel5.ImageColor3 = Color3.fromRGB(220, 220, 220)

    local _Frame8 = Instance.new('Frame')
    local _Frame9 = Instance.new('Frame')
    local _Frame10 = Instance.new('Frame')
    local _TextButton4 = Instance.new('TextButton')
    local _UICorner3 = Instance.new('UICorner')
    local _Frame11 = Instance.new('Frame')
    local _UICorner4 = Instance.new('UICorner')
    local _ImageLabel6 = Instance.new('ImageLabel')
    local _TextLabel4 = Instance.new('TextLabel')
    local _Frame12 = Instance.new('Frame')
    local _Frame13 = Instance.new('Frame')
    local _UICorner5 = Instance.new('UICorner')
    local _TextLabel5 = Instance.new('TextLabel')
    local _Frame14 = Instance.new('Frame')
    local _TextLabel6 = Instance.new('TextLabel')
    local _UIListLayout2 = Instance.new('UIListLayout')
    local _TextLabel7 = Instance.new('TextLabel')
    local _TextButton5 = Instance.new('TextButton')
    local _UICorner6 = Instance.new('UICorner')
    local _TextButton6 = Instance.new('TextButton')
    local _ImageLabel7 = Instance.new('ImageLabel')
    local _ImageLabel8 = Instance.new('ImageLabel')
    local _Frame15 = Instance.new('Frame')
    local _UICorner7 = Instance.new('UICorner')
    local _TextLabel8 = Instance.new('TextLabel')
    local _Frame16 = Instance.new('Frame')
    local _UICorner8 = Instance.new('UICorner')
    local _ImageLabel9 = Instance.new('ImageLabel')
    local _Frame17 = Instance.new('Frame')
    local _TextLabel9 = Instance.new('TextLabel')
    local _UIListLayout3 = Instance.new('UIListLayout')
    local _TextLabel10 = Instance.new('TextLabel')
    local _UICorner9 = Instance.new('UICorner')
    local _Frame18 = Instance.new('Frame')
    local _TextButton7 = Instance.new('TextButton')
    local _UICorner10 = Instance.new('UICorner')
    local _TextLabel11 = Instance.new('TextLabel')
    local _TextLabel12 = Instance.new('TextLabel')
    local _TextLabel13 = Instance.new('TextLabel')
    local _TextLabel14 = Instance.new('TextLabel')

    _Frame8.Name = 'SettingsFrame'
    _Frame8.Parent = _Frame
    _Frame8.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _Frame8.BackgroundTransparency = 1
    _Frame8.Size = UDim2.new(0, 681, 0, 396)
    _Frame8.Visible = false
    _Frame9.Name = 'Settings'
    _Frame9.Parent = _Frame8
    _Frame9.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    _Frame9.BorderSizePixel = 0
    _Frame9.Position = UDim2.new(0, 0, 0.0530303046, 0)
    _Frame9.Size = UDim2.new(0, 681, 0, 375)
    _Frame10.Name = 'SettingsHolder'
    _Frame10.Parent = _Frame9
    _Frame10.AnchorPoint = Vector2.new(0.5, 0.5)
    _Frame10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame10.BackgroundTransparency = 1
    _Frame10.ClipsDescendants = true
    _Frame10.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
    _Frame10.Size = UDim2.new(0, 0, 0, 0)
    _TextButton4.Name = 'CloseSettingsBtn'
    _TextButton4.Parent = _Frame10
    _TextButton4.AnchorPoint = Vector2.new(0.5, 0.5)
    _TextButton4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _TextButton4.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
    _TextButton4.Selectable = false
    _TextButton4.Size = UDim2.new(0, 30, 0, 30)
    _TextButton4.AutoButtonColor = false
    _TextButton4.Font = Enum.Font.SourceSans
    _TextButton4.Text = ''
    _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
    _TextButton4.TextSize = 14
    _UICorner3.CornerRadius = UDim.new(1, 0)
    _UICorner3.Name = 'CloseSettingsBtnCorner'
    _UICorner3.Parent = _TextButton4
    _Frame11.Name = 'CloseSettingsBtnCircle'
    _Frame11.Parent = _TextButton4
    _Frame11.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    _Frame11.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
    _Frame11.Size = UDim2.new(0, 24, 0, 24)
    _UICorner4.CornerRadius = UDim.new(1, 0)
    _UICorner4.Name = 'CloseSettingsBtnCircleCorner'
    _UICorner4.Parent = _Frame11
    _ImageLabel6.Name = 'CloseSettingsBtnIcon'
    _ImageLabel6.Parent = _Frame11
    _ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel6.BackgroundTransparency = 1
    _ImageLabel6.Position = UDim2.new(0, 2, 0, 2)
    _ImageLabel6.Size = UDim2.new(0, 19, 0, 19)
    _ImageLabel6.Image = 'http://www.roblox.com/asset/?id=6035047409'
    _ImageLabel6.ImageColor3 = Color3.fromRGB(222, 222, 222)

    _TextButton4.MouseButton1Click:Connect(function()
        u51 = false
        _Frame6.Visible = true
        _Frame5.Visible = true

        _Frame10:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        _TweenService:Create(_Frame9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()

        local v116 = next
        local v117, v118 = _Frame10:GetChildren()

        while true do
            local v119

            v118, v119 = v116(v117, v118)

            if v118 == nil then
                break
            end

            _TweenService:Create(v119, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        end

        wait(0.3)

        _Frame8.Visible = false
    end)
    _TextButton4.MouseEnter:Connect(function()
        _Frame11.BackgroundColor3 = Color3.fromRGB(72, 76, 82)
    end)
    _TextButton4.MouseLeave:Connect(function()
        _Frame11.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    end)
    _UserInputService.InputBegan:Connect(function(p120, _)
        if p120.KeyCode == Enum.KeyCode.RightControl and u51 == true then
            u51 = false
            _Frame6.Visible = true
            _Frame5.Visible = true

            _Frame10:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
            _TweenService:Create(_Frame9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()

            local v121 = next
            local v122, v123 = _Frame10:GetChildren()

            while true do
                local v124

                v123, v124 = v121(v122, v123)

                if v123 == nil then
                    break
                end

                _TweenService:Create(v124, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end

            wait(0.3)

            _Frame8.Visible = false
        end
    end)

    _TextLabel4.Parent = _TextButton4
    _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel4.BackgroundTransparency = 1
    _TextLabel4.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
    _TextLabel4.Size = UDim2.new(0, 34, 0, 22)
    _TextLabel4.Font = Enum.Font.GothamSemibold
    _TextLabel4.Text = 'rightctrl'
    _TextLabel4.TextColor3 = Color3.fromRGB(113, 117, 123)
    _TextLabel4.TextSize = 11
    _Frame12.Name = 'UserPanel'
    _Frame12.Parent = _Frame10
    _Frame12.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
    _Frame12.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
    _Frame12.Size = UDim2.new(0, 362, 0, 164)
    _Frame13.Name = 'UserSettingsPad'
    _Frame13.Parent = _Frame12
    _Frame13.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
    _Frame13.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
    _Frame13.Size = UDim2.new(0, 337, 0, 56)
    _UICorner5.Name = 'UserSettingsPadCorner'
    _UICorner5.Parent = _Frame13
    _TextLabel5.Name = 'UsernameText'
    _TextLabel5.Parent = _Frame13
    _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel5.BackgroundTransparency = 1
    _TextLabel5.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
    _TextLabel5.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel5.Font = Enum.Font.GothamBold
    _TextLabel5.Text = 'USERNAME'
    _TextLabel5.TextColor3 = Color3.fromRGB(126, 130, 136)
    _TextLabel5.TextSize = 11
    _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
    _Frame14.Name = 'UserSettingsPadUserTag'
    _Frame14.Parent = _Frame13
    _Frame14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame14.BackgroundTransparency = 1
    _Frame14.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
    _Frame14.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel6.Name = 'UserSettingsPadUser'
    _TextLabel6.Parent = _Frame14
    _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel6.BackgroundTransparency = 1
    _TextLabel6.Font = Enum.Font.Gotham
    _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel6.TextSize = 13
    _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel6.Text = u26
    _TextLabel6.Size = UDim2.new(0, _TextLabel6.TextBounds.X + 2, 0, 19)
    _UIListLayout2.Name = 'UserSettingsPadUserTagLayout'
    _UIListLayout2.Parent = _Frame14
    _UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
    _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    _TextLabel7.Name = 'UserSettingsPadTag'
    _TextLabel7.Parent = _Frame14
    _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel7.BackgroundTransparency = 1
    _TextLabel7.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
    _TextLabel7.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel7.Font = Enum.Font.Gotham
    _TextLabel7.Text = '#' .. u27
    _TextLabel7.TextColor3 = Color3.fromRGB(184, 186, 189)
    _TextLabel7.TextSize = 13
    _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
    _TextButton5.Name = 'EditBtn'
    _TextButton5.Parent = _Frame13
    _TextButton5.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
    _TextButton5.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
    _TextButton5.Size = UDim2.new(0, 55, 0, 30)
    _TextButton5.Font = Enum.Font.Gotham
    _TextButton5.Text = 'Edit'
    _TextButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextButton5.TextSize = 14
    _TextButton5.AutoButtonColor = false

    _TextButton5.MouseEnter:Connect(function()
        _TweenService:Create(_TextButton5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(104, 114, 127),
        }):Play()
    end)
    _TextButton5.MouseLeave:Connect(function()
        _TweenService:Create(_TextButton5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(116, 127, 141),
        }):Play()
    end)

    _UICorner6.CornerRadius = UDim.new(0, 3)
    _UICorner6.Name = 'EditBtnCorner'
    _UICorner6.Parent = _TextButton5
    _TextButton6.Name = 'UserPanelUserIcon'
    _TextButton6.Parent = _Frame12
    _TextButton6.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
    _TextButton6.BorderSizePixel = 0
    _TextButton6.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
    _TextButton6.Size = UDim2.new(0, 71, 0, 71)
    _TextButton6.AutoButtonColor = false
    _TextButton6.Text = ''
    _ImageLabel7.Name = 'UserPanelUserImage'
    _ImageLabel7.Parent = _TextButton6
    _ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel7.BackgroundTransparency = 1
    _ImageLabel7.Size = UDim2.new(0, 71, 0, 71)
    _ImageLabel7.Image = u25
    _ImageLabel8.Name = 'UserPanelUserCircle'
    _ImageLabel8.Parent = _ImageLabel7
    _ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel8.BackgroundTransparency = 1
    _ImageLabel8.Size = UDim2.new(0, 71, 0, 71)
    _ImageLabel8.Image = 'rbxassetid://4031889928'
    _ImageLabel8.ImageColor3 = Color3.fromRGB(47, 49, 54)
    _Frame15.Name = 'BlackFrame'
    _Frame15.Parent = _TextButton6
    _Frame15.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _Frame15.BackgroundTransparency = 0.4
    _Frame15.BorderSizePixel = 0
    _Frame15.Size = UDim2.new(0, 71, 0, 71)
    _Frame15.Visible = false
    _UICorner7.CornerRadius = UDim.new(1, 8)
    _UICorner7.Name = 'BlackFrameCorner'
    _UICorner7.Parent = _Frame15
    _TextLabel8.Name = 'ChangeAvatarText'
    _TextLabel8.Parent = _Frame15
    _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel8.BackgroundTransparency = 1
    _TextLabel8.Size = UDim2.new(0, 71, 0, 71)
    _TextLabel8.Font = Enum.Font.GothamBold
    _TextLabel8.Text = 'CHAGNE    AVATAR'
    _TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel8.TextSize = 11
    _TextLabel8.TextWrapped = true
    _Frame16.Name = 'SearchIcoFrame'
    _Frame16.Parent = _TextButton6
    _Frame16.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
    _Frame16.Position = UDim2.new(0.657999992, 0, 0, 0)
    _Frame16.Size = UDim2.new(0, 20, 0, 20)
    _UICorner8.CornerRadius = UDim.new(1, 8)
    _UICorner8.Name = 'SearchIcoFrameCorner'
    _UICorner8.Parent = _Frame16
    _ImageLabel9.Name = 'SearchIco'
    _ImageLabel9.Parent = _Frame16
    _ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel9.BackgroundTransparency = 1
    _ImageLabel9.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
    _ImageLabel9.Size = UDim2.new(0, 15, 0, 15)
    _ImageLabel9.Image = 'http://www.roblox.com/asset/?id=6034407084'
    _ImageLabel9.ImageColor3 = Color3.fromRGB(114, 118, 125)

    _TextButton6.MouseEnter:Connect(function()
        _Frame15.Visible = true
    end)
    _TextButton6.MouseLeave:Connect(function()
        _Frame15.Visible = false
    end)
    _TextButton6.MouseButton1Click:Connect(function()
        local _TextButton8 = Instance.new('TextButton')

        _TextButton8.Name = 'NotificationHolder'
        _TextButton8.Parent = _Frame10
        _TextButton8.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        _TextButton8.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
        _TextButton8.Size = UDim2.new(0, 687, 0, 375)
        _TextButton8.AutoButtonColor = false
        _TextButton8.Font = Enum.Font.SourceSans
        _TextButton8.Text = ''
        _TextButton8.TextColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton8.TextSize = 14
        _TextButton8.BackgroundTransparency = 1
        _TextButton8.Visible = true

        _TweenService:Create(_TextButton8, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

        local _Frame19 = Instance.new('Frame')
        local _UICorner11 = Instance.new('UICorner')
        local _Frame20 = Instance.new('Frame')
        local _UICorner12 = Instance.new('UICorner')
        local _Frame21 = Instance.new('Frame')
        local _TextLabel15 = Instance.new('TextLabel')
        local _TextLabel16 = Instance.new('TextLabel')
        local _Frame22 = Instance.new('Frame')
        local _UICorner13 = Instance.new('UICorner')
        local _Frame23 = Instance.new('Frame')
        local _UICorner14 = Instance.new('UICorner')
        local _TextBox = Instance.new('TextBox')
        local _TextButton9 = Instance.new('TextButton')
        local _UICorner15 = Instance.new('UICorner')
        local _TextButton10 = Instance.new('TextButton')
        local _ImageLabel10 = Instance.new('ImageLabel')
        local _TextButton11 = Instance.new('TextButton')
        local _UICorner16 = Instance.new('UICorner')
        local _TextButton12 = Instance.new('TextButton')
        local _UICorner17 = Instance.new('UICorner')

        _Frame19.Name = 'AvatarChange'
        _Frame19.Parent = _TextButton8
        _Frame19.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame19.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        _Frame19.ClipsDescendants = true
        _Frame19.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
        _Frame19.Size = UDim2.new(0, 0, 0, 0)
        _Frame19.BackgroundTransparency = 1

        local v146 = _Frame19

        _Frame19.TweenSize(v146, UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
        _TweenService:Create(_Frame19, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

        _UICorner11.CornerRadius = UDim.new(0, 5)
        _UICorner11.Name = 'UserChangeCorner'
        _UICorner11.Parent = _Frame19
        _Frame20.Name = 'UnderBar'
        _Frame20.Parent = _Frame19
        _Frame20.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _Frame20.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
        _Frame20.Size = UDim2.new(0, 346, 0, 13)
        _UICorner12.CornerRadius = UDim.new(0, 5)
        _UICorner12.Name = 'UnderBarCorner'
        _UICorner12.Parent = _Frame20
        _Frame21.Name = 'UnderBarFrame'
        _Frame21.Parent = _Frame20
        _Frame21.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _Frame21.BorderSizePixel = 0
        _Frame21.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
        _Frame21.Size = UDim2.new(0, 346, 0, 39)
        _TextLabel15.Name = 'Text1'
        _TextLabel15.Parent = _Frame19
        _TextLabel15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel15.BackgroundTransparency = 1
        _TextLabel15.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
        _TextLabel15.Size = UDim2.new(0, 346, 0, 68)
        _TextLabel15.Font = Enum.Font.GothamSemibold
        _TextLabel15.Text = 'Change your avatar'
        _TextLabel15.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel15.TextSize = 20
        _TextLabel16.Name = 'Text2'
        _TextLabel16.Parent = _Frame19
        _TextLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel16.BackgroundTransparency = 1
        _TextLabel16.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
        _TextLabel16.Size = UDim2.new(0, 346, 0, 63)
        _TextLabel16.Font = Enum.Font.Gotham
        _TextLabel16.Text = 'Enter your new profile in a Roblox decal link.'
        _TextLabel16.TextColor3 = Color3.fromRGB(171, 172, 176)
        _TextLabel16.TextSize = 14
        _Frame22.Name = 'TextBoxFrame'
        _Frame22.Parent = _Frame19
        _Frame22.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame22.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _Frame22.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
        _Frame22.Size = UDim2.new(0, 319, 0, 38)
        _UICorner13.CornerRadius = UDim.new(0, 3)
        _UICorner13.Name = 'TextBoxFrameCorner'
        _UICorner13.Parent = _Frame22
        _Frame23.Name = 'TextBoxFrame1'
        _Frame23.Parent = _Frame22
        _Frame23.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame23.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
        _Frame23.ClipsDescendants = true
        _Frame23.Position = UDim2.new(0.5, 0, 0.5, 0)
        _Frame23.Size = UDim2.new(0, 317, 0, 36)
        _UICorner14.CornerRadius = UDim.new(0, 3)
        _UICorner14.Name = 'TextBoxFrame1Corner'
        _UICorner14.Parent = _Frame23
        _TextBox.Name = 'AvatarTextbox'
        _TextBox.Parent = _Frame23
        _TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextBox.BackgroundTransparency = 1
        _TextBox.Position = UDim2.new(0.0378548913, 0, 0, 0)
        _TextBox.Size = UDim2.new(0, 293, 0, 37)
        _TextBox.Font = Enum.Font.Gotham
        _TextBox.Text = ''
        _TextBox.TextColor3 = Color3.fromRGB(193, 195, 197)
        _TextBox.TextSize = 14
        _TextBox.TextXAlignment = Enum.TextXAlignment.Left
        _TextButton9.Name = 'ChangeBtn'
        _TextButton9.Parent = _Frame19
        _TextButton9.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
        _TextButton9.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
        _TextButton9.Size = UDim2.new(0, 76, 0, 27)
        _TextButton9.Font = Enum.Font.Gotham
        _TextButton9.Text = 'Change'
        _TextButton9.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton9.TextSize = 13
        _TextButton9.AutoButtonColor = false

        _TextButton9.MouseEnter:Connect(function()
            _TweenService:Create(_TextButton9, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(103, 123, 196),
            }):Play()
        end)
        _TextButton9.MouseLeave:Connect(function()
            _TweenService:Create(_TextButton9, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(114, 137, 228),
            }):Play()
        end)
        _TextButton9.MouseButton1Click:Connect(function()
            u25 = tostring(_TextBox.Text)
            _ImageLabel3.Image = u25
            _ImageLabel7.Image = u25

            u29()
            _Frame19:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame19, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton8, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton8:Destroy()
        end)

        _UICorner15.CornerRadius = UDim.new(0, 4)
        _UICorner15.Name = 'ChangeCorner'
        _UICorner15.Parent = _TextButton9
        _TextButton10.Name = 'CloseBtn2'
        _TextButton10.Parent = _Frame19
        _TextButton10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton10.BackgroundTransparency = 1
        _TextButton10.Position = UDim2.new(0.898000002, 0, 0, 0)
        _TextButton10.Size = UDim2.new(0, 26, 0, 26)
        _TextButton10.Font = Enum.Font.Gotham
        _TextButton10.Text = ''
        _TextButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton10.TextSize = 14
        _ImageLabel10.Name = 'Close2Icon'
        _ImageLabel10.Parent = _TextButton10
        _ImageLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel10.BackgroundTransparency = 1
        _ImageLabel10.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
        _ImageLabel10.Size = UDim2.new(0, 25, 0, 25)
        _ImageLabel10.Image = 'http://www.roblox.com/asset/?id=6035047409'
        _ImageLabel10.ImageColor3 = Color3.fromRGB(119, 122, 127)
        _TextButton11.Name = 'CloseBtn1'
        _TextButton11.Parent = _Frame19
        _TextButton11.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
        _TextButton11.BackgroundTransparency = 1
        _TextButton11.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
        _TextButton11.Size = UDim2.new(0, 76, 0, 27)
        _TextButton11.Font = Enum.Font.Gotham
        _TextButton11.Text = 'Close'
        _TextButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton11.TextSize = 13
        _UICorner16.CornerRadius = UDim.new(0, 4)
        _UICorner16.Name = 'CloseBtn1Corner'
        _UICorner16.Parent = _TextButton11
        _TextButton12.Name = 'ResetBtn'
        _TextButton12.Parent = _Frame19
        _TextButton12.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
        _TextButton12.BackgroundTransparency = 1
        _TextButton12.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
        _TextButton12.Size = UDim2.new(0, 76, 0, 27)
        _TextButton12.Font = Enum.Font.Gotham
        _TextButton12.Text = 'Reset'
        _TextButton12.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton12.TextSize = 13

        _TextButton12.MouseButton1Click:Connect(function()
            u25 = 'https://www.roblox.com/headshot-thumbnail/image?userId=' .. game.Players.LocalPlayer.UserId .. '&width=420&height=420&format=png'
            _ImageLabel3.Image = u25
            _ImageLabel7.Image = u25

            u29()
            _Frame19:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame19, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton8, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton8:Destroy()
        end)

        _UICorner17.CornerRadius = UDim.new(0, 4)
        _UICorner17.Name = 'ResetCorner'
        _UICorner17.Parent = _TextButton12

        _TextButton11.MouseButton1Click:Connect(function()
            _Frame19:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame19, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton8, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton8:Destroy()
        end)
        _TextButton10.MouseButton1Click:Connect(function()
            _Frame19:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame19, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton8, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton8:Destroy()
        end)
        _TextButton10.MouseEnter:Connect(function()
            _TweenService:Create(_ImageLabel10, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageColor3 = Color3.fromRGB(210, 210, 210),
            }):Play()
        end)
        _TextButton10.MouseLeave:Connect(function()
            _TweenService:Create(_ImageLabel10, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageColor3 = Color3.fromRGB(119, 122, 127),
            }):Play()
        end)
        _TextBox.Focused:Connect(function()
            _TweenService:Create(_Frame22, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(114, 137, 228),
            }):Play()
        end)
        _TextBox.FocusLost:Connect(function()
            _TweenService:Create(_Frame22, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(37, 40, 43),
            }):Play()
        end)
    end)

    _Frame17.Name = 'UserPanelUserTag'
    _Frame17.Parent = _Frame12
    _Frame17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame17.BackgroundTransparency = 1
    _Frame17.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
    _Frame17.Size = UDim2.new(0, 113, 0, 19)
    _TextLabel9.Name = 'UserPanelUser'
    _TextLabel9.Parent = _Frame17
    _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel9.BackgroundTransparency = 1
    _TextLabel9.Font = Enum.Font.GothamSemibold
    _TextLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel9.TextSize = 17
    _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel9.Text = u26
    _TextLabel9.Size = UDim2.new(0, _TextLabel9.TextBounds.X + 2, 0, 19)
    _UIListLayout3.Name = 'UserPanelUserTagLayout'
    _UIListLayout3.Parent = _Frame17
    _UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
    _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    _TextLabel10.Name = 'UserPanelTag'
    _TextLabel10.Parent = _Frame17
    _TextLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel10.BackgroundTransparency = 1
    _TextLabel10.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
    _TextLabel10.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel10.Font = Enum.Font.Gotham
    _TextLabel10.Text = '#' .. u27
    _TextLabel10.TextColor3 = Color3.fromRGB(184, 186, 189)
    _TextLabel10.TextSize = 17
    _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
    _UICorner9.Name = 'UserPanelCorner'
    _UICorner9.Parent = _Frame12
    _Frame18.Name = 'LeftFrame'
    _Frame18.Parent = _Frame10
    _Frame18.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _Frame18.BorderSizePixel = 0
    _Frame18.Position = UDim2.new(0, 0, -0.000303059904, 0)
    _Frame18.Size = UDim2.new(0, 233, 0, 375)
    _TextButton7.Name = 'MyAccountBtn'
    _TextButton7.Parent = _Frame18
    _TextButton7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    _TextButton7.BorderSizePixel = 0
    _TextButton7.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
    _TextButton7.Size = UDim2.new(0, 160, 0, 30)
    _TextButton7.AutoButtonColor = false
    _TextButton7.Font = Enum.Font.SourceSans
    _TextButton7.Text = ''
    _TextButton7.TextColor3 = Color3.fromRGB(0, 0, 0)
    _TextButton7.TextSize = 14
    _UICorner10.CornerRadius = UDim.new(0, 6)
    _UICorner10.Name = 'MyAccountBtnCorner'
    _UICorner10.Parent = _TextButton7
    _TextLabel11.Name = 'MyAccountBtnTitle'
    _TextLabel11.Parent = _TextButton7
    _TextLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel11.BackgroundTransparency = 1
    _TextLabel11.BorderSizePixel = 0
    _TextLabel11.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
    _TextLabel11.Size = UDim2.new(0, 95, 0, 39)
    _TextLabel11.Font = Enum.Font.GothamSemibold
    _TextLabel11.Text = 'My Account'
    _TextLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel11.TextSize = 14
    _TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel12.Name = 'SettingsTitle'
    _TextLabel12.Parent = _Frame18
    _TextLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel12.BackgroundTransparency = 1
    _TextLabel12.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
    _TextLabel12.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel12.Font = Enum.Font.GothamBlack
    _TextLabel12.Text = 'SETTINGS'
    _TextLabel12.TextColor3 = Color3.fromRGB(142, 146, 152)
    _TextLabel12.TextSize = 11
    _TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel13.Name = 'DiscordInfo'
    _TextLabel13.Parent = _Frame18
    _TextLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel13.BackgroundTransparency = 1
    _TextLabel13.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
    _TextLabel13.Size = UDim2.new(0, 133, 0, 44)
    _TextLabel13.Font = Enum.Font.Gotham
    _TextLabel13.Text = 'Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    '
    _TextLabel13.TextColor3 = Color3.fromRGB(101, 108, 116)
    _TextLabel13.TextSize = 13
    _TextLabel13.TextWrapped = true
    _TextLabel13.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel13.TextYAlignment = Enum.TextYAlignment.Top
    _TextLabel14.Name = 'CurrentSettingOpen'
    _TextLabel14.Parent = _Frame18
    _TextLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel14.BackgroundTransparency = 1
    _TextLabel14.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
    _TextLabel14.Size = UDim2.new(0, 65, 0, 19)
    _TextLabel14.Font = Enum.Font.GothamBlack
    _TextLabel14.Text = 'MY ACCOUNT'
    _TextLabel14.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel14.TextSize = 14
    _TextLabel14.TextXAlignment = Enum.TextXAlignment.Left

    _TextButton3.MouseButton1Click:Connect(function()
        u51 = true
        _Frame6.Visible = false
        _Frame5.Visible = false
        _Frame8.Visible = true

        _Frame10:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)

        _Frame9.BackgroundTransparency = 1

        _TweenService:Create(_Frame9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

        local v147 = next
        local v148, v149 = _Frame10:GetChildren()

        while true do
            local v150

            v149, v150 = v147(v148, v149)

            if v149 == nil then
                break
            end

            v150.BackgroundTransparency = 1

            _TweenService:Create(v150, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        end
    end)
    _TextButton5.MouseButton1Click:Connect(function()
        local _TextButton13 = Instance.new('TextButton')

        _TextButton13.Name = 'NotificationHolder'
        _TextButton13.Parent = _Frame10
        _TextButton13.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        _TextButton13.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
        _TextButton13.Size = UDim2.new(0, 687, 0, 375)
        _TextButton13.AutoButtonColor = false
        _TextButton13.Font = Enum.Font.SourceSans
        _TextButton13.Text = ''
        _TextButton13.TextColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton13.TextSize = 14
        _TextButton13.BackgroundTransparency = 1
        _TextButton13.Visible = true

        _TweenService:Create(_TextButton13, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

        local _Frame24 = Instance.new('Frame')
        local _UICorner18 = Instance.new('UICorner')
        local _Frame25 = Instance.new('Frame')
        local _UICorner19 = Instance.new('UICorner')
        local _Frame26 = Instance.new('Frame')
        local _TextLabel17 = Instance.new('TextLabel')
        local _TextLabel18 = Instance.new('TextLabel')
        local _Frame27 = Instance.new('Frame')
        local _UICorner20 = Instance.new('UICorner')
        local _Frame28 = Instance.new('Frame')
        local _UICorner21 = Instance.new('UICorner')
        local _TextBox2 = Instance.new('TextBox')
        local _Frame29 = Instance.new('Frame')
        local _TextLabel19 = Instance.new('TextLabel')
        local _TextBox3 = Instance.new('TextBox')
        local _TextButton14 = Instance.new('TextButton')
        local _UICorner22 = Instance.new('UICorner')
        local _TextButton15 = Instance.new('TextButton')
        local _ImageLabel11 = Instance.new('ImageLabel')
        local _TextButton16 = Instance.new('TextButton')
        local _UICorner23 = Instance.new('UICorner')

        _Frame24.Name = 'UserChange'
        _Frame24.Parent = _TextButton13
        _Frame24.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame24.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _Frame24.ClipsDescendants = true
        _Frame24.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
        _Frame24.Size = UDim2.new(0, 0, 0, 0)
        _Frame24.BackgroundTransparency = 1

        local v173 = _Frame24

        _Frame24.TweenSize(v173, UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
        _TweenService:Create(_Frame24, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

        _UICorner18.CornerRadius = UDim.new(0, 5)
        _UICorner18.Name = 'UserChangeCorner'
        _UICorner18.Parent = _Frame24
        _Frame25.Name = 'UnderBar'
        _Frame25.Parent = _Frame24
        _Frame25.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
        _Frame25.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
        _Frame25.Size = UDim2.new(0, 346, 0, 13)
        _UICorner19.CornerRadius = UDim.new(0, 5)
        _UICorner19.Name = 'UnderBarCorner'
        _UICorner19.Parent = _Frame25
        _Frame26.Name = 'UnderBarFrame'
        _Frame26.Parent = _Frame25
        _Frame26.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
        _Frame26.BorderSizePixel = 0
        _Frame26.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
        _Frame26.Size = UDim2.new(0, 346, 0, 39)
        _TextLabel17.Name = 'Text1'
        _TextLabel17.Parent = _Frame24
        _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel17.BackgroundTransparency = 1
        _TextLabel17.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
        _TextLabel17.Size = UDim2.new(0, 346, 0, 68)
        _TextLabel17.Font = Enum.Font.GothamSemibold
        _TextLabel17.Text = 'Change your username'
        _TextLabel17.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel17.TextSize = 20
        _TextLabel18.Name = 'Text2'
        _TextLabel18.Parent = _Frame24
        _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel18.BackgroundTransparency = 1
        _TextLabel18.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
        _TextLabel18.Size = UDim2.new(0, 346, 0, 63)
        _TextLabel18.Font = Enum.Font.Gotham
        _TextLabel18.Text = 'Enter your new username.'
        _TextLabel18.TextColor3 = Color3.fromRGB(171, 172, 176)
        _TextLabel18.TextSize = 14
        _Frame27.Name = 'TextBoxFrame'
        _Frame27.Parent = _Frame24
        _Frame27.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame27.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
        _Frame27.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
        _Frame27.Size = UDim2.new(0, 319, 0, 38)
        _UICorner20.CornerRadius = UDim.new(0, 3)
        _UICorner20.Name = 'TextBoxFrameCorner'
        _UICorner20.Parent = _Frame27
        _Frame28.Name = 'TextBoxFrame1'
        _Frame28.Parent = _Frame27
        _Frame28.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame28.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
        _Frame28.Position = UDim2.new(0.5, 0, 0.5, 0)
        _Frame28.Size = UDim2.new(0, 317, 0, 36)
        _UICorner21.CornerRadius = UDim.new(0, 3)
        _UICorner21.Name = 'TextBoxFrame1Corner'
        _UICorner21.Parent = _Frame28
        _TextBox2.Name = 'UsernameTextbox'
        _TextBox2.Parent = _Frame28
        _TextBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextBox2.BackgroundTransparency = 1
        _TextBox2.Position = UDim2.new(0.0378548913, 0, 0, 0)
        _TextBox2.Size = UDim2.new(0, 221, 0, 37)
        _TextBox2.Font = Enum.Font.Gotham
        _TextBox2.Text = u26
        _TextBox2.TextColor3 = Color3.fromRGB(193, 195, 197)
        _TextBox2.TextSize = 14
        _TextBox2.TextXAlignment = Enum.TextXAlignment.Left
        _Frame29.Name = 'Seperator'
        _Frame29.Parent = _Frame28
        _Frame29.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame29.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        _Frame29.BorderSizePixel = 0
        _Frame29.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
        _Frame29.Size = UDim2.new(0, 1, 0, 25)
        _TextLabel19.Name = 'HashtagLabel'
        _TextLabel19.Parent = _Frame28
        _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel19.BackgroundTransparency = 1
        _TextLabel19.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
        _TextLabel19.Size = UDim2.new(0, 23, 0, 37)
        _TextLabel19.Font = Enum.Font.Gotham
        _TextLabel19.Text = '#'
        _TextLabel19.TextColor3 = Color3.fromRGB(79, 82, 88)
        _TextLabel19.TextSize = 16
        _TextBox3.Name = 'TagTextbox'
        _TextBox3.Parent = _Frame28
        _TextBox3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextBox3.BackgroundTransparency = 1
        _TextBox3.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
        _TextBox3.Size = UDim2.new(0, 59, 0, 38)
        _TextBox3.Font = Enum.Font.Gotham
        _TextBox3.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
        _TextBox3.Text = u27
        _TextBox3.TextColor3 = Color3.fromRGB(193, 195, 197)
        _TextBox3.TextSize = 14
        _TextBox3.TextXAlignment = Enum.TextXAlignment.Left
        _TextButton14.Name = 'ChangeBtn'
        _TextButton14.Parent = _Frame24
        _TextButton14.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
        _TextButton14.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
        _TextButton14.Size = UDim2.new(0, 76, 0, 27)
        _TextButton14.Font = Enum.Font.Gotham
        _TextButton14.Text = 'Change'
        _TextButton14.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton14.TextSize = 13
        _TextButton14.AutoButtonColor = false

        _TextButton14.MouseEnter:Connect(function()
            _TweenService:Create(_TextButton14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(103, 123, 196),
            }):Play()
        end)
        _TextButton14.MouseLeave:Connect(function()
            _TweenService:Create(_TextButton14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(114, 137, 228),
            }):Play()
        end)
        _TextButton14.MouseButton1Click:Connect(function()
            u26 = _TextBox2.Text
            u27 = _TextBox3.Text
            _TextLabel6.Text = u26
            _TextLabel6.Size = UDim2.new(0, _TextLabel6.TextBounds.X + 2, 0, 19)
            _TextLabel7.Text = '#' .. u27
            _TextLabel10.Text = '#' .. u27
            _TextLabel9.Text = u26
            _TextLabel9.Size = UDim2.new(0, _TextLabel9.TextBounds.X + 2, 0, 19)
            _TextLabel2.Text = u26
            _TextLabel3.Text = '#' .. u27

            u29()
            _Frame24:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame24, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton13, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton13:Destroy()
        end)

        _UICorner22.CornerRadius = UDim.new(0, 4)
        _UICorner22.Name = 'ChangeCorner'
        _UICorner22.Parent = _TextButton14
        _TextButton15.Name = 'CloseBtn2'
        _TextButton15.Parent = _Frame24
        _TextButton15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton15.BackgroundTransparency = 1
        _TextButton15.Position = UDim2.new(0.898000002, 0, 0, 0)
        _TextButton15.Size = UDim2.new(0, 26, 0, 26)
        _TextButton15.Font = Enum.Font.Gotham
        _TextButton15.Text = ''
        _TextButton15.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton15.TextSize = 14
        _ImageLabel11.Name = 'Close2Icon'
        _ImageLabel11.Parent = _TextButton15
        _ImageLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _ImageLabel11.BackgroundTransparency = 1
        _ImageLabel11.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
        _ImageLabel11.Size = UDim2.new(0, 25, 0, 25)
        _ImageLabel11.Image = 'http://www.roblox.com/asset/?id=6035047409'
        _ImageLabel11.ImageColor3 = Color3.fromRGB(119, 122, 127)
        _TextButton16.Name = 'CloseBtn1'
        _TextButton16.Parent = _Frame24
        _TextButton16.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
        _TextButton16.BackgroundTransparency = 1
        _TextButton16.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
        _TextButton16.Size = UDim2.new(0, 76, 0, 27)
        _TextButton16.Font = Enum.Font.Gotham
        _TextButton16.Text = 'Close'
        _TextButton16.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton16.TextSize = 13
        _UICorner23.CornerRadius = UDim.new(0, 4)
        _UICorner23.Name = 'CloseBtn1Corner'
        _UICorner23.Parent = _TextButton16

        _TextButton16.MouseButton1Click:Connect(function()
            _Frame24:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame24, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton13, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton13:Destroy()
        end)
        _TextButton15.MouseButton1Click:Connect(function()
            _Frame24:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame24, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _TweenService:Create(_TextButton13, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait(0.2)
            _TextButton13:Destroy()
        end)
        _TextButton15.MouseEnter:Connect(function()
            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageColor3 = Color3.fromRGB(210, 210, 210),
            }):Play()
        end)
        _TextButton15.MouseLeave:Connect(function()
            _TweenService:Create(_ImageLabel11, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageColor3 = Color3.fromRGB(119, 122, 127),
            }):Play()
        end)
        _TextBox3.Changed:Connect(function()
            _TextBox3.Text = _TextBox3.Text:sub(1, 4)
        end)

        local v174 = _TextBox3

        _TextBox3.GetPropertyChangedSignal(v174, 'Text'):Connect(function()
            _TextBox3.Text = _TextBox3.Text:gsub('%D+', '')
        end)
        _TextBox2.Changed:Connect(function()
            _TextBox2.Text = _TextBox2.Text:sub(1, 13)
        end)
        _TextBox3.Focused:Connect(function()
            _TweenService:Create(_Frame27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(114, 137, 228),
            }):Play()
        end)
        _TextBox3.FocusLost:Connect(function()
            _TweenService:Create(_Frame27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(37, 40, 43),
            }):Play()
        end)
        _TextBox2.Focused:Connect(function()
            _TweenService:Create(_Frame27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(114, 137, 228),
            }):Play()
        end)
        _TextBox2.FocusLost:Connect(function()
            _TweenService:Create(_Frame27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(37, 40, 43),
            }):Play()
        end)
    end)

    function u1.Notification(_, p175, p176, p177)
        local _TextButton17 = Instance.new('TextButton')
        local _Frame30 = Instance.new('Frame')
        local _UICorner24 = Instance.new('UICorner')
        local _Frame31 = Instance.new('Frame')
        local _UICorner25 = Instance.new('UICorner')
        local _Frame32 = Instance.new('Frame')
        local _TextLabel20 = Instance.new('TextLabel')
        local _TextLabel21 = Instance.new('TextLabel')
        local _TextButton18 = Instance.new('TextButton')
        local _UICorner26 = Instance.new('UICorner')

        _TextButton17.Name = 'NotificationHolderMain'
        _TextButton17.Parent = _Frame
        _TextButton17.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton17.BackgroundTransparency = 1
        _TextButton17.BorderSizePixel = 0
        _TextButton17.Position = UDim2.new(0, 0, 0.0560000017, 0)
        _TextButton17.Size = UDim2.new(0, 681, 0, 374)
        _TextButton17.AutoButtonColor = false
        _TextButton17.Font = Enum.Font.SourceSans
        _TextButton17.Text = ''
        _TextButton17.TextColor3 = Color3.fromRGB(0, 0, 0)
        _TextButton17.TextSize = 14

        _TweenService:Create(_TextButton17, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

        _Frame30.Name = 'Notification'
        _Frame30.Parent = _TextButton17
        _Frame30.AnchorPoint = Vector2.new(0.5, 0.5)
        _Frame30.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        _Frame30.ClipsDescendants = true
        _Frame30.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
        _Frame30.Size = UDim2.new(0, 0, 0, 0)
        _Frame30.BackgroundTransparency = 1

        local v188 = _Frame30

        _Frame30.TweenSize(v188, UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
        _TweenService:Create(_Frame30, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

        _UICorner24.CornerRadius = UDim.new(0, 5)
        _UICorner24.Name = 'NotificationCorner'
        _UICorner24.Parent = _Frame30
        _Frame31.Name = 'UnderBar'
        _Frame31.Parent = _Frame30
        _Frame31.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        _Frame31.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
        _Frame31.Size = UDim2.new(0, 346, 0, 10)
        _UICorner25.CornerRadius = UDim.new(0, 5)
        _UICorner25.Name = 'UnderBarCorner'
        _UICorner25.Parent = _Frame31
        _Frame32.Name = 'UnderBarFrame'
        _Frame32.Parent = _Frame31
        _Frame32.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
        _Frame32.BorderSizePixel = 0
        _Frame32.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
        _Frame32.Size = UDim2.new(0, 346, 0, 40)
        _TextLabel20.Name = 'Text1'
        _TextLabel20.Parent = _Frame30
        _TextLabel20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel20.BackgroundTransparency = 1
        _TextLabel20.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
        _TextLabel20.Size = UDim2.new(0, 346, 0, 68)
        _TextLabel20.Font = Enum.Font.GothamSemibold
        _TextLabel20.Text = p175
        _TextLabel20.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel20.TextSize = 20
        _TextLabel21.Name = 'Text2'
        _TextLabel21.Parent = _Frame30
        _TextLabel21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        _TextLabel21.BackgroundTransparency = 1
        _TextLabel21.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
        _TextLabel21.Size = UDim2.new(0, 272, 0, 63)
        _TextLabel21.Font = Enum.Font.Gotham
        _TextLabel21.Text = p176
        _TextLabel21.TextColor3 = Color3.fromRGB(171, 172, 176)
        _TextLabel21.TextSize = 14
        _TextLabel21.TextWrapped = true
        _TextButton18.Name = 'AlrightBtn'
        _TextButton18.Parent = _Frame30
        _TextButton18.BackgroundColor3 = Color3.fromRGB(79, 214, 58)
        _TextButton18.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
        _TextButton18.Size = UDim2.new(0, 322, 0, 27)
        _TextButton18.Font = Enum.Font.Gotham
        _TextButton18.Text = p177
        _TextButton18.TextColor3 = Color3.fromRGB(255, 255, 255)
        _TextButton18.TextSize = 13
        _TextButton18.AutoButtonColor = false
        _UICorner26.CornerRadius = UDim.new(0, 4)
        _UICorner26.Name = 'AlrightCorner'
        _UICorner26.Parent = _TextButton18

        _TextButton18.MouseButton1Click:Connect(function()
            _TweenService:Create(_TextButton17, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            _Frame30:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
            _TweenService:Create(_Frame30, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            wait()
            _TextButton17:Destroy()
        end)
        _TextButton18.MouseEnter:Connect(function()
            _TweenService:Create(_TextButton18, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(28, 214, 90),
            }):Play()
        end)
        _TextButton18.MouseLeave:Connect(function()
            _TweenService:Create(_TextButton18, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(79, 214, 58),
            }):Play()
        end)
    end

    u44(_Frame7, _Frame)

    _UIPadding.PaddingLeft = UDim.new(0, 14)

    return {
        Server = function(_, p189, p190, _)
            local u191 = false
            local u192 = ''
            local _TextButton19 = Instance.new('TextButton')
            local _UICorner27 = Instance.new('UICorner')

            Instance.new('ImageLabel')

            local _Frame33 = Instance.new('Frame')
            local _UICorner28 = Instance.new('UICorner')

            _TextButton19.Name = p189 .. 'Server'
            _TextButton19.Parent = _ScrollingFrame
            _TextButton19.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _TextButton19.Position = UDim2.new(0.125, 0, 0, 0)
            _TextButton19.Size = UDim2.new(0, 47, 0, 47)
            _TextButton19.AutoButtonColor = false
            _TextButton19.Font = Enum.Font.Gotham
            _TextButton19.Text = ''
            _TextButton19.BackgroundTransparency = 1
            _TextButton19.TextTransparency = 1
            _TextButton19.TextColor3 = Color3.fromRGB(231, 23, 55)
            _TextButton19.TextSize = 20
            _UICorner27.CornerRadius = UDim.new(1, 0)
            _UICorner27.Name = 'ServerCorner'
            _UICorner27.Parent = _TextButton19
            _Frame33.Name = 'ServerWhiteFrame'
            _Frame33.Parent = _TextButton19
            _Frame33.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame33.BackgroundTransparency = 1
            _Frame33.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
            _Frame33.Size = UDim2.new(0, 11, 0, 10)
            _UICorner28.CornerRadius = UDim.new(1, 0)
            _UICorner28.Name = 'ServerWhiteFrameCorner'
            _UICorner28.Parent = _Frame33
            _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y)

            local _Frame34 = Instance.new('Frame')
            local _Frame35 = Instance.new('Frame')
            local _Frame36 = Instance.new('Frame')
            local _Frame37 = Instance.new('Frame')
            local _TextLabel22 = Instance.new('TextLabel')
            local _TextLabel23 = Instance.new('TextLabel')
            local _Frame38 = Instance.new('Frame')
            local _ImageLabel12 = Instance.new('ImageLabel')
            local _Frame39 = Instance.new('Frame')
            local _UICorner29 = Instance.new('UICorner')

            Instance.new('UICorner')

            local _Frame40 = Instance.new('Frame')
            local _TextLabel24 = Instance.new('TextLabel')
            local _TextLabel25 = Instance.new('TextLabel')
            local _Frame41 = Instance.new('Frame')
            local _ImageLabel13 = Instance.new('ImageLabel')
            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
            local _UIListLayout4 = Instance.new('UIListLayout')
            local _UIPadding2 = Instance.new('UIPadding')

            _Frame34.Name = 'ServerFrame'
            _Frame34.Parent = _Folder4
            _Frame34.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame34.BorderSizePixel = 0
            _Frame34.ClipsDescendants = true
            _Frame34.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
            _Frame34.Size = UDim2.new(0, 609, 0, 373)
            _Frame34.Visible = false
            _Frame35.Name = 'ServerFrame1'
            _Frame35.Parent = _Frame34
            _Frame35.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame35.BorderSizePixel = 0
            _Frame35.Position = UDim2.new(0, 0, 0.972290039, 0)
            _Frame35.Size = UDim2.new(0, 12, 0, 10)
            _Frame36.Name = 'ServerFrame2'
            _Frame36.Parent = _Frame34
            _Frame36.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame36.BorderSizePixel = 0
            _Frame36.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
            _Frame36.Size = UDim2.new(0, 12, 0, 9)
            _Frame37.Name = 'ServerTitleFrame'
            _Frame37.Parent = _Frame34
            _Frame37.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame37.BackgroundTransparency = 1
            _Frame37.BorderSizePixel = 0
            _Frame37.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
            _Frame37.Size = UDim2.new(0, 180, 0, 40)
            _TextLabel22.Name = 'ServerTitle'
            _TextLabel22.Parent = _Frame37
            _TextLabel22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel22.BackgroundTransparency = 1
            _TextLabel22.BorderSizePixel = 0
            _TextLabel22.Position = UDim2.new(0.0751359761, 0, 0, 0)
            _TextLabel22.Size = UDim2.new(0, 97, 0, 39)
            _TextLabel22.Font = Enum.Font.GothamSemibold
            _TextLabel22.Text = p189
            _TextLabel22.TextColor3 = Color3.fromRGB(231, 23, 55)
            _TextLabel22.TextSize = 15
            _TextLabel22.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel23.Name = 'ServerTitle'
            _TextLabel23.Parent = _Frame37
            _TextLabel23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel23.BackgroundTransparency = 1
            _TextLabel23.BorderSizePixel = 0
            _TextLabel23.Position = UDim2.new(0.0541359761, 0, 7.5, 0)
            _TextLabel23.Size = UDim2.new(0, 97, 0, 39)
            _TextLabel23.ZIndex = 999
            _TextLabel23.Font = Enum.Font.GothamSemibold
            _TextLabel23.Text = p190
            _TextLabel23.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel23.TextTransparency = 0.8
            _TextLabel23.TextSize = 13
            _TextLabel23.TextXAlignment = Enum.TextXAlignment.Left
            _Frame38.Name = 'GlowFrame'
            _Frame38.Parent = _Frame34
            _Frame38.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame38.BackgroundTransparency = 1
            _Frame38.BorderSizePixel = 0
            _Frame38.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
            _Frame38.Size = UDim2.new(0, 609, 0, 40)
            _ImageLabel12.Name = 'Glow'
            _ImageLabel12.Parent = _Frame38
            _ImageLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ImageLabel12.BackgroundTransparency = 1
            _ImageLabel12.BorderSizePixel = 0
            _ImageLabel12.Position = UDim2.new(0, -15, 0, -15)
            _ImageLabel12.Size = UDim2.new(1, 30, 1, 30)
            _ImageLabel12.ZIndex = 0
            _ImageLabel12.Image = 'rbxassetid://4996891970'
            _ImageLabel12.ImageColor3 = Color3.fromRGB(15, 15, 15)
            _ImageLabel12.ScaleType = Enum.ScaleType.Slice
            _ImageLabel12.SliceCenter = Rect.new(20, 20, 280, 280)
            _Frame39.Name = 'ServerContentFrame'
            _Frame39.Parent = _Frame34
            _Frame39.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _Frame39.BackgroundTransparency = 1
            _Frame39.BorderSizePixel = 0
            _Frame39.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
            _Frame39.Size = UDim2.new(0, 180, 0, 333)
            _UICorner29.CornerRadius = UDim.new(0, 4)
            _UICorner29.Name = 'ServerCorner'
            _UICorner29.Parent = _Frame34
            _Frame40.Name = 'ChannelTitleFrame'
            _Frame40.Parent = _Frame34
            _Frame40.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            _Frame40.BorderSizePixel = 0
            _Frame40.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
            _Frame40.Size = UDim2.new(0, 429, 0, 40)
            _TextLabel24.Name = 'Hashtag'
            _TextLabel24.Parent = _Frame40
            _TextLabel24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel24.BackgroundTransparency = 1
            _TextLabel24.BorderSizePixel = 0
            _TextLabel24.Position = UDim2.new(0.0279720277, 0, 0, 0)
            _TextLabel24.Size = UDim2.new(0, 19, 0, 39)
            _TextLabel24.Font = Enum.Font.Gotham
            _TextLabel24.Text = '#'
            _TextLabel24.TextColor3 = Color3.fromRGB(114, 118, 125)
            _TextLabel24.TextSize = 25
            _TextLabel25.Name = 'ChannelTitle'
            _TextLabel25.Parent = _Frame40
            _TextLabel25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel25.BackgroundTransparency = 1
            _TextLabel25.BorderSizePixel = 0
            _TextLabel25.Position = UDim2.new(0.0862470865, 0, 0, 0)
            _TextLabel25.Size = UDim2.new(0, 95, 0, 39)
            _TextLabel25.Font = Enum.Font.GothamSemibold
            _TextLabel25.Text = ''
            _TextLabel25.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel25.TextSize = 15
            _TextLabel25.TextXAlignment = Enum.TextXAlignment.Left
            _Frame41.Name = 'ChannelContentFrame'
            _Frame41.Parent = _Frame34
            _Frame41.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            _Frame41.BorderSizePixel = 0
            _Frame41.ClipsDescendants = true
            _Frame41.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
            _Frame41.Size = UDim2.new(0, 429, 0, 333)
            _ImageLabel13.Name = 'GlowChannel'
            _ImageLabel13.Parent = _Frame41
            _ImageLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ImageLabel13.BackgroundTransparency = 1
            _ImageLabel13.BorderSizePixel = 0
            _ImageLabel13.Position = UDim2.new(0, -33, 0, -91)
            _ImageLabel13.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
            _ImageLabel13.ZIndex = 0
            _ImageLabel13.Image = 'rbxassetid://4996891970'
            _ImageLabel13.ImageColor3 = Color3.fromRGB(15, 15, 15)
            _ImageLabel13.ScaleType = Enum.ScaleType.Slice
            _ImageLabel13.SliceCenter = Rect.new(20, 20, 280, 280)
            _ScrollingFrame2.Name = 'ServerChannelHolder'
            _ScrollingFrame2.Parent = _Frame39
            _ScrollingFrame2.Active = true
            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame2.BackgroundTransparency = 1
            _ScrollingFrame2.BorderSizePixel = 0
            _ScrollingFrame2.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
            _ScrollingFrame2.Selectable = false
            _ScrollingFrame2.Size = UDim2.new(0, 179, 0, 278)
            _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
            _ScrollingFrame2.ScrollBarThickness = 4
            _ScrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
            _ScrollingFrame2.ScrollBarImageTransparency = 1
            _UIListLayout4.Name = 'ServerChannelHolderLayout'
            _UIListLayout4.Parent = _ScrollingFrame2
            _UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout4.Padding = UDim.new(0, 4)
            _UIPadding2.Name = 'ServerChannelHolderPadding'
            _UIPadding2.Parent = _ScrollingFrame2
            _UIPadding2.PaddingLeft = UDim.new(0, 9)

            _ScrollingFrame2.MouseEnter:Connect(function()
                _ScrollingFrame2.ScrollBarImageTransparency = 0
            end)
            _ScrollingFrame2.MouseLeave:Connect(function()
                _ScrollingFrame2.ScrollBarImageTransparency = 1
            end)
            _TextButton19.MouseEnter:Connect(function()
                if u48 ~= _TextButton19.Name then
                    _TweenService:Create(_TextButton19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(114, 137, 228),
                    }):Play()
                    _TweenService:Create(_UICorner27, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        CornerRadius = UDim.new(0, 15),
                    }):Play()
                    _Frame33:TweenSize(UDim2.new(0, 11, 0, 27), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                end
            end)
            _TextButton19.MouseLeave:Connect(function()
                if u48 ~= _TextButton19.Name then
                    _TweenService:Create(_TextButton19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                    }):Play()
                    _TweenService:Create(_UICorner27, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        CornerRadius = UDim.new(1, 0),
                    }):Play()
                    _Frame33:TweenSize(UDim2.new(0, 11, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                end
            end)
            _TextButton19.MouseButton1Click:Connect(function()
                u48 = _TextButton19.Name

                local v215 = next
                local v216, v217 = _Folder4:GetChildren()

                while true do
                    local v218

                    v217, v218 = v215(v216, v217)

                    if v217 == nil then
                        break
                    end
                    if v218.Name == 'ServerFrame' then
                        v218.Visible = false
                    end

                    _Frame34.Visible = true
                end

                local v219 = next
                local v220, v221 = _ScrollingFrame:GetChildren()

                while true do
                    local v222

                    v221, v222 = v219(v220, v221)

                    if v221 == nil then
                        break
                    end
                    if v222.ClassName == 'TextButton' then
                        _TweenService:Create(v222, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        }):Play()
                        _TweenService:Create(_TextButton19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        }):Play()
                        _TweenService:Create(v222.ServerCorner, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            CornerRadius = UDim.new(1, 0),
                        }):Play()
                        _TweenService:Create(_UICorner27, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            CornerRadius = UDim.new(0, 15),
                        }):Play()
                        v222.ServerWhiteFrame:TweenSize(UDim2.new(0, 11, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                        _Frame33:TweenSize(UDim2.new(0, 11, 0, 46), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                    end
                end
            end)

            if u50 == false then
                _TweenService:Create(_TextButton19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                }):Play()
                _TweenService:Create(_UICorner27, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    CornerRadius = UDim.new(0, 15),
                }):Play()

                local v223 = _Frame33

                _Frame33.TweenSize(v223, UDim2.new(0, 11, 0, 46), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)

                _Frame34.Visible = true
                _TextButton19.Name = p189 .. 'Server'
                u48 = _TextButton19.Name
                u50 = true
            end

            return {
                Channel = function(_, p224)
                    local _TextButton20 = Instance.new('TextButton')
                    local _UICorner30 = Instance.new('UICorner')
                    local _TextLabel26 = Instance.new('TextLabel')
                    local _TextLabel27 = Instance.new('TextLabel')

                    _TextButton20.Name = p224 .. 'ChannelBtn'
                    _TextButton20.Parent = _ScrollingFrame2
                    _TextButton20.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _TextButton20.BorderSizePixel = 0
                    _TextButton20.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
                    _TextButton20.Size = UDim2.new(0, 160, 0, 30)
                    _TextButton20.AutoButtonColor = false
                    _TextButton20.Font = Enum.Font.SourceSans
                    _TextButton20.Text = ''
                    _TextButton20.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton20.TextSize = 14
                    _UICorner30.CornerRadius = UDim.new(0, 8)
                    _UICorner30.Name = 'ChannelBtnCorner'
                    _UICorner30.Parent = _TextButton20
                    _TextLabel26.Name = 'ChannelBtnHashtag'
                    _TextLabel26.Parent = _TextButton20
                    _TextLabel26.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel26.BackgroundTransparency = 1
                    _TextLabel26.BorderSizePixel = 0
                    _TextLabel26.Position = UDim2.new(0.08, 0, 0, 0)
                    _TextLabel26.Size = UDim2.new(0, 24, 0, 30)
                    _TextLabel26.Font = Enum.Font.Gotham
                    _TextLabel26.Text = ''
                    _TextLabel26.TextColor3 = Color3.fromRGB(114, 118, 125)
                    _TextLabel26.TextSize = 21
                    _TextLabel27.Name = 'ChannelBtnTitle'
                    _TextLabel27.Parent = _TextButton20
                    _TextLabel27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel27.BackgroundTransparency = 1
                    _TextLabel27.BorderSizePixel = 0
                    _TextLabel27.Position = UDim2.new(0.05, 0, -0.166666672, 0)
                    _TextLabel27.Size = UDim2.new(0, 95, 0, 39)
                    _TextLabel27.Font = Enum.Font.Gotham
                    _TextLabel27.Text = p224
                    _TextLabel27.TextColor3 = Color3.fromRGB(114, 118, 125)
                    _TextLabel27.TextSize = 14
                    _TextLabel27.TextXAlignment = Enum.TextXAlignment.Left
                    _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout4.AbsoluteContentSize.Y)

                    local _ScrollingFrame3 = Instance.new('ScrollingFrame')
                    local _UIListLayout5 = Instance.new('UIListLayout')

                    _ScrollingFrame3.Name = 'ChannelHolder'
                    _ScrollingFrame3.Parent = _Frame41
                    _ScrollingFrame3.Active = true
                    _ScrollingFrame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _ScrollingFrame3.BackgroundTransparency = 1
                    _ScrollingFrame3.BorderSizePixel = 0
                    _ScrollingFrame3.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
                    _ScrollingFrame3.Size = UDim2.new(0, 412, 0, 314)
                    _ScrollingFrame3.ScrollBarThickness = 6
                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
                    _ScrollingFrame3.ScrollBarImageTransparency = 0
                    _ScrollingFrame3.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
                    _ScrollingFrame3.Visible = false
                    _ScrollingFrame3.ClipsDescendants = false
                    _UIListLayout5.Name = 'ChannelHolderLayout'
                    _UIListLayout5.Parent = _ScrollingFrame3
                    _UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                    _UIListLayout5.Padding = UDim.new(0, 8)

                    _TextButton20.MouseEnter:Connect(function()
                        if u192 ~= _TextButton20.Name then
                            _TextButton20.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            _TextLabel27.TextColor3 = Color3.fromRGB(220, 221, 222)
                        end
                    end)
                    _TextButton20.MouseLeave:Connect(function()
                        if u192 ~= _TextButton20.Name then
                            _TextButton20.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _TextLabel27.TextColor3 = Color3.fromRGB(114, 118, 125)
                        end
                    end)
                    _TextButton20.MouseButton1Click:Connect(function()
                        local v231 = next
                        local v232, v233 = _Frame41:GetChildren()

                        while true do
                            local v234

                            v233, v234 = v231(v232, v233)

                            if v233 == nil then
                                break
                            end
                            if v234.Name == 'ChannelHolder' then
                                v234.Visible = false
                            end

                            _ScrollingFrame3.Visible = true
                        end

                        local v235 = next
                        local v236, v237 = _ScrollingFrame2:GetChildren()

                        while true do
                            local v238

                            v237, v238 = v235(v236, v237)

                            if v237 == nil then
                                break
                            end
                            if v238.ClassName == 'TextButton' then
                                v238.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                v238.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
                            end

                            _Frame34.Visible = true
                        end

                        _TextLabel25.Text = p224
                        _TextButton20.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                        _TextLabel27.TextColor3 = Color3.fromRGB(255, 255, 255)
                        u192 = _TextButton20.Name
                    end)

                    if u191 == false then
                        u191 = true
                        _TextLabel25.Text = p224
                        _TextButton20.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                        _TextLabel27.TextColor3 = Color3.fromRGB(255, 255, 255)
                        u192 = _TextButton20.Name
                        _ScrollingFrame3.Visible = true
                    end

                    return {
                        Button = function(_, p239, p240)
                            local _TextButton21 = Instance.new('TextButton')
                            local _UICorner31 = Instance.new('UICorner')

                            _TextButton21.Name = 'Button'
                            _TextButton21.Parent = _ScrollingFrame3
                            _TextButton21.BackgroundColor3 = Color3.fromRGB(231, 23, 55)
                            _TextButton21.Size = UDim2.new(0, 401, 0, 30)
                            _TextButton21.AutoButtonColor = false
                            _TextButton21.Font = Enum.Font.Gotham
                            _TextButton21.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton21.TextSize = 14
                            _TextButton21.Text = p239
                            _UICorner31.CornerRadius = UDim.new(0, 4)
                            _UICorner31.Name = 'ButtonCorner'
                            _UICorner31.Parent = _TextButton21

                            _TextButton21.MouseEnter:Connect(function()
                                _TweenService:Create(_TextButton21, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = Color3.fromRGB(231, 23, 55),
                                }):Play()
                            end)
                            _TextButton21.MouseButton1Click:Connect(function()
                                pcall(p240)

                                _TextButton21.TextSize = 0

                                _TweenService:Create(_TextButton21, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextSize = 14}):Play()
                            end)
                            _TextButton21.MouseLeave:Connect(function()
                                _TweenService:Create(_TextButton21, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = Color3.fromRGB(231, 23, 55),
                                }):Play()
                            end)

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                        Toggle = function(_, p243, p244, p245)
                            local u246 = false
                            local _TextButton22 = Instance.new('TextButton')
                            local _TextLabel28 = Instance.new('TextLabel')
                            local _Frame42 = Instance.new('Frame')
                            local _UICorner32 = Instance.new('UICorner')
                            local _Frame43 = Instance.new('Frame')
                            local _UICorner33 = Instance.new('UICorner')
                            local _ImageLabel14 = Instance.new('ImageLabel')

                            _TextButton22.Name = 'Toggle'
                            _TextButton22.Parent = _ScrollingFrame3
                            _TextButton22.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _TextButton22.BorderSizePixel = 0
                            _TextButton22.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
                            _TextButton22.Size = UDim2.new(0, 401, 0, 30)
                            _TextButton22.AutoButtonColor = false
                            _TextButton22.Font = Enum.Font.Gotham
                            _TextButton22.Text = ''
                            _TextButton22.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton22.TextSize = 14
                            _TextLabel28.Name = 'ToggleTitle'
                            _TextLabel28.Parent = _TextButton22
                            _TextLabel28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel28.BackgroundTransparency = 1
                            _TextLabel28.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel28.Size = UDim2.new(0, 200, 0, 30)
                            _TextLabel28.Font = Enum.Font.Gotham
                            _TextLabel28.Text = p243
                            _TextLabel28.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel28.TextSize = 14
                            _TextLabel28.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame42.Name = 'ToggleFrame'
                            _Frame42.Parent = _TextButton22
                            _Frame42.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            _Frame42.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
                            _Frame42.Size = UDim2.new(0, 40, 0, 21)
                            _UICorner32.CornerRadius = UDim.new(0, 4)
                            _UICorner32.Name = 'ToggleFrameCorner'
                            _UICorner32.Parent = _Frame42
                            _Frame43.Name = 'ToggleFrameCircle'
                            _Frame43.Parent = _Frame42
                            _Frame43.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            _Frame43.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
                            _Frame43.Size = UDim2.new(0, 15, 0, 15)
                            _UICorner33.CornerRadius = UDim.new(0, 4)
                            _UICorner33.Name = 'ToggleFrameCircleCorner'
                            _UICorner33.Parent = _Frame43
                            _ImageLabel14.Name = 'Icon'
                            _ImageLabel14.Parent = _Frame43
                            _ImageLabel14.AnchorPoint = Vector2.new(0.5, 0.5)
                            _ImageLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel14.BackgroundTransparency = 1
                            _ImageLabel14.BorderColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel14.Position = UDim2.new(0, 7, 0, 7)
                            _ImageLabel14.Size = UDim2.new(0, 13, 0, 13)
                            _ImageLabel14.Image = 'http://www.roblox.com/asset/?id=6035047409'
                            _ImageLabel14.ImageColor3 = Color3.fromRGB(255, 255, 255)

                            if u12[p243] == nil then
                                if u12[p243] == nil then
                                    u12[p243] = p244
                                end
                            else
                                p244 = u12[p243]
                            end

                            _TextButton22.MouseButton1Click:Connect(function()
                                if u246 ~= false then
                                    u12[p243] = false

                                    if u13.AutoSave then
                                        u8:SaveFile()
                                    end

                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ImageColor3 = Color3.fromRGB(255, 255, 255),
                                    }):Play()
                                    _TweenService:Create(_Frame42, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
                                    }):Play()
                                    _Frame43:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

                                    _ImageLabel14.Image = 'http://www.roblox.com/asset/?id=6035047409'

                                    wait(0.01)
                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
                                else
                                    u12[p243] = true

                                    if u13.AutoSave then
                                        u8:SaveFile()
                                    end

                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ImageColor3 = Color3.fromRGB(255, 255, 255),
                                    }):Play()
                                    _TweenService:Create(_Frame42, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        BackgroundColor3 = Color3.fromRGB(231, 23, 55),
                                    }):Play()
                                    _Frame43:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

                                    _ImageLabel14.Image = 'http://www.roblox.com/asset/?id=6023426926'

                                    wait(0.1)
                                    _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
                                end

                                u246 = not u246

                                pcall(p245, u246)
                            end)

                            if p244 == true then
                                local v254 = false

                                _TweenService:Create(_ImageLabel14, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                                }):Play()
                                _TweenService:Create(_Frame42, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = Color3.fromRGB(231, 23, 55),
                                }):Play()
                                _Frame43:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                                _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

                                _ImageLabel14.Image = 'http://www.roblox.com/asset/?id=6023426926'

                                wait(0.1)
                                _TweenService:Create(_ImageLabel14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

                                v254 = not v254

                                pcall(p245, v254)
                            else
                                wait(0.1)
                            end

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                        Slider = function(_, p255, p256, p257, p258, p259)
                            if u12[p255] == nil then
                                if u12[p255] == nil then
                                    u12[p255] = p258
                                end
                            else
                                p258 = u12[p255]

                                pcall(p259, p258)
                            end

                            local v260 = {}
                            local u261 = false
                            local _TextButton23 = Instance.new('TextButton')
                            local _TextLabel29 = Instance.new('TextLabel')
                            local _Frame44 = Instance.new('Frame')
                            local _UICorner34 = Instance.new('UICorner')
                            local _Frame45 = Instance.new('Frame')
                            local _UICorner35 = Instance.new('UICorner')
                            local _Frame46 = Instance.new('Frame')
                            local _UICorner36 = Instance.new('UICorner')
                            local _Frame47 = Instance.new('Frame')
                            local _UICorner37 = Instance.new('UICorner')
                            local _Frame48 = Instance.new('Frame')
                            local _ImageLabel15 = Instance.new('ImageLabel')
                            local _TextLabel30 = Instance.new('TextLabel')

                            _TextButton23.Name = 'Slider'
                            _TextButton23.Parent = _ScrollingFrame3
                            _TextButton23.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _TextButton23.BorderSizePixel = 0
                            _TextButton23.Position = UDim2.new(0, 0, 0.216560602, 0)
                            _TextButton23.Size = UDim2.new(0, 401, 0, 38)
                            _TextButton23.AutoButtonColor = false
                            _TextButton23.Font = Enum.Font.Gotham
                            _TextButton23.Text = ''
                            _TextButton23.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton23.TextSize = 14
                            _TextLabel29.Name = 'SliderTitle'
                            _TextLabel29.Parent = _TextButton23
                            _TextLabel29.BackgroundColor3 = Color3.fromRGB(231, 23, 55)
                            _TextLabel29.BackgroundTransparency = 1
                            _TextLabel29.Position = UDim2.new(0, 5, 0, -4)
                            _TextLabel29.Size = UDim2.new(0, 200, 0, 27)
                            _TextLabel29.Font = Enum.Font.Gotham
                            _TextLabel29.Text = p255
                            _TextLabel29.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel29.TextSize = 14
                            _TextLabel29.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame44.Name = 'SliderFrame'
                            _Frame44.Parent = _TextButton23
                            _Frame44.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame44.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            _Frame44.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
                            _Frame44.Size = UDim2.new(0, 385, 0, 8)
                            _UICorner34.Name = 'SliderFrameCorner'
                            _UICorner34.Parent = _Frame44
                            _Frame45.Name = 'CurrentValueFrame'
                            _Frame45.Parent = _Frame44
                            _Frame45.BackgroundColor3 = Color3.fromRGB(231, 23, 55)
                            _Frame45.Size = UDim2.new((p258 or 0) / p257, 0, 0, 8)
                            _UICorner35.Name = 'CurrentValueFrameCorner'
                            _UICorner35.Parent = _Frame45
                            _Frame46.Name = 'Zip'
                            _Frame46.Parent = _Frame44
                            _Frame46.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame46.Position = UDim2.new((p258 or 0) / p257, -6, -0.644999981, 0)
                            _Frame46.Size = UDim2.new(0, 10, 0, 18)
                            _UICorner36.CornerRadius = UDim.new(0, 3)
                            _UICorner36.Name = 'ZipCorner'
                            _UICorner36.Parent = _Frame46
                            _Frame47.Name = 'ValueBubble'
                            _Frame47.Parent = _Frame46
                            _Frame47.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame47.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                            _Frame47.Position = UDim2.new(0.5, 0, -1.00800002, 0)
                            _Frame47.Size = UDim2.new(0, 36, 0, 21)
                            _Frame47.Visible = false

                            _Frame46.MouseEnter:Connect(function()
                                if u261 == false then
                                    _Frame47.Visible = true
                                end
                            end)
                            _Frame46.MouseLeave:Connect(function()
                                if u261 == false then
                                    _Frame47.Visible = false
                                end
                            end)

                            _UICorner37.CornerRadius = UDim.new(0, 3)
                            _UICorner37.Name = 'ValueBubbleCorner'
                            _UICorner37.Parent = _Frame47
                            _Frame48.Name = 'SquareBubble'
                            _Frame48.Parent = _Frame47
                            _Frame48.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame48.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                            _Frame48.BorderSizePixel = 0
                            _Frame48.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
                            _Frame48.Rotation = 45
                            _Frame48.Size = UDim2.new(0, 19, 0, 19)
                            _ImageLabel15.Name = 'GlowBubble'
                            _ImageLabel15.Parent = _Frame47
                            _ImageLabel15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel15.BackgroundTransparency = 1
                            _ImageLabel15.BorderSizePixel = 0
                            _ImageLabel15.Position = UDim2.new(0, -15, 0, -15)
                            _ImageLabel15.Size = UDim2.new(1, 30, 1, 30)
                            _ImageLabel15.ZIndex = 0
                            _ImageLabel15.Image = 'rbxassetid://4996891970'
                            _ImageLabel15.ImageColor3 = Color3.fromRGB(15, 15, 15)
                            _ImageLabel15.ScaleType = Enum.ScaleType.Slice
                            _ImageLabel15.SliceCenter = Rect.new(20, 20, 280, 280)
                            _TextLabel30.Name = 'ValueLabel'
                            _TextLabel30.Parent = _Frame47
                            _TextLabel30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel30.BackgroundTransparency = 1
                            _TextLabel30.Size = UDim2.new(0, 36, 0, 21)
                            _TextLabel30.Font = Enum.Font.Gotham
                            _TextLabel30.Text = tostring(p258 and (math.floor(p258 / p257 * (p257 - p256) + p256) or 0) or 0)
                            _TextLabel30.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel30.TextSize = 10

                            local function u278(p275)
                                local v276 = UDim2.new(math.clamp((p275.Position.X - _Frame44.AbsolutePosition.X) / _Frame44.AbsoluteSize.X, 0, 1), -6, -0.644999981, 0)

                                _Frame45.Size = UDim2.new(math.clamp((p275.Position.X - _Frame44.AbsolutePosition.X) / _Frame44.AbsoluteSize.X, 0, 1), 0, 0, 8)
                                _Frame46.Position = v276

                                local v277 = math.floor(v276.X.Scale * p257 / p257 * (p257 - p256) + p256)

                                _TextLabel30.Text = tostring(v277)
                                u12[p255] = v277

                                if u13.AutoSave then
                                    u8:SaveFile()
                                end

                                pcall(p259, v277)
                            end

                            _Frame46.InputBegan:Connect(function(p279)
                                if p279.UserInputType == Enum.UserInputType.MouseButton1 then
                                    u261 = true
                                    _Frame47.Visible = true
                                end
                            end)
                            _Frame46.InputEnded:Connect(function(p280)
                                if p280.UserInputType == Enum.UserInputType.MouseButton1 then
                                    u261 = false
                                    _Frame47.Visible = false
                                end
                            end)
                            game:GetService('UserInputService').InputChanged:Connect(function(p281)
                                if u261 and p281.UserInputType == Enum.UserInputType.MouseMovement then
                                    u278(p281)
                                end
                            end)

                            function v260.Change(_, p282)
                                _Frame45.Size = UDim2.new((p282 or 0) / p257, 0, 0, 8)
                                _Frame46.Position = UDim2.new((p282 or 0) / p257, -6, -0.644999981, 0)
                                _TextLabel30.Text = tostring(p282 and (math.floor(p282 / p257 * (p257 - p256) + p256) or 0) or 0)
                                u12[p255] = p282

                                if u13.AutoSave then
                                    u8:Savefile()
                                end

                                pcall(p259, p282)
                            end

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)

                            return v260
                        end,
                        Line = function(_)
                            local _Frame49 = Instance.new('Frame')
                            local _Frame50 = Instance.new('Frame')

                            _Frame49.Name = 'Seperator1'
                            _Frame49.Parent = _ScrollingFrame3
                            _Frame49.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame49.BackgroundTransparency = 1
                            _Frame49.Position = UDim2.new(0, 0, 0.350318581, 0)
                            _Frame49.Size = UDim2.new(0, 100, 0, 8)
                            _Frame50.Name = 'Seperator2'
                            _Frame50.Parent = _Frame49
                            _Frame50.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
                            _Frame50.BorderSizePixel = 0
                            _Frame50.Position = UDim2.new(0, 0, 0, 4)
                            _Frame50.Size = UDim2.new(0, 401, 0, 1)
                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                        MultiDropdown = function(_, p285, p286, p287, p288)
                            local function u295(p289, p290)
                                local v291, v292, v293 = pairs(p289)

                                while true do
                                    local v294

                                    v293, v294 = v291(v292, v293)

                                    if v293 == nil then
                                        break
                                    end
                                    if v294 == p290 then
                                        return true
                                    end
                                end

                                return false
                            end

                            local v296 = {}
                            local u297 = {}
                            local u298 = 0
                            local u299 = 0
                            local u300 = false
                            local _Frame51 = Instance.new('Frame')
                            local _TextLabel31 = Instance.new('TextLabel')
                            local _Frame52 = Instance.new('Frame')
                            local _UICorner38 = Instance.new('UICorner')
                            local _Frame53 = Instance.new('Frame')
                            local _UICorner39 = Instance.new('UICorner')
                            local _TextLabel32 = Instance.new('TextLabel')
                            local _ImageLabel16 = Instance.new('ImageLabel')
                            local _TextButton24 = Instance.new('TextButton')

                            if u12[p285] == nil then
                                if u12[p285] == nil then
                                    u12[p285] = p287
                                end
                            else
                                p287 = u12[p285]
                                u297 = u12[p285]

                                pcall(p288, u297)
                            end

                            _Frame51.Name = 'Dropdown'
                            _Frame51.Parent = _ScrollingFrame3
                            _Frame51.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame51.BackgroundTransparency = 1
                            _Frame51.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
                            _Frame51.Size = UDim2.new(0, 403, 0, 73)
                            _TextLabel31.Name = 'DropdownTitle'
                            _TextLabel31.Parent = _Frame51
                            _TextLabel31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel31.BackgroundTransparency = 1
                            _TextLabel31.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel31.Size = UDim2.new(0, 200, 0, 29)
                            _TextLabel31.Font = Enum.Font.Gotham
                            _TextLabel31.Text = p285
                            _TextLabel31.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel31.TextSize = 14
                            _TextLabel31.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame52.Name = 'DropdownFrameOutline'
                            _Frame52.Parent = _TextLabel31
                            _Frame52.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame52.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                            _Frame52.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
                            _Frame52.Size = UDim2.new(0, 396, 0, 36)
                            _UICorner38.CornerRadius = UDim.new(0, 3)
                            _UICorner38.Name = 'DropdownFrameOutlineCorner'
                            _UICorner38.Parent = _Frame52
                            _Frame53.Name = 'DropdownFrame'
                            _Frame53.Parent = _TextLabel31
                            _Frame53.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _Frame53.ClipsDescendants = true
                            _Frame53.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
                            _Frame53.Selectable = true
                            _Frame53.Size = UDim2.new(0, 392, 0, 32)
                            _UICorner39.CornerRadius = UDim.new(0, 4)
                            _UICorner39.Name = 'DropdownFrameCorner'
                            _UICorner39.Parent = _Frame53
                            _TextLabel32.Name = 'CurrentSelectedText'
                            _TextLabel32.Parent = _Frame53
                            _TextLabel32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel32.BackgroundTransparency = 1
                            _TextLabel32.Position = UDim2.new(0.0178571437, 0, 0, 0)
                            _TextLabel32.Size = UDim2.new(0, 193, 0, 32)
                            _TextLabel32.Font = Enum.Font.Gotham
                            _TextLabel32.Text = p285 .. ': ' .. table.concat(p287, ',')
                            _TextLabel32.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel32.TextSize = 14
                            _TextLabel32.TextXAlignment = Enum.TextXAlignment.Left
                            _ImageLabel16.Name = 'ArrowImg'
                            _ImageLabel16.Parent = _TextLabel32
                            _ImageLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel16.BackgroundTransparency = 1
                            _ImageLabel16.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
                            _ImageLabel16.Size = UDim2.new(0, 22, 0, 22)
                            _ImageLabel16.Image = 'http://www.roblox.com/asset/?id=6034818372'
                            _ImageLabel16.ImageColor3 = Color3.fromRGB(212, 212, 212)
                            _TextButton24.Name = 'DropdownFrameBtn'
                            _TextButton24.Parent = _Frame53
                            _TextButton24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton24.BackgroundTransparency = 1
                            _TextButton24.Size = UDim2.new(0, 392, 0, 32)
                            _TextButton24.Font = Enum.Font.SourceSans
                            _TextButton24.Text = ''
                            _TextButton24.TextColor3 = Color3.fromRGB(0, 0, 0)
                            _TextButton24.TextSize = 14

                            local _Frame54 = Instance.new('Frame')
                            local _UICorner40 = Instance.new('UICorner')
                            local _Frame55 = Instance.new('Frame')
                            local _UICorner41 = Instance.new('UICorner')
                            local _TextLabel33 = Instance.new('TextLabel')
                            local _ScrollingFrame4 = Instance.new('ScrollingFrame')
                            local _UIListLayout6 = Instance.new('UIListLayout')

                            _Frame54.Name = 'DropdownFrameMainOutline'
                            _Frame54.Parent = _TextLabel31
                            _Frame54.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                            _Frame54.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
                            _Frame54.Size = UDim2.new(0, 396, 0, 81)
                            _Frame54.Visible = false
                            _UICorner40.CornerRadius = UDim.new(0, 3)
                            _UICorner40.Name = 'DropdownFrameMainOutlineCorner'
                            _UICorner40.Parent = _Frame54
                            _Frame55.Name = 'DropdownFrameMain'
                            _Frame55.Parent = _TextLabel31
                            _Frame55.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _Frame55.ClipsDescendants = true
                            _Frame55.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
                            _Frame55.Selectable = true
                            _Frame55.Size = UDim2.new(0, 392, 0, 77)
                            _Frame55.Visible = false
                            _UICorner41.CornerRadius = UDim.new(0, 4)
                            _UICorner41.Name = 'DropdownFrameMainCorner'
                            _UICorner41.Parent = _Frame55
                            _TextLabel33.Name = 'ItemHolderLabel'
                            _TextLabel33.Parent = _Frame55
                            _TextLabel33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel33.BackgroundTransparency = 1
                            _TextLabel33.Position = UDim2.new(0.0178571437, 0, 0, 0)
                            _TextLabel33.Size = UDim2.new(0, 193, 0, 13)
                            _TextLabel33.Font = Enum.Font.Gotham
                            _TextLabel33.Text = ''
                            _TextLabel33.TextColor3 = Color3.fromRGB(212, 212, 212)
                            _TextLabel33.TextSize = 14
                            _TextLabel33.TextXAlignment = Enum.TextXAlignment.Left
                            _ScrollingFrame4.Name = 'ItemHolder'
                            _ScrollingFrame4.Parent = _TextLabel33
                            _ScrollingFrame4.Active = true
                            _ScrollingFrame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ScrollingFrame4.BackgroundTransparency = 1
                            _ScrollingFrame4.Position = UDim2.new(0, 0, 0.215384638, 0)
                            _ScrollingFrame4.Size = UDim2.new(0, 385, 0, 0)
                            _ScrollingFrame4.CanvasSize = UDim2.new(0, 0, 0, 0)
                            _ScrollingFrame4.ScrollBarThickness = 4
                            _ScrollingFrame4.BorderSizePixel = 0
                            _ScrollingFrame4.ScrollBarImageColor3 = Color3.fromRGB(231, 23, 55)
                            _UIListLayout6.Name = 'ItemHolderLayout'
                            _UIListLayout6.Parent = _ScrollingFrame4
                            _UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout6.Padding = UDim.new(0, 0)

                            _TextButton24.MouseButton1Click:Connect(function()
                                if u300 ~= false then
                                    _Frame51.Size = UDim2.new(0, 403, 0, 73)
                                    _Frame55.Visible = false
                                    _Frame54.Visible = false
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                else
                                    _Frame55.Visible = true
                                    _Frame54.Visible = true
                                    _Frame51.Size = UDim2.new(0, 403, 0, 73 + _Frame54.AbsoluteSize.Y)
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                end

                                u300 = not u300
                            end)

                            local v317 = next
                            local u318 = _Frame54
                            local u319 = _Frame55
                            local v320 = nil

                            while true do
                                local u321

                                v320, u321 = v317(p286, v320)

                                if v320 == nil then
                                    break
                                end

                                u298 = u298 + 1
                                u299 = u298 == 1 and 29 or (u298 == 2 and 58 or (3 <= u298 and u298 <= 9 and 87 or (u298 >= 10 and 200 or u299)))

                                local _TextButton25 = Instance.new('TextButton')
                                local _UICorner42 = Instance.new('UICorner')
                                local _TextLabel34 = Instance.new('TextLabel')

                                _TextButton25.Name = 'Item'
                                _TextButton25.Parent = _ScrollingFrame4
                                _TextButton25.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                                _TextButton25.Size = UDim2.new(0, 379, 0, 29)
                                _TextButton25.AutoButtonColor = false
                                _TextButton25.Font = Enum.Font.SourceSans
                                _TextButton25.Text = ''
                                _TextButton25.TextColor3 = Color3.fromRGB(0, 0, 0)
                                _TextButton25.TextSize = 14
                                _TextButton25.BackgroundTransparency = 1
                                _UICorner42.CornerRadius = UDim.new(0, 4)
                                _UICorner42.Name = 'ItemCorner'
                                _UICorner42.Parent = _TextButton25
                                _TextLabel34.Name = 'ItemText'
                                _TextLabel34.Parent = _TextButton25
                                _TextLabel34.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextLabel34.BackgroundTransparency = 1
                                _TextLabel34.Position = UDim2.new(0.0211081803, 0, 0, 0)
                                _TextLabel34.Size = UDim2.new(0, 192, 0, 29)
                                _TextLabel34.Font = Enum.Font.Gotham
                                _TextLabel34.TextColor3 = Color3.fromRGB(212, 212, 212)
                                _TextLabel34.TextSize = 14
                                _TextLabel34.TextXAlignment = Enum.TextXAlignment.Left
                                _TextLabel34.Text = u321

                                local v325 = table.concat(u297, ',')

                                if string.find(v325, _TextLabel34.Text) then
                                    _TextLabel34.TextColor3 = Color3.fromRGB(255, 10, 5)
                                end

                                _TextButton25.MouseButton1Click:Connect(function()
                                    if u295(u297, u321) then
                                        local v326 = next
                                        local v327 = u297
                                        local v328 = nil

                                        while true do
                                            local v329

                                            v328, v329 = v326(v327, v328)

                                            if v328 == nil then
                                                break
                                            end
                                            if v329 == u321 then
                                                table.remove(u297, v328)
                                            end
                                        end

                                        _TextLabel34.TextColor3 = Color3.fromRGB(212, 212, 212)
                                        _TextLabel32.Text = p285 .. ' : ' .. table.concat(u297, ',')
                                        u12[p285] = u297

                                        if u13.AutoSave then
                                            u8:SaveFile()
                                        end

                                        pcall(p288, u297)
                                    else
                                        table.insert(u297, u321)

                                        _TextLabel32.Text = p285 .. ' : ' .. table.concat(u297, ',')
                                        _TextLabel34.TextColor3 = Color3.fromRGB(255, 10, 5)
                                        u12[p285] = u297

                                        if u13.AutoSave then
                                            u8:SaveFile()
                                        end

                                        pcall(p288, u297)
                                    end
                                end)

                                _ScrollingFrame4.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout6.AbsoluteContentSize.Y)
                                _ScrollingFrame4.Size = UDim2.new(0, 385, 0, u299)
                                u319.Size = UDim2.new(0, 392, 0, u299 + 6)
                                u318.Size = UDim2.new(0, 396, 0, u299 + 10)
                            end

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)

                            function v296.Clear(_)
                                local v330 = next
                                local v331, v332 = _ScrollingFrame4:GetChildren()

                                while true do
                                    local v333

                                    v332, v333 = v330(v331, v332)

                                    if v332 == nil then
                                        break
                                    end
                                    if v333.Name == 'Item' then
                                        v333:Destroy()
                                    end
                                end

                                table.clear(u297)

                                _TextLabel32.Text = '...'
                                u12[p285] = u297

                                if u13.AutoSave then
                                    u8:SaveFile()
                                end

                                u298 = 0
                                u299 = 0
                                _ScrollingFrame4.Size = UDim2.new(0, 385, 0, 0)
                                u319.Size = UDim2.new(0, 392, 0, 0)
                                u318.Size = UDim2.new(0, 396, 0, 0)
                                _Frame51.Size = UDim2.new(0, 403, 0, 73)
                                u319.Visible = false
                                u318.Visible = false
                                _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                            end
                            function v296.Add(_, p334)
                                u298 = u298 + 1

                                if u298 ~= 1 then
                                    if u298 ~= 2 then
                                        if u298 < 3 or u298 > 4 then
                                            if u298 >= 10 then
                                                u299 = 200
                                            end
                                        else
                                            u299 = 87
                                        end
                                    else
                                        u299 = 58
                                    end
                                else
                                    u299 = 29
                                end

                                local _TextButton26 = Instance.new('TextButton')
                                local _UICorner43 = Instance.new('UICorner')
                                local _TextLabel35 = Instance.new('TextLabel')

                                _TextButton26.Name = 'Item'
                                _TextButton26.Parent = _ScrollingFrame4
                                _TextButton26.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextButton26.Size = UDim2.new(0, 379, 0, 29)
                                _TextButton26.AutoButtonColor = false
                                _TextButton26.Font = Enum.Font.SourceSans
                                _TextButton26.Text = ''
                                _TextButton26.TextColor3 = Color3.fromRGB(0, 0, 0)
                                _TextButton26.TextSize = 14
                                _TextButton26.BackgroundTransparency = 1
                                _UICorner43.CornerRadius = UDim.new(0, 4)
                                _UICorner43.Name = 'ItemCorner'
                                _UICorner43.Parent = _TextButton26
                                _TextLabel35.Name = 'ItemText'
                                _TextLabel35.Parent = _TextButton26
                                _TextLabel35.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextLabel35.BackgroundTransparency = 1
                                _TextLabel35.Position = UDim2.new(0.0211081803, 0, 0, 0)
                                _TextLabel35.Size = UDim2.new(0, 192, 0, 29)
                                _TextLabel35.Font = Enum.Font.Gotham
                                _TextLabel35.TextColor3 = Color3.fromRGB(212, 212, 212)
                                _TextLabel35.TextSize = 14
                                _TextLabel35.TextXAlignment = Enum.TextXAlignment.Left
                                _TextLabel35.Text = p334

                                _TextButton26.MouseButton1Click:Connect(function()
                                    if u295(u297, p334) then
                                        local v338 = next
                                        local v339 = u297
                                        local v340 = nil

                                        while true do
                                            local v341

                                            v340, v341 = v338(v339, v340)

                                            if v340 == nil then
                                                break
                                            end
                                            if v341 == p334 then
                                                table.remove(u297, v340)
                                            end
                                        end

                                        _TextLabel35.TextColor3 = Color3.fromRGB(212, 212, 212)
                                        _TextLabel32.Text = p285 .. ' : ' .. table.concat(u297, ',')
                                        u12[p285] = u297

                                        if u13.AutoSave then
                                            u8:SaveFile()
                                        end

                                        pcall(p288, u297)
                                    else
                                        table.insert(u297, p334)

                                        _TextLabel32.Text = p285 .. ' : ' .. table.concat(u297, ',')
                                        _TextLabel35.TextColor3 = Color3.fromRGB(255, 10, 5)
                                        u12[p285] = u297

                                        if u13.AutoSave then
                                            u8:SaveFile()
                                        end

                                        pcall(p288, u297)
                                    end
                                end)

                                _ScrollingFrame4.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout6.AbsoluteContentSize.Y)
                                _ScrollingFrame4.Size = UDim2.new(0, 385, 0, u299)
                                u319.Size = UDim2.new(0, 392, 0, u299 + 6)
                                u318.Size = UDim2.new(0, 396, 0, u299 + 10)
                            end

                            return v296
                        end,
                        Dropdown = function(_, p342, p343, p344, p345)
                            local v346 = {}
                            local u347 = 0
                            local u348 = 0
                            local u349 = false
                            local _Frame56 = Instance.new('Frame')
                            local _TextLabel36 = Instance.new('TextLabel')
                            local _Frame57 = Instance.new('Frame')
                            local _UICorner44 = Instance.new('UICorner')
                            local _Frame58 = Instance.new('Frame')
                            local _UICorner45 = Instance.new('UICorner')
                            local _TextLabel37 = Instance.new('TextLabel')
                            local _ImageLabel17 = Instance.new('ImageLabel')
                            local _TextButton27 = Instance.new('TextButton')

                            if u12[p342] == nil then
                                if u12[p342] == nil then
                                    u12[p342] = p344
                                end
                            else
                                p344 = u12[p342]

                                pcall(p345, p344)
                            end

                            _Frame56.Name = 'Dropdown'
                            _Frame56.Parent = _ScrollingFrame3
                            _Frame56.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame56.BackgroundTransparency = 1
                            _Frame56.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
                            _Frame56.Size = UDim2.new(0, 403, 0, 73)
                            _TextLabel36.Name = 'DropdownTitle'
                            _TextLabel36.Parent = _Frame56
                            _TextLabel36.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel36.BackgroundTransparency = 1
                            _TextLabel36.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel36.Size = UDim2.new(0, 200, 0, 29)
                            _TextLabel36.Font = Enum.Font.Gotham
                            _TextLabel36.Text = p342
                            _TextLabel36.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel36.TextSize = 14
                            _TextLabel36.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame57.Name = 'DropdownFrameOutline'
                            _Frame57.Parent = _TextLabel36
                            _Frame57.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame57.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                            _Frame57.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
                            _Frame57.Size = UDim2.new(0, 396, 0, 36)
                            _UICorner44.CornerRadius = UDim.new(0, 3)
                            _UICorner44.Name = 'DropdownFrameOutlineCorner'
                            _UICorner44.Parent = _Frame57
                            _Frame58.Name = 'DropdownFrame'
                            _Frame58.Parent = _TextLabel36
                            _Frame58.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _Frame58.ClipsDescendants = true
                            _Frame58.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
                            _Frame58.Selectable = true
                            _Frame58.Size = UDim2.new(0, 392, 0, 32)
                            _UICorner45.CornerRadius = UDim.new(0, 4)
                            _UICorner45.Name = 'DropdownFrameCorner'
                            _UICorner45.Parent = _Frame58
                            _TextLabel37.Name = 'CurrentSelectedText'
                            _TextLabel37.Parent = _Frame58
                            _TextLabel37.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel37.BackgroundTransparency = 1
                            _TextLabel37.Position = UDim2.new(0.0178571437, 0, 0, 0)
                            _TextLabel37.Size = UDim2.new(0, 193, 0, 32)
                            _TextLabel37.Font = Enum.Font.Gotham
                            _TextLabel37.Text = p342 .. ':' .. p344
                            _TextLabel37.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel37.TextSize = 14
                            _TextLabel37.TextXAlignment = Enum.TextXAlignment.Left
                            _ImageLabel17.Name = 'ArrowImg'
                            _ImageLabel17.Parent = _TextLabel37
                            _ImageLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel17.BackgroundTransparency = 1
                            _ImageLabel17.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
                            _ImageLabel17.Size = UDim2.new(0, 22, 0, 22)
                            _ImageLabel17.Image = 'http://www.roblox.com/asset/?id=6034818372'
                            _ImageLabel17.ImageColor3 = Color3.fromRGB(212, 212, 212)
                            _TextButton27.Name = 'DropdownFrameBtn'
                            _TextButton27.Parent = _Frame58
                            _TextButton27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton27.BackgroundTransparency = 1
                            _TextButton27.Size = UDim2.new(0, 392, 0, 32)
                            _TextButton27.Font = Enum.Font.SourceSans
                            _TextButton27.Text = ''
                            _TextButton27.TextColor3 = Color3.fromRGB(0, 0, 0)
                            _TextButton27.TextSize = 14

                            local _Frame59 = Instance.new('Frame')
                            local _UICorner46 = Instance.new('UICorner')
                            local _Frame60 = Instance.new('Frame')
                            local _UICorner47 = Instance.new('UICorner')
                            local _TextLabel38 = Instance.new('TextLabel')
                            local _ScrollingFrame5 = Instance.new('ScrollingFrame')
                            local _UIListLayout7 = Instance.new('UIListLayout')

                            _Frame59.Name = 'DropdownFrameMainOutline'
                            _Frame59.Parent = _TextLabel36
                            _Frame59.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                            _Frame59.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
                            _Frame59.Size = UDim2.new(0, 396, 0, 81)
                            _Frame59.Visible = false
                            _UICorner46.CornerRadius = UDim.new(0, 3)
                            _UICorner46.Name = 'DropdownFrameMainOutlineCorner'
                            _UICorner46.Parent = _Frame59
                            _Frame60.Name = 'DropdownFrameMain'
                            _Frame60.Parent = _TextLabel36
                            _Frame60.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _Frame60.ClipsDescendants = true
                            _Frame60.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
                            _Frame60.Selectable = true
                            _Frame60.Size = UDim2.new(0, 392, 0, 77)
                            _Frame60.Visible = false
                            _UICorner47.CornerRadius = UDim.new(0, 4)
                            _UICorner47.Name = 'DropdownFrameMainCorner'
                            _UICorner47.Parent = _Frame60
                            _TextLabel38.Name = 'ItemHolderLabel'
                            _TextLabel38.Parent = _Frame60
                            _TextLabel38.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel38.BackgroundTransparency = 1
                            _TextLabel38.Position = UDim2.new(0.0178571437, 0, 0, 0)
                            _TextLabel38.Size = UDim2.new(0, 193, 0, 13)
                            _TextLabel38.Font = Enum.Font.Gotham
                            _TextLabel38.Text = ''
                            _TextLabel38.TextColor3 = Color3.fromRGB(212, 212, 212)
                            _TextLabel38.TextSize = 14
                            _TextLabel38.TextXAlignment = Enum.TextXAlignment.Left
                            _ScrollingFrame5.Name = 'ItemHolder'
                            _ScrollingFrame5.Parent = _TextLabel38
                            _ScrollingFrame5.Active = true
                            _ScrollingFrame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ScrollingFrame5.BackgroundTransparency = 1
                            _ScrollingFrame5.Position = UDim2.new(0, 0, 0.215384638, 0)
                            _ScrollingFrame5.Size = UDim2.new(0, 385, 0, 0)
                            _ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, 0)
                            _ScrollingFrame5.ScrollBarThickness = 4
                            _ScrollingFrame5.BorderSizePixel = 0
                            _ScrollingFrame5.ScrollBarImageColor3 = Color3.fromRGB(231, 23, 55)
                            _UIListLayout7.Name = 'ItemHolderLayout'
                            _UIListLayout7.Parent = _ScrollingFrame5
                            _UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout7.Padding = UDim.new(0, 0)

                            _TextButton27.MouseButton1Click:Connect(function()
                                if u349 ~= false then
                                    _Frame56.Size = UDim2.new(0, 403, 0, 73)
                                    _Frame60.Visible = false
                                    _Frame59.Visible = false
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                else
                                    _Frame60.Visible = true
                                    _Frame59.Visible = true
                                    _Frame56.Size = UDim2.new(0, 403, 0, 73 + _Frame59.AbsoluteSize.Y)
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                end

                                u349 = not u349
                            end)

                            local v366 = next
                            local u367 = _Frame59
                            local u368 = _Frame60
                            local v369 = nil

                            while true do
                                local u370

                                v369, u370 = v366(p343, v369)

                                if v369 == nil then
                                    break
                                end

                                u347 = u347 + 1
                                u348 = u347 == 1 and 29 or (u347 == 2 and 58 or (3 <= u347 and u347 <= 9 and 87 or (u347 >= 10 and 200 or u348)))

                                local _TextButton28 = Instance.new('TextButton')
                                local _UICorner48 = Instance.new('UICorner')
                                local _TextLabel39 = Instance.new('TextLabel')

                                _TextButton28.Name = 'Item'
                                _TextButton28.Parent = _ScrollingFrame5
                                _TextButton28.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                                _TextButton28.Size = UDim2.new(0, 379, 0, 29)
                                _TextButton28.AutoButtonColor = false
                                _TextButton28.Font = Enum.Font.SourceSans
                                _TextButton28.Text = ''
                                _TextButton28.TextColor3 = Color3.fromRGB(0, 0, 0)
                                _TextButton28.TextSize = 14
                                _TextButton28.BackgroundTransparency = 1
                                _UICorner48.CornerRadius = UDim.new(0, 4)
                                _UICorner48.Name = 'ItemCorner'
                                _UICorner48.Parent = _TextButton28
                                _TextLabel39.Name = 'ItemText'
                                _TextLabel39.Parent = _TextButton28
                                _TextLabel39.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextLabel39.BackgroundTransparency = 1
                                _TextLabel39.Position = UDim2.new(0.0211081803, 0, 0, 0)
                                _TextLabel39.Size = UDim2.new(0, 192, 0, 29)
                                _TextLabel39.Font = Enum.Font.Gotham
                                _TextLabel39.TextColor3 = Color3.fromRGB(212, 212, 212)
                                _TextLabel39.TextSize = 14
                                _TextLabel39.TextXAlignment = Enum.TextXAlignment.Left
                                _TextLabel39.Text = u370

                                _TextButton28.MouseEnter:Connect(function()
                                    _TextLabel39.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    _TextButton28.BackgroundTransparency = 0
                                end)
                                _TextButton28.MouseLeave:Connect(function()
                                    _TextLabel39.TextColor3 = Color3.fromRGB(212, 212, 212)
                                    _TextButton28.BackgroundTransparency = 1
                                end)
                                _TextButton28.MouseButton1Click:Connect(function()
                                    _TextLabel37.Text = p342 .. ' : ' .. u370
                                    u12[p342] = u370

                                    if u13.AutoSave then
                                        u8:SaveFile()
                                    end

                                    pcall(p345, u370)

                                    _Frame56.Size = UDim2.new(0, 403, 0, 73)
                                    u368.Visible = false
                                    u367.Visible = false
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                    u349 = not u349
                                end)

                                _ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout7.AbsoluteContentSize.Y)
                                _ScrollingFrame5.Size = UDim2.new(0, 385, 0, u348)
                                u368.Size = UDim2.new(0, 392, 0, u348 + 6)
                                u367.Size = UDim2.new(0, 396, 0, u348 + 10)
                            end

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)

                            function v346.Clear(_)
                                local v374 = next
                                local v375, v376 = _ScrollingFrame5:GetChildren()

                                while true do
                                    local v377

                                    v376, v377 = v374(v375, v376)

                                    if v376 == nil then
                                        break
                                    end
                                    if v377.Name == 'Item' then
                                        v377:Destroy()
                                    end
                                end

                                _TextLabel37.Text = '...'
                                u347 = 0
                                u348 = 0
                                _ScrollingFrame5.Size = UDim2.new(0, 385, 0, 0)
                                u368.Size = UDim2.new(0, 392, 0, 0)
                                u367.Size = UDim2.new(0, 396, 0, 0)
                                _Frame56.Size = UDim2.new(0, 403, 0, 73)
                                u368.Visible = false
                                u367.Visible = false
                                _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                            end
                            function v346.Add(_, p378)
                                u347 = u347 + 1

                                if u347 ~= 1 then
                                    if u347 ~= 2 then
                                        if u347 < 3 or u347 > 4 then
                                            if u347 >= 10 then
                                                u348 = 200
                                            end
                                        else
                                            u348 = 87
                                        end
                                    else
                                        u348 = 58
                                    end
                                else
                                    u348 = 29
                                end

                                local _TextButton29 = Instance.new('TextButton')
                                local _UICorner49 = Instance.new('UICorner')
                                local _TextLabel40 = Instance.new('TextLabel')

                                _TextButton29.Name = 'Item'
                                _TextButton29.Parent = _ScrollingFrame5
                                _TextButton29.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextButton29.Size = UDim2.new(0, 379, 0, 29)
                                _TextButton29.AutoButtonColor = false
                                _TextButton29.Font = Enum.Font.SourceSans
                                _TextButton29.Text = ''
                                _TextButton29.TextColor3 = Color3.fromRGB(0, 0, 0)
                                _TextButton29.TextSize = 14
                                _TextButton29.BackgroundTransparency = 1
                                _UICorner49.CornerRadius = UDim.new(0, 4)
                                _UICorner49.Name = 'ItemCorner'
                                _UICorner49.Parent = _TextButton29
                                _TextLabel40.Name = 'ItemText'
                                _TextLabel40.Parent = _TextButton29
                                _TextLabel40.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
                                _TextLabel40.BackgroundTransparency = 1
                                _TextLabel40.Position = UDim2.new(0.0211081803, 0, 0, 0)
                                _TextLabel40.Size = UDim2.new(0, 192, 0, 29)
                                _TextLabel40.Font = Enum.Font.Gotham
                                _TextLabel40.TextColor3 = Color3.fromRGB(212, 212, 212)
                                _TextLabel40.TextSize = 14
                                _TextLabel40.TextXAlignment = Enum.TextXAlignment.Left
                                _TextLabel40.Text = p378

                                _TextButton29.MouseEnter:Connect(function()
                                    _TextLabel40.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    _TextButton29.BackgroundTransparency = 0
                                end)
                                _TextButton29.MouseLeave:Connect(function()
                                    _TextLabel40.TextColor3 = Color3.fromRGB(212, 212, 212)
                                    _TextButton29.BackgroundTransparency = 1
                                end)
                                _TextButton29.MouseButton1Click:Connect(function()
                                    _TextLabel37.Text = p342 .. ' : ' .. p378
                                    u12[p342] = p378

                                    if u13.AutoSave then
                                        u8:SaveFile()
                                    end

                                    pcall(p345, p378)

                                    _Frame56.Size = UDim2.new(0, 403, 0, 73)
                                    u368.Visible = false
                                    u367.Visible = false
                                    _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                                    u349 = not u349
                                end)

                                _ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout7.AbsoluteContentSize.Y)
                                _ScrollingFrame5.Size = UDim2.new(0, 385, 0, u348)
                                u368.Size = UDim2.new(0, 392, 0, u348 + 6)
                                u367.Size = UDim2.new(0, 396, 0, u348 + 10)
                            end

                            return v346
                        end,
                        Colorpicker = function(_, _, p382, p383)
                            Color3.fromRGB(0, 0, 0)
                            Color3.fromRGB(0, 0, 0)

                            local u384 = 1
                            local u385 = 1
                            local u386 = 1
                            local u387 = nil
                            local u388 = nil
                            local _Frame61 = Instance.new('Frame')
                            local _TextLabel41 = Instance.new('TextLabel')
                            local _Frame62 = Instance.new('Frame')
                            local _UICorner50 = Instance.new('UICorner')
                            local _Frame63 = Instance.new('Frame')
                            local _UICorner51 = Instance.new('UICorner')
                            local _ImageLabel18 = Instance.new('ImageLabel')
                            local _UICorner52 = Instance.new('UICorner')
                            local _ImageLabel19 = Instance.new('ImageLabel')
                            local _ImageLabel20 = Instance.new('ImageLabel')
                            local _UICorner53 = Instance.new('UICorner')
                            local _UIGradient = Instance.new('UIGradient')
                            local _ImageLabel21 = Instance.new('ImageLabel')
                            local _Frame64 = Instance.new('Frame')
                            local _UICorner54 = Instance.new('UICorner')

                            _Frame61.Name = 'Colorpicker'
                            _Frame61.Parent = _ScrollingFrame3
                            _Frame61.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame61.BackgroundTransparency = 1
                            _Frame61.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
                            _Frame61.Size = UDim2.new(0, 403, 0, 175)
                            _TextLabel41.Name = 'ColorpickerTitle'
                            _TextLabel41.Parent = _Frame61
                            _TextLabel41.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel41.BackgroundTransparency = 1
                            _TextLabel41.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel41.Size = UDim2.new(0, 200, 0, 29)
                            _TextLabel41.Font = Enum.Font.Gotham
                            _TextLabel41.Text = 'Colorpicker'
                            _TextLabel41.TextColor3 = Color3.fromRGB(127, 131, 137)
                            _TextLabel41.TextSize = 14
                            _TextLabel41.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame62.Name = 'ColorpickerFrameOutline'
                            _Frame62.Parent = _TextLabel41
                            _Frame62.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
                            _Frame62.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
                            _Frame62.Size = UDim2.new(0, 238, 0, 139)
                            _UICorner50.CornerRadius = UDim.new(0, 3)
                            _UICorner50.Name = 'ColorpickerFrameOutlineCorner'
                            _UICorner50.Parent = _Frame62
                            _Frame63.Name = 'ColorpickerFrame'
                            _Frame63.Parent = _TextLabel41
                            _Frame63.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                            _Frame63.ClipsDescendants = true
                            _Frame63.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
                            _Frame63.Selectable = true
                            _Frame63.Size = UDim2.new(0, 234, 0, 135)
                            _UICorner51.CornerRadius = UDim.new(0, 3)
                            _UICorner51.Name = 'ColorpickerFrameCorner'
                            _UICorner51.Parent = _Frame63
                            _ImageLabel18.Name = 'Color'
                            _ImageLabel18.Parent = _Frame63
                            _ImageLabel18.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                            _ImageLabel18.Position = UDim2.new(0, 10, 0, 10)
                            _ImageLabel18.Size = UDim2.new(0, 154, 0, 118)
                            _ImageLabel18.ZIndex = 10
                            _ImageLabel18.Image = 'rbxassetid://4155801252'
                            _UICorner52.CornerRadius = UDim.new(0, 3)
                            _UICorner52.Name = 'ColorCorner'
                            _UICorner52.Parent = _ImageLabel18
                            _ImageLabel19.Name = 'ColorSelection'
                            _ImageLabel19.Parent = _ImageLabel18
                            _ImageLabel19.AnchorPoint = Vector2.new(0.5, 0.5)
                            _ImageLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel19.BackgroundTransparency = 1

                            local _new = UDim2.new
                            local v405

                            if p382 then
                                v405 = select(3, Color3.toHSV(p382))
                            else
                                v405 = p382
                            end

                            _ImageLabel19.Position = _new(v405)
                            _ImageLabel19.Size = UDim2.new(0, 18, 0, 18)
                            _ImageLabel19.Image = 'http://www.roblox.com/asset/?id=4805639000'
                            _ImageLabel19.ScaleType = Enum.ScaleType.Fit
                            _ImageLabel20.Name = 'Hue'
                            _ImageLabel20.Parent = _Frame63
                            _ImageLabel20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel20.Position = UDim2.new(0, 171, 0, 10)
                            _ImageLabel20.Size = UDim2.new(0, 18, 0, 118)
                            _UICorner53.CornerRadius = UDim.new(0, 3)
                            _UICorner53.Name = 'HueCorner'
                            _UICorner53.Parent = _ImageLabel20
                            _UIGradient.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)),
                                ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)),
                                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)),
                                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
                                ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)),
                                ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4)),
                            })
                            _UIGradient.Rotation = 270
                            _UIGradient.Name = 'HueGradient'
                            _UIGradient.Parent = _ImageLabel20
                            _ImageLabel21.Name = 'HueSelection'
                            _ImageLabel21.Parent = _ImageLabel20
                            _ImageLabel21.AnchorPoint = Vector2.new(0.5, 0.5)
                            _ImageLabel21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _ImageLabel21.BackgroundTransparency = 1
                            _ImageLabel21.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(p382)))
                            _ImageLabel21.Size = UDim2.new(0, 18, 0, 18)
                            _ImageLabel21.Image = 'http://www.roblox.com/asset/?id=4805639000'
                            _Frame64.Name = 'PresetClr'
                            _Frame64.Parent = _Frame63
                            _Frame64.BackgroundColor3 = p382
                            _Frame64.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
                            _Frame64.Size = UDim2.new(0, 25, 0, 25)
                            _UICorner54.CornerRadius = UDim.new(0, 3)
                            _UICorner54.Name = 'PresetClrCorner'
                            _UICorner54.Parent = _Frame64

                            local function u406(_)
                                _Frame64.BackgroundColor3 = Color3.fromHSV(u384, u385, u386)
                                _ImageLabel18.BackgroundColor3 = Color3.fromHSV(u384, 1, 1)

                                pcall(p383, _Frame64.BackgroundColor3)
                            end

                            local u407 = 1 - math.clamp(_ImageLabel21.AbsolutePosition.Y - _ImageLabel20.AbsolutePosition.Y, 0, _ImageLabel20.AbsoluteSize.Y) / _ImageLabel20.AbsoluteSize.Y
                            local u408 = math.clamp(_ImageLabel19.AbsolutePosition.X - _ImageLabel18.AbsolutePosition.X, 0, _ImageLabel18.AbsoluteSize.X) / _ImageLabel18.AbsoluteSize.X
                            local u409 = 1 - math.clamp(_ImageLabel19.AbsolutePosition.Y - _ImageLabel18.AbsolutePosition.Y, 0, _ImageLabel18.AbsoluteSize.Y) / _ImageLabel18.AbsoluteSize.Y

                            _Frame64.BackgroundColor3 = p382
                            _ImageLabel18.BackgroundColor3 = p382

                            pcall(p383, _Frame64.BackgroundColor3)
                            _ImageLabel18.InputBegan:Connect(function(p410)
                                if p410.UserInputType == Enum.UserInputType.MouseButton1 then
                                    if u387 then
                                        u387:Disconnect()
                                    end

                                    u387 = _RunService.RenderStepped:Connect(function()
                                        local v411 = math.clamp(u5.X - _ImageLabel18.AbsolutePosition.X, 0, _ImageLabel18.AbsoluteSize.X) / _ImageLabel18.AbsoluteSize.X
                                        local v412 = math.clamp(u5.Y - _ImageLabel18.AbsolutePosition.Y, 0, _ImageLabel18.AbsoluteSize.Y) / _ImageLabel18.AbsoluteSize.Y

                                        _ImageLabel19.Position = UDim2.new(v411, 0, v412, 0)
                                        u408 = v411
                                        u409 = 1 - v412

                                        u406(true)
                                    end)
                                end
                            end)
                            _ImageLabel18.InputEnded:Connect(function(p413)
                                if p413.UserInputType == Enum.UserInputType.MouseButton1 and u387 then
                                    u387:Disconnect()
                                end
                            end)
                            _ImageLabel20.InputBegan:Connect(function(p414)
                                if p414.UserInputType == Enum.UserInputType.MouseButton1 then
                                    if u388 then
                                        u388:Disconnect()
                                    end

                                    u388 = _RunService.RenderStepped:Connect(function()
                                        local v415 = math.clamp(u5.Y - _ImageLabel20.AbsolutePosition.Y, 0, _ImageLabel20.AbsoluteSize.Y) / _ImageLabel20.AbsoluteSize.Y

                                        _ImageLabel21.Position = UDim2.new(0.48, 0, v415, 0)
                                        u407 = 1 - v415

                                        u406(true)
                                    end)
                                end
                            end)
                            _ImageLabel20.InputEnded:Connect(function(p416)
                                if p416.UserInputType == Enum.UserInputType.MouseButton1 and u388 then
                                    u388:Disconnect()
                                end
                            end)

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                        Textbox = function(_, p417, p418, p419, p420)
                            local _Frame65 = Instance.new('Frame')
                            local _TextLabel42 = Instance.new('TextLabel')
                            local _Frame66 = Instance.new('Frame')
                            local _UICorner55 = Instance.new('UICorner')
                            local _Frame67 = Instance.new('Frame')
                            local _UICorner56 = Instance.new('UICorner')
                            local _TextBox4 = Instance.new('TextBox')

                            _Frame65.Name = 'Textbox'
                            _Frame65.Parent = _ScrollingFrame3
                            _Frame65.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _Frame65.BackgroundTransparency = 1
                            _Frame65.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
                            _Frame65.Size = UDim2.new(0, 403, 0, 73)
                            _TextLabel42.Name = 'TextboxTitle'
                            _TextLabel42.Parent = _Frame65
                            _TextLabel42.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel42.BackgroundTransparency = 1
                            _TextLabel42.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel42.Size = UDim2.new(0, 200, 0, 29)
                            _TextLabel42.Font = Enum.Font.Gotham
                            _TextLabel42.Text = p417
                            _TextLabel42.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel42.TextSize = 14
                            _TextLabel42.TextXAlignment = Enum.TextXAlignment.Left
                            _Frame66.Name = 'TextboxFrameOutline'
                            _Frame66.Parent = _TextLabel42
                            _Frame66.AnchorPoint = Vector2.new(0.5, 0.5)
                            _Frame66.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                            _Frame66.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
                            _Frame66.Size = UDim2.new(0, 396, 0, 36)
                            _UICorner55.CornerRadius = UDim.new(0, 3)
                            _UICorner55.Name = 'TextboxFrameOutlineCorner'
                            _UICorner55.Parent = _Frame66
                            _Frame67.Name = 'TextboxFrame'
                            _Frame67.Parent = _TextLabel42
                            _Frame67.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _Frame67.ClipsDescendants = true
                            _Frame67.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
                            _Frame67.Selectable = true
                            _Frame67.Size = UDim2.new(0, 392, 0, 32)
                            _UICorner56.CornerRadius = UDim.new(0, 4)
                            _UICorner56.Name = 'TextboxFrameCorner'
                            _UICorner56.Parent = _Frame67
                            _TextBox4.Parent = _Frame67
                            _TextBox4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox4.BackgroundTransparency = 1
                            _TextBox4.Position = UDim2.new(0.0178571437, 0, 0, 0)
                            _TextBox4.Size = UDim2.new(0, 377, 0, 32)
                            _TextBox4.Font = Enum.Font.Gotham
                            _TextBox4.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                            _TextBox4.PlaceholderText = p418
                            _TextBox4.Text = ''
                            _TextBox4.TextColor3 = Color3.fromRGB(193, 195, 197)
                            _TextBox4.TextSize = 14
                            _TextBox4.TextXAlignment = Enum.TextXAlignment.Left

                            if u12[p417] == nil then
                                if u12[p417] == nil then
                                    u12[p417] = ''
                                end
                            else
                                _TextBox4.Text = u12[p417]

                                pcall(p420, _TextBox4.Text)
                            end

                            _TextBox4.Focused:Connect(function()
                                _TweenService:Create(_Frame66, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = Color3.fromRGB(255, 170, 0),
                                }):Play()
                            end)
                            _TextBox4.FocusLost:Connect(function(p428)
                                _TweenService:Create(_Frame66, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                                }):Play()

                                if p428 and #_TextBox4.Text > 0 then
                                    pcall(p420, _TextBox4.Text)

                                    u12[p417] = _TextBox4.Text

                                    if u13.AutoSave then
                                        u8:SaveFile()
                                    end
                                    if p419 then
                                        _TextBox4.Text = ''
                                    end
                                end
                            end)

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                        Label = function(_, p429, p430)
                            local _TextButton30 = Instance.new('TextButton')
                            local _TextLabel43 = Instance.new('TextLabel')
                            local v433 = {}

                            _TextButton30.Name = 'Label'
                            _TextButton30.Parent = _ScrollingFrame3
                            _TextButton30.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            _TextButton30.BorderSizePixel = 0
                            _TextButton30.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
                            _TextButton30.Size = UDim2.new(0, 401, 0, 30)
                            _TextButton30.AutoButtonColor = false
                            _TextButton30.Font = Enum.Font.Gotham
                            _TextButton30.Text = ''
                            _TextButton30.TextColor3 = p430 or color3.fromRGB(255, 255, 255)
                            _TextButton30.TextSize = 14
                            _TextLabel43.Name = 'LabelTitle'
                            _TextLabel43.Parent = _TextButton30
                            _TextLabel43.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel43.BackgroundTransparency = 1
                            _TextLabel43.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel43.Size = UDim2.new(0, 200, 0, 30)
                            _TextLabel43.Font = Enum.Font.Gotham
                            _TextLabel43.Text = p429
                            _TextLabel43.TextColor3 = p430
                            _TextLabel43.TextSize = 14
                            _TextLabel43.TextXAlignment = Enum.TextXAlignment.Left
                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)

                            function v433.Refresh(_, p434)
                                _TextButton30.Text = p434
                            end

                            return v433
                        end,
                        Bind = function(_, p435, p436, p437)
                            local _Name = p436.Name
                            local _TextButton31 = Instance.new('TextButton')
                            local _TextLabel44 = Instance.new('TextLabel')
                            local _TextLabel45 = Instance.new('TextLabel')

                            _TextButton31.Name = 'Keybind'
                            _TextButton31.Parent = _ScrollingFrame3
                            _TextButton31.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
                            _TextButton31.BorderSizePixel = 0
                            _TextButton31.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
                            _TextButton31.Size = UDim2.new(0, 401, 0, 30)
                            _TextButton31.AutoButtonColor = false
                            _TextButton31.Font = Enum.Font.Gotham
                            _TextButton31.Text = ''
                            _TextButton31.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton31.TextSize = 14
                            _TextLabel44.Name = 'KeybindTitle'
                            _TextLabel44.Parent = _TextButton31
                            _TextLabel44.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel44.BackgroundTransparency = 1
                            _TextLabel44.Position = UDim2.new(0, 5, 0, 0)
                            _TextLabel44.Size = UDim2.new(0, 200, 0, 30)
                            _TextLabel44.Font = Enum.Font.Gotham
                            _TextLabel44.Text = p435
                            _TextLabel44.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel44.TextSize = 14
                            _TextLabel44.TextXAlignment = Enum.TextXAlignment.Left
                            _TextLabel45.Name = 'KeybindText'
                            _TextLabel45.Parent = _TextButton31
                            _TextLabel45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel45.BackgroundTransparency = 1
                            _TextLabel45.Position = UDim2.new(0, 316, 0, 0)
                            _TextLabel45.Size = UDim2.new(0, 85, 0, 30)
                            _TextLabel45.Font = Enum.Font.Gotham
                            _TextLabel45.Text = p436.Name
                            _TextLabel45.TextColor3 = Color3.fromRGB(255, 255, 255)
                            _TextLabel45.TextSize = 14
                            _TextLabel45.TextXAlignment = Enum.TextXAlignment.Right

                            _TextButton31.MouseButton1Click:Connect(function()
                                _TextLabel45.Text = '...'

                                local v442 = game:GetService('UserInputService').InputBegan:wait()

                                if v442.KeyCode.Name ~= 'Unknown' then
                                    _TextLabel45.Text = v442.KeyCode.Name
                                    _Name = v442.KeyCode.Name
                                end
                            end)
                            game:GetService('UserInputService').InputBegan:connect(function(p443, p444)
                                if not p444 and p443.KeyCode.Name == _Name then
                                    pcall(p437)
                                end
                            end)

                            _ScrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout5.AbsoluteContentSize.Y)
                        end,
                    }
                end,
            }
        end,
    }
end

local v445 = u8

u8.Create(v445)

local v446 = u8

u8.Loadfile(v446)

_G.KeySuccess = true

warn('Anti AFK : Work')
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end);
(function(p491, p492)
    game.StarterGui:SetCore('ChatMakeSystemMessage', {
        Text = p491,
        Color = p492,
    })
end)('Have Fun :))', Color3.new(0, 62, 255))

local _HAZEPIECE = u1:Window('Press L For Close UI / Hyper Hub Script Ver 12.11.24'):Server('HAZE PIECE', '')
local _Main2 = _HAZEPIECE:Channel('Main', '')
local _Main22 = _HAZEPIECE:Channel('Main 2', '')
local _Skill = _HAZEPIECE:Channel('Skill', '')
local _Teleport = _HAZEPIECE:Channel('Teleport', '')
local _Stats = _HAZEPIECE:Channel('Stats', '')
local _BuyItem = _HAZEPIECE:Channel('Buy Item', '')
local _Misc = _HAZEPIECE:Channel('Misc', '')
local _ReplicatedStorage = game:GetService('ReplicatedStorage')
local _Workspace = game:GetService('Workspace')
local _ = game.Players.LocalPlayer.PlayerData.Experience.Sword.Value
local _ = game.Players.LocalPlayer.PlayerData.Experience.Combat.Value
local _ = game.Players.LocalPlayer.PlayerData.Experience.Fruit.Value
local _ClientEvents = game:GetService('ReplicatedStorage'):WaitForChild('Replication'):WaitForChild('ClientEvents')
local v504 = {}
local v505 = {}
local v506 = {}
local v507 = {}
local v508 = {
    'Auto Detected Level',
    'Auto Detected Level(No Boss)',
}
local u509 = ''
local u510 = ''
local u511 = ''
local u512 = ''
local u513 = ''
local u514 = ''
local u515 = ''
local u516 = ''
local u517 = ''
local u518 = ''
local u519 = ''
local u520 = ''
local u521 = ''
local _Value = game.Players.LocalPlayer.PlayerData.SeaIndex.Value
local _Value2 = game.Players.LocalPlayer.Character.Location.Value
local u524 = false
local u525 = false
local v526 = {}
local u527 = ''
local u528 = ''
local u529 = ''

Number = math.random(1, 1000000)

local v530 = {
    'WhiteBeard Girl So Cute',
    'Mace Boss Boy So Cool',
}
local v531 = {
    'Dual Swordsman',
}

if DistanceAutoFarm == nil then
    DistanceAutoFarm = 6
end
if setweapon == nil then
    setweapon = 'Melee'
end
if typefarm == nil then
    typefarm = 'Above'
end
if selectedquest == nil then
    selectedquest = 'Auto Detected Level'
end

function att()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end
function getquest(p532)
    local v533, v534, v535 = pairs(_Workspace.Npc_Workspace.QuestGivers:GetChildren())

    while true do
        local v536

        v535, v536 = v533(v534, v535)

        if v535 == nil then
            break
        end

        local v537, v538, v539 = pairs(v536.Configuration.Quests:GetChildren())

        while true do
            local v540

            v539, v540 = v537(v538, v539)

            if v539 == nil then
                break
            end
            if v540.Name == p532 then
                local v541 = {
                    workspace.Npc_Workspace.QuestGivers:FindFirstChild(v536.Name),
                    v540.Name,
                }

                game:GetService('Players').LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(v541))
            end
        end
    end
end
function toTarget(p542)
    if game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health > 0 then
        if (game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p542.Position).Magnitude <= 150 then
            pcall(function()
                tween:Cancel()

                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = p542
            end)
        end

        local _TweenService3 = game:service('TweenService')
        local v544 = TweenInfo.new((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - p542.Position).Magnitude / 325, Enum.EasingStyle.Linear)

        tween = _TweenService3:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v544, {CFrame = p542})

        tween:Play()

        return {
            Stop = function(_)
                tween:Cancel()
            end,
        }
    end

    tween:Cancel()
    wait(7)
end
function TP(p545)
    Distance = (p545.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if Distance > 30 then
        if Distance >= 250 then
            if Distance >= 500 then
                if Distance >= 1000 then
                    if Distance >= 1000 then
                        Speed = 200
                    end
                else
                    Speed = 250
                end
            else
                Speed = 400
            end
        else
            Speed = 600
        end

        game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {CFrame = p545}):Play()
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p545
    end
end
function TPCF(p546)
    Distance = (p546.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

    if Distance >= 250 then
        if Distance >= 500 then
            if Distance >= 1000 then
                if Distance >= 1000 then
                    Speed = 200
                end
            else
                Speed = 250
            end
        else
            Speed = 400
        end
    else
        Speed = 600
    end

    game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {CFrame = p546}):Play()

    _G.ugotmail = true

    wait(Distance / Speed)

    _G.ugotmail = false
end
function EquipWeapon(p547)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(p547) then
        local v548 = game.Players.LocalPlayer.Backpack:FindFirstChild(p547)

        wait(0.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v548)
    end
end
function getweapon()
    local _Value3 = game.Players.LocalPlayer.PlayerData.Sword.CurrentSword.Value
    local _Value4 = game.Players.LocalPlayer.PlayerData.FightingStyle.Value
    local _Value5 = game.Players.LocalPlayer.PlayerData.CurrentSuperPower.Value

    if setweapon ~= 'Melee' then
        if setweapon ~= 'Sword' then
            if setweapon == 'Fruit' then
                EquipWeapon(_Value5)
            end
        else
            EquipWeapon(_Value3)
        end
    else
        EquipWeapon(_Value4)
    end
end
function rejoingame()
    local _TeleportService = game:GetService('TeleportService')
    local _LocalPlayer = game:GetService('Players').LocalPlayer

    _TeleportService:Teleport(game.PlaceId, _LocalPlayer)
end
function fps()
    local v554 = game
    local _Workspace2 = v554.Workspace
    local _Lighting = v554.Lighting
    local _Terrain = _Workspace2.Terrain

    _Terrain.WaterWaveSize = 0
    _Terrain.WaterWaveSpeed = 0
    _Terrain.WaterReflectance = 0
    _Terrain.WaterTransparency = 0
    _Lighting.GlobalShadows = false
    _Lighting.FogEnd = 9000000000
    _Lighting.Brightness = 0
    settings().Rendering.QualityLevel = 'Level01'

    local v558, v559, v560 = pairs(v554:GetDescendants())
    local v561 = true

    while true do
        local v562

        v560, v562 = v558(v559, v560)

        if v560 == nil then
            break
        end
        if v562:IsA('Part') or (v562:IsA('Union') or (v562:IsA('CornerWedgePart') or v562:IsA('TrussPart'))) then
            v562.Material = 'Plastic'
            v562.Reflectance = 0
        elseif v562:IsA('Decal') or v562:IsA('Texture') and v561 then
            v562.Transparency = 1
        elseif v562:IsA('ParticleEmitter') or v562:IsA('Trail') then
            v562.Lifetime = NumberRange.new(0)
        elseif v562:IsA('Explosion') then
            v562.BlastPressure = 1
            v562.BlastRadius = 1
        elseif v562:IsA('Fire') or (v562:IsA('SpotLight') or (v562:IsA('Smoke') or v562:IsA('Sparkles'))) then
            v562.Enabled = false
        elseif v562:IsA('MeshPart') then
            v562.Material = 'Plastic'
            v562.Reflectance = 0
            v562.TextureID = 1.0385902758728955e16
        end
    end

    local v563, v564, v565 = pairs(_Lighting:GetChildren())

    while true do
        local v566

        v565, v566 = v563(v564, v565)

        if v565 == nil then
            break
        end
        if v566:IsA('BlurEffect') or (v566:IsA('SunRaysEffect') or (v566:IsA('ColorCorrectionEffect') or (v566:IsA('BloomEffect') or v566:IsA('DepthOfFieldEffect')))) then
            v566.Enabled = false
        end
    end
end
function hopkl()
    repeat
        wait()
    until game:IsLoaded() and game.Players.LocalPlayer

    local _HttpService2 = game:GetService('HttpService')
    local _TeleportService2 = game:GetService('TeleportService')
    local v569 = _HttpService2
    local u570 = _HttpService2.JSONDecode(v569, game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))

    function joinNew()
        if not isfile('servers.sss') then
            local v571 = _HttpService2

            writefile('servers.sss', v571:JSONEncode({}))
        end

        local v572 = _HttpService2:JSONDecode((readfile('servers.sss')))
        local v573 = next
        local _data = u570.data
        local v575 = nil

        while true do
            local v576

            v575, v576 = v573(_data, v575)

            if v575 == nil then
                break
            end
            if v576 ~= game.JobId then
                local v577, v578, v579 = pairs(v572)
                local v580 = true

                while true do
                    local v581

                    v579, v581 = v577(v578, v579)

                    if v579 == nil then
                        break
                    end
                    if v581 == v576.id then
                        v580 = false
                    end
                end

                if v580 then
                    table.insert(v572, v576.id)

                    local v582 = _HttpService2

                    writefile('servers.sss', v582:JSONEncode(v572))
                    wait()

                    return v576.id
                end
            end
        end
    end

    local v583 = joinNew()

    if v583 then
        _TeleportService2:TeleportToPlaceInstance(game.PlaceId, v583)
    else
        local v584 = _HttpService2

        writefile('servers.sss', _HttpService2.JSONEncode(v584, {}))

        local v585 = joinNew()

        _TeleportService2:TeleportToPlaceInstance(game.PlaceId, v585)
    end
end
function HopLowerServer()
    local _huge = math.huge
    local u587 = 'https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'
    local u588 = nil
    local u589 = nil

    if not _G.FailedServerID then
        _G.FailedServerID = {}
    end

    local function u594()
        u589 = game:GetService('HttpService'):JSONDecode(game:HttpGetAsync(u587))

        local v590, v591, v592 = pairs(u589.data)

        while true do
            local u593

            v592, u593 = v590(v591, v592)

            if v592 == nil then
                break
            end

            pcall(function()
                if type(u593) == 'table' and (u593.id and (u593.playing and (tonumber(_huge) > tonumber(u593.playing) and not table.find(_G.FailedServerID, u593.id)))) then
                    _huge = u593.playing
                    u588 = u593.id
                end
            end)
        end
    end

    function getservers()
        pcall(u594)

        local v595, v596, v597 = pairs(u589)

        while true do
            local v598

            v597, v598 = v595(v596, v597)

            if v597 == nil then
                break
            end
            if v597 == 'nextPageCursor' then
                if u587:find('&cursor=') then
                    u587 = u587:gsub(u587:sub((u587:find('&cursor='))), '')
                end

                u587 = u587 .. '&cursor=' .. v598

                pcall(getservers)
            end
        end
    end

    pcall(getservers)

    if u588 ~= game.JobId then
        local _ = _huge ~= #game:GetService('Players'):GetChildren() - 1
    end

    table.insert(_G.FailedServerID, u588)
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, u588)
end
function setspawn(p599)
    game:GetService('ReplicatedStorage').Replication.ClientEvents.SetSpawnPoint:FireServer(p599)
end

local v600, v601, v602 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

while true do
    local v603

    v602, v603 = v600(v601, v602)

    if v602 == nil then
        break
    end
    if v603:IsA('Tool') then
        table.insert(v505, v603.Name)
    end
end

local v604, v605, v606 = pairs(game.Players.LocalPlayer.Character:GetChildren())

while true do
    local v607

    v606, v607 = v604(v605, v606)

    if v606 == nil then
        break
    end
    if v607:IsA('Tool') then
        table.insert(v505, v607.Name)
    end
end

local v608, v609, v610 = pairs(_Workspace.Npc_Workspace.QuestGivers:GetChildren())

while true do
    local v611

    v610, v611 = v608(v609, v610)

    if v610 == nil then
        break
    end

    local v612, v613, v614 = pairs(v611.Configuration.Quests:GetChildren())

    while true do
        local v615

        v614, v615 = v612(v613, v614)

        if v614 == nil then
            break
        end

        local v616, v617, v618 = pairs(v615:GetChildren())

        while true do
            local v619

            v618, v619 = v616(v617, v618)

            if v618 == nil then
                break
            end
            if not table.find({
                'Layout',
            }, v619.Name) then
                table.insert(v504, {
                    ShowName = tostring(v615.Name) .. ' ' .. tostring(v619.Name),
                    Level = v615.Name,
                    SortLevel = tonumber(string.match(v615.Name, '%d+')),
                })
            end
        end
    end
end

function getenemy(p620)
    local v621, v622, v623 = pairs(_Workspace.Npc_Workspace.QuestGivers:GetChildren())

    while true do
        local v624

        v623, v624 = v621(v622, v623)

        if v623 == nil then
            break
        end

        local v625, v626, v627 = pairs(v624.Configuration.Quests:GetChildren())

        while true do
            local v628

            v627, v628 = v625(v626, v627)

            if v627 == nil then
                break
            end

            local v629, v630, v631 = pairs(v628:GetChildren())

            while true do
                local v632

                v631, v632 = v629(v630, v631)

                if v631 == nil then
                    break
                end
                if not table.find({
                    'Layout',
                }, v632.Name) and v628.Name == 'Level ' .. tostring(string.match(p620, '%d+')) then
                    return v632.Name
                end
            end
        end
    end
end

local v633, v634, v635 = pairs(_Workspace.Npc_Workspace['Spawn Setters']:GetChildren())

while true do
    local v636

    v635, v636 = v633(v634, v635)

    if v635 == nil then
        break
    end

    table.insert(v526, v636.Name)
end

function tptomon(p637)
    if typefarm ~= 'Behind' then
        if typefarm ~= 'Above' then
            if typefarm == 'Below' then
                TP(p637 * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0, DistanceAutoFarm, 0))
            end
        else
            TP(p637 * CFrame.new(0, DistanceAutoFarm, 0) * CFrame.Angles(math.rad(-90), 0, 0))
        end
    else
        TP(p637 * CFrame.new(0, 0, DistanceAutoFarm))
    end
end

table.sort(v504, function(p638, p639)
    return p638.SortLevel < p639.SortLevel
end)

local v640, v641, v642 = pairs(v504)

while true do
    local v643

    v642, v643 = v640(v641, v642)

    if v642 == nil then
        break
    end

    table.insert(v508, v643.ShowName)
end

local v644, v645, v646 = pairs(game:GetService('ReplicatedStorage').ViewportModels.Fruits:GetChildren())

while true do
    local v647

    v646, v647 = v644(v645, v646)

    if v646 == nil then
        break
    end

    table.insert(v506, v647.Name)
end

local v648, v649, v650 = pairs(game:GetService('ReplicatedStorage').ViewportModels.FishingRods:GetChildren())

while true do
    local v651

    v650, v651 = v648(v649, v650)

    if v650 == nil then
        break
    end

    table.insert(v507, v651.Name)
end

function checklvl()
    local _Value6 = game.Players.LocalPlayer.PlayerData.Experience.Level.Value

    if selectedquest == 'Auto Detected Level' then
        if _Value == 1 then
            if 1 <= _Value6 and _Value6 <= 9 then
                lvlquest = 1
                location = 'Starter Island'
            elseif 10 <= _Value6 and _Value6 <= 24 then
                lvlquest = 10
                location = 'Starter Island'
            elseif 25 <= _Value6 and _Value6 <= 39 then
                lvlquest = 25
                location = 'Starter Island'
            elseif 40 <= _Value6 and _Value6 <= 59 then
                lvlquest = 40
                location = 'Clown Island'
            elseif 60 <= _Value6 and _Value6 <= 89 then
                lvlquest = 60
                location = 'Clown Island'
            elseif 90 <= _Value6 and _Value6 <= 119 then
                lvlquest = 90
                location = 'Shark Park'
            elseif 120 <= _Value6 and _Value6 <= 159 then
                lvlquest = 120
                location = 'Shark Park'
            elseif 160 <= _Value6 and _Value6 <= 199 then
                lvlquest = 160
                location = 'Desert Ruins'
            elseif 200 <= _Value6 and _Value6 <= 249 then
                lvlquest = 200
                location = 'Desert Ruins'
            elseif 250 <= _Value6 and _Value6 <= 299 then
                lvlquest = 250
                location = 'Sea Restaurant'
            elseif 300 <= _Value6 and _Value6 <= 349 then
                lvlquest = 300
                location = 'Sea Restaurant'
            elseif 350 <= _Value6 and _Value6 <= 399 then
                lvlquest = 350
                location = 'Logue City'
            elseif 400 <= _Value6 and _Value6 <= 449 then
                lvlquest = 400
                location = 'Logue City'
            elseif 450 <= _Value6 and _Value6 <= 499 then
                lvlquest = 450
                location = 'Tall Woods'
            elseif 500 <= _Value6 and _Value6 <= 549 then
                lvlquest = 500
                location = 'Tall Woods'
            elseif 550 <= _Value6 and _Value6 <= 599 then
                lvlquest = 550
                location = 'Tall Woods'
            elseif 600 <= _Value6 and _Value6 <= 649 then
                lvlquest = 600
                location = 'Marine Base Town'
            elseif 650 <= _Value6 and _Value6 <= 699 then
                lvlquest = 650
                location = 'Marine Base Town'
            elseif 700 <= _Value6 and _Value6 <= 749 then
                lvlquest = 700
                location = 'Three Islands'
            elseif 750 <= _Value6 and _Value6 <= 799 then
                lvlquest = 750
                location = 'Three Islands'
            elseif 800 <= _Value6 and _Value6 <= 849 then
                lvlquest = 800
                location = 'Marine HQ'
            elseif 850 <= _Value6 and _Value6 <= 899 then
                lvlquest = 850
                location = 'Marine HQ'
            elseif 900 <= _Value6 and _Value6 <= 949 then
                lvlquest = 900
                location = 'Marine HQ'
            elseif 950 <= _Value6 and _Value6 <= 999 then
                lvlquest = 950
                location = 'Skypiean islands'
            elseif 1000 <= _Value6 and _Value6 <= 1049 then
                lvlquest = 1000
                location = 'Skypiean islands'
            elseif 1050 <= _Value6 and _Value6 <= 1099 then
                lvlquest = 1050
                location = 'Skypiean islands'
            elseif 1100 <= _Value6 and _Value6 <= 1149 then
                lvlquest = 1100
                location = 'Skypiean islands'
            elseif 1150 <= _Value6 and _Value6 <= 1199 then
                lvlquest = 1150
                location = 'Revolutionary Base'
            elseif 1200 <= _Value6 and _Value6 <= 1249 then
                lvlquest = 1200
                location = 'Revolutionary Base'
            elseif 1250 <= _Value6 and _Value6 <= 1299 then
                lvlquest = 1250
                location = 'Revolutionary Base'
            elseif 1300 <= _Value6 and _Value6 <= 1349 then
                lvlquest = 1300
                location = 'Impel Jail'
            elseif 1350 <= _Value6 and _Value6 <= 1399 then
                lvlquest = 1350
                location = 'Impel Jail'
            elseif 1400 <= _Value6 and _Value6 <= 1449 then
                lvlquest = 1400
                location = 'Impel Jail'
            elseif 1450 <= _Value6 and _Value6 <= 1499 then
                lvlquest = 1450
                location = 'Half Hot Half Cold'
            elseif 1500 <= _Value6 and _Value6 <= 1549 then
                lvlquest = 1500
                location = 'Half Hot Half Cold'
            elseif 1550 <= _Value6 and _Value6 <= 1599 then
                lvlquest = 1550
                location = 'Half Hot Half Cold'
            elseif 1600 <= _Value6 and _Value6 <= 1649 then
                lvlquest = 1600
                location = 'Fishman Island'
            elseif 1650 <= _Value6 and _Value6 <= 1699 then
                lvlquest = 1650
                location = 'Fishman Island'
            elseif 1700 <= _Value6 and _Value6 <= 1749 then
                lvlquest = 1700
                location = 'Fishman Island'
            elseif 1750 <= _Value6 and _Value6 <= 1799 then
                lvlquest = 1750
                location = 'Skull Island'
            elseif 1800 <= _Value6 and _Value6 <= 1849 then
                lvlquest = 1800
                location = 'Skull Island'
            elseif 1850 <= _Value6 and _Value6 <= 1899 then
                lvlquest = 1850
                location = 'Skull Island'
            elseif 1900 <= _Value6 and _Value6 <= 1949 then
                lvlquest = 1900
                location = 'Bubble Island'
            elseif 1950 <= _Value6 and _Value6 <= 1999 then
                lvlquest = 1950
                location = 'Bubble Island'
            elseif 2000 <= _Value6 and _Value6 <= 2049 then
                lvlquest = 2000
                location = 'Bubble Island'
            elseif 2050 <= _Value6 and _Value6 <= 2099 then
                lvlquest = 2050
                location = 'Thriller Boat'
            elseif 2100 <= _Value6 and _Value6 <= 2149 then
                lvlquest = 2100
                location = 'Thriller Boat'
            elseif _Value6 >= 2150 then
                lvlquest = 2150
                location = 'Thriller Boat'
            end
        end
        if _Value == 2 then
            if 2200 <= _Value6 and _Value6 <= 2249 then
                lvlquest = 2200
                location = 'Flower Capital'
            elseif 2250 <= _Value6 and _Value6 <= 2299 then
                lvlquest = 2250
                location = 'Flower Capital'
            elseif 2300 <= _Value6 and _Value6 <= 2349 then
                lvlquest = 2300
                location = 'Flower Capital'
            elseif 2350 <= _Value6 and _Value6 <= 2399 then
                lvlquest = 2350
                location = 'Flower Capital'
            elseif 2400 <= _Value6 and _Value6 <= 2449 then
                lvlquest = 2400
                location = 'Udon Prison'
            elseif 2450 <= _Value6 and _Value6 <= 2499 then
                lvlquest = 2450
                location = 'Udon Prison'
            elseif 2500 <= _Value6 and _Value6 <= 2549 then
                lvlquest = 2500
                location = 'Udon Prison'
            elseif 2550 <= _Value6 and _Value6 <= 2599 then
                lvlquest = 2550
                location = 'Snowy Graveyard'
            elseif 2600 <= _Value6 and _Value6 <= 2649 then
                lvlquest = 2600
                location = 'Snowy Graveyard'
            elseif 2650 <= _Value6 and _Value6 <= 2699 then
                lvlquest = 2650
                location = 'Snowy Graveyard'
            elseif 2700 <= _Value6 and _Value6 <= 2749 then
                lvlquest = 2700
                location = 'Desert City'
            elseif 2750 <= _Value6 and _Value6 <= 2799 then
                lvlquest = 2750
                location = 'Desert City'
            elseif 2800 <= _Value6 and _Value6 <= 2849 then
                lvlquest = 2800
                location = 'Desert City'
            elseif 2850 <= _Value6 and _Value6 <= 2899 then
                lvlquest = 2850
                location = 'Dragon Island'
            elseif 2900 <= _Value6 and _Value6 <= 2949 then
                lvlquest = 2900
                location = 'Dragon Island'
            elseif 2950 <= _Value6 and _Value6 <= 2999 then
                lvlquest = 2950
                location = 'Dragon Island'
            elseif 3000 <= _Value6 and _Value6 <= 3049 then
                lvlquest = 3000
                location = 'Shadow Island'
            elseif 3050 <= _Value6 and _Value6 <= 3099 then
                lvlquest = 3050
                location = 'Shadow Island'
            elseif 3100 <= _Value6 and _Value6 <= 3149 then
                lvlquest = 3100
                location = 'Shadow Island'
            elseif 3150 <= _Value6 and _Value6 <= 3199 then
                lvlquest = 3150
                location = 'Peanut Island'
            elseif 3200 <= _Value6 and _Value6 <= 3249 then
                lvlquest = 3200
                location = 'Peanut Island'
            elseif 3250 <= _Value6 and _Value6 <= 3299 then
                lvlquest = 3250
                location = 'Peanut Island'
            elseif 3300 <= _Value6 and _Value6 <= 3349 then
                lvlquest = 3300
                location = 'Dough Island'
            elseif 3350 <= _Value6 and _Value6 <= 3399 then
                lvlquest = 3350
                location = 'Dough Island'
            elseif 3400 <= _Value6 and _Value6 <= 3449 then
                lvlquest = 3400
                location = 'Dough Island'
            elseif 3450 <= _Value6 and _Value6 <= 3499 then
                lvlquest = 3450
                location = 'Cake Island'
            elseif 3500 <= _Value6 and _Value6 <= 3549 then
                lvlquest = 3500
                location = 'Cake Island'
            elseif 3550 <= _Value6 and _Value6 <= 3599 then
                lvlquest = 3550
                location = 'Cake Island'
            elseif 3600 <= _Value6 and _Value6 <= 3649 then
                lvlquest = 3600
                location = 'Winter Island'
            elseif 3650 <= _Value6 and _Value6 <= 3699 then
                lvlquest = 3650
                location = 'Winter Island'
            elseif 3700 <= _Value6 and _Value6 <= 3749 then
                lvlquest = 3700
                location = 'Winter Island'
            elseif 3750 <= _Value6 and _Value6 <= 3799 then
                lvlquest = 3750
                location = 'Winter Island'
            elseif 3800 <= _Value6 and _Value6 <= 3849 then
                lvlquest = 3800
                location = 'Winter Island'
            elseif 3850 <= _Value6 and _Value6 <= 3899 then
                lvlquest = 3850
                location = 'Winter Island'
            elseif 3900 <= _Value6 and _Value6 <= 3949 then
                lvlquest = 3900
                location = 'Snake Amazon'
            elseif 3950 <= _Value6 and _Value6 <= 3999 then
                lvlquest = 3950
                location = 'Snake Amazon'
            elseif 4000 <= _Value6 and _Value6 <= 4049 then
                lvlquest = 4000
                location = 'Snake Amazon'
            elseif 4050 <= _Value6 and _Value6 <= 4099 then
                lvlquest = 4050
                location = 'Venom Island'
            elseif 4100 <= _Value6 and _Value6 <= 4149 then
                lvlquest = 4100
                location = 'Venom Island'
            elseif _Value6 >= 4150 then
                lvlquest = 4150
                location = 'Venom Island'
            end
        end
    end
end
function checklvlnoboss()
    local _Value7 = game.Players.LocalPlayer.PlayerData.Experience.Level.Value

    if selectedquest == 'Auto Detected Level(No Boss)' then
        if _Value == 1 then
            if 1 <= _Value7 and _Value7 <= 9 then
                lvlquest = 1
                location = 'Starter Island'
            elseif 10 <= _Value7 and _Value7 <= 39 then
                lvlquest = 10
                location = 'Starter Island'
            elseif 40 <= _Value7 and _Value7 <= 89 then
                lvlquest = 40
                location = 'Clown Island'
            elseif 90 <= _Value7 and _Value7 <= 159 then
                lvlquest = 90
                location = 'Shark Park'
            elseif 160 <= _Value7 and _Value7 <= 249 then
                lvlquest = 160
                location = 'Desert Ruins'
            elseif 250 <= _Value7 and _Value7 <= 349 then
                lvlquest = 250
                location = 'Sea Restaurant'
            elseif 350 <= _Value7 and _Value7 <= 449 then
                lvlquest = 350
                location = 'Logue City'
            elseif 450 <= _Value7 and _Value7 <= 499 then
                lvlquest = 450
                location = 'Tall Woods'
            elseif 500 <= _Value7 and _Value7 <= 599 then
                lvlquest = 500
                location = 'Tall Woods'
            elseif 600 <= _Value7 and _Value7 <= 699 then
                lvlquest = 600
                location = 'Marine Base Town'
            elseif 700 <= _Value7 and _Value7 <= 799 then
                lvlquest = 700
                location = 'Three Islands'
            elseif 800 <= _Value7 and _Value7 <= 849 then
                lvlquest = 800
                location = 'Marine HQ'
            elseif 850 <= _Value7 and _Value7 <= 949 then
                lvlquest = 850
                location = 'Marine HQ'
            elseif 950 <= _Value7 and _Value7 <= 999 then
                lvlquest = 950
                location = 'Skypiean islands'
            elseif 1000 <= _Value7 and _Value7 <= 1049 then
                lvlquest = 1000
                location = 'Skypiean islands'
            elseif 1050 <= _Value7 and _Value7 <= 1149 then
                lvlquest = 1050
                location = 'Skypiean islands'
            elseif 1150 <= _Value7 and _Value7 <= 1199 then
                lvlquest = 1150
                location = 'Revolutionary Base'
            elseif 1200 <= _Value7 and _Value7 <= 1299 then
                lvlquest = 1200
                location = 'Revolutionary Base'
            elseif 1300 <= _Value7 and _Value7 <= 1349 then
                lvlquest = 1300
                location = 'Impel Jail'
            elseif 1350 <= _Value7 and _Value7 <= 1449 then
                lvlquest = 1350
                location = 'Impel Jail'
            elseif 1450 <= _Value7 and _Value7 <= 1499 then
                lvlquest = 1450
                location = 'Half Hot Half Cold'
            elseif 1500 <= _Value7 and _Value7 <= 1599 then
                lvlquest = 1500
                location = 'Half Hot Half Cold'
            elseif 1600 <= _Value7 and _Value7 <= 1649 then
                lvlquest = 1600
                location = 'Fishman Island'
            elseif 1650 <= _Value7 and _Value7 <= 1749 then
                lvlquest = 1650
                location = 'Fishman Island'
            elseif 1750 <= _Value7 and _Value7 <= 1799 then
                lvlquest = 1750
                location = 'Skull Island'
            elseif 1800 <= _Value7 and _Value7 <= 1899 then
                lvlquest = 1800
                location = 'Skull Island'
            elseif 1900 <= _Value7 and _Value7 <= 1949 then
                lvlquest = 1900
                location = 'Bubble Island'
            elseif 1950 <= _Value7 and _Value7 <= 2049 then
                lvlquest = 1950
                location = 'Bubble Island'
            elseif 2050 <= _Value7 and _Value7 <= 2099 then
                lvlquest = 2050
                location = 'Thriller Boat'
            elseif _Value7 >= 2100 then
                lvlquest = 2100
                location = 'Thriller Boat'
            end
        end
        if _Value == 2 then
            if 2200 <= _Value7 and _Value7 <= 2249 then
                lvlquest = 2200
                location = 'Flower Capital'
            elseif 2250 <= _Value7 and _Value7 <= 2299 then
                lvlquest = 2250
                location = 'Flower Capital'
            elseif 2300 <= _Value7 and _Value7 <= 2399 then
                lvlquest = 2300
                location = 'Flower Capital'
            elseif 2400 <= _Value7 and _Value7 <= 2449 then
                lvlquest = 2400
                location = 'Udon Prison'
            elseif 2450 <= _Value7 and _Value7 <= 2549 then
                lvlquest = 2450
                location = 'Udon Prison'
            elseif 2550 <= _Value7 and _Value7 <= 2599 then
                lvlquest = 2550
                location = 'Snowy Graveyard'
            elseif 2600 <= _Value7 and _Value7 <= 2699 then
                lvlquest = 2600
                location = 'Snowy Graveyard'
            elseif 2700 <= _Value7 and _Value7 <= 2749 then
                lvlquest = 2700
                location = 'Desert City'
            elseif 2750 <= _Value7 and _Value7 <= 2849 then
                lvlquest = 2750
                location = 'Desert City'
            elseif 2850 <= _Value7 and _Value7 <= 2899 then
                lvlquest = 2850
                location = 'Dragon Island'
            elseif 2900 <= _Value7 and _Value7 <= 2999 then
                lvlquest = 2900
                location = 'Dragon Island'
            elseif 3000 <= _Value7 and _Value7 <= 3049 then
                lvlquest = 3000
                location = 'Shadow Island'
            elseif 3050 <= _Value7 and _Value7 <= 3149 then
                lvlquest = 3050
                location = 'Shadow Island'
            elseif 3150 <= _Value7 and _Value7 <= 3199 then
                lvlquest = 3150
                location = 'Peanut Island'
            elseif 3200 <= _Value7 and _Value7 <= 3299 then
                lvlquest = 3200
                location = 'Peanut Island'
            elseif 3300 <= _Value7 and _Value7 <= 3349 then
                lvlquest = 3300
                location = 'Dough Island'
            elseif 3350 <= _Value7 and _Value7 <= 3449 then
                lvlquest = 3350
                location = 'Dough Island'
            elseif 3450 <= _Value7 and _Value7 <= 3499 then
                lvlquest = 3450
                location = 'Cake Island'
            elseif 3500 <= _Value7 and _Value7 <= 3599 then
                lvlquest = 3500
                location = 'Cake Island'
            elseif 3600 <= _Value7 and _Value7 <= 3649 then
                lvlquest = 3600
                location = 'Winter Island'
            elseif 3650 <= _Value7 and _Value7 <= 3749 then
                lvlquest = 3650
                location = 'Winter Island'
            elseif 3750 <= _Value7 and _Value7 <= 3799 then
                lvlquest = 3750
                location = 'Winter Island'
            elseif 3800 <= _Value7 and _Value7 <= 3849 then
                lvlquest = 3800
                location = 'Winter Island'
            elseif 3850 <= _Value7 and _Value7 <= 3899 then
                lvlquest = 3850
                location = 'Winter Island'
            elseif 3900 <= _Value7 and _Value7 <= 3949 then
                lvlquest = 3900
                location = 'Snake Amazon'
            elseif 3950 <= _Value7 and _Value7 <= 4050 then
                lvlquest = 3950
                location = 'Snake Amazon'
            elseif 4050 <= _Value7 and _Value7 <= 4099 then
                lvlquest = 4050
                location = 'Venom Island'
            elseif 4100 <= _Value7 and _Value7 <= 4149 then
                lvlquest = 4100
                location = 'Venom Island'
            end
        end
    end
end
function usecodes(p654)
    game:GetService('ReplicatedStorage').Replication.ClientEvents.ClaimCode:InvokeServer(unpack({p654}))
end
function ClickUI(p655)
    game:GetService('GuiService').SelectedObject = p655

    wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(true, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
    wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, 13, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
    wait(0.1)

    game:GetService('GuiService').SelectedObject = nil

    wait(0.1)
end
function UpdateDevilChams()
    local v656, v657, v658 = pairs(game:GetService('Workspace').Logic.FruitDrops:GetChildren())

    while true do
        local v659

        v658, v659 = v656(v657, v658)

        if v658 == nil then
            break
        end

        local v660, v661, v662 = pairs(v659:GetChildren())

        while true do
            local u663

            v662, u663 = v660(v661, v662)

            if v662 == nil then
                break
            end
            if u663.ClassName == 'Tool' then
                pcall(function()
                    if DevilESP then
                        if u663.Handle:FindFirstChild('NameEsp' .. Number) then
                            u663.Handle['NameEsp' .. Number].TextLabel.Text = u663.Name
                        else
                            local _BillboardGui = Instance.new('BillboardGui', u663.Handle)

                            _BillboardGui.Name = 'NameEsp' .. Number
                            _BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            _BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                            _BillboardGui.Adornee = u663.Handle
                            _BillboardGui.AlwaysOnTop = true

                            local _TextLabel47 = Instance.new('TextLabel', _BillboardGui)

                            _TextLabel47.Font = 'GothamBold'
                            _TextLabel47.FontSize = 'Size14'
                            _TextLabel47.TextWrapped = true
                            _TextLabel47.Size = UDim2.new(1, 0, 1, 0)
                            _TextLabel47.TextYAlignment = 'Top'
                            _TextLabel47.BackgroundTransparency = 1
                            _TextLabel47.TextStrokeTransparency = 0.5
                            _TextLabel47.TextColor3 = Color3.fromRGB(150, 150, 150)
                            _TextLabel47.Text = u663.Name
                        end
                    elseif u663.Handle:FindFirstChild('NameEsp' .. Number) then
                        u663.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                    end
                end)
            end
        end
    end
end
function UpdatePlayerChams()
    local v666, v667, v668 = pairs(game:GetService('Players'):GetChildren())

    while true do
        local u669

        v668, u669 = v666(v667, v668)

        if v668 == nil then
            break
        end

        pcall(function()
            if PlayerESP then
                if u669.Name ~= game.Players.LocalPlayer.Name then
                    if u669.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        u669.Character.Head['NameEsp' .. Number].TextLabel.Text = u669.Name
                    else
                        local _BillboardGui2 = Instance.new('BillboardGui', u669.Character.Head)

                        _BillboardGui2.Name = 'NameEsp' .. Number
                        _BillboardGui2.ExtentsOffset = Vector3.new(0, 1, 0)
                        _BillboardGui2.Size = UDim2.new(1, 200, 1, 30)
                        _BillboardGui2.Adornee = u669.Character.Head
                        _BillboardGui2.AlwaysOnTop = true

                        local _TextLabel48 = Instance.new('TextLabel', _BillboardGui2)

                        _TextLabel48.Font = 'GothamBold'
                        _TextLabel48.FontSize = 'Size14'
                        _TextLabel48.TextWrapped = true
                        _TextLabel48.Text = u669.Name
                        _TextLabel48.Size = UDim2.new(1, 0, 1, 0)
                        _TextLabel48.TextYAlignment = 'Top'
                        _TextLabel48.BackgroundTransparency = 1
                        _TextLabel48.TextStrokeTransparency = 0.5

                        if u669.Team ~= game.Players.LocalPlayer.Team then
                            _TextLabel48.TextColor3 = Color3.new(0, 0, 255)
                        else
                            _TextLabel48.TextColor3 = Color3.new(255, 0, 0)
                        end
                    end
                end
            elseif u669.Character.Head:FindFirstChild('NameEsp' .. Number) then
                u669.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end
function SendWebhook(p672, p673)
    if p672 then
        local v674 = request
        local v675 = {
            Url = p672,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
            },
        }
        local _HttpService3 = game:GetService('HttpService')
        local _JSONEncode = _HttpService3.JSONEncode
        local v678 = {
            content = '',
            tts = false,
        }
        local v679 = {}
        local v680 = {
            type = 'rich',
            title = 'You Got Mail!',
            description = '```\nItem Added : ' .. p673 .. '\n```',
            color = 16711782,
        }
        local v681 = {}
        local v682 = {
            name = 'Name',
            value = '||' .. game.Players.LocalPlayer.Name .. '||',
        }
        local v683 = {
            name = 'Level',
            value = game:GetService('Players').LocalPlayer.PlayerData.Experience.Level.Value,
            inline = false,
        }
        local v684 = {
            name = 'Currency',
            value = game:GetService('Players').LocalPlayer.PlayerData.Currency.Value,
            inline = true,
        }
        local v685 = {
            name = 'Gems',
            value = game:GetService('Players').LocalPlayer.PlayerData.Gems.Value,
            inline = true,
        }
        local v686 = {
            name = 'Bounty',
            value = game:GetService('Players').LocalPlayer.leaderstats['Bounty/Respect'].Value,
            inline = true,
        }

        __set_list(v681, 1, {
            v682,
            v683,
            v684,
            v685,
            v686,
            {
                name = 'Thanks For Support',
                value = '-------------------------------------------------------------------------------------',
                inline = false,
            },
        })

        v680.fields = v681

        __set_list(v679, 1, {v680})

        v678.embeds = v679
        v675.Body = _JSONEncode(_HttpService3, v678)

        v674(v675)
    end
end
function useskill()
    if ZZZ then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'Z', false, game)
        wait(0.1)
        game:service('VirtualInputManager'):SendKeyEvent(false, 'Z', false, game)
        wait(1)
    end
    if XXX then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'X', false, game)
        wait(0.1)
        game:service('VirtualInputManager'):SendKeyEvent(false, 'X', false, game)
        wait(1)
    end
    if CCC then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
        wait(0.1)
        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
        wait(1)
    end
    if VVV then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'V', false, game)
        wait(0.1)
        game:service('VirtualInputManager'):SendKeyEvent(false, 'V', false, game)
        wait(1)
    end
    if BBB then
        game:service('VirtualInputManager'):SendKeyEvent(true, 'B', false, game)
        wait(0.1)
        game:service('VirtualInputManager'):SendKeyEvent(false, 'B', false, game)
        wait(1)
    end
end

_Main2:Dropdown('Set Quest', v508, 'Auto Detected Level', function(p687)
    selectedquest = p687

    if selectedquest ~= 'Auto Detected Level' then
        getnamemon = getenemy(selectedquest)
    end
end)
_Main2:Dropdown('Set Weapon', {
    'Melee',
    'Sword',
    'Fruit',
}, 'Melee', function(p688)
    setweapon = p688
end)
_Main2:Dropdown('Set Type', {
    'Behind',
    'Above',
    'Below',
}, 'Above', function(p689)
    typefarm = p689
end)
_Main2:Toggle('Get Quest', true, function(p690)
    acceptquest = p690
end)
_Main2:Toggle('Auto Set Spawn (AutoFarmLevel)', false, function(p691)
    autosetspawn = p691
end)
_Main2:Toggle('Start Farm', false, function(p692)
    startfarm = p692

    if p692 == false then
        _G.ugotmail = false

        wait(0.5)
        TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)
_Main2:Toggle('Buso Haki', false, function(p693)
    busohaki = p693
end)
_Main2:Toggle('Obs Haki', false, function(p694)
    obshaki = p694
end)
_Main2:Dropdown('Select Form', {
    'Gear 2',
    'Gear 4',
    'Gear 5',
}, '', function(p695)
    selectedform = p695
end)
_Main2:Toggle('Auto Transform For Gum', false, function(p696)
    autotrans = p696
end)

if game:GetService('Players').LocalPlayer.PlayerGui.Platform.Value ~= 'PC' then
    _Main2:Textbox('Set Distance', 6, false, function(p697)
        DistanceAutoFarm = p697
    end)
else
    _Main2:Slider('Set Distance', 1, 50, 6, function(p698)
        DistanceAutoFarm = p698
    end)
end
if _Value ~= 1 then
    _Main22:Toggle('XMAS Monster Superboss', false, function(p699)
        xmasboss = p699

        if p699 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Toggle('Start Farm Enma Boss', false, function(p700)
        farmenmaboss = p700

        if p700 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Line()
    _Main22:Toggle('Auto Summon Dragon Quest', false, function(p701)
        dragonquest = p701

        if p701 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Toggle('Auto Store Drums of Liberation', false, function(p702)
        autostorecum = p702
    end)
    _Main22:Toggle('Disable Auto Store Drums After Stored Drums', false, function(p703)
        disibledrums = p703
    end)
    _Main22:Label('Recommend For AFK Player Cuz You can store only 1 Drums', Color3.fromRGB(255, 255, 255))
    _Main22:Label("If u not Disable Auto Store, Script will make you can't farm anymore", Color3.fromRGB(255, 255, 255))
    _Main22:Line()
else
    _Main22:Dropdown('Select Special Boss', v530, '', function(p704)
        selectedspec = p704
    end)
    _Main22:Toggle('Start Farm Special Boss', false, function(p705)
        farmspecialboss = p705

        if p705 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Dropdown('Select Super Boss', v531, '', function(p706)
        selectedSuper = p706
    end)
    _Main22:Toggle('Start Farm Super Boss', false, function(p707)
        farmSuperboss = p707

        if p707 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Toggle('Start Farm Fire Fist Boss', false, function(p708)
        farmfirefistboss = p708

        if p708 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Line()
    _Main22:Toggle('Start Farm G4 Book', false, function(p709)
        g4book = p709

        if p709 == false then
            _G.ugotmail = false

            wait(0.5)
            TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
    _Main22:Toggle('Auto Store Gear 4 Book', false, function(p710)
        gotg4book = p710
    end)
    _Main22:Toggle('Disable Auto Store G4Book After Stored G4Book', false, function(p711)
        disiblebook = p711
    end)
    _Main22:Label('Recommend For AFK Player Cuz You can store only 1 G4Book', Color3.fromRGB(255, 255, 255))
    _Main22:Label("If u not Disable Auto Store, Script will make you can't farm anymore", Color3.fromRGB(255, 255, 255))
    _Main22:Line()
end

_Main22:Toggle('Start Farm Sea Beast', false, function(p712)
    farmsea = p712

    if p712 == false then
        _G.ugotmail = false

        wait(0.5)
        TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)
_Skill:Toggle('Z', false, function(p713)
    ZZZ = p713
end)
_Skill:Toggle('X', false, function(p714)
    XXX = p714
end)
_Skill:Toggle('C', false, function(p715)
    CCC = p715
end)
_Skill:Toggle('V', false, function(p716)
    VVV = p716
end)
_Skill:Toggle('B', false, function(p717)
    BBB = p717
end)

if game:GetService('Players').LocalPlayer.PlayerGui.Platform.Value ~= 'PC' then
    _Stats:Textbox('Set Point', 1, false, function(p718)
        setpoint = p718
    end)
else
    _Stats:Slider('Set Point', 1, 50, 1, function(p719)
        setpoint = p719
    end)
end

_Stats:Toggle('Combat', false, function(p720)
    Combat = p720
end)
_Stats:Toggle('Defense', false, function(p721)
    Defense = p721
end)
_Stats:Toggle('Sword', false, function(p722)
    Sword = p722
end)
_Stats:Toggle('Fruit', false, function(p723)
    Fruit = p723
end)
_BuyItem:Label('Fruit Sniper Will Buy Fruit in NightMarket then auto store ur Fruit', Color3.fromRGB(255, 255, 255))
_BuyItem:Label('so clear ur FruitBag\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}', Color3.fromRGB(255, 255, 255))
_BuyItem:MultiDropdown('Select Fruit', v506, {}, function(p724)
    selectedFruit = p724
end)
_BuyItem:Toggle('Buy Selected Fruit', false, function(p725)
    buyselectedFruit = p725
end)
_BuyItem:Button('Open Fruit Shop', function()
    game:GetService('Players').LocalPlayer.PlayerGui.FruitShop.BlackMarketHandle:Fire()
end)

if _Value == 1 then
    _BuyItem:Button('Pick Poneglyph Scroll | Free', function()
        workspace.Logic.PointsOfInterest:FindFirstChild('Poneglyph Scroll').Pick:InvokeServer()
    end)
end

_BuyItem:Label('Stat Remover', Color3.fromRGB(255, 255, 255))
_BuyItem:Button('Stat Reset | 100 Gems', function()
    _ClientEvents:WaitForChild('StatReset'):FireServer()
end)
_BuyItem:Button('Wooden Fishing Rod | 5000 $', function()
    _ClientEvents.BuyFishingRod:InvokeServer('Wooden Fishing Rod')
end)
_BuyItem:Button('Rare Fishing Rod | 50 Gems', function()
    _ClientEvents.BuyFishingRod:InvokeServer('Rare Fishing Rod')
end)

if _Value == 1 then
    _BuyItem:Label('Sword Sellers', Color3.fromRGB(255, 255, 255))

    local v726, v727, v728 = pairs(_Workspace.Npc_Workspace['Sword Sellers']:GetChildren())

    while true do
        local u729

        v728, u729 = v726(v727, v728)

        if v728 == nil then
            break
        end

        _BuyItem:Button(u729.Name .. ' | ' .. u729.Price.Value .. ' $', function()
            local v730 = {
                workspace:WaitForChild('Npc_Workspace'):WaitForChild('Sword Sellers'):WaitForChild(u729.Name),
            }

            _ClientEvents:WaitForChild('BuySword'):InvokeServer(unpack(v730))
        end)
    end
end

_BuyItem:Label('Fighting Style', Color3.fromRGB(255, 255, 255))

local v731, v732, v733 = pairs(_Workspace.Npc_Workspace.FightingStyle:GetChildren())

while true do
    local u734

    v733, u734 = v731(v732, v733)

    if v733 == nil then
        break
    end

    _BuyItem:Button(u734.Name .. ' | ' .. u734.Config.Price.Value .. ' $', function()
        local v735 = {
            u734.Name,
        }

        game:GetService('ReplicatedStorage').Replication.ClientEvents.BuyFightingStyle:InvokeServer(unpack(v735))
    end)
end

_BuyItem:Label('Buso/Obs/Flash Haki', Color3.fromRGB(255, 255, 255))
_BuyItem:Button('Flash Step V.1 | 25000 $', function()
    game:GetService('ReplicatedStorage').Replication.ClientEvents.FlashStep:InvokeServer()
end)
_BuyItem:Button('Flash Step V.2 | 75000 $', function()
    game:GetService('ReplicatedStorage').Replication.ClientEvents.FlashStep:InvokeServer()
end)
_BuyItem:Button('Flash Step V.3 | 200000 $', function()
    game:GetService('ReplicatedStorage').Replication.ClientEvents.FlashStep:InvokeServer()
end)
_BuyItem:Button('Haki V.1 | 100000 $', function()
    local v736 = {
        workspace.Npc_Workspace.Buso:FindFirstChild('1'),
    }

    _ClientEvents.Buso:InvokeServer(unpack(v736))
end)
_BuyItem:Button('Haki V.2 | 250000 $', function()
    local v737 = {
        workspace.Npc_Workspace.Buso:FindFirstChild('2'),
    }

    _ClientEvents.Buso:InvokeServer(unpack(v737))
end)
_BuyItem:Button('Obs haki V.1 | 150000 $', function()
    local v738 = {
        workspace.Npc_Workspace.obshaki:FindFirstChild('1'),
    }

    game:GetService('ReplicatedStorage').Replication.ClientEvents.ObsHaki:InvokeServer(unpack(v738))
end)
_BuyItem:Button('Obs haki V.2 | 200000 $', function()
    local v739 = {
        workspace.Npc_Workspace.obshaki:FindFirstChild('2'),
    }

    game:GetService('ReplicatedStorage').Replication.ClientEvents.ObsHaki:InvokeServer(unpack(v739))
end)
_BuyItem:Button('Obs haki V.3 | 1000000 $', function()
    local v740 = {
        workspace.Npc_Workspace.obshaki:FindFirstChild('3'),
    }

    game:GetService('ReplicatedStorage').Replication.ClientEvents.ObsHaki:InvokeServer(unpack(v740))
end)
_Teleport:Button('Stop Tween', function()
    _G.ugotmail = false

    TPCF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)
_Teleport:Button('Reset Character', function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
_Teleport:Line()
_Teleport:Dropdown('Set Spawn', v526, _Value2, function(p741)
    setspawn(p741)
end)
_Teleport:Label('Worlds', Color3.fromRGB(255, 255, 255))

if _Value ~= 1 then
    _Teleport:Button('Sea 1', function()
        workspace.Npc_Workspace:FindFirstChild('Sea Teleporter'):FindFirstChild('Sea 1').Teleport:InvokeServer()
    end)
else
    _Teleport:Button('Sea 2', function()
        workspace.Npc_Workspace:FindFirstChild('Sea Teleporter'):FindFirstChild('Sea 2').Teleport:InvokeServer()
    end)
end

_Teleport:Line()
_Teleport:Button('TP To Gear 5 Trainer', function()
    TPCF(CFrame.new(9011.41016, 1870.427, 7016.05518, 1, 0, 0, 0, 1, 0, 0, 0, 1))
end)

if _Value ~= 2 then
    _Teleport:Button('TP To Candy Market', function()
        TPCF(CFrame.new(-2072.8916, 45.6843987, -2936.75171, 0.999821305, 0, 0.0189036801, 0, 1, 0, -0.0189036801, 0, 0.999821305))
    end)
else
    _Teleport:Button('TP To Candy Market', function()
        TPCF(CFrame.new(2578.77832, 41.0044022, 15916.2773, 0.720327258, -0, -0.693634331, -0, 1, -0, 0.693634331, -0, 0.720327258))
    end)
end

_Teleport:Line()

local v742, v743, v744 = pairs(_ReplicatedStorage.IslandHitboxes:GetChildren())

while true do
    local v745

    v744, v745 = v742(v743, v744)

    if v744 == nil then
        break
    end
    if v745.Name == 'Sea1' and game.Players.LocalPlayer.PlayerData.SeaIndex.Value == 1 then
        _Teleport:Label(v745.Name, Color3.fromRGB(255, 255, 255))

        local v746, v747, v748 = pairs(v745:GetChildren())

        while true do
            local u749

            v748, u749 = v746(v747, v748)

            if v748 == nil then
                break
            end

            _Teleport:Button(u749.Name, function()
                TPCF(u749.Configuration.CFrame.Value)
            end)
        end
    end
    if v745.Name == 'Sea2' and game.Players.LocalPlayer.PlayerData.SeaIndex.Value == 2 then
        _Teleport:Label(v745.Name, Color3.fromRGB(255, 255, 255))

        local v750, v751, v752 = pairs(v745:GetChildren())

        while true do
            local u753

            v752, u753 = v750(v751, v752)

            if v752 == nil then
                break
            end

            _Teleport:Button(u753.Name, function()
                TPCF(u753.Configuration.CFrame.Value)
            end)
        end
    end
end

_Misc:Line()
_Misc:Button('Re Join', function()
    rejoingame()
end)
_Misc:Button('Server Hop', function()
    hopkl()
end)
_Misc:Button('Server Hop Lower Player', function()
    HopLowerServer()
end)
_Misc:Line()
_Misc:Button('Fps Boost', function()
    fps()
end)
_Misc:Button('Use All Codes', function()
    usecodes('SHUTDOWN3')
    usecodes('SHUTDOWN4')
    usecodes('220KLIKES4CODE')
    usecodes('DRAGONUPDATE23')
    usecodes('WOW190KFORNEXT')
    usecodes('160KLIKESFORNEXT')
    usecodes('250KLETSGO')
    usecodes('GEAR5TH')
    usecodes('WOW325KMLG')
    usecodes('NEXT300KCOOL')
    usecodes('XMAS2023')
    usecodes('VALENTINES2024')
end)
_Misc:Toggle('ESP Fruits', DevilESP, function(p754)
    DevilESP = p754

    UpdateDevilChams()
end)
_Misc:Toggle('ESP Players', PlayerESP, function(p755)
    PlayerESP = p755

    UpdatePlayerChams()
end)
spawn(function()
    game:GetService('RunService').Heartbeat:Connect(function()
        if startfarm or (_G.ugotmail or (farmspecialboss or (farmSuperboss or (farmsea or (farmenmaboss or (g4book or (farmfirefistboss or (dragonquest or xmasboss)))))))) then
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)

                local v756, v757, v758 = pairs(game.Players.LocalPlayer.Character:GetDescendants())

                while true do
                    local v759

                    v758, v759 = v756(v757, v758)

                    if v758 == nil then
                        break
                    end
                    if v759:IsA('BasePart') and v759.CanCollide == true then
                        v759.CanCollide = false
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    while wait() do
        if startfarm then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if selectedquest == 'Auto Detected Level' or selectedquest == 'Auto Detected Level(No Boss)' then
                    if game.Players.LocalPlayer.Quest.NPCName.Value == '' and acceptquest then
                        if selectedquest ~= 'Auto Detected Level' then
                            if selectedquest == 'Auto Detected Level(No Boss)' then
                                checklvlnoboss()
                            end
                        else
                            checklvl()
                        end

                        getquest('Level ' .. tostring(lvlquest))

                        if autosetspawn and game.Players.LocalPlayer.PlayerData.SpawnPoint2.Value ~= location then
                            setspawn(location)
                        end
                    end

                    local v760, v761, v762 = pairs(_Workspace['NPC Zones']:GetChildren())

                    while true do
                        local v763

                        v762, v763 = v760(v761, v762)

                        if v762 == nil then
                            break
                        end

                        local v764, v765, v766 = pairs(v763.NPCS:GetChildren())

                        while true do
                            local v767

                            v766, v767 = v764(v765, v766)

                            if v766 == nil then
                                break
                            end
                            if v767.ClassName == 'Model' and v767.NPCName.Value == game.Players.LocalPlayer.Quest.NPCName.Value then
                                if v767:FindFirstChild('HumanoidRootPart') and v767.Humanoid.Health > 0 then
                                    mon = v767.Name

                                    task.wait()
                                    getweapon()
                                    tptomon(v767.HumanoidRootPart.CFrame)

                                    v767.HumanoidRootPart.CanCollide = false

                                    v767.Humanoid:ChangeState(11)
                                    att()

                                    if startfarm and (v767:FindFirstChild('Humanoid').Health > 0 and (game.Players.LocalPlayer.Quest.NPCName.Value ~= '' or not acceptquest)) and not (u524 or u525) then
                                    end
                                else
                                    wait(0.2)
                                    TP(v767.SpawnCFrame.Value)
                                end
                            end
                        end
                    end
                end
                if game.Players.LocalPlayer.Quest.NPCName.Value == '' and acceptquest then
                    getquest('Level ' .. tostring(string.match(selectedquest, '%d+')))
                end

                local v768, v769, v770 = pairs(_Workspace['NPC Zones']:GetChildren())

                while true do
                    local v771

                    v770, v771 = v768(v769, v770)

                    if v770 == nil then
                        return
                    end

                    local v772, v773, v774 = pairs(v771.NPCS:GetChildren())

                    while true do
                        local v775

                        v774, v775 = v772(v773, v774)

                        if v774 == nil then
                            break
                        end
                        if v775.ClassName == 'Model' and v775.NPCName.Value == getnamemon then
                            if v775:FindFirstChild('HumanoidRootPart') and v775.Humanoid.Health > 0 then
                                task.wait()
                                getweapon()
                                tptomon(v775.HumanoidRootPart.CFrame)

                                v775.HumanoidRootPart.CanCollide = false

                                v775.Humanoid:ChangeState(11)
                                att()

                                if startfarm and (v775:FindFirstChild('Humanoid').Health > 0 and (game.Players.LocalPlayer.Quest.NPCName.Value ~= '' or not acceptquest)) and not (u524 or u525) then
                                end
                            else
                                wait(0.2)
                                TP(v775.SpawnCFrame.Value)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if farmspecialboss or (farmSuperboss or (farmsea or (farmenmaboss or (farmfirefistboss or (dragonquest or xmasboss))))) then
            pcall(function()
                local v776, v777, v778 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                while true do
                    local v779

                    v778, v779 = v776(v777, v778)

                    if v778 == nil then
                        break
                    end
                    if v779.NPCName.Value == 'Tremor Girl' then
                        u509 = v779.Name
                    end
                    if v779.NPCName.Value == 'Mace Boss' then
                        u510 = v779.Name
                    end
                    if v779.NPCName.Value == 'Fire Fist' then
                        u511 = v779.Name
                    end
                end

                local v780, v781, v782 = pairs(_Workspace['NPC Zones']['Super Bosses'].NPCS:GetChildren())

                while true do
                    local v783

                    v782, v783 = v780(v781, v782)

                    if v782 == nil then
                        break
                    end
                    if v783.NPCName.Value == 'Dual Swordsman' then
                        u512 = v783.Name
                    end
                end

                local v784, v785, v786 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                while true do
                    local v787

                    v786, v787 = v784(v785, v786)

                    if v786 == nil then
                        break
                    end
                    if v787.NPCName.Value == 'DragonBoss-828' or v787.NPCName.Value == 'Dragon Boss' then
                        u527 = v787.Name
                    end
                end

                local v788, v789, v790 = pairs(_Workspace['NPC Zones'].Monsters.NPCS:GetChildren())

                while true do
                    local v791

                    v790, v791 = v788(v789, v790)

                    if v790 == nil then
                        break
                    end
                    if v791.ClassName == 'Model' and (v791.NPCName.Value == 'Sea Beast' or (v791.NPCName.Value == 'White Sea Beast' or v791.NPCName.Value == 'Red Sea Beast')) then
                        u513 = v791.Name
                    end
                end

                local v792, v793, v794 = pairs(_Workspace['NPC Zones']['Flower Capital'].NPCS:GetChildren())

                while true do
                    local v795

                    v794, v795 = v792(v793, v794)

                    if v794 == nil then
                        break
                    end
                    if v795.ClassName == 'Model' and v795.NPCName.Value == 'Enma Boss' then
                        u528 = v795.Name
                    end
                end

                local v796, v797, v798 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                while true do
                    local v799

                    v798, v799 = v796(v797, v798)

                    if v798 == nil then
                        break
                    end
                    if v799.ClassName == 'Model' and v799.NPCName.Value == 'XMAS Boss' then
                        u529 = v799.Name
                    end
                end
            end)
        end
    end
end)

function specialboss()
    if selectedspec ~= 'WhiteBeard Girl So Cute' then
        if selectedspec == 'Mace Boss Boy So Cool' then
            u514 = 'Marine Base Town'
            u515 = 'Lava Ore'
            u516 = 'Lava Key'
            u517 = u510
            u518 = 'Marine Captain'
            LVMini = 'Level 650'
            u519 = _Workspace.Logic.PointsOfInterest:FindFirstChild('MarineBaseCauldron')
            u520 = CFrame.new(43.53086471557617, 22.108606338500977, 6247.69140625)
            u521 = CFrame.new(64.50127410888672, 6.984524726867676, 6461.25244140625)
        end
    else
        u514 = 'Marine HQ'
        u515 = 'Tremor Key'
        u516 = ''
        u517 = u509
        u518 = 'Ice Admiral'
        LVMini = 'Level 900'
        u519 = _Workspace.Islands['Marine HQ'].WhitebeardLock
        u520 = CFrame.new(-6350.060546875, 21.769289016723633, 6430.0458984375)
        u521 = ''
    end
end

spawn(function()
    while wait() do
        if farmspecialboss then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                specialboss()

                if game.Players.LocalPlayer.PlayerData.SpawnPoint.Value ~= u514 then
                    setspawn(u514)
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild(u515) or game.Players.LocalPlayer.Character:FindFirstChild(u515) then
                    EquipWeapon(u515)

                    local v800 = u519
                    local v801, v802, v803 = pairs(v800:GetChildren())

                    while true do
                        local v804

                        v803, v804 = v801(v802, v803)

                        if v803 == nil then
                            break
                        end
                        if v804:FindFirstChild('ProximityPrompt') then
                            TP(u520)
                            fireproximityprompt(v804.ProximityPrompt)
                        else
                            TP(u520)
                        end
                    end
                end
                if u516 == '' or (_Workspace['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u517) or not _Workspace.Logic.PointsOfInterest:FindFirstChild('MarineBaseCageDoor')) then
                    if _Workspace['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u517) then
                        local v805, v806, v807 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                        while true do
                            local v808

                            v807, v808 = v805(v806, v807)

                            if v807 == nil then
                                break
                            end
                            if v808.ClassName == 'Model' and (v808.Name == u517 and (v808:FindFirstChild('HumanoidRootPart') and v808.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    getweapon()
                                    tptomon(v808.HumanoidRootPart.CFrame)

                                    v808.HumanoidRootPart.CanCollide = false

                                    v808.Humanoid:ChangeState(11)
                                    att()
                                until not farmspecialboss or v808:FindFirstChild('Humanoid').Health <= 0
                            end
                        end
                    elseif game.Players.LocalPlayer.Quest.NPCName.Value ~= '' or not acceptquest then
                        local v809, v810, v811 = pairs(_Workspace['NPC Zones']:GetChildren())

                        while true do
                            local v812

                            v811, v812 = v809(v810, v811)

                            if v811 == nil then
                                break
                            end

                            local v813, v814, v815 = pairs(v812.NPCS:GetChildren())

                            while true do
                                local v816

                                v815, v816 = v813(v814, v815)

                                if v815 == nil then
                                    break
                                end
                                if v816.ClassName == 'Model' and v816.NPCName.Value == u518 then
                                    if v816:FindFirstChild('HumanoidRootPart') and v816.Humanoid.Health > 0 then
                                        while true do
                                            task.wait()
                                            getweapon()
                                            tptomon(v816.HumanoidRootPart.CFrame)

                                            v816.HumanoidRootPart.CanCollide = false

                                            v816.Humanoid:ChangeState(11)
                                            att()

                                            if not farmspecialboss or v816:FindFirstChild('Humanoid').Health <= 0 then
                                                break
                                            end
                                            if game.Players.LocalPlayer.Quest.NPCName.Value == '' then
                                                if acceptquest then
                                                    break
                                                end
                                            end
                                        end
                                    else
                                        wait(0.5)
                                        TP(v816.SpawnCFrame.Value)
                                    end
                                end
                            end
                        end
                    else
                        getquest(LVMini)
                    end
                else
                    workspace.Logic.PointsOfInterest:FindFirstChild('Lava Key').Pick:InvokeServer()
                    EquipWeapon(u516)

                    local v817, v818, v819 = pairs(_Workspace.Logic.PointsOfInterest.MarineBaseCageDoor:GetChildren())

                    while true do
                        local v820

                        v819, v820 = v817(v818, v819)

                        if v819 == nil then
                            break
                        end
                        if v820:FindFirstChild('ProximityPrompt') then
                            TP(u521)
                            fireproximityprompt(v820.ProximityPrompt)
                        else
                            TP(u521)
                        end
                    end
                end
            end)
        end
    end
end)

function superbosses()
    if selectedSuper == 'Dual Swordsman' then
        u517 = u512
    end
end

spawn(function()
    while wait() do
        if farmSuperboss then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                superbosses()

                if _Workspace['NPC Zones']['Super Bosses'].NPCS:FindFirstChild(u517) then
                    if startfarm == true then
                        startfarm = false

                        wait(0.1)

                        u524 = true
                    end

                    local v821, v822, v823 = pairs(_Workspace['NPC Zones']['Super Bosses'].NPCS:GetChildren())

                    while true do
                        local v824

                        v823, v824 = v821(v822, v823)

                        if v823 == nil then
                            break
                        end
                        if v824.ClassName == 'Model' and v824.Name == u517 then
                            if v824:FindFirstChild('HumanoidRootPart') and v824.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    getweapon()
                                    tptomon(v824.HumanoidRootPart.CFrame)

                                    v824.HumanoidRootPart.CanCollide = false

                                    v824.Humanoid:ChangeState(11)
                                    att()
                                until not farmSuperboss or v824:FindFirstChild('Humanoid').Health <= 0

                                if u524 == true then
                                    startfarm = true

                                    wait(0.1)

                                    u524 = false
                                end
                            else
                                wait(0.5)
                                TP(v824.SpawnCFrame.Value)
                            end
                        end
                    end
                elseif u524 == true then
                    startfarm = true

                    wait(0.1)

                    u524 = false
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if xmasboss then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if game.Players.LocalPlayer.Backpack:FindFirstChild('Snow Orb') or game.Players.LocalPlayer.Character:FindFirstChild('Snow Orb') then
                    EquipWeapon('Snow Orb')

                    if game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Tutorial_Gui') then
                        local v825, v826, v827 = pairs(game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Tutorial_Gui').MainFrame.Decision:GetChildren())

                        while true do
                            local v828

                            v827, v828 = v825(v826, v827)

                            if v827 == nil then
                                break
                            end
                            if v828.Name == 'Decision' and v828.AnswerWrapper.Answer.Text == 'Spawn' then
                                ClickUI(v828.Button)
                                wait(1)
                            end
                        end
                    else
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                    end
                elseif game:GetService('Workspace')['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u529) then
                    local v829, v830, v831 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                    while true do
                        local v832

                        v831, v832 = v829(v830, v831)

                        if v831 == nil then
                            break
                        end
                        if v832.ClassName == 'Model' and v832.NPCName.Value == 'XMAS Boss' then
                            if v832:FindFirstChild('HumanoidRootPart') and v832.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    getweapon()
                                    tptomon(v832.HumanoidRootPart.CFrame)

                                    v832.HumanoidRootPart.CanCollide = false

                                    v832.Humanoid:ChangeState(11)
                                    att()
                                until not xmasboss or v832:FindFirstChild('Humanoid').Health <= 0
                            else
                                TP(v832.SpawnCFrame.Value)
                            end
                        end
                    end
                elseif game.Players.LocalPlayer.Quest.NPCName.Value ~= '' or (not acceptquest or game.Players.LocalPlayer.PlayerData.Experience.Level.Value < 3850) then
                    local v833, v834, v835 = pairs(_Workspace['NPC Zones']['Winter Island'].NPCS:GetChildren())

                    while true do
                        local v836

                        v835, v836 = v833(v834, v835)

                        if v835 == nil then
                            break
                        end
                        if v836.ClassName == 'Model' and v836.NPCName.Value == 'Snow Boss' then
                            if v836:FindFirstChild('HumanoidRootPart') and v836.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    getweapon()
                                    tptomon(v836.HumanoidRootPart.CFrame)

                                    v836.HumanoidRootPart.CanCollide = false

                                    v836.Humanoid:ChangeState(11)
                                    att()
                                until not xmasboss or v836:FindFirstChild('Humanoid').Health <= 0
                            else
                                TP(v836.SpawnCFrame.Value)
                            end
                        end
                    end
                else
                    getquest('Level 3850')
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if farmenmaboss then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if _Workspace['NPC Zones']['Flower Capital'].NPCS:FindFirstChild(u528) then
                    if startfarm == true then
                        startfarm = false

                        wait(0.1)

                        u524 = true
                    end

                    local v837, v838, v839 = pairs(_Workspace['NPC Zones']:GetChildren())

                    while true do
                        local v840

                        v839, v840 = v837(v838, v839)

                        if v839 == nil then
                            break
                        end

                        local v841, v842, v843 = pairs(v840.NPCS:GetChildren())

                        while true do
                            local v844

                            v843, v844 = v841(v842, v843)

                            if v843 == nil then
                                break
                            end
                            if v844.ClassName == 'Model' and v844.NPCName.Value == 'Enma Boss' then
                                if v844:FindFirstChild('HumanoidRootPart') and v844.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        getweapon()
                                        tptomon(v844.HumanoidRootPart.CFrame)

                                        v844.HumanoidRootPart.CanCollide = false

                                        v844.Humanoid:ChangeState(11)
                                        att()
                                    until not farmenmaboss or v844:FindFirstChild('Humanoid').Health <= 0

                                    if u524 == true then
                                        startfarm = true

                                        wait(0.1)

                                        u524 = false
                                    end
                                else
                                    wait(0.5)
                                    TP(v844.SpawnCFrame.Value)
                                end
                            end
                        end
                    end
                elseif u524 == true then
                    startfarm = true

                    wait(0.1)

                    u524 = false
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if farmfirefistboss then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if (game.Players.LocalPlayer.Backpack:FindFirstChild('Match') or game.Players.LocalPlayer.Character:FindFirstChild('Match')) and game:GetService('Workspace').Logic.PointsOfInterest.TallWoodsCampfire.Wood.ShoulderP.Flame.Enabled == false then
                    repeat
                        wait()
                        toTarget(CFrame.new(139.3063201904297, 13.4593505859375, 2508.53857421875) * CFrame.new(0, 100, 0))
                    until not farmfirefistboss or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (CFrame.new(139.3063201904297, 13.4593505859375, 2508.53857421875) * CFrame.new(0, 100, 0)).Position).Magnitude <= 10
                    repeat
                        wait()
                        toTarget(CFrame.new(139.3063201904297, 13.4593505859375, 2508.53857421875))
                    until not farmfirefistboss or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(139.3063201904297, 13.4593505859375, 2508.53857421875).Position).Magnitude <= 10

                    if farmfirefistboss then
                        print(1)
                        EquipWeapon('Match')
                        fireproximityprompt(game:GetService('Workspace').Logic.PointsOfInterest.TallWoodsCampfire.Wood.ProximityPrompt)
                    end
                elseif game:GetService('Workspace').Logic.PointsOfInterest.TallWoodsCampfire.Wood.ShoulderP.Flame.Enabled ~= true or not game:GetService('Workspace').Logic.Ignore.TallWoodsPearls:FindFirstChild('PearlObject') then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild('Pearl') or game.Players.LocalPlayer.Character:FindFirstChild('Pearl') then
                        EquipWeapon('Pearl')

                        local v845, v846, v847 = pairs(game:GetService('Workspace').Logic.PointsOfInterest.TallWoodsTotems:GetChildren())

                        while true do
                            local v848

                            v847, v848 = v845(v846, v847)

                            if v847 == nil then
                                break
                            end
                            if v848.Name == 'Totem' and v848.Root:FindFirstChild('ProximityPrompt') then
                                fireproximityprompt(v848.Root.ProximityPrompt)
                            end
                        end
                    elseif game:GetService('Workspace')['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u511) then
                        local v849, v850, v851 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                        while true do
                            local v852

                            v851, v852 = v849(v850, v851)

                            if v851 == nil then
                                break
                            end
                            if v852.ClassName == 'Model' and (v852.Name == u511 and (v852:FindFirstChild('HumanoidRootPart') and v852.Humanoid.Health > 0)) then
                                repeat
                                    task.wait()
                                    getweapon()
                                    tptomon(v852.HumanoidRootPart.CFrame)

                                    v852.HumanoidRootPart.CanCollide = false

                                    v852.Humanoid:ChangeState(11)
                                    att()
                                until not farmfirefistboss or v852:FindFirstChild('Humanoid').Health <= 0
                            end
                        end
                    elseif game.Players.LocalPlayer.Quest.NPCName.Value ~= '' or not acceptquest then
                        local v853, v854, v855 = pairs(_Workspace['NPC Zones']:GetChildren())

                        while true do
                            local v856

                            v855, v856 = v853(v854, v855)

                            if v855 == nil then
                                break
                            end

                            local v857, v858, v859 = pairs(v856.NPCS:GetChildren())

                            while true do
                                local v860

                                v859, v860 = v857(v858, v859)

                                if v859 == nil then
                                    break
                                end
                                if v860.ClassName == 'Model' and v860.NPCName.Value == 'Warden' then
                                    if v860:FindFirstChild('HumanoidRootPart') and v860.Humanoid.Health > 0 then
                                        repeat
                                            task.wait()
                                            getweapon()
                                            tptomon(v860.HumanoidRootPart.CFrame)

                                            v860.HumanoidRootPart.CanCollide = false

                                            v860.Humanoid:ChangeState(11)
                                            att()
                                        until not farmfirefistboss or (v860:FindFirstChild('Humanoid').Health <= 0 or game.Players.LocalPlayer.Quest.NPCName.Value == '' and acceptquest) or game:GetService('Workspace')['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u511)
                                    else
                                        wait(0.5)
                                        TP(v860.SpawnCFrame.Value)
                                    end
                                end
                            end
                        end
                    else
                        getquest('Level 1400')
                    end
                else
                    local v861, v862, v863 = pairs(game:GetService('Workspace').Logic.Ignore.TallWoodsPearls:GetChildren())

                    while true do
                        local v864

                        v863, v864 = v861(v862, v863)

                        if v863 == nil then
                            break
                        end

                        fireproximityprompt(v864.PP)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if g4book then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if game.Players.LocalPlayer.Quest.NPCName.Value == '' and (acceptquest and game.Players.LocalPlayer.PlayerData.Experience.Level.Value >= 2000) then
                    getquest('Level 2000')
                end

                local v865, v866, v867 = pairs(_Workspace['NPC Zones']['Bubble Island'].NPCS:GetChildren())

                while true do
                    local v868

                    v867, v868 = v865(v866, v867)

                    if v867 == nil then
                        return
                    end
                    if v868.ClassName == 'Model' and v868.NPCName.Value == 'G4 Boss' then
                        if v868:FindFirstChild('HumanoidRootPart') and v868.Humanoid.Health > 0 then
                            task.wait()
                            getweapon()
                            tptomon(v868.HumanoidRootPart.CFrame)

                            v868.HumanoidRootPart.CanCollide = false

                            v868.Humanoid:ChangeState(11)
                            att()

                            if g4book and v868:FindFirstChild('Humanoid').Health > 0 and not (game.Players.LocalPlayer.Backpack:FindFirstChild('Gear 4 Book') or game.Players.LocalPlayer.Character:FindFirstChild('Gear 4 Book')) then
                            end
                        else
                            TP(v868.SpawnCFrame.Value)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if farmsea then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if _Value == 1 then
                    if _Workspace.SpecialNPC.Wizard:FindFirstChild('Mystical Wizard') and (game.Players.LocalPlayer.Backpack:FindFirstChild('HealthPotion') or game.Players.LocalPlayer.Character:FindFirstChild('HealthPotion')) then
                        print(1)
                        EquipWeapon('HealthPotion')
                        TP(CFrame.new(205.602005, 397.786987, -3082.16309, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                        fireproximityprompt(_Workspace.SpecialNPC.Wizard['Mystical Wizard'].Clicker.ProximityPrompt)
                        ClickUI(game.Players.LocalPlayer.PlayerGui.Tutorial_Gui.MainFrame.Frame.Hesitation.Accept.Button)
                    end
                    if _Workspace.SpecialNPC.Wizard:FindFirstChild('Mystical Wizard') and not (game.Players.LocalPlayer.Backpack:FindFirstChild('HealthPotion') and game.Players.LocalPlayer.Character:FindFirstChild('HealthPotion')) then
                        print(2)

                        if _Workspace.Npc_Workspace['Crew Assistant'].Makino:FindFirstChild('HumanoidRootPart') then
                            TP(CFrame.new(-2176.55029, 55.2864265, -3049.51074, 0.996829093, -6.88359165e-8, 0.0795722231, 6.98474238e-8, 1, -9.92839322e-9, -0.0795722231, 1.5454824999999999e-8, 0.996829093))

                            local _Makino = workspace.Npc_Workspace['Crew Assistant'].Makino

                            workspace.Npc_Workspace['Crew Assistant'].Makino.Buy:InvokeServer(_Makino)
                        else
                            TP(CFrame.new(-2176.55029, 55.2864265, -3049.51074, 0.996829093, -6.88359165e-8, 0.0795722231, 6.98474238e-8, 1, -9.92839322e-9, -0.0795722231, 1.5454824999999999e-8, 0.996829093))
                        end
                    end
                    if not _Workspace['NPC Zones'].Monsters.NPCS:FindFirstChild(u513) then
                    end

                    local v870, v871, v872 = pairs(_Workspace['NPC Zones'].Monsters.NPCS:GetChildren())

                    while true do
                        local v873

                        v872, v873 = v870(v871, v872)

                        if v872 == nil then
                            break
                        end
                        if v873.ClassName == 'Model' and v873.Name == u513 then
                            if v873:FindFirstChild('HumanoidRootPart') and v873.Humanoid.Health > 0 then
                                task.wait()
                                getweapon()
                                tptomon(v873.Head.CFrame)

                                v873.HumanoidRootPart.CanCollide = false

                                v873.Humanoid:ChangeState(11)
                                att()

                                if farmsea and v873:FindFirstChild('Humanoid').Health > 0 then
                                end
                            else
                                TP(v873.SpawnCFrame.Value)
                            end
                        end
                    end
                end
                if not _Workspace['NPC Zones'].Monsters.NPCS:FindFirstChild(u513) then
                    if u525 == true then
                        startfarm = true

                        wait(0.1)

                        u525 = false
                    end

                    return
                end

                local v874, v875, v876 = pairs(_Workspace['NPC Zones'].Monsters.NPCS:GetChildren())

                while true do
                    local v877

                    v876, v877 = v874(v875, v876)

                    if v876 == nil then
                    end
                    if v877.ClassName ~= 'Model' or v877.Name ~= u513 then
                    end
                    if v877:FindFirstChild('HumanoidRootPart') and v877.Humanoid.Health > 0 then
                        break
                    end

                    TP(v877.SpawnCFrame.Value)
                end
                while true do
                    task.wait()

                    if startfarm == true then
                        startfarm = false

                        wait(0.1)

                        u525 = true
                    end

                    getweapon()
                    tptomon(v877.Head.CFrame)

                    v877.HumanoidRootPart.CanCollide = false

                    v877.Humanoid:ChangeState(11)
                    att()

                    if not farmsea or v877:FindFirstChild('Humanoid').Health <= 0 then
                        if u525 == true then
                            startfarm = true

                            wait(0.1)

                            u525 = false
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        repeat
            wait()
        until game.Players.LocalPlayer.Character

        if game.Players.LocalPlayer.PlayerData.Experience.Points.Value >= 1 then
            if Combat then
                local v878 = {
                    'Combat',
                    setpoint,
                }

                game:GetService('ReplicatedStorage').Replication.ClientEvents.Stats_Event:FireServer(unpack(v878))
            end
            if Defense then
                local v879 = {
                    'Defense',
                    setpoint,
                }

                game:GetService('ReplicatedStorage').Replication.ClientEvents.Stats_Event:FireServer(unpack(v879))
            end
            if Sword then
                local v880 = {
                    'Sword',
                    setpoint,
                }

                game:GetService('ReplicatedStorage').Replication.ClientEvents.Stats_Event:FireServer(unpack(v880))
            end
            if Fruit then
                local v881 = {
                    'Fruit',
                    setpoint,
                }

                game:GetService('ReplicatedStorage').Replication.ClientEvents.Stats_Event:FireServer(unpack(v881))
            end
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if startfarm or (farmspecialboss or (farmSuperboss or (farmsea or (farmenmaboss or (g4book or (farmfirefistboss or (dragonquest or xmasboss))))))) then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                useskill()
            end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if busohaki then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if game.Players.LocalPlayer.Character.BusoEnabled.Value == false and game.Players.LocalPlayer.PlayerData.Buso.BusoLevel.Value >= 1 and game.Players.LocalPlayer.Character:WaitForChild('Humanoid') then
                    workspace[game.Players.LocalPlayer.Name].Buso_Server.Comunication:FireServer()
                end
            end)
        end
        if obshaki then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if game.Players.LocalPlayer.Character.ObservationHaki.Value == false and game.Players.LocalPlayer.PlayerData.Haki.ObservationHakiLevel.Value >= 1 then
                    game:GetService('Players').LocalPlayer.PlayerGui.ObservationHaki_Server.Comunication:FireServer()
                end
            end)
        end
    end
end)
spawn(function()
    while wait(0.5) do
        if buyselectedFruit then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if selectedFruit ~= '' then
                    local v882, v883, v884 = pairs(selectedFruit)

                    while true do
                        local v885

                        v884, v885 = v882(v883, v884)

                        if v884 == nil then
                            break
                        end

                        local v886, v887, v888 = pairs(game.Players.LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder['Robux Market']:GetChildren())

                        while true do
                            local v889

                            v888, v889 = v886(v887, v888)

                            if v888 == nil then
                                break
                            end
                            if v889.Name == v885 then
                                if v889.Holder.FruitInfo.Actionbuttons.MoneySpinButton.TitleLabel.Title.Text == 'Not In Stock!' then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(v889.Name) and (game.Players.LocalPlayer.PlayerGui.Inventory.MainFrame.Main.Holder.Pages.FruitsPage.Count.Text ~= '3/3' and game.Players.LocalPlayer.PlayerGui.Inventory.MainFrame.Main.Holder.Pages.FruitsPage.Count.Text ~= '10/10') then
                                        EquipWeapon(v889.Name)
                                    elseif game.Players.LocalPlayer.Character:FindFirstChild(v889.Name) then
                                        local v890 = {
                                            game.Players.LocalPlayer.Character[v889.Name],
                                        }

                                        game:GetService('ReplicatedStorage').Replication.ClientEvents.CollectFruit:FireServer(unpack(v890))
                                    end
                                else
                                    ClickUI(v889.Holder.FruitInfo.Actionbuttons.MoneySpinButton)
                                    ClickUI(game.Players.LocalPlayer.PlayerGui.FruitShop.MainFrame.FruitShop.Main.PageHolder.Prompt.Yes)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if dragonquest then
            pcall(function()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character

                if game.Players.LocalPlayer.Backpack:FindFirstChild('Dragon Orb') or game.Players.LocalPlayer.Character:FindFirstChild('Dragon Orb') then
                    EquipWeapon('Dragon Orb')

                    if (game:GetService('Workspace').Logic.PointsOfInterest.DragonTotem.Root.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 10 then
                        TP(game:GetService('Workspace').Logic.PointsOfInterest.DragonTotem.Root.CFrame)
                    else
                        game:GetService('VirtualInputManager'):SendKeyEvent(true, 101, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        game:GetService('VirtualInputManager'):SendKeyEvent(false, 101, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end
                if _Workspace['NPC Zones'].SpecialBosses.NPCS:FindFirstChild(u527) then
                    local v891, v892, v893 = pairs(_Workspace['NPC Zones'].SpecialBosses.NPCS:GetChildren())

                    while true do
                        local v894

                        v893, v894 = v891(v892, v893)

                        if v893 == nil then
                            break
                        end
                        if v894.ClassName == 'Model' and v894.Name == u527 then
                            if v894:FindFirstChild('HumanoidRootPart') and v894.Humanoid.Health > 0 then
                                task.wait()
                                getweapon()
                                tptomon(v894.HumanoidRootPart.CFrame)

                                v894.HumanoidRootPart.CanCollide = false

                                v894.Humanoid:ChangeState(11)
                                att()

                                if dragonquest and v894:FindFirstChild('Humanoid').Health > 0 then
                                end
                            else
                                wait(0.2)
                                TP(v894.SpawnCFrame.Value)
                            end
                        end
                    end
                end
                if game.Players.LocalPlayer.Quest.NPCName.Value == '' and (acceptquest and game.Players.LocalPlayer.PlayerData.Experience.Level.Value >= 2950) then
                    getquest('Level 2950')
                end

                local v895, v896, v897 = pairs(_Workspace['NPC Zones']['Dragon Island'].NPCS:GetChildren())

                while true do
                    local v898

                    v897, v898 = v895(v896, v897)

                    if v897 == nil then
                        return
                    end
                    if v898.ClassName == 'Model' and v898.NPCName.Value == 'MaceV2 Boss' then
                        if v898:FindFirstChild('HumanoidRootPart') and v898.Humanoid.Health > 0 then
                            task.wait()
                            getweapon()
                            tptomon(v898.HumanoidRootPart.CFrame)

                            v898.HumanoidRootPart.CanCollide = false

                            v898.Humanoid:ChangeState(11)
                            att()

                            if dragonquest and v898:FindFirstChild('Humanoid').Health > 0 then
                            end
                        else
                            wait(0.2)
                            TP(v898.SpawnCFrame.Value)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if autostorecum then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild('Drums of Liberation') then
                    EquipWeapon('Drums of Liberation')
                    game:GetService('VirtualUser'):CaptureController()
                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                elseif game.Players.LocalPlayer.Character:FindFirstChild('Drums of Liberation') then
                    local v899, v900, v901 = pairs(game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Tutorial_Gui').MainFrame.Decision:GetChildren())

                    while true do
                        local v902

                        v901, v902 = v899(v900, v901)

                        if v901 == nil then
                            break
                        end
                        if v902.Name == 'Decision' and v902.AnswerWrapper.Answer.Text == 'Store' then
                            ClickUI(v902.Button)
                            wait(1)

                            if disibledrums then
                                autostorecum = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if gotg4book then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild('Gear 4 Book') then
                    EquipWeapon('Gear 4 Book')
                    game:GetService('VirtualUser'):CaptureController()
                    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
                elseif game.Players.LocalPlayer.Character:FindFirstChild('Gear 4 Book') then
                    local v903, v904, v905 = pairs(game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Tutorial_Gui').MainFrame.Decision:GetChildren())

                    while true do
                        local v906

                        v905, v906 = v903(v904, v905)

                        if v905 == nil then
                            break
                        end
                        if v906.Name == 'Decision' and v906.AnswerWrapper.Answer.Text == 'Store' then
                            ClickUI(v906.Button)
                            wait(1)

                            if disiblebook then
                                gotg4book = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if autotrans then
            pcall(function()
                if game.Players.LocalPlayer.PlayerData.CurrentSuperPower.Value == 'Gum' then
                    if selectedform ~= 'Gear 2' then
                        if selectedform ~= 'Gear 4' then
                            if selectedform == 'Gear 5' and not game.Players.LocalPlayer.Character:FindFirstChild('Zoan') then
                                EquipWeapon('Gum')
                                game:GetService('Players').LocalPlayer.PlayerGui.FruitPowers.Gum.Events.TransformG5:FireServer()
                                wait(4)
                            end
                        elseif not game.Players.LocalPlayer.Character:FindFirstChild('Zoan') then
                            EquipWeapon('Gum')
                            game:GetService('Players').LocalPlayer.PlayerGui.FruitPowers.Gum.Events.TransformG4:FireServer()
                            wait(4)
                        end
                    elseif not game.Players.LocalPlayer.Character:FindFirstChild('SpeedBuff') then
                        EquipWeapon('Gum')
                        game:GetService('Players').LocalPlayer.PlayerGui.FruitPowers.Gum.Events:FindFirstChild('Gear 2'):FireServer()
                        wait(4)
                    end
                end
            end)
        end
    end
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/DookDekDEE/Hyper/refs/heads/main/close.lua'))()
