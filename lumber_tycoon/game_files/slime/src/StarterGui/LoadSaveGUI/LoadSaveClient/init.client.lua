-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:46
-- Luau version 6, Types version 3
-- Time taken: 0.022293 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
LocalPlayer_upvr:WaitForChild("CurrentlySavingOrLoading")
local module_upvr_3 = require(LocalPlayer_upvr:WaitForChild("PlayerGui"):WaitForChild("Scripts"):WaitForChild("SetSelectedButton"))
local Menu_upvr = script.Parent.Parent:WaitForChild("MenuGUI"):WaitForChild("Menu")
local SaveLoad_upvr = Menu_upvr:WaitForChild("Main"):WaitForChild("MenuItems"):WaitForChild("SaveLoad")
local SlotList_upvr = script.Parent:WaitForChild("SlotList")
local SlotInfo_upvr = script.Parent:WaitForChild("SlotInfo")
local Progress_upvr = script.Parent:WaitForChild("Progress")
local OverwriteConfirm_upvr = script.Parent:WaitForChild("OverwriteConfirm")
local DeleteConfirm_upvr = script.Parent:WaitForChild("DeleteConfirm")
local ClientNoticeIsOpen_upvr = game.ReplicatedStorage.Notices.ClientNoticeIsOpen
local module_upvr_4 = require(script.Parent.Parent:WaitForChild("BumpButton"))
local module_upvr = require(game.ReplicatedStorage:WaitForChild("LocalizationUtil"))
local SlotItem_upvr = SlotList_upvr:WaitForChild("Main"):WaitForChild("SlotItem")
SlotItem_upvr.Visible = false
local ClientMayLoad_upvr = game.ReplicatedStorage.LoadSaveRequests.ClientMayLoad
local GetMetaData_upvr = game.ReplicatedStorage.LoadSaveRequests.GetMetaData
local SendUserNotice_upvr = game.ReplicatedStorage.Notices.SendUserNotice
local IsOpen_upvr = script.Parent.IsOpen
local var22_upvw = "Closed"
local LocalScript_upvr = script:WaitForChild("LocalScript")
task.wait(1.5)
local CurrentSaveSlot_upvr = script.CurrentSaveSlot
CurrentSaveSlot_upvr.Parent = LocalPlayer_upvr
math.randomseed(tick())
local seed_upvr = math.random()
pcall(function() -- Line 56
	--[[ Upvalues[2]:
		[1]: CurrentSaveSlot_upvr (readonly)
		[2]: seed_upvr (readonly)
	]]
	CurrentSaveSlot_upvr.Set:Invoke(seed_upvr, "zebras")
end)
local var27_upvw = LocalPlayer_upvr
local LoadOtherId_upvr = SlotList_upvr.Main.LoadOtherId
local LoadVersion_upvr = SlotList_upvr.Main.LoadVersion
local Pass_upvr = SlotList_upvr.Main.Pass
local tbl_3_upvr = {LoadVersion_upvr, LoadOtherId_upvr, SlotList_upvr.Main.Logs, SlotList_upvr.Main.SlotHistory, SlotList_upvr.Main.SetFunds, SlotList_upvr.Main.ModeratePlayer}
for _, v in pairs(tbl_3_upvr) do
	v.Visible = false
end
local var35_upvw = false
local var36_upvw = false
local function _() -- Line 81, Named "isAdmin"
	--[[ Upvalues[1]:
		[1]: var36_upvw (read and write)
	]]
	return var36_upvw
end
if 2 <= game.ReplicatedStorage.Transactions.Level:InvokeServer() then
	Pass_upvr.Visible = true
	Pass_upvr.Field.FocusLost:connect(function(arg1) -- Line 88
		--[[ Upvalues[5]:
			[1]: Pass_upvr (readonly)
			[2]: tbl_3_upvr (readonly)
			[3]: var36_upvw (read and write)
			[4]: CurrentSaveSlot_upvr (readonly)
			[5]: seed_upvr (readonly)
		]]
		Pass_upvr:Destroy()
		if not arg1 then
		else
			if Pass_upvr.Field.Text == "zebraman" then
				for _, v_4 in pairs(tbl_3_upvr) do
					v_4.Visible = true
				end
				var36_upvw = true
				CurrentSaveSlot_upvr.Set:Invoke(0, seed_upvr)
				CurrentSaveSlot_upvr.Set:Invoke(-1, seed_upvr)
				return
			end
			for _, v_5 in pairs(tbl_3_upvr) do
				v_5:Destroy()
			end
		end
	end)
