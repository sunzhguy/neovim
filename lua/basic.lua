print('hellow orld');

--utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
--jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff=8

-- 使用相对行号
vim.wo.number =true
vim.wo.relativenumber = false


--高亮显示所在的行
vim.wo.cursorline = true

--显示左侧图标指示列
vim.wo.signcolumn = "yes"

--右侧参考线，超过表示代码过长，考虑换行
vim.wo.colorcolumn = "80"

--缩进4个空格等于一个table
vim.o.tabstop = 4
--vim.bo.tabstop = 4
vim.o.softtabstop = 4
--vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
--vim.bo.shiftwidth = 4

--空格代替tab
vim.o.expandtab = false
--vim.bo.expandtab = false

--新行对其当前行
vim.o.autoindent = true
--vim.bo.autoindent = true
--vim.o.smartindent = true

--搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true 
vim.o.smartcase = true


--搜索不要高亮
vim.o.hlsearch = false

--边输入边搜索
vim.o.incsearch = true

--命令行高为2, 提供足够的显示空间
--vim.o.cmdheight = 2

-- 当文件被外部程序修改时候，自动加载
vim.o.autoread = true
vim.bo.autoread = true


--禁止折行
vim.wo.wrap =false

--光标在行首尾时候<left> <right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'

--允许隐藏被修改过的buffer
vim.o.hidden = true

--鼠标支持
--vim.o.mouse = "a"

--禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300

--设置timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

--自动补全
vim.g.completeopt = "menu,menuone,noslect,noinsert"

--样式

--vim.o.background = "light"
--vim.o.background = "storm"


--vim.o.termguicolors = true
--vim.opt.termguicolos = true

-- 不可见字符的显示，这里只能把空格显示为一个点

--vim.o.list = true
--vim.o.listchars = "space:."


--补全增强

vim.o.wildmenu =true

--Dont' pass messages to |ins-completin menu'

vim.o.shortmess = vim.o.shortmess .. "c"

--补全最多显示10行
vim.o.pumheightg = 10

--永远显示tabline
vim.o.showtableline = 2

--使用增强转贷插件后不不需要vim 的模式显示
vim.o.showmode = false
vim.o.listchars = "trail:•,tab:├─,space:·,eol:⏎"
