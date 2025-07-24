-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:41
-- Luau version 6, Types version 3
-- Time taken: 0.021698 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local RunService_upvr = game:GetService("RunService")
local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 18
	--[[ Upvalues[2]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	Character_upvw = LocalPlayer_upvr.Character
end)
local mouse_upvr = LocalPlayer_upvr:GetMouse()
local module_upvr = {
	Device = "PC";
	MouseLocation = Vector2.new();
}
task.wait()
local CurrentCamera_upvr = game.Workspace.CurrentCamera
function getMouseRay() -- Line 30
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
	]]
	local MouseLocation = module_upvr.MouseLocation
	local any_ViewportPointToRay_result1 = CurrentCamera_upvr:ViewportPointToRay(MouseLocation.X, MouseLocation.Y, 0)
	return Ray.new(any_ViewportPointToRay_result1.Origin, any_ViewportPointToRay_result1.Direction * 900)
end
function getMouseHit() -- Line 36
	--[[ Upvalues[2]:
		[1]: Character_upvw (read and write)
		[2]: mouse_upvr (readonly)
	]]
	local _, workspace_FindPartOnRayWithIgnoreList_result2 = workspace:FindPartOnRayWithIgnoreList(getMouseRay(), {Character_upvw, mouse_upvr.TargetFilter})
	return CFrame.new(workspace_FindPartOnRayWithIgnoreList_result2)
end
function getMouseTarget() -- Line 43
	--[[ Upvalues[2]:
		[1]: Character_upvw (read and write)
		[2]: mouse_upvr (readonly)
	]]
	local workspace_FindPartOnRayWithIgnoreList_result1, _ = workspace:FindPartOnRayWithIgnoreList(getMouseRay(), {Character_upvw, mouse_upvr.TargetFilter})
	return workspace_FindPartOnRayWithIgnoreList_result1
end
local any_GetGuiInset_result1_upvr = game:GetService("GuiService"):GetGuiInset()
local PlayerGui_upvr = LocalPlayer_upvr.PlayerGui
function getButton() -- Line 50
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: any_GetGuiInset_result1_upvr (readonly)
		[3]: PlayerGui_upvr (readonly)
	]]
	local var36_upvr = UserInputService_upvr:GetMouseLocation() - any_GetGuiInset_result1_upvr
	local function recurse_upvr(arg1) -- Line 52, Named "recurse"
		--[[ Upvalues[2]:
			[1]: var36_upvr (readonly)
			[2]: recurse_upvr (readonly)
		]]
		for _, v in pairs(arg1:GetChildren()) do
			if v:IsA("GuiObject") and v.Visible then
				if v:IsA("GuiButton") and v.AbsolutePosition.X <= var36_upvr.X then
					if v.AbsolutePosition.Y <= var36_upvr.Y and var36_upvr.X < v.AbsolutePosition.X + v.AbsoluteSize.X and var36_upvr.Y < v.AbsolutePosition.Y + v.AbsoluteSize.Y then
						return v
					end
				end
				local recurse_upvr_result1 = recurse_upvr(v)
				if recurse_upvr_result1 then
					return recurse_upvr_result1
				end
			end
		end
	end
	for _, v_2 in pairs(PlayerGui_upvr:GetChildren()) do
		if v_2:IsA("LayerCollector") then
			if v_2.Enabled then
				local recurse_result1 = recurse_upvr(v_2)
				if recurse_result1 then
					return recurse_result1
				end
			end
		end
	end
