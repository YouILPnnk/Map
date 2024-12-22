repeat
    wait()
until game:IsLoaded()

getgenv().Teams = "Pirates" --"Marines"

local Team = game.Players.LocalPlayer.PlayerGui:WaitForChild("Main (minimal)")

if Team:WaitForChild("ChooseTeam") then
    local Invoke = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer
    if getgenv().Teams == "Pirates" then
        Invoke(unpack("SetTeam","Pirates"))
    elseif getgenv().Teams == "Marines" then
        Invoke(unpack("SetTeam","Marines"))
    else
        Invoke(unpack("SetTeam","Pirates"))
    end
end
