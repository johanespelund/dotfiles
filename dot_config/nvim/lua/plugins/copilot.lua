return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
      },
    })
   vim.keymap.set('n', '<leader>cp', require("copilot.suggestion").toggle_auto_trigger, {desc = "Toggle Copilot auto trigger"})
  end,
}
