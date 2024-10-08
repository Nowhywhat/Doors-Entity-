local mom = {"rbxassetid://1972219024"}
    -- UI Construction

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999
    Background.BackgroundTransparency = 0.6

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, 0, 0, 0)
    Face.Image = mom[math.random(1, #mom)]
    Face.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Face.ImageTransparency = 0

    Face.Parent = Background
    Background.Parent = JumpscareGui

    game.TweenService:Create(Face, TweenInfo.new(0.2), {Size = UDim2.new(0, 850, 0, 850), ImageTransparency = 0}):Play()
    game.TweenService:Create(Face, TweenInfo.new(0.2), {Rotation = math.random(-10,10)}):Play()
    task.wait(0.5)
    game.TweenService:Create(Face, TweenInfo.new(0.6), {ImageTransparency = 1}):Play()
game.TweenService:Create(Background, TweenInfo.new(2.6), {BackgroundTransparency = 1}):Play()
    task.wait(2)
    JumpscareGui:Destroy()
