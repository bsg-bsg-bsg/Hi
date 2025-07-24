-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:43
-- Luau version 6, Types version 3
-- Time taken: 0.012256 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local CurrentCamera_upvw = workspace.CurrentCamera
local Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 9
	--[[ Upvalues[4]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: CurrentCamera_upvw (read and write)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	CurrentCamera_upvw = workspace.CurrentCamera
end)
local Confirm_upvr = script.Parent:WaitForChild("Confirm")
local Back_upvr = script.Parent:WaitForChild("Back")
local Finalize_upvr = script.Parent:WaitForChild("Finalize")
local module_3_upvr = require(script.Parent.Parent:WaitForChild("BumpButton"))
local tbl_upvw = {}
local var11_upvw
local var12_upvw = false
local var13_upvw = ""
local CanPlace_upvr = require(game.ReplicatedStorage.Interaction.CanPlace)
local var15_upvw
local module_2_upvr = require(game.ReplicatedStorage:WaitForChild("Util"):WaitForChild("PlacementUtil"))
local RunService_upvr = game:GetService("RunService")
local PlaceStructure_upvr = game.Players.LocalPlayer.PlayerGui:WaitForChild("ClientSounds"):WaitForChild("PlaceStructure")
script.Parent:WaitForChild("DragWire").OnInvoke = function(arg1) -- Line 40, Named "OnInvoke"
	--[[ Upvalues[12]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var11_upvw (read and write)
		[3]: Finalize_upvr (readonly)
		[4]: Character_upvw (read and write)
		[5]: var13_upvw (read and write)
		[6]: var12_upvw (read and write)
		[7]: tbl_upvw (read and write)
		[8]: CanPlace_upvr (readonly)
		[9]: var15_upvw (read and write)
		[10]: module_2_upvr (readonly)
		[11]: RunService_upvr (readonly)
		[12]: PlaceStructure_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	LocalPlayer_upvr.PlayerGui.IsPlacingStructure.Value = true
	local var27
	if var11_upvw == "Placing" then
		exitPlacementMode()
		task.wait(0.1)
	end
	var11_upvw = "Placing"
	setPlatformControls()
	setGUIVisibility(true)
	local module = {}
	var27 = "Model"
	local any_upvr = Instance.new(var27, workspace.CurrentCamera)
	var27 = nil
	while not (var11_upvw == "Placing" or var11_upvw == "Add Point" or var11_upvw ~= "Remove Point") do
		local var30_upvw
		if 2 > #module then
			var30_upvw = false
		else
			var30_upvw = true
		end
		Finalize_upvr.Visible = var30_upvw
		any_upvr:ClearAllChildren()
		var30_upvw = 0
		local function drawBall(arg1_3) -- Line 103
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: any_upvr (readonly)
			]]
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.CanCollide = false
			Part.Shape = Enum.PartType.Ball
			Part.Size = Vector3.new(1, 1, 1) * arg1.OtherInfo.Thickness.Value
			Part.CFrame = CFrame.new(arg1_3)
			Part.TopSurface = Enum.SurfaceType.Smooth
			Part.BottomSurface = Enum.SurfaceType.Smooth
			Part.Parent = any_upvr
			return Part
		end
		for i, v in pairs(module) do
			local var40
			if i < #module then
				var40 = (function(arg1_2, arg2) -- Line 68, Named "drawLine"
					--[[ Upvalues[5]:
						[1]: var30_upvw (read and write)
						[2]: arg1 (readonly)
						[3]: any_upvr (readonly)
						[4]: Character_upvw (copied, read and write)
						[5]: var13_upvw (copied, read and write)
					]]
					local magnitude = (arg1_2 - arg2).magnitude
					var30_upvw += magnitude
					local Part_2 = Instance.new("Part")
					Part_2.Shape = Enum.PartType.Cylinder
					Part_2.Anchored = true
					Part_2.CanCollide = false
					Part_2.CFrame = CFrame.new(arg1_2, arg2) * CFrame.new(0, 0, -magnitude / 2) * CFrame.Angles(0, (math.pi/2), 0)
					Part_2.Size = Vector3.new(magnitude, arg1.OtherInfo.Thickness.Value, arg1.OtherInfo.Thickness.Value)
					Part_2.TopSurface = Enum.SurfaceType.Smooth
					Part_2.BottomSurface = Enum.SurfaceType.Smooth
					Part_2.BrickColor = BrickColor.new("Light grey")
					Part_2.Parent = any_upvr
					if magnitude < 0.5 then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Wire section too short"
					end
					if arg1.OtherInfo.MaxLength.Value < var30_upvw then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Wire too long"
					end
					local workspace_FindPartOnRayWithIgnoreList_result1, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1_2, arg2 - arg1_2), {Character_upvw, any_upvr})
					if workspace_FindPartOnRayWithIgnoreList_result1 then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Something is interrupting the wire path"
					end
					return true, var13_upvw
				end)(v, module[i + 1])
				local drawLine_result1, drawLine_result2 = (function(arg1_2, arg2) -- Line 68, Named "drawLine"
					--[[ Upvalues[5]:
						[1]: var30_upvw (read and write)
						[2]: arg1 (readonly)
						[3]: any_upvr (readonly)
						[4]: Character_upvw (copied, read and write)
						[5]: var13_upvw (copied, read and write)
					]]
					local magnitude = (arg1_2 - arg2).magnitude
					var30_upvw += magnitude
					local Part_2 = Instance.new("Part")
					Part_2.Shape = Enum.PartType.Cylinder
					Part_2.Anchored = true
					Part_2.CanCollide = false
					Part_2.CFrame = CFrame.new(arg1_2, arg2) * CFrame.new(0, 0, -magnitude / 2) * CFrame.Angles(0, (math.pi/2), 0)
					Part_2.Size = Vector3.new(magnitude, arg1.OtherInfo.Thickness.Value, arg1.OtherInfo.Thickness.Value)
					Part_2.TopSurface = Enum.SurfaceType.Smooth
					Part_2.BottomSurface = Enum.SurfaceType.Smooth
					Part_2.BrickColor = BrickColor.new("Light grey")
					Part_2.Parent = any_upvr
					if magnitude < 0.5 then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Wire section too short"
					end
					if arg1.OtherInfo.MaxLength.Value < var30_upvw then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Wire too long"
					end
					local workspace_FindPartOnRayWithIgnoreList_result1, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1_2, arg2 - arg1_2), {Character_upvw, any_upvr})
					if workspace_FindPartOnRayWithIgnoreList_result1 then
						Part_2.BrickColor = BrickColor.new("Bright red")
						return false, "Something is interrupting the wire path"
					end
					return true, var13_upvw
				end)(v, module[i + 1])
				var13_upvw = drawLine_result2
				local var43 = drawLine_result1
				local function INLINED() -- Internal function, doesn't exist in bytecode
					drawLine_result1 = BrickColor.new("Light grey")
					return drawLine_result1
				end
				if not var43 or not INLINED() then
					drawLine_result1 = BrickColor.new("Bright red")
				end
				drawBall(v).BrickColor = drawLine_result1
			else
				drawLine_result1 = "Light grey"
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				drawBall(v).BrickColor = BrickColor.new(drawLine_result1)
			end
		end
		var12_upvw = true and var43
		local getMousePoint_result1, getMousePoint_result2 = getMousePoint(arg1.OtherInfo.Thickness.Value)
		if not getMousePoint_result1 or not getMousePoint_result2 then
		end
		if 0 < #module and getMousePoint_result2 then
			local _, _ = (function(arg1_2, arg2) -- Line 68, Named "drawLine"
				--[[ Upvalues[5]:
					[1]: var30_upvw (read and write)
					[2]: arg1 (readonly)
					[3]: any_upvr (readonly)
					[4]: Character_upvw (copied, read and write)
					[5]: var13_upvw (copied, read and write)
				]]
				local magnitude = (arg1_2 - arg2).magnitude
				var30_upvw += magnitude
				local Part_2 = Instance.new("Part")
				Part_2.Shape = Enum.PartType.Cylinder
				Part_2.Anchored = true
				Part_2.CanCollide = false
				Part_2.CFrame = CFrame.new(arg1_2, arg2) * CFrame.new(0, 0, -magnitude / 2) * CFrame.Angles(0, (math.pi/2), 0)
				Part_2.Size = Vector3.new(magnitude, arg1.OtherInfo.Thickness.Value, arg1.OtherInfo.Thickness.Value)
				Part_2.TopSurface = Enum.SurfaceType.Smooth
				Part_2.BottomSurface = Enum.SurfaceType.Smooth
				Part_2.BrickColor = BrickColor.new("Light grey")
				Part_2.Parent = any_upvr
				if magnitude < 0.5 then
					Part_2.BrickColor = BrickColor.new("Bright red")
					return false, "Wire section too short"
				end
				if arg1.OtherInfo.MaxLength.Value < var30_upvw then
					Part_2.BrickColor = BrickColor.new("Bright red")
					return false, "Wire too long"
				end
				local workspace_FindPartOnRayWithIgnoreList_result1, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1_2, arg2 - arg1_2), {Character_upvw, any_upvr})
				if workspace_FindPartOnRayWithIgnoreList_result1 then
					Part_2.BrickColor = BrickColor.new("Bright red")
					return false, "Something is interrupting the wire path"
				end
				return true, var13_upvw
			end)(module[#module], getMousePoint_result2)
		end
		tbl_upvw = CanPlace_upvr:GetPlayerLand(LocalPlayer_upvr, {"PlaceStructure", "MoveStructure", "Destroy"})
		local any_CanPlace_result1, any_CanPlace_result2 = CanPlace_upvr:CanPlace(LocalPlayer_upvr, getMousePoint_result2, {
			Land = tbl_upvw;
			PermissionType = {"PlaceStructure", "MoveStructure", "Destroy"};
		})
		var12_upvw = any_CanPlace_result1
		var15_upvw = any_CanPlace_result2
		if not var12_upvw then
		elseif var12_upvw then
			if #module == 0 then
				var27 = var15_upvw
			elseif 0 < #module and var27 ~= var15_upvw then
				local var53
			end
		end
		if getMousePoint_result2 then
			var53 = getMousePoint_result2
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var53 = BrickColor.new("Light grey")
				return var53
			end
			if not false or not INLINED_2() then
				var53 = BrickColor.new("Bright red")
			end
			drawBall(var53).BrickColor = var53
		end
		if var11_upvw == "Add Point" then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if false then
				var53 = module
				table.insert(var53, getMousePoint_result2)
			else
				var53 = game.ReplicatedStorage.Notices
				var53.SendUserNotice:Fire("You cannot build accross different plots", 1.5)
			end
			var11_upvw = "Placing"
		elseif var11_upvw == "Remove Point" then
			var53 = 0
			if var53 < #module then
				var53 = module
				table.remove(var53)
				var11_upvw = "Placing"
			else
				var11_upvw = "Abort placement"
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		module_2_upvr.SetModelAppearance(any_upvr, false)
		RunService_upvr.RenderStepped:Wait()
	end
	setGUIVisibility(false)
	LocalPlayer_upvr.PlayerGui.IsPlacingStructure.Value = false
	any_upvr:Destroy()
	if var11_upvw == "Confirm placement" then
		PlaceStructure_upvr:play()
		return module, var27
	end
	if var11_upvw == "Abort placement" then
		return false
	end
end
function getMousePoint(arg1) -- Line 195
	--[[ Upvalues[2]:
		[1]: CurrentCamera_upvw (read and write)
		[2]: Character_upvw (read and write)
	]]
	local p = input.GetMouseHit().p
	local input_GetMouseTarget_result1 = input.GetMouseTarget()
	if not input_GetMouseTarget_result1 then
	else
		local unit = (p - CurrentCamera_upvw.CFrame.p).unit
		local tbl = {Character_upvw}
		for _ = 1, 100 do
			local workspace_FindPartOnRayWithIgnoreList_result1_2, _, workspace_FindPartOnRayWithIgnoreList_result3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p - unit / 2, unit), tbl)
			if not workspace_FindPartOnRayWithIgnoreList_result1_2 then
				return false, p
			end
			if workspace_FindPartOnRayWithIgnoreList_result1_2 == input_GetMouseTarget_result1 then
				return true, p + workspace_FindPartOnRayWithIgnoreList_result3 * arg1 / 2
			end
			table.insert(tbl, workspace_FindPartOnRayWithIgnoreList_result1_2)
		end
	end
