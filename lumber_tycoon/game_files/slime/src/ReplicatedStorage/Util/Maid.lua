-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:35
-- Luau version 6, Types version 3
-- Time taken: 0.002286 seconds

local module_upvr = {
	ClassName = "Maid";
}
function module_upvr.new() -- Line 37
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return setmetatable({
		_tasks = {};
	}, module_upvr)
end
function module_upvr.isMaid(arg1) -- Line 54
	local var3 = false
	if type(arg1) == "table" then
		if arg1.ClassName ~= "Maid" then
			var3 = false
		else
			var3 = true
		end
	end
	return var3
end
function module_upvr.__index(arg1, arg2) -- Line 73
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr[arg2] then
		return module_upvr[arg2]
	end
	return arg1._tasks[arg2]
end
function module_upvr.__newindex(arg1, arg2, arg3) -- Line 99
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr[arg2] ~= nil then
		error("Cannot use '%s' as a Maid key":format(tostring(arg2)), 2)
	end
	local _tasks = arg1._tasks
	local var5 = _tasks[arg2]
	if var5 == arg3 then
	else
		_tasks[arg2] = arg3
		if var5 then
			if type(var5) == "function" then
				var5()
				return
			end
			if typeof(var5) == "RBXScriptConnection" then
				var5:Disconnect()
				return
			end
			if var5.Destroy then
				var5:Destroy()
			end
		end
	end
end
function module_upvr.GiveTask(arg1, arg2) -- Line 130
	if not arg2 then
		error("Task cannot be false or nil", 2)
	end
	local var6 = #arg1._tasks + 1
	arg1[var6] = arg2
	if type(arg2) == "table" and not arg2.Destroy then
		warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n"..debug.traceback())
	end
	return var6
end
function module_upvr.GivePromise(arg1, arg2) -- Line 151
	if not arg2:IsPending() then
		return arg2
	end
	local any_resolved_result1 = arg2.resolved(arg2)
	local any_GiveTask_result1_upvr = arg1:GiveTask(any_resolved_result1)
	any_resolved_result1:Finally(function() -- Line 160
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: any_GiveTask_result1_upvr (readonly)
		]]
		arg1[any_GiveTask_result1_upvr] = nil
	end)
	return any_resolved_result1
end
function module_upvr.DoCleaning(arg1) -- Line 183
	local _tasks_2 = arg1._tasks
	for i, v in pairs(_tasks_2) do
		if typeof(v) == "RBXScriptConnection" then
			_tasks_2[i] = nil
			v:Disconnect()
		end
	end
	local next_result1, next_result2 = next(_tasks_2)
	while next_result2 ~= nil do
		_tasks_2[next_result1] = nil
		i = next_result2
		if type(i) == "function" then
			next_result2()
		else
			i = next_result2
			if typeof(i) == "RBXScriptConnection" then
				next_result2:Disconnect()
			elseif next_result2.Destroy then
				next_result2:Destroy()
			end
		end
		i = _tasks_2
		local _, _ = next(i)
	end
end
module_upvr.Destroy = module_upvr.DoCleaning
return module_upvr