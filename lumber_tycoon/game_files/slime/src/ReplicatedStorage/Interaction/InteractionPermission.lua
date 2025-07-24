-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:35
-- Luau version 6, Types version 3
-- Time taken: 0.004645 seconds

local any_IsServer_result1_upvr = game:GetService("RunService"):IsServer()
local var2_upvr
local function INLINED() -- Internal function, doesn't exist in bytecode
	var2_upvr = require(game.ServerScriptService.Stats.UserSettings)
	return var2_upvr
end
if not any_IsServer_result1_upvr or not INLINED() then
	var2_upvr = require(game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientUserSettings"))
end
local module_upvr = {}
local var4_upvw
if any_IsServer_result1_upvr then
	game.ReplicatedStorage.Interaction.ClientGetUserPermissions.OnServerInvoke = function(arg1, arg2, arg3) -- Line 16
		--[[ Upvalues[1]:
			[1]: module_upvr (readonly)
		]]
		local any_GetPlayerByUserId_result1 = game.Players:GetPlayerByUserId(arg2)
		if any_GetPlayerByUserId_result1 then
			return module_upvr:IsInteractionTypePermitted(arg1, any_GetPlayerByUserId_result1, arg3)
		end
		return false
	end
else
	var4_upvw = require(game.ReplicatedStorage:WaitForChild("Util"):WaitForChild("TransientFunctionCache")):New(function(...) -- Line 25
		return game.ReplicatedStorage.Interaction.ClientGetUserPermissions:InvokeServer(...)
	end, 1, {
		ReturnOldResultInsteadOfYielding = true;
	})
end
function module_upvr.UserCanInteract(arg1, arg2, arg3, arg4) -- Line 31
	--[[ Upvalues[2]:
		[1]: any_IsServer_result1_upvr (readonly)
		[2]: var4_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 69 start (CF ANALYSIS FAILED)
	if not arg3 then
		warn("Attempt to call permission on nil value from "..arg2.Name)
		return false
	end
	if arg3:FindFirstChild("DestroyTag") then
		return false
	end
	if arg3:FindFirstChild("NoInteract") then
		return false
	end
	local Owner = arg3:FindFirstChild("Owner")
	if not Owner then
		warn("No item owner found for "..arg3:GetFullName())
		return true
	end
	if Owner.Value == arg2 then
		if not arg2:FindFirstChild("CurrentlySavingOrLoading") or arg2.CurrentlySavingOrLoading.HardReload.Value then
			return false, arg2
		end
		return true
	end
	if arg3:FindFirstChild("BoxItemName") and arg3.Owner:FindFirstChild("LastInteraction") and 4 < workspace.DistributedGameTime - arg3.Owner.LastInteraction.Value then
		return true
	end
	local var10
	if var10 and not var10:IsA("Player") then
		var10 = nil
	end
	if not var10 or not var10.Parent or not var10.Character then
		if Owner:FindFirstChild("OwnerString") and Owner.OwnerString.Value ~= "" then
			return false
		end
		return true
	end
	if not var10:FindFirstChild("CurrentlySavingOrLoading") or var10.CurrentlySavingOrLoading.Value or var10.CurrentlySavingOrLoading.HardReload.Value then
		return false
	end
	if any_IsServer_result1_upvr then
		if arg3:IsA("Tool") and arg3.Parent == arg2.Character then
			return true
		end
		if arg1:IsInteractionTypePermitted(arg2, var10, arg4) then
			do
				return true
			end
			-- KONSTANTWARNING: GOTO [188] #142
		end
	else
		if not arg4 then
			warn("Nil client interactiont type: ")
			print(debug.traceback())
		end
		if var4_upvw:Get(tostring(var10.UserId), arg4) then
			return true
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 69 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [188] 142. Error Block 45 start (CF ANALYSIS FAILED)
	do
		return false, var10
	end
	-- KONSTANTERROR: [188] 142. Error Block 45 end (CF ANALYSIS FAILED)
end
function module_upvr.IsInteractionTypePermitted(arg1, arg2, arg3, arg4) -- Line 114
	if arg2 == arg3 then
		return true
	end
	local any_GetUserPermissions_result1 = arg1:GetUserPermissions(arg2, arg3)
	if not arg4 then
		warn("No permission type given for IsInteractionTypePermitted: ", debug.traceback())
		return false
	end
	if not any_GetUserPermissions_result1.GlobalPermissions then
	end
	if typeof(arg4) == "table" then
		local pairs_result1, pairs_result2, pairs_result3 = pairs(arg4)
		for _, v in pairs_result1, pairs_result2, pairs_result3 do
			if any_GetUserPermissions_result1[v] or ({})[v] then
				return true
			end
		end
	else
		pairs_result1 = any_GetUserPermissions_result1[arg4]
		local var19 = pairs_result1
		if not var19 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			var19 = ({})[arg4]
		end
		return var19
	end
end
function module_upvr.GetTimeSinceLastPermissionUpdate(arg1, arg2, arg3) -- Line 144
	local var20
	if typeof(arg3) == "Player" then
		var20 = arg3
	else
		local Owner_2 = arg3:FindFirstChild("Owner")
		local var22 = Owner_2
		if var22 then
			var22 = Owner_2.Value
		end
		var20 = var22
	end
	if not var20 then
		return 0
	end
	if arg2 == var20 then
		return 0
	end
	return os.time() - arg1:GetUserPermissions(arg2, var20).LastUpdate
end
function module_upvr.GetUserPermissions(arg1, arg2, arg3) -- Line 163
	--[[ Upvalues[2]:
		[1]: any_IsServer_result1_upvr (readonly)
		[2]: var2_upvr (readonly)
	]]
	if any_IsServer_result1_upvr then
		local any_Get_result1 = var2_upvr.Get(arg3)
		if not any_Get_result1 then
			return {}
		end
		local var24 = any_Get_result1.UserPermissionList[tostring(arg2.UserId)]
		if not var24 then
			var24 = {}
		end
		var24.GlobalPermissions = any_Get_result1.GlobalPermissionList
		var24.LastUpdate = any_Get_result1.LastPermissionsUpdate
		return var24
	end
	if arg2 ~= game.Players.LocalPlayer then return end
	local var25 = var2_upvr.GetPermissions()[tostring(arg3.UserId)]
	if not var25 then
		var25 = {}
	end
	return var25
end
return module_upvr