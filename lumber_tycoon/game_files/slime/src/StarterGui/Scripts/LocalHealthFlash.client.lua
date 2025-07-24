-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:42
-- Luau version 6, Types version 3
-- Time taken: 0.002605 seconds

while not Game do
	task.wait((1/60))
end
while not Game:GetService("Players") do
	task.wait((1/60))
end
local var1_upvw
local var2_upvw
Game:GetService("ContentProvider"):Preload("http://www.roblox.com/asset/?id=34854607")
while not Game:GetService("Players").LocalPlayer do
	task.wait((1/60))
end
function CreateGui() -- Line 40
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	if var2_upvw and 0 < #var2_upvw:GetChildren() then
		var2_upvw.Parent = Game:GetService("CoreGui").RobloxGui
	else
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Name = "HurtOverlay"
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.Image = "http://www.roblox.com/asset/?id=34854607"
		ImageLabel.Position = UDim2.new(-10, 0, -10, 0)
		ImageLabel.Size = UDim2.new(20, 0, 20, 0)
		ImageLabel.Visible = false
		ImageLabel.Parent = var2_upvw
		local ScreenGui = Instance.new("ScreenGui", script.Parent.Parent)
		ScreenGui.Name = "HealthFlash"
		var2_upvw.Parent = ScreenGui
	end
end
local var5_upvw = 100
function UpdateGui(arg1) -- Line 60
	--[[ Upvalues[2]:
		[1]: var5_upvw (read and write)
		[2]: var1_upvw (read and write)
	]]
	local var6 = var5_upvw - arg1
	var5_upvw = arg1
	if var1_upvw.Parent:FindFirstChild("Floating") and var1_upvw.Parent.Floating.Value then
	else
		local maximum = math.max(math.min(math.abs(var6 / var1_upvw.MaxHealth), 1), 0)
		if maximum ~= maximum then
		end
		if var1_upvw.MaxHealth * 0.001 <= var6 then
			AnimateHurtOverlay()
		end
	end
end
function AnimateHurtOverlay() -- Line 83
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	if not var2_upvw then
	else
		local HurtOverlay_upvr = var2_upvw:FindFirstChild("HurtOverlay")
		if not HurtOverlay_upvr then return end
		local udim2_upvr_2 = UDim2.new(20, 0, 20, 0)
		local udim2_upvr = UDim2.new(-10, 0, -10, 0)
		if HurtOverlay_upvr:IsDescendantOf(Game) then
			HurtOverlay_upvr:TweenSizeAndPosition(udim2_upvr_2, udim2_upvr, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0, true, function() -- Line 94
				--[[ Upvalues[3]:
					[1]: HurtOverlay_upvr (readonly)
					[2]: udim2_upvr_2 (readonly)
					[3]: udim2_upvr (readonly)
				]]
				HurtOverlay_upvr.Size = UDim2.new(1, 0, 1, 0)
				HurtOverlay_upvr.Position = UDim2.new(0, 0, 0, 0)
				HurtOverlay_upvr.Visible = true
				if HurtOverlay_upvr:IsDescendantOf(Game) then
					HurtOverlay_upvr:TweenSizeAndPosition(udim2_upvr_2, udim2_upvr, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 10, false, function() -- Line 103
						--[[ Upvalues[1]:
							[1]: HurtOverlay_upvr (copied, readonly)
						]]
						HurtOverlay_upvr.Visible = false
					end)
				else
					HurtOverlay_upvr.Size = udim2_upvr_2
					HurtOverlay_upvr.Position = udim2_upvr
				end
			end)
			return
		end
		HurtOverlay_upvr.Size = udim2_upvr_2
		HurtOverlay_upvr.Position = udim2_upvr
	end
end
function humanoidDied() -- Line 118
	UpdateGui(0)
end
function startGui() -- Line 123
	--[[ Upvalues[1]:
		[1]: var1_upvw (read and write)
	]]
	local Character = Game:GetService("Players").LocalPlayer.Character
	if not Character then
	else
		var1_upvw = Character:WaitForChild("Humanoid")
		if not var1_upvw then return end
		if not Game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Health) then return end
		healthChangedConnection = var1_upvw.HealthChanged:connect(UpdateGui) -- Setting global
		humanoidDiedConnection = var1_upvw.Died:connect(humanoidDied) -- Setting global
		UpdateGui(var1_upvw.Health)
	end
end
if not require(game.ReplicatedStorage:WaitForChild("ChinaPolicyService")):WaitForReady() then
	var2_upvw = Instance.new("Frame")
	local var14 = var2_upvw
	var14.Name = "HealthGui"
	var14.BackgroundTransparency = 1
	var14.Size = UDim2.new(1, 0, 1, 0)
	game.Players.LocalPlayer.CharacterAdded:wait()
	startGui()
	CreateGui()
	game.Players.LocalPlayer.CharacterAdded:connect(startGui)
end