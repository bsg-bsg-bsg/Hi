-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:46
-- Luau version 6, Types version 3
-- Time taken: 0.002826 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local var6_upvw
local CurrentSaveSlot_upvr = script.Parent.CurrentSaveSlot
local var8_upvw
CurrentSaveSlot_upvr.Set.OnInvoke = function(arg1, arg2) -- Line 7, Named "OnInvoke"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: var6_upvw (read and write)
		[3]: CurrentSaveSlot_upvr (readonly)
		[4]: LocalPlayer_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 3 start (CF ANALYSIS FAILED)
	var8_upvw = arg1
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 9 start (CF ANALYSIS FAILED)
	if arg2 == var8_upvw then
		var6_upvw = arg1
		CurrentSaveSlot_upvr.Value = arg1
		return
	end
	game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", LocalPlayer_upvr.Name.." attempted to set currentsave value with wrong pass "..tostring(arg2))
	print("K7"..debug.traceback())
	LocalPlayer_upvr:Kick()
	-- KONSTANTERROR: [6] 6. Error Block 9 end (CF ANALYSIS FAILED)
end
CurrentSaveSlot_upvr.Changed:connect(function() -- Line 25
	--[[ Upvalues[3]:
		[1]: CurrentSaveSlot_upvr (readonly)
		[2]: var6_upvw (read and write)
		[3]: LocalPlayer_upvr (readonly)
	]]
	if CurrentSaveSlot_upvr.Value ~= var6_upvw then
		game.ReplicatedStorage.Transactions.AddLog:InvokeServer("Exploit", LocalPlayer_upvr.Name.." attempted to locally force set currentsave value")
		print("K8"..debug.traceback())
		LocalPlayer_upvr:Kick()
	end
end)
local var10_upvw = false
function ban(arg1) -- Line 37
	--[[ Upvalues[1]:
		[1]: var10_upvw (read and write)
	]]
	if var10_upvw then
	else
		var10_upvw = true
		game.ReplicatedStorage.Interaction.Ban:FireServer(arg1)
	end
end
if 1 > game.ReplicatedStorage.Transactions.Level:InvokeServer() then
	game.Players.LocalPlayer.Backpack.ChildAdded:connect(function(arg1) -- Line 46
		if arg1:IsA("HopperBin") then
			arg1:Destroy()
		end
	end)
	for _, v_upvr in pairs(game.Workspace.Water:GetChildren()) do
		if v_upvr:IsA("Part") and not v_upvr.CanCollide then
			v_upvr.Changed:connect(function() -- Line 54
				--[[ Upvalues[1]:
					[1]: v_upvr (readonly)
				]]
				if not v_upvr.CanCollide then
				end
			end)
		end
	end
	for _, v_2_upvr in pairs(game.Workspace.Region_MazeCave:GetChildren()) do
		if v_2_upvr:IsA("Part") and v_2_upvr.Locked then
			v_2_upvr.Changed:connect(function() -- Line 64
				--[[ Upvalues[1]:
					[1]: v_2_upvr (readonly)
				]]
				if not v_2_upvr.Locked then
					ban("Maze unlock")
				end
			end)
		end
	end
	game.Workspace:WaitForChild("PlayerModels").ChildAdded:connect(function(arg1) -- Line 72
		task.wait()
		if arg1:FindFirstChild("Configuration") and arg1.Configuration:FindFirstChild("MaxSpeed") then
			local Value_upvr = arg1.Configuration.MaxSpeed.Value
			arg1.Configuration.MaxSpeed.Changed:connect(function() -- Line 77
				--[[ Upvalues[2]:
					[1]: arg1 (readonly)
					[2]: Value_upvr (readonly)
				]]
				if arg1.Configuration.MaxSpeed.Value == Value_upvr then
				end
			end)
		end
	end)
end
function backpackClean() -- Line 89
	for _, v_3 in pairs(game.Players:GetPlayers()) do
		if v_3 ~= game.Players.LocalPlayer and v_3:FindFirstChild("Backpack") then
			v_3.Backpack:Destroy()
		end
	end
end
game.Players.PlayerAdded:connect(backpackClean)
backpackClean()
task.wait(2)
local function kick() -- Line 101
	game.Players.LocalPlayer:Kick()
	while true do
		if math.random(1, 1000) == 1 then
			task.wait()
		end
	end
end
local Ban = game.ReplicatedStorage.Interaction:FindFirstChild("Ban")
if not Ban then
	kick()
else
	Ban.AncestryChanged:Connect(kick)
end