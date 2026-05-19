--[[
    =============================================
    infhub v1.3 - Made by justnormalskin
    =============================================
    
    SINGLE LOADSTRING ENTRY POINT
    Execute this in your executor:
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURUSERNAME/infhub/main/loader.lua"))()
    
    Or use the short version in infhub.lua
]]

-- ============================================================
-- CONFIG: Change this to your GitHub username
-- ============================================================
local GITHUB_USER = "YOURUSERNAME"
local REPO = "infhub"
local BRANCH = "main"

local BASE_URL = "https://raw.githubusercontent.com/" .. GITHUB_USER .. "/" .. REPO .. "/" .. BRANCH .. "/"

local function loadModule(name)
    local url = BASE_URL .. name .. ".lua"
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("[infhub] Failed to load module: " .. name .. " | " .. tostring(result))
        return nil
    end
    return result
end

-- ============================================================
-- LOAD CORE
-- ============================================================
local Core = loadModule("core")
if not Core then
    error("[infhub] Core module failed to load. Check your GitHub URL.")
    return
end

-- ============================================================
-- LOAD UI LIBRARY
-- ============================================================
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cypherdh/VanisUILIB/main/.gitignore'))()
local Window = library:CreateWindow("infhub", "v1.3 | by justnormalskin", 10044538000)

-- ============================================================
-- LOAD FEATURE MODULES
-- ============================================================
local modules = {"movement", "visual", "character", "protection", "mobile"}

for _, name in ipairs(modules) do
    local init = loadModule(name)
    if init and type(init) == "function" then
        local ok, err = pcall(init, Core, Window)
        if not ok then
            warn("[infhub] Error initializing " .. name .. ": " .. tostring(err))
        end
    end
end

-- ============================================================
-- CREDITS TAB
-- ============================================================
local CreditsTab = Window:CreateTab("Credits")
local CreditsPage = CreditsTab:CreateFrame("Info")
CreditsPage:CreateLabel("infhub v1.3 - Modular")
CreditsPage:CreateLabel("Made by justnormalskin")
CreditsPage:CreateLabel("PC + Mobile + Tablet")
CreditsPage:CreateLabel("Anti-Cheat | Anti-Fling")
CreditsPage:CreateLabel("UI: Vanis UI LIB")

-- ============================================================
-- AUTO-REAPPLY ON RESPAWN
-- ============================================================
Core.LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    local hum = newChar:WaitForChild("Humanoid", 5)
    local hrp = newChar:WaitForChild("HumanoidRootPart", 5)
    if not hum then return end

    -- Re-apply speed/jump
    if Core.SpeedValue ~= Core.DefaultWalkSpeed then
        hum.WalkSpeed = Core.SpeedValue
    end
    if Core.JumpValue ~= Core.DefaultJumpPower then
        hum.JumpPower = Core.JumpValue
        hum.UseJumpPower = true
    end

    -- Re-apply god mode
    if Core.States.GodMode then
        Core:Connect("God", hum.HealthChanged:Connect(function()
            if Core.States.GodMode and hum then
                hum.Health = hum.MaxHealth
            end
        end))
    end

    -- Re-apply noclip
    if Core.States.Noclip then
        Core:Connect("Noclip", Core.RunService.Stepped:Connect(function()
            if not Core.States.Noclip then return end
            local c = Core:GetCharacter()
            if not c then return end
            for _, part in pairs(c:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end))
    end

    -- Re-apply glow
    if Core.States.GlowOutline then
        local hl = Instance.new("Highlight")
        hl.Name = "InfHubGlow"
        hl.FillTransparency = 0.7
        hl.OutlineTransparency = 0
        hl.Parent = newChar
    end
end)
