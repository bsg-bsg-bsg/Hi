-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:30
-- Luau version 6, Types version 3
-- Time taken: 0.002083 seconds

local module_upvr = {}
local any_IsClient_result1_upvr = game:GetService("RunService"):IsClient()
function module_upvr.TeleportCharacter(arg1, arg2) -- Line 5
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: any_IsClient_result1_upvr (readonly)
	]]
	local any_GetVehicle_result1 = module_upvr.GetVehicle(arg1)
	if any_GetVehicle_result1 then
		for _, v in pairs(any_GetVehicle_result1:GetDescendants()) do
			if not any_IsClient_result1_upvr and v:IsA("Attachment") and v.Name == "HitchAttachment" then
				v:Destroy()
			elseif any_IsClient_result1_upvr and v.Name == "HitchedTrailer" and v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("ButtonRemote_HitchButton") then
				game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(v.Value.ButtonRemote_HitchButton)
			end
		end
		any_GetVehicle_result1:PivotTo(arg2 * arg1.PrimaryPart.CFrame:toObjectSpace(any_GetVehicle_result1.PrimaryPart.CFrame))
	end
	arg1:PivotTo(arg2)
end
function module_upvr.GetVehicle(arg1) -- Line 23
	local SeatPart = arg1.Humanoid.SeatPart
	if SeatPart and not SeatPart.Anchored then
		return SeatPart.Parent
	end
end
function module_upvr.GetMechanismAssemblyParts(arg1) -- Line 32
	-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
	local PrimaryPart = arg1.PrimaryPart
	if not PrimaryPart then
		PrimaryPart = arg1:FindFirstChild("Main")
		if not PrimaryPart then
			PrimaryPart = arg1:FindFirstChildWhichIsA("BasePart")
		end
	end
	if not PrimaryPart then
		warn("Couldn't find main part for mechanism: ", arg1)
		return {}
	end
	;({})[1] = PrimaryPart
	;({})[PrimaryPart] = PrimaryPart:GetConnectedParts(true)
	local pairs_result1, pairs_result2_3, pairs_result3 = pairs(arg1:GetDescendants())
	-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [76] 58. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [76] 58. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 30. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [76.9]
	-- KONSTANTERROR: [40] 30. Error Block 7 end (CF ANALYSIS FAILED)
end
return module_upvr