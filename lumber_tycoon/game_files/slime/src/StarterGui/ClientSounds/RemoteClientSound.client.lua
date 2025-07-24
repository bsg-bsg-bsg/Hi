-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:40
-- Luau version 6, Types version 3
-- Time taken: 0.000418 seconds

game.ReplicatedStorage:WaitForChild("Interaction"):WaitForChild("RemoteClientSound").OnClientEvent:Connect(function(arg1) -- Line 3, Named "play"
	local SOME = script.Parent:FindFirstChild(arg1)
	if not SOME then
		warn("Couldn't find client sound: ", arg1)
	else
		SOME:Play()
	end
end)