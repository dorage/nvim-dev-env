return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"python",
				"regex",
				"rust",
				"sql",
			},
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
			},
			sync_install = true,
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "C-space",
					scope_incremental = false,
					node_decremental = "<bs>",
				}
			},
		})
	end
}