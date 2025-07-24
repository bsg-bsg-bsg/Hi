-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:44
-- Luau version 6, Types version 3
-- Time taken: 0.007514 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
local CurrentCamera_upvw = workspace.CurrentCamera
local SelectPurchase_upvr = script.Parent:WaitForChild("SelectPurchase")
local ConfirmPurchase_upvr = script.Parent:WaitForChild("ConfirmPurchase")
local SetPropertyPurchasingValue_upvr = game.ReplicatedStorage.PropertyPurchasing.SetPropertyPurchasingValue
local PromptChat_upvr = game.ReplicatedStorage.NPCDialog.PromptChat
local module_upvr = require(script.Parent.Parent:WaitForChild("BumpButton"))
local module_upvr_2 = require(game.ReplicatedStorage:WaitForChild("LocalizationUtil"))
local var11_upvw = ""
local var12_upvw = 1
local var13_upvw = 0
local tbl_upvw = {}
local var15_upvw = false
local var16_upvw = 0
local var17_upvw
local var18_upvw = 0
local var19_upvw = false
local SelectionSquare_upvr = script:WaitForChild("SelectionSquare")
local var21_upvw
local var22_upvw = false
local var23_upvw
local const_number_upvw = 0
local var25_upvw = -1
local var26_upvw
function enterPurchaseMode(arg1, arg2, arg3) -- Line 49
	--[[ Upvalues[16]:
		[1]: var22_upvw (read and write)
		[2]: var18_upvw (read and write)
		[3]: SetPropertyPurchasingValue_upvr (readonly)
		[4]: Humanoid_upvw (read and write)
		[5]: var12_upvw (read and write)
		[6]: var25_upvw (read and write)
		[7]: CurrentCamera_upvw (read and write)
		[8]: var23_upvw (read and write)
		[9]: var26_upvw (read and write)
		[10]: var17_upvw (read and write)
		[11]: var19_upvw (read and write)
		[12]: var21_upvw (read and write)
		[13]: LocalPlayer_upvr (readonly)
		[14]: tbl_upvw (read and write)
		[15]: var13_upvw (read and write)
		[16]: PromptChat_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	var22_upvw = arg2
	var18_upvw = arg1
	SetPropertyPurchasingValue_upvr:InvokeServer(true)
	Humanoid_upvw.WalkSpeed = 0
	var12_upvw = 1
	var25_upvw = -1
	CurrentCamera_upvw.CameraType = Enum.CameraType.Scriptable
	var23_upvw = CurrentCamera_upvw.CoordinateFrame
	var26_upvw = arg3
	var17_upvw = nil
	var19_upvw = false
	setPlatformControls()
	setSelectPurchaseVisibility(true)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [236] 168. Error Block 62 start (CF ANALYSIS FAILED)
	for i, v in pairs(workspace.Properties:GetChildren()) do
		if v.Name == "Property" then
			if not v.Owner.Value and var18_upvw or v.Owner.Value == LocalPlayer_upvr then
				table.insert(tbl_upvw, v)
			end
		end
	end
	var13_upvw = #tbl_upvw
	if var13_upvw <= 0 then
		v = workspace.Stores.LandStore
		i = v.Ruhven
		v = workspace.Stores.LandStore.Ruhven.DialogNoMoreSpots
		PromptChat_upvr:FireServer(true, i, v)
		exitAll()
	else
		doRunLoop()
		-- KONSTANTERROR: [236] 168. Error Block 62 end (CF ANALYSIS FAILED)
	end
end
game.ReplicatedStorage.PropertyPurchasing.ClientEnterPropertyPurchaseMode.OnClientEvent:connect(enterPurchaseMode)
game.ReplicatedStorage.PropertyPurchasing.SelectLoadPlot.OnClientInvoke = function(arg1) -- Line 140, Named "OnClientInvoke"
	--[[ Upvalues[2]:
		[1]: var17_upvw (read and write)
		[2]: var16_upvw (read and write)
	]]
	enterPurchaseMode(0, false, arg1)
	return var17_upvw, var16_upvw
end
local WalkSpeed_upvr = Humanoid_upvw.WalkSpeed
function exitAll() -- Line 146
	--[[ Upvalues[9]:
		[1]: var11_upvw (read and write)
		[2]: tbl_upvw (read and write)
		[3]: var25_upvw (read and write)
		[4]: var19_upvw (read and write)
		[5]: CurrentCamera_upvw (read and write)
		[6]: var23_upvw (read and write)
		[7]: Humanoid_upvw (read and write)
		[8]: WalkSpeed_upvr (readonly)
		[9]: SetPropertyPurchasingValue_upvr (readonly)
	]]
	var11_upvw = ""
	tbl_upvw = {}
	var25_upvw = -1
	setSelectPurchaseVisibility(false)
	setConfirmPurchaseVisibility(false)
	var19_upvw = false
	if 0 <= var25_upvw then
		CurrentCamera_upvw.CameraType = Enum.CameraType.Scriptable
		local var33 = var23_upvw
		local magnitude = (var33.p - CurrentCamera_upvw.CoordinateFrame.p).magnitude
		CurrentCamera_upvw:Interpolate(var33, var33 * CFrame.new(0, 0, -50), magnitude / 800)
		task.wait(magnitude / 800)
	end
	CurrentCamera_upvw.CameraType = Enum.CameraType.Custom
	Humanoid_upvw.WalkSpeed = WalkSpeed_upvr
	SetPropertyPurchasingValue_upvr:InvokeServer(false)
end
local RunService_upvr = game:GetService("RunService")
function doRunLoop() -- Line 174
	--[[ Upvalues[15]:
		[1]: var11_upvw (read and write)
		[2]: var22_upvw (read and write)
		[3]: SelectionSquare_upvr (readonly)
		[4]: var26_upvw (read and write)
		[5]: SelectPurchase_upvr (readonly)
		[6]: tbl_upvw (read and write)
		[7]: Humanoid_upvw (read and write)
		[8]: CurrentCamera_upvw (read and write)
		[9]: var12_upvw (read and write)
		[10]: var25_upvw (read and write)
		[11]: var16_upvw (read and write)
		[12]: const_number_upvw (read and write)
		[13]: RunService_upvr (readonly)
		[14]: var19_upvw (read and write)
		[15]: var15_upvw (read and write)
	]]
	task.wait(0.2)
	var11_upvw = "Selecting"
	if var22_upvw then
		SelectionSquare_upvr.Parent = workspace.Effects
	end
	if var26_upvw then
		SelectPurchase_upvr.Rotate.Visible = true
		var26_upvw.Parent = workspace.Effects
		script.Parent.Parent.LoadSaveGUI.Progress.Visible = false
	else
		SelectPurchase_upvr.Rotate.Visible = false
	end
end
function scrollSelection(arg1) -- Line 261
	--[[ Upvalues[5]:
		[1]: var11_upvw (read and write)
		[2]: var12_upvw (read and write)
		[3]: var13_upvw (read and write)
		[4]: module_upvr (readonly)
		[5]: SelectPurchase_upvr (readonly)
	]]
	if var11_upvw ~= "Selecting" then
	else
		var12_upvw += arg1
		if var12_upvw < 1 then
			var12_upvw = var13_upvw
		elseif var13_upvw < var12_upvw then
			var12_upvw = 1
		end
		if arg1 == -1 then
			module_upvr.Bump(SelectPurchase_upvr.Left)
			return
		end
		module_upvr.Bump(SelectPurchase_upvr.Right)
	end
end
local ClientToServer_upvr = game.ReplicatedStorage.Transactions.ClientToServer
local ClientPurchasedProperty_upvr = game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty
local ClientExpandedProperty_upvr = game.ReplicatedStorage.PropertyPurchasing.ClientExpandedProperty
function selectionMade() -- Line 280
	--[[ Upvalues[20]:
		[1]: var11_upvw (read and write)
		[2]: var18_upvw (read and write)
		[3]: module_upvr (readonly)
		[4]: SelectPurchase_upvr (readonly)
		[5]: ConfirmPurchase_upvr (readonly)
		[6]: var22_upvw (read and write)
		[7]: tbl_upvw (read and write)
		[8]: var12_upvw (read and write)
		[9]: var26_upvw (read and write)
		[10]: LocalPlayer_upvr (readonly)
		[11]: ClientToServer_upvr (readonly)
		[12]: PromptChat_upvr (readonly)
		[13]: var19_upvw (read and write)
		[14]: const_number_upvw (read and write)
		[15]: var17_upvw (read and write)
		[16]: ClientPurchasedProperty_upvr (readonly)
		[17]: CurrentCamera_upvw (read and write)
		[18]: ClientExpandedProperty_upvr (readonly)
		[19]: var21_upvw (read and write)
		[20]: SelectionSquare_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 34 start (CF ANALYSIS FAILED)
	if not module_upvr.Bump(SelectPurchase_upvr.Purchase) then return end
	var11_upvw = "Confirming"
	setSelectPurchaseVisibility(false)
	setConfirmPurchaseVisibility(true)
	do
		return
	end
	-- KONSTANTERROR: [5] 5. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 21. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [25] 21. Error Block 6 end (CF ANALYSIS FAILED)
end
function exitPurchaseMode() -- Line 351
	--[[ Upvalues[6]:
		[1]: var11_upvw (read and write)
		[2]: module_upvr (readonly)
		[3]: SelectPurchase_upvr (readonly)
		[4]: var18_upvw (read and write)
		[5]: PromptChat_upvr (readonly)
		[6]: ConfirmPurchase_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 14. Error Block 5 start (CF ANALYSIS FAILED)
	PromptChat_upvr:FireServer(true, workspace.Stores.LandStore.Ruhven, workspace.Stores.LandStore.Ruhven.DialogAborted)
	do
		return
	end
	-- KONSTANTERROR: [17] 14. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [41] 28. Error Block 13 start (CF ANALYSIS FAILED)
	if var11_upvw == "Confirming" then
		if not module_upvr.Bump(ConfirmPurchase_upvr.Quit) then return end
		var11_upvw = "Selecting"
		setSelectPurchaseVisibility(true)
		setConfirmPurchaseVisibility(false)
	end
	-- KONSTANTERROR: [41] 28. Error Block 13 end (CF ANALYSIS FAILED)
end
function setSelectPurchaseVisibility(arg1) -- Line 373
	--[[ Upvalues[4]:
		[1]: var18_upvw (read and write)
		[2]: SelectPurchase_upvr (readonly)
		[3]: ConfirmPurchase_upvr (readonly)
		[4]: module_upvr_2 (readonly)
	]]
	if var18_upvw and var18_upvw ~= 0 then
		SelectPurchase_upvr.Cost.TextLabel.Text = '$'..var18_upvw
		SelectPurchase_upvr.Purchase.Visible = true
		SelectPurchase_upvr.Left.Visible = true
		SelectPurchase_upvr.Right.Visible = true
		SelectPurchase_upvr.Purchase.TextLabel.Text = "Purchase"
		ConfirmPurchase_upvr.Purchase.TextLabel.Text = "Purchase"
	elseif var18_upvw and var18_upvw == 0 then
		SelectPurchase_upvr.Cost.TextLabel.Text = ""
		SelectPurchase_upvr.Purchase.Visible = true
		SelectPurchase_upvr.Left.Visible = true
		SelectPurchase_upvr.Right.Visible = true
		SelectPurchase_upvr.Purchase.TextLabel.Text = "Select"
		ConfirmPurchase_upvr.Purchase.TextLabel.Text = "Confirm"
	else
		SelectPurchase_upvr.Cost.TextLabel.Text = module_upvr_2:Translate("Here is your land.")
		SelectPurchase_upvr.Purchase.Visible = false
		SelectPurchase_upvr.Left.Visible = false
		SelectPurchase_upvr.Right.Visible = false
	end
	SelectPurchase_upvr.Visible = arg1
	input.SetBackpackEnabled(not arg1)
end
function setConfirmPurchaseVisibility(arg1) -- Line 398
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: module_upvr_2 (readonly)
		[3]: ConfirmPurchase_upvr (readonly)
	]]
	if var18_upvw then
		local var39
		if var18_upvw == 0 then
			var39 = module_upvr_2:Translate("Load your save here?")
		else
			var39 = module_upvr_2:TranslateByKey("PropertyPurchaseCost", {var18_upvw})
		end
		ConfirmPurchase_upvr.Cost.TextLabel.Text = var39
	end
	ConfirmPurchase_upvr.Visible = arg1
end
function setPlatformControls() -- Line 412
	--[[ Upvalues[3]:
		[1]: SelectPurchase_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: ConfirmPurchase_upvr (readonly)
	]]
	if input.Device == "Touch" then
		SelectPurchase_upvr.Quit.Position = SelectPurchase_upvr.Quit.TouchPosition.Position
	end
	require(LocalPlayer_upvr.PlayerGui.Scripts.SetPlatformControls)({SelectPurchase_upvr.Purchase, SelectPurchase_upvr.Rotate, SelectPurchase_upvr.Quit, ConfirmPurchase_upvr.Purchase, ConfirmPurchase_upvr.Quit})
end
function rotate() -- Line 421
	--[[ Upvalues[4]:
		[1]: SelectPurchase_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: var16_upvw (read and write)
		[4]: var15_upvw (read and write)
	]]
	if not SelectPurchase_upvr.Rotate.Visible or not SelectPurchase_upvr.Visible then
	else
		if not module_upvr.Bump(SelectPurchase_upvr.Rotate) then return end
		var16_upvw += 1
		if 4 <= var16_upvw then
			var16_upvw = 0
		end
		var15_upvw = true
	end
end
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 438
	--[[ Upvalues[4]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Humanoid_upvw (read and write)
		[4]: CurrentCamera_upvw (read and write)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	Humanoid_upvw = Character_upvw:WaitForChild("Humanoid")
	CurrentCamera_upvw = workspace.CurrentCamera
	Humanoid_upvw.Died:connect(exitAll)
end)
Humanoid_upvw.Died:connect(exitAll)
task.wait(1)
input = require(script.Parent.Parent.Scripts.UserInput) -- Setting global
input.ButtonA(selectionMade)
input.InteractSelectionSideScroll(scrollSelection)
input.InteractAbort(exitPurchaseMode)
input.RotateProperty(rotate)
SelectPurchase_upvr.Purchase.MouseButton1Click:connect(function() -- Line 457
	selectionMade()
end)
SelectPurchase_upvr.Quit.MouseButton1Click:connect(function() -- Line 460
	exitPurchaseMode()
end)
ConfirmPurchase_upvr.Purchase.MouseButton1Click:connect(function() -- Line 463
	selectionMade()
end)
ConfirmPurchase_upvr.Quit.MouseButton1Click:connect(function() -- Line 466
	exitPurchaseMode()
end)
SelectPurchase_upvr.Left.MouseButton1Click:connect(function() -- Line 469
	scrollSelection(-1)
end)
SelectPurchase_upvr.Right.MouseButton1Click:connect(function() -- Line 472
	scrollSelection(1)
end)
SelectPurchase_upvr.Rotate.MouseButton1Click:connect(function() -- Line 475
	rotate()
end)