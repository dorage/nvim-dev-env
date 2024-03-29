return {
	{
		"Exafunction/codeium.nvim",
		event = "BufEnter",
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "VonHeikemen/lsp-zero.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "l3mon4d3/luasnip" },      -- snippet
			{ "saadparwaiz1/cmp_luasnip" }, -- snippet
			{ "onsails/lspkind.nvim" },  -- vscode style compeletion
			{ "Exafunction/codeium.nvim" }, -- ai autocompletion
		},
		config = function()
			local cmp = require("cmp")
			local lsp_zero = require("lsp-zero")
			local luasnip = require("luasnip")
			local cmp_action = lsp_zero.cmp_action()
			local lspkind = require("lspkind")

			local winhighlight = {
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			}

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "codeium" },
					{ name = "mkdnflow" },
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For 'luasnip' users
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- Enable "Super Tab"
					-- ["<Tab>"] = cmp_action.luasnip_supertab(),
					-- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						elseif cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- ["<C-y>"] = cmp.mapping.confirm({ select = false }),
					-- ["<C-e>"] = cmp.mapping.abort(),
					-- ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
					-- ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ["<Esc>"] = cmp.mapping.abort(),
				}),
				window = {
					completion = cmp.config.window.bordered(winhighlight),
					documentation = cmp.config.window.bordered(winhighlight),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						symbol_map = {
							Codeium = "🤖",
							Snippet = "✨",
						},
					}),
				},
			})
		end,
	},
}
