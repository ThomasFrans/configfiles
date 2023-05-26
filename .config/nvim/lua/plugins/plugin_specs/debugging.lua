return {
    -- Debugging using DAP.
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                opts = {},
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local plugin_dap = require("dap")
            local plugin_dapui = require("dapui")

            vim.keymap.set("n", "<F5>", plugin_dap.continue, { silent = true })
            vim.keymap.set(
                "n",
                "<F10>",
                plugin_dap.step_over,
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<F11>",
                plugin_dap.step_into,
                { silent = true }
            )
            vim.keymap.set("n", "<F12>", plugin_dap.step_out, { silent = true })
            vim.keymap.set(
                "n",
                "<leader>b",
                plugin_dap.toggle_breakpoint,
                { silent = true }
            )
            vim.keymap.set("n", "<F6>", function()
                -- terminateDebuggee = false: Debugger shouldn't terminate process it's
                -- attached to when debugger closes.
                plugin_dap.terminate(nil, { terminateDebuggee = false })
                plugin_dapui.close()
            end, { silent = true })

            plugin_dap.listeners.after.event_initialized["dapui_config"] = function(
            )
                plugin_dapui.open()
            end
            plugin_dap.listeners.before.event_terminated["dapui_config"] = function(
            )
                plugin_dapui.close()
            end
            plugin_dap.listeners.before.event_exited["dapui_config"] = function(
            )
                plugin_dapui.close()
            end

            plugin_dap.adapters.php = {
                type = "executable",
                command = "node",
                args = {
                    "/home/thomas/.local/share/vscode-php-debug/out/phpDebug.js",
                },
            }

            plugin_dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                },
            }

            plugin_dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-vscode",
                name = "lldb",
            }

            plugin_dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = {},
                },
                {
                    -- If you get an "Operation not permitted" error using this, try disabling YAMA:
                    --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    name = "Attach",
                    type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                    args = {},
                },
            }

            plugin_dap.configurations.c = plugin_dap.configurations.cpp
            plugin_dap.configurations.rust = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Executable: ",
                            vim.fn.getcwd() .. "/target/debug/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = {},
                    initCommands = function()
                        -- Find out where to look for the pretty printer Python module
                        local rustc_sysroot =
                            vim.fn.trim(vim.fn.system("rustc --print sysroot"))

                        local script_import = "command script import \""
                            .. rustc_sysroot
                            .. "/lib/rustlib/etc/lldb_lookup.py\""
                        local commands_file = rustc_sysroot
                            .. "/lib/rustlib/etc/lldb_commands"

                        local commands = {}
                        local file = io.open(commands_file, "r")
                        if file then
                            for line in file:lines() do
                                table.insert(commands, line)
                            end
                            file:close()
                        end
                        table.insert(commands, 1, script_import)

                        return commands
                    end,
                },
                {
                    -- If you get an "Operation not permitted" error using this, try disabling YAMA:
                    --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    name = "Attach",
                    type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                    args = {},
                    initCommands = function()
                        -- Find out where to look for the pretty printer Python module
                        local rustc_sysroot =
                            vim.fn.trim(vim.fn.system("rustc --print sysroot"))

                        local script_import = "command script import \""
                            .. rustc_sysroot
                            .. "/lib/rustlib/etc/lldb_lookup.py\""
                        local commands_file = rustc_sysroot
                            .. "/lib/rustlib/etc/lldb_commands"

                        local commands = {}
                        local file = io.open(commands_file, "r")
                        if file then
                            for line in file:lines() do
                                table.insert(commands, line)
                            end
                            file:close()
                        end
                        table.insert(commands, 1, script_import)

                        return commands
                    end,
                },
            }
        end,
    },
}
