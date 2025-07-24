-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:44
-- Luau version 6, Types version 3
-- Time taken: 0.001803 seconds

local Cross_upvr = script.Parent:WaitForChild("Cross")
local Active_upvr = script.Parent:WaitForChild("Active")
local module_upvr = require(game.Players.LocalPlayer.PlayerGui:WaitForChild("Scripts"):WaitForChild("UserInput"))
local var5_upvw = 0
Active_upvr.Changed:connect(function(arg1) -- Line 8
	--[[ Upvalues[3]:
		[1]: Cross_upvr (readonly)
		[2]: var5_upvw (read and write)
		[3]: Active_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not arg1 or not script.Parent.Enabled then
		for _, v in pairs(Cross_upvr:GetChildren()) do
			v.BackgroundColor3 = Color3.new(1, 1, 1)
			v.BackgroundTransparency = 0.5
		end
	end
	var5_upvw = tick()
	while Active_upvr.Value do
		local var26 = -math.cos(0) / 2 + 0.5
		for _, v_2 in pairs(Cross_upvr:GetChildren()) do
			v_2.BackgroundColor3 = Color3.new(var26 * 0.1 + 0.6, 1, var26 * 0.7)
			v_2.BackgroundTransparency = var26 * 0.5 + 0
			local _
		end
		task.wait()
		if var5_upvw ~= var5_upvw then return end
	end
end)
local UserInputService_upvr = game:GetService("UserInputService")
module_upvr.BindDeviceUpdateCallback(function() -- Line 38, Named "update"
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: UserInputService_upvr (readonly)
		[3]: Cross_upvr (readonly)
	]]
	local var32
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var32 = false
		return module_upvr.Device == "Touch"
	end
	if module_upvr.Device == "Gamepad" or INLINED() then
		var32 = not module_upvr.LastInputSoaked
	end
	script.Parent.Enabled = var32
	UserInputService_upvr.MouseIconEnabled = not var32
	local MouseLocation = module_upvr.MouseLocation
	Cross_upvr.Position = UDim2.new(0, MouseLocation.X, 0, MouseLocation.Y)
end)