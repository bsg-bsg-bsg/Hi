-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:36
-- Luau version 6, Types version 3
-- Time taken: 0.000477 seconds

SuperAxe = require(game.ReplicatedStorage.AxeClasses.AxeSuperClass) -- Setting global
Axe = {} -- Setting global
Axe.__index = Axe
setmetatable(Axe, SuperAxe)
function Axe.new(...) -- Line 7
	local SuperAxe_new_result1 = SuperAxe.new(...)
	setmetatable(SuperAxe_new_result1, Axe)
	SuperAxe_new_result1.Damage = 0.6
	SuperAxe_new_result1.Range = 9
	SuperAxe_new_result1.SwingCooldown = 0.55
	SuperAxe_new_result1.SpecialTrees = {}
	SuperAxe_new_result1.SpecialTrees.Volcano = {}
	SuperAxe_new_result1.SpecialTrees.Volcano.Damage = 6.35
	SuperAxe_new_result1.SpecialTrees.Volcano.SwingCooldown = 0.35
	return SuperAxe_new_result1
end
return Axe