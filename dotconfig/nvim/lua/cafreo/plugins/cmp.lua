return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline",
		"chrisgrieser/cmp-nerdfont",
		"Jezda1337/nvim-html-css",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			snippet = { -- configure how nvim-cmp interacts with snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		performance = {
			debounce = 500,
		},

		mapping = cmp.mapping.preset.insert({
			--["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			--["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			--["<C-b>"] = cmp.mapping.scroll_docs(-4),
			--["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
			["<Esc>"] = cmp.mapping.abort(), -- close completion window
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		-- sources for autocompletion
		sources = cmp.config.sources({
			{ name = "nvim_lsp", max_item_count = 4 },
			{ name = "luasnip", max_item_count = 4 }, -- snippets
			{ name = "buffer", max_item_count = 4 }, -- text within current buffer
			{ name = "path", max_item_count = 4 }, -- file system paths
--			{ name = "cmdline", max_item_count = 4 },
			{ name = "nerdfont", max_item_count = 4 },
			{ name = "html-css", max_item_count = 4 },
		}),
		-- configure lspkind for vs-code like pictograms in completion menu
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",

				format = function(entry, vim_item)
					if entry.source.name == "html-css" then
						vim_item.menu = entry.completion_item.menu
					end
					return vim_item
				end
			}),
		},


	})
end,
}
