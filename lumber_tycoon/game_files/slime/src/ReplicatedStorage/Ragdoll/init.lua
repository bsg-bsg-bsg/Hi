-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:28
-- Luau version 6, Types version 3
-- Time taken: 0.005045 seconds

local module = {}
local Players_upvr = game:GetService("Players")
if game:GetService("RunService"):IsServer() then
	local RemoteEvent_upvr = Instance.new("RemoteEvent")
	RemoteEvent_upvr.Name = "Event"
	RemoteEvent_upvr.Parent = script
	local var6_upvw = false
	local CollectionService_upvr = game:GetService("CollectionService")
	local module_2_upvr = require(script:WaitForChild("RigTypes"))
	local function activateRagdoll_upvr(arg1, arg2) -- Line 27, Named "activateRagdoll"
		--[[ Upvalues[4]:
			[1]: CollectionService_upvr (readonly)
			[2]: module_2_upvr (readonly)
			[3]: Players_upvr (readonly)
			[4]: RemoteEvent_upvr (readonly)
		]]
		assert(arg2:IsDescendantOf(arg1))
		if CollectionService_upvr:HasTag(arg1, "__Ragdoll_Active") then
		else
			CollectionService_upvr:AddTag(arg1, "__Ragdoll_Active")
			local any_GetPlayerFromCharacter_result1 = Players_upvr:GetPlayerFromCharacter(arg1)
			if any_GetPlayerFromCharacter_result1 then
				RemoteEvent_upvr:FireClient(any_GetPlayerFromCharacter_result1, arg1, arg2)
			end
			arg2:ChangeState(Enum.HumanoidStateType.Physics)
			for i_3, v_3 in pairs(module_2_upvr:GetAttachments(arg1, arg2)) do
				local SOME = arg1:FindFirstChild(i_3)
				if SOME then
					local BallSocketConstraint = Instance.new("BallSocketConstraint")
					BallSocketConstraint.Attachment0 = v_3[1]
					BallSocketConstraint.Attachment1 = v_3[2]
					if SOME.Name == "Head" then
						BallSocketConstraint.LimitsEnabled = true
						BallSocketConstraint.UpperAngle = 60
						BallSocketConstraint.TwistLimitsEnabled = true
						BallSocketConstraint.TwistLowerAngle = -60
						BallSocketConstraint.TwistUpperAngle = 60
					end
					BallSocketConstraint.Parent = SOME
				end
			end
			for _, v_4 in pairs(arg1:GetDescendants()) do
				if v_4:IsA("Motor6D") then
					v_4:Destroy()
				end
			end
		end
	end
	local function _(arg1, arg2) -- Line 72, Named "onHumanoidAdded"
		--[[ Upvalues[2]:
			[1]: var6_upvw (read and write)
			[2]: activateRagdoll_upvr (readonly)
		]]
		arg2.BreakJointsOnDeath = not var6_upvw
		arg2.Died:Connect(function() -- Line 75
			--[[ Upvalues[4]:
				[1]: var6_upvw (copied, read and write)
				[2]: arg2 (readonly)
				[3]: activateRagdoll_upvr (copied, readonly)
				[4]: arg1 (readonly)
			]]
			if var6_upvw then
				arg2.BreakJointsOnDeath = false
				activateRagdoll_upvr(arg1, arg2)
			end
		end)
	end
	local function onCharacterAdded_upvr(arg1) -- Line 86, Named "onCharacterAdded"
		--[[ Upvalues[2]:
			[1]: var6_upvw (read and write)
			[2]: activateRagdoll_upvr (readonly)
		]]
		local class_Humanoid_3_upvr = arg1:FindFirstChildOfClass("Humanoid")
		if class_Humanoid_3_upvr then
			class_Humanoid_3_upvr.BreakJointsOnDeath = not var6_upvw
			class_Humanoid_3_upvr.Died:Connect(function() -- Line 75
				--[[ Upvalues[4]:
					[1]: var6_upvw (copied, read and write)
					[2]: class_Humanoid_3_upvr (readonly)
					[3]: activateRagdoll_upvr (copied, readonly)
					[4]: arg1 (readonly)
				]]
				if var6_upvw then
					class_Humanoid_3_upvr.BreakJointsOnDeath = false
					activateRagdoll_upvr(arg1, class_Humanoid_3_upvr)
				end
			end)
		else
			arg1.ChildAdded:Connect(function(arg1_2) -- Line 92
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: var6_upvw (copied, read and write)
					[3]: activateRagdoll_upvr (copied, readonly)
				]]
				if arg1_2:IsA("Humanoid") then
					arg1_2.BreakJointsOnDeath = not var6_upvw
					arg1_2.Died:Connect(function() -- Line 75
						--[[ Upvalues[4]:
							[1]: var6_upvw (copied, read and write)
							[2]: arg1_2 (readonly)
							[3]: activateRagdoll_upvr (copied, readonly)
							[4]: arg1 (readonly)
						]]
						if var6_upvw then
							arg1_2.BreakJointsOnDeath = false
							activateRagdoll_upvr(arg1, arg1_2)
						end
					end)
				end
			end)
		end
	end
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 102, Named "onPlayerAdded"
		--[[ Upvalues[3]:
			[1]: onCharacterAdded_upvr (readonly)
			[2]: var6_upvw (read and write)
			[3]: activateRagdoll_upvr (readonly)
		]]
		arg1.CharacterAdded:Connect(onCharacterAdded_upvr)
		if arg1.Character then
			local Character_upvr_2 = arg1.Character
			local class_Humanoid_6_upvr = Character_upvr_2:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_6_upvr then
				class_Humanoid_6_upvr.BreakJointsOnDeath = not var6_upvw
				class_Humanoid_6_upvr.Died:Connect(function() -- Line 75
					--[[ Upvalues[4]:
						[1]: var6_upvw (copied, read and write)
						[2]: class_Humanoid_6_upvr (readonly)
						[3]: activateRagdoll_upvr (copied, readonly)
						[4]: Character_upvr_2 (readonly)
					]]
					if var6_upvw then
						class_Humanoid_6_upvr.BreakJointsOnDeath = false
						activateRagdoll_upvr(Character_upvr_2, class_Humanoid_6_upvr)
					end
				end)
				return
			end
			Character_upvr_2.ChildAdded:Connect(function(arg1_3) -- Line 92
				--[[ Upvalues[3]:
					[1]: Character_upvr_2 (readonly)
					[2]: var6_upvw (copied, read and write)
					[3]: activateRagdoll_upvr (copied, readonly)
				]]
				if arg1_3:IsA("Humanoid") then
					arg1_3.BreakJointsOnDeath = not var6_upvw
					arg1_3.Died:Connect(function() -- Line 75
						--[[ Upvalues[4]:
							[1]: var6_upvw (copied, read and write)
							[2]: arg1_3 (readonly)
							[3]: activateRagdoll_upvr (copied, readonly)
							[4]: Character_upvr_2 (readonly)
						]]
						if var6_upvw then
							arg1_3.BreakJointsOnDeath = false
							activateRagdoll_upvr(Character_upvr_2, arg1_3)
						end
					end)
				end
			end)
		end
	end)
	for _, v in pairs(Players_upvr:GetPlayers()) do
		v.CharacterAdded:Connect(onCharacterAdded_upvr)
		if v.Character then
			local Character_upvr = v.Character
			local class_Humanoid_5_upvr = Character_upvr:FindFirstChildOfClass("Humanoid")
			if class_Humanoid_5_upvr then
				class_Humanoid_5_upvr.BreakJointsOnDeath = not var6_upvw
				class_Humanoid_5_upvr.Died:Connect(function() -- Line 75
					--[[ Upvalues[4]:
						[1]: var6_upvw (read and write)
						[2]: class_Humanoid_5_upvr (readonly)
						[3]: activateRagdoll_upvr (readonly)
						[4]: Character_upvr (readonly)
					]]
					if var6_upvw then
						class_Humanoid_5_upvr.BreakJointsOnDeath = false
						activateRagdoll_upvr(Character_upvr, class_Humanoid_5_upvr)
					end
				end)
			else
				Character_upvr.ChildAdded:Connect(function(arg1) -- Line 92
					--[[ Upvalues[3]:
						[1]: Character_upvr (readonly)
						[2]: var6_upvw (read and write)
						[3]: activateRagdoll_upvr (readonly)
					]]
					if arg1:IsA("Humanoid") then
						arg1.BreakJointsOnDeath = not var6_upvw
						arg1.Died:Connect(function() -- Line 75
							--[[ Upvalues[4]:
								[1]: var6_upvw (copied, read and write)
								[2]: arg1 (readonly)
								[3]: activateRagdoll_upvr (copied, readonly)
								[4]: Character_upvr (readonly)
							]]
							if var6_upvw then
								arg1.BreakJointsOnDeath = false
								activateRagdoll_upvr(Character_upvr, arg1)
							end
						end)
					end
				end)
			end
		end
	end
	local function Activate(arg1, arg2) -- Line 116
		--[[ Upvalues[1]:
			[1]: activateRagdoll_upvr (readonly)
		]]
		if typeof(arg2) ~= "Instance" or not arg2:IsA("Model") then
			error("bad argument #1 to 'Activate' (Model expected, got "..typeof(arg2)..')', 2)
		end
		local class_Humanoid_2 = arg2:FindFirstChildOfClass("Humanoid")
		if not class_Humanoid_2 then
			return warn("[Ragdoll] Could not ragdoll "..arg2:GetFullName().." because it has no Humanoid")
		end
		activateRagdoll_upvr(arg2, class_Humanoid_2)
	end
	module.Activate = Activate
	local function SetPlayerDefault(arg1, arg2) -- Line 131
		--[[ Upvalues[2]:
			[1]: var6_upvw (read and write)
			[2]: Players_upvr (readonly)
		]]
		if arg2 ~= nil and typeof(arg2) ~= "boolean" then
			error("bad argument #1 to 'SetPlayerDefault' (boolean expected, got "..typeof(arg2)..')', 2)
		end
		var6_upvw = arg2
		for _, v_2 in pairs(Players_upvr:GetPlayers()) do
			if v_2.Character then
				local class_Humanoid = v_2.Character:FindFirstChildOfClass("Humanoid")
				if class_Humanoid then
					class_Humanoid.BreakJointsOnDeath = not var6_upvw
				end
			end
		end
	end
	module.SetPlayerDefault = SetPlayerDefault
	return module
end
RemoteEvent_upvr = script:WaitForChild("Event").OnClientEvent
RemoteEvent_upvr = RemoteEvent_upvr:Connect
RemoteEvent_upvr(function(arg1, arg2) -- Line 153
	local Head = arg1:FindFirstChild("Head")
	if Head then
		workspace.CurrentCamera.CameraSubject = Head
	end
	arg2:ChangeState(Enum.HumanoidStateType.Physics)
end)
function RemoteEvent_upvr(arg1) -- Line 164, Named "Activate"
	error("Ragdoll::Activate cannot be used from the client", 2)
end
module.Activate = RemoteEvent_upvr
function RemoteEvent_upvr(arg1) -- Line 168, Named "SetPlayerDefault"
	error("Ragdoll::SetPlayerDefault cannot be used from the client", 2)
end
module.SetPlayerDefault = RemoteEvent_upvr
return module