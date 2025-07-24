-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:47
-- Luau version 6, Types version 3
-- Time taken: 0.001223 seconds

function set(arg1) -- Line 1
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var5
	if game.Lighting.Spook.Value then
		var5 = 1
	else
		var5 = 0
	end
	if arg1 then
		local Frame = script.Parent.Frame
		if var5 == 1 then
			Frame = 0
		else
			Frame = 1
		end
		Frame.Vig.ImageTransparency = Frame
	else
		if var5 == 0 then
		else
		end
		if var5 == 0 then
		else
		end
		for i = var5, 0, -0.01 do
			script.Parent.Frame.Vig.ImageTransparency = i * 0.9
			task.wait()
		end
	end
end
game.Lighting.Spook.Changed:connect(set)
set(true)