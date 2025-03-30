--// Roblox FPS Boost & Optimization Script

local function optimizeGame() -- Remove unnecessary parts to reduce lag for _, obj in pairs(workspace:GetDescendants()) do if obj:IsA('ParticleEmitter') or obj:IsA('Trail') or obj:IsA('Beam') or obj:IsA('Smoke') or obj:IsA('Sparkles') then obj.Enabled = false elseif obj:IsA('ForceField') or obj:IsA('Explosion') or obj:IsA('Fire') then obj:Destroy() end end

-- Reduce graphics settings for better performance
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
settings().Network.IncomingReplicationLag = 0

-- Optimize lighting
local Lighting = game:GetService('Lighting')
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e10
Lighting.Brightness = 3
Lighting.ClockTime = 12

-- Anti-lag measures
game:GetService('ContentProvider'):SetThreadPool(4)

-- Prevent Hot Phone (Improving Performance)
game:GetService('RunService'):Set3dRenderingEnabled(false)

-- Smooth Gameplay Enhancements
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

if LocalPlayer then
    LocalPlayer.ReplicationFocus = workspace
end

-- FPS Unlock
setfpscap(240)

print('FPS Boost & Optimization Script Loaded Successfully!')

end

-- Execute the optimization function optimizeGame()
