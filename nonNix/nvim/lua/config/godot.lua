-- Code for setting up neovim with a godot project
local pipe = './godothost'

local function server_running()
	local serverlist = vim.fn.serverlist()
	for _, server in ipairs(serverlist) do
		if pipe == server then
			return true
		end
	end
	return false
end

function start_godot_server()
	-- Attempt to find the root directory of the godot project 
	-- (it must contain a project.godot file)
	local root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot' }, { upward = true })[1])
	-- No root directory found, we are not in a project, do not start the server
	if root_dir == nil then
		return
	end
	if server_running() then
		return
	end
	vim.fn.serverstart(pipe)
	print('started server: ' .. pipe)
end

-- Attempt to start Godot server
start_godot_server()
