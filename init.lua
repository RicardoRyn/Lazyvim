-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if not vim.g.vscode then
  vim.cmd.colorscheme("catppuccin")
end
