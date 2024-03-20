return {
	{ "folke/neodev.nvim", opts = {}, config = true },
	-- LSP config helper
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
		lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
	-- LSP installation manager
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
	{ 
		"williamboman/mason-lspconfig.nvim"
	},
	-- LSP config
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

			lsp_zero.set_sign_icons({
				error = '✘',
				warn = '▲',
				hint = '⚑',
				info = '»'
			})

      require('mason-lspconfig').setup({
				automatic_installation = true,
				ensure_installed = {
					'rust_analyzer',
					'lua_ls',
					'tsserver',
					'astro',
					'html',
					'jedi_language_server',
					'biome',
					'cssls',
					'tailwindcss',
					'taplo',
					'vuels',
					'yamlls',
					'marksman',
					'sqlls',
				},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
					tsserver = function ()
						require('lspconfig').tsserver.setup({
							root_dir = function()
								return lsp_zero.dir.find_first({'tsconfig.json', 'package.json'})
							end,
							single_file_support = true
						})
					end
        }
      })
    end
  }

}
