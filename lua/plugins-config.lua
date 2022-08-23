local status, nvim_tree = pcall(require, "nvim-tree") if not status then
  vim.notify("没有找到 nvim-tree")
  return 
end
-- 列表操作快捷键
local list_keys = require('keymap').nvimTreeList
nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open', -- mac 直接设置为 open
    },
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

--[[
--nvim_tree.setup({
sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = true,
      list = list_keys,
      },
      relativenumber = false,
      --show icon
      signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  system_open = {
    cmd = "open",
  }
})
--]]

--local status, nvim_web = pcall(require, "nvim-web-devicons")
--if not status then
--  vim.notify("没有找到 nvim-web-devicons")
--  return 
--end

--nvim_web.setup({
--  override= {
--    zsh = {
--    icon = ' ',
--    color = "#428850",
--    cterm_color = "65",
--    name = "Zsh"
--  }
--}
--})



local status, buffer_line = pcall(require, "bufferline")
if not status then
 vim.notify("没有找到 bufferline")
 return 
end


buffer_line.setup({
 options = {
   theme = colorscheme,
    -- 关闭 Tab 命令 ，这里使用moll/vim-bbye 的：Bdelete 命令
   close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    --侧边栏配置
    --左侧让出nvim-tree 的位置显示文字File Explorer
    offsets = {
     {
       filetype = "NvimTreee",
      text = "File Explorer",
       hightlight = "Directory",
       text_align = "left",
     }, 
    },
  }
})

--buffer_line.setup({
--    options = {
--        buffer_close_icon = "",
--        close_command = "Bdelete %d",
--        close_icon = "",
--        indicator_icon = " ",
--        left_trunc_marker = "",
--        modified_icon = "●",
--        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
--        right_mouse_command = "Bdelete! %d",
--        right_trunc_marker = "",
--        show_close_icon = false,
--        show_tab_indicators = true,
--    },
--})

local status, lua_line = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return 
end

lua_line.setup({
  options = {
    theme = colorscheme, --"tokyonight",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
         symbols = {
           unix = '', -- e712
           dos = '', -- e70f
           mac = '', -- e711
         },
        --symbols = {
        --  unix = "LF",
        --  dos = "CRLF",
        --  mac = "CR",
        --},
      },
      "encoding",
      "filetype",
    },
  },
})

local color = require("vscode.colors")
local status, vscode = pcall(require, "vscode")
if not status then
  vim.notify("没有找到 vscode")
  return 
end

--[[
vscode.setup({
   -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    --[[group_overrides = {
         --this supports the same val table as vim.api.nvim_set_hl
         --use colors from this colorscheme by requiring vscode.colors!
         Cursor = { fg=color.vscDarkBlue, bg=color.vscLightGreen, bold=true },
    }

  })
  --]]

--before use :checkhealth telescope
local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 vscode")
  return 
end

telescope.setup({
  defaults = {
    --打开弹窗后进入的初始模式， 默认insert, 也可以是normal
    initial_mode = "insert",
    --vertgial, center , cursor
    layout_strategy = "horizontal",
    --窗口内快捷键
    mappings = require("keymap").telescopeList,
  },
  pickers = {
    find_files = {
      --theme = "dropdown", -- 可选参数: dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        --even more opts
      }),
    },
  },
  })

  pcall(telescope.load_extension, "env")
  pcall(telescope.load_extension, "ui-select")


local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 treesitter")
  return 
end


treesitter.setup({
  --安装language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_install = {"json", "html", "css", "vim", "lua", "javascript", "c", "c++"},
  --ensure_installed = "maintained"
  --
  --启用代码高亮模块
  highlight = {
     enable = true,
     additional_vim_regex_hightlighting = false,
  },
  --启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "CR",
      node_incremental = "CR",
      node_decremental = "BS",
      scope_incremental = "TAB",
    },
  },
  --启用代码缩进模块 (=)
  indent = {
    enable = true
  },
  --p00f/nvim-ts-rainbow
  rainbow = {
    enble = true,
    --disable +{"jsx", "cpp"} list of langurage you want to disable the plugin for
    extended_mode = true, --Also hightlight non-bracket delimiters like html tags, boolean or table:lang->boolean
    max_file_lines = nil, --Do not Eable for files with more than n lines int
    -- 
    --colors = {
    --  "#95ca60",
    --  "#ee6985",
    --  "#D6A760",
    --  "#7794F4",
    --  "#B38BF5",
    --  "#7CC7FE",
   --},
  }, --table of hex strings
    --termcolors = {} talble of colour name strings
})
--开启folding 模块
vim.opt .foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter #foldexpr()"
--默认不要折叠
--https://stackoveflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99


