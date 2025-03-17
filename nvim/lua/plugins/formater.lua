return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  dependencies = { "zapling/mason-conform.nvim" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>=",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- Disable default format-on-save for buffer
    vim.b.disable_autoformat = true,
    vim.api.nvim_create_user_command("KioFormatOnSaveDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
    desc = "Disable autoformat-on-save",
    bang = true,
    })
  vim.api.nvim_create_user_command("KioFormatOnSaveEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })
  vim.api.nvim_create_user_command("FormatInfo", function()
    require("conform.health").show_window()
  end, { desc = "Show information about Conform formatters" })
  vim.api.nvim_create_user_command("FormatFile", function()
        require("conform").format({ async = true })
  end, { desc = "Do a formatting using Conform formatter. Keymap: <leader> =" })
  end,
}
