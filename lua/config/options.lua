-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.autoformat = false
opt.clipboard = ""
opt.wrap = true
opt.relativenumber = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- 设置标签颜色
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.neovide_title_text_color = "#58913d"
  -- 其他设置
  vim.o.guifont = "JetBrainsMono Nerd Font:h12" -- neovide字体及其字体大小
  vim.g.neovide_scale_factor = 1.0 -- 界面字体缩放大小
  vim.g.neovide_floating_blur_amount_x = 2 -- 浮动窗口的模糊程度
  vim.g.neovide_floating_blur_amount_y = 2 -- 浮动窗口的模糊程度
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_transparency = 1  -- 透明程度，作用于整个窗口
  vim.g.neovide_normal_opacity = 1  -- 透明程度，仅影响普通文本背景
  vim.g.neovide_hide_mouse_when_typing = true  -- 打字时，隐藏鼠标
  vim.g.neovide_refresh_rate = 144  -- 刷新率
  vim.g.neovide_refresh_rate_idle = 5  -- 空闲刷新率
  vim.g.neovide_fullscreen = false  -- 全屏 end
  vim.g.neovide_profiler = false  -- 左上角会显示一个小的帧数图
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
