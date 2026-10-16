vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Enable break indent
vim.opt.breakindent = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

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
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration

-- Behavior settings
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
-- Fuzzy pickers (fzf-lua; files and grep use ripgrep). Keys follow kickstart.nvim/LazyVim.
local fzf = function(picker, opts)
	return function()
		require("fzf-lua")[picker](opts)
	end
end
vim.keymap.set("n", "<leader>ff", fzf("files"), { desc = "Find files (recursive)" })
vim.keymap.set("n", "<leader>sf", fzf("files"), { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", fzf("live_grep"), { desc = "[S]earch by [G]rep (ripgrep)" })
vim.keymap.set("n", "<leader><leader>", fzf("buffers"), { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>fb", fzf("buffers"), { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>/", fzf("blines"), { desc = "Fuzzy search in current buffer" })
vim.keymap.set("n", "<leader>s/", fzf("lines"), { desc = "[S]earch in open buffers" })

-- LaTeX (vimtex): latexmk with SyncTeX, PDF in zathura. \ll compiles continuously,
-- \lv jumps the PDF to the cursor, Ctrl+click in zathura jumps back to the source.
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
	options = { "-shell-escape", "-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode" },
}
-- Full zathura support needs xdotool (sudo apt install xdotool); the simple variant works without
vim.g.vimtex_view_method = vim.fn.executable("xdotool") == 1 and "zathura" or "zathura_simple"
-- bin/ has zathura/xdotool wrappers that open the PDF on the display you're typing on (desk or laptop)
vim.env.PATH = vim.fn.stdpath("config") .. "/bin:" .. vim.env.PATH

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
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
	{ src = "https://github.com/ckunte/typst-snippets-vim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/lervag/vimtex" },
})

-- Treesitter (main branch): parsers are built with the tree-sitter CLI (>= 0.26.1) and a C
-- compiler; skip installing on machines without the CLI (highlighting falls back to regex)
-- (pcall: a machine still on the old master branch has no install(); run vim.pack.update() there)
local ts_ok, ts = pcall(require, "nvim-treesitter")
if ts_ok and ts.install and vim.fn.executable("tree-sitter") == 1 then
	ts.install({
		"bash", "bibtex", "c", "cmake", "cpp", "csv", "diff", "foam", "fortran", "gitcommit",
		"gitignore", "json", "lua", "make", "markdown", "python", "ssh_config", "toml", "typst",
		"vim", "vimdoc",
	})
end
-- Highlighting: start treesitter for any filetype with a parser, except big files (> 100 KB)
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
		if stats and stats.size > 100 * 1024 then
			return
		end
		pcall(vim.treesitter.start, args.buf)
	end,
})
require("filetype")
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"harper_ls",
		"tinymist",
		"texlab",
		"ltex-ls-plus",
		"clangd",
		"clang-format",
		"fortls",
		"fortitude",
		"fprettify",
		"findent",
	},
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "foam",
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

require("nvim-autopairs").setup()
local ls = require("luasnip")
-- Detect if running on WSL
local function is_wsl()
	local uname = vim.uv.os_uname().release
	return uname:match("Microsoft") or uname:match("WSL")
end

-- Conditionally define dependencies_bin
local dependencies_bin = {}
-- Use Mason's tinymist for preview too, so LSP and preview share one version
local mason_tinymist = vim.fn.stdpath("data") .. "/mason/bin/tinymist"
if vim.fn.executable(mason_tinymist) == 1 then
	dependencies_bin["tinymist"] = mason_tinymist
end
if not is_wsl() then
	local websocat = vim.fn.expand("~/.cargo/bin/websocat")
	if vim.fn.executable(websocat) == 1 then
		dependencies_bin["websocat"] = websocat
	end
end

local open_cmd = ""
if is_wsl() then
	open_cmd = "/mnt/c/Program\\ Files/Mozilla\\ Firefox/firefox.exe --new-window %s 2>/dev/null"
