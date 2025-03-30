-- Executor Compatibility Check local supportedExecutors = {"Trigon", "KRNL", "Codex", "Delta"} local executor = identifyexecutor and identifyexecutor() or "Unknown"

local isSupported = false for _, v in ipairs(supportedExecutors) do if string.find(string.lower(executor), string.lower(v)) then isSupported = true break end end

if not isSupported then warn("This script is not compatible with your executor.") return end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Voidy", HidePremium = false, SaveConfig = true, ConfigFolder = "Blox Fruit"})

-- Tabs local FarmTab = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local QuestTab = Window:MakeTab({Name = "Quest", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local TeleportTab = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local FruitRaidTab = Window:MakeTab({Name = "Fruit & Raid", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local IslandsTab = Window:MakeTab({Name = "Islands", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local SeaEventsTab = Window:MakeTab({Name = "Sea Events", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local ShopTab = Window:MakeTab({Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local PvPTab = Window:MakeTab({Name = "PvP", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local RaceTab = Window:MakeTab({Name = "Race", Icon = "rbxassetid://4483345998", PremiumOnly = false}) local MiscTab = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- GUI Handling local UIS = game:GetService("UserInputService") local isDragging, dragInput, dragStart, startPos

local function update(input) local delta = input.Position - dragStart Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end

Main.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then isDragging = true dragStart = input.Position startPos = Main.Position input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then isDragging = false end end) end end)

Main.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)

dragInput.Changed:Connect(function() if isDragging then update(dragInput) end end)

-- Hide/Show Button local toggle = true UIS.InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.RightShift then toggle = not toggle Main.Visible = toggle end end)

OrionLib:Init()

-- Compatibility Message OrionLib:MakeNotification({ Name = "Executor Compatibility", Content = "Script successfully loaded on "..executor, Image = "rbxassetid://4483345998", Time = 5 })
