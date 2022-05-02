
local function run()
    vim.cmd("!arduino-cli upload --fqbn arduino:avr:uno -p /dev/ttyACM0")
end

local function build()
    vim.cmd("!arduino-cli compile --fqbn arduino:avr:uno")
end

vim.keymap.set('n', "<leader>gr", run, {noremap=true, buffer=0})
vim.keymap.set('n', "<leader>gb", build, {noremap=true, buffer=0})

