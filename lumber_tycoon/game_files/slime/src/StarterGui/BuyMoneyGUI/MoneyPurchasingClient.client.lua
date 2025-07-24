-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-23 21:50:48
-- Luau version 6, Types version 3
-- Time taken: 0.002201 seconds

local LocalPlayer_upvr = game.Players.LocalPlayer
local Menu_upvr = script.Parent.Parent:WaitForChild("MenuGUI"):WaitForChild("Menu")
local BuyMoney_upvr = Menu_upvr:WaitForChild("Main"):WaitForChild("MenuItems"):WaitForChild("BuyMoney")
local BuyMoney_upvr_2 = script.Parent.BuyMoney
local module_upvr_2 = require(script.Parent.Parent:WaitForChild("BumpButton"))
local IsOpen_upvr = script.Parent.IsOpen
local MarketplaceService_upvr = game:GetService("MarketplaceService")
for _, v_upvr in pairs(BuyMoney_upvr_2.Main:GetChildren()) do
	if v_upvr:FindFirstChild("ProductID") then
		local Value_upvr = v_upvr.ProductID.Value
		local any_GetProductInfo_result1 = MarketplaceService_upvr:GetProductInfo(Value_upvr, Enum.InfoType.Product)
		v_upvr.Robux.Text = "R$ "..any_GetProductInfo_result1.PriceInRobux
		v_upvr.Money.Text = any_GetProductInfo_result1.Name
		local CurrentSaveSlot_upvr = LocalPlayer_upvr:WaitForChild("CurrentSaveSlot")
		v_upvr.MouseButton1Click:connect(function() -- Line 33
			--[[ Upvalues[6]:
				[1]: module_upvr_2 (readonly)
				[2]: v_upvr (readonly)
				[3]: LocalPlayer_upvr (readonly)
				[4]: CurrentSaveSlot_upvr (readonly)
				[5]: MarketplaceService_upvr (readonly)
				[6]: Value_upvr (readonly)
			]]
			if not module_upvr_2.Bump(v_upvr) then
			else
				if LocalPlayer_upvr.userId <= 0 then
					game.ReplicatedStorage.Notices.SendUserNotice:Fire("Create a ROBLOX account for in-game purchases.")
					exitAll()
					return
				end
				if CurrentSaveSlot_upvr.Value == -1 then
					game.ReplicatedStorage.Notices.SendUserNotice:Fire("Load a slot first.")
					return
				end
				MarketplaceService_upvr:PromptProductPurchase(LocalPlayer_upvr, Value_upvr)
			end
		end)
	end
end
local ClientNoticeIsOpen_upvr = game.ReplicatedStorage.Notices.ClientNoticeIsOpen
function exitAll() -- Line 52
	--[[ Upvalues[3]:
		[1]: ClientNoticeIsOpen_upvr (readonly)
		[2]: BuyMoney_upvr_2 (readonly)
		[3]: IsOpen_upvr (readonly)
	]]
	ClientNoticeIsOpen_upvr.Value = false
	BuyMoney_upvr_2.Visible = false
	IsOpen_upvr.Value = false
end
function back() -- Line 59
	--[[ Upvalues[2]:
		[1]: BuyMoney_upvr_2 (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	if not BuyMoney_upvr_2.Visible then
	else
		if not module_upvr_2.Bump(BuyMoney_upvr_2.Quit) then return end
		exitAll()
	end
end
local module_upvr = require(LocalPlayer_upvr:WaitForChild("PlayerGui"):WaitForChild("Scripts"):WaitForChild("SetSelectedButton"))
function openWindow() -- Line 70
	--[[ Upvalues[6]:
		[1]: module_upvr_2 (readonly)
		[2]: BuyMoney_upvr (readonly)
		[3]: Menu_upvr (readonly)
		[4]: BuyMoney_upvr_2 (readonly)
		[5]: IsOpen_upvr (readonly)
		[6]: module_upvr (readonly)
	]]
	if not module_upvr_2.Bump(BuyMoney_upvr) then
	else
		setPlatformControls()
		Menu_upvr.Visible = false
		BuyMoney_upvr_2.Visible = true
		IsOpen_upvr.Value = true
		module_upvr(BuyMoney_upvr_2.Main.Item1)
	end
end
function setPlatformControls() -- Line 86
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: BuyMoney_upvr_2 (readonly)
	]]
	require(LocalPlayer_upvr.PlayerGui.Scripts.SetPlatformControls)({BuyMoney_upvr_2.Quit})
end
task.wait(1)
input = require(script.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput")) -- Setting global
input.InteractAbort(back)
BuyMoney_upvr.MouseButton1Click:connect(function() -- Line 103
	openWindow()
end)
script.Parent.Open.Event:connect(function() -- Line 106
	openWindow()
end)
BuyMoney_upvr_2.Quit.MouseButton1Click:connect(function() -- Line 109
	back()
end)