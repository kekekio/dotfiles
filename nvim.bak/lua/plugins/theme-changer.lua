return {
  "vague2k/huez.nvim",
  -- if you want registry related features, uncomment this
  -- import = "huez-manager.import"
  branch = "stable",
  dependencies = { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
  event = "UIEnter",
  config = function()
    -- telescope (deps) setup
    require("telescope").setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    }
    -- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    -- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

    --HUEZ SETUP NOW

    require("huez").setup {
      path = vim.fs.normalize(vim.fn.stdpath "data" --[[@as string]]) .. "/huez",
      fallback = "default",
      suppress_messages = true,
      theme_config_module = nil,
      exclude = {
        "desert",
        -- "evening",
        -- "industry",
        -- "koehler",
        -- "morning",
        -- "murphy",
        -- "pablo",
        -- "peachpuff",
        -- "ron",
        -- "shine",
        -- "slate",
        -- "torte",
        -- "zellner",
        -- "blue",
        -- "darkblue",
        -- "delek",
        -- "quiet",
        -- "elflord",
        -- "habamax",
        -- "lunaperche",
        -- "zaibatsu",
        -- "wildcharm",
        -- "sorbet",
        -- "vim",
      },
      background = "dark",
      picker = {
        themes = {
          layout = "right",
          opts = {},
        },
        favorites = {
          layout = "right",
          opts = {},
        },
        live = {
          layout = "right",
          opts = {},
        },
        ensured = {
          layout = "right",
          opts = {},
        },
      },
    }
    local builtin = require "telescope.builtin"

    --[[ I've found actions from keymaps:
    local pickers = require("huez.pickers")
    vim.keymap.set("n", "<leader>co", pickers.themes, {})
    vim.keymap.set("n", "<leader>cof", pickers.favorites, {})
    vim.keymap.set("n", "<leader>col", pickers.live, {})
    vim.keymap.set("n", "<leader>coe", pickers.ensured, {}) ]]
    local pickers = require "huez.pickers"
    vim.api.nvim_create_user_command(
      "KioColorScheme",
      --from vim.keymap.set("n", "<leader>co", pickers.themes, {})
      pickers.themes,
      { desc = "Open installed theemes menu. Keymap: None" }
    )
    vim.api.nvim_create_user_command(
      "KioColorSchemeInstall",
      --from vim.keymap.set("n", "<leader>col", pickers.live, {})
      pickers.live,
      { desc = "Open all theemes menu. Keymap: None" }
    )
  end,
}
