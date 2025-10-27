return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
    })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find file" })
    vim.keymap.set("n", "<leader>fgp", "<cmd>Telescope live_grep<CR>", { desc = "Live grep project" })
    vim.keymap.set("n", "<leader>fgb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Live grep current buffer" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
  end,
}
