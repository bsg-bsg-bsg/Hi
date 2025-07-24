-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:37
-- Luau version 6, Types version 3
-- Time taken: 0.000518 seconds

SuperAxe = require(game.ReplicatedStorage.AxeClasses.AxeSuperClass) -- Setting global
Axe = {} -- Setting global
Axe.__index = Axe
setmetatable(Axe, SuperAxe)
function Axe.new(arg1, ...) -- Line 7
	local SuperAxe_new_result1 = SuperAxe.new(arg1, ...)
	setmetatable(SuperAxe_new_result1, Axe)
	SuperAxe_new_result1.Damage = 1.4
	SuperAxe_new_result1.Range = 13
	SuperAxe_new_result1.SwingCooldown = 0.5
	return SuperAxe_new_result1
end
return Axe