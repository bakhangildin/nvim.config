return {
  "nvim-telescope/telescope.nvim",
  commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7",
  dependencies = {
    { "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" },
    { "kkharji/sqlite.lua",    commit = "50092d60feb242602d7578398c6eb53b4a8ffe7b" },
  },
  config = function()
    local data = assert(vim.fn.stdpath "data") --[[@as string]]

    require("telescope").setup {
      defaults = {
        preview = {
          treesitter = false,
        },
      },
      extensions = {
        wrap_results = true,
        fzf = {},
        history = {
          path = data .. "telescope_history.sqlite3",
          limit = 100,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "smart_history")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>sf", function()
      if not pcall(builtin.git_files) then
        builtin.find_files()
      end
    end)
    vim.keymap.set("n", "<leader>sa", builtin.find_files)
    vim.keymap.set("n", "<leader>sh", builtin.help_tags)
    vim.keymap.set("n", "<leader>sg", builtin.live_grep)
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
    vim.keymap.set("n", "<leader>sw", builtin.grep_string)
  end,
}
