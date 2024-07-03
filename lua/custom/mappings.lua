local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug go last"
    },

  }
}

vim.api.nvim_command('command! UpperConsole split | resize 10 | terminal')
vim.api.nvim_command('command! RelLine lua vim.opt.relativenumber = true')
vim.api.nvim_command('command! RelLineOff lua vim.opt.relativenumber = false')
vim.api.nvim_command('command! ErrGo lua InsertGoErrSnippet()')

vim.opt.colorcolumn = "80"

function InsertGoErrSnippet()
  local lines = {
    "if err != nil {",
    "  log.Fatal(err)",
    "}"
  }

  -- Get the current buffer and cursor position
  local buf = vim.api.nvim_get_current_buf()
  local pos = vim.api.nvim_win_get_cursor(0)

  -- Insert the lines at the current cursor position
  vim.api.nvim_buf_set_lines(buf, pos[1], pos[1], false, lines)
end




return M
