-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:46
-- Luau version 6, Types version 3
-- Time taken: 0.007377 seconds

local Transactions_upvr = game.ReplicatedStorage.Transactions
local tbl_upvr = {}
local var3_upvw
local var4_upvw
local var5_upvw
local LogKey_upvr = script.Parent.LogKey
local Player_upvr = script.Parent.Player
local LogNum_upvr = script.Parent.LogNum
Transactions_upvr.LogUpdated.OnClientEvent:connect(function(arg1, arg2) -- Line 14
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: var3_upvw (read and write)
	]]
	tbl_upvr[arg1] = arg2
	if var3_upvw == arg1 then
		logChange(var3_upvw)
	end
end)
function logChange(arg1) -- Line 24
	--[[ Upvalues[7]:
		[1]: LogKey_upvr (readonly)
		[2]: Player_upvr (readonly)
		[3]: LogNum_upvr (readonly)
		[4]: var3_upvw (read and write)
		[5]: var4_upvw (read and write)
		[6]: var5_upvw (read and write)
		[7]: tbl_upvr (readonly)
	]]
	LogKey_upvr.Text = arg1
	Player_upvr.Text = ""
	LogNum_upvr.Text = ""
	var3_upvw = arg1
	var4_upvw = nil
	var5_upvw = nil
	populateList(tbl_upvr[var3_upvw], function(arg1_2, arg2) -- Line 34
		return arg1_2, #arg2
	end, function(arg1_3, arg2) -- Line 37
		playerChange(arg1_3)
	end)
	idChange()
end
function playerChange(arg1) -- Line 45
	--[[ Upvalues[6]:
		[1]: Player_upvr (readonly)
		[2]: LogNum_upvr (readonly)
		[3]: var4_upvw (read and write)
		[4]: var5_upvw (read and write)
		[5]: tbl_upvr (readonly)
		[6]: var3_upvw (read and write)
	]]
	Player_upvr.Text = arg1
	LogNum_upvr.Text = ""
	var4_upvw = arg1
	var5_upvw = nil
	populateList(tbl_upvr[var3_upvw][var4_upvw], function(arg1_4, arg2) -- Line 53
		return arg1_4, arg2.Date
	end, function(arg1_5, arg2) -- Line 56
		idChange(arg1_5)
	end)
	idChange()
end
local LogInfo_upvr = script.Parent.LogInfo
function idChange(arg1) -- Line 66
	--[[ Upvalues[6]:
		[1]: LogNum_upvr (readonly)
		[2]: var5_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: var3_upvw (read and write)
		[5]: var4_upvw (read and write)
		[6]: LogInfo_upvr (readonly)
	]]
	LogNum_upvr.Text = arg1 or ""
	var5_upvw = arg1
	local var15 = arg1
	if var15 then
		var15 = tbl_upvr[var3_upvw][var4_upvw][arg1]
	end
	if var15 then
		LogInfo_upvr.Visible = true
		LogInfo_upvr.Player.Text = var4_upvw
		LogInfo_upvr.Date.Text = var15.Date
		LogInfo_upvr.Message.Text = var15.Message
	else
		LogInfo_upvr.Visible = false
	end
