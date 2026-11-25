
--========================================================
-- XT HUB | ANIME ADVENTURES
-- LOADER v1.3.1 - UI REPLICA
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Old = PlayerGui:FindFirstChild("XTKeyLoader")
if Old then Old:Destroy() end

local GUI = Instance.new("ScreenGui")
GUI.Name = "XTKeyLoader"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.DisplayOrder = 999
GUI.Parent = PlayerGui

-- Background overlay
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.38
Overlay.BorderSizePixel = 0
Overlay.Parent = GUI

-- Main window
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(936, 638)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(12, 10, 20)
Main.BorderSizePixel = 0
Main.Parent = Overlay

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 27)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(105, 55, 105)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

local UIScale = Instance.new("UIScale")
UIScale.Parent = Main

local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end

    local viewport = camera.ViewportSize
    UIScale.Scale = math.clamp(
        math.min(viewport.X / 1000, viewport.Y / 720),
        0.48,
        1
    )
end

UpdateScale()

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(UpdateScale)

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 98)
Header.BackgroundColor3 = Color3.fromRGB(17, 14, 26)
Header.BorderSizePixel = 0
Header.Parent = Main

Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 25)

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 25)
HeaderCover.Position = UDim2.new(0, 0, 1, -25)
HeaderCover.BackgroundColor3 = Header.BackgroundColor3
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(105, 65)
Logo.Position = UDim2.fromOffset(35, 14)
Logo.BackgroundTransparency = 1
Logo.Text = "XT"
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 57
Logo.TextColor3 = Color3.fromRGB(245, 245, 255)
Logo.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(450, 35)
Title.Position = UDim2.fromOffset(155, 22)
Title.BackgroundTransparency = 1
Title.Text = "Anime Adventures"
Title.TextColor3 = Color3.fromRGB(245, 242, 250)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 23
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Version = Instance.new("TextLabel")
Version.Size = UDim2.fromOffset(300, 25)
Version.Position = UDim2.fromOffset(155, 56)
Version.BackgroundTransparency = 1
Version.Text = "Loader v1.3.1"
Version.TextColor3 = Color3.fromRGB(145, 135, 165)
Version.Font = Enum.Font.Gotham
Version.TextSize = 16
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = Header

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 2)
HeaderLine.Position = UDim2.new(0, 0, 1, -1)
HeaderLine.BackgroundColor3 = Color3.fromRGB(120, 65, 130)
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = Header

-- Close button
local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(45, 45)
Close.Position = UDim2.new(1, -65, 0, 26)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(185, 180, 195)
Close.Font = Enum.Font.Gotham
Close.TextSize = 34
Close.Parent = Header

Close.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)

-- Step rail
local Steps = {
    "Get a free key",
    "Open the link in your browser",
    "Press START, watch ads, GET A NEW KEY",
    "Paste the key here"
}

local StepY = {150, 265, 333, 402}

local Rail = Instance.new("Frame")
Rail.Size = UDim2.fromOffset(4, 275)
Rail.Position = UDim2.fromOffset(60, 171)
Rail.BackgroundColor3 = Color3.fromRGB(48, 43, 61)
Rail.BorderSizePixel = 0
Rail.Parent = Main

for i, text in ipairs(Steps) do
    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.fromOffset(48, 48)
    Circle.Position = UDim2.fromOffset(38, StepY[i] - 25)
    Circle.BackgroundColor3 = i == 1
        and Color3.fromRGB(204, 75, 177)
        or Color3.fromRGB(39, 38, 53)
    Circle.BorderSizePixel = 0
    Circle.Parent = Main
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)

    if i == 1 then
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 91, 174)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(135, 88, 245))
        })
        Gradient.Parent = Circle
    end

    local Number = Instance.new("TextLabel")
    Number.Size = UDim2.fromScale(1, 1)
    Number.BackgroundTransparency = 1
    Number.Text = tostring(i)
    Number.TextColor3 = i == 1
        and Color3.new(1, 1, 1)
        or Color3.fromRGB(130, 125, 150)
    Number.Font = Enum.Font.GothamBold
    Number.TextSize = 17
    Number.Parent = Circle

    local StepLabel = Instance.new("TextLabel")
    StepLabel.Size = UDim2.fromOffset(740, 35)
    StepLabel.Position = UDim2.fromOffset(105, StepY[i] - 17)
    StepLabel.BackgroundTransparency = 1
    StepLabel.Text = text
    StepLabel.TextColor3 = i == 1
        and Color3.fromRGB(245, 240, 250)
        or Color3.fromRGB(165, 160, 180)
    StepLabel.Font = Enum.Font.GothamBold
    StepLabel.TextSize = i == 3 and 17 or 19
    StepLabel.TextXAlignment = Enum.TextXAlignment.Left
    StepLabel.Parent = Main
