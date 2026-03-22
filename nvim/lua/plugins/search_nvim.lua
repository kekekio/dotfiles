return {
  "FabianWirth/search.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    require("search").setup({
      initial_tab = 1,
      mappings = {
        next = "<Tab>",
        prev = "<S-Tab>",
      },
      tabs = {
        {
          name = "Files",
          tele_func = function(opts)
            opts = opts or {}
            if vim.fn.isdirectory(".git") == 1 then
              builtin.git_files(opts)
            else
              builtin.find_files(opts)
            end
          end,
        },
        {
          name = "Grep",
          tele_func = builtin.live_grep,
        },
        {
          name = "Git Files",
          tele_func = builtin.git_files,
        },
      },
      collections = {
        git = {
          initial_tab = 1,
          tabs = {
            { name = "Branches", tele_func = builtin.git_branches },
            { name = "Commits", tele_func = builtin.git_commits },
            { name = "Stashes", tele_func = builtin.git_stash },
          },
        },
      },
    })

    -- горячая клавиша <leader>-f для поиска с возможностью указать путь
    vim.api.nvim_create_user_command("SearchHere", function()
      local path = vim.fn.input("Search in directory: ", vim.fn.getcwd() .. "/", "dir")
      if path == "" then
        path = vim.fn.getcwd()
      end
      require("search").open({
        tab_name = "Files",
        tele_opts = {
          cwd = path,
        }
      })
    end, { nargs = "?" })

    -- поиска с git root
    vim.api.nvim_create_user_command("KioFind", function()
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      local search_path
      if git_root == nil or git_root == "" then
        search_path = vim.fn.getcwd()
      else
        search_path = git_root
      end

      require("search").open({
        tab_name = "Files",
        tele_opts = {
          cwd = search_path,
        }
      })
    end, { nargs = 0 })
  end,
}
