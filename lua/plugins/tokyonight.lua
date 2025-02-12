if vim.g.neovide then
  return {} -- 如果是 Neovide，则不加载该插件
end

return {
  "tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  }
}
