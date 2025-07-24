-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:31
-- Luau version 6, Types version 3
-- Time taken: 0.000475 seconds

return function(arg1, arg2, arg3) -- Line 1
	return NumberRange.new((arg2.Min - arg1.Min) * arg3 + arg1.Min, (arg2.Max - arg1.Max) * arg3 + arg1.Max)
end