end
local any_GetControls_result1_upvr = require(LocalPlayer_upvr.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
function getMoveVector() -- Line 77
	--[[ Upvalues[1]:
		[1]: any_GetControls_result1_upvr (readonly)
	]]
	return any_GetControls_result1_upvr:GetMoveVector()
end
local var48_upvw = false
local var49_upvw = false
local var50_upvw = false
local var51_upvw = false
local var52_upvw = false
local var53_upvw = false
function setKey(arg1) -- Line 90
	--[[ Upvalues[6]:
		[1]: var48_upvw (read and write)
		[2]: var49_upvw (read and write)
		[3]: var51_upvw (read and write)
		[4]: var50_upvw (read and write)
		[5]: var52_upvw (read and write)
		[6]: var53_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var54
	if var54 == Enum.KeyCode.A or arg1.KeyCode == Enum.KeyCode.Left then
		if arg1.UserInputState ~= Enum.UserInputState.Begin then
		else
		end
		var48_upvw = true
	else
		local var55
		if var55 == Enum.KeyCode.D or arg1.KeyCode == Enum.KeyCode.Right then
			if arg1.UserInputState ~= Enum.UserInputState.Begin then
			else
			end
			var49_upvw = true
			return
		end
		local var56
		if var56 == Enum.KeyCode.S or arg1.KeyCode == Enum.KeyCode.Down then
			if arg1.UserInputState ~= Enum.UserInputState.Begin then
			else
			end
			var51_upvw = true
			return
		end
		local var57
		if var57 == Enum.KeyCode.W or arg1.KeyCode == Enum.KeyCode.Up then
			if arg1.UserInputState ~= Enum.UserInputState.Begin then
			else
			end
			var50_upvw = true
			return
		end
		local KeyCode = arg1.KeyCode
		if KeyCode == Enum.KeyCode.Q then
			if arg1.UserInputState ~= Enum.UserInputState.Begin then
				KeyCode = false
			else
				KeyCode = true
			end
			var52_upvw = KeyCode
			return
		end
		KeyCode = arg1.KeyCode
		if KeyCode == Enum.KeyCode.E then
			if arg1.UserInputState ~= Enum.UserInputState.Begin then
				KeyCode = false
			else
				KeyCode = true
			end
			var53_upvw = KeyCode
		end
	end
end
function getThrottleFromKeys() -- Line 106
	--[[ Upvalues[2]:
		[1]: var51_upvw (read and write)
		[2]: var50_upvw (read and write)
	]]
	local var59
	if var51_upvw then
		var59 -= 1
	end
	if var50_upvw then
		var59 += 1
	end
	return var59
end
function getSteerFromKeys() -- Line 117
	--[[ Upvalues[2]:
		[1]: var48_upvw (read and write)
		[2]: var49_upvw (read and write)
	]]
	local var60
	if var48_upvw then
		var60 -= 1
	end
	if var49_upvw then
		var60 += 1
	end
	return var60
end
function getTwistFromKeys() -- Line 128
	--[[ Upvalues[2]:
		[1]: var52_upvw (read and write)
		[2]: var53_upvw (read and write)
	]]
	local var61
	if var52_upvw then
		var61 -= 1
	end
	if var53_upvw then
		var61 += 1
	end
	return var61
end
function steerChange(arg1) -- Line 140
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_2, arg2) -- Line 141
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [1] 2. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [1] 2. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [13] 8. Error Block 4 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [13] 8. Error Block 4 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 9. Error Block 5 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 9. Error Block 5 end (CF ANALYSIS FAILED)
	end)
	UserInputService_upvr.InputEnded:connect(function(arg1_3, arg2) -- Line 153
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [1] 2. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [1] 2. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [13] 8. Error Block 4 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [13] 8. Error Block 4 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 9. Error Block 5 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [14] 9. Error Block 5 end (CF ANALYSIS FAILED)
	end)
	UserInputService_upvr.InputChanged:connect(function(arg1_4, arg2) -- Line 164
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_4.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_4.KeyCode == Enum.KeyCode.Thumbstick1 then
			arg1(scaleDeadzone(arg1_4.Position).X)
		end
	end)
	RunService_upvr.Stepped:Connect(function() -- Line 173
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if module_upvr.Device == "Touch" then
			arg1(math.clamp(getMoveVector().X, -1, 1))
		end
	end)
end
local var66_upvw = 0
local var67_upvw = 0
function throttleChange(arg1) -- Line 185
	--[[ Upvalues[5]:
		[1]: UserInputService_upvr (readonly)
		[2]: var66_upvw (read and write)
		[3]: var67_upvw (read and write)
		[4]: RunService_upvr (readonly)
		[5]: module_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_5, arg2) -- Line 186
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: var66_upvw (copied, read and write)
			[3]: var67_upvw (copied, read and write)
		]]
		if arg1_5.UserInputType ~= Enum.UserInputType.Gamepad1 and (arg1_5.UserInputType ~= Enum.UserInputType.Keyboard or arg2) then
		else
			if arg1_5.KeyCode == Enum.KeyCode.W or arg1_5.KeyCode == Enum.KeyCode.S or arg1_5.KeyCode == Enum.KeyCode.Down or arg1_5.KeyCode == Enum.KeyCode.Up then
				setKey(arg1_5)
				arg1(getThrottleFromKeys())
				return
			end
			if arg1_5.KeyCode == Enum.KeyCode.ButtonR2 then
				var66_upvw = arg1_5.Position.Z
				arg1(arg1_5.Position.Z)
				return
			end
			if arg1_5.KeyCode == Enum.KeyCode.ButtonL2 then
				var67_upvw = arg1_5.Position.Z
				if var66_upvw < 0.05 then
					arg1(arg1_5.Position.Z * -1)
				end
			end
		end
	end)
	UserInputService_upvr.InputEnded:connect(function(arg1_6, arg2) -- Line 205
		--[[ Upvalues[3]:
			[1]: arg1 (readonly)
			[2]: var66_upvw (copied, read and write)
			[3]: var67_upvw (copied, read and write)
		]]
		if arg1_6.UserInputType ~= Enum.UserInputType.Gamepad1 and (arg1_6.UserInputType ~= Enum.UserInputType.Keyboard or arg2) then
		else
			if arg1_6.KeyCode == Enum.KeyCode.W or arg1_6.KeyCode == Enum.KeyCode.S or arg1_6.KeyCode == Enum.KeyCode.Down or arg1_6.KeyCode == Enum.KeyCode.Up then
				setKey(arg1_6)
				arg1(getThrottleFromKeys())
				return
			end
			if arg1_6.KeyCode == Enum.KeyCode.ButtonR2 then
				var66_upvw = arg1_6.Position.Z
				if 0.05 < var67_upvw then
					arg1(var67_upvw * -1)
				else
					arg1(arg1_6.Position.Z)
				end
			end
			if arg1_6.KeyCode == Enum.KeyCode.ButtonL2 then
				var67_upvw = arg1_6.Position.Z
				if var66_upvw < 0.05 then
					arg1(arg1_6.Position.Z * -1)
				end
			end
		end
	end)
	UserInputService_upvr.InputChanged:connect(function(arg1_7, arg2) -- Line 228
		--[[ Upvalues[3]:
			[1]: var66_upvw (copied, read and write)
			[2]: arg1 (readonly)
			[3]: var67_upvw (copied, read and write)
		]]
		if arg1_7.UserInputType ~= Enum.UserInputType.Gamepad1 then
		else
			if arg1_7.KeyCode == Enum.KeyCode.ButtonR2 then
				var66_upvw = arg1_7.Position.Z
				arg1(arg1_7.Position.Z)
				return
			end
			if arg1_7.KeyCode == Enum.KeyCode.ButtonL2 then
				var67_upvw = arg1_7.Position.Z
				if var66_upvw < 0.05 then
					arg1(arg1_7.Position.Z * -1)
				end
			end
		end
	end)
	RunService_upvr.Stepped:Connect(function() -- Line 245
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if module_upvr.Device == "Touch" then
			local getMoveVector_result1 = getMoveVector()
			arg1(math.clamp(getMoveVector_result1.magnitude * math.clamp(-getMoveVector_result1.Z / 0.1, -1, 1), -1, 1))
		end
	end)
