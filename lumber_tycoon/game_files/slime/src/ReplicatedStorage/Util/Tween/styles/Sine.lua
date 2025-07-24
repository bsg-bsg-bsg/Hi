-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:33
-- Luau version 6, Types version 3
-- Time taken: 0.000252 seconds

local sin_upvr = math.sin
return function(arg1, arg2) -- Line 4
	--[[ Upvalues[1]:
		[1]: sin_upvr (readonly)
	]]
	return sin_upvr(arg1 * math.pi / 2) ^ (arg2 or 1)
end