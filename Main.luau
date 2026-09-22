
-- Command Script by me :)
-- Make sure to execute after you die


local chatEvent = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")

local players = game:GetService("Players")
local player = players.LocalPlayer
local plrName = player.Name
local humanoid = player.Character.Humanoid

local skipClicked = false
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local Command = Instance.new("TextBox", screenGui)
local UiCorner = Instance.new("UICorner", Command)
local UiStroke = Instance.new("UIStroke", Command)

UiStroke.ApplyStrokeMode = "Border"


screenGui.Name = "Extended CMD"
screenGui.ResetOnSpawn = false
Command.Name = "Commandbox"

Command.Size = UDim2.new(0, 120, 0, 50)
Command.Position = UDim2.new(0.425, 0, 0.65, 0)
Command.PlaceholderText = "Input Command"
Command.BackgroundColor3 = Color3.fromRGB(0, 5, 250)
Command.TextColor3 = Color3.fromRGB(0, 0, 0)
Command.Font = Enum.Font.Code
Command.TextSize = 20
Command.Draggable = true
getgenv().Crash = true
getgenv().Ban = false

local function Focused(EnterPressed)
if EnterPressed then

local ChatText = tostring(Command.Text)
local TextArray = string.split(ChatText, " ")
local plrName = tostring(player.Name)
local plr = TextArray[2]
local CmdText = TextArray[1]

if CmdText == "kick" or CmdText == "KICK" then
  
chatEvent:FireServer("gear me cloner", "System")
task.wait(0.1)
chatEvent:FireServer("sword", "System")
chatEvent:FireServer(">. LinkedSwordKick " .. tostring(plr), "All")
chatEvent:FireServer("bring " .. tostring(plr), "System")
task.wait(0.1)
chatEvent:FireServer("freeze " .. tostring(plr), "System")
task.wait(0.2)
chatEvent:FireServer("size " .. tostring(plr) .. " nan", "System")
task.wait(0.2)
local gear = game:GetService("Players").LocalPlayer.Backpack["Gear Cloner"]
local LS = game.Players.LocalPlayer.Backpack:WaitForChild("LinkedSword", 2)
local gearRequest = gear:WaitForChild("GearRequest", 3)
gear.Parent = workspace:WaitForChild(plrName)
task.wait(0.05)
gearRequest:FireServer(LS)
chatEvent:FireServer("ungear me", "System")

elseif CmdText == "Blacklist" or CmdText == "blacklist" then

player.PlayerAdded:Connect(function(Ply)

local Name = Ply.Name
if Name == plr then
chatEvent:FireServer("gear me cloner", "System")
task.wait(0.1)
chatEvent:FireServer("sword", "System")
chatEvent:FireServer("bring " .. tostring(plr), "System")
task.wait(0.1)
chatEvent:FireServer("freeze " .. tostring(plr), "System")
task.wait(0.2)
chatEvent:FireServer("size " .. tostring(plr) .. " nan", "System")
task.wait(0.2)
local gear = game:GetService("Players").LocalPlayer.Backpack["Gear Cloner"]
local LS = game.Players.LocalPlayer.Backpack:WaitForChild("LinkedSword", 2)
local gearRequest = gear:WaitForChild("GearRequest", 3)
gear.Parent = workspace:WaitForChild(plrName)
task.wait(0.115)
gearRequest:FireServer(LS)
chatEvent:FireServer("ungear me", "System")

end

end)

elseif CmdText == "ClearMess" then

chatEvent:FireServer("f3x", "System")
task.wait(0.1)
local BT = game.Players.LocalPlayer.Backpack:WaitForChild("Building Tools", 3)

task.wait(3)
if BT then
local Ev = BT.SyncApi.ServerEndPoint
if Ev then
for _, v in pairs(workspace:GetChildren()) do
Ev:InvokeServer(
"Remove",

{
v
}
)
end
end
end
task.wait(1)
chatEvent:FireServer("clr", "System")
chatEvent:FireServer("fix", "System")
chatEvent:FireServer(">. ClearMess", "All")
  
elseif ChatText == "help" then
  
print("ClearMess")
print("Kick")
print("Void")
print("SFling")
  
elseif CmdText == "getAdmin" then
  
elseif CmdText == "Void" then
  
chatEvent:FireServer(">. Void " .. tostring(plr) ,"All")
chatEvent:FireServer("setgrav " .. tostring(plr) .. " nan", "System")
elseif CmdText == "SFling" then
  
chatEvent:FireServer(">. SFling " .. tostring(plr) ,"All")
for i = 1, 10, 1 do
chatEvent:FireServer("fling " .. tostring(plr) , "System")
end
  
elseif CmdText == "Nuke" then
chatEvent:FireServer(">. Nuke" ,"All")
for i = 1, 10, 1 do
chatEvent:FireServer("Explode all", "System")
end
elseif CmdText == "Periastrons" then
chatEvent:FireServer("gear ".. plr .. " Rainbow Periastron Omega", "System")
chatEvent:FireServer("gear ".. plr .. " Noir Periastron Psi", "System")
chatEvent:FireServer("gear ".. plr .. " Ivory Periastron", "System")
chatEvent:FireServer("gear ".. plr .. " Crimson Periastron Mu", "System")
chatEvent:FireServer("gear ".. plr .. " Charteuse Periastron Gamma", "System")
chatEvent:FireServer("gear ".. plr .. " Amethyst Periastron Kappa", "System")
chatEvent:FireServer("gear ".. plr .. " Azure Periastron Alpha", "System")
chatEvent:FireServer("gear ".. plr .. " Grimgold Periastron Beta", "System")
chatEvent:FireServer(">. Periastrons ".. plr, "All")
elseif CmdText == "Crash" then
while getgenv().Crash == true do
if getgenv().Crash == false then return end
chatEvent:FireServer("Explode all", "System")
chatEvent:FireServer("Respawn all", "System")
chatEvent:FireServer("Jail all", "System")
chatEvent:FireServer("Removelimbs all", "System")
chatEvent:FireServer("infect all", "System")
chatEvent:FireServer("brightness 100000000", "System")
chatEvent:FireServer("ambient 20, 200, 200", "System")
chatEvent:FireServer("ambient 5, 6, 7", "System")
chatEvent:FireServer("sm Crashing.", "System")
task.wait(0.1)
end
elseif CmdText == "uncrash" then
getgenv().Crash = false
return
else
chatEvent:FireServer(ChatText, "System")
end
end
end

Command.FocusLost:Connect(Focused)

print(plrName)