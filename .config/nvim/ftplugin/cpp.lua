local pwd = os.getenv("PWD")

-- Returns wether `file` is in the current working directory.
local function is_file_in_pwd(file)
    local f = io.open(file, 'r')
    if f ~= nil then
    	return true
    else
	return false
    end
end

-- Returns the last element in `path`
local function last_path_element(path)
    return path:match("[^/]*$")
end

if is_file_in_pwd(pwd .. "/" .. last_path_element(pwd) .. ".ino") then
    -- This is an arduino project with a main .ino file
    local function run()
	vim.cmd("!arduino-cli upload --fqbn arduino:avr:uno -p /dev/ttyACM0")
    end

    local function build()
	vim.cmd("!arduino-cli compile --fqbn arduino:avr:uno")
    end

    vim.keymap.set('n', "<leader>gr", run, {noremap=true, buffer=0})
    vim.keymap.set('n', "<leader>gb", build, {noremap=true, buffer=0})
else
    -- This is a regular cpp file, which can be compiled with Meson/CMake, or
    -- thrown in the trash, where it belongs...
end
