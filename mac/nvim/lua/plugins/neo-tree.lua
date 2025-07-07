return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    })
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({ toggle = true, position = "right" })
    end, { desc = "open file tree" })
    vim.keymap.set("n", "<leader>fe", ":Neotree buffers reveal float<CR>", { desc = "open floating file tree" })
  end,
}
