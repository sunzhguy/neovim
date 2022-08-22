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
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
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
map("n", "sc", "<C-w>c", opt)

--关闭其他
map("n", "so", "<C-w>o", opt)

--<leader> +hjkl 窗口之间跳转
map("n", "<C-w>", "", opt)
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
map("n", "st", ":sp | terminal<CR>  | <i>", opt)
map("n", "stv", ":vsp |terminal<CR>", opt)


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
local plugin_kes = {}

--nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)

-----------------------buffer line------------------
--left -right tab
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)

--关闭
--moll/vim-bbyte"
map("n", "<C-c>", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
--https://dxsm.github.io/books/vimL/z/20170816_3.html

map("n", "<F2>", ":set list! list?<CR>", opt)


--Telescope
--查找文件
map("n", "<C-f>", ":Telescope find_file<CR>", opt);
---全局搜索
map("n", "<C-F>", ":Telescope live_grep<CR>", opt);

local pluginKeys = {};
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
return pluginKeys;

