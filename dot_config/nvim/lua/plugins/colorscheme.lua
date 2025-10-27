return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    -- config = function()
    -- 	vim.o.background = "dark"
    -- 	vim.cmd.colorscheme("gruvbox")
    -- end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
    	vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
}
