-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:47
-- Luau version 6, Types version 3
-- Time taken: 0.009514 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
local GetItem_upvr = require(game.ReplicatedStorage.Util.GetItem)
local CanDrag_upvr = script.Parent:WaitForChild("CanDrag")
local CanRotate_upvr = script.Parent:WaitForChild("CanRotate")
local TouchEndDrag_upvr = script.Parent:WaitForChild("TouchEndDrag")
local TouchRotate_upvr = script.Parent:WaitForChild("TouchRotate")
local Dragger_upvr = script.Dragger
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 16
	--[[ Upvalues[4]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: Dragger_upvr (readonly)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	Humanoid_upvw.Died:connect(function() -- Line 19
		--[[ Upvalues[1]:
			[1]: Dragger_upvr (copied, readonly)
		]]
		Dragger_upvr.Parent = nil
	end)
end)
task.wait(1)
local CurrentCamera_upvr = workspace.CurrentCamera
local mouse_upvr = LocalPlayer_upvr:GetMouse()
local var14_upvw = false
local var15_upvw = 11
local var16_upvw = false
local BodyPosition_upvr = Instance.new("BodyPosition", Dragger_upvr)
BodyPosition_upvr.maxForce = Vector3.new(17000, 17000, 17000)
BodyPosition_upvr.D = 800
local BodyGyro_upvr = Instance.new("BodyGyro", Dragger_upvr)
BodyGyro_upvr.maxTorque = Vector3.new(200, 200, 200)
BodyGyro_upvr.P = 1200
BodyGyro_upvr.D = 140
local zero_cframe_upvw = CFrame.new()
local var20_upvw = false
local var21_upvw
local ClientIsDragging_upvr = game.ReplicatedStorage.Interaction.ClientIsDragging
local RunService_upvr = game:GetService("RunService")
function click() -- Line 64
	--[[ Upvalues[12]:
		[1]: var14_upvw (read and write)
		[2]: Character_upvw (read and write)
		[3]: zero_cframe_upvw (read and write)
		[4]: var21_upvw (read and write)
		[5]: CurrentCamera_upvr (readonly)
		[6]: var15_upvw (read and write)
		[7]: Dragger_upvr (readonly)
		[8]: BodyGyro_upvr (readonly)
		[9]: GetItem_upvr (readonly)
		[10]: Humanoid_upvw (read and write)
		[11]: ClientIsDragging_upvr (readonly)
		[12]: RunService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 59 start (CF ANALYSIS FAILED)
	var14_upvw = true
	local input_GetMouseTarget_result1 = input.GetMouseTarget()
	if not canDrag(input_GetMouseTarget_result1) then return end
	local p = input.GetMouseHit().p
	if 11 < (p - Character_upvw.Head.Position).magnitude then return end
	initializeDrag(input_GetMouseTarget_result1, p)
	zero_cframe_upvw = CFrame.new()
	var21_upvw:Play(0.1, 1, 1)
	-- KONSTANTERROR: [0] 1. Error Block 59 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [635] 445. Error Block 80 start (CF ANALYSIS FAILED)
	if 1.2 < 0 then
		-- KONSTANTWARNING: GOTO [658] #463
	end
	if 0.5 < workspace.DistributedGameTime - 0 then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [645.10]
		ClientIsDragging_upvr:FireServer(nil)
	end
	local _, _ = RunService_upvr.Stepped:wait()
	-- KONSTANTERROR: [635] 445. Error Block 80 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [55] 41. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [55] 41. Error Block 6 end (CF ANALYSIS FAILED)
end
function clickEnded() -- Line 192
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	var14_upvw = false
end
function holdDistanceChanged(arg1) -- Line 196
	--[[ Upvalues[1]:
		[1]: var15_upvw (read and write)
	]]
	var15_upvw = 7 + (1 - arg1) * 4
end
local InteractionPermission_upvr = require(game.ReplicatedStorage.Interaction.InteractionPermission)
function canDrag(arg1) -- Line 201
	--[[ Upvalues[7]:
		[1]: Character_upvw (read and write)
		[2]: Humanoid_upvw (read and write)
		[3]: GetItem_upvr (readonly)
		[4]: InteractionPermission_upvr (readonly)
		[5]: LocalPlayer_upvr (readonly)
		[6]: BodyGyro_upvr (readonly)
		[7]: Dragger_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 60 start (CF ANALYSIS FAILED)
	if not Character_upvw then return end
	for _, v in pairs(Character_upvw:GetChildren()) do
		if v:IsA("Tool") then
			return false
		end
	end
	if not arg1 or arg1.Anchored or not arg1.Parent or 0 >= Humanoid_upvw.Health then
		return false
	end
	if arg1.Name == "LeafPart" then
		return false
	end
	local pairs_result1, pairs_result2_2, pairs_result3 = pairs(arg1:GetConnectedParts())
	if v.Name ~= "HumanoidRootPart" then
		if v:IsA("Seat") or v:IsA("VehicleSeat") or v.Occupant then
			-- KONSTANTERROR: [65] 49. Error Block 68 start (CF ANALYSIS FAILED)
			do
				return false
			end
			-- KONSTANTERROR: [65] 49. Error Block 68 end (CF ANALYSIS FAILED)
		end
		-- KONSTANTWARNING: GOTO [48] #37
	end
	-- KONSTANTERROR: [0] 1. Error Block 60 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [65] 49. Error Block 68 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [65] 49. Error Block 68 end (CF ANALYSIS FAILED)
end
function otherDraggable(arg1, arg2) -- Line 270
	--[[ Upvalues[2]:
		[1]: BodyGyro_upvr (readonly)
		[2]: Dragger_upvr (readonly)
	]]
	if not arg1 or not arg1:FindFirstChild("DraggableItem") or arg2 and arg2.Parent then
		local DraggableItem = arg2.Parent:FindFirstChild("DraggableItem")
	end
	if DraggableItem then
		if DraggableItem:FindFirstChild("NoRotate") then
			BodyGyro_upvr.Parent = nil
		else
			BodyGyro_upvr.Parent = Dragger_upvr
		end
		return true
	end
end
local Weld_upvr = Instance.new("Weld", Dragger_upvr)
function initializeDrag(arg1, arg2) -- Line 282
	--[[ Upvalues[6]:
		[1]: var20_upvw (read and write)
		[2]: mouse_upvr (readonly)
		[3]: GetItem_upvr (readonly)
		[4]: Dragger_upvr (readonly)
		[5]: CurrentCamera_upvr (readonly)
		[6]: Weld_upvr (readonly)
	]]
	var20_upvw = true
	local var40
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var40 = GetItem_upvr(arg1)
		return var40
	end
	if not arg1 or not INLINED() then
		var40 = arg1
	end
	mouse_upvr.TargetFilter = var40
	var40 = CFrame.new(arg2, CurrentCamera_upvr.CoordinateFrame.p)
	Dragger_upvr.CFrame = var40
	var40 = Dragger_upvr
	Weld_upvr.Part0 = var40
	Weld_upvr.Part1 = arg1
	var40 = CFrame.new(arg2, CurrentCamera_upvr.CoordinateFrame.p):inverse() * arg1.CFrame
	Weld_upvr.C0 = var40
	var40 = Dragger_upvr
	Weld_upvr.Parent = var40
	var40 = workspace
	Dragger_upvr.Parent = var40
end
function endDrag() -- Line 296
	--[[ Upvalues[4]:
		[1]: mouse_upvr (readonly)
		[2]: Dragger_upvr (readonly)
		[3]: var20_upvw (read and write)
		[4]: var14_upvw (read and write)
	]]
	mouse_upvr.TargetFilter = nil
	Dragger_upvr.Parent = nil
	var20_upvw = false
	var14_upvw = false
end
function touchDragBegin() -- Line 304
	--[[ Upvalues[1]:
		[1]: var14_upvw (read and write)
	]]
	click()
	var14_upvw = false
end
local module_upvr = require(script.Parent.Parent:WaitForChild("BumpButton"))
function touchDragEnd() -- Line 310
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: TouchEndDrag_upvr (readonly)
		[3]: var14_upvw (read and write)
	]]
	if not module_upvr.Bump(TouchEndDrag_upvr) then
	elseif var14_upvw then
		clickEnded()
	end
end
function touchRotateBegin() -- Line 319
	--[[ Upvalues[2]:
		[1]: TouchRotate_upvr (readonly)
		[2]: var16_upvw (read and write)
	]]
	TouchRotate_upvr.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	var16_upvw = true
end
function touchRotateEnd() -- Line 324
	--[[ Upvalues[2]:
		[1]: TouchRotate_upvr (readonly)
		[2]: var16_upvw (read and write)
	]]
	TouchRotate_upvr.BackgroundColor3 = Color3.new(1, 1, 1)
	var16_upvw = false
end
local var42_upvw = ""
function interactLoop() -- Line 333
	--[[ Upvalues[10]:
		[1]: var20_upvw (read and write)
		[2]: var14_upvw (read and write)
		[3]: Character_upvw (read and write)
		[4]: var42_upvw (read and write)
		[5]: CanDrag_upvr (readonly)
		[6]: CanRotate_upvr (readonly)
		[7]: TouchEndDrag_upvr (readonly)
		[8]: TouchRotate_upvr (readonly)
		[9]: BodyGyro_upvr (readonly)
		[10]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	while true do
		local var47
		var47()
		var47 = ""
		if var20_upvw then
			var47 = "Dragging"
		elseif canDrag(input.GetMouseTarget()) and not var14_upvw and (input.GetMouseHit().p - Character_upvw.Head.Position).magnitude < 11 then
			var47 = "Mouseover"
		end
		var42_upvw = var47
		setPlatformControls()
		if var42_upvw == "" then
			CanDrag_upvr.Visible = false
			CanRotate_upvr.Visible = false
			TouchEndDrag_upvr.Visible = false
			TouchRotate_upvr.Visible = false
		elseif var42_upvw == "Mouseover" then
			CanDrag_upvr.Visible = true
			CanRotate_upvr.Visible = false
			TouchEndDrag_upvr.Visible = false
			TouchRotate_upvr.Visible = false
		else
			local var48
			if var48 == "Dragging" then
				var48 = CanDrag_upvr
				local var49 = false
				var48.Visible = var49
				if BodyGyro_upvr.Parent ~= nil then
					var49 = false
				else
					var49 = true
				end
				var48 = not var49
				if var48 then
					var48 = not LocalPlayer_upvr:FindFirstChild("IsChatting")
					if not var48 then
						if LocalPlayer_upvr.IsChatting.Value >= 1 then
							var48 = false
						else
							var48 = true
						end
					end
				end
				if input.Device ~= "Touch" then
				end
				CanRotate_upvr.Visible = var48
				if input.Device ~= "Touch" then
				else
				end
				TouchEndDrag_upvr.Visible = true
				local var50 = false
				if input.Device == "Touch" then
					var50 = var48
				end
				TouchRotate_upvr.Visible = var50
			end
		end
	end
end
function moveDrag(arg1) -- Line 380
	--[[ Upvalues[1]:
		[1]: BodyPosition_upvr (readonly)
	]]
	BodyPosition_upvr.position = arg1
end
local WalkSpeed_upvw = Humanoid_upvw.WalkSpeed
local var52_upvw
function rotate(arg1, arg2) -- Line 388
	--[[ Upvalues[7]:
		[1]: var20_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: WalkSpeed_upvw (read and write)
		[5]: var16_upvw (read and write)
		[6]: var52_upvw (read and write)
		[7]: zero_cframe_upvw (read and write)
	]]
	if not var20_upvw then
		if not LocalPlayer_upvr:FindFirstChild("IsChatting") or LocalPlayer_upvr.IsChatting.Value < 2 then
			Humanoid_upvw.WalkSpeed = WalkSpeed_upvw
		end
	else
		if input.Device == "Touch" and not var16_upvw then return end
		if 1 < Humanoid_upvw.WalkSpeed then
			WalkSpeed_upvw = Humanoid_upvw.WalkSpeed
			Humanoid_upvw.WalkSpeed = 0
		end
		var52_upvw = tick()
		while var20_upvw and 0 < arg1.magnitude and var52_upvw == var52_upvw do
			zero_cframe_upvw = CFrame.Angles(0, -arg1.X * 0.036, 0) * CFrame.Angles(arg1.Y * 0.036, 0, arg1.Z * 0.036) * zero_cframe_upvw
			task.wait()
		end
		if arg1.magnitude == 0 and (not LocalPlayer_upvr:FindFirstChild("IsChatting") or LocalPlayer_upvr.IsChatting.Value < 2) then
			Humanoid_upvw.WalkSpeed = WalkSpeed_upvw
		end
	end
end
task.wait(1)
var21_upvw = Humanoid_upvw:LoadAnimation(script:WaitForChild("CarryItem"))
input = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput")) -- Setting global
input.ClickBegan(click, holdDistanceChanged)
input.ClickEnded(clickEnded)
input.Rotate(rotate)
CanDrag_upvr.MouseButton1Click:Connect(touchDragBegin)
TouchEndDrag_upvr.MouseButton1Click:Connect(touchDragEnd)
TouchRotate_upvr.MouseButton1Down:Connect(touchRotateBegin)
TouchRotate_upvr.MouseButton1Up:Connect(touchRotateEnd)
local Position_upvr = CanDrag_upvr.Position
function setPlatformControls() -- Line 440
	--[[ Upvalues[4]:
		[1]: CanDrag_upvr (readonly)
		[2]: CanRotate_upvr (readonly)
		[3]: TouchEndDrag_upvr (readonly)
		[4]: Position_upvr (readonly)
	]]
	if input.Device == "Touch" then
		CanDrag_upvr.PlatformButton.Visible = false
		CanRotate_upvr.PlatformButton.Visible = false
		CanDrag_upvr.Position = TouchEndDrag_upvr.Position
	else
		CanDrag_upvr.Position = Position_upvr
		CanDrag_upvr.PlatformButton.Visible = true
		CanRotate_upvr.PlatformButton.Visible = true
		if input.Device == "Gamepad" then
			CanDrag_upvr.PlatformButton.Image = CanDrag_upvr.PlatformButton.Gamepad.Value
			CanDrag_upvr.PlatformButton.KeyLabel.Text = ""
			CanRotate_upvr.PlatformButton.Image = CanRotate_upvr.PlatformButton.Gamepad.Value
			CanRotate_upvr.PlatformButton.KeyLabel.Text = ""
			return
		end
		if input.Device == "PC" then
			CanDrag_upvr.PlatformButton.Image = CanDrag_upvr.PlatformButton.PC.Value
			CanDrag_upvr.PlatformButton.KeyLabel.Text = "CLICK"
			CanRotate_upvr.PlatformButton.Image = CanRotate_upvr.PlatformButton.PC.Value
			CanRotate_upvr.PlatformButton.KeyLabel.Text = "SHIFT + WASD"
		end
	end
end
interactLoop()