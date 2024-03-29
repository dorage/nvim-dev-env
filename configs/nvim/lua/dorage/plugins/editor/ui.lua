return {
	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	-- tabline plugin
	{
		"https://github.com/romgrk/barbar.nvim",
		config = function()
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Move to previous/next
			map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
			map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
			-- Re-order to previous/next
			map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
			map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
			-- Goto buffer in position...
			map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
			map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
			map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
			map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
			map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
			map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
			map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
			map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
			map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
			map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
			-- Pin/unpin buffer
			map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
			-- Close buffer
			map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
			-- Wipeout buffer
			--                 :BufferWipeout
			-- Close commands
			--                 :BufferCloseAllButCurrent
			--                 :BufferCloseAllButPinned
			--                 :BufferCloseAllButCurrentOrPinned
			--                 :BufferCloseBuffersLeft
			--                 :BufferCloseBuffersRight
			-- Magic buffer-picking mode
			-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
			-- Sort automatically by...
			-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
			-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
			-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
			-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

			-- Other:
			-- :BarbarEnable - enables barbar (enabled by default)
			-- :BarbarDisable - very bad command, should never be used
		end,
	},
	-- file tree explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- nvim-tree setup
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- optionally enable 24-bit colour
			vim.opt.termguicolors = true

			local nvim_tree = require("nvim-tree")
			nvim_tree.setup({
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					relativenumber = true,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					-- dotfiles = true,
				},
				actions = {
					change_dir = {
						enable = false,
						global = false,
						restrict_above_cwd = false,
					},
				},
			})
			vim.cmd([[
					:hi      NvimTreeExecFile    guifg=#ffa0a0
					:hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
					:hi      NvimTreeSymlink     guifg=Yellow  gui=italic
					:hi link NvimTreeImageFile   Title
			]])

			vim.keymap.set("n", "<leader>ab", "<Cmd>:NvimTreeToggle<CR>", { silent = true })
		end,
	},
	-- floating terminal
	{
		"https://github.com/voldikss/vim-floaterm",
		config = function()
			vim.keymap.set("n", "<leader>ag", "<Cmd>:FloatermNew lazygit<CR>")
		end,
	},
}
