-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:30
-- Luau version 6, Types version 3
-- Time taken: 0.000409 seconds

function findHighestParent(arg1) -- Line 1
	if not arg1 then
		return nil
	end
	if arg1.Parent:FindFirstChild("Owner") then
		return arg1.Parent
	end
	if arg1.Parent == workspace then
		return nil
	end
	return findHighestParent(arg1.Parent)
end
return findHighestParent