return {
	"lervag/vimtex",
	init = function()
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
		vim.g.vimtex_view_method = "zathura"
		-- vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
	end,
}
