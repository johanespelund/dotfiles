return {
  'tpope/vim-commentary',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
    vim.api.nvim_exec([[autocmd FileType foam setlocal commentstring=//\ %s]], false)
  end,
}
