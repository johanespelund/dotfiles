return {
 "christoomey/vim-tmux-navigator",
  conifg = function()
    vim.keymap("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", { noremap = true })
    vim.keymap("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", { noremap = true })
    vim.keymap("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", { noremap = true })
    vim.keymap("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", { noremap = true })
  end,
}
