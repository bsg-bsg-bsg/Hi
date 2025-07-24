-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:29
-- Luau version 6, Types version 3
-- Time taken: 0.002791 seconds

local module = {}
local Players_upvr = game:GetService("Players")
local var3_upvw
local var4_upvw = false
local BindableEvent_upvr = Instance.new("BindableEvent")
local BindableEvent_upvr_2 = Instance.new("BindableEvent")
local var7_upvw = false
local function retry_upvr(arg1, arg2) -- Line 47, Named "retry"
	for i = 1, arg1 do
		local pcall_result1, pcall_result2 = pcall(arg2)
		if pcall_result1 then
			return pcall_result2
		end
		task.wait(i / 2)
	end
end
local tbl_upvr = {}
local PolicyService_upvr = game:GetService("PolicyService")
local function getPolicyActive_upvr(arg1) -- Line 60, Named "getPolicyActive"
	--[[ Upvalues[5]:
		[1]: tbl_upvr (readonly)
		[2]: var7_upvw (read and write)
		[3]: retry_upvr (readonly)
		[4]: PolicyService_upvr (readonly)
		[5]: Players_upvr (readonly)
	]]
	local var13
	if var13 == nil then
		var13 = nil
		if var7_upvw then
			var13 = true
		else
			var13 = retry_upvr(3, function() -- Line 70
				--[[ Upvalues[2]:
					[1]: PolicyService_upvr (copied, readonly)
					[2]: arg1 (readonly)
				]]
				return PolicyService_upvr:GetPolicyInfoForPlayerAsync(arg1).IsSubjectToChinaPolicies
			end)
			if not var13 and 0 < arg1.UserId then
				var13 = retry_upvr(3, function() -- Line 76
					--[[ Upvalues[1]:
						[1]: arg1 (readonly)
					]]
					return arg1:IsInGroup(9170755)
				end)
			end
		end
		if arg1.Parent == Players_upvr then
			tbl_upvr[arg1] = var13 or false
		end
	end
	return tbl_upvr[arg1]
end
Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 95
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr[arg1] = nil
end)
if game:GetService("RunService"):IsServer() then
	var3_upvw = var7_upvw
	if not var3_upvw then
		local var17_upvw
		var17_upvw = Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 109, Named "onPlayerAdded"
			--[[ Upvalues[6]:
				[1]: var17_upvw (read and write)
				[2]: var3_upvw (read and write)
				[3]: getPolicyActive_upvr (readonly)
				[4]: var4_upvw (read and write)
				[5]: BindableEvent_upvr (readonly)
				[6]: BindableEvent_upvr_2 (readonly)
			]]
			if not var17_upvw then
			else
				var17_upvw:Disconnect()
				var17_upvw = nil
				var3_upvw = getPolicyActive_upvr(arg1)
				var4_upvw = true
				if var3_upvw then
					BindableEvent_upvr:Fire(var3_upvw)
				end
				BindableEvent_upvr_2:Fire(var3_upvw)
			end
		end)
		local var18 = var17_upvw
		if 0 < #Players_upvr:GetPlayers() then
			if not var18 then
			else
				var18:Disconnect()
				var18 = nil
				var3_upvw = getPolicyActive_upvr(Players_upvr:GetPlayers()[1])
				var4_upvw = true
				if var3_upvw then
					BindableEvent_upvr:Fire(var3_upvw)
				end
				BindableEvent_upvr_2:Fire(var3_upvw)
			end
		end
	else
		var4_upvw = true
	end
else
	var3_upvw = getPolicyActive_upvr(Players_upvr.LocalPlayer)
	var4_upvw = true
end
function module.IsActive(arg1) -- Line 152
	--[[ Upvalues[1]:
		[1]: var3_upvw (read and write)
	]]
	return var3_upvw
end
function module.IsReady(arg1) -- Line 157
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	return var4_upvw
end
function module.WaitForReady(arg1) -- Line 162
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: var3_upvw (read and write)
		[3]: BindableEvent_upvr_2 (readonly)
	]]
	if var4_upvw then
		return var3_upvw
	end
	return BindableEvent_upvr_2.Event:Wait()
end
module.Changed = BindableEvent_upvr.Event
function module.IsActiveForPlayer(arg1, arg2) -- Line 176
	--[[ Upvalues[1]:
		[1]: getPolicyActive_upvr (readonly)
	]]
	if typeof(arg2) ~= "Instance" or not arg2:IsA("Player") then
		error("bad argument #1 to 'IsActiveForPlayer' (Player expected, got "..typeof(arg2)..')', 2)
	end
	return getPolicyActive_upvr(arg2)
end
return module