end
function vehicleToggleLights(arg1) -- Line 257
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_8, arg2) -- Line 258
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		elseif arg1_8.KeyCode == Enum.KeyCode.L or arg1_8.KeyCode == Enum.KeyCode.ButtonY then
			arg1()
		end
	end)
end
local var74_upvw = false
function clickBegan(arg1, arg2) -- Line 273
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: var74_upvw (read and write)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_9, arg2_2) -- Line 274
		--[[ Upvalues[3]:
			[1]: var74_upvw (copied, read and write)
			[2]: arg2 (readonly)
			[3]: arg1 (readonly)
		]]
		if arg1_9.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_9.UserInputType ~= Enum.UserInputType.MouseButton1 then
		else
			if arg1_9.KeyCode == Enum.KeyCode.ButtonR2 then
				var74_upvw = true
			end
			if arg1_9.KeyCode == Enum.KeyCode.ButtonR2 or arg1_9.UserInputType == Enum.UserInputType.MouseButton1 then
				if arg2 then
					arg2(1)
				end
				arg1()
			end
		end
	end)
	UserInputService_upvr.InputChanged:connect(function(arg1_10, arg2_3) -- Line 289
		--[[ Upvalues[2]:
			[1]: var74_upvw (copied, read and write)
			[2]: arg2 (readonly)
		]]
		if arg1_10.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_10.KeyCode == Enum.KeyCode.ButtonR2 then
			task.wait(0.24)
			if var74_upvw and arg2 then
				arg2(arg1_10.Position.Z)
			end
		end
	end)
