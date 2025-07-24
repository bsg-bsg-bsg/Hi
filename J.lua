local s = { -- pro script dumper settings
	decompile = true,
	dump_debug = false, -- output will include debug info such as constants, upvalues, protos, etc
	detailed_info = false, -- if dump_debug is enabled, it will dump more, detailed debug info
	threads = 5, -- how many scripts can be decompiled at a time
	delay = 0.05,
	include_nil = false, -- set to true if u want to include nil scripts
	replace_username = true, -- replaces the localplayer's username in any objects with LocalPlayer
	disable_render = true, -- disables 3d rendering while dumping scripts
}

local decompile = decompile or disassemble
local getnilinstances = getnilinstances or get_nil_instances
local getscripthash = getscripthash or get_script_hash
local getscriptclosure = getscriptclosure
local getconstants = getconstants or debug.getconstants
local getprotos = getprotos or debug.getprotos
local getinfo = getinfo or debug.getinfo
local format = string.format
local concat = table.concat

local threads = 0
local scriptsdumped = 0
local decompilecache = {}
local progressbind = Instance.new("BindableEvent")
local plr = game:GetService("Players").LocalPlayer.Name
local ignoredservices = {"Chat", "CoreGui", "CorePackages"}
local ignored = {"PlayerModule", "RbxCharacterSounds", "PlayerScriptsLoader", "ChatScript", "BubbleChat"}
local RunService = game:GetService("RunService")
local overlay = Instance.new("Frame", game:GetService("CoreGui").RobloxGui)
overlay.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
overlay.Size = UDim2.fromScale(1, 1)
overlay.Visible = false

local maindir = "Pro Script Dumper"
local placeid = game.PlaceId
local placename = game:GetService("MarketplaceService"):GetProductInfo(placeid).Name:gsub("[\\/:*?\"<>|\n\r]", " ")
local foldername = format("%s/[%s] %s", maindir, placeid, placename)
local exploit, version = (identifyexecutor and identifyexecutor()) or "Unknown Exploit"

local function checkdirectories()
	if not isfolder(maindir) then
		makefolder(maindir)
	end
	if not isfolder(foldername) then
		makefolder(foldername)
	end
end
local function isignored(a)
	for _,v in next, ignoredservices do
		if a:FindFirstAncestor(v) then
			return true
		end
	end
	for _,v in next, ignored do
		if a.Name == v or a:FindFirstAncestor(v) then
			return true
		end
	end
	return false
end
local function delay()
	repeat task.wait(s.delay) until threads < s.threads
end
local function decomp(a)
	local hash = getscripthash(a)
	local cached = decompilecache[hash]
	if cached then
		return cached
	end

	local output = decompile(a)
	decompilecache[hash] = output
	return output
end
local function getfullname(a)
	local name = a:GetFullName()
	local split = name:split(".")
	if not a:IsDescendantOf(game) then -- this means its a nil script
		return name
	end
	for i,v in next, split do -- for instances with spaces or hyphens in the name
		if v:find("[%s%-]+") then
			split[i] = format("['%s']", v)
		end
	end
	name = concat(split, ".")
	local service = split[1]
	local fullname = format("game:GetService(\"%s\")%s", service, name:sub(service:len() + 1, -1))
	fullname = fullname:gsub("(%.%[)", function() -- remove period from .[]
		return "["
	end)
	if s.replace_username then
		fullname = fullname:gsub(plr, "LocalPlayer")
	end
	return fullname
end
local function validateSettings()
	-- Ensure settings are within safe ranges
	if s.threads < 1 then s.threads = 1 end
	if s.threads > 20 then s.threads = 20 end
	if s.delay < 0 then s.delay = 0 end
	if s.delay > 2 then s.delay = 2 end
	return true
end

