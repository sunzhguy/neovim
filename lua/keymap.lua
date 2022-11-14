--cancel s default function

--leader key 为空
vim.g.mapleader = " "

-- local map
local map = vim.api.nvim_set_keymap
local opt = {
  noremap =true,
  silent = true,
}



-- $ 跳到行尾不带空格(swap the g_ with $)
map("v", "$", "g_", opt);
--map("v", "g_", "$", opt);
map("n", "$", "g_", opt);
--map("n", "g_", "$", opt);


--命令行下 Ctrl +j/k  上一个/下一个

map("c", "<C-j>", "<C-n>", {noremap = false})
map("c", "<c-k>", "<C-p>", {noremap = false})


map("n", "<C-s>", ":w<CR>", opt)
map("n", "<C-wq>", "wqa!<CR>", opt)

--fix :set wrap

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})

--上下滚动浏览
map("n", "<S-j>", "5j", opt)
map("n", "<S-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

--ctrl +u /ctrl +d 只移动9行， 默认移动半屏
map("n", "C-u>", "10k", opt)
map("n", "C-d>", "10j", opt)



-- magic search
map("n", "/", "/\\v", {noremap = true, silent = false})
map("v", "/", "/\\v", {noremap = true, silent = false})


--visual 模式代码缩进
map("v", "<", "<gv", opt);
map("v", ">", ">gv", opt);

--上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv",opt)
map("v", "K", ":move '<-3<CR>gv-gv",opt)

--退出
map("n", "qq", ":q!<CR>", opt)
--map("n", "<C-q>", ":qa!<CR>", opt)


--insert 模式 ，跳到行首/尾
map("n", "c", "", opt)
map("i", "<C-h>", "<Left>", opt);
map("i", "<C-l>", "<Right>", opt);

map("i", "<C-j>", "<Up>", opt);
map("i", "<C-k>", "<Down>", opt);



------------------------------------------
--window 分屏幕快捷键
------------------------------------------
--取消s 默认
map("n", "s", "", opt);
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

--关闭当前
--map("n", "sc", "<C-w>c", opt)

--关闭其他
map("n", "so", "<C-w>o", opt)

--<leader> +hjkl 窗口之间跳转
map("n", "<C-w>", "<C-w>c", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-l>", "<C-w>l", opt)


--左右比例控制
map("n", "<A-Left>", ":vertical resize -2 <CR>", opt)
map("n", "<A-Right>", ":vertical resize +2 <CR>", opt)
map("n", "<A-h>", ":vertical resize -10<CR>", opt)
map("n", "<A-l>", ":vertical resize +10<CR>", opt)

--上下比例控制
map("n", "su", ":resize +10<CR>", opt)
map("n", "sd", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2 <CR>", opt)
map("n", "<C-Up>", ":resize -2 <CR>", opt)

--相等比例
map("n", "s=", "<C-w>=", opt)



--Teminal 相关
--map("n", "st", ":sp | terminal<CR>  | <i>", opt)
--map("n", "stv", ":vsp |terminal<CR>", opt)


--Esc 回Nomal Mode
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h> ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j> ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k> ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l> ]], opt)
--map("t", "<C-\\>", "<C-\\> :hide", opt)

map("t", "<leader>h", [[ <C-\><C-N><C-w>h> ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j> ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k> ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l> ]], opt)
-------------------------插件快捷键-----------------

local pluginKeys = {}
--nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  --{ key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  --{ key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  --{ key = "n", action = "tabnew" },
  -- 进入下一级
  --{ key = { "]" }, action = "cd" },
  -- 进入上一级
  --{ key = { "[" }, action = "dir_up" },
  { key = "s", action = "" },
}

-----------------------buffer line------------------
--left -right tab
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)

--关闭
--moll/vim-bbyte"
map("n", "sc", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
--https://dxsm.github.io/books/vimL/z/20170816_3.html

map("n", "<F2>", ":set list! list?<CR>", opt)
map("n", "<F3>", ":set expandtab! expandtab?<CR>", opt)

--Telescope
--查找文件
map("n", "<C-gf>", ":Telescope git_files<CR>", opt);
map("n", "<C-gf>", ":Telescope find_files<CR>", opt);
---全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt);

--当前文件搜索
map("n", "<S-f>", ":Telescope current_buffer_fuzzy_find<CR>", opt)




-- lsp 回调函数快捷键设置

pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  mapbuf("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opt)
  mapbuf("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
--  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gH", "<cmd>Lspsaga hover_doc<CR>", opt)
  --[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
  --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  --mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  -- diagnostic
  --mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end



--Telescope 列表 插入模式快捷键
pluginKeys.telescopeList = {
i = {
  -- 上下移动
  ["<C-j>"] = "move_selection_next",
  ["<C-k>"] = "move_selection_previous",
  ["<Down>"] = "move_selection_next",
  ["<UP>"] = "move_selection_previous",

  --历史记录
  ["<C-n>"] = "cycle_history_next",
  ["<C-p>"] = "cycle_history_prev",

  --关闭窗口
  ["<C-c>"] = "close",
  --预览窗口上下移动
  ["<C-u>"] = "preview_scrolling_up",
  ["<C-d>"] = "preview_scrolling_down",
},
}

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  --vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
  vim.keymap.set({ "n", "t" }, "<C-\\>", toggleterm.toggleB)
  vim.keymap.set({ "n", "t" }, "<F5>", toggleterm.toggleC)
  --vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end




return pluginKeys;
