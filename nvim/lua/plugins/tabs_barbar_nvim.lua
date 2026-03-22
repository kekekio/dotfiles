-- plugins/tabs_bufferline.lua
vim.opt.termguicolors = true

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup{
        options = {
          numbers = "ordinal",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          indicator = { style = "underline" },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 30,
          max_prefix_length = 15,
          tab_size = 21,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "slant",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          offsets = {
            {
              filetype = "neo-tree",
              text = "Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          custom_filter = function(buf_number, buf_numbers)
            return true
          end,
          sort_by = 'id',
        },
        highlights = {
          fill = {
            guifg = {attribute='fg', highlight='Normal'},
            guibg = {attribute='bg', highlight='StatusLine'},
          },
          background = {
            guifg = {attribute='fg', highlight='Comment'},
            guibg = {attribute='bg', highlight='StatusLine'},
          },
          buffer_selected = {
            guifg = {attribute='fg', highlight='Normal'},
            guibg = {attribute='bg', highlight='Normal'},
            gui = "bold",
          },
        }
      }

      -- Горячие клавиши
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      for i = 1, 9 do
        map('n', string.format('<A-%d>', i), string.format('<Cmd>BufferGoto %d<CR>', i), opts)
      end
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
    end
  }
}
