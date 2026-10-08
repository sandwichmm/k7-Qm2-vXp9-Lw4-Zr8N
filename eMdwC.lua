return(function(4Owc9, ...)
local 38u6ck = {"fMX4h1";"J1t8Xf0AYANg";"OedCsJamFr7YPHL";"JQ5nFeYK";"quqHlTt3CCs";"tO2m0BPzx6M9t";"4f4m4mxMa";"iTafVfAx47p8vq";"9r22fHZ";"Sv7p5xCEVXrPr0Wt";"1PsbxnS";"ekh9cY1TwfIn"}
local KCPB6jHT = function(...)
local Players = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local UserInputService = game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local Workspace = game:GetService(loadstring(base64decode("V29ya3NwYWNl"))())
local LocalPlayer = Players.LocalPlayer

local env = (getgenv and getgenv()) or _G
if env.__LarpwareAimCleanup then pcall(env.__LarpwareAimCleanup) end

local settings = {
    enabled = true, teamCheck = true, wallCheck = true, showFov = true,
    fov = 150, smooth = 4, maxDistance = 1000, part = loadstring(base64decode("SGVhZA=="))(),
}
local FOV_VALUES = { 50, 100, 150, 250, 400, 600 }
local SMOOTH_VALUES = { 1, 2, 4, 6, 10, 16 }     
local DISTANCE_VALUES = { 250, 500, 1000, 2000, 5000 }
local PART_VALUES = { loadstring(base64decode("SGVhZA=="))(), loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() }
local MENU_KEY = Enum.KeyCode.RightShift
local AIM_BUTTON = Enum.UserInputType.MouseButton2

local connections = {}
local THEME = {
    back = Color3.fromRGB(28, 28, 28), outline = Color3.fromRGB(60, 60, 60),
    accent = Color3.fromRGB(0, 85, 255), text = Color3.new(1, 1, 1), dim = Color3.fromRGB(150, 150, 150),
}

local gui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
gui.Name = loadstring(base64decode("TGFycHdhcmVBaW0="))()
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 2
gui.Parent = (gethui and gethui()) or game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())

local fovCircle = Instance.new(loadstring(base64decode("RnJhbWU="))())
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.BackgroundTransparency = 1
fovCircle.BorderSizePixel = 0
fovCircle.Parent = gui
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), fovCircle).CornerRadius = UDim.new(1, 0)
local fovStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), fovCircle)
fovStroke.Color = THEME.accent
fovStroke.Thickness = 1

local window = Instance.new(loadstring(base64decode("RnJhbWU="))())
window.Position = UDim2.fromOffset(60, 60)
window.Size = UDim2.fromOffset(240, 0)
window.AutomaticSize = Enum.AutomaticSize.Y
window.BackgroundColor3 = THEME.back
window.BorderColor3 = Color3.new(0, 0, 0)
window.Active = true
window.Parent = gui

local accent = Instance.new(loadstring(base64decode("RnJhbWU="))())
accent.Size = UDim2.new(1, 0, 0, 2)
accent.BackgroundColor3 = THEME.accent
accent.BorderSizePixel = 0
accent.Parent = window

local title = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
title.Size = UDim2.new(1, 0, 0, 24)
title.Position = UDim2.fromOffset(0, 2)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Code
title.Text = loadstring(base64decode("ICBsYXJwd2FyZSAtIGFpbWJvdA=="))()
title.TextSize = 15
title.TextColor3 = THEME.text
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = window

local list = Instance.new(loadstring(base64decode("RnJhbWU="))())
list.Position = UDim2.fromOffset(8, 30)
list.Size = UDim2.new(1, -16, 0, 0)
list.AutomaticSize = Enum.AutomaticSize.Y
list.BackgroundTransparency = 1
list.Parent = window
local layout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), list)
layout.Padding = UDim.new(0, 4)
local pad = Instance.new(loadstring(base64decode("VUlQYWRkaW5n"))(), window)
pad.PaddingBottom = UDim.new(0, 8)

local function rowButton(text)
    local button = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    button.Size = UDim2.new(1, 0, 0, 20)
    button.AutoButtonColor = false
    button.BackgroundColor3 = THEME.back
    button.BorderColor3 = THEME.outline
    button.Font = Enum.Font.Code
    button.TextSize = 14
    button.TextColor3 = THEME.text
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Text = text
    button.Parent = list
    return button
end

local function addToggle(text, key)
    local button = rowButton(loadstring(base64decode(""))())
    local function refresh()
        button.Text = (settings[key] and loadstring(base64decode("ICBbeF0g"))() or loadstring(base64decode("ICBbIF0g"))()) .. text
        button.BackgroundColor3 = settings[key] and Color3.fromRGB(20, 40, 80) or THEME.back
    end
    button.MouseButton1Click:Connect(function() settings[key] = not settings[key]; refresh() end)
    refresh()
end

