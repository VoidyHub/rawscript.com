-- Fly & Adjustable Jump Power Script with Hide/Show Button for Blox Fruits

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local flying = false
local speed = 100 -- Default fly speed
local jumpPower = 50 -- Default jump power (Adjustable from 1 to 300)
local guiVisible = true

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleFlyButton = Instance.new("TextButton")
local JumpPowerLabel = Instance.new("TextLabel")
local JumpPowerSlider = Instance.new("TextBox")
local HideShowButton = Instance.new("TextButton")

ScreenGui.Name = "FlyGUI"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
MainFrame.Size = UDim2.new(0, 250, 0, 200)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Draggable = true
MainFrame.Active = true

ToggleFlyButton.Name = "ToggleFlyButton"
ToggleFlyButton.Parent = MainFrame
ToggleFlyButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
ToggleFlyButton.Size = UDim2.new(0, 200, 0, 50)
ToggleFlyButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleFlyButton.Text = "Toggle Fly (OFF)"
ToggleFlyButton.TextScaled = true

JumpPowerLabel.Name = "JumpPowerLabel"
JumpPowerLabel.Parent = MainFrame
JumpPowerLabel.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
JumpPowerLabel.Size = UDim2.new(0, 200, 0, 30)
JumpPowerLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
JumpPowerLabel.Text = "Jump Power: 50"
JumpPowerLabel.TextScaled = true

JumpPowerSlider.Name = "JumpPowerSlider"
JumpPowerSlider.Parent = MainFrame
JumpPowerSlider.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
JumpPowerSlider.Size = UDim2.new(0, 200, 0, 30)
JumpPowerSlider.Position = UDim2.new(0.1, 0, 0.55, 0)
JumpPowerSlider.Text = "50"

HideShowButton.Name = "HideShowButton"
HideShowButton.Parent = ScreenGui
HideShowButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
HideShowButton.Size = UDim2.new(0, 80, 0, 30)
HideShowButton.Position = UDim2.new(0.01, 0, 0.01, 0)
HideShowButton.Text = "Hide"
HideShowButton.TextScaled = true

local function Fly()
    local bodyGyro = Instance.new("BodyGyro")
    local bodyVelocity = Instance.new("BodyVelocity")

    bodyGyro.P = 9e4
    bodyGyro.Parent = player.Character.HumanoidRootPart
    bodyVelocity.Parent = player.Character.HumanoidRootPart

    while flying do
        bodyGyro.CFrame = workspace.CurrentCamera.CFrame
        bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * speed
        game:GetService("RunService").RenderStepped:Wait()
    end

    bodyGyro:Destroy()
    bodyVelocity:Destroy()
end

ToggleFlyButton.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        ToggleFlyButton.Text = "Toggle Fly (ON)"
        Fly()
    else
        ToggleFlyButton.Text = "Toggle Fly (OFF)"
    end
end)

JumpPowerSlider.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local input = tonumber(JumpPowerSlider.Text)
        if input and input >= 1 and input <= 300 then
            jumpPower = input
            player.Character.Humanoid.JumpPower = jumpPower
            JumpPowerLabel.Text = "Jump Power: " .. tostring(jumpPower)
        else
            JumpPowerSlider.Text = tostring(jumpPower) -- Reset if invalid input
        end
    end
end)

HideShowButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    HideShowButton.Text = guiVisible and "Hide" or "Show"
end)

-- Set default jump power
player.Character.Humanoid.JumpPower = jumpPower
