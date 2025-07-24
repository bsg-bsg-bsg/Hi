-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:44
-- Luau version 6, Types version 3
-- Time taken: 0.005246 seconds

local RunService_upvr = game:GetService("RunService")
local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local TouchLightsToggle_upvr = script.Parent:WaitForChild("TouchLightsToggle")
local module_upvr_2 = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput"))
local var6_upvw
local var7_upvw = 0
local var8_upvw = 0
local var9_upvw = 0
local Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
local var11_upvw
function newCharacter() -- Line 20
	--[[ Upvalues[8]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: var6_upvw (read and write)
		[5]: TouchLightsToggle_upvr (readonly)
		[6]: module_upvr_2 (readonly)
		[7]: var11_upvw (read and write)
		[8]: var9_upvw (read and write)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	Humanoid_upvw.StateChanged:connect(function(arg1, arg2) -- Line 24
		--[[ Upvalues[6]:
			[1]: var6_upvw (copied, read and write)
			[2]: TouchLightsToggle_upvr (copied, readonly)
			[3]: module_upvr_2 (copied, readonly)
			[4]: var11_upvw (copied, read and write)
			[5]: Humanoid_upvw (copied, read and write)
			[6]: var9_upvw (copied, read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [30] 24. Error Block 4 start (CF ANALYSIS FAILED)
		var11_upvw:Disconnect()
		var11_upvw = nil
		do
			return
		end
		-- KONSTANTERROR: [30] 24. Error Block 4 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [37] 30. Error Block 15 start (CF ANALYSIS FAILED)
		if not var6_upvw and arg2 == Enum.HumanoidStateType.Seated and Humanoid_upvw.SeatPart and Humanoid_upvw.SeatPart.Name == "DriveSeat" then
			var6_upvw = Humanoid_upvw.SeatPart.Parent
			if module_upvr_2.Device == "Touch" then
				TouchLightsToggle_upvr.Visible = true
			end
			module_upvr_2.SetBackpackEnabled(false)
			var11_upvw = var6_upvw.Configuration.MaxSpeed.Changed:Connect(function() -- Line 42
				--[[ Upvalues[1]:
					[1]: var9_upvw (copied, read and write)
				]]
				powerWheels(var9_upvw)
			end)
			runSounds()
		end
		-- KONSTANTERROR: [37] 30. Error Block 15 end (CF ANALYSIS FAILED)
	end)
end
newCharacter()
LocalPlayer_upvr.CharacterAdded:connect(newCharacter)
local var14_upvw
function steerWheels(arg1) -- Line 52
	--[[ Upvalues[3]:
		[1]: var6_upvw (read and write)
		[2]: var14_upvw (read and write)
		[3]: RunService_upvr (readonly)
	]]
	if not var6_upvw or not var6_upvw.Parent or not var6_upvw:FindFirstChild("SteerMotors") then
	else
		var14_upvw = tick()
		for _, v_upvr in pairs(var6_upvw.SteerMotors:GetChildren()) do
			local Value_upvr = v_upvr.Motor.Value
			if Value_upvr and var6_upvw then
				coroutine.resume(coroutine.create(function() -- Line 60
					--[[ Upvalues[7]:
						[1]: Value_upvr (readonly)
						[2]: var6_upvw (copied, read and write)
						[3]: v_upvr (readonly)
						[4]: arg1 (readonly)
						[5]: var14_upvw (readonly)
						[6]: var14_upvw (copied, read and write)
						[7]: RunService_upvr (copied, readonly)
					]]
					-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
					Value_upvr.DesiredAngle = var6_upvw.Configuration.SteerAngle.Value * v_upvr.DirectionFactor.Value * arg1
					Value_upvr.MaxVelocity = 6 * var6_upvw.Configuration.SteerVelocity.Value
					-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [63] 44. Error Block 23 start (CF ANALYSIS FAILED)
					RunService_upvr.RenderStepped:wait()
					-- KONSTANTERROR: [63] 44. Error Block 23 end (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [30] 21. Error Block 2 start (CF ANALYSIS FAILED)
					-- KONSTANTERROR: [30] 21. Error Block 2 end (CF ANALYSIS FAILED)
				end))
			end
		end
	end
end
function powerWheels(arg1) -- Line 78
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	if not var6_upvw or not var6_upvw.Parent or not var6_upvw:FindFirstChild("PowerWheels") then
	else
		for _, v_2 in pairs(var6_upvw.PowerWheels:GetChildren()) do
			local Wheel = v_2.Wheel
			local Value = Wheel.Value
			if Value then
				if arg1 == 0 then
					Wheel = 10000
				else
					Wheel = var6_upvw.Configuration.MaxSpeed.Value * math.abs(arg1) * 600000
				end
				Value.MotorMaxTorque = Wheel
				Wheel = var6_upvw.Configuration.MaxSpeed.Value * v_2.DirectionFactor.Value * arg1 * 35
				Value.AngularVelocity = Wheel
			end
		end
	end
end
function steerChanged() -- Line 92
	--[[ Upvalues[1]:
		[1]: var8_upvw (read and write)
	]]
	steerWheels(var8_upvw)
end
local var31_upvw = 0
function throttleChanged() -- Line 98
	--[[ Upvalues[5]:
		[1]: var31_upvw (read and write)
		[2]: var7_upvw (read and write)
		[3]: var9_upvw (read and write)
		[4]: RunService_upvr (readonly)
		[5]: var6_upvw (read and write)
	]]
	local tick_result1 = tick()
	var31_upvw = tick_result1
	local var35
	if math.sign(var7_upvw) ~= math.sign(var9_upvw) then
		var35 = math.sign(var7_upvw - var9_upvw) * 0.3
	else
		var35 = var9_upvw
	end
	if math.abs(var7_upvw) < 0.05 then
		var35 = 0
		var7_upvw = 0
	elseif math.abs(var7_upvw) < 0.4 then
		var35 = 0
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	for i = var35, var7_upvw, math.sign(var7_upvw - var9_upvw) * 0.008 do
		powerWheels(i)
		var9_upvw = i
		RunService_upvr.RenderStepped:wait()
		if tick_result1 ~= var31_upvw then break end
		if not var6_upvw then break end
	end
end
function runSounds() -- Line 131
	--[[ Upvalues[2]:
		[1]: var6_upvw (read and write)
		[2]: var9_upvw (read and write)
	]]
	local var36
	if var36 then
		var36 = var6_upvw.RunSounds:FireServer
		var36("Startup")
		var36 = task.wait
		var36(1)
		var36 = var6_upvw
		if var36 then
			var36 = (1 - var6_upvw.Configuration.SoundPitchRange.MinValue) / (var6_upvw.Configuration.SoundPitchRange.MaxValue - var6_upvw.Configuration.SoundPitchRange.MinValue)
		end
		while var6_upvw do
			var36 += (math.abs(var9_upvw) - var36) * 0.1
			var6_upvw.RunSounds:FireServer("Set Pitch", var36)
			task.wait()
		end
	end
end
function stopSounds() -- Line 144
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	if var6_upvw:FindFirstChild("RunSounds") then
		var6_upvw.RunSounds:FireServer("Cut")
	end
end
module_upvr_2.SteerChange(function(arg1) -- Line 155
	--[[ Upvalues[2]:
		[1]: var6_upvw (read and write)
		[2]: var8_upvw (read and write)
	]]
	if var6_upvw then
		var8_upvw = arg1
		steerChanged()
	end
end)
module_upvr_2.ThrottleChange(function(arg1) -- Line 162
	--[[ Upvalues[2]:
		[1]: var6_upvw (read and write)
		[2]: var7_upvw (read and write)
	]]
	if var6_upvw then
		var7_upvw = arg1
		throttleChanged()
	end
end)
module_upvr_2.VehicleToggleLights(function() -- Line 170, Named "toggleLights"
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	if var6_upvw then
		local LampRemote_3 = var6_upvw:FindFirstChild("LampRemote", true)
		if LampRemote_3 then
			game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(LampRemote_3)
		end
	end
end)
local module_upvr = require(script.Parent.Parent:WaitForChild("BumpButton"))
TouchLightsToggle_upvr.MouseButton1Click:Connect(function() -- Line 180
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: TouchLightsToggle_upvr (readonly)
		[3]: var6_upvw (read and write)
	]]
	if not module_upvr.Bump(TouchLightsToggle_upvr) then
	elseif var6_upvw then
		local LampRemote = var6_upvw:FindFirstChild("LampRemote", true)
		if LampRemote then
			game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(LampRemote)
		end
	end
end)