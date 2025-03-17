return {
  "potamides/pantran.nvim", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  init = function()
  end,
  config = function()
    local opts = {noremap = true, silent = true, expr = true}
    vim.api.nvim_set_keymap("n", "<leader>tr", [[luaeval("require('pantran').motion_translate()")]], opts)
    vim.api.nvim_set_keymap("n", "<leader>trr", [[luaeval("require('pantran').motion_translate() .. '_'")]], opts)
    vim.api.nvim_set_keymap("x", "<leader>tr", [[luaeval("require('pantran').motion_translate()")]], opts)
  end,
}

