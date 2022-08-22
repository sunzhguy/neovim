local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return 
end


nvim_tree.setup({
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
   theme = "vscode",
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
    --theme = "vscode",
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


