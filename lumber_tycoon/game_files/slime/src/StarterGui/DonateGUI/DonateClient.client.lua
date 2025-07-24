-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:48
-- Luau version 6, Types version 3
-- Time taken: 0.004828 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local module_upvr_2 = require(LocalPlayer_upvr:WaitForChild("PlayerGui"):WaitForChild("Scripts"):WaitForChild("SetSelectedButton"))
local Menu_upvr = script.Parent.Parent:WaitForChild("MenuGUI"):WaitForChild("Menu")
local Donate_upvr = Menu_upvr:WaitForChild("Main"):WaitForChild("MenuItems"):WaitForChild("Donate")
local Donate_upvr_2 = script.Parent.Donate
local module_upvr = require(script.Parent.Parent:WaitForChild("BumpButton"))
local IsOpen_upvr = script.Parent.IsOpen
local var8_upvw
local tbl_upvw = {}
local PlayerItem_upvr = script.PlayerItem
function populateList() -- Line 25
	--[[ Upvalues[7]:
		[1]: Donate_upvr_2 (readonly)
		[2]: tbl_upvw (read and write)
		[3]: var8_upvw (read and write)
		[4]: LocalPlayer_upvr (readonly)
		[5]: PlayerItem_upvr (readonly)
		[6]: module_upvr (readonly)
		[7]: module_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 33 start (CF ANALYSIS FAILED)
	local PlayerList = Donate_upvr_2.Main.PlayerList
	local pairs_result1_2, pairs_result2_2, _ = pairs(tbl_upvw)
	local var31
	for _, v in pairs_result1_2, pairs_result2_2, var31 do
		v:Destroy()
	end
	tbl_upvw = {}
	var8_upvw = nil
	var31 = game.Players:GetPlayers()
	local pairs_result1_3, pairs_result2, pairs_result3 = pairs(var31)
	for _, v_2_upvr in pairs_result1_3, pairs_result2, pairs_result3 do
		if v_2_upvr ~= LocalPlayer_upvr then
			local clone_upvr = PlayerItem_upvr:clone()
			clone_upvr.TextLabel.Text = v_2_upvr.DisplayName
			clone_upvr.Parent = PlayerList.List
			clone_upvr.MouseButton1Click:connect(function() -- Line 45
				--[[ Upvalues[6]:
					[1]: module_upvr (copied, readonly)
					[2]: clone_upvr (readonly)
					[3]: var8_upvw (copied, read and write)
					[4]: v_2_upvr (readonly)
					[5]: tbl_upvw (copied, read and write)
					[6]: PlayerItem_upvr (copied, readonly)
				]]
				if not module_upvr.Bump(clone_upvr) then
				else
					var8_upvw = v_2_upvr
					for _, v_3 in pairs(tbl_upvw) do
						v_3.BorderSizePixel = 0
						v_3.BackgroundColor3 = PlayerItem_upvr.BackgroundColor3
					end
					clone_upvr.BorderSizePixel = 2
					clone_upvr.BackgroundColor3 = Color3.new(0.39215686274509803, 1, 0.39215686274509803)
				end
			end)
			if (nil or clone_upvr) == clone_upvr then
				clone_upvr.BackgroundColor3 = Color3.new(0.39215686274509803, 1, 0.39215686274509803)
				clone_upvr.BorderSizePixel = 2
				var8_upvw = v_2_upvr
			end
			table.insert(tbl_upvw, clone_upvr)
		end
	end
	pairs_result2 = 0
	clone_upvr = PlayerList.List.UIGridLayout.AbsoluteContentSize.Y
	PlayerList.CanvasSize = UDim2.new(pairs_result2, 0, 0, clone_upvr + 10)
	pairs_result2 = PlayerList.List
	pairs_result2 = UDim2.new
	clone_upvr = PlayerList.CanvasSize.Y
	clone_upvr = PlayerList.AbsoluteSize.Y
	if clone_upvr < clone_upvr.Offset then
		-- KONSTANTWARNING: GOTO [124] #84
	end
	-- KONSTANTERROR: [0] 1. Error Block 33 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [123] 83. Error Block 36 start (CF ANALYSIS FAILED)
	clone_upvr = PlayerList.List.UIGridLayout.CellSize.Y.Offset
	pairs_result2 = pairs_result2(1, 0, 0, clone_upvr)
	pairs_result2.UIGridLayout.CellSize = pairs_result2
	if #tbl_upvw ~= 0 then
		pairs_result2 = false
	else
		pairs_result2 = true
	end
	PlayerList.IsEmpty.Visible = pairs_result2
	pairs_result2 = nil or clone_upvr
	if not pairs_result2 then
		pairs_result2 = Donate_upvr_2.Quit
	end
	module_upvr_2(pairs_result2)
	-- KONSTANTERROR: [123] 83. Error Block 36 end (CF ANALYSIS FAILED)
end
local var42_upvw = 50
function adjustDonationAmount(arg1) -- Line 83
	--[[ Upvalues[2]:
		[1]: var42_upvw (read and write)
		[2]: Donate_upvr_2 (readonly)
	]]
	var42_upvw = math.max(0, var42_upvw + arg1)
	Donate_upvr_2.Main.AmountLabel.Text = var42_upvw
end
Donate_upvr_2.Main.AmountLabel.Text = var42_upvw
function donationAmountChanged() -- Line 89
	--[[ Upvalues[2]:
		[1]: var42_upvw (read and write)
		[2]: Donate_upvr_2 (readonly)
	]]
	local tonumber_result1 = tonumber(Donate_upvr_2.Main.AmountLabel.Text)
	if not tonumber_result1 then
		if Donate_upvr_2.Main.AmountLabel.Text == "" then
			tonumber_result1 = 0
		else
			tonumber_result1 = var42_upvw
		end
	end
	var42_upvw = tonumber_result1
	adjustDonationAmount(0)
end
Donate_upvr_2.Main.AmountLabel.Changed:connect(donationAmountChanged)
function sendDonation() -- Line 95
	--[[ Upvalues[3]:
		[1]: var8_upvw (read and write)
		[2]: var42_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
	]]
	if var8_upvw then
		exitAll()
		local DisplayName = var8_upvw.DisplayName
		game.ReplicatedStorage.Notices.SendUserNotice:Fire("Transfer pending", 1.25)
		local any_InvokeServer_result1, any_InvokeServer_result2 = game.ReplicatedStorage.Transactions.ClientToServer.Donate:InvokeServer(var8_upvw, var42_upvw, LocalPlayer_upvr.CurrentSaveSlot.Value)
		if any_InvokeServer_result1 then
			game.ReplicatedStorage.Notices.SendUserNotice:Fire("Transfer to "..DisplayName.." successful")
			return
		end
		game.ReplicatedStorage.Notices.SendUserNotice:Fire("Transfer to "..DisplayName.." failed; "..tostring(any_InvokeServer_result2))
	end
end
local ClientNoticeIsOpen_upvr = game.ReplicatedStorage.Notices.ClientNoticeIsOpen
function exitAll() -- Line 111
	--[[ Upvalues[4]:
		[1]: ClientNoticeIsOpen_upvr (readonly)
		[2]: Donate_upvr_2 (readonly)
		[3]: module_upvr_2 (readonly)
		[4]: IsOpen_upvr (readonly)
	]]
	ClientNoticeIsOpen_upvr.Value = false
	Donate_upvr_2.Visible = false
	module_upvr_2(nil)
	IsOpen_upvr.Value = false
end
function back() -- Line 118
	--[[ Upvalues[2]:
		[1]: Donate_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	if not Donate_upvr_2.Visible then
	else
		if not module_upvr.Bump(Donate_upvr_2.Quit) then return end
		exitAll()
	end
end
function openWindow() -- Line 129
	--[[ Upvalues[5]:
		[1]: module_upvr (readonly)
		[2]: Donate_upvr (readonly)
		[3]: Menu_upvr (readonly)
		[4]: Donate_upvr_2 (readonly)
		[5]: IsOpen_upvr (readonly)
	]]
	if not module_upvr.Bump(Donate_upvr) then
	else
		setPlatformControls()
		Menu_upvr.Visible = false
		Donate_upvr_2.Visible = true
		populateList()
		IsOpen_upvr.Value = true
	end
end
function setPlatformControls() -- Line 145
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Donate_upvr_2 (readonly)
	]]
	require(LocalPlayer_upvr.PlayerGui.Scripts.SetPlatformControls)({Donate_upvr_2.Quit})
end
task.wait(1)
input = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput")) -- Setting global
input.InteractAbort(back)
Donate_upvr.MouseButton1Click:connect(function() -- Line 163
	openWindow()
end)
Donate_upvr_2.Quit.MouseButton1Click:connect(function() -- Line 166
	back()
end)
Donate_upvr_2.Main.IncreaseAmount.MouseButton1Click:connect(function() -- Line 176
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Donate_upvr_2 (readonly)
	]]
	if not module_upvr.Bump(Donate_upvr_2.Main.IncreaseAmount) then
	else
		adjustDonationAmount(50)
	end
end)
Donate_upvr_2.Main.DecreaseAmount.MouseButton1Click:connect(function() -- Line 183
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Donate_upvr_2 (readonly)
	]]
	if not module_upvr.Bump(Donate_upvr_2.Main.DecreaseAmount) then
	else
		adjustDonationAmount(-50)
	end
end)
Donate_upvr_2.Main.ConfirmDonation.MouseButton1Click:connect(function() -- Line 190
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: Donate_upvr_2 (readonly)
	]]
	if not module_upvr.Bump(Donate_upvr_2.Main.ConfirmDonation) then
	else
		sendDonation()
	end
end)