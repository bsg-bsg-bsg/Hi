-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:48
-- Luau version 6, Types version 3
-- Time taken: 0.008470 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = game.Players.LocalPlayer.CharacterAdded:wait()
end
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 5
	--[[ Upvalues[2]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	Character_upvw = LocalPlayer_upvr.Character
end)
task.wait(1)
local module_upvr_3 = require(game.ReplicatedStorage:WaitForChild("LocalizationUtil"))
local NPCBillboard_upvr = script.Parent:WaitForChild("NPCBillboard")
local Chat_upvr = script.Parent:WaitForChild("Chat")
local PromptChat_3_upvr = script.Parent:WaitForChild("PromptChat")
local ChatChoice_upvr = Chat_upvr:WaitForChild("Choices"):WaitForChild("ChatChoice")
ChatChoice_upvr.Visible = false
local tbl_3_upvw = {}
local var18_upvw = 1
local IsChatting_upvr = game.Players.LocalPlayer:WaitForChild("IsChatting")
IsChatting_upvr.Value = 0
local var20_upvw
local var21_upvw
local var22_upvw
local var23_upvw = false
local WalkSpeed_upvr = Character_upvw:WaitForChild("Humanoid").WalkSpeed
function PromptChat(arg1, arg2, arg3) -- Line 40
	--[[ Upvalues[11]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var21_upvw (read and write)
		[3]: NPCBillboard_upvr (readonly)
		[4]: PromptChat_3_upvr (readonly)
		[5]: module_upvr_3 (readonly)
		[6]: var22_upvw (read and write)
		[7]: var18_upvw (read and write)
		[8]: var20_upvw (read and write)
		[9]: Character_upvw (read and write)
		[10]: WalkSpeed_upvr (readonly)
		[11]: var23_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1] 2. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1] 2. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 12. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 12. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 17. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 17. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [82] 55. Error Block 13 start (CF ANALYSIS FAILED)
	chatSelectionMade()
	do
		return
	end
	-- KONSTANTERROR: [82] 55. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [86] 58. Error Block 24 start (CF ANALYSIS FAILED)
	if not arg1 and var22_upvw and var22_upvw.Character == arg2.Character then
		var20_upvw = nil
		var21_upvw = nil
		setPromptVisibility(false)
		setBillboardVisibility(false)
		setChatOptionsVisibility(false)
		var22_upvw = nil
		setChatting(0)
		if not game.Players.LocalPlayer.IsBuyingLand.Value then
			Character_upvw.Humanoid.WalkSpeed = WalkSpeed_upvr
			bindJump()
		end
		var23_upvw = false
	end
	-- KONSTANTERROR: [86] 58. Error Block 24 end (CF ANALYSIS FAILED)
end
game.ReplicatedStorage.NPCDialog.PromptChat.OnClientEvent:connect(PromptChat)
for _, v_upvr in pairs({LocalPlayer_upvr.PlayerGui.MouseoverInteractionEngaged, LocalPlayer_upvr.PlayerGui.IsPlacingStructure, LocalPlayer_upvr.PlayerGui.ClientInfoIsOpen, game.ReplicatedStorage.Notices.ClientNoticeIsOpen}) do
	v_upvr.Changed:connect(function() -- Line 78
		--[[ Upvalues[2]:
			[1]: v_upvr (readonly)
			[2]: var22_upvw (read and write)
		]]
		if v_upvr.Value then
			PromptChat(false, var22_upvw)
		end
	end)
	local var30_upvw
end
LocalPlayer_upvr.PlayerGui.MouseoverInteractionEngaged.Changed:connect(function() -- Line 86
	--[[ Upvalues[2]:
		[1]: var30_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
	]]
	if var30_upvw and LocalPlayer_upvr.PlayerGui.MouseoverInteractionEngaged.Value then
		setPromptVisibility(false)
	elseif var30_upvw and not LocalPlayer_upvr.PlayerGui.MouseoverInteractionEngaged.Value then
		setPromptVisibility(true)
	end
end)
local SetChattingValue_upvr = game.ReplicatedStorage.NPCDialog.SetChattingValue
function setChatting(arg1) -- Line 95
	--[[ Upvalues[1]:
		[1]: SetChattingValue_upvr (readonly)
	]]
	SetChattingValue_upvr:InvokeServer(arg1)
end
setChatting(0)
local var33_upvw
local Offset_upvr = ChatChoice_upvr.Size.Y.Offset
local module_upvr = require(LocalPlayer_upvr:WaitForChild("PlayerGui"):WaitForChild("Scripts"):WaitForChild("SetSelectedButton"))
function advanceChat() -- Line 102
	--[[ Upvalues[15]:
		[1]: var33_upvw (read and write)
		[2]: var20_upvw (read and write)
		[3]: var30_upvw (read and write)
		[4]: Character_upvw (read and write)
		[5]: module_upvr_3 (readonly)
		[6]: NPCBillboard_upvr (readonly)
		[7]: IsChatting_upvr (readonly)
		[8]: var23_upvw (read and write)
		[9]: tbl_3_upvw (read and write)
		[10]: var18_upvw (read and write)
		[11]: ChatChoice_upvr (readonly)
		[12]: Offset_upvr (readonly)
		[13]: Chat_upvr (readonly)
		[14]: var21_upvw (read and write)
		[15]: module_upvr (readonly)
	]]
	var33_upvw = tick()
	local var44 = var33_upvw
	setBillboardVisibility(false)
	setPromptVisibility(false)
	setChatOptionsVisibility(false)
	local var45
	if not var20_upvw then
		var45 = false
		PromptChat(var45, var30_upvw)
	else
		var45 = Character_upvw
		var45 = 0
		var45.Humanoid.WalkSpeed = var45
		unbindjump()
		var45 = 2
		setChatting(var45)
		var45 = 0.1
		task.wait(var45)
		if not var20_upvw then
			if var33_upvw == var44 then
				var45 = false
				PromptChat(var45, var30_upvw)
			end
			return
		end
		var45 = var20_upvw
		local ResponseDialog_upvw = var45.ResponseDialog
		var45 = pcall
		var45(function() -- Line 127
			--[[ Upvalues[3]:
				[1]: ResponseDialog_upvw (read and write)
				[2]: module_upvr_3 (copied, readonly)
				[3]: var20_upvw (copied, read and write)
			]]
			ResponseDialog_upvw = module_upvr_3:Translate(var20_upvw.ResponseDialog)
		end)
		var45 = NPCBillboard_upvr.Text
		var45.Text = ResponseDialog_upvw
		var45 = setBillboardVisibility
		var45(true)
		var45 = task.wait
		var45(0.8)
		var45 = var20_upvw
		if not var45 then
			var45 = var33_upvw
			if var45 == var44 then
				var45 = PromptChat
				var45(false, var30_upvw)
			end
			return
		end
		var45 = IsChatting_upvr.Value
		if var45 == 0 then
			var45 = false
			var23_upvw = var45
			var45 = chatSelectionMade
			var45()
			return
		end
		var45 = {}
		tbl_3_upvw = var45
		var45 = 1
		var18_upvw = var45
		var45 = false
		local pairs_result1_2, pairs_result2, pairs_result3_3 = pairs(var20_upvw:GetChildren())
		for i_3, v_3 in pairs_result1_2, pairs_result2, pairs_result3_3 do
			if v_3:IsA("DialogChoice") then
				local tbl = {
					DialogObject = v_3;
					Button = ChatChoice_upvr:clone();
				}
				tbl.Button.Visible = true
				tbl.Button.Text = v_3.UserDialog
				table.insert(tbl_3_upvw, tbl)
			elseif v_3.Name == "OmmitGoodbyeExit" then
				var45 = true
			end
		end
		pairs_result1_2 = nil
		local var52 = pairs_result1_2
		if 1 <= #tbl_3_upvw then
			if not var45 then
				local tbl_2 = {
					Button = ChatChoice_upvr:clone();
				}
				i_3 = true
				tbl_2.Button.Visible = i_3
				i_3 = "Goodbye!"
				tbl_2.Button.Text = i_3
				i_3 = tbl_3_upvw
				v_3 = tbl_2
				table.insert(i_3, v_3)
			end
			local pairs_result1, pairs_result2_2, pairs_result3_4 = pairs(tbl_3_upvw)
			for i_4_upvr, v_4_upvr in pairs_result1, pairs_result2_2, pairs_result3_4 do
				v_4_upvr.Button.Position = UDim2.new(0, 0, 0, (i_4_upvr - 1) * Offset_upvr)
				v_4_upvr.Button.Parent = Chat_upvr.Choices
				v_4_upvr.Button.MouseButton1Click:connect(function() -- Line 185
					--[[ Upvalues[4]:
						[1]: var18_upvw (copied, read and write)
						[2]: i_4_upvr (readonly)
						[3]: var21_upvw (copied, read and write)
						[4]: v_4_upvr (readonly)
					]]
					var18_upvw = i_4_upvr
					var21_upvw = v_4_upvr.DialogObject
					chatSelectionMade()
				end)
				local var58 = var52
				if not var58 then
					var58 = v_4_upvr.Button
				end
				var52 = var58
			end
			pairs_result3_4 = 0
			Chat_upvr.Size = UDim2.new(pairs_result3_4, Chat_upvr.Size.X.Offset, 0, #tbl_3_upvw * Offset_upvr)
			setChatOptionsVisibility(true)
			module_upvr(var52)
			chatSelectionScroll(0)
		else
			var21_upvw = nil
			var23_upvw = false
			chatSelectionMade()
		end
		var23_upvw = false
	end
end
local PlayerChatted_upvr = game.ReplicatedStorage.NPCDialog.PlayerChatted
local module_upvr_2 = require(script.Parent.Parent:WaitForChild("BumpButton"))
function chatSelectionMade() -- Line 215
	--[[ Upvalues[11]:
		[1]: IsChatting_upvr (readonly)
		[2]: var21_upvw (read and write)
		[3]: var23_upvw (read and write)
		[4]: LocalPlayer_upvr (readonly)
		[5]: var20_upvw (read and write)
		[6]: PlayerChatted_upvr (readonly)
		[7]: var30_upvw (read and write)
		[8]: module_upvr_2 (readonly)
		[9]: PromptChat_3_upvr (readonly)
		[10]: tbl_3_upvw (read and write)
		[11]: var18_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 14. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 14. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 19. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 19. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [81] 65. Error Block 18 start (CF ANALYSIS FAILED)
	var20_upvw = var21_upvw
	advanceChat()
	do
		return
	end
	-- KONSTANTERROR: [81] 65. Error Block 18 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [87] 70. Error Block 36 start (CF ANALYSIS FAILED)
	if 0 < IsChatting_upvr.Value and not var23_upvw then
		if tbl_3_upvw[var18_upvw] and not module_upvr_2.Bump(tbl_3_upvw[var18_upvw].Button) then return end
		var23_upvw = true
		var20_upvw = nil
		var21_upvw = nil
		if var30_upvw then
			PlayerChatted_upvr:InvokeServer(var30_upvw, "EndChat")
		end
		advanceChat()
	end
	-- KONSTANTERROR: [87] 70. Error Block 36 end (CF ANALYSIS FAILED)
end
PromptChat_3_upvr.MouseButton1Click:connect(chatSelectionMade)
function chatSelectionScroll(arg1) -- Line 264
	--[[ Upvalues[4]:
		[1]: IsChatting_upvr (readonly)
		[2]: tbl_3_upvw (read and write)
		[3]: var18_upvw (read and write)
		[4]: var21_upvw (read and write)
	]]
	if IsChatting_upvr.Value == 0 or #tbl_3_upvw < 1 then
	else
		var18_upvw += arg1
		if var18_upvw < 1 then
			var18_upvw = #tbl_3_upvw
		elseif #tbl_3_upvw < var18_upvw then
			var18_upvw = 1
		end
		var21_upvw = tbl_3_upvw[var18_upvw].DialogObject
		for _, v_5 in pairs(tbl_3_upvw) do
			v_5.Button.Text = v_5.Button.Text
		end
	end
end
function setPlatformControls() -- Line 282
	--[[ Upvalues[1]:
		[1]: PromptChat_3_upvr (readonly)
	]]
	if input.Device == "Touch" then
		PromptChat_3_upvr.PlatformButton.Visible = false
	else
		PromptChat_3_upvr.PlatformButton.Visible = true
		if input.Device == "Gamepad" then
			PromptChat_3_upvr.PlatformButton.Image = PromptChat_3_upvr.PlatformButton.Gamepad.Value
			PromptChat_3_upvr.PlatformButton.KeyLabel.Text = ""
			return
		end
		if input.Device == "PC" then
			PromptChat_3_upvr.PlatformButton.Image = PromptChat_3_upvr.PlatformButton.PC.Value
			PromptChat_3_upvr.PlatformButton.KeyLabel.Text = 'E'
		end
	end
end
local SelectedButton_upvr = script.Parent.Parent.Scripts.SetSelectedButton.SelectedButton
SelectedButton_upvr.Changed:connect(function() -- Line 301
	--[[ Upvalues[3]:
		[1]: IsChatting_upvr (readonly)
		[2]: SelectedButton_upvr (readonly)
		[3]: var21_upvw (read and write)
	]]
	if 0 < IsChatting_upvr.Value and (not SelectedButton_upvr.Value or not SelectedButton_upvr.Value:IsDescendantOf(script.Parent)) then
		var21_upvw = nil
		chatSelectionMade()
	end
end)
function setPromptVisibility(arg1) -- Line 313
	--[[ Upvalues[1]:
		[1]: PromptChat_3_upvr (readonly)
	]]
	PromptChat_3_upvr.Visible = arg1
end
function setBillboardVisibility(arg1) -- Line 317
	--[[ Upvalues[1]:
		[1]: NPCBillboard_upvr (readonly)
	]]
	NPCBillboard_upvr.Enabled = arg1
end
function setChatOptionsVisibility(arg1) -- Line 321
	--[[ Upvalues[1]:
		[1]: Chat_upvr (readonly)
	]]
	Chat_upvr.Visible = arg1
	if not arg1 then
		for _, v_2 in pairs(Chat_upvr.Choices:GetChildren()) do
			v_2:Destroy()
		end
	end
end
function bindJump() -- Line 336
end
function unbindjump() -- Line 346
end
task.wait(1)
input = require(script.Parent.Parent.Scripts.UserInput) -- Setting global
input.InteractSelectionMade(function() -- Line 357
	--[[ Upvalues[1]:
		[1]: IsChatting_upvr (readonly)
	]]
	if IsChatting_upvr.Value == 1 then
		chatSelectionMade()
	end
end)