local function addCycle(text, key, values, suffix)
    local button = rowButton(loadstring(base64decode(""))())
    local function index()
        for TyCBMSf3, v in ipairs(values) do if v == settings[key] then return TyCBMSf3 end end
        return 1
    end
    local function refresh() button.Text = loadstring(base64decode("ICA="))() .. text .. loadstring(base64decode("OiA="))() .. tostring(settings[key]) .. (suffix or loadstring(base64decode(""))()) end
    button.MouseButton1Click:Connect(function() settings[key] = values[index() % #values + 1]; refresh() end)
    button.MouseButton2Click:Connect(function() settings[key] = values[(index() - 2) % #values + 1]; refresh() end)
    refresh()
end

addToggle(loadstring(base64decode("RW5hYmxlZA=="))(), loadstring(base64decode("ZW5hYmxlZA=="))())
addToggle(loadstring(base64decode("VGVhbSBDaGVjaw=="))(), loadstring(base64decode("dGVhbUNoZWNr"))())
addToggle(loadstring(base64decode("V2FsbCBDaGVjaw=="))(), loadstring(base64decode("d2FsbENoZWNr"))())
addToggle(loadstring(base64decode("U2hvdyBGT1Y="))(), loadstring(base64decode("c2hvd0Zvdg=="))())
addCycle(loadstring(base64decode("Rk9W"))(), loadstring(base64decode("Zm92"))(), FOV_VALUES, loadstring(base64decode("cHg="))())
addCycle(loadstring(base64decode("U21vb3RoaW5n"))(), loadstring(base64decode("c21vb3Ro"))(), SMOOTH_VALUES)
addCycle(loadstring(base64decode("TWF4IERpc3RhbmNl"))(), loadstring(base64decode("bWF4RGlzdGFuY2U="))(), DISTANCE_VALUES)
addCycle(loadstring(base64decode("VGFyZ2V0"))(), loadstring(base64decode("cGFydA=="))(), PART_VALUES)

local hint = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
hint.Size = UDim2.new(1, 0, 0, 14)
hint.BackgroundTransparency = 1
hint.Font = Enum.Font.Code
hint.TextSize = 12
hint.TextColor3 = THEME.dim
hint.TextXAlignment = Enum.TextXAlignment.Left
hint.Text = loadstring(base64decode("ICBob2xkIHJpZ2h0IG1vdXNlIHRvIGFpbQ=="))()
hint.Parent = list

local dragging, dragStart, startPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, window.Position
    end
end)
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        window.Position = UDim2.fromOffset(startPos.X.Offset + delta.X, startPos.Y.Offset + delta.Y)
    end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end))
table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == MENU_KEY then window.Visible = not window.Visible end
end))

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.IgnoreWater = true

local function visible(camera, part, character)
    rayParams.FilterDescendantsInstances = { LocalPlayer.Character }
    local origin = camera.CFrame.Position
    local hit = Workspace:Raycast(origin, part.Position - origin, rayParams)
    return hit == nil or hit.Instance:IsDescendantOf(character)
end

local function closestTarget(camera)
    local mouse = UserInputService:GetMouseLocation()
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    local best, bestDistance = nil, settings.fov
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        local part = character and (character:FindFirstChild(settings.part) or character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()))
        local skip = player == LocalPlayer or not humanoid or humanoid.Health <= 0 or not part
        if not skip and settings.teamCheck and player.Team ~= nil and player.Team == LocalPlayer.Team then skip = true end
        if not skip and myRoot and (part.Position - myRoot.Position).Magnitude > settings.maxDistance then skip = true end
        if not skip then
            local point, onScreen = camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local distance = (Vector2.new(point.X, point.Y) - mouse).Magnitude
                if distance < bestDistance and (not settings.wallCheck or visible(camera, part, character)) then
                    best, bestDistance = part, distance
                end
            end
        end
    end
    return best
end

local STEP_NAME = loadstring(base64decode("TGFycHdhcmVBaW0="))()
RunService:BindToRenderStep(STEP_NAME, Enum.RenderPriority.Camera.Value + 1, function()
    local camera = Workspace.CurrentCamera
    if not camera then return end

    local mouse = UserInputService:GetMouseLocation()
    fovCircle.Visible = settings.enabled and settings.showFov
    fovCircle.Position = UDim2.fromOffset(mouse.X, mouse.Y)
    fovCircle.Size = UDim2.fromOffset(settings.fov * 2, settings.fov * 2)

    if not settings.enabled or not UserInputService:IsMouseButtonPressed(AIM_BUTTON) then return end
    local target = closestTarget(camera)
    if not target then return end
    local goal = CFrame.lookAt(camera.CFrame.Position, target.Position)
    camera.CFrame = camera.CFrame:Lerp(goal, 1 / settings.smooth)
end)

local function cleanup()
    pcall(function() RunService:UnbindFromRenderStep(STEP_NAME) end)
    for _, connection in ipairs(connections) do connection:Disconnect() end
    gui:Destroy()
    env.__LarpwareAimCleanup = nil
end
env.__LarpwareAimCleanup = cleanup
end
qRe4ySTA(T754p)
end)(...)