end

-- Gradient button helper
local function CreateGradientButton(name, text, position, size)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = size
    Button.Position = position
    Button.BackgroundColor3 = Color3.fromRGB(35, 30, 49)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Main

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 17)

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(195, 90, 170)
    Stroke.Thickness = 1.7
    Stroke.Parent = Button

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 87, 165)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(113, 78, 220))
    })
    Gradient.Rotation = 0
    Gradient.Parent = Stroke

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.fromScale(1, 1)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(245, 240, 250)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 17
    Label.Parent = Button

    return Button, Label
end

-- Linkvertise button
local LinkButton = CreateGradientButton(
    "Linkvertise",
    "▢   Linkvertise",
    UDim2.fromOffset(105, 175),
    UDim2.fromOffset(390, 68)
)

-- Lootlabs button
local LootButton = CreateGradientButton(
    "Lootlabs",
    "▢   Lootlabs",
    UDim2.fromOffset(515, 175),
    UDim2.fromOffset(390, 68)
)

-- Key input
local Input = Instance.new("TextBox")
Input.Name = "KeyInput"
Input.Size = UDim2.fromOffset(525, 73)
Input.Position = UDim2.fromOffset(105, 445)
Input.BackgroundColor3 = Color3.fromRGB(29, 28, 40)
Input.BorderSizePixel = 0
Input.PlaceholderText = "   ⚿   Paste your key"
Input.PlaceholderColor3 = Color3.fromRGB(125, 120, 145)
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(245, 240, 255)
Input.Font = Enum.Font.Gotham
Input.TextSize = 17
Input.ClearTextOnFocus = false
Input.TextXAlignment = Enum.TextXAlignment.Left
Input.Parent = Main
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 17)

-- Load with key
local LoadButton, LoadLabel = CreateGradientButton(
    "LoadWithKey",
    "Load with key",
    UDim2.fromOffset(650, 445),
    UDim2.fromOffset(255, 73)
)

LoadLabel.TextSize = 18

-- Lifetime key button
local Lifetime = Instance.new("TextButton")
Lifetime.Name = "LifetimeKey"
Lifetime.Size = UDim2.fromOffset(800, 62)
Lifetime.Position = UDim2.fromOffset(105, 537)
Lifetime.BackgroundColor3 = Color3.fromRGB(29, 28, 40)
Lifetime.BorderSizePixel = 0
Lifetime.Text = "🛒   Don't want ads?  Buy Lifetime key"
Lifetime.TextColor3 = Color3.fromRGB(190, 185, 205)
Lifetime.Font = Enum.Font.Gotham
Lifetime.TextSize = 17
Lifetime.Parent = Main
Instance.new("UICorner", Lifetime).CornerRadius = UDim.new(0, 17)

-- Button hover/tap animation
local function AnimateButton(button)
    local original = button.BackgroundColor3

    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(48, 38, 65)}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = original}
        ):Play()
    end)
end

AnimateButton(LinkButton)
AnimateButton(LootButton)
AnimateButton(LoadButton)
AnimateButton(Lifetime)

-- These actions need your real key-system URLs
LinkButton.MouseButton1Click:Connect(function()
    warn("Linkvertise URL has not been configured.")
end)

LootButton.MouseButton1Click:Connect(function()
    warn("Lootlabs URL has not been configured.")
end)

Lifetime.MouseButton1Click:Connect(function()
    warn("Lifetime key purchase URL has not been configured.")
end)

LoadButton.MouseButton1Click:Connect(function()
    if Input.Text:gsub("%s+", "") == "" then
        LoadLabel.Text = "Please enter your key"
        task.wait(1.5)
        LoadLabel.Text = "Load with key"
        return
    end

    -- Real key validation must be connected here.
    LoadLabel.Text = "Key validation not configured"
    task.wait(2)
    LoadLabel.Text = "Load with key"
end)

print("XT HUB Anime Adventures Loader v1.3.1 UI loaded")
