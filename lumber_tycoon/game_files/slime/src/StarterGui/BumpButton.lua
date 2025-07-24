-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:40
-- Luau version 6, Types version 3
-- Time taken: 0.001481 seconds

local module = {}
local var2_upvw = false
local var3_upvw
local tbl_upvr = {}
local Bump_2_upvr = game.Players.LocalPlayer.PlayerGui:WaitForChild("ClientSounds").Bump
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true)
function module.Bump(arg1, arg2) -- Line 12
	--[[ Upvalues[6]:
		[1]: var2_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: Bump_2_upvr (readonly)
		[5]: TweenService_upvr (readonly)
		[6]: TweenInfo_new_result1_upvr (readonly)
	]]
	if var2_upvw and 1 < tick() - var3_upvw then
		var2_upvw = false
	end
	if tbl_upvr[arg1] and 1 < tick() - tbl_upvr[arg1] then
		tbl_upvr[arg1] = false
	end
	if tbl_upvr[arg1] or var2_upvw then
		return false
	end
	var2_upvw = true
	var3_upvw = tick()
	tbl_upvr[arg1] = tick()
	local BackgroundColor3 = arg1.BackgroundColor3
	Bump_2_upvr:play()
	if not arg2 then
		local any_Create_result1 = TweenService_upvr:Create(arg1, TweenInfo_new_result1_upvr, {
			BackgroundColor3 = Color3.new(BackgroundColor3.r * 0.5, BackgroundColor3.g * 0.5, BackgroundColor3.b * 0.5);
		})
		any_Create_result1:Play()
		any_Create_result1.Completed:Wait()
		arg1.BackgroundColor3 = BackgroundColor3
	end
	var2_upvw = false
	tbl_upvr[arg1] = false
	return true
end
return module