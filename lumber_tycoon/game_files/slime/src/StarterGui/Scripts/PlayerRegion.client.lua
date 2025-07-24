-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:42
-- Luau version 6, Types version 3
-- Time taken: 0.001188 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local Humanoid_upvw = LocalPlayer_upvr.Character:WaitForChild("Humanoid")
local HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 8
	--[[ Upvalues[4]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: HumanoidRootPart_upvw (read and write)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
end)
task.wait(1)
local var6
while task.wait(0.2) do
	if Character_upvw and HumanoidRootPart_upvw and Character_upvw.Parent and HumanoidRootPart_upvw.Parent then
		local any_GetRegion_result1 = require(game.ReplicatedStorage.Regions.RegionModule):GetRegion(HumanoidRootPart_upvw.Position)
		if any_GetRegion_result1 and (not var6 or var6.Name ~= any_GetRegion_result1.Name) then
			local var8 = any_GetRegion_result1
			script.Parent.CurrentRegion.Value = var8.Name
			game.ReplicatedStorage.Regions.ClientChangedRegion:FireServer(var8.Name)
		end
		if Humanoid_upvw.Health <= 0 then
			game.ReplicatedStorage.Regions.ClientChangedRegion:FireServer("")
		end
	end
end