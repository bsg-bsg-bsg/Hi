-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:35
-- Luau version 6, Types version 3
-- Time taken: 0.014313 seconds

local any_IsClient_result1_upvr = game:GetService("RunService"):IsClient()
if any_IsClient_result1_upvr then
	any_IsClient_result1_upvr = require(game.Players.LocalPlayer.PlayerGui:WaitForChild("Scripts"):WaitForChild("UserInput"))
end
SuperAxe = {} -- Setting global
SuperAxe.__index = SuperAxe
function SuperAxe.new(arg1) -- Line 18
	local module_upvr = {}
	setmetatable(module_upvr, SuperAxe)
	local var11
	if not arg1 then
		return module_upvr
	end
	var11 = game.Players.LocalPlayer
	module_upvr.Player = var11
	var11 = module_upvr.Player.Character
	if not var11 then
		var11 = module_upvr.Player.CharacterAdded:wait()
	end
	module_upvr.Character = var11
	module_upvr.Humanoid = module_upvr.Character:WaitForChild("Humanoid")
	for i, v in pairs(arg1:GetChildren()) do
		if v:IsA("LocalScript") then
		end
	end
	if 2 < 0 + 1 then
		i = game
		v = module_upvr.Player.Name
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		i = v.." instanciated axe with "..(0 + 1).." local scripts"
		i.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", i)
		arg1:Destroy()
		return
	end
	local any_InvokeServer_result1, any_InvokeServer_result2 = game.ReplicatedStorage.Interaction.ConfirmIdentity:InvokeServer(arg1, arg1.ToolName.Value)
	if not any_InvokeServer_result1 then
		game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", module_upvr.Player.Name.." instanciated axe that could not be confirmed: "..any_InvokeServer_result2)
		arg1:Destroy()
		return
	end
	module_upvr.Tool = arg1
	arg1.ToolTip = game.ReplicatedStorage.ClientItemInfo:FindFirstChild(arg1.ToolName.Value).ItemName.Value
	module_upvr.Tool.Enabled = true
	module_upvr.Equipped = false
	module_upvr.Tool.Handle.CanCollide = false
	module_upvr.SlashSound = Instance.new("Sound")
	module_upvr.SlashSound.SoundId = "rbxasset://sounds\\swordslash.wav"
	module_upvr.SlashSound.Pitch = 0.95
	module_upvr.SlashSound.Volume = 0.25
	module_upvr.TorsoGyro = Instance.new("BodyGyro")
	module_upvr.TorsoGyro.Name = "AxeTorsoGyro"
	module_upvr.TorsoGyro.D = 2
	module_upvr.TorsoGyro.P = 15000
	module_upvr.TorsoGyro.maxTorque = Vector3.new(0, 10000, 0)
	Instance.new("NumberValue", arg1).Name = "Range"
	module_upvr.ToolEnabledTick = module_upvr.Player.ToolEnableTick
	module_upvr.InteractPermission = require(game.ReplicatedStorage.Interaction.InteractionPermission)
	module_upvr.Input = require(module_upvr.Player.PlayerGui.Scripts.UserInput)
	module_upvr.Tool.Activated:connect(function(...) -- Line 81
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:OnActivated(...)
	end)
	module_upvr.Tool.Deactivated:connect(function(...) -- Line 82
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:OnDeactivated(...)
	end)
	module_upvr.Tool.Equipped:connect(function(...) -- Line 83
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:onEquipped(...)
	end)
	module_upvr.Tool.Unequipped:connect(function(...) -- Line 84
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		module_upvr:onUnequipped(...)
	end)
	module_upvr.Animations = {}
	module_upvr.AnimationsSetup = true
	for _, v_2 in pairs(script:GetChildren()) do
		if v_2:IsA("Animation") then
			module_upvr.Animations[v_2.Name] = module_upvr.Humanoid:LoadAnimation(v_2)
		end
	end
	module_upvr.Ping = 0.2
	return module_upvr