end
function addPoint() -- Line 223
	--[[ Upvalues[3]:
		[1]: Confirm_upvr (readonly)
		[2]: module_3_upvr (readonly)
		[3]: var11_upvw (read and write)
	]]
	if not Confirm_upvr.Visible then
	else
		if not module_3_upvr.Bump(Confirm_upvr) then return end
		var11_upvw = "Add Point"
	end
end
function finalizeSelected() -- Line 233
	--[[ Upvalues[6]:
		[1]: Finalize_upvr (readonly)
		[2]: module_3_upvr (readonly)
		[3]: var12_upvw (read and write)
		[4]: var11_upvw (read and write)
		[5]: tbl_upvw (read and write)
		[6]: var13_upvw (read and write)
	]]
	if not Finalize_upvr.Visible then
	else
		if not module_3_upvr.Bump(Finalize_upvr) then return end
		if var12_upvw then
			var11_upvw = "Confirm placement"
			return
		end
		if var11_upvw == "Placing" then
			if #tbl_upvw == 0 then
				game.ReplicatedStorage.Notices.SendUserNotice:Fire("You must own land to place structures. Visit the land store to buy some.", 2.5)
			else
				game.ReplicatedStorage.Notices.SendUserNotice:Fire(var13_upvw, 1.5)
			end
			game.Players.LocalPlayer.PlayerGui.ClientSounds.Err:Play()
		end
	end