end
LogInfo_upvr.Visible = false
LogInfo_upvr.ViewChatLog.MouseButton1Click:connect(function() -- Line 87
	--[[ Upvalues[4]:
		[1]: var3_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: tbl_upvr (readonly)
	]]
	local var19 = var3_upvw
	if var19 then
		var19 = var4_upvw
		if var19 then
			var19 = var5_upvw
			if var19 then
				var19 = tbl_upvr[var3_upvw][var4_upvw][var5_upvw]
			end
		end
	end
	populateAuxList(var19.ChatLog, "Chatlog")
end)
LogInfo_upvr.ViewPlayerList.MouseButton1Click:connect(function() -- Line 92
	--[[ Upvalues[4]:
		[1]: var3_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: tbl_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var29 = var3_upvw
	if var29 then
		var29 = var4_upvw
		if var29 then
			var29 = var5_upvw
			if var29 then
				var29 = tbl_upvr[var3_upvw][var4_upvw][var5_upvw]
			end
		end
	end
	for i, v in pairs(var29.PlayerList) do
		table.insert({}, i.." - $"..v.Money.." - Joined "..v.JoinTime)
		local var34
	end
	populateAuxList(var34, "Playerlist")
end)
LogInfo_upvr.Load.MouseButton1Click:connect(function() -- Line 105
	--[[ Upvalues[4]:
		[1]: var3_upvw (read and write)
		[2]: var4_upvw (read and write)
		[3]: var5_upvw (read and write)
		[4]: tbl_upvr (readonly)
	]]
	if var3_upvw then
		if var4_upvw then
			if var5_upvw then
			end
		end
	end
	script.Parent.Parent.Parent.Parent.LoadSaveClient.SetP:Fire(var4_upvw)
end)
local var37_upvw = false
local BackgroundColor3_upvr = LogInfo_upvr.Archive.BackgroundColor3
LogInfo_upvr.Archive.MouseButton1Click:connect(function() -- Line 113
	--[[ Upvalues[8]:
		[1]: var37_upvw (read and write)
		[2]: LogInfo_upvr (readonly)
		[3]: var3_upvw (read and write)
		[4]: var4_upvw (read and write)
		[5]: var5_upvw (read and write)
		[6]: tbl_upvr (readonly)
		[7]: Transactions_upvr (readonly)
		[8]: BackgroundColor3_upvr (readonly)
	]]
	if var37_upvw then
	else
		var37_upvw = true
		LogInfo_upvr.Archive.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		local var41 = var3_upvw
		if var41 then
			var41 = var4_upvw
			if var41 then
				var41 = var5_upvw
				if var41 then
					var41 = tbl_upvr[var3_upvw][var4_upvw][var5_upvw]
				end
			end
		end
		if var41 then
			Transactions_upvr.ArchiveLog:InvokeServer(var3_upvw, var4_upvw, var5_upvw)
		end
		task.wait(0.2)
		var37_upvw = false
		LogInfo_upvr.Archive.BackgroundColor3 = BackgroundColor3_upvr
	end
end)
local LogList_upvr = script.Parent.LogList
local Item_upvr = LogList_upvr.Item
Item_upvr.Parent = nil
function populateList(arg1, arg2, arg3) -- Line 139
	--[[ Upvalues[2]:
		[1]: LogList_upvr (readonly)
		[2]: Item_upvr (readonly)
	]]
	local _, pairs_result2_2, pairs_result3_6 = pairs(LogList_upvr:GetChildren())
	local var55
	for _, v_2 in var55, pairs_result2_2, pairs_result3_6 do
		v_2:Destroy()
	end
	var55 = 0
	for i_3_upvr, v_3_upvr in pairs(arg1) do
		local clone = Item_upvr:Clone()
		local arg2_result1, arg2_result2 = arg2(i_3_upvr, v_3_upvr)
		clone.Field1.Text = arg2_result1
		clone.Field2.Text = arg2_result2
		clone.Position = UDim2.new(0, 0, 0, var55)
		clone.Parent = LogList_upvr
		var55 = var55 + clone.AbsoluteSize.Y + 2
		clone.MouseButton1Click:connect(function() -- Line 154
			--[[ Upvalues[3]:
				[1]: arg3 (readonly)
				[2]: i_3_upvr (readonly)
				[3]: v_3_upvr (readonly)
			]]
			arg3(i_3_upvr, v_3_upvr)
		end)
	end
	LogList_upvr.CanvasSize = UDim2.new(0, 0, 0, var55 - 2)
end
local AuxList_upvr = script.Parent.AuxList
local Item_upvr_2 = AuxList_upvr.List.Item
Item_upvr_2.Parent = nil
function populateAuxList(arg1, arg2) -- Line 166
	--[[ Upvalues[2]:
		[1]: AuxList_upvr (readonly)
		[2]: Item_upvr_2 (readonly)
	]]
	local var89
	if var89 then
		var89 = AuxList_upvr.Heading.Text
		if var89 == tostring(arg2) then
			var89 = AuxList_upvr
			var89.Visible = false
			return
		end
	end
	var89 = pairs(AuxList_upvr.List:GetChildren())
	local pairs_result1_2, pairs_result2, pairs_result3_5 = pairs(AuxList_upvr.List:GetChildren())
	for _, v_4 in pairs_result1_2, pairs_result2, pairs_result3_5 do
		v_4:Destroy()
	end
	pairs_result1_2 = AuxList_upvr.Heading
	pairs_result1_2.Text = tostring(arg2)
	pairs_result1_2 = 0
	for _, v_5 in pairs(arg1) do
		local clone_3 = Item_upvr_2:Clone()
		clone_3.ItemText.Text = v_5
		clone_3.Position = UDim2.new(0, 0, 0, pairs_result1_2)
		clone_3.Parent = AuxList_upvr.List
		pairs_result1_2 = pairs_result1_2 + clone_3.AbsoluteSize.Y + 2
	end
	AuxList_upvr.List.CanvasSize = UDim2.new(0, 0, 0, pairs_result1_2 - 2)
	AuxList_upvr.Visible = true
end
AuxList_upvr.Close.MouseButton1Click:connect(function() -- Line 191
	--[[ Upvalues[1]:
		[1]: AuxList_upvr (readonly)
	]]
	AuxList_upvr.Visible = false
end)
AuxList_upvr.Visible = false
LogKey_upvr.Focused:connect(function() -- Line 199
	--[[ Upvalues[2]:
		[1]: LogKey_upvr (readonly)
		[2]: tbl_upvr (readonly)
	]]
	LogKey_upvr.Font = Enum.Font.Arial
	LogKey_upvr.Text = ""
	if LogKey_upvr.FocusLost:wait() and tbl_upvr[LogKey_upvr.Text] then
		logChange(LogKey_upvr.Text)
	else
		LogKey_upvr.Text = LogKey_upvr.Text
	end
	LogKey_upvr.Font = Enum.Font.ArialBold
end)
Player_upvr.Focused:connect(function() -- Line 212
	--[[ Upvalues[3]:
		[1]: Player_upvr (readonly)
		[2]: var3_upvw (read and write)
		[3]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 13 start (CF ANALYSIS FAILED)
	Player_upvr.Font = Enum.Font.Arial
	Player_upvr.Text = ""
	if Player_upvr.FocusLost:wait() and var3_upvw then
		if tbl_upvr[var3_upvw][Player_upvr.Text] then
			playerChange(Player_upvr.Text)
			-- KONSTANTWARNING: GOTO [42] #33
		end
	end
	if var3_upvw then
		logChange(var3_upvw)
	end
	-- KONSTANTERROR: [0] 1. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 33. Error Block 8 start (CF ANALYSIS FAILED)
	Player_upvr.Font = Enum.Font.ArialBold
	-- KONSTANTERROR: [42] 33. Error Block 8 end (CF ANALYSIS FAILED)
end)
LogNum_upvr.Focused:connect(function() -- Line 225
	--[[ Upvalues[4]:
		[1]: LogNum_upvr (readonly)
		[2]: var3_upvw (read and write)
		[3]: var4_upvw (read and write)
		[4]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 13 start (CF ANALYSIS FAILED)
	LogNum_upvr.Font = Enum.Font.Arial
	LogNum_upvr.Text = ""
	if LogNum_upvr.FocusLost:wait() and var3_upvw then
		if var4_upvw then
			if tbl_upvr[var3_upvw][var4_upvw][tonumber(LogNum_upvr.Text)] then
				idChange(tonumber(LogNum_upvr.Text))
				-- KONSTANTWARNING: GOTO [52] #41
			end
		end
	end
	playerChange(var4_upvw)
	-- KONSTANTERROR: [0] 1. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [52] 41. Error Block 8 start (CF ANALYSIS FAILED)
	LogNum_upvr.Font = Enum.Font.ArialBold
	-- KONSTANTERROR: [52] 41. Error Block 8 end (CF ANALYSIS FAILED)
end)