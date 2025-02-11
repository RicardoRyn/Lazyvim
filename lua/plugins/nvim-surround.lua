return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  vscode = true,
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- configuration here, or leave empty to use defaults
      })
    end
}
