vim.opt.termguicolors = true
vim.g.mapleader = " "
-- Enable syn tax highlighting
vim.cmd("syntax enable")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd('let $BASH_ENV = "$HOME/.bash_aliases"')
-- vim.cmd("set shell=/bin/bash\\ -i")

-- Enable break indent
vim.opt.breakindent = true
vim.opt.sidescrolloff = 8

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Map ESC to jk
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Clear highlight on ESC
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR><ESC>", { noremap = true, silent = true })

-- Switch between buffers
vim.api.nvim_set_keymap("n", "gb", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gB", ":bprevious<CR>", { noremap = true, silent = true })

vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "100" -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
-- vim.opt.ttimeoutlen = 0                            -- Key code timeout (Weird behaviour!)
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/machakann/vim-sandwich" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/zbirenbaum/copilot-cmp" },
	{ src = "https://github.com/ckunte/typst-snippets-vim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "markdown", "typst" },
	modules = { "python" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
require("filetype")
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
	},
})
vim.api.nvim_exec([[autocmd FileType foam setlocal commentstring=//\ %s]], false)

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	-- suggestion = {
	--   auto_trigger = true,
	-- },
})

require("copilot_cmp").setup()
require("nvim-autopairs").setup()
-- require('typstar').setup({ -- depending on your neovim plugin system
-- your typstar config goes here
-- })
-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
--require("ultinips").setup()

-- require("luasnip").setup({
--   enable_autosnippets = true,
--   store_selection_keys = "<Tab>"
-- })
local ls = require("luasnip")
-- Detect if running on WSL
local function is_wsl()
	local uname = vim.loop.os_uname().release
	return uname:match("Microsoft") or uname:match("WSL")
end

-- Conditionally define dependencies_bin
local dependencies_bin = {}
if not is_wsl() then
	dependencies_bin["websocat"] = "/home/johan/.cargo/bin/websocat"
end

local open_cmd = ""
if is_wsl() then
	open_cmd = "/mnt/c/Program\\ Files/Mozilla\\ Firefox/firefox.exe --new-window %s 2>/dev/null"
else
	open_cmd = "firefox --new-window %s 2>/dev/null"
end

require("typst-preview").setup({
	dependencies_bin = dependencies_bin,
	-- debug = true,
	open_cmd = open_cmd,
})

-- require("luasnip.loaders.from_lua").load({ paths = "~/dotfiles/nvim/.config/nvim/snippets/typst/" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
vim.keymap.set("i", "<C-e>", function()
	ls.expand_or_jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function()
	ls.jump(-1)
end, { silent = true })

local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

			-- For `mini.snippets` users:
			-- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
			-- insert({ body = args.body }) -- Insert at cursor
			-- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
			-- require("cmp.config").set_onetime({ sources = {} })
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "copilot" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})

vim.cmd("colorscheme catppuccin")

vim.lsp.enable({ "tinymist", "lua_ls" })

-- require "lspconfig".lua_ls.setup()

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig")["tinymist"].setup({

	-- settings = {
	--   formatterMode = "typstyle",
	-- },
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>tpm", function()
			client:exec_cmd({
				title = "pin",
				command = "tinymist.pinMain",
				arguments = { vim.api.nvim_buf_get_name(0) },
			}, { bufnr = bufnr })
		end, { desc = "[T]inymist [P]in", noremap = true })

		vim.keymap.set("n", "<leader>tum", function()
			client:exec_cmd({
				title = "unpin",
				command = "tinymist.pinMain",
				arguments = { vim.v.null },
			}, { bufnr = bufnr })
		end, { desc = "[T]inymist [U]npin", noremap = true })
	end,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		typst = { "typstyle" },
	},
})
require("conform").formatters.typstyle = {
	append_args = { "--wrap-text" },
	-- The base args are { "-filename", "$FILENAME" } so the final args will be
	-- { "-filename", "$FILENAME", "-i", "2" }
}

vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Go to definition
-- vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>fm", require("conform").format)

-- Shortcut for sourcing nvim config:
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Source nvim config" })
vim.keymap.set("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", { noremap = true })

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.deprecate = function() end

-- NOTE CREATION
vim.api.nvim_create_user_command("Note", function(opts)
	local notes_dir = "~/notes/"
	local name = opts.args
	if name == "" then
		vim.api.nvim_err_writeln("Please provide a note name")
		return
	end
  ending = ".typ"
	vim.cmd("edit " .. notes_dir .. name .. ending)
end, {
	nargs = "?",
	complete = function(_, _, _)
		local files = vim.fn.globpath(vim.fn.expand("~/notes"), "*.typ", false, true)
		local names = {}
		for _, f in ipairs(files) do
			local base = vim.fn.fnamemodify(f, ":t:r") -- take basename, drop extension
			table.insert(names, base)
		end
		return names
	end,
})

-- NOTE SYNC (with timestamped commit)
vim.api.nvim_create_user_command("NoteSync", function()
	local function run(cmd)
		local result = vim.fn.system(cmd)
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_err_writeln("Error running: " .. cmd .. "\n" .. result)
			return false
		end
		return true
	end

	local repo = "~/notes"
	local timestamp = os.date("%Y-%m-%d %H:%M:%S")
	local msg = string.format("'Auto-sync: %s'", timestamp)

	if not run("git -C " .. repo .. " pull --quiet") then
		return
	end
	if not run("git -C " .. repo .. " add .") then
		return
	end
	run("git -C " .. repo .. " commit -m " .. msg .. " --quiet")
	if not run("git -C " .. repo .. " push --quiet") then
		return
	end

	print("Notes synced ✅")
end, {})

