return {
    "mfussenegger/nvim-dap", -- i use gdb to c/c++ (manual installation)
    dependencies = {
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dt", function()
            dap.toggle_breakpoint()
        end)
        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end)
    end,
}