else
	-- Separate Firefox instance (own profile + WM class) so GNOME shows it as its own app,
	-- matched by ~/.local/share/applications/firefox_firefox.typst-preview.desktop (StartupWMClass=TypstPreview;
	-- GNOME only matches snap windows to launchers whose ID starts with "firefox_firefox.")
	open_cmd = "firefox --profile ~/snap/firefox/common/typst-preview-profile"
		.. " --class TypstPreview --name TypstPreview --new-window %s 2>/dev/null"
end

require("typst-preview").setup({
	dependencies_bin = dependencies_bin,
	-- debug = true,
	open_cmd = open_cmd,
	-- Fixed port so it can be forwarded over SSH (the plugin tries port + 1 if busy)
	port = 23625,
})

-- Typst preview over SSH: show the URL instead of opening Firefox on this machine.
-- On the laptop: ssh -L 23625:127.0.0.1:23625 <this machine>, then open the URL.
local function attached_over_ssh()
	if vim.env.TMUX then
		-- With several clients attached (desk + laptop), tmux picks the one with the most
		-- recent keyboard input; it is remote if its process has SSH_CONNECTION set.
		local pid = vim.trim(vim.fn.system({ "tmux", "display-message", "-p", "#{client_pid}" }))
		local f = vim.v.shell_error == 0 and io.open("/proc/" .. pid .. "/environ", "rb")
		if not f then
			return false
		end
		local env = f:read("*a")
		f:close()
		return ("\0" .. env):find("\0SSH_CONNECTION=", 1, true) ~= nil
	end
	return vim.env.SSH_CONNECTION ~= nil
end

-- The desk's X display, looked up on each use: Neovim's own $DISPLAY goes stale when it
-- was started in a pane created over `ssh -X` (localhost:10.0, gone after logout).
-- Prefer a tmux client that is not over SSH; else a local ":N" display tmux or we know.
local function desk_display()
	local function env_of(pid)
		local f = io.open("/proc/" .. pid .. "/environ", "rb")
		if not f then
			return {}
		end
		local env = {}
		for k, v in f:read("*a"):gmatch("([^%z=]+)=([^%z]*)") do
			env[k] = v
		end
		f:close()
		return env
	end
	local function is_local(d)
		return d and d:match("^:") and d or nil
	end
	if vim.env.TMUX then
		for _, pid in ipairs(vim.fn.systemlist({ "tmux", "list-clients", "-F", "#{client_pid}" })) do
			local env = env_of(pid)
			if env.DISPLAY and not env.SSH_CONNECTION then
				return env.DISPLAY
			end
		end
		local session = vim.fn.system({ "tmux", "show-environment", "DISPLAY" }):match("^DISPLAY=(%S+)")
		if is_local(session) then
			return session
		end
	end
	return is_local(vim.env.DISPLAY)
end

-- Clipboard: always xclip on the desk display (desk clipboard); when attached over SSH,
-- also send yanks via OSC 52 so they reach Windows Terminal on the laptop (tmux forwards
-- it, set-clipboard on). Pasting stays on xclip: Windows Terminal doesn't answer OSC 52
-- paste requests.
local clip_cache = {}
local function xclip(args, lines)
	local display = desk_display()
	if not display then
		return nil
	end
	local opts = { env = { DISPLAY = display } }
	if lines then
		-- Copy: xclip forks a child that keeps owning the selection, so don't hold its output
		opts.stdin, opts.stdout, opts.stderr = table.concat(lines, "\n"), false, false
	end
	local out = vim.system(vim.list_extend({ "xclip" }, args), opts):wait(2000)
	return out.code == 0 and (out.stdout or "") or nil
end
local function clip_copy(reg)
	local sel = reg == "+" and "clipboard" or "primary"
	return function(lines, regtype)
		clip_cache[reg] = { lines, regtype }
		xclip({ "-i", "-selection", sel }, lines)
		if attached_over_ssh() then
			require("vim.ui.clipboard.osc52").copy(reg)(lines)
		end
	end
