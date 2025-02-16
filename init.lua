-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.fn.executable('nu') == 1 then
    vim.o.shell = 'nu'
else
    vim.o.shell = 'zsh'
end
