-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:45
-- Luau version 6, Types version 3
-- Time taken: 0.003059 seconds

local CurrentCamera_upvr = workspace.CurrentCamera
local module_upvr = {
	Active = false;
}
local var3_upvw = false
local var4_upvw = false
local var5_upvw = 0
local tbl_upvr = {{
	Text = "To find glowing fir, come this way.";
	CFrame = script.Passage.CFrame;
}, {
	Text = "Drop off the glowing fir at the cabin, here.";
	CFrame = script.Cabin.CFrame;
}}
local var9_upvw
function flyCameraTo(arg1, arg2) -- Line 21
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: var9_upvw (read and write)
		[3]: CurrentCamera_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
	var4_upvw = true
	local tick_result1 = tick()
	if not arg2 then
		var9_upvw = tick_result1
	end
	local magnitude = (arg1.p - CurrentCamera_upvr.CoordinateFrame.p).magnitude
	local var12
	if var12 < magnitude and not arg2 then
		var12 = flyCameraTo
		var12(CFrame.new(0, 100, 0) * CFrame.new(CurrentCamera_upvr.CFrame.p, arg1.p), true)
		var12 = CFrame.new(CurrentCamera_upvr.CFrame.p, arg1.p) * CFrame.new(0, 0, -magnitude + 350)
		if var9_upvw == tick_result1 then
			flyCameraTo(var12, true)
		end
		if var9_upvw == tick_result1 then
			flyCameraTo(arg1, true)
			-- KONSTANTWARNING: GOTO [112] #84
		end
	else
		var12 = magnitude / 200
		local var13 = var12
		print(var13)
		if 1.8 < var13 then
			var13 /= 2
		end
		CurrentCamera_upvr.CameraType = Enum.CameraType.Scriptable
		CurrentCamera_upvr.CameraSubject = nil
		CurrentCamera_upvr:Interpolate(arg1, arg1 * CFrame.new(0, 0, -50), var13)
		task.wait(var13)
	end
	-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [112] 84. Error Block 13 start (CF ANALYSIS FAILED)
	var13 = false
	var4_upvw = var13
	-- KONSTANTERROR: [112] 84. Error Block 13 end (CF ANALYSIS FAILED)
end
local var14_upvw
local Open_upvr = script.Parent.Parent.Parent:WaitForChild("MenuGUI"):WaitForChild("Open")
function module_upvr.Initiate(arg1) -- Line 54
	--[[ Upvalues[4]:
		[1]: var14_upvw (read and write)
		[2]: CurrentCamera_upvr (readonly)
		[3]: Open_upvr (readonly)
		[4]: module_upvr (readonly)
	]]
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		Character = game.Players.LocalPlayer.CharacterAdded:wait()
	end
	Character.Humanoid.WalkSpeed = 0
	var14_upvw = CurrentCamera_upvr.CFrame
	CurrentCamera_upvr.CameraType = Enum.CameraType.Scriptable
	CurrentCamera_upvr.CameraSubject = nil
	Open_upvr.Visible = false
	module_upvr.Active = true
	module_upvr:Next()
	flyCameraTo(var14_upvw)
	CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
	CurrentCamera_upvr.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	Open_upvr.Visible = true
	module_upvr.Active = false
	Character.Humanoid.WalkSpeed = Character.Humanoid.WalkSpeed + Character.Humanoid.WalkSpeed
end
local SendUserNotice_upvr = game.ReplicatedStorage.Notices.SendUserNotice
function module_upvr.Next(arg1) -- Line 78
	--[[ Upvalues[5]:
		[1]: var3_upvw (read and write)
		[2]: var5_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: SendUserNotice_upvr (readonly)
		[5]: var4_upvw (read and write)
	]]
	var3_upvw = false
	var5_upvw += 1
	if var5_upvw == #tbl_upvr then
		SendUserNotice_upvr:Fire(tbl_upvr[var5_upvw].Text, nil, "RestartCamera", true)
	else
		SendUserNotice_upvr:Fire(tbl_upvr[var5_upvw].Text, nil, "CameraNext", true)
	end
	flyCameraTo(tbl_upvr[var5_upvw].CFrame)
	task.wait()
	while not (script.Parent.Parent.Parent.NoticeGUI.Notice.Visible or var3_upvw or not var4_upvw) do
		task.wait()
	end
end
function module_upvr.Restart(arg1) -- Line 93
	--[[ Upvalues[4]:
		[1]: var9_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: module_upvr (readonly)
	]]
	var9_upvw = tick()
	var3_upvw = true
	var5_upvw = 0
	module_upvr:Next()
end
return module_upvr