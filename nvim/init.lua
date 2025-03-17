require("config.keymaps")
require("config.lazy")
require("config.dap")


local vimrc = vim.fn.stdpath("config") .. "/nvimrc.vim"
vim.cmd.source(vimrc)
