local character = game.Players.LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")

if humanoid.RigType == Enum.HumanoidRigType.R6 then
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

local function createFakeCharacter()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local fakeCharacter = Instance.new("Model", workspace)
    fakeCharacter.Name = "FakeCharacter"
    
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") or part:IsA("Accessory") then
            local clonedPart = part:Clone()
            clonedPart.Parent = fakeCharacter
        end
    end
    
    return fakeCharacter
end

-- Function to disable character animations
local function disableAnimation(player)
    local character = player.Character
    if character and character:FindFirstChild("Animate") then
        character.Animate.Disabled = true
    end
end

-- Function to enable character animations
local function enableAnimation(player)
    local character = player.Character
    if character and character:FindFirstChild("Animate") then
        character.Animate.Disabled = false
    end
end

-- Create the GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = localPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.Text = "YT : Xploonir[R6] "
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Parent = frame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0, 50)
toggleButton.Position = UDim2.new(0, 0, 0, 30)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.BorderSizePixel = 0
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Text = "On"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 24
toggleButton.Parent = frame

toggleButton.MouseButton1Click:Connect(function()
    if toggleButton.Text == "On" then
        fakeCharacter = createFakeCharacter()
        disableAnimation(localPlayer) -- Disable animations

        toggleButton.Text = "Off"
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        if fakeCharacter then
            fakeCharacter:Destroy()
            fakeCharacter = nil
        end

        enableAnimation(localPlayer) -- Enable animations

        toggleButton.Text = "On"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
end)
elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
    -- Create the GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "YT : Xploonir[R15] "
titleLabel.TextSize = 24
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0, 50)
toggleButton.Position = UDim2.new(0, 0, 1/3, 0)
toggleButton.Text = "Off"
toggleButton.TextSize = 24
toggleButton.BackgroundColor3 = Color3.new(1, 0.8, 0.8)
toggleButton.Parent = frame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 25)
speedLabel.Position = UDim2.new(0, 0, 2/3, 0)
speedLabel.Text = "Speed:"
speedLabel.TextSize = 18
speedLabel.BackgroundTransparency = 1
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(1, 0, 0, 25)
speedBox.Position = UDim2.new(0, 0, (2/3) + (1/6), 0)
speedBox.Text = "10"
speedBox.TextSize = 18
speedBox.Parent = frame

-- Teleportation script
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local tpwalking = false -- Set tpwalking to false to prevent teleportation from being enabled automatically
local speed -- The speed variable will be updated based on the value in the speedBox

RunService.Heartbeat:Connect(function(delta)
	if tpwalking and humanoid.MoveDirection.Magnitude > 0 then
		speed = tonumber(speedBox.Text) or speed -- Update the speed variable based on the value in the speedBox
		character:TranslateBy(humanoid.MoveDirection * delta * speed)

        -- Update the CFrame property of the HumanoidRootPart based on the direction of movement
        local direction = humanoid.MoveDirection
local angle = -math.atan2(direction.X, direction.Z)
character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position) * CFrame.Angles(0, angle, 0)
	end
end)

-- Add toggle button functionality
local enabled = false

toggleButton.MouseButton1Click:Connect(function()
	enabled = not enabled
	
	if enabled then
		toggleButton.Text = "On"
		toggleButton.BackgroundColor3 =
            Color3.new(0.8, 1, 0.8)
		
		for i,x in next,
            character:GetDescendants() do
			if x:IsA("BasePart") and not x.Anchored then
				x.Anchored =
                    true
			end
		end
		
		tpwalking =
            true
	else
		toggleButton.Text =
            "Off"
		toggleButton.BackgroundColor3 =
            Color3.new(1,
                0.8,
                0.8)
		
		for i,x in next,
            character:GetDescendants() do
			if x:IsA("BasePart") and x.Anchored then
				x.Anchored =
                    false
			end
		end
		
		tpwalking =
            false
	end
end)

-- Add Jump function to the humanoid object and bind it to the space bar key
humanoid.Jump =
    function()
    if tpwalking then
        character:TranslateBy(Vector3.new(0,
            50,
            0))
    else
        humanoid.JumpPower =
            50
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(inputObject,
    gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Space and not gameProcessedEvent then
        humanoid:Jump()
    end
end)

end