-- NOTE IMAGE FIX
vim.api.nvim_create_user_command("NoteImg", function()
	local buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local updated = false
	local notes_dir = vim.fn.expand("~/notes/images")
	vim.fn.mkdir(notes_dir, "p")

	for i, line in ipairs(lines) do
		for path in line:gmatch('image%(%s*"(.-)"') do
			-- skip already-correct ones
			if not path:match("^/images/") then
				local abs_path = vim.fn.expand(path)
				if vim.fn.filereadable(abs_path) == 1 then
					local date = os.date("%Y%m%d")
					local subdir = notes_dir .. "/" .. date
					vim.fn.mkdir(subdir, "p")

					-- old name:
					-- local old_image_file_name = abs_path:match("^.+/(.+)$")
					-- old name, but without file ending:
					local old_image_file_name = abs_path:match("^.+/(.+)%.%w+$") or "image"

					local ext = abs_path:match("^.+(%..+)$") or ""
					local new_name = string.format("%s_%s%s", old_image_file_name, os.date("%H%M%S"), ext)
					local new_path = subdir .. "/" .. new_name

					vim.fn.system({ "cp", abs_path, new_path })

					local rel_path = "/images/" .. date .. "/" .. new_name
					line = line:gsub(vim.pesc(path), rel_path, 1)
					updated = true
				end
			end
		end
		lines[i] = line
	end

	if updated then
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		print("Image paths updated ✅")
	else
		print("No image paths updated")
	end
end, {})

-- NOTE WEEKLY
vim.api.nvim_create_user_command("NoteWeekly", function()
	local notes_dir = vim.fn.expand("~/notes")
	local weekly_dir = notes_dir .. "/weekly"
	vim.fn.mkdir(weekly_dir, "p")

	-- get current ISO week number + year
	local week = os.date("!%G-W%V") -- e.g. 2025-W35

	-- get monday of this week (ISO)
	local now = os.time()
	local weekday = tonumber(os.date("!%u", now)) -- 1=Mon..7=Sun
	local monday = now - (weekday - 1) * 24 * 3600
	local sunday = monday + 6 * 24 * 3600

	local start_str = os.date("!%d.%m.%Y", monday)
	local end_str = os.date("!%d.%m.%Y", sunday)

	local filename = weekly_dir .. "/" .. week .. ".typ"

	require("typst-preview").setup({
		-- other options...
		get_root = function(path_of_main_file)
			local notes_root = os.getenv("HOME") .. "/notes"
			local filepath = vim.fn.fnamemodify(path_of_main_file, ":p")

			-- check if file is inside ~/notes
			if filepath:sub(1, #notes_root) == notes_root then
				print(notes_root)
				return notes_root
			end

			-- fallback to file's directory
			return vim.fn.fnamemodify(path_of_main_file, ":p:h")
		end,

		get_main_file = function(path_of_buffer)
			return path_of_buffer
		end,
	})

	if vim.fn.filereadable(filename) == 0 then
		local lines = {
			'#import "../templates/weekly.typ": weekly',
			"#show: weekly.with(",
			"  title: [Weekly Notes: " .. week .. "],",
			"  span: [" .. start_str .. " - " .. end_str .. "],",
			")",
			"",
		}
		vim.fn.writefile(lines, filename)
	end

	vim.cmd("edit " .. filename)
end, {})

-- require 'typst-preview'.setup {
--   -- other options...
--   get_root = function(path_of_main_file)
--     local notes_root = os.getenv("HOME") .. "/notes"
--     local filepath = vim.fn.fnamemodify(path_of_main_file, ":p")
--
--     -- check if file is inside ~/notes
--     if filepath:sub(1, #notes_root) == notes_root then
--       print(notes_root)
--       return notes_root
--     end
--
--     -- fallback to file's directory
--     return vim.fn.fnamemodify(path_of_main_file, ':p:h')
--   end,
--
--   get_main_file = function(path_of_buffer)
--     return path_of_buffer
--   end,
-- }

-- KEYMAPS
vim.keymap.set("n", "<leader>nn", ":Note ", { desc = "New note" })
vim.keymap.set("n", "<leader>ns", ":NoteSync<CR>", { desc = "Sync notes" })
vim.keymap.set("n", "<leader>ni", ":NoteImg<CR>", { desc = "Fix note images" })
vim.keymap.set("n", "<leader>nw", ":NoteWeekly<CR>", { desc = "Fix note images" })
vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { desc = "Fix note images" })
vim.keymap.set("n", "<leader>cp", ":Copilot attach<CR>", { desc = "Fix note images" })

-- Reload LuaSnip:
vim.keymap.set(
	"n",
	"<leader>sl",
	":lua require('luasnip.loaders.from_vscode').load({ paths = {'~/.config/nvim/snippets/'} })<CR>",
	{ desc = "Reload LuaSnip" }
)

-- Git keymaps

require("gitsigns").setup({

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
		map("n", "<leader>hd", gs.diffthis, { desc = "Git diff this" })
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>htd", gs.toggle_deleted, { desc = "Toggle deleted" })

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
