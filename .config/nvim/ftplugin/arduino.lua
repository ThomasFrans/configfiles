SetFiletypeKeymaps({
    run_current_buffer = function() vim.cmd("!arduino-cli upload --fqbn arduino:avr:uno -p /dev/ttyACM0") end,
    build_project = function() vim.cmd("!arduino-cli compile --fqbn arduino:avr:uno") end,
})
