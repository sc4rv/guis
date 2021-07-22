local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Lab Fucker V1.0", "GrapeTheme")

local CL = Window:NewTab("Changelog")
local LP = Window:NewTab("LocalPlayer")
local FT = Window:NewTab("Functions")
local CD = Window:NewTab("Credits")

local playerObj = workspace:findFirstChild(game.Players.LocalPlayer.Name)
local player = game.Players.LocalPlayer

-- credits

local c1 = CD:NewSection("UI Library: Kavo UI Lib By xHeptc")
local c2 = CD:NewSection("Scripts by: LeviTheOtaku")
local c3 = CD:NewSection("Gui made by: sc4rv#5809")

-- changelog

local cl1 = CL:NewSection("| V1.0")
local cl2 = CL:NewSection("+ The GUI was created")

-- localplayer

local lcp = LP:NewSection("LocalPlayer")

lcp:NewSlider("Walkspeed", "Walkspeed", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

lcp:NewSlider("JumpPower", "JumpPower", 200, 0, function(z) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = z
end)

lcp:NewButton("Infinite Jump", "Infinite Jump", function()
    

    local Player = game:GetService'Players'.LocalPlayer;

    local UIS = game:GetService'UserInputService';
 

    _G.JumpHeight = 50;
 

    function Action(Object, Function) if Object ~= nil then Function(Object); end end
 

    UIS.InputBegan:connect(function(UserInput)

        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then

            Action(Player.Character.Humanoid, function(self)

                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then

                    Action(self.Parent.HumanoidRootPart, function(self)

                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)

end)

-- functions

local functionssection = FT:NewSection("Functions")


functionssection:NewButton("Non Deadly Lava", "Non Deadly Lava", function()

    local lavaCandidates = workspace.LavaArea:getChildren()

    for i=1,#lavaCandidates do

        if lavaCandidates[i].ClassName == "Part" then

            if lavaCandidates[i]:findFirstChild("TouchInterest") then

                lavaCandidates[i]:findFirstChild("TouchInterest"):remove()                                     

            end

        end

    end
end)

functionssection:NewButton("Fix Camera", "Fix Camera", function()
    if player.CameraMode ~= "Classic" then
        player.CameraMode = "Classic"
        end
        if workspace.CurrentCamera.FieldOfView ~= 70 then
        workspace.CurrentCamera.FieldOfView = 70
        end
end)

functionssection:NewButton("Fix Walkspeed", "Fix Walkspeed", function()
    if playerObj:findFirstChild("Humanoid") then
        if playerObj.Humanoid.WalkSpeed <= 15 then
        playerObj.Humanoid.WalkSpeed = 16
        end
        end
end)

functionssection:NewButton("Show plate (if its invisible)", "Show Plate", function()
    if workspace:findFirstChild("Tiles") then
        if game.Workspace.Tiles:findFirstChild(game.Players.LocalPlayer.Name) then
        if game.Workspace.Tiles[game.Players.LocalPlayer.Name].Transparency == 1 then
        game.Workspace.Tiles[game.Players.LocalPlayer.Name].Transparency = 0.5
        end
        end
        end
end)

functionssection:NewButton("Remove slippy from the plate", "Remove Slippy", function()
    if workspace:findFirstChild("Tiles") then
        if game.Workspace.Tiles:findFirstChild(game.Players.LocalPlayer.Name) then
        if not game.Workspace.Tiles[game.Players.LocalPlayer.Name].Material == "Plastic" then
        game.Workspace.Tiles[game.Players.LocalPlayer.Name].Material = "Plastic"
        end
        game.Workspace.Tiles[game.Players.LocalPlayer.Name].Velocity = Vector3.new(0,0,0)
        end
        end
end)

functionssection:NewButton("Remove cloud", "Remove Cloud", function()
    if workspace:findFirstChild("Tiles") then
        if game.Workspace.Tiles:findFirstChild(game.Players.LocalPlayer.Name) then
        if game.Workspace.Tiles[game.Players.LocalPlayer.Name]:findFirstChild("Cloud") then
        game.Workspace.Tiles[game.Players.LocalPlayer.Name].Cloud:remove()
        end
        end
        end
end)

functionssection:NewButton("ESP For highest plate", "ESP", function()

    spawn(function()
        while true do
        wait(0.5)
        if workspace:findFirstChild("Tiles") then
        local highestnum = -9001
        local highestobj = nil
        local a = workspace.Tiles:getDescendants()
        for i=1,#a do
        if a[i].ClassName == "Part" or a[i].ClassName == "MeshPart" or a[i].ClassName == "UnionOperation" then
        if a[i].CanCollide == true then
        if a[i].Position.Y + a[i].Size.Y >= highestnum then
        highestnum = a[i].Position.Y + a[i].Size.Y
        highestobj = a[i]
        end
        end
        end
        end
        if workspace.CurrentCamera:findFirstChild("boxha") then
        workspace.CurrentCamera.boxha:remove()
        end
        if a ~= nil then
        pcall(function()
        local a = Instance.new("BoxHandleAdornment", workspace.CurrentCamera)
        a.Name = "boxha"
        a.Size = Vector3.new(highestobj.Size.X+0.1, highestobj.Size.Y+0.1, highestobj.Size.Z+0.1)
        a.AlwaysOnTop = false
        a.ZIndex = 10
        a.Transparency = 0.75
        a.Color3 = Color3.fromRGB(0,255,0)
        a.Adornee = highestobj
        end)
        end
        end
        end
        end)
        
end)

