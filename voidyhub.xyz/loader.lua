-- Load Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
    Name = "Blox Fruits | Blossom Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "BlossomHub",
    IntroEnabled = true,
    IntroText = "Welcome to Blossom Hub"
})

-- Variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Utility Functions
function Notify(title, msg)
    OrionLib:MakeNotification({
        Name = title,
        Content = msg,
        Time = 5
    })
end

-- Tabs
local FarmTab = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FruitTab = Window:MakeTab({Name = "Fruits", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SeaTab = Window:MakeTab({Name = "Sea Events", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local EventTab = Window:MakeTab({Name = "Events", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TeleportTab = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local UtilityTab = Window:MakeTab({Name = "Utility", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "ESP", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Auto Farm
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
        while getgenv().AutoFarm do
            task.wait()
            -- Auto farm logic here
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto Stats",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStats = Value
        while getgenv().AutoStats do
            task.wait()
            -- Auto stats logic here
        end
    end
})

-- Combat
CombatTab:AddToggle({
    Name = "Aimbot (Nearest Player/Mob)",
    Default = false,
    Callback = function(Value)
        getgenv().Aimbot = Value
        -- Aimbot logic
    end
})

CombatTab:AddToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(Value)
        getgenv().KillAura = Value
        -- Kill aura logic
    end
})

CombatTab:AddToggle({
    Name = "Fast Attack",
    Default = false,
    Callback = function(Value)
        getgenv().FastAttack = Value
        -- Fast attack logic
    end
})

CombatTab:AddButton({
    Name = "OP Dual Flintlock",
    Callback = function()
        -- Dual Flintlock Logic
        Notify("Blossom Hub", "OP Dual Flintlock Activated")
    end
})

-- Fruit
FruitTab:AddToggle({
    Name = "Auto Store Fruits",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStoreFruits = Value
    end
})

FruitTab:AddToggle({
    Name = "Auto Grab Dropped Fruits",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGrabFruits = Value
    end
})

FruitTab:AddButton({
    Name = "Start Fruit Sniper",
    Callback = function()
        -- Server hop + fruit find logic
        Notify("Blossom Hub", "Fruit Sniper Activated")
    end
})

-- Sea Events
SeaTab:AddToggle({Name = "Auto Sea Beast", Default = false, Callback = function(v) getgenv().SeaBeast = v end})
SeaTab:AddToggle({Name = "Auto Terrorshark", Default = false, Callback = function(v) getgenv().Terrorshark = v end})
SeaTab:AddToggle({Name = "Auto Rumbling Waters", Default = false, Callback = function(v) getgenv().Rumbling = v end})
SeaTab:AddToggle({Name = "Auto Shark & Piranha", Default = false, Callback = function(v) getgenv().SeaMobs = v end})

-- Events
EventTab:AddToggle({Name = "Auto Find Mirage / Kitsune / Frozen / Prehistoric", Default = false, Callback = function(v) getgenv().AutoFindIslands = v end})
EventTab:AddToggle({Name = "Auto Complete Blue Gear Puzzle", Default = false, Callback = function(v) getgenv().BlueGear = v end})
EventTab:AddToggle({Name = "Auto Complete CDK Puzzle", Default = false, Callback = function(v) getgenv().CDK = v end})
EventTab:AddToggle({Name = "Auto Get Event Items", Default = false, Callback = function(v) getgenv().EventItems = v end})
EventTab:AddToggle({Name = "Auto Kill Event Bosses", Default = false, Callback = function(v) getgenv().EventBosses = v end})

-- Teleport
TeleportTab:AddButton({
    Name = "Teleport to Starter Island",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260, 7, 274)
    end
})

-- Utility
UtilityTab:AddToggle({Name = "Full Bright", Default = false, Callback = function(v) game:GetService("Lighting").Brightness = v and 3 or 1 end})
UtilityTab:AddToggle({Name = "Always Day", Default = false, Callback = function(v) game:GetService("Lighting").ClockTime = v and 14 or 0 end})
UtilityTab:AddToggle({Name = "FPS Boost", Default = false, Callback = function(v) -- FPS boost logic here end})
UtilityTab:AddButton({Name = "Server Hop", Callback = function() -- Server Hop Logic end})

-- Movement
UtilityTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

UtilityTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- ESP
ESPTab:AddToggle({Name = "ESP Players", Default = false, Callback = function(v) getgenv().ESPPlayers = v end})
ESPTab:AddToggle({Name = "ESP Chests", Default = false, Callback = function(v) getgenv().ESPChests = v end})
ESPTab:AddToggle({Name = "ESP Fruits", Default = false, Callback = function(v) getgenv().ESPFruits = v end})
ESPTab:AddToggle({Name = "ESP Real Fruits (Third Sea)", Default = false, Callback = function(v) getgenv().ESPRealFruits = v end})
ESPTab:AddToggle({Name = "Show Stud Distance", Default = false, Callback = function(v) getgenv().ESPStud = v end})