end
local var24_upvw = false
function SuperAxe.OnActivated(arg1) -- Line 125
	--[[ Upvalues[2]:
		[1]: any_IsClient_result1_upvr (readonly)
		[2]: var24_upvw (read and write)
	]]
	if arg1.MouseDownLoop then
		task.cancel(arg1.MouseDownLoop)
	end
	local mouse_upvr = arg1.Player:GetMouse()
	mouse_upvr.TargetFilter = workspace.Effects
	if any_IsClient_result1_upvr.Device == "Touch" then
		local var26_upvw = false
		local var28_upvw
		var28_upvw = mouse_upvr.Button1Down:Connect(function() -- Line 138
			--[[ Upvalues[4]:
				[1]: var26_upvw (read and write)
				[2]: var28_upvw (read and write)
				[3]: arg1 (readonly)
				[4]: mouse_upvr (readonly)
			]]
			var26_upvw = true
			var28_upvw:Disconnect()
			var28_upvw = nil
			arg1.MouseButtonUpConnection = mouse_upvr.Button1Up:Connect(function() -- Line 142
				--[[ Upvalues[1]:
					[1]: arg1 (copied, readonly)
				]]
				arg1:Deactivate()
			end)
		end)
		task.delay(arg1.SwingCooldown * 0.5, function() -- Line 147
			--[[ Upvalues[3]:
				[1]: var26_upvw (read and write)
				[2]: arg1 (readonly)
				[3]: var28_upvw (read and write)
			]]
			if not var26_upvw then
				arg1:Deactivate()
				if var28_upvw then
					var28_upvw:Disconnect()
				end
			end
		end)
	end
	arg1.MouseDownLoop = task.spawn(function() -- Line 157
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var24_upvw (copied, read and write)
		]]
		while true do
			local tick_result1 = tick()
			if arg1.ToolEnabledTick.Value < tick_result1 then
				if not arg1.Character:FindFirstChild("Humanoid") or arg1.Character.Humanoid.Health <= 0 then return end
				arg1.ToolEnabledTick.Value = tick_result1 + arg1.SwingCooldown
				local any_AttemptChop_result1, _ = arg1:AttemptChop()
				if any_AttemptChop_result1 then
					arg1.ToolEnabledTick.Value = tick_result1 + arg1.SwingCooldown * 1.25
					task.spawn(function() -- Line 174
						--[[ Upvalues[2]:
							[1]: arg1 (copied, readonly)
							[2]: var24_upvw (copied, read and write)
						]]
						arg1:Animate(arg1.Input.GetMouseHit().p)
						if not var24_upvw then
							var24_upvw = true
							task.wait(2)
							game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("ChoppedWood")
						end
					end)
				else
					local StringValue = Instance.new("StringValue")
					StringValue.Name = "toolanim"
					StringValue.Value = "Slash"
					StringValue.Parent = arg1.Tool
					arg1.Tool.Enabled = true
					arg1.ToolEnabledTick.Value = tick_result1 + arg1.SwingCooldown * 0.3
				end
			end
			task.wait()
		end
	end)
end
function SuperAxe.OnDeactivated(arg1) -- Line 198
	--[[ Upvalues[1]:
		[1]: any_IsClient_result1_upvr (readonly)
	]]
	if any_IsClient_result1_upvr.Device ~= "Touch" then
		arg1:Deactivate()
	end
end
function SuperAxe.Deactivate(arg1) -- Line 204
	if arg1.MouseDownLoop then
		task.cancel(arg1.MouseDownLoop)
		arg1.MouseDownLoop = nil
		arg1.ToolEnabledTick.Value = arg1.ToolEnabledTick.Value - 0.25 * arg1.SwingCooldown
	end
	if arg1.MouseButtonUpConnection then
		arg1.MouseButtonUpConnection:Disconnect()
		arg1.MouseButtonUpConnection = nil
	end
