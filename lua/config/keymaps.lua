-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

map({ "i" }, "jk", "<Esc>")
map("n", "<leader>h", "<cmd>:noh<cr>", { desc = "No highlight" })
map("n", "<C-f>", "5j", { noremap = true, silent = true })
map("n", "<C-b>", "5k", { noremap = true, silent = true })
map("v", "<C-c>", '"+y') -- 让neovim中C-c可以复制内容到剪贴板
map("n", "<leader>rn", ":IncRename ") -- 让neovim中C-c可以复制内容到剪贴板
-- 禁用部分lazyvim默认快捷键
map({ "n", "v" }, "J", "<Nop>")
map({ "v" }, "U", "<Nop>")
map({ "v" }, "u", "<Nop>")

-- for hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader leader w
map({ "n", "v" }, "<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any begining of words" })
-- leader leader e
map({ "n", "v" }, "<leader><leader>e", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any end of words" })
-- leader leader b
map({ "n", "v" }, "<leader><leader>b", function()
  -- hop.hint_words({ direction = directions.BEFORE_CURSOR })
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any begining of words" })
-- leader leader v
map({ "n", "v" }, "<leader><leader>v", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any end of words" })
-- leader leader l
map({ "n", "v" }, "<leader><leader>l", function()
  hop.hint_camel_case({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any begining of words" })
-- leader leader h
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any begining of words" })
-- leader leader j
map({ "n", "v" }, "<leader><leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader leader k
map({ "n", "v" }, "<leader><leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })

if not vim.g.vscode then
  -- 以下命令在vscode中容易导致崩溃
  -- for csvview.lua
  map("n", "<leader>csv", "<cmd>CsvViewToggle<cr>", { desc = "CsvViewToggle" })
  -- close buffer
  unmap("n", "<leader>l", { desc = "Lazy" })
  map("n", "<leader>ll", function()
    require("mini.bufremove").delete(0, true)
  end, { desc = "Close current buffer" })
  -- 移动 buffer
  local moveBy = function(dir)
    if dir == "left" then
      dir = -1
    else
      dir = 1
    end
    local moveBy = vim.v.count
    if moveBy == 0 then
      moveBy = 1
    end
    local myBufferline = require("bufferline")
    for _ = 1, moveBy, 1 do
      myBufferline.move(dir)
    end
  end
  vim.keymap.set("n", "<b", function()
    moveBy("left")
  end, { desc = "Move current buffer to left" })
  vim.keymap.set("n", ">b", function()
    moveBy("right")
  end, { desc = "Move current buffer to right" })
else
  -- vscode中的配置
  -- 取消这些映射，尽量保证vscode-neovim不会崩
  unmap("n", "<leader>K", { desc = "Keywordprg" })
  unmap("n", "<leader>l", { desc = "Lazy" })
  unmap("n", "<leader>L", { desc = "LazyVim Changelog" })
  unmap("n", "<leader>n", { desc = "Notification History" })
  unmap("n", "<leader>.", { desc = "Toggle Scratch Buffer" })
  unmap("n", "<leader>`", { desc = "Switch to Other Buffer" })
  -- 常规快捷键，尽量与nvim本身保持一致，但是使用vscode的方式
  vim.api.nvim_exec2("nmap j gj", { output = false })
  vim.api.nvim_exec2("nmap k gk", { output = false })
  map(
    "n",
    "<leader>qq",
    "<Cmd>lua require('vscode').call('workbench.action.closeWindow')<CR>",
    { desc = "Quit VSCode" }
  )
  map(
    "n",
    "<leader>ll",
    "<Cmd>lua require('vscode').call('workbench.action.closeEditorInAllGroups')<CR>",
    { desc = "Close Current Tab" }
  )
  map("n", "u", "<Cmd>lua require('vscode').call('undo')<CR>", { desc = "Undo" })
  map("n", "<C-r>", "<Cmd>lua require('vscode').call('redo')<CR>", { desc = "Redo" })
  -- 开关vscode中的侧栏
  map(
    "n",
    "<leader>e",
    "<Cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>",
    { desc = "toggleSidebarVisibility" }
  )
  map(
    "n",
    "<leader>a",
    "<Cmd>lua require('vscode').call('workbench.action.toggleActivityBarVisibility')<CR>",
    { desc = "toggleActivityBarVisibility" }
  )
  -- vscode中markdown文档的预览
  map(
    "n",
    "<C-k><C-v>",
    "<Cmd>lua require('vscode').call('markdown-preview-enhanced.openPreviewToTheSide')<CR>",
    { desc = "openPreviewToTheSide" }
  )
  -- vscode中使用vscode的格式化程序
  -- map("n", "<leader>cf", "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR><CR>", { desc = "Format" })
  -- map("v", "<leader>cf", "<Cmd>lua require('vscode').call('editor.action.formatSelection')<CR><CR>", { desc = "Format" })
end

-- neovide中的配置
if vim.g.neovide then
  -- 让neovide中C-c可以复制内容到剪贴板
  map("v", "<C-c>", '"+y')
  -- 让neovide中C-S-v可以粘贴剪贴板内容
  map({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<C-S-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })
end
