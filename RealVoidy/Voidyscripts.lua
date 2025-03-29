local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Library/UI-Library/main/UI-Library.lua'))()

local Window = Library:CreateWindow('Blox Fruits Ultimate Script', 'Red Blossoms', Enum.KeyCode.RightControl)

local FarmTab = Window:CreateTab('Farm')
local QuestTab = Window:CreateTab('Quest')
local TeleportTab = Window:CreateTab('Teleport')
local FruitRaidTab = Window:CreateTab('Fruit & Raid')
local IslandsTab = Window:CreateTab('Islands')
local SeaEventsTab = Window:CreateTab('Sea Events')
local ShopTab = Window:CreateTab('Shop')
local PvPTab = Window:CreateTab('PvP')
local MiscTab = Window:CreateTab('Misc')

FarmTab:CreateToggle('Auto Farm Level', function(value) getgenv().AutoFarmLevel = value end)
FarmTab:CreateToggle('Auto Farm Nearest Mob', function(value) getgenv().AutoFarmNearest = value end)

QuestTab:CreateButton('Complete Skull Guitar Puzzle', function() print('Completing Skull Guitar Puzzle...') end)
QuestTab:CreateButton('Complete CDK Puzzle', function() print('Completing CDK Puzzle...') end)
QuestTab:CreateButton('Get Hallow Scythe Sword', function() print('Getting Hallow Scythe Sword...') end)

TeleportTab:CreateButton('Teleport Islands', function() print('Teleporting to Islands...') end)

FruitRaidTab:CreateToggle('Auto Complete Raid & Awaken', function(value) getgenv().AutoRaidAwaken = value end)
FruitRaidTab:CreateButton('Teleport Fruits', function() print('Teleporting to Fruits...') end)

IslandsTab:CreateButton('Find Prehistoric Island', function() print('Finding Prehistoric Island...') end)
IslandsTab:CreateButton('Find Mirage Island', function() print('Finding Mirage Island...') end)
IslandsTab:CreateButton('Find Kitsune Island', function() print('Finding Kitsune Island...') end)
IslandsTab:CreateButton('Find Frozen Dimensions', function() print('Finding Frozen Dimensions...') end)

SeaEventsTab:CreateToggle('Auto Sea Event & Kill Mobs', function(value) getgenv().AutoSeaEvent = value end)

ShopTab:CreateButton('Buy Accessories', function() print('Buying Accessories...') end)
ShopTab:CreateButton('Buy Fighting Styles', function() print('Buying Fighting Styles...') end)
ShopTab:CreateButton('Buy Guns', function() print('Buying Guns...') end)

PvPTab:CreateToggle('Aimbot', function(value) getgenv().Aimbot = value end)
PvPTab:CreateToggle('ESP', function(value) getgenv().ESP = value end)

MiscTab:CreateToggle('Full Bright', function(value) getgenv().FullBright = value end)
MiscTab:CreateToggle('Always Day', function(value) getgenv().AlwaysDay = value end)
MiscTab:CreateButton('FPS Boost', function() setfpscap(60) end)
MiscTab:CreateSlider('Tweening Speed', 1, 300, 50, function(value) getgenv().TweenSpeed = value end)
MiscTab:CreateSlider('Jump Power', 1, 300, 100, function(value) getgenv().JumpPower = value end)
MiscTab:CreateSlider('Speed Hack', 1, 500, 100, function(value) getgenv().SpeedHack = value end)

MiscTab:CreateButton('Check Server Status', function() print('Checking server status...') end)

print('Blox Fruits Ultimate Script Loaded Successfully!')