end
function back() -- Line 253
	--[[ Upvalues[3]:
		[1]: Back_upvr (readonly)
		[2]: module_3_upvr (readonly)
		[3]: var11_upvw (read and write)
	]]
	if not Back_upvr.Visible then
	else
		if not module_3_upvr.Bump(Back_upvr) then return end
		var11_upvw = "Remove Point"
	end
end
function exitPlacementMode() -- Line 264
	--[[ Upvalues[2]:
		[1]: Back_upvr (readonly)
		[2]: var11_upvw (read and write)
	]]
	if not Back_upvr.Visible then
	else
		var11_upvw = "Abort placement"
	end
end
function roundVector(arg1) -- Line 271
	return Vector3.new(intervalRound(arg1.X, 0.1), intervalRound(arg1.Y, 0.1), intervalRound(arg1.Z, 0.1))
end
function intervalRound(arg1, arg2) -- Line 278
	local math_fmod_result1 = math.fmod(arg1, arg2)
	if arg2 / 2 <= math_fmod_result1 then
		math_fmod_result1 = arg1 + arg2 - math_fmod_result1
	elseif math_fmod_result1 < arg2 / 2 then
		math_fmod_result1 = arg1 - math_fmod_result1
	end
	return roundOff(math_fmod_result1, arg2)