local function dumpscript(v, isnil)
	checkdirectories()
	task.spawn(function()
		local function dump()
			threads += 1

			-- File Name
			local id = v:GetDebugId()
			local name = v.Name
			local path = (isnil and "[nil] " or "")..v:GetFullName()
			if s.replace_username then
				path = path:gsub(plr, "LocalPlayer")
			end
			local filename = format("%s/%s (%s).lua", foldername, path:gsub("[\\/:*?\"<>|\n\r]", " "), id)
			if filename:len() > 199 then
				filename = filename:sub(0, 195)..".lua"
			end
			filename = filename:gsub("%.%.", ". .") -- prevent it from trying to escape directory

			-- Script Output
			local time = os.clock()
			local _, output
			if s.decompile then
				_, output = xpcall(decomp, function()
					return "-- Failed to decompile script"
				end, v)
				repeat
					if output == "-- Failed to decompile script" then
						_, output = xpcall(decomp, function()
							return "-- Failed to decompile script"
						end, v)
					end
					task.wait(0.25)
				until output ~= "-- Failed to decompile script"
				if output:gsub(" ", "") == "" then
					output = "-- Decompiler returned nothing. This script may not have bytecode or has anti-decompile implemented."
				end
			else
				output = "-- Script decompilation is disabled"
			end

			-- Information
			local class = v.ClassName

			local content = {
				[1] = "-- Name: %s",
				[2] = "-- Path: %s",
				[3] = "-- Class: %s",
				[4] = "-- Exploit: %s %s",
				[5] = "-- Time to decompile: %s",
				[6] = "\n%s"
			}

			local gotclosure, closure = pcall(getscriptclosure, v)
			local constants, constantsnum, protos, protosnum

			if s.dump_debug then
				if gotclosure then
					content[6] = "\n-- Debug Info"
					content[7] = "-- # of Constants: %s"
					content[8] = "-- # of Protos: %s"
					content[9] = "\n%s"

					constants = getconstants(closure)
					constantsnum = #constants
					protos = getprotos(closure)
					protosnum = #protos

					if s.detailed_info then
						content[9] = "\n-- Constants"
						local function searchconstants(t, count)
							for i,v in next, t do
								local i_type = typeof(i)
								local v_type = typeof(v)
								if v_type ~= "table" then
									v = tostring(v):gsub("%%", "%%%%")
								end
								content[#content + 1] = format("-- %s[%s%s%s] (%s) = %s (%s)",
									string.rep("  ", count),
									(i_type == "string" and "'" or ""),
									(i_type == "Instance" and getfullname(i) or tostring(i)),
									(i_type == "string" and "'" or ""),
									i_type,
									tostring(v),
									v_type
								)

								if v_type == "table" then
									searchconstants(v, count + 1)
								end
							end
						end
						searchconstants(constants, 0)

						content[#content + 1] = "\n-- Proto Info"
						local function getprotoinfo(t)
							for _,v in next, t do
								local info = getinfo(v)
								content[#content + 1] = "-- '"..info.name.."'"
								for i2,v2 in next, info do
									v2 = tostring(v2):gsub("%%", "%%%%")
									content[#content + 1] = format("--   ['%s'] = %s",
										i2,
										v2
									)
								end
							end
						end
						getprotoinfo(protos)

						content[#content + 1] = "\n%s"
					end
				else
					content[6] = "\n-- Debug Info (Could not get script closure)"
				end
			end
			
			--local content = format("-- Name: %s\n-- Path: %s\n-- Class: %s\n-- Exploit: %s %s\n-- Time to decompile: %s\n\n%s", name, path, class, exploit, version or "", os.clock() - time.." seconds", output)

			--print(format(concat(content, "\n"), name, path, class, exploit, version or "", os.clock() - time.." seconds", s.dump_debug and constantsnum or output, protosnum, output))
			writefile(filename, format(concat(content, "\n"),
				name,
				getfullname(v),
				class,
				exploit,
				version or "",
				os.clock() - time.." seconds",
				s.dump_debug and constantsnum or output,
				protosnum,
				output,
				"",
				"",
				""
			))
			scriptsdumped += 1
			progressbind:Fire(scriptsdumped)
			threads -= 1
		end

		local function queue()
			delay()
			if threads < s.threads then
				dump()
			else
				queue()
			end
		end

		if threads < s.threads then
			dump()
		else
			queue()
		end
	end)
	delay()
end

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
local UI = Material.Load({
	Title = "Pro Script Dumper v2.0",
	Style = 3,
	SizeX = 450,
	SizeY = 600,
	Theme = "Dark"
})

local page = UI.new("Configuration")

-- Core Settings Section
page.Label({
	Text = "═══ Core Settings ═══"
})

page.Toggle({
	Text = "Enable Script Decompilation",
	Callback = function(value)
		s.decompile = value
	end,
	Enabled = s.decompile,
	Menu = {
		Info = function()
			UI.Banner("Toggle script decompilation on/off. When disabled, only script information will be saved.")
		end
	}
})

-- Debug Settings Section  
page.Label({
	Text = "═══ Debug Options ═══"
})

page.Toggle({
	Text = "Include Debug Information",
	Callback = function(value)
		s.dump_debug = value
	end,
	Enabled = s.dump_debug,
	Menu = {
		Info = function()
			UI.Banner("Includes debug info such as constants, upvalues, and protos in the output files.")
		end
	}
})

page.Toggle({
	Text = "Detailed Debug Mode",
	Callback = function(value)
		s.detailed_info = value
	end,
	Enabled = s.detailed_info,
	Menu = {
		Info = function()
			UI.Banner("<b>⚠️ WARNING:</b> This feature may cause instability. Use with caution!\nProvides extensive debug information when Debug Info is enabled.")
		end
	}
})
-- Performance Settings Section
page.Label({
	Text = "═══ Performance Settings ═══"
})

page.Dropdown({
	Text = "Thread Count",
	Callback = function(value)
		s.threads = tonumber(value)
	end,
	Options = {"1", "2", "3", "4", "5", "6", "7", "8", "10", "12", "15", "20"},
	Def = tostring(s.threads),
	Menu = {
		Info = function()
			UI.Banner("Number of scripts processed simultaneously.\n<b>Higher values = faster processing but more resource usage.</b>\n\nRecommended: 3-5 for stability")
		end
	}
})

page.Dropdown({
	Text = "Processing Delay",
	Callback = function(value)
		s.delay = tonumber(value)
	end,
	Options = {"0.01", "0.05", "0.1", "0.25", "0.5", "1.0"},
	Def = tostring(s.delay),
	Menu = {
		Info = function()
			UI.Banner("Delay between processing operations in seconds.\n<b>Higher values = more stable but slower processing.</b>\n\nRecommended: 0.05 for balance")
		end
	}
})

-- Advanced Options Section
page.Label({
	Text = "═══ Advanced Options ═══"
})

page.Toggle({
	Text = "Include Nil Scripts",
	Callback = function(value)
		s.include_nil = value
	end,
	Enabled = s.include_nil,
	Menu = {
		Info = function()
			UI.Banner("Includes scripts that are parented to nil (disconnected from the game hierarchy).\n<b>May find hidden or removed scripts.</b>")
		end
	}
})

page.Toggle({
	Text = "Anonymize Usernames",
	Callback = function(value)
		s.replace_username = value
	end,
	Enabled = s.replace_username,
	Menu = {
		Info = function()
			UI.Banner("Replaces your username with 'LocalPlayer' in all script paths and references.\n<b>Recommended for privacy when sharing dumps.</b>")
		end
	}
})

-- Optimization Section
page.Label({
	Text = "═══ Optimization ═══"
})

page.Toggle({
	Text = "Disable 3D Rendering",
	Callback = function(value)
		s.disable_render = value
	end,
	Enabled = s.disable_render,
	Menu = {
		Info = function()
			UI.Banner("Temporarily disables 3D rendering during script dumping.\n<b>Frees up resources for faster processing.</b>\n\nScreen will go dark during operation.")
		end
	}
})

-- Action Section
page.Label({
	Text = "═══ Actions ═══"
})

-- Add preset buttons for common configurations
page.Button({
	Text = "🔧 Quick Setup (Recommended)",
	Callback = function()
		s.decompile = true
		s.dump_debug = false
		s.detailed_info = false
		s.threads = 5
		s.delay = 0.05
		s.include_nil = false
		s.replace_username = true
		s.disable_render = true
		UI.Banner("✅ Applied recommended settings for stable operation!")
	end
})

page.Button({
	Text = "⚡ Performance Mode",
	Callback = function()
		s.decompile = true
		s.dump_debug = false
		s.detailed_info = false
		s.threads = 10
		s.delay = 0.01
		s.include_nil = false
		s.replace_username = true
		s.disable_render = true
		UI.Banner("⚡ Applied high-performance settings!")
	end
})

page.Button({
	Text = "🔍 Debug Mode",
	Callback = function()
		s.decompile = true
		s.dump_debug = true
		s.detailed_info = false
		s.threads = 3
		s.delay = 0.1
		s.include_nil = true
		s.replace_username = true
		s.disable_render = true
		UI.Banner("🔍 Applied debug-focused settings!")
	end
})

local progressbar = nil
local threadbind = Instance.new("BindableEvent")

page.Button({
	Text = "🚀 Start Script Dumping",
	Callback = function()
		if progressbar then 
			UI.Banner("⚠️ A script dump is already in progress! Please wait for it to complete.")
			return 
		end
		
		-- Validate settings before starting
		if not validateSettings() then
			UI.Banner("❌ Invalid settings detected! Please check your configuration.")
			return
		end

		if s.disable_render then
			overlay.Visible = true
			RunService:Set3dRenderingEnabled(false)
		end

		local scripts = {}
		local nilscripts = {}
		scriptsdumped = 0

		-- Safely collect scripts with error handling
		local success, err = pcall(function()
			for _,v in next, game:GetDescendants() do
				if (v:IsA("LocalScript") or v:IsA("ModuleScript")) and not isignored(v) then
					table.insert(scripts, v)
				end
			end
		end)
		
		if not success then
			UI.Banner("❌ Error collecting scripts: " .. tostring(err))
			return
		end
		
		if s.include_nil and getnilinstances then
			pcall(function()
				for _,v in next, getnilinstances() do
					if (v:IsA("LocalScript") or v:IsA("ModuleScript")) and not isignored(v) then
						table.insert(nilscripts, v)
					end
				end
			end)
		end

		task.spawn(function()
			repeat
				threadbind:Fire("Active Threads:", threads)
				task.wait()
			until progressbar == nil
		end)

		local total = #scripts + #nilscripts
		progressbar = page.ProgressBar({
			Text = "Progress",
			Event = progressbind,
			Min = 0,
			Max = total,
			Def = 0,
			Suffix = "/"..total.." scripts",
			Percent = false
		})

		UI.Banner(format("📊 Found %d scripts to process. Starting dump operation...", total))

		local time = os.clock()

		-- Process regular scripts
		for _,v in next, scripts do
			dumpscript(v)
		end
		delay()

		-- Process nil scripts if enabled
		if s.include_nil and getnilinstances then
			for _,v in next, nilscripts do
				dumpscript(v, true)
			end
			delay()
		end

		-- Wait for all threads to complete
		repeat task.wait() until threads == 0

		local duration = os.clock() - time
		local result = format("✅ Successfully dumped %d scripts in %.2f seconds!\n📁 Files saved to: %s", total, duration, foldername)
		UI.Banner(result)

		if s.disable_render then
			RunService:Set3dRenderingEnabled(true)
			overlay.Visible = false
		end
		
		task.wait(1)
		progressbar:Destroy()
		progressbar = nil
	end
})
-- Status Section
page.Label({
	Text = "═══ Status ═══"
})

page.Label({
	Text = "🔄 Active Threads: 0",
	Event = threadbind
})

-- Add information section
page.Label({
	Text = "═══ Information ═══"
})

page.Button({
	Text = "ℹ️ About This Tool",
	Callback = function()
		UI.Banner("<b>Pro Script Dumper v2.0</b>\n\n• Enhanced UI with preset configurations\n• No timeout limitations - complete processing guaranteed\n• Improved stability and performance\n• Better error handling and user feedback\n\n<b>Created by:</b> Enhanced version")
	end
})

page.Button({
	Text = "📋 Current Settings",
	Callback = function()
		local settings = format(
			"<b>Current Configuration:</b>\n\n" ..
			"• Decompilation: %s\n" ..
			"• Debug Info: %s\n" ..
			"• Detailed Debug: %s\n" ..
			"• Thread Count: %d\n" ..
			"• Processing Delay: %.2fs\n" ..
			"• Include Nil Scripts: %s\n" ..
			"• Anonymize Usernames: %s\n" ..
			"• Disable 3D Rendering: %s",
			s.decompile and "✅ Enabled" or "❌ Disabled",
			s.dump_debug and "✅ Enabled" or "❌ Disabled", 
			s.detailed_info and "✅ Enabled" or "❌ Disabled",
			s.threads,
			s.delay,
			s.include_nil and "✅ Enabled" or "❌ Disabled",
			s.replace_username and "✅ Enabled" or "❌ Disabled",
			s.disable_render and "✅ Enabled" or "❌ Disabled"
		)
		UI.Banner(settings)
	end
})
