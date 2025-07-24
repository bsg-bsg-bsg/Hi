-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:49
-- Luau version 6, Types version 3
-- Time taken: 0.004561 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
local InteractionPermission_upvr = require(game.ReplicatedStorage.Interaction.InteractionPermission)
local RunService_upvr = game:GetService("RunService")
local function jumpBoot_upvr() -- Line 13, Named "jumpBoot"
	--[[ Upvalues[2]:
		[1]: RunService_upvr (readonly)
		[2]: Humanoid_upvw (read and write)
	]]
	RunService_upvr:BindToRenderStep("JumpBoot", Enum.RenderPriority.Input.Value + 1, function(arg1) -- Line 14
		--[[ Upvalues[1]:
			[1]: Humanoid_upvw (copied, read and write)
		]]
		Humanoid_upvw.Jump = true
	end)
	while Humanoid_upvw.SeatPart do
		task.wait(0.1)
	end
	RunService_upvr:UnbindFromRenderStep("JumpBoot")
end
local function _(arg1) -- Line 24, Named "maySit"
	--[[ Upvalues[2]:
		[1]: InteractionPermission_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local var9 = arg1
	if var9 then
		var9 = arg1.Parent
		if var9 then
			var9 = arg1.Parent:FindFirstChild("Owner")
			local var10
		end
	end
	if var9 then
		if arg1.Name == "DriveSeat" then
			var10 = "Drive"
		else
			var10 = "Sit"
		end
		if InteractionPermission_upvr:UserCanInteract(LocalPlayer_upvr, arg1.Parent, var10) then
			return true
		end
		return false
	end
	return true
end
local var11_upvw = 0
local function seatChanged_upvr() -- Line 39, Named "seatChanged"
	--[[ Upvalues[5]:
		[1]: Humanoid_upvw (read and write)
		[2]: InteractionPermission_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: jumpBoot_upvr (readonly)
		[5]: var11_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if Humanoid_upvw.SeatPart then
		local var16
		if Humanoid_upvw.SeatPart then
			wait(1)
			local SeatPart = Humanoid_upvw.SeatPart
			local var18 = SeatPart
			if var18 then
				var18 = SeatPart.Parent
				if var18 then
					var18 = SeatPart.Parent:FindFirstChild("Owner")
					local var19
				end
			end
			if var18 then
				if SeatPart.Name == "DriveSeat" then
					var19 = "Drive"
				else
					var19 = "Sit"
				end
				if InteractionPermission_upvr:UserCanInteract(LocalPlayer_upvr, SeatPart.Parent, var19) then
				else
				end
			else
			end
			if not true then
				jumpBoot_upvr()
				return
			end
			-- KONSTANTWARNING: GOTO [4] #4
		end
	else
		var11_upvw = os.clock()
	end
end
local CollectionService_upvr = game:GetService("CollectionService")
function charTouched(arg1) -- Line 54
	--[[ Upvalues[4]:
		[1]: CollectionService_upvr (readonly)
		[2]: InteractionPermission_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: Humanoid_upvw (read and write)
	]]
	local var24 = arg1
	local any_HasTag_result1 = CollectionService_upvr:HasTag(var24, "Seat")
	if any_HasTag_result1 then
		local var26 = arg1
		if var26 then
			var26 = arg1.Parent
			if var26 then
				var26 = arg1.Parent:FindFirstChild("Owner")
			end
		end
		if var26 then
			if arg1.Name == "DriveSeat" then
				var24 = "Drive"
			else
				var24 = "Sit"
			end
			if InteractionPermission_upvr:UserCanInteract(LocalPlayer_upvr, arg1.Parent, var24) then
				any_HasTag_result1 = true
			else
				any_HasTag_result1 = false
			end
		else
			any_HasTag_result1 = true
		end
		if any_HasTag_result1 then
			any_HasTag_result1 = Humanoid_upvw.SeatPart
			if not any_HasTag_result1 then
				var24 = Humanoid_upvw
				any_HasTag_result1 = arg1:Sit
				any_HasTag_result1(var24)
			end
		end
	end
end
local HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
function newCharacter() -- Line 66
	--[[ Upvalues[5]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: HumanoidRootPart_upvw (read and write)
		[4]: Humanoid_upvw (read and write)
		[5]: seatChanged_upvr (readonly)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	Humanoid_upvw:GetPropertyChangedSignal("SeatPart"):connect(seatChanged_upvr)
	Humanoid_upvw.Touched:Connect(charTouched)
end
newCharacter()
LocalPlayer_upvr.CharacterAdded:connect(newCharacter)