end
function roundOff(arg1, arg2) -- Line 290
	return math.floor(arg1 * 10 ^ arg2 + 0.5) / 10 ^ arg2
end
function setGUIVisibility(arg1) -- Line 298
	--[[ Upvalues[3]:
		[1]: Finalize_upvr (readonly)
		[2]: Confirm_upvr (readonly)
		[3]: Back_upvr (readonly)
	]]
	Finalize_upvr.Visible = arg1
	Confirm_upvr.Visible = arg1
	Back_upvr.Visible = arg1
	input.SetBackpackEnabled(not arg1)
end
function setPlatformControls() -- Line 307
	--[[ Upvalues[3]:
		[1]: Confirm_upvr (readonly)
		[2]: Back_upvr (readonly)
		[3]: Finalize_upvr (readonly)
	]]
	if input.Device == "Touch" then
		Confirm_upvr.PlatformButton.Visible = false
		Back_upvr.PlatformButton.Visible = false
		Finalize_upvr.PlatformButton.Visible = false
		Back_upvr.Position = Back_upvr.TouchPosition.Position
	else
		Confirm_upvr.PlatformButton.Visible = true
		Back_upvr.PlatformButton.Visible = true
		Finalize_upvr.PlatformButton.Visible = true
		if input.Device == "Gamepad" then
			Confirm_upvr.PlatformButton.Image = Confirm_upvr.PlatformButton.Gamepad.Value
			Finalize_upvr.PlatformButton.Image = Finalize_upvr.PlatformButton.Gamepad.Value
			Back_upvr.PlatformButton.Image = Back_upvr.PlatformButton.Gamepad.Value
			Confirm_upvr.PlatformButton.KeyLabel.Text = ""
			Finalize_upvr.PlatformButton.KeyLabel.Text = ""
			Back_upvr.PlatformButton.KeyLabel.Text = ""
			return
		end
		if input.Device == "PC" then
			Confirm_upvr.PlatformButton.Image = Confirm_upvr.PlatformButton.PC.Value
			Back_upvr.PlatformButton.Image = Back_upvr.PlatformButton.PC.Value
			Finalize_upvr.PlatformButton.Image = Finalize_upvr.PlatformButton.PC.Value
			Confirm_upvr.PlatformButton.KeyLabel.Text = 'E'
			Back_upvr.PlatformButton.KeyLabel.Text = 'B'
			Finalize_upvr.PlatformButton.KeyLabel.Text = 'F'
		end
	end
end
task.wait(1)
input = require(script.Parent.Parent.Scripts.UserInput) -- Setting global
input.InteractSelectionMade(addPoint)
input.InteractAbort(back)
input.FinalizeWireSelection(finalizeSelected)
Finalize_upvr.MouseButton1Click:connect(function() -- Line 345
	finalizeSelected()
end)
Back_upvr.MouseButton1Click:connect(function() -- Line 348
	back()
end)
Confirm_upvr.MouseButton1Click:connect(function() -- Line 351
	addPoint()
end)