end
function clickEnded(arg1) -- Line 302
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: var74_upvw (read and write)
	]]
	UserInputService_upvr.InputEnded:connect(function(arg1_11, arg2) -- Line 303
		--[[ Upvalues[2]:
			[1]: var74_upvw (copied, read and write)
			[2]: arg1 (readonly)
		]]
		if arg1_11.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_11.UserInputType ~= Enum.UserInputType.MouseButton1 then
		else
			if arg1_11.KeyCode == Enum.KeyCode.ButtonR2 then
				var74_upvw = false
			end
			if arg1_11.KeyCode == Enum.KeyCode.ButtonR2 or arg1_11.UserInputType == Enum.UserInputType.MouseButton1 then
				arg1()
			end
		end
	end)
end
function rotate(arg1) -- Line 317
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	local var78_upvw = 0
	UserInputService_upvr.InputBegan:connect(function(arg1_12, arg2) -- Line 320
		--[[ Upvalues[2]:
			[1]: var78_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 7. Error Block 29 start (CF ANALYSIS FAILED)
		if arg2 then
			if arg1_12.KeyCode ~= Enum.KeyCode.LeftShift then
				-- KONSTANTERROR: [19] 11. Error Block 5 start (CF ANALYSIS FAILED)
				do
					return
				end
				-- KONSTANTERROR: [19] 11. Error Block 5 end (CF ANALYSIS FAILED)
			end
		end
		-- KONSTANTERROR: [12] 7. Error Block 29 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 12. Error Block 32 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 12. Error Block 32 end (CF ANALYSIS FAILED)
	end)
	UserInputService_upvr.InputChanged:connect(function(arg1_13, arg2) -- Line 343
		--[[ Upvalues[2]:
			[1]: var78_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		if arg1_13.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_13.UserInputType ~= Enum.UserInputType.Keyboard then
		else
			if arg1_13.KeyCode == Enum.KeyCode.ButtonL2 then
				var78_upvw = arg1_13.Position.Z
			end
			if 0 < var78_upvw and arg1_13.KeyCode == Enum.KeyCode.Thumbstick1 then
				arg1(scaleDeadzone(arg1_13.Position), var78_upvw)
			end
		end
	end)
	UserInputService_upvr.InputEnded:connect(function(arg1_14, arg2) -- Line 359
		--[[ Upvalues[2]:
			[1]: var78_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [12] 7. Error Block 33 start (CF ANALYSIS FAILED)
		if arg2 then
			if arg1_14.KeyCode ~= Enum.KeyCode.LeftShift then
				-- KONSTANTERROR: [19] 11. Error Block 5 start (CF ANALYSIS FAILED)
				do
					return
				end
				-- KONSTANTERROR: [19] 11. Error Block 5 end (CF ANALYSIS FAILED)
			end
		end
		-- KONSTANTERROR: [12] 7. Error Block 33 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 12. Error Block 37 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [20] 12. Error Block 37 end (CF ANALYSIS FAILED)
	end)
	RunService_upvr.Stepped:Connect(function() -- Line 387
		--[[ Upvalues[2]:
			[1]: module_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		if module_upvr.Device == "Touch" then
			local getMoveVector_result1_2 = getMoveVector()
			arg1(Vector3.new(getMoveVector_result1_2.X, getMoveVector_result1_2.Z), 1)
		end
	end)
end
local var84_upvw = false
local var85_upvw = false
local const_number_upvw = 0
local var87_upvw = false
function cameraZoom(arg1) -- Line 406
	--[[ Upvalues[6]:
		[1]: UserInputService_upvr (readonly)
		[2]: var84_upvw (read and write)
		[3]: var85_upvw (read and write)
		[4]: const_number_upvw (read and write)
		[5]: var87_upvw (read and write)
		[6]: RunService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_15, arg2) -- Line 408
		--[[ Upvalues[6]:
			[1]: var84_upvw (copied, read and write)
			[2]: var85_upvw (copied, read and write)
			[3]: const_number_upvw (copied, read and write)
			[4]: var87_upvw (copied, read and write)
			[5]: arg1 (readonly)
			[6]: RunService_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 4. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [6] 4. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	UserInputService_upvr.InputEnded:connect(function(arg1_16, arg2) -- Line 441
		--[[ Upvalues[4]:
			[1]: var84_upvw (copied, read and write)
			[2]: var85_upvw (copied, read and write)
			[3]: var87_upvw (copied, read and write)
			[4]: arg1 (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 4. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [6] 4. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 5. Error Block 3 end (CF ANALYSIS FAILED)
	end)
end
function toggleFirstPerson(arg1) -- Line 464
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_17, arg2) -- Line 465
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_17.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_17.KeyCode == Enum.KeyCode.ButtonR3 then
			arg1()
		end
	end)
end
function gamePadEnabledChange(arg1) -- Line 478
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	arg1(UserInputService_upvr.GamepadEnabled)
	UserInputService_upvr.GamepadConnected:connect(function() -- Line 481
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1(true)
	end)
	UserInputService_upvr.GamepadDisconnected:connect(function() -- Line 485
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1(false)
	end)
	script.Parent.UserOverrideGamepad.Changed:connect(function() -- Line 489
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: UserInputService_upvr (copied, readonly)
		]]
		local GamepadEnabled = UserInputService_upvr.GamepadEnabled
		if GamepadEnabled then
			GamepadEnabled = not script.Parent.UserOverrideGamepad.Value
		end
		arg1(GamepadEnabled, true)
	end)
end
function isGamePadEnabled() -- Line 494
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var95
	if module_upvr.Device ~= "Gamepad" then
		var95 = false
	else
		var95 = true
	end
	return var95
end
function gamepadSelected(arg1) -- Line 499
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_18, arg2) -- Line 500
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_18.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_18.UserInputType ~= Enum.UserInputType.Keyboard then
		elseif arg1_18.KeyCode == Enum.KeyCode.ButtonA then
			arg1()
		end
	end)
end
function keyboardSelected(arg1) -- Line 510
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_19, arg2) -- Line 511
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_19.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_19.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_19.KeyCode == Enum.KeyCode.E then
				arg1()
			end
		end
	end)
end
function cameraStick(arg1) -- Line 525
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputChanged:connect(function(arg1_20, arg2) -- Line 527
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_20.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_20.KeyCode == Enum.KeyCode.Thumbstick2 then
			local scaleDeadzone_result1_2 = scaleDeadzone(arg1_20.Position)
			arg1(Vector2.new(scaleDeadzone_result1_2.X * -1, scaleDeadzone_result1_2.Y) * 6)
		end
	end)
end
function scaleDeadzone(arg1) -- Line 546
	local vector3 = Vector3.new(arg1.X, arg1.Y)
	if vector3.magnitude < 0.2 then
		vector3 = Vector3.new()
		return vector3
	end
	return (vector3.unit) * ((vector3.magnitude - 0.2) / 0.8)
end
function buttonA(arg1) -- Line 562
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_21, arg2) -- Line 563
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1_21.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_21.UserInputType ~= Enum.UserInputType.Keyboard then
		elseif arg1_21.KeyCode == Enum.KeyCode.ButtonA or arg1_21.KeyCode == Enum.KeyCode.E and not arg2 then
			arg1()
		end
	end)
end
function rotateProperty(arg1) -- Line 573
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_22, arg2) -- Line 574
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_22.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_22.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_22.KeyCode == Enum.KeyCode.ButtonY or arg1_22.KeyCode == Enum.KeyCode.R then
				arg1()
			end
		end
	end)
end
function interactSelectionMade(arg1) -- Line 587
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_23, arg2) -- Line 588
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_23.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_23.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_23.KeyCode == Enum.KeyCode.ButtonX or arg1_23.KeyCode == Enum.KeyCode.E then
				arg1()
			end
		end
	end)
