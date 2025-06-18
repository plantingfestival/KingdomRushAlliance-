﻿-- chunkname: @./lib/klua/log.lua

local dgetinfo = debug.getinfo
local strformat = string.format
local noNames = {
	INFO_LEVEL = true,
	ERROR_LEVEL = true,
	DEBUG_LEVEL = true,
	debug = true,
	TODO_LEVEL = true,
	paranoid = true,
	WARNING_LEVEL = true,
	PARANOID_LEVEL = true,
	warning = true,
	error = true,
	OFF_LEVEL = true,
	new = true,
	info = true,
	todo = true
}
local klog = {
	WARNING_LEVEL = 2,
	ERROR_LEVEL = 1,
	DEBUG_LEVEL = 4,
	TODO_LEVEL = 1,
	INFO_LEVEL = 3,
	OFF_LEVEL = 0,
	PARANOID_LEVEL = 5
}

klog.__index = klog
klog.level = klog.ERROR_LEVEL
klog.default_level_by_name = {}
klog.last_log_msgs = {}
klog.last_log_count = 10

local function log(print_fn, logname, level, fmt, ...)
	local func_info = dgetinfo(3, "n")
	local func_name = func_info.name or "-"
	local time = love and love.timer.getTime() or os.clock()
	local user_str = strformat(fmt or "", ...)
	local out = strformat("[%.4f] %s.%s %s() - %s\n", time, logname, level, func_name, user_str)

	if level == "ERROR   " then
		table.insert(klog.last_log_msgs, 1, out)

		if #klog.last_log_msgs > klog.last_log_count then
			table.remove(klog.last_log_msgs)
		end
	end

	if print_fn then
		print_fn(out)
	else
		io.write(out)

		if io.output() == io.stdout then
			io.flush()
		end
	end
end

function klog.new(parentlog, name, newlevel)
	local newlog = setmetatable({}, parentlog)

	parentlog.__index = parentlog

	if parentlog then
		if parentlog.default_level_by_name and parentlog.default_level_by_name[name] then
			newlog.level = parentlog.default_level_by_name[name]
		else
			newlog.level = newlevel and newlevel or parentlog.level
		end

		newlog.print_fn = parentlog.print_fn
	else
		newlog.level = newlevel and newlevel or klog.level
	end

	if type(name) == "string" then
		assert(not noNames[name], "Can't use name " .. name .. " for a klogger. It's reserved!")

		newlog.name = name
		klog[name] = newlog
	end

	function newlog.paranoid(fmt, ...)
		if newlog.level >= klog.PARANOID_LEVEL then
			log(newlog.print_fn, newlog.name, "PARANOID", fmt, ...)
		end
	end

	function newlog.debug(fmt, ...)
		if newlog.level >= klog.DEBUG_LEVEL then
			log(newlog.print_fn, newlog.name, "DEBUG   ", fmt, ...)
		end
	end

	function newlog.info(fmt, ...)
		if newlog.level >= klog.INFO_LEVEL then
			log(newlog.print_fn, newlog.name, "INFO    ", fmt, ...)
		end
	end

	function newlog.warning(fmt, ...)
		if newlog.level >= klog.WARNING_LEVEL then
			log(newlog.print_fn, newlog.name, "WARNING ", fmt, ...)
		end
	end

	function newlog.error(fmt, ...)
		if newlog.level >= klog.ERROR_LEVEL then
			log(newlog.print_fn, newlog.name, "ERROR   ", fmt, ...)
		end
	end

	function newlog.todo(fmt, ...)
		if newlog.level >= klog.TODO_LEVEL then
			log(newlog.print_fn, newlog.name, "TODO   ", fmt, ...)
		end
	end

	function newlog.assert(check, fmt, ...)
		if check then
			return
		end

		if newlog.level >= klog.DEBUG_LEVEL then
			assert(check, string.format(fmt, ...))
		else
			log(newlog.print_fn, newlog.name, "ASSERT   ", fmt, ...)
		end
	end

	function newlog.traceall(msg)
		msg = msg or ""

		log(newlog.print_fn, newlog.name, "TRACEBACK  ", "\n%s", debug.traceback(msg, 2))
	end

	function newlog.trace(depth)
		if newlog.level >= klog.DEBUG_LEVEL then
			local level = 1
			local o = ""

			while true do
				local info = debug.getinfo(level, "Sln")

				if not info or depth and depth < level then
					break
				end

				if info.what == "C" then
					o = o .. string.format("    %2i - C function \n", level)
				else
					o = o .. string.format("    %2i - [%s]:%d at %s: %s\n", level, info.short_src, info.currentline, info.namewhat, info.name)
				end

				level = level + 1
			end

			log(newlog.print_fn, newlog.name, "TRACE   ", "\n%s", o)
		end
	end

	return newlog
end

return klog:new("root")