end
local function clip_paste(reg)
	local sel = reg == "+" and "clipboard" or "primary"
	return function()
		local out = xclip({ "-o", "-selection", sel })
		if not out then
			-- No desk display (plain SSH without tmux): fall back to our own last yank
			return clip_cache[reg] or {}
		end
		-- Split ourselves (not systemlist) so a trailing "" survives: linewise yanks arrive as
		-- { "line", "" } and Neovim compares against that to restore the register type.
		return vim.split(out, "\n", { plain = true })
	end
end
-- Only on a Linux desktop with xclip. Elsewhere Neovim's own detection is right:
-- WSL -> WSLg/win32yank/clip.exe, HPC in tmux -> tmux (reaches the laptop via OSC 52).
if vim.fn.executable("xclip") == 1 and vim.env.DISPLAY and vim.fn.has("wsl") == 0 then
	vim.g.clipboard = {
		name = "xclip+osc52",
		copy = { ["+"] = clip_copy("+"), ["*"] = clip_copy("*") },
		paste = { ["+"] = clip_paste("+"), ["*"] = clip_paste("*") },
	}
end

local preview_utils = require("typst-preview.utils")
local open_local = preview_utils.visit
preview_utils.visit = function(link)
	if attached_over_ssh() then
		vim.notify("Typst preview: open http://" .. link:gsub("127%.0%.0%.1", "localhost") .. " on the laptop")
	else
		open_local(link)
	end
end

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
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
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
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})

-- Light/dark is shared with tmux through ~/.local/state/theme, written by the `theme`
-- script (~/.local/bin/theme). Without the file, Neovim keeps guessing from the terminal.
local theme_file = io.open(vim.env.HOME .. "/.local/state/theme")
if theme_file then
	local theme = vim.trim(theme_file:read("*a"))
	theme_file:close()
	if theme == "light" or theme == "dark" then
		vim.o.background = theme
		-- Stop a late terminal colour reply from overriding the choice
		for _, au in ipairs(vim.api.nvim_get_autocmds({ event = "TermResponse" })) do
			if au.desc and au.desc:find("'background' automatically", 1, true) then
				vim.api.nvim_del_autocmd(au.id)
			end
		end
	end
end
vim.cmd("colorscheme catppuccin")
vim.keymap.set("n", "<leader>tt", function()
	vim.system({ vim.env.HOME .. "/.local/bin/theme", "toggle" })
end, { desc = "Toggle light/dark (Neovim + tmux)" })

vim.lsp.config("harper_ls", {
	settings = {
		["harper-ls"] = {
			dialect = "British",
			-- userDictPath = "~/dict.txt"
		},
	},
})
-- Grammar/spelling for LaTeX (ltex-ls-plus via Mason, auto-enabled). Typst and Markdown
-- are left to harper_ls, so a word isn't flagged twice.
-- LTeX's "Add to dictionary", "Hide false positive" and "Disable rule" actions are
-- client-side commands, handled here and saved in ltex.json. Words in harper's user
-- dictionary are accepted too.
local harper_dict = vim.fn.expand("~/.config/harper-ls/dictionary.txt")
local ltex_file = vim.fn.stdpath("data") .. "/ltex.json"
local function ltex_saved()
	local ok, saved = pcall(function()
		return vim.json.decode(table.concat(vim.fn.readfile(ltex_file), "\n"))
	end)
	return ok and type(saved) == "table" and saved or {}
end
local function ltex_settings()
	local saved = ltex_saved()
	local dictionary = vim.deepcopy(saved.dictionary or {})
	local harper_words = vim.fn.filereadable(harper_dict) == 1 and vim.fn.readfile(harper_dict) or {}
	for _, lang in ipairs({ "en-GB", "en-US" }) do
		dictionary[lang] = vim.list_extend(dictionary[lang] or {}, harper_words)
	end
	return {
		ltex = {
			language = "en-GB",
			dictionary = dictionary,
			disabledRules = saved.disabledRules or vim.empty_dict(),
			hiddenFalsePositives = saved.hiddenFalsePositives or vim.empty_dict(),
		},
	}
