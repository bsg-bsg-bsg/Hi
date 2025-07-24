-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:30
-- Luau version 6, Types version 3
-- Time taken: 0.000447 seconds

return function(arg1, arg2, arg3) -- Line 1
	return PhysicalProperties.new((arg2.Density - arg1.Density) * arg3 + arg1.Density, (arg2.Friction - arg1.Friction) * arg3 + arg1.Friction, (arg2.Elasticity - arg1.Elasticity) * arg3 + arg1.Elasticity, (arg2.FrictionWeight - arg1.FrictionWeight) * arg3 + arg1.FrictionWeight, (arg2.ElasticityWeight - arg1.ElasticityWeight) * arg3 + arg1.ElasticityWeight)
end