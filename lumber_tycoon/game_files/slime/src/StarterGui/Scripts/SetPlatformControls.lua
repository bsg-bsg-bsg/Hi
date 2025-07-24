-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:41
-- Luau version 6, Types version 3
-- Time taken: 0.000983 seconds

local module_3_upvr = require(script.Parent:WaitForChild("UserInput"))
function module(arg1) -- Line 3
	--[[ Upvalues[1]:
		[1]: module_3_upvr (readonly)
	]]
	for _, v in pairs(arg1) do
		local var9
		if module_3_upvr.Device ~= "Gamepad" then
			var9 = false
		else
			var9 = true
		end
		setButton(v, var9)
	end
end
function setButton(arg1, arg2) -- Line 9
	if arg2 then
		arg1.PlatformButton.Visible = true
		arg1.TextLabel.Size = UDim2.new(1, -arg1.PlatformButton.Size.X.Offset, 1, 0)
		arg1.TextLabel.Position = UDim2.new(0, arg1.PlatformButton.Size.X.Offset, 0, 0)
	else
		arg1.PlatformButton.Visible = false
		arg1.TextLabel.Size = UDim2.new(1, 0, 1, 0)
		arg1.TextLabel.Position = UDim2.new(0, 0, 0, 0)
	end
end
return module