end
function interactAbort(arg1) -- Line 600
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_24, arg2) -- Line 601
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_24.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_24.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_24.KeyCode == Enum.KeyCode.ButtonB or arg1_24.KeyCode == Enum.KeyCode.B then
				arg1()
			end
		end
	end)
end
function interactSelectionScroll(arg1) -- Line 617
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	local var106_upvw = 0
	UserInputService_upvr.InputChanged:connect(function(arg1_25, arg2) -- Line 622
		--[[ Upvalues[2]:
			[1]: var106_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		if arg1_25.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_25.KeyCode == Enum.KeyCode.Thumbstick1 then
			local scaleDeadzone_result1 = scaleDeadzone(arg1_25.Position)
			if 0.4 < scaleDeadzone_result1.Y and var106_upvw ~= -1 then
				var106_upvw = -1
				arg1(-1)
				return
			end
			if scaleDeadzone_result1.Y < -0.4 and var106_upvw ~= 1 then
				var106_upvw = 1
				arg1(1)
				return
			end
			if -0.4 <= scaleDeadzone_result1.Y and scaleDeadzone_result1.Y <= 0.4 then
				var106_upvw = 0
			end
		end
	end)
	UserInputService_upvr.InputBegan:connect(function(arg1_26, arg2) -- Line 645
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_26.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_26.KeyCode == Enum.KeyCode.W or arg1_26.KeyCode == Enum.KeyCode.Up then
				arg1(-1)
				return
			end
			if arg1_26.KeyCode == Enum.KeyCode.S or arg1_26.KeyCode == Enum.KeyCode.Down then
				arg1(1)
			end
		end
	end)
end
function interactSelectionSideScroll(arg1) -- Line 659
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	local var110_upvw = 0
	UserInputService_upvr.InputChanged:connect(function(arg1_27, arg2) -- Line 664
		--[[ Upvalues[2]:
			[1]: var110_upvw (read and write)
			[2]: arg1 (readonly)
		]]
		if arg1_27.UserInputType ~= Enum.UserInputType.Gamepad1 then
		elseif arg1_27.KeyCode == Enum.KeyCode.Thumbstick1 then
			local scaleDeadzone_result1_3 = scaleDeadzone(arg1_27.Position)
			if 0.4 < scaleDeadzone_result1_3.X and var110_upvw ~= 1 then
				var110_upvw = 1
				arg1(1)
				return
			end
			if scaleDeadzone_result1_3.X < -0.4 and var110_upvw ~= -1 then
				var110_upvw = -1
				arg1(-1)
				return
			end
			if -0.4 <= scaleDeadzone_result1_3.X and scaleDeadzone_result1_3.X <= 0.4 then
				var110_upvw = 0
			end
		end
	end)
	UserInputService_upvr.InputBegan:connect(function(arg1_28, arg2) -- Line 688
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_28.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_28.KeyCode == Enum.KeyCode.A or arg1_28.KeyCode == Enum.KeyCode.Left then
				arg1(-1)
				return
			end
			if arg1_28.KeyCode == Enum.KeyCode.D or arg1_28.KeyCode == Enum.KeyCode.Right then
				arg1(1)
			end
		end
	end)
end
function dropTool(arg1) -- Line 706
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_29, arg2) -- Line 707
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_29.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_29.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_29.KeyCode == Enum.KeyCode.ButtonY or arg1_29.KeyCode == Enum.KeyCode.Backspace then
				arg1()
			end
		end
	end)