else
	for _, v_2 in pairs(tbl_3_upvr) do
		v_2:Destroy()
	end
end
local var51_upvw
function thereIsASave() -- Line 119
	--[[ Upvalues[3]:
		[1]: GetMetaData_upvr (readonly)
		[2]: var27_upvw (read and write)
		[3]: SendUserNotice_upvr (readonly)
	]]
	local any_InvokeServer_result1, any_InvokeServer_result2_7 = GetMetaData_upvr:InvokeServer(var27_upvw)
	if any_InvokeServer_result2_7 then
		SendUserNotice_upvr:Fire(any_InvokeServer_result2_7)
		return true
	end
	if not any_InvokeServer_result1 then
		return false
	end
	for _, v_3 in pairs(any_InvokeServer_result1) do
		if 0 < v_3.NumSaves then
			return true
		end
	end
end
local tbl_2_upvw = {}
local var60_upvw
local any_InvokeServer_result1_10_upvr = game.ReplicatedStorage.LoadSaveRequests.GetTickCut:InvokeServer()
local MetaData_upvr = SlotList_upvr.Main.SlotHistory.MetaData
function openList() -- Line 143
	--[[ Upvalues[22]:
		[1]: SlotInfo_upvr (readonly)
		[2]: SlotList_upvr (readonly)
		[3]: Progress_upvr (readonly)
		[4]: OverwriteConfirm_upvr (readonly)
		[5]: DeleteConfirm_upvr (readonly)
		[6]: IsOpen_upvr (readonly)
		[7]: var22_upvw (read and write)
		[8]: GetMetaData_upvr (readonly)
		[9]: var27_upvw (read and write)
		[10]: SendUserNotice_upvr (readonly)
		[11]: ClientNoticeIsOpen_upvr (readonly)
		[12]: SlotItem_upvr (readonly)
		[13]: tbl_2_upvw (read and write)
		[14]: module_upvr (readonly)
		[15]: CurrentSaveSlot_upvr (readonly)
		[16]: var51_upvw (read and write)
		[17]: any_InvokeServer_result1_10_upvr (readonly)
		[18]: ClientMayLoad_upvr (readonly)
		[19]: MetaData_upvr (readonly)
		[20]: var60_upvw (read and write)
		[21]: LoadVersion_upvr (readonly)
		[22]: module_upvr_3 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	SlotInfo_upvr.Visible = false
	SlotList_upvr.Visible = false
	Progress_upvr.Visible = false
	OverwriteConfirm_upvr.Visible = false
	DeleteConfirm_upvr.Visible = false
	IsOpen_upvr.Value = true
	var22_upvw = "List"
	local any_InvokeServer_result1_4, any_InvokeServer_result2 = GetMetaData_upvr:InvokeServer(var27_upvw)
	local var145
	if not any_InvokeServer_result1_4 or any_InvokeServer_result2 then
		var145 = SendUserNotice_upvr:Fire
		var145(any_InvokeServer_result2)
		var145 = exitAll
		var145()
	else
		var145 = ClientNoticeIsOpen_upvr
		var145.Value = true
		var145 = SlotItem_upvr.Position.Y.Offset
		for _, v_6 in pairs(tbl_2_upvw) do
			v_6:Destroy()
		end
		tbl_2_upvw = {}
		for i_7_upvr, v_7_upvr in pairs(any_InvokeServer_result1_4) do
			local clone = SlotItem_upvr:clone()
			clone.Visible = true
			clone.SlotName.Text = module_upvr:TranslateByKey("SlotNumber", {i_7_upvr})
			local var154
			local function INLINED_3() -- Internal function, doesn't exist in bytecode
				var154 = var51_upvw
				return var154
			end
			if CurrentSaveSlot_upvr.Value ~= i_7_upvr or not INLINED_3() then
				var154 = v_7_upvr.NumSaves
			end
			if var154 <= 0 or not v_7_upvr.SaveMeta[var154] then
				clone.SizeV.Text = ""
				clone.Time.Text = "no save"
			else
				clone.SizeV.Text = v_7_upvr.SaveMeta[var154].NumKeys
				clone.Time.Text = tostring(getDate(v_7_upvr.SaveMeta[var154].Timestamp + any_InvokeServer_result1_10_upvr))
			end
			clone.Position = UDim2.new(0, 0, 0, var145)
			var145 = var145 + clone.Size.Y.Offset + 12
			clone.MouseButton1Click:connect(function() -- Line 196
				--[[ Upvalues[8]:
					[1]: ClientMayLoad_upvr (copied, readonly)
					[2]: var27_upvw (copied, read and write)
					[3]: SendUserNotice_upvr (copied, readonly)
					[4]: module_upvr (copied, readonly)
					[5]: MetaData_upvr (copied, readonly)
					[6]: v_7_upvr (readonly)
					[7]: var60_upvw (copied, read and write)
					[8]: i_7_upvr (readonly)
				]]
				local any_InvokeServer_result1_5, any_InvokeServer_result2_9 = ClientMayLoad_upvr:InvokeServer(var27_upvw)
				if not any_InvokeServer_result1_5 then
					exitAll()
					SendUserNotice_upvr:Fire(module_upvr:TranslateByKey("LoadError", any_InvokeServer_result2_9) or any_InvokeServer_result2_9)
				else
					MetaData_upvr:Fire(v_7_upvr)
					var60_upvw = i_7_upvr
					slotSelected()
				end
			end)
			clone.Parent = SlotList_upvr.Main
			table.insert(tbl_2_upvw, clone)
			if CurrentSaveSlot_upvr.Value == i_7_upvr then
				clone.IsCurrentSlot.Visible = true
				clone.BackgroundColor3 = Color3.new(0.3137254901960784, 0.8235294117647058, 0.39215686274509803)
				if LoadVersion_upvr then
					local var158
					if LoadVersion_upvr.Parent then
						if v_7_upvr.SaveMeta[200] == nil then
							var158 = false
						else
							var158 = true
						end
						LoadVersion_upvr.VersionsWrap.Text = "Versions wrap: "..tostring(var158)
						var158 = v_7_upvr.NumSaves
						LoadVersion_upvr.CurrentVersion.Text = "Current version: "..tostring(var158)
					end
				end
			end
		end
		SlotList_upvr.Main.Size = UDim2.new(0, SlotList_upvr.Main.Size.X.Offset, 0, var145 + SlotList_upvr.Main.Info.Size.Y.Offset)
		SlotList_upvr.Main.Position = UDim2.new(0.5, SlotList_upvr.Main.Position.X.Offset, 0.5, -SlotList_upvr.Main.Size.Y.Offset / 2 - 30)
		SlotList_upvr.Quit.Position = UDim2.new(0.5, SlotList_upvr.Quit.Position.X.Offset, 0.5, SlotList_upvr.Main.Position.Y.Offset + SlotList_upvr.Main.Size.Y.Offset + 10)
		setPlatformControls()
		SlotList_upvr.Visible = true
		module_upvr_3(nil or clone)
	end
end
local module_upvr_2 = require(game.ReplicatedStorage:WaitForChild("Util"):WaitForChild("DateTableModule"))
function getDate(arg1) -- Line 239
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	local var160 = (arg1) - (os.time() - tick())
	local floored_2 = math.floor(tick() - var160)
	if floored_2 < 60 then
		return module_upvr:TranslateByKey("ElapsedTimeSeconds", {math.floor(floored_2)})
	end
	if floored_2 < 3600 then
		local floored_4 = math.floor(floored_2 / 60)
		if floored_4 == 1 then
			return module_upvr:TranslateByKey("ElapsedTime1Minute")
		end
		return module_upvr:TranslateByKey("ElapsedTimeMinutes", {floored_4})
	end
	if floored_2 < 86400 then
		local floored_3 = math.floor(floored_2 / 60 / 60)
		if floored_3 == 1 then
			return module_upvr:TranslateByKey("ElapsedTime1Hour")
		end
		return module_upvr:TranslateByKey("ElapsedTimeHours", {floored_3})
	end
	if floored_2 < 259200 then
		local floored = math.floor(floored_2 / 60 / 60 / 24)
		if floored == 1 then
			return module_upvr:TranslateByKey("ElapsedTime1Day")
		end
		return module_upvr:TranslateByKey("ElapsedTimeDays", {floored})
	end
	return module_upvr:TranslateByKey("ShortDate", {var160})
end
function exitAll() -- Line 274
	--[[ Upvalues[7]:
		[1]: ClientNoticeIsOpen_upvr (readonly)
		[2]: SlotInfo_upvr (readonly)
		[3]: SlotList_upvr (readonly)
		[4]: Progress_upvr (readonly)
		[5]: var22_upvw (read and write)
		[6]: module_upvr_3 (readonly)
		[7]: IsOpen_upvr (readonly)
	]]
	ClientNoticeIsOpen_upvr.Value = false
	SlotInfo_upvr.Visible = false
	SlotList_upvr.Visible = false
	Progress_upvr.Visible = false
	var22_upvw = "Closed"
	module_upvr_3(nil)
	IsOpen_upvr.Value = false
end
function back() -- Line 287
	--[[ Upvalues[8]:
		[1]: var22_upvw (read and write)
		[2]: module_upvr_4 (readonly)
		[3]: SlotList_upvr (readonly)
		[4]: SlotInfo_upvr (readonly)
		[5]: OverwriteConfirm_upvr (readonly)
		[6]: CurrentSaveSlot_upvr (readonly)
		[7]: module_upvr_3 (readonly)
		[8]: DeleteConfirm_upvr (readonly)
	]]
	if var22_upvw == "List" then
		if not module_upvr_4.Bump(SlotList_upvr.Quit) then
		else
			exitAll()
		end
	end
	if var22_upvw == "SaveSlot" then
		if not module_upvr_4.Bump(SlotInfo_upvr.Quit) then
		else
			SlotInfo_upvr.Visible = false
			openList()
		end
	end
	if var22_upvw == "SaveConfirm" then
		if not module_upvr_4.Bump(OverwriteConfirm_upvr.Main.Quit) then
		else
			var22_upvw = "SaveSlot"
			if CurrentSaveSlot_upvr.Value == -1 then
				SlotInfo_upvr.Main.Load.Visible = true
			end
			SlotInfo_upvr.Visible = true
			OverwriteConfirm_upvr.Visible = false
			module_upvr_3(SlotInfo_upvr.Main.Load)
		end
	end
	if var22_upvw == "DeleteConfirm" then
		if not module_upvr_4.Bump(DeleteConfirm_upvr.Main.Quit) then return end
		var22_upvw = "SaveSlot"
		SlotInfo_upvr.Visible = true
		DeleteConfirm_upvr.Visible = false
		module_upvr_3(SlotInfo_upvr.Main.Load)
	end
end
function slotSelected() -- Line 330
	--[[ Upvalues[8]:
		[1]: module_upvr_4 (readonly)
		[2]: tbl_2_upvw (read and write)
		[3]: var60_upvw (read and write)
		[4]: var22_upvw (read and write)
		[5]: SlotInfo_upvr (readonly)
		[6]: CurrentSaveSlot_upvr (readonly)
		[7]: SlotList_upvr (readonly)
		[8]: module_upvr_3 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	if not module_upvr_4.Bump(tbl_2_upvw[var60_upvw]) then return end
	var22_upvw = "SaveSlot"
	SlotInfo_upvr.Main.SlotName.Text = tbl_2_upvw[var60_upvw].SlotName.Text
	SlotInfo_upvr.Main.SizeV.Text = tbl_2_upvw[var60_upvw].SizeV.Text
	SlotInfo_upvr.Main.Time.Text = tbl_2_upvw[var60_upvw].Time.Text
	if CurrentSaveSlot_upvr.Value == -1 then
		if SlotInfo_upvr.Main.Time.Text == "no save" then
			SlotInfo_upvr.Main.Save.Visible = true
			SlotInfo_upvr.Main.Save.TextLabel.Text = "Save to this slot"
			SlotInfo_upvr.Main.Save.Size = UDim2.new(1, 0, 0, SlotInfo_upvr.Main.Save.Size.Y.Offset)
			SlotInfo_upvr.Main.Save.Position = UDim2.new(0, 0, 1, SlotInfo_upvr.Main.Save.Position.Y.Offset)
			SlotInfo_upvr.Main.Load.Visible = false
		else
			SlotInfo_upvr.Main.Save.Visible = true
			SlotInfo_upvr.Main.Save.TextLabel.Text = "Overwrite slot"
			SlotInfo_upvr.Main.Save.Size = UDim2.new(0.5, 0, 0, SlotInfo_upvr.Main.Save.Size.Y.Offset)
			SlotInfo_upvr.Main.Save.Position = UDim2.new(0.5, 0, 1, SlotInfo_upvr.Main.Save.Position.Y.Offset)
			SlotInfo_upvr.Main.Load.Visible = true
			SlotInfo_upvr.Main.Load.TextLabel.Text = "Load slot"
			SlotInfo_upvr.Main.Load.Size = UDim2.new(0.5, 0, 0, SlotInfo_upvr.Main.Load.Size.Y.Offset)
		end
		-- KONSTANTWARNING: GOTO [358] #228
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [251] 161. Error Block 22 start (CF ANALYSIS FAILED)
	if CurrentSaveSlot_upvr.Value == var60_upvw then
		SlotInfo_upvr.Main.Save.Visible = false
		SlotInfo_upvr.Main.Load.Visible = true
		SlotInfo_upvr.Main.Load.TextLabel.Text = "Reload slot"
		SlotInfo_upvr.Main.Load.Size = UDim2.new(1, 0, 0, SlotInfo_upvr.Main.Save.Size.Y.Offset)
		-- KONSTANTWARNING: GOTO [358] #228
	end
	-- KONSTANTERROR: [251] 161. Error Block 22 end (CF ANALYSIS FAILED)
end
local RequestSave_upvr = game.ReplicatedStorage.LoadSaveRequests.RequestSave
function saveSlot() -- Line 388
	--[[ Upvalues[13]:
		[1]: var22_upvw (read and write)
		[2]: module_upvr_4 (readonly)
		[3]: SlotInfo_upvr (readonly)
		[4]: OverwriteConfirm_upvr (readonly)
		[5]: module_upvr_3 (readonly)
		[6]: Progress_upvr (readonly)
		[7]: var60_upvw (read and write)
		[8]: RequestSave_upvr (readonly)
		[9]: var27_upvw (read and write)
		[10]: SendUserNotice_upvr (readonly)
		[11]: CurrentSaveSlot_upvr (readonly)
		[12]: seed_upvr (readonly)
		[13]: module_upvr (readonly)
	]]
	if var22_upvw ~= "SaveSlot" and var22_upvw ~= "SaveConfirm" then
	else
		if not module_upvr_4.Bump(SlotInfo_upvr.Main.Save) then return end
		if var22_upvw == "SaveSlot" then
			var22_upvw = "SaveConfirm"
			SlotInfo_upvr.Visible = false
			OverwriteConfirm_upvr.Visible = true
			module_upvr_3(OverwriteConfirm_upvr.Main.Quit)
			return
		end
		if var22_upvw == "SaveConfirm" then
			var22_upvw = "Progress"
			OverwriteConfirm_upvr.Visible = false
			Progress_upvr.Visible = true
			local var171 = var60_upvw
			local any_InvokeServer_result1_3, any_InvokeServer_result2_6 = RequestSave_upvr:InvokeServer(var171, var27_upvw)
			exitAll()
			if any_InvokeServer_result1_3 then
				SendUserNotice_upvr:Fire("Save success", 1.5)
				CurrentSaveSlot_upvr.Set:Invoke(var171, seed_upvr)
				return
			end
			SendUserNotice_upvr:Fire(module_upvr:TranslateByKey("SaveError", any_InvokeServer_result2_6) or any_InvokeServer_result2_6)
		end
	end
end
function deleteSlot() -- Line 427
	--[[ Upvalues[7]:
		[1]: var22_upvw (read and write)
		[2]: module_upvr_4 (readonly)
		[3]: DeleteConfirm_upvr (readonly)
		[4]: SlotInfo_upvr (readonly)
		[5]: module_upvr_3 (readonly)
		[6]: Progress_upvr (readonly)
		[7]: SendUserNotice_upvr (readonly)
	]]
	if var22_upvw ~= "SaveSlot" and var22_upvw ~= "DeleteConfirm" then
	else
		if not module_upvr_4.Bump(DeleteConfirm_upvr.Main.Confirm) then return end
		if var22_upvw == "SaveSlot" then
			var22_upvw = "DeleteConfirm"
			SlotInfo_upvr.Visible = false
			DeleteConfirm_upvr.Visible = true
			module_upvr_3(DeleteConfirm_upvr.Main.Quit)
			return
		end
		if var22_upvw == "DeleteConfirm" then
			var22_upvw = "Progress"
			DeleteConfirm_upvr.Visible = false
			Progress_upvr.Visible = true
			exitAll()
			SendUserNotice_upvr:Fire("Delete Error: ".."Not yet implemented")
		end
	end
end
local RequestLoad_upvr = game.ReplicatedStorage.LoadSaveRequests.RequestLoad
function loadSlot() -- Line 463
	--[[ Upvalues[12]:
		[1]: var22_upvw (read and write)
		[2]: SlotInfo_upvr (readonly)
		[3]: Progress_upvr (readonly)
		[4]: ClientMayLoad_upvr (readonly)
		[5]: var27_upvw (read and write)
		[6]: SendUserNotice_upvr (readonly)
		[7]: module_upvr (readonly)
		[8]: var60_upvw (read and write)
		[9]: RequestLoad_upvr (readonly)
		[10]: var51_upvw (read and write)
		[11]: CurrentSaveSlot_upvr (readonly)
		[12]: seed_upvr (readonly)
	]]
	if var22_upvw ~= "SaveSlot" then
	else
		var22_upvw = "Progress"
		SlotInfo_upvr.Visible = false
		Progress_upvr.Visible = true
		local any_InvokeServer_result1_7, any_InvokeServer_result2_5 = ClientMayLoad_upvr:InvokeServer(var27_upvw)
		if not any_InvokeServer_result1_7 then
			exitAll()
			SendUserNotice_upvr:Fire(module_upvr:TranslateByKey("MayLoadError", any_InvokeServer_result2_5) or any_InvokeServer_result2_5)
			return
		end
		local var177 = var60_upvw
		local any_InvokeServer_result1_6, any_InvokeServer_result2_4, _ = RequestLoad_upvr:InvokeServer(var177, var27_upvw, var51_upvw)
		exitAll()
		if any_InvokeServer_result1_6 then
			SendUserNotice_upvr:Fire("Load success", 0.8)
			CurrentSaveSlot_upvr.Set:Invoke(var177, seed_upvr)
			return
		end
		if any_InvokeServer_result2_4 ~= "No property found" then
			SendUserNotice_upvr:Fire(module_upvr:TranslateByKey("LoadError", any_InvokeServer_result2_4) or any_InvokeServer_result2_4)
		end
		CurrentSaveSlot_upvr.Set:Invoke(-1, seed_upvr)
	end
end
function toggleWindow() -- Line 502
	--[[ Upvalues[3]:
		[1]: module_upvr_4 (readonly)
		[2]: SaveLoad_upvr (readonly)
		[3]: Menu_upvr (readonly)
	]]
	if not module_upvr_4.Bump(SaveLoad_upvr) then
	else
		Menu_upvr.Visible = false
		openList()
	end
end
if LoadOtherId_upvr.Parent then
	function testPlayerChanged() -- Line 529
		--[[ Upvalues[7]:
			[1]: LoadOtherId_upvr (readonly)
			[2]: var36_upvw (read and write)
			[3]: var27_upvw (read and write)
			[4]: LocalPlayer_upvr (readonly)
			[5]: var35_upvw (read and write)
			[6]: CurrentSaveSlot_upvr (readonly)
			[7]: seed_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
		local var183
		if not LoadOtherId_upvr.Visible or not var36_upvw then
		else
			local var182_upvw
			function var183() -- Line 535
				--[[ Upvalues[2]:
					[1]: var182_upvw (read and write)
					[2]: LoadOtherId_upvr (copied, readonly)
				]]
				var182_upvw = game.Players:GetUserIdFromNameAsync(LoadOtherId_upvr.IdField.Text)
			end
			pcall(var183)
			if not var182_upvw then
				var183 = LoadOtherId_upvr
				var183 = "Current Player"
				var183.IdField.Text = var183
				var183 = LoadOtherId_upvr
				var183 = ""
				var183.PlayerName.Text = var183
				var27_upvw = LocalPlayer_upvr
				-- KONSTANTWARNING: GOTO [65] #49
			end
			-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [30] 25. Error Block 20 start (CF ANALYSIS FAILED)
			local tbl = {
				userId = var182_upvw;
			}
			var183 = game.Players:GetNameFromUserIdAsync(var182_upvw)
			tbl.Name = var183
			var183 = var35_upvw
			tbl.Parent = var183
			var27_upvw = tbl
			var183 = LoadOtherId_upvr
			var183 = var27_upvw.Name
			var183.PlayerName.Text = var183
			var183 = LoadOtherId_upvr
			if var35_upvw then
				var183 = 'X'
			else
				var183 = ""
			end
			var183.EnableSave.Text = var183
			var183 = script
			var183.IdChanged:Fire(var27_upvw.userId)
			var183 = CurrentSaveSlot_upvr
			var183.Set:Invoke(-1, seed_upvr)
			openList()
			-- KONSTANTERROR: [30] 25. Error Block 20 end (CF ANALYSIS FAILED)
		end
	end
	LoadOtherId_upvr.IdField.FocusLost:connect(function(arg1) -- Line 557
		--[[ Upvalues[3]:
			[1]: var35_upvw (read and write)
			[2]: var51_upvw (read and write)
			[3]: LoadVersion_upvr (readonly)
		]]
		if not arg1 then
		else
			var35_upvw = false
			var51_upvw = nil
			LoadVersion_upvr.VersionField.Text = "Current Version"
			testPlayerChanged()
		end
	end)
	script.SetP.Event:connect(function(arg1, arg2) -- Line 566
		--[[ Upvalues[2]:
			[1]: LoadOtherId_upvr (readonly)
			[2]: var35_upvw (read and write)
		]]
		LoadOtherId_upvr.IdField.Text = arg1
		var35_upvw = false
		testPlayerChanged()
	end)
	LoadOtherId_upvr.EnableSave.MouseButton1Click:connect(function() -- Line 572
		--[[ Upvalues[2]:
			[1]: var36_upvw (read and write)
			[2]: var35_upvw (read and write)
		]]
		if not var36_upvw then
		else
			var35_upvw = not var35_upvw
			testPlayerChanged()
		end
	end)
	function versionChanged() -- Line 583
		--[[ Upvalues[3]:
			[1]: LoadVersion_upvr (readonly)
			[2]: var36_upvw (read and write)
			[3]: var51_upvw (read and write)
		]]
		if not LoadVersion_upvr.Visible or not var36_upvw then
		else
			local tonumber_result1 = tonumber(LoadVersion_upvr.VersionField.Text)
			if not tonumber_result1 then
				var51_upvw = nil
				LoadVersion_upvr.VersionField.Text = "Current Version"
			else
				var51_upvw = tonumber_result1
				LoadVersion_upvr.VersionField.Text = var51_upvw
			end
			openList()
		end
	end
	LoadVersion_upvr.VersionField.FocusLost:connect(function(arg1) -- Line 602
		if not arg1 then
		else
			versionChanged()
		end
	end)
end
script.GetId.OnInvoke = function() -- Line 611, Named "OnInvoke"
	--[[ Upvalues[1]:
		[1]: var27_upvw (read and write)
	]]
	return var27_upvw.userId
end
function setPlatformControls() -- Line 618
	--[[ Upvalues[3]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: SlotInfo_upvr (readonly)
		[3]: SlotList_upvr (readonly)
	]]
	require(LocalPlayer_upvr.PlayerGui.Scripts.SetPlatformControls)({SlotInfo_upvr.Quit, SlotList_upvr.Quit})
end
LocalPlayer_upvr.PlayerGui:WaitForChild("OnboardingGUI"):WaitForChild("DoOnboarding")
if thereIsASave() then
	LocalPlayer_upvr.PlayerGui.OnboardingGUI.DoOnboarding.Value = false
else
	CurrentSaveSlot_upvr.Set:Invoke(1, seed_upvr)
end
LocalPlayer_upvr.PlayerGui.OnboardingGUI.DoOnboarding:WaitForChild("Loaded").Value = true
task.wait(1)
input = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput")) -- Setting global
input.InteractAbort(back)
SlotList_upvr.Quit.MouseButton1Click:connect(function() -- Line 643
	back()
end)
SlotInfo_upvr.Quit.MouseButton1Click:connect(function() -- Line 646
	back()
end)
OverwriteConfirm_upvr.Main.Quit.MouseButton1Click:connect(function() -- Line 649
	back()
end)
DeleteConfirm_upvr.Main.Quit.MouseButton1Click:connect(function() -- Line 652
	back()
end)
SlotInfo_upvr.Main.Save.MouseButton1Click:connect(function() -- Line 656
	saveSlot()
end)
SlotInfo_upvr.Main.Load.MouseButton1Click:connect(function() -- Line 659
	loadSlot()
end)
SlotInfo_upvr.Main.DeleteSlot.MouseButton1Click:connect(function() -- Line 662
	deleteSlot()
end)
OverwriteConfirm_upvr.Main.Confirm.MouseButton1Click:connect(function() -- Line 666
	saveSlot()
end)
DeleteConfirm_upvr.Main.Confirm.MouseButton1Click:connect(function() -- Line 669
	deleteSlot()
end)
SaveLoad_upvr.MouseButton1Click:connect(function() -- Line 673
	toggleWindow()
end)
script.Parent.Open.Event:connect(function() -- Line 676
	toggleWindow()
end)
local WipeSaves_upvr = SlotList_upvr:WaitForChild("Main"):WaitForChild("ModeratePlayer"):WaitForChild("WipeSaves")
local WipeMetaData_upvr = game.ReplicatedStorage.LoadSaveRequests.WipeMetaData
pcall(function() -- Line 680
	--[[ Upvalues[3]:
		[1]: WipeSaves_upvr (readonly)
		[2]: WipeMetaData_upvr (readonly)
		[3]: var27_upvw (read and write)
	]]
	WipeSaves_upvr.MouseButton1Click:connect(function() -- Line 681
		--[[ Upvalues[2]:
			[1]: WipeMetaData_upvr (copied, readonly)
			[2]: var27_upvw (copied, read and write)
		]]
		exitAll()
		WipeMetaData_upvr:InvokeServer(var27_upvw)
		openList()
	end)
end)
LocalScript_upvr.Changed:connect(function() -- Line 692
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	task.wait()
	game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", LocalPlayer_upvr.Name.." changed currentsaveslot security check")
	print("K4"..debug.traceback())
	LocalPlayer_upvr:Kick()
end)
LocalScript_upvr.AncestryChanged:connect(function() -- Line 701
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: LocalScript_upvr (readonly)
	]]
	if LocalPlayer_upvr.Parent and not LocalScript_upvr.Parent == script then
		game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", LocalPlayer_upvr.Name.." destroyed currentsaveslot security check")
		print("K5"..debug.traceback())
		LocalPlayer_upvr:Kick()
	end
end)
if LocalScript_upvr.Parent ~= script then
	game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", LocalPlayer_upvr.Name.." quickly destroyed currentsaveslot security check")
	print("K6"..debug.traceback())
	LocalPlayer_upvr:Kick()
end
function set() -- Line 716
	script.Parent.Set.Text = "Set: "..game.ReplicatedStorage.DataSet.Value
	script.Parent.Get.Text = "Get: "..game.ReplicatedStorage.DataGet.Value
end
game.ReplicatedStorage.DataSet.Changed:connect(set)
game.ReplicatedStorage.DataGet.Changed:connect(set)