end
local GetItem_upvr = require(game.ReplicatedStorage.Util.GetItem)
function SuperAxe.AttemptChop(arg1) -- Line 217
	--[[ Upvalues[1]:
		[1]: GetItem_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local any_GetMouseTarget_result1 = arg1.Input.GetMouseTarget()
	local var52 = any_GetMouseTarget_result1
	if var52 then
		var52 = any_GetMouseTarget_result1.Parent:FindFirstChild("CutEvent")
	end
	if any_GetMouseTarget_result1 then
		if any_GetMouseTarget_result1.Parent:FindFirstChild("TreeClass") then
			local Value = any_GetMouseTarget_result1.Parent.TreeClass.Value
		end
	end
	local var37_result1 = GetItem_upvr(any_GetMouseTarget_result1)
	if not var52 or not any_GetMouseTarget_result1:FindFirstChild("ID") or not var37_result1 then return end
	if not arg1.InteractPermission:UserCanInteract(arg1.Player, var37_result1, "Interact") then return end
	local p_2 = arg1.Input.GetMouseHit().p
	local var56 = any_GetMouseTarget_result1.CFrame:pointToObjectSpace(p_2).Y + any_GetMouseTarget_result1.Size.Y / 2
	local workspace_FindPartOnRay_result1_2, _, workspace_FindPartOnRay_result3 = workspace:FindPartOnRay(Ray.new(arg1.Character.Head.Position, ((any_GetMouseTarget_result1.CFrame * CFrame.new(0, var56 - any_GetMouseTarget_result1.Size.Y / 2, 0)).p - arg1.Character.Head.Position).unit * arg1.Range), arg1.Character)
	if workspace_FindPartOnRay_result1_2 ~= any_GetMouseTarget_result1 and (not workspace_FindPartOnRay_result1_2 or workspace_FindPartOnRay_result1_2.Parent ~= any_GetMouseTarget_result1.Parent) then return end
	local fixVector_result1 = fixVector(any_GetMouseTarget_result1.CFrame:vectorToObjectSpace(workspace_FindPartOnRay_result3))
	if fixVector_result1.Y ~= 0 then return end
	if 0 <= CFrame.new(arg1.Character.Head.Position, p_2):toObjectSpace(any_GetMouseTarget_result1.CFrame * CFrame.Angles((math.pi/2), 0, 0)).lookVector.Y then
	else
	end
	if fixVector_result1.X == 1 then
	elseif (Vector3.new(0, 0, -1) * -1).X == -1 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	elseif (Vector3.new(0, 0, 1) * -1).Z == 1 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	elseif (Vector3.new(1, 0, 0) * -1).Z == -1 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	end
	arg1.TargetWood = any_GetMouseTarget_result1.Parent
	local var61
	if arg1.SpecialTrees and arg1.SpecialTrees[Value] then
		var61 = arg1.SpecialTrees[Value].Damage or var61
	elseif arg1.OnProcessedWood and any_GetMouseTarget_result1:IsDescendantOf(workspace.PlayerModels) then
		var61 = arg1.OnProcessedWood.Damage or var61
	end
	game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(var52, {
		sectionId = any_GetMouseTarget_result1.ID.Value;
		faceVector = Vector3.new(-1, 0, 0) * -1;
		height = var56;
		hitPoints = var61;
		cooldown = 0.65 * (arg1.OnProcessedWood.SwingCooldown or arg1.SpecialTrees[Value].SwingCooldown or arg1.SwingCooldown) - arg1.Ping;
		cuttingClass = "Axe";
		tool = arg1.Tool;
	})
	return true
end
function fixVector(arg1) -- Line 292
	return Vector3.new(math.floor(arg1.X + 0.5), math.floor(arg1.Y + 0.5), math.floor(arg1.Z + 0.5))
end
local var63_upvw = 0
local any_WaitForReady_result1_upvr = require(game.ReplicatedStorage:WaitForChild("ChinaPolicyService")):WaitForReady()
function SuperAxe.Animate(arg1, arg2) -- Line 300
	--[[ Upvalues[2]:
		[1]: var63_upvw (read and write)
		[2]: any_WaitForReady_result1_upvr (readonly)
	]]
	var63_upvw = tick()
	local var67
	if not arg1.Character.HumanoidRootPart:FindFirstChild("TorsoGyro") then
		var67 = Enum.HumanoidStateType.Seated
		if arg1.Humanoid:GetState() ~= var67 then
			var67 = CFrame.new(arg1.Character.HumanoidRootPart.Position, arg2)
			arg1.TorsoGyro.cframe = var67
			var67 = arg1.Character.HumanoidRootPart
			arg1.TorsoGyro.Parent = var67
		end
	end
	var67 = arg1.Character.Head.CFrame:pointToObjectSpace(arg2)
	local unit_2 = var67.unit
	if unit_2.Y < -0.6 then
		var67 = "AxeSwing1"
	elseif unit_2.Y < -0.2 then
		var67 = "AxeSwing2"
	elseif unit_2.Y < 0.2 then
		var67 = "AxeSwing3"
	elseif unit_2.Y < 0.6 then
		var67 = "AxeSwing4"
	else
		var67 = false
		if unit_2.Y < 1 then
			var67 = "AxeSwing5"
		end
	end
	if not any_WaitForReady_result1_upvr then
		arg1.Animations[var67]:Play(0.1, 1, 1 / arg1.SwingCooldown)
	end
	arg1.SlashSound:play()
	task.wait(0.8)
	if var63_upvw == var63_upvw then
		arg1.TorsoGyro.Parent = nil
	end
end
function SuperAxe.onEquipped(arg1) -- Line 334
	arg1.Equipped = true
	local Range = arg1.Range
	if not Range then
		Range = arg1.Tool.Range.Value
	end
	arg1.Tool.Range.Value = Range
	task.wait()
	game.ReplicatedStorage.TestPing:InvokeServer()
	arg1.Ping = (tick() - tick()) / 2
end
function SuperAxe.onUnequipped(arg1) -- Line 347
	arg1.Equipped = false
	arg1.TorsoGyro.Parent = nil
	arg1:Deactivate()
	for _, v_3 in pairs(arg1.Animations) do
		v_3:Stop()
	end
end
return SuperAxe