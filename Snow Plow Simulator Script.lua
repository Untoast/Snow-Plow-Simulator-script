local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("idfk Snow plow sim hack", "Midnight")
local togglemoney = false
local togglerebirths = false

-- Main
local Main = Window:NewTab("Main")
local Money = Main:NewSection("Money")
local Rebirths = Main:NewSection("Rebirthes")
local Gemssection = Main:NewSection("Gems")
local Snowsection = Main:NewSection("Snow")

Money:NewToggle("Toggle Add Money", "Adds money", function(state)
    if state then
        
        togglemoney = true
        while togglemoney == true do
            game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-99999999999999, "1 Stick", true)
            wait(0.001)
        end
    else
        togglemoney = false
    end
end)

Money:NewButton("Add Money", "Adds money", function()
    game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-999999999999999, "1 Stick", true)
end)

Rebirths:NewToggle("Toggle Rebirths", "Toggles adding rebirths", function(state)
    if state then
        togglerebirths = true
        while togglerebirths == true do
            game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
            wait(0.001)
        end
    else
        togglerebirths = false
    end
end)

Rebirths:NewButton("Add Rebirths", "Adds 10000 rebirths", function()
    game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
end)

Gemssection:NewButton("Collect All Gems", "collects all gems", function()
    local Gems = game:GetService("Workspace").Gems
local LP = game:GetService("Players").LocalPlayer.Character

while wait() do
for _,v in pairs(Gems:GetDescendants()) do
   if v:IsA("TouchTransmitter") then
       firetouchinterest(LP.HumanoidRootPart, v.Parent, 0)
       firetouchinterest(LP.HumanoidRootPart, v.Parent, 1)
   end
end
end
local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
end)

Snowsection:NewButton("Plow all snow (READ DESCRIPTION!!)", "You CAN'T disable this, and also very laggy", function()
    local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
end)


--Player
local Playertab = Window:NewTab("Player")
local Playersec = Playertab:NewSection("Player")

Playersec:NewSlider("Walk Speed", "Changes Walk Speed", 1000, 16, function(Wspeed) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Wspeed
end)

-- Misc
local MiscTab = Window:NewTab("Misc")
local Miscsec = MiscTab:NewSection("Misc")
local OtherScripts = MiscTab:NewSection("Other Scripts")


Miscsec:NewKeybind("Fly", "Toggles flying.", Enum.KeyCode.E, function()
    if flying == false then
        flying = true
    else
        flying = false
    end
	    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.HumanoidRootPart 
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
if key:lower() == "`=`=`=`=" then 
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

local toggleflying = false

Miscsec:NewToggle("Flying enabled", "Toggles if you fly when you press the selected button.", function(state)
    if state then
        toggleflying = true
    else
        toggleflying = false
    end
    while toggleflying == false do
        flying = false
        wait(0.001)
end
end)

Miscsec:NewKeybind("Toggle UI", "Toggles the UI when you press the selected button.", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

OtherScripts:NewButton("CMD X", "Launches Command X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
end)

OtherScripts:NewButton("Infinite Yield", "Launches infinite yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
end)

-- Credits
local Credits = Window:NewTab("Credits")
local Creditssec = Credits:NewSection("Credits:")

Creditssec:NewLabel("Discord: Untoast#0001")