return {
	"rcarriga/nvim-dap-ui",
	config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>', { desc = "Toggle breakpoint" })
    keymap.set("n", "<Leader>dx", ':DapTerminate<CR>', { desc = "Terminate debugger" })
    keymap.set("n", "<Leader>do", ':DapStepOver<CR>', { desc = "Step over" })
  end,
}
