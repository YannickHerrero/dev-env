return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set(
        "n",
        "<leader>gp",
        ":Gitsigns preview_hunk<CR>",
        { noremap = true, silent = true, desc = "Preview Hunk" }
      )
      vim.keymap.set(
        "n",
        "<leader>gb",
        ":Gitsigns toggle_current_line_blame<CR>",
        { noremap = true, silent = true, desc = "Toggle burrent line blame" }
      )
    end,
  },
}
