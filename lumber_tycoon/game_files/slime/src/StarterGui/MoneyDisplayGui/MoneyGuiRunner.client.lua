-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:45
-- Luau version 6, Types version 3
-- Time taken: 0.000860 seconds

local LocalPlayer = game.Players.LocalPlayer
local Money_upvr = LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Money")
local Text_upvr = script.Parent:WaitForChild("Text")
local DropShadow_upvr = Text_upvr:WaitForChild("DropShadow")
local function comma_value_upvr(arg1) -- Line 11, Named "comma_value"
	local var5
	repeat
		local string_gsub_result1, string_gsub_result2 = string.gsub(var5, "^(-?%d+)(%d%d%d)", "%1,%2")
		var5 = string_gsub_result1
	until string_gsub_result2 == 0
	return var5
end
Money_upvr.Changed:Connect(function() -- Line 23, Named "updateValue"
	--[[ Upvalues[4]:
		[1]: Text_upvr (readonly)
		[2]: comma_value_upvr (readonly)
		[3]: Money_upvr (readonly)
		[4]: DropShadow_upvr (readonly)
	]]
	Text_upvr.Text = '$'..comma_value_upvr(Money_upvr.Value)
	DropShadow_upvr.Text = Text_upvr.Text
end)
Text_upvr.Text = '$'..comma_value_upvr(Money_upvr.Value)
DropShadow_upvr.Text = Text_upvr.Text
Text_upvr.Visible = true
LocalPlayer:WaitForChild("PlayerGui"):SetTopbarTransparency(1)
task.wait(1)
Text_upvr.Position = UDim2.new(1, -60, 0, 6)