-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:29
-- Luau version 6, Types version 3
-- Time taken: 0.004341 seconds

local module = {}
local var2_upvw = "en-us"
if not game:GetService("RunService"):IsClient() then
	error("LocalizationSwapper should not be used on the server", 2)
end
local Localization_Assets_upvr = game:GetService("ReplicatedStorage"):FindFirstChild("Localization Assets", true)
if not Localization_Assets_upvr then
	error("Could not find descendant '".."Localization Assets".."' to use for asset swapping!", 2)
end
if not Localization_Assets_upvr:FindFirstChild("default") then
	warn("Default directory not found, creating empty one and continuing")
	local Folder_upvw = Instance.new("Folder")
	Folder_upvw.Name = "default"
	Folder_upvw.Parent = Localization_Assets_upvr
end
function module.SetLocale(arg1, arg2) -- Line 44
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	if typeof(arg2) ~= "string" then
		error("bad argument #1 to 'SetLocale' (string expected, got "..typeof(arg2)..')', 2)
	end
	var2_upvw = arg2
end
function module.SwapForCurrentLocale(arg1, arg2, arg3) -- Line 54
	--[[ Upvalues[3]:
		[1]: Localization_Assets_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: Folder_upvw (read and write)
	]]
	if typeof(arg2) ~= "Instance" then
		error("bad argument #1 to 'SwapForCurrentLocale' (Instance expected, got "..typeof(arg2)..')', 2)
	elseif typeof(arg3) ~= "string" then
		error("bad argument #2 to 'SwapForCurrentLocale' (string expected, got "..typeof(arg3)..')', 2)
	end
	local SOME_6 = Localization_Assets_upvr:FindFirstChild(var2_upvw)
	if not SOME_6 then
		SOME_6 = Folder_upvw
	end
	local SOME_2 = SOME_6:FindFirstChild(arg3)
	if SOME_2 then
		local clone = SOME_2:Clone()
		local var8
		if arg2:IsA("Model") and arg2.PrimaryPart then
			var8 = arg2:GetPrimaryPartCFrame()
		elseif arg2:IsA("BasePart") then
			var8 = arg2.CFrame
		end
		if var8 then
			if clone:IsA("Model") and clone.PrimaryPart then
				clone:SetPrimaryPartCFrame(var8)
			elseif clone:IsA("BasePart") then
				clone.CFrame = var8
			end
		end
		clone.Name = arg2.Name
		clone.Parent = arg2.Parent
		arg2:Destroy()
		return clone
	end
	return arg2
end
function module.GetForCurrentLocale(arg1, arg2) -- Line 101
	--[[ Upvalues[3]:
		[1]: Localization_Assets_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: Folder_upvw (read and write)
	]]
	if typeof(arg2) ~= "string" then
		error("bad argument #1 to 'GetForCurrentLocale' (string expected, got "..typeof(arg2)..')', 2)
	end
	local SOME_4 = Localization_Assets_upvr:FindFirstChild(var2_upvw)
	if SOME_4 then
		local SOME_5 = SOME_4:FindFirstChild(arg2)
		if SOME_5 then
			return SOME_5:Clone()
		end
	end
	local SOME_3 = Folder_upvw:FindFirstChild(arg2)
	if SOME_3 then
		return SOME_3:Clone()
	end
end
function module.RemoveForLocales(arg1, arg2, arg3) -- Line 125
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	if typeof(arg2) ~= "table" then
		error("bad argument #1 to 'RemoveForLocales' (table expected, got "..typeof(arg2)..')', 2)
	elseif typeof(arg3) ~= "Instance" then
		error("bad argument #2 to 'RemoveForLocales' (Instance expected, got "..typeof(arg3)..')', 2)
	end
	for _, v in pairs(arg2) do
		if var2_upvw == v then
			arg3:Destroy()
			return true
		end
	end
	return false
end
function module.InsertForLocales(arg1, arg2, arg3, arg4, arg5) -- Line 146
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: Localization_Assets_upvr (readonly)
		[3]: Folder_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 46 start (CF ANALYSIS FAILED)
	local var20
	if typeof(arg2) ~= "table" then
		var20 = typeof(arg2)
		error("bad argument #1 to 'InsertForLocales' (table expected, got "..var20..')', 2)
	elseif typeof(arg3) ~= "string" then
		var20 = typeof(arg3)
		error("bad argument #2 to 'InsertForLocales' (string expected, got "..var20..')', 2)
	elseif arg4 ~= nil and typeof(arg4) ~= "Instance" then
		var20 = typeof(arg4)
		error("bad argument #3 to 'InsertForLocales' (Instance expected, got "..var20..')', 2)
	elseif arg5 ~= nil and typeof(arg5) ~= "CFrame" then
		var20 = typeof(arg5)
		error("bad argument #4 to 'InsertForLocales' (CFrame expected, got "..var20..')', 2)
	end
	local pairs_result1, pairs_result2, pairs_result3_2 = pairs(arg2)
	-- KONSTANTERROR: [0] 1. Error Block 46 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [98] 79. Error Block 15 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [98] 79. Error Block 15 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [93] 75. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [93] 75. Error Block 13 end (CF ANALYSIS FAILED)
end
local LocalizationService_upvr = game:GetService("LocalizationService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local pcall_result1, pcall_result2 = pcall(function() -- Line 205
	--[[ Upvalues[2]:
		[1]: LocalizationService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	return LocalizationService_upvr:GetTranslatorForPlayer(LocalPlayer_upvr)
end)
if pcall_result1 then
	module:SetLocale(pcall_result2.LocaleId)
else
	warn("[LocalizationSwapper] Initializing locale for local player failed!")
end
return module