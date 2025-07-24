-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:38
-- Luau version 6, Types version 3
-- Time taken: 0.000962 seconds

SuperAxe = require(game.ReplicatedStorage.AxeClasses.AxeSuperClass) -- Setting global
Axe = {} -- Setting global
Axe.__index = Axe
setmetatable(Axe, SuperAxe)
function Axe.new(...) -- Line 7
	local SuperAxe_new_result1_upvr = SuperAxe.new(...)
	setmetatable(SuperAxe_new_result1_upvr, Axe)
	SuperAxe_new_result1_upvr.Damage = 1.58
	SuperAxe_new_result1_upvr.Range = 9
	SuperAxe_new_result1_upvr.SwingCooldown = 0.4
	SuperAxe_new_result1_upvr.SpecialTrees = {}
	SuperAxe_new_result1_upvr.SpecialTrees.LoneCave = {
		SwingCooldown = 0.3;
	}
	setmetatable(SuperAxe_new_result1_upvr.SpecialTrees.LoneCave, {
		__index = function(arg1, arg2) -- Line 27, Named "__index"
			--[[ Upvalues[1]:
				[1]: SuperAxe_new_result1_upvr (readonly)
			]]
			local TargetWood = SuperAxe_new_result1_upvr.TargetWood
			if TargetWood then
				if SuperAxe_new_result1_upvr.TargetWood.Parent ~= workspace.PlayerModels then
					TargetWood = false
				else
					TargetWood = true
				end
			end
			if arg2 == "Damage" then
				if workspace.Bridge:HasTag("Set") or TargetWood then
					return 10000000
				end
				return 1
			end
		end;
	})
	return SuperAxe_new_result1_upvr
end
return Axe