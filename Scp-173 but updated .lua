-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

-- Variables
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local guiVisible = true

-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local TeleportButton = Instance.new("TextButton")
local LoopTeleportButton = Instance.new("TextButton")
local DelayTextBox = Instance.new("TextBox")
local FlingButton = Instance.new("TextButton")
local DistanceLabel = Instance.new("TextLabel")
local DistanceTextBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")

-- Properties
ScreenGui.Parent = localPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "CustomGui"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.3, 0, 0.6, 0) -- Adjust size as needed
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.new(0.5, 0, 0.5)
Frame.Active = true -- Make the Frame active to enable dragging
Frame.Draggable = true

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Text = "Credit X"
Title.BackgroundColor3 = Color3.new(0, 0, 1)
Title.TextColor3 = Color3.new(1, 1, 1)

Button.Parent = Frame
Button.Size = UDim2.new(1, 0, 0.2, 0)
Button.Position = UDim2.new(0, 0, 0.2, 0)
Button.Text = "Off"
Button.BackgroundColor3 = Color3.new(1, 0, 0)
Button.TextColor3 = Color3.new(1, 1, 1)

TextBox.Parent = Frame
TextBox.Size = UDim2.new(0.7, 0, 0.2, 0)
TextBox.Position = UDim2.new(0, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.new(0, 1, 0)
TextBox.TextColor3 = Color3.new(0, 0, 0)

TeleportButton.Parent = Frame
TeleportButton.Size = UDim2.new(0.3, 0, 0.2, 0)
TeleportButton.Position = UDim2.new(0.7, 0, 0.4, 0)
TeleportButton.Text = "Go"
TeleportButton.BackgroundColor3 = Color3.new(0, 0, 1)
TeleportButton.TextColor3 = Color3.new(1, 1, 1)

LoopTeleportButton.Parent = Frame
LoopTeleportButton.Size = UDim2.new(1, 0, 0.2, 0)
LoopTeleportButton.Position = UDim2.new(0, 0, 0.6, 0)
LoopTeleportButton.Text = "Loop TP"
LoopTeleportButton.BackgroundColor3 = Color3.new(1, 0, 0)
LoopTeleportButton.TextColor3 = Color3.new(1, 1, 1)

DelayTextBox.Parent = Frame
DelayTextBox.Size = UDim2.new(0.3, 0, 0.2, 0)
DelayTextBox.Position = UDim2.new(0, 0, 0.6, 0) -- Adjust position as needed
DelayTextBox.Text = "0.2" -- Default delay
DelayTextBox.BackgroundColor3 = Color3.new(0, 1, 0)
DelayTextBox.TextColor3 = Color3.new(0, 0, 0)

FlingButton.Parent = Frame
FlingButton.Size = UDim2.new(1, 0, 0.2, 0)
FlingButton.Position = UDim2.new(0, 0, 0.8, 0) -- Adjust position as needed
FlingButton.Text = "Fling"
FlingButton.BackgroundColor3 = Color3.new(1, 0, 0)
FlingButton.TextColor3 = Color3.new(1, 1, 1)

DistanceLabel.Parent = Frame
DistanceLabel.Size = UDim2.new(0.7, 0, 0.2, 0)
DistanceLabel.Position = UDim2.new(0, 0, 1, 0) -- Adjust position as needed
DistanceLabel.Text = "Distance"
DistanceLabel.BackgroundColor3 = Color3.new(0, 1, 0)
DistanceLabel.TextColor3 = Color3.new(0, 0, 0)

DistanceTextBox.Parent = Frame
DistanceTextBox.Size = UDim2.new(0.3, 0, 0.2, 0)
DistanceTextBox.Position = UDim2.new(0.7, 0, 1, 0) -- Adjust position as needed
DistanceTextBox.Text = "5" -- Default distance
DistanceTextBox.BackgroundColor3 = Color3.new(0, 1, 0)
DistanceTextBox.TextColor3 = Color3.new(0, 0, 0)

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust size as needed
ToggleButton.Position = UDim2.new(0, 0, 0, 0) -- Position at the left corner
ToggleButton.Text = "-"
ToggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleButton.TextColor3 = Color3.new(0, 0, 0)

-- Animation
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://183294396"
local animationTrack = humanoid:LoadAnimation(animation)

-- Button Click
Button.MouseButton1Click:Connect(function()
    if Button.Text == "Off" then
        Button.Text = "On"
        Button.BackgroundColor3 = Color3.new(0, 1, 0)
        animationTrack:Play()
        hiddenfling = true
    else
        Button.Text = "Off"
        Button.BackgroundColor3 = Color3.new(1, 0, 0)
        animationTrack:Stop()
        hiddenfling = false
    end
end)

-- Teleport Function
local function teleportToPlayer(target)
    local targetCharacter = target.Character
    if targetCharacter then
        local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
        local myHumanoidRootPart = character:WaitForChild("HumanoidRootPart")
        if targetHumanoidRootPart and myHumanoidRootPart then
            local distance = tonumber(DistanceTextBox.Text) or 5 -- Use the distance from the textbox, default to 5 if it's not a valid number
            myHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame * CFrame.new(0, 0, distance) -- Teleport the specified distance behind the target
        end
    end
end



-- Find player by partial name or display name
local function findPlayerByPartialName(partialName)
    local matchingPlayer = nil
    local partialNameLower = partialName:lower()

    for _, player in ipairs(Players:GetPlayers()) do
        local playerNameLower =player.Name:lower()
        local playerDisplayNameLower = player.DisplayName:lower()

        if playerNameLower:find(partialNameLower) or playerDisplayNameLower:find(partialNameLower) then
            matchingPlayer = player
            break
        end
    end

    return matchingPlayer
end

local function toggleGui()
    guiVisible = not guiVisible
    Frame.Visible = guiVisible
    if guiVisible then
        ToggleButton.Text = "-"
    else
        ToggleButton.Text = "+"
    end
end

ToggleButton.MouseButton1Click:Connect(toggleGui)

local function resetFling()
    if hiddenfling then
        hiddenfling = false
        FlingButton.Text = "Fling (Off)"
        FlingButton.BackgroundColor3 = Color3.new(1, 0, 0)
    end
end

local function connectDiedEvent(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(resetFling)
end

player.CharacterAdded:Connect(connectDiedEvent)

-- Find closest player to the local player
local function findClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            local playerCharacter = player.Character
            local myCharacter = localPlayer.Character

            if playerCharacter and myCharacter then
                local playerHumanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                local myHumanoidRootPart = myCharacter:FindFirstChild("HumanoidRootPart")

                if playerHumanoidRootPart and myHumanoidRootPart then
                    local distance = (playerHumanoidRootPart.Position - myHumanoidRootPart.Position).Magnitude

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end

-- Teleport Button Click
TeleportButton.MouseButton1Click:Connect(function()
    local target = nil

    if TextBox.Text == "" then
        target = findClosestPlayer()
    else
        target = findPlayerByPartialName(TextBox.Text)
    end

    if target then
        teleportToPlayer(target)
    else
        TextBox.Text = "Invalid Name"
    end
end)

-- Global variable for fling
hiddenfling = false

-- Fling Button
FlingButton.MouseButton1Click:Connect(function()
    if hiddenfling == false then
        FlingButton.Text = "Fling (On)"
        FlingButton.BackgroundColor3 = Color3.new(0, 1, 0)
        hiddenfling = true
    else
        FlingButton.Text = "Fling (Off)"
        FlingButton.BackgroundColor3 = Color3.new(1, 0, 0)
        hiddenfling = false
    end
end)

-- Loop Teleport Button Click
local loopTeleporting = false
LoopTeleportButton.MouseButton1Click:Connect(function()
    if loopTeleporting then
        LoopTeleportButton.Text = "Loop TP"
        LoopTeleportButton.BackgroundColor3 = Color3.new(1, 0, 0)
        loopTeleporting = false
    else
        LoopTeleportButton.Text = "Stop"
        LoopTeleportButton.BackgroundColor3 = Color3.new(0, 1, 0)
        loopTeleporting = true

        while loopTeleporting do
            local target = nil

            if TextBox.Text == "" then
                target = findClosestPlayer()
            else
                target = findPlayerByPartialName(TextBox.Text)
            end

            if target then
                teleportToPlayer(target)
            end
            local delay = tonumber(DelayTextBox.Text) or 0.2 -- Use the delay from the textbox, default to 0.2 if it's not a valid number
            wait(delay) -- Wait for the specified delay before next teleport
        end
    end
end)

local function fling()
    local hrp, c, vel, movel = nil, nil, nil, 0.1
    while true do
        game:GetService("RunService").Heartbeat:Wait()
        if hiddenfling then
            local lp = game.Players.LocalPlayer
            while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                game:GetService("RunService").Heartbeat:Wait()
                c = lp.Character
                hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
            end
            if hiddenfling then
                vel = hrp.Velocity
                hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                game:GetService("RunService").RenderStepped:Wait()
                if c and c.Parent and hrp and hrp.Parent then
                    hrp.Velocity = vel
                end
                game:GetService("RunService").Stepped:Wait()
                if c and c.Parent and hrp and hrp.Parent then
                    hrp.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = movel * -1
                end
            end
        end
    end
end

fling()