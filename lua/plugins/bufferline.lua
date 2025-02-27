return {
  "akinsho/bufferline.nvim",
  vscode = false,
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = {" ", " "},
    },
    highlights = {
      buffer_selected = { italic = false, bold = true },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
