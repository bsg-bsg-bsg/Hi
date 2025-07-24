-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:41
-- Luau version 6, Types version 3
-- Time taken: 0.002897 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local module = require(game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientUserSettings"))
local LocalPlayer_upvr = game.Players.LocalPlayer
local Character_upvw = LocalPlayer_upvr.Character
if not Character_upvw then
	Character_upvw = LocalPlayer_upvr.CharacterAdded:wait()
end
local Alternate_upvr = script.Alternate
game.ReplicatedStorage.Interaction.ActivateAlternate.OnClientEvent:connect(function(arg1) -- Line 9
	--[[ Upvalues[1]:
		[1]: Alternate_upvr (readonly)
	]]
	Alternate_upvr.Value = arg1
end)
local HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
LocalPlayer_upvr.CharacterAdded:connect(function() -- Line 13
	--[[ Upvalues[3]:
		[1]: Character_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: HumanoidRootPart_upvw (read and write)
	]]
	Character_upvw = LocalPlayer_upvr.Character
	HumanoidRootPart_upvw = Character_upvw:WaitForChild("HumanoidRootPart")
end)
task.wait(1)
local ClientSounds_upvr = LocalPlayer_upvr.PlayerGui.ClientSounds
local Music_upvr = LocalPlayer_upvr:FindFirstChild("Music")
if not Music_upvr then
	Music_upvr = script.Music
end
Music_upvr.Parent = LocalPlayer_upvr
local CurrentRegion_upvr = script.Parent.CurrentRegion
module.SettingsUpdated:Connect(function(arg1) -- Line 29
	--[[ Upvalues[1]:
		[1]: Music_upvr (readonly)
	]]
	Music_upvr.Value = arg1.MusicEnabled
end)
Music_upvr.Value = module.GetSettings().MusicEnabled
function fadeOut(arg1, arg2) -- Line 38
	for i = arg1.Volume, 0, (-arg1.Volume) / (arg2 / 0.03) do
		arg1.Volume = i
		task.wait()
	end
	arg1:Destroy()
end
local var21_upvw
function doMusic() -- Line 52
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: ClientSounds_upvr (readonly)
		[3]: Music_upvr (readonly)
		[4]: Alternate_upvr (readonly)
		[5]: var21_upvw (read and write)
		[6]: CurrentRegion_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 32 start (CF ANALYSIS FAILED)
	fadeOut(ClientSounds_upvr, 0.1)
	do
		return
	end
	-- KONSTANTERROR: [10] 8. Error Block 32 end (CF ANALYSIS FAILED)
end
for _, v_upvr in pairs(game.ReplicatedStorage.Regions.Music:GetChildren()) do
	local clone_upvr = v_upvr:clone()
	v_upvr.Changed:connect(function() -- Line 94
		--[[ Upvalues[3]:
			[1]: clone_upvr (readonly)
			[2]: v_upvr (readonly)
			[3]: var21_upvw (read and write)
		]]
		clone_upvr.SoundId = v_upvr.SoundId
		clone_upvr.Volume = v_upvr.Volume
		if var21_upvw and var21_upvw.Name == clone_upvr.Name then
			doMusic()
		end
	end)
	clone_upvr.Parent = ClientSounds_upvr
	local var27_upvw
end
CurrentRegion_upvr.Changed:connect(doMusic)
Music_upvr.Changed:connect(function() -- Line 109
	--[[ Upvalues[2]:
		[1]: Alternate_upvr (readonly)
		[2]: var27_upvw (read and write)
	]]
	if Alternate_upvr.Value and var27_upvw then
		var27_upvw.Volume += 1
	else
		doMusic()
	end
end)
Alternate_upvr.Changed:connect(function() -- Line 117
	--[[ Upvalues[2]:
		[1]: Alternate_upvr (readonly)
		[2]: Music_upvr (readonly)
	]]
	if Alternate_upvr.Value and not Music_upvr.Value then
		doMusic()
	end
end)