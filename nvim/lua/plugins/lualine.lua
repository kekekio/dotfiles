return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons'
  },
  opts = {},
  config = function(_, opts)
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          {
            'filename',
            color = function()
              if vim.bo.modified then
                return { fg = '#ffffff', bg = '#ff5f5f', gui = 'bold' }
              else
                return { fg = '#ffffff', bg = '#000000' }
              end
            end,
            symbols = {
              modified = ' [+]',      -- текст для изменённого файла
              readonly = ' [RO]',     -- текст для readonly-файла
              unnamed = '[No Name]',  -- если файл без имени
              newfile = '[New]',      -- если новый файл
            },
          },
        },
        lualine_c = {'branch', 'diff', 'diagnostics'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
