repeat wait() until game:IsLoaded()
if not game.PlaceId == "537413528" then
	return
	else
end
function fm()
	local v1 = game.Workspace
	for _,v in pairs(v1:GetDescendants()) do
		if v:IsA("Part") or v:IsA("MeshPart") then
			v.BrickColor = BrickColor.new("Fossil")
			v.Material = Enum.Material.SmoothPlastic
			v.CastShadow = false
		end
	end
end
function Farm()
	local z = game.Players.LocalPlayer
	local x = z.Character
	local _T = game.Workspace:WaitForChild("BoatStages")
	local T = _T:WaitForChild("NormalStages")

	local function Teleport()
		local c = 1
		local Pos = x:WaitForChild("HumanoidRootPart")
		local function Part(v)
			local l = Instance.new("Part",v)
			l.Name = math.random(1,9999)
			l.Anchored = true
			l.Position = v.Position - Vector3.new(0,10,0)
			l.Size = Vector3.new(10,2,10)
			spawn(function()
				wait(2.1)
				l:Destroy()
			end)
		end
		repeat
			Part(T["CaveStage"..c]:FindFirstChild("DarknessPart"))
			Pos.Position = T["CaveStage"..c]:FindFirstChild("DarknessPart").Position
			c = c + 1
			wait(2)
		until c == 10
		Pos.Position = T:FindFirstChild("TheEnd"):FindFirstChild("GoldenChest"):FindFirstChild("Trigger").Position
		wait(20)
	end
	Teleport()
end
fm()
wait(10)
while true do
	Farm()
end