end
-- Command arguments look like { uri = ..., <key> = { [lang] = { items } } }
local function ltex_command(field, key)
	return function(command, ctx)
		local saved = ltex_saved()
		saved[field] = saved[field] or {}
		for lang, items in pairs(command.arguments[1][key]) do
			saved[field][lang] = saved[field][lang] or {}
			for _, item in ipairs(items) do
				if not vim.list_contains(saved[field][lang], item) then
					table.insert(saved[field][lang], item)
				end
			end
		end
		vim.fn.writefile({ vim.json.encode(saved) }, ltex_file)
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		if client then
			client.settings = ltex_settings()
			client:notify("workspace/didChangeConfiguration", { settings = client.settings })
		end
	end
end
vim.lsp.config("ltex_plus", {
	filetypes = { "tex", "plaintex", "bib" },
	settings = { ltex = { language = "en-GB" } },
	-- Read the saved words when the server starts. Update the table in place:
	-- the client already holds a reference to it.
	before_init = function(_, config)
		config.settings.ltex = ltex_settings().ltex
	end,
	commands = {
		["_ltex.addToDictionary"] = ltex_command("dictionary", "words"),
		["_ltex.hideFalsePositives"] = ltex_command("hiddenFalsePositives", "falsePositives"),
		["_ltex.disableRules"] = ltex_command("disabledRules", "ruleIds"),
	},
})
vim.lsp.enable({ "tinymist", "lua_ls" })

-- Fortran: fortls (enabled by mason-lspconfig) for completion, hover, go-to and
-- diagnostics; fortitude's server for lint warnings. Rules: fortitude.toml / fpm.toml.
vim.lsp.config("fortitude", {
	cmd = { "fortitude", "server" },
	filetypes = { "fortran" },
	root_markers = { "fortitude.toml", ".fortitude.toml", "fpm.toml", ".git" },
})
vim.lsp.enable("fortitude")
-- lspconfig's defaults minus --notify_init (an "initialization complete" message per file)
vim.lsp.config("fortls", {
	cmd = { "fortls", "--hover_signature", "--hover_language=fortran", "--use_signature_help" },
})

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

