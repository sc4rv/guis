
-- UI LIBRArY BY xHeptc
-- MOST OF SCRIPTS ARE NOT MADE BY ME


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Doomspire BrickBattle | SCAR | UI Lib By xHeptc", "GrapeTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Teleport's")
local Section2 = Tab:NewSection("Script's")

Section:NewButton("Red (Top)", "Red (Top)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-92,131,-1.1)
end)

Section:NewButton("Red (Down)", "Red (Down)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-131,25,-1.5)
end)

Section:NewButton("Blue (Top)", "Blue (Top)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.3,131,91)
end)

Section:NewButton("Blue (Down)", "Blue (Down)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.4,25,131)
end)

Section:NewButton("Green (Top)", "Green (Top)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1.4,131,-81)
end)

Section:NewButton("Green (Down)", "Green (Down)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.4,25,-131)
end)

Section:NewButton("Yellow (Top)", "Yellow (Top)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86,131,1)
end)

Section:NewButton("Yellow (Down)", "Yellow (Down)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131,25,-1.5 )
end)

Section2:NewButton("Infinite Jump", "Jump very high!", function()

    game.StarterGui:SetCore("SendNotification", {
        Title = "ReDevs";
        Text = "- Infinite Jump executed Spam the space button as you can.";
        Icon = "rbxassetid://4414605822";
        Duration = 3;
    })
     
    _G.infinjump = true
     
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    Mouse.KeyDown:connect(function(k)
    if _G.infinjump then
    if k:byte() == 32 then
    Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    Humanoid:ChangeState("Jumping")
    wait(0.1)
    Humanoid:ChangeState("Seated")
    end
    end
    end)
     
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    Mouse.KeyDown:connect(function(k)
    k = k:lower()
    if k == "f" then
    if _G.infinjump == true then
    _G.infinjump = false
    else
    _G.infinjump = true
    end
    end
    end)
end)

Section2:NewButton("Fly [E]", "Fly like an angel!", function()
    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.HumanoidRootPart 
local flying = true
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 
 
function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

Section2:NewButton("Sonic", "Run so fast like sonic!", function()
    _G.HackedWalkSpeed = 100
 
local Plrs = game:GetService("Players")
 
local MyPlr = Plrs.LocalPlayer
local MyChar = MyPlr.Character
 
if MyChar then
local Hum = MyChar.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end
 
 
MyPlr.CharacterAdded:connect(function(Char)
MyChar = Char
repeat wait() until Char:FindFirstChild("Humanoid")
local Hum = Char.Humanoid
Hum.Changed:connect(function()
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
Hum.WalkSpeed = _G.HackedWalkSpeed
end)
 
end)

Section2:NewButton("UnSonic", "You will not be a sonic anymore with this button", function()
    _G.HackedWalkSpeed = 20
 
    local Plrs = game:GetService("Players")
     
    local MyPlr = Plrs.LocalPlayer
    local MyChar = MyPlr.Character
     
    if MyChar then
    local Hum = MyChar.Humanoid
    Hum.Changed:connect(function()
    Hum.WalkSpeed = _G.HackedWalkSpeed
    end)
    Hum.WalkSpeed = _G.HackedWalkSpeed
    end
     
     
    MyPlr.CharacterAdded:connect(function(Char)
    MyChar = Char
    repeat wait() until Char:FindFirstChild("Humanoid")
    local Hum = Char.Humanoid
    Hum.Changed:connect(function()
    Hum.WalkSpeed = _G.HackedWalkSpeed
    end)
    Hum.WalkSpeed = _G.HackedWalkSpeed
    end)
end)