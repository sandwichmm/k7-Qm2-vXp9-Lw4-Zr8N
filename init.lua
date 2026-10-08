
local BASE = "https://raw.githubusercontent.com/sandwichmm/k7-Qm2-vXp9-Lw4-Zr8N/main/"


local SCRIPTS = {
    [4991214437] = "Mg8F0.lua",   
    [16167223198] = "h4Cpc.lua",      
    [286090429] = "Xp9Lw.lua",
}
local FALLBACK = "eMdwC.lua"  

local file = SCRIPTS[game.PlaceId] or FALLBACK
print("[larpware] PlaceId " .. tostring(game.PlaceId) .. " -> " .. file)

local ok, source = pcall(game.HttpGet, game, BASE .. file)
if not ok or type(source) ~= "string" or #source == 0 then
    warn("[larpware] couldn't download " .. file .. ": " .. tostring(source))
    return
end

local chunk, compileError = loadstring(source)
if not chunk then
    warn("[larpware] couldn't load " .. file .. ": " .. tostring(compileError))
    return
end

chunk()
