--vim.o.background = "light"
--vim.g.tokyonight_style = "storm" -- day/night

--vim.g.tokyonight_terminal_colors = true


--半透明
--vim.g.tokyonight_transparent = true
--vim.g.tokyonight_transparent_sidebar = true
--
local colorscheme = "vscode" 
--local colorscheme = "zellner" 
--local colorscheme = "tokyonight" 
--tokyonight
--OceanicNext
--gruvbox
--zephyr
----nord
--onedark
--nightfox
local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. "未找到!")
  return
end
