local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装packer.nvim, 请稍等...")
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  rtp_addition = vim.fn.stdpath("data").."/site/pack/*/start/*"
  print(rtp_addition)
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Packer.nvim 安装完毕")
  vim.notify(vim.o.runtimepath)
end

--use a protected call so we do not error out on fist use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    --Packer 可以升级自己
    use("wbthomason/packer.nvim")

    --nvim-tree
    use({"kyazdani42/nvim-tree.lua", requires ="kyazdani42/nvim-web-devicons"})

    -- bufferline 顶部标签显示 
    use({"akinsho/bufferline.nvim", requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}})
    -- lualine  底部标签显示
    use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"} })
    use("arkav/lualine-lsp-progress")
	use("rmehri01/onenord.nvim")
  
    -- vscode 主题添加
    use("Mofiqul/vscode.nvim")
	-- tokyonight.nvim
	use("folke/tokyonight.nvim")

    --telescope 模糊搜索快速打开文件
    use{"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"} }
    --treesitter
    use{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	
	-------------------------------LSP----------------------------
    use("williamboman/nvim-lsp-installer")
	--Lspconfig
	use({"neovim/nvim-lspconfig"})
	--cmp nvim lsp
	use("hrsh7th/cmp-nvim-lsp")
	use("b0o/schemastore.nvim")
    --lua dev
	use("folke/lua-dev.nvim")
	--nvim-cmp-- 补全引擎
    use("hrsh7th/nvim-cmp")
  if packer_bootstrap  then
    packer.sync()
  end
end,

config = {
    --锁定插件版本在snapshots 目录
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"),
    "snapshots"),
    --这里锁定插件版本在V1, 不会继续更新插件
    --snapshot = "v1",
    --最大并发数
    max_jobs = 16,
    --自定义源
    git = {
      --default_url_format = "https://hub.fastgit.xyz/%s",
      --default_url_format = "https://mirror.ghproxy.com/https://github.com%s",
      --default_url_format = "https://gitcode.net/mirrors/%s/",
      --default_url_format = "https://gitclone.com/github.com/%s,
    },
    display = {
    --使用浮动窗口显示
      open_fn = function()
        return require("packer.util").float({ border = "single"})
    end
   },
  },

})

