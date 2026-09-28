if not game.PlaceId == "537413528" then
  else
  print("Test 2")
end

function fm()
	local v1 = game.Workspace
	for _,v in pairs(v1:GetDescendants()) do
		if v:IsA("Part") or v:IsA("MeshPart") then
			v.BrickColor = "Fossil"
		end
	end
end

fm()
