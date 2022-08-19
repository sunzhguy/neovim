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

local status, lua_line = pcall(require, "lualine")
if not status then
  vim.notify("没有找到 lualine")
  return 
end

lua_line.setup({
  options = {
    theme = "zellner",
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



