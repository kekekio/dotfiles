return {
  "nvimdev/indentmini.nvim",
  config = function()
    require('indentmini').setup()
    -- require('indentmini').setup({
    --   char = '|',
    --   exclude = {
    --     'erlang',
    --     'markdown',
    --   }
    -- })
    -- use comment color
    vim.cmd.highlight('default link IndentLine Comment')
  end,
}

