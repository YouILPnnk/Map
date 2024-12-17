PlayersSelect = {}
_G.Player = nil
_G.Autokill = false

_G.HideName = false

local function MobileSupport()
    for _,v in pairs(game.CoreGui:GetDescendants()) do
        if v.Name == "Main" then
            v.Active = true
            v.Draggable = true
        end
    end
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ShibaHub : The Strongest Battleground", "BloodTheme")
local Tab = Window:NewTab("General")
local S1 = Tab:NewSection("SelectPlayer")
local S2 = Tab:NewSection("Main")
local S3 = Tab:NewSection("Misc")

local DropPlayer = S1:NewDropdown("SelectPlayers", "Version : 1", PlayersSelect, function(P)
    if P then
        _G.Player = P
    end
end)
S1:NewButton("Refresh", "Version : 1", function()
    table.clear(PlayersSelect)
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(PlayersSelect, tostring(v.Name))
        end
    end
    DropPlayer:Refresh(PlayersSelect)
end)
S2:NewToggle("AutoFarmPlayer", "Version : 1", function(_)
    if _ then
        _G.Autokill = true
    else
        _G.Autokill = false
    end
end)
S3:NewButton("HideName", "Version : 1", function()
    _G.HideName = true
end)
S3:NewButton("FastMode", "Version : 1", function()
    for _,v in pairs(game.Workspace.Map:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
            v.Material = Enum.Material.SmoothPlastic
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
end)
MobileSupport()
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Autokill == true then
                for _,v in pairs(game.Workspace.Live:GetChildren()) do
                    if v.Name == _G.Player or v.Name == "Weakest Dummy" then
                        local Me = game.Players.LocalPlayer.Character.HumanoidRootPart
                        Me.CFrame = v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,-3.75,0) * CFrame.Angles(90,0,0)
                    end
                end
                local Shift = {
                    [1] = {
                        ["setting"] = "S_ShiftLock",
                        ["Goal"] = "Adjust Setting",
                        ["set"] = false
                    }
                }
                local a = {
                    [1] = {
                        ["Mobile"] = true,
                        ["Goal"] = "LeftClick"
                    }
                }
                game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(a))
                game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(Shift))
            else
            end
            if _G.HideName == true then
                local Players = game:GetService("Players")
                local Workspace = game:GetService("Workspace")
                local LocalPlayer = Players.LocalPlayer
                for _, descendant in pairs(Workspace:GetDescendants()) do
                    if descendant:IsA("TextLabel") then
                        local playerNames = {LocalPlayer.Name, LocalPlayer.DisplayName}
                        for _, playerName in pairs(playerNames) do
                            if descendant.Text:lower():find(playerName:lower()) then
                                descendant.Parent:Destroy()
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait(299) do
        local v = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            v:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            v:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end)
