-- return {
--   "stevearc/conform.nvim",
--   config = function()
--     require("conform").setup({
--       formatters_by_ft = {
--         lua = { "stylua" },
--         -- Use a sub-list to run only the first available formatter
--         javascript = { { "prettier", "prettierd" } },
--       },
--       format_on_save = {
--         -- These options will be passed to conform.format()
--         timeout_ms = 500,
--         lsp_fallback = true,
--       },
--       filetype = {
--         typescript = {
--           command = "prettier --stdin-filepath ${INPUT}",
--         },
--         typescriptreact = {
--           command = "prettier --stdin-filepath ${INPUT}",
--         },
--       },
--     })
--   end,
-- }
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
