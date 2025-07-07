return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "find file" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "file grep" })
      require("telescope").setup({
        pickers = {
          find_files = {
            find_command = {
              "fd",
              "--type",
              "f",
              "--color=never",
              "--hidden",
              "--follow",
              "-E",
              ".git/*",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
