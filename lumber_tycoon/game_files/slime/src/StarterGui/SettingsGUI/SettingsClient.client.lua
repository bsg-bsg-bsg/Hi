-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:43
-- Luau version 6, Types version 3
-- Time taken: 0.008614 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local module_upvr_3 = require(LocalPlayer_upvr:WaitForChild("PlayerGui"):WaitForChild("Scripts"):WaitForChild("SetSelectedButton"))
local module_upvr_2 = require(script.Parent.Parent:WaitForChild("BumpButton"))
local module_upvr = require(game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientUserSettings"))
local Menu_upvr = script.Parent.Parent:WaitForChild("MenuGUI"):WaitForChild("Menu")
local Settings_upvr = Menu_upvr:WaitForChild("Main"):WaitForChild("MenuItems"):WaitForChild("Settings")
local Settings_upvr_2 = script.Parent:WaitForChild("Settings")
local GlobalSettings = Settings_upvr_2:WaitForChild("Main"):WaitForChild("GlobalSettings")
local SettingItem_upvr = script:WaitForChild("SettingItem")
local IsOpen_upvr = script.Parent.IsOpen
local tbl_6_upvr = {}
local tbl_3_upvr = {
	DisplayName = "Global Permissions";
	UserId = 0;
}
local tbl_5 = {}
local tbl = {
	Id = "MusicEnabled";
	Display = "Music";
}
tbl_5[1] = tbl
function tbl(arg1, arg2, arg3) -- Line 38, Named "setTicked"
	local Button = arg1.Button
	if arg2 then
		Button = "✔"
	else
		Button = ""
	end
	Button.Tick.Text = Button
	Button = arg1.Button
	local function INLINED() -- Internal function, doesn't exist in bytecode
		Button = Color3.new(0.54, 0.54, 0.54)
		return Button
	end
	if not arg3 or not INLINED() then
		Button = Color3.new(0.86, 0.86, 0.86)
	end
	Button.Tick.BackgroundColor3 = Button
	Button = arg1.Button
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		Button = Color3.new(0.54, 0.54, 0.54)
		return Button
	end
	if not arg3 or not INLINED_2() then
		Button = Color3.new(0.86, 0.86, 0.86)
	end
	Button.TextLabel.BackgroundColor3 = Button
end
local var19_upvr = tbl
for i, v_upvr in pairs(tbl_5) do
	local clone_upvr_2 = SettingItem_upvr:Clone()
	clone_upvr_2.Button.TextLabel.Text = v_upvr.Display
	clone_upvr_2.LayoutOrder = i
	clone_upvr_2.Parent = GlobalSettings
	clone_upvr_2.Button.MouseButton1Click:connect(function() -- Line 50
		--[[ Upvalues[5]:
			[1]: module_upvr_2 (readonly)
			[2]: clone_upvr_2 (readonly)
			[3]: v_upvr (readonly)
			[4]: module_upvr (readonly)
			[5]: var19_upvr (readonly)
		]]
		if not module_upvr_2.Bump(clone_upvr_2) then
		else
			local var26 = not playerSettings[v_upvr.Id]
			playerSettings[v_upvr.Id] = var26
			module_upvr.SendUpdate("Global", v_upvr.Id, var26)
			var19_upvr(clone_upvr_2, var26)
		end
	end)
	tbl_6_upvr[v_upvr.Id] = clone_upvr_2
end
local tbl_4_upvw = {}
local tbl_2_upvw = {}
local SettingsList_upvr = Settings_upvr_2:WaitForChild("Main"):WaitForChild("SettingsList")
local PlayerItem_upvr = script:WaitForChild("PlayerItem")
local PlayerList_upvr = Settings_upvr_2:WaitForChild("Main"):WaitForChild("PlayerList")
function populateSettings() -- Line 63
	--[[ Upvalues[14]:
		[1]: module_upvr (readonly)
		[2]: var19_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: tbl_4_upvw (read and write)
		[5]: tbl_2_upvw (read and write)
		[6]: tbl_3_upvr (readonly)
		[7]: SettingItem_upvr (readonly)
		[8]: Settings_upvr_2 (readonly)
		[9]: module_upvr_2 (readonly)
		[10]: SettingsList_upvr (readonly)
		[11]: PlayerItem_upvr (readonly)
		[12]: PlayerList_upvr (readonly)
		[13]: LocalPlayer_upvr (readonly)
		[14]: module_upvr_3 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 33 start (CF ANALYSIS FAILED)
	playerSettings = module_upvr.GetSettings() -- Setting global
	var19_upvr(tbl_6_upvr.MusicEnabled, playerSettings.MusicEnabled)
	local pairs_result1_4, pairs_result2_3, pairs_result3_3 = pairs(tbl_4_upvw)
	local var47
	for _, v_2 in pairs_result1_4, pairs_result2_3, pairs_result3_3 do
		v_2:Destroy()
	end
	pairs_result2_3 = tbl_2_upvw
	local var48 = pairs_result2_3
	if not var48 then
		var48 = {}
	end
	for _, v_3 in pairs(var48) do
		v_3:Destroy()
	end
	tbl_4_upvw = {}
	tbl_2_upvw = nil
	local var52_upvw
	local var53_upvw = 0
	local var54_upvw
	local var55_upvw = false
	local var56_upvw
	local GlobalPermissionsData_upvr = playerSettings.GlobalPermissionsData
	local PlayerPermissionsData_upvr = playerSettings.PlayerPermissionsData
	local var59_upvw
	local var60_upvw = true
	local function setPlayerPermissionsSettingsWindow_upvr(arg1) -- Line 91, Named "setPlayerPermissionsSettingsWindow"
		--[[ Upvalues[17]:
			[1]: var52_upvw (read and write)
			[2]: var54_upvw (read and write)
			[3]: module_upvr (copied, readonly)
			[4]: var55_upvw (read and write)
			[5]: tbl_3_upvr (copied, readonly)
			[6]: var56_upvw (read and write)
			[7]: GlobalPermissionsData_upvr (readonly)
			[8]: PlayerPermissionsData_upvr (readonly)
			[9]: var59_upvw (read and write)
			[10]: var60_upvw (read and write)
			[11]: var19_upvr (copied, readonly)
			[12]: tbl_2_upvw (copied, read and write)
			[13]: SettingItem_upvr (copied, readonly)
			[14]: Settings_upvr_2 (copied, readonly)
			[15]: module_upvr_2 (copied, readonly)
			[16]: tbl_4_upvw (copied, read and write)
			[17]: SettingsList_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 66 start (CF ANALYSIS FAILED)
		var52_upvw = arg1
		var54_upvw = tostring(arg1.UserId)
		local any_GetSettings_result1 = module_upvr.GetSettings()
		playerSettings = any_GetSettings_result1 -- Setting global
		if arg1 ~= tbl_3_upvr then
			any_GetSettings_result1 = false
		else
			any_GetSettings_result1 = true
		end
		var55_upvw = any_GetSettings_result1
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			any_GetSettings_result1 = GlobalPermissionsData_upvr
			return any_GetSettings_result1
		end
		if not var55_upvw or not INLINED_3() then
			any_GetSettings_result1 = PlayerPermissionsData_upvr
		end
		var56_upvw = any_GetSettings_result1
		any_GetSettings_result1 = var55_upvw
		if any_GetSettings_result1 then
			any_GetSettings_result1 = playerSettings.GlobalPermissionList
			var59_upvw = any_GetSettings_result1
		else
			any_GetSettings_result1 = playerSettings.UserPermissionList[var54_upvw]
			var59_upvw = any_GetSettings_result1
			any_GetSettings_result1 = var59_upvw
			if not any_GetSettings_result1 then
				any_GetSettings_result1 = {}
				var59_upvw = any_GetSettings_result1
				any_GetSettings_result1 = playerSettings.UserPermissionList
				any_GetSettings_result1[var54_upvw] = var59_upvw
			end
		end
		function any_GetSettings_result1(arg1_2) -- Line 108, Named "getOverridden"
			--[[ Upvalues[1]:
				[1]: var55_upvw (copied, read and write)
			]]
			if var55_upvw then
				return false
			end
			return playerSettings.GlobalPermissionList[arg1_2]
		end
		local function setPlayerPermissionButton_upvr(arg1_3, arg2) -- Line 117, Named "setPlayerPermissionButton"
			--[[ Upvalues[6]:
				[1]: var60_upvw (copied, read and write)
				[2]: var56_upvw (copied, read and write)
				[3]: var59_upvw (copied, read and write)
				[4]: var19_upvr (copied, readonly)
				[5]: tbl_2_upvw (copied, read and write)
				[6]: var55_upvw (copied, read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			var60_upvw = true
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [4] 4. Error Block 36 start (CF ANALYSIS FAILED)
			var60_upvw = arg2
			for _, v_4 in pairs(var56_upvw) do
				var59_upvw[v_4.Id] = arg2
				local Id = v_4.Id
				if var55_upvw then
					Id = false
				else
					Id = playerSettings.GlobalPermissionList[v_4.Id]
				end
				var19_upvr(tbl_2_upvw[Id], arg2, Id)
			end
			if var55_upvw then
			else
			end
			var19_upvr(tbl_2_upvw[arg1_3], arg2, playerSettings.GlobalPermissionList[arg1_3])
			var19_upvr(tbl_2_upvw.All, var60_upvw)
			-- KONSTANTERROR: [4] 4. Error Block 36 end (CF ANALYSIS FAILED)
		end
		if not tbl_2_upvw then
			tbl_2_upvw = {}
			local function newSetting(arg1_4, arg2) -- Line 142
				--[[ Upvalues[9]:
					[1]: SettingItem_upvr (copied, readonly)
					[2]: Settings_upvr_2 (copied, readonly)
					[3]: module_upvr_2 (copied, readonly)
					[4]: var60_upvw (copied, read and write)
					[5]: var59_upvw (copied, read and write)
					[6]: module_upvr (copied, readonly)
					[7]: var54_upvw (copied, read and write)
					[8]: setPlayerPermissionButton_upvr (readonly)
					[9]: tbl_2_upvw (copied, read and write)
				]]
				local clone_upvr_3 = SettingItem_upvr:Clone()
				clone_upvr_3.Button.TextLabel.Text = arg1_4.Display
				clone_upvr_3.LayoutOrder = arg2
				clone_upvr_3.Parent = Settings_upvr_2.Main.SettingsList.List
				if arg1_4.Display == "All" then
					clone_upvr_3.Button.TextLabel.RichText = true
					clone_upvr_3.Button.TextLabel.Text = "<b><i>"..clone_upvr_3.Button.TextLabel.Text.."</i></b>"
				end
				clone_upvr_3.Button.MouseButton1Click:connect(function() -- Line 153
					--[[ Upvalues[8]:
						[1]: module_upvr_2 (copied, readonly)
						[2]: clone_upvr_3 (readonly)
						[3]: arg1_4 (readonly)
						[4]: var60_upvw (copied, read and write)
						[5]: var59_upvw (copied, read and write)
						[6]: module_upvr (copied, readonly)
						[7]: var54_upvw (copied, read and write)
						[8]: setPlayerPermissionButton_upvr (copied, readonly)
					]]
					if not module_upvr_2.Bump(clone_upvr_3) then
					else
						local var80
						if arg1_4.Id == "All" then
							var80 = not var60_upvw
						else
							var80 = not var59_upvw[arg1_4.Id]
							var59_upvw[arg1_4.Id] = var80
						end
						module_upvr.SendUpdate("UserPermission", var54_upvw, arg1_4.Id, var80)
						setPlayerPermissionButton_upvr(arg1_4.Id, var80)
					end
				end)
				tbl_2_upvw[arg1_4.Id] = clone_upvr_3
			end
			newSetting({
				Id = "All";
				Display = "All";
			}, 0)
			for i_5, v_5 in pairs(PlayerPermissionsData_upvr) do
				newSetting(v_5, i_5)
				local _
			end
		end
		local _, _, _ = pairs(tbl_2_upvw)
		-- KONSTANTERROR: [0] 1. Error Block 66 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [103] 86. Error Block 19 start (CF ANALYSIS FAILED)
		local _, _, _ = pairs(var56_upvw)
		-- KONSTANTERROR: [103] 86. Error Block 19 end (CF ANALYSIS FAILED)
	end
	local function addPlayerButton(arg1) -- Line 203
		--[[ Upvalues[8]:
			[1]: tbl_3_upvr (copied, readonly)
			[2]: PlayerItem_upvr (copied, readonly)
			[3]: PlayerList_upvr (copied, readonly)
			[4]: module_upvr_2 (copied, readonly)
			[5]: var52_upvw (read and write)
			[6]: tbl_4_upvw (copied, read and write)
			[7]: setPlayerPermissionsSettingsWindow_upvr (readonly)
			[8]: var53_upvw (read and write)
		]]
		local var92
		if arg1 ~= tbl_3_upvr then
			var92 = false
		else
			var92 = true
		end
		local clone_upvr = PlayerItem_upvr:Clone()
		clone_upvr.TextLabel.Text = arg1.DisplayName
		clone_upvr.Parent = PlayerList_upvr.List
		if var92 then
			clone_upvr.TextLabel.RichText = true
			clone_upvr.TextLabel.Text = "<b><i>"..clone_upvr.TextLabel.Text.."</i></b>"
		end
		clone_upvr.MouseButton1Click:connect(function() -- Line 214
			--[[ Upvalues[6]:
				[1]: module_upvr_2 (copied, readonly)
				[2]: clone_upvr (readonly)
				[3]: var52_upvw (copied, read and write)
				[4]: tbl_4_upvw (copied, read and write)
				[5]: setPlayerPermissionsSettingsWindow_upvr (copied, readonly)
				[6]: arg1 (readonly)
			]]
			if not module_upvr_2.Bump(clone_upvr) then
			else
				if var52_upvw and tbl_4_upvw[var52_upvw] then
					tbl_4_upvw[var52_upvw].BorderSizePixel = 0
				end
				clone_upvr.BorderSizePixel = 2
				setPlayerPermissionsSettingsWindow_upvr(arg1)
			end
		end)
		tbl_4_upvw[arg1] = clone_upvr
		var53_upvw += 1
	end
	var47 = tbl_3_upvr
	addPlayerButton(var47)
	var47 = game.Players:GetPlayers()
	local pairs_result1_2, pairs_result2_2, pairs_result3_4 = pairs(var47)
	for _, v_6 in pairs_result1_2, pairs_result2_2, pairs_result3_4 do
		if v_6 ~= LocalPlayer_upvr then
			addPlayerButton(v_6)
		end
	end
	pairs_result2_2 = UDim2.new(0, 0, 0, PlayerList_upvr.List.UIGridLayout.AbsoluteContentSize.Y + 10)
	PlayerList_upvr.CanvasSize = pairs_result2_2
	pairs_result2_2 = PlayerList_upvr.List
	pairs_result2_2 = UDim2.new
	if PlayerList_upvr.AbsoluteSize.Y < PlayerList_upvr.CanvasSize.Y.Offset then
		-- KONSTANTWARNING: GOTO [151] #114
	end
	-- KONSTANTERROR: [0] 1. Error Block 33 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [150] 113. Error Block 36 start (CF ANALYSIS FAILED)
	pairs_result2_2 = pairs_result2_2(1, 0, 0, PlayerList_upvr.List.UIGridLayout.CellSize.Y.Offset)
	pairs_result2_2.UIGridLayout.CellSize = pairs_result2_2
	pairs_result2_2 = PlayerList_upvr
	if var53_upvw ~= 0 then
		pairs_result2_2 = false
	else
		pairs_result2_2 = true
	end
	pairs_result2_2.IsEmpty.Visible = pairs_result2_2
	pairs_result2_2 = tbl_6_upvr.MusicEnabled
	module_upvr_3(pairs_result2_2)
	-- KONSTANTERROR: [150] 113. Error Block 36 end (CF ANALYSIS FAILED)
end
function newPlayerItem(arg1) -- Line 248
end
local ClientNoticeIsOpen_upvr = game.ReplicatedStorage.Notices.ClientNoticeIsOpen
function exitAll() -- Line 255
	--[[ Upvalues[4]:
		[1]: ClientNoticeIsOpen_upvr (readonly)
		[2]: Settings_upvr_2 (readonly)
		[3]: module_upvr_3 (readonly)
		[4]: IsOpen_upvr (readonly)
	]]
	ClientNoticeIsOpen_upvr.Value = false
	Settings_upvr_2.Visible = false
	module_upvr_3(nil)
	IsOpen_upvr.Value = false
end
function back() -- Line 262
	--[[ Upvalues[2]:
		[1]: Settings_upvr_2 (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	if not Settings_upvr_2.Visible then
	else
		if not module_upvr_2.Bump(Settings_upvr_2.Quit) then return end
		exitAll()
	end
end
function openWindow() -- Line 273
	--[[ Upvalues[5]:
		[1]: module_upvr_2 (readonly)
		[2]: Settings_upvr (readonly)
		[3]: Menu_upvr (readonly)
		[4]: Settings_upvr_2 (readonly)
		[5]: IsOpen_upvr (readonly)
	]]
	if not module_upvr_2.Bump(Settings_upvr) then
	else
		setPlatformControls()
		Menu_upvr.Visible = false
		Settings_upvr_2.Visible = true
		populateSettings()
		IsOpen_upvr.Value = true
	end
end
function setPlatformControls() -- Line 289
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Settings_upvr_2 (readonly)
	]]
	require(LocalPlayer_upvr.PlayerGui.Scripts.SetPlatformControls)({Settings_upvr_2.Quit})
end
task.wait(1)
input = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput")) -- Setting global
input.InteractAbort(back)
Settings_upvr.MouseButton1Click:connect(function() -- Line 306
	openWindow()
end)
Settings_upvr_2.Quit.MouseButton1Click:connect(function() -- Line 310
	back()
end)