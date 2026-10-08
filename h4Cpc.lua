

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local parentGui = (gethui and gethui()) or game:GetService("CoreGui")

local menu = Instance.new("ScreenGui")
menu.Name = "LarpwareMenu"
menu.ResetOnSpawn = false
menu.DisplayOrder = 2
menu.Parent = parentGui

local window = Instance.new("Frame")
window.Size = UDim2.fromOffset(560, 430)
window.Position = UDim2.fromOffset(60, 60)
window.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
window.BorderColor3 = Color3.new(0, 0, 0)
window.Active = true
window.Parent = menu

local accent = Instance.new("Frame")
accent.Size = UDim2.new(1, 0, 0, 2)
accent.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
accent.BorderSizePixel = 0
accent.Parent = window

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 24)
title.Position = UDim2.fromOffset(0, 2)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Code
title.Text = "  larpware - combat surf"
title.TextSize = 15
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = window

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1, -20, 1, -40)
body.Position = UDim2.fromOffset(10, 32)
body.BackgroundTransparency = 1
body.Font = Enum.Font.Code
body.Text = "nothing here yet"
body.TextSize = 14
body.TextColor3 = Color3.fromRGB(150, 150, 150)
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Parent = window

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        window.Visible = not window.Visible
    end
end)
