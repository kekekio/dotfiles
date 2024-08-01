require("config.keymaps")
require("config.lazy")


local vimrc = vim.fn.stdpath("config") .. "/nvimrc.vim"
vim.cmd.source(vimrc)
