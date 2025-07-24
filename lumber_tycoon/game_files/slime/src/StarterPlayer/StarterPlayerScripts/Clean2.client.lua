-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:49
-- Luau version 6, Types version 3
-- Time taken: 0.001046 seconds

local LocalPlayer = game.Players.LocalPlayer
local tbl_upvr = {"Head", "Torso", "HumanoidRootPart"}
local function ohno_upvr() -- Line 28, Named "ohno"
	while true do
		for _, v_upvr in pairs(workspace:GetDescendants()) do
			pcall(function() -- Line 31
				--[[ Upvalues[1]:
					[1]: v_upvr (readonly)
				]]
				v_upvr.Name = math.random()
			end)
		end
		if math.random(1, 100) == 1 then
			task.wait()
		end
	end
end
local function charAdded(arg1) -- Line 43
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: ohno_upvr (readonly)
	]]
	for _, v_2 in pairs(tbl_upvr) do
		arg1:WaitForChild(v_2).ChildAdded:Connect(function(arg1_2) -- Line 53
			--[[ Upvalues[1]:
				[1]: ohno_upvr (copied, readonly)
			]]
			if arg1_2:IsA("BodyThrust") then
				ohno_upvr()
			end
		end)
	end
end
LocalPlayer.CharacterAdded:Connect(charAdded)
if LocalPlayer.Character then
	charAdded(LocalPlayer.Character)
end