end
function finalizeWireSelection(arg1) -- Line 721
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_30, arg2) -- Line 722
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_30.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_30.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_30.KeyCode == Enum.KeyCode.ButtonY or arg1_30.KeyCode == Enum.KeyCode.F then
				arg1()
			end
		end
	end)
end
local var115_upvw = false
function rotateTurnDraggerModel(arg1) -- Line 737
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: var115_upvw (read and write)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_31, arg2) -- Line 739
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var115_upvw (copied, read and write)
		]]
		if arg2 then
		else
			if arg1_31.UserInputType ~= Enum.UserInputType.Gamepad1 and arg1_31.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if arg1_31.KeyCode == Enum.KeyCode.T then
				arg1(0, 1)
			end
			if arg1_31.KeyCode == Enum.KeyCode.R then
				arg1(1, 0)
			end
			if arg1_31.KeyCode == Enum.KeyCode.ButtonY then
				arg1(0, 0, "Holding")
				var115_upvw = true
			end
		end
	end)
	UserInputService_upvr.InputEnded:connect(function(arg1_32, arg2) -- Line 758
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: var115_upvw (copied, read and write)
		]]
		if arg2 then
		else
			if arg1_32.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
			if arg1_32.KeyCode == Enum.KeyCode.ButtonY then
				arg1(0, 0, "NotHolding")
				var115_upvw = false
			end
		end
	end)
	interactSelectionScroll(function(arg1_33) -- Line 770
		--[[ Upvalues[2]:
			[1]: var115_upvw (copied, read and write)
			[2]: arg1 (readonly)
		]]
		if var115_upvw then
			arg1(0, arg1_33)
		end
	end)
	interactSelectionSideScroll(function(arg1_34) -- Line 776
		--[[ Upvalues[2]:
			[1]: var115_upvw (copied, read and write)
			[2]: arg1 (readonly)
		]]
		if var115_upvw then
			arg1(arg1_34, 0)
		end
	end, true)
