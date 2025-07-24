-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:34
-- Luau version 6, Types version 3
-- Time taken: 0.002103 seconds

local tbl_upvr_3 = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
local tbl_upvr_2 = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
local tbl_upvr = {31536000, 31536000, 31622400, 31536000}
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 29
	if arg3 <= arg1[arg2] then
		arg1[arg2] = arg5
		arg1[arg4] += 1
	end
end
local floor_upvr = math.floor
local ceil_upvr = math.ceil
return function(arg1) -- Line 35
	--[[ Upvalues[5]:
		[1]: floor_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_upvr_3 (readonly)
		[5]: ceil_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [65] 54. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [65] 54. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 54 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.5]
	local function INLINED() -- Internal function, doesn't exist in bytecode
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.4]
		return nil
	end
	if nil == 0 or not INLINED() then
	end
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.3]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.4294314123]
	if nil < nil then
	else
	end
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.11]
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [65.7]
	if nil <= nil then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [66.8]
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [66.9]
		-- KONSTANTWARNING: GOTO [57] #47
	end
	-- KONSTANTERROR: [0] 1. Error Block 54 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [67] 56. Error Block 55 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [72.6]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [74.1]
	nil.Year = nil + floor_upvr(nil / 126230400) * 4 + 1970
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if nil.Year % 4 == 0 then
	else
	end
	tbl_upvr_3[2] = 28
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	nil.Month = 1
	if tbl_upvr_3[1] * 86400 < nil % 126230400 then
		-- KONSTANTWARNING: GOTO [94] #79
	end
	-- KONSTANTERROR: [67] 56. Error Block 55 end (CF ANALYSIS FAILED)
end