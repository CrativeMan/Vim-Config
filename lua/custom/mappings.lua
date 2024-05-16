local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  }
}

vim.api.nvim_command('command! UpperConsole split | resize 10 | terminal')
vim.api.nvim_command('command! RelLine lua vim.opt.relativenumber = true')
vim.api.nvim_command('command! RelLineOff lua vim.opt.relativenumber = false')

return M
