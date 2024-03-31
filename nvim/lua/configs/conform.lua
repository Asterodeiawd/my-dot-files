local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier", "rustywind" },
    python = { "ruff_fix", "ruff_format", "docformatter" },
    toml = { "taplo" },
    javascript = { "biome", "rustywind" },
    javascriptreact = { "biome", "rustywind" },
    typescript = { "biome", "rustywind" },
    typescriptreact = { "biome", "rustywind" },
    json = { "biome" },
    jsonc = { "biome" },
    rust = { "rustfmt" },
    shell = { "shfmt" },
    sql = { "sqlfmt" },
    markdown = { "prettier" },
    yaml = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
