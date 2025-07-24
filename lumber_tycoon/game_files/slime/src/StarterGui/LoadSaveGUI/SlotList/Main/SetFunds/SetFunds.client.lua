-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:47
-- Luau version 6, Types version 3
-- Time taken: 0.000905 seconds

local FundsSet_upvr = script.Parent.FundsSet
local var2_upvw = 0
FundsSet_upvr.FocusLost:connect(function(arg1) -- Line 5
	--[[ Upvalues[2]:
		[1]: FundsSet_upvr (readonly)
		[2]: var2_upvw (read and write)
	]]
	local var4 = arg1
	if var4 then
		var4 = tonumber(FundsSet_upvr.Text)
	end
	if var4 then
		FundsSet_upvr.Text = "SETTING"
		game.ReplicatedStorage.Transactions.ClientToServer.ASet:InvokeServer(var4)
	else
		FundsSet_upvr.Text = var2_upvw
	end
end)
game.ReplicatedStorage.Transactions.ServerToClient.FundsChanged.OnClientEvent:connect(function(arg1) -- Line 16
	--[[ Upvalues[2]:
		[1]: FundsSet_upvr (readonly)
		[2]: var2_upvw (read and write)
	]]
	task.wait()
	FundsSet_upvr.Text = arg1
	var2_upvw = arg1
end)