vim.lsp.config("tinymist", {
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>tpm", function()
			client:exec_cmd({
				title = "pin",
				command = "tinymist.pinMain",
				arguments = { vim.api.nvim_buf_get_name(0) },
			}, { bufnr = bufnr })
		end, { buffer = bufnr, desc = "[T]inymist [P]in", noremap = true })

		vim.keymap.set("n", "<leader>tum", function()
			client:exec_cmd({
				title = "unpin",
				command = "tinymist.pinMain",
				arguments = { vim.v.null },
			}, { bufnr = bufnr })
		end, { buffer = bufnr, desc = "[T]inymist [U]npin", noremap = true })
	end,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		typst = { "typstyle_wrap" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		fortran = { "fprettify", "findent", stop_after_first = true },
	},
})
-- Projects with a .clang-format file use it; otherwise LLVM style with 4-space indents
require("conform").formatters["clang-format"] = {
	prepend_args = function(_, ctx)
		local found = vim.fs.find({ ".clang-format", "_clang-format" }, { upward = true, path = ctx.dirname })
		return #found == 0 and { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" } or {}
	end,
}
-- Fortran: fprettify for free form (.f90 etc.), findent (indentation only) for fixed
-- form (.f, .for). fprettify reads .fprettify.rc from the project or ~; without one,
-- indent by 2 like FluTAS. Existing code bases often differ, so format a visual
-- selection (<leader>fm) to touch only new code.
require("conform").formatters.fprettify = {
	condition = function(_, ctx)
		return not (ctx.filename:lower():match("%.f$") or ctx.filename:lower():match("%.for$"))
	end,
	prepend_args = function(_, ctx)
		local found = vim.fs.find(".fprettify.rc", { upward = true, path = ctx.dirname })
		return #found == 0 and { "--indent", "2" } or {}
	end,
}
-- typstyle --wrap-text splits short inline calls such as #qty(22, "deg C") over several
-- lines (typstyle issue #324, still in 0.15). While it wraps, each short one-line call
-- is swapped for a placeholder word of the same length, then put back.
require("conform").formatters.typstyle_wrap = {
	format = function(_, _, lines, callback)
		local calls = {}
		-- Only calls inside running text: a call at the start of a line is left alone,
		-- as a placeholder there would let typstyle join it onto the line above.
		local src = table.concat(lines, "\n") .. "\n"
		local text = src:gsub("()(#[%a_][%w_%-%.]*%b())", function(pos, call)
			local id = ("TSPH%dQ"):format(#calls + 1)
			local line_start = not src:sub(math.max(1, pos - 200), pos - 1):match("[^\n]*$"):find("%S")
			if line_start or call:find("\n") or #call > 60 or #id > #call then
				return nil
			end
			table.insert(calls, call)
			return id .. ("q"):rep(#call - #id)
		end)
		vim.system({ "typstyle", "--wrap-text" }, { stdin = text, text = true }, function(out)
			vim.schedule(function()
				if out.code ~= 0 then
					return callback(out.stderr ~= "" and out.stderr or "typstyle failed")
				end
				local result = out.stdout
				for i, call in ipairs(calls) do
					local id = ("TSPH%dQ"):format(i)
					result = result:gsub(vim.pesc(id .. ("q"):rep(#call - #id)), function()
						return call
					end, 1)
				end
				local new = vim.split(result, "\n", { plain = true })
				if new[#new] == "" then
					table.remove(new)
				end
				callback(nil, new)
			end)
		end)
	end,
}

vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Go to definition
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code action
vim.keymap.set({ "n", "x" }, "<leader>fm", require("conform").format, { desc = "Format (selection in visual mode)" })

-- C/C++: clangd (Mason) needs compile_commands.json for real projects:
-- `bear -- make`, `bear -- wmake` (OpenFOAM) or cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "clangd" then
			vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<CR>",
				{ buffer = args.buf, desc = "Switch source/header" })
		end
	end,
})

-- Debugging with gdb through the built-in Termdebug: <leader>bt, or `:TermdebugCommand ./program args`.
-- Build with -g -O0 (OpenFOAM: WM_COMPILE_OPTION=Debug). The <leader>b keys below exist
-- only during a session; K shows the value under the cursor, + and - move up/down the stack.
vim.cmd("packadd! termdebug") -- "!": loaded with the other plugins, not twice
vim.g.termdebug_config = { variables_window = 1, variables_window_height = 12 }
vim.keymap.set("n", "<leader>bt", function()
	-- "./main input.txt -v": everything after the program goes to it as arguments
	vim.ui.input({ prompt = "Debug program [args]: ", completion = "file" }, function(cmd)
		if cmd and cmd ~= "" then
			vim.cmd("TermdebugCommand " .. cmd)
		end
	end)
end, { desc = "Debug: start gdb (Termdebug)" })
local debug_keys = {
	{ "<leader>bb", function()
		local placed = vim.fn.sign_getplaced(vim.api.nvim_get_current_buf(),
			{ group = "TermDebug", lnum = vim.fn.line(".") })[1].signs
		for _, sign in ipairs(placed) do
			if sign.name:match("^debugBreakpoint") then
				return vim.cmd("Clear")
			end
		end
		vim.cmd("Break")
	end, "Toggle breakpoint" },
	{ "<leader>br", "<cmd>Run<CR>", "Run" },
	{ "<leader>bc", "<cmd>Continue<CR>", "Continue" },
	{ "<leader>bn", "<cmd>Over<CR>", "Next line (step over)" },
	{ "<leader>bs", "<cmd>Step<CR>", "Step into" },
	{ "<leader>bf", "<cmd>Finish<CR>", "Finish function (step out)" },
	{ "<leader>bu", "<cmd>Until<CR>", "Run until cursor line" },
	{ "<leader>bx", "<cmd>Stop<CR>", "Interrupt program" },
	{ "<leader>bg", "<cmd>Gdb<CR>", "Go to gdb window" },
}
vim.api.nvim_create_autocmd("User", {
	pattern = "TermdebugStartPost",
	callback = function()
		for _, k in ipairs(debug_keys) do
			vim.keymap.set("n", k[1], k[2], { desc = "Debug: " .. k[3] })
		end
	end,
})
vim.api.nvim_create_autocmd("User", {
	pattern = "TermdebugStopPost",
	callback = function()
		for _, k in ipairs(debug_keys) do
			pcall(vim.keymap.del, "n", k[1])
		end
	end,
})

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
		vim.hl.on_yank()
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


-- NOTE CREATION (new notes get the note template)
vim.api.nvim_create_user_command("Note", function(opts)
	local name = opts.args
	if name == "" then
		vim.notify("Please provide a note name", vim.log.levels.ERROR)
		return
	end
	local filename = vim.fn.expand("~/notes/") .. name .. ".typ"
	local is_new = vim.fn.filereadable(filename) == 0
	if is_new then
		vim.fn.mkdir(vim.fn.fnamemodify(filename, ":h"), "p")
		vim.fn.writefile({
			'#import "@preview/cetz:0.4.1"',
			'#import "@preview/unify:0.7.1": num,qty,numrange,qtyrange',
			'#import "@preview/physica:0.9.5": *',
			'#import "/templates/note.typ": note',
			"",
			"#show: note.with(",
			'  title: "' .. vim.fn.fnamemodify(name, ":t") .. '",',
			"  abstract: [],",
			")",
			"",
			"",
		}, filename)
	end
	vim.cmd("edit " .. vim.fn.fnameescape(filename))
	if is_new then
		vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
	end
end, {
	nargs = "?",
	complete = function(_, _, _)
		local root = vim.fn.expand("~/notes/")
		local files = vim.fn.globpath(root, "**/*.typ", false, true)
		local names = {}
		for _, f in ipairs(files) do
			local rel = f:sub(#root + 1):gsub("%.typ$", "") -- e.g. "weekly/2025-W35"
			if not rel:match("^templates/") then
				table.insert(names, rel)
			end
		end
		return names
	end,
})

-- NOTE SYNC (save, commit, then pull --rebase and push)
vim.api.nvim_create_user_command("NoteSync", function()
	local repo = vim.fn.expand("~/notes")

	local function run(args)
		local result = vim.fn.system(vim.list_extend({ "git", "-C", repo }, args))
		if vim.v.shell_error ~= 0 then
			vim.notify("Error running: git " .. table.concat(args, " ") .. "\n" .. result, vim.log.levels.ERROR)
			return false
		end
		return true
	end

	-- Write modified buffers that live in the notes repo
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local path = vim.api.nvim_buf_get_name(buf)
		if vim.bo[buf].modified and path:sub(1, #repo + 1) == repo .. "/" then
			vim.api.nvim_buf_call(buf, function()
				vim.cmd("silent write")
			end)
		end
	end

	if not run({ "add", "-A" }) then
		return
	end
	-- Only commit when something is staged
	vim.fn.system({ "git", "-C", repo, "diff", "--cached", "--quiet" })
	if vim.v.shell_error ~= 0 then
		local msg = "Auto-sync: " .. os.date("%Y-%m-%d %H:%M:%S")
		if not run({ "commit", "-m", msg, "--quiet" }) then
			return
		end
	end
	if not run({ "pull", "--rebase", "--quiet" }) then
		return
	end
	if not run({ "push", "--quiet" }) then
		return
	end

	print("Notes synced ✅")
end, {})

-- NOTE IMAGE SHRINK (keeps the notes repo small; images are stored in git forever)
-- PNG: downscale if wider/taller than 2500px, then pngquant (~60% smaller on plots/screenshots)
-- SVG over 1 MB (e.g. matplotlib plots with huge meshes): render to PNG with Inkscape
-- Other formats are left as they are. Returns the (possibly new) path.
local function shrink_image(path)
	local ext = path:match("%.(%w+)$")
	ext = ext and ext:lower() or ""

	if ext == "svg" and vim.fn.getfsize(path) > 1024 * 1024 and vim.fn.executable("inkscape") == 1 then
		local png = path:gsub("%.%w+$", ".png")
		print("Converting large SVG to PNG...")
		local res = vim.system({
			"inkscape", path,
			"--export-type=png", "--export-dpi=200", "--export-background=white",
			"--export-filename=" .. png,
		}):wait()
		if res.code == 0 and vim.fn.filereadable(png) == 1 then
			os.remove(path)
			path, ext = png, "png"
		end
	end

	if ext == "png" then
		local dims = vim.system({ "identify", "-format", "%w %h", path }):wait().stdout or ""
		local w, h = dims:match("(%d+) (%d+)")
		if w and math.max(tonumber(w), tonumber(h)) > 2500 then
			vim.system({ "convert", path, "-resize", "2500x2500>", path }):wait()
		end
		if vim.fn.executable("pngquant") == 1 then
			vim.system({ "pngquant", "--force", "--skip-if-larger", "--strip", "--quality=70-95", "--ext", ".png", path }):wait()
		end
	end

	return path
end

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

					-- old name, without file ending
					local old_image_file_name = abs_path:match("^.+/(.+)%.%w+$") or "image"

					local ext = abs_path:match("^.+(%..+)$") or ""
					local new_name = string.format("%s_%s%s", old_image_file_name, os.date("%H%M%S"), ext)
					local new_path = subdir .. "/" .. new_name

					vim.fn.system({ "cp", abs_path, new_path })
					new_path = shrink_image(new_path)

					local rel_path = "/images/" .. date .. "/" .. vim.fn.fnamemodify(new_path, ":t")
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

-- NOTE PASTE IMAGE (clipboard image -> ~/notes/images/<date>/, inserts a figure)
vim.api.nvim_create_user_command("NotePaste", function(opts)
	local paste_cmd
	if vim.fn.executable("wl-paste") == 1 and os.getenv("WAYLAND_DISPLAY") then
		paste_cmd = { "wl-paste", "--type", "image/png" }
	elseif vim.fn.executable("xclip") == 1 then
		local targets = vim.fn.system({ "xclip", "-selection", "clipboard", "-t", "TARGETS", "-o" })
		if not targets:match("image/png") then
			vim.notify("No image in clipboard", vim.log.levels.ERROR)
			return
		end
		paste_cmd = { "xclip", "-selection", "clipboard", "-t", "image/png", "-o" }
	else
		vim.notify("Need xclip (X11) or wl-paste (Wayland)", vim.log.levels.ERROR)
		return
	end

	local name = opts.args ~= "" and opts.args or vim.fn.input("Image name: ", "screenshot")
	name = name:gsub("[^%w%-_]", "_")
	if name == "" then
		name = "screenshot"
	end

	local date = os.date("%Y%m%d")
	local dir = vim.fn.expand("~/notes/images/") .. date
	vim.fn.mkdir(dir, "p")
	-- File is named like the figure label; add -2, -3, ... if the name is taken that day
	local file = name .. ".png"
	local n = 1
	while vim.fn.filereadable(dir .. "/" .. file) == 1 do
		n = n + 1
		file = string.format("%s-%d.png", name, n)
	end
	local path = dir .. "/" .. file

	local data = vim.system(paste_cmd):wait()
	if data.code ~= 0 or data.stdout == "" then
		vim.notify("Could not read image from clipboard", vim.log.levels.ERROR)
		return
	end
	local f = assert(io.open(path, "wb"))
	f:write(data.stdout)
	f:close()

	shrink_image(path)

	local body = table.concat({
		"#figure(",
		'  image("/images/' .. date .. "/" .. file .. '", width: ${1:80%}),',
		"  caption: [${2}],",
		") <fig:${3:" .. file:gsub("%.png$", "") .. "}>",
		"$0",
	}, "\n")
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
	vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
	require("luasnip").lsp_expand(body)
end, { nargs = "?" })

-- NOTE WEEKLY
vim.api.nvim_create_user_command("NoteWeekly", function()
	local notes_dir = vim.fn.expand("~/notes")
	local weekly_dir = notes_dir .. "/weekly"
	vim.fn.mkdir(weekly_dir, "p")

	-- get current ISO week number + year
	local week = os.date("%G-W%V") -- e.g. 2025-W35

	-- get monday of this week (ISO)
	local now = os.time()
	local weekday = tonumber(os.date("%u", now)) -- 1=Mon..7=Sun
	local monday = now - (weekday - 1) * 24 * 3600
	local sunday = monday + 6 * 24 * 3600

	local start_str = os.date("%d.%m.%Y", monday)
	local end_str = os.date("%d.%m.%Y", sunday)

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

-- KEYMAPS
vim.keymap.set("n", "<leader>nn", ":Note ", { desc = "New note" })
vim.keymap.set("n", "<leader>ns", ":NoteSync<CR>", { desc = "Sync notes" })
vim.keymap.set("n", "<leader>ni", ":NoteImg<CR>", { desc = "Fix note images" })
vim.keymap.set("n", "<leader>np", ":NotePaste<CR>", { desc = "Paste clipboard image into note" })
vim.keymap.set("n", "<leader>nw", ":NoteWeekly<CR>", { desc = "Weekly note" })

-- NOTE SEARCH (fzf-lua: type to filter, <CR> opens the top match)
require("fzf-lua").setup({})
vim.keymap.set("n", "<leader>nf", function()
	require("fzf-lua").files({ cwd = "~/notes", cmd = "rg --files --glob '*.typ'" })
end, { desc = "Find note" })
vim.keymap.set("n", "<leader>ng", function()
	require("fzf-lua").live_grep({ cwd = "~/notes" })
end, { desc = "Grep in notes" })
vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { desc = "Typst preview" })

-- Compile the current Typst file to a PDF next to it (~/notes ignores *.pdf in git).
-- The git root is the project root, so imports like "/templates/note.typ" resolve.
vim.api.nvim_create_user_command("TypstPdf", function()
	local file = vim.api.nvim_buf_get_name(0)
	if vim.bo.filetype ~= "typst" or file == "" then
		return vim.notify("TypstPdf: not a Typst file", vim.log.levels.WARN)
	end
	vim.cmd("silent update")
	local root = vim.fs.root(file, ".git") or vim.fs.dirname(file)
	local pdf = file:gsub("%.typ$", "") .. ".pdf"
	vim.system({ "typst", "compile", "--root", root, file, pdf }, { text = true }, function(out)
		vim.schedule(function()
			if out.code == 0 then
				vim.notify("Typst: wrote " .. vim.fn.fnamemodify(pdf, ":~:."))
			else
				vim.notify("Typst compile failed:\n" .. out.stderr, vim.log.levels.ERROR)
			end
		end)
	end)
end, { desc = "Compile current Typst file to PDF" })
vim.keymap.set("n", "<leader>tc", "<cmd>TypstPdf<CR>", { desc = "Typst compile to PDF" })
vim.keymap.set("n", "<leader>cp", ":Copilot attach<CR>", { desc = "Copilot attach" })

-- Reload LuaSnip:
vim.keymap.set(
	"n",
	"<leader>sl",
	":lua require('luasnip.loaders.from_snipmate').load({ paths = {'~/.config/nvim/snippets/'} })<CR>",
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
				gs.nav_hunk("next")
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.nav_hunk("prev")
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
		map("n", "<leader>hu", gs.stage_hunk, { desc = "Unstage hunk (stage_hunk on a staged hunk)" })
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
		map("n", "<leader>htd", gs.preview_hunk_inline, { desc = "Preview hunk inline (shows deleted lines)" })

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