end
function controllerSelectButton(arg1) -- Line 786
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	UserInputService_upvr.InputBegan:connect(function(arg1_35, arg2) -- Line 787
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg2 then
		else
			if arg1_35.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
			if arg1_35.KeyCode == Enum.KeyCode.ButtonSelect then
				arg1()
			end
		end
	end)
end
local tbl_upvr = {}
local function updateDevice(arg1, arg2) -- Line 804
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
		[3]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 37 start (CF ANALYSIS FAILED)
	local UserInputType = arg1.UserInputType
	local var127
	if UserInputType == Enum.UserInputType.Touch then
		module_upvr.Device = "Touch"
		-- KONSTANTWARNING: GOTO [40] #25
	end
	-- KONSTANTERROR: [0] 1. Error Block 37 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [11] 8. Error Block 38 start (CF ANALYSIS FAILED)
	if UserInputType == Enum.UserInputType.Gamepad1 then
		module_upvr.Device = "Gamepad"
	elseif UserInputType == Enum.UserInputType.Keyboard or UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.MouseButton2 then
		module_upvr.Device = "PC"
	end
	if arg1.KeyCode == Enum.KeyCode.Thumbstick1 or arg1.KeyCode == Enum.KeyCode.Thumbstick2 then
		var127 = false
	end
	module_upvr.LastInputSoaked = var127
	local getButton_result1 = getButton()
	module_upvr.HoveredButton = getButton_result1
	if getButton_result1 then
	else
		module_upvr.MouseLocation = UserInputService_upvr:GetMouseLocation()
	end
	for _, v_3 in pairs(tbl_upvr) do
		v_3()
	end
	-- KONSTANTERROR: [11] 8. Error Block 38 end (CF ANALYSIS FAILED)
end
UserInputService_upvr.InputBegan:Connect(updateDevice)
UserInputService_upvr.InputChanged:Connect(updateDevice)
function bindUpdate(arg1) -- Line 835
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	table.insert(tbl_upvr, arg1)
end
local StarterGui_upvr = game:GetService("StarterGui")
function setBackpackEnabled(arg1) -- Line 841
	--[[ Upvalues[1]:
		[1]: StarterGui_upvr (readonly)
	]]
	StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, arg1)
end
module_upvr.GetMouseTarget = getMouseTarget
module_upvr.GetMouseHit = getMouseHit
module_upvr.GetMouseRay = getMouseRay
module_upvr.SteerChange = steerChange
module_upvr.ThrottleChange = throttleChange
module_upvr.VehicleToggleLights = vehicleToggleLights
module_upvr.CameraZoom = cameraZoom
module_upvr.ToggleFirstPerson = toggleFirstPerson
module_upvr.gamePadEnabledChange = gamePadEnabledChange
module_upvr.IsGamePadEnabled = isGamePadEnabled
module_upvr.CameraStick = cameraStick
module_upvr.ClickBegan = clickBegan
module_upvr.ClickEnded = clickEnded
module_upvr.Rotate = rotate
module_upvr.InteractSelectionMade = interactSelectionMade
module_upvr.InteractAbort = interactAbort
module_upvr.InteractSelectionScroll = interactSelectionScroll
module_upvr.InteractSelectionSideScroll = interactSelectionSideScroll
module_upvr.DropTool = dropTool
module_upvr.FinalizeWireSelection = finalizeWireSelection
module_upvr.RotatetTurnDraggerModel = rotateTurnDraggerModel
module_upvr.RotateProperty = rotateProperty
module_upvr.ButtonA = buttonA
module_upvr.ControllerSelectButton = controllerSelectButton
module_upvr.GamepadSelected = gamepadSelected
module_upvr.KeyboardSelected = keyboardSelected
module_upvr.BindDeviceUpdateCallback = bindUpdate
module_upvr.SetBackpackEnabled = setBackpackEnabled
return module_upvr