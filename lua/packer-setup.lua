local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return print("Packer Error")
end

--install plugins
return packer.startup(function(use)

	--TabNine
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

		-- Syntax Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
use 'nvim-treesitter/nvim-treesitter-context'
	-- Auto Closing
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- GitSigns
	use("lewis6991/gitsigns.nvim")

	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.dashboard")
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	--Colorizer
	use("norcalli/nvim-colorizer.lua")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
