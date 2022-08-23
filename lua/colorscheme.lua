--vim.o.background = "light"
--vim.g.tokyonight_style = "storm" -- day/night

--vim.g.tokyonight_terminal_colors = true


--半透明
--vim.g.tokyonight_transparent = true
--vim.g.tokyonight_transparent_sidebar = true
--
--local colorscheme = "vscode" 
--local colorscheme = "zellner" 
--local colorscheme = "tokyonight" 
local colorscheme = "onenord" 
--tokyonight
--OceanicNext
--gruvbox
--zephyr
----nord
--onedark
--nightfox
--[[
local colorscheme = "tokyonight" 
--tokyonight
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
--]]

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. "未找到!")
  return
end
--vim.g.tokyonight_style = "day"
--vim.g.tokyonigt_trnsparent_background = 1
require('onenord').setup({
  theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
return colorscheme;
