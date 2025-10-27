return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = { "lua_ls", "ltex", "clangd", "black", "isort", "ruff" },
			})
		end,
	},
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function()
	-- 		require("mason-lspconfig").setup()
	-- 	end,
	-- },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local on_attach = function(client, bufnr)
			-- 	if client.name == "ruff_lsp" then
			-- 		-- Disable hover in favor of Pyright
			-- 		client.server_capabilities.hoverProvider = false
			-- 	end
			-- end
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				filetypes = { "lua" },
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})

			lspconfig.ltex.setup({
				capabilities = capabilities,
				filetypes = { "tex" },
			})
<<<<<<< HEAD
      lspconfig.ltex.setup({
        capabilities = capabilities,
        filetypes = { "tex" },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = { "c", "cpp", "C", "H" },
      })
=======
			lspconfig.ruff.setup({
        on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "python" },
				init_options = {
					settings = {
						-- Any extra CLI arguments for `ruff` go here.
						args = {},
					},
				},
			})

>>>>>>> 410f5e0de9a24cf1810b7665d3786969a9c2ab55
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = ev.buf, desc = "Go to implementation" }
					)

					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "Code actions" }
					)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>fm", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = ev.buf, desc = "Format buffer" })
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		config = function()
			--require('toggle-lsp-diagnostics').init()
			require("toggle_lsp_diagnostics").init(vim.diagnostic.config())
			require("toggle_lsp_diagnostics").init({ start_on = false })
			vim.keymap.set("n", "<leader>td", ":ToggleDiag<CR>")